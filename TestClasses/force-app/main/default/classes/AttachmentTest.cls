@isTest(seeAllData = true)
private class AttachmentTest {
 static testmethod void unitTest(){
      Account acc = new Account(name = 'TestAccount');
      insert acc;
      acc = [select id from Account where name = 'TestAccount'];
     
      Opportunity opp = new Opportunity(name='TestOpp',AccountId= acc.id, CloseDate= Date.Today(), StageName='Validating');
      insert opp;
      opp = [select id, Redline_email_no__c from Opportunity where AccountId =: acc.id limit 1]; 
     /*
      Product2 p = new Product2(name = 'TestProduct', IsActive = true);
      insert p;
      p= [select id from Product2 where name = 'TestProduct'];
    
      Pricebook2 pb1 = [select Id from Pricebook2 where isStandard=true];
    
      PricebookEntry pbe = new PricebookEntry(Pricebook2Id = pb1.id, Product2Id= p.id, UnitPrice = 10, UseStandardPrice = false, isActive = true);
      insert pbe;
      pbe = [select id from PricebookEntry where Pricebook2Id =: pb1.id limit 1];
    */
      PriceBookEntry pbe = [SELECT Id, Product2Id, Product2.Id, Product2.Name FROM PriceBookEntry WHERE PriceBook2.isStandard=true and isActive = true LIMIT 1];     
      
      OpportunityLineItem oli = new OpportunityLineItem(UnitPrice = 3, OpportunityId=opp.id, Quantity=10, PricebookEntryId=pbe.id);
      insert oli;
     
      Contract ctr = new Contract(AccountId = acc.id, Opportunity__c = opp.id, ICB_Flag__c = 'Y', Icb_for_email_for_test__c = true);
      insert  ctr;             
     
      ctr = [select id, CustomerSignedDate, CompanySignedDate from Contract where AccountId =: acc.id limit 1];
      ctr.CompanySignedDate = Date.Today();
      ctr.CustomerSignedDate = Date.Today();
      update ctr;
      ctr = [select id, CustomerSignedDate, CompanySignedDate from Contract where AccountId =: acc.id limit 1];
      
      
      Schedule__c sch = new Schedule__c(Contract__c=ctr.id, Schedule_Start_Date__c=Date.Today());
      insert sch;
      sch = [select id from Schedule__c where Contract__c =: ctr.id limit 1];
      
      List<Attachment> athList = new List<Attachment>();
      Attachment ath1 = new Attachment();
      ath1.Body = Blob.valueOf('TestBody');
      ath1.Name = String.valueOf(Opp.Redline_email_no__c+'FinalFinalYaFinal.doc');
      ath1.ParentId = ctr.id;
      athList.add(ath1);
      Attachment ath2 = new Attachment();
      ath2.Body = Blob.valueOf('TestBody');
      ath2.Name = String.valueOf(Opp.Redline_email_no__c+'.Redlinefinaltext.docx');
      ath2.ParentId = sch.id;
      athList.add(ath2);
      
      Attachment ath3 = new Attachment();
      ath3.Body = Blob.valueOf('TestBody');
      ath3.Name = String.valueOf(Opp.Redline_email_no__c+'YaYaYa.txt');
      ath3.ParentId = opp.id;
      athList.add(ath3);      
      
      insert athList;
      athList = [select id from Attachment where parentId =:ctr.id or parentId =: sch.id or ParentId =: opp.id];
      update athList;
      delete athList;
      undelete athList;
    
 }
}