@isTest(seeAllData = true)
public class DeduplicationValidationController_Test {
    @IsTest
    public static void DeduplicationValidationController_Test() {

       Deduplication_Config__c dedupes = [SELECT Id, name, Object_API_Name__c, Comparison_Fields__c, Last_Execution__c, Ignore_Case__c, Ignore_No_Data_Comparisons__c FROM Deduplication_Config__c LIMIT 1 ];
        
        DeduplicationValidationController.dedupConfigValidation(dedupes.Id);
       
            Deduplication_Criterion__c CRITERIA = [SELECT id, Master_Deduplication_Config__c FROM Deduplication_Criterion__c  where Comparison_Value__c != null LIMIT 1];
        DeduplicationValidationController.dedupConfigValidation(CRITERIA.Master_Deduplication_Config__c);
    }

}