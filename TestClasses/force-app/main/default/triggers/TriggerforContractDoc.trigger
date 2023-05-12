trigger TriggerforContractDoc on Contract__c (before insert) {
if(Trigger.isBefore && Trigger.isInsert){
        if(Trigger.New != null){
            List<Contract__c> contractList = new List<Contract__c>();
            contractList = [select id,Opportunity__c from Contract__c where Opportunity__c =: Trigger.New[0].Opportunity__c limit 1];
            for(Contract__c doc : Trigger.New) {
                if(contractList != null && !contractList.isEmpty()){
                    doc.addError('You Can not create Record');
                }
                else{
                    
                }
            }
        }
    }
}