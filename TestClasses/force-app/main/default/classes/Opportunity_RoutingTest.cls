@isTest
private class Opportunity_RoutingTest{

    @TestSetup
    static void makeData(){
        User u = new User(
            ProfileId = [SELECT Id FROM Profile WHERE Name = 'Frontier Sales User'].Id,
            LastName = 'last',
            Email = 'puser000@amamama.com',
            Username = 'puser000@amamama.com' + System.currentTimeMillis(),
            CompanyName = 'TEST',
            Title = 'title',
            Alias = 'alias',
            TimeZoneSidKey = 'America/Los_Angeles',
            EmailEncodingKey = 'UTF-8',
            LanguageLocaleKey = 'en_US',
            LocaleSidKey = 'en_US',
            UserRoleId = [SELECT Id FROM UserRole WHERE Name = 'Alternate Channel' limit 1].Id,
            isActive=true
        );
        insert u;
    }
    
    static testmethod void testOpportunity(){
        
        /*Account testAcct = new Account (Name = 'My Test Account');
        insert testAcct;
        Opportunity newOpp= new Opportunity(Name ='OPT',
                                            AccountID = testAcct.ID,
                                            StageName = 'Customer Won',
                                            Reason_Won_Lost__c = 'Closed',
                                            CloseDate = System.today());
        insert newOpp;*/
        
        Opportunity opp = ftr_TestDataFactory.getOpportunities(1)[0];
        QuoteLineItem qli = ftr_TestDataFactory.getQLI(1, 1)[0];
        Account account = ftr_TestDataFactory.getAccounts(1)[0];
        account.Has_MSA__c = false;
        insert account;
        Product2 prod = new Product2(Id=qli.Product2Id);
        OpportunityLineItem opli = new OpportunityLineItem();
        opp.name = 'OPT';
        opp.recordtypeid ='012E0000000dgAK';
        opp.Opportunity_Type__c = 'New';
        opp.bdt_Number__c = 'na';
        opp.OwnerId = [SELECT Id FROM User WHERE email = 'puser000@amamama.com'].Id;
        opp.AccountId = account.Id;
        opp.StageName = 'Customer Won';
        opp.Reason_Won_Lost__c = 'Closed';
        opp.CloseDate = System.today();
        insert opp;
        prod.Is_LegacyVlocityProduct__c = true;
        update prod;
        opli.Is_LegacyVlocityProduct__c = true;
        opli.Quantity=1;
        opli.PricebookEntryId = qli.PricebookEntryId;
        opli.UnitPrice = qli.UnitPrice;
        opli.opportunityId = opp.Id;
        insert opli;
        
        Opportunity[] opp2 = [SELECT Id, Name from Opportunity where Name ='OPT'];   
        
        PageReference testPage = Page.Opportunity_Routing;
        testPage.getParameters().put('id', opp2[0].id);
        Test.setCurrentPage(testpage);
        
        Test.startTest();
        ApexPages.StandardController sc = new Apexpages.StandardController(opp2[0]);
        Opportunity_Routing oRout = new Opportunity_Routing(sc);
        PageReference pf = oRout.RouteOpportunity();
        Test.stopTest();

    }
}