@isTest(seeAllData=true)
	
private  class Set_ICB_FlagTest1 {

    static testMethod void Set_ICB_FlagTestMet() {
		
		Account a = new Account(Name = 'Test name for Account');
		
		//required fields
		a.phone = '585-777-777';
		insert a;
		
		Opportunity opp = new Opportunity(Name = 'Test Name for Opportunity');
		
		//required fields
		opp.AccountId = a.Id;
		opp.StageName = 'Proposal';
		opp.CloseDate = System.TODAY() + 365; 
		opp.Opportunity_Type__c = 'New';
		insert opp;
		
		
		
		Pricebook2  standardPb = [select id, name, isActive from Pricebook2 where IsStandard = true limit 1];
		
		
		Pricebook2 pB = new Pricebook2(Name = 'Test Name for Pricebook2', IsActive = True);
		insert pB;
		
		Product2 prod = new Product2(Name = 'Test Name for Product2', Item_Rate__c = 200,  isActive = true);		
		insert prod;
		
				
		PricebookEntry pBE = new PricebookEntry(Product2Id = prod.Id, Pricebook2Id = standardPb.Id, UnitPrice = 1, IsActive=true);		
		//pBE.UseStandardPrice = TRUE;
		insert pBE;
		
		OpportunityLineItem oPL = new OpportunityLineItem(PricebookEntryId = pBE.Id, OpportunityId = opp.Id, 
							UnitPrice = 3, Quantity = 10
							);
		insert oPL;
		
		Contract_Repository__c c = new Contract_Repository__c(Opportunity__c = opp.Id, CustomerSignedDate__c = System.TODAY(), CompanySigneddate__c = System.TODAY(),
							//required fields
							StartDate__c = System.TODAY(),
							ContractTerm__c = 12,
							Status__c = 'Draft',
							Account_Name__c = a.Id
			);	
		
		System.debug('*********Unit Price = ' + oPL.UnitPrice +  '\n*********Item_Rate__c = ' + prod.Item_Rate__c +
				'\n*********ICB_Flag__c = ' + c.ICB_Flag__c + '\n*********CustomerSignedDate = ' + c.CustomerSignedDate__c +
				'\n*********CompanySignedDate = ' + c.CompanySignedDate__c 
				);	
		//oPL.UnitPrice = 3;		//change the default value of unit price
		//update oPL;
		
	/*********test insert**************/
		test.startTest();
		insert c;

		test.stopTest();
		
    }

	

}