global class BatchToCopyUniqueIDs implements Database.Batchable<SObject>{

    global Database.QueryLocator start (Database.BatchableContext BC){

     //  return Database.getQueryLocator('select id, name,Account_Id__c from Billing_Detail_2__c WHERE LastModifiedDate > 2014-01-02T01:00:00.000Z AND LastModifiedDate < 2014-01-04T01:00:00.000Z limit 50000');
        //Date dt = System.today()-5;
        return Database.getQueryLocator('select id, name,Account_Id__c from Billing_Detail_2__c WHERE LastModifiedDate = YESTERDAY');
        
     //  return Database.getQueryLocator('select id, name,Account_Id__c from Billing_Detail_2__c WHERE  LastModifiedDate = TODAY AND HOUR_IN_DAY(LastModifiedDate) > 9');
    }

    global void execute(Database.BatchableContext BC,List<sObject> scope){  
        system.debug('***Start Method is called delete 1: ');
       
       //Insert data into DB
       List<AccountIDUnique__c> lstAccountIDInsert = new List<AccountIDUnique__c>();
       List<Billing_Detail_2__c> lstBD = scope;
       set<String> setUniqueID = new set<String>();
       for(Billing_Detail_2__c objBD:lstBD ){
           setUniqueID.add(objBD.Account_Id__c);
       }
       system.debug('***Start Method is called setUniqueID1: ' + setUniqueID);
       
       for(String strUnID:setUniqueID){
           //Check wether the record is already availale on UNique Table
          // List<AccountIDUnique__c> lstUIDTemp=[select id from AccountIDUnique__c where name=:strUnID];
      //     if(lstUIDTemp.size()==0){
               AccountIDUnique__c objAId = new AccountIDUnique__c();
               objAId.Name=strUnID;
               lstAccountIDInsert.add(objAId);
          // }
       }
        
        System.debug('*** in final method 1 ' + lstAccountIDInsert.size() + '   ' + lstAccountIDInsert);
       if(lstAccountIDInsert.size()>0){
           System.debug('*** in final method ' + lstAccountIDInsert);
           insert lstAccountIDInsert;
       }
       
    }       
    global void finish(Database.BatchableContext BC){
        
    } 
}