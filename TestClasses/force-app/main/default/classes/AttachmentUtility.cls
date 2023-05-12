/********************************************************************************************
Name : AttachmentUtility
Created By : Mohan Talluri (mohan.talluri@ftr.com)
Created Date : June 13, 2016
Description :  Utility to support Attachment Trigger Handler.
********************************************************************************************/

public with sharing class AttachmentUtility {

    public static void attachment_Opp(List<Attachment> atmtList) {
    
        List<Id> pId= new List<Id>();
        String filename;
        List<Opportunity> opp;
        for(Attachment att : atmtList)
            filename = att.Name;   
                     
        integer index = filename.indexOf('__');
        string[] parts = filename.splitByCharacterTypeCamelCase();
        String Uniqueno = parts[0];
        opp=[select Id,Account.Name,Ver_no_for_redline__c,Redline_email_no__c from opportunity where Redline_email_no__c=:Uniqueno];
        
        if(opp.size()>0)
        {
            for(Attachment att1 : atmtList)
            {
                if(parts.size()>2)
                {
                    if(parts[2].equalsIgnoreCase('final')||parts[4].equalsIgnoreCase('final'))
                        att1.Name = opp[0].Redline_email_no__c +' ' +'Redline' +' ' +'final' +' ' + opp[0].Account.Name+'.docx';
                    else {
                        att1.Name = opp[0].Redline_email_no__c +' ' +'Redline' +' ' +'ver' +' ' + opp[0].Ver_no_for_redline__c +' ' + opp[0].Account.Name+'.docx';
                        opp[0].Ver_no_for_redline__c=opp[0].Ver_no_for_redline__c+1;
                    }
                }
             }  
        }
        
        update opp;
    }
        
    
    public static void Attachment_SendEmail(List<Attachment> atmtList) {
    
        boolean cntflag;
        Contract con = new Contract();
        Account a = new Account();
        Schedule__c sched;         
        
        // to check if attachment filename in schedule obj has 'Click here to download'
        boolean emailfrSchedFlag = false;
        
        String filename;
        final String downloadName = 'Click here to download';
    
        for (Attachment Att : atmtList) {      
            
            integer cntContract = [select COUNT() FROM Contract where Id =: att.ParentId];          
            integer cntSched = [select COUNT() FROM Schedule__c where Id =: att.ParentId];
            
            if(cntContract > 0){
              con = [select id, Accountid, Icb_for_email_for_test__c , ShippingState, ContractNumber, ICB_Flag__c, Opportunity__c, CustomerSignedDate,CompanySignedDate, OwnerId, StartDate, EndDate, ContractTerm 
                                      from Contract where Id =: att.ParentId];
              a = [SELECT id, name FROM Account WHERE id =: Con.AccountId];                                  
              cntflag = true;
            } else if (cntSched > 0) {
                  sched= [select id,  Contract__c from Schedule__c where Id =: att.ParentId];
                  con = [select id, Accountid, Icb_for_email_for_test__c , ShippingState, ContractNumber, ICB_Flag__c, Opportunity__c, CustomerSignedDate,CompanySignedDate, OwnerId, StartDate, EndDate, ContractTerm 
                                          from Contract where Id =: sched.Contract__c ];
                  a = [SELECT id, name FROM Account WHERE id =: Con.AccountId];  
                  cntflag = true;
                  /*if the name of the file is "Click here to download..." then do not send email to regulatory and revenue assurance*/
                  filename = Att.Name;        //added to send out only                   
                  List<String> filenameParts = filename.splitByCharacterTypeCamelCase();
                  
                  /*check if attachment filename in schedule obj has 'Click here to download' or the extension is 'doc' or 'docx'*/
                  if(filename.contains(downloadName) || (filenameParts[filenameParts.size()-1] == 'doc')
                    || (filenameParts[filenameParts.size()-1] == 'docx')){
                     emailfrSchedFlag = false;
                  }else { emailfrSchedFlag = true; }
             
            } else {
              cntflag = false;
            }
              
            if(cntflag)
               sendEmail(con, a.name, emailfrSchedFlag);
        
      }         
  }
  

  private static void sendEmail(Contract Con, string accName, boolean emlFlag) {
  
        list<String> Prod = new list <string> ();
        if ((Con.CustomerSignedDate <> null) && (Con.CompanySignedDate <> null) && (Con.ICB_Flag__c == 'Y') && 
                 (Con.Icb_for_email_for_test__c == true || emlFlag == true)) 
        {  
           User u = [select ID, FirstName, LastName, Email, Phone from user where Id =: Con.OwnerId  ];               
           Opportunity Opp = [SELECT id, NRC__c, MRR_Amount__c, name, Contract_MRR__c, Pricebook2Id FROM Opportunity where id =: Con.Opportunity__c];
           list<OpportunityLineItem> Oli = [SELECT Id, Product_Description__c FROM OpportunityLineItem where OpportunityId =: Opp.Id]; 
           for (OpportunityLineItem O : Oli)
              Prod.add(O.Product_Description__c);      
                     
           Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();            
           String OrgId = UserInfo.getOrganizationId();
           String[] toAddresses;

           if(OrgId.contains('00D400000007AI5')) //production
                toAddresses = new String[] {'FN.LN3166e5@ftr.com', 'paul.bolduc@ftr.com', 'Aiquynh.cao@ftr.com','Rodney.rowan@ftr.com'};    //actual emails (regulatory and revenue)                                          
           else
                toAddresses = new String[] {'laya.ramos@ftr.com','Sherron.Rode@FTR.com','laurie.gilgan@ftr.com'};   //for developer,tester testing                
           
           mail.setToAddresses(toAddresses);    
           mail.setSubject('Notification: ICB Contract Signed');
           String ContractURL = URL.getSalesforceBaseUrl().toExternalForm() + '/' + Con.Id;
           String body = '<br>\n <b><u> Contract Owner – from Contract Repository in Salesforce.com \n</u></b>' ;
                  body += '<br>\n <i>First Name:</i> '+U.FirstName+ '</br>\n '; 
                  body += '<br>\n <i>Last Name: </i>'+U.LastName+ '</br>\n';
                  body += '<br>\n <i>Email: </i>'+U.Email+ '</br>\n';
                  body += '<br>\n <i>Phone : </i>'+U.Phone+ '</br>\n';
                  body += '<b>________________________________________________________________________\n</b>';
                  body += '<br>\n <b><u>General: </u></b>\n';
                  body += '<br>\n <i>Account Name: </i>\n' +accName+ '</br>\n ';
                  body += '<br>\n <i>State: </i>\n' +Con.ShippingState + '</br>\n ';    //State is from Service address
                  body += '<br>\n <i>Contract Number: </i>\n' +Con.ContractNumber + '</br>\n ';
                  body += '<br>\n <i>Contract Start date : </i>'+ Con.StartDate+ '</br>\n ';
                  body += '<br>\n <i>Contract End Date : </i>'+ Con.EndDate+ '</br>\n ';
                  body += '<br>\n <i>Contract Term : </i>' + Con.ContractTerm+ '</br>\n ';
                  body += '<br>\n <i>Product Description :</i>' + Prod + '</br>\n ';
                  body += '<br>\n <i>Contract can be found in Salesforce.com : </i>' + ContractURL + '</br>\n';
                    
                  mail.setHtmlBody(body);    
                  mail.setBccSender(false); 
                  mail.setUseSignature(false); 
                  mail.setPlainTextBody('To view the Contract Click the following link : https://cs8.salesforce.com/');
                  Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
                                                                   
        }
            
        if(Con.Icb_for_email_for_test__c == true){
                Con.Icb_for_email_for_test__c = false;  //turn off ICB email after send email
                update Con;
        }   
   }
}