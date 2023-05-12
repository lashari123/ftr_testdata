@IsTest
public class DGF_Create_Multiple_Sites_Test {
    public static TestMethod Void createMultipleSitesTest() {
        Integer numSites = 5;
        
        Opportunity opp = new Opportunity(Name = 'Test 1', StageName = 'Investigating', CloseDate = Date.today());
        insert opp;        
        
        DGF__c dgf = new DGF__c(Opportunity__c = opp.Id, 
                                Product_Requested2__c = 'ELINE', 
                                Customer_Contact_Email__c = 'test@ftr.com', 
                                Customer_Contact_Phone__c = '5555555555',
                                Customer_Contact__c = 'test tester');
        insert dgf;
        
        List<String> params = new List<String> {String.valueOf(numSites), dgf.Id};
            
            List<List<String>> paramsWrapper = new List<List<String>> {params};
                
                DGF_Create_Multiple_Sites.createMultipleSites(paramsWrapper);
        
        List<Physical_Site__c> result = [SELECT Id, Name, Maintenance_Contact__c, Site_Contact__c FROM Physical_Site__c WHERE DGF__c = :dgf.Id];
        system.assert(result.size() == 5);
    }
}