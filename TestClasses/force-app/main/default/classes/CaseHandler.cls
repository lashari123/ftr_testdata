public with sharing class CaseHandler implements ITriggerHandler {

    // If you intend to stop this trigger from firing while in a unit test, you could just add the following code to the test:
    // CaseHandler.TriggerDisabled = true;
    
    // Allows unit tests (or other code) to disable this trigger for the transaction
    public static Boolean TriggerDisabled = false;
 
    /*
        Checks to see if the trigger has been disabled either by custom setting or by running code
    */
    public Boolean IsDisabled()
    {
       // if (TriggerSettings__c.CaseTriggerDisabled__c = true)
       //     return true;
       // else
            return TriggerDisabled;
    }

    public void BeforeInsert(List<SObject> newItems) {
          CaseUtility.salesReviewCase(newItems, null);
    }
 
    public void BeforeUpdate(Map<Id, SObject> newItems, Map<Id, SObject> oldItems) {
          CaseUtility.assignCaseOwner(newItems);
          CaseUtility.salesReviewCase(newItems.values(), oldItems);       
    }
 
    public void BeforeDelete(Map<Id, SObject> oldItems) {}
 
    public void AfterInsert(Map<Id, SObject> newItems) {
        CaseUtility.insertCaseTeamMembers(newItems);    
    }
 
    public void AfterUpdate(Map<Id, SObject> newItems, Map<Id, SObject> oldItems) {}
 
    public void AfterDelete(Map<Id, SObject> oldItems) {}
 
    public void AfterUndelete(Map<Id, SObject> oldItems) {}
}