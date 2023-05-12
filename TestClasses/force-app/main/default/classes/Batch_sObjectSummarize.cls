global class Batch_sObjectSummarize implements Database.Batchable<sObject>, Database.Stateful{

	global String sObjectName;
	global String sObjectFieldNames;
	global String ExecutionType;
	global final String Query;
	global Integer Count;
	global List<sObjectField__c> sObjectFields;
	global Map<sObjectField__c,Integer> MapCounts;
	global Map<Id,sObjectField__c> UPDATE_SOBJECTFIELDS;
  
	global Batch_sObjectSummarize(String s){
		sObjectName = s;		
		sObjectFields = new List<sObjectField__c>();
		sObjectFields = [SELECT Id, name__c, recordsPopulated__c FROM sObjectField__c WHERE sObject__r.name__c = :sObjectName];
		Integer ListCount = 0;
		for(sObjectField__c SOF : sObjectFields){
			if(ListCount == 0){
				sObjectFieldNames = '' + SOF.name__c;
				ListCount++;
			}else if(ListCount < sObjectFields.size()){
				sObjectFieldNames = sObjectFieldNames + ',' + SOF.name__c;
				ListCount++;
			}else if(ListCount == sObjectFields.size()){
				sObjectFieldNames = sObjectFieldNames + SOF.name__c;
				ListCount++;
			}
		}
		Query = 'SELECT ' + sObjectFieldNames + ' FROM ' + sObjectName;
		Count = 0;
		MapCounts = new Map<sObjectField__c,Integer>();
		UPDATE_SOBJECTFIELDS = new Map<Id,sObjectField__c>();
	}

	global Database.QueryLocator start(Database.BatchableContext BC){
		return Database.getQueryLocator(Query);
	}
   
	global void execute(Database.BatchableContext BC,List<sObject> scope){
		for(sObject s : scope){
			for(sObjectField__c SOF : sObjectFields){
				if(s.get(SOF.name__c) != null && SOF.name__c != 'recordPopulated__c'){					
					if(MapCounts.get(SOF) != null){
						Integer CurrentCount = MapCounts.get(SOF) + 1;
						MapCounts.put(SOF,CurrentCount);
					}else{
						MapCounts.put(SOF,1);						
					}
				}
			}
		}		
	}

	global void finish(Database.BatchableContext BC){
		for(sObjectField__c SOF : MapCounts.keySet()){
			UPDATE_SOBJECTFIELDS.put(SOF.Id,SOF);
			UPDATE_SOBJECTFIELDS.get(SOF.Id).recordsPopulated__c = MapCounts.get(SOF);
		}
		update UPDATE_SOBJECTFIELDS.values();
		
		String[] toaddress = new String[]{};
		toaddress.add('randy.buhrt@ftr.com');
		Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
		mail.setToAddresses(toaddress);
		mail.setsubject('Batch_sObjectSummarize for ' + sObjectName + 'completed');
		mail.setPlainTextBody(
			//'UPDATE_SOBJECTFIELDS is ' + UPDATE_SOBJECTFIELDS + '\n\n' +
			'Query is ' + Query
		);
		Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
	}
}