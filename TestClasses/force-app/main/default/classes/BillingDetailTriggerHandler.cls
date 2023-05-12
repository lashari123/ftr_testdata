/********************************************************************************************
Name : BillingDetailTriggerHandler
Created By : Mohan Talluri (mohan.talluri@ftr.com)
Created Date : June 13, 2016
********************************************************************************************/

public with sharing class BillingDetailTriggerHandler implements ITriggerHandler
{
    public static Boolean TriggerDisabled = false;
 
    public Boolean IsDisabled()
    {
        if (TriggerSettings__c.getOrgDefaults().BillingDetailTriggerDisabled__c)
            return true;
        else
            return TriggerDisabled;
    }
 
    public void BeforeInsert(List<SObject> newItems) {}
 
    public void BeforeUpdate(Map<Id, SObject> newItems, Map<Id, SObject> oldItems) {}
 
    public void BeforeDelete(Map<Id, SObject> oldItems) {}
 
    public void AfterInsert(Map<Id, SObject> newItems) {
        BillingDetailUtility.deleteBd((List<Billing_Detail_2__c>)newItems.values());
    }
 
    public void AfterUpdate(Map<Id, SObject> newItems, Map<Id, SObject> oldItems) {}
 
    public void AfterDelete(Map<Id, SObject> oldItems) {}
 
    public void AfterUndelete(Map<Id, SObject> oldItems) {}
}