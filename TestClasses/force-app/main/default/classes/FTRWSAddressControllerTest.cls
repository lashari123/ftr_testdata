/**
 * @description       : This test class covers the following Apex classes:
 *      FTRWSAddressController
 *      TBD_CLASS2
 *      TBD_CLASS3
 * @author            : TBD
 * @version           : 5
**/
@isTest
public class FTRWSAddressControllerTest {
    
    
    @isTest
    public static void testGetSuggestions() {
        
        
        Test.startTest(); 
        String input = '1401 S MacArthur Blvd';
        Test.setMock(HttpCalloutMock.class, new GoogleSuggestionsTestMock());
        String actualValue = FTRWSAddressController.getSuggestions(input);
        Test.stopTest();
    }
    
    @isTest
    public static void testGetPlaceDetails() {
        
        
        Test.startTest();
        Test.setMock(HttpCalloutMock.class, new GooglePlaceDetailsTestMock());
        String placeId = 'ChIJt2EXx36DToYRW6Am0ycK0BI'; 
        String actualValue = FTRWSAddressController.getPlaceDetails(placeId);
        Test.stopTest();
    }
    
    @isTest
    public static void testGetPlaceDetailsByLatLng() {
        
        
      Account acc = new Account();
        acc.Name='testAccount';
        insert acc;
        
        
        Opportunity opp = new Opportunity();
        opp.Name='Test Opp';
        opp.StageName='Decision';
        opp.AccountId=acc.id;
        opp.CloseDate= System.today();
        opp.ForecastCategoryName='Commit';
        insert opp;
        
        Test.startTest();
        Test.setMock(HttpCalloutMock.class, new GoogleLatLngTestMock());
        String lat = '40.714224'; 
        String lng = '-73.961452';
        FTRWSAddressController.getPlaceDetailsWithLatLng(opp.Id, lat, lng);
        Test.stopTest();
    }    
    
    @isTest
    //Need to implement this later once DSAT response object becomes available
    //Need to pass the Opportunity id also
    public static void testGet_SaveAddress(){
        String gAddressStr = '{"actionStr":"CREATE","streetNo":"2001","streetName":"Solar Drive","city":"Oxnard", '+ 
            '"state":"California","unitNo":"","zipcode":"93036","opportunityId":"0065500000IyiJQAAZ","gLat":34.2203155,"gLng":-119.1458787}';
        Test.startTest();
        
        FTRWSAddressController.get_SaveAddress(gAddressStr);
        Test.stopTest();
    }
    
    @isTest
    public static void testGet_UpdateAddress() {
        
        Account acc = new Account();
        acc.Name='testAccount';
        insert acc;
        
        
        Opportunity opp = new Opportunity();
        opp.Name='Test Opp';
        opp.StageName='Decision';
        opp.AccountId=acc.id;
        opp.CloseDate= System.today();
        opp.ForecastCategoryName='Commit';
        insert opp;
        
        String gAddressStr = '{"actionStr":"CREATE","streetNo":"2001","streetName":"Solar Drive","city":"Oxnard", '+ 
            '"state":"California","unitNo":"","zipcode":"93036","gLat":34.2203155,"gLng":-119.1458787}';
        FTRWSGoogleAddress gAddress = (FTRWSGoogleAddress)JSON.deserialize(gAddressStr, FTRWSGoogleAddress.class);
        FTRWSAddress__c  address = new FTRWSAddress__c();
        address.Street_Number__c = gAddress.streetNo;
        address.Street_Name__c = gAddress.streetName;
        address.Street_Number__c = gAddress.streetNo;
        address.City__c = gAddress.city;
        address.State__c = gAddress.state;
        address.Zip_Code__c = gAddress.zipcode;
        address.Opportunity_ID__c = opp.id;
        address.G_Latitude__c = gAddress.gLat;
        address.G_Longitude__c = gAddress.gLng;
        
        insert address;
        
        //*************************************
        
        //FTRWSAddress__c address =[select id from FTRWSAddress__c limit 1];
        ID addressId = address.Id;
        
        FTRWSDPIAddressResponse dpiData = new FTRWSDPIAddressResponse();
        dpiData.clliCode = 'ELRICAXFDS0';
        dpiData.svcControlNo = '5850005';
        dpiData.wirecenter = '805988';
        dpiData.latitude = '+034.220261';
        dpidata.longitude = '-119.145638';
        dpidata.streetName = '2001';
        dpiData.streetNumber = 'Solar Drive';
        dpiData.unit = '1';
        dpiData.cityName = 'Oxnard';
        dpiData.state = 'California';
        dpiData.zipCode = '93036';
        dpiData.status = 'SUCCESS';
        address.Comments__c = '';
        FTRWSDSATAddressResponse dsatData = getDSATDummyData();
        
        Test.startTest();
        FTRWSAddressController.get_UpdateAddress(addressId, 'UPDATE_DPI', dpiData, null);
        FTRWSAddressController.get_UpdateAddress(addressId, 'UPDATE_DSAT', null, dsatData);
        Test.stopTest();
        
        
        
    }
    
    private static FTRWSDSATAddressResponse getDSATDummyData() {
        
        FTRWSDSATAddressResponse dsatResponse = new FTRWSDSATAddressResponse();
        
        dsatResponse.businessName = '';
        
        dsatResponse.copperDistance = '9996';
        dsatResponse.copperQualification = 'BDT';//'Qualified (up to 50MB)';
        dsatResponse.copperTier = '2';
        
        dsatResponse.fiberDistance = '393';
        dsatResponse.fiberQualification = 'BDT';//'Qualified (max WC speed)';
        dsatResponse.fiberTier = '1';
        
        dsatResponse.createdBy = 'Hemantha Gujjar';
        dsatResponse.createdById = 'hgg395';
        dsatResponse.creatorEmail = 'hgg395@ftr.com';
        
        dsatResponse.inFootprint = true;
        dsatResponse.dsatId = '1655092';
        dsatResponse.market = 'D';
        dsatResponse.level = 'b';
        dsatResponse.litBuilding = true;
        dsatResponse.opened = '2021-05-17T13:56:16.6292161-04:00';
        dsatResponse.products = 'EIA, EVPL, ELAN, IPVPN, Jumbo Frames, EPL, Connect Cloud, EPath, EReach';
        
        dsatResponse.siteName = '';
        dsatResponse.latitude = '34.220407916631316';
        dsatResponse.longitude = '-119.14580691804325';
        
        dsatResponse.m6OrderNumber = '';
        dsatResponse.vfoRecordId = '';
        
        dsatResponse.wireCenterCLLI = 'ELRICAXF';
        dsatResponse.wireCenterQoS = 'Platinum';
        dsatResponse.wireCenterSpeed = '1000MB';
        return dsatResponse;
    }
    
    
    @isTest
    public static void testGetDPIValResultWithAddressId() {
        
        Account acc = new Account();
        acc.Name='testAccount';
        insert acc;
        
        
        Opportunity opp = new Opportunity();
        opp.Name='Test Opp';
        opp.StageName='Decision';
        opp.AccountId=acc.id;
        opp.CloseDate= System.today();
        opp.ForecastCategoryName='Commit';
        insert opp;
        
        String gAddressStr = '{"actionStr":"CREATE","streetNo":"2001","streetName":"Solar Drive","city":"Oxnard", '+ 
            '"state":"California","unitNo":"","zipcode":"93036","gLat":34.2203155,"gLng":-119.1458787}';
        FTRWSGoogleAddress gAddress = (FTRWSGoogleAddress)JSON.deserialize(gAddressStr, FTRWSGoogleAddress.class);
        FTRWSAddress__c  address = new FTRWSAddress__c();
        address.Street_Number__c = gAddress.streetNo;
        address.Street_Name__c = gAddress.streetName;
        address.Street_Number__c = gAddress.streetNo;
        address.City__c = gAddress.city;
        address.State__c = gAddress.state;
        address.Zip_Code__c = gAddress.zipcode;
        address.Opportunity_ID__c = opp.id;
        address.G_Latitude__c = gAddress.gLat;
        address.G_Longitude__c = gAddress.gLng;
        
        insert address;
        
        //*************************************************************
        // FTRWSAddress__c address =[select id from FTRWSAddress__c limit 1];
        Test.startTest();
        Test.setMock(WebServiceMock.class, new FTRWSDPIAddressValResultMock());
        FTRWSAddressController.getDPIValResultWithAddressId(address.Id);
        Test.stopTest();
    }
    
    
    @isTest
    public static void testGetAddressValidationResults() {
        
        Account acc = new Account();
        acc.Name='testAccount';
        insert acc;
        
        
        Opportunity opp = new Opportunity();
        opp.Name='Test Opp';
        opp.StageName='Decision';
        opp.AccountId=acc.id;
        opp.CloseDate= System.today();
        opp.ForecastCategoryName='Commit';
        insert opp;
        
        String gAddressStr = '{"actionStr":"CREATE","streetNo":"2001","streetName":"Solar Drive","city":"Oxnard", '+ 
            '"state":"California","unitNo":"","zipcode":"93036","gLat":34.2203155,"gLng":-119.1458787}';
        FTRWSGoogleAddress gAddress = (FTRWSGoogleAddress)JSON.deserialize(gAddressStr, FTRWSGoogleAddress.class);
        FTRWSAddress__c  address = new FTRWSAddress__c();
        address.Street_Number__c = gAddress.streetNo;
        address.Street_Name__c = gAddress.streetName;
        address.Street_Number__c = gAddress.streetNo;
        address.City__c = gAddress.city;
        address.State__c = gAddress.state;
        address.Zip_Code__c = gAddress.zipcode;
        address.Opportunity_ID__c = opp.id;
        address.G_Latitude__c = gAddress.gLat;
        address.G_Longitude__c = gAddress.gLng;
        
        insert address;
        
        //*************************************************************
        // FTRWSAddress__c address =[select id from FTRWSAddress__c limit 1];
        Test.startTest();
        Test.setMock(WebServiceMock.class, new FTRWSDPIAddressValResultMock());
        //ftr_addressBean addressBean = new ftr_addressBean();
        //FTRWSDPIAddressController.retreiveCustomerFacility(addressBean);
        FTRWSAddressController.getAddressValidationResults(address.Id);
        Test.stopTest();
    }
    
    
    public static testmethod void testGetDSATValResultWithAddressId() {
        Account acc = new Account();
        acc.Name='testAccount';
        insert acc;
        
        
        Opportunity opp = new Opportunity();
        opp.Name='Test Opp';
        opp.StageName='Decision';
        opp.AccountId=acc.id;
        opp.CloseDate= System.today();
        opp.ForecastCategoryName='Commit';
        insert opp;
        
        String gAddressStr = '{"actionStr":"CREATE","streetNo":"2001","streetName":"Solar Drive","city":"Oxnard", '+ 
            '"state":"California","unitNo":"","zipcode":"93036","gLat":34.2203155,"gLng":-119.1458787}';
        FTRWSGoogleAddress gAddress = (FTRWSGoogleAddress)JSON.deserialize(gAddressStr, FTRWSGoogleAddress.class);
        FTRWSAddress__c  address = new FTRWSAddress__c();
        address.Street_Number__c = gAddress.streetNo;
        address.Street_Name__c = gAddress.streetName;
        address.Street_Number__c = gAddress.streetNo;
        address.City__c = gAddress.city;
        address.State__c = gAddress.state;
        address.Zip_Code__c = gAddress.zipcode;
        address.Opportunity_ID__c = opp.id;
        address.G_Latitude__c = gAddress.gLat;
        address.G_Longitude__c = gAddress.gLng;
        
        insert address;
        
        
        //****************************************************************
        //FTRWSAddress__c address =[select id from FTRWSAddress__c limit 1];
        Test.startTest();
        Test.setMock(HttpCalloutMock.class, new FTRWSDSATAddressControllerPostMock());
        FTRWSAddressController.getDSATValResultWithAddressId(address.Id);
        Test.stopTest();
        
        
        //FTRWSDSATAddressControllerPostMock
    }
    
    public static testmethod void testGetDSATValResultWithAddressIdLat() {
        Account acc = new Account();
        acc.Name='testAccount';
        insert acc;
        
        
        Opportunity opp = new Opportunity();
        opp.Name='Test Opp';
        opp.StageName='Decision';
        opp.AccountId=acc.id;
        opp.CloseDate= System.today();
        opp.ForecastCategoryName='Commit';
        insert opp;
        
        String gAddressStr = '{"actionStr":"CREATE","streetNo":"2001","streetName":"Solar Drive","city":"Oxnard", '+ 
            '"state":"California","unitNo":"","zipcode":"93036","gLat":34.2203155,"gLng":-119.1458787}';
        FTRWSGoogleAddress gAddress = (FTRWSGoogleAddress)JSON.deserialize(gAddressStr, FTRWSGoogleAddress.class);
        
        FTRWSAddress__c  address1 = new FTRWSAddress__c();
        address1.Street_Number__c = gAddress.streetNo;
        address1.Street_Name__c = gAddress.streetName;
        address1.Street_Number__c = gAddress.streetNo;
        address1.City__c = gAddress.city;
        address1.State__c = gAddress.state;
        address1.Zip_Code__c = gAddress.zipcode;
        address1.Opportunity_ID__c = opp.id;
        address1.Latitude__c = null;
        address1.Longitude__c = null;
        
        insert address1;
        
        //****************************************************************
        //FTRWSAddress__c address =[select id from FTRWSAddress__c limit 1];
        
        Test.startTest();
        Test.setMock(HttpCalloutMock.class, new FTRWSDSATAddressControllerPostMock());
        FTRWSAddressController.getDSATValResultWithAddressId(address1.Id);
        Test.stopTest();
        //FTRWSDSATAddressControllerPostMock
    }
    
    
}