@IsTest(SeeAllData = true)
public class SterlingQuoteUtility_Test {
    @IsTest
    private static Void syncUnsyncQuote_Test() {
        String reqGiven = 'GIVEN there is an available Opportunity with an FSA quote and quote line items ';
        Opportunity oppFixture = Test_Fixture_Factory.createTestOpportunity();
        SterlingQuote__c testQuote = Test_Fixture_Factory.createTestQuote(oppFixture.Id, '', 'New', false);
        
        // make sure the quote has the correct record type
        RecordType sfaQuoteRecordType = [SELECT Id, name FROM RecordType WHERE name = 'SFA' AND SObjectType = 'SterlingQuote__c' LIMIT 1];
        testQuote.RecordTypeId = sfaQuoteRecordType.Id;
        update testQuote;
        
        // make sure the quote items have the correct record type
        RecordType sfaQuoteItemRecordType = [SELECT Id FROM RecordType WHERE name = 'SFA' AND SObjectType = 'SterlingQuoteItem__c' LIMIT 1];
        List<SterlingQuoteItem__c> quoteItems = [SELECT Id, RecordTypeId FROM SterlingQuoteItem__c WHERE SterlingQuote__c = :testQuote.Id];
        for (SterlingQuoteItem__c item : quoteItems) {
            item.RecordTypeId = sfaQuoteItemRecordType.Id;
        }
        update quoteItems;
        
        SterlingQuoteItem__c SQI = [SELECT SterlingQuote__c,OpportunityId__c,Products__c FROM SterlingQuoteItem__c WHERE Products__c != null limit 1];
        SterlingQuote__c sQuotenew =[SELECT id, OpportunityId__c,Name,RecordTypeId FROM  SterlingQuote__c where Id = :SQI.SterlingQuote__c LIMIT 1];
        Integer countLineItems0 = [SELECT COUNT() FROM OpportunityLineItem WHERE OpportunityId = :sQuotenew.OpportunityId__c];
     //   System.assert(countLineItems0 == 0, 'Initial opportunity should have had no opportunity line items but actually had ' + countLineItems0);
        
        String reqWhen = 'WHEN syncQuote is run with the SFA quote ';

        SterlingQuoteUtility.syncQuote(sQuotenew);
        
        string reqThen = 'THEN the count of Opportunity Line Items on that opportunity should be greater than 0 ';
        Integer countLineItems1 = [SELECT COUNT() FROM OpportunityLineItem WHERE OpportunityId = :sQuotenew.OpportunityId__c];
  //      System.assert(countLineItems1 > countLineItems0, reqGiven + reqWhen + reqThen + 'BUT was actually ' + countLineItems1);
        
        // unsync test
        reqGiven = 'GIVEN there is an opportunity that has opportunity line items ';

        reqWhen = 'WHEN unsyncQuote is run with the SFA quote ';
        SterlingQuoteUtility.unsyncQuoteType(oppFixture, sfaQuoteRecordType);
        
        reqThen = 'THEN the opportunity should have no opportunity line items ';
        Integer countLineItems2 = [SELECT COUNT() FROM OpportunityLineItem WHERE OpportunityId = :oppFixture.Id];
    //    System.assert(countLineItems2 == countLineItems0, reqGiven + reqWhen + reqThen + 'BUT was actually ' + countLineItems2);
    }
    
    @IsTest
    private static Void getQuoteIdsFromOpportunity_Test() {
        Opportunity oppFixture = Test_Fixture_Factory.createTestOpportunity();
        SterlingQuote__c testQuote = Test_Fixture_Factory.createTestQuote(oppFixture.Id, '', 'Pending - Finance');
        Map<Id, SterlingQuote__c> res = SterlingQuoteUtility.getQuoteIdsFromOpportunity(oppFixture.Id);
    }
    
    @IsTest
    private static Void getQuoteItemsFromQuotes_Test() {
        Opportunity oppFixture = Test_Fixture_Factory.createTestOpportunity();
        SterlingQuote__c testQuote = Test_Fixture_Factory.createTestQuote(oppFixture.Id, '', 'Pending - Finance');
        List<SterlingQuoteItem__c> testQuoteItems = SterlingQuoteUtility.getQuoteItemsFromQuote(testQuote.Id);
        System.assert(testQuoteItems.size() > 0, 'getQuoteItems.size() should have been greater than 0 but was 0');
    }

}