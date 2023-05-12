/********************************************************************************************
Name : AccountIDUnique1TriggerHandler
Created By : Mohan Talluri (mohan.talluri@ftr.com)
Created Date : June 13, 2016
********************************************************************************************/

public with sharing class AccountIDUnique1TriggerHandler implements ITriggerHandler {
    public static Boolean TriggerDisabled = false;
 
    /*
        Checks to see if the trigger has been disabled either by custom setting or by running code
    */
    public Boolean IsDisabled()
    {
        if (TriggerSettings__c.getOrgDefaults().AccountIDUnique1TriggerDisabled__c)
            return true;
        else
            return TriggerDisabled;
    }
 
    public void BeforeInsert(List<SObject> newItems) {}
 
    public void BeforeUpdate(Map<Id, SObject> newItems, Map<Id, SObject> oldItems) {}
 
    public void BeforeDelete(Map<Id, SObject> oldItems) {}
 
    public void AfterInsert(Map<Id, SObject> newItems) {
        AccountIDUnique1Utility.deleteBillDetail((List<AccountIDUnique1__c>) newItems.values());
    }
 
    public void AfterUpdate(Map<Id, SObject> newItems, Map<Id, SObject> oldItems) {}
 
    public void AfterDelete(Map<Id, SObject> oldItems) {}
 
    public void AfterUndelete(Map<Id, SObject> oldItems) {}
}