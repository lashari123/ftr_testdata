@isTest(seeAllData = true)
private class WS_ESB_ManageAAddressTest {
    static testMethod void testAccountrequest(){
    
        WS_ESB_ManageAddress.callout co = new WS_ESB_ManageAddress.callout();
        WS_ESB_ManageAddress.GetAddressRequestCriteria rc = new WS_ESB_ManageAddress.GetAddressRequestCriteria();  
        WS_ESB_ExecutionContext.ExecutionContext ec = new WS_ESB_ExecutionContext.ExecutionContext();
        WS_ESB_ManageAddress.SearchAddressRequestCriteria sc = new WS_ESB_ManageAddress.SearchAddressRequestCriteria();
             
        
        //GetAddress(WS_ESB_ManageAddress.GetAddressRequestCriteria RequestCriteria)
        Test.setMock(WebServiceMock.class, new ManageAddressGetAddMockTest());
        WS_ESB_ManageAddress.TestCallout(rc);   
       
        Test.setMock(WebServiceMock.class, new ManageAddressGetSeaMockTest());
        WS_ESB_ManageAddress.TestCallout1(ec, sc);
        
    }

}