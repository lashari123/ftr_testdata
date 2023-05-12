@isTest  
global class WebServiceMockImpl implements WebServiceMock {  
   global void doInvoke(  
           Object stub,  
           Object request,  
           Map<string, object> response,  
           String endpoint,  
           String soapAction,  
           String requestName,  
           String responseNS,  
           String responseName,  
           String responseType) {  
       ibusCzncorpComEsbManageprospect.ManageProspectSubmitProspectResponse respElement = new ibusCzncorpComEsbManageprospect.ManageProspectSubmitProspectResponse();  
       respElement.CustomerNumber = 'Mock response';  
       response.put('response_x', respElement);   
   }  
}