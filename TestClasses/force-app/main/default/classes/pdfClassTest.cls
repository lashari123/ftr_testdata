@isTest
public class pdfClassTest {
 @isTest
    public static void m1()
    {  Test.startTest();
        Contact con= new contact();
        con.LastName= 'Test';
        con.MobilePhone= '9898561236';
        con.Email = 'Test@gmail.com';
        insert con;
        Opportunity opp=new Opportunity();
        opp.name='TestOpp';
        opp.Contact__c= con.id;
        opp.Contract_Term_Years__c=1;
        opp.CloseDate=System.today();
        opp.StageName='New';
        //opp.AccountId=acc.id;
        opp.Reason_Won_Lost__c=' Defining '; 
        opp.Company_size__c=5;
        insert opp;
        String recordId = opp.id;
        
        Site__c site=new Site__c();
        site.Site_Name__c='SiteTest';
        site.opportunity__c=opp.id;
        site.PoE_option__c='Switch';
        site.Primary__c=True;
        site.Site_Number__c = 1;
        insert site;
        
        ApexPages.StandardController sc = new ApexPages.standardController(opp); 
        ApexPages.currentPage().getParameters().put('id',opp.id);
        pdfClass pdf = new pdfClass(sc);
        Test.stopTest();
    }
}