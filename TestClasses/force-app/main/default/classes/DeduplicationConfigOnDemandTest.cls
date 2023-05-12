@isTest(seeAllData = true)
public class DeduplicationConfigOnDemandTest {
    public static testMethod void testDeduplicationConfigOnDemand() {
        Deduplication_Config__c dc = [SELECT id, name, Object_API_Name__c, Comparison_Fields__c, Last_Execution__c, Ignore_Case__c, Ignore_No_Data_Comparisons__c, Non_Comparison_Fields__c FROM Deduplication_Config__c ORDER BY CreatedDate ASC LIMIT 1];
         
        ApexPages.StandardController stdCntllr = new ApexPages.StandardController(dc);
        DeduplicationConfigOnDemand deduplicationConfigOnDemandController = new DeduplicationConfigOnDemand(stdCntllr);
         
        deduplicationConfigOnDemandController.executeDeduplicationScan();
    }
}