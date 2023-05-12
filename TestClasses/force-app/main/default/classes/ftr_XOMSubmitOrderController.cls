global class ftr_XOMSubmitOrderController implements vlocity_cmt.VlocityOpenInterface {
    
    global class ftr_XOMSubmitOrderControllerException extends Exception {}

    private Order myOrder;
    private static final String RESERVE_WTN_METHOD_NAME = 'reserveWTNumber';
    private static final String GET_EXCHANGE_DETAILS_METHOD_NAME = 'getExchangeDetails';
    private static final String UPDATE_SNE_ATTRIBUTES_METHOD_NAME = 'UpdateSNEAttributes';
    private static final String UPDATE_ITEM_SEQ_METHOD_NAME = 'updateOrderItemSequence';
    public ftr_XOMSubmitOrderController(ApexPages.StandardController stdController) {
        this.myOrder = (Order)stdController.getRecord();
    }    

    public ftr_XOMSubmitOrderController() {
        
    }

    public without sharing class StartPlanAsync implements Queueable {
        String orderId;
        public StartPlanAsync(String orderId) {
            this.orderId = orderId;
        }
        public void execute(QueueableContext context) {
            try {
                vlocity_cmt__OrchestrationItem__c[] items = [select Id,vlocity_cmt__FulfilmentRequestLineId__r.vlocity_cmt__Product2Id__c, vlocity_cmt__State__c,vlocity_cmt__OrchestrationItemDefinitionId__r.Name, vlocity_cmt__OrchestrationPlanId__r.vlocity_cmt__OrderId__c 
                                                             from vlocity_cmt__OrchestrationItem__c 
                                                             where vlocity_cmt__OrchestrationItemDefinitionId__r.Name IN ('Wait To Start', 'Wait for M6Orders Completion') AND vlocity_cmt__State__c ='Pending' 
                                                             AND vlocity_cmt__OrchestrationPlanId__r.vlocity_cmt__OrderId__c=:orderId ];
                for (vlocity_cmt__OrchestrationItem__c item: items) {
                    item.vlocity_cmt__State__c = 'Running';
                }
                update items;
                System.debug('items: ' + JSON.serialize(items));
                
                items = [select Id,vlocity_cmt__FulfilmentRequestLineId__r.vlocity_cmt__Product2Id__c, vlocity_cmt__State__c,vlocity_cmt__OrchestrationItemDefinitionId__r.Name, vlocity_cmt__OrchestrationPlanId__r.vlocity_cmt__OrderId__c 
                         from vlocity_cmt__OrchestrationItem__c 
                         where vlocity_cmt__OrchestrationItemDefinitionId__r.Name IN ('Wait To Start', 'Wait for M6Orders Completion') AND vlocity_cmt__State__c ='Running' 
                         AND vlocity_cmt__OrchestrationPlanId__r.vlocity_cmt__OrderId__c=:orderId and vlocity_cmt__FulfilmentRequestLineId__r.vlocity_cmt__Product2Id__r.ProductCode = 'ENT_ETH_UNI_PSR_001'];
                for (vlocity_cmt__OrchestrationItem__c item: items) {
                    item.vlocity_cmt__State__c = 'Completed';
                }
                update items;

                System.debug('items: ' + JSON.serialize(items));

                //SIP Wait to Start
                Map<Id,vlocity_cmt__FulfilmentRequestLine__c> frlsToUpdateMap = new Map<Id,vlocity_cmt__FulfilmentRequestLine__c>();
                Set<Id> fulfilmentRequestIds = new Set<Id>();

                vlocity_cmt__OrchestrationItem__c[]  itemsForUpdate = [select Id,vlocity_cmt__FulfilmentRequestLineId__r.vlocity_cmt__Product2Id__c, vlocity_cmt__State__c,vlocity_cmt__OrchestrationItemDefinitionId__r.Name, vlocity_cmt__OrchestrationPlanId__r.vlocity_cmt__OrderId__c, 
                vlocity_cmt__FulfilmentRequestLineId__r.Id from vlocity_cmt__OrchestrationItem__c 
                         where vlocity_cmt__OrchestrationItemDefinitionId__r.Name IN ('Wait To Start')
                         AND vlocity_cmt__OrchestrationPlanId__r.vlocity_cmt__OrderId__c=:orderId and vlocity_cmt__FulfilmentRequestLineId__r.vlocity_cmt__Product2Id__r.ProductCode = 'SIP_TRUNKING_UNI_PSR_RES_SPEC_0010'];
                         
                System.debug('itemsForUpdate: ' + JSON.serialize(itemsForUpdate));

                for (vlocity_cmt__OrchestrationItem__c item: itemsForUpdate) { fulfilmentRequestIds.add(item.vlocity_cmt__FulfilmentRequestLineId__r.Id);
                }

                List<vlocity_cmt__FulfilmentRequestLine__c> fulfilmentRequestLineS =[Select Id,Name,vlocity_cmt__JSONAttribute__c  from vlocity_cmt__FulfilmentRequestLine__c where Id IN : fulfilmentRequestIds];
                String semaphoreWait = 'true';
                for(vlocity_cmt__FulfilmentRequestLine__c frLine: fulfilmentRequestLineS){

                    Map<String, Object> attrVals = new Map<String, Object>{ 'ATTR_WaitSemaphore' => semaphoreWait };

                    frLine.vlocity_cmt__JSONAttribute__c = (String)ftr_CpqHelper.setJSONAttributes(frLine.vlocity_cmt__JSONAttribute__c, '{}', attrVals);
                    frlsToUpdateMap.put(frLine.Id,frLine);
                    break;
                }

                System.debug('frlsToUpdateMap: ' + frlsToUpdateMap);
                System.debug('frlsToUpdateMap: size(); ' + frlsToUpdateMap.values().size());


                if(frlsToUpdateMap.values().size()>0){
                    try{
                        List<Database.SaveResult> results = Database.update(frlsToUpdateMap.values(), false);
                        
                        for (Database.SaveResult result : results) {
                            if (!result.isSuccess()){
                                for (Database.Error err : result.getErrors()){ System.debug('Error in Subscriber: '+ err.getStatusCode() + ' ' + err.getMessage());
                                }
                            } 
                        }
                    } catch(Exception e) {
                        System.debug('Exception in Subscriber..'+ e.getMessage());
                    
                    }
                }

            } catch (Exception ex) {
                
                System.debug('Line number: '+ ex.getLineNumber() + ' - Exception: '+ ex.getMessage());
                
                // if there is any exception, stamp the error in the SubmitOrderResult field
                update new Order(Id=this.orderId, SubmitOrderResult__c = 'Exception thrown while kick-starting orchestration items: ' + 'Line number: '+ ex.getLineNumber() + ' - Exception: '+ ex.getMessage()
                );
            }
        }
    }
    
    public without sharing class CreatePlanAsync implements Queueable {
        String orderId;
        public CreatePlanAsync(String orderId) {
            this.orderId = orderId;
        }
        public void execute(QueueableContext context) {
            Savepoint sp = Database.setSavepoint();
            String result;
            try {
                // submit the order to decompose
                System.debug('Calling SimpleDecompositionController.startOrchestrationPlan: '+ this.orderId);
                if (!Test.isRunningTest()) { result = vlocity_cmt.SimpleDecompositionController.startOrchestrationPlan(this.orderId);
                } else {
                    result = 'OK';
                }
                System.debug('Finished SimpleDecompositionController.startOrchestrationPlan: '+ result);
				Order myOrder= [SELECT Id,Order_Provisioner__c,OwnerId,SubmitOrderResult__c FROM ORDER WHERE ID =: This.OrderId];
                if(myOrder.Order_Provisioner__c != null){ myOrder.OwnerId = myOrder.Order_Provisioner__c;
                } else{
                    Group myQueue = [SELECT Id, name, DeveloperName FROM Group where Type = 'Queue' and DeveloperName='Customer_Network_Provisioning'];
                    myOrder.OwnerId = myQueue.Id;
                }
                myOrder.SubmitOrderResult__c = 'Starting orchestration plan: ' + result;
                update myOrder;
                System.enqueueJob(new StartPlanAsync(this.orderId));
            } catch (Exception ex) {

                // roll back the operation 
                Database.rollback(sp);
                System.debug('Line number: '+ ex.getLineNumber() + ' - Exception: '+ ex.getMessage());
                
                // if there is any exception, stamp the error in the SubmitOrderResult field
                update new Order(
                    Id=this.orderId, 
                    SubmitOrderResult__c = 'Exception thrown while starting orchestration plan: ' + 'Line number: '+ ex.getLineNumber() + ' - Exception: '+ ex.getMessage()
                );
            }
        }
    }

    public without sharing class DecomposeOrderAsync implements Queueable {
        String orderId;
        public DecomposeOrderAsync(String orderId) {
            System.debug('Starting decomposition for: '+ orderId);
            this.orderId = orderId;
        }

        public void execute(QueueableContext context) { 
            Savepoint sp = Database.setSavepoint();
            Object result;
            try {
                // submit the order to decompose
                System.debug('Calling SimpleDecompositionController.decomposeOrder: '+ this.orderId);
                if (!Test.isRunningTest()) { result = vlocity_cmt.SimpleDecompositionController.decomposeOrder(this.orderId);
                } else {
                    result = 'OK';
                }
                System.debug('Finished SimpleDecompositionController.decomposeOrder: '+ result);
                
                // update the SubmitOrderResult field with the result
                update new Order(
                    Id=this.orderId, 
                    SubmitOrderResult__c = 'Decomposition result: ' + JSON.serialize(result)
                );
                // start the orchestration plan
                System.enqueueJob(new CreatePlanAsync(this.orderId));
            } catch (Exception ex) {
                
                // roll back the operation 
                Database.rollback(sp);
				System.debug('Line number: '+ ex.getLineNumber() + ' - Exception: '+ ex.getMessage());
                
                // if there is any exception, stamp the error in the SubmitOrderResult field
                update new Order(
                    Id=this.orderId, 
                    SubmitOrderResult__c = 'Exception thrown while decomposing: ' + 'Line number: '+ ex.getLineNumber() + ' - Exception: '+ ex.getMessage()
                );
            }
        }
    }
    
    public PageReference submitOrder() {
        Map<String, Object> inputMap = new Map<String, Object> {
            'orderId' => myOrder.Id
        };
        Map<String, Object> outputMap = new Map<String, Object>();
        Map<String, Object> options = new Map<String, Object>();
        return new PageReference('/' + myOrder.Id);
    }


    global Boolean invokeMethod(String methodName, Map<String, Object> inputMap, Map<String, Object> outputMap, Map<String, Object> options) {
        System.debug('Enter ftr_XOMSubmitOrderController.' + methodName);
        try {
            if (methodName == 'submitOrder') {

                Id orderId = (Id)inputMap.get('contextId');
                inputMap.put('orderId', orderId);

                Boolean hasProjectSpecialist = checkForProjectSpecialist(inputMap, outputMap, options);
                // if no PS is assigned, stop them here
                if (!hasProjectSpecialist) {
                    return false;
                } else {
                    try {
                        Task[] t = new List<Task>([SELECT Id, Status FROM Task WHERE Subject = 'Network Project Specialist Assignment' AND WhatId =:orderId AND Status != 'Completed' LIMIT 1]);
                        if (t.size() > 0) {
                            t[0].Status = 'Completed';
                            update t;
                        }
                    } catch (Exception e) {
                        System.debug(e.getMessage());
                    }
                }
                
                // 0. Update Item Seq/Count OLI fields
                ftr_OrderEnrichmentService orderMgmtservice = new ftr_OrderEnrichmentService();
                Map<String, Object>  updateOrderItemSeqMap = orderMgmtservice.invokeMethod(UPDATE_ITEM_SEQ_METHOD_NAME,inputMap,outputMap,options); 
                if ((Boolean)updateOrderItemSeqMap.get('isSuccess') == false) { throw new ftr_XOMSubmitOrderControllerException((String)updateOrderItemSeqMap.get('errorMessage'));
                }

                // 1. Update SNE Attributes              
                Map<String, Object>  UpdSNEAttrResultMap = orderMgmtservice.invokeMethod(UPDATE_SNE_ATTRIBUTES_METHOD_NAME,inputMap,outputMap,options); 
                if ((Boolean)UpdSNEAttrResultMap.get('isSuccess') == false) { throw new ftr_XOMSubmitOrderControllerException((String)UpdSNEAttrResultMap.get('errorMessage'));
                }

                // 2. Exchange details                 
                Map<String, Object>  exchangeDetailsResultMap = orderMgmtservice.invokeMethod(GET_EXCHANGE_DETAILS_METHOD_NAME,inputMap,outputMap,options); 
                    if ((Boolean)exchangeDetailsResultMap.get('isSuccess') == false) { throw new ftr_XOMSubmitOrderControllerException((String)exchangeDetailsResultMap.get('errorMessage'));
                }
               
                // 3. Reserve WTN
               /*ftr_ResourceManagementService resourceMgmtservice = new ftr_ResourceManagementService();
                   
                Map<String, Object>  reserveWTNResultMap = resourceMgmtservice.invokeMethod(RESERVE_WTN_METHOD_NAME,inputMap,outputMap,options); 
                    if ((Boolean)reserveWTNResultMap.get('isSuccess') == false) {
                    throw new ftr_XOMSubmitOrderControllerException((String)reserveWTNResultMap.get('errorMessage'));
                }*/
                
                // Submit Order to Vlocity OM
                // createPlanAsync(orderId);

                // Move the Order Stage to "Customer Network Provisioning"
                this.myOrder = [SELECT Id, Order_Stage__c, OwnerId, vlocity_cmt__OrderStatus__c, Products__c, Order_Provisioner__c FROM Order WHERE Id=:orderId];

                // if the order contains products for OM:
                if (myOrder.Products__c.contains('EIA') || myOrder.Products__c.contains('EVPL') || myOrder.Products__c.contains('SIP')) {
                    myOrder.Order_Stage__c = 'Customer Network Provisioning';
                    // enqueued job updates the Owner to CNP once the orchestration plan is created.
                    System.enqueueJob(new DecomposeOrderAsync(orderId));
                    
                } else {
                    // if the order does not contain products for OM

                    if (myOrder.Products__c.contains('SIP')) {

                        myOrder.Order_Stage__c = 'CNP Quality Assurance';
                        if (myOrder.Order_Provisioner__c != null) { myOrder.OwnerId = myOrder.Order_Provisioner__c;
                        } else { Group myQueue = [SELECT Id, name, DeveloperName FROM Group where Type = 'Queue' and DeveloperName = 'Customer_Network_Provisioning']; myOrder.OwnerId = myQueue.Id;
                        }

                    } else if (myOrder.Products__c.contains('Frontier Secure') || myOrder.Products__c.contains('SDWAN')) {

                        myOrder.Order_Stage__c = 'Customer Network Provisioning';
                        if (myOrder.Order_Provisioner__c != null) { myOrder.OwnerId = myOrder.Order_Provisioner__c;
                        } else { Group myQueue = [SELECT Id, name, DeveloperName FROM Group where Type = 'Queue' and DeveloperName = 'Customer_Network_Provisioning']; myOrder.OwnerId = myQueue.Id;
                        }

                    } else if (myOrder.Products__c.contains('UCF')) {

                        myOrder.Order_Stage__c = 'QA Review';
                        Group myQueue = [SELECT Id, name, DeveloperName FROM Group where Type = 'Queue' and DeveloperName = 'Project_Management'];
                        myOrder.OwnerId = myQueue.Id;

                    }
                }
                if (myOrder.Products__c.contains('Frontier Secure')) { createMFWTaskOnMFWOrder(inputMap, outputMap, options);
                }
                
                myOrder.vlocity_cmt__OrderStatus__c = 'In Progress';
                
                update myOrder;

            } else if (methodName == 'requestSEReview') {
                // prevent old orders from proceeding
                if (isOrderFromVlocity(methodName, inputMap, outputMap, options)) {
                    String contextId = String.isNotBlank((String) inputMap.get('orderId')) ? (String) inputMap.get('orderId') : (String) inputMap.get('contextId');
                    CustomFieldValidation cfv = new CustomFieldValidation(contextId, 'Request SE Review');
                    if (!cfv.isValid()) {
                        outputMap.put('Error', cfv.getErrors());
                        return false;
                    } 
                }
                Id contextId = (Id)inputMap.get('contextId');
                if (contextId != null && contextId.getSobjectType() == Order.SObjectType) {
                    Order order = new Order(
                        Id = (Id)contextId,
                        vlocity_cmt__OrderStatus__c = 'SE Review',
                        Order_Stage__c = 'Solutions Engineering'
                    );
                    Order o = [SELECT Id, Sales_Engineer__c FROM Order WHERE Id = :contextId];
                    if (o.Sales_Engineer__c != null) { order.OwnerId = o.Sales_Engineer__c;
                    } else {
                        Group myQueue = [SELECT Id, name, DeveloperName FROM Group where Type = 'Queue' and DeveloperName='Sales_Engineering'];
                        if (myQueue != null) order.OwnerId = myQueue.Id;
                    }
                    update order;
                }
            } else if (methodName == 'checkQLI') {
                return validateCart(inputMap, outputMap, options);
                
            } else if (methodName == 'checkQLIAndFSA') {
                if (validateCart(inputMap, outputMap, options) == false) {
                    return false;
                } else if (accountHasFSA(inputMap, outputMap, options) == false) {  return false;
                }
            } else if ( methodName == 'submitForDealDeskApproval') {
                Id quoteId = (Id)inputMap.get('contextId');
   				//remove old approval request
                ApprovalProcessHelper.submitToDealDesk(quoteId);
            }
            else if (methodName == 'submitForApproval') { 
                if (validateCart(inputMap, outputMap, options) == false) {
                    return false;
                } else {
                    // if items are fully configured, submit quote for approval         
                    Id quoteId = (Id)inputMap.get('contextId');
                    try{
                        //fieldLevelDiscounting invocation
                        System.debug('before fdc');
                        FieldLevelDiscountingController fdc = new FieldLevelDiscountingController(quoteId);
                        //fdc.updateApprovalType(true);
                        //Hemantha - added different approval levels pricing group
                        fdc.updateApprovalTypeNew(true);
                        System.debug('after fdc');
                        }catch(exception e){
                            system.debug('*****Error message:' +e.getMessage());
                            system.debug('*********Error line:' +e.getLineNumber());
                        }
                    Approval.ProcessSubmitRequest approvalRequest = new Approval.ProcessSubmitRequest();
                    approvalRequest.setObjectId(quoteId);
                    //approvalRequest.setProcessDefinitionNameorId('Approval process name');
                    Approval.ProcessResult result = Approval.process(approvalRequest);
                }

            }else if (methodName == 'submitForSEApproval') { 
                
                if (validateCart(inputMap, outputMap, options) == false) {
                    return false;
                } else {
                    // if items are fully configured, submit quote for approval        
                    Id quoteId = (Id)inputMap.get('contextId');
                    Opportunity objOpp =[select SEER_Assigned_To__c, SEER_Assigned_To__r.ManagerId from Opportunity where id in (select OpportunityId from Quote where id =:quoteId)];
                    if(objOpp.SEER_Assigned_To__c <> null){
                        Quote objQuote = new Quote(Id = quoteId, Validation_Status__c = 'Requires Approval', Assigned_To__c = objOpp.SEER_Assigned_To__c);
                        if (objOpp.SEER_Assigned_To__r.ManagerId != null)
                            objQuote.SE_Approver_Manager__c = objOpp.SEER_Assigned_To__r.ManagerId;
                        Update objQuote;
                        Approval.ProcessSubmitRequest approvalRequest = new Approval.ProcessSubmitRequest();
                        approvalRequest.setObjectId(quoteId);
                        approvalRequest.setProcessDefinitionNameorId('Submit_For_SE_Approval');
                        Approval.ProcessResult result = Approval.process(approvalRequest);
                    } else {
                        outputMap.put('Error', 'An SE needs to be assigned to the Opportunity.');
                        return false;
                    }
                }

            } 
            else if (methodName == 'rejectOrder') {
                Id contextId = (Id)inputMap.get('contextId');
                Order o = [Select Id, Sales_Engineer__c, Order_Stage__c From Order Where Id =: contextId];
                if(contextId != null && contextId.getSobjectType() == Order.SObjectType && o.Order_Stage__c == 'MSA Review') {
                    Order order = new Order(Id = (Id)contextId, vlocity_cmt__OrderStatus__c = 'SE Review',  Order_Stage__c = 'Solutions Engineering' );

                    if (o.Sales_Engineer__c != null) { order.OwnerId = o.Sales_Engineer__c;
                    } else {
                        Group myQueue = [SELECT Id, name, DeveloperName FROM Group where Type = 'Queue' and DeveloperName='Sales_Engineering'];
                        if (myQueue != null) order.OwnerId = myQueue.Id;
                    }
                    update order;
                } else if (contextId != null && contextId.getSobjectType() == Order.SObjectType && o.Order_Stage__c == 'Solutions Engineering') {
                    Order order = new Order(Id = (Id)contextId, vlocity_cmt__OrderStatus__c = 'Ready to Submit', Order_Stage__c = 'New');
                    // Group myQueue = [SELECT Id, name, DeveloperName FROM Group where Type = 'Queue' and DeveloperName='Sales_Engineering'];
                    // if (myQueue != null) order.OwnerId = myQueue.Id;
                        for(Order ord: [Select Id, CreatedById from Order where Id =:order.Id]) {   
                            order.OwnerId = ord.CreatedById;    
                        }
                    update order;
                }
            }else if(methodName == 'submitToMSA'){
                String contextId = String.isNotBlank((String) inputMap.get('orderId')) ? (String) inputMap.get('orderId') : (String) inputMap.get('contextId');
                return submitToMSA(contextId);
            }else if (methodName == 'rejectMngdSvc') {
                Id contextId = (Id)inputMap.get('contextId');
                if (contextId != null && contextId.getSobjectType() == Order.SObjectType) {
                    Order order = new Order(
                        Id = (Id)contextId,
                        vlocity_cmt__OrderStatus__c = 'SE Review',
                        Order_Stage__c = 'Solutions Engineering'
                    );
                    // Group myQueue = [SELECT Id, name, DeveloperName FROM Group where Type = 'Queue' and DeveloperName='Sales_Engineering'];
                    // if (myQueue != null) order.OwnerId = myQueue.Id;
                        /*for(Order ord: [Select Id, CreatedById from Order where Id =:order.Id]) { 
                            order.OwnerId = ord.CreatedById;    
                        }*/
                    update order;
                }
            }  
            else if (methodName == 'cancelOrder') {
                Id contextId = (Id)inputMap.get('contextId');
                if (contextId != null && contextId.getSobjectType() == Order.SObjectType) {
                    Order order = new Order(
                        Id = (Id)contextId,
                        vlocity_cmt__OrderStatus__c = 'Cancelled',
                        Order_Stage__c = 'Cancelled'
                    );
                    // Group myQueue = [SELECT Id, name, DeveloperName FROM Group where Type = 'Queue' and DeveloperName='Sales_Engineering'];
                    // if (myQueue != null) order.OwnerId = myQueue.Id;
                    update order;
                }
            } else if (methodName == 'confirmSubmitOrder') {
                // check if its an old vlocity order, then prompt confirmation message
                if (isOrderFromVlocity(methodName, inputMap, outputMap, options)) {
                    String contextId = String.isNotBlank((String) inputMap.get('orderId')) ? (String) inputMap.get('orderId') : (String) inputMap.get('contextId');
                    CustomFieldValidation cfv = new CustomFieldValidation(contextId, 'Submit Order');
                    if (!cfv.isValid()) {
                        outputMap.put('Error', cfv.getErrors());
                        return false;
                    } else {
                        outputMap.put('Warning', System.Label.ftr_Confirm_Order_Submission_Message);
                        return true;
                    }
                } else {
                    return false;
                }
            } else if (methodName == 'confirmProgressUCFOrder') {
                String contextId = String.isNotBlank((String) inputMap.get('orderId')) ? (String) inputMap.get('orderId') : (String) inputMap.get('contextId');
                CustomFieldValidation cfv = new CustomFieldValidation(contextId, 'Submit UCF to QA Review');
                if (!cfv.isValid()) {
                    outputMap.put('Error', cfv.getErrors());
                    return false;
                } else {
                    outputMap.put('Warning', System.Label.ftr_Confirm_Order_Submission_Message);
                    return true;
                }
            }  else if (methodName == 'confirmCompleteOrder') {
                // prompt confirmation message
                outputMap.put('Warning', System.Label.ftr_Confirm_Order_Completion_Message);
                return true;
            } else if (methodName == 'stageOrder') {
                String contextId = String.isNotBlank((String) inputMap.get('orderId')) ? (String) inputMap.get('orderId') : (String) inputMap.get('contextId');
                return stageOrder(contextId);
            } else if (methodName == 'stageUCFOrder') {
                String contextId = String.isNotBlank((String) inputMap.get('orderId')) ? (String) inputMap.get('orderId') : (String) inputMap.get('contextId');
                return stageUCFOrder(contextId);
            }else if (methodName == 'stageMFWOrder') {
                String contextId = String.isNotBlank((String) inputMap.get('orderId')) ? (String) inputMap.get('orderId') : (String) inputMap.get('contextId');
                return stageMFWOrder(contextId);
            }  else if (methodName == 'confirmCancelOrder') {
                // prompt confirmation message
                outputMap.put('Warning', System.Label.ftr_Confirm_Order_Cancel_Message);
                return true;
            } 
            outputMap.put('isSuccess', true);

            return true;
        } catch (Exception ex) {  
            outputMap.put('isSuccess', false);
            outputMap.put('errorMessage', ex.getMessage());

    		System.debug('The following exception has occurred: ' + ex.getMessage());
            return false;
        } finally {
            System.debug('Exit ftr_XOMSubmitOrderController.' + methodName);
        }
    }

    public Boolean stageOrder(String orderId) {
        String nextStage = '';
        Order o = [SELECT id, order_stage__c, vlocity_cmt__OrderStatus__c, OwnerId FROM order WHERE id=:orderId];

        if (o.Order_Stage__c == 'Solutions Engineering' || o.Order_Stage__c == 'Sales Engineering') {
            Group myQueue = [SELECT Id, name, DeveloperName FROM Group where Type = 'Queue' and DeveloperName='Customer_Network_Provisioning'];
            o.Order_Stage__c = 'CNP Quality Assurance';
            o.vlocity_cmt__OrderStatus__c = 'In Progress';
            o.OwnerId = myQueue.Id;

        } else if (o.Order_Stage__c == 'CNP Quality Assurance') {
            o.Order_Stage__c = 'PSR In Progress';
        }else if (o.Order_Stage__c == 'Customer Network Provisioning'){ o.Order_Stage__c = 'CNP Quality Assurance';
        }

        update o;
        return true;        
    }
    public Boolean stageMFWOrder(String orderId) {
        String nextStage = '';
        Order o = [SELECT id, order_stage__c, vlocity_cmt__OrderStatus__c, OwnerId FROM order WHERE id=:orderId];

        if (o.Order_Stage__c == 'In Progress') { //&& add OwnerId =Service Delivery PM
            Group myQueue = [SELECT Id, name, DeveloperName FROM Group where Type = 'Queue' and DeveloperName='Customer_Network_Provisioning'];
            o.Order_Stage__c = 'Pending Billing';
            o.vlocity_cmt__OrderStatus__c = 'In Progress';
            o.OwnerId = myQueue.Id;

        }else if (o.Order_Stage__c == 'Customer Network Provisioning') { //&& add OwnerId =Customer Network Provisioning
            Group myQueue = [SELECT Id, name, DeveloperName FROM Group where Type = 'Queue' and DeveloperName='Service_Delivery_PM'];
            o.Order_Stage__c = 'In Progress';
            o.vlocity_cmt__OrderStatus__c = 'In Progress';
            o.OwnerId = myQueue.Id;

        } 

        update o;
        return true;        
    }
    public Boolean stageUCFOrder(String orderId) {
        String nextStage = '';
        Order o = [SELECT id, order_stage__c, vlocity_cmt__OrderStatus__c, Products__c, Network_Project_Specialist__c, OwnerId FROM order WHERE id=:orderId];        
        if (o.Order_Stage__c == 'Customer Network Provisioning' || o.Order_Stage__c == 'New') {     
            if (o.Network_Project_Specialist__c == null) {
            	Group myQueue = [SELECT Id, name, DeveloperName FROM Group where Type = 'Queue' and DeveloperName='Project_Management'];
                o.OwnerId = myQueue.Id;
            } else { o.OwnerId = o.Network_Project_Specialist__c;
            }
            o.Order_Stage__c = 'QA Review';
            o.vlocity_cmt__OrderStatus__c = 'In Progress';

        } else if (o.Order_Stage__c == 'QA Review') {//&& add OwnerId =Project Management
            Group myQueue = [SELECT Id, name, DeveloperName FROM Group where Type = 'Queue' and DeveloperName='Network_COE_UCaas'];
            o.Order_Stage__c = 'In Progress';
            o.vlocity_cmt__OrderStatus__c = 'In Progress';
            o.OwnerId = myQueue.Id;
        }else if (o.Order_Stage__c == 'In Progress') {//&& add OwnerId = Network COE - Ucaas

            if (o.Products__c.contains('UCF') && (!o.Products__c.contains('EIA') && !o.Products__c.contains('EVPL'))){
            Group myQueue = [SELECT Id, name, DeveloperName FROM Group where Type = 'Queue' and DeveloperName='Network_COE_UCaas'];
            o.Order_Stage__c = 'Pending Billing';
            o.vlocity_cmt__OrderStatus__c = 'In Progress';
            o.OwnerId = myQueue.Id;

            }else{
                
            Group myQueue = [SELECT Id, name, DeveloperName FROM Group where Type = 'Queue' and DeveloperName='Customer_Network_Provisioning'];
            o.Order_Stage__c = 'Pending Billing';
            o.vlocity_cmt__OrderStatus__c = 'In Progress';
            o.OwnerId = myQueue.Id;
        }
        }
        update o;
        return true;        
    }

    public Boolean checkForProjectSpecialist(Map<String, Object> inputMap, Map<String, Object> outputMap, Map<String, Object> options) {
        String orderId = (String) inputMap.get('orderId');
        Order currentOrder = [SELECT Id,Products__c, Network_Project_Specialist__c,Order_Stage__c,OwnerId, OrderNumber, vlocity_cmt__OrderStatus__c FROM Order WHERE Id = :orderId];
        //Add condition to skip for MFW Standalone      
        if (currentOrder.Products__c.contains('EIA') || currentOrder.Products__c.contains('EVPL')  || currentOrder.Products__c.contains('SIP')) {
            if (currentOrder.Network_Project_Specialist__c == null) {
                Group myQ = [SELECT Id, Email FROM Group WHERE Type = 'Queue' AND DeveloperName = 'PM_Assignment' LIMIT 1];
                if (myQ.Id != currentOrder.ownerId && currentOrder.Order_Stage__c != 'PM Assignment' && currentOrder.vlocity_cmt__OrderStatus__c != 'PM Assignment') {
                    String[] emails = new String[]{};
                    String[] userIds = new String[]{};
                    for (GroupMember member : [SELECT UserOrGroupId FROM GroupMember WHERE GroupId=:myQ.Id]) {
                        userIds.add(member.UserOrGroupId);
                    }
                    for (User u : [SELECT Email FROM User WHERE Id IN :userIds]) {
                        emails.add(u.Email);
                    }
                    currentOrder.OwnerId = myQ.Id;
                    currentOrder.vlocity_cmt__OrderStatus__c = 'PM Assignment';
                    currentOrder.Order_Stage__c = 'PM Assignment';
                    if (!Test.isRunningTest())
                        update currentOrder;
                    sendOrderDetails(currentOrder, emails);
                    try {
                        insert new Task(Description = 'A Network Project Specialist needs to be assigned before the order can be submitted.', Subject = 'Network Project Specialist Assignment', Priority = 'High', WhatId = myOrder.Id, OwnerId = myQ.Id, RecordTypeId = Schema.SObjectType.Task.getRecordTypeInfosByDeveloperName().get('SF_Team_Task').getRecordTypeId(), ActivityDate = Date.today(), IsReminderSet = true
                        );
                    } catch (EXception e) {
                        System.debug(e.getMessage());
                    }
                }
                return false;
            }
        }
        return true;
    }

    public Boolean createMFWTaskOnMFWOrder(Map<String, Object> inputMap, Map<String, Object> outputMap, Map<String, Object> options) {
        String orderId = String.isNotBlank((String) inputMap.get('orderId')) ? (String) inputMap.get('orderId') : (String) inputMap.get('contextId');
        //Order currentOrder = [SELECT Id, Network_Project_Specialist__c,Order_Stage__c,OwnerId, OrderNumber, vlocity_cmt__OrderStatus__c FROM Order WHERE Id = :orderId];
        Order currentOrder = [SELECT Id,Order_Stage__c,OwnerId,OrderNumber,vlocity_cmt__OrderStatus__c, Products__c FROM Order WHERE Id=:myOrder.Id];
        //if (currentOrder.Products__c.contains('Frontier Secure')) {
            Group myQ = [SELECT Id, Email FROM Group WHERE Type = 'Queue' AND DeveloperName = 'Service_Delivery_PM' LIMIT 1];                    
            
                try {
                    insert new Task(
                        Description = 'A Service Delivery PM needs to be assigned for a Managed Firewall Order.',
                        Subject = 'Managed Firewall Order',
                        Priority = 'High',
                        WhatId = myOrder.Id,
                        OwnerId = myQ.Id,
                        RecordTypeId = Schema.SObjectType.Task.getRecordTypeInfosByDeveloperName().get('SF_Team_Task').getRecordTypeId(),
                        ActivityDate = Date.today(),
                        IsReminderSet = true
                    );
                } catch (EXception e) { System.debug(e.getMessage());
                }
           
       // }
        return true;
    }


    public void sendOrderDetails(Order o, String[] toEmails) {
        try {
            Order ord = [SELECT Id, OrderNumber, Account.Name FROM Order WHERE Id=:o.Id];
            Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
            message.toAddresses = toEmails;
            message.setSenderDisplayName('Salesforce Ordering Notification');
            message.subject = 'SF Order ' + ord.OrderNumber + ' needs a Project Specialist assigned';
            message.plaintextbody = 'Salesforce order ' + ord.OrderNumber + ' for ' + ord.Account.Name + ' is needing a Project Specialist to be assigned before it gets submitted to M6.  Please review and submit the order once a Project Specialist is assigned. \n\nOrder link:\n' + URL.getSalesforceBaseUrl().toExternalForm() +'/lightning/r/Order/'+ o.Id +'/view  \n\nThank you.';
            Messaging.SingleEmailMessage[] messages = new List<Messaging.SingleEmailMessage>{ message };
        
            Messaging.SendEmailResult[] results = Messaging.sendEmail(messages);
            if (!results[0].success) {
                System.debug('Error in sending email: ' + results[0].errors[0].message);
            } else {
                System.debug('Email sent successfully.');
            }
        } catch (Exception e) {
            System.debug('Exception occured. Email was not sent.');
            System.debug(e.getMessage());
        }
    }

    private boolean validateCart(Map<String, Object> inputMap, Map<String, Object> outputMap, Map<String, Object> options) {
        Map<String, Object> input = new Map<String, Object>();
        String methodName = 'getCartsItems';
        input.put('cartId', inputMap.get('contextId'));
        input.put('ContextId', inputMap.get('contextId'));
        input.put('methodName', methodName);
        input.put('validate', true);
        input.put('price', false);
        input.put('classMethodName', methodName);
        vlocity_cmt.VOIInvoker invoker = vlocity_cmt.VOIInvoker.getInstance();
        Object invokeResult;
        if (!Test.isRunningTest()){
            invokeResult = invoker.invoke('CpqAppHandler', 'invokeClass', input, outputMap, options);      
        } else {
            invokeResult = ftr_TestDataFactory.getCartsItemsOutput();
        }
        Map<string, object> output = (Map<string, Object>)JSON.deserializeUntyped((String)invokeResult);
        System.debug('validateCart-output: '+JSON.serialize(output));
        String error = 'OK';
        Map<string,object> parent = new Map<string,Object>();
        Set<String> servAccIds = new Set<String>(); 
        parent.putAll(output);
        if (parent.get('messages') != null) {
            getMessages(parent.get('messages'), output);
        }
        if (parent.get('records') != null) {
            // iterate thru records
            for (Object rec : (List<Object>)parent.get('records')) {
                Map<String,Object> record = (Map<string,Object>)rec;
                if (record.get('vlocity_cmt__CpqCardinalityMessage__c') != null) {
                    if (((Map<string,object>)record.get('vlocity_cmt__CpqCardinalityMessage__c')).get('value') != null) {
                        error = (String)((Map<string,object>)record.get('vlocity_cmt__CpqCardinalityMessage__c')).get('value');
                    }
                }
                servAccIds.add((String)((Map<string,object>)record.get('vlocity_cmt__ServiceAccountId__c')).get('value'));
                // check if there are any messages
                if (record.get('messages') != null) {
                    getMessages(record.get('messages'), output);
                }
                // get the line items
                if (record.get('lineItems') != null) {
                    Map<string, object> lineItems = (Map<String, Object>) record.get('lineItems');
                    // check messages
                    if (lineItems.get('messages') != null) {
                        getMessages(lineItems.get('messages'), output);
                    }
                    // check lineitems
                    if (lineItems.get('records') != null) {
                        for (Object childRec : (List<Object>)lineItems.get('records')) {
                            Map<String,Object> item = (Map<string,Object>)childRec;
                            if (item.get('vlocity_cmt__CpqCardinalityMessage__c') != null) {
                                if (((Map<string,object>)item.get('vlocity_cmt__CpqCardinalityMessage__c')).get('value') != null) {
                                    error = (String)((Map<string,object>)item.get('vlocity_cmt__CpqCardinalityMessage__c')).get('value');
                                }
                            }
                            servAccIds.add((String)((Map<string,object>)item.get('vlocity_cmt__ServiceAccountId__c')).get('value'));
                            // check if there are any messages
                            if (item.get('messages') != null) {
                                getMessages(item.get('messages'), output);
                            }
                        }
                    }
                }
            }
        }
        Account[] servAccs = [SELECT Id FROM Account WHERE ID IN:servAccIds AND RecordType.Name='Service'];
        if (error == 'OK') {
            if (output.get('Errors') != null) {
                error = 'Required attributes are missing. Please finish configuring the quote.';
                System.debug(output.get('Errors'));
            }
            if (servAccs.size() != servAccIds.size()) {
                error = 'A service account is required for each product. Please finish configuring the quote.';
            }
        }
        System.debug('validateCart-outputMap:'+JSON.serialize(outputMap));
        outputMap.put('Error', error);
        if (error == 'OK') 
            return true;
        else 
            return false;
    }
    
    private void getMessages(Object messages, Map<string, object> item) {
        for (Object obj : (List<Object>)messages) {
            Map<string,object> message = (Map<String, Object>)obj;
            String msg = (String) message.get('message');
            String sev = (String)message.get('severity');
            if (sev == 'ERROR') {
                if (item.get('Errors') == null) {
                    item.put('Errors', new String[]{ msg });
                } else {
                    item.put('Errors', ((List<String>)item.get('Errors')).add(msg));
                }
            }
        }
    }
    @Testvisible
    private boolean accountHasFSA(Map<String, Object> inputMap, Map<String, Object> outputMap, Map<String, Object> options) {
        Id quoteId = (Id)inputMap.get('contextId');
        Account a = [SELECT Id FROM Account WHERE Id IN (SELECT AccountId FROM Quote WHERE Id=: quoteId) LIMIT 1];
        List<Contract> cList = new List<Contract>([SELECT Id FROM Contract WHERE RecordType.Name IN ('Frontier Services Agreement','Community Connections - Agreement','VZ3 Agreement - VEC', 'VZ3 Agreement - VES') AND AccountId=:a.Id LIMIT 1]);
        if (cList.size() > 0)
            return true;
        else {
            outputMap.put('Error', 'An FSA is required before generating a product schedule.');
            return false;
        }
    }
    
    private Boolean isOrderFromVlocity(String methodName, Map<String, Object> inputMap, Map<String, Object> outputMap, Map<String, Object> options) {
        String orderId = String.isNotBlank((String) inputMap.get('orderId')) ? (String) inputMap.get('orderId') : (String) inputMap.get('contextId');
        system.debug('orderId-->'+orderId);
        Order currentOrder = [SELECT Id, vlocity_cmt__QuoteId__r.vlocity_cmt__ValidationStatus__c FROM Order WHERE Id = :orderId];
        if (currentOrder.vlocity_cmt__QuoteId__r.vlocity_cmt__ValidationStatus__c == 'Failed') {
            outputMap.put('Error', System.Label.ftr_Block_Non_Vlocity_Orders_Message);
            return false;
        }
        return true;
    }
    
    public Boolean submitToMSA(String orderId) {
        String nextStage = '';
        Order o = [SELECT id, order_stage__c, vlocity_cmt__OrderStatus__c, Network_Project_Specialist__c, OwnerId FROM order WHERE id=:orderId];
        
        Group myQueue = [SELECT Id, name, DeveloperName FROM Group where Type = 'Queue' and DeveloperName='Managed_Services_Architect'];
        if (myQueue != null){
            o.OwnerId = myQueue.Id;
        }
        o.vlocity_cmt__OrderStatus__c = 'MNGD SVC Review';
        o.Order_Stage__c = 'MSA Review';
        update o;
        return true;        
    }
}