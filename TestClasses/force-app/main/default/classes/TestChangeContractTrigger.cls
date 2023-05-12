@isTest(SeeAllData=true) 
public class TestChangeContractTrigger {
    static testMethod void testChangeContractData(){
        Date mydate = Date.today();
        Account acct = [Select Id from Account where IsDeleted != true Limit 1];
        // Create a test Opporunity
        List<Opportunity> opps = new List<Opportunity>();
        Opportunity testOpp1 = new Opportunity(Name='ChangeProductTrigger Test Opp1', StageName='Proposal', CloseDate=mydate);
        Opportunity testOpp2 = new Opportunity(Name='ChangeProductTrigger Test Opp2', StageName='Proposal', CloseDate=mydate);
        opps.add(testOpp1);
        opps.add(testOpp2);
        insert opps;
        testOpp1 = [select id, Name from Opportunity where Name = :testOpp1.Name];
        testOpp2 = [select id, Name from Opportunity where Name = :testOpp2.Name];
        
        // Create a test Contract
        Contract testContract1 = new Contract(Opportunity__c = testOpp1.Id, StartDate = mydate, AccountID = acct.ID);
        Contract testContract2 = new Contract(Opportunity__c = testOpp2.Id, StartDate = mydate, AccountID = acct.ID);

        //insert testContract1;
        //insert testContract2;
        testContract1.ContractTerm = 3;
        //update testContract1;
        //delete testContract2;
    }
}