public with sharing class ChurnItemController
{
    private ApexPages.StandardSetController standardController;

    public ChurnItemController(ApexPages.StandardSetController standardController)
    {
        this.standardController = standardController;
    }
    
    public PageReference verifySelectedChurnItems() {
        List<Churn_Item__c> churnItemsToUpdate = new List<Churn_Item__c>();
        
        List<Churn_Item__c> SelectedChurnItems = (List<Churn_Item__c>) standardController.getSelected();
        
        for(Churn_Item__c ci : SelectedChurnItems) {
            ci.Verified__c = true;
            churnItemsToUpdate.add(ci);
        }
        
        update churnItemsToUpdate;
        
        PageReference returnPage = new PageReference(ApexPages.currentPage().getParameters().get('retURL'));
        
        return returnPage;
    }
}