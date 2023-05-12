@isTest(seeAllData = true)
public class BatchDeduplicationTest {
    public static testMethod void testBatchDeduplication() {

        List<Deduplication_Config__c> dedupes = new List<Deduplication_Config__c>();
        dedupes = [SELECT id, name, Object_API_Name__c, Comparison_Fields__c, Non_Comparison_Fields__c, Last_Execution__c, Ignore_Case__c, Ignore_No_Data_Comparisons__c FROM Deduplication_Config__c ORDER BY CreatedDate ASC];
        
        BatchDeduplication bd = new BatchDeduplication(dedupes[0]);
        Id batchprocessid = Database.executeBatch(bd);
    }
}