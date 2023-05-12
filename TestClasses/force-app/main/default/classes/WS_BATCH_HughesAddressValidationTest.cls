@isTest(seeAllData = true)
private class WS_BATCH_HughesAddressValidationTest {

    static testMethod void myUnitTest() {
    	
    	AgentTools_AddressValidation.HughesRequest hr;
    	AgentTools_AddressValidation.HughesRequest HugReq = new AgentTools_AddressValidation.HughesRequest();
    	HugReq.siteId = 'asdf';
        HugReq.customerId = 'asdf';
        HugReq.servicePhone = 'asdf';
        HugReq.serviceAddress1 = 'asdf';
        HugReq.serviceAddress2 = 'asdf';
        HugReq.city  = 'asdf';
        HugReq.state  = 'asdf';
        HugReq.zip  = 'asdf';
        HugReq.hsiUpDown  ='sunil';
            	
    	List<AgentTools_AddressValidation.HughesRequest> lstHugRequests = new List<AgentTools_AddressValidation.HughesRequest>();
    	lstHugRequests.add(HugReq); 
    	       
        WS_BATCH_HughesAddressValidation huAddVal = new WS_BATCH_HughesAddressValidation(lstHugRequests);       
        Test.setMock(WebServiceMock.class, new ManageAddressGetAddMockTest());
        ManageAddressGetAddMockTest.indVar = 'one';
        Database.executeBatch(huAddVal); 
       
            	       
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
        
        
        
    	List<AgentTools_AddressValidation.HughesRequest> lstHugRequests1 = new List<AgentTools_AddressValidation.HughesRequest>();
    	lstHugRequests1.add(HugReq1);     	   	
        WS_BATCH_HughesAddressValidation huAddVal1 = new WS_BATCH_HughesAddressValidation(lstHugRequests1);       
        //-----------  
        Database.executeBatch(huAddVal1);        
        /*
        ManageAddressGetAddMockTest.indVar = 'two';
        Database.executeBatch(huAddVal1);
        /*ManageAddressGetAddMockTest.indVar = 'one';
        Database.executeBatch(huAddVal1); 
        
        /*
        ManageAddressGetAddMockTest.indVar = 'three';
        hr = huAddVal1.UpdateItem_Address(HugReq1);
        
        /* 
        Test.setMock(WebServiceMock.class, new ManageAddressGetAddMockTest());
		//Database.executeBatch(huAddVal1);
		hr = huAddVal1.UpdateItem_Address(HugReq1);
        /*
        Test.setMock(WebServiceMock.class, new ManageAddressGetAddMockTest1());
        Database.executeBatch(huAddVal1);
        //hr = huAddVal1.UpdateItem_Address(HugReq1);
        
        /*
        Test.setMock(WebServiceMock.class, new ManageAddressGetAddMockTest2());     
        Database.executeBatch(huAddVal1);   


        hr = huAddVal1.UpdateItem_Address(HugReq1);
       /*
        WS_ESB_ManageAddress.ManageAddressGetAddressRequest magAddGet = huAddVal1.RSA_Request(HugReq1);
        /*
        Test.setMock(WebServiceMock.class, new ManageAddressGetAddMockTest2());
        Database.executeBatch(huAddVal1);/*
       // Test.startTest();
        Test.setMock(WebServiceMock.class, new ManageAddressGetAddMockTest1());
        Database.executeBatch(huAddVal1);
        
        Test.setMock(WebServiceMock.class, new ManageAddressGetAddMockTest2());
        Database.executeBatch(huAddVal1);
        Test.setMock(WebServiceMock.class, new ManageAddressGetAddMockTest1());
        Database.executeBatch(huAddVal1);
        
        Test.stopTest();
        
        
        Test.setMock(WebServiceMock.class, new ManageAddressGetAddMockTest());
        hr = huAddVal.UpdateItem_Address(HugReq1);
        */
        WS_ESB_ManageAddress.ManageAddressGetAddressRequest mad = huAddVal1.RSA_Request(HugReq);
           
    }
}