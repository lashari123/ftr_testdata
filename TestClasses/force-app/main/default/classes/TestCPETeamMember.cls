@isTest
public class TestCPETeamMember {
    static testMethod void testCPETeamMemberTrigger(){
        Date mydate = Date.today();
        List <User> usr = [Select Id from User where IsActive = true Limit 1];
        // Create a test OpporunityTeamMember
        List<Opportunity> opps = new List<Opportunity>();
        Opportunity testOpportunity = new Opportunity(Name='CPETeamMemberTrigger Test Opporunity', StageName='Proposal', CloseDate=mydate);
        opps.add(testOpportunity);
        insert opps;
        testOpportunity = [select id, Name from Opportunity where id = :testOpportunity.Id];
        // Create a test OpporunityTeamMember
        OpportunityTeamMember testOTM = new OpportunityTeamMember(UserId = usr[0].id, TeamMemberRole ='CPE AE', OpportunityID = testOpportunity.Id);
        OpportunityTeamMember testOTM2 = new OpportunityTeamMember(UserId = usr[0].id, TeamMemberRole ='Other', OpportunityID = testOpportunity.Id);

        insert testOTM;
        insert testOTM2;
        testOTM.TeamMemberRole = 'CPE AE';
        update testOTM;
        testOTM2.TeamMemberRole = 'CPE AE';
        update testOTM2;
        delete testOTM;
    }
}