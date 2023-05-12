@isTest
public class DGF_Test_Fixture_Factory {
    
    public class Test_Items {
        public Opportunity Opp;
        public DGF__c DGF;
        public List<Physical_Site__c> Sites;
        public List<UNI__c> UNIs;
        public List<EVC__c> EVCs;
        public List<EVC_UNI_Association__c> Junctions;
    }
    
    public static Opportunity createTestOpportunity() {
        Opportunity opp = new Opportunity(Name = 'Test 1', StageName = 'Investigating', CloseDate = Date.today());
        insert opp;
        return opp;
    }
    
    public static DGF__c createTestDGF(String product, Id oppId) {
        DGF__c dgf = new DGF__c(Name = 'TestDGF', 
                                Opportunity__c = oppId, 
                                Product_Requested2__c = product,
                                Customer_Contact__c = 'test tester',
                                Customer_Contact_Phone__c = '5555555555',
                                Customer_Contact_Email__c = 'test.tester@test.com');
        insert dgf;
        return dgf;
    }
    
    public static List<Physical_Site__c> createTestPhysicalSites(Integer numSites, Id dgfId) {
        List<Physical_Site__c> testSites = new List<Physical_Site__c>();
        for (Integer i = 0; i < numSites; i++) {
            testSites.add(new Physical_Site__c(Service_Address_Street__c = '80' + i + ' Central Expy S',
                                               Service_Address_City__c = 'Allen',
                                               Service_Address_State__c = 'TX',
                                               Service_Address_Postal_Code__c = '75013',
                                               DGF__c = dgfId));
        }
        insert testSites;
        return testSites;
    }
    
    public static List<EVC__c> createTestEVCs(Integer numEvcs, Id dgfId) {
        List<EVC__c> testEvcs = new List<EVC__c>();
        for (Integer i = 0; i < numEvcs; i++) {
            testEvcs.add(new EVC__c(Name = 'EVC' + i, Type__c = 'EIA', Subtype__c = 'Internet', Class_of_Service__c = 'Silver', DGF__c = dgfId));
        }
        insert testEvcs;
        return testEvcs;
    }
    
    public static List<UNI__c> createTestUNIs(Integer numUnis, Id psId, String tag, String medium, String speed) {
        List<UNI__c> testUnis = new List<UNI__c>();
        for (Integer i = 0; i < numUnis; i++) {
            testUnis.add(new UNI__c(Name = 'UNI' + i, 
                                    Physical_Site__c = psId, 
                                    Tag__c = tag, 
                                    Physical_Medium__c = medium, 
                                    Speed__c = speed));
        }
        insert testUnis;
        return testUnis;
    }
    
    public static List<EVC_UNI_Association__c> createTestJunctions(List<EVC__c> evcs, List<UNI__c> unis, Id dgfId) {
        List<EVC_UNI_Association__c> testJunctions = new List<EVC_UNI_Association__c>();
        for (EVC__c evc : evcs) {
            for (UNI__c uni : unis) {
                testJunctions.add(new EVC_UNI_Association__c(EVC__c = evc.Id, UNI__c = uni.Id, Dgf_Id__c = dgfId));
            }
        }
        insert testJunctions;
        return testJunctions;
    }
    
    public static Test_Items createTestItems() {
        Test_Items testItems = new Test_Items();
        testItems.Opp = createTestOpportunity();
        testItems.DGF = createTestDGF('ELINE', testItems.opp.Id);
        testItems.Sites = createTestPhysicalSites(2, testItems.dgf.Id);
        testItems.UNIs = createTestUNIs(1, testItems.sites[0].Id, 'Service Multiplexing', 'Fiber Singlemode 1310nm' , '10000');
        testItems.UNIs.add(createTestUNIs(1, testItems.sites[1].Id, 'Service Multiplexing', 'Fiber Singlemode 1310nm' , '10000')[0]);
        testItems.EVCs = createTestEVCs(2, testItems.dgf.Id);
        testItems.Junctions = createTestJunctions(testItems.evcs, testItems.unis, testItems.dgf.Id);
        return testItems;
    }
}