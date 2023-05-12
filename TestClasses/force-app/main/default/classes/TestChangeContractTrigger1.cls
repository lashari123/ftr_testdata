@isTest(SeeAllData=true) 
	
public with sharing class TestChangeContractTrigger1 {

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
        Contract_Repository__c testContract1 = new Contract_Repository__c(Opportunity__c = testOpp1.Id, StartDate__c = mydate, Account_Name__c = acct.ID);
        Contract_Repository__c testContract2 = new Contract_Repository__c(Opportunity__c = testOpp2.Id, StartDate__c = mydate, Account_Name__c = acct.ID);

        insert testContract1;
        insert testContract2;
        testContract1.ContractTerm__c = 3;
        update testContract1;
        delete testContract2;
        
        /*
        Profile p = [SELECT Id FROM Profile WHERE Name='Agents']; 
      	User u = new User(Alias = 'abczzz', Email='abczzz@testorg.com', state='TX', City='Dallas',
      	EmailEncodingKey='UTF-8', LastName='abczzz', LanguageLocaleKey='en_US', 
      	LocaleSidKey='en_US', ProfileId = p.Id, 
      	TimeZoneSidKey='America/Los_Angeles', UserName='abczzz@testorg.com', ContactID='03L000000BQ3dyIAD');
		*/

      	//System.runAs(u) {
      		        
	        opps[0].Mrg_Approved__c='Closed (Ink)';
	        opps[0].StageName = 'Closed/Won';
	        opps[0].Expected_Billed_Date__c=mydate;
	        opps[0].RPON_Order__c='1';
	        update opps;
	        update testContract1;
      	//}
    }

}