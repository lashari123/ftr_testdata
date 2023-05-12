@isTest
private class WS_ESB_CustomerInfoInquiryTest {
    static testmethod void unitTest1(){
        WS_ESB_CustomerInfoInquiry.retrieveCustomerServiceConfigurationResponse_element rcscRes = new WS_ESB_CustomerInfoInquiry.retrieveCustomerServiceConfigurationResponse_element();
        WS_ESB_CustomerInfoInquiry.retrieveCustomerServiceConfiguration_element rs = new WS_ESB_CustomerInfoInquiry.retrieveCustomerServiceConfiguration_element('retrieveHuntGroup','7157543333','LF');
        
        Test.setMock(WebServiceMock.class, new WS_ESB_CustomerInfoInqMockWebSerTest());
        WS_ESB_CustomerInfoInquiry.Callout co = new WS_ESB_CustomerInfoInquiry.Callout();  
        WS_ESB_CustomerInfoInquiry.HuntGroupCallout('retrieveHuntGroup','7157543333','LF');    
        WS_BPM_BusinessObjects.msg_Service ms1 = co.retrieveCustomerServiceConfiguration(rs.retrieveCustomerServiceConfigurationInput, 'retrieveHuntGroup','7157543333','LF'); 
    }
}