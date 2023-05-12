/**
* @description Utility class 
*/  
global without sharing abstract class ftr_SIPM6BaseSystemInterfaceV01 implements vlocity_cmt.XOMOrchestrationInterfaces.ISystemInterface, vlocity_cmt.XOMOrchestrationInterfaces.IDeferredUpdater {
    //
    public static final String TaskName_SIPCreateShellPSR = 'SIPCreateShellPSR';
    public static final String TaskName_AddServiceItem = 'SIPAddServiceItemL1';
    public static final String TaskName_AddChildServiceItem = 'SIPAddServiceItemL2';
    public static final String TaskName_SubmitPSR = 'SIPSubmitPSR';
    private static final String API_CONFIG_SETTINGS = 'M6Authentication';
    @TestVisible private static Map<String, String> apiConfigMap=new Map<String,String>();
    @TestVisible private static IntegrationAPIConfig__mdt apiconfig;
    private static final String ERR_NULL_INPUT ='Null ApiKey/Timeout';
    String testjsonInput;
    String orderNumber;
    String orderId;
    Object requestType;
    Object responseType;
    String documentNumber;
    String status;
    String taskName;
    ftr_PSRService.StatusMessageType[] responseStatus;
    
    
    
    
    static{
        try{
            List<IntegrationAPIConfig__mdt> apiConfigs = [SELECT Timeout__c, ApiKey__c,Authorization_Header__c  FROM IntegrationAPIConfig__mdt WHERE DeveloperName=: API_CONFIG_SETTINGS LIMIT 1];
            
            if ( !Test.isRunningTest() && (apiConfigs.isEmpty() || String.isBlank(apiConfigs[0].ApiKey__c) || apiConfigs[0].Timeout__c == null)) {
                throw new ftr_M6SystemInterfaceException(ERR_NULL_INPUT);
            }
            apiconfig=apiConfigs[0];
            
            // throw an exception if nothing is found, set the variable otherwise
            
            String Timeout=String.valueOf(apiConfig.Timeout__c);
            apiConfigMap.put('Timeout', Timeout);
            apiConfigMap.put('ApiKey', apiConfig.ApiKey__c);
            apiConfigMap.put('AuthHeader', apiConfig.Authorization_Header__c);
            //apiConfigMap.put('M6ApigeeCredentials',apigeeCred.Endpoint );
        } catch (Exception ex){
            System.debug(ex.getMessage());
            ftr_Logger.write(ex);
        }
    }
    protected Map<String, Object> ctx = new Map<String, Object>();
    public static String FulfilmentReqLineId;
    
    
    /*
Declare port details and get config from custom metadata
*/
    
    ftr_PSRService.PSRServicePort port;
    
    
    
    /**
* Exception to be thrown within M6 Orchestration Task
*/
    global class ftr_M6SystemInterfaceException extends Exception {}
    
    
    /**
* This method is a part of ISystemInterface. It is invoked at the start of the batch
* @param  url  base URL the batch is started for
* @param  path path this batch is started for
*/global virtual void startBatch(String url, String path){
        // Do nothing
        ftr_Logger.writeInfo('Enter ftr_SIPM6BaseSystemInterface.startBatch');
        ftr_Logger.writeInfo('Exit ftr_SIPM6BaseSystemInterface.startBatch');
    }
    
    /**
* Executes a Callout OrchestrationItem
* if cache is enabled then orchestration item data is retrieved from cache
* @param  url  base URL to send the request to
* @param  path path to send the request to
* @param  item OrchestrationItem that needs to be executed
*/
    global virtual void executeItem(String url, String path, vlocity_cmt__OrchestrationItem__c item) { 
        ftr_Logger.writeInfo('Enter ftr_SIPM6BaseSystemInterface.executeItem');
        system.debug('I am in execute Method');
        system.debug('@Item'+item);
        system.debug('@Itemname'+item.Name);
        try {
            Map<String, Object> input;
            // Pre_Invoke
            
            input = getInputPayload(url, path, item);
            System.debug('execute method input..'+ JSON.serialize(input));
            List<Object> orderItemsList = (List<Object>)input.get('order_items');
            orderNumber = (String)input.get('order_number');
            orderId = (String)input.get('order_object_id');
            Map<String,Object> orderItemIdMap = (Map<String,Object>)orderItemsList[0];
            FulfilmentReqLineId = String.valueOf(orderItemIdMap.get('order_item_id'));
            
            
            
            if (!Test.isRunningTest() && item.vlocity_cmt__RequestItemsVlocityDataRaptorBundleId__c != null){
                input = executeRequestItemDR(input, item.vlocity_cmt__RequestItemsVlocityDataRaptorBundleId__c);}
              System.debug('inputTest'+ input);
            
            if (!Test.isRunningTest() && item.vlocity_cmt__VlocityDataRaptorBundleId__c != null){
                input = executeRequestDR(input, item.vlocity_cmt__VlocityDataRaptorBundleId__c);
                 System.debug('inputTest1'+ input);
                
            } else if(Test.isRunningTest() && item.Name == 'SIPCreateShellPSR'){
                testJsonInput= '{"SIPCreateShellPSR": {"createShellPsrRequest": {"orderNotes": "Order imported from Vlocity Order Management","custAcctNbr": "001e000001VyCcN","orderedByTelNbr": "818-555-1111","orderedByLastName": "Contact","orderedByFirstName": "EM Test","PRODUCTCODE": "ENT_ETH_EIA_EVC_PSR_001","FRLId": "a9De00000004llwEAA","userData": [{"fieldValue": "1723091","fieldName": "DSAT_ID"},{"fieldValue": "1","fieldName": "JURISDICTION_CODE"},{"fieldValue": "1G","fieldName": "RATE_CODE"},{"fieldValue": "374","fieldName": "COMPANY_INDICATOR"},{"fieldValue": "909975","fieldName": "NPA_NXX"}],"productName": "M6 UNI PSR CFS","orderContacts": {"ProjectSpecialist": {"contactType": "FTRPM","telNbr": "818-555-1111","lastName": "Contact","firstName": "EM Test","email": "testcontact@emtestcompany.com"},"ServiceContact": {"contactType": "LCON","telNbr": "818-555-1111","lastName": "Contact","firstName": "EM Test","email": "testcontact@emtestcompany.com"},"SolutionEngineer": {"contactType": "FTRSE","lastName": "Marcondes","firstName": "Eric","email": "eric.marcondes@ftr.com","telNbr": "999-999-9999"},"MaintainenceContact": {"contactType": "MAINT","telNbr": "818-555-1111","lastName": "Contact","firstName": "EM Test","email": "testcontact@emtestcompany.com"},"OrderContact": {"contactType": "IMPL","telNbr": "818-555-1111","lastName": "Contact","firstName": "EM Test","email": "testcontact@emtestcompany.com"},"AE": {"contactType": "FTRAE","telNbr": "+1 8183311326","Name": "Eric Marcondes"}},"OrderUsrData": {"StatOrder": "STATS_ORDER","ContDateVal": "2020-06-26","ContDate": "CONTRACT_DATE","StatsOrderVal": "10020781"},"desiredDueDate": "2020-04-16 00:00:00","expedite": false}},"OrderId": "801e0000001jbVpAAI"}';
                Input = (Map<String,Object>)JSON.deserializeUntyped(testJsonInput);
               
            }else if(Test.isRunningTest() && item.Name == 'AddServiceItem'){
                testJsonInput = '{"addServiceItem": {"addServiceItemRequest": {"activityCode": "N","itemSpecificationId": "1102","documentNumber": "3399085","lineNumber": "a1d6g000000RQpPAAW.0001","FRLId": "a1d6g000000RQpPAAW"}}}';
                Input = (Map<String,Object>)JSON.deserializeUntyped(testJsonInput);
                
            }else if(Test.isRunningTest() && item.Name == 'SIPAddServiceItemL2'){
                testJsonInput= '{"addServiceItem":{"addServiceItemRequest":{"secloc":{"endUserLocation":{"address":{"streetName":"1602 Glasson Street","state":"IL","postalCode":"61704","city":"Bloomington"},"secnci":"08LN9.1GE","locationName":"AJ Test Company 3"}},"priloc":{"endUserLocation":{"address":{"streetName":"1602 Glasson Street","state":"IL","postalCode":"61704","city":"Bloomington"},"nci":"08LN9.1GE","locationName":"AJ Test Company 3"}},"serviceItemValues":{"value":"3091980457","label":"WTN"},"customAttributes":[{"caValue":"UNI","caLabel":"NNI/UNI_Code"},{"caValue":"Copper RJ45","caLabel":"Physical Medium"},{"caValue":"Full Duplex","caLabel":"Mode"},{"caValue":"N or LAN (Ethernet)","caLabel":"Broadband Service Category"},{"caValue":"100586","caLabel":"Bit Rate"},{"caValue":"<=1600","caLabel":"Uni Maximum Transmission Unit (MTU)"},{"caValue":"NO","caLabel":"Service Multiplexing"},{"caValue":"Auto","caLabel":"Negotiation (Port Speed)"}],"itemSpecificationId":"1112","documentNumber":"3393658","parentServiceItemId":"7549054"}}}}';
                Input = (Map<String,Object>)JSON.deserializeUntyped(testJsonInput);}
            
            
            
            // Add final input to the payload
            ctx.put('url', url);
            ctx.put('path', path);
            ctx.put('item', item);
            ctx.put('input', input);
            
             system.debug('@ctx'+ctx);
               system.debug('@ctxinput'+input);
            system.debug('@ctxitem'+item);
            
            // Invoke WebServiceCallout
            Map<String, Object> output;
            output = invoke(url, path, input);
           system.debug('@output'+output);
            //system.debug('@invoke'+invoke(url, path, input));
                  //Save request and response
                item.vlocity_cmt__Response__c = String.valueOf(JSON.serialize(output));
                item.vlocity_cmt__Request__c = String.valueOf(JSON.serialize(input));
                update item;
           system.debug('@updateitem'+item);
            try {

                

                Map<String, Object> logOutput = new Map<String, Object>();
                Map<String, Object> logInput = new Map<String, Object> {
                    'request' => requestType,
                    'response' => responseType,
                    'interface' => taskName,
                    'system' => 'M6',
                    'status' => responseStatus[0].message,
                    'convertToXML' => true,
                    'orderNumber' => orderNumber,
                    'orchestrationItemId' => item.Id,
                    'errorMessage' => responseStatus[0].message,
                    'errorCode' => responseStatus[0].code,
                    'documentNumber' => documentNumber,
                    'relatedTo' => orderId
                };
                APILogger log = new APILogger();
                log.createEntry(logInput, logOutput);

            } catch (Exception ex) {
               
            System.debug('Exception Caught***');
			String addExMessage = ex.getMessage(); 
			Map<String,Object> createTaskInputMap =new Map<String,Object>();
           // createTaskInputMap.put('ErrorCode','7777');
       		createTaskInputMap.put('Description',ex.getMessage()); 
			createTaskInputMap.put('Subject','M6 OM Exception'); 
			createTaskInputMap.put('Priority','High');
            createTaskInputMap.put('InterfaceName','AddServiceItemL1'); 
	    	createTaskInputMap.put('WhatId', orderId);
            System.debug('createTaskInputMap :'+ createTaskInputMap);
            
                ftr_Logger.write(ex);

                Map<String, Object> logOutput = new Map<String, Object>();
                Map<String, Object> logInput = new Map<String, Object> {
                    'request' => requestType,
                    'response' => responseType,
                    'interface' => [SELECT Name FROM vlocity_cmt__OrchestrationItem__c WHERE Id =: item.Id].Name,
                    'system' => 'M6',
                    'status' => responseStatus != null ? responseStatus[0].message : 'Error',
                    'convertToXML' => true,
                    'orderNumber' => orderNumber,
                    'orchestrationItemId' => item.Id,
                    'errorMessage' => responseStatus != null ? responseStatus[0].message : ex.getMessage(),
                    'errorCode' => responseStatus != null ? responseStatus[0].code : '500',
                    'documentNumber' => documentNumber,
                    'relatedTo' => orderId
                };
                APILogger log = new APILogger();
                log.createEntry(logInput, logOutput);  
                     ftr_OrderManagementHelper.CreateTask( createTaskInputMap) ;  
                   
                throw ex;
            }
        
            
            // Post_Invoke
            // Add final input to the payload
            ctx.put('output', output);
            
            if(Test.isRunningTest()) {
                updateDatabase(); ///invoking update database method
            }
            
        } catch (CalloutException ex) { // Capture recoverable exception and notify OM to retry
            ftr_Logger.write(ex);
            throw new vlocity_cmt.XOMOrchestrationInterfaces.SystemInterfaceRecoverableException ('Callout exception ' + ex + ': trying to retry');
        } catch (Exception ex) {
            ftr_Logger.write(ex);
            throw ex;
        } finally {
            ftr_Logger.writeInfo('Exit ftr_M6BaseSystemInterface.executeItem');
        }
    }
    
    /**
* This method is called at the end of the batch
* @param  url  base URL for the batch
* @param  path path for the batch
*/
    global virtual void endBatch(String url, String path) {
        // Do nothing
        ftr_Logger.writeInfo('Enter ftr_SIPM6BaseSystemInterface.endBatch');
        ftr_Logger.writeInfo('Exit ftr_SIPM6BaseSystemInterface.endBatch');
    }
    
    
    /**
* update DB,
* from XOMOrchestrationInterfaces, executed when it safe to do it.
*/
    public void updateDatabase() {
        ftr_Logger.writeInfo('Enter ftr_SIPM6BaseSystemInterface.updateDatabase');
        
        try {
            vlocity_cmt__OrchestrationItem__c item = (vlocity_cmt__OrchestrationItem__c)ctx.get('item');
            
            if (item.vlocity_cmt__ResponseAttrsVlocityDataRaptorBundleId__c != null) {
                executeResponseAttrsDR(ctx, item.vlocity_cmt__ResponseAttrsVlocityDataRaptorBundleId__c);
            }
            
            if (item.vlocity_cmt__ResponseItemsVlocityDataRaptorBundleId__c != null) {
                executeResponseItemDR(ctx, item.vlocity_cmt__ResponseItemsVlocityDataRaptorBundleId__c);//Annie
                system.debug('testdrname'+item.vlocity_cmt__ResponseItemsVlocityDataRaptorBundleId__c);
            }
            
            if (item.vlocity_cmt__ResponseVlocityDataRaptorBundleId__c != null) {
                executeResponseDR(ctx, item.vlocity_cmt__ResponseVlocityDataRaptorBundleId__r.Name);//Annie
            }
        } catch (Exception ex) {
            ftr_Logger.write(ex);
        } finally {
            ftr_Logger.writeInfo('Exit ftr_SIPM6BaseSystemInterface.updateDatabase');
        }
    }
    
    
    
    /**
* This method is called from executeItem to create M6 RequestType 
*
* @return         return the M6 SOAP API method name 
*/
    public virtual String getOrchestrationTaskName() {
        
        throw new ftr_M6SystemInterfaceException('Must be implemented in the child class.');
    }
    
    /**
* This method is called from executeItem to create M6 RequestType 
*
* @param  url  base URL for the batch
* @param  path path for the batch
* @param  input payload to be used to construct 
* @return         M6 RequestType object to be sent
*/
    global virtual Object createM6RequestType(String url, String path, Map<String, Object> input) {
        system.debug('testM6'+input);
        
        throw new ftr_M6SystemInterfaceException('Must be implemented in the child class.');
     //   system.debug('AftertestM6'+input);
        
    }
    
    /**
* This method is called from executeItem to create process response
*
* @param  url  base URL for the batch
* @param  path path for the batch
* @param  respType M6 ResponseType to process
* @return         output object to be processed
*/
    global virtual Map<String, Object> processM6ResponseType(String url, String path, Object respType) {
        
        throw new ftr_M6SystemInterfaceException('Must be implemented in the child cleass.');
    }
    
    /**
* This method is called to execute the actual M6 SOAP API callout
* @param  url  base URL for the batch
* @param  path path for the batch
* @param  input payload prepared by the DRs
* @return      output JSON data returned
*/
    private Map<String, Object> invoke(String url, String path, Map<String, Object> input) {
        
        system.debug('I am in invoke Method'+ JSON.serialize(input));
        requestType = createM6RequestType(url, path, input);
        
        System.debug('request--> '+ JSON.serialize(requestType));
        
        // TODO...
        taskName = getOrchestrationTaskName();
        system.debug('TaskName01'+taskName);
        if (taskName == TaskName_SIPCreateShellPSR) {
            // PSR_ServicePort -> WebserviceCallout(...)
            setPortValues();
            responseType= (ftr_PSRService.createPsrResponseType)this.port.CreateShellPSR((ftr_PSRService.createShellPsrRequestType)requestType);
           system.debug('@Annietest123'+responseType);
            
            responseStatus = ((ftr_PSRService.StatusMessageType[])((ftr_PSRService.createPsrResponseType) responseType).statusMessage);
            if ((ftr_PSRService.createPsrResultType)((ftr_PSRService.createPsrResponseType) responseType).createPsrResult != null)
                documentNumber = String.valueOf(((ftr_PSRService.createPsrResultType)((ftr_PSRService.createPsrResponseType) responseType).createPsrResult).documentNumber);
            
        } else if (taskName == TaskName_AddServiceItem) {
            // PSR_ServicePort -> WebserviceCallout(...)
            
            setPortValues();
            responseType= (ftr_PSRService.addServiceItemResponseValueType)this.port.addServiceItem((ftr_PSRService.addServiceItemRequestType)requestType);
            responseStatus = ((ftr_PSRService.StatusMessageType[])((ftr_PSRService.addServiceItemResponseValueType) responseType).statusMessage);
            if ((ftr_PSRService.addServiceItemResultType)((ftr_PSRService.addServiceItemResponseValueType) responseType).addServiceItemResult != null)
                documentNumber = String.valueOf(((ftr_PSRService.addServiceItemResultType)((ftr_PSRService.addServiceItemResponseValueType) responseType).addServiceItemResult).documentNumber);
            
        } else if (taskName == TaskName_AddChildServiceItem) {
             system.debug('TaskName1'+taskName);
            // PSR_ServicePort -> WebserviceCallout(...)
            setPortValues();
            
            responseType = (ftr_PSRService.addServiceItemResponseValueType)this.port.addServiceItem((ftr_PSRService.addServiceItemRequestType)requestType);
             system.debug('responseType'+responseType);
            responseStatus = ((ftr_PSRService.StatusMessageType[])((ftr_PSRService.addServiceItemResponseValueType) responseType).statusMessage);
              system.debug('responseStatus'+responseStatus);
            if ((ftr_PSRService.addServiceItemResultType)((ftr_PSRService.addServiceItemResponseValueType) responseType).addServiceItemResult != null)
                system.debug('responsecheck'+(ftr_PSRService.addServiceItemResultType)((ftr_PSRService.addServiceItemResponseValueType) responseType).addServiceItemResult );
                documentNumber = String.valueOf(((ftr_PSRService.addServiceItemResultType)((ftr_PSRService.addServiceItemResponseValueType) responseType).addServiceItemResult).documentNumber);
            
        } else if (taskName == TaskName_SubmitPSR) {
            
             System.debug('@001 '+ taskName);
            System.debug('@003 '+ setPortValues());
           System.debug('@004 '+ responseStatus );
            // PSR_ServicePort -> WebserviceCallout(...)
            setPortValues();
            responseType = (ftr_PSRService.finishOrderResponseValueType)this.port.finishOrder((ftr_PSRService.finishOrderRequestType)requestType);
            System.debug('002 '+ responseType);
            responseStatus = ((ftr_PSRService.StatusMessageType[])((ftr_PSRService.finishOrderResponseValueType) responseType).statusMessage);
            System.debug('003 '+ responseType);
            if ((ftr_PSRService.finishOrderResultType)((ftr_PSRService.finishOrderResponseValueType) responseType).finishOrderResult != null)
                documentNumber = String.valueOf(((ftr_PSRService.finishOrderResultType)((ftr_PSRService.finishOrderResponseValueType) responseType).finishOrderResult).documentNumber);
            
        } else {
            throw new ftr_M6SystemInterfaceException('Invalid Orchestration Task: ' + taskName);
        }

        System.debug('response--> '+ JSON.serialize(responseType));

        Map<String, Object> output = processM6ResponseType(url, path, responseType);
 System.debug('output--> '+ output);
        return output;
        
               

    }
    
    /**
* This method returns the initial JSON payload from the given OrchestrationItem item
* @param  url  base URL for the batch
* @param  path path for the batch
* @param  item Orchestration Item
* @return      initial payload 
*/
    Private Map<String, Object> getInputPayload(String url, String path, vlocity_cmt__OrchestrationItem__c item) {
        system.debug('@@@@FRID'+item.vlocity_cmt__fulfilmentRequestLineId__c+' '+JSON.serialize(item));
        vlocity_cmt__FulfilmentRequestLine__c frl = [SELECT Id, vlocity_cmt__FulfilmentRequestID__r.vlocity_cmt__AccountId__c, vlocity_cmt__FulfilmentRequestID__r.vlocity_cmt__orchestrationPlanId__r.vlocity_cmt__OrderId__c,
                                                     vlocity_cmt__JSONAttribute__c, vlocity_cmt__Action__c, vlocity_cmt__LineNumber__c, vlocity_cmt__Product2Id__c, vlocity_cmt__Product2Id__r.Name,
                                                     vlocity_cmt__FulfilmentRequestID__r.vlocity_cmt__orchestrationPlanId__r.vlocity_cmt__OrderId__r.OrderNumber
                                                     FROM vlocity_cmt__FulfilmentRequestLine__c
                                                     WHERE Id=:item.vlocity_cmt__fulfilmentRequestLineId__c];
        system.debug('@@@@Tou'+frl);
        
        Map<String, List<Object>> described_by = new Map<String, List<Object>>();
        Map<String, Object> payload = new Map<String, Object> {
            'order_id' => frl.vlocity_cmt__FulfilmentRequestID__r.Id,
            'order_object_id' => frl.vlocity_cmt__FulfilmentRequestID__r.vlocity_cmt__orchestrationPlanId__r.vlocity_cmt__OrderId__c,
            'order_number' => frl.vlocity_cmt__FulfilmentRequestID__r.vlocity_cmt__orchestrationPlanId__r.vlocity_cmt__OrderId__r.OrderNumber,
                'account_id' => frl.vlocity_cmt__FulfilmentRequestID__r.vlocity_cmt__AccountId__c,
                'order_items' => new List<Object> {
                    new Map<String, Object> {
                        'order_item_id' => frl.Id,
                            'action' => frl.vlocity_cmt__Action__c,
                            'line_number' => frl.vlocity_cmt__LineNumber__c,
                            'specified_by' => new Map<String, String> {
                                'specification_id' => frl.vlocity_cmt__Product2Id__c,
                                    'specification_name' => frl.vlocity_cmt__Product2Id__r.Name
                                    },
                                        'described_by' => described_by
                                        }
                }
        };
               system.debug('@@@@payload'+payload);
            
            String jsonAttribute = frl.vlocity_cmt__JSONAttribute__c;
        Map<String, Object> attrValMap = ftr_CpqHelper.getJSONAttributeValues(jsonAttribute);
        System.debug(':::: attrValMap'+attrValMap);
        vlocity_cmt__Attribute__c[] myAttribs = [SELECT Id, vlocity_cmt__Code__c, vlocity_cmt__AttributeCategoryCode__c FROM vlocity_cmt__Attribute__c WHERE vlocity_cmt__Code__c=:attrValMap.keySet() 
                                                 ORDER BY vlocity_cmt__AttributeCategoryCode__c];
        
        
        Set<String> myCategoryCode = new Set<String>();
        for (vlocity_cmt__Attribute__c attr : myAttribs) {
            List<Object> categoryAttribs;
            if (!myCategoryCode.contains(attr.vlocity_cmt__AttributeCategoryCode__c)) {
                categoryAttribs = new List<Object>();
                described_by.put(attr.vlocity_cmt__AttributeCategoryCode__c, categoryAttribs);
            } else {
                categoryAttribs = (List<Object>)described_by.get(attr.vlocity_cmt__AttributeCategoryCode__c); 
            }
            myCategoryCode.add(attr.vlocity_cmt__AttributeCategoryCode__c);
            
            if(attrValMap.get(attr.vlocity_cmt__Code__c) != null){
                categoryAttribs.add(new Map<String, Object> {
                    'characteristic' => attr.vlocity_cmt__Code__c,
                        'value' => attrValMap.get(attr.vlocity_cmt__Code__c)
                        });
            }
        }
        
        system.debug('@@@@afterpayload'+payload);
        return payload;
    }
    
    /**
* This method returns the JSON payload massaged by the RequestItem DataRaptor
* @param  input payload to be massaged
* @param  requestItemDRName Datarapotor name
* @return      payload massaged by RequestItem DR
*/
    private Map<String, Object> executeRequestItemDR(Map<String, Object> input, String requestItemDRName) {
        
        vlocity_cmt.DRProcessResult result = vlocity_cmt.DRGlobal.process(input, requestItemDRName);
        Map<String, Object> DRItemFinalRequest = (Map<String, Object>)result.toJSON();
        return DRItemFinalRequest;
        
        //throw new ftr_M6SystemInterfaceException('Not implemented.');
    }
    
    /**
* This method returns the JSON payload massaged by the Request DataRaptor
* @param  input payload to be massaged
* @param  requestDRName Datarapotor name
* @return      payload massaged by Request DR
*/
    private Map<String, Object> executeRequestDR(Map<String, Object> input, String requestDRName) {
        
        
        vlocity_cmt.DRProcessResult result = vlocity_cmt.DRGlobal.process(input, requestDRName);
        
        
        Map<String, Object> DRFinalRequest = (Map<String,Object>)result.toJSON();
        return DRFinalRequest;
        
        
        //throw new ftr_M6SystemInterfaceException('Not implemented.');
    }
    
    /**
* This method returns the JSON payload massaged by the Response DataRaptor
* @param  ctx context data 
* @param  responseAttrsDR Datarapotor name
* @return      payload massaged by Response DR
*/
    private Map<String, Object> executeResponseAttrsDR(Map<String, Object> ctx, String responseAttrsDR) {
        
        Map<String,Object> DRinput =new Map<String,Object>();
        Map<String,Object> DRinputMap =new Map<String,Object>();
        
        Map<String,Object> ctxOutput = (Map<String,Object>)ctx.get('output');
        
        
        DRinputMap.put('Id',FulfilmentReqLineId);
        DRinputMap.putAll(ctxOutput);
        DRinput.put('output',DRinputMap);
        vlocity_cmt.DRProcessResult result = vlocity_cmt.DRGlobal.process(DRinput, responseAttrsDR);
        Map<String, Object> resultMap = result.convertToMap();
        return resultMap;
        // throw new ftr_M6SystemInterfaceException('Not implemented.');
    }
    
    /**
* This method returns the JSON payload massaged by the ResponseItem DataRaptor
* @param  ctx context data 
* @param  responseItemDRName Datarapotor name
* @return      payload massaged by ResponseItem DR
*/
    private Map<String, Object> executeResponseItemDR(Map<String, Object> ctx, String responseItemDRName) {
        
        Map<String,Object> DRinput =new Map<String,Object>();
        Map<String,Object> DRinputMap =new Map<String,Object>();
        
        Map<String,Object> ctxOutput = (Map<String,Object>)ctx.get('output');
        
        
        DRinputMap.put('Id',FulfilmentReqLineId);
        DRinputMap.putAll(ctxOutput);
        DRinput.put('output',DRinputMap);
        vlocity_cmt.DRProcessResult result = vlocity_cmt.DRGlobal.process(DRinput, responseItemDRName);
        Map<String, Object> resultMap = result.convertToMap();
        return resultMap;
        
        //throw new ftr_M6SystemInterfaceException('Not implemented.');
    }
    
    /**
* This method returns the JSON payload massaged by the ResponseItem DataRaptor
* @param  ctx context data 
* @param  responseDRName Datarapotor name
* @return      payload massaged by ResponseItem DR
*/
    private Map<String, Object> executeResponseDR(Map<String, Object> ctx, String responseDRName) {
        
        Map<String,Object> DRinput =new Map<String,Object>();
        Map<String,Object> DRinputMap =new Map<String,Object>();
        
        Map<String,Object> ctxOutput = (Map<String,Object>)ctx.get('output');
        
        
        
        DRinputMap.put('Id',FulfilmentReqLineId);
        DRinputMap.putAll(ctxOutput);
        
        DRinput.put('output',DRinputMap);
        system.debug('DRinput-->'+json.serialize(DRinput));          
        system.debug('responseDRName-->'+responseDRName);
        //vlocity_cmt.DRProcessResult result = vlocity_cmt.DRGlobal.process(DRinput, 'SIPM6CreateShellPSRResponseDR');
          vlocity_cmt.DRProcessResult result = vlocity_cmt.DRGlobal.process(DRinput,responseDRName);

         system.debug('result-->'+result); 
        
        Map<String, Object> resultMap = result.convertToMap();
        system.debug('resultMap-->'+resultMap);
        return resultMap;
        
       //          
        //throw new ftr_M6SystemInterfaceException('Not implemented.');
    }
    
    
    private ftr_PSRService.PSRServicePort setPortValues(){
        this.port = new ftr_PSRService.PSRServicePort();
        
        Map<String, String> headers = new Map<String, String>{
            'ApiKey' => apiConfigMap.get('ApiKey'),
                
                'Authorization' => 'Basic ' + EncodingUtil.base64Encode(Blob.valueOf(apiConfigMap.get('AuthHeader')))
                };
                    this.port.endpoint_x = 'callout:M6ApigeeCredentials';
        this.port.timeout_x = Integer.valueOf(apiConfigMap.get('Timeout'));
        this.port.inputHttpHeaders_x = headers;
        system.debug('Port values:');
        
        return this.port;
        
        
    }
    
    
}