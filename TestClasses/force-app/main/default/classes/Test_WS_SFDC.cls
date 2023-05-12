@isTest(seeAllData = true)
private class  Test_WS_SFDC {

    static testmethod void test1() { 
        String sessionId = UserInfo.getSessionId();
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseWS_Sfdc_Login());       
        WS_SFDC_Datatypes.LoginResponse lgnRes = WS_SFDC.Login();
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseWS_Sfdc_sObjects());
        WS_SFDC.sObjects();
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseWS_Sfdc_sObjDes());
        sObject__c sObj = WS_SFDC.sObjectDescribe(sessionId, 'Account');
        WS_SFDC_Datatypes.sObjectCollection sObjCol = WS_SFDC.sObjectCollection(sessionId, 'Account');                
    }
}