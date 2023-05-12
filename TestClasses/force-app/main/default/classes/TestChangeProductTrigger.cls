@isTest(SeeAllData=true) 
public class TestChangeProductTrigger {
    static testMethod void testChangeProductData(){
        Date mydate = Date.today();
        PricebookEntry pb = [Select Id from PriceBookEntry where IsActive = true AND Product2.sku__c = NULL Limit 1];
        // Create a test Opporunity
        List<Opportunity> opps = new List<Opportunity>();
        Opportunity testOpp1 = new Opportunity(Name='ChangeProductTrigger Test Opp1', StageName='Proposal', CloseDate=mydate);
        Opportunity testOpp2 = new Opportunity(Name='ChangeProductTrigger Test Opp2', StageName='Proposal', CloseDate=mydate);
        opps.add(testOpp1);
        opps.add(testOpp2);
        insert opps;
        testOpp1 = [select id, Name from Opportunity where Name = :testOpp1.Name];
        testOpp2 = [select id, Name from Opportunity where Name = :testOpp2.Name];
        
        // Create a test OpportunityProduct
        OpportunityLineItem testOLI1 = new OpportunityLineItem(PriceBookEntryId = pb.Id, Quantity = 1, OpportunityID = testOpp1.Id, UnitPrice = 10);
        OpportunityLineItem testOLI2 = new OpportunityLineItem(PriceBookEntryId = pb.Id, Quantity = 2, OpportunityID = testOpp2.Id, UnitPrice = 20);

        insert testOLI1;
        insert testOLI2;
        testOLI1.Quantity = 3;
        update testOLI1;
        testOLI2.Term_Months__c = 18;
        update testOLI2;
        delete testOLI1;
    }
}