@isTest
private class AddressValidationControllerTestClass
{
    private static testMethod void getAddress(){
       /* System.assertEquals(AddressValidationController.ADDRESS_CONST,AddressValidationController.ADDRESS_CONST);
        System.assertEquals(AddressValidationController.TELEPHONE_NUMBER_CONST,AddressValidationController.TELEPHONE_NUMBER_CONST);
        System.assertEquals(AddressValidationController.LINE_CARD_STATUS,AddressValidationController.LINE_CARD_STATUS);
        System.assertEquals(AddressValidationController.YES,AddressValidationController.YES);
        System.assertEquals(AddressValidationController.NO,AddressValidationController.NO);
        System.assertEquals(AddressValidationController.NA,AddressValidationController.NA);*/
        String selectedStrtName = 'Prairie Rose'; 
        String selectedZipCode = '51008';
        String selectedStrtNumber = '335';
        String selectedCity = 'Brunsville';
        String stateListDef = 'IA';    
        String selectedStrtSubtitle = 'Ln'; 
        String selectedStrtSubDescription = '';
        String selectedTelNum = '3043258181';
        String selectCriteriaDef = 'Address';
        Lead leadObj = new Lead();
        leadObj.LastName = 'test';
        leadObj.Company = 'test';
        leadObj.City__c = selectedCity;
        leadObj.State__c = stateListDef;
        leadObj.Street_Name__c = selectedStrtName;
        leadObj.street_Number__c = selectedStrtNumber;
        leadObj.Zip_Code__c = selectedZipCode;
        leadObj.Street_Subtitle__c = selectedStrtSubtitle;
        leadObj.Street_Subtitle_Ln_Ave_etc__c = selectedStrtSubDescription;
        
        insert leadObj;
        
        //Set Lead Object as Standard Controller
        ApexPages.StandardController leadController = new ApexPages.StandardController(leadObj); 
        //Set it to Custom Controller
        AddressValidationController addressValidationController = new AddressValidationController(leadController);
        //AddressValidationController addressValidationController = new AddressValidationController();
        //Set Criteria as Address
        addressValidationController.selectCriteriaDef = 'Address';
        addressValidationController.selectedStrtName = selectedStrtName;
        addressValidationController.selectedZipCode = selectedZipCode;
        addressValidationController.selectedStrtNumber = selectedStrtNumber;
        addressValidationController.selectedCity = selectedCity;
        addressValidationController.stateListDef = stateListDef;
        addressValidationController.selectedStrtSubtitle = selectedStrtSubtitle;
        addressValidationController.selectedStrtSubDescription = selectedStrtSubDescription;
        //Set Telephone Number for Next WS Call
        addressValidationController.selectedTelNum = selectedTelNum;
        Test.setMock(WebServiceMock.class, new AddressValidationMockWebService());
        Test.startTest();
            addressValidationController.validatePhysicalAddress( );         
            addressValidationController.closePopup();
            addressValidationController.reLoadAddressValidation();
            addressValidationController.showPopup();
            addressValidationController.resetFields();          
            addressValidationController.searchPhysicalAddress( );
        Test.stopTest();    
    }
        private static testMethod void getAddressByTelephone(){
        String selectedStrtName = 'Prairie Rose'; 
        String selectedZipCode = '51008';
        String selectedStrtNumber = '335';
        String selectedCity = 'Brunsville';
        String stateListDef = 'IA';    
        String selectedStrtSubtitle = 'Ln'; 
        String selectedStrtSubDescription = '';
        String selectedTelNum = '3043258181';
        String selectCriteriaDef = 'WTN';
        Lead leadObj = new Lead();
        leadObj.LastName = 'test';
        leadObj.Company = 'test';
        leadObj.City__c = selectedCity;
        leadObj.State__c = stateListDef;
        leadObj.Street_Name__c = selectedStrtName;
        leadObj.street_Number__c = selectedStrtNumber;
        leadObj.Zip_Code__c = selectedZipCode;
        leadObj.Street_Subtitle__c = selectedStrtSubtitle;
        leadObj.Street_Subtitle_Ln_Ave_etc__c = selectedStrtSubDescription;
        
        insert leadObj;
        
        //Set Lead Object as Standard Controller
        ApexPages.StandardController leadController = new ApexPages.StandardController(leadObj); 
        //Set it to Custom Controller
        AddressValidationController addressValidationController = new AddressValidationController(leadController);
        //AddressValidationController addressValidationController = new AddressValidationController();
        //Set Criteria as WTN
        addressValidationController.selectCriteriaDef = 'WTN';
        addressValidationController.selectedStrtName = selectedStrtName;
        addressValidationController.selectedZipCode = selectedZipCode;
        addressValidationController.selectedStrtNumber = selectedStrtNumber;
        addressValidationController.selectedCity = selectedCity;
        addressValidationController.stateListDef = stateListDef;
        addressValidationController.selectedStrtSubtitle = selectedStrtSubtitle;
        addressValidationController.selectedStrtSubDescription = selectedStrtSubDescription;
        //Set Telephone Number for Next WS Call
        addressValidationController.selectedTelNum = selectedTelNum;
        Test.setMock(WebServiceMock.class, new AddressValidationMockWebService());
        Test.startTest();
            addressValidationController.validatePhysicalAddress();          
            addressValidationController.closePopup();
            addressValidationController.reLoadAddressValidation();
            addressValidationController.showPopup();
            //addressValidationController.searchPhysicalAddress();
        Test.stopTest();    
    }
    
    private static testMethod void searchAddressTest(){
        String selectedStrtName = 'Prairie Rose'; 
        String selectedZipCode = '51008';
        String selectedStrtNumber = '335';
        String selectedCity = 'Brunsville';
        String stateListDef = 'IA';    
        String selectedStrtSubtitle = 'Ln'; 
        String selectedStrtSubDescription = '';
        String selectedTelNum = '3043258181';
        String selectCriteriaDef = 'Address';
        Lead leadObj = new Lead();
        leadObj.LastName = 'test';
        leadObj.Company = 'test';
        leadObj.City__c = selectedCity;
        leadObj.State__c = stateListDef;
        leadObj.Street_Name__c = selectedStrtName;
        leadObj.street_Number__c = selectedStrtNumber;
        leadObj.Zip_Code__c = selectedZipCode;
        leadObj.Street_Subtitle__c = selectedStrtSubtitle;
        leadObj.Street_Subtitle_Ln_Ave_etc__c = selectedStrtSubDescription;
        
        insert leadObj;
        
        //Set Lead Object as Standard Controller
        ApexPages.StandardController leadController = new ApexPages.StandardController(leadObj); 
        //Set it to Custom Controller
        AddressValidationController addressValidationController = new AddressValidationController(leadController);
        //AddressValidationController addressValidationController = new AddressValidationController();
        //Set Criteria as Address
        addressValidationController.selectCriteriaDef = 'Address';
        addressValidationController.selectedStrtName = selectedStrtName;
        addressValidationController.selectedZipCode = selectedZipCode;
        addressValidationController.selectedStrtNumber = selectedStrtNumber;
        addressValidationController.selectedCity = selectedCity;
        addressValidationController.stateListDef = stateListDef;
        addressValidationController.selectedStrtSubtitle = selectedStrtSubtitle;
        addressValidationController.selectedStrtSubDescription = selectedStrtSubDescription;
        //Set Telephone Number for Next WS Call
        addressValidationController.selectedTelNum = selectedTelNum;
        Test.setMock(WebServiceMock.class, new AddressValidationMockWebService2());
        Test.startTest();
            //addressValidationController.validatePhysicalAddress( );    
            addressValidationController.searchPhysicalAddress( );     
            addressValidationController.closePopup();
            addressValidationController.reLoadAddressValidation();
            addressValidationController.showPopup();        

        Test.stopTest();    
    }
    
}