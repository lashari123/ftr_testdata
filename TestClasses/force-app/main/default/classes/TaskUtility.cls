/********************************************************************************************
Name : TaskUtility
Created By : Mohan Talluri (mohan.talluri@ftr.com)
Created Date : May 31, 2016
Description :  Utility to support Task Trigger Handler.
********************************************************************************************/

public with sharing class TaskUtility {

  private static Map<ID, Schema.RecordTypeInfo> rtMap = Schema.SObjectType.Task.getRecordTypeInfosById();
  
  
  
  public static void updateAccountRLDates(Map<Id, SObject> newItems)
  {
    boolean isUpdated;
    List<Account> accList = new List<Account>();
    System.debug('MOHAN: In updateAccountRLDates Method');
    
    for (Task obj : (List<Task>) newItems.values()){

       isUpdated = false;
       System.debug('MOHAN: TASK OBJECT DETAILS = '+obj);
       System.debug('MOHAN: Related To [Object] = '+obj.What.Type);
       
       if ( ((obj!=null) && (obj.What.Type != null) && (obj.WhatId != null) && (obj.What.Type.equals('Account'))) || ((obj!=null) && (obj.WhatId != null) && (String.valueOf(obj.WhatId).startswith('001'))) )
       {
            System.debug('MOHAN: It is ACCOUNT');
            Account acc = null;
            try {
            
               acc = [Select Id, Name, Agent_Profile_Date_Submitted__c, Collections_Review_Date_Submitted__c from Account where Id = :obj.WhatId LIMIT 1];
            
            }catch(Exception e) {
              System.debug('MOHAN :: EXCEPTION THROWN...');
            }
            
            if  (acc != null){
                if(obj.Subject != null && obj.Subject.indexOf('Agent Profile, Response Needed') != -1)
                {
                  acc.Agent_Profile_Date_Submitted__c = obj.ActivityDate;
                  isUpdated = true;
                  System.debug('MOHAN: Agent Profile submitted');
                }
                
                if(obj.Subject != null && obj.Subject.indexOf('Collections Screening Requested, Response Needed') != -1)
                {
                  acc.Collections_Review_Date_Submitted__c = obj.ActivityDate;
                  isUpdated = true;
                  System.debug('MOHAN: Collections Review submitted');
                }
                
                if (isUpdated)
                  accList.add(acc);
           } 
       }

    }
    System.debug('MOHAN: accList size getting udpated = '+accList.size());
    if (!accList.isEmpty())
      update accList;   
  }
  
  public static void updateRFPTask(Map<Id, SObject> newItems)
  {
        List<rfp_task__c> rfptaskList = new List<rfp_task__c>();
        rfp_task__c rfptask;
        String rname = null;
        
        for(Id key : newItems.keySet()) {
            
            Task tsk = (Task) newItems.get(key);
            
            if ((tsk != null) && (tsk.RecordTypeId == null) && (tsk.RecordType != null))
                rname = tsk.RecordType.Name;
            else if(tsk.RecordTypeId != null)
                rname = rtMap.get(tsk.RecordTypeId).getName();
            
            system.debug('=====Record Type====='+tsk.recordtype.name);
            system.debug('=====RName====='+rname);
            system.debug('=====ID====='+tsk.id);
            
            if (rname != null && rname.equals('RFP Task')) {
                
                system.debug('++++++++++++=====in the loop=====+++++++++++++');
                rfptask = [SELECT ID, AccountId__c, Assigned_ToID__c, Comments__c, Due_Date__c, Related_To__c, RFP_Coordinator__c, Status__c, Subject__c, Task_ID__c FROM rfp_task__c WHERE Task_ID__c = :tsk.id LIMIT 1];
                
                system.debug('=====rfpTask====='+rfptask);
                if(rfptask != null){
                    rfptask.Comments__c = tsk.Description;
                    rfptask.Due_Date__c = tsk.ActivityDate;
                    rfptask.Case__c = tsk.WhatID;
                    rfptask.Status__c = tsk.Status;
                    rfptask.Subject__c = tsk.Subject;
                    rfptaskList.add(rfptask);
                }
            }
        }
        
        system.debug('+++++++++++++++++++++++++++++ - rfptaskList Size'+rfptaskList.size());
        
        if (!rfptaskList.isEmpty()) 
         update rfptaskList;
  }  

}