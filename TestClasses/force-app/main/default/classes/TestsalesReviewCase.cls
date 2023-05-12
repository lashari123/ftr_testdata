@isTest(SeeAllData=true) 
public class TestsalesReviewCase {
    static testMethod void testCreatesalescase() {
        Account NewAccount = new Account();
        NewAccount.Name = 'new account';
        newaccount.phone = '9999999999';
        insert newaccount;
        
        
        Case newCase = new case();
        newCase.account = newaccount;
        newcase.stage__c = 'Discovery';
        newcase.sub_stage__c = 'CPE DSC Contacted Client';
        newcase.last_Stage_Change__c = datetime.now() -5;
        newcase.last_Sub_Stage_Change__c = datetime.now() -5;
        insert newCase;
        
        newcase.stage__c = 'sold';
        newcase.sub_stage__c = 'Service Order dropped in STATS';
        update newcase;
    }
}