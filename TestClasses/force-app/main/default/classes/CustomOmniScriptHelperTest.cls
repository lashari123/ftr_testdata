/**
 * @description       : This test class covers the following Apex class:
 *      TBD_CLASS1
 *      TBD_CLASS2
 *      TBD_CLASS3
 * @author            : TBD
 * @version           : 2
**/
@isTest
public class CustomOmniScriptHelperTest {
	@TestSetup
	static void makeData() {
		Account a = ftr_TestDataFactory.getAccounts(1)[0];
		a.Customer_Number__c = '123';
		insert a;
		insert new Contact(FirstName = 'Test', LastName = 'Contact', Email = 'test@test.com', Phone = '5555551234');
		insert new ftr_DPIBillingDetails__c(BillingTelephoneNumber__c = '12345', Customer_Number__c = '123');
		insert ftr_TestDataFactory.getAccounts(1);
		Group q = [SELECT Id, Email FROM Group WHERE DeveloperName = 'Managed_Services_Architect' AND Type = 'Queue'];
		if (q == null) {
			insert new Group(
				Email = 'test@test.com',
				DeveloperName = 'Managed_Services_Architect',
				Name = 'Managed_Services_Architect',
				Type = 'Queue'
			);
		} else {
			q.Email = 'test@test.com';
			update q;
		}
	}

	@IsTest
	static void getOptionalChildProductsToAddTest() {
		Map<String, Object> output = new Map<String, Object>();
		Map<String, Object> options = new Map<String, Object>();
		Map<String, Object> input = new Map<String, Object>();
		input.put('ProductCode', '1234');
		input.put('ServiceAccountId', '001238dafkj9');
		input.put('ProductCodeToAdd', '001238dafkj9');
		input.put('ContextId', '123414');
		Test.startTest();

		CustomOmniScriptHelper testing = new CustomOmniScriptHelper();
		testing.invokeMethod('getOptionalChildProductsToAdd', input, output, options);
		Test.stopTest();
	}

	@IsTest
	static void updateAccountStatusTest() {
		Map<String, Object> output = new Map<String, Object>();
		Map<String, Object> options = new Map<String, Object>();
		Map<String, Object> input = new Map<String, Object>();

		Test.startTest();

		input.put('AccountId', [SELECT Id FROM Account LIMIT 1].Id);
		CustomOmniScriptHelper testing = new CustomOmniScriptHelper();
		testing.invokeMethod('updateAccountStatus', input, output, options);
		input.put('AccountId', [SELECT Id FROM Account LIMIT 1].Id);
		try {
			testing.invokeMethod('updateAccountStatus', input, output, options);
		} catch (Exception e) {
			System.debug('Exception thrown, as expected!');
		}
		Test.stopTest();
	}
	
	@IsTest
	static void transformGoogleAddressComponentsTest() {
		Map<String, Object> output = new Map<String, Object>();
		Map<String, Object> options = new Map<String, Object>();
		Map<String, Object> input = new Map<String, Object>();

		List<Object> addressComponents = (List<Object>) JSON.deserializeUntyped('[{"long_name": "277","short_name": "277","types": ["street_number"]},{"long_name": "Bedford Avenue","short_name": "Bedford Ave","types": ["route"]},{"long_name": "Williamsburg","short_name": "Williamsburg","types": ["neighborhood","political"]},{"long_name": "Brooklyn","short_name": "Brooklyn","types": ["political","sublocality","sublocality_level_1"]},{"long_name": "Kings County","short_name": "Kings County","types": ["administrative_area_level_2","political"]},{"long_name": "New York","short_name": "NY","types": ["administrative_area_level_1","political"]},{"long_name": "United States","short_name": "US","types": ["country","political"]},{"long_name": "11211","short_name": "11211","types": ["postal_code"]}]');
		input.put('address_components', addressComponents);

		Test.startTest();

		CustomOmniScriptHelper testing = new CustomOmniScriptHelper();
		testing.invokeMethod('transformGoogleAddressComponents', input, output, options);
		Test.stopTest();
	}

	@IsTest
	static void getUniqueBTNDetailsTest() {
		Map<String, Object> output = new Map<String, Object>();
		Map<String, Object> options = new Map<String, Object>();
		Map<String, Object> input = new Map<String, Object>();

		Test.startTest();

		input.put('CustomerNumber', '123');
		CustomOmniScriptHelper testing = new CustomOmniScriptHelper();
		testing.invokeMethod('getUniqueBTNDetails', input, output, options);
	}
	@IsTest
	static void sendMSAEmailTest() {
		Map<String, Object> output = new Map<String, Object>();
		Map<String, Object> options = new Map<String, Object>();
		Map<String, Object> input = new Map<String, Object>();
		input.put('OrderNumber', '1234');
		input.put('ContextId', '001238dafkj9');
		Test.startTest();

		CustomOmniScriptHelper testing = new CustomOmniScriptHelper();
		testing.invokeMethod('sendMSAEmail', input, output, options);
		Test.stopTest();
	}

	@IsTest
	static void updateOrderStageTest() {
		Map<String, Object> output = new Map<String, Object>();
		Map<String, Object> options = new Map<String, Object>();
		Map<String, Object> input = new Map<String, Object>();
		Order[] orders = ftr_TestDataFactory.getOrders(1);
		insert orders;
		input.put('OrderId', orders[0].Id);
		input.put('OrderStage', 'IT Review');
		Test.startTest();

		CustomOmniScriptHelper testing = new CustomOmniScriptHelper();
		testing.invokeMethod('updateOrderStage', input, output, options);
		Test.stopTest();
	}

	@IsTest
	static void shareServiceAccRecordsTest() {
		Map<String, Object> output = new Map<String, Object>();
		Map<String, Object> options = new Map<String, Object>();
		Map<String, Object> input = new Map<String, Object>();

		User u = ftr_TestDataFactory.getUsers(new List<String>{ 'Frontier Sales User' })[0];
		insert u;

		input.put('OrderItem', new Map<String, Object>{ 'ServiceAccountId' => [SELECT Id FROM Account LIMIT 1].Id });
		Test.startTest();
		System.runAs(u) {
			CustomOmniScriptHelper testing = new CustomOmniScriptHelper();
			testing.invokeMethod('shareServiceAccRecords', input, output, options);
		}
		Test.stopTest();
	}

	@IsTest
	static void searchTest() {
		Map<String, Object> output = new Map<String, Object>();
		Map<String, Object> options = new Map<String, Object>();
		Map<String, Object> input = new Map<String, Object>();

		input.put('objectName', 'Contact');
		input.put('searchFields', 'Name');
		input.put('returnFields', 'Name');
		input.put('searchTerm', 'Test');
		input.put('filter', 'LastName = \'Contact\'');

		Test.startTest();
		CustomOmniScriptHelper testing = new CustomOmniScriptHelper();
		testing.invokeMethod('search', input, output, options);
		Test.stopTest();
	}
    
    @IsTest
	static void deleteTest() {
		Map<String, Object> output = new Map<String, Object>();
		Map<String, Object> options = new Map<String, Object>();
		Map<String, Object> input = new Map<String, Object>();
        
        Account[] accList = ftr_TestDataFactory.getServAccountsWithPremise(1);
		update accList;

		input.put('recordId', accList[0].Id);

		Test.startTest();
		CustomOmniScriptHelper testing = new CustomOmniScriptHelper();
		testing.invokeMethod('deleteRecord', input, output, options);
		Test.stopTest();
	}
	
    @IsTest
	static void getRecordTypeIdTest() {
		Map<String, Object> output = new Map<String, Object>();
		Map<String, Object> options = new Map<String, Object>();
		Map<String, Object> input = new Map<String, Object>();

		input.put('objectName', 'Case');
		input.put('recordTypeName', 'Account Creation');

		Test.startTest();
		CustomOmniScriptHelper testing = new CustomOmniScriptHelper();
		testing.invokeMethod('getRecordTypeId', input, output, options);
		Test.stopTest();
	}


	@IsTest
	static void associateUNIsTest() {
		Map<String, Object> output = new Map<String, Object>();
		Map<String, Object> options = new Map<String, Object>();
		Map<String, Object> input = new Map<String, Object>();
		Map<String, String> prodMap = new Map<String, string>{ 'ENT_ETH_UNI_0001' => 'ENT_ETH_UNI_0001', 'ENT_ETH_EIA_0002' => 'ENT_ETH_EIA_0002' };
		Account[] accList = ftr_TestDataFactory.getServAccountsWithPremise(1);
		update accList;
		Order[] orders = ftr_TestDataFactory.getOrders(1);
		insert orders;
		OrderItem[] oLIs = ftr_TestDataFactory.getOrderItems(2, prodMap);
		oLIs[0].vlocity_cmt__ServiceAccountId__c = accList[0].Id;
		oLIs[0].OrderId = orders[0].Id;
		oLIs[1].OrderId = orders[0].Id;
		oLIs[1].vlocity_cmt__ServiceAccountId__c = accList[0].Id;
		insert oLIs;
		input.put('OrderId', orders[0].Id);
		Test.startTest();

		CustomOmniScriptHelper testing = new CustomOmniScriptHelper();
		testing.invokeMethod('associateUNIs', input, output, options);
		Test.stopTest();
	}
    
    @IsTest
	static void addUNITest() {
		Map<String, Object> output = new Map<String, Object>();
		Map<String, Object> options = new Map<String, Object>();
		Map<String, Object> input = new Map<String, Object>();
		Map<String, String> prodMap = new Map<String, string>{ 'ENT_ETH_UNI_0001' => 'ENT_ETH_UNI_0001', 'ENT_ETH_EIA_0002' => 'ENT_ETH_EIA_0002' };
        
        insert ftr_TestDataFactory.getQLI(1, 1);
        List<QuoteLineItem> qlis = [
            SELECT Id, vlocity_cmt__ServiceAccountId__c, Quantity, Term__c, Speed__c, vlocity_cmt__Product2Id__c, QuoteId, vlocity_cmt__BillingAccountId__c, 
            vlocity_cmt__LineNumber__c, Product2Id, vlocity_cmt__JSONAttribute__c, PricebookEntry.Product2.ProductCode
            FROM QuoteLineItem
        ];

        Quote qt = [select id, Service_Term__c from quote where id=:(Id)qlis[0].get('QuoteId')];
        qt.OmniscriptData__c = '[ { "ATTR_PHY_MEDIUM": "Fiber Single Mode 1310nm" } ]';
        update qt;
        
        Integer numOfProdForEachProdCode = 1;
        List<PricebookEntry> pbeList = ftr_TestDataFactory.getProductswithPbe(prodMap, numOfProdForEachProdCode);
        insert pbeList;
        
		input.put('cartId', qt.Id);
		Test.startTest();

		CustomOmniScriptHelper testing = new CustomOmniScriptHelper();
		testing.invokeMethod('addUNI', input, output, options);
		Test.stopTest();
	}
}