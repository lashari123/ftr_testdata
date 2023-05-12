@isTest
public class DocusignTestTrigger
{
    public static TestMethod void testDocuSignStatus()
    {         
           Contract dc= new Contract();
           //Contract_Repository__c dc= new Contract_Repository__c();
           Account acc=new Account();
           acc.Name='Test';
           insert acc;
           system.debug('dinesh'+acc);
            
           dc.accountId=acc.Id;
           //dc.Account_Name__c=acc.Id;
           dc.status='Draft';
           //dc.status__c='Draft';
           dc.Promotional_Contract__c = 'Promo';
           //dc.Promo_Contract_Status__c= 'Promo';
           insert dc;
           system.debug('dinesh1'); 
           
           dsfs__DocuSign_Status__c ds = new dsfs__DocuSign_Status__c();
           ds.dsfs__Envelope_Status__c = 'Sent';
           ds.dsfs__Voided_Reason__c = '';
           //ds.Contract_Repository_Portal__c=dc.Id;
           ds.dsfs__Contract__c=dc.Id;
           insert ds;
            
           system.debug('dinesh2');

           ds.dsfs__Envelope_Status__c ='Voided';
           ds.dsfs__Voided_Reason__c='Envelope has expired.';
           update ds;
           ds.dsfs__Voided_Date_Time__c=System.today();
           update ds;
           
           dsfs__DocuSign_Recipient_Status__c ds1 = new dsfs__DocuSign_Recipient_Status__c();
           ds1.dsfs__DocuSign_Routing_Order__c = 1;
           ds1.dsfs__Recipient_Status__c = 'sent';
           ds1.dsfs__Parent_Status_Record__c= ds.Id;
           ds1.dsfs__DocuSign_Recipient_Id__c='123';
           ds1.dsfs__Recipient_Status__c = 'Declined';
           insert ds1;
         
           dsfs__DocuSign_Recipient_Status__c ds2 = new dsfs__DocuSign_Recipient_Status__c();
           ds2.dsfs__DocuSign_Routing_Order__c = 1;
           ds2.dsfs__Recipient_Status__c = 'sent'; 
           ds2.dsfs__Parent_Status_Record__c= ds.Id;
           ds2.dsfs__DocuSign_Recipient_Id__c='123';
           ds2.dsfs__Date_Signed__c=System.today();
           insert ds2;
           
           dsfs__DocuSign_Recipient_Status__c ds3 = new dsfs__DocuSign_Recipient_Status__c();
           ds3.dsfs__DocuSign_Routing_Order__c = 1;
           ds3.dsfs__Recipient_Status__c = 'sent';
           ds3.dsfs__Parent_Status_Record__c= ds.Id;
           ds3.dsfs__DocuSign_Recipient_Id__c='123';
           ds3.dsfs__Date_Delivered__c=System.today();
           insert ds3;
           dsfs__DocuSign_Recipient_Status__c ds4 = new dsfs__DocuSign_Recipient_Status__c();
           ds4.dsfs__DocuSign_Routing_Order__c = 1;
           ds4.dsfs__Recipient_Status__c = 'sent';
           ds4.dsfs__Parent_Status_Record__c= ds.Id;
           ds4.dsfs__DocuSign_Recipient_Id__c='123';
           ds4.dsfs__Date_Sent__c =System.today();
          insert ds4;
           system.debug('dinesh'+ds);
    }
}