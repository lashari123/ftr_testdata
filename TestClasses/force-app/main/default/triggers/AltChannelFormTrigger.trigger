trigger AltChannelFormTrigger on Alt_Channel_Form__c (after delete, after insert, after undelete, after update, before delete, before insert, before update) {

    TriggerDispatcher.Run(new AltChannelFormTriggerHandler());
    
}