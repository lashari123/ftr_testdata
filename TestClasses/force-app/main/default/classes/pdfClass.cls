public class pdfClass {
    public Opportunity opp {get;set;} 
    public Contact con{get;set;}
    public list<Site__c> site{get;set;}
    public Site__c sitePrime{get;set;}
    public string nowDate{get;set;}
    public Account acc{get;set;}
    public pdfClass(ApexPages.StandardController controller) {
        //mapCat = new Map<String,map<String,List<OpportunityLineItem>>>();
        Id oppId = ApexPages.currentPage().getParameters().get('Id');
        acc = new Account();
           
        System.debug('----Opp Id----'+oppId);
        opp = new Opportunity();
        con = new Contact();
        site = new list<Site__c>();
        if(oppId != null) {
            
            opp = [Select id,Contact__c,Pricebook2Id,Contract_Term_Years__c,accountId from Opportunity where id =: oppId];
            System.debug('====opp===='+opp);
            if( opp.Contact__c != null) { 
                con = [Select id,Name,Phone,Email from Contact where id=: opp.Contact__c limit 1];
            }
            if( opp.accountId != null) {
                acc = [Select id,Name,Phone,BillingStreet, BillingCity, BillingState, BillingPostalCode,BillingCountry, BillingLatitude, BillingLongitude FROM Account where id=:opp.AccountId limit 1];
           system.debug('ss============acc=========='+acc);
            }
            
            
            
            System.debug('====opp===='+opp);
            if( opp.Contact__c != null ) { 
                con = [Select id,Name,Phone,Email from Contact where id=: opp.Contact__c limit 1];
                site = [select id, Site_Street__c,Site_zipcode__c,Site_Country__c,Site_city__c,State__c,Primary__c,Opportunity__c from site__c where Opportunity__c =: oppId ];
                if( opp.Contact__c != null ) { 
                    for(site__c s :site){
                        if(s.Primary__c == true){
                            sitePrime= s;
                        }
                        else{
                            sitePrime= s;  
                        }    
                    }
                }
            }
            //Datetime yourDate = Datetime.now();
            //String nowDate = yourDate.format('dd/MM/yyyy');
            // Datetime dt = system.today();
            //String nowDate = dt.format('MM/dd/yyyy');
            nowDate = Datetime.now().format('dd/MM/yyyy');
            System.debug('===nowDate==='+nowDate);
        }
    }
    
}