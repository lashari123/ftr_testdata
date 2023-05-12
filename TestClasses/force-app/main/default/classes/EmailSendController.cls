public with sharing class EmailSendController {
    
     @AuraEnabled
    public static String fetchit(){
        string urler = URL.getSalesforceBaseUrl().toExternalForm();
        System.debug('urler===='+urler);
        return (urler);
    } 
    
    @AuraEnabled 
    public static List<Opportunity> getEmailContact(String recordId){
        List<Opportunity> oppList = new List<Opportunity>();
        oppList = [select id,Contract_Term_Years__c,Contact__r.Email,Contact__r.FirstName,Contact__r.LastName from Opportunity where id =:recordId limit 1];  
        System.debug('====oppList=='+oppList);
        return oppList;
    }
       @AuraEnabled 
 public static List < Contact > getselectOptions() {
        List<Contact> conList = new List<Contact>();
           conList = [select id,Email from Contact] ;
        return conList;
    }
     @AuraEnabled 
    public static User getOwner(String recordId){
        User user = new User();
        Opportunity opp = new Opportunity();
        opp = [select id,OwnerId from Opportunity where id =:recordId limit 1];  
        System.debug('===opp==='+opp);
        user = [select id,Name from User where id =: opp.OwnerId limit 1];  
        System.debug('==v======'+user);
        return user;
    }
 @AuraEnabled 
    public static Id saveChunk(Id parentId, String fileName, String base64Data, String contentType, String fileId) {
        // check if fileId id ''(Always blank in first chunk), then call the saveTheFile method,
        //  which is save the check data and return the attachemnt Id after insert, 
        //  next time (in else) we are call the appentTOFile() method
        //   for update the attachment with reamins chunks   
        if (fileId == '') {
            fileId = saveTheFile(parentId, fileName, base64Data, contentType);
        } else {
            appendToFile(fileId, base64Data);
        }
 
        return Id.valueOf(fileId);
    }
 
    public static Id saveTheFile(Id parentId, String fileName, String base64Data, String contentType) {
        base64Data = EncodingUtil.urlDecode(base64Data, 'UTF-8');
  system.debug('====base64Data====='+ base64Data);
        system.debug('====parentId====='+ parentId);
        system.debug('====fileName====='+ fileName);
        system.debug('====contentType====='+ contentType);
            list<Contract__c> contractList = new list<Contract__c>();
                    List<Attachment> contractattachlist = new List<Attachment>();
        if(parentId != null){
            contractList = [select id,Opportunity__c from Contract__c where Opportunity__c =: parentId limit 1];
        }
        
        Attachment oAttachment = new Attachment();
        if(contractList[0].id != null){
        oAttachment.parentId = contractList[0].id;
        }
        oAttachment.Body = EncodingUtil.base64Decode(base64Data);
        oAttachment.Name = fileName;
        oAttachment.ContentType = contentType;
 system.debug('====oAttachment====='+ oAttachment);
        insert oAttachment;
 
        return oAttachment.Id;
    }
 
    private static void appendToFile(Id fileId, String base64Data) {
        base64Data = EncodingUtil.urlDecode(base64Data, 'UTF-8');
 
        Attachment a = [
            SELECT Id, Body
            FROM Attachment
            WHERE Id =: fileId
        ];
 
        String existingBody = EncodingUtil.base64Encode(a.Body);
 
        a.Body = EncodingUtil.base64Decode(existingBody + base64Data);
 
        update a;
    }
     @AuraEnabled 
    public static Opportunity getContact(String recordId){
        Opportunity  opp  = new  Opportunity();
        opp = [select id,Contact__r.Email,Contact__r.FirstName,Contact__r.LastName from Opportunity where id =:recordId limit 1];  
        return opp;
    }
      @AuraEnabled 
    public static List<Attachment> getLegalAttachment(String recordId){
        List<Attachment> attachments = new List<Attachment>();
          Legal__c legaldoc = new Legal__c();
        legaldoc = [select id,Opportunity__c from Legal__c where Opportunity__c =: recordId limit 1];
         attachments = [SELECT id,name FROM Attachment WHERE ParentID =: legaldoc.id ];
        return attachments;
    }
      @AuraEnabled 
    public static List<Attachment> getContractAttachment(String recordId){
        List<Attachment> attachments = new List<Attachment>();
          Contract__c contractdoc = new Contract__c();
        contractdoc = [select id,Opportunity__c from Contract__c where Opportunity__c =: recordId limit 1];
         attachments = [SELECT id,name FROM Attachment WHERE ParentID =: contractdoc.id ];
        return attachments;
    }
       @AuraEnabled 
    public static List<Attachment> getLOAsAttachment(String recordId){
        List<Attachment> attachments = new List<Attachment>();
          LOAs__c LOAsdoc = new LOAs__c();
        LOAsdoc = [select id,Opportunity__c from LOAs__c where Opportunity__c =: recordId limit 1];
         attachments = [SELECT id,name FROM Attachment WHERE ParentID =: LOAsdoc.id ];
        return attachments;
    }
       @AuraEnabled 
    public static List<Attachment> getOrderDocumentAttachment(String recordId){
        List<Attachment> attachments = new List<Attachment>();
          Order_Document__c OrderDod = new Order_Document__c();
        OrderDod = [select id,Opportunity__c from Order_Document__c where Opportunity__c =: recordId limit 1];
         attachments = [SELECT id,name FROM Attachment WHERE ParentID =: OrderDod.id ];
        return attachments;
    }
       @AuraEnabled 
    public static List<Attachment> getMarketingAttachment(String recordId){
        List<Attachment> attachments = new List<Attachment>();
             Marketing_Document__c document = new Marketing_Document__c();
        document = [Select id,Opportunity__c from Marketing_Document__c where Opportunity__c =: recordId limit 1];
             attachments = [SELECT id,name FROM Attachment WHERE ParentID =: document.id ];
        System.debug('-----'+attachments);
        return attachments;
    }
    @AuraEnabled 
    public static List<Attachment> getOperationAttachment(String recordId){
        List<Attachment> attachments = new List<Attachment>();
           Marketing_Document__c document = new Marketing_Document__c();
        document = [Select id,Opportunity__c from Marketing_Document__c where Opportunity__c =: recordId limit 1];
        attachments = [SELECT id,name FROM Attachment WHERE ParentID =: recordId and name like '%Quote%' order by createdDate DESC limit 1 ];
        return attachments;
    }
    
    @AuraEnabled 
    public static List<ContentDocumentLink> getContentDocumentLink(String recordId){
        List<ContentDocumentLink> dumentslst = new List<ContentDocumentLink>();  
        List<ContentDocumentLink> ducumentsLink = new List<ContentDocumentLink>();
        Marketing_Document__c document = new Marketing_Document__c();
        document = [Select id,Opportunity__c from Marketing_Document__c where Opportunity__c =: recordId limit 1];
        ducumentsLink = [SELECT Id, LinkedEntityId, ContentDocumentId,Visibility, IsDeleted, ShareType,ContentDocument.Title,ContentDocument.createdDate, ContentDocument.FileType FROM ContentDocumentLink WHERE LinkedEntityId =: recordId];
        dumentslst = [SELECT Id, LinkedEntityId, ContentDocumentId,Visibility, IsDeleted, ShareType,ContentDocument.Title,ContentDocument.createdDate, ContentDocument.FileType FROM ContentDocumentLink WHERE LinkedEntityId =: document.id];
        System.debug('===ducumentsLink==='+ducumentsLink);
         if(dumentslst != null && !dumentslst.isEmpty() && ducumentsLink != null && !ducumentsLink.isEmpty()){
        for(ContentDocumentLink attch: dumentslst){
            ducumentsLink.add(attch);
        }
       }
        return ducumentsLink;
    }
    
    @AuraEnabled 
    public static EmailTemplate templateSubject(){
        EmailTemplate et = new EmailTemplate();
        et=[SELECT Id,subject,body,HtmlValue,CreatedDate FROM EmailTemplate WHERE developername = 'Equote_Tool' LIMIT 1];
        System.debug('===body==='+et.body);
        return et;
    }
    @AuraEnabled 
   public static void sendMailMethod(list<string> mMail ,list<string> mAttach,string recordId,string name,string subject,string ownerName,string year,string emailbody){
       
       system.debug('--------------mattach------------'+mAttach);
        EmailTemplate et = new EmailTemplate();
        et=[SELECT Id,subject,body,HtmlValue FROM EmailTemplate WHERE developername = 'Equote_Tool' LIMIT 1];
        system.debug('============et==========='+et);
        
        set<string> emails = new set<string>();
            emails.addAll(mAttach);
        List<Messaging.SingleEmailMessage> mails =  new List<Messaging.SingleEmailMessage>();     
        List<Messaging.Emailfileattachment> fileAttachments = new List<Messaging.Emailfileattachment>();
        List<Attachment> attach = new List<Attachment>();
        List<ContentDocumentLink> ducumentsLink = new List<ContentDocumentLink>();
        
        if(mMail != null ) {
            // Step 1: Create a new Email
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            
            // Step 2: Set list of people who should get the email
            List<String> sendTo = new List<String>();
            for(string e : mMail){
                 sendTo.add(e);
            }
           
            mail.setToAddresses(sendTo);
            
            // Step 3: Set who the email is sent from
            mail.setReplyTo('noreply@gmail.com'); // change it with your mail address.
            mail.setSenderDisplayName('salesforce User'); 
            
            // Step 4. Set email contents - you can use variables!
            mail.setSubject(subject);
            mail.setHtmlBody(et.body);
            
            /*List<Opportunity> oppList = new List<Opportunity>();
            oppList = [select id,Contact__r.Email,Contact__r.LastName from Opportunity where id =:recordId limit 1];  
            system.debug('=========oppList============='+oppList);*/
            String plainBody = et.HtmlValue;
            //for(Opportunity o : oppList){
              plainBody = plainBody.replace('{!Contact.LastName}', name);
              plainBody = plainBody.replace('{!Opportunity.OwnerFullName}', ownerName);
              plainBody = plainBody.replace('XX',year);
           // }
            mail.setHtmlBody(emailbody);
            
            if(emails != null && !emails.isEmpty()){
                attach = [select Id,name,body,parentID from Attachment  where id=: emails];
                ducumentsLink = [SELECT Id, LinkedEntityId, ContentDocumentId,Visibility, IsDeleted, ShareType,ContentDocument.Title,ContentDocument.createdDate, ContentDocument.FileType FROM ContentDocumentLink WHERE Id =: emails];
            }
            System.debug('===attach===='+attach);
            if(attach != null  && !attach.isEmpty()) {
                for (Attachment  a : attach)
                {
                    Messaging.Emailfileattachment efa = new Messaging.Emailfileattachment();
                    efa.setFileName(a.Name);
                    efa.setBody(a.Body);
                    fileAttachments.add(efa);
                }
            }
            Set<Id> ContentDocumentids = new Set<Id>();
            List<contentversion> contentversionlist = new List<contentversion>();
            if(ducumentsLink != null && !ducumentsLink.isEmpty()){
                for (ContentDocumentLink  document : ducumentsLink)
                {
                    ContentDocumentids.add(document.ContentDocumentId);
                }
            }
            
            if(ContentDocumentids != null) {
                contentversionlist = [SELECT title,PathOnClient,versiondata,ContentDocumentId FROM contentversion WHERE ContentDocumentId IN :ContentDocumentids];
                                            
            }
            if(contentversionlist != null && !contentversionlist.isEmpty()){
                for(ContentVersion cversion : contentversionlist) {
                    blob WOCFbody = cversion.versiondata;
                    Messaging.Emailfileattachment efa = new Messaging.Emailfileattachment();
                    efa.setFileName(cversion.title);
                    efa.setBody(WOCFbody);
                    fileAttachments.add(efa);
                }
            }
            mail.setFileAttachments(fileAttachments);
            mail.setWhatId(recordId);
            mail.setSaveAsActivity(true);
            
            // Step 5. Add your email to the master list
            mails.add(mail);
            
            // Step 6: Send all emails in the master list
            Messaging.sendEmail(mails);
        }  
    }
    
}