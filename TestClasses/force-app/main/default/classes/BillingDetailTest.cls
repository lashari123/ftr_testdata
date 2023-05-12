@isTest(seeAllData = true)
private class BillingDetailTest {
       
        static testmethod void unitTest(){
        
             Account acc = new Account(name='TestAccount');
             insert acc;
             acc = [select id from Account where name='TestAccount'];
             
             Billing_Detail_2__c bd = new Billing_Detail_2__c(S_E_To_Date__c = Date.Today(), Account_Id__c = acc.id);
             insert bd;
             
             bd = [select id from Billing_Detail_2__c limit 1];
             
             
             update bd;
             delete bd;
             undelete bd;
             
        }
}