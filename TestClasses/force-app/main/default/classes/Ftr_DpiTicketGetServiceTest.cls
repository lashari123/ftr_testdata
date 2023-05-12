@isTest
public class Ftr_DpiTicketGetServiceTest {
	@TestSetup
    static void testData(){
        
		TestDataFactory.prepareTestData();           
            
            
                
    }
    @isTest
    static void codeCoverage(){
        
        Contact con = [SELECT Id FROM Contact LIMIT 1];
        Asset__c asset = [SELECT Id FROM Asset__c LIMIT 1];
        
        Remedy_Ticket__c ticket = new Remedy_Ticket__c();
        ticket.Status__c = 'Open';
        ticket.Contact__c = con.Id;
        ticket.Customer_Ticket_Number__c = '987654321';
        insert ticket;
        
        Test.startTest();
        
        Ftr_DpiTicketGetService.GetDpiticketservice('1183959','LR');
        
        Test.stopTest();
    }
}