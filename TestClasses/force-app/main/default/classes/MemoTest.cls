@isTest(seeAllData = true)
private class MemoTest {

 static testmethod void unitTest(){
 
     Profile p = [SELECT Id FROM Profile WHERE Name='Standard User']; 
     User u = new User(Alias = 'dt', Email='user@test.com', 
                        EmailEncodingKey='UTF-8', LastName='Test', LanguageLocaleKey='en_US', 
                        LocaleSidKey='en_US', ProfileId = p.Id, CSR_ID__c = 'tst333', DPIID__C = 'tst333',
                        TimeZoneSidKey='America/Los_Angeles', UserName='er@trg.com');
     insert u;
     u = [select CSR_ID__c, DPIID__C   from User where CSR_ID__c = 'tst333' or DPIID__C = 'tst333'limit 1];
     
     Account acc = new Account(name='testAccount');
     insert acc;
     acc = [select id from Account where name='testAccount'];
     
     List<Memo__c> mList = new List<Memo__c>();
     Memo__c m1 = new Memo__c(User_ID__c = u.DPIID__C = 'tst333', Account__c = acc.id, Memo__c='Test matters');
     Memo__c m2 = new Memo__c(Account__c = acc.id, Memo__c='Test matters12345', User_ID__c = u.CSR_ID__c);
     mList.add(m1);
     mList.add(m2);
     insert mList;
     
     m1 = [select id from Memo__c where Account__c =: acc.id limit 1];
     update m1;
     delete m1;
     undelete m1;
 }
 
}