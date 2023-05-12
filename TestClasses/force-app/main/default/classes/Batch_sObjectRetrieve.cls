global class Batch_sObjectRetrieve implements Database.batchable<Schema.SObjectType>,Database.AllowsCallouts{ 
	global String ExecutionType;
	
	global Batch_sObjectRetrieve(String Execution_Type){
		ExecutionType = Execution_Type;
	}
	
	global Iterable<Schema.SObjectType> start(Database.batchableContext info){ 
		return new Iterator_sObject(ExecutionType); 
	} 
       
	global void execute(Database.batchableContext info, List<Schema.SObjectType> scope){		
		String SessionId = WS_SFDC.Login().access_token;
		Map<String,sObject__c> UPSERT_SOBJECTS = new Map<String,sObject__c>();
		Map<String,Map<String,sObjectField__c>> UPSERT_SOBJECTFIELDS = new Map<String,Map<String,sObjectField__c>>(); 		 		
		for(Schema.SObjectType SOT : scope){
			WS_SFDC_Datatypes.sObjectCollection sObjectCollection = WS_SFDC.sObjectCollection(SessionId,SOT.getDescribe().getName());
			if(sObjectCollection != null){				
				UPSERT_SOBJECTS.put(SOT.getDescribe().getName(),sObjectCollection.sObjectRecord);
				if(sObjectCollection.sObjectFields.size() > 0){
					UPSERT_SOBJECTFIELDS.put(SOT.getDescribe().getName(),new Map<String,sObjectField__c>());
					for(sObjectField__c sObjectField : sObjectCollection.sObjectFields.values()){
						UPSERT_SOBJECTFIELDS.get(SOT.getDescribe().getName()).put(sObjectField.name__c,sObjectField);
					}
				}
			}
		}
		upsert UPSERT_SOBJECTS.values() name__c;
		for(String sObjectName : UPSERT_SOBJECTFIELDS.keySet()){
			if(UPSERT_SOBJECTFIELDS.get(sObjectName).size() > 0){
				for(sObjectField__c sObjectField : UPSERT_SOBJECTFIELDS.get(sObjectName).values()){					
					sObjectField.sObject__c = UPSERT_SOBJECTS.get(sObjectName).Id;
					sObjectField.upsertId__c = UPSERT_SOBJECTS.get(sObjectName).Id + sObjectField.Name__c;
					//system.debug(logginglevel.info,sObjectField);
				}
				upsert UPSERT_SOBJECTFIELDS.get(sObjectName).values() upsertId__c;
			}
		}
	}
        
	global void finish(Database.batchableContext info){     
	
	} 
}