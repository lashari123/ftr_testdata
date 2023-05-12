@isTest(seeAllData = true)
private class CreditPreAuthorizationTest {
       
        static testmethod void unitTest(){
        
             Account acc = new Account(name = 'TestAccount');
             insert acc;
             acc = [select id from Account where name = 'TestAccount'];
             
             Credit_PreAuthorization__c cp= new Credit_PreAuthorization__c(Company__c= acc.id, Customer_Contact_Name__c='asdf', 
                                                                           Justification__c='TestCase',Credit_Request_Amount__c=10);
             insert cp;
             cp = [select id from Credit_PreAuthorization__c where Company__c =: acc.id limit 1];
                         
             update cp;
             delete cp;
             undelete cp;
             
        }
}