@IsTest
public with sharing class WS_SFA_REST_External_Approval_Test {
    @IsTest
    private static void getNextAutoAttendantStatus_test() {
        String test1 = WS_SFA_REST_External_Approval.getNextAutoAttendantStatus('Pending Hot Cuts');
        System.assert(test1 == '', 'getNextAutoAttendantStatus(\'Pending Hot Cuts Finalization\') should have returned empty string but returned ' + test1);
        String test2 = WS_SFA_REST_External_Approval.getNextAutoAttendantStatus('Pending Data Gathering (and Configuration)');
        System.assert(test2 == 'Pending Hot Cuts Finalization', 'getNextAutoAttendantStatus(\'Pending Hot Cuts and Provisioning\') should have returned \'Pending Hot Cuts Finalization\' but returned ' + test2);
        String test3 = WS_SFA_REST_External_Approval.getNextAutoAttendantStatus('Pending Translation and Provisioning');
        System.assert(test3 == 'Pending Manual Swap or Execution', 'getNextAutoAttendantStatus(\'Pending Translation and Provisioning\') should have returned \'Pending Manual Swap or Execution\' but returned ' + test3);
    }
    
    private static String getResponseError(String externalId, 
                                              String status, 
                                              String expectedResponse, 
                                              String actualResponse)
    {
        return 'When updateAAProvisioningStatus is called with ' 
            + externalId 
            + ' for a DGF with a status of ' 
            + status 
            + ' then the response should have been ' 
            + expectedResponse
            + ' but was '
            + actualResponse;
    }
    
    private static String getStatusError(String externalId,
                                         String previousStatus,
                                         String expectedStatus,
                                         String actualStatus) 
    {
        return 'When updateAAProvisioningStatus is called with ' 
            + externalId 
            + ' for a DGF with a status of ' 
            + previousStatus 
            + ' then the new Status should have been ' 
            + expectedStatus
            + ' but was '
            + actualStatus;
    }
    
    @IsTest    
    private static void updateAAProvisioningStatus_Test() {
        String dpiEnvironment = 'CA';
        String dpiOrderNumber = '1001002';
        String externalId = dpiOrderNumber + '-' + dpiEnvironment;

        try {
            Id rtId = [SELECT Id FROM RecordType WHERE DeveloperName = 'Auto_Attendant'].Id;
            
            DGF__c dgf = new DGF__c();
            dgf.RecordTypeId = rtId;
            dgf.DPI_Environment__c = dpiEnvironment;
            dgf.DPI_Order_Number__c = dpiOrderNumber;
            dgf.Name = 'External Approval Test';
            dgf.Status__c = 'Pending Data Gathering (and Configuration)';
            dgf.external_Id__c = externalId;
            insert dgf;
            
            String res = WS_SFA_REST_External_Approval.updateAAProvisioningStatus(externalId);
            String expectedResponse = 'success';
            System.assert (res == expectedResponse, 
                           getResponseError(externalId, dgf.status__c, expectedResponse, res));
            
            DGF__c nextDgf = [Select Id, Status__c, External_Id__c FROM DGF__c WHERE External_Id__c = :externalId];
            String expectedStatus = 'Pending Hot Cuts Finalization';
            System.assert (nextDgf.Status__c == expectedStatus, 
                           getStatusError(externalId, dgf.Status__c, expectedStatus, nextDgf.Status__c));

            
            dgf.Status__c = 'Pending Translation and Provisioning';
            update dgf;
            res = WS_SFA_REST_External_Approval.updateAAProvisioningStatus(externalId);
            expectedResponse = 'success';
            System.assert (res == expectedResponse, 
                           getResponseError(externalId, dgf.status__c, expectedResponse, res));
            
            nextDgf = [Select Id, Status__c, External_Id__c FROM DGF__c WHERE External_Id__c = :externalId];
            expectedStatus = 'Pending Manual Swap or Execution';
            System.assert (nextDgf.Status__c == expectedStatus, 
                           getStatusError(externalId, dgf.Status__c, expectedStatus, nextDgf.Status__c));

            dgf.Status__c = 'Pending Manual Swap or Execution';
            update dgf;
            res = WS_SFA_REST_External_Approval.updateAAProvisioningStatus(externalId);
            expectedResponse = 'DGF with External Id 1001002-CA shows a status that Provisioning has already completed.';
            System.assert (res == expectedResponse, 
                           getResponseError(externalId, dgf.status__c, expectedResponse, res));
            
            dgf.Status__c = 'Pending Hot Cuts Finalization';
            update dgf;
            res = WS_SFA_REST_External_Approval.updateAAProvisioningStatus(externalId);
            expectedResponse = 'DGF with External Id 1001002-CA shows a status that Provisioning has already completed.';
            System.assert (res == expectedResponse, 
                           getResponseError(externalId, dgf.status__c, expectedResponse, res));
            
            res = WS_SFA_REST_External_Approval.updateAAProvisioningStatus('9999999-XX');
            expectedResponse = 'There is no DGF with an external Id of 9999999-XX';
            System.assert (res == expectedResponse, 
                           getResponseError(externalId, dgf.status__c, expectedResponse, res));
        } catch (Exception ex) {
            System.assert(false, ex.getMessage());
        }
    }
}