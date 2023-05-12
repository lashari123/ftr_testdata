/**
 * @description       : This test class covers the following Apex classes:
 *      TBD_CLASS1
 *      TBD_CLASS2
 *      TBD_CLASS3
 * @author            : TBD
 * @version           : 1 
**/
@IsTest //(seeAllData=true)
public class Quote_Line_Item_Product_Wrapper_Test {
	private class TestData {
		public Opportunity testOpportunity;
		public SterlingQuote__c testQuote;
		public SterlingQuoteItem__c testQuoteItem;
		public OpportunityLineItem testOpportunityProduct;

		public TestData() {
			this.testOpportunity = Test_Fixture_Factory.createTestOpportunity();
			this.testQuote = Test_Fixture_Factory.createTestQuote(testOpportunity.Id, '', 'Pending - Finance');
			this.testQuoteItem = [
				SELECT
					DiscountType__c,
					OverallStatus__c,
					OpportunityLineItemId__c,
					Category__c,
					Part_Number__c,
					CurrentStatus__c,
					Quantity__c,
					IsPromoProduct__c,
					TermLength__c,
					NumInstallments__c,
					Renewal_MRR_Original__c,
					NetNewMRR__c,
					AdjustedNRC__c,
					AdjustedMRC__c
				FROM SterlingQuoteItem__c
				WHERE SterlingQuote__c = :testQuote.Id
				LIMIT 1
			];

			this.testQuoteItem.Category__c = 'Equipment';
			this.testQuoteItem.Part_Number__c = '1234';
			this.testQuoteItem.CurrentStatus__c = 'Pending - Finance';
			this.testQuoteItem.Quantity__c = 1;
			this.testQuoteItem.IsPromoProduct__c = true;
			this.testQuoteItem.TermLength__c = 12;
			this.testQuoteItem.NumInstallments__c = 5;
			this.testQuoteItem.Renewal_MRR_Original__c = 0;
			this.testQuoteItem.NetNewMRR__c = 10.00;
			this.testQuoteItem.AdjustedNRC__c = 2.00;
			this.testQuoteItem.OverallStatus__c = 'Pending - Finance';
			this.testQuoteItem.RecordType = [SELECT Id, Name FROM RecordType WHERE sObjectType = 'SterlingQuoteItem__c' AND name = 'SFA' LIMIT 1];
			this.testQuoteItem.AdjustedMRC__c = 12.00;
			this.testQuoteItem.Currentstatus__c = 'Pending - Finance';
			this.testQuoteItem.Overallstatus__c = 'Pending';
			this.testQuoteItem.DiscountType__c = 'None';
			update this.testQuoteItem;

			this.testOpportunityProduct = [
				SELECT
					CPE_Gross_Margin__c,
					CPE_NRC_Price__c,
					NRC_Price__c,
					Product2.Name,
					Service_Address__c,
					CPQ_NetNewMRR__c,
					Renewal_MRR__c,
					Speed__c,
					Quantity,
					OpportunityId,
					TotalPrice,
                    PricebookEntryId,
                    vlocity_cmt__ServiceAccountId__r.Name,
                	ZAddress__c
                	
				FROM OpportunityLineItem
				WHERE Id = :this.testQuoteItem.OpportunityLineItemId__c
			];
		}
	}

	private static Quote_Line_Item_Product_Wrapper getTestQLIPW() {
		TestData td = new TestData();
		return new Quote_Line_Item_Product_Wrapper(td.testQuoteItem, td.testOpportunityProduct);
	}

	@IsTest
	public static void empty_constructor_test() {
		Quote_Line_Item_Product_Wrapper testQLIPW = new Quote_Line_Item_Product_Wrapper();
		system.assert(testQLIPW.name == 'test');
	}
    
    @IsTest
	public static void adding_vlocity_olis_test() {
        TestData td = new TestData();
        ftr_TestDataFactory.getAccounts(1);
        td.testOpportunityProduct.Opportunity_Sync__c = 'Vlocity';
        td.testOpportunityProduct.vlocity_cmt__ServiceAccountId__c = ftr_TestDataFactory.getAccounts(1)[0].Id;
        td.testOpportunityProduct.Term_Months__c = 60;
        td.testOpportunityProduct.vlocity_cmt__OneTimeCharge__c = 1;
        td.testOpportunityProduct.ftr_isApplyDiscount__c = true;
        td.testOpportunityProduct.Product2.ProductCode  = 'ENT_ETH_EIA_0002';
        td.testOpportunityProduct.ftr_DiscountPrice__c = 100;
		Quote_Line_Item_Product_Wrapper testQLIPW = new Quote_Line_Item_Product_Wrapper(td.testOpportunityProduct);
	}

	@IsTest
	public static void sqi_oli_zaddr_constructor_test() {
		TestData td = new TestData();
		Quote_Line_Item_Product_Wrapper testQLIPW = new Quote_Line_Item_Product_Wrapper(td.testQuoteItem, td.testOpportunityProduct, null);
		Quote_Line_Item_Product_Wrapper testQLIPW2 = new Quote_Line_Item_Product_Wrapper(td.testQuoteItem, td.testOpportunityProduct);
		system.assert(testQLIPW.name == td.testOpportunityProduct.Product2.Name);
		system.assert(testQLIPW2.name == td.testOpportunityProduct.Product2.Name);
	}

	@IsTest
	private static Void isNotAdditionalChargeProduct_Test() {
		Quote_Line_Item_Product_Wrapper testQLIPW = getTestQLIPW();
		Boolean res = Quote_Line_Item_Product_Wrapper.isNotAdditionalChargeProduct(testQLIPW);
		System.assert(res, 'Res should have been true but was ' + res);

		testQLIPW.name = 'Surcharge';
		res = Quote_Line_Item_Product_Wrapper.isNotAdditionalChargeProduct(testQLIPW);
		System.assert(!res, 'Res should have been false because name containing Surcharge indicates an additional charge product, but was ' + res);
	}

	@IsTest
	private static Void isNotDiscounted_Test() {
		Quote_Line_Item_Product_Wrapper qlipw = getTestQLIPW();
		Boolean res = Quote_Line_Item_Product_Wrapper.isNotDiscounted(qlipw);
		System.assert(res, 'Default Discount Type is empty, so Res should have been true indicating no discount, but was ' + res);

		qlipw.discountType = 'ICB';
		qlipw.overallStatus = 'Approved';
		res = Quote_Line_Item_Product_Wrapper.isNotDiscounted(qlipw);
		System.assert(res, 'Overall Status is Approved, so Res should have been true indicating no discount, but was ' + res);

		qlipw.overallStatus = '';
		res = Quote_Line_Item_Product_Wrapper.isNotDiscounted(qlipw);
		System.assert(!res, 'Discount Type is ICB, so Res should have been false indicating the product was discounted, but was ' + res);
	}

	@IsTest
	private static Void removeChallengerAndLeader_Test() {
		String res = Quote_Line_Item_Product_Wrapper.removeChallengerAndLeader('');
		System.assert(res == '', 'Response should have been empty string but was ' + res);

		res = Quote_Line_Item_Product_Wrapper.removeChallengerAndLeader('Test1');
		System.assert(res == 'Test1', 'Response should have been Test1 but was ' + res);

		res = Quote_Line_Item_Product_Wrapper.removeChallengerAndLeader('Test2 - Challenger');
		System.assert(res == 'Test2', 'Response should have been Test2 but was ' + res);

		res = Quote_Line_Item_Product_Wrapper.removeChallengerAndLeader('Test3 - Leader');
		System.assert(res == 'Test3', 'Response should have been Test3 but was ' + res);

		res = Quote_Line_Item_Product_Wrapper.removeChallengerAndLeader('Challenger');
		System.assert(res == '', 'Response should have been empty string but was ' + res);

		res = Quote_Line_Item_Product_Wrapper.removeChallengerAndLeader('Leader');
		System.assert(res == '', 'Response should have been empty string but was ' + res);
	}

	@IsTest
	private static Void getOppProductToAdd_Test() {
		Quote_Line_Item_Product_Wrapper res = Quote_Line_Item_Product_Wrapper.getOppProductToAdd(getTestQLIPW());
		System.assert(res != null, 'Response was null');
	}

	@IsTest
	private static Void getQuickQuoteWrappers_Test() {
		TestData td = new TestData();
		Test.startTest();
		List<Quote_Line_Item_Product_Wrapper> res = Quote_Line_Item_Product_Wrapper.getQuickQuoteWrappers(td.testOpportunity.Id, td.testQuote.Id);
		System.assert(res != null && res.size() > 0, 'Response came back empty');
		Test.stopTest();
	}

	@IsTest
	private static Void getTotalQuickQuoteValue_test() {
		Decimal res = Quote_Line_Item_Product_Wrapper.getTotalQuickQuoteValue(new List<Quote_Line_Item_Product_Wrapper>{ getTestQLIPW() });
		System.assert(res > 0, 'getTotalQuickQuoteValue should have returned a positive value but returned 0.');
	}
}