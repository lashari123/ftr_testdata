@isTest
public class uploadAllAttachementTest {
    @isTest
    public static void uploadAllAttachementTestMethod(){
        Contact con= new contact();
        con.LastName= 'Test';
        con.MobilePhone= '9898561236';
        con.Email = 'Test@gmail.com';
        insert con;  
        
        Opportunity opp=new Opportunity();
        opp.name='TestOpp';
        opp.Contact__c= con.id; 
        opp.CloseDate=System.today();
        opp.StageName='Closed/Won';
        opp.Probability = 10;
        opp.Reason_Won_Lost__c ='Duplicate';
        opp.StageName='New';
        opp.Types_of_Product__c='Frontier Anyware';
        insert opp;
        
        Document document;
        
        document = new Document();
        document.Body = Blob.valueOf('Some Text');
        document.ContentType = 'application/pdf';
        document.DeveloperName = 'my_document';
        document.IsPublic = true;
        document.Name = 'My Document';
        document.FolderId = [Select id,Name from Folder where Name =: 'LOAs' limit 1].id;
        insert document;
        
        String recordId = opp.id;      
        
        Blob file;
        Attachment contractattachlist = new Attachment();
        contractattachlist.Name = 'test criticalCustomerPDF';
        contractattachlist.Body = Blob.valueOf('Unit Test Attachment Body');
        contractattachlist.ParentId = opp.id;
        contractattachlist.ContentType = 'Application/pdf';
        insert contractattachlist;
        Boolean critical = True;
        
        PageReference pageRef = Page.criticalCustomerPDF; 
        Test.startTest();
        Test.setCurrentPage(pageRef);
        pageRef.getParameters().put('id',recordId);
        ApexPages.StandardController sc = new ApexPages.standardController(opp);
        uploadAllAttachement upAttachObj= new uploadAllAttachement(sc);
        upAttachObj.attachPDF();
        Test.stopTest();
    }
    
    @isTest
    public static void uploadAllAttachementTestMethod2(){
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
        opp.StageName='Closed/Won';
        opp.Probability = 10;
        opp.Reason_Won_Lost__c ='Duplicate';
        opp.Types_of_Product__c='Smart Voice';   
        insert opp;        
        
        Document document;
        
        document = new Document();
        document.Body = Blob.valueOf('Some Text');
        document.ContentType = 'application/pdf';
        document.DeveloperName = 'my_document';
        document.IsPublic = true;
        document.Name = 'My Document';
        document.FolderId = [select id from folder where name = 'Marketing UCaaS documents'].id;
        insert document;
        
        List<Marketing_Document__c> market = new List<Marketing_Document__c>();
        market = [select id,Opportunity__c from Marketing_Document__c where Opportunity__c =: opp.Id limit 1];
        
        Attachment att = new Attachment();
        att.ParentId = market[0].id;
        att.Name = 'test';
        att.Body = Blob.valueof('test');
        insert att;
        
        String recordId = opp.id; 
        Test.startTest(); 
        ApexPages.StandardController sc = new ApexPages.standardController(opp);
        uploadAllAttachement upAttachObj= new uploadAllAttachement(sc);
        upAttachObj.attachPDF();
        Test.stopTest();
    }
    @isTest
    public static void uploadTestMethod3(){
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
        opp.StageName='Closed/Won';
        opp.Probability = 10;
        opp.Reason_Won_Lost__c ='Duplicate';
        opp.Types_of_Product__c='Frontier Anyware';
        insert opp;
        
        Document document;
        
        document = new Document();
        document.Body = Blob.valueOf('Some Text');
        document.ContentType = 'application/pdf';
        document.DeveloperName = 'my_document';
        document.IsPublic = true;
        document.Name = 'My Document';
        document.FolderId = [select id from folder where name = 'Marketing UCaaS documents'].id;
        insert document;
        
        List<Marketing_Document__c> market = new List<Marketing_Document__c>();
        market = [select id,Opportunity__c from Marketing_Document__c where Opportunity__c =: opp.Id limit 1];
        
        Attachment att = new Attachment();
        att.ParentId = market[0].id;
        att.Name = 'test';
        att.Body = Blob.valueof('test');
        insert att;
        
        String recordId = opp.id;     
        
        Test.startTest();
        
        ApexPages.StandardController sc = new ApexPages.standardController(opp);
        uploadAllAttachement upAttachObj= new uploadAllAttachement(sc);
        upAttachObj.attachPDF();
        Test.stopTest();
    }
    @isTest
    public static void uploadTestMethod4(){
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
        opp.StageName='Closed/Won';
        opp.Probability = 10;
        opp.Reason_Won_Lost__c ='Duplicate';
        opp.Types_of_Product__c='Frontier Anyware';
        insert opp;
        
        List<Marketing_Document__c> market = new List<Marketing_Document__c>();
        market = [select id,Opportunity__c from Marketing_Document__c where Opportunity__c =: opp.Id limit 1];
        
        Document document;
        
        document = new Document();
        document.Body = Blob.valueOf('Some Text');
        document.ContentType = 'application/pdf';
        document.DeveloperName = 'my_document';
        document.IsPublic = true;
        document.Name = 'My Document';
        document.FolderId = [select id from folder where name = 'Marketing UCaaS documents'].id;
        insert document;
        
        String recordId = opp.id;     
        
        Blob file;
        Attachment objAttachment = new Attachment();
        objAttachment.Name = 'Frt Business Associate Agreement Letter_Of_Agency FSA1';
        objAttachment.Body = Blob.valueOf('Unit Test Attachment Body');
        objAttachment.ParentId = opp.id;
        objAttachment.ContentType = 'Application/pdf';
        insert objAttachment;
        Test.startTest();
        
        ApexPages.StandardController sc = new ApexPages.standardController(opp);
        uploadAllAttachement upAttachObj= new uploadAllAttachement(sc);
        upAttachObj.attachPDF();
        Test.stopTest();
    }
    
    
    @isTest
    public static void uploadTestMethod5(){
        Contact con= new contact();
        con.LastName= 'Test';
        con.MobilePhone= '9898561236';
        con.Email = 'Test@gmail.com';
        insert con;  
        
        Opportunity opp=new Opportunity();
        opp.name='TestOpp';
        opp.Contact__c= con.id; 
        opp.Contract_Term_Years__c= 1;
        opp.CloseDate=System.today();
        opp.StageName='Closed/Won';
        opp.Probability = 10;
        opp.Reason_Won_Lost__c ='Duplicate';
        opp.Types_of_Product__c='Frontier Anyware';
        insert opp;
        
        Contract__c  contractList = new Contract__c();
        contractList = [select id,Opportunity__c from Contract__c where Opportunity__c =: opp.Id limit 1];
        
        Blob file;
        Attachment objAttachment = new Attachment();
        objAttachment.Name = 'ContractDoc';
        objAttachment.Body = Blob.valueOf('Unit Test Attachment Body');
        objAttachment.ParentId =  contractList.id;
        objAttachment.ContentType = 'Application/pdf';
        insert objAttachment; 
        
        Test.startTest();
        
        ApexPages.StandardController sc = new ApexPages.standardController(opp);
        uploadAllAttachement upAttachObj= new uploadAllAttachement(sc);
        upAttachObj.attachPDF();
        Test.stopTest();
    }
    
    @isTest
    public static void uploadTestMethod6(){
        Contact con= new contact();
        con.LastName= 'Test';
        con.MobilePhone= '9898561236';
        con.Email = 'Test@gmail.com';
        insert con;  
        
        Opportunity opp=new Opportunity();
        opp.name='TestOpp';
        opp.Contact__c= con.id; 
        opp.Contract_Term_Years__c= 1;
        opp.CloseDate=System.today();
        opp.StageName='Closed/Won';
        opp.Probability = 10;
        opp.Reason_Won_Lost__c ='Duplicate';
        opp.Types_of_Product__c='Frontier Anyware';
        insert opp;
        
        Contract__c  contractList = new Contract__c();
        contractList = [select id,Opportunity__c from Contract__c where Opportunity__c =: opp.Id limit 1];
        
        Blob file;
        Attachment objAttachment = new Attachment();
        objAttachment.Name = 'ContractPdf';
        objAttachment.Body = Blob.valueOf('Unit Test Attachment Body');
        objAttachment.ParentId =  contractList.id;
        objAttachment.ContentType = 'Application/pdf';
        insert objAttachment; 
        
        Test.startTest();
        
        ApexPages.StandardController sc = new ApexPages.standardController(opp);
        uploadAllAttachement upAttachObj= new uploadAllAttachement(sc);
        upAttachObj.attachPDF();
        Test.stopTest();
    }
    
    @isTest
    public static void uploadTestMethod7(){
        Contact con= new contact();
        con.LastName= 'Test';
        con.MobilePhone= '9898561236';
        con.Email = 'Test@gmail.com';
        insert con;  
        
        Opportunity opp=new Opportunity();
        opp.name='TestOpp';
        opp.Contact__c= con.id; 
        opp.Contract_Term_Years__c= 1;
        opp.CloseDate=System.today();
        opp.StageName='Closed/Won';
        opp.Probability = 10;
        opp.Reason_Won_Lost__c ='Duplicate';
        opp.Types_of_Product__c='Frontier Anyware';
        insert opp;
        
        Document document;
        
        document = new Document();
        document.Body = Blob.valueOf('Some Text');
        document.ContentType = 'application/pdf';
        document.DeveloperName = 'my_document';
        document.IsPublic = true;
        document.Name = 'My Document';
        document.FolderId = [select id from folder where name = 'Marketing UCaaS documents'].id;
        insert document;
        
        Marketing_Document__c market = new Marketing_Document__c();
        market = [select id,Opportunity__c from Marketing_Document__c where Opportunity__c =: opp.Id limit 1];
        
        Blob file;
        Attachment objAttachment = new Attachment();
        objAttachment.Name = 'ContractPdf';
        objAttachment.Body = Blob.valueOf('Unit Test Attachment Body');
        objAttachment.ParentId =  market.id;
        objAttachment.ContentType = 'Application/pdf';
        insert objAttachment; 
        
        Test.startTest();
        
        ApexPages.StandardController sc = new ApexPages.standardController(opp);
        uploadAllAttachement upAttachObj= new uploadAllAttachement(sc);
        upAttachObj.attachPDF();
        Test.stopTest();
    }
    @isTest
    public static void uploadTestMethod8(){
        Contact con= new contact();
        con.LastName= 'Test';
        con.MobilePhone= '9898561236';
        con.Email = 'Test@gmail.com';
        insert con;  
        
        Opportunity opp=new Opportunity();
        opp.name='TestOpp';
        opp.Contact__c= con.id; 
         opp.Contract_Term_Years__c= 1;
        opp.CloseDate=System.today();
        opp.StageName='Closed/Won';
        opp.Probability = 10;
        opp.Reason_Won_Lost__c ='Duplicate';
        opp.Types_of_Product__c='Frontier Anyware';
        insert opp;
        
        Document document = new Document();
        document.Body = Blob.valueOf('Some Text');
        document.ContentType = 'application/pdf';
        document.DeveloperName = 'my_document';
        document.IsPublic = true;
        document.Name = 'My Document';
        document.FolderId = [select id from folder where name = 'LOAs'].id;
        insert document;
        
        LOAs__c loa = new LOAs__c();
        loa = [select id,Opportunity__c from LOAs__c where Opportunity__c =: opp.Id limit 1];
        Blob file;
        Attachment objAttachment = new Attachment();
        objAttachment.Name = 'Letter_Of_Agency';
        objAttachment.Body = Blob.valueOf('Unit Test Attachment Body');
        objAttachment.ParentId =  loa.id;
        objAttachment.ContentType = 'Application/pdf';
        insert objAttachment;
        update objAttachment;
        
        Test.startTest();
        
        ApexPages.StandardController sc = new ApexPages.standardController(opp);
        uploadAllAttachement upAttachObj= new uploadAllAttachement(sc);
        upAttachObj.attachPDF();
        Test.stopTest();
        
    }
    
     @isTest
    public static void uploadTestMethod9(){
        Contact con= new contact();
        con.LastName= 'Test';
        con.MobilePhone= '9898561236';
        con.Email = 'Test@gmail.com';
        insert con;  
        
        Opportunity opp=new Opportunity();
        opp.name='TestOpp';
        opp.Contact__c= con.id; 
         opp.Contract_Term_Years__c= 1;
        opp.CloseDate=System.today();
        opp.StageName='Closed/Won';
        opp.Probability = 10;
        opp.Reason_Won_Lost__c ='Duplicate';
        opp.Types_of_Product__c='Frontier Anyware';
        insert opp;
        
        Document document = new Document();
        document.Body = Blob.valueOf('Some Text');
        document.ContentType = 'application/pdf';
        document.DeveloperName = 'my_document';
        document.IsPublic = true;
        document.Name = 'My Document';
        document.FolderId = [select id from folder where name = 'LOAs'].id;
        insert document;
        
        LOAs__c loa = new LOAs__c();
        loa = [select id,Opportunity__c from LOAs__c where Opportunity__c =: opp.Id limit 1];
        Blob file;
        Attachment objAttachment = new Attachment();
        objAttachment.Name = 'test';
        objAttachment.Body = Blob.valueOf('Unit Test Attachment Body');
        objAttachment.ParentId =  loa.id;
        objAttachment.ContentType = 'Application/pdf';
        insert objAttachment;
        
        
        Test.startTest();
        
        ApexPages.StandardController sc = new ApexPages.standardController(opp);
        uploadAllAttachement upAttachObj= new uploadAllAttachement(sc);
        upAttachObj.attachPDF();
        Test.stopTest();
        
    }
    
     @isTest
    public static void uploadTestMethod10(){
        Contact con= new contact();
        con.LastName= 'Test';
        con.MobilePhone= '9898561236';
        con.Email = 'Test@gmail.com';
        insert con;  
        
        Opportunity opp=new Opportunity();
        opp.name='TestOpp';
        opp.Contact__c= con.id; 
         opp.Contract_Term_Years__c= 1;
        opp.CloseDate=System.today();
        opp.StageName='Closed/Won';
        opp.Probability = 10;
        opp.Reason_Won_Lost__c ='Duplicate';
        opp.Types_of_Product__c='Smart Voice';
        insert opp;
        
        Document document = new Document();
        document.Body = Blob.valueOf('Some Text');
        document.ContentType = 'application/pdf';
        document.DeveloperName = 'my_document';
        document.IsPublic = true;
        document.Name = 'My Document';
        document.FolderId = [select id from folder where name = 'SVoiceMarketing'].id;
        insert document;
        
        Marketing_Document__c markt = new Marketing_Document__c();
        markt = [select id,Opportunity__c from Marketing_Document__c where Opportunity__c =: opp.Id limit 1];
        Blob file;
        Attachment objAttachment = new Attachment();
        objAttachment.Name = 'test';
        objAttachment.Body = Blob.valueOf('Unit Test Attachment Body');
        objAttachment.ParentId =  markt.id;
        objAttachment.ContentType = 'Application/pdf';
        insert objAttachment;
        
        Contract__c  contractList = new Contract__c();
        contractList = [select id,Opportunity__c from Contract__c where Opportunity__c =: opp.Id limit 1];
        
        //Blob file;
        List<Attachment>attlst = new List<Attachment>();
        Attachment att = new Attachment();
        att.Name = 'test';
        att.Body = Blob.valueOf('Unit Test Attachment Body');
        att.ParentId =  contractList.id;
        att.ContentType = 'Application/pdf';
        attlst.add(att);
        
        Attachment objAttachmen1t = new Attachment();
        objAttachmen1t.Name = 'FirstSmartVoiceContractPdf';
        objAttachmen1t.Body = Blob.valueOf('Unit Test Attachment Body');
        objAttachmen1t.ParentId =  contractList.id;
        objAttachmen1t.ContentType = 'Application/pdf';
        attlst.add(objAttachmen1t);
        
        Attachment objAttachmen2t = new Attachment();
        objAttachmen2t.Name = 'SecondSmartVoiceContractPdf';
        objAttachmen2t.Body = Blob.valueOf('Unit Test Attachment Body');
        objAttachmen2t.ParentId =  contractList.id;
        objAttachmen2t.ContentType = 'Application/pdf';
        attlst.add(objAttachmen2t);
        insert attlst; 
        
        Test.startTest();
        ApexPages.StandardController sc = new ApexPages.standardController(opp);
        uploadAllAttachement upAttachObj= new uploadAllAttachement(sc);
        upAttachObj.attachPDF();
        Test.stopTest();
    }
    
    @isTest
    public static void uploadTestMethod11(){
        Contact con= new contact();
        con.LastName= 'Test';
        con.MobilePhone= '9898561236';
        con.Email = 'Test@gmail.com';
        insert con;  
        
        Opportunity opp=new Opportunity();
        opp.name='TestOpp';
        opp.Contact__c= con.id; 
        opp.Contract_Term_Years__c= 1;
        opp.CloseDate=System.today();
        opp.StageName='Closed/Won';
        opp.Probability = 10;
        opp.Reason_Won_Lost__c ='Duplicate';
        opp.Types_of_Product__c='Smart Voice';
        insert opp;
        
        Contract__c  contractList = new Contract__c();
        contractList = [select id,Opportunity__c from Contract__c where Opportunity__c =: opp.Id limit 1];
        
        //Blob file;
        Attachment att = new Attachment();
        att.Name = 'test';
        att.Body = Blob.valueOf('Unit Test Attachment Body');
        att.ParentId =  contractList.id;
        att.ContentType = 'Application/pdf';
        insert att;
        
        Attachment att1 = new Attachment();
        att1.Name = 'test';
        att1.Body = Blob.valueOf('Unit Test Attachment Body');
        att1.ParentId =  contractList.id;
        att1.ContentType = 'Application/pdf';
        insert att1;
        
        Test.startTest();
        ApexPages.StandardController sc = new ApexPages.standardController(opp);
        uploadAllAttachement upAttachObj= new uploadAllAttachement(sc);
        upAttachObj.attachPDF();
        Test.stopTest();
    }
    
}