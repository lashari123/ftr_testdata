global without sharing class OpportunityLock_LineItem_BatchClass implements Database.Batchable<sObject> {
    
    private List<String> oppStages = new List<String>{'Closed/Won','Closed/Lost','Decision'};
        
    global OpportunityLock_LineItem_BatchClass(list<String> stagesToConsider) {
        this.oppStages = stagesToConsider;
    }
    
    global Database.QueryLocator start(Database.BatchableContext BC) {
        // get OppLIs that should be flagged
        return Database.getQueryLocator([SELECT id, Is_LegacyVlocityProduct__c FROM opportunitylineitem WHERE Is_LegacyVlocityProduct__c = false AND (opportunity.recordtypeid ='012E0000000dgAK' OR opportunity.recordtypeid = '0120h000000cc54') AND (Opportunity.Opportunity_Type__c = 'New' OR  Opportunity.Opportunity_Type__c = 'WinBack') AND Opportunity.createddate > 2020-06-01T00:00:00Z AND (NOT opportunity.StageName IN :oppStages) AND (Opportunity.Owner.Profile.Name IN ('Frontier Sales User')) AND Product2.Is_LegacyVlocityProduct__c = true]);
    }

    global void execute(Database.BatchableContext BC, List<OpportunityLineItem> records) {
        // flag the line items
        for (OpportunityLineItem oli : records) {
            oli.Is_LegacyVlocityProduct__c = true;
        }
        try {
            Database.update(records, false);
        } catch (Exception e) {
            System.debug(e);
        }
    }

    global void finish(Database.BatchableContext BC) {
        // execute next batch operation on Opportunity
        Database.executeBatch(new OpportunityLock_BatchClass(oppStages), 20);
    }
}