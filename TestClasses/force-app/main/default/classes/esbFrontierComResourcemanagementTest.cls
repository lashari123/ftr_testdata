@isTest(SeeAllData=true)
private class esbFrontierComResourcemanagementTest {
    private static testmethod void unit(){
    	esbFrontierComResourcemanagement.msg_UpdateCustomerVoiceMailDetailsResponse  ucvmRes = new esbFrontierComResourcemanagement.msg_UpdateCustomerVoiceMailDetailsResponse();
    	esbFrontierComResourcemanagement.UpdateCustomerVoiceMailDetails_element upvmDE = new esbFrontierComResourcemanagement.UpdateCustomerVoiceMailDetails_element();
    	esbFrontierComResourcemanagement.UpdateCustomerVoiceMailDetailsResponse_element upvmRE = new esbFrontierComResourcemanagement.UpdateCustomerVoiceMailDetailsResponse_element();
    	esbFrontierComResourcemanagement.ResourceManagement_ResourceManagementHttpPort co;
    	try{
    		co = new esbFrontierComResourcemanagement.ResourceManagement_ResourceManagementHttpPort();
    	}Catch(Exception ex){ System.debug(ex);}
    	
    	System.debug(JSON.SerializePretty(co));
		esbFrontierComResourcemanagement.msg_UpdateCustomerVoiceMailDetailsRequest ucvmReq = new esbFrontierComResourcemanagement.msg_UpdateCustomerVoiceMailDetailsRequest();
		ucvmReq.telephoneNumber = '2143321212';
		
		Test.startTest();
    	Test.setMock(WebServiceMock.class, new esbFrontierComResourcemanagementMock('RESETPASSCODE'));   
    	esbFrontierComResourcemanagement.msg_UpdateCustomerVoiceMailDetailsResponse res = co.UpdateCustomerVoiceMailDetails(ucvmReq); 	
    	ucvmRes = co.UpdateCustomerVoiceMailDetails(ucvmReq);
    	System.assertEquals('123456',ucvmRes.voiceMailPin);
    	Test.stopTest();
    	System.debug(JSON.SerializePretty(ucvmRes.voiceMailPin));
    }
}