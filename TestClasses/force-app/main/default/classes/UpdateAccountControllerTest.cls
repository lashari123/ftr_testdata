@isTest
public class UpdateAccountControllerTest{
    @testSetup static void setup() {
        // Create common test accounts
        Id alternateChannelRecordTypeId = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Alternate Channel').getRecordTypeId();
        Account acc = new Account();
		acc.Name='Test Account';
        acc.RecordTypeId =alternateChannelRecordTypeId;
        acc.Company_Legal_Name__c ='Test Companyt Legal Name';
        acc.Channel_Affiliations__c='Big Box';
        acc.State_of_Formation__c='Idaho';
        acc.Type_of_Entity__c='Government';
        acc.Legal_Street__c='4120 s mill avenue';
        acc.Legal_State1__c='Arizona';
        acc.Legal_City__c='Tempe';
        acc.Legal_Zip__c='123456';
        insert acc;
    }
    public static testMethod void TestUpdateAccountController(){
        Id alternateChannelRecordTypeId = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Alternate Channel').getRecordTypeId();
        Account testAccount = [SELECT id FROM account WHERE recordTypeId = :alternateChannelRecordTypeId LIMIT 1];
        PageReference testPage = Page.ExposedWebform;
        Test.setCurrentPage(testPage);
        ApexPages.currentPage().getParameters().put('id', testAccount.id);       
        UpdateAccountController testController = new UpdateAccountController();       
        testController.getOptionList();
        testController.getOptionList1();
        testController.doSubmit();
        testController.doSubmitCM();
    }
}