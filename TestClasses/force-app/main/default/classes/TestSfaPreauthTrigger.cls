public class TestSfaPreauthTrigger {
    static testMethod void testCreateSicData() {
        Credit_PreAuthorization__c cp = new Credit_PreAuthorization__c();
        cp.Credit_Request_Amount__c = 10;
        cp.Customer_Contact_Name__c = 'Nyuk Nyuk';
        cp.Justification__c = 'cos i wanna';
        insert cp;
    }
}