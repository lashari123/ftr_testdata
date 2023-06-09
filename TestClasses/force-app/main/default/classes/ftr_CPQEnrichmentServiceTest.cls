/**
 * @description       : This test class covers the following Apex classes:
 *      TBD_CLASS1
 *      TBD_CLASS2
 *      TBD_CLASS3
 * @author            : TBD
 * @version           : 1 
**/
@isTest
private class ftr_CPQEnrichmentServiceTest {

    @TestSetup
    static void makeData(){

        Integer numOfOrderItem = 1;
    
        //test data for Host UNI
        Map<String,String> prodUNIHostMap = new Map<String,String>{
            'User to Network Interface (UNI) Port' => 'ENT_ETH_UNI_0001'
        };

        List<Order> orderList = new List<Order>();
        orderList = ftr_TestDataFactory.getOrders(1);
        insert orderList;

        List<OrderItem> listAllOrderItems = new List<OrderItem>();
        
        List<OrderItem> ordItemHostUNIList = ftr_TestDataFactory.getOrderItems(numOfOrderItem, prodUNIHostMap);
        ordItemHostUNIList[0].OrderId =orderList[0].id;
        listAllOrderItems.addAll(ordItemHostUNIList);     
        


        //test data for Remote UNI
        List<OrderItem> ordItemRemoteUNIList = ftr_TestDataFactory.getOrderItems(numOfOrderItem, prodUNIHostMap);
        ordItemRemoteUNIList[0].OrderId =orderList[0].id;
        listAllOrderItems.addAll(ordItemRemoteUNIList);

        Map<String,String> prodDIAMap = new Map<String,String>{
            'DIA (Dedicated Internet Access)' => 'ENT_ETH_EIA_0002'
        };

        List<OrderItem> ordItemDIAList = ftr_TestDataFactory.getOrderItems(numOfOrderItem, prodDIAMap);
        ordItemDIAList[0].OrderId = orderList[0].id;
        ordItemDIAList[0].ftr_PromoCode__c = 'EIAPromo';
		// insert ordItemDIAList;
        listAllOrderItems.addAll(ordItemDIAList);


        insert listAllOrderItems;
        
       

        //test data for EVPL
        Map<String,String> prodEVPLMap = new Map<String,String>{
            'EVPL (Ethernet Virtual Private Line)' => 'ENT_ETH_EVPL_0010'
        };
        List<OrderItem> ordItemEVPLList = ftr_TestDataFactory.getOrderItems(numOfOrderItem, prodEVPLMap);
        ordItemEVPLList[0].OrderId = orderList[0].id;
        ordItemEVPLList[0].UNI_Host__c = ordItemHostUNIList[0].Id;
        ordItemEVPLList[0].UNI_Remote__c = ordItemRemoteUNIList[0].Id;
        insert ordItemEVPLList;

        // create another uni and link to EVPL as parent
        //List<OrderItem> ordItemRemoteUNIList2 = ftr_TestDataFactory.getOrderItems(numOfOrderItem, prodUNIHostMap);
        // ordItemRemoteUNIList2[1].OrderId =orderList[0].id;
        //ordItemRemoteUNIList2[1].ftr_ParentItemId__c =ordItemEVPLList[0].id;
        // listAllOrderItems.addAll(ordItemRemoteUNIList);
        //insert ordItemRemoteUNIList2;

        
    }

    @isTest 
    static void updateVlanTagConfigTest() {
        Map<String, Object> inputMap = new Map<String, Object>();
        Map<String, Object> outputMap = new Map<String, Object>();
        Map<String, Object> options = new Map<String, Object>();

        List<OrderItem> ordItem = [SELECT Id, OrderId, vlocity_cmt__JSONAttribute__c,VLAN_Tag_Config__c, vlocity_cmt__Product2Id__r.ProductCode
                                    FROM OrderItem];

        inputMap.put('orderId', ordItem[0].OrderId);

        ftr_CPQEnrichmentService enrichServ = new ftr_CPQEnrichmentService();
        Test.startTest();
        enrichServ.invokeMethod('updateVlanTagConfig', inputMap, outputMap, options);
        Test.stopTest();
    }
    
    @isTest 
    static void updateSIPUNIAttributesTest() {
        Map<String, Object> inputMap = new Map<String, Object>();
        Map<String, Object> outputMap = new Map<String, Object>();
        Map<String, Object> options = new Map<String, Object>();

        List<OrderItem> ordItem = [SELECT Id, OrderId, vlocity_cmt__JSONAttribute__c,VLAN_Tag_Config__c, vlocity_cmt__Product2Id__r.ProductCode
                                    FROM OrderItem];

        inputMap.put('orderId', ordItem[0].OrderId);

        ftr_CPQEnrichmentService enrichServ = new ftr_CPQEnrichmentService();
        Test.startTest();
        enrichServ.invokeMethod('updateSIPUNIAttributes', inputMap, outputMap, options);
        Test.stopTest();
    }

    @isTest 
    static void updateSECNCITest() {
        Map<String, Object> inputMap = new Map<String, Object>();
        Map<String, Object> outputMap = new Map<String, Object>();
        Map<String, Object> options = new Map<String, Object>();

        List<OrderItem> ordItem = [SELECT Id, OrderId, vlocity_cmt__JSONAttribute__c,VLAN_Tag_Config__c, vlocity_cmt__Product2Id__r.ProductCode
                                    FROM OrderItem];

        inputMap.put('orderId', ordItem[0].OrderId);
        ftr_CPQEnrichmentService enrichServ = new ftr_CPQEnrichmentService();
        Test.startTest();
        enrichServ.invokeMethod('updateSECNCI', inputMap, outputMap, options);
        Test.stopTest();
    }
    @isTest 
    static void rollupUNIBitRateTest() {
        Map<String, Object> inputMap = new Map<String, Object>();
        Map<String, Object> outputMap = new Map<String, Object>();
        Map<String, Object> options = new Map<String, Object>();
		List<Object> DIAList = new List<Object>();
        Map<String,Object> DIAMap = new Map<String,Object>{
            'UNILocationId'=>''
        };
        DIAList.add(DIAMap);
        Map<String,Object> InputDIAMap = new Map<String,Object>{
            'DIA'=>DIAList
        };
        List<OrderItem> ordItem = [SELECT Id, OrderId, vlocity_cmt__JSONAttribute__c,vlocity_cmt__Product2Id__c,vlocity_cmt__Product2Id__r.ProductCode, Product2.ProductCode, UNI_Host__c, UNI_Remote__c
                                    FROM OrderItem];
       
       
        
       
        inputMap.put('orderId', ordItem[0].OrderId);
		inputMap.put('DIAUNIAssoc', InputDIAMap);
        ftr_CPQEnrichmentService enrichServ = new ftr_CPQEnrichmentService();
        Test.startTest();
        enrichServ.invokeMethod('rollupUNIBitRate', inputMap, outputMap, options);
        enrichServ.invokeMethod('updateEIAOverSDWAN', inputMap, outputMap, options);
        Test.stopTest();
    }
	
    @isTest 
    static void updateAttributesByServiceAccountTest() {

        List<OrderItem> ordItem = [SELECT Id, OrderId, vlocity_cmt__JSONAttribute__c,vlocity_cmt__Product2Id__c,vlocity_cmt__Product2Id__r.ProductCode,vlocity_cmt__ServiceAccountId__c, Product2.ProductCode, UNI_Host__c, UNI_Remote__c
                                    FROM OrderItem];
       
        String orderId = ordItem[0].OrderId;
        String eiaProductCode = 'ENT_ETH_EIA_0002';
        String serviceAccountId = ordItem[0].vlocity_cmt__ServiceAccountId__c;
        Map<String, Object> attributesToUpdate = new Map<String, Object> {
            'ATTR_DSAT_ID' => 'VALUE1',
            'ATTR_TECH_CE_VLAN_ID' => 'VALUE2'
            //'ATTR_DIA_OVER_SDWAN'=>'true'
        };
        Map<String, Object> tempMap = new Map<String, Object> {
            'attributesToUpdate' => attributesToUpdate,
            'ServiceAccountId' => serviceAccountId
        };
        List<Map<String, Object>> reqList = new List<Map<String, Object>> { tempMap };
        ftr_CPQEnrichmentService service = new ftr_CPQEnrichmentService();
        Map<String, Object> options = new Map<String, Object>();
        Map<String, Object> outputMap = new Map<String, Object>();
        Map<String, Object> inputMap = new Map<String, Object> { 
            'input' => new Map<string, object> {
            	'OrderId' => orderId,
            	'ProductCode' => eiaProductCode,
            	'request' => reqList
            }
        };        

        Test.startTest();
        service.invokeMethod('updateAttributesByServiceAccount', inputMap, outputMap, options);
        Test.stopTest();
    }
    
    @isTest 
    static void updateAttributesByServiceAccountErrorTest() {

        List<OrderItem> ordItem = [SELECT Id, OrderId, vlocity_cmt__JSONAttribute__c,vlocity_cmt__Product2Id__c,vlocity_cmt__Product2Id__r.ProductCode,vlocity_cmt__ServiceAccountId__c, Product2.ProductCode, UNI_Host__c, UNI_Remote__c
                                    FROM OrderItem];
       
        String orderId = ordItem[0].OrderId;
        String eiaProductCode = 'ENT_ETH_EIA_0002';
        String serviceAccountId = ordItem[0].vlocity_cmt__ServiceAccountId__c;
        Map<String, Object> attributesToUpdate = new Map<String, Object> {
            'ATTR_DSAT_ID' => 'VALUE1',
            'ATTR_TECH_CE_VLAN_ID' => 'VALUE2'
            //'ATTR_DIA_OVER_SDWAN'=>'true'
        };
        Map<String, Object> tempMap = new Map<String, Object> {
            'attributesToUpdate' => attributesToUpdate,
            'ServiceAccountId' => serviceAccountId
        };
        List<Map<String, Object>> reqList = new List<Map<String, Object>> { tempMap };
        ftr_CPQEnrichmentService service = new ftr_CPQEnrichmentService();
        Map<String, Object> options = new Map<String, Object>();
        Map<String, Object> outputMap = new Map<String, Object>();
        Map<String, Object> inputMap = new Map<String, Object> { 
            'input' => new Map<string, object> {
            	'OrderId' => orderId,
            	'ProductCode' => eiaProductCode,
            	'request' => 'Error Scenarior'
            }
        };        

        Test.startTest();
        service.invokeMethod('updateAttributesByServiceAccount', inputMap, outputMap, options);
        Test.stopTest();
    }
    
    @isTest 
    static void rollupUNIBitRateErrorTest() {
        Map<String, Object> inputMap = new Map<String, Object>();
        Map<String, Object> outputMap = new Map<String, Object>();
        Map<String, Object> options = new Map<String, Object>();
		List<Object> DIAList = new List<Object>();
        Map<String,Object> DIAMap = new Map<String,Object>{
            'UNILocationId'=>null
        };
        DIAList.add(DIAMap);
        Map<String,Object> InputDIAMap = new Map<String,Object>{
            'DIA'=>'Error'
        };
        List<OrderItem> ordItem = [SELECT Id, OrderId, vlocity_cmt__JSONAttribute__c,vlocity_cmt__Product2Id__c,vlocity_cmt__Product2Id__r.ProductCode, Product2.ProductCode, UNI_Host__c, UNI_Remote__c
                                    FROM OrderItem];
       
       
        
       
        inputMap.put('orderId', ordItem[0].OrderId);
		inputMap.put('DIAUNIAssoc', InputDIAMap);
        ftr_CPQEnrichmentService enrichServ = new ftr_CPQEnrichmentService();
        Test.startTest();
        enrichServ.invokeMethod('rollupUNIBitRate', inputMap, outputMap, options);
        enrichServ.invokeMethod('updateEIAOverSDWAN', inputMap, outputMap, options);
        Test.stopTest();
    }
	
    
    @isTest 
    static void updatePromoCodeTest(){
        Map<String, Object> inputMap = new Map<String, Object>();
        Map<String, Object> outputMap = new Map<String, Object>();
        Map<String, Object> options = new Map<String, Object>();

        List<OrderItem> ordItem = [SELECT Id, OrderId, vlocity_cmt__JSONAttribute__c,VLAN_Tag_Config__c, vlocity_cmt__Product2Id__r.ProductCode
                                    FROM OrderItem];

        inputMap.put('orderId', ordItem[0].OrderId);

        ftr_CPQEnrichmentService enrichServ = new ftr_CPQEnrichmentService();
        Test.startTest();
        enrichServ.invokeMethod('updatePromoOnUNI', inputMap, outputMap, options);
        Test.stopTest();
    }
    
}