//test code for RFP Cases

@isTest
public class test_RFP_Case {
   
   static testMethod void Create_RFP_Case(){ 

    User user1 = new User(alias = 'ceo', email='admin@testorg.com',
        emailencodingkey='UTF-8', lastname='Testing', languagelocalekey='en_US',
        localesidkey='en_US',
        timezonesidkey='America/Los_Angeles', username='adminTas@ftr.testorg.com', profileid = '00e40000000nTsD');
        insert user1;
        
    User user2 = new User(alias = 'ceo2', email='admin2@testorg.com',
        emailencodingkey='UTF-8', lastname='Testing', languagelocalekey='en_US',
        localesidkey='en_US',
        timezonesidkey='America/Los_Angeles', username='admin2@ftr.testorg.com', profileid = '00e40000000nTsD');
        insert user2;
        
        Account a = new Account (Name = 'Case Test Account', Phone = '9725551212', Region__c = 'Central', BillingStreet = '500 5th Street', BillingCity = 'Dallas', BillingState = 'Texas', BillingPostalCode = '55555', ShippingStreet = '500 5th Street', ShippingCity = 'Dallas', ShippingState = 'Texas', ShippingPostalCode = '55555');
        insert a;  
          
        Opportunity opp = new Opportunity (Name= 'Case Test Opportunity', Accountid = a.id, Integrated_Sale__c = 'No', CloseDate = system.today()+60, StageName = 'Investigating', Type = 'New');
        insert opp;
                       
        RecordType rt = [Select id from RecordType where name ='RFP']; 
        System.debug(rt.id); 
        
        Case c = new Case(RecordtypeId =rt.id, Opportunity__c = opp.id, Status = 'Received/Unassigned', RFP_Sales_Engineer__c = user1.id, RFP_Account_Executive__c = user2.id, RFP_Format_Type__c = 'Request for Proposal (RFP)', RFP_Solution__c = 'WiFi') ;
        //insert c;
        

    }
}