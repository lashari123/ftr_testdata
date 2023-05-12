trigger TriggerformarketingDocument on Marketing_Document__c (before insert) {
    if(Trigger.isBefore && Trigger.isInsert){
        if(Trigger.New != null){
            List<Marketing_Document__c> market = new List<Marketing_Document__c>();
            market = [select id,Opportunity__c from Marketing_Document__c where Opportunity__c =: Trigger.New[0].Opportunity__c limit 1];
            for(Marketing_Document__c doc : Trigger.New) {
                if(market != null && !market.isEmpty()){
                    doc.addError('You Can not create Record');
                }
                else{
                    
                }
            }
        }
    }
}