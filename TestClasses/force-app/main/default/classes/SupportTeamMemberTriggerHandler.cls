/********************************************************************************************
Name : SupportTeamMemberTriggerHandler
Created By : Mohan Talluri (mohan.talluri@ftr.com)
Created Date : June 10, 2016
Description :  SupportTeamMember trigger handler which does the following

1. The purpose of this code is to update the name of the record to match the name 
   of the user within the lookup field.  This trigger works in tandum with the 
   visualforce page: Support Team Member - Edit to give the presentation that the 
   user was seeking.
********************************************************************************************/

public with sharing class SupportTeamMemberTriggerHandler implements ITriggerHandler {
    public static Boolean TriggerDisabled = false;
 
    public Boolean IsDisabled()
    {
        if (TriggerSettings__c.getOrgDefaults().SupportTeamMemberTriggerDisabled__c)
            return true;
        else
            return TriggerDisabled;
    }
 
    public void BeforeInsert(List<SObject> newItems) {
        SupportTeamMemberUtility.matchUserRecord((List<Support_Team_Member__c>)newItems);
    }
 
    public void BeforeUpdate(Map<Id, SObject> newItems, Map<Id, SObject> oldItems) {
        SupportTeamMemberUtility.matchUserRecord((List<Support_Team_Member__c>)newItems.values());
    }
 
    public void BeforeDelete(Map<Id, SObject> oldItems) {}
 
    public void AfterInsert(Map<Id, SObject> newItems) {
        SupportTeamMemberUtility.updateContractRenewalCaseOwner(newItems);
    }
 
    public void AfterUpdate(Map<Id, SObject> newItems, Map<Id, SObject> oldItems) {
        SupportTeamMemberUtility.updateContractRenewalCaseOwner(newItems);
    }
 
    public void AfterDelete(Map<Id, SObject> oldItems) {
        SupportTeamMemberUtility.updateContractRenewalCaseOwner(oldItems);
    
    }
 
    public void AfterUndelete(Map<Id, SObject> oldItems) {}
}