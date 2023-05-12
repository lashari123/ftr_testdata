global class BatchToDeleteData implements Database.Batchable<SObject>{

    global Database.QueryLocator start (Database.BatchableContext BC){
        system.debug('***Start Method is called : '  + StatusOfDeleteBatch.isBatchComplete);
        
   //     StatusOfDeleteBatch.isBatchComplete = true;
        
        //return Database.getQueryLocator('select id, name from AccountIDUnique__c');
        return Database.getQueryLocator('select id, name from AccountIDUnique1__c');
	}

    global void execute(Database.BatchableContext BC,List<sObject> scope){  
    	try{        
	        system.debug('***Execute method is called :');
	        //List<AccountIDUnique__c> lstU = scope;
	        List<AccountIDUnique1__c> lstU = scope;
	        
	        for(AccountIDUnique1__c s : lstU) {
	            System.debug('**** in scope s' + s.Name);
	            List<Billing_Detail_2__c> lstBilRec = [SELECT YearNumber__c,Account_Id__c, MonthNumber__c,Month__c FROM Billing_Detail_2__c WHERE Account_Id__c =:s.Name ORDER BY MonthNumber__c desc NULLS LAST];
	            if(lstBilRec.size()>0){
	                Decimal intMonth = lstBilRec[0].MonthNumber__c;
	                Decimal intYear = lstBilRec[0].YearNumber__c;
	                List<Billing_Detail_2__c> lstBilRecDel = [SELECT Account_Id__c, MonthNumber__c,Month__c FROM Billing_Detail_2__c WHERE Account_Id__c =:s.Name AND MonthNumber__c!=:intMonth ORDER BY MonthNumber__c desc NULLS LAST];
	                if(lstBilRecDel.size()>0) delete lstBilRecDel;
	            }
	            
	        }
    	}catch(Exception ae){}
    }       
    global void finish(Database.BatchableContext BC){
    	
    	//Delete the data
    	List<AccountIDUnique1__c> lstDelete = [select id, name from AccountIDUnique1__c];
    	if(lstDelete.size()>0)
    		delete lstDelete;
    	
        system.debug('***Final Method is Called 0 ' + StatusOfDeleteBatch.isBatchComplete);  
      //  StatusOfDeleteBatch.isBatchComplete = false;  
        system.debug('***Final Method is Called 1 ' + StatusOfDeleteBatch.isBatchComplete);
    } 
}