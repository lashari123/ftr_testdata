@isTest(seeAllData = true)
public class ChurnItemControllerTest {
 
    public static testMethod void testChurnItemController() {
        List<Churn_Item__c> testChurnList = [SELECT id, ChurnAnalysisTicket__c FROM Churn_Item__c WHERE ChurnAnalysisTicket__c != null LIMIT 1];
    
        ApexPages.currentPage().getParameters().put('retURL',testChurnList[0].ChurnAnalysisTicket__c);
        
        ApexPages.StandardSetController ssc = new ApexPages.StandardSetController(testChurnList);
        
        ChurnItemController customController = new ChurnItemController(ssc);
         
        customController.verifySelectedChurnItems();
    }
}