@isTest
public class DocuSignRecipientStatusTest {
   public static testMethod void unitTest(){
           
           Account acc=new Account(Name='TestAccount');
           insert acc;
           acc = [select id from Account where Name='TestAccount'];
           
           Contract ctr = new Contract(accountId=acc.Id, status='Draft', Promotional_Contract__c = 'Promo');
           insert ctr;
           
           dsfs__DocuSign_Status__c ds = new dsfs__DocuSign_Status__c(dsfs__Envelope_Status__c = 'Sent', dsfs__Voided_Reason__c = '', dsfs__Contract__c = ctr.Id);
           insert ds;
            
           ds.dsfs__Envelope_Status__c ='Voided';
           ds.dsfs__Voided_Reason__c='Envelope has expired.';
           update ds;
           ds.dsfs__Voided_Date_Time__c=System.today();
           update ds;
           
           dsfs__DocuSign_Recipient_Status__c ds1 = new dsfs__DocuSign_Recipient_Status__c(dsfs__DocuSign_Routing_Order__c = 1, dsfs__Recipient_Status__c = 'Declined', dsfs__Date_Signed__c=System.today(),
                                                                                           dsfs__Parent_Status_Record__c= ds.Id, dsfs__DocuSign_Recipient_Id__c='123');
           insert ds1;    
           
              
           dsfs__DocuSign_Recipient_Status__c ds2 = new dsfs__DocuSign_Recipient_Status__c(dsfs__DocuSign_Routing_Order__c = 1, dsfs__Recipient_Status__c = 'sent', dsfs__Parent_Status_Record__c= ds.Id,
                                                                                           dsfs__DocuSign_Recipient_Id__c='124', dsfs__Date_Signed__c=System.today());
           insert ds2;
           
           dsfs__DocuSign_Recipient_Status__c ds3 = new dsfs__DocuSign_Recipient_Status__c(dsfs__DocuSign_Routing_Order__c = 1, dsfs__Recipient_Status__c = 'sent', dsfs__Parent_Status_Record__c= ds.Id,
                                                                                           dsfs__DocuSign_Recipient_Id__c='123', dsfs__Date_Delivered__c=System.today());
           insert ds3;
           
           dsfs__DocuSign_Recipient_Status__c ds4 = new dsfs__DocuSign_Recipient_Status__c(dsfs__DocuSign_Routing_Order__c = 1, dsfs__Recipient_Status__c = 'sent', dsfs__Parent_Status_Record__c= ds.Id,
                                                                                           dsfs__DocuSign_Recipient_Id__c='123', dsfs__Date_Sent__c =System.today() );
           insert ds4; 
           
           ds1 = [select id from dsfs__DocuSign_Recipient_Status__c where dsfs__Parent_Status_Record__c =: ds.Id limit 1];  
           update ds1;          
           delete ds1;
           undelete ds1;
                   
   }
 }