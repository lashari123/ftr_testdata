global without sharing class ftr_M6AddServiceItemL1SystemInterface extends ftr_M6BaseSystemInterface {
    
    global class ftr_M6AddServiceItemL1SystemInterfaceException extends Exception {}

    ftr_PSRService.PSRServicePort port;
    ftr_PSRService.addServiceItemRequestType request;
    
    global override String getOrchestrationTaskName() {
        system.debug('Task Name returned:'+TaskName_AddServiceItem);
        return TaskName_AddServiceItem;
    }

    /**
     * This method is called from executeItem to create M6 RequestType 
     *
     * @param  url  base URL for the batch
     * @param  path path for the batch
     * @param  input payload to be used to construct 
     * @return         M6 RequestType object to be sent
     */
    global override Object createM6RequestType(String url, String path, Map<String, Object> input) {
        
        this.request = new ftr_PSRService.addServiceItemRequestType();
		
       Map<String,Object> serviceItemReq = (Map<String,Object>)input.get('addServiceItem');  // fetch root node from Map input
        
       Map<String,Object> reqAttrs = (Map<String,Object>)serviceItemReq.get('addServiceItemRequest'); //fetch serviceItemRequest node from root node
        
       this.request.documentNumber = Long.ValueOf((String)reqAttrs.get('documentNumber')) ;//Long.valueOf(theOrderItem.Order.M6_Document_Number__c); from createShellPSR
        
        this.request.itemSpecificationId = Long.ValueOf((String)reqAttrs.get('itemSpecificationId'));//Long.valueOf(UNI_CHILD_SPECIFICATION_ID);
        
        this.request.activityCode = (String)reqAttrs.get('activityCode');
        
        return (Object)this.request;
       
    }

    /**
     * This method is called from executeItem to create process response
     *
     * @param  url  base URL for the batch
     * @param  path path for the batch
     * @param  respType M6 ResponseType to process
     * @return         output object to be processed
     */
    global override Map<String, Object> processM6ResponseType(String url, String path, Object respType) {
        ftr_PSRService.addServiceItemResponseValueType response = (ftr_PSRService.addServiceItemResponseValueType)respType;
        Map<String,Object> respMap = new Map<String,Object>();
        system.debug('response: ' + response);
        system.debug('Code: ' + response.statusMessage.get(0).code);
        if(response.statusMessage.get(0).code != '0'){
            throw new ftr_M6AddServiceItemL1SystemInterfaceException(response.statusMessage.get(0).message);
        }
        
        System.debug('L1..'+ response.addServiceItemResult.serviceItemId);
        respMap.put('serviceItemId',String.valueOf(response.addServiceItemResult.serviceItemId));
        return respMap;
        
    }
}