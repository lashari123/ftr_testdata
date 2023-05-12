@isTest
public class EmailSendControllerTest {
    @isTest
    public static void EmailSendControllerTestMethod()
    {  
        
        Contact con= new contact();
        con.LastName= 'Test';
        con.MobilePhone= '9898561236';
        con.Email = 'Test@gmail.com';
        insert con;   
        Id RecordTypeIdContact = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Equote').getRecordTypeId();
        
        Opportunity opp=new Opportunity();
        opp.name='TestOpp';
        opp.Contact__c= con.id;
        opp.Contract_Term_Years__c=1;
        opp.CloseDate=System.today();
        opp.StageName='New';
        opp.Reason_Won_Lost__c=' Defining '; 
        opp.RecordtypeId  = RecordTypeIdContact;
        insert opp;
        String recordId = opp.id;
        
        User usr=new User();
        usr.Id=opp.OwnerId;
        
        EmailTemplate et = new EmailTemplate();
        et=[SELECT Id,subject,body,HtmlValue,CreatedDate FROM EmailTemplate WHERE developername = 'Equote_Tool' LIMIT 1];
        
        Blob file = Blob.valueOf('Unit Test Attachment Body');
        Attachment objAttachment = new Attachment();
        objAttachment.Name = 'test Attachment';
        objAttachment.Body = file;
        objAttachment.ParentId = opp.id;
        objAttachment.ContentType = 'Application/pdf';
        Insert objAttachment;
     
        ContentVersion testContent = new ContentVersion(
            Title='AttamentDetails',
            Description='testDescription',
            ContentLocation = 'S',
            PathOnClient = 'test12345',
            VersionData = file);
        insert testContent;
        
        ContentDocumentLink ducumentsLink = new ContentDocumentLink(
            ContentDocumentId = [SELECT Id, ContentDocumentId FROM ContentVersion WHERE Id =:testContent.Id].ContentDocumentId,
            ShareType = 'V',
            LinkedEntityId = recordId,
            Visibility = 'AllUsers');
        insert ducumentsLink;
    
        
        Test.startTest();
        ApexPages.StandardController sc = new ApexPages.standardController(opp); 
        ApexPages.currentPage().getParameters().put('id',recordId);
        List<Opportunity> oppQuery = EmailSendController.getEmailContact(recordId);
        EmailSendController.getselectOptions();
        EmailSendController.getOwner(recordId);
        EmailSendController.getContact(recordId);
        EmailSendController.getLegalAttachment(recordId);
        EmailSendController.getContractAttachment(recordId);
        EmailSendController.getLOAsAttachment(recordId);
        EmailSendController.getOrderDocumentAttachment(recordId);
        EmailSendController.getMarketingAttachment(recordId);
        EmailSendController.getOperationAttachment(recordId);
        EmailSendController.saveChunk(opp.id,'testAttachment',file.toString(),'jpg',objAttachment.Id);
       // EmailSendController.saveTheFile(con.id,'testAttachment',file.toString(),'jpg');
        EmailSendController.getContentDocumentLink(recordId);
        EmailSendController.getContact(recordId);
        EmailSendController.getLegalAttachment(recordId);
        EmailSendController.getContractAttachment(recordId);
        EmailSendController.getLOAsAttachment(recordId);
        EmailSendController.templateSubject (); 
       EmailSendController.sendMailMethod(new String[]{'test@gmail.com'},new String[]{ducumentsLink.Id},recordId, 'name',et.Subject, 'ownerName', String.valueOf(opp.Contract_Term_Years__c),et.Body);
        Test.stopTest();
        
    }
      @isTest
    public static void EmailSendControllerTestMethod1()
    {  
        
        Contact con= new contact();
        con.LastName= 'Test';
        con.MobilePhone= '9898561236';
        con.Email = 'Test@gmail.com';
        insert con;       
        
        Id RecordTypeIdContact = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Equote').getRecordTypeId();
        
        Opportunity opp=new Opportunity();
        opp.name='TestOpp';
        opp.Contact__c= con.id;
        opp.Contract_Term_Years__c=1;
        opp.CloseDate=System.today();
        opp.StageName='New';
        opp.Reason_Won_Lost__c=' Defining '; 
         opp.RecordtypeId = RecordTypeIdContact;
        insert opp;
        String recordId = opp.id;
        
       Blob file = Blob.valueOf('Unit Test Attachment Body');
        Attachment objAttachment = new Attachment();
        objAttachment.Name = 'fileName';
        objAttachment.Body = file;
        objAttachment.ParentId = opp.id;
        objAttachment.ContentType = 'Application/pdf';
        Insert objAttachment;
     
     
        
        Test.startTest();
        ApexPages.StandardController sc = new ApexPages.standardController(opp); 
        ApexPages.currentPage().getParameters().put('id',recordId);
        List<Opportunity> oppQuery = EmailSendController.getEmailContact(recordId);
   
        EmailSendController.saveTheFile(opp.id,objAttachment.Name ,file.toString(),objAttachment.ContentType);
      
        Test.stopTest();
        
    }
    
}