/**
 * @description       : This test class covers the following Apex classes:
 *      TBD_CLASS1
 *      TBD_CLASS2
 *      TBD_CLASS3
 * @author            : TBD
 * @version           : 1 
**/
@isTest
public class ftr_ContractServiceTest {
    
    @isTest
    public static void checkIfFSAExistingTest(){
        Account testSAccount = new Account();
        testSAccount.Name = 'Test Service Account';
        testSAccount.BillingStreet = '123 Main Street';
        testSAccount.BillingCity = 'Anywhere';
        testSAccount.BillingState = 'Ohio';
        testSAccount.BillingPostalCode = '44088';
        testSAccount.ShippingStreet = '123 Main Street';
        testSAccount.ShippingCity = 'Anywhere';
        testSAccount.ShippingState = 'Ohio';
        testSAccount.ShippingPostalCode = '44088';
        testSAccount.Phone = '9023214560';
        //testSAccount.RecordTypeId = getRecordType('Service');
        //testSAccount.Parent_Account__c = testAccount.id;
        insert testSAccount;
        
        Opportunity opp = new Opportunity();
        opp.Name = 'RefreshTestOpp';
        opp.AccountId = testSAccount.id;
        Date d1=Date.newInstance(2019, 05, 11);
        opp.CloseDate=d1;
        opp.StageName='Investigating';
        opp.CPE_Product__c='No';
        insert opp;
        
        id pricebookId = Test.getStandardPricebookId();
         
        
        
        Quote oQuote = new Quote();
        oQuote.Name = 'Testing Quote';
        oQuote.OpportunityId = Opp.id;
        oQuote.Pricebook2Id = pricebookId;
        oQuote.Status = 'Draft';
        oQuote.Approval_Status__c = 'N/A';
        
        insert oQuote;
        
        ftr_ContractService.checkIfFSAExisting(new List<Id>{oQuote.Id});
    }
}