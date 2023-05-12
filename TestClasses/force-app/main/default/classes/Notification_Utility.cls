public with sharing class Notification_Utility {
    public static List<Messaging.SendEmailResult> sendNotificationToGroupOrQueue(String groupName, String emailSubject, String emailBody) {
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        List<Messaging.SendEmailResult> res;
        Mail.setToAddresses(getEmailAddresses(groupName));
        Mail.setSubject(emailSubject);
        Mail.setPlainTextBody(emailBody);        
        if(!test.isrunningtest()){
            res = Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
        }
        return res;
    }

    private static List<String> getEmailAddresses(String groupName) {
        List<String> idList = new List<String>();
        List<String> mailToAddresses = new List<String>();
        Group g = [SELECT (SELECT UserOrGroupId FROM GroupMembers) FROM Group WHERE name = :groupName];
        System.debug('g: ' + g);
        for (GroupMember gm : g.groupMembers) {
            idList.add(gm.userOrGroupId);
        }
        User[] usr = [SELECT email FROM user WHERE id IN :idList];
        for(User u : usr) {
            mailToAddresses.add(u.email);
        }
        return mailToAddresses;
    }

}