global class Iterable_sObjectCollection implements Iterator<WS_SFDC_Datatypes.sObjectCollection>{
	List<WS_SFDC_Datatypes.sObjectCollection> sObjectCollections {get;set;} 
	Integer i {get;set;}
	
	public Iterable_sObjectCollection(){ 
		sObjectCollections = new List<WS_SFDC_Datatypes.sObjectCollection>();
		
		List<sObject__c> sObjects = new List<sObject__c>();
		sObjects = [SELECT Id, name__c FROM sObject__c];
		
		List<sObjectField__c> sObjectFields = new List<sObjectField__c>();
		sObjectFields = [SELECT Id, name__c, sObject__c FROM sObjectField__c];
		
		if(sObjects.size() > 0){
			for(sObject__c SO : sObjects){
				WS_SFDC_Datatypes.sObjectCollection SOC = new WS_SFDC_Datatypes.sObjectCollection();
				SOC.sObjectRecord = SO;
				SOC.sObjectFields = new Map<String,sObjectField__c>();
				for(sObjectField__c SOF : sObjectFields){
					if(SOF.sObject__c == SO.Id){
						SOC.sObjectFields.put(SOF.name__c,SOF);
					}
				}
			}
		}
		i = 0;		
	}
	
	global boolean hasNext(){ 
		if(i >= sObjectCollections.size()) {
		//if(i >= 1) {
			return false; 
		}else{
			return true; 
		}
	}    

	global WS_SFDC_Datatypes.sObjectCollection next(){  
		i++; 
		return sObjectCollections[i-1]; 
	}
	 
}