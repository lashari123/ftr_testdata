public class opportunityProductRedirectExtension {   
    Id oppId;    
    Id OrgId; 
    Id accountId;    
    Id userId;    
    string cancelUrl;    
    string strorgid;
    Boolean bProd = false;
    String server;
     
     public opportunityProductRedirectExtension(ApexPages.StandardController  controller) {
        
        Opportunity opp;        
        opp = [select id, accountId from Opportunity where id = :controller.getId()];                        
        oppId = opp.Id;        
        accountId = opp.AccountId;        
        orgId = UserInfo.getOrganizationId();        
        userId =UserInfo.getUserId();
        strorgid = orgId;   
        string BaseURL = URL.getSalesforceBaseUrl().toExternalForm();
        server = FrontierUtil.getServer(BaseURL);
            
        if (server.length() > 2 && server.substring(0,2) == 'na')
            bProd = true;
        else bProd = false;
              
        cancelUrl = 'https://' + server + '.salesforce.com/'+oppId;
        cancelUrl = EncodingUtil.urlEncode(cancelUrl, 'UTF-8');        
              
    }        
    public pageReference redirect()
    {
        PageReference pr;
        if (bProd)
            pr = new PageReference(envLinksSFA.frontierGPProdUrl + '?OrganizationID=446c364b37e8409cb5e16c9964e42dd7&ForceOrganizationID=' + orgId + '&ForceUserId=' + userId + '&ForceAccountID=' + accountId + '&ForceOpportunityID=' + oppId + '&ForceUrl=' + cancelUrl);
        else
            pr = new PageReference(envLinksSFA.frontierGPDevUrl +'?OrganizationID=446c364b37e8409cb5e16c9964e42dd7&ForceOrganizationID=' + orgId + '&ForceUserId=' + userId + '&ForceAccountID=' + accountId + '&ForceOpportunityID=' + oppId + '&ForceUrl=' + cancelUrl);
        pr.setRedirect(true);   
        return pr;
    }  


    public static testMethod void TestOpp() // had to add because vendor didn't!  -sva
    {
        Opportunity opp = [select id from opportunity limit 1];
        PageReference TestPage = Page.AddProductPage;
        Test.setCurrentPage(TestPage);
        ApexPages.currentPage().getParameters().put('Id', opp.Id);
        ApexPages.StandardController sc = new ApexPages.standardController(opp);
        opportunityProductRedirectExtension NDA = new opportunityProductRedirectExtension(sc);
        NDA.redirect();
   }
    
}