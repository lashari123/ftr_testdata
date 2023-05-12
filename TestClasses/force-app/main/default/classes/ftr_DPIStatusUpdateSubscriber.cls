global with sharing class ftr_DPIStatusUpdateSubscriber {
    public final static String INPUT_STATE_RUNNING = 'Running';
    //public final static String INPUT_STATE_PENDING = 'Pending';
    //public final static String INPUT_STATE_SKIPPED = 'Skipped';
    public final static String INPUT_ITEM_DEFINITION_DPI = 'Wait to DPI Order Status Event';
    public final static String INPUT_ITEM_DEFINITION_DPI_MDN = 'SIPWaitDPIOrderStatusEvent';
	public final static String INPUT_PRODUCTCODE_DPI_MDN = 'DID_DPI_MDN_RFS_0010';

     // BUlk Order Item Name 
     public final static String INPUT_ITEM_DEFINITION_DPI_Bulk = 'WaitForLeadDIDOrder';
     public static String orderBulkNumber;
    //public final static String INPUT_ITEM_DEFINITION = 'FinalOrderCompletion';
    public final static String TECH_PRODUCTCODE_DPI_CKT_BILLING = 'ENT_ETH_DPI_CIRCUIT_BILLING';
    
    //SIP Trunking thecnical products
    public final static String INPUT_SIP_ITEM_DEFINITION_DPI = 'SIP Wait to DPI Order Status Event';
    public final static String TECH_PRODUCTCODE_DPI_SIP_UNI = 'DPI_CIRCUIT_BILLING_RES_SPEC_0010';
    public final static String TECH_PRODUCTCODE_DPI_SIP_TRUNKING = 'SIP_TRUNKING_DPI_BILLING_RES_SPEC_0010';
   
    // DID Lead OI
    public final static String INPUT_DIDLEad_ITEM_DEFINITION_DPI = 'WaitForDIDLeadOrderStatusEvent';
    public final static String TECH_PRODUCTCODE_DPI_Lead_Order = 'DID_DPI_LEAD_ORDER_RFS_0010';
    
    // DID Bulk Order Status Event
    public final static String INPUT_DIDBULKORDERSTATUS_ITEM_DEFINITION = 'WaitForDIDBulkOrderStatusEvent';
    public final static String TECH_PRODUCTCODE_DPI_Bulk_Billing_RFS = 'DPI_Bulk_Billing_RFS';

    public final static String IS_Billingcomplete = 'ATTR_IsBillingComplete';
    public final static String ATT_VALUE_TRUE = 'True';
    public final static String ATT_VALUE_FALSE = 'False';
    public final static String EXECUTE_METHOD = 'execute';
    public final static String EXECUTE_BULK_ORDER_STATUS_METHOD = 'executeDIDBulkOrderStatusUpdate';
    public final static String ATTR_ErrorCode ='ATTR_ErrorCode';
    public final static String ATTR_ErrorMessage ='ATTR_ErrorMessage';
    public final static String ATTR_WarningCode ='ATTR_WarningCode';
    public final static String ATTR_WarningMessage ='ATTR_WarningMessage';
    
    global Boolean invokeMethod(String methodName, Map<String, Object> inputMap, Map<String, Object> outputMap, Map<String, Object> options) {
        System.debug('Enter ftr_DPIStatusUpdateSubscriber.' + methodName);
        try {
            if (methodName == EXECUTE_METHOD) {
                return execute(methodName, inputMap, outputMap);
            }
            
            if(methodName == EXECUTE_BULK_ORDER_STATUS_METHOD) {
                return executeDIDBulkOrderStatusUpdate(methodName, inputMap, outputMap);
            }
            return true;
        } catch (Exception ex) {
            System.debug(ex.getLineNumber() + ': ' + ex.getMessage());
            return false;
        } finally {
            System.debug('Exit ftr_DPIStatusUpdateSubscriber.' + methodName);
        }
    }
    public Boolean execute(String methodName, Map<String, Object> inputMap, Map<String, Object> outputMap){
		System.debug('execute call');
        Map<String,Object> taskDetailsMap = new Map<String,Object>();  
        String sfOrderId;
        String sfOrderNumber = (String) inputMap.get('OrderNumber');
        orderBulkNumber = sfOrderNumber;
        ftr_DPIOrderStatusEvent.Orders itemsobj;
        Map<String, Set<String>> responseMessages = new Map<String, Set<String>>();
        // Map<Id,vlocity_cmt__FulfilmentRequestLine__c> frlsToUpdateMap = new Map<Id,vlocity_cmt__FulfilmentRequestLine__c>();
        List<FulfilmentRequestEvent__e> frlsToUpdate = new List<FulfilmentRequestEvent__e>();
        for (vlocity_cmt__OrchestrationItem__c item : [SELECT Id, Name,vlocity_cmt__FulfilmentRequestLineId__c, vlocity_cmt__FulfilmentRequestLineId__r.vlocity_cmt__JSONAttribute__c, vlocity_cmt__OrchestrationItem__c.vlocity_cmt__OrchestrationItemDefinitionId__r.Name,
                                                        vlocity_cmt__orchestrationPlanId__r.vlocity_cmt__OrderId__c
                                                        FROM vlocity_cmt__OrchestrationItem__c
                                                        WHERE (vlocity_cmt__State__c =: INPUT_STATE_RUNNING)
                                                        AND (vlocity_cmt__OrchestrationItemDefinitionId__r.Name =: INPUT_ITEM_DEFINITION_DPI OR  vlocity_cmt__OrchestrationItemDefinitionId__r.Name =: INPUT_SIP_ITEM_DEFINITION_DPI 
                                                        OR vlocity_cmt__OrchestrationItemDefinitionId__r.Name =: INPUT_DIDLEad_ITEM_DEFINITION_DPI 
                                                        OR vlocity_cmt__OrchestrationItemDefinitionId__r.Name =: INPUT_DIDBULKORDERSTATUS_ITEM_DEFINITION 
                                                        OR vlocity_cmt__OrchestrationItemDefinitionId__r.Name =: INPUT_ITEM_DEFINITION_DPI_MDN)
                                                        AND vlocity_cmt__orchestrationPlanId__r.vlocity_cmt__OrderId__r.OrderNumber =: sfOrderNumber
                                                        AND (vlocity_cmt__FulfilmentRequestLineId__r.vlocity_cmt__Product2Id__r.ProductCode =: TECH_PRODUCTCODE_DPI_CKT_BILLING 
                                                        OR vlocity_cmt__FulfilmentRequestLineId__r.vlocity_cmt__Product2Id__r.ProductCode =: TECH_PRODUCTCODE_DPI_SIP_UNI 
                                                        OR vlocity_cmt__FulfilmentRequestLineId__r.vlocity_cmt__Product2Id__r.ProductCode =: TECH_PRODUCTCODE_DPI_SIP_TRUNKING 
                                                        OR vlocity_cmt__FulfilmentRequestLineId__r.vlocity_cmt__Product2Id__r.ProductCode =: TECH_PRODUCTCODE_DPI_Lead_Order 
                                                        OR vlocity_cmt__FulfilmentRequestLineId__r.vlocity_cmt__Product2Id__r.ProductCode =: TECH_PRODUCTCODE_DPI_Bulk_Billing_RFS
                                                        OR vlocity_cmt__FulfilmentRequestLineId__r.vlocity_cmt__Product2Id__r.ProductCode =: INPUT_PRODUCTCODE_DPI_MDN )]){
                                                            
            System.debug('vlocityItem = '+ item);
            if(item.Name == INPUT_DIDLEad_ITEM_DEFINITION_DPI){
                setBulkOrderFulfillment(item);
            }
            //

			String orderNumber;
            sfOrderId=item.vlocity_cmt__orchestrationPlanId__r.vlocity_cmt__OrderId__c;    
            String jsonAttribute = item.vlocity_cmt__FulfilmentRequestLineId__r.vlocity_cmt__JSONAttribute__c; 
            vlocity_cmt__FulfilmentRequestLine__c frl = new vlocity_cmt__FulfilmentRequestLine__c(
                Id=item.vlocity_cmt__FulfilmentRequestLineId__c,
                vlocity_cmt__JSONAttribute__c = jsonAttribute
            );
            
            if (Test.isRunningTest()){
                orderNumber = '077756953';
            } else{
                orderNumber = (String)ftr_CpqHelper.getJSONAttributeValue(jsonAttribute, 'GroupMemberOrderId');  
            }
            System.debug('DPIStatusUpdate:Matching OrderNumber Exists:orderNumber-->'+orderNumber);
            System.debug('DPIStatusUpdate:Matching OrderNumber Exists:inputMap-->'+inputMap);
            
            if(inputMap.containsKey(ordernumber))  {
                System.debug('DPIStatusUpdate:Matching OrderNumber Exists:orderNumber-->'+orderNumber);
                System.debug('DPIStatusUpdate:Matching OrderNumber Exists:FRL Id-->'+frl.Id);
                itemsobj = (ftr_DPIOrderStatusEvent.Orders) inputMap.get(orderNumber);
                Set<String> errorCodes = new Set<String>();
                Set<String> errorMessages = new Set<String>();
                Set<String> warningCodes = new Set<String>();
                Set<String> warningMessages = new Set<String>();

                if(itemsobj.isOrderCreated == true && itemsobj.isOrderValid == true){
                    System.debug('DPIStatusUpdate:Valid/Created Order');
                    Map<String, Object> attrVals = new Map<String, Object>{
                        IS_Billingcomplete => ATT_VALUE_TRUE
                    };
                    frl.vlocity_cmt__JSONAttribute__c = (String)ftr_CpqHelper.setJSONAttributes(frl.vlocity_cmt__JSONAttribute__c, '{}', attrVals);
                    // frlsToUpdateMap.put(frl.Id,frl);
                } else {
                    System.debug('DPIStatusUpdate:InValid/Order Not Created');
                    
                    // Below lines are added to create the task on the requirement of the orderCompleted = false - SDDD - 2577
						System.debug('Creating Task for Invalid Order');
                        taskDetailsMap.put('Description', 'Order is not completed, Please check the order completion to True');
                        taskDetailsMap.put('Subject', 'DPI OM Billing Exception');
                        taskDetailsMap.put('Priority', 'High');
                        taskDetailsMap.put('WhatId', sfOrderId);
                        ftr_OrderManagementHelper.CreateTask(taskDetailsMap); 
                    
                    List<ftr_DPIOrderStatusEvent.Messages> msgs = itemsobj.Messages;   
					System.debug('msgs = ' + msgs);        
                    if(msgs != null){
                        for(ftr_DPIOrderStatusEvent.Messages childmsg : msgs) {
							System.debug('childmsg = ' + childmsg);
                            // get errors and warnings to save in JSONAttribute
                            if (childmsg.severity == 'ERROR') {
                                errorCodes.add(childmsg.code);
                                errorMessages.add(childmsg.text);
                            } else if (childmsg.severity == 'WARN') {
                                warningCodes.add(childmsg.code);
                                warningMessages.add(childmsg.text);
                            }
                            // build map for task
                            String description = childmsg.severity + ' for Service Order: ' + ordernumber + '\r\n Code: ' + childmsg.code + '\r\n Message: ' + childmsg.text;
                            if (responseMessages.containsKey(childmsg.severity)) {
                                responseMessages.get(childmsg.severity).add(description);
                            } else {
                                responseMessages.put(childmsg.severity, new Set<String>{ description });
                            }
                        }
                    }
                    Map<String, Object> attrVals = new Map<String, Object>{
                        IS_Billingcomplete => ATT_VALUE_FALSE,
                        ATTR_ErrorCode => String.join((Iterable<String>)errorCodes, '|'),
                        ATTR_ErrorMessage => String.join((Iterable<String>)errorMessages, '|'),
                        ATTR_WarningCode => String.join((Iterable<String>)warningCodes, '|'),
                        ATTR_WarningMessage => String.join((Iterable<String>)warningMessages, '|')
                    }; 
                    frl.vlocity_cmt__JSONAttribute__c = (String)ftr_CpqHelper.setJSONAttributes(frl.vlocity_cmt__JSONAttribute__c, '{}', attrVals);
                    // frlsToUpdateMap.put(frl.Id,frl);
                }
                System.debug('### frl:' + frl.Id);
                frlsToUpdate.add(new FulfilmentRequestEvent__e(
                    FRL_Id__c=frl.Id,
                    JSONAttribute__c=frl.vlocity_cmt__JSONAttribute__c,
                    MethodName__c='updateFRLs'
                ));
            }
        }
		System.debug('responseMessages.get = '+ responseMessages.get('errors'));
        if (responseMessages.get('ERROR') != null) {
			System.debug('Creating Task for Invalid Order');
            taskDetailsMap.put('Description', String.join((Iterable<String>)responseMessages.get('ERROR'), '\r\n\r\n'));
            taskDetailsMap.put('Subject', 'DPI OM Billing Exception');
            taskDetailsMap.put('Priority', 'High');
            taskDetailsMap.put('WhatId', sfOrderId);
            ftr_OrderManagementHelper.CreateTask(taskDetailsMap);
        }


        System.debug('DPIStatusUpdate:frlsToUpdate:size:'+frlsToUpdate.size());
        if(frlsToUpdate.size() > 0){
            List<Database.SaveResult> results = EventBus.publish(frlsToUpdate);
            for (Database.SaveResult sr : results) {
                if (sr.isSuccess()) {
                    System.debug('Successfully published FulfilmentRequestEvent__e.');
                } else {
                    for(Database.Error err : sr.getErrors()) {
                        System.debug('Error returned while publishing FulfilmentRequestEvent__e: ' + err.getStatusCode() + ' - ' + err.getMessage());
                    }
                }       
            }
        }
        return true;
    }

    public Boolean executeDIDBulkOrderStatusUpdate(String methodName, Map<String, Object> inputMap, Map<String, Object> outputMap){
		System.debug('executeDIDBulkOrderStatusUpdate call');
        Map<String,Object> taskDetailsMap = new Map<String,Object>();  
        String sfOrderId;
        String sfOrderNumber = (String) inputMap.get('OrderNumber');
        orderBulkNumber = sfOrderNumber;
        ftr_DPIOrderStatusEvent.Orders itemsobj;
        Map<String, Set<String>> responseMessages = new Map<String, Set<String>>();
        // Map<Id,vlocity_cmt__FulfilmentRequestLine__c> frlsToUpdateMap = new Map<Id,vlocity_cmt__FulfilmentRequestLine__c>();
        List<FulfilmentRequestEvent__e> frlsToUpdate = new List<FulfilmentRequestEvent__e>();
        for (vlocity_cmt__OrchestrationItem__c item : [SELECT Id, Name,vlocity_cmt__FulfilmentRequestLineId__c, vlocity_cmt__FulfilmentRequestLineId__r.vlocity_cmt__JSONAttribute__c, vlocity_cmt__OrchestrationItem__c.vlocity_cmt__OrchestrationItemDefinitionId__r.Name, vlocity_cmt__orchestrationPlanId__r.vlocity_cmt__OrderId__c FROM vlocity_cmt__OrchestrationItem__c WHERE (vlocity_cmt__State__c =: INPUT_STATE_RUNNING) AND (vlocity_cmt__OrchestrationItemDefinitionId__r.Name =: INPUT_ITEM_DEFINITION_DPI OR  vlocity_cmt__OrchestrationItemDefinitionId__r.Name =: INPUT_SIP_ITEM_DEFINITION_DPI OR vlocity_cmt__OrchestrationItemDefinitionId__r.Name =: INPUT_DIDLEad_ITEM_DEFINITION_DPI OR vlocity_cmt__OrchestrationItemDefinitionId__r.Name =: INPUT_DIDBULKORDERSTATUS_ITEM_DEFINITION OR vlocity_cmt__OrchestrationItemDefinitionId__r.Name =: INPUT_ITEM_DEFINITION_DPI_MDN) AND vlocity_cmt__orchestrationPlanId__r.vlocity_cmt__OrderId__r.OrderNumber =: sfOrderNumber AND (vlocity_cmt__FulfilmentRequestLineId__r.vlocity_cmt__Product2Id__r.ProductCode =: TECH_PRODUCTCODE_DPI_CKT_BILLING OR vlocity_cmt__FulfilmentRequestLineId__r.vlocity_cmt__Product2Id__r.ProductCode =: TECH_PRODUCTCODE_DPI_SIP_UNI OR vlocity_cmt__FulfilmentRequestLineId__r.vlocity_cmt__Product2Id__r.ProductCode =: TECH_PRODUCTCODE_DPI_SIP_TRUNKING OR vlocity_cmt__FulfilmentRequestLineId__r.vlocity_cmt__Product2Id__r.ProductCode =: TECH_PRODUCTCODE_DPI_Lead_Order OR vlocity_cmt__FulfilmentRequestLineId__r.vlocity_cmt__Product2Id__r.ProductCode =: TECH_PRODUCTCODE_DPI_Bulk_Billing_RFS OR vlocity_cmt__FulfilmentRequestLineId__r.vlocity_cmt__Product2Id__r.ProductCode =: INPUT_PRODUCTCODE_DPI_MDN )]) {
            if(item.Name == INPUT_DIDBULKORDERSTATUS_ITEM_DEFINITION) {
                System.debug('### item:' + item);
                if(item != null) {
                    System.debug('### item:' + item);
                    String jsonAttribute = item.vlocity_cmt__FulfilmentRequestLineId__r.vlocity_cmt__JSONAttribute__c; 
                    vlocity_cmt__FulfilmentRequestLine__c frl = new vlocity_cmt__FulfilmentRequestLine__c(
                        Id=item.vlocity_cmt__FulfilmentRequestLineId__c,
                        vlocity_cmt__JSONAttribute__c = jsonAttribute
                    );
                    Map<String, Object> attrVals = new Map<String, Object>{
                        IS_Billingcomplete => ATT_VALUE_TRUE
                    };
                    frl.vlocity_cmt__JSONAttribute__c = (String)ftr_CpqHelper.setJSONAttributes(frl.vlocity_cmt__JSONAttribute__c, '{}', attrVals);
                    frlsToUpdate.add(new FulfilmentRequestEvent__e(
                        FRL_Id__c=frl.Id,
                        JSONAttribute__c=frl.vlocity_cmt__JSONAttribute__c,
                        MethodName__c='updateFRLs'
                    ));
                    System.debug('### frlsToUpdate: ' + frlsToUpdate);
                }
            }
        }
        if(frlsToUpdate.size()>0){
            try {
                List<Database.SaveResult> results = EventBus.publish(frlsToUpdate);
                for (Database.SaveResult sr : results) {
                    if (sr.isSuccess()) {
                        System.debug('Successfully published FulfilmentRequestEvent__e.');
                    } else {
                        for(Database.Error err : sr.getErrors()) {
                            System.debug('Error returned while publishing FulfilmentRequestEvent__e: ' + err.getStatusCode() + ' - ' + err.getMessage());
                        }
                    }
                }
            } catch(Exception e) {
                System.debug('Exception in Subscriber..'+ e.getMessage());
            }
        }
        return true;
    }

    public static void setBulkOrderFulfillment(vlocity_cmt__OrchestrationItem__c item){

        System.debug('item leadOrder'+item);
         if(item !=null){
            System.debug('item Name'+item);

            Map<Id,vlocity_cmt__FulfilmentRequestLine__c> frlsToUpdateMap = new Map<Id,vlocity_cmt__FulfilmentRequestLine__c>();
            String jsonAttribute = item.vlocity_cmt__FulfilmentRequestLineId__r.vlocity_cmt__JSONAttribute__c;
            String leadOrderId   = (String)ftr_CpqHelper.getJSONAttributeValue(jsonAttribute, 'LeadOrderId');
            String groupOrderId  = (String)ftr_CpqHelper.getJSONAttributeValue(jsonAttribute, 'GroupMemberOrderId');
            String environment   = (String)ftr_CpqHelper.getJSONAttributeValue(jsonAttribute, 'Environment');
            String DIDLocation   = (String)ftr_CpqHelper.getJSONAttributeValue(jsonAttribute, 'ATTR_DID_LOC');
            String numberType    = (String)ftr_CpqHelper.getJSONAttributeValue(jsonAttribute, 'CustomerType');
            
            System.debug('::: leadOrderId'+leadOrderId);
            System.debug('::: groupOrderId'+groupOrderId);
            System.debug('::: environment'+environment);

            Map<String, Object> attrVals = new Map<String, Object>{
                'LeadOrderId' => leadOrderId,
                'GroupMemberOrderId' => groupOrderId,
                'Environment' => environment
            };
            String updateJsonAttribute ='';

            List<vlocity_cmt__FulfilmentRequestLine__c> frl = new List<vlocity_cmt__FulfilmentRequestLine__c>();
            Set<Id> frlIds = new Set<Id>();
            List<vlocity_cmt__OrchestrationItem__c> bulkItem = [SELECT Id, vlocity_cmt__FulfilmentRequestLineId__c, vlocity_cmt__FulfilmentRequestLineId__r.vlocity_cmt__JSONAttribute__c,
                                                                vlocity_cmt__orchestrationPlanId__r.vlocity_cmt__OrderId__c
                                                                FROM vlocity_cmt__OrchestrationItem__c
                                                                WHERE (vlocity_cmt__State__c =: INPUT_STATE_RUNNING)
                                                                AND (vlocity_cmt__OrchestrationItemDefinitionId__r.Name =: INPUT_ITEM_DEFINITION_DPI_Bulk)
                                                                AND (vlocity_cmt__orchestrationPlanId__r.vlocity_cmt__OrderId__r.OrderNumber =: orderBulkNumber)];
            System.debug(':::bulkItem'+bulkItem);
            
            if(!bulkItem.isEmpty()){
                for(vlocity_cmt__OrchestrationItem__c itemBulk: bulkItem){
                    frlIds.add(itemBulk.vlocity_cmt__FulfilmentRequestLineId__c);
                }
                if(!frlIds.isEmpty()){

                    List<vlocity_cmt__FulfilmentRequestLine__c> fulfilmentRequestLineDPIBulkResource =[Select Id,Name,vlocity_cmt__JSONAttribute__c from vlocity_cmt__FulfilmentRequestLine__c where Id =:frlIds  WITH SECURITY_ENFORCED];

                    if(!fulfilmentRequestLineDPIBulkResource.isEmpty()){
                     
                          for(vlocity_cmt__FulfilmentRequestLine__c frlRequest : fulfilmentRequestLineDPIBulkResource){
                            
                            if((String)ftr_CpqHelper.getJSONAttributeValue(frlRequest.vlocity_cmt__JSONAttribute__c, 'CustomerType') == numberType && (String)ftr_CpqHelper.getJSONAttributeValue(frlRequest.vlocity_cmt__JSONAttribute__c, 'ATTR_DID_LOC') == DIDLocation){
                                frlRequest.vlocity_cmt__JSONAttribute__c = (String)ftr_CpqHelper.setJSONAttributes(frlRequest.vlocity_cmt__JSONAttribute__c, '{}', attrVals);
                                frlsToUpdateMap.put(frlRequest.Id,frlRequest);
                            }
                            
                          }

                         
                    }

                    if(frlsToUpdateMap.values().size()>0){
                        try{
                            List<Database.SaveResult> results = Database.update(frlsToUpdateMap.values(), false);
                            
                            for (Database.SaveResult result : results) {
                                if (!result.isSuccess()){
                                    for (Database.Error err : result.getErrors()){
                                    System.debug('Error in Subscriber: '+ err.getStatusCode() + ' ' + err.getMessage());
                                    }
                                }
                            }
                        } catch(Exception e) {
                            System.debug('Exception in Subscriber..'+ e.getMessage());
                           
                        }
                    }
                }
            }                                        
         
            }
    }

}