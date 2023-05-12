trigger BillingDetailTrigger on Billing_Detail_2__c (after delete, after insert, after undelete, after update, before delete, before insert, before update) {

     TriggerDispatcher.Run(new BillingDetailTriggerHandler());
     
}