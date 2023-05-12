@isTest(seeAllData = true)
private class WS_ESB_ManageOrderTest {

    static testMethod void myUnitTest() {
      Test.setMock(WebServiceMock.class, new WS_ESB_ManageOrderMockWSTest()); 
      WS_ESB_ManageOrder.TestCallout('serviceId');  
    }
}