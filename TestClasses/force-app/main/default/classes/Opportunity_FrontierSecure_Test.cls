@isTest
private class Opportunity_FrontierSecure_Test {
	static testMethod void validateOpportunityFrontierSecure() {
		Account CurrentAccount = new Account(name='Test Account');
		insert CurrentAccount;
		Opportunity CurrentOpportunity = new Opportunity(Name='Test Opportunity',StageName='Defining');
		CurrentOpportunity.AccountId = CurrentAccount.Id;
		CurrentOpportunity.CloseDate = system.today();
		insert CurrentOpportunity;			
		
		Id OpportunityId = CurrentOpportunity.Id;
		List<Opportunity_FrontierSecure.ProductView> listProducts = new List<Opportunity_FrontierSecure.ProductView>();
		List<Opportunity_FrontierSecure.ProductView> listTechSupport = new List<Opportunity_FrontierSecure.ProductView>();
		
		ApexPages.StandardController sc = new ApexPages.StandardController(CurrentOpportunity);
		Opportunity_FrontierSecure testOpportunityFrontierSecure = new Opportunity_FrontierSecure(sc);
		
		PageReference pageRef = Page.Opportunity_FrontierSecure;
		pageRef.getParameters().put('id', String.valueOf(OpportunityId));
		Test.setCurrentPage(pageRef);
		
		testOpportunityFrontierSecure.getPendingApproval();
		testOpportunityFrontierSecure.getIsCurrentApprover();
		testOpportunityFrontierSecure.getProducts();
		testOpportunityFrontierSecure.getTechSupport();
		testOpportunityFrontierSecure.UpdateProducts();
		testOpportunityFrontierSecure.ResetProducts();
		testOpportunityFrontierSecure.getContractOptions();		
	}
}