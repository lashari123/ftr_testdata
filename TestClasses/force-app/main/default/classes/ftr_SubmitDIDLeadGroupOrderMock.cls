@isTest
global class ftr_SubmitDIDLeadGroupOrderMock implements WebServiceMock {
    global void doInvoke(
        Object stub,
        Object request,
        Map<String, Object> response,
        
        String endpoint,
        String soapAction,
        String requestName,
        String responseNS,
        String responseName,
        String responseType){

        ftr_PSRService.finishOrder request_x = new ftr_PSRService.finishOrder();
        //request_x.addServiceItemRequest = addServiceItemRequest;
        
        ftr_PSRService.finishOrderResponseValueType respValType = new ftr_PSRService.finishOrderResponseValueType();
        ftr_PSRService.finishOrderResponse svcItemResp = new ftr_PSRService.finishOrderResponse();
        ftr_PSRService.finishOrderResultType resultType = new ftr_PSRService.finishOrderResultType();
        
        Map<String, ftr_PSRService.finishOrderResponse> response_map_x = new Map<String, ftr_PSRService.finishOrderResponse>();
        List<ftr_PSRService.StatusMessageType> statusMsgList = new List<ftr_PSRService.StatusMessageType>();
        ftr_PSRService.StatusMessageType statusMsg = new ftr_PSRService.StatusMessageType();

        statusMsg.code = '0';
        statusMsg.message = 'Success';
        statusMsg.severity = 'Info';
        statusMsgList.add(statusMsg);

        resultType.documentNumber = 234567;

        respValType.statusMessage=statusMsgList;
        respValType.finishOrderResult=resultType;
        
        svcItemResp.finishOrderReturnValue=respValType;

        response.put('response_x',svcItemResp);
        }
}