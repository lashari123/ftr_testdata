trigger EVC_Trigger on EVC__c (after delete, after insert, after undelete, after update, before delete, before insert, before update) {
	TriggerDispatcher.run(new EVC_TriggerHandler());
}