trigger AccountIDUnique1Trigger on AccountIDUnique1__c (after delete, after insert, after undelete, after update, before delete, before insert, before update) {

    TriggerDispatcher.Run(new AccountIDUnique1TriggerHandler());    
    
}