/**
 * @description       : This test class covers the following Apex classes:
 *      ftr_CpqHelper
 *      TBD_CLASS2
 *      TBD_CLASS3
 * @author            : TBD
 * @version           : 1 
**/ 
@isTest
public class ftr_CpqHelperTest {

    //@TestSetup
    static void makeData(){
        vlocity_cmt__CpqConfigurationSetup__c setting = new vlocity_cmt__CpqConfigurationSetup__c();
        setting.Name = 'DefaultPricingPlan';
        setting.vlocity_cmt__SetupValue__c = 'True';
        insert setting;

        Integer numOfQLIforEachQuote = 2;
        Integer numOfQuote = 1;
        List<QuoteLineItem> qlis = ftr_TestDataFactory.getQLI(numOfQLIforEachQuote, numOfQuote);
        insert qlis;
    }

    @isTest
    static void getCpqConfigurationSetupValueTest(){
		vlocity_cmt__CpqConfigurationSetup__c cpqSetup = new vlocity_cmt__CpqConfigurationSetup__c();
        cpqSetup.name = 'DefaultPricingPlan';
        cpqSetup.vlocity_cmt__SetupValue__c = 'DEFAULT_PRICING_PLAN';
        insert cpqSetup;
        String setupName = 'DefaultPricingPlan';
        test.startTest();
        String retval = ftr_CpqHelper.getCpqConfigurationSetupValue(setupName);
        test.stopTest();
        System.assertEquals('DEFAULT_PRICING_PLAN', retval);
    }

    @isTest
    static void getJSONAttributeValuesTest(){
        StaticResource sr = [SELECT Id, Body FROM StaticResource WHERE Name = 'ftr_TD_JSONAttribute_Access' LIMIT 1];
        String jsonAttribute = sr.body.toString();
        
        Map<String, Object> attrVals =  ftr_CpqHelper.getJSONAttributeValues(jsonAttribute);

        System.assertEquals('50 Mbps', (String)attrVals.get('ATTR_BANDWIDTH'));
    }

    @isTest
    static void getJSONAttributeValueTest(){
        StaticResource sr = [SELECT Id, Body FROM StaticResource WHERE Name = 'ftr_TD_JSONAttribute_Access' LIMIT 1];

        String jsonAttribute = sr.body.toString();
        String attribCode = 'ATTR_BANDWIDTH';
        String attVal = (String)ftr_CpqHelper.getJSONAttributeValue(jsonAttribute, attribCode);

        System.assertEquals('50 Mbps', attVal);
    }

    @isTest
    static void setJSONAttributeTest(){
        StaticResource sr = [SELECT Id, Body FROM StaticResource WHERE Name = 'ftr_TD_JSONAttribute_Access' LIMIT 1];
        String runtimeJSON = sr.body.toString(); 
        String originalJSON = '{}'; 

        String code = 'ATTR_CONTRACT_TERM';
        Object val = '12 Months';
        test.startTest();
        String modifiedJSON = ftr_CpqHelper.setJSONAttribute(runtimeJSON, originalJSON, code, val);
        test.stopTest();

        System.assertEquals(val, ftr_CpqHelper.getJSONAttributeValue(modifiedJSON, code));
    }

    @isTest
    static void setJSONAttributesTest(){
        StaticResource sr = [SELECT Id, Body FROM StaticResource WHERE Name = 'ftr_TD_JSONAttribute_Access' LIMIT 1];
        String runtimeJSON = sr.body.toString(); 
        String originalJSON = '{}'; 
        Map<String, Object> attrVals = new Map<String, Object> {
            'ATTR_CONTRACT_TERM' => '12 Months'
        };
        test.startTest();
        String modifiedJSON = ftr_CpqHelper.setJSONAttributes(runtimeJSON, originalJSON, attrVals);
        test.stopTest();
        System.assertEquals('12 Months', ftr_CpqHelper.getJSONAttributeValue(modifiedJSON, 'ATTR_CONTRACT_TERM'));
    }

    @isTest
    static void setQLIsAttributeTest(){
        String attVal = '12 Months';
        List<QuoteLineItem> qLIs = [SELECT Id, vlocity_cmt__JSONAttribute__c FROM QuoteLineItem];
        String attCode = 'ATTR_CONTRACT_TERM';
        test.startTest();
        List<QuoteLineItem> qLIsOutput = ftr_CpqHelper.setQLIsAttribute(attVal, qLIs, attCode);
        test.stopTest();
    }

    @isTest
    static void convertToSpeedTest(){
        String bandWidth = '20 Mbps';
        test.startTest();
        Integer speed = ftr_CpqHelper.convertToSpeed(bandWidth);
        test.stopTest();
        System.assertEquals(20, speed);
    }

    @isTest
    static void convertToSpeedGbpsTest(){
        String bandWidth = '20 Gbps';
        test.startTest();
        Integer speed = ftr_CpqHelper.convertToSpeed(bandWidth);
        test.stopTest();
        System.debug('speed gbps..'+ speed);
        System.assertEquals(20000, speed);
    }

    @isTest
    static void convertToBandWidthTest(){
        Integer speed = 20;
        test.startTest();
        String bandwidth = ftr_CpqHelper.convertToBandWidth(speed);
        test.stopTest();
        System.assertEquals('20 Mbps', bandwidth);
    }
    
    @isTest
    static void testAsyncCheckout(){
        Quote q = ftr_TestDataFactory.getQuotes(1)[0];
        test.startTest();
        ftr_CpqHelper.checkoutAsync(q.Id);
        test.stopTest();
    }
    
    @isTest
    static void testSetOLIsAttribute(){
        List<OrderItem> oLIs = ftr_TestDataFactory.getOrderItems(2, new Map<string,string>{'Test'=>'TestCode'});
        test.startTest();
        ftr_CpqHelper.setOLIsAttribute('test', oLIs, 'TEST');
        test.stopTest();
    }
}