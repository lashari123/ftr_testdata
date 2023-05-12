trigger TriggerforOrderDoc on Order_Document__c (before insert) {
if(Trigger.isBefore && Trigger.isInsert){
        if(Trigger.New != null){
            List<Order_Document__c> orderDocList = new List<Order_Document__c>();
            orderDocList = [select id,Opportunity__c from Order_Document__c where Opportunity__c =: Trigger.New[0].Opportunity__c limit 1];
            for(Order_Document__c doc : Trigger.New) {
                if(orderDocList != null && !orderDocList.isEmpty()){
                    doc.addError('You Can not create Record');
                }
                else{
                    
                }
            }
        }
    }
}