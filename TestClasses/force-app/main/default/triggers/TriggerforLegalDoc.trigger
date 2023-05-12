trigger TriggerforLegalDoc on Legal__c (before insert) {
if(Trigger.isBefore && Trigger.isInsert){
        if(Trigger.New != null){
            List<Legal__c> Legal = new List<Legal__c>();
            Legal = [select id,Opportunity__c from Legal__c where Opportunity__c =: Trigger.New[0].Opportunity__c limit 1];
            for(Legal__c doc : Trigger.New) {
                if(Legal != null && !Legal.isEmpty()){
                    doc.addError('You Can not create Record');
                }
                else{
                    
                }
            }
        }
    }
}