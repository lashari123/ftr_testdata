@isTest
public class UNI_ExtensionController_Test {
    public static testMethod void getPhysicalMediumOptionsTest() {
        List<SelectOption> res = new UNI_ExtensionController().getPhysicalMediumOptions();
        System.assert(res.size() > 0);
    }

    public static testMethod void getSpeedOptionsTest() {
        List<SelectOption> res = new UNI_ExtensionController().getSpeedOptions();
        System.assert(res.size() > 0);
    }

    public static testMethod void getModeOptionsTest() {
        List<SelectOption> res = new UNI_ExtensionController().getModeOptions();
        System.assert(res.size() > 0);
    }

    public static testMethod void getNegotiationOptionsTest() {
        List<SelectOption> res = new UNI_ExtensionController().getNegotiationOptions();
        System.assert(res.size() > 0);
    }

    public static testMethod void getFrameSizeOptionsTest() {
        List<SelectOption> res = new UNI_ExtensionController().getFrameSizeOptions();
        System.assert(res.size() > 0);
    }

    public static testMethod void Search_CIDTest() {
        String res = new UNI_ExtensionController().Search_CID();
        System.assert(res == '');
    }
    
    public static testMethod Void computeEVCBWAssignedTest() {
		Opportunity opp = new Opportunity(Name = 'Test 1', StageName = 'Investigating', CloseDate = Date.today());
        insert opp;        
        
        DGF__c dgf = DGF_Test_Fixture_Factory.createTestDGF('ELINE', opp.Id);
        
        Physical_Site__c ps = new Physical_Site__c(Service_Address_Street__c = '805 Central Expy S',
                                                   Service_Address_City__c = 'Allen',
                                                   Service_Address_State__c = 'TX',
                                                   Service_Address_Postal_Code__c = '75013');
        ps.DGF__c = dgf.Id;
        insert ps;
        
        UNI__c testUNI = new UNI__c(Name = 'UNITest', 
                                 Physical_Site__c = ps.Id, 
                                 All_to_One_Bundling__c = true, 
                                 Physical_Medium__c = 'Copper RJ45', 
                                 Speed__c = '100');
        insert testUNI;
        
        EVC__c testEVC1 = new EVC__c(Name = 'EVCTest1', DGF__c = dgf.Id, Bandwidth__c = '20');
        insert testEVC1;
        EVC__c testEVC2 = new EVC__c(Name = 'EVCTest2', DGF__c = dgf.Id, Bandwidth__c = '20');
        insert testEVC2;
		
        List<EVC_UNI_Association__c> e2u = new List<EVC_UNI_Association__c>();
        e2u.add(new EVC_UNI_Association__c(UNI__c = testUNI.Id, EVC__c = testEVC1.Id));
        e2u.add(new EVC_UNI_Association__c(UNI__c = testUNI.Id, EVC__c = testEVC2.Id));
        insert e2u;
        
        Integer res = UNI_ExtensionController.computeEVCBWAssigned(testUNI.Id);
        system.assert(res == 40);
    }
    
    public static testMethod Void getTagOptionsTest() {
        List<SelectOption> res = new UNI_ExtensionController().getTagOptions();
        system.assert(res.size() > 0);
    }

    public static testMethod Void getOversubscriptionOptionsTest() {
        List<SelectOption> res = new UNI_ExtensionController().getOversubscriptionOptions();
        system.assert(res.size() > 0);
    }
    
    public static testMethod Void ConstructorTest() {
		Opportunity opp = new Opportunity(Name = 'Test 1', StageName = 'Investigating', CloseDate = Date.today());
        insert opp;        
        
        DGF__c dgf = DGF_Test_Fixture_Factory.createTestDGF('ELINE', opp.Id);
        
        Physical_Site__c ps = new Physical_Site__c(Service_Address_Street__c = '805 Central Expy S',
                                                   Service_Address_City__c = 'Allen',
                                                   Service_Address_State__c = 'TX',
                                                   Service_Address_Postal_Code__c = '75013');
        ps.DGF__c = dgf.Id;
        insert ps;
        
        UNI__c testUNI = new UNI__c(Name = 'UNITest', 
                                 Physical_Site__c = ps.Id, 
                                 All_to_One_Bundling__c = true, 
                                 Physical_Medium__c = 'Copper RJ45', 
                                 Speed__c = '100');
        insert testUNI;
        
        EVC__c testEVC1 = new EVC__c(Name = 'EVCTest1', DGF__c = dgf.Id, Bandwidth__c = '20');
        insert testEVC1;
        EVC__c testEVC2 = new EVC__c(Name = 'EVCTest2', DGF__c = dgf.Id, Bandwidth__c = '20');
        insert testEVC2;
		
        List<EVC_UNI_Association__c> e2u = new List<EVC_UNI_Association__c>();
        e2u.add(new EVC_UNI_Association__c(UNI__c = testUNI.Id, EVC__c = testEVC1.Id));
        e2u.add(new EVC_UNI_Association__c(UNI__c = testUNI.Id, EVC__c = testEVC2.Id));
        insert e2u;


        PageReference pageRef = Page.UNI_edit;
        Test.setCurrentPage(pageRef);
        pageRef.getParameters().put('Id', String.valueOf(testUNI.Id));
        
        ApexPages.StandardController stdCtrl = new ApexPages.StandardController(testUNI);
        UNI_ExtensionController uniExtCtrl = new UNI_ExtensionController(stdCtrl);
        
        system.assert(uniExtCtrl != null);
    }
    
    private static TestMethod Void saveNewTest() {
		Opportunity opp = new Opportunity(Name = 'Test 1', StageName = 'Investigating', CloseDate = Date.today());
        insert opp;        
        
        DGF__c dgf = DGF_Test_Fixture_Factory.createTestDGF('ELINE', opp.Id);
        
        Physical_Site__c ps = new Physical_Site__c(Service_Address_Street__c = '805 Central Expy S',
                                                   Service_Address_City__c = 'Allen',
                                                   Service_Address_State__c = 'TX',
                                                   Service_Address_Postal_Code__c = '75013');
        ps.DGF__c = dgf.Id;
        insert ps;
        
        UNI__c testUNI = new UNI__c(Name = 'UNITest', 
                                 Physical_Site__c = ps.Id, 
                                 All_to_One_Bundling__c = true, 
                                 Physical_Medium__c = 'Copper RJ45', 
                                 Speed__c = '100');
        insert testUNI;
        
        EVC__c testEVC1 = new EVC__c(Name = 'EVCTest1', DGF__c = dgf.Id, Bandwidth__c = '20');
        insert testEVC1;
        EVC__c testEVC2 = new EVC__c(Name = 'EVCTest2', DGF__c = dgf.Id, Bandwidth__c = '20');
        insert testEVC2;
		
        List<EVC_UNI_Association__c> e2u = new List<EVC_UNI_Association__c>();
        e2u.add(new EVC_UNI_Association__c(UNI__c = testUNI.Id, EVC__c = testEVC1.Id));
        e2u.add(new EVC_UNI_Association__c(UNI__c = testUNI.Id, EVC__c = testEVC2.Id));
        insert e2u;


        PageReference pageRef = Page.UNI_edit;
        Test.setCurrentPage(pageRef);
        pageRef.getParameters().put('Id', String.valueOf(testUNI.Id));
        
        ApexPages.StandardController stdCtrl = new ApexPages.StandardController(testUNI);
        UNI_ExtensionController uniExtCtrl = new UNI_ExtensionController(stdCtrl);
		
        Test.startTest();
        PageReference res = uniExtCtrl.saveNew();
        Test.stopTest();
        
        system.assert(res != null);
	}
    
}