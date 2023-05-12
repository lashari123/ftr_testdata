trigger OrderTrigger on Order(before insert,before update,before delete,after insert,after update,after delete,after undelete) {


if(trigger.isBefore){

if(trigger.isInsert){
    OrderUtility.assignBroadbandQueue(trigger.new);

}else if(trigger.isUpdate){
    OrderUtility.assignBroadbandQueue(trigger.new);

}else if(trigger.isDelete){

}

}else if(trigger.isAfter){

if(trigger.isInsert){

}else if(trigger.isUpdate){
    RetreievSupportTeamDetails.getEmails(trigger.new,trigger.oldMap);
    OrderUtility.reassignNetworkCOE(trigger.new, trigger.oldMap);
    OrderUtility.reassignCPECOE(trigger.new, trigger.oldMap);
    OrderUtility.reassignApprovalOwner(trigger.new, trigger.oldMap);


}else if(trigger.isDelete){

}else if(trigger.isUndelete){

}

}
}