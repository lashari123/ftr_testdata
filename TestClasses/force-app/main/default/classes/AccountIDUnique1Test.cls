@isTest(seeAllData = true)
private class AccountIDUnique1Test {
       
        static testmethod void unitTest(){
            
             Billing_Detail_2__c bd = new Billing_Detail_2__c(Account_Id__c='TestAU', Month__c='JAN');
             insert bd;
             //bd = [select id, name from Billing_Detail_2__c where Account_Id__c='TestAU' limit 1];
             
             AccountIDUnique1__c au = new AccountIDUnique1__c(name = 'TestAU');
             insert au;
             au = [select id from AccountIDUnique1__c where name = 'TestAU' limit 1];            
             
                         
             update au;
             delete au;
             undelete au;
             
        }
}