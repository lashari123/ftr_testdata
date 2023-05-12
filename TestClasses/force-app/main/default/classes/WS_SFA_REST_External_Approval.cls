@RestResource(urlMapping='/External-Approval/*')
global  with sharing class WS_SFA_REST_External_Approval {
    
    @TestVisible
    private static String getNextAutoAttendantStatus(String currentStatus) {
        if (currentStatus == 'Pending Data Gathering (and Configuration)') {
            return 'Pending Hot Cuts Finalization';
        } 
        if (currentStatus == 'Pending Translation and Provisioning') {
            return 'Pending Manual Swap or Execution';
        }
        return '';
    }

    @HttpPost
    global static String updateAAProvisioningStatus(String extId) {
        try {
            DGF__c dgf = [SELECT Id, External_ID__c, Status__c FROM DGF__c WHERE External_ID__c = :extId LIMIT 1];
            String nextStatus = getNextAutoAttendantStatus(dgf.status__c);
            if (nextStatus == '') {
                return 'DGF with External Id ' + extId + ' shows a status that Provisioning has already completed.';
            }
            dgf.status__c = nextStatus;
            update dgf;

            String notificationBody = 'Provisioning has completed work on Auto Attendant DGF ' 
                + dgf.Id
                + '.';
            
            if (!Test.isRunningTest()) {
                List<Messaging.SendEmailResult> results = Notification_Utility.sendNotificationToGroupOrQueue('VoIP Translations - Smartvoice', 'Provisioning Completed for Auto Attendant DGF', notificationBody);
            }
        } catch (Exception ex) {
            return 'There is no DGF with an external Id of ' + extId;
        }
        return 'success';
    }
}