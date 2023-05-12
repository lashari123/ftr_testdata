@isTest
public class uploadProudctpdfTest {
    @isTest
    public static void uploadProudctpdfTestMethod()
    {  
         
       /* Account acc=new Account();
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
        insert con;  
     
        Opportunity opp=new Opportunity();
        opp.name='TestOpp';
        opp.Contact__c= con.id; 
       // opp.AccountId=acc.id;   
        opp.Contract_Term_Years__c=1;
        opp.CloseDate=System.today();
         opp.StageName='Closed/Won';
        opp.Probability = 10;
        opp.Reason_Won_Lost__c ='Duplicate';
        //opp.Reason_Won_Lost__c=' Defining '; 
        opp.Types_of_Product__c='Frontier Anyware';
        insert opp;
        
        String recordId = opp.id;     
        
        Blob file;
        Attachment objAttachment = new Attachment();
        objAttachment.Name = 'test Attachment';
        objAttachment.Body = Blob.valueOf('Unit Test Attachment Body');
        objAttachment.ParentId = opp.id;
        objAttachment.ContentType = 'Application/pdf';
         insert objAttachment;
         PageReference pageRef = Page.UCaaSpdf; 
   /*if (Test.IsRunningTest())
   {
        file=Blob.valueOf('Unit Test Attachment Body');
   }
   else
   {
        file=pageRef.getContent();
   }  */
        Test.startTest();
        Test.setCurrentPage(pageRef);
        pageRef.getParameters().put('id',recordId);
        ApexPages.StandardController sc = new ApexPages.standardController(opp);
        uploadProudctpdf upProdObj= new uploadProudctpdf(sc);
        upProdObj.attachPDF();
        Test.stopTest();
        
    }
     @isTest
    public static void uploadProudctpdfTestMethod1()
    {  
        
        
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
        insert con;  
     
        Opportunity opp=new Opportunity();
        opp.name='TestOpp';
        opp.Contact__c= con.id; 
        //opp.AccountId=acc.id;   
        opp.Contract_Term_Years__c=1;
        opp.CloseDate=System.today();
          opp.StageName='Closed/Won';
        opp.Probability = 10;
        opp.Reason_Won_Lost__c ='Duplicate';
        //opp.Reason_Won_Lost__c=' Defining '; 
        opp.Types_of_Product__c='Smart Voice';
        insert opp;
        
        String recordId = opp.id;     
        
        Blob file;
        Attachment objAttachment = new Attachment();
        objAttachment.Name = 'test Attachment';
        objAttachment.Body = Blob.valueOf('Unit Test Attachment Body');
        objAttachment.ParentId = opp.id;
        objAttachment.ContentType = 'Application/pdf';
        insert objAttachment;
         PageReference pageRef = Page.UCaaSpdf; 
  
        Test.startTest();
        Test.setCurrentPage(pageRef);
        pageRef.getParameters().put('id',recordId);
        ApexPages.StandardController sc = new ApexPages.standardController(opp);
        uploadProudctpdf upProdObj= new uploadProudctpdf(sc);
        upProdObj.attachPDF();
        Test.stopTest();
        
    }
}