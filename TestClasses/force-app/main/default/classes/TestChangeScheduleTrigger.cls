@isTest(SeeAllData=true) 
public class TestChangeScheduleTrigger {
    static testMethod void testChangeScheduleData(){
        Date mydate = Date.today();
        Contract con = [Select Id from Contract where IsDeleted != true Limit 1];
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
        Schedule__c testSched1 = new Schedule__c(New_Opportunity__c = testOpp1.Id, Schedule_Start_Date__c = mydate, Schedule_End_Date__c = mydate, Contract__c = con.ID);
        Schedule__c testSched2 = new Schedule__c(New_Opportunity__c = testOpp2.Id, Schedule_Start_Date__c = mydate, Schedule_End_Date__c = mydate, Contract__c = con.ID);

        insert testSched1;
        insert testSched2;
        testSched1.Schedule_Start_Date__c = mydate + 1;
        update testSched1;
        delete testSched2;
    }
}