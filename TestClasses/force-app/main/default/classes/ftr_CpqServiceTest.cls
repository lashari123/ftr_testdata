/**
 * @description       : This test class covers the following Apex classes:
 *      TBD_CLASS1
 *      TBD_CLASS2
 *      TBD_CLASS3
 * @author            : TBD
 * @version           : 1 
**/
@isTest
private class ftr_CpqServiceTest {
    @isTest  
    static void getAndUpdateXLIAttributes_Test() {
        ftr_CpqService service = new ftr_CpqService();
        List<QuoteLineItem> qLIs = ftr_TestDataFactory.getQLI(1, 1);

        StaticResource sr = [SELECT Id, Body FROM StaticResource WHERE Name = 'ftr_TD_JSONAttribute_Access' LIMIT 1];
        qLIs[0].vlocity_cmt__JSONAttribute__c = sr.body.toString();
        insert qLIs;

        Map<String, Object> input = new Map<String, Object> {
            'itemId' => qLIs[0].Id,
            'codes' => 'ATTR_BANDWIDTH'
        };
        Map<String, Object> output = new Map<String, Object>();
        Map<String, Object> options = new Map<String, Object>();

        service.invokeMethod('getXLIAttributes', input, output, options);
        system.debug(output);
        System.assertNotEquals(null, output.get('attributes'));

        input = new Map<String, Object> {
            'items' => new List<Object> {
                new Map<String, Object> {
                    'Id' => qLIs[0].Id,
                    'Attributes' => new List<Object> {
                        new Map<String, Object> {
                        	'AttributeCode' => 'ATTR_BANDWIDTH',
                            'Value' => '50 Mbps'
                    	}    
                    } 
                }
            }
        };
        service.invokeMethod('updateXLIAttributes', input, output, options);

    }
    
    @isTest  
    static void PricingPlan_PreInvoke_Test() {
        ftr_CpqService service = new ftr_CpqService();
        List<Quote> quotes = ftr_TestDataFactory.getQuotes(1);
        Quote testQuote = quotes[0];
        
        service.PricingPlan_PreInvoke(null, testQuote, new List<SObject> {});
    }

    @isTest  
    static void PutCartsItems_PreInvoke_Test() {
        ftr_CpqService service = new ftr_CpqService();

        // JSON for updating EVPL EVC speed
        StaticResource sr = [SELECT Id, Body FROM StaticResource WHERE Name = 'ftr_TD_Q1_API_putCartsItems_Req' LIMIT 1];
        String body = sr.Body.toString();

        Map<String, Object> input = (Map<String, Object>)JSON.deserializeUntyped(body);
        Map<String, Object> output = new Map<String, Object>();
        Map<String, Object> options = new Map<String, Object>();
        
        service.PutCartsItems_PreInvoke(input, output, options);
        
        System.debug(ftr_CpqCartCtx.peekMessage('prepareDSATAttrSync'));
        System.debug(ftr_CpqCartCtx.peekMessage('prepareSpeedRollup'));

        // JSON for updating EIA's speed
        sr = [SELECT Id, Body FROM StaticResource WHERE Name = 'ftr_TD_Q1_API_putCartsItems_Req2' LIMIT 1];
        body = sr.Body.toString();

        input = (Map<String, Object>)JSON.deserializeUntyped(body);
        output = new Map<String, Object>();
        options = new Map<String, Object>();

        service = new ftr_CpqService();
        
        service.PutCartsItems_PreInvoke(input, output, options);
        
        System.debug(ftr_CpqCartCtx.peekMessage('prepareDSATAttrSync'));
        System.debug(ftr_CpqCartCtx.peekMessage('prepareSpeedRollup'));

        System.assertNotEquals(null, ftr_CpqCartCtx.peekMessage('prepareDSATAttrSync'));
        System.assertNotEquals(null, ftr_CpqCartCtx.peekMessage('prepareSpeedRollup'));
    }
    
    @isTest
    static void DeleteCartsItems_PreInvoke_Test(){
        StaticResource sr1 = [SELECT Id, Body FROM StaticResource WHERE Name = 'ftr_TD_Q2_LineItems' LIMIT 1];
        StaticResource sr2 = [SELECT Id, Body FROM StaticResource WHERE Name = 'ftr_TD_Q2_API_deleteCartsItems_Req' LIMIT 1];
        StaticResource sr3 = [SELECT Id, Body FROM StaticResource WHERE Name = 'ftr_TD_Q2_API_deleteCartsItems_Req2' LIMIT 1];

        ftr_CpqService service = new ftr_CpqService();

        List<QuoteLineItem> qLIs = (List<QuoteLineItem>)JSON.deserialize(sr1.body.toString(), List<QuoteLineItem>.class);
        Map<String, Object> input = (Map<String, Object>)JSON.deserializeUntyped(sr2.body.toString());
        Map<String, Object> output = new Map<String, Object>();
        Map<String, Object> options = new Map<String, Object>();

        service.DeleteCartsItems_PreInvoke(input, output, options, qLIs);
        
        input = (Map<String, Object>)JSON.deserializeUntyped(sr3.body.toString());
        output = new Map<String, Object>();
        options = new Map<String, Object>();
       // service.DeleteCartsItems_PreInvoke(input, output, options);
        service.DeleteCartsItems_PreInvoke(input, output, options, qLIs);

        // service.DeleteCartsItems_PreInvoke(input, output, options);
    }
      @isTest
    static void CloneCartsItems_PreInvoke_Test(){
        StaticResource sr1 = [SELECT Id, Body FROM StaticResource WHERE Name = 'ftr_TD_Q2_LineItems' LIMIT 1];
        StaticResource sr2 = [SELECT Id, Body FROM StaticResource WHERE Name = 'ftr_TD_Q2_API_deleteCartsItems_Req' LIMIT 1];
        StaticResource sr3 = [SELECT Id, Body FROM StaticResource WHERE Name = 'ftr_TD_Q2_API_deleteCartsItems_Req2' LIMIT 1];

        ftr_CpqService service = new ftr_CpqService();
       
         Map<String, Object> input = (Map<String, Object>)JSON.deserializeUntyped(sr2.body.toString());

        Map<String, Object> output = new Map<String, Object>();
        
        Map<String, Object> options = new Map<String, Object>();

        service.CloneCartsItems_PreInvoke(input, output, options);
       
    }
    
    @isTest
    static void PostCartsItems_PreInvoke_Test(){
        ftr_CpqService service = new ftr_CpqService();

        QuoteLineItem[] qLIs = ftr_TestDataFactory.getQLI(3, 1);
        Map<String, Object> input = new Map<String, Object>{
            'cartId' => qLIs[0].QuoteId,
            'items' => new List<Map<String, Object>>{
                new Map<String,Object> { 
                    'attributesToUpdate' => new Map<String,Object> {
                        'ATTR_BANDWIDTH' => '100 Mbps'
                    }
                }
            }
        };
        Map<String, Object> output = new Map<String, Object>();
        Map<String, Object> options = new Map<String, Object>();

        Boolean result = service.PostCartsItems_PreInvoke(input, output, options);
       	System.assertEquals(true, result);
        
    }
    /*	@isTest
    static void PostCartsItems_PreInvoke_Test1(){
    ftr_CpqService service = new ftr_CpqService();

    // JSON for updating EVPL EVC speed
    StaticResource sr = [SELECT Id, Body FROM StaticResource WHERE Name = 'ftr_TD_Q1_API_putCartsItems_Req' LIMIT 1];
    String body = sr.Body.toString();

    Map<String, Object> input = (Map<String, Object>)JSON.deserializeUntyped(body);
    Map<String, Object> output = new Map<String, Object>();
    Map<String, Object> options = new Map<String, Object>();
    
    //service.PostCartsItems_PreInvoke(input, output, options);
    
    System.debug(ftr_CpqCartCtx.peekMessage('prepareDSATAttrSync'));
    System.debug(ftr_CpqCartCtx.peekMessage('prepareSpeedRollup'));

    // JSON for updating EIA's speed
    sr = [SELECT Id, Body FROM StaticResource WHERE Name = 'ftr_TD_Q1_API_putCartsItems_Req2' LIMIT 1];
    body = sr.Body.toString();

    input = (Map<String, Object>)JSON.deserializeUntyped(body);
    output = new Map<String, Object>();
    options = new Map<String, Object>();

    service = new ftr_CpqService();
    
    //service.PostCartsItems_PreInvoke(input, output, options);
    
    System.debug(ftr_CpqCartCtx.peekMessage('prepareDSATAttrSync'));
    System.debug(ftr_CpqCartCtx.peekMessage('prepareSpeedRollup'));

    System.assertEquals(null, ftr_CpqCartCtx.peekMessage('prepareDSATAttrSync'));
    System.assertEquals(null, ftr_CpqCartCtx.peekMessage('prepareSpeedRollup'));
} */
@isTest
    static void updateXLIAttributes_Test1(){
        ftr_CpqService service = new ftr_CpqService();
        Map<String, Object> input = new Map<String, Object>();
        Map<String, Object> output = new Map<String, Object>();
        Map<String, Object> options = new Map<String, Object>();

        Boolean result = service.updateXLIAttributes(input, output, options);
        System.assertEquals(false, result);
        
    }
    @isTest
    static void getXLIAttributes_Test2(){
        ftr_CpqService service = new ftr_CpqService();
        Map<String, Object> input = new Map<String, Object>();
        Map<String, Object> output = new Map<String, Object>();
        Map<String, Object> options = new Map<String, Object>();

        Boolean result = service.getXLIAttributes(input, output, options);
        System.assertEquals(false, result);
        
    } 
 /*   @isTest
    static void CloneCartsItems_PreInvoke_Test(){
        ftr_CpqService service = new ftr_CpqService();
        Map<String, Object> input = new Map<String, Object>();
        Map<String, Object> output = new Map<String, Object>();
        Map<String, Object> options = new Map<String, Object>();

        Boolean result = service.CloneCartsItems_PreInvoke(input, output, options);
        System.assertEquals(true, result);
        
    }*/
    @isTest
    static void invokeCpqAppHandlerMethod_Test(){
//        ftr_CpqService service = new ftr_CpqService();
        Map<String, Object> input = new Map<String, Object>();
        Map<String, Object> output = new Map<String, Object>();
        Map<String, Object> options = new Map<String, Object>();

        ftr_CpqService.invokeCpqAppHandlerMethod('',input, output, options);  
       // System.assertEquals(false, result);
        
    } 
    @isTest
    
    static void GetCartsItems_PreInvoke_Test(){
      ftr_CpqService service = new ftr_CpqService();
        Map<String, Object> input = new Map<String, Object>();
        Map<String, Object> output = new Map<String, Object>();
        Map<String, Object> options = new Map<String, Object>();

        Boolean result = service.GetCartsItems_PreInvoke(input, output, options);
        System.assertEquals(true, result);   
        
    }
}