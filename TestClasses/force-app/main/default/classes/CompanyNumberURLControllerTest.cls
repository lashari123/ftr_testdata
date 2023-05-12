@isTest
public class CompanyNumberURLControllerTest{
    
    static testMethod void myUnitTest() {
        Account ac = new Account();
        ac.Name='test';
        ac.Legal_Street__c='Crittenden way';
        ac.Legal_State__c='Rochester';
        ac.Legal_City__c='Newyork'; 
        ac.Legal_Zip__c='14623';
        ac.Legal_Country__c='USA';  
        ac.Cust_Seg_NmTxt__c='medium';
        ac.Acct_Stat_CdTxt__c='c';
         ac.Customer_Number__c='4567890';
        insert ac;
        
        ac.Customer_Number__c='4567899';
        update ac;
        
        hierarchy__c hir = new hierarchy__c ();
        hir.name='test';
        hir.Account_id__c=ac.id;
        hir.Customer_Number__c='4567890';
        insert hir;
        
        Apexpages.currentPage().getParameters().put('id',ac.id);
        
        ApexPages.StandardController  controller = new ApexPages.StandardController(ac);
        CompanyNumberURLController obj = new CompanyNumberURLController(controller);
    }
}