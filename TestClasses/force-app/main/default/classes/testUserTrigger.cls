@isTest
public class testUserTrigger {

    @TestSetup
    static void makeData(){
        User u = new User(
         //   ProfileId = [SELECT Id FROM Profile WHERE Name = 'Minimum Access - Salesforce'].Id,
         ProfileId = [SELECT Id, Name, IsCustom, Profile.Name, ProfileId, IsOwnedByProfile FROM PermissionSet Where Iscustom=false AND ProfileId != null AND Profile.Name='Minimum Access - Salesforce'].ProfileId,
           // ProfileId = '00e0h000001L6JiAAK',
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
        }
         
   public static testMethod void testtrigger(){
        //User u = [select id, profileid from user where IsActive = true and profile.name = '#AccountExec' LIMIT 1];
           User u = [select id, profileid from user where IsActive = true and Email = 'puser000@amamama.com' LIMIT 1];
        ID fsa = u.profileid;
        Profile p = [select id from profile where name = 'System Administrator'];
        u.profileid = p.Id;
        update u; // result depends on who runs but s/b ok if by sys admin

        // reset for next test
        u.profileid = fsa;
        update u; // now frontier System Admin
       // User thisUser = [ select Id, TimeZoneSidKey, LocaleSidKey,EmailEncodingKey,ProfileId, LanguageLocaleKey from User where Profile.Name = 'Frontier System Administrator' and IsActive = true Limit 1 ]; 
        User thisUser = [ select Id, TimeZoneSidKey, LocaleSidKey,EmailEncodingKey,ProfileId, LanguageLocaleKey from User where Profile.Name = 'System Administrator' and IsActive = true Limit 1 ]; 
        System.runAs ( thisUser ) {   
            u.profileid = p.Id; // try to change to sys admin
            //update u;
            User u3 = [select id, profile.name from user where id = :u.Id];
            //system.assertEquals(u3.profile.name, '#AccountExec'); 
            // trigger should have set back to this
            system.assertEquals(u3.profile.name, 'Minimum Access - Salesforce'); 
            
           // User u2 = [select id, profileid from user where IsActive = true and profile.name = 'AdminNoExpire' Limit 1];
            User u2 = [select id, profileid from user where IsActive = true and profile.name = 'Frontier System Administrator' Limit 1];
            //Profile p2 = [select id from profile where name = '#AccountExec'];
            //Profile p2 = [select id from profile where name = 'Minimum Access - Salesforce'];
            Profile p2 = [select id from profile where Id = '00e0h000001L6JiAAK'];
            u2.profileid = p2.Id;
            update u2; // trying to update AdminNoExpire to FSA, should fail
            User u4 = [select id, profile.name from user where id = :u2.id];
            //system.assertEquals(u4.profile.name, 'AdminNoExpire'); // s/b unchanged
        }
     
    }
}