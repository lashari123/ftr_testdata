@isTest(seeAllData = true)
private class WS_ESB_ManageAccountTest {
    static testMethod void testAccountrequest(){
        
        Test.setMock(WebServiceMock.class, new WS_ESB_ManageAccountMockWebSerTest());
        WS_ESB_ManageAccount.TestCallout('7157543333', 'LF');
        Test.setMock(WebServiceMock.class, new WS_ESB_ManageAccountGtMemoMockWebSerTest());
        WS_ESB_ManageAccount.TestCallout1('7157543333', 'LF');
        Test.setMock(WebServiceMock.class, new WS_ESB_ManageAccountGetHG());
        WS_ESB_ManageAccount.TestCalloutHg('7157543333', 'LF');
    }

}