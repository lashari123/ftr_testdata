global class EmailHandler_AttachToOpportunity implements Messaging.InboundEmailHandler {
   global Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email, Messaging.InboundEnvelope envelope) {
        if (email.binaryAttachments != null && email.binaryAttachments.size() > 0) {
            List<Attachment> attachments = new List<Attachment>();
          for (Messaging.InboundEmail.BinaryAttachment att : email.binaryAttachments) {
              string filename = att.fileName;
              integer index = filename.indexOf('__');
             // string[] parts = filename.split(' ');
              string[] parts = filename.splitByCharacterTypeCamelCase();
              System.debug('####' +Parts);
                      if (parts.size() < 2) 
                      {
                          throw new InboundEmailException('Filename is invalid: ' + filename);
                      } 
                  string refNumber = parts[0];
                  string attachmentName = filename;
                  Opportunity opp = [ SELECT Id,Email_flag_for_redline__c,Account.Name,Ver_no_for_redline__c,redline_email_no__c FROM  Opportunity WHERE redline_email_no__c=:refNumber];
                  //String attachmentName1 = opp.redline_email_no__c+' '+'redline Contract'+' '+opp.account.Name+' '+'Ver'+' '+opp.Ver_no_for_redline__c;
                  attachments.add(new Attachment(name=filename , body=att.body, parentid=opp.Id));
                  opp.Email_flag_for_redline__c=True;
                  update opp;                  
              }
              if (attachments.size() > 0) 
              {
                  insert attachments;
              }
         }
        Messaging.InboundEmailResult result = new Messaging.InboundEmailresult();
        result.success = true;
        return result;
    }
    public class InboundEmailException extends Exception { }
}