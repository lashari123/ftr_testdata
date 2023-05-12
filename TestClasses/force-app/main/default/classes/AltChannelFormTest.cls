@isTest(seeAllData = true)
private class AltChannelFormTest {
 static testmethod void unitTest(){
 
     Account acc = new Account(name = 'TestAccount');
     insert acc;
     acc = [select id from Account where name = 'TestAccount' limit 1];
     
     
     
     Alt_Channel_Form__c acf = new Alt_Channel_Form__c(AccountID__c=acc.id, Legal_Entity_Name__c = 'TestACF', DBA_Company_Name__c = 'TestACF', Street_Address__c = '123 street', 
                                                       City__c = 'TestCity', State__c ='TX',  Zip_Postal_Code__c = '75026', Structure__c = 'test' , Date_of_Formation__c = Date.Today(),  
                                                       Tax_ID_Number__c = '1234', DUNS_Number__c = 'asdff9', Name_of_Principal__c = 'Sunny', SSN_of_Principal__c= '215445565', 
                                                       Current_Frontier_Customer_Number__c='12345', Pass_Fail_Comments__c = 'TestComment');
     insert acf;
     acf = [select AccountID__c, Legal_Entity_Name__c, DBA_Company_Name__c, Street_Address__c, 
                                                       City__c, State__c,  Zip_Postal_Code__c, Structure__c , Date_of_Formation__c ,  
                                                       Tax_ID_Number__c, DUNS_Number__c, Name_of_Principal__c, SSN_of_Principal__c, 
                                                       Current_Frontier_Customer_Number__c, Pass_Fail_Comments__c, AttachId__c from Alt_Channel_Form__c where AccountID__c=: acc.id limit 1];
     Attachment attachment = new Attachment();
     attachment.Body = Blob.valueOf('TestBody');
     attachment.Name = String.valueOf('test.txt');
     attachment.ParentId = acc.id;
     insert attachment;
     
     acf.AttachId__c = attachment.ParentId;
     
     update acf ;
     delete acf ;
     undelete acf ;
 }
}