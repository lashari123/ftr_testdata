@IsTest(seeAllData = true)
public class sfaQuoteView_Controller_Test 
{
	 @isTest static void testAutoRun11() 
	{
            RecordType Rt = [SELECT Id,name  FROM RecordType WHERE SobjectType = 'SterlingQuote__c' LIMIT 1];
        			
        	Account acc = new Account(Name = 'Test Account',BillingStreet='23100 Avenue San Luis',BillingCity= 'WoodLandHills',
						BillingState= 'California',BillingCountry ='United States',BillingPostalCode ='91364',Legal_Street__c ='23100 Avenue San Luis',
						Legal_City__c='WOODLAND HILLS',Legal_State__c='California',Legal_Zip__c ='91364',Legal_Country1__c='United States',ShippingStreet='23100 Avenue San Luis',
                        ShippingCity='WODLAND',ShippingState='California',ShippingCountry='United States',ShippingPostalCode ='91364');
            insert acc;
            
            Opportunity opp = new Opportunity();
            opp.Name = 'Test Opportunity';
            opp.StageName = 'Prospecting';
            opp.CloseDate = Date.today();
            opp.AccountId = acc.Id;
			opp.Opportunity_Type__c='New';
			opp.Pricebook2Id = Test.getStandardPricebookId();
            insert opp;
        	SterlingQuote__c testQuote = Test_Fixture_Factory.createTestQuote(opp.Id, 'None', '');
        	SterlingQuoteItem__c SQI = [SELECT SterlingQuote__c,OpportunityId__c,Products__c FROM SterlingQuoteItem__c WHERE SterlingQuote__c != null limit 1];
        	SterlingQuote__c sQuotenew =[SELECT id, OpportunityId__c,Name FROM  SterlingQuote__c where Id = :SQI.SterlingQuote__c LIMIT 1];
        	Id Accountid = [SELECT AccountId FROM Opportunity WHERE Id = :sQuotenew.OpportunityId__c LIMIT 1].AccountId;
            List<Product2> products = [SELECT Id, Name, Description, Family, ProductCode, UnitPrice__c 
            FROM Product2 WHERE isActive = true  and ProductCode != null limit 10];
        	ACCOUNT Acct = [SELECT BillingStreet,BillingCity,BillingState,BillingPostalCode FROM ACCOUNT WHERE id =: Accountid];
			
        	sfaQuoteView_Controller.getQuoteItems(SQI.SterlingQuote__c);
        	sfaQuoteView_Controller.QuoteWrapper wrapper= new sfaQuoteView_Controller.QuoteWrapper();
        	wrapper.Id = SQI.SterlingQuote__c;
        	wrapper.street = Acct.BillingStreet;    
        	wrapper.city = Acct.BillingCity;  
        	wrapper.state = Acct.BillingState; 
        	wrapper.postalCode = Acct.BillingPostalCode; 
        	wrapper.name = sQuotenew.Name; 
        //	String expirationDate =  date.today().format();
		//	wrapper.expirationDate = '2019-11-11';
		    wrapper.expirationDate = date.today();
        	wrapper.opportunityId = sQuotenew.OpportunityId__c; 
        	wrapper.addressCategory = 'test addressCategory';


        	List<ftrProductWrapper> res = new List<ftrProductWrapper>();
        	for (Product2 product : products) {
            res.add(new ftrProductWrapper(product));
        	}
        	system.debug('res'+res);
        	wrapper.products = res;
        	system.debug('wrapper.Id' +wrapper.Id);
        	system.debug('wrapper.man' +wrapper);
        	sfaQuoteView_Controller.updateSfaQuote(wrapper);
    }
    
}