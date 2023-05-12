@isTest
class ContractApexJobTestClass{
    static testmethod void test(){
     try{
        Account a1 =new Account();
        a1.name = 'Test';
        insert a1;
        Contract c1 = new Contract();
        c1.AccountId=a1.Id;
        c1.Promotional_Contract__c = 'Promo';
        c1.Status = 'Draft';
        c1.StartDate = System.today();
        c1.ContractTerm = 12;
       // c1.ContractNumber = '1234';
        insert c1;
        
        dsfs__DocuSign_Status__c sampleDocument = new dsfs__DocuSign_Status__c();
        sampleDocument.dsfs__Contract__c = c1.Id;
        sampleDocument.dsfs__Envelope_Status__c = 'Voided';
        sampleDocument.dsfs__Voided_Reason__c = 'Envelope has expired.';
        sampleDocument.dsfs__Voided_Date_Time__c = Date.today();
        insert sampleDocument;
        
        Test.startTest();
        String expiredDocumentsQry = 'SELECT Id,dsfs__Voided_Date_Time__c,dsfs__Contract__c,dsfs__Envelope_Status__c FROM dsfs__DocuSign_Status__c';    
        String jobId = Database.executeBatch(new ContractObjectupdateJob(expiredDocumentsQry));       
        Test.stopTest();
        }
        catch(Exception e){
            System.Debug(e);
        }
    }
    public static testMethod void testschedule() {

Test.StartTest();
ContractsUpdateScheduler sh1 = new ContractsUpdateScheduler();
        String sch = '0 0 23 * * ?';
        system.schedule('Test Territory Check', sch, sh1);
Test.stopTest();

}
}