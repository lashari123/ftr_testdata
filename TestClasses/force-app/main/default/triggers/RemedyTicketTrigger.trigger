trigger RemedyTicketTrigger on Remedy_Ticket__c (before insert,after insert,before update,after update) {       
   
    string action = 'create';
    if(Trigger.isInsert && Trigger.isAfter){
         if(trigger.new[0].Access_Hours__c != null && trigger.new[0].Access_Hours__c != '')
        RemedySubmitTroubleTicket.submitTicket(Trigger.new[0].Id, 'RequestTroubleReportCreationRequest',action);
    }
    
    if(Trigger.isUpdate && Trigger.isAfter && !RemedySubmitTroubleTicket.isUpdate ){
       // && !ValidatorCls.hasAlreadyDone()ValidatorCls.setAlreadyDone();
        id ide = Trigger.new[0].Id;
        
        if(Trigger.new[0].Escalate_Reason__c != trigger.oldMap.get(ide).Escalate_Reason__c){
            action = 'escalation';
            RemedySubmitTroubleTicket.submitTicket(Trigger.new[0].Id, 'ModifyAttributeRequest',action);  
        }         
         else if(Trigger.new[0].Additional_Contact_Email_1__c != trigger.oldMap.get(ide).Additional_Contact_Email_1__c ||
           Trigger.new[0].Additional_Contact_Email_2__c != trigger.oldMap.get(ide).Additional_Contact_Email_2__c ||
            Trigger.new[0].Additional_Contact_Email_3__c != trigger.oldMap.get(ide).Additional_Contact_Email_3__c ||
            Trigger.new[0].Additional_Contact_Email_4__c != trigger.oldMap.get(ide).Additional_Contact_Email_4__c ||
            Trigger.new[0].Additional_Contact_Email_5__c != trigger.oldMap.get(ide).Additional_Contact_Email_5__c ||
            Trigger.new[0].Additional_Contact_Email_6__c != trigger.oldMap.get(ide).Additional_Contact_Email_6__c ||
            Trigger.new[0].Additional_Contact_Email_7__c != trigger.oldMap.get(ide).Additional_Contact_Email_7__c ||
            Trigger.new[0].Additional_Contact_Email_8__c != trigger.oldMap.get(ide).Additional_Contact_Email_8__c ||
            Trigger.new[0].Additional_Contact_Phone_1__c != trigger.oldMap.get(ide).Additional_Contact_Phone_1__c ||
            Trigger.new[0].Additional_Contact_Phone_2__c != trigger.oldMap.get(ide).Additional_Contact_Phone_2__c ||
            Trigger.new[0].Additional_Contact_Phone_3__c != trigger.oldMap.get(ide).Additional_Contact_Phone_3__c ||
            Trigger.new[0].Additional_Contact_Phone_4__c != trigger.oldMap.get(ide).Additional_Contact_Phone_4__c ||
            Trigger.new[0].Additional_Contact_Phone_5__c != trigger.oldMap.get(ide).Additional_Contact_Phone_5__c ||
            Trigger.new[0].Additional_Contact_Phone_6__c != trigger.oldMap.get(ide).Additional_Contact_Phone_6__c ||
            Trigger.new[0].Additional_Contact_Phone_7__c != trigger.oldMap.get(ide).Additional_Contact_Phone_7__c ||
            Trigger.new[0].Additional_Contact_Phone_8__c != trigger.oldMap.get(ide).Additional_Contact_Phone_8__c ||
            Trigger.new[0].Local_Contact_Name2__c != trigger.oldMap.get(ide).Local_Contact_Name2__c ||
            Trigger.new[0].Local_Contact_Phone2__c != trigger.oldMap.get(ide).Local_Contact_Phone2__c ||
            Trigger.new[0].	Local_Contact_Email2__c != trigger.oldMap.get(ide).Local_Contact_Email2__c ||
            Trigger.new[0].	LocalContactText__c != trigger.oldMap.get(ide).LocalContactText__c ||
            Trigger.new[0].	Is_Intrusive_Testing_Allowed__c != trigger.oldMap.get(ide).Is_Intrusive_Testing_Allowed__c ||
            Trigger.new[0].	Send_update__c != trigger.oldMap.get(ide).Send_update__c ||
            Trigger.new[0].	Local_Text_Send_Updates__c != trigger.oldMap.get(ide).Local_Text_Send_Updates__c ||
            Trigger.new[0].	Reported_By_Email__c != trigger.oldMap.get(ide).Reported_By_Email__c ||
            Trigger.new[0].	Reported_By_Text_Number__c != trigger.oldMap.get(ide).Reported_By_Text_Number__c ||
            Trigger.new[0].	Reported_By_Text_Send_Updates__c != trigger.oldMap.get(ide).Reported_By_Text_Send_Updates__c ||
            Trigger.new[0].	Reported_By_Send_Update__c != trigger.oldMap.get(ide).Reported_By_Send_Update__c ||
            Trigger.new[0].	Send_update_1__c != trigger.oldMap.get(ide).Send_update_1__c ||
            Trigger.new[0].	Send_update_2__c != trigger.oldMap.get(ide).Send_update_2__c ||
            Trigger.new[0].	Send_update_3__c != trigger.oldMap.get(ide).Send_update_3__c ||
            Trigger.new[0].	Send_update_4__c != trigger.oldMap.get(ide).Send_update_4__c ||
            Trigger.new[0].	Send_update_5__c != trigger.oldMap.get(ide).Send_update_5__c ||
            Trigger.new[0].	Send_update_6__c != trigger.oldMap.get(ide).Send_update_6__c ||
            Trigger.new[0].	Send_update_7__c != trigger.oldMap.get(ide).Send_update_7__c ||
            Trigger.new[0].	Send_update_8__c != trigger.oldMap.get(ide).Send_update_8__c ||
            Trigger.new[0].	Preferred_Contact_method__c != trigger.oldMap.get(ide).Preferred_Contact_method__c ||
            Trigger.new[0].	Preferred_Alternate_Start_Time__c != trigger.oldMap.get(ide).Preferred_Alternate_Start_Time__c ||
            Trigger.new[0].	Preferred_Alternate_End_time__c != trigger.oldMap.get(ide).Preferred_Alternate_End_time__c ||
            Trigger.new[0].	Access_Hours__c != trigger.oldMap.get(ide).Access_Hours__c ){
            	action = 'update';         
         		RemedySubmitTroubleTicket.submitTicket(Trigger.new[0].Id, 'ModifyAttributeRequest',action); 
                System.debug('Hemantha-1=========');
            }
    }
    
}