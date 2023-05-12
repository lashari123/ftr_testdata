@isTest(seeAllData = true)
private class ZAddressTest {
 static testmethod void unitTest(){
     
      Account acc = new Account(name = 'TestAccount');
      insert acc;
      acc = [select id from Account where name = 'TestAccount' limit 1];
      
      Opportunity opp = new Opportunity(name = 'TestOpp 1577216802', StageName='Validating', closeDate=Date.Today());
      insert opp;
      opp = [Select id from Opportunity where name = 'TestOpp 1577216802'];
      
      SterlingQuote__c sq = new SterlingQuote__c(name='TestSQ', Account_Name__c = acc.id, OpportunityId__c = opp.id, IsSyncing__c = true);
      insert sq;
      sq = [select id from SterlingQuote__c where name='TestSQ'];
      
      SterlingQuoteItem__c sqi = new SterlingQuoteItem__c(name = 'TestSQI', SterlingQuote__c = sq.id);
      insert sqi;
      sqi = [select id from SterlingQuoteItem__c where name = 'TestSQI'];
     
      //OpportunityLineItem oli = new OpportunityLineItem(QuoteItem__c=sqi.id ,ZAddress__c='Test Address',OpportunityId =opp.id, Quantity=12,TotalPrice =1200 );
      //insert oli;     
      
      ZAddress__c z = new ZAddress__c(SterlingQuoteItem__c= sqi.id, Addressdescription__c = 'New Test', BuildingName__c = 'Test', BuildingNumber__c = '11');
      insert z;
      z = [select id from  ZAddress__c limit 1];
      
     
      update z;
      delete z;
      undelete z;
 }
}