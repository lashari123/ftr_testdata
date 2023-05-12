public without sharing class UpdateAccountController {
    public UsableAcc usableAcc { get; set; }
    public boolean isRequestValid  { get; set; }
    public List<Account> accObjList = new List<Account>();
    public ObjectForAttach__c objAtt;
     public Attachment attachment {
      get {
          if (attachment == null){
                attachment = new Attachment();               
            }
          return attachment;
        }
      set;
      }

   
        
    public UpdateAccountController() {
		init(null);
	}
	
	public UpdateAccountController(Id accountId) {
		init(accountId);
	}
	
	public void init(Id accountId) {
        isRequestValid = false;
        usableAcc = new UsableAcc();
		if(accountId == null) {
			usableAcc.accId = ApexPages.currentPage().getParameters().get('id');
		} else {
			usableAcc.accId = accountid;
		}
        if (usableAcc.accId != null)
        {
           accObjList = [
            SELECT 
                ID, 
                Name, 
                Agent_Email_Address__c, 
                signer__c, 
                What_else_do_we_need_to_know_about__c, 
                Description_of_agent_work_to_be_done__c, 
                //Contract_Manager_Comments__c, 
                //Contract_Manager_Approval__c, 
                Agent_Phone_Number__c, 
                Agent_Mailing_State__c, 
                Agent_Mailing_Address__c, 
                Company_Legal_Name__c, 
                Agent_Fax_Number__c,  
                Channel_Affiliation__c, 
                Legal_Notice_Email_2__c, 
                Legal_Notice_Email_1__c, 
                Legal_Notice_Contact_Name_1__c, 
                Legal_Notice_Contact_Name_2__c, 
                Term_of_Agreement__c, 
                DBA_Company_Name__c,
                Legal_Street__c,
                Legal_City__c,
                Legal_State1__c,
                Legal_Zip__c,
                Type_of_Entity__c,
                State_of_Formation__c,
                Company_Date_of_Formation__c,
                Tax_ID_Number__c,
                D_U_N_S_Number__c,
                Experian_Business_Identification_Number__c,
                Name_of_Principal__c,
                SSN_of_Principal__c,
                Vendor_Profile_Date__c,
                Current_Frontier_Customer_Number__c,
                Credit_Check_Pass_Fail__c,
                Pass_Fail_Comments__c, 
                Effective_Date_Of_Agreement__c 
           FROM Account 
           where ID =: usableAcc.accId LIMIT 1];
           if (!accObjList.isEmpty())
           {

               isRequestValid = true;
               usableAcc.name = accObjList[0].Name;
               try{
                   usableAcc.signer = [select name from Contact where id =: accObjList[0].signer__c].name;
               }Catch(Exception Ex){ System.debug('Soql error'); }
               usableAcc.ename = accObjList[0].Company_Legal_Name__c;
               usableAcc.dbacname = accObjList[0].DBA_Company_Name__c;
               usableAcc.street = accObjList[0].Legal_Street__c;
               usableAcc.city = accObjList[0].Legal_City__c;
               usableAcc.state = accObjList[0].Legal_State1__c;
               usableAcc.zip = accObjList[0].Legal_Zip__c;
               usableAcc.struct = accObjList[0].Type_of_Entity__c;
               usableAcc.statellc = accObjList[0].State_of_Formation__c;
               
               if (accObjList[0].Company_Date_of_Formation__c != null)
               {
                  Date dateform = accObjList[0].Company_Date_of_Formation__c;
                  usableAcc.formDate = dateform.month() + '/' + dateform.day() + '/' + dateform.year();
               }

               //usableAcc.formDate = accObjList[0].Company_Date_of_Formation__c;
               usableAcc.taxid = accObjList[0].Tax_ID_Number__c;
               usableAcc.duns = accObjList[0].D_U_N_S_Number__c;
               usableAcc.bin = accObjList[0].Experian_Business_Identification_Number__c;
               usableAcc.pname = accObjList[0].Name_of_Principal__c;
               usableAcc.pssn = accObjList[0].SSN_of_Principal__c;
               usableAcc.porf = accObjList[0].Credit_Check_Pass_Fail__c;
               usableAcc.porfcom = accObjList[0].Pass_Fail_Comments__c;
               
               if (accObjList[0].Vendor_Profile_Date__c != null)
                   usableAcc.vpdate = String.valueOf(accObjList[0].Vendor_Profile_Date__c);
               //usableAcc.vpdate = accObjList[0].Vendor_Profile_Date__c;
               usableAcc.ftrno = accObjList[0].Current_Frontier_Customer_Number__c;
              
                //12/08/2015 Sunil shrestha
               usableAcc.channel = accObjList[0].Channel_Affiliation__c;
               usableAcc.agTerm=accObjList[0].Term_of_Agreement__c;
               usableAcc.legalContact1 = accObjList[0].Legal_Notice_Contact_Name_1__c;
               usableAcc.legalEmail1 =accObjList[0].Legal_Notice_Email_1__c;            
               usableAcc.legalContact2 =accObjList[0].Legal_Notice_Contact_Name_2__c;
               usableAcc.legalEmail2 = accObjList[0].Legal_Notice_Email_2__c;
               usableAcc.descriptionWork = accObjList[0].Description_of_agent_work_to_be_done__c;
               usableAcc.whatNeedToKnow = accObjList[0].What_else_do_we_need_to_know_about__c;
               usableAcc.collectionsReview = accObjList[0].Credit_Check_Pass_Fail__c;
               //usableAcc.conMgrApproval  = accObjList[0].Contract_Manager_Approval__c;
               //usableAcc.conMgrComments  = accObjList[0].Contract_Manager_Comments__c;
               usableAcc.effectiveDate  = accObjList[0].Effective_Date_Of_Agreement__c;
                             
            }
        }
        else
        {
        
        }
           
    }
    
    public List<selectOption> getOptionList()
    {       
            List<selectOption> options = new List<SelectOption>();
            options.add(new SelectOption('',''));
            options.add(new SelectOption('Approve','Approve'));
            options.add(new SelectOption('Deny','Deny'));
            return options;
    }
    
    public List<selectOption> getOptionList1()
    {       
            List<selectOption> options = new List<SelectOption>();
            options.add(new SelectOption('',''));
            options.add(new SelectOption('Pass','Pass'));
            options.add(new SelectOption('Fail','Fail'));
            return options;
    }

    public class UsableAcc {
        public String accId { get; set; }
        public String signer { get; set; }
        public String name { get; set; }
        public String ename { get; set; }
        public String dbacname { get; set; }
        public String street { get; set; }
        public String city { get; set; }
        public String state { get; set; }
        public String zip { get; set; }
        public String struct { get; set; }
        public String statellc { get; set; }
        public String formDate { get; set; }
        public String taxid { get; set; }
        public String duns { get; set; }
        public String bin { get; set; }
        public String pname { get; set; }
        public String pssn { get; set; }
        public String vpdate { get; set; }
        public String ftrno { get; set; }
        public String email { get; set;}
        public String porf
         {  get
            {
               if(porf==null)
                   porf='';
                   
               return porf;
            }
            set; 
            }
        public String porfCom { get; set; }    
        public String channel{ get; set;}
        public String agTerm{ get; set;}
        public String legalContact1{ get; set;}
        public String legalEmail1{ get; set;}
        public String legalContact2{ get; set;}
        public String legalEmail2{ get; set;}
        public String descriptionWork{ get; set;}
        public String whatNeedToKnow { get; set;}
        public Date effectiveDate { get; set;}
        public String collectionsReview { get; set;}
        public String passFail { get; set;}
        //public String conMgrApproval { get; set;}
        //public String conMgrComments { get; set;}
    }
           
    public PageReference doSubmit() {
        boolean isRecordUpdated = false;
        objAtt = new ObjectForAttach__c(LabelSpringcm__c = 'springcm');
        try{
            insert objAtt;
        }Catch(Exception ex){}
        List<Alt_Channel_Form__c> objList = new List<Alt_Channel_Form__c>();
        
        objList = [SELECT Id,AccountID__c, Account_Name__c,updated_from_account__c, Legal_Entity_Name__c, DBA_Company_Name__c, Street_Address__c, City__c, State__c, Zip_Postal_Code__c, Structure__c, State_of_LLC__c, Date_of_Formation__c, Tax_ID_Number__c, DUNS_Number__c, Experian_Business_Identification_Number__c, Name_of_Principal__c, SSN_of_Principal__c, Vendor_Profile_Date__c, Current_Frontier_Customer_Number__c,Credit_Check_Pass_Fail__c,Pass_Fail_Comments__c, Credit_Screening_Initiator__c, Effective_Date_Of_Agreement__c FROM Alt_Channel_Form__c where AccountID__c =: usableAcc.accId LIMIT 1];
        
        if ((!objList.isEmpty()) && (isRequestValid))
        {
                  objList[0].updated_from_account__c = false;
                  objList[0].Legal_Entity_Name__c = usableAcc.ename;
                  objList[0].DBA_Company_Name__c = usableAcc.dbacname;
                  objList[0].Street_Address__c = usableAcc.street;
                  objList[0].City__c = usableAcc.city;
                  objList[0].State__c = usableAcc.state;
                  objList[0].Zip_Postal_Code__c = usableAcc.zip;
                  objList[0].Structure__c = usableAcc.struct;
                  objList[0].State_of_LLC__c = usableAcc.statellc;
                  if ((usableAcc.formDate !=null) && (!usableAcc.formDate.equals('')))
                  {
                     List<String> dateValue;
                     system.debug('================form date'+usableAcc.formDate);
                     if(String.escapeSingleQuotes(usableAcc.formDate).contains('-')) {
                     system.debug('contains -');
                      dateValue = String.escapeSingleQuotes(usableAcc.formDate).split('-');     
                     }else{
                         dateValue = String.escapeSingleQuotes(usableAcc.formDate).split('/');
                         system.debug('contains a slash');  
                     }                   
                     
                      system.debug(usableAcc.formDate);
                      system.debug(dateValue[0]+'   new    '+dateValue[1]+' new      '+dateValue[2]);
                      objList[0].Date_of_Formation__c = date.newinstance(integer.valueof(dateValue[2]),integer.valueof(dateValue[0]),integer.valueof(dateValue[1]));
                  }
                  objList[0].Tax_ID_Number__c = usableAcc.taxid;
                  objList[0].DUNS_Number__c = usableAcc.duns;
                  objList[0].Experian_Business_Identification_Number__c = usableAcc.bin;
                  objList[0].Name_of_Principal__c = usableAcc.pname;
                  objList[0].SSN_of_Principal__c = usableAcc.pssn;
                  //if (usableAcc.vpdate != null)
                  //    objList[0].Vendor_Profile_Date__c = Date.parse(usableAcc.vpdate);
                  //objList[0].Vendor_Profile_Date__c = usableAcc.vpdate;
                  objList[0].Current_Frontier_Customer_Number__c = usableAcc.ftrno;
                  objList[0].Credit_Check_Pass_Fail__c = usableAcc.porf;
                  objList[0].Pass_Fail_Comments__c = usableAcc.porfcom;      
                  objList[0].Credit_Screening_Initiator__c = usableAcc.email;
                  objList[0].Effective_Date_Of_Agreement__c = usableAcc.effectiveDate;
                  
                  
                  isRecordUpdated = true;
        }
        else
        {
                ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'Internal Error! Record could not be located. Please contact your Frontier Communications representative.');
                ApexPages.addMessage(myMsg);

                return null;
        }

        if (isRecordUpdated)
        {
               try{
               
                   ObjectForAttach__c  objAt = [Select id from ObjectForAttach__c  where LabelSpringcm__c = 'springcm' limit 1];
                   if(attachment.name != null && attachment.body != null){   
                       attachment.name = 'Collection Screening---'+attachment.name;
                       attachment.ParentId = objAt.id;
                       objList[0].AttachId__c = objAt.id;
                       insert attachment;
                       attachment = new Attachment();
                       System.debug('111111111111111111111111111111'+ objAt );
                   }
                }catch(DMLException e){ }
            
            
            update ObjList;  
            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.CONFIRM,'Thank you! Your information has been submitted to your Frontier Communications representative.');
            ApexPages.addMessage(myMsg);
    
            return null;
        }
        return null;
    }
    
    
    public PageReference doSubmitCM() {
    
        List<Alt_Channel_Form__c> objList = new List<Alt_Channel_Form__c>();        
        objList = [SELECT Id,AccountID__c, Account_Name__c, Legal_Entity_Name__c, DBA_Company_Name__c, Street_Address__c, City__c, State__c, Zip_Postal_Code__c, Structure__c, State_of_LLC__c, Date_of_Formation__c, Tax_ID_Number__c, DUNS_Number__c, Experian_Business_Identification_Number__c, Name_of_Principal__c, SSN_of_Principal__c, Vendor_Profile_Date__c, Current_Frontier_Customer_Number__c,Credit_Check_Pass_Fail__c,Pass_Fail_Comments__c, Credit_Screening_Initiator__c, Effective_Date_Of_Agreement__c,updated_from_account__c FROM Alt_Channel_Form__c where AccountID__c =: usableAcc.accId LIMIT 1];
        
        if ((!objList.isEmpty()) && (isRequestValid))
        {
            objList[0].updated_from_account__c = false;
            objList[0].Legal_Entity_Name__c = usableAcc.ename;
            objList[0].DBA_Company_Name__c = usableAcc.dbacname;
            objList[0].Street_Address__c = usableAcc.street;
            objList[0].City__c = usableAcc.city;
            objList[0].State__c = usableAcc.state;
            objList[0].Zip_Postal_Code__c = usableAcc.zip;
            objList[0].Structure__c = usableAcc.struct;
            objList[0].State_of_LLC__c = usableAcc.statellc;
            if ((usableAcc.formDate !=null) && (!usableAcc.formDate.equals('')))
            {
             List<String> dateValue;
              if(String.escapeSingleQuotes(usableAcc.formDate).contains('-')) {
               dateValue = String.escapeSingleQuotes(usableAcc.formDate).split('-');     
             }else{
                 dateValue = String.escapeSingleQuotes(usableAcc.formDate).split('/');   
             }         
             objList[0].Date_of_Formation__c = date.newinstance(integer.valueof(dateValue[2]),integer.valueof(dateValue[0]),integer.valueof(dateValue[1]));
            }
            objList[0].Tax_ID_Number__c = usableAcc.taxid;
            objList[0].DUNS_Number__c = usableAcc.duns;
            objList[0].Experian_Business_Identification_Number__c = usableAcc.bin;
            objList[0].Name_of_Principal__c = usableAcc.pname;
            objList[0].SSN_of_Principal__c = usableAcc.pssn;
            objList[0].Current_Frontier_Customer_Number__c = usableAcc.ftrno;
            objList[0].Credit_Screening_Initiator__c = usableAcc.email;  
            objList[0].Credit_Check_Pass_Fail__c = usableAcc.porf;
            objList[0].Pass_Fail_Comments__c = usableAcc.porfcom;   
            objList[0].Channel_Affiliation__c = usableAcc.channel;
            //objList[0].Term_of_Agreement__c = usableAcc.agTerm;
            objList[0].Legal_Notice_Contact_Name_1__c = usableAcc.legalContact1;
            objList[0].Legal_Notice_Email_1__c =usableAcc.legalEmail1;            
            objList[0].Legal_Notice_Contact_Name_2__c =usableAcc.legalContact2;
            objList[0].Legal_Notice_Email_2__c = usableAcc.legalEmail2;
            objlist[0].Description_of_agent_work_to_be_done__c = usableAcc.descriptionWork;
            objList[0].What_else_do_we_need_to_know_about__c = usableAcc.whatNeedToKnow;
            objList[0].Credit_Check_Pass_Fail__c = usableAcc.collectionsReview;
            //objList[0].Contract_Manager_Approval__c  = usableAcc.conMgrApproval;
            //objList[0].Contract_Manager_Comments__c  = usableAcc.conMgrComments;  
            //objList[0].Effective_Date_Of_Agreement__c = usableAcc.effectiveDate;
                    
            update ObjList;  
            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.CONFIRM,'Thank you! Your information has been submitted to your Frontier Communications representative.');
            ApexPages.addMessage(myMsg);
        }
    
    
    return null;
    }
    
}