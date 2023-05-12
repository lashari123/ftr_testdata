public class DGF_Create_Multiple_Sites {
    @InvocableMethod(label='Create Multiple Sites' description='Creates multiple phyiscal site records')
    public static Void createMultipleSites(List<List<String>> params) {
        // uses list of string for params
        // item 1 should always be an integer as string
        // item 2 should always be the DGF Id
        Integer numSites = Integer.valueOf(params[0][0]);
        DGF__c dgf = [SELECT Id, Name, Global_Maintenance_Contact__c, Global_Site_Contact__c FROM DGF__c WHERE Id = :params[0][1] LIMIT 1];
        DGF_Utilities.handleCreateMultipleSites(numSites, dgf);
    }
}