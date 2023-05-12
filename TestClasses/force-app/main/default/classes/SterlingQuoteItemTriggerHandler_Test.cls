/**
 * @description       : This test class covers the following Apex classes:
 *      TBD_CLASS1
 *      TBD_CLASS2
 *      TBD_CLASS3
 * @author            : TBD
 * @version           : 1 
**/
@isTest
public class SterlingQuoteItemTriggerHandler_Test {
	@isTest
    private static void sqiTriggerHandlerTest() {
		Opportunity testOpp = Test_Fixture_Factory.createTestOpportunity();
		SterlingQuote__c testQuote = Test_Fixture_Factory.createTestQuote(testOpp.Id, '', '');
        List<SterlingQuoteItem__c> items = [SELECT Id, Quantity__c FROM SterlingQuoteItem__c WHERE SterlingQuote__c = :testQuote.Id];
        for (SterlingQuoteItem__c item : items) {
            item.Quantity__c = 2;
        }
        update items;
    }
    
    @isTest
    private static void sqiTriggerHandlerTest2() {
		Opportunity testOpp = Test_Fixture_Factory.createTestOpportunity();
		SterlingQuote__c testQuote = Test_Fixture_Factory.createTestQuote(testOpp.Id, '', '');
        List<SterlingQuoteItem__c> items = [SELECT Id, Quantity__c FROM SterlingQuoteItem__c WHERE SterlingQuote__c = :testQuote.Id];
        for (SterlingQuoteItem__c item : items) {
            item.Quantity__c = 2;
        }
        delete items;
    }
}