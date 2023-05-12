@isTest
public class EVC_ExtensionController_Test {
    public static testMethod void getCurrentlyLinkedUniOptionsTest() {
        Opportunity opp = new Opportunity(Name = 'Test 1', StageName = 'Investigating', CloseDate = Date.today());
        insert opp;        
        
        DGF__c dgf = DGF_Test_Fixture_Factory.createTestDGF('ELINE', opp.Id);
        
        Physical_Site__c ps = new Physical_Site__c(Service_Address_Street__c = '805 Central Expy S',
                                                   Service_Address_City__c = 'Allen',
                                                   Service_Address_State__c = 'TX',
                                                   Service_Address_Postal_Code__c = '75013');
        ps.DGF__c = dgf.Id;
        insert ps;
        
        EVC__c testEVC = new EVC__c(Name = 'EVCTest', Type__c = 'EIA', Subtype__c = 'Internet', Class_of_Service__c = 'Silver', DGF__c = dgf.Id);
        insert testEVC;
        
        UNI__c UNI1 = new UNI__c(Name = 'UNI1', 
                                 Physical_Site__c = ps.Id, 
                                 All_to_One_Bundling__c = true, 
                                 Physical_Medium__c = 'Copper RJ45', 
                                 Speed__c = '100');
        insert UNI1;
        
        UNI__c UNI2 = new UNI__c(Name = 'UNI2', 
                                 Physical_Site__c = ps.Id, 
                                 All_to_One_Bundling__c = true, 
                                 Physical_Medium__c = 'Copper RJ45', 
                                 Speed__c = '100');
        insert UNI2;
                
        List<EVC_UNI_Association__c> e2us = new List<EVC_UNI_Association__c>();
        e2us.add(new EVC_UNI_Association__c(UNI__C = UNI1.Id, EVC__c = testEVC.Id));
        e2us.add(new EVC_UNI_Association__c(UNI__C = UNI2.Id, EVC__c = testEVC.Id));
        insert e2us;
        
        List<EVC_UNI_Association__c> e2uQueryRes = EVC_ExtensionController.getCurrentlyLinkedUnis(testEVC.Id);
        SelectOption[] res = EVC_ExtensionController.getCurrentlyLinkedUniOptions(e2uQueryRes);
        System.assert(res.size() == 2);
    }
    
    public static testMethod void getCurrentlyLinkedUnisTest() {
        Opportunity opp = new Opportunity(Name = 'Test 1', StageName = 'Investigating', CloseDate = Date.today());
        insert opp;        
        
        DGF__c dgf = DGF_Test_Fixture_Factory.createTestDGF('ELINE', opp.Id);
        
        Physical_Site__c ps = new Physical_Site__c(Service_Address_Street__c = '805 Central Expy S',
                                                   Service_Address_City__c = 'Allen',
                                                   Service_Address_State__c = 'TX',
                                                   Service_Address_Postal_Code__c = '75013');
        ps.DGF__c = dgf.Id;
        insert ps;
        
        EVC__c testEVC = new EVC__c(Name = 'EVCTest', Type__c = 'EIA', Subtype__c = 'Internet', Class_of_Service__c = 'Silver', DGF__c = dgf.Id);
        insert testEVC;
        
        UNI__c UNI1 = new UNI__c(Name = 'UNI1', 
                                 Physical_Site__c = ps.Id, 
                                 All_to_One_Bundling__c = true, 
                                 Physical_Medium__c = 'Copper RJ45', 
                                 Speed__c = '100');
        insert UNI1;
        
        UNI__c UNI2 = new UNI__c(Name = 'UNI2', 
                                 Physical_Site__c = ps.Id, 
                                 All_to_One_Bundling__c = true, 
                                 Physical_Medium__c = 'Copper RJ45', 
                                 Speed__c = '100');
        insert UNI2;
                
        List<EVC_UNI_Association__c> e2us = new List<EVC_UNI_Association__c>();
        e2us.add(new EVC_UNI_Association__c(UNI__C = UNI1.Id, EVC__c = testEVC.Id));
        e2us.add(new EVC_UNI_Association__c(UNI__C = UNI2.Id, EVC__c = testEVC.Id));
        insert e2us;
        
        List<EVC_UNI_Association__c> res = EVC_ExtensionController.getCurrentlyLinkedUnis(testEVC.Id);
        System.assert(res.size() == 2);
    }

    public static testMethod void getEVCTypeOptionsTest() {
        EVC_ExtensionController evcCtrl = new EVC_ExtensionController();
        List<SelectOption> res = evcCtrl.getEVCTypeOptions();
        System.assert(res.size() > 0);
    }
    
    public static testMethod void getEVCBandwidthOptionsTest() {
        EVC_ExtensionController evcCtrl = new EVC_ExtensionController();
        List<SelectOption> res = evcCtrl.getEVCBandwidthOptions();
        System.assert(res.size() > 0);
    }
    
    public static testMethod void getEVCServiceClassOptionsTest() {
        EVC_ExtensionController evcCtrl = new EVC_ExtensionController();
        List<SelectOption> res = evcCtrl.getEVCServiceClassOptions();
        System.assert(res.size() > 0);
    }
    
    public static testMethod void getInterstateIntrastateOptionsTest() {
        EVC_ExtensionController evcCtrl = new EVC_ExtensionController();
        List<SelectOption> res = evcCtrl.getInterstateIntrastateOptions();
        System.assert(res.size() > 0);
    }
    
    public static TestMethod Void getLinkedUNIIdsTest() {
        Opportunity opp = new Opportunity(Name = 'Test 1', StageName = 'Investigating', CloseDate = Date.today());
        insert opp;        
        
        DGF__c dgf = DGF_Test_Fixture_Factory.createTestDGF('ELINE', opp.Id);
        
        Physical_Site__c ps = new Physical_Site__c(Service_Address_Street__c = '805 Central Expy S',
                                                   Service_Address_City__c = 'Allen',
                                                   Service_Address_State__c = 'TX',
                                                   Service_Address_Postal_Code__c = '75013');
        ps.DGF__c = dgf.Id;
        insert ps;
        
        EVC__c testEVC = new EVC__c(Name = 'EVCTest', Type__c = 'EIA', Subtype__c = 'Internet', Class_of_Service__c = 'Silver', DGF__c = dgf.Id);
        insert testEVC;
        
        UNI__c UNI1 = new UNI__c(Name = 'UNI1', 
                                 Physical_Site__c = ps.Id, 
                                 All_to_One_Bundling__c = true, 
                                 Physical_Medium__c = 'Copper RJ45', 
                                 Speed__c = '100');
        insert UNI1;
        
        UNI__c UNI2 = new UNI__c(Name = 'UNI2', 
                                 Physical_Site__c = ps.Id, 
                                 All_to_One_Bundling__c = true, 
                                 Physical_Medium__c = 'Copper RJ45', 
                                 Speed__c = '100');
        insert UNI2;
        
        List<EVC_UNI_Association__c> e2us = new List<EVC_UNI_Association__c>();
        e2us.add(new EVC_UNI_Association__c(UNI__C = UNI1.Id, EVC__c = testEVC.Id));
        e2us.add(new EVC_UNI_Association__c(UNI__C = UNI2.Id, EVC__c = testEVC.Id));
        insert e2us;
        
        List<Id> res = EVC_ExtensionController.getLinkedUNIIds(e2us) ;
        System.assert(res.size() == 2);
    }
    
    public static TestMethod Void getAvailableUNIsTest () {
        Opportunity opp = new Opportunity(Name = 'Test 1', StageName = 'Investigating', CloseDate = Date.today());
        insert opp;        
        
        DGF__c dgf = DGF_Test_Fixture_Factory.createTestDGF('ELINE', opp.Id);
        
        Physical_Site__c ps = new Physical_Site__c(Service_Address_Street__c = '805 Central Expy S',
                                                   Service_Address_City__c = 'Allen',
                                                   Service_Address_State__c = 'TX',
                                                   Service_Address_Postal_Code__c = '75013');
        ps.DGF__c = dgf.Id;
        insert ps;
        
        EVC__c testEVC = new EVC__c(Name = 'EVCTest', Type__c = 'EIA', Subtype__c = 'Internet', Class_of_Service__c = 'Silver', DGF__c = dgf.Id);
        insert testEVC;
        
        UNI__c UNI1 = new UNI__c(Name = 'UNI1', 
                                 Physical_Site__c = ps.Id, 
                                 All_to_One_Bundling__c = true, 
                                 Physical_Medium__c = 'Copper RJ45', 
                                 Speed__c = '100');
        insert UNI1;
        
        UNI__c UNI2 = new UNI__c(Name = 'UNI2', 
                                 Physical_Site__c = ps.Id, 
                                 All_to_One_Bundling__c = true, 
                                 Physical_Medium__c = 'Copper RJ45', 
                                 Speed__c = '100');
        insert UNI2;
        
        List<EVC_UNI_Association__c> e2us = new List<EVC_UNI_Association__c>();
        e2us.add(new EVC_UNI_Association__c(UNI__C = UNI1.Id, EVC__c = testEVC.Id));
        e2us.add(new EVC_UNI_Association__c(UNI__C = UNI2.Id, EVC__c = testEVC.Id));
        insert e2us;

        List<Id> currentlyLinkedUniIds = new List<Id>{UNI1.Id,UNI2.Id};
        SelectOption[] res = EVC_ExtensionController.getAvailableUNIs(dgf.Id, currentlyLinkedUniIds);
    }
    
    public static testMethod void constructorTest() {
        Opportunity opp = new Opportunity(Name = 'Test 1', StageName = 'Investigating', CloseDate = Date.today());
        insert opp;        
        
        DGF__c dgf = DGF_Test_Fixture_Factory.createTestDGF('ELINE', opp.Id);
        
        Physical_Site__c ps = new Physical_Site__c(Service_Address_Street__c = '805 Central Expy S',
                                                   Service_Address_City__c = 'Allen',
                                                   Service_Address_State__c = 'TX',
                                                   Service_Address_Postal_Code__c = '75013');
        ps.DGF__c = dgf.Id;
        insert ps;
        
        EVC__c testEVC = new EVC__c(Name = 'EVCTest', Type__c = 'EIA', Subtype__c = 'Internet', Class_of_Service__c = 'Silver', DGF__c = dgf.Id);
        insert testEVC;
        
        UNI__c UNI1 = new UNI__c(Name = 'UNI1', 
                                 Physical_Site__c = ps.Id, 
                                 All_to_One_Bundling__c = true, 
                                 Physical_Medium__c = 'Copper RJ45', 
                                 Speed__c = '100');
        insert UNI1;
        
        UNI__c UNI2 = new UNI__c(Name = 'UNI2', 
                                 Physical_Site__c = ps.Id, 
                                 All_to_One_Bundling__c = true, 
                                 Physical_Medium__c = 'Copper RJ45', 
                                 Speed__c = '100');
        insert UNI2;
        
        List<EVC_UNI_Association__c> e2us = new List<EVC_UNI_Association__c>();
        e2us.add(new EVC_UNI_Association__c(UNI__C = UNI1.Id, EVC__c = testEVC.Id));
        e2us.add(new EVC_UNI_Association__c(UNI__C = UNI2.Id, EVC__c = testEVC.Id));
        insert e2us;

        PageReference pageRef = Page.EVC_edit;
        Test.setCurrentPage(pageRef);
        pageRef.getParameters().put('Id', String.valueOf(testEVC.Id));
        
        // Product = ELINE
        ApexPages.StandardController stdCtrl = new ApexPages.StandardController(testEVC);
        EVC_ExtensionController evcExtCtrl = new EVC_ExtensionController(stdCtrl);
        System.assert(evcExtCtrl.DGFProduct == 'ELINE');
    }
    
    public static testMethod Void validateUNIsTest() {
        SelectOption[] unis = new SelectOption[]{};
        unis.add(new SelectOption('uni1','uni1'));
        
        Boolean res = EVC_ExtensionController.validateUNIs(unis, 'EIA');
        system.assert(res == true);

        unis.add(new SelectOption('uni2','uni2'));
        res = EVC_ExtensionController.validateUNIs(unis, 'EIA');
        system.assert(res == false);

        res = EVC_ExtensionController.validateUNIs(unis, 'ELINE');
        system.assert(res == true);

        unis.add(new SelectOption('uni3','uni3'));
        res = EVC_ExtensionController.validateUNIs(unis, 'ELINE');
        system.assert(res == false);
    }
    
    public static testMethod Void  getCurrentAssociationsTest() {
        Opportunity opp = DGF_Test_Fixture_Factory.createTestOpportunity();
        DGF__c dgf = DGF_Test_Fixture_Factory.createTestDGF('EIA', opp.Id);
        List<Physical_Site__c> sites = DGF_Test_Fixture_Factory.createTestPhysicalSites(1, dgf.Id);
        List<UNI__c> unis = DGF_Test_Fixture_Factory.createTestUNIs(2, sites[0].Id, 'Service Multiplexing', 'Copper RJ45', '100');
        List<EVC__c> evcs = DGF_Test_Fixture_Factory.createTestEVCs(1, dgf.Id);
        List<EVC_UNI_Association__c> testJunctions = new List<EVC_UNI_Association__c>();
        testJunctions.add(new EVC_UNI_Association__c(EVC__c = evcs[0].Id, Dgf_Id__c = dgf.Id, UNI__C = unis[0].Id));
        testJunctions.add(new EVC_UNI_Association__c(EVC__c = evcs[0].Id, Dgf_Id__c = dgf.Id, UNI__C = unis[1].Id));
        insert testJunctions;
        
        Test.startTest();
        List<EVC_UNI_Association__c> res = EVC_ExtensionController.getCurrentAssociations(evcs[0].Id);
        Test.stopTest();

        system.assert(res.size() == testJunctions.size());
    }

        public static TestMethod Void getAssociationsToAddTest() {
            Opportunity opp = DGF_Test_Fixture_Factory.createTestOpportunity();
            DGF__c dgf = DGF_Test_Fixture_Factory.createTestDGF('EIA', opp.Id);
            List<Physical_Site__c> sites = DGF_Test_Fixture_Factory.createTestPhysicalSites(1, dgf.Id);
            List<UNI__c> unis = DGF_Test_Fixture_Factory.createTestUNIs(3, sites[0].Id, 'Service Multiplexing', 'Copper RJ45', '100');
            List<EVC__c> evcs = DGF_Test_Fixture_Factory.createTestEVCs(1, dgf.Id);
            List<EVC_UNI_Association__c> testJunctions = new List<EVC_UNI_Association__c>();
            testJunctions.add(new EVC_UNI_Association__c(EVC__c = evcs[0].Id, Dgf_Id__c = dgf.Id, UNI__C = unis[0].Id));
            testJunctions.add(new EVC_UNI_Association__c(EVC__c = evcs[0].Id, Dgf_Id__c = dgf.Id, UNI__C = unis[1].Id));
            insert testJunctions;
            
            SelectOption[] selectedUNIOptions = new SelectOption[]{};
            selectedUniOptions.add(new SelectOption(unis[0].Id, unis[0].Name));
            selectedUniOptions.add(new SelectOption(unis[1].Id, unis[1].Name));
            selectedUniOptions.add(new SelectOption(unis[2].Id, unis[2].Name));
            
            Test.startTest();
            List<EVC_UNI_Association__c> junctionsToAdd = EVC_ExtensionController.getAssociationsToAdd(evcs[0].Id, dgf.Id, selectedUNIOptions, testJunctions);
            Test.stopTest();
            
            system.assert(junctionsToAdd.size() == 1);
    }

    public static TestMethod Void getUniIdsFromSelectedUnisTest() {
        Opportunity opp = DGF_Test_Fixture_Factory.createTestOpportunity();
        DGF__c dgf = DGF_Test_Fixture_Factory.createTestDGF('EIA', opp.Id);
        List<Physical_Site__c> sites = DGF_Test_Fixture_Factory.createTestPhysicalSites(1, dgf.Id);
        List<UNI__c> unis = DGF_Test_Fixture_Factory.createTestUNIs(3, sites[0].Id, 'Service Multiplexing', 'Copper RJ45', '100');
        List<EVC__c> evcs = DGF_Test_Fixture_Factory.createTestEVCs(1, dgf.Id);
        List<EVC_UNI_Association__c> testJunctions = new List<EVC_UNI_Association__c>();
        testJunctions.add(new EVC_UNI_Association__c(EVC__c = evcs[0].Id, Dgf_Id__c = dgf.Id, UNI__C = unis[0].Id));
        testJunctions.add(new EVC_UNI_Association__c(EVC__c = evcs[0].Id, Dgf_Id__c = dgf.Id, UNI__C = unis[1].Id));
        insert testJunctions;

        SelectOption[] selectedUNIOptions = new SelectOption[]{};
        selectedUniOptions.add(new SelectOption(unis[0].Id, unis[0].Name));
        selectedUniOptions.add(new SelectOption(unis[1].Id, unis[1].Name));
        selectedUniOptions.add(new SelectOption(unis[2].Id, unis[2].Name));
        
        Test.startTest();
        Set<Id> uniIds = EVC_ExtensionController.getUniIdsFromSelectedUnis(selectedUNIOptions);
        Test.stopTest();
        
        system.assert(uniIds.size() == selectedUniOptions.size());
    }

    public static TestMethod Void getAssociationsToDeleteTest() {
        Opportunity opp = DGF_Test_Fixture_Factory.createTestOpportunity();
        DGF__c dgf = DGF_Test_Fixture_Factory.createTestDGF('EIA', opp.Id);
        List<Physical_Site__c> sites = DGF_Test_Fixture_Factory.createTestPhysicalSites(1, dgf.Id);
        List<UNI__c> unis = DGF_Test_Fixture_Factory.createTestUNIs(3, sites[0].Id, 'Service Multiplexing', 'Copper RJ45', '100');
        List<EVC__c> evcs = DGF_Test_Fixture_Factory.createTestEVCs(1, dgf.Id);
        List<EVC_UNI_Association__c> testJunctions = new List<EVC_UNI_Association__c>();
        testJunctions.add(new EVC_UNI_Association__c(EVC__c = evcs[0].Id, Dgf_Id__c = dgf.Id, UNI__C = unis[0].Id));
        testJunctions.add(new EVC_UNI_Association__c(EVC__c = evcs[0].Id, Dgf_Id__c = dgf.Id, UNI__C = unis[1].Id));
        testJunctions.add(new EVC_UNI_Association__c(EVC__c = evcs[0].Id, Dgf_Id__c = dgf.Id, UNI__C = unis[2].Id));
        insert testJunctions;

        SelectOption[] selectedUNIOptions = new SelectOption[]{};
        selectedUniOptions.add(new SelectOption(unis[0].Id, unis[0].Name));
        selectedUniOptions.add(new SelectOption(unis[1].Id, unis[1].Name));
        
        Test.startTest();
        List<EVC_UNI_Association__c> junctionsToDelete = EVC_ExtensionController.getAssociationsToDelete(selectedUNIOptions, testJunctions);
        Test.stopTest();
        
        system.assert(junctionsToDelete.size() == 1);
    }
    
    public static TestMethod Void isCeVlanIdValidTest() {
        Boolean res = EVC_ExtensionController.isCeVlanIdValid(9000);
        system.assert(res == false);
        res = EVC_ExtensionController.isCeVlanIdValid(4096);
        system.assert(res == true);
        res = EVC_ExtensionController.isCeVlanIdValid(0);
        system.assert(res == true);
        res = EVC_ExtensionController.isCeVlanIdValid(-1);
        system.assert(res == false);
    }
    
    public static TestMethod Void saveAndNewEVCTest() {
        DGF_Test_Fixture_Factory.Test_Items testItems = DGF_Test_Fixture_Factory.createTestItems();
        PageReference pageRef = Page.EVC_edit;
        Test.setCurrentPage(pageRef);
        pageRef.getParameters().put('Id', String.valueOf(testItems.EVCs[0].Id));
        
        ApexPages.StandardController stdCtrl = new ApexPages.StandardController(testItems.EVCs[0]);
        EVC_ExtensionController evcExtCtrl = new EVC_ExtensionController(stdCtrl);
        PageReference pr = evcExtCtrl.saveAndNewEVC();
    }
    
    public static TestMethod Void saveEVCTest() {
        DGF_Test_Fixture_Factory.Test_Items testItems = DGF_Test_Fixture_Factory.createTestItems();
        PageReference pageRef = Page.EVC_edit;
        Test.setCurrentPage(pageRef);
        pageRef.getParameters().put('Id', String.valueOf(testItems.EVCs[0].Id));
        
        ApexPages.StandardController stdCtrl = new ApexPages.StandardController(testItems.EVCs[0]);
        EVC_ExtensionController evcExtCtrl = new EVC_ExtensionController(stdCtrl);
        PageReference pr = evcExtCtrl.saveEVC();
    }

}