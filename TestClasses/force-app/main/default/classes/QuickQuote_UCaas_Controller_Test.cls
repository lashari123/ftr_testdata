@IsTest(SeeAllData = true)
public class QuickQuote_UCaas_Controller_Test {
    @IsTest
    private static void init_Test() {
        Opportunity oppFixture = Test_Fixture_Factory.createTestOpportunity();
        QuickQuote_UCaas_Controller qquc = new QuickQuote_UCaas_Controller();
        qquc.init(oppFixture.Id);
        System.assert(qquc.oppId == oppFixture.Id, 'After init, the QuickQuote_UCaaS Controller opportunityId (oppId) should have been ' + oppFixture.Id + ' but was ' + qquc.oppId);
    }

    @IsTest
    private static void getCurrentOpportunity_Test() {
        Opportunity oppFixture = Test_Fixture_Factory.createTestOpportunity();
        Opportunity testOpp = QuickQuote_UCaas_Controller.getCurrentOpportunity(oppFixture.Id);
        System.assert(testOpp != null, 'getCurrentOpportunity should not have been null');
    }
    
    @IsTest static Void quickQuoteSections_Test() {
        Opportunity oppFixture = Test_Fixture_Factory.createTestOpportunity();
        SterlingQuote__c testQuote = Test_Fixture_Factory.createTestQuote(oppFixture.Id, '', 'Pending - Finance');
        QuickQuote_UCaaS_Controller controller = new QuickQuote_UCaaS_Controller();
        List<SterlingQuoteItem__c> sqiList = new List<SterlingQuoteItem__c>(SterlingQuoteUtility.getQuoteItemsFromQuote(testQuote.Id));
        
        controller.init(oppFixture.Id);
        
        controller.getFirstQuickQuoteWrapper();
        controller.getSecondQuickQuoteWrapper();
        controller.getThirdQuickQuoteWrapper();
        controller.getFourthQuickQuoteWrapper();
        controller.getFifthQuickQuoteWrapper();
    }

}