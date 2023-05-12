@isTest(seeAllData = true)
public class DeduplicationConfigUtilityTest {
    public static testMethod void testDeduplicationConfigUtility() {
        Deduplication_Config__c dc = [SELECT id, name, Object_API_Name__c, Comparison_Fields__c, Last_Execution__c, Ignore_Case__c, Ignore_No_Data_Comparisons__c FROM Deduplication_Config__c ORDER BY CreatedDate ASC LIMIT 1];

        Deduplication_Config__c testDC = dc;
        testDC.Id = null;
        
        try {
            insert testDC;
        } catch(Exception e) {
            //do nothing
        }
        
        Deduplication_Config__c testDC2 = dc;
        testDC2.Object_API_Name__c = testDC2.Object_API_Name__c + 'TestFailure';
        try {
            update testDC2;
        } catch(Exception e) {
            //do nothing
        }
        
        Deduplication_Config__c testDC3 = dc;
        testDC3.Last_Execution__c = System.Now();
        try {
            update testDC3;
        } catch(Exception e) {
            //do nothing
        }
        
        dc = [SELECT id, name, Object_API_Name__c, Comparison_Fields__c, Last_Execution__c, Ignore_Case__c, Ignore_No_Data_Comparisons__c FROM Deduplication_Config__c ORDER BY CreatedDate ASC LIMIT 1];
        dc.Last_Execution__c = System.Now();
        update dc;
         
        delete dc;
    }
}