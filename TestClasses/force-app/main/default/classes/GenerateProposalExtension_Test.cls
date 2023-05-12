/**
 * @description       : This test class covers the following Apex classes:
 *      TBD_CLASS1
 *      TBD_CLASS2
 *      TBD_CLASS3
 * @author            : TBD
 * @version           : 2 
**/
@isTest //(seealldata=true)
private class GenerateProposalExtension_Test {

    static {
        update new Pricebook2(
            Id = Test.getStandardPricebookId(),
            IsActive = true
        );
    }
	static testMethod void myTest() {
		Test.startTest();

		//Insrt the data
		Account objAcc = new Account();
		objAcc.Name = 'testaccount';
		objAcc.OwnerId = userinfo.getUserId();
		objAcc.Legal_Street__c = 'test';
		objAcc.Legal_City__c = 'test';
		objAcc.Legal_State__c = 'test';
		objAcc.ShippingStreet = 'test';
		objAcc.ShippingCity = 'NY';
		objAcc.ShippingState = 'New York';
		objAcc.BillingStreet = 'test';
		objAcc.BillingCity = 'NY';
		objAcc.BillingState = 'New York';
		insert objAcc;

		Opportunity objOpp = new Opportunity();
		objOpp.Name = 'test';
		objOpp.AccountId = objAcc.id;
		objOpp.StageName = 'verbal commit';
		objOpp.CloseDate = date.today();
		objOpp.Expected_Billed_Date__c = date.today();
		objOpp.OwnerId = userinfo.getUserId();
		insert objOpp;

		SterlingQuote__c objSQ = new SterlingQuote__c();
		objSQ.name = 'test';
		objSQ.OpportunityId__c = objOpp.id;
        objSQ.ExpirationDate__c = date.today();
        objSQ.RecordTypeId= [SELECT Id FROM RecordType WHERE SobjectType='SterlingQuote__c' AND Name='SFA'].Id;
		objSQ.OwnerId = userinfo.getUserId();
		objSq.IsSyncing__c = true;
        insert objSQ;

		Product2 objProduct2_1 = new Product2(
			Name = '(Challenger)',
			IsActive = true,
			SKU__c = '',
			Item_Code__c = 'Code',
			Item_Rate__c = 10.00,
			MajorProduct__c = true,
			Item_Type__c = 'A',
			ProductCode = '1234',
			Grandfathered_Product__c = ''
		);
		insert objProduct2_1;

		PricebookEntry objPricebookEntry1 = new PricebookEntry(
			UnitPrice = 1000,
			pricebook2ID = [SELECT Id FROM Pricebook2 WHERE IsStandard = true limit 1].Id,
			IsActive = true,
			UseStandardPrice = false,
			Product2Id = objProduct2_1.Id
		);
		insert objPricebookEntry1;

		SterlingQuoteItem__c objst = new SterlingQuoteItem__c();
		objst.name = '(Challenger)';
		objst.Products__c = objProduct2_1.Id;
		objst.SterlingQuote__c = objSQ.id;
		objst.IsInFrontierFootprint__c = false;
		objst.OverallStatus__c = 'pending';
        objst.DiscountType__c = 'ICB';
        objst.CPE_NRC_Price__c = 1;
        objst.Description__c = 'Running Test Class';
		objst.ApprovalTerritory__c = 'Indiana';
		objst.ApprovalRouting__c = 'Customer Build';
		objst.ApprovalRegion__c = 'IN';
		objst.StandardMRC__c = 10.00;
		objst.StandardNRC__c = 10.00;
		objst.AdjustedMRC__c = 10.00;
		objst.AdjustedNRC__c = 10.00;
		// MGG319 2/11/2019 Added net New MRR and Qty to clear error on Generate proposal Test class
		objst.NetNewMRR__c = 240.00;
		objst.Quantity__c = 2;
		objst.OwnerId = userinfo.getUserId();
		objst.ItemOwner__c = userinfo.getUserId();
		objst.ApprovalPriority__c = 'Normal';
		objst.Locality__c = 'Indiana';
		objst.StateProvince__c = 'IN';
		// objst.State__c='IN'; 10/16 raj
		objst.NXX__c = '10';
		objst.MinorLine__c = 0.0;
		objst.SetNextApprover__c = true;
		objst.OverallStatus__c = '';
		objst.SIFT_Required__c = true;
		objst.SIFT_InquiryId__c = '1234';
		objst.Quantity__c = 1;
		insert objst;
		ApexPages.currentPage().getParameters().put('oppId', objOpp.id);
		ApexPages.currentPage().getParameters().get('proposalFuture');
		ApexPages.currentPage().getParameters().get('proposalCompany');
		SterlingQuoteItem__c obj = new SterlingQuoteItem__c();
		obj.Id = objst.Id;
		obj.DiscountType__c = 'SVP';
		update objst;

		GenerateProposalExtension objgpe = new GenerateProposalExtension();
		GenerateProposalExtension.SteringQuoteItemExtension GPsqi = new GenerateProposalExtension.SteringQuoteItemExtension();
		GPsqi.Id = '12234';
		GPsqi.ProductId = '1234';
		GPsqi.Quantity = 10;
		GPsqi.TermLength = 12;
		GPsqi.CPE_NRC_Price = 123;
		GPsqi.StandardNRC = 123;
		GPsqi.ProductName = 'Test';
		GPsqi.standardMRC = 12;
        
        ApexPages.currentPage().getParameters().put('oppId', objOpp.id);
		ApexPages.currentPage().getParameters().get('proposalFuture');
		ApexPages.currentPage().getParameters().get('proposalCompany');
		objSQ.RecordTypeId= [SELECT Id FROM RecordType WHERE SobjectType='SterlingQuote__c' AND Name='Sterling'].Id;
		objSQ.IsSyncing__c = true;
        update objSQ;

		GenerateProposalExtension testGPE = new GenerateProposalExtension();
		Test.StopTest();
	}

	static testMethod void myTest2() {
		Test.startTest();

		//Insrt the data
		Account objAcc = new Account();
		objAcc.Name = 'testaccount';
		objAcc.OwnerId = userinfo.getUserId();
		objAcc.Legal_Street__c = 'test';
		objAcc.Legal_City__c = 'test';
		objAcc.Legal_State__c = 'test';
		objAcc.ShippingStreet = 'test';
		objAcc.ShippingCity = 'NY';
		objAcc.ShippingState = 'New York';
		objAcc.BillingStreet = 'test';
		objAcc.BillingCity = 'NY';
		objAcc.BillingState = 'New York';
		insert objAcc;

		Opportunity objOpp = new Opportunity();
		objOpp.Name = 'test';
		objOpp.AccountId = objAcc.id;
		objOpp.StageName = 'verbal commit';
		objOpp.CloseDate = date.today();
		objOpp.Expected_Billed_Date__c = date.today();
		objOpp.OwnerId = userinfo.getUserId();
		insert objOpp;

		SterlingQuote__c objSQ = new SterlingQuote__c();
		objSQ.name = 'test';
		objSQ.OpportunityId__c = objOpp.id;
		objSQ.ExpirationDate__c = date.today();
		objSQ.OwnerId = userinfo.getUserId();
		objSq.IsSyncing__c = true;
		insert objSQ;

		Product2 objProduct2_1 = new Product2(
			Name = 'Testing Name',
			IsActive = true,
			SKU__c = '',
			Item_Code__c = 'Code',
			Item_Rate__c = 10.00,
			MajorProduct__c = true,
			Item_Type__c = 'A',
			ProductCode = '1234',
			Grandfathered_Product__c = ''
		);
		insert objProduct2_1;

		PricebookEntry objPricebookEntry1 = new PricebookEntry(
			UnitPrice = 1000,
			pricebook2ID = [SELECT Id FROM Pricebook2 WHERE IsStandard = true limit 1].Id,
			IsActive = true,
			UseStandardPrice = false,
			Product2Id = objProduct2_1.Id
		);
        insert objPricebookEntry1;

		SterlingQuoteItem__c objst = new SterlingQuoteItem__c();
		objst.name = 'test';
		objst.Products__c = objProduct2_1.Id;
		objst.SterlingQuote__c = objSQ.id;
		objst.IsInFrontierFootprint__c = false;
		objst.OverallStatus__c = 'pending';
		objst.DiscountType__c = 'ICB';
        objst.Description__c = 'Running Test Class';
		objst.ApprovalTerritory__c = 'Indiana';
		objst.ApprovalRouting__c = 'Customer Build';
		objst.ApprovalRegion__c = 'IN';
		objst.StandardMRC__c = 10.00;
		objst.StandardNRC__c = 10.00;
		objst.AdjustedMRC__c = 10.00;
		objst.AdjustedNRC__c = 10.00;
		// MGG319 2/11/2019 Added net New MRR and Qty to clear error on Generate proposal Test class
		objst.NetNewMRR__c = 240.00;
		objst.Quantity__c = 2;
		objst.OwnerId = userinfo.getUserId();
		objst.ItemOwner__c = userinfo.getUserId();
		objst.ApprovalPriority__c = 'Normal';
		objst.Locality__c = 'Indiana';
		objst.StateProvince__c = 'IN';
		// objst.State__c='IN'; 10/16 raj
		objst.NXX__c = '10';
		objst.MinorLine__c = 0.0;
		objst.SetNextApprover__c = true;
		objst.OverallStatus__c = 'Approved';
		objst.SIFT_Required__c = true;
		objst.SIFT_InquiryId__c = '1234';
		objst.Quantity__c = 1;
		insert objst;

		GenerateProposalExtension.SteringQuoteItemExtension oliWrapper = new GenerateProposalExtension.SteringQuoteItemExtension(
			new OpportunityLineItem(
				Quantity = 1,
				Term_Months__c = 12,
				DiscountType__c = 'BDT',
				Renewal_MRR__c = 1,
				CPQ_NetNewMRR__c = 1,
				CPE_Gross_Margin__c = 1,
				UnitPrice = 1,
				CPE_NRC_Price__c = 1,
				Speed__c = '200 Mbps',
				vlocity_cmt__OneTimeCharge__c = 1,
				vlocity_cmt__EffectiveQuantity__c = 1,
				Product2Id = objProduct2_1.Id,
				vlocity_cmt__RecurringCharge__c = 1,
				vlocity_cmt__ServiceAccountId__c = objAcc.Id,
				OpportunityId = objOpp.Id,
				Opportunity_Sync__c = 'Vlocity'
			)
		);

		//  PricebookEntry pbEntry = [SELECT Id, Product2Id, Product2.Id, Product2.MajorProduct__c, Product2.Name FROM PriceBookEntry WHERE PriceBook2.isStandard=true AND Product2Id =: objst.Products__c];
		ApexPages.currentPage().getParameters().put('oppId', objOpp.id);
		ApexPages.currentPage().getParameters().get('proposalFuture');
		ApexPages.currentPage().getParameters().get('proposalCompany');
		SterlingQuoteItem__c obj = new SterlingQuoteItem__c();
		obj.Id = objst.Id;
		obj.DiscountType__c = 'ISB';
		objst.OverallStatus__c = 'Approved';
		update objst;
		//GenerateProposalExtension.strQuoteItemsExtensions sterIE = new GenerateProposalExtension.strQuoteItemsExtensions();

		GenerateProposalExtension objgpe = new GenerateProposalExtension();
		GenerateProposalExtension.SteringQuoteItemExtension GPsqi = new GenerateProposalExtension.SteringQuoteItemExtension();
		GPsqi.Id = '12234';
		GPsqi.ProductId = '1234';
		GPsqi.Quantity = 10;
		GPsqi.TermLength = 12;
		GPsqi.CPE_NRC_Price = 123;
		GPsqi.StandardNRC = 123;
		GPsqi.ProductName = 'Test';
		GPsqi.standardMRC = 12;

		/*     objst.DiscountType__c ='';
        update objst;
        GenerateProposalExtension objgpe1 = new GenerateProposalExtension();        
        
  /*      objst.OverallStatus__c = 'Approved';
        objst.DiscountType__c ='ISB';
        update objst;
        GenerateProposalExtension objgpe2 = new GenerateProposalExtension(); 
        
        List<SterlingQuoteItem__c> majorItemList ;
        //SterlingQuoteItem__c var = majorItemList; */

		Test.StopTest();
	}
}