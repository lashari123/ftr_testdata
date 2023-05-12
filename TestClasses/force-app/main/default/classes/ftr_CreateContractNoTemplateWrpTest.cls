@IsTest
public class ftr_CreateContractNoTemplateWrpTest {
    @isTest(SeeAllData=true)
    static void createContractSuccessTest(){
        Id oppId = CreateTestOpportunity();
        //Test.setMock(WebServiceMock.class, new ftr_CreateCustomerAccountWSMock());
        Map<String, Object> inputMap = new Map<String, Object>();
        Map<String, Object> outputMap = new Map<String, Object>();
        Map<String, Object> options = new Map<String, Object>();
        inputMap.put('recordId', oppId);

        ftr_CreateContractNoTemplateWrp createContract = new ftr_CreateContractNoTemplateWrp();
        Boolean result;
        Test.startTest();
        result = createContract.invokeMethod('createContract',inputMap, outputMap, options);
        Test.stopTest();

        System.assertNotEquals(null, result);
    }

    public static Id CreateTestOpportunity(){
        Account objAccount = new Account();
        objAccount.Name = 'Test Acc1';
        objAccount.ShippingStreet = '2120 Cannes Dr';
        objAccount.ShippingCity = 'Dallas';
        objAccount.ShippingState = 'Texas';
        objAccount.ShippingStateCode = 'TX';
        objAccount.ShippingPostalCode ='75060';    
        objAccount.ShippingCountry = 'United States';
        objAccount.BillingStreet = '2120 Cannes Dr';
        objAccount.BillingCity = 'Dallas';
        objAccount.BillingState = 'Texas';
        objAccount.BillingStateCode = 'TX';
        objAccount.BillingPostalCode ='75060'; 
        objAccount.BillingCountry = 'United States';     
        INSERT objAccount;

        Id recordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByDeveloperName().get('Community_Connections').getRecordTypeId();
        Opportunity objOpportunity = new Opportunity();
        objOpportunity.Name = 'Test Opp1';
        objOpportunity.Accountid = objAccount.id;
        objOpportunity.StageName = 'Prospecting';
        objOpportunity.CloseDate = system.Today()+3;
        objOpportunity.RecordTypeId = recordTypeId;
        INSERT objOpportunity;
        System.debug('objOpportunity:' + objOpportunity);
        return objOpportunity.Id;
    }
}