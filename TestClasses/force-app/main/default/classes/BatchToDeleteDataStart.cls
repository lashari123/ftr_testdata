global class BatchToDeleteDataStart implements Database.Batchable<SObject>{

    global Database.QueryLocator start (Database.BatchableContext BC){

        return Database.getQueryLocator('select id, name from AccountIDUnique__c WHERE LastModifiedDate > 2013-11-29T01:00:00.000Z ');
    }

    global void execute(Database.BatchableContext BC,List<sObject> scope){  
        //try{        
        system.debug('***Start Method is called delete : '  + StatusOfDeleteBatch.isBatchComplete);
        //StatusOfDeleteBatch.isBatchComplete = true;
        system.debug('***Start Method is called delete 1: '  + StatusOfDeleteBatch.isBatchComplete);
       
       //Insert data into DB
       List<AccountIDUnique1__c> lstAccountIDInsert = new List<AccountIDUnique1__c>();
       List<AccountIDUnique__c> lstU = scope;
       for(AccountIDUnique__c objAcc:lstU ){
           AccountIDUnique1__c objAId = new AccountIDUnique1__c();
           objAId.Name=objAcc.name;
           lstAccountIDInsert.add(objAId);
       }
       
       if(lstAccountIDInsert.size()>0)
           insert lstAccountIDInsert;
       
       system.debug('*** before Do condition ' + StatusOfDeleteBatch.isBatchComplete);
       
       //do{
       //}while( StatusOfDeleteBatch.isBatchComplete==false);
       
       system.debug('***after do condtion ' + StatusOfDeleteBatch.isBatchComplete);
       
        
        
       // StatusOfDeleteBatch.isBatchComplete = false;  
        system.debug('***Final Method is Called delete 1 ' + StatusOfDeleteBatch.isBatchComplete);
        
        //List<AccountIDUnique1__c> lstDelete = [select id, name from AccountIDUnique1__c];
        //if(lstDelete.size()>0)
        //delete lstDelete;
        
        //}catch(Exception ae){}
    }       
    global void finish(Database.BatchableContext BC){
        system.debug('***Final Method is Called in Delte'); 
        /*List<AccountIDUnique__c> lstDelete = [select id, name from AccountIDUnique__c WHERE CreatedDate <= YESTERDAY];
        if(lstDelete.size()>0)
        delete lstDelete;
        
        List<AccountIDUnique1__c> lstDelete1 = [select id, name from AccountIDUnique1__c];
        if(lstDelete1.size()>0)
        delete lstDelete1;*/
        
        /*AccountIDUnique__c[] my=[select Id from AccountIDUnique__c];
        delete my;
        
       AccountIDUnique1__c[] my1=[select Id from AccountIDUnique1__c];
        delete my1;*/
        
        //Delete the Data from AccountIDUnique__c object
    } 
}