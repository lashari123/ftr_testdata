/**
* @author: Stepan Ruzicka
* @email: stepan.ruzicka@cz.ibm.com
* @date: 04/11/2019
* @descriptin: Test Class to test logic that implements methods related to OrderItem sObject which can be used from anywhere - trigger, batch, webservice etc.
* @name OrderServiceTst.cls
*/
@isTest
public class OrderServiceTest {

    @TestSetup
    static void makeData(){
        
        // Create Account
        Account testAccount = new Account();
        testAccount.Name = 'Test Account';
        testAccount.BillingStreet = '123 Main Street';
        testAccount.BillingCity = 'Anywhere';
        testAccount.BillingState = 'Ohio';
        testAccount.BillingPostalCode = '44088';
        testAccount.ShippingStreet = '123 Main Street';
        testAccount.ShippingCity = 'Anywhere';
        testAccount.ShippingState = 'Ohio';
        testAccount.ShippingPostalCode = '44088';
        //testAccount.RecordTypeId = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Master').getRecordTypeId();
        insert testAccount;
        
        vlocity_cmt__Premises__c oPremise = new vlocity_cmt__Premises__c();
        oPremise.vlocity_cmt__Address1__c = '123 Main Street';
        oPremise.vlocity_cmt__City__c = 'Anywhere';
        oPremise.vlocity_cmt__State__c = 'California';
        oPremise.vlocity_cmt__PostalCode__c = '44076';
        oPremise.vlocity_cmt__Status__c = 'Connected';
        oPremise.DSAT_Ticket__c = '211212';
        oPremise.Copper_Tier__c = 'Tier 1';
        oPremise.Fiber_Tier__c = 'Tier 1';
        oPremise.Last_DSAT_Check__c = system.today();
        oPremise.WC_QOS__c = 'Platinum';
        oPremise.WC_Speed__c = '1000MB';
        oPremise.Market__c = 'B';
        oPremise.Level__c = 'a';
	     oPremise.vlocity_cmt__PropertyOwnerAccountId__c = testAccount.Id;
        insert oPremise;
        
        Account testSAccount = new Account();
        testSAccount.Name = 'Test Service Account';
        testSAccount.BillingStreet = '123 Main Street';
        testSAccount.BillingCity = 'Anywhere';
        testSAccount.BillingState = 'Ohio';
        testSAccount.BillingPostalCode = '44088';
        testSAccount.ShippingStreet = '123 Main Street';
        testSAccount.ShippingCity = 'Anywhere';
        testSAccount.ShippingState = 'Ohio';
        testSAccount.ShippingPostalCode = '44088';
        testSAccount.vlocity_cmt__PremisesId__c = oPremise.id;
        testSAccount.MDU_WireCenter__c = 'Wire Center';
        testSAccount.RecordTypeId = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Service').getRecordTypeId();
        insert testSAccount;
        
        Opportunity opp = new Opportunity();
        opp.Name = 'RefreshTestOpp';
        opp.AccountId = testAccount.id;
        Date d1=Date.newInstance(2019, 05, 11);
        opp.CloseDate=d1;
        opp.StageName='Investigating';
        opp.CPE_Product__c='No';
        opp.RecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Opportunity Lightning').getRecordTypeId();
        insert opp;
        
        id pricebookId = Test.getStandardPricebookId();
        List<Product2> lstProduct2 = new List<Product2>();
        Product2 product = new Product2();
        product.Name = 'EIA';
        product.ProductCode = 'ENT_ETH_EIA_0001';
        product.IsActive = true;
        lstProduct2.add(product);

        Product2 prodEVC = new Product2();
        prodEVC.Name = 'EVC';
        prodEVC.ProductCode = 'ENT_ETH_EVC_0001';
        prodEVC.IsActive = true;
        lstProduct2.add(prodEVC);
        
        Product2 prodAccess = new Product2();
        prodAccess.Name = 'Access';
        prodAccess.ProductCode = 'ENT_ETH_ACCESS_0001';
        prodAccess.IsActive = true;
        lstProduct2.add(prodAccess);
		//Insert products
        insert lstProduct2;  
        
        PricebookEntry standardPrice = new PricebookEntry(
            Pricebook2Id = pricebookId, 
            Product2Id = lstProduct2[0].Id,
            UnitPrice = 100, IsActive = true);
        insert standardPrice;
        
        Quote oQuote = new Quote();
        oQuote.Name = 'Testing Quote';
        oQuote.OpportunityId = Opp.id;
        oQuote.Pricebook2Id = pricebookId;
        insert oQuote;

        oQuote = [SELECT Id, Schedule_Number__c FROM Quote WHERE Id = :oQuote.Id];
     
        QuoteLineItem oQLI = new QuoteLineItem();
        oQLI.QuoteId = oQuote.id;
        oQLI.PricebookEntryId = standardPrice.id;
        oQLI.vlocity_cmt__ServiceAccountId__c = testSAccount.id;
        oQLI.Quantity = 1;
        oQLI.UnitPrice = 34.50;
        oQLI.Term__c = '36 Months';
        oQLI.vlocity_cmt__Product2Id__c = lstProduct2[0].Id;
        oQLI.Product2Id = lstProduct2[0].Id;
        insert oQLI;
        
        oQLI.vlocity_cmt__RootItemId__c = oQLI.id;
        update oQLI;
        
        QuoteLineItem oQLI2 = new QuoteLineItem();
        oQLI2.QuoteId = oQuote.id;
        oQLI2.PricebookEntryId = standardPrice.id;
        oQLI2.vlocity_cmt__RootItemId__c = oQLI.id;
        oQLI2.Speed__c = '20 Mbps';
        oQLI2.Quantity = 1;
        oQLI2.UnitPrice = 34.50;
        oQLI2.vlocity_cmt__ParentItemId__c = oQLI.id;
        oQLI2.vlocity_cmt__Product2Id__c = lstProduct2[1].Id;
        oQLI2.Product2Id = lstProduct2[1].Id;
        insert oQLI2;
        
        QuoteLineItem oQLI3 = new QuoteLineItem();
        oQLI3.QuoteId = oQuote.id;
        oQLI3.PricebookEntryId = standardPrice.id;
        oQLI3.Quantity = 1;
        oQLI3.UnitPrice = 34.50;
        oQLI3.vlocity_cmt__Product2Id__c = lstProduct2[2].Id;
        oQLI3.Product2Id = lstProduct2[2].Id;
        insert oQLI3;

        Order oOrder = new Order();
        oOrder.Name = 'Testing Order';
        oOrder.OpportunityId = Opp.id;
        oOrder.Pricebook2Id = pricebookId;
        oOrder.vlocity_cmt__QuoteId__c = oQuote.Id;
        oOrder.AccountId = testAccount.Id;
        oOrder.EffectiveDate = d1;
        oOrder.Status = 'Draft';
        oOrder.Product__c = 'EIA';
        oOrder.Product_Type__c = 'Ethernet';
        oOrder.Router_s__c = 'No Router';
        oOrder.vlocity_cmt__RequestedStartDate__c = d1;
        oOrder.vlocity_cmt__RequestedCompletionDate__c = d1;
        insert oOrder;
        
        OrderItem oOLI = new OrderItem();
        oOLI.OrderId = oOrder.id;
        oOLI.PricebookEntryId = standardPrice.id;
        oOLI.vlocity_cmt__ServiceAccountId__c = testSAccount.id;
        oOLI.Quantity = 1;
        oOLI.UnitPrice = 34.50;
        oOLI.vlocity_cmt__Product2Id__c = lstProduct2[0].Id;
        oOLI.vlocity_cmt__LineNumber__c = '1';
        oOLI.vlocity_cmt__LineItemNumString__c = '1';
        oOLI.vlocity_cmt__JSONAttribute__c = '{"FTR_ENT_PRI_ATTCAT":[{"$$AttributeDefinitionStart$$":null,"objectid__c":"01t190000058z5JAAQ","attributeid__c":"a76190000001ru0AAA","categorycode__c":"FTR_ENT_PRI_ATTCAT","categoryname__c":"Pricing Attributes","attributeuniquecode__c":"ATTR_CONTRACT_TERM","attributedisplaysequence__c":"20","attributedisplayname__c":"Term","displaysequence__c":"null","categorydisplaysequence__c":10,"formatmask__c":null,"hasrule__c":false,"isconfigurable__c":true,"ishidden__c":false,"valueinnumber__c":null,"isreadonly__c":false,"id":"a73190000000jugAAA","isrequired__c":false,"uidisplaytype__c":"Dropdown","value__c":null,"valuedatatype__c":"Picklist","valuedescription__c":null,"attributeRunTimeInfo":{"dataType":"Picklist","uiDisplayType":"Dropdown","values":[{"displayText":"12 Months","id":"acf430f3-5767-4418-ae26-7ec4b80dbc8d","sequence":10,"value":"12 Months"},{"displayText":"24 Months","id":"7fca7a0e-1452-c879-31f2-baa9553ba1a9","sequence":20,"value":"24 Months"},{"displayText":"36 Months","id":"3ce165f6-d467-6a31-f2bf-edbbcad82725","sequence":30,"value":"36 Months"},{"displayText":"60 Months","id":"8782756f-f4d6-5b3a-951d-037e55539c20","sequence":40,"value":"60 Months"}],"default":[],"selectedItem":{"displayText":"12 Months","id":"acf430f3-5767-4418-ae26-7ec4b80dbc8d","sequence":10,"value":"12 Months"}},"isnottranslatable__c":false,"$$AttributeDefinitionEnd$$":null},{"$$AttributeDefinitionStart$$":null,"objectid__c":"01t190000058z5JAAQ","attributeid__c":"a76190000001ru5AAA","categorycode__c":"FTR_ENT_PRI_ATTCAT","categoryname__c":"Pricing Attributes","attributeuniquecode__c":"ATTR_BANDWIDTH","attributedisplaysequence__c":"10","attributedisplayname__c":"Speed","displaysequence__c":"null","categorydisplaysequence__c":10,"formatmask__c":null,"hasrule__c":false,"isconfigurable__c":true,"ishidden__c":true,"valueinnumber__c":null,"isreadonly__c":false,"id":"a73190000004Gw6AAE","isrequired__c":false,"uidisplaytype__c":"Dropdown","value__c":null,"valuedatatype__c":"Picklist","valuedescription__c":null,"attributeRunTimeInfo":{"dataType":"Picklist","uiDisplayType":"Dropdown","values":[{"displayText":"10 Mbps","id":"6af9a9e5-dff5-0f51-223e-f149d256851c","sequence":10,"value":"10 Mbps"},{"displayText":"20 Mbps","id":"8d9a9bd8-a090-0531-c54b-be76521934dc","sequence":20,"value":"20 Mbps"},{"displayText":"50 Mbps","id":"71166878-186e-3b66-49ae-dcd659204939","sequence":30,"value":"50 Mbps"},{"displayText":"100 Mbps","id":"4c03d782-90e7-d359-0c4c-b847a4d13547","sequence":40,"value":"100 Mbps"},{"displayText":"200 Mbps","id":"250ff27d-186d-262e-6604-ccb548815ce5","sequence":50,"value":"200 Mbps"},{"displayText":"500 Mbps","id":"cbb255c2-9001-4471-a18b-8fadf853c33b","sequence":60,"value":"500 Mbps"},{"displayText":"1 Gbps","id":"bfd7e3ad-26a4-26d7-3c04-499855b76c53","sequence":70,"value":"1 Gbps"}],"default":[],"selectedItem":{}},"isnottranslatable__c":false,"$$AttributeDefinitionEnd$$":null},{"$$AttributeDefinitionStart$$":null,"objectid__c":"01t190000058z5JAAQ","attributeid__c":"a76190000001rtvAAA","categorycode__c":"FTR_ENT_PRI_ATTCAT","categoryname__c":"Pricing Attributes","attributeuniquecode__c":"ATTR_SLA","attributedisplaysequence__c":"30","attributedisplayname__c":"SLA","displaysequence__c":"null","categorydisplaysequence__c":10,"formatmask__c":null,"hasrule__c":false,"isconfigurable__c":true,"ishidden__c":false,"valueinnumber__c":null,"isreadonly__c":true,"id":"a73190000004Gw7AAE","isrequired__c":false,"uidisplaytype__c":"Dropdown","value__c":"Silver","valuedatatype__c":"Picklist","valuedescription__c":null,"attributeRunTimeInfo":{"dataType":"Picklist","uiDisplayType":"Dropdown","default":[{"displayText":"Silver","id":"4bd906e9-f059-2a1a-c588-ad08beb5d1e1","sequence":10,"value":"Silver"}],"values":[{"displayText":"Silver","id":"4bd906e9-f059-2a1a-c588-ad08beb5d1e1","sequence":10,"value":"Silver"},{"displayText":"Gold","id":"da9c5b03-49f5-5d55-b41c-b068aa1f2031","sequence":20,"value":"Gold"},{"displayText":"Platinum","id":"f8d5b838-0867-537e-83a0-a7b710916357","sequence":30,"value":"Platinum"}],"selectedItem":{"displayText":"Silver","id":"4bd906e9-f059-2a1a-c588-ad08beb5d1e1","sequence":10,"value":"Silver"}},"isnottranslatable__c":false,"$$AttributeDefinitionEnd$$":null},{"$$AttributeDefinitionStart$$":null,"objectid__c":"01t190000058z5JAAQ","attributeid__c":"a76190000001s02AAA","categorycode__c":"FTR_ENT_PRI_ATTCAT","categoryname__c":"Pricing Attributes","attributeuniquecode__c":"ATTR_TIER","attributedisplaysequence__c":"5","attributedisplayname__c":"Tier","displaysequence__c":"10","categorydisplaysequence__c":10,"formatmask__c":null,"hasrule__c":false,"isconfigurable__c":true,"ishidden__c":false,"valueinnumber__c":null,"isreadonly__c":true,"id":"a73190000004GxJAAU","isrequired__c":false,"uidisplaytype__c":"Dropdown","value__c":"Tier 1","valuedatatype__c":"Picklist","valuedescription__c":null,"attributeRunTimeInfo":{"dataType":"Picklist","uiDisplayType":"Dropdown","default":[{"displayText":"Tier 1","id":"f6166d0b-d8f2-dce8-6c30-d1f0a68b5725","sequence":10,"value":"Tier 1"}],"values":[{"displayText":"Tier 1","id":"f6166d0b-d8f2-dce8-6c30-d1f0a68b5725","sequence":10,"value":"Tier 1"},{"displayText":"Tier 2","id":"270589b4-c7b0-0573-f048-23f44a2c6431","sequence":20,"value":"Tier 2"}],"selectedItem":{"displayText":"Tier 1","id":"f6166d0b-d8f2-dce8-6c30-d1f0a68b5725","sequence":10,"value":"Tier 1"}},"isnottranslatable__c":false,"$$AttributeDefinitionEnd$$":null}]}';
        oOLI.vlocity_cmt__ItemName__c = 'EIA (Ethernet Internet Access)';
        //oOLI.Product2Id = lstProduct2[0].Id;
        insert oOLI;
        
        oOLI.vlocity_cmt__RootItemId__c = oOLI.id;
        update oOLI;
        
        OrderItem oOLI2 = new OrderItem();
        oOLI2.OrderId = oOrder.id;
        oOLI2.PricebookEntryId = standardPrice.id;
        oOLI2.vlocity_cmt__RootItemId__c = oOLI.id;
        oOLI2.Speed__c = '20 Mbps';
        oOLI2.Quantity = 1;
        oOLI2.UnitPrice = 34.50;
        oOLI2.vlocity_cmt__ParentItemId__c = oOLI.id;
        oOLI2.vlocity_cmt__Product2Id__c = lstProduct2[1].Id;
        oOLI2.vlocity_cmt__LineNumber__c = '2';
        oOLI2.vlocity_cmt__LineItemNumString__c = '2';
        oOLI2.vlocity_cmt__JSONAttribute__c = '{"FTR_ENT_PRI_ATTCAT":[{"$$AttributeDefinitionStart$$":null,"objectid__c":"01t190000058z5OAAQ","attributeid__c":"a76190000006F04AAE","categorycode__c":"FTR_ENT_PRI_ATTCAT","categoryname__c":"Pricing Attributes","attributeuniquecode__c":"ATTR_INTRA_INTER","attributedisplaysequence__c":"35","attributedisplayname__c":"Tax Impact","displaysequence__c":"null","categorydisplaysequence__c":10,"formatmask__c":null,"hasrule__c":false,"isconfigurable__c":true,"ishidden__c":false,"valueinnumber__c":null,"isreadonly__c":false,"id":"a73190000000jpjAAA","isrequired__c":false,"uidisplaytype__c":"Dropdown","value__c":"Interstate","valuedatatype__c":"Picklist","valuedescription__c":null,"attributeRunTimeInfo":{"dataType":"Picklist","uiDisplayType":"Dropdown","default":[{"value":"Interstate","sequence":10,"id":"41baec4f-2bd6-e788-da02-00fa0b85253b","displayText":"Interstate"}],"values":[{"value":"Interstate","sequence":10,"id":"41baec4f-2bd6-e788-da02-00fa0b85253b","displayText":"Interstate"},{"value":"Intrastate","sequence":20,"id":"a3aa8c06-69da-5379-9dea-a4c1b1d51d04","displayText":"Intrastate"}],"selectedItem":{"value":"Interstate","sequence":10,"id":"41baec4f-2bd6-e788-da02-00fa0b85253b","displayText":"Interstate"}},"isnottranslatable__c":false,"$$AttributeDefinitionEnd$$":null},{"$$AttributeDefinitionStart$$":null,"objectid__c":"01t190000058z5OAAQ","attributeid__c":"a76190000001ru0AAA","categorycode__c":"FTR_ENT_PRI_ATTCAT","categoryname__c":"Pricing Attributes","attributeuniquecode__c":"ATTR_CONTRACT_TERM","attributedisplaysequence__c":"20","attributedisplayname__c":"Term","displaysequence__c":"10","categorydisplaysequence__c":10,"formatmask__c":null,"hasrule__c":false,"isconfigurable__c":true,"ishidden__c":false,"valueinnumber__c":null,"isreadonly__c":true,"id":"a73190000000juWAAQ","isrequired__c":false,"uidisplaytype__c":"Dropdown","value__c":null,"valuedatatype__c":"Picklist","valuedescription__c":null,"attributeRunTimeInfo":{"dataType":"Picklist","uiDisplayType":"Dropdown","values":[{"value":"12 Months","sequence":10,"id":"acf430f3-5767-4418-ae26-7ec4b80dbc8d","displayText":"12 Months"},{"value":"24 Months","sequence":20,"id":"7fca7a0e-1452-c879-31f2-baa9553ba1a9","displayText":"24 Months"},{"value":"36 Months","sequence":30,"id":"3ce165f6-d467-6a31-f2bf-edbbcad82725","displayText":"36 Months"},{"value":"60 Months","sequence":40,"id":"8782756f-f4d6-5b3a-951d-037e55539c20","displayText":"60 Months"}],"default":[],"selectedItem":{"value":"12 Months","sequence":10,"id":"acf430f3-5767-4418-ae26-7ec4b80dbc8d","displayText":"12 Months"}},"isnottranslatable__c":false,"$$AttributeDefinitionEnd$$":null},{"$$AttributeDefinitionStart$$":null,"objectid__c":"01t190000058z5OAAQ","attributeid__c":"a76190000001ru5AAA","categorycode__c":"FTR_ENT_PRI_ATTCAT","categoryname__c":"Pricing Attributes","attributeuniquecode__c":"ATTR_BANDWIDTH","attributedisplaysequence__c":"10","attributedisplayname__c":"Speed","displaysequence__c":"null","categorydisplaysequence__c":10,"formatmask__c":null,"hasrule__c":false,"isconfigurable__c":true,"ishidden__c":false,"valueinnumber__c":null,"isreadonly__c":false,"id":"a73190000004GwBAAU","isrequired__c":true,"uidisplaytype__c":"Dropdown","value__c":null,"valuedatatype__c":"Picklist","valuedescription__c":null,"attributeRunTimeInfo":{"dataType":"Picklist","uiDisplayType":"Dropdown","values":[{"value":"10 Mbps","sequence":10,"id":"6af9a9e5-dff5-0f51-223e-f149d256851c","displayText":"10 Mbps"},{"value":"20 Mbps","sequence":20,"id":"8d9a9bd8-a090-0531-c54b-be76521934dc","displayText":"20 Mbps"},{"value":"50 Mbps","sequence":30,"id":"71166878-186e-3b66-49ae-dcd659204939","displayText":"50 Mbps"},{"value":"100 Mbps","sequence":40,"id":"4c03d782-90e7-d359-0c4c-b847a4d13547","displayText":"100 Mbps"},{"value":"200 Mbps","sequence":50,"id":"250ff27d-186d-262e-6604-ccb548815ce5","displayText":"200 Mbps"},{"value":"500 Mbps","sequence":60,"id":"cbb255c2-9001-4471-a18b-8fadf853c33b","displayText":"500 Mbps"},{"value":"1 Gbps","sequence":70,"id":"bfd7e3ad-26a4-26d7-3c04-499855b76c53","displayText":"1 Gbps"}],"default":[],"selectedItem":{"value":"100 Mbps","sequence":40,"id":"4c03d782-90e7-d359-0c4c-b847a4d13547","displayText":"100 Mbps"}},"isnottranslatable__c":false,"$$AttributeDefinitionEnd$$":null},{"$$AttributeDefinitionStart$$":null,"objectid__c":"01t190000058z5OAAQ","attributeid__c":"a76190000001rtvAAA","categorycode__c":"FTR_ENT_PRI_ATTCAT","categoryname__c":"Pricing Attributes","attributeuniquecode__c":"ATTR_SLA","attributedisplaysequence__c":"30","attributedisplayname__c":"SLA","displaysequence__c":"null","categorydisplaysequence__c":10,"formatmask__c":null,"hasrule__c":false,"isconfigurable__c":true,"ishidden__c":false,"valueinnumber__c":null,"isreadonly__c":true,"id":"a73190000004GwCAAU","isrequired__c":true,"uidisplaytype__c":"Dropdown","value__c":null,"valuedatatype__c":"Picklist","valuedescription__c":null,"attributeRunTimeInfo":{"dataType":"Picklist","uiDisplayType":"Dropdown","values":[{"value":"Silver","sequence":10,"id":"4bd906e9-f059-2a1a-c588-ad08beb5d1e1","displayText":"Silver"},{"value":"Gold","sequence":20,"id":"da9c5b03-49f5-5d55-b41c-b068aa1f2031","displayText":"Gold"},{"value":"Platinum","sequence":30,"id":"f8d5b838-0867-537e-83a0-a7b710916357","displayText":"Platinum"}],"default":[],"selectedItem":{"value":"Silver","sequence":10,"id":"4bd906e9-f059-2a1a-c588-ad08beb5d1e1","displayText":"Silver"}},"isnottranslatable__c":false,"$$AttributeDefinitionEnd$$":null},{"$$AttributeDefinitionStart$$":null,"objectid__c":"01t190000058z5OAAQ","attributeid__c":"a76190000001s02AAA","categorycode__c":"FTR_ENT_PRI_ATTCAT","categoryname__c":"Pricing Attributes","attributeuniquecode__c":"ATTR_TIER","attributedisplaysequence__c":"5","attributedisplayname__c":"Tier","displaysequence__c":"10","categorydisplaysequence__c":10,"formatmask__c":null,"hasrule__c":false,"isconfigurable__c":true,"ishidden__c":false,"valueinnumber__c":null,"isreadonly__c":true,"id":"a73190000000jrkAAA","isrequired__c":false,"uidisplaytype__c":"Dropdown","value__c":"Tier 1","valuedatatype__c":"Picklist","valuedescription__c":null,"attributeRunTimeInfo":{"dataType":"Picklist","uiDisplayType":"Dropdown","default":[{"value":"Tier 1","sequence":10,"id":"f6166d0b-d8f2-dce8-6c30-d1f0a68b5725","displayText":"Tier 1"}],"values":[{"value":"Tier 1","sequence":10,"id":"f6166d0b-d8f2-dce8-6c30-d1f0a68b5725","displayText":"Tier 1"},{"value":"Tier 2","sequence":20,"id":"270589b4-c7b0-0573-f048-23f44a2c6431","displayText":"Tier 2"}],"selectedItem":{"value":"Tier 1","sequence":10,"id":"f6166d0b-d8f2-dce8-6c30-d1f0a68b5725","displayText":"Tier 1"}},"isnottranslatable__c":false,"$$AttributeDefinitionEnd$$":null}],"FTR_ENT_TECH_ATTCAT":[{"$$AttributeDefinitionStart$$":null,"objectid__c":"01t190000058z5OAAQ","attributeid__c":"a76190000006F0nAAE","categorycode__c":"FTR_ENT_TECH_ATTCAT","categoryname__c":"Technical Attributes","attributeuniquecode__c":"ATTR_EVCType","attributedisplaysequence__c":"1","attributedisplayname__c":"EVC Type","displaysequence__c":"null","categorydisplaysequence__c":20,"formatmask__c":null,"hasrule__c":false,"isconfigurable__c":false,"ishidden__c":true,"valueinnumber__c":null,"isreadonly__c":false,"id":"a73190000000js4AAA","isrequired__c":false,"uidisplaytype__c":"Text","value__c":null,"valuedatatype__c":"Text","valuedescription__c":null,"attributeRunTimeInfo":{"dataType":"Text","uiDisplayType":"Text","value":"EIA"},"isnottranslatable__c":false,"$$AttributeDefinitionEnd$$":null},{"$$AttributeDefinitionStart$$":null,"objectid__c":"01t190000058z5OAAQ","attributeid__c":"a76190000006F1bAAE","categorycode__c":"FTR_ENT_TECH_ATTCAT","categoryname__c":"Technical Attributes","attributeuniquecode__c":"ATTR_CEVLANCOSPRESERV","attributedisplaysequence__c":"1","attributedisplayname__c":"CE-VLAN Class of Service Preservation","displaysequence__c":"null","categorydisplaysequence__c":20,"formatmask__c":null,"hasrule__c":false,"isconfigurable__c":true,"ishidden__c":true,"valueinnumber__c":null,"isreadonly__c":false,"id":"a73190000000jt2AAA","isrequired__c":false,"uidisplaytype__c":null,"value__c":null,"valuedatatype__c":"Checkbox","valuedescription__c":null,"attributeRunTimeInfo":{"dataType":"Checkbox","default":false,"value":false},"isnottranslatable__c":false,"$$AttributeDefinitionEnd$$":null},{"$$AttributeDefinitionStart$$":null,"objectid__c":"01t190000058z5OAAQ","attributeid__c":"a76190000006F1WAAU","categorycode__c":"FTR_ENT_TECH_ATTCAT","categoryname__c":"Technical Attributes","attributeuniquecode__c":"ATTR_DPIROUTERTER","attributedisplaysequence__c":"1","attributedisplayname__c":"DPI/PE Router Termination CLLI","displaysequence__c":"null","categorydisplaysequence__c":20,"formatmask__c":null,"hasrule__c":false,"isconfigurable__c":false,"ishidden__c":false,"valueinnumber__c":null,"isreadonly__c":false,"id":"a73190000000jt3AAA","isrequired__c":false,"uidisplaytype__c":"Text","value__c":null,"valuedatatype__c":"Text","valuedescription__c":null,"attributeRunTimeInfo":{"dataType":"Text","uiDisplayType":"Text","value":"NEWINNICLLI"},"isnottranslatable__c":false,"$$AttributeDefinitionEnd$$":null},{"$$AttributeDefinitionStart$$":null,"objectid__c":"01t190000058z5OAAQ","attributeid__c":"a76190000006F1qAAE","categorycode__c":"FTR_ENT_TECH_ATTCAT","categoryname__c":"Technical Attributes","attributeuniquecode__c":"ATTR_CEVLANIDSITE1","attributedisplaysequence__c":"1","attributedisplayname__c":"CE-VLAN Id - Site 1","displaysequence__c":"null","categorydisplaysequence__c":20,"formatmask__c":null,"hasrule__c":false,"isconfigurable__c":false,"ishidden__c":true,"valueinnumber__c":null,"isreadonly__c":false,"id":"a73190000000jt4AAA","isrequired__c":false,"uidisplaytype__c":"Single Value","value__c":null,"valuedatatype__c":"Number","valuedescription__c":null,"attributeRunTimeInfo":{"dataType":"Number","uiDisplayType":"Single Value","value":null},"isnottranslatable__c":false,"$$AttributeDefinitionEnd$$":null},{"$$AttributeDefinitionStart$$":null,"objectid__c":"01t190000058z5OAAQ","attributeid__c":"a76190000006F1RAAU","categorycode__c":"FTR_ENT_TECH_ATTCAT","categoryname__c":"Technical Attributes","attributeuniquecode__c":"ATTR_EVCSubType","attributedisplaysequence__c":"1","attributedisplayname__c":"EVC SubType","displaysequence__c":"null","categorydisplaysequence__c":20,"formatmask__c":null,"hasrule__c":false,"isconfigurable__c":false,"ishidden__c":false,"valueinnumber__c":null,"isreadonly__c":false,"id":"a73190000000jt5AAA","isrequired__c":false,"uidisplaytype__c":"Text","value__c":null,"valuedatatype__c":"Text","valuedescription__c":null,"attributeRunTimeInfo":{"dataType":"Text","uiDisplayType":"Text","value":"Internet"},"isnottranslatable__c":false,"$$AttributeDefinitionEnd$$":null},{"$$AttributeDefinitionStart$$":null,"objectid__c":"01t190000058z5OAAQ","attributeid__c":"a76190000006F1vAAE","categorycode__c":"FTR_ENT_TECH_ATTCAT","categoryname__c":"Technical Attributes","attributeuniquecode__c":"ATTR_CEVLANPRESERVIDSITE2","attributedisplaysequence__c":"1","attributedisplayname__c":"CE-VLAN Id Preservation - Site 2","displaysequence__c":"null","categorydisplaysequence__c":20,"formatmask__c":null,"hasrule__c":false,"isconfigurable__c":true,"ishidden__c":true,"valueinnumber__c":null,"isreadonly__c":false,"id":"a73190000000jt6AAA","isrequired__c":false,"uidisplaytype__c":null,"value__c":null,"valuedatatype__c":"Checkbox","valuedescription__c":null,"attributeRunTimeInfo":{"dataType":"Checkbox","default":false,"value":false},"isnottranslatable__c":false,"$$AttributeDefinitionEnd$$":null},{"$$AttributeDefinitionStart$$":null,"objectid__c":"01t190000058z5OAAQ","attributeid__c":"a76190000006F20AAE","categorycode__c":"FTR_ENT_TECH_ATTCAT","categoryname__c":"Technical Attributes","attributeuniquecode__c":"ATTR_CEVLANIDSITE2","attributedisplaysequence__c":"1","attributedisplayname__c":"CE-VLAN Id - Site 2","displaysequence__c":"null","categorydisplaysequence__c":20,"formatmask__c":null,"hasrule__c":false,"isconfigurable__c":false,"ishidden__c":true,"valueinnumber__c":null,"isreadonly__c":false,"id":"a73190000000jt7AAA","isrequired__c":false,"uidisplaytype__c":"Single Value","value__c":null,"valuedatatype__c":"Number","valuedescription__c":null,"attributeRunTimeInfo":{"dataType":"Number","uiDisplayType":"Single Value","value":null},"isnottranslatable__c":false,"$$AttributeDefinitionEnd$$":null},{"$$AttributeDefinitionStart$$":null,"objectid__c":"01t190000058z5OAAQ","attributeid__c":"a76190000006F1gAAE","categorycode__c":"FTR_ENT_TECH_ATTCAT","categoryname__c":"Technical Attributes","attributeuniquecode__c":"ATTR_CEVLANPRESERVIDSITE1","attributedisplaysequence__c":"1","attributedisplayname__c":"CE-VLAN Id Preservation - Site 1","displaysequence__c":"null","categorydisplaysequence__c":20,"formatmask__c":null,"hasrule__c":false,"isconfigurable__c":true,"ishidden__c":true,"valueinnumber__c":null,"isreadonly__c":false,"id":"a73190000000jt8AAA","isrequired__c":false,"uidisplaytype__c":null,"value__c":null,"valuedatatype__c":"Checkbox","valuedescription__c":null,"attributeRunTimeInfo":{"dataType":"Checkbox","default":false,"value":false},"isnottranslatable__c":false,"$$AttributeDefinitionEnd$$":null}]}';
        oOLI2.vlocity_cmt__ItemName__c = 'EVC';
        //oOLI2.Product2Id = lstProduct2[1].Id;
        insert oOLI2;
        
        OrderItem oOLI3 = new OrderItem();
        oOLI3.OrderId = oOrder.id;
        oOLI3.PricebookEntryId = standardPrice.id;
        oOLI3.Quantity = 1;
        oOLI3.UnitPrice = 34.50;
        oOLI3.vlocity_cmt__Product2Id__c = lstProduct2[2].Id;
        oOLI3.vlocity_cmt__LineNumber__c = '3';
        oOLI3.vlocity_cmt__LineItemNumString__c = '3';
        oOLI3.vlocity_cmt__JSONAttribute__c = '{"FTR_ENT_PRI_ATTCAT":[{"$$AttributeDefinitionStart$$":null,"objectid__c":"01t190000058z5dAAA","attributeid__c":"a76190000001sSaAAI","categorycode__c":"FTR_ENT_PRI_ATTCAT","categoryname__c":"Pricing Attributes","attributeuniquecode__c":"ATTR_ROLLUP_BANDWIDTH","attributedisplaysequence__c":"25","attributedisplayname__c":"Rollup Bandwidth","displaysequence__c":"null","categorydisplaysequence__c":10,"formatmask__c":null,"hasrule__c":false,"isconfigurable__c":false,"ishidden__c":true,"valueinnumber__c":null,"isreadonly__c":false,"id":"a73190000004GxOAAU","isrequired__c":false,"uidisplaytype__c":"Text","value__c":null,"valuedatatype__c":"Text","valuedescription__c":null,"attributeRunTimeInfo":{"dataType":"Text","uiDisplayType":"Text","value":null},"isnottranslatable__c":false,"$$AttributeDefinitionEnd$$":null},{"$$AttributeDefinitionStart$$":null,"objectid__c":"01t190000058z5dAAA","attributeid__c":"a76190000006F04AAE","categorycode__c":"FTR_ENT_PRI_ATTCAT","categoryname__c":"Pricing Attributes","attributeuniquecode__c":"ATTR_INTRA_INTER","attributedisplaysequence__c":"35","attributedisplayname__c":"Tax Impact","displaysequence__c":"null","categorydisplaysequence__c":10,"formatmask__c":null,"hasrule__c":false,"isconfigurable__c":true,"ishidden__c":false,"valueinnumber__c":null,"isreadonly__c":false,"id":"a73190000000juRAAQ","isrequired__c":true,"uidisplaytype__c":"Dropdown","value__c":"Interstate","valuedatatype__c":"Picklist","valuedescription__c":null,"attributeRunTimeInfo":{"dataType":"Picklist","uiDisplayType":"Dropdown","default":[{"displayText":"Interstate","id":"41baec4f-2bd6-e788-da02-00fa0b85253b","sequence":10,"value":"Interstate"}],"values":[{"displayText":"Interstate","id":"41baec4f-2bd6-e788-da02-00fa0b85253b","sequence":10,"value":"Interstate"},{"displayText":"Intrastate","id":"a3aa8c06-69da-5379-9dea-a4c1b1d51d04","sequence":20,"value":"Intrastate"}],"selectedItem":{"displayText":"Interstate","id":"41baec4f-2bd6-e788-da02-00fa0b85253b","sequence":10,"value":"Interstate"}},"isnottranslatable__c":false,"$$AttributeDefinitionEnd$$":null},{"$$AttributeDefinitionStart$$":null,"objectid__c":"01t190000058z5dAAA","attributeid__c":"a76190000001ru0AAA","categorycode__c":"FTR_ENT_PRI_ATTCAT","categoryname__c":"Pricing Attributes","attributeuniquecode__c":"ATTR_CONTRACT_TERM","attributedisplaysequence__c":"20","attributedisplayname__c":"Term","displaysequence__c":"null","categorydisplaysequence__c":10,"formatmask__c":null,"hasrule__c":false,"isconfigurable__c":true,"ishidden__c":false,"valueinnumber__c":null,"isreadonly__c":false,"id":"a73190000000juiAAA","isrequired__c":false,"uidisplaytype__c":"Dropdown","value__c":null,"valuedatatype__c":"Picklist","valuedescription__c":null,"attributeRunTimeInfo":{"dataType":"Picklist","uiDisplayType":"Dropdown","values":[{"displayText":"12 Months","id":"acf430f3-5767-4418-ae26-7ec4b80dbc8d","sequence":10,"value":"12 Months"},{"displayText":"24 Months","id":"7fca7a0e-1452-c879-31f2-baa9553ba1a9","sequence":20,"value":"24 Months"},{"displayText":"36 Months","id":"3ce165f6-d467-6a31-f2bf-edbbcad82725","sequence":30,"value":"36 Months"},{"displayText":"60 Months","id":"8782756f-f4d6-5b3a-951d-037e55539c20","sequence":40,"value":"60 Months"}],"default":[],"selectedItem":{"displayText":"12 Months","id":"acf430f3-5767-4418-ae26-7ec4b80dbc8d","sequence":10,"value":"12 Months"}},"isnottranslatable__c":false,"$$AttributeDefinitionEnd$$":null},{"$$AttributeDefinitionStart$$":null,"objectid__c":"01t190000058z5dAAA","attributeid__c":"a76190000001ru5AAA","categorycode__c":"FTR_ENT_PRI_ATTCAT","categoryname__c":"Pricing Attributes","attributeuniquecode__c":"ATTR_BANDWIDTH","attributedisplaysequence__c":"10","attributedisplayname__c":"Speed","displaysequence__c":"null","categorydisplaysequence__c":10,"formatmask__c":null,"hasrule__c":false,"isconfigurable__c":true,"ishidden__c":false,"valueinnumber__c":null,"isreadonly__c":false,"id":"a73190000004GwGAAU","isrequired__c":false,"uidisplaytype__c":"Dropdown","value__c":null,"valuedatatype__c":"Picklist","valuedescription__c":null,"attributeRunTimeInfo":{"dataType":"Picklist","uiDisplayType":"Dropdown","values":[{"displayText":"5 Mbps","id":"4aba2306-23a9-9d57-df5e-6845e3943828","sequence":5,"value":"5 Mbps"},{"displayText":"10 Mbps","id":"1a208fd2-ccf1-e3ad-2f16-3009f90cb522","sequence":10,"value":"10 Mbps"},{"displayText":"20 Mbps","id":"8b45b7bf-7984-df2e-7378-108ef35bc8a5","sequence":20,"value":"20 Mbps"},{"displayText":"50 Mbps","id":"f7bc4c42-ca8b-bd24-832f-a4a106b8173b","sequence":30,"value":"50 Mbps"},{"displayText":"100 Mbps","id":"ed22cdc9-eb1e-cd69-15a9-f5669740afb5","sequence":40,"value":"100 Mbps"},{"displayText":"200 Mbps","id":"3c2416ab-8c99-5331-c40b-ba36ca84bf72","sequence":50,"value":"200 Mbps"},{"displayText":"300 Mbps","id":"c096a1f5-cbdc-5e41-1bde-6bf9a4aedee9","sequence":60,"value":"300 Mbps"},{"displayText":"400 Mbps","id":"fdebc972-b9ec-e456-1d6e-5d03c284ca67","sequence":70,"value":"400 Mbps"},{"displayText":"500 Mbps","id":"5b421e64-e57e-6aa5-fc1a-55c926e9e3dc","sequence":80,"value":"500 Mbps"},{"displayText":"600 Mbps","id":"f2af83f9-ab01-4700-0fe5-b02afe290f69","sequence":90,"value":"600 Mbps"},{"displayText":"700 Mbps","id":"0501fb70-8e20-540d-d4d5-2330d003a939","sequence":100,"value":"700 Mbps"},{"displayText":"800 Mbps","id":"e049798b-2162-1f86-1bdc-508c3e58a89d","sequence":110,"value":"800 Mbps"},{"displayText":"900 Mbps","id":"9e713b50-7ac2-2053-0aad-eeb42c9db47f","sequence":120,"value":"900 Mbps"},{"displayText":"1 Gbps","id":"3aa261dc-29ca-d36d-2a72-5e253b8937f3","sequence":130,"value":"1 Gbps"}],"default":[],"selectedItem":{"displayText":"100 Mbps","id":"ed22cdc9-eb1e-cd69-15a9-f5669740afb5","sequence":40,"value":"100 Mbps"}},"isnottranslatable__c":false,"$$AttributeDefinitionEnd$$":null},{"$$AttributeDefinitionStart$$":null,"objectid__c":"01t190000058z5dAAA","attributeid__c":"a76190000001rtvAAA","categorycode__c":"FTR_ENT_PRI_ATTCAT","categoryname__c":"Pricing Attributes","attributeuniquecode__c":"ATTR_SLA","attributedisplaysequence__c":"30","attributedisplayname__c":"SLA","displaysequence__c":"null","categorydisplaysequence__c":10,"formatmask__c":null,"hasrule__c":false,"isconfigurable__c":true,"ishidden__c":true,"valueinnumber__c":null,"isreadonly__c":false,"id":"a73190000004GwHAAU","isrequired__c":false,"uidisplaytype__c":"Dropdown","value__c":null,"valuedatatype__c":"Picklist","valuedescription__c":null,"attributeRunTimeInfo":{"dataType":"Picklist","uiDisplayType":"Dropdown","values":[{"displayText":"Silver","id":"4bd906e9-f059-2a1a-c588-ad08beb5d1e1","sequence":10,"value":"Silver"},{"displayText":"Gold","id":"da9c5b03-49f5-5d55-b41c-b068aa1f2031","sequence":20,"value":"Gold"},{"displayText":"Platinum","id":"f8d5b838-0867-537e-83a0-a7b710916357","sequence":30,"value":"Platinum"}],"default":[],"selectedItem":{}},"isnottranslatable__c":false,"$$AttributeDefinitionEnd$$":null},{"$$AttributeDefinitionStart$$":null,"objectid__c":"01t190000058z5dAAA","attributeid__c":"a76190000001s02AAA","categorycode__c":"FTR_ENT_PRI_ATTCAT","categoryname__c":"Pricing Attributes","attributeuniquecode__c":"ATTR_TIER","attributedisplaysequence__c":"5","attributedisplayname__c":"Tier","displaysequence__c":"10","categorydisplaysequence__c":10,"formatmask__c":null,"hasrule__c":false,"isconfigurable__c":true,"ishidden__c":false,"valueinnumber__c":null,"isreadonly__c":true,"id":"a73190000004GxEAAU","isrequired__c":false,"uidisplaytype__c":"Dropdown","value__c":"Tier 1","valuedatatype__c":"Picklist","valuedescription__c":null,"attributeRunTimeInfo":{"dataType":"Picklist","uiDisplayType":"Dropdown","default":[{"displayText":"Tier 1","id":"f6166d0b-d8f2-dce8-6c30-d1f0a68b5725","sequence":10,"value":"Tier 1"}],"values":[{"displayText":"Tier 1","id":"f6166d0b-d8f2-dce8-6c30-d1f0a68b5725","sequence":10,"value":"Tier 1"},{"displayText":"Tier 2","id":"270589b4-c7b0-0573-f048-23f44a2c6431","sequence":20,"value":"Tier 2"}],"selectedItem":{"displayText":"Tier 1","id":"f6166d0b-d8f2-dce8-6c30-d1f0a68b5725","sequence":10,"value":"Tier 1"}},"isnottranslatable__c":false,"$$AttributeDefinitionEnd$$":null}]}';
        oOLI3.vlocity_cmt__ItemName__c = 'Access';
        //oOLI3.Product2Id = lstProduct2[2].Id;
        insert oOLI3;

    }

    /*@IsTest
    static void getOrderAttributes()
    {
        Order oOrder = [SELECT Id FROM Order LIMIT 1];
        OrderService os = new OrderService();

        os.getOrderAttributes(oOrder.Id);
    }*/

    @IsTest
    static void getMapValue(){
        
        Map<string, object> inputMap = new Map<string, object>();

        inputMap.put('attr1', 'value1');
        inputMap.put('attr2', 'value2');
        inputMap.put('attr3', 'value3');

        OrderService os = new OrderService();
        string value = (string)os.getMapValue(inputMap, 'attr2');
        
    }

}