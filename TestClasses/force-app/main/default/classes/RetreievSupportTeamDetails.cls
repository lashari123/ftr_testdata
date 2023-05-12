/*****************
Class Name:RetreievSupportTeamDetails
Author:Sreee Reddy
Purpose:To send emial to support team memebrs after completion of order
*******************/
public without sharing class RetreievSupportTeamDetails{
    /*****************
Method Name:RetreievSupportTeamDetails
Author:Sreee Reddy
Purpose:Retreiving emails and sending mails to Support Team members
Version:1.0
*******************/

    public static void getEmails(List<order> orderList,map<id,order> oldMap){
        final String completed = 'Complete';
        map<id,id> accIdOrderMap = new map<id,id>();
                for(order ordr:orderList){
            if(completed.equalsIgnoreCase(ordr.Order_Stage__c) && oldMap.get(ordr.id).Order_Stage__c != completed){
               accIdOrderMap.put(ordr.accountId,ordr.id);
                
            }
        }
        map<id,string> accIdSpprTeamMap = new map<id,string>();
        String fullRecordURL = URL.getSalesforceBaseUrl().toExternalForm() + '/';
        List<string> emails = new List<string>();
        if(!accIdOrderMap.isEmpty()){
               for(Support_Team_Member__c suprtMember:[SELECT id,Account__c,Account__r.name,Team_Member__c,Team_Member__r.email FROM Support_Team_Member__c WHERE Account__c IN:accIdOrderMap.keySet()]){
                emails.add(suprtMember.Team_Member__r.email);
                Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
                
                message.setSaveAsActivity(false); 
                message.setTargetObjectId(suprtMember.Team_Member__c);
                message.setSubject('A SalesForce.Com order has been completed. Please click on the below link to review the order details');
               // use the html body to set the content of the body
       message.setHtmlBody('Account Name :<b> ' + suprtMember.Account__r.name +' </b><p>'+
      'To view your Order <a href='+fullRecordURL+accIdOrderMap.get(suprtMember.Account__c)+'>click here.</a>'); 
                Messaging.SingleEmailMessage[] messages = 
                    new List<Messaging.SingleEmailMessage> {message};
                        Messaging.SendEmailResult[] results = Messaging.sendEmail(messages);
                if (results[0].success) {
                    System.debug('The email was sent successfully.');
                } else {
                    System.debug('The email failed to send: '
                                 + results[0].errors[0].message);
                }  

            }
        }
    }
}