trigger TriggerforLOAsDoc on LOAs__c (before insert) {
if(Trigger.isBefore && Trigger.isInsert){
        if(Trigger.New != null){
            List<LOAs__c> LOAsList = new List<LOAs__c>();
            LOAsList = [select id,Opportunity__c from LOAs__c where Opportunity__c =: Trigger.New[0].Opportunity__c limit 1];
            for(LOAs__c doc : Trigger.New) {
                if(LOAsList != null && !LOAsList.isEmpty()){
                    doc.addError('You Can not create Record');
                }
                else{
                    
                }
            }
        }
    }
}