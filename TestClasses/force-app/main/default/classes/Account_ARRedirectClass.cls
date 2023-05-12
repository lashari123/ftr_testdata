public class Account_ARRedirectClass {
    public String AccountId  {get; set;}   
    
    public Account_ARRedirectClass () {
        AccountId = ApexPages.currentPage().getParameters().get('accoutId');
    }

    public PageReference RedirectAR() {
        String userAgent = ApexPages.currentPage().getHeaders().get('USER-AGENT');
        System.debug('userAgent: '+userAgent);
        
        if(userAgent.contains('MSIE 8.0')) {
            PageReference pageRef = new PageReference('/apex/Account_AccountReceivableExamplePage?accoutId='+AccountId);
            return pageRef;
        } else {
            PageReference pageRef = new PageReference('/apex/Account_AccountsReceivableInformation?accoutId='+AccountId);
            return pageRef;
        }
        return null;
    }
}