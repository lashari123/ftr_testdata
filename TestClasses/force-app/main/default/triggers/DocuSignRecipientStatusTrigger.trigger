trigger DocuSignRecipientStatusTrigger on dsfs__DocuSign_Recipient_Status__c (after delete, after insert, after undelete, after update, before delete, before insert, before update) {

    TriggerDispatcher.Run(new DocuSignRecipientStatusTriggerHandler());
    
}