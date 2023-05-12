@isTest
private class UserUtilityTest{

   /* @TestSetup
    static void makeData(){
        User u = new User(
            ProfileId = [SELECT Id FROM Profile WHERE Name = 'Frontier System Administrator'].Id,
            LastName = 'last',
            Email = 'puser000@amamama.com',
            Username = 'puser000@amamama.com' + System.currentTimeMillis(),
            CompanyName = 'TEST',
            Title = 'title',
            Alias = 'alias',
            TimeZoneSidKey = 'America/Los_Angeles',
            EmailEncodingKey = 'UTF-8',
            LanguageLocaleKey = 'en_US',
            LocaleSidKey = 'en_US',
            UserRoleId = [SELECT Id FROM UserRole WHERE Name = 'Alternate Channel' limit 1].Id,
            isActive=true
        );
        insert u;
    }*/

    static testmethod void test() {
        Test.startTest();
                User u = new User(
            ProfileId = [SELECT Id FROM Profile WHERE Name = 'System Analyst'].Id,
            LastName = 'last',
            Email = 'puser000@amamama.com',
            Username = 'puser000@amamama.com' + System.currentTimeMillis(),
            CompanyName = 'TEST',
            Title = 'title',
            Alias = 'alias',
            TimeZoneSidKey = 'America/Los_Angeles',
            EmailEncodingKey = 'UTF-8',
            LanguageLocaleKey = 'en_US',
            LocaleSidKey = 'en_US',
            UserRoleId = [SELECT Id FROM UserRole WHERE Name = 'Alternate Channel' limit 1].Id,
            isActive=true
        );
        insert u;
        
        System.runAs(u){
        List<User> newItems = new List<User>();
        newItems = [SELECT Id, UserName, ProfileId, CRIS_ID__c, ManagerId, SVP__c
                                 FROM User
                                 WHERE IsActive = true AND Profile.name='Frontier System Administrator'LIMIT 3];
        List<User> oldItems = new List<User>();                      
        oldItems = [SELECT Id,UserName,ProfileId, CRIS_ID__c, ManagerId, SVP__c
                                FROM User
                                WHERE IsActive = true AND Profile.name='System Administrator' LIMIT 3];
        UserUtility.beforeUpdateLogic(newItems, oldItems);
        }
        Test.stopTest();
        
        
        
    }
        static testmethod void test2() {
        Test.startTest();
                User u = new User(
            ProfileId = [SELECT Id FROM Profile WHERE Name = 'System Analyst'].Id,
            LastName = 'last',
            Email = 'puser000@amamama.com',
            Username = 'puser000@amamama.com' + System.currentTimeMillis(),
            CompanyName = 'TEST',
            Title = 'title',
            Alias = 'alias',
            TimeZoneSidKey = 'America/Los_Angeles',
            EmailEncodingKey = 'UTF-8',
            LanguageLocaleKey = 'en_US',
            LocaleSidKey = 'en_US',
            UserRoleId = [SELECT Id FROM UserRole WHERE Name = 'Alternate Channel' limit 1].Id,
            isActive=true
        );
        insert u;
        
        System.runAs(u){
        List<User> newItems = new List<User>();
        newItems = [SELECT Id, UserName, ProfileId, CRIS_ID__c, ManagerId, SVP__c
                                 FROM User
                                 WHERE IsActive = true AND Profile.name='Frontier System Administrator'LIMIT 2];
        List<User> oldItems = new List<User>();                      
        oldItems = [SELECT Id,UserName,ProfileId, CRIS_ID__c, ManagerId, SVP__c
                                FROM User
                                WHERE IsActive = true AND Profile.name='#CPE RegionalSalesMgr' LIMIT 2];
        UserUtility.beforeUpdateLogic(newItems, oldItems);
        }
        Test.stopTest();    
    }
    
        static testmethod void test3() {
        Test.startTest();
                User u = new User(
            ProfileId = [SELECT Id FROM Profile WHERE Name = 'System Analyst'].Id,
            LastName = 'last',
            Email = 'puser000@amamama.com',
            Username = 'puser000@amamama.com' + System.currentTimeMillis(),
            CompanyName = 'TEST',
            Title = 'title',
            Alias = 'alias',
            TimeZoneSidKey = 'America/Los_Angeles',
            EmailEncodingKey = 'UTF-8',
            LanguageLocaleKey = 'en_US',
            LocaleSidKey = 'en_US',
            UserRoleId = [SELECT Id FROM UserRole WHERE Name = 'Alternate Channel' limit 1].Id,
            isActive=true
        );
        insert u;
        
        System.runAs(u){
        List<User> newItems = new List<User>();
        newItems = [SELECT Id, UserName, ProfileId, CRIS_ID__c, ManagerId, SVP__c
                                 FROM User
                                 WHERE IsActive = true AND Profile.name='Frontier System Administrator'LIMIT 3];
        List<User> oldItems = new List<User>();                      
        oldItems = [SELECT Id,UserName,ProfileId, CRIS_ID__c, ManagerId, SVP__c
                                FROM User
                                WHERE IsActive = true AND Profile.name='System Administrator' LIMIT 3];
        UserUtility.beforeInsertLogic(newItems);
        }
        Test.stopTest();
        
        
        
    }
}