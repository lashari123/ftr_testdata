@isTest
public class RemedySubmitTroubleTicketTest {
    @TestSetup
    static void testData(){
        
        TestDataFactory.prepareTestData();  
        //Remedy tkt
        Contact con = [SELECT Id FROM Contact LIMIT 1];
        Asset__c asset = [SELECT Id FROM Asset__c LIMIT 1];
        
        Remedy_Ticket__c ticket = new Remedy_Ticket__c();
        ticket.Status__c = 'Open';
        ticket.Contact__c = con.Id;
        ticket.Customer_Ticket_Number__c = '987654321';
        ticket.Circuit_Id__c = '987654321';
        insert ticket; 
    }
    
    @isTest
    static void testGetAccessHours() {        
        //Remedy tkt
        Remedy_Ticket__c ticket = [SELECT Id 
                                   FROM Remedy_Ticket__c
                                   WHERE Customer_Ticket_Number__c =: '987654321'];
        test.startTest(); 
        {
            Remedy_Ticket__c ticketReturned = RemedySubmitTroubleTicket.getAccessHours(ticket.Id);
        }
        test.stopTest();
        
    }
    
    @isTest
    static void testSetAccessHours() {
        //Remedy tkt
        Remedy_Ticket__c ticket = [SELECT Id, Access_Hours__c, Preferred_Contact_method__c, Reported_By_Name_Text__c,Reported_By_Email__c
                                   FROM Remedy_Ticket__c
                                   WHERE Customer_Ticket_Number__c =: '987654321'];
        
        String recId = ticket.Id;
        String accessHours = ticket.Access_Hours__c;
        String preferredMethod = ticket.Preferred_Contact_method__c;
        string reportedBy = ticket.Reported_By_Name_Text__c;
         string reportedemail = ticket.Reported_By_Email__c;
        
        test.startTest();
        {
            Boolean recordUpdated = RemedySubmitTroubleTicket.setAccessHours(recId, accessHours, preferredMethod, reportedBy );
        }
        test.stopTest();
    }
    
    @isTest
    static void testUpdateRemedyTicket() {
        //Remedy tkt
        Remedy_Ticket__c ticket = [SELECT Id, Access_Hours__c, Preferred_Contact_method__c
                                   FROM Remedy_Ticket__c
                                   WHERE Customer_Ticket_Number__c =: '987654321'];
        test.startTest();
        {
            String response = RemedySubmitTroubleTicket.updateRemedyTicket(ticket);
        }
        test.stopTest();
    }
    
    @isTest
    static void testGetNotesList() {
        //Remedy tkt
        Remedy_Ticket__c ticket = [SELECT Id, Access_Hours__c, Preferred_Contact_method__c
                                   FROM Remedy_Ticket__c
                                   WHERE Customer_Ticket_Number__c =: '987654321'];
        
        test.startTest();
        {
            List<Community_Note__c> returnedList = RemedySubmitTroubleTicket.getNotesList(ticket.Id);
        }
        test.stopTest();
    }
    
    @isTest
    static void testGetExistingNotes() {
        //Remedy tkt
        Remedy_Ticket__c ticket = [SELECT Id, Access_Hours__c, Preferred_Contact_method__c
                                   FROM Remedy_Ticket__c
                                   WHERE Customer_Ticket_Number__c =: '987654321'];
        
        test.startTest();
        {
            List<String> returnedList = RemedySubmitTroubleTicket.getExistingNotes(ticket.Id);
        }
        test.stopTest();
    }
    
    @isTest
    static void testGetRemedyTicketId() {
        //Remedy tkt
        Remedy_Ticket__c ticket = [SELECT Id, Access_Hours__c, Preferred_Contact_method__c
                                   FROM Remedy_Ticket__c
                                   WHERE Customer_Ticket_Number__c =: '987654321'];
        test.startTest();
        {
            String returnedId = RemedySubmitTroubleTicket.getRemedyTicketId(ticket.Id);
        }
        test.stopTest();
    }
    
     @isTest
    static void testcreateCase() {
        account ac = [Select id from account where name = 'Test Account'];
        test.startTest();
        {
             RemedySubmitTroubleTicket.createCase(ac.Id,'test','test','test','test');
        }
        test.stopTest();
    }
    
    
    @isTest
    static void testInsertNote() {
        //Remedy tkt
        Remedy_Ticket__c ticket = [SELECT Id, Access_Hours__c, Preferred_Contact_method__c
                                   FROM Remedy_Ticket__c
                                   WHERE Customer_Ticket_Number__c =: '987654321'];
        
        test.startTest();
        {
            Community_Note__c obj = new Community_Note__c();
            obj.Description__c = 'test description';
            obj.Entered_By__c = 'test user';
            obj.EntryID__c = '1234';
            obj.SubmitTicket__c = ticket.Id;
            obj.User_Type__c = 'E';
            insert obj;
        }
        test.stopTest();
    }
      
    @isTest
    static void codeCoverage(){
        
        Contact con = [SELECT Id FROM Contact LIMIT 1];
        Asset__c asset = [SELECT Id FROM Asset__c LIMIT 1];
        
        //Remedy tkt
        Remedy_Ticket__c ticket = new Remedy_Ticket__c();
        ticket.Status__c = 'Open';
        ticket.Contact__c = con.Id;
        ticket.Customer_Ticket_Number__c = '987654321';
        ticket.Circuit_Id__c = '987654321';
        
        // insert ticket;     
        Test.startTest();
        
        //DPI tkt
        Remedy_Ticket__c ticketDPI = new Remedy_Ticket__c();
        ticketDPI.Status__c = 'Open';
        ticketDPI.Contact__c = con.Id;
        ticketDPI.Customer_Ticket_Number__c = '5852250106';
        ticketDPI.Circuit_Id__c = '5852250106';
        ticketDPI.Environment__c = 'LR';
        insert ticketDPI;
        
        AssetHomeController.createTicket(ticket);
        RemedySubmitTroubleTicket.getCurrentUserData();
        RemedySubmitTroubleTicket.getTickets(True);
        RemedySubmitTroubleTicket.getTickets(False);
        //Remedy_Ticket__c rt = [SELECT Id,Customer_Ticket_Number__c FROM Remedy_Ticket__c order by createdDate desc LIMIT 1];
        //aFa2a0000008aiKCAQ
        Remedy_Ticket__c rt = [SELECT Id,Customer_Ticket_Number__c FROM Remedy_Ticket__c where Customer_Ticket_Number__c =: '987654321'][0];    
        String ticketNumber = RemedySubmitTroubleTicket.checkTicketNumber(rt.Id);
        RemedySubmitTroubleTicket.searchTicket(ticketNumber + ',12345');
        RemedySubmitTroubleTicket.setTicketStatus(rt, '', '');
        RemedySubmitTroubleTicket.getSearchTicketRequestBody(ticketNumber);
        RemedySubmitTroubleTicket.updateTicket(rt.Id, 'Test Reason');
        RemedySubmitTroubleTicket.getDPITicketStatus(ticketDPI.Id);
        RemedySubmitTroubleTicket.getRemedyNotes(rt.Customer_Ticket_Number__c);
        RemedySubmitTroubleTicket.createNotes('testing',rt.Id);
        RemedySubmitTroubleTicket.getNotesList(rt.Id);
        
        Community_Note__c notes = new Community_Note__c();
        notes.SubmitTicket__c = rt.Id;
        notes.Description__c = 'Test message from Remedy Submit Trouble ticket test apex.';
        Insert notes;
        //RemedySubmitTroubleTicket.sendRemedyNotes(notes.Id);
    }  
    
    @isTest
    public static void getUserId(){
        User u = [select id , contactId from user where id =: userInfo.getUserId()];
        RemedySubmitTroubleTicket.getUserById(u.Id);
    }
    
    @isTest
    public static void updateTicket(){
        Remedy_Ticket__c ticket = new Remedy_Ticket__c();
        ticket.Customer_Ticket_Number__c = '12389909889';
        ticket.Circuit_Id__c = '87/TAXX/691258/   /CZUC/';
        ticket.Description__c = 'Test';
        ticket.Trouble_Type__c = 'Alarm';
        ticket.Customer_Address_City__c = 'ROCHESTER';
        ticket.Customer_Address_Zip__c = '14626';
        ticket.Customer_Civic_Address__c = '1555 LONG POND RD';
        ticket.Service_Address_State__c = 'NY';
        ticket.Send_update__c = 'Yes';
        ticket.Is_Intrusive_Testing_Allowed__c = 'No';
        ticket.Local_Contact_Email2__c = 'Test@ftr.com';
        ticket.Access_Hours__c = 'ALAH-Sunday=true;ALAH-Monday=false;ALAH-Tuesday=false;ALAH-Wednesday=false;ALAH-Thursday=false;ALAH-Friday=false;ALAH-Saturday=false;ALAH-IntervalStart=00:00:00.000;ALAH-IntervalEnd=23:59:00.000--end_of_line--ALAH-Sunday=false;ALAH-Monday=true;ALAH-Tuesday=false;ALAH-Wednesday=false;ALAH-Thursday=false;ALAH-Friday=false;ALAH-Saturday=false;ALAH-IntervalStart=00:00:00.000;ALAH-IntervalEnd=23:59:00.000--end_of_line--ALAH-Sunday=false;ALAH-Monday=false;ALAH-Tuesday=true;ALAH-Wednesday=false;ALAH-Thursday=false;ALAH-Friday=false;ALAH-Saturday=false;ALAH-IntervalStart=00:00:00.000;ALAH-IntervalEnd=23:59:00.000--end_of_line--ALAH-Sunday=false;ALAH-Monday=false;ALAH-Tuesday=false;ALAH-Wednesday=true;ALAH-Thursday=false;ALAH-Friday=false;ALAH-Saturday=false;ALAH-IntervalStart=00:00:00.000;ALAH-IntervalEnd=23:59:00.000--end_of_line--ALAH-Sunday=false;ALAH-Monday=false;ALAH-Tuesday=false;ALAH-Wednesday=false;ALAH-Thursday=true;ALAH-Friday=false;ALAH-Saturday=false;ALAH-IntervalStart=00:00:00.000;ALAH-IntervalEnd=23:59:00.000--end_of_line--ALAH-Sunday=false;ALAH-Monday=false;ALAH-Tuesday=false;ALAH-Wednesday=false;ALAH-Thursday=false;ALAH-Friday=true;ALAH-Saturday=false;ALAH-IntervalStart=00:00:00.000;ALAH-IntervalEnd=23:59:00.000--end_of_line--ALAH-Sunday=false;ALAH-Monday=false;ALAH-Tuesday=false;ALAH-Wednesday=false;ALAH-Thursday=false;ALAH-Friday=false;ALAH-Saturday=true;ALAH-IntervalStart=00:00:00.000;ALAH-IntervalEnd=23:59:00.000';
        Insert ticket;
        
        ticket.Reported_By_Email__c = 'test@ftr.com';
        update ticket;
    }
    
}