/********************************************************************************************
Name : AssetCTriggerHandler
Created By : Mohan Talluri (mohan.talluri@ftr.com)
Created Date : March 5, 2016
Description :  AssetC trigger handler which does the following

1. Before inserting we do a lookup on Account to fetch TNSequenceId__c corresponding ID to 
update the record.
********************************************************************************************/

public with sharing class AssetCTriggerHandler implements ITriggerHandler
{
    // If you intend to stop this trigger from firing while in a unit test, you could just add the following code to the test:
    // AssetCTriggerHandler.TriggerDisabled = true;
    
    // Allows unit tests (or other code) to disable this trigger for the transaction
    public static Boolean TriggerDisabled = false;
 
    /*
        Checks to see if the trigger has been disabled either by custom setting or by running code
    */
    public Boolean IsDisabled()
    {
        if (TriggerSettings__c.getOrgDefaults().AccountTriggerDisabled__c)
            return true;
        else
            return TriggerDisabled;
    }
 
    public void BeforeInsert(List<SObject> newItems) {
        AssetUtility.fetchAccountId(newItems);
    }
 
    public void BeforeUpdate(Map<Id, SObject> newItems, Map<Id, SObject> oldItems) {
      AssetUtility.fetchAccountId(newItems.values());
    }
 
    public void BeforeDelete(Map<Id, SObject> oldItems) {}
 
    public void AfterInsert(Map<Id, SObject> newItems) {}
 
    public void AfterUpdate(Map<Id, SObject> newItems, Map<Id, SObject> oldItems) {}
 
    public void AfterDelete(Map<Id, SObject> oldItems) {}
 
    public void AfterUndelete(Map<Id, SObject> oldItems) {}
}