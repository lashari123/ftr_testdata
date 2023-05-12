@isTest
public class Physical_Site_ExtensionController_Test {
    public static testMethod void constructorTest() {
        DGF_Test_Fixture_Factory.Test_Items testItems = DGF_Test_Fixture_Factory.createTestItems();
        PageReference pageRef = Page.Physical_Site_edit;
        Test.setCurrentPage(pageRef);
        pageRef.getParameters().put('Id', String.valueOf(testItems.sites[0].Id));
        
        ApexPages.StandardController stdCtrl = new ApexPages.StandardController(testItems.sites[0]);
        Physical_Site_ExtensionController siteCtrl = new Physical_Site_ExtensionController(stdCtrl);
        System.assert(siteCtrl != null);
    }
}