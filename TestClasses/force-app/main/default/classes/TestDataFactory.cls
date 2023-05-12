public class TestDataFactory {
    public static void prepareTestData() {
        Account acc = new Account();
        acc.Name = 'Test Account';
        insert acc;
        
        Profile profileId = [SELECT Id FROM Profile WHERE Name = 'Standard User' LIMIT 1];
        User usr = new User(LastName = 'CMT DEV',
                            FirstName='Dev',
                            Alias = 'cmtdev',
                            Email = 'cmt.dev@abcd.com',
                            Username = 'cmt.dev@abcd.com',
                            ProfileId = profileId.id,
                            TimeZoneSidKey = 'GMT',
                            LanguageLocaleKey = 'en_US',
                            EmailEncodingKey = 'UTF-8',
                            LocaleSidKey = 'en_US'
                           );
        insert usr;
        
        Contact con=new Contact();
        con.AccountId = acc.Id;
        con.LastName='LastName';
        con.OwnerId=usr.Id;
        con.Phone = '1234567890';
		insert con;
        
        Asset__c asset = new Asset__c();
        asset.Account__c = acc.Id;
        asset.Name = 'Test Asset 1';
        asset.CATEGORY__c = 'Voice';
        insert asset;
        
        State__c state = new State__c();
        state.Name = 'New York';
        state.State_Code__c = 'NY';
        state.Company__c = acc.Id;
        insert state;
        
        Remedy_Manage_Trouble_Tickets__c rm = new Remedy_Manage_Trouble_Tickets__c();
        rm.Api_key__c = '29tOmZyb250aWVyMTIz';
        rm.Authorization__c = '1z2tEedU84RBEnsFot';
        rm.Content_Type__c = 'text/xml';
        rm.End_point__c = 'https://api-qat02.frontier.com/remedymanageticket/v1';
        rm.Password__c = 'frontier123';
        rm.SOAP_Action__c = 'urn:ECPManageTicket/TroubleTicketCreation';
        rm.Username__c = 'sfacom';
        insert rm; 
    }
}