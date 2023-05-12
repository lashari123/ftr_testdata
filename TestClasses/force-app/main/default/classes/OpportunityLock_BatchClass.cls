global without sharing class OpportunityLock_BatchClass implements Database.Batchable<sObject> {

    private static recordtype lockedRecordType = [select id from recordtype where name='Opportunity Locked' and sobjecttype='Opportunity'];
    private List<String> oppStages = new List<String>{'Closed/Won','Closed/Lost','Decision'};
        
    global OpportunityLock_BatchClass(list<String> stagesToConsider) {
        this.oppStages = stagesToConsider;
    }
    
    global Database.QueryLocator start(Database.BatchableContext BC) {
        return Database.getQueryLocator([SELECT id, recordtypeid from Opportunity WHERE (recordtypeid ='012E0000000dgAK' OR recordtypeid = '0120h000000cc54' ) AND (Opportunity_Type__c = 'new' OR Opportunity_Type__c = 'Winback') AND createddate >= 2020-06-01T00:00:00Z AND (NOT opportunity.StageName IN :oppStages) AND ( bdt_Number__c IN ('na','', 'N/A', 'a','x', 'xx')) AND Account.Has_MSA__c != true AND (Opportunity.Owner.Profile.Name IN ('Frontier Sales User')) AND Legacy_Vlocity_Product_Only__c = true AND Number_of_vlocity_Quotes__c = 0]);
    }

    global void execute(Database.BatchableContext BC, List<Opportunity> records) {
        for (Opportunity opp : records) {
            opp.RecordTypeId = lockedRecordType.Id;
        }
        try {
            Database.update(records, false);
        } catch (Exception e) {
            System.debug(e);
        }
    }

    global void finish(Database.BatchableContext BC) {
        // execute any post-processing operations like sending email
    }
}