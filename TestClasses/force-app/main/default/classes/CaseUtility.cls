/********************************************************************************************
Name : CaseUtility
Created By : Mohan Talluri (mohan.talluri@ftr.com)
Created Date : June 09, 2016
Description :  Utility to support Case Trigger Handler.
********************************************************************************************/

public with sharing class CaseUtility {
    
    public static Map<ID, Schema.RecordTypeInfo> rtMap = Schema.SObjectType.Case.getRecordTypeInfosById();
    
    public static void assignCaseOwner(Map<Id, SObject> newItems){
        Case cse;
        for(sObject obj : newItems.values()){
           cse = (Case)obj;
           if(rtMap.get(cse.RecordTypeId).name == 'Directory Listing' &&  cse.Assigned_To__c != null)
              cse.OwnerId = cse.Assigned_To__c; 
        }
    }
    

    public static void insertCaseTeamMembers(Map<Id, SObject> newItems){
    
        CaseTeamRole role = [select Name from CaseTeamRole where Name = 'Originator'];
        List<CaseTeamMember> members = new List<CaseTeamMember>();
        system.debug('+++++++++++++++++++++++++++++ - role.Id '+role.Id);
        Case resource;
        
        for (Id key : newItems.keySet()) {
            
            resource = (Case) newItems.get(key);
            system.debug('+++++++++++++++++++++++++++++ - RFP_Format_Type__c - '+resource.RFP_Format_Type__c);
            
            if(!String.isEmpty(resource.RFP_Format_Type__c)){
                system.debug('+++++++++++++++++++++++++++++ - Going through flow');
                members.add(new CaseTeamMember(
                    ParentId = resource.Id,
                    MemberId = Userinfo.getUserId(),
                    TeamRoleId = role.Id
                ));
            }
            
        }
        
        system.debug('+++++++++++++++++++++++++++++ - members Size'+members.size());
        if (!members.isEmpty()) 
         insert members;    
    }


    public static void salesReviewCase(List<Case> newItems, Map<Id, SObject> oldMapItems){
    
      Case oldc;
      long duration;
       
      for(case c : newItems){
      
        oldc = null;
        if(c.id != null)
          oldc = (Case) oldMapItems.get(c.id);
        
        duration = null;
        
        if(c.id != null && c.stage__c != null && oldc.stage__c == null){
          system.debug('****************************** New Record');
          system.debug('****************************** Now'+datetime.now());
          c.last_Stage_Change__c = dateTime.now();
        }
        
        if(c.id != null && c.sub_Stage__c != null && oldc.sub_stage__c == null){
          system.debug('****************************** New Record');
          system.debug('****************************** Now'+datetime.now());
          c.last_Sub_Stage_Change__c = dateTime.now();
        } 
           
        if(c.id != null && oldc.stage__c == 'Discovery' && oldc.stage__c != c.stage__c && c.duration_Discovery__c == null){
          system.debug('trigger.old stage ******************************'+oldc.stage__c);
          system.debug('new stage ******************************'+c.stage__c);
          duration = datetime.now().getTime() - c.last_Stage_Change__c.getTime();  
          Long Seconds = duration/1000;
          Long minutes = seconds/60;
          Long hours = minutes / 60;
          long days = hours / 24;
          system.debug('Days  ******************************'+days);
          system.debug('hours  ******************************'+hours);
          system.debug('minutes  ******************************'+minutes);
          system.debug('seconds  ******************************'+seconds);
          String stringNewDuration = String.valueOf(hours)+'-H';
          system.debug('Duration  ******************************'+duration);
          c.duration_Discovery__c = stringNewDuration;
          c.last_Stage_Change__c = datetime.now();
        }
        
        if(c.id != null && oldc.stage__c == 'Referred' && oldc.stage__c != c.stage__c && c.duration_Referred__c == null){
          duration = datetime.now().getTime() - c.last_Stage_Change__c.getTime();
          Long Seconds = duration/1000;
          Long minutes = seconds/60;
          Long hours = minutes / 60;
          long days = hours / 24;
          String stringNewDuration = String.valueOf(hours)+'-H';
          c.duration_Referred__c = stringNewDuration;
          c.last_Stage_Change__c = datetime.now();
        }
        
        if(c.id != null && oldc.stage__c == 'Prefield' && oldc.stage__c != c.stage__c && c.duration_Prefield__c == null){
          duration = datetime.now().getTime() - c.last_Stage_Change__c.getTime();
          Long Seconds = duration/1000;
          Long minutes = seconds/60;
          Long hours = minutes / 60;
          long days = hours / 24;
          String stringNewDuration = String.valueOf(hours)+'-H';
          c.duration_Prefield__c = stringNewDuration;
          c.last_Stage_Change__c = datetime.now();
        }
        
        if(c.id != null && oldc.stage__c == 'Proposal' && oldc.stage__c != c.stage__c && c.duration_Proposal__c == null){
          duration = datetime.now().getTime() - c.last_Stage_Change__c.getTime();
          Long Seconds = duration/1000;
          Long minutes = seconds/60;
          Long hours = minutes / 60;
          long days = hours / 24;
          String stringNewDuration = String.valueOf(hours)+'-H';
          c.duration_Proposal__c = stringNewDuration;
          c.last_Stage_Change__c = datetime.now();
        }
        
        if(c.id != null && oldc.stage__c == 'Contract' && oldc.stage__c != c.stage__c && c.duration_Contract__c == null){
          duration = datetime.now().getTime() - c.last_Stage_Change__c.getTime();
          Long Seconds = duration/1000;
          Long minutes = seconds/60;
          Long hours = minutes / 60;
          long days = hours / 24;
          String stringNewDuration = String.valueOf(hours)+'-H';
          c.duration_Contract__c = stringNewDuration;
          c.last_Stage_Change__c = datetime.now();
        }
        
        if(c.id != null && oldc.stage__c == 'Leaseco' && oldc.stage__c != c.stage__c && c.duration_Leaseco__c == null){
          duration = datetime.now().getTime() - c.last_Stage_Change__c.getTime();
          Long Seconds = duration/1000;
          Long minutes = seconds/60;
          Long hours = minutes / 60;
          long days = hours / 24;
          String stringNewDuration = String.valueOf(hours)+'-H';
          c.duration_Leaseco__c = stringNewDuration;
          c.last_Stage_Change__c = datetime.now();
        }
        
        if(c.id != null && oldc.stage__c == 'Sold' && oldc.stage__c != c.stage__c && c.duration_Sold__c == null){
          duration = datetime.now().getTime() - c.last_Stage_Change__c.getTime();
          Long Seconds = duration/1000;
          Long minutes = seconds/60;
          Long hours = minutes / 60;
          long days = hours / 24;
          String stringNewDuration = String.valueOf(hours)+'-H';
          c.duration_Sold__c = stringNewDuration;
          c.last_Stage_Change__c = datetime.now();
        }
        
        if(c.id != null && oldc.Sub_Stage__c == 'CPE CoE Contacted Client' && oldc.Sub_Stage__c != c.Sub_Stage__c && c.duration_CPE_CoE_Contacted_Client__c == null){
          system.debug('trigger.old subStage ******************************'+oldc.Sub_Stage__c);
          system.debug('new subStage ******************************'+c.Sub_Stage__c);
          duration = datetime.now().getTime() - c.Last_Sub_Stage_Change__c.getTime();  
          Long Seconds = duration/1000;
          Long minutes = seconds/60;
          Long hours = minutes / 60;
          long days = hours / 24;
          system.debug('Days  ******************************'+days);
          system.debug('hours  ******************************'+hours);
          system.debug('minutes  ******************************'+minutes);
          system.debug('seconds  ******************************'+seconds);
          String stringNewDuration = String.valueOf(hours)+'-H';
          system.debug('Duration  ******************************'+duration);
          c.duration_CPE_CoE_Contacted_Client__c = stringNewDuration;
          c.Last_Sub_Stage_Change__c = datetime.now();
        }
        
        if(c.id != null && oldc.Sub_Stage__c == 'S/E Contacted via SERF Request if Applicable' && oldc.Sub_Stage__c != c.Sub_Stage__c && c.duration_S_E_Contacted_via_SERF_Reques__c == null){
          duration = datetime.now().getTime() - c.Last_Sub_Stage_Change__c.getTime();  
          Long Seconds = duration/1000;
          Long minutes = seconds/60;
          Long hours = minutes / 60;
          long days = hours / 24;
          String stringNewDuration = String.valueOf(hours)+'-H';
          c.duration_S_E_Contacted_via_SERF_Reques__c = stringNewDuration;
          c.Last_Sub_Stage_Change__c = datetime.now();
        }
        
        if(c.id != null && oldc.Sub_Stage__c == '24 hour post TTL referral Customer contact completed to valid contact Y/N' && oldc.Sub_Stage__c != c.Sub_Stage__c && c.duration_24_hour_post_TTL_referral__c == null){
          duration = datetime.now().getTime() - c.Last_Sub_Stage_Change__c.getTime();  
          Long Seconds = duration/1000;
          Long minutes = seconds/60;
          Long hours = minutes / 60;
          long days = hours / 24;
          String stringNewDuration = String.valueOf(hours)+'-H';
          c.duration_24_hour_post_TTL_referral__c = stringNewDuration;
          c.Last_Sub_Stage_Change__c = datetime.now();
        }
        
        if(c.id != null && oldc.Sub_Stage__c == '24 Hour Escalation to RSM Y/N' && oldc.Sub_Stage__c != c.Sub_Stage__c && c.duration_24_Hour_Escalation_to_RSM__c == null){
          duration = datetime.now().getTime() - c.Last_Sub_Stage_Change__c.getTime();  
          Long Seconds = duration/1000;
          Long minutes = seconds/60;
          Long hours = minutes / 60;
          long days = hours / 24;
          String stringNewDuration = String.valueOf(hours)+'-H';
          c.duration_24_Hour_Escalation_to_RSM__c = stringNewDuration;
          c.Last_Sub_Stage_Change__c = datetime.now();
        }
        
        if(c.id != null && oldc.Sub_Stage__c == '24 Hour Escalation to sales VP and Keith B - Y/N' && oldc.Sub_Stage__c != c.Sub_Stage__c && c.duration_24_Hour_Escalation_VP_Keith_B__c == null){
          duration = datetime.now().getTime() - c.Last_Sub_Stage_Change__c.getTime();  
          Long Seconds = duration/1000;
          Long minutes = seconds/60;
          Long hours = minutes / 60;
          long days = hours / 24;
          String stringNewDuration = String.valueOf(hours)+'-H';
          c.duration_24_Hour_Escalation_VP_Keith_B__c = stringNewDuration;
          c.Last_Sub_Stage_Change__c = datetime.now();
        }
        
        if(c.id != null && oldc.Sub_Stage__c == 'Quote Generated' && oldc.Sub_Stage__c != c.Sub_Stage__c && c.duration_Quote_Generated__c == null){
          duration = datetime.now().getTime() - c.Last_Sub_Stage_Change__c.getTime();  
          Long Seconds = duration/1000;
          Long minutes = seconds/60;
          Long hours = minutes / 60;
          long days = hours / 24;
          String stringNewDuration = String.valueOf(hours)+'-H';
          c.duration_Quote_Generated__c = stringNewDuration;
          c.Last_Sub_Stage_Change__c = datetime.now();
        }
        
        if(c.id != null && oldc.Sub_Stage__c == 'Budetary Proposal Provided to Customer' && oldc.Sub_Stage__c != c.Sub_Stage__c && c.Duration_Budetary_Proposal_Provided__c == null){
          duration = datetime.now().getTime() - c.Last_Sub_Stage_Change__c.getTime();  
          Long Seconds = duration/1000;
          Long minutes = seconds/60;
          Long hours = minutes / 60;
          long days = hours / 24;
          String stringNewDuration = String.valueOf(hours)+'-H';
          c.Duration_Budetary_Proposal_Provided__c = stringNewDuration;
          c.Last_Sub_Stage_Change__c = datetime.now();
        }
        
        if(c.id != null && oldc.Sub_Stage__c == 'Contract Provided to Client' && oldc.Sub_Stage__c != c.Sub_Stage__c && c.duration_Contract_Provided_to_Client__c == null){
          duration = datetime.now().getTime() - c.Last_Sub_Stage_Change__c.getTime();  
          Long Seconds = duration/1000;
          Long minutes = seconds/60;
          Long hours = minutes / 60;
          long days = hours / 24;
          String stringNewDuration = String.valueOf(hours)+'-H';
          c.duration_Contract_Provided_to_Client__c = stringNewDuration;
          c.Last_Sub_Stage_Change__c = datetime.now();
        }
        
        if(c.id != null && oldc.Sub_Stage__c == 'Credit Application provided to TAMCO' && oldc.Sub_Stage__c != c.Sub_Stage__c && c.Duration_Credit_App_provided_to_TAMCO__c == null){
          duration = datetime.now().getTime() - c.Last_Sub_Stage_Change__c.getTime();  
          Long Seconds = duration/1000;
          Long minutes = seconds/60;
          Long hours = minutes / 60;
          long days = hours / 24;
          String stringNewDuration = String.valueOf(hours)+'-H';
          c.Duration_Credit_App_provided_to_TAMCO__c = stringNewDuration;
          c.Last_Sub_Stage_Change__c = datetime.now();
        }
        
        if(c.id != null && oldc.Sub_Stage__c == 'TAMCO Agreement Provided' && oldc.Sub_Stage__c != c.Sub_Stage__c && c.duration_TAMCO_Agreement_Provided__c == null){
          duration = datetime.now().getTime() - c.Last_Sub_Stage_Change__c.getTime();  
          Long Seconds = duration/1000;
          Long minutes = seconds/60;
          Long hours = minutes / 60;
          long days = hours / 24;
          String stringNewDuration = String.valueOf(hours)+'-H';
          c.duration_TAMCO_Agreement_Provided__c = stringNewDuration;
          c.Last_Sub_Stage_Change__c = datetime.now();
        }
        
        if(c.id != null && oldc.Sub_Stage__c == 'DRN Received' && oldc.Sub_Stage__c != c.Sub_Stage__c && c.duration_DRN_Received__c == null){
          duration = datetime.now().getTime() - c.Last_Sub_Stage_Change__c.getTime();  
          Long Seconds = duration/1000;
          Long minutes = seconds/60;
          Long hours = minutes / 60;
          long days = hours / 24;
          String stringNewDuration = String.valueOf(hours)+'-H';
          c.duration_DRN_Received__c = stringNewDuration;
          c.Last_Sub_Stage_Change__c = datetime.now();
        }
        
        if(c.id != null && oldc.Sub_Stage__c == 'Customer returned Amendment to TAMCO' && oldc.Sub_Stage__c != c.Sub_Stage__c && c.Duration_Customer_returned_Amendment__c == null){
          duration = datetime.now().getTime() - c.Last_Sub_Stage_Change__c.getTime();  
          Long Seconds = duration/1000;
          Long minutes = seconds/60;
          Long hours = minutes / 60;
          long days = hours / 24;
          String stringNewDuration = String.valueOf(hours)+'-H';
          c.Duration_Customer_returned_Amendment__c = stringNewDuration;
          c.Last_Sub_Stage_Change__c = datetime.now();
        }
        
        if(c.id != null && oldc.Sub_Stage__c == 'Contract(s) Signed' && oldc.Sub_Stage__c != c.Sub_Stage__c && c.duration_Contracts_Signed__c == null){
          duration = datetime.now().getTime() - c.Last_Sub_Stage_Change__c.getTime();  
          Long Seconds = duration/1000;
          Long minutes = seconds/60;
          Long hours = minutes / 60;
          long days = hours / 24;
          String stringNewDuration = String.valueOf(hours)+'-H';
          c.duration_Contracts_Signed__c = stringNewDuration;
          c.Last_Sub_Stage_Change__c = datetime.now();
        }
        
        if(c.id != null && oldc.Sub_Stage__c == 'Service Order dropped in STATS' && oldc.Sub_Stage__c != c.Sub_Stage__c && c.duration_Service_Order_dropped_in_STAT__c == null){
          duration = datetime.now().getTime() - c.Last_Sub_Stage_Change__c.getTime();  
          Long Seconds = duration/1000;
          Long minutes = seconds/60;
          Long hours = minutes / 60;
          long days = hours / 24;
          String stringNewDuration = String.valueOf(hours)+'-H';
          c.duration_Service_Order_dropped_in_STAT__c = stringNewDuration;
          c.Last_Sub_Stage_Change__c = datetime.now();
        }
        
        if(c.id != null && oldc.Sub_Stage__c == 'added to WIP' && oldc.Sub_Stage__c != c.Sub_Stage__c && c.duration_added_to_WIP__c == null){
          duration = datetime.now().getTime() - c.Last_Sub_Stage_Change__c.getTime();  
          Long Seconds = duration/1000;
          Long minutes = seconds/60;
          Long hours = minutes / 60;
          long days = hours / 24;
          String stringNewDuration = String.valueOf(hours)+'-H';
          c.duration_added_to_WIP__c = stringNewDuration;
          c.Last_Sub_Stage_Change__c = datetime.now();
        }
        
        if(c.id != null && oldc.Sub_Stage__c == 'Billed' && oldc.Sub_Stage__c != c.Sub_Stage__c && c.duration_Billed__c == null){
          duration = datetime.now().getTime() - c.Last_Sub_Stage_Change__c.getTime();  
          Long Seconds = duration/1000;
          Long minutes = seconds/60;
          Long hours = minutes / 60;
          long days = hours / 24;
          String stringNewDuration = String.valueOf(hours)+'-H';
          c.duration_Billed__c = stringNewDuration;
          c.Last_Sub_Stage_Change__c = datetime.now();
        }
        
        if(c.id != null && oldc.Sub_Stage__c == 'Tech to verify scope of work' && oldc.Sub_Stage__c != c.Sub_Stage__c && c.Duration_Tech_To_Verify_Scope_Of_Work__c == null){
          duration = datetime.now().getTime() - c.Last_Sub_Stage_Change__c.getTime();  
          Long Seconds = duration/1000;
          Long minutes = seconds/60;
          Long hours = minutes / 60;
          long days = hours / 24;
          String stringNewDuration = String.valueOf(hours)+'-H';
          c.duration_Tech_To_Verify_Scope_Of_Work__c = stringNewDuration;
          c.Last_Sub_Stage_Change__c = datetime.now();
        }
        
        if(c.id != null && oldc.Sub_Stage__c == 'Signed Contract Received' && oldc.Sub_Stage__c != c.Sub_Stage__c && c.Duration_Signed_Contract_Received__c == null){
          duration = datetime.now().getTime() - c.Last_Sub_Stage_Change__c.getTime();  
          Long Seconds = duration/1000;
          Long minutes = seconds/60;
          Long hours = minutes / 60;
          long days = hours / 24;
          String stringNewDuration = String.valueOf(hours)+'-H';
          c.Duration_Signed_Contract_Received__c = stringNewDuration;
          c.Last_Sub_Stage_Change__c = datetime.now();
        }
        
        if(c.id != null && oldc.Sub_Stage__c == 'A/E' && oldc.Sub_Stage__c != c.Sub_Stage__c && c.Duration_A_E__c == null){
          duration = datetime.now().getTime() - c.Last_Sub_Stage_Change__c.getTime();  
          Long Seconds = duration/1000;
          Long minutes = seconds/60;
          Long hours = minutes / 60;
          long days = hours / 24;
          String stringNewDuration = String.valueOf(hours)+'-H';
          c.Duration_A_E__c = stringNewDuration;
          c.Last_Sub_Stage_Change__c = datetime.now();
        }
        
        if(c.id != null && oldc.Sub_Stage__c == 'A/E' && oldc.Sub_Stage__c != c.Sub_Stage__c && c.Duration_A_E__c == null){
          duration = datetime.now().getTime() - c.Last_Sub_Stage_Change__c.getTime();  
          Long Seconds = duration/1000;
          Long minutes = seconds/60;
          Long hours = minutes / 60;
          long days = hours / 24;
          String stringNewDuration = String.valueOf(hours)+'-H';
          c.Duration_A_E__c = stringNewDuration;
          c.Last_Sub_Stage_Change__c = datetime.now();
        }
        
        if(c.id != null && oldc.Sub_Stage__c == 'Credit Application Approved TAMCO Agreement Provided' && oldc.Sub_Stage__c != c.Sub_Stage__c && c.Duration_Credit_Application_Approved__c == null){
          duration = datetime.now().getTime() - c.Last_Sub_Stage_Change__c.getTime();  
          Long Seconds = duration/1000;
          Long minutes = seconds/60;
          Long hours = minutes / 60;
          long days = hours / 24;
          String stringNewDuration = String.valueOf(hours)+'-H';
          c.Duration_Credit_Application_Approved__c = stringNewDuration;
          c.Last_Sub_Stage_Change__c = datetime.now();
        }
        
        if(c.id != null && oldc.Sub_Stage__c == 'Credit Application Denied' && oldc.Sub_Stage__c != c.Sub_Stage__c && c.Duration_Credit_App_Denied__c == null){
          duration = datetime.now().getTime() - c.Last_Sub_Stage_Change__c.getTime();  
          Long Seconds = duration/1000;
          Long minutes = seconds/60;
          Long hours = minutes / 60;
          long days = hours / 24;
          String stringNewDuration = String.valueOf(hours)+'-H';
          c.Duration_Credit_App_Denied__c = stringNewDuration;
          c.Last_Sub_Stage_Change__c = datetime.now();
        }
        
        if(c.id != null && oldc.Sub_Stage__c == 'A/E Closed Opportunity ' && oldc.Sub_Stage__c != c.Sub_Stage__c && c.Duration_A_E_closed_opportunity__c == null){
          duration = datetime.now().getTime() - c.Last_Sub_Stage_Change__c.getTime();  
          Long Seconds = duration/1000;
          Long minutes = seconds/60;
          Long hours = minutes / 60;
          long days = hours / 24;
          String stringNewDuration = String.valueOf(hours)+'-H';
          c.Duration_A_E_closed_opportunity__c = stringNewDuration;
          c.Last_Sub_Stage_Change__c = datetime.now();
        }
        }
    }
    
    public static void ContractRenewalCaseCreate(Map<Id, SObject> newItems){
      system.debug('ContractRenewalCaseCreate Method Start');
        Id profileId=userinfo.getProfileId();        
        String profileName=[Select Id,Name from Profile where Id=:profileId].Name;
        set<string> setCaseNumbers = new set<string>();
        if(profileName != 'System Analyst'){
            for (case cse: (List<case>)newItems.values()){
                if(cse.status =='Closed'){
                    setCaseNumbers.add(cse.Id);
                }           
            }            
        }
        if(!setCaseNumbers.isEmpty()){
            Id CRRecordTypeId = Schema.SObjectType.Case.getRecordTypeInfosByName().get('Contract Renewal').getRecordTypeId();
            List<case> lstCaseExistingCheck = [select id from case where Case__c in : setCaseNumbers and RecordTypeId =: CRRecordTypeId ];    
            system.debug('--lstCaseExistingCheck--'+lstCaseExistingCheck); 
            if(lstCaseExistingCheck.isEmpty()){
                methodContractRenewalCaseCreate(newItems);
            }
        }    
    }
    
    private static void methodContractRenewalCaseCreate(Map<Id, SObject> newItems){
        Id CRRecordTypeId = Schema.SObjectType.Case.getRecordTypeInfosByName().get('Contract Renewal').getRecordTypeId();
        Id recordTypeIdOrderManagement = Schema.SObjectType.Case.getRecordTypeInfosByName().get('Order Management').getRecordTypeId();
        set<string> setAccountidsinit = new set<string>();
        set<string> setCaseIdsinit = new set<string>();
        for (case cse: (List<case>)newItems.values()){
            setAccountidsinit.add(cse.AccountID); 
            setCaseIdsinit.add(cse.Id);               
                
        }
        string strCASEOwnerToUpdate = getCaseOwnerName(setAccountidsinit,setCaseIdsinit); 
        string strUsername = '';
        List<user> lstUser = [select id , firstname, lastname from user where id =: strCASEOwnerToUpdate ];
        if(!lstUser.isEmpty()){
            strUsername = lstUser[0].firstname+' '+lstUser[0].lastname;
        }

        
        //Order Management
       List<case> lstCASEOrder = [SELECT id,ownerid,Account.Support_Team_Member__c,OrderManagement_Type__c,Account.Support_Team_Member__r.name,Account.Support_Team_Member__r.Support_Role__c,
       Contactid FROM case WHERE Id IN: newItems.keySet() and RecordTypeId =: recordTypeIdOrderManagement];
       list<Case> lstcse = new list<case>();
       system.debug('--olis --'+lstCASEOrder);
       for(case obj : lstCASEOrder){      
         if (obj.OrderManagement_Type__c.equalsIgnoreCase('Contract Renewal')){      
          case cse = new Case();           
          //cse.OwnerId = strCASEOwnerToUpdate;
          //if(strCASEOwnerToUpdate != '')
          if(!String.isEmpty(strCASEOwnerToUpdate)) 
              cse.ownerid = strCASEOwnerToUpdate; 
          if(!String.isEmpty(strUsername))     
              cse.case_owner__C = strUsername ;
          cse.RecordTypeId = CRRecordTypeId ;
          cse.AccountID = obj.AccountID;
          cse.Contactid = obj.Contactid;
          cse.Origin = 'Contract Renewal';
          cse.Case__c = obj.id; 
          lstcse.add(cse);             
         }
        }
        if(!lstcse.isEmpty())
            insert lstcse;        
        
    }
    
     private static string  getCaseOwnerName(set<string> setcaseAccountIds,set<string> setcaseIds){
    
        map<string,string> mapSAMTeammember = new map<string,string>();
        map<string,string> mapCSATeammember = new map<string,string>();
        
        if (setcaseAccountIds.contains(null))
          return '';
        list<Support_Team_Member__c> lstTeamMembers = [select id,Account__c,Support_Role__c,Team_Member__r.Firstname,Team_Member__r.lastname,Team_Member__c from Support_Team_Member__c 
                                                where Account__c  in :setcaseAccountIds order by createddate desc];
        set<string> setAccountIds = new set<string>();
        string strCASEOwner = '';
        system.debug('--lstTeamMembers --'+lstTeamMembers );
        for(Support_Team_Member__c sTemMember : lstTeamMembers){
            setAccountIds.add(sTemMember.Account__c); 
            if(sTemMember.Support_Role__c.contains('SAM') ){
                mapSAMTeammember.put(sTemMember.Account__c,sTemMember.Team_Member__c); 
                //strCASEOwner =  sTemMember.Team_Member__r.firstname +' '+sTemMember.Team_Member__r.lastname; 
                strCASEOwner = sTemMember.Team_Member__c;
                break;
            }
            else if(sTemMember.Support_Role__c.contains('CSA') ){
                mapCSATeammember.put(sTemMember.Account__c,sTemMember.Team_Member__c); 
                //strCASEOwner =  sTemMember.Team_Member__r.firstname +' '+sTemMember.Team_Member__r.lastname;                
                strCASEOwner = sTemMember.Team_Member__c;
            }
        }
        return strCASEOwner;
    }
		
    public static void setCommunityCaseOwnerToQuote(Map<Id, SObject> newItems){
        
        Id recordTypeIdOrderManagement = Schema.SObjectType.Case.getRecordTypeInfosByName().get('Enterprise Portal Support Request').getRecordTypeId();
        system.debug('Recordtype id===='+recordTypeIdOrderManagement);
        Set<Id> caseIdSet = new Set<Id>();
        
        for(Case c : (List<case>)newItems.values()) {
            if(c.RecordTypeId == recordTypeIdOrderManagement){
                caseIdSet.add(c.Id);
            }
        }
        
        List<Case> caseList = new List<Case>();
        
        Database.DMLOptions dmo = new Database.DMLOptions();
        dmo.AssignmentRuleHeader.useDefaultRule = true;
        
        for(Case c : [SELECT Id FROM Case WHERE Id IN: caseIdSet]) {
            c.setOptions(dmo);
            caseList.add(c);
        }
        
        update caseList;
    }
}