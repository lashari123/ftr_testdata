@isTest
public class PrimarySiteAddressTest {     
    @isTest
    public static void PrimarySiteAddressTestMethod() {
       
        Opportunity opp=new Opportunity();
        opp.name='TestOpp';
        opp.Contract_Term_Years__c=1;
        opp.CloseDate=System.today();
        opp.StageName='New';
        opp.Reason_Won_Lost__c=' Defining '; 
        opp.Company_size__c=5;
       
        insert opp;
       
        Site__c site=new Site__c();
        site.Site_Name__c='site';
        site.opportunity__c=opp.id;
        site.PoE_option__c='Switch';
        site.Primary__c=true; 
        insert site;
        
        
      
    }
    
}