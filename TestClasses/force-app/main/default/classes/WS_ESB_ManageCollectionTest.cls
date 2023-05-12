@isTest (SeeAllData=true)
private class WS_ESB_ManageCollectionTest {
    static testmethod void unitTest1(){
        
        Test.setMock(WebServiceMock.class, new WS_ESB_ManageColMockWebSerTest()); 
        WS_ESB_ManageCollection.Test_GetAccountsReceivable('7157543333', 'LF', true);  
       
        Test.setMock(WebServiceMock.class, new WS_ESB_ManageColMockWSGPMTTest());
        WS_ESB_ManageCollection.Test_GetPayment('7157543333', '0','LF'); 
         
        Test.setMock(WebServiceMock.class, new WS_ESB_ManageColMockWSGAdjTTest());
        WS_ESB_ManageCollection.Test_GetAdjustment('7157543333', '0','LF');
        
        
    }
}