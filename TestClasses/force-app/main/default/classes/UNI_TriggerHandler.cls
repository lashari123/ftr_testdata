/********************************************************************************************
Name : UNI_TriggerHandler
Created By : Ken Dickinson (ken.dickinson@ftr.com)
Created Date : Octobr 10, 2018
Description :  UNI trigger handler which does the following

1. 	If UNI__c.Speed * UNI_OverSubscribeValue < EVC Aggregate Bandwidth, sets 
	UNI__c.BandwidthOverrun	to true
Removed: 10.17.18 - using calculated value instead of saved value
********************************************************************************************/

public with sharing class UNI_TriggerHandler  implements ITriggerHandler
{
    // If you intend to stop this trigger from firing while in a unit test, you could just add the following code to the test:
    // UNI_TriggerHandler.TriggerDisabled = true;
    
    // Allows unit tests (or other code) to disable this trigger for the transaction
    public static Boolean TriggerDisabled = false;
 
    /*
        Checks to see if the trigger has been disabled either by custom setting or by running code
    */
    public Boolean IsDisabled()
    {
        if (TriggerSettings__c.getOrgDefaults().DGF_UNI_Trigger__c)
            return true;
        else
            return TriggerDisabled;
    }
    
    public void BeforeInsert(List<SObject> newItems) {
        /*System.debug('Before Invoking insertHierarchy');
        System.debug('insertHierarchy Processed');
*/
    }
 
    public void BeforeUpdate(Map<Id, SObject> newItems, Map<Id, SObject> oldItems) {
        /*System.debug('Before Invoking updateHierarchy');
        System.debug('updateHierarchy Processed');*/
    }
 
    public void BeforeDelete(Map<Id, SObject> oldItems) {}
 
    public void AfterInsert(Map<Id, SObject> newItems) {}
 
    public void AfterUpdate(Map<Id, SObject> newItems, Map<Id, SObject> oldItems) {}
 
    public void AfterDelete(Map<Id, SObject> oldItems) {
        DGF_Utilities.DeleteOldEvcUniJunctions();
    }
 
    public void AfterUndelete(Map<Id, SObject> oldItems) {}
}