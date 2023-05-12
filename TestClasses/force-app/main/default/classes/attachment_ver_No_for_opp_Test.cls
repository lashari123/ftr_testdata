@isTest(seeAllData=true)
private class attachment_ver_No_for_opp_Test {   
  static testMethod void testHandleInboundEmail1()
      {
      Account a = new Account(Name = 'Test Account');
        a.phone = '111-222-3333';
        insert a;
        
        Opportunity opp = new Opportunity(Name = 'Test Opportunity');
        opp.AccountId = a.Id;
        opp.StageName = 'Proposal';
        opp.CloseDate = System.TODAY() + 90; 
        opp.Opportunity_Type__c = 'New';
        insert opp;
    // Create a new email, envelope object and Attachment
    Messaging.InboundEmail email = new Messaging.InboundEmail();
    Messaging.InboundEnvelope env = new Messaging.InboundEnvelope();
    Messaging.InboundEmail.BinaryAttachment inAtt = new Messaging.InboundEmail.BinaryAttachment();

    email.subject = 'test';
    env.fromAddress = 'user@acme.com';

    // set the body of the attachment
    inAtt.body = blob.valueOf('test');
    inAtt.fileName = 'Some File.txt';
    inAtt.mimeTypeSubType = 'text/plain';
    opportunity opp1 = [select Id,Redline_email_no__c from opportunity where Id=:opp.Id];
    inatt.fileName = opp1.Redline_email_no__c + ' ' + 'redline' + ' ' + 'final' + ' ' + 'test.doc';
    email.binaryAttachments = new Messaging.inboundEmail.BinaryAttachment[] {inAtt }; 

    // call the class and test it with the data in the testMethod
    EmailHandler_AttachToOpportunity handler = new EmailHandler_AttachToOpportunity();
    handler.handleInboundEmail(email, env );                      
  }
   static testMethod void testHandleInboundEmai2()
      {
      Account a = new Account(Name = 'Test Account');
        a.phone = '111-222-3333';
        insert a;
        
        Opportunity opp = new Opportunity(Name = 'Test Opportunity');
        opp.AccountId = a.Id;
        opp.StageName = 'Proposal';
        opp.CloseDate = System.TODAY() + 90; 
        opp.Opportunity_Type__c = 'New';
        insert opp;
    // Create a new email, envelope object and Attachment
    Messaging.InboundEmail email = new Messaging.InboundEmail();
       Messaging.InboundEnvelope env = new Messaging.InboundEnvelope();
    Messaging.InboundEmail.BinaryAttachment inAtt = new Messaging.InboundEmail.BinaryAttachment();

    email.subject = 'test';
    env.fromAddress = 'user@acme.com';

    // set the body of the attachment
    inAtt.body = blob.valueOf('test');
    inAtt.fileName = 'Some File.txt';
    inAtt.mimeTypeSubType = 'text/plain';
    opportunity opp1 = [select Id,Redline_email_no__c from opportunity where Id=:opp.Id];
    inatt.fileName =opp1.Redline_email_no__c + ' ' +'redline'+ ' '  + 'test.doc';
    email.binaryAttachments = new Messaging.inboundEmail.BinaryAttachment[] {inAtt }; 

    // call the class and test it with the data in the testMethod
    EmailHandler_AttachToOpportunity handler = new EmailHandler_AttachToOpportunity();
    handler.handleInboundEmail(email, env );                      
  }
   
}