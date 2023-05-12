/********************************************************************************************
Name : EVC_TriggerHandler
Created By : Ken Dickinson (ken.dickinson@ftr.com)
Created Date : October 19, 2018
Description :  UNI trigger handler which removes unused EVC UNI Junction Objects after UNI delete
********************************************************************************************/

public with sharing class EVC_TriggerHandler  implements ITriggerHandler
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
        if (TriggerSettings__c.getOrgDefaults().DGF_EVC_Trigger__c)
            return true;
        else
            return TriggerDisabled;
    }
    
    public void BeforeInsert(List<SObject> newItems) {}
 
    public void BeforeUpdate(Map<Id, SObject> newItems, Map<Id, SObject> oldItems) {}
 
    public void BeforeDelete(Map<Id, SObject> oldItems) {}
    
    public void AfterInsert(Map<Id, SObject> newItems) {
        //EVC__c newEvc = (EVC__c)newItems.values()[0];
        //DGF_Utilities.updateAllCnlSpeedsInDgf(newEvc.DGF__c);
    }
 
    public void AfterUpdate(Map<Id, SObject> newItems, Map<Id, SObject> oldItems) {
        //EVC__c newEvc = (EVC__c)newItems.values()[0];
        //DGF_Utilities.updateAllCnlSpeedsInDgf(newEvc.DGF__c);
    }
 
    public void AfterDelete(Map<Id, SObject> oldItems) {
        DGF_Utilities.DeleteOldEvcUniJunctions();
    }
 
    public void AfterUndelete(Map<Id, SObject> oldItems) {}
}