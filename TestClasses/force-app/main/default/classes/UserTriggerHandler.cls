/********************************************************************************************
Name : UserTriggerHandler
Created By : Mohan Talluri (mohan.talluri@ftr.com)
Created Date : April 28, 2016
Description :  User trigger handler which does the following
********************************************************************************************/

public with sharing class UserTriggerHandler implements ITriggerHandler
{
    // If you intend to stop this trigger from firing while in a unit test, you could just add the following code to the test:
    // UserTriggerHandler.TriggerDisabled = true;
    
    // Allows unit tests (or other code) to disable this trigger for the transaction
    public static Boolean TriggerDisabled = false;
 
    /*
        Checks to see if the trigger has been disabled either by custom setting or by running code
    */
    public Boolean IsDisabled()
    {
        if (TriggerSettings__c.getOrgDefaults().UserTriggerDisabled__c)
            return true;
        else
            return TriggerDisabled;
    }
 
    public void BeforeInsert(List<SObject> newItems) {
        UserUtility.beforeInsertLogic(newItems);
    }
 
    public void BeforeUpdate(Map<Id, SObject> newItems, Map<Id, SObject> oldItems) {
        UserUtility.beforeUpdateLogic(newItems.values(), oldItems.values());
    }
 
    public void BeforeDelete(Map<Id, SObject> oldItems) {}
 
    public void AfterInsert(Map<Id, SObject> newItems) {
        UserUtility.afterLogic((Map<Id, User>) newItems, null, newItems.keySet());
    }
 
    public void AfterUpdate(Map<Id, SObject> newItems, Map<Id, SObject> oldItems) {
        UserUtility.afterLogic((Map<Id, User>) newItems, (Map<Id, User>) oldItems, newItems.keySet());
    }
 
    public void AfterDelete(Map<Id, SObject> oldItems) {}
 
    public void AfterUndelete(Map<Id, SObject> oldItems) {}
}