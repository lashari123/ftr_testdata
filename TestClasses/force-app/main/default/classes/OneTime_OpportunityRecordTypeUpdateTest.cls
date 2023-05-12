@isTest 
public with sharing class OneTime_OpportunityRecordTypeUpdateTest {

    static testMethod void testOppRecordTypeUpdate() {
        
        List<Opportunity> lst = ftr_TestDataFactory.getOpportunities(10);
        String rType = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('ClosedOpp RecordType').getRecordTypeId();
        for (Opportunity opp : lst) {
            opp.RecordTypeId = rType;
        }
        insert lst;
        Test.startTest();

        Database.executeBatch(new OneTime_OpportunityRecordTypeUpdate(), 25);
        
        Test.stopTest();

    }
    
}