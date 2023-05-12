@isTest
public class AssetHomeControllerTest {
    
    @testSetup
    static void testData(){
        
        TestDataFactory.prepareTestData();       
        
    }
    
     
    
    
    @isTest
    static void codeCoverage() {
        
        Contact con = [SELECT Id FROM Contact LIMIT 1];
        Asset__c asset = [SELECT Id FROM Asset__c LIMIT 1];
        user u = [select id from user limit 1];
        
        Remedy_Ticket__c ticket = new Remedy_Ticket__c();
        ticket.Status__c = 'Open';
        ticket.Contact__c = con.Id;
        ticket.Trouble_Type__c = 'CBC';
        
        Remedy_Ticket__c ticket1 = new Remedy_Ticket__c();
        ticket1.Status__c = 'Open';
        ticket1.Contact__c = con.Id;
        ticket1.Trouble_Type__c = 'CCF';
        
        Remedy_Ticket__c ticket2 = new Remedy_Ticket__c();
        ticket2.Status__c = 'Open';
        ticket2.Contact__c = con.Id;
        ticket2.Trouble_Type__c = 'CBH';
        
        Remedy_Ticket__c ticket3 = new Remedy_Ticket__c();
        ticket3.Status__c = 'Open';
        ticket3.Contact__c = con.Id;
        ticket3.Trouble_Type__c = 'CCO';
        
        Remedy_Ticket__c ticket4 = new Remedy_Ticket__c();
        ticket4.Status__c = 'Open';
        ticket4.Contact__c = con.Id;
        ticket4.Trouble_Type__c = 'DDC';
        
        Remedy_Ticket__c ticket5 = new Remedy_Ticket__c();
        ticket5.Status__c = 'Open';
        ticket5.Contact__c = con.Id;
        ticket5.Trouble_Type__c = 'LDC';
        
        Remedy_Ticket__c ticket6 = new Remedy_Ticket__c();
        ticket6.Status__c = 'Open';
        ticket6.Contact__c = con.Id;
        ticket6.Trouble_Type__c = 'NDT';
        
        Remedy_Ticket__c ticket7 = new Remedy_Ticket__c();
        ticket7.Status__c = 'Open';
        ticket7.Contact__c = con.Id;
        ticket7.Trouble_Type__c = 'OOL';
        ticket7.Circuit_Id__c = 'tests';
        
        system.runAs(u){
            Test.startTest();
            AssetHomeController.getAllAssets();
            AssetHomeController.getStateCityAddress();
            AssetHomeController.getAssetById(asset.id);
            //   AssetHomeController.getAssetCategory(asset.Id);
            AssetHomeController.getAssetStates();
            //    AssetHomeController.getAssetCities();
            AssetHomeController.getAssetsByStateAndCity('New York', 'Test');
            AssetHomeController.createTicket(ticket);
            AssetHomeController.getCitiesByState('New York');
            AssetHomeController.getContactById(con.Id);
            AssetHomeController.getAssetByPhone('9876543210', ''); 
            AssetHomeController.getAssetByPhone('', 'Test'); 
            AssetHomeController.createDPITicket(ticket);
            AssetHomeController.createDPITicket(ticket1);
            AssetHomeController.createDPITicket(ticket2);
            AssetHomeController.createDPITicket(ticket3);
            AssetHomeController.createDPITicket(ticket4);
            AssetHomeController.createDPITicket(ticket5);
            AssetHomeController.createDPITicket(ticket6);
            AssetHomeController.createDPITicket(ticket7);
            AssetHomeController.getAssetsByStateCityAndStreet('New York', 'Test','');
            Ftr_DpiTicketCreationService.Dpiticketservice('9876543210', 'Karthik', '','','','', '','','');
            AssetHomeController.responseWrapperClass resp = New AssetHomeController.responseWrapperClass();
            AssetHomeController.status sta = New AssetHomeController.status();
            AssetHomeController.troubleTicket tro = New AssetHomeController.troubleTicket();
            AssetHomeController.dpiTroubleTicketId dpi = New AssetHomeController.dpiTroubleTicketId();
            sta.message = 'Success';
            dpi.ticketNumber = '12345';
            tro.dpiTroubleTicketId = dpi;
            resp.status = sta;
            resp.troubleTicket = tro;
            
            AggregateResult[] assetList = [SELECT dpi_STATE__c,dpi_CITY__c,DPI_SERVICEADDRESS__c 
                                           FROM Asset__c 
                                           GROUP BY dpi_STATE__c,dpi_CITY__c,DPI_SERVICEADDRESS__c ];
            AssetHomeController.buildAddressTree(assetList);
            
            Remedy_Ticket__c rt = [SELECT Id, Status__c, Contact__c FROM Remedy_Ticket__c WHERE Contact__c =: con.Id];
            rt.Status__c = 'Assigned';
            update rt;
            
            Test.stopTest();
        }
    }
    
}