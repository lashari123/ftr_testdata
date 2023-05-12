@isTest(seeAllData = true)
public class BatchDeletionTest {
    public static testMethod void testBatchDeletion() {

        List<Deduplication_Config__c> dedupes = new List<Deduplication_Config__c>();
        dedupes = [SELECT id, name, Object_API_Name__c, Comparison_Fields__c, Last_Execution__c, Ignore_Case__c, Ignore_No_Data_Comparisons__c FROM Deduplication_Config__c ORDER BY CreatedDate ASC];
        
        BatchDeletion bd = new BatchDeletion('DuplicateRecord__c', 'Master_Deduplication_Config__c', dedupes[0].Id, 'Deduplication_Config__c', 'Id', dedupes[0].Id);
        Id batchprocessid = Database.executeBatch(bd);
    }
}