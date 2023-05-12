trigger OpportunityLineItemTrigger on OpportunityLineItem (before insert, before update) {
    
    
    TriggerDispatcher.Run(new ftr_OLITriggerHandler());
    
    /*system.debug('Enter OpportunityLineItemTrigger ');
    List<Id> oppIds = new List<Id>();
    List<Id> productIds = new List<Id>();
    for (OpportunityLineItem oli : Trigger.new) {
        productIds.add(oli.Product2Id);
        oppIds.add(oli.OpportunityId);
    }
    Map<Id,Opportunity> oppMap = new Map<Id,Opportunity>([SELECT Id from Opportunity 
                       WHERE (recordtype.developername = 'Memo_Read_only' or recordtype.developername = 'Opportunity_Lightning') 
                       AND (Opportunity_Type__c = 'new' or Opportunity_type__c = 'Winback')
                       AND (StageName!= 'Closed/Won' and  StageName!= 'Closed/Lost')
                       AND (NOT Owner.UserRole.Name like 'Alternate Channel%') and (NOT Owner.UserRole.Name like '%Alt Channel%') 
                       AND (NOT Owner.Profile.Name like '%Alternate%') 
                       AND (Account.Has_MSA__c = false) AND ID IN:oppIds]);
    Map<Id,Product2> prodMap = new Map<Id,Product2>([SELECT Id, Is_LegacyVlocityProduct__c FROM Product2 WHERE ID IN :productIds]);
    if (oppMap != null) {
     	for (OpportunityLineItem oli : Trigger.new) {
            if (prodMap.get(oli.Product2Id).Is_LegacyVlocityProduct__c == true && oppMap.containsKey(oli.OpportunityId)) {
                oli.Is_LegacyVlocityProduct__c = true;
            }
        		
        }   
    }
    system.debug('Exit OpportunityLineItemTrigger ');*/
}