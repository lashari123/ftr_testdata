global class DelteUniqueData implements Database.Batchable<SObject>{

    global Database.QueryLocator start (Database.BatchableContext BC){
        system.debug('***Start Method is called : ');
        return Database.getQueryLocator('SELECT id, Name FROM AccountIDUnique1__c');
	}

    global void execute(Database.BatchableContext BC,List<sObject> scope){  
    	//try{        
	        system.debug('***Execute method is called :');
	        List<AccountIDUnique1__c> lstU = scope;
	        
	        List<String> lstUniqueID = new List<STring>();
	        for(AccountIDUnique1__c objAcIdUni:lstU){
	        	lstUniqueID.add(objAcIdUni.name);
	        }
	        
	        if(lstUniqueID.size()>0){
	        	List<AccountIDUnique1__c> lstDelete1 = [select id, name from AccountIDUnique1__c where name IN:lstUniqueID];
		    	if(lstDelete1.size()>0)
		    		delete lstDelete1;	
		    	
	    		List<AccountIDUnique__c> lstDelete = [select id, name from AccountIDUnique__c where name IN:lstUniqueID ];
		    	if(lstDelete.size()>0)
		    		delete lstDelete;
	        }

    	//}catch(Exception ae){}
    }       
    global void finish(Database.BatchableContext BC){
		system.debug('***Finish Method is called : ');
    } 
}