@isTest(seeAllData = true)
private class ContentDocumentLinkTest {
    static testmethod void unitTest(){
        Account acc = new Account(name = 'TestAccount');
        insert acc;
        
        //Order o = new Order(AccountId = acc.id, status='Order', EffectiveDate=Date.Today());
        //upsert o;
        
        ContentVersion cv = new ContentVersion(Title='Pic', origin = 'H', PathOnClient = '/Pic.jpg'); 
        Blob bodyBlob=Blob.valueOf('Unit Test ContentVersion Body'); 
        cv.VersionData=bodyBlob; 
        insert cv;
        ContentVersion c = [SELECT ContentDocumentId FROM ContentVersion where Id = :cv.Id];
        
        ContentDocumentLink cdl = new ContentDocumentLink(LinkedEntityId = '8010L0000006qAL', ShareType = 'V', Visibility = 'AllUsers', ContentDocumentId = c.contentdocumentid);
        //insert cdl;
      }
}