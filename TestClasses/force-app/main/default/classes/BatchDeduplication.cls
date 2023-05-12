public class BatchDeduplication implements Database.Batchable<sObject>, Database.Stateful
{
    public final String Query;//The query made in batch
    public String dedupeConfigName;//The unique name of the Deduplication criteria being ran (e.g. "Account Bill Street and State")
    public String queriedObject;//The API name of the object being queried against (e.g. Account, Products__c)
    public Id dedupeConfigId;//The id of the relevant Deduplication_Config__c record
    public String comparisonFieldsString;//The comma-separated string of fields' API names being compared against in order of primacy (e.g. "billingstreet, billingstate")
    public String nonComparisonFieldsString;//The comma-separated string of fields' API names being queried for as extras information for the duplicate records (e.g. "createddate, createdbyid")
    public List<String> comparisonValues;//The list to store the values of the comparison fields for the record being examined
    public List<String> comparisonFieldsList;//The list of fields' API names being compared against in order of primacy (e.g. ['billingstreet', 'billingstate'])
    public List<String> nonComparisonValues;//The list to store the values of the non-comparison fields for the record being examined
    public List<String> nonComparisonFieldsList;//The list of fields' API names being added to the query but not for comparison (e.g. ['createddate', 'createdbyid'])
    public Boolean ignoreNulls;//A boolean. If true, a record with all null values in the comparison fields will be ignored.
    public Boolean ignoreCase;//A boolean. If true, values that differ only by uppercase and lowercase (e.g. '123 Elm Street' and '123 elm street') will be treated as duplicates.

    //Constructor
    public BatchDeduplication(Deduplication_Config__c dedupeConfig)
    {
        Set<String> noQuoteWrapFieldTypeSet = new Set<String>{'CURRENCY', 'BOOLEAN', 'DATE', 'DATETIME', 'DOUBLE', 'INTEGER'};
    
        //Populate the member variables
        queriedObject = dedupeConfig.Object_API_Name__c;
        comparisonFieldsString = dedupeConfig.Comparison_Fields__c;
        nonComparisonFieldsString = dedupeConfig.Non_Comparison_Fields__c;
        dedupeConfigName = dedupeConfig.Name;
        dedupeConfigId = dedupeConfig.Id;
        ignoreNulls = dedupeConfig.Ignore_No_Data_Comparisons__c;
        ignoreCase = dedupeConfig.Ignore_Case__c;
        
        String testLimit = '';
        //If we're executing this code as part of a test class, limit the results to just 10 records to streamline things.
        if(Test.isRunningTest()) {
            testLimit = 'LIMIT 10';
        }
        
        String querySelect = 'SELECT Id, ' + comparisonFieldsString + ' ';
        
        //If there are non-comparison fields, add them to the query
        if(nonComparisonFieldsString != null && nonComparisonFieldsString.length() > 0) {
            querySelect += ', ' + nonComparisonFieldsString + ' ';
        }
        
        String queryFrom = ' FROM ' + queriedObject + ' ';
        String queryWhere = 'WHERE Id != NULL ';
        String queryOrderBy = ' Order By ' + comparisonFieldsString + ' ASC ';
        
        List<Deduplication_Criterion__c> queryCriteria = [SELECT id, Field_API_Name__c, Comparison_Operator__c, Comparison_Value__c, And_Or__c 
                                                            FROM Deduplication_Criterion__c 
                                                            WHERE Master_Deduplication_Config__c = :dedupeConfigId 
                                                            ORDER BY And_Or__c ASC];
                                                            
        if(queryCriteria != null && queryCriteria.size() > 0) {
            Integer orCount = 0;
            for(Deduplication_Criterion__c criterion : queryCriteria) {

                Schema.SObjectType t = Schema.getGlobalDescribe().get(queriedObject);
                Schema.DescribeSObjectResult r = t.getDescribe();
                Schema.DescribeFieldResult f = r.fields.getMap().get(criterion.Field_API_Name__c).getDescribe();
                Schema.DisplayType ft = f.getType();
                String fieldType = ft+'';
                
                Boolean wrapInQuotes = true;
                if(noQuoteWrapFieldTypeSet.contains(fieldType)) {
                    wrapInQuotes = false;
                }
            
                //Example: RecordTypeId = 
                String clause = ' ' + criterion.Field_API_Name__c + ' ' + criterion.Comparison_Operator__c + ' ';//\'' + criterion.Comparison_Value__c + '\' ';
                
                String comparisonVal = criterion.Comparison_Value__c;
                
                if(comparisonVal == NULL){
                    comparisonVal = 'NULL';
                }
                
                if(wrapInQuotes && comparisonVal != 'NULL'){
                    //Example: RecordTypeId = '012E0000000fJrHIAU'
                    clause = clause + ' \'' + criterion.Comparison_Value__c + '\' ';
                } else {
                    //Example1: AnnualRevenue > 0.0
                    //Example2: Email != NULL
                    clause = clause + ' ' + criterion.Comparison_Value__c + ' ';
                }
                
                if(criterion.And_Or__c == 'OR' && orCount == 0) {
                    orCount++;
                    
                    //Example: AND (Email = 'test@example.com'
                    clause = ' AND ( ' + clause;
                } else {
                    //Example1: AND RecordTypeId = '012E0000000fJrHIAU'
                    //Example2: AND RecordTypeId = '012E0000000fJrHIAU' AND (Email = 'test@example.com' OR Email = 'test2@example.com'
                    clause = ' ' + criterion.And_Or__c + clause;
                }
                
                queryWhere = queryWhere + clause;
            }
            
            if(orCount > 0) {
                //Example: AND RecordTypeId = '012E0000000fJrHIAU' AND (Email = 'test@example.com' OR Email = 'test2@example.com') 
                queryWhere = queryWhere + ' ) ';
            }
        }
        
        Query = querySelect + queryFrom + queryWhere + queryOrderBy + testLimit;
        //Query = 'SELECT Id, createddate, lastmodifieddate, ' + comparisonFieldsString + ' FROM ' + queriedObject + ' Order By ' + comparisonFieldsString + ' ASC ' + testLimit;
        
        comparisonValues = new List<String>();
        
        comparisonFieldsList = new List<String>();
        
        //convert the comma-separated string into an array
        for(String compField : comparisonFieldsString.split(',')) {
            //trim any leading or trailing white space from the comparison field API name
            comparisonFieldsList.add(compField.trim());
        }
        
        nonComparisonValues = new List<String>();
        
        nonComparisonFieldsList = new List<String>();
        
        //convert the comma-separated string into an array
        for(String nonCompField : nonComparisonFieldsString.split(',')) {
            //trim any leading or trailing white space from the non-comparison field API name
            nonComparisonFieldsList.add(nonCompField.trim());
        }
    }

    //Kicks off the batches of queries to process the deduplication query
    public Database.QueryLocator start(Database.BatchableContext BC) 
    {   
        return Database.getQueryLocator(Query);
    }

    //For each batch in sequence, perform the following computations
    public void execute(Database.BatchableContext BC, List<Sobject> results) 
    {
        List<DuplicateRecord__c> duplicateRecordsToInsert = new List<DuplicateRecord__c>();//the list of records we are inserting to the DuplicateRecord__c object
        List<DuplicateRecord__c> duplicateRecordsToAdd = new List<DuplicateRecord__c>();//a tentative list of records we may be adding to the duplicateRecordsToInsert list
        
        //There's an edge case where if the last two records in a batch are duplicates, they won't be handled as such unless we keep track of where we are in the batch so we
        //can give the final record special handling. Hence recordCounter.
        Integer recordCounter = 0;
        for (Sobject record : results) 
        {
            recordCounter++;
        
            DuplicateRecord__c dupeRec = new DuplicateRecord__c();//the record that might be a duplicate. We're filling in the details in case it turns out to be a duplicate.
            
            dupeRec.Master_Deduplication_Config__c = dedupeConfigId;
            dupeRec.Object_API_Name__c = queriedObject;//e.g. 'Account'
            dupeRec.Comparison_Fields__c = comparisonFieldsString;//e.g. 'billingstreet, billingstate'
            dupeRec.Non_Comparison_Fields__c = nonComparisonFieldsString;//e.g. 'createddate, createdbyid'
            dupeRec.Dedupe_Config_Name__c = dedupeConfigName;//e.g. 'Account Bill Street and State'
            dupeRec.Record_Id__c = (String) record.get('Id');//e.g. '0050L000008p6CbQAI'
            dupeRec.Unique_Composite_Key__c = dupeRec.Dedupe_Config_Name__c + '_' + dupeRec.Record_Id__c;
            
            Boolean match = true;//Does this record's comparison fields match the previous record's comparison fields?
            Boolean fieldValuesNull = true;//Are the fields being compared on this record all null?
            
            //IF this is the initial record from the batch then the comparison field values haven't been assigned yet. Assign them and then flag match as false, since a record
            //can't be a duplicate of itself.
            if(comparisonValues.size() == 0) {
                for(String compField : comparisonFieldsList) {
                    String fieldValue = (String) record.get(compField);
                    comparisonValues.add(fieldValue);
                }
                
                match = false;
            }
            
            Integer count = 0;//used to let us know which comparison field we're looking at
            for(String compField : comparisonFieldsList) {
                String fieldValue = (String) record.get(compField);//the literal value of the record's field we're looking at (e.g. "3605 Gulf Drive")
                String comparisonValue = comparisonValues[count];//the literal value of the previous record's field we're looking at (e.g. "2125 CASPER DR")
                
                //IF count is 0 then we're looking at the first comparison field and therefore it can be stored in dupeRec.Comparison_Value_1__c. If 1, then Comparison_Value_2__c
                //and so on.
                if(count == 0) {
                    dupeRec.Comparison_Value_1__c = fieldValue;
                } else if(count == 1) {
                    dupeRec.Comparison_Value_2__c = fieldValue;
                } else if(count == 2) {
                    dupeRec.Comparison_Value_3__c = fieldValue;
                } else if(count == 3) {
                    dupeRec.Comparison_Value_4__c = fieldValue;
                }
                
                //IF this field value isn't null, set the fieldValuesNull flag to false (i.e. a single non-null field value turns the flag false)
                if(fieldValue != null) {
                    fieldValuesNull = false;
                    
                    //If we're ignoring case, shift the field value to all lowercase.
                    if(ignoreCase) {
                        fieldValue = fieldValue.toLowerCase();
                    }
                }
                
                //If the comparison value is non-null and we're ignoring case, shift the comparison value to all lowercase.
                if(comparisonValue != null && ignoreCase) {
                    comparisonValue = comparisonValue.toLowerCase();
                }
                
                //IF the field value and the comparison value don't match, OR if a previous field on this record didn't match the comparison value,
                //THEN set the match flag to false and assign the new field value as the value to be compared against in the future.
                if(fieldValue != comparisonValue || !match) {
                    match = false;
                    comparisonValues[count] = fieldValue;
                }
                count++;
            }//end of for(String compField : comparisonFieldsList)
            
            count = 0;//used to let us know which non-comparison field we're looking at
            for(String nonCompField : nonComparisonFieldsList) {
                String fieldValue = record.get(nonCompField)+'';//the literal value of the record's field we're looking at (e.g. "2018-11-21T20:52:11.000Z")
                
                //IF count is 0 then we're looking at the first non-comparison field and therefore it can be stored in dupeRec.Non_Comparison_Value_1__c. 
                //If 1, then Non_Comparison_Value_2__c and so on.
                if(count == 0) {
                    dupeRec.Non_Comparison_Value_1__c = fieldValue;
                } else if(count == 1) {
                    dupeRec.Non_Comparison_Value_2__c = fieldValue;
                } else if(count == 2) {
                    dupeRec.Non_Comparison_Value_3__c = fieldValue;
                } else if(count == 3) {
                    dupeRec.Non_Comparison_Value_4__c = fieldValue;
                }
                count++;
            }//end of for(String nonCompField : nonComparisonFieldsList)
            
            //IF all the field values were null and the ignore null flag is set, we want to skip this record entirely. It's not a duplicate so assign any accumulated 
            //duplicates to duplicateRecordsToInsert and wipe duplicateRecordsToAdd.
            if(fieldValuesNull && ignoreNulls) {
                if(duplicateRecordsToAdd.size() > 1) {
                    duplicateRecordsToInsert.addAll(duplicateRecordsToAdd);
                }
                duplicateRecordsToAdd = new List<DuplicateRecord__c>();
                
            //Otherwise, IF this is the last record in the batch and it was a match to the previous record, THEN add this record to the duplicateRecordsToAdd list, add the 
            //duplicateRecordsToAdd to duplicateRecordsToInsert, and then wipe duplicateRecordsToAdd (just in case). In effect we want to judge the last record in the batch
            //specially since the primary logic of this method assumes records get added to duplicateRecordsToAdd in pass N of the loop and added to duplicateRecordsToInsert
            //on pass N+1 or later, something that won't happen for the final record of the batch.
            } else if(recordCounter == results.size() && match) {
                duplicateRecordsToAdd.add(dupeRec);
                duplicateRecordsToInsert.addAll(duplicateRecordsToAdd);
                duplicateRecordsToAdd = new List<DuplicateRecord__c>();
                
            //Otherwise, IF this record wasn't a match to the previous record, THEN add duplicateRecordsToAdd to duplicateRecordsToInsert if at least 2 were found (i.e. a single
            //record doesn't constitute a duplicate), wipe duplicateRecordsToAdd, then add this record to the newly-empty duplicateRecordsToAdd.
            } else if(!match) {
                if(duplicateRecordsToAdd.size() > 1) {
                    duplicateRecordsToInsert.addAll(duplicateRecordsToAdd);
                }
                duplicateRecordsToAdd = new List<DuplicateRecord__c>();
                duplicateRecordsToAdd.add(dupeRec);
            //Otherwise, this record MUST be a match so add it to duplicateRecordsToAdd.
            } else {
                duplicateRecordsToAdd.add(dupeRec);
            }
            
        }//end of for (Sobject record : results)

        //Using Database.Insert so that I can pass a FALSE to the second parameter, the ALLORNONE flag. This way if, say, 10 records in a batch of 200 fail to insert, the other
        //190 will insert successfully. This is as an efficient (if a touch obtuse) form of confirming uniqueness in the records of the DuplicateRecord__c table. On the object
        //DuplicateRecord__c the field Unique_Composite_Key__c is made of the Dedupe_Config_Name__c + '_' + Record_Id__c (e.g. 'Account Bill Street and State_0050L000008p6CbQAI')
        //and set as REQUIRED and UNIQUE so that a specific record for a specific Deduplication Configuration can only exist once in DuplicateRecord__c. That way if a specific
        //record was found as a duplicate yesterday and we're running the script again today, it'll be found as a duplicate again but a new DuplicateRecord__c entry won't be
        //inserted. This saves us the hassle of having to query the DuplicateRecord__c and compare against it here to make sure we're not flagging the same duplicate record multiple
        //times.
        Database.Insert(duplicateRecordsToInsert, false);
    }

    public void finish(Database.BatchableContext BC) {
        Deduplication_Config__c dedupeConfigToUpdate = [SELECT id, Last_Execution__c FROM Deduplication_Config__c WHERE id = :dedupeConfigId];
        
        dedupeConfigToUpdate.Last_Execution__c = System.Now();
        update dedupeConfigToUpdate;
    }    
}