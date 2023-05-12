@isTest
global class esbFrontierComResourcemanagementMock implements WebServiceMock {
	
	global string coRef;
	
	global esbFrontierComResourcemanagementMock(string str){
		coRef = str;
	}

    global void doInvoke( Object stub,
           Object request,
           Map<String, Object> response,
           String endpoint,
           String soapAction,
           String requestName,
           String responseNS,
           String responseName,
           String responseType) {
           
	           if(coRef.equalsIgnoreCase('RESETPASSCODE')){
	              esbFrontierComResourcemanagement.UpdateCustomerVoiceMailDetailsResponse_element respElement = new esbFrontierComResourcemanagement.UpdateCustomerVoiceMailDetailsResponse_element();	
	              respElement.UpdateCustomerVoiceMailDetailsOutput = new esbFrontierComResourcemanagement.msg_UpdateCustomerVoiceMailDetailsResponse();	
	              respElement.UpdateCustomerVoiceMailDetailsOutput.header = new esbFrontierComSharedtype.ResponseHeader();
	              respElement.UpdateCustomerVoiceMailDetailsOutput.header.operationStatus = 'TRUE';   
	              respElement.UpdateCustomerVoiceMailDetailsOutput.voiceMailPin = '123456';     
	              response.put('response_x', respElement);     
	           }else{	           
		       	response.put('response_x', null); 
	           }
   }
}