@isTest(seeAllData = true)
private class WS_BATCH_HughesAddressValidationTest2 {

    static testMethod void myUnitTest() {
        //-----------
        AgentTools_AddressValidation.HughesRequest HugReq1 = new AgentTools_AddressValidation.HughesRequest();
    	HugReq1.siteId = 'asdf';
        HugReq1.customerId = 'asdf';
        HugReq1.servicePhone = null;
        HugReq1.serviceAddress1 = 'asdf';
        HugReq1.serviceAddress2 = 'asdf';
        HugReq1.city  = 'asdf';
        HugReq1.state  = 'asdf';
        HugReq1.zip  = 'asdf';
        HugReq1.hsiUpDown  = 'asdf';
        // Test.startTest();        
        
        WS_BATCH_HughesAddressValidation huAddVal1 = null;
        
    	List<AgentTools_AddressValidation.HughesRequest> lstHugRequests1 = new List<AgentTools_AddressValidation.HughesRequest>();
    	lstHugRequests1.add(HugReq1);
    	try {     	   	
        huAddVal1 = new WS_BATCH_HughesAddressValidation(lstHugRequests1);
    	} catch (Exception e){
    		
    	}              
        Test.setMock(WebServiceMock.class, new ManageAddressGetAddMockTest2());
        Database.executeBatch(huAddVal1); 
    }
}