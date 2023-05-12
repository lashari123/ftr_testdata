/********************************************************************************************
Name : DocuSignRecipientStatusTriggerHandler
Created By : Mohan Talluri (mohan.talluri@ftr.com)
Created Date : June 13, 2016
Description :  DocuSignRecipientStatus trigger handler which does the following

1. Update Promo Status field in Contract, Opportunity, Schedule to Sent, Received, 
   Reminder, Return. Expired status id updated using updateDocStatustoExpire trigger
   on Docusign Status(dsfs__DocuSign_Status__c) Object.
********************************************************************************************/


public with sharing class DocuSignRecipientStatusTriggerHandler implements ITriggerHandler
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
        DocuSignRecipientStatusUtility.updateDocStatus((List<dsfs__DocuSign_Recipient_Status__c>)newItems);
    }
 
    public void BeforeUpdate(Map<Id, SObject> newItems, Map<Id, SObject> oldItems) {
        DocuSignRecipientStatusUtility.updateDocStatus((List<dsfs__DocuSign_Recipient_Status__c>)newItems.values());
    }
 
    public void BeforeDelete(Map<Id, SObject> oldItems) {}
 
    public void AfterInsert(Map<Id, SObject> newItems) {}
 
    public void AfterUpdate(Map<Id, SObject> newItems, Map<Id, SObject> oldItems) {}
 
    public void AfterDelete(Map<Id, SObject> oldItems) {}
 
    public void AfterUndelete(Map<Id, SObject> oldItems) {}
}