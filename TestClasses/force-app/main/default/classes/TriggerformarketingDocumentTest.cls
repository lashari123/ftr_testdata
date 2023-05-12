@isTest
public class TriggerformarketingDocumentTest {
@isTest
public static void TriggerformarketingDocumentTestMethod(){
     /*Account acc=new Account();
        acc.Name='AccountTest';
        acc.BillingStreet='Palasiya'; 
        acc.BillingCity='Indore';
        acc.BillingState='Alberta';
        acc.BillingCountry='Canada';
        acc.BillingLatitude=+90 ;
        acc.BillingLongitude=+180;
        insert acc;*/
        
        Contact con= new contact();
        con.LastName= 'Test';
        con.MobilePhone= '9898561236';
        con.Email = 'Test@gmail.com';
           
        Opportunity opp=new Opportunity();
        opp.name='TestOpp';
        opp.Contact__c= con.id;
        opp.Contract_Term_Years__c=1;
        opp.CloseDate=System.today();
        opp.StageName='New';
       // opp.AccountId=acc.id;
      //  opp.Reason_Won_Lost__c=' Defining '; 
        opp.Company_size__c=5;
         insert opp;
        
      

}
}