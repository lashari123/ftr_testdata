@isTest
public with sharing class AltChannelOppsUpdateBatchTest {
    static testMethod void testUpdatingOpps() {
        UserRole ur = [SELECT Id FROM UserRole Where name = 'B2B - Alt Channel' LIMIT 1];
        Profile profileId = [SELECT Id FROM Profile WHERE Name = 'Frontier System Administrator' LIMIT 1];
        User usr = new User(
            LastName = 'test',
            FirstName='user',
            Alias = 'tu',
            Email = 'testuser@mail.com',
            Username = 'test' + System.currentTimeMillis() + 'user@mail.com',
            ProfileId = profileId.id,
            TimeZoneSidKey = 'America/New_York',
            LanguageLocaleKey = 'en_US',
            EmailEncodingKey = 'UTF-8',
            LocaleSidKey = 'en_US',
            UserPermissionsSFContentUser = true,
            UserRoleId = ur.id
        );
        insert usr;
        system.runAs(usr) {
            insert ftr_TestDataFactory.getOpportunities(5);
        }
        Test.startTest();
        DataBase.executeBatch(new AltChannelOppsUpdateBatch());
        Test.stopTest();
    } 
}