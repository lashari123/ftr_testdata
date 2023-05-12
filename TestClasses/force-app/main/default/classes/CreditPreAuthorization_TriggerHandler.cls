public with sharing class CreditPreAuthorization_TriggerHandler implements ITriggerHandler
{
    public static Boolean TriggerDisabled = false;
 
    public Boolean IsDisabled()
    {
        //if (TriggerSettings__c.AccountTriggerDisabled__c = true)
        //    return true;
        //else
            return TriggerDisabled;
    }
 
    public void BeforeInsert(List<SObject> newItems) {
        CreditPreAuthorizationUtility.updateManager((List<Credit_PreAuthorization__c>)newItems);
    }
 
    public void BeforeUpdate(Map<Id, SObject> newItems, Map<Id, SObject> oldItems) {}
 
    public void BeforeDelete(Map<Id, SObject> oldItems) {}
 
    public void AfterInsert(Map<Id, SObject> newItems) {}
 
    public void AfterUpdate(Map<Id, SObject> newItems, Map<Id, SObject> oldItems) {}
 
    public void AfterDelete(Map<Id, SObject> oldItems) {}
 
    public void AfterUndelete(Map<Id, SObject> oldItems) {}
}