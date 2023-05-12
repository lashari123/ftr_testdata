/********************************************************************************************
Name : AltChannelFormUtility
Created By : Mohan Talluri (mohan.talluri@ftr.com)
Created Date : June 13, 2016
Description :  Utility to support AltChannelForm Trigger Handler.
********************************************************************************************/

public without sharing class AltChannelFormUtility {

    public static void updateAccount(List<Alt_Channel_Form__c> acfList){
    
            Attachment atth;        
            Contract macontr = null;            
            List<Account> accList = new List<Account>();
            List<Contract> contrList = new List<Contract>();//Added by Kartez 12/16/15
         
            for (Alt_Channel_Form__c obj : acfList){
            
                System.debug('obj.AccountID__c ::'+obj.AccountID__c);
                System.debug('user profile ::'+userinfo.getProfileId());
                System.debug('user name ::'+userinfo.getName());
                
                Account acc = [Select Id, Company_Legal_Name__c, DBA_Company_Name__c, Legal_Street__c, Legal_City__c, Legal_State__c, Legal_Zip__c, Structure__c, Company_Date_of_Formation__c, 
                Tax_ID_Number__c, D_U_N_S_Number__c, Name_of_Principal__c, SSN_of_Principal__c, Vendor_Profile_Date__c, Collections_Review_Date_Received__c, Current_Frontier_Customer_Number__c, Credit_Screening_Initiator__c  from Account where Id =: obj.AccountID__c LIMIT 1];
                
                if  (acc != null && obj.updated_from_Account__c == False){
                
                    acc.Company_Legal_Name__c = obj.Legal_Entity_Name__c;
                    acc.DBA_Company_Name__c = obj.DBA_Company_Name__c;
                    acc.Legal_Street__c = obj.Street_Address__c;
                    acc.Legal_City__c = obj.City__c;
                    acc.Legal_State__c = obj.State__c;
                    acc.Legal_Zip__c = obj.Zip_Postal_Code__c;
                    acc.Structure__c = obj.Structure__c;
                    acc.Company_Date_of_Formation__c = obj.Date_of_Formation__c;
                    acc.Tax_ID_Number__c = obj.Tax_ID_Number__c;
                    acc.D_U_N_S_Number__c = obj.DUNS_Number__c;
                    acc.Name_of_Principal__c = obj.Name_of_Principal__c;
                    acc.SSN_of_Principal__c =  obj.SSN_of_Principal__c;
                    acc.Current_Frontier_Customer_Number__c = obj.Current_Frontier_Customer_Number__c;
                    
                    if (String.isNotBlank(obj.Tax_ID_Number__c))
                        acc.Vendor_Profile_Date__c = date.today();                            

                    //Mohan - 12/30/2015 - Checking to see if its an update from Collections Review, we will then update "Collections Review Date Returned".
                    // if Collection review comments updated from FORM and doesn't already exist in Account - indicates that it is getting submitted from COLLECTIONS REVIEW FORM.
                    if (String.isNotBlank(obj.Pass_Fail_Comments__c))
                    {
                       if (!String.isNotBlank(acc.Pass_Fail_Comments__c))
                          acc.Collections_Review_Date_Received__c = date.today(); 
                          
                       acc.Pass_Fail_Comments__c = obj.Pass_Fail_Comments__c;
                    }

                    
                    if(obj.Credit_Check_Pass_Fail__c!=null || obj.Credit_Check_Pass_Fail__c!='')
                        acc.Credit_Check_Pass_Fail__c = obj.Credit_Check_Pass_Fail__c;
                    
                    acc.Legal_Notice_Contact_Name_1__c = obj.Legal_Notice_Contact_Name_1__c ;
                    acc.Legal_Notice_Email_1__c =obj.Legal_Notice_Email_1__c ;            
                    acc.Legal_Notice_Contact_Name_2__c =obj.Legal_Notice_Contact_Name_2__c ;
                    acc.Legal_Notice_Email_2__c = obj.Legal_Notice_Email_2__c ;
                    acc.Description_of_agent_work_to_be_done__c = obj.Description_of_agent_work_to_be_done__c ;
                    acc.What_else_do_we_need_to_know_about__c = obj.What_else_do_we_need_to_know_about__c ;
                    acc.Credit_Check_Pass_Fail__c = obj.Credit_Check_Pass_Fail__c ;
                    
                    /* Michael- These fields are no longer used in this process 
                    acc.Contract_Manager_Approval__c  = obj.Contract_Manager_Approval__c  ;
                    Michael- field is no longer used in this process 
                    acc.Contract_Manager_Comments__c  = obj.Contract_Manager_Comments__c  ;*/
                    
                    if(obj.AttachId__c != null){ 
                        try{                  
                            atth = [select id, parentId, body, name  from Attachment where ParentId =: obj.AttachId__c limit 1]; 
                        }Catch(Exception ex){System.debug(ex);}
                        
                        if((atth != null) && (atth.id != null) ){
                            Attachment ath = new Attachment();
                            ath.ParentId = acc.id;
                            ath.body = atth.body;
                            ath.name = atth.name;
                            System.debug(ath);                       
                            insert ath;
                            delete atth;
                        }                               
                    }
                    
                    accList.add(acc);
                }
            }
            
            if (!accList.isEmpty())
                update accList;              
                    
    }
}