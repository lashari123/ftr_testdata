trigger DeduplicationConfigTrigger on Deduplication_Config__c (before insert,before update,before delete,after insert,after update,after delete,after undelete) {

    if(trigger.isBefore){

        if(trigger.isInsert){
            //DeduplicationConfigUtility.checkDedupConfigCorrectness(trigger.new);
            DeduplicationConfigUtility.ensureNameUniqueness(trigger.new);
        }else if(trigger.isUpdate){
            //DeduplicationConfigUtility.checkDedupConfigCorrectness(trigger.new);
            DeduplicationConfigUtility.ensureNameUniqueness(trigger.new);
        }else if(trigger.isDelete){

        }

    }else if(trigger.isAfter){

        if(trigger.isInsert){

        }else if(trigger.isUpdate){

        }else if(trigger.isDelete){

        }else if(trigger.isUndelete){

        }
    }
}