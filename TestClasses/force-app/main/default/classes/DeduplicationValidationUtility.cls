global class DeduplicationValidationUtility {

    WebService static String dedupConfigValidation(String dedupeConfigId) {
        Set<String> noQuoteWrapFieldTypeSet = new Set<String>{'CURRENCY', 'BOOLEAN', 'DATE', 'DATETIME', 'DOUBLE', 'INTEGER'};
        
        Deduplication_Config__c dedupeConfig = [SELECT id, Object_API_Name__c, Comparison_Fields__c, Non_Comparison_Fields__c FROM Deduplication_Config__c WHERE id = :dedupeConfigId];
    
        String querySelect = 'SELECT Id, ' + dedupeConfig.Comparison_Fields__c + ' ';
        
        //If there are non-comparison fields, add them to the query
        if(dedupeConfig.Non_Comparison_Fields__c != null) {
            querySelect += ', ' + dedupeConfig.Non_Comparison_Fields__c + ' ';
        }
        
        
        String queryFrom = ' FROM ' + dedupeConfig.Object_API_Name__c + ' ';
        String queryWhere = 'WHERE Id = NULL ';
        String queryOrderBy = ' Order By ' + dedupeConfig.Comparison_Fields__c + ' ASC ';
        String queryLimit = ' LIMIT 1';
        
        List<Deduplication_Criterion__c> queryCriteria = [SELECT id, Field_API_Name__c, Comparison_Operator__c, Comparison_Value__c, And_Or__c 
                                                            FROM Deduplication_Criterion__c 
                                                            WHERE Master_Deduplication_Config__c = :dedupeConfigId 
                                                            ORDER BY And_Or__c ASC];
                                                            
        if(queryCriteria != null && queryCriteria.size() > 0) {
            Integer orCount = 0;
            for(Deduplication_Criterion__c criterion : queryCriteria) {

                Schema.SObjectType t = Schema.getGlobalDescribe().get(dedupeConfig.Object_API_Name__c);
                Schema.DescribeSObjectResult r = t.getDescribe();
                Schema.DescribeFieldResult f = r.fields.getMap().get(criterion.Field_API_Name__c).getDescribe();
                Schema.DisplayType ft = f.getType();
                String fieldType = ft+'';
                
                Boolean wrapInQuotes = true;
                if(noQuoteWrapFieldTypeSet.contains(fieldType)) {
                    wrapInQuotes = false;
                }
            
                //Example: RecordTypeId = 
                String clause = ' ' + criterion.Field_API_Name__c + ' ' + criterion.Comparison_Operator__c + ' ';
                
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
        
        String query = querySelect + queryFrom + queryWhere + queryOrderBy + queryLimit;

        String result = 'Query validated successfully.';
        try {                    
            List<sObject> sobjList = Database.query(query);
        } catch (Exception e) {
            result = 'Something is wrong with the query. Please examine the following error and correct: '+e.getMessage();
        }
    
        return result; 
    }
}