trigger OpportintiyTriggerforAttachement on Opportunity (After Insert,After Update) {
    if(Trigger.isAfter && Trigger.isInsert){
        if(Trigger.New[0].id != null){
            Opportunity opp = new Opportunity();
            opp = [Select id,Types_of_Product__c from Opportunity where id =: Trigger.New[0].id limit 1];
            Marketing_Document__c doc = new Marketing_Document__c();
            doc.Opportunity__c = opp.id;
            
            insert doc;
            
            Legal__c  legaldoc = new Legal__c();
            legaldoc.Opportunity__c =   opp.id;
            insert legaldoc;
            
            Order_Document__c orderDoc = new Order_Document__c();
            orderDoc.Opportunity__c =   opp.id;
            insert orderDoc;
            
            LOAs__c loas = new LOAs__c();
            loas.Opportunity__c =   opp.id;
            insert loas;
            
            Contract__c contract = new Contract__c();
            contract.Opportunity__c =   opp.id;
            insert contract;
        }
    }
    
     if(trigger.isAfter && trigger.isUpdate){
        set<id> ids = new set<Id>();
        set<id> ids2 = new set<Id>();
        List<Custom_Product__c> otherProdList = new List<Custom_Product__c>();
        
        List<Opportunity> oppList2 = new List<Opportunity>();
        List<Site__c> siteList2 = new List<Site__c>();
        List<OpportunityLineItem> OppItemList = new List<OpportunityLineItem>();
        system.debug('======OppItemList========'+OppItemList);
        if(trigger.new != null && !trigger.new.isEmpty()){
            if(trigger.old != null && !trigger.old.isEmpty()){
                for(Opportunity opp : trigger.new){
                    for(Opportunity o : trigger.old){
                        if(opp.id == o.id){
                            if(o.Pricebook2Id != opp.Pricebook2Id){
                                oppList2.add(opp);
                            } 
                        }
                    }
                }
            }
        }
        if(oppList2 != null && !oppList2.isEmpty()){
            for(Opportunity opp : oppList2){
                ids2.add(opp.id);
            }
        }
        if(ids2 != null && !ids2.isEmpty()){
            OppItemList = [select id,PriceBook2Id__c,OpportunityId from OpportunityLineItem where OpportunityId =: ids2];
            otherProdList = [select id,Opportunity__c from Custom_Product__c where Opportunity__c =: ids2];
            siteList2 = [select id,Opportunity__c from Site__c where Opportunity__c =: ids2];
        }
        if(OppItemList != null && !OppItemList.isEmpty()){
            
        }
        else{
            delete otherProdList;
            delete siteList2;
        }
    }
}