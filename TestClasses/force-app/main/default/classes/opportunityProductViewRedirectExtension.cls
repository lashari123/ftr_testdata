public with sharing class opportunityProductViewRedirectExtension {
    Id oppId; 
    Id oppItemId;
    string GPQuoteProductId;
    Id OrgId;
    Id accountId; 
    Id userId;
    string cancelUrl; 
    PageReference viewPage;
    string strorgid;
    Boolean bProd = false;
    String server;
    
    public opportunityProductViewRedirectExtension(ApexPages.StandardController  controller)
    {  
        
        viewPage = controller.view();
        OpportunityLineItem oppitem;   
        Opportunity opp;   
        oppitem = [select id, opportunityId, GPQuoteProductId__c from OpportunityLineItem where id = :controller.getId()];
        oppItemId = oppitem.Id;
        GPQuoteProductId = oppitem.GPQuoteProductId__c;        
        opp = [select id, accountId from Opportunity where id = :oppitem.OpportunityId];                
        oppId = opp.Id;        
        accountId = opp.AccountId;    
        orgId = UserInfo.getOrganizationId();        
        strorgid =orgId;
        userId =UserInfo.getUserId();   
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
        if (GPQuoteProductId != null)
        {
            if (bProd)
                pr = new PageReference(envLinksSFA.frontierGPProdUrl +'?OrganizationID=446c364b37e8409cb5e16c9964e42dd7&ForceOrganizationID=' + orgId + '&ForceUserId=' + userId + '&ForceAccountID=' + accountId + '&ForceOpportunityID=' + oppId + '&ForceOpportunityItemID=' + oppItemId +'&GPProductID=' + GPQuoteProductId +'&Action=View&ForceUrl=' + cancelUrl);
            else pr = new PageReference(envLinksSFA.frontierGPDevUrl + '?OrganizationID=446c364b37e8409cb5e16c9964e42dd7&ForceOrganizationID=' + orgId + '&ForceUserId=' + userId + '&ForceAccountID=' + accountId + '&ForceOpportunityID=' + oppId + '&ForceOpportunityItemID=' + oppItemId +'&GPProductID=' + GPQuoteProductId +'&Action=View&ForceUrl=' + cancelUrl);
            
        } 
        else
        {
            string editUrl = 'https://' + server + '.salesforce.com/' + oppItemId + '?retUrl='+cancelUrl;
            pr = new PageReference(editUrl);
        }

        pr.setRedirect(true); 
        return pr;

    }
    
    public static testMethod void TestOpp() // had to add because vendor didn't!  -sva
    {
        OpportunityLineItem o = [select id from OpportunityLineItem limit 1];   
        PageReference TestPage = Page.ViewProductPage;
        Test.setCurrentPage(TestPage);
        ApexPages.currentPage().getParameters().put('Id', o.Id);
        ApexPages.StandardController sc = new ApexPages.standardController(o);
        opportunityProductViewRedirectExtension NDA = new opportunityProductViewRedirectExtension(sc);
        NDA.redirect();
        NDA.GPQuoteProductId = 'xx';
        NDA.redirect();
   }
    
}