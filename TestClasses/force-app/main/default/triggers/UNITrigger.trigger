trigger UNITrigger on UNI__c (after delete, after insert, after undelete, after update, before delete, before insert, before update) {
	TriggerDispatcher.run(new UNI_TriggerHandler());
}