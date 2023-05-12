@IsTest(seeAllData = true)
private class QuoteSync_Test
{
     private static testMethod void testAutoRun() 
  {
    		test.startTest();
      		PageReference pageRef = Page.QuoteSync;
       		Opportunity testOppty = [SELECT Quote_ID__c FROM Opportunity LIMIT 1];
			SterlingQuoteItem__c SQI = [SELECT SterlingQuote__c FROM SterlingQuoteItem__c WHERE SterlingQuote__c != null limit 1];
       		SterlingQuote__c sQuote =[SELECT id,IsSyncing__c FROM  SterlingQuote__c where OpportunityId__c != null AND ID = :SQI.SterlingQuote__c and IsSyncing__c = true LIMIT 1];
      		Test.setCurrentPage(pageRef);
      
       		pageRef.getParameters().put('id',sQuote.Id);
      		ApexPages.StandardController sc = new ApexPages.standardController(testOppty);
      
      		QuoteSync  controller = new QuoteSync(sc);
      		controller.QuoteSyncmethod();
    		test.stopTest();
            SterlingQuote__c sQuotenew =[SELECT IsSyncing__c FROM  SterlingQuote__c where id= :sQuote.Id];
            System.AssertNotEquals(sQuote.IsSyncing__c,sQuotenew.IsSyncing__c);
  } 
     private static testMethod void testAutoRun1() 
  {
    		test.startTest();
      		PageReference pageRef = Page.QuoteSync;
       		Opportunity testOppty = [SELECT Quote_ID__c FROM Opportunity LIMIT 1];
			SterlingQuoteItem__c SQI = [SELECT SterlingQuote__c FROM SterlingQuoteItem__c WHERE SterlingQuote__c != null limit 1];
       		SterlingQuote__c sQuote =[SELECT id,IsSyncing__c FROM  SterlingQuote__c where OpportunityId__c != null AND ID = :SQI.SterlingQuote__c and IsSyncing__c = true LIMIT 1];
      		sQuote.IsSyncing__c = false;
      		update sQuote;
      		Test.setCurrentPage(pageRef);
      
       		pageRef.getParameters().put('id',sQuote.Id);
      		ApexPages.StandardController sc = new ApexPages.standardController(testOppty);
      
      		QuoteSync  controller = new QuoteSync(sc);
      		controller.QuoteSyncmethod();
     		test.stopTest();
            SterlingQuote__c sQuotenew =[SELECT IsSyncing__c FROM  SterlingQuote__c where id= :sQuote.Id];
            System.AssertNotEquals(sQuote.IsSyncing__c,sQuotenew.IsSyncing__c);
  } 
}