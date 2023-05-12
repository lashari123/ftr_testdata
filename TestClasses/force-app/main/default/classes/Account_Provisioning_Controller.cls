public class Account_Provisioning_Controller {
    
    
    public Account acc {get;set;}
    public List<Account_Provisioning_Controller.HuntGroupMember> lstNewHunt;
    public Map<String, List<Account_Provisioning_Controller.HuntGroupMember>> mapFinalPilotNumber{get; set;}
    public boolean outOf {get; set;}
    
    //--------------------------------------------------------------------------------------------------------------
    public Case_Email_Automation csa;
    public List<Case> caseList;
    //--------------------------------------------------------------------------------------------------------------
    
    public Account_Provisioning_Controller(){ 
             //------------------------------------------------------------------------------------------------------
             csa = new Case_Email_Automation();
             caseList = new List<Case>();
             
             //------------------------------------------------------------------------------------------------------
             
             lstNewHunt = new  List<Account_Provisioning_Controller.HuntGroupMember>();
             String AccountId = ApexPages.currentPage().getParameters().get('accoutId');
             if(AccountId != null) {
                acc = [SELECT Customer_Number_New__c, Library_Id__c, RecordType.Name, SpecialAccess_DIGT__c, SpecialAccess_BEST__c ,  SpecialAccess_TSP__c , SpecialAccess_HCUT__c, SpecialAccess_ATN__c, SpecialAccess_UNE__c, SpecialAccess_TG__c, SpecialAccess_SECNCI__c, SpecialAccess_NCI__c, SpecialAccess_QC_Stage__c, SpecialAccess_NC_Code__c, SpecialAccess_PIU__c, SpecialAccess_PON__c, SpecialAccess_TLOC__c, SpecialAccess_TA01__c, SpecialAccess_OLOC__c, SpecialAccess_OA01__c, SpecialAccess_RCDT__c, SpecialAccess_CRO__c, SpecialAccessRO__c, SpecialAccess_FRQ__c, SpecialAccess_Tariff__c, SpecialAccess_ABC__c, SpecialAccess_AID1__c , SpecialAccess_AID2__c, Hierarchy_Level__c, SpecialAccess_Customer__c, SpecialAccess_CIR_Number__c, SpecialAccess_Type_SVC__c, SpecialAccess_HI_CAP__c, SpecialAccess_FDR__c, SpecialAccess_USO_Number__c, SpecialAccess_AT_T_CR_No__c, SpecialAccess_OCC_CIR_No__c, Provisioning_Hunt_Pilot__c, Provisioning_Hunt_Group_Number__c, Provisioning_Type_Of_Hunting__c, Provisioning_Hunt_Member_Sequence__c, Provisioning_Out_of__c, Id, Name, ParentSequenceId__c, TNSequenceId__c, (SELECT Account__c, Hunt_Pilot_Number__c FROM HuntGroups__r) FROM Account WHERE Id = :AccountId LIMIT 1];
                system.debug('acc--'+acc);
             }
             //------------------------------------------------------------------------------------------------------
             
             //strCk();
            
             //------------------------------------------------------------------------------------------------------
    }
    
    public class HuntGroupMember {
        public integer id;
        public String Type{get; set;}
        public integer cnt{get; set;}
        public String pilPhNum{get; set;}
        public String huntPhoneNumber{get; set;}
        public String huntSeqNumber{get; set;}
    }
     public class newHunt{
        
        public List<HuntGroupMember> huntGrpMem;
     }
     
     public Map<String, List<HuntGroupMember>>  getHuntGroup(){
        
        mapFinalPilotNumber = new Map<String, List<Account_Provisioning_Controller.HuntGroupMember>>();
        //if(acc.ParentSequenceId__c != null && acc.Library_Id__c != null && acc.RecordType.Name == 'DPI'){
        List<Account_Provisioning_Controller.HuntGroupMember>     lstNewHunt = new  List<Account_Provisioning_Controller.HuntGroupMember>();
        outOf = false;    
        try{
            WS_ESB_ManageAccount.Callout maCout = new WS_ESB_ManageAccount.Callout(); 
            if(acc.ParentSequenceId__c != null && acc.Library_Id__c != null){
                WS_ESB_ManageAccount.ManageAccountGetHuntGroupsResponse  res = maCout.getHuntGroups(acc.ParentSequenceId__c.substring(0,10),acc.Library_Id__c);
                //System.debug(JSON.serializePretty(res));
                if(res.HuntGroups != null){
                    WS_ESB_BusinessObjects.HuntGroups hgrs = res.HuntGroups;
                    if(hgrs.HuntGroup != null ){
                        for(WS_ESB_BusinessObjects.HuntGroup hGrp :hgrs.HuntGroup){
                            newHunt nhg = new newHunt();
                            if(hGrp.HuntGroupMembers != null){
                                if(hGrp.HuntGroupMembers.HuntGroupMember != null){
                                    nhg.huntGrpMem = new List<HuntGroupMember>(); 
                                    for(WS_ESB_BusinessObjects.HuntGroupMember hgMemCO:hGrp.HuntGroupMembers.HuntGroupMember ){
                                        HuntGroupMember hgMem = new HuntGroupMember();
                                        if(hGrp.Type != null){ hgMem.Type = hGrp.Type; }
                                        if(hGrp.Count != null){ hgMem.cnt = hGrp.Count;}
                                        if(hGrp.PilotPhoneNumber != null){
                                            if(hGrp.PilotPhoneNumber.Number_x != null ){ hgMem.pilPhNum = hGrp.PilotPhoneNumber.Number_x; }
                                        }
                                        if(hgMemCO.PhoneNumber != null){
                                            if(hgMemCO.PhoneNumber.Number_x != null){ hgMem.huntPhoneNumber = hgMemCO.PhoneNumber.Number_x; }
                                        }
                                        if(hgMemCO.SequenceNumber != null){ hgMem.huntSeqNumber = hgMemCO.SequenceNumber; }
                                     lstNewHunt.add(hgMem);
                                    }
                                }
                            }   
                         
                        }
                        //System.debug(JSON.serializePretty(lstNewHunt));
                    }       
                }
            }
        } catch(Exception e){ 
            /*System.debug('getStackTraceString===='+e.getStackTraceString());
            System.debug('getMessage===='+e.getMessage());
            
            String err;
            if(acc.ParentSequenceId__c != null && acc.Library_Id__c != null){
                err = (e.getStackTraceString().split('\n'))[0] + '\n'+e.getMessage()+'\n'+ 'PhoneNumber: '+acc.ParentSequenceId__c.substring(0,10)+'\n'+ 'Region: '+acc.Library_Id__c;
                errHandle.sendErrMail(err);
            }
            if(acc.ParentSequenceId__c != null && acc.Library_Id__c != null){
                errHandle.sendErrMail('Trying to dereference null pointer.');
            }*/
            
            //---------------------------------------------------------------------------------------------------------------------
            Case newCase = new Case();
            csa.Case_Initialize(newCase);
            newCase.Subject = e.getTypeName();
            newCase.Reason = e.getMessage();
            if(acc.ParentSequenceId__c != null && acc.Library_Id__c != null){
                newCase.Description = (e.getStackTraceString().split('\n'))[0] + 'Parameters:  ' +acc.ParentSequenceId__c.substring(0,10) + '  '+acc.Library_Id__c;
            }else{
                newCase.Description = (e.getStackTraceString().split('\n'))[0];
            }
            caseList.add(newCase);
            //csa.Insert_Cases(caseList);
            //---------------------------------------------------------------------------------------------------------------------
        }
        
        if(lstNewHunt.size()==0){ outOf = true; }
        for(HuntGroupMember mem:lstNewHunt){
            mem.cnt = lstNewHunt.size();
        }
        mapFinalPilotNumber.put('1', lstNewHunt);
        //}
        return mapFinalPilotNumber;
    }
    
    //---------------------------------------------------------------------------------------------------------------------
    public static void strCk(){

try{
    //integer a = Integer.valueOf('as');
    integer a = null;
    System.debug(a+8);
    }catch(Exception e){
        List<Case> caseList = new List<Case>();
        Case_Email_Automation csa = new Case_Email_Automation();
        Case newCase = new Case();
        csa.Case_Initialize(newCase);
        newCase.Subject = e.getTypeName();
        newCase.Description = (e.getStackTraceString().split('\n'))[0]; //+'Parameters:  ' +acc.ParentSequenceId__c + '  '+acc.Library_Id__c+'\n';
        newCase.Reason = e.getMessage();
        caseList.add(newCase);
        csa.Insert_Cases(caseList);
        System.debug(e.getTypeName());
    }
}
   //---------------------------------------------------------------------------------------------------------------------
    
}