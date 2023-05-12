public class Childrecord {
    Public List<OpportunityLineItem> opplinelist {get;set;}
    public String  childid {get;set;}
    public  String  headerdata{get;set;}
    public string urlvalue{get;set;}
    public string url{get;set;}
    public Childrecord(ApexPages.StandardController controller){
        Id lineid = ApexPages.currentPage().getParameters().get('id');
        headerdata= ApexPages.currentPage().getHeaders().get('Host');
        opplinelist = new List<OpportunityLineItem>();
        childid = '';
        System.debug('==lineid===='+lineid);
        opplinelist = [Select id,Product_Name__c,Parent_ID__c,Part_Number__c,Unit_Price__c,Quantity,TotalPrice from OpportunityLineItem where Parent_ID__c =: lineid];
        System.debug('====opplinelist====='+opplinelist);
    }
    public PageReference  redircet(){
        childid = ApexPages.currentPage().getParameters().get('childid');
        System.debug('===childid==='+childid);
        String uiThemeDisplayed = UserInfo.getUiThemeDisplayed();
        System.debug('url ==='+ApexPages.currentPage().getHeaders().get('Host'));
        if(uiThemeDisplayed == 'Theme4d'){
           PageReference pageRef = new PageReference('https://'+ApexPages.currentPage().getHeaders().get('Host')+'/'+childid); 
            //PageReference pageRef = new PageReference('https://ftr--ucaastest.lightning.force.com/lightning/r/OpportunityLineItem/'+childid+'/view');
            return pageRef;
        }else{
            //PageReference pageRef = new PageReference('https://ftr--ucaastest.cs45.my.salesforce.com/'+childid);
            PageReference pageRef = new PageReference('https://'+ApexPages.currentPage().getHeaders().get('Host')+'/'+childid); 
            return pageRef;
        }
        
    }
}