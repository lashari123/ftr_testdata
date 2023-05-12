@isTest
private class ManageUser_Test {

    //create 4 new users. set a 3 level manager hierarchy: c reports to b reports to a. d will be new SVP//
    static testMethod void testing(){ 
        profile p = [SELECT Id FROM Profile WHERE Name='Standard User'];
        user a = new user(
            LastName = 'test428',
            Alias = 'JSnow1',
            Email = 'johnsnow@johnsnowmail.com',
            Username = 'johnsnow@john2sn2owmail.com',
            CommunityNickname = 'johnsnowt4',
            EmailEncodingKey = 'ISO-8859-1',
            TimeZoneSidKey = 'America/Chicago',
            LocaleSidKey = 'en_US',
            LanguageLocaleKey = 'en_US',
            profileId = p.Id,
            City = 'Ranson',
            State = 'New York');
            insert a;
            
        user b = new user(
            LastName = 'test428',
            Alias = 'Pacific3',
            Email = 'johnsnow@johnsnowmail123.com',
            Username = 'johnsnow@johns2nowma1il123.com',
            CommunityNickname = 'ppacit4',
            EmailEncodingKey = 'ISO-8859-1',
            TimeZoneSidKey = 'America/Chicago',
            LocaleSidKey = 'en_US', 
            LanguageLocaleKey = 'en_US',
            profileId = p.Id,
            City = 'Ranson',
            State = 'New York');
            insert b;
            
        user c = new user(
            LastName = 'test428',
            Alias = 'SWhite3',
            Email = 'johnsnow@johnsnowmail345.com',
            Username = 'johnsnow@john1sn5owmail345.com',
            CommunityNickname = 'snowwhitet4',
            EmailEncodingKey = 'ISO-8859-1',
            TimeZoneSidKey = 'America/Chicago',
            LocaleSidKey = 'en_US',
            LanguageLocaleKey = 'en_US',
            profileId = p.Id,
            City = 'Ranson',
            State = 'New York');
            insert c;
            
        user d = new user(
            LastName = 'test428',
            Alias = 'JBlack3',
            Email = 'johnsnow@johnsnowmail987.com',
            Username = 'johnsnow@johns7nowm4ail987.com',
            CommunityNickname = 'jackblackt4',
            EmailEncodingKey = 'ISO-8859-1',
            TimeZoneSidKey = 'America/Chicago',
            LocaleSidKey = 'en_US',
            LanguageLocaleKey = 'en_US',
            profileId = p.Id,
            City = 'Ranson',
            State = 'New York');
            insert d;

            //Set manager Id's for b and c to create hierarchy//
            b.managerId = a.Id;
            c.managerId = b.Id;
            update b;
            update c;
            
            user CSR = [SELECT id, managerID, SVP__c FROM User WHERE Id = :c.Id];
            system.assertEquals(b.managerId, a.Id);
            system.assertEquals(c.managerId, b.Id);
            
            //Ensure that changing the manager has set the SVP field//
            system.assertEquals(a.id, CSR.SVP__c);
            
            // change 'b' manager to d to invoke 2nd part of trigger. change SVP if manager's manager changes.//
            b.managerId = d.id;
            update b;
            user CSR1 = [SELECT id, managerID, SVP__c FROM User WHERE Id = :c.Id];
            system.assertEquals(d.Id, CSR1.SVP__c);
     }
    
}