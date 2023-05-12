@IsTest
public class DGF_Products_ExtensionController_Test {
    public static TestMethod Void constructorTest() {
        Opportunity opp = new Opportunity(Name = 'Test 1', StageName = 'Investigating', CloseDate = Date.today());
        insert opp;
        
        List<OpportunityLineItem> oliList = new List<OpportunityLineItem>();
        oliList.add(new OpportunityLineItem (Quantity=2, OpportunityId=opp.Id, TotalPrice=10, PriceBookEntryId='01uE0000004O0prIAC'));
        oliList.add(new OpportunityLineItem (Quantity=2, OpportunityId=opp.Id, TotalPrice=10, PriceBookEntryId='01uE0000005G9vGIAS'));
        insert oliList;
        
        DGF__c dgf = DGF_Test_Fixture_Factory.createTestDGF('ELINE', opp.Id);
        
        PageReference pageRef = Page.DGF_edit;
        Test.setCurrentPage(pageRef);
        pageRef.getParameters().put('Id', String.valueOf(dgf.Id));
        ApexPages.StandardController stdCtrl = new ApexPages.StandardController(dgf);
        DGF_Products_ExtensionController dgfPrdCtrl = new DGF_Products_ExtensionController(stdCtrl);
        System.assert(dgfPrdCtrl != null);
    }
}