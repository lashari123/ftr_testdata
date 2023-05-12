/*******************************************************************************
Name        :  ftr_VologyOpptyPresalesEmailServiceTest
Developer   :  RajuM
Description :  Test class for ftr_VologyOpptyPresalesEmailService
*********************************************************************************/

@isTest
public class ftr_VologyOpptyPresalesEmailServiceTest {     
    
    @testSetup static void setup() {
        
        /*
        User u = new User();
        u.LastName = 'Raj';
        u.Alias= 'marg';
        u.Username = 'raj123456@gmail.com';
        u.Email = 'rajkumar1234568@gmail.com';
        u.CommunityNickname ='rak';
        u.TimeZoneSidKey = 'America/Los_Angeles';
        u.EmailEncodingKey = 'UTF-8';
        u.LanguageLocaleKey = 'en_US';
        u.LocaleSidKey = 'en_US';
        Profile p = [Select id From Profile  where name = 'System Administrator' limit 1];
        u.ProfileId= p.id;
        
        insert u; */
        //User thisUser = [SELECT Id FROM User WHERE Id = :UserInfo.getUserId()];
        
        Account a = new Account();
        a.RecordTypeId='012E0000000fDc3IAE';  
        a.name = 'TestAccount';
        a.Phone='2487958700';
        a.ShippingStreet = '2120 Cannes Dr';
        a.ShippingCity = 'Dallas';
        a.ShippingState = 'Texas';
        a.ShippingStateCode = 'TX';
        a.ShippingPostalCode ='75060';      
        
        insert a;
        
        Opportunity opp = new Opportunity();
        opp.Name ='TestOppty';
        opp.AccountId=a.id;
        opp.Opportunity_Type__c = 'New';
        opp.Partner_Sales_Stages__c = 'Decision';
        opp.CloseDate= system.today();
        opp.ForecastCategoryName='Commit';
        opp.Campaign__c ='No';       
        opp.New_Logo__c ='No';
        opp.RecordTypeId ='012E0000000dgAL';
        opp.VologyPreSalesEmailSent__c = false;
        opp.StageName='Decision';
        opp.Lead_Product_List__c = 'Managed Firewall';
        opp.Description__c ='Test for SEER'; 
        opp.Description_of_customer_needs__c = 'Test SEER';
        opp.Service_Address__c = '2120 Cannes Dr,Dallas,TX';
        //opp.SEER_Assigned_To__c=u.id;
        
        insert opp;        
    }
    
    @isTest  
    static void ftr_VologyOpptyPresalesEmailSerPositiveMethod(){        
        
        User thisUser = [SELECT Id FROM User WHERE Id = :UserInfo.getUserId()];
        Set<Id> oppIds = new Set<Id>();      
        
        //System.runAs (thisUser) {     
        
        //user u = [select id from user limit 1];
        //Test.setMock(HttpCalloutMock.class, new ftr_TestMock()); 
        
        opportunity opp =[select id,Name,AccountId,Opportunity_Type__c,Partner_Sales_Stages__c,CloseDate,VologyPreSalesEmailSent__c,Lead_Product_List__c,Description__c from opportunity limit 1];
        //String userId = Userinfo.getUserId();        
        User userRec = [SELECT Id FROM User LIMIT 1];
        opp.SEER_Assigned_To__c = thisUser.Id;         
        update opp;
        
        //opportunity opp =[select id,Name,AccountId,Opportunity_Type__c,Partner_Sales_Stages__c,CloseDate,VologyPreSalesEmailSent__c,Lead_Product_List__c,Description__c from opportunity limit 1];
        List<Opportunity> lstopp = new List<Opportunity>();
        lstopp.add(opp);
        oppIds.add(opp.id); 
        
        Test.startTest(); 
        
        StaticResourceCalloutMock mock = new StaticResourceCalloutMock();
            mock.setStaticResource('ftr_VologyPresalesSuccessResponse');
            mock.setStatusCode(200);
            mock.setHeader('Content-Type', 'application/json;charset=UTF-8');
            
        Test.setMock(HttpCalloutMock.class, mock); 
        Test.stopTest();
        
        //ftr_VologyOpptyPresalesSuResponseWrapper newwrap = new ftr_VologyOpptyPresalesSuResponseWrapper();
        String respos = '{ "response": { "operationStatus":"TRUE", "executionStatusMessage":{ "severity":"INFO", "service":"CommunicationMagement", "operation":"SendVologyEmail", "operationStatusCode":"000-000-0000", "operationStatusDescription":"Success", "miscellaneousInformation":"Email Sent successfully", "executionStatusMessage":{ "severity":"INFO", "service":"CommunicationMagement", "operation":"SendEmailService", "operationStatusCode":"000-000-0000", "operationStatusDescription":"Success", "miscellaneousInformation":"Email Message Was Sent to SendEmailService" } } } }';
        ftr_VologyOpptyPresalesPosRespWrapper posresp = ftr_VologyOpptyPresalesPosRespWrapper.parse(respos);
  		
        String resneg1 = '{ "response": { "operationStatus": "FALSE", "executionStatusMessage": { "severity": "ERROR", "service": "CommunicationManagement", "operation": "SendVologyEmail", "operationStatusCode": "000-000-0002", "operationStatusDescription": "Failure","miscellaneousInformation": "API encountered a non-recoverable error and was not able to process the request." } } } }';
        ftr_VologyOpptyPresalesFailNFRespWrapper neg1resp = ftr_VologyOpptyPresalesFailNFRespWrapper.parse(resneg1);
        
        String resneg2 = '{ "Error": { "ExceptionType": "Unauthorized", "MessageId": "ae3a2707-672c-4d9f-97e9-8db41833f0aa", "Text": "You are not authorized to access this API. Invalid apikey" } } ' ;
        ftr_VologyOpptyPresalesFailUARespWrapper neg2resp =ftr_VologyOpptyPresalesFailUARespWrapper.parse(resneg2);
           
        }      
}