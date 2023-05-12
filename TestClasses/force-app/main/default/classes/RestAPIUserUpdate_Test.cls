@isTest
private class RestAPIUserUpdate_Test {

    static {
    // setup test data  
    }

    static testMethod void testGetRoleAndProfiles() {
    
        RestRequest req = new RestRequest(); 
        RestResponse res = new RestResponse();
        
        req.requestURI = 'https://cs14.salesforce.com/services/apexrest/UpdateUserInfo';  
        req.httpMethod = 'GET';
        RestContext.request = req;
        RestContext.response = res;
        
        RestAPIUserUpdate.UserRolesandProfiles results = RestAPIUserUpdate.getRoleAndProfiles();
        
        boolean rolesFlag = results.roles.isEmpty(); 
        boolean profilesFlag = results.profiles.isEmpty();      
         
        System.assertEquals(false, rolesFlag);
        System.assertEquals(false, profilesFlag);
    
    }

    static testMethod void testUpdateUser() {
    
        RestRequest req = new RestRequest(); 
        RestResponse res = new RestResponse();
        
        Profile p = [SELECT Id FROM Profile WHERE Name='Standard User'];
        UserRole r = [select id from UserRole where name='Call Center'];
        User usr = new User(Alias = 'kev234', Email='standarduser@testorg.com',
                              EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US',
                              LocaleSidKey='en_US', ProfileId = p.Id, userRoleId = r.id, CSR_ID__c = 'mtt848',
                              TimeZoneSidKey='America/Los_Angeles',     UserName='csa_analyst@ftr.com');
        insert usr;
        
        req.requestURI = 'https://cs14.salesforce.com/services/apexrest/UpdateUserInfo';
        req.httpMethod = 'PUT';
        req.addHeader('corpId', 'mtt848');
        req.addHeader('role', 'AE - California - Enterprise Business');
        req.addHeader('profile', 'Frontier System Administrator');
        RestContext.request = req;
        RestContext.response = res;
        
        String results = RestAPIUserUpdate.updateUser();
        
        System.assertEquals(true, results.startsWith('Successful!! User Info Updated!!'));
    
    }

}