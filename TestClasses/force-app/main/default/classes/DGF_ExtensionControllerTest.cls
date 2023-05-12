@IsTest
public class DGF_ExtensionControllerTest {
    public static TestMethod void constructorTest() {
        DGF_Test_Fixture_Factory.Test_Items testItems = DGF_Test_Fixture_Factory.createTestItems();
        
        //Opportunity opp = new Opportunity(Name = 'Test 1', StageName = 'Investigating', CloseDate = Date.today());
        //insert opp;
        
        //List<OpportunityLineItem> oliList = new List<OpportunityLineItem>();
        //oliList.add(new OpportunityLineItem (Quantity=2, OpportunityId=opp.Id, TotalPrice=10, PriceBookEntryId='01uE0000004O0prIAC'));
        //oliList.add(new OpportunityLineItem (Quantity=2, OpportunityId=opp.Id, TotalPrice=10, PriceBookEntryId='01u0L000008il3fQAA'));
        //insert oliList;
        
        /*DGF__c dgf = new DGF__c(Opportunity__c = opp.Id, 
                                Product_Requested2__c = 'ELINE', 
                                Customer_Contact__c = 'test tester',
                                Customer_Contact_Phone__c = '5555555555',
                                Customer_Contact_Email__c = 'test.tester@test.com');
        insert dgf;*/
        
        // change unis to be overrun
        testItems.UNIs[0].Speed__c = '10';
        testItems.UNIs[1].Speed__c = '10';
        testItems.EVCs[0].Bandwidth__c = '10000';
        
        PageReference pageRef = Page.DGF_edit;
        Test.setCurrentPage(pageRef);
        pageRef.getParameters().put('Id', String.valueOf(testItems.dgf.Id));
        ApexPages.StandardController stdCtrl = new ApexPages.StandardController(testItems.dgf);
        DGF_ExtensionController dgfExtCtrl = new DGF_ExtensionController(stdCtrl);
        System.assert(dgfExtCtrl != null);
    }
}