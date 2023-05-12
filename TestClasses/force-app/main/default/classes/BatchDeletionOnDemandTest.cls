@isTest(seeAllData = true)
public class BatchDeletionOnDemandTest {
    public static testMethod void testBatchDeletionOnDemand() {
        Deduplication_Config__c dc = [SELECT id, name, Object_API_Name__c, Comparison_Fields__c, Last_Execution__c, Ignore_Case__c, Ignore_No_Data_Comparisons__c FROM Deduplication_Config__c ORDER BY CreatedDate ASC LIMIT 1];
        
        ApexPages.currentPage().getParameters().put('massDeletionObj', 'DuplicateRecord__c');
        ApexPages.currentPage().getParameters().put('deletionField', 'Master_Deduplication_Config__c');
        ApexPages.currentPage().getParameters().put('deletionValue', dc.Id+'');
        ApexPages.currentPage().getParameters().put('followUpObject', 'Deduplication_Config__c');
        ApexPages.currentPage().getParameters().put('followUpField', 'Id');
        ApexPages.currentPage().getParameters().put('followUpValue', dc.Id+'');

        BatchDeletionOnDemand testBDOD = new BatchDeletionOnDemand();
        testBDOD.executeBatchDeletion();
    }
}