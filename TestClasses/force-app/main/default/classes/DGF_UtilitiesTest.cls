@IsTest
public class DGF_UtilitiesTest {
    
    public static TestMethod Void computeUNIRateAdjustedBWTest() {
        // public static Integer computeUNIRateAdjustedBW(Integer evcAggregate, Integer uniSpeed, Integer uniOversubscriptionMultiplier) {
        //With uniSpeed < 10000 If EVC Aggregate Bandwidth > 0 And EVC Aggregate Bandwidth < 3 Then UNI Bandwidth = 2
        Integer res = DGF_Utilities.computeUNIRateAdjustedBW(1, 100);
        System.assert(res == 2);
        
        //With uniSpeed < 10000 and oversub == 1 EVC Aggregate Bandwidth > 80 And EVC Aggregate Bandwidth < 91 Then UNI Bandwidth = 90   
        res = DGF_Utilities.computeUNIRateAdjustedBW(90, 1000);
        System.assert(res == 90);
        
        //With uniSpeed == 10000 EVC Aggregate Bandwidth > 0 And EVC Aggregate Bandwidth < 1001 Then UNI Bandwidth = 1000
        res = DGF_Utilities.computeUNIRateAdjustedBW(2, 10000);
        System.assert(res == 1000);
    }
    
    public static TestMethod Void getQuoteItemsTest() {
        Opportunity opp = new Opportunity(Name = 'Test 1', StageName = 'Investigating', CloseDate = Date.today());
        insert opp;        
        List<OpportunityLineItem> oliList = new List<OpportunityLineItem>();
        oliList.add(new OpportunityLineItem (Quantity=2, OpportunityId=opp.Id, TotalPrice=10, PriceBookEntryId='01uE0000004O0prIAC'));
        oliList.add(new OpportunityLineItem (Quantity=2, OpportunityId=opp.Id, TotalPrice=10, PriceBookEntryId='01uE0000005G9vGIAS'));
        insert oliList;
        List<SterlingQuoteItem__c> res = DGF_Utilities.getQuoteItems(opp.Id);
    }
    
    public static TestMethod Void setDgfJumboFrameSizeFlagTest() {
        Opportunity opp = DGF_Test_Fixture_Factory.createTestOpportunity();        
        DGF__c dgf =  DGF_Test_Fixture_Factory.createTestDGF('ELINE', opp.Id);
        Physical_Site__c ps = DGF_Test_Fixture_Factory.createTestPhysicalSites(1, dgf.Id)[0];
        DGF__c dgf1 = [SELECT Jumbo_Frames_Required__c FROM DGF__c WHERE Id = :dgf.Id LIMIT 1];
        System.assert(dgf1.Jumbo_Frames_Required__c == false);
        
        UNI__c testUNI = new UNI__c(Name = 'UNITest', 
                                    Physical_Site__c = ps.Id, 
                                    All_to_One_Bundling__c = true, 
                                    Physical_Medium__c = 'Copper RJ45', 
                                    Speed__c = '100',
                                    Frame_Size__c = '<=9000');
        insert testUni;
        
        DGF_Utilities.setDgfJumboFrameSizeFlag(new List<Id>{testUni.Id});
        DGF__c dgf2 = [SELECT Jumbo_Frames_Required__c FROM DGF__c WHERE Id = :dgf.Id LIMIT 1];
        System.assert(dgf2.Jumbo_Frames_Required__c == true);
    }
    
    public static TestMethod Void getOversubscriptionMultiplierTest () {
        Integer res = DGF_Utilities.getOversubscriptionMultiplier ('4:1');
        System.assert(res == 4);
    }
    
    public static TestMethod Void DeleteOldEvcUniJunctionsTest() {
        Opportunity opp = new Opportunity(Name = 'Test 1', StageName = 'Investigating', CloseDate = Date.today());
        insert opp;        
        
        DGF__c dgf =  DGF_Test_Fixture_Factory.createTestDGF('ELINE', opp.Id);
        Physical_Site__c ps = new Physical_Site__c(Service_Address_Street__c = '805 Central Expy S',
                                                   Service_Address_City__c = 'Allen',
                                                   Service_Address_State__c = 'TX',
                                                   Service_Address_Postal_Code__c = '75013');
        ps.DGF__c = dgf.Id;
        insert ps;
        EVC__c testEVC1 = new EVC__c(Name = 'EVCTest1', DGF__c = dgf.Id, Bandwidth__c = '100');
        insert testEVC1;
        EVC__c testEVC2 = new EVC__c(Name = 'EVCTest2', DGF__c = dgf.Id, Bandwidth__c = '80');
        insert testEVC2;
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
        e2us.add(new EVC_UNI_Association__c(UNI__C = UNI1.Id, EVC__c = testEVC1.Id, DGF_Id__c = dgf.Id));
        e2us.add(new EVC_UNI_Association__c(UNI__C = UNI2.Id, EVC__c = testEVC1.Id, DGF_Id__c = dgf.Id));
        e2us.add(new EVC_UNI_Association__c(UNI__C = UNI1.Id, EVC__c = testEVC2.Id, DGF_Id__c = dgf.Id));
        insert e2us;
        
        delete UNI1;
        delete UNI2;
        delete testEVC1;
        delete testEVC2;
        
        
        Test.startTest();
        DGF_Utilities.DeleteOldEvcUniJunctions();
        Test.stopTest();
        
        List<EVC_UNI_Association__c> junctions = [SELECT Id FROM EVC_UNI_Association__c WHERE EVC__c = '' OR UNI__c = '' OR DGF_Id__c = ''];
        system.assert(junctions.size() == 0);
    }
    
    public static TestMethod Void GetMapFromEvcUniJunctionsTest() {
        Opportunity opp = new Opportunity(Name = 'Test 1', StageName = 'Investigating', CloseDate = Date.today());
        insert opp;        
        
        DGF__c dgf =  DGF_Test_Fixture_Factory.createTestDGF('ELINE', opp.Id);
        
        Physical_Site__c ps = new Physical_Site__c(Service_Address_Street__c = '805 Central Expy S',
                                                   Service_Address_City__c = 'Allen',
                                                   Service_Address_State__c = 'TX',
                                                   Service_Address_Postal_Code__c = '75013');
        ps.DGF__c = dgf.Id;
        insert ps;
        
        EVC__c testEVC1 = new EVC__c(Name = 'EVCTest1', DGF__c = dgf.Id, Bandwidth__c = '100');
        insert testEVC1;
        
        EVC__c testEVC2 = new EVC__c(Name = 'EVCTest2', DGF__c = dgf.Id, Bandwidth__c = '80');
        insert testEVC2;
        
        
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
        e2us.add(new EVC_UNI_Association__c(UNI__C = UNI1.Id, EVC__c = testEVC1.Id, DGF_Id__c = dgf.Id));
        e2us.add(new EVC_UNI_Association__c(UNI__C = UNI2.Id, EVC__c = testEVC1.Id, DGF_Id__c = dgf.Id));
        e2us.add(new EVC_UNI_Association__c(UNI__C = UNI1.Id, EVC__c = testEVC2.Id, DGF_Id__c = dgf.Id));
        insert e2us;
        
        List<EVC_UNI_Association__c> junctions = DGF_Utilities.getAllEvcUniJunctionsForDgf(dgf.Id);
        
        Map<Id, DGF_Utilities.UNI_BW_Properties> uniPropMap = DGF_Utilities.GetMapFromEvcUniJunctions(junctions);
    }
    
    public static TestMethod Void UNI_BW_PropertiesTest() {
        DGF_Utilities.UNI_BW_Properties uniProps = new DGF_Utilities.UNI_BW_Properties();
        uniProps.Speed = 10;
        uniProps.Oversubscription = 2;
        uniProps.EVC_Aggregate_BW = 4;
        uniProps.Adjusted_BW = 4;
        Boolean overrun = uniProps.IsOverrun;
        system.assert(overrun == false);
        uniProps.Speed = 1;
        overrun = uniProps.IsOverrun;
        system.assert(overrun == true);
        uniProps.Adjusted_BW = 0;
        overrun = uniProps.IsOverrun;
        system.assert(overrun == true);
    }
    
    public static TestMethod Void getAllEvcUniJunctionsForDgfTest() {
        Opportunity opp = new Opportunity(Name = 'Test 1', StageName = 'Investigating', CloseDate = Date.today());
        insert opp;        
        
        DGF__c dgf =  DGF_Test_Fixture_Factory.createTestDGF('ELINE', opp.Id);
        
        Physical_Site__c ps = new Physical_Site__c(Service_Address_Street__c = '805 Central Expy S',
                                                   Service_Address_City__c = 'Allen',
                                                   Service_Address_State__c = 'TX',
                                                   Service_Address_Postal_Code__c = '75013');
        ps.DGF__c = dgf.Id;
        insert ps;
        
        EVC__c testEVC1 = new EVC__c(Name = 'EVCTest1', DGF__c = dgf.Id, Bandwidth__c = '100');
        insert testEVC1;
        
        EVC__c testEVC2 = new EVC__c(Name = 'EVCTest2', DGF__c = dgf.Id, Bandwidth__c = '80');
        insert testEVC2;
        
        
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
        e2us.add(new EVC_UNI_Association__c(UNI__C = UNI1.Id, EVC__c = testEVC1.Id, DGF_Id__c = dgf.Id));
        e2us.add(new EVC_UNI_Association__c(UNI__C = UNI2.Id, EVC__c = testEVC1.Id, DGF_Id__c = dgf.Id));
        e2us.add(new EVC_UNI_Association__c(UNI__C = UNI1.Id, EVC__c = testEVC2.Id, DGF_Id__c = dgf.Id));
        insert e2us;
        
        Test.startTest();
        List<EVC_UNI_Association__c> junctions = DGF_Utilities.getAllEvcUniJunctionsForDgf(dgf.Id);
        Test.stopTest();
        
        system.assert(junctions.size() > 0);
    }
    
    public static TestMethod Void getAllEvcUniJunctionsForUniTest() {
        Opportunity opp = new Opportunity(Name = 'Test 1', StageName = 'Investigating', CloseDate = Date.today());
        insert opp;        
        
        DGF__c dgf =  DGF_Test_Fixture_Factory.createTestDGF('ELINE', opp.Id);
        
        Physical_Site__c ps = new Physical_Site__c(Service_Address_Street__c = '805 Central Expy S',
                                                   Service_Address_City__c = 'Allen',
                                                   Service_Address_State__c = 'TX',
                                                   Service_Address_Postal_Code__c = '75013');
        ps.DGF__c = dgf.Id;
        insert ps;
        
        EVC__c testEVC1 = new EVC__c(Name = 'EVCTest1', DGF__c = dgf.Id, Bandwidth__c = '100');
        insert testEVC1;
        
        EVC__c testEVC2 = new EVC__c(Name = 'EVCTest2', DGF__c = dgf.Id, Bandwidth__c = '80');
        insert testEVC2;
        
        
        UNI__c UNI1 = new UNI__c(Name = 'UNI1', 
                                 Physical_Site__c = ps.Id, 
                                 All_to_One_Bundling__c = true, 
                                 Physical_Medium__c = 'Copper RJ45', 
                                 Speed__c = '100',
                                 DGF_Id__c = dgf.Id);
        insert UNI1;
        
        UNI__c UNI2 = new UNI__c(Name = 'UNI2', 
                                 Physical_Site__c = ps.Id, 
                                 All_to_One_Bundling__c = true, 
                                 Physical_Medium__c = 'Copper RJ45', 
                                 Speed__c = '100',
                                 DGF_Id__c = dgf.Id);
        insert UNI2;
        
        List<EVC_UNI_Association__c> e2us = new List<EVC_UNI_Association__c>();
        e2us.add(new EVC_UNI_Association__c(UNI__C = UNI1.Id, EVC__c = testEVC1.Id, DGF_Id__c = dgf.Id));
        e2us.add(new EVC_UNI_Association__c(UNI__C = UNI2.Id, EVC__c = testEVC1.Id, DGF_Id__c = dgf.Id));
        e2us.add(new EVC_UNI_Association__c(UNI__C = UNI1.Id, EVC__c = testEVC2.Id, DGF_Id__c = dgf.Id));
        insert e2us;
        
        Test.startTest();
        List<EVC_UNI_Association__c> junctions = DGF_Utilities.getAllEvcUniJunctionsForUni(UNI1);
        Test.stopTest();
        
        system.assert(junctions.size() > 0);
    }
    
    
    public static TestMethod Void getAllEvcUniJunctionsForEvcTest() {
        Opportunity opp = new Opportunity(Name = 'Test 1', StageName = 'Investigating', CloseDate = Date.today());
        insert opp;        
        
        DGF__c dgf =  DGF_Test_Fixture_Factory.createTestDGF('ELINE', opp.Id);
        
        Physical_Site__c ps = new Physical_Site__c(Service_Address_Street__c = '805 Central Expy S',
                                                   Service_Address_City__c = 'Allen',
                                                   Service_Address_State__c = 'TX',
                                                   Service_Address_Postal_Code__c = '75013');
        ps.DGF__c = dgf.Id;
        insert ps;
        
        EVC__c testEVC1 = new EVC__c(Name = 'EVCTest1', DGF__c = dgf.Id, Bandwidth__c = '100');
        insert testEVC1;
        
        EVC__c testEVC2 = new EVC__c(Name = 'EVCTest2', DGF__c = dgf.Id, Bandwidth__c = '80');
        insert testEVC2;
        
        
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
        e2us.add(new EVC_UNI_Association__c(UNI__C = UNI1.Id, EVC__c = testEVC1.Id, DGF_Id__c = dgf.Id));
        e2us.add(new EVC_UNI_Association__c(UNI__C = UNI2.Id, EVC__c = testEVC1.Id, DGF_Id__c = dgf.Id));
        e2us.add(new EVC_UNI_Association__c(UNI__C = UNI1.Id, EVC__c = testEVC2.Id, DGF_Id__c = dgf.Id));
        insert e2us;
        
        Test.startTest();
        List<EVC_UNI_Association__c> junctions = DGF_Utilities.getAllEvcUniJunctionsForEvc(testEVC1);
        Test.stopTest();
        
        system.assert(junctions.size() > 0);
    }
    
    public static TestMethod Void handleCreateMultipleSitesTest() {
        Opportunity opp = new Opportunity(Name = 'Test 1', StageName = 'Investigating', CloseDate = Date.today());
        insert opp;        
        
        DGF__c dgf =  DGF_Test_Fixture_Factory.createTestDGF('ELINE', opp.Id);
        
        Test.startTest();
        DGF_Utilities.handleCreateMultipleSites(3, dgf);
        Test.stopTest();
        
        List<Physical_Site__c> sites = [SELECT Id FROM Physical_Site__c WHERE DGF__c = :dgf.Id];
        
        system.assert(sites.size() == 3);
    }
    
    public static TestMethod Void getAllEvcUniJunctionsForUnisTest() {
        Opportunity opp = new Opportunity(Name = 'Test 1', StageName = 'Investigating', CloseDate = Date.today());
        insert opp;        
        
        DGF__c dgf =  DGF_Test_Fixture_Factory.createTestDGF('ELINE', opp.Id);
        
        Physical_Site__c ps = new Physical_Site__c(Service_Address_Street__c = '805 Central Expy S',
                                                   Service_Address_City__c = 'Allen',
                                                   Service_Address_State__c = 'TX',
                                                   Service_Address_Postal_Code__c = '75013');
        ps.DGF__c = dgf.Id;
        insert ps;
        
        EVC__c testEVC1 = new EVC__c(Name = 'EVCTest1', DGF__c = dgf.Id, Bandwidth__c = '100');
        insert testEVC1;
        
        EVC__c testEVC2 = new EVC__c(Name = 'EVCTest2', DGF__c = dgf.Id, Bandwidth__c = '80');
        insert testEVC2;
        
        List<UNI__c> uniList = new List<UNI__c>();
        UNI__c UNI1 = new UNI__c(Name = 'UNI1', 
                                 Physical_Site__c = ps.Id, 
                                 All_to_One_Bundling__c = true, 
                                 Physical_Medium__c = 'Copper RJ45', 
                                 Speed__c = '100',
                                 DGF_Id__c = dgf.Id);
        uniList.add(UNI1);
        
        UNI__c UNI2 = new UNI__c(Name = 'UNI2', 
                                 Physical_Site__c = ps.Id, 
                                 All_to_One_Bundling__c = true, 
                                 Physical_Medium__c = 'Copper RJ45', 
                                 Speed__c = '100',
                                 DGF_Id__c = dgf.Id);
        uniList.add(UNI2);
        insert uniList;
        
        List<EVC_UNI_Association__c> e2us = new List<EVC_UNI_Association__c>();
        e2us.add(new EVC_UNI_Association__c(UNI__C = UNI1.Id, EVC__c = testEVC1.Id, DGF_Id__c = dgf.Id));
        e2us.add(new EVC_UNI_Association__c(UNI__C = UNI2.Id, EVC__c = testEVC1.Id, DGF_Id__c = dgf.Id));
        e2us.add(new EVC_UNI_Association__c(UNI__C = UNI1.Id, EVC__c = testEVC2.Id, DGF_Id__c = dgf.Id));
        insert e2us;
        
        Test.startTest();
        List<EVC_UNI_Association__c> junctions = DGF_Utilities.getAllEvcUniJunctionsForUnis(uniList);
        Test.stopTest();
        
        system.assert(junctions.size() > 0);
    }
    
    public static TestMethod Void getSiteCnlSpeedTest() {
        Opportunity opp = DGF_Test_Fixture_Factory.createTestOpportunity();
        DGF__c dgf = DGF_Test_Fixture_Factory.createTestDGF('ELINE', opp.Id);
        Physical_Site__c ps = DGF_Test_Fixture_Factory.createTestPhysicalSites(1, dgf.Id)[0];
        UNI__c uni = DGF_Test_Fixture_Factory.createTestUNIs(1, ps.Id, 'Service Multiplexing', 'Fiber Multimode 850nm', '10000')[0];
        List<EVC__c> evcs = DGF_Test_Fixture_Factory.createTestEVCs(2, dgf.Id);
        List<EVC_UNI_Association__c> e2us = new List<EVC_UNI_Association__c>();
        e2us.add(new EVC_UNI_Association__c(UNI__C = uni.Id, EVC__c = evcs[0].Id, DGF_Id__c = dgf.Id));
        e2us.add(new EVC_UNI_Association__c(UNI__C = uni.Id, EVC__c = evcs[0].Id, DGF_Id__c = dgf.Id));
        insert e2us;
        
        Test.startTest();
        Integer res = DGF_Utilities.getSiteCnlSpeed(ps);
        Test.stopTest();
        
        system.assert(res == 1000);
    }
    
    private Static TestMethod Void getSiteIdsForEvcTest() {
        DGF_Test_Fixture_Factory.Test_Items testItems = DGF_Test_Fixture_Factory.createTestItems();
        
        Test.startTest();
        Set<Id> res = DGF_Utilities.getSiteIdsForEvc(testItems.EVCs[0]);
        Test.stopTest();
    }
    
}