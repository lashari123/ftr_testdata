@isTest(seealldata=true)
Private class HistoryMigrationTest {

/*
    static testmethod void testProcessOpportunityObjectHistory() {
        HistoryMigration hm = new HistoryMigration();
        
        Shane_NW_Rows__c snrs = [SELECT FtrOpportunityId__c, NWId__c, RowType__c, Status__c FROM Shane_NW_Rows__c WHERE RowType__c = 'Opportunity' LIMIT 1];
        snrs.status__c = null;
        update snrs;
        hm.ProcessOpportunityObjectHistory();
        
        snrs.status__c = 'OppHistory1';
        update snrs;        
        hm.ProcessOpportunityFieldHistory();
    }
*/
    
    static testmethod void testProcessAccountFieldHistory() {
        HistoryMigration hm = new HistoryMigration();
        
        Shane_NW_Rows__c snrs = [SELECT FtrAccountId__c, NWId__c, RowType__c, Status__c FROM Shane_NW_Rows__c WHERE RowType__c = 'Account' LIMIT 1];
        snrs.status__c = null;
        update snrs;
        hm.ProcessAccountFieldHistory();
    }
}