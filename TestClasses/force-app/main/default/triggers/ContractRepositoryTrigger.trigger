trigger ContractRepositoryTrigger on Contract_Repository__c (after delete, after insert, after undelete, after update, before delete, before insert, before update) {

    TriggerDispatcher.Run(new ContractRepositoryTriggerHandler());
    
}