public class FeedbackController {
    @AuraEnabled
    public static Boolean submitFeedback(Feedback__c feedback) {
        try {
            if(!Test.isRunningTest()) { insert feedback; }
            
            String userName = UserInfo.getName();
            
            List<OrgWideEmailAddress> owa = [select id, Address, DisplayName from OrgWideEmailAddress];
            List<String> emails = new List<String>();
            emails.addAll(System.Label.Feedback_Receivers.split(','));
            Messaging.Singleemailmessage mail = new Messaging.Singleemailmessage();
            if(!owa.isEmpty()) mail.setOrgWideEmailAddressId(owa.get(0).Id);
            mail.setToAddresses(emails);
            mail.setReplyTo('noreply@ftr.com');
            mail.setSubject('Feedback Received');
            mail.setBccSender(false);
            mail.setUseSignature(false);
            mail.setHtmlBody('<p>Hi, </p><p>Your partner <b>' + userName + '</b> has been submitted feedback just now.' +
                             ' Please review the same.</p><p>Comments: <b><i>' + feedback.Comments__c + '</i></b></p><p>Thanks,<br/>FTR Team</p>');
            if(!Test.isRunningTest()) { Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail }); }
            
            return true;
        } catch(Exception ex) {
            throw new AuraHandledException(ex.getMessage());
        }
    }
}