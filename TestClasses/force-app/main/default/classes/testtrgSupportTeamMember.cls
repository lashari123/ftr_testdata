@isTest
    private class testtrgSupportTeamMember
    {
        static testMethod void checkPermissionSet()
        {
            Profile p = [SELECT Id FROM Profile WHERE Name='Standard User' LIMIT 1];
           
            User u = new User(Alias = 'kev234', Email='standarduser@testorg.com',
                              EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US',
                              LocaleSidKey='en_US', ProfileId = p.Id,
                              TimeZoneSidKey='America/Los_Angeles',     UserName='csa_analyst@ftr.com');
            insert u;
           
            User u2 = new User(Alias = 'ktz234', Email='standarduser2@testorg.com',
                              EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US',
                              LocaleSidKey='en_US', ProfileId = p.Id,
                              TimeZoneSidKey='America/Los_Angeles',     UserName='support_team_member@ftr.com');
            insert u2;
            
            User u3 = new User(Alias = 'ktz234', Email='standarduser2@testorg.com',
                              EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US',
                              LocaleSidKey='en_US', ProfileId = p.Id,
                              TimeZoneSidKey='America/Los_Angeles',     UserName='accounttestuser@ftr.com');
            insert u3;
            
            // Query your permission set name from Organization that your want to test.
            PermissionSet ps = [SELECT Id FROM PermissionSet WHERE Name = 'Add_Support_Team_Members' LIMIT 1];
           
            // Assign the above inserted user for the above Permission Set.
            PermissionSetAssignment psa = new PermissionSetAssignment();
            psa.AssigneeId = u.Id;
            psa.PermissionSetId = ps.Id;
            insert psa;
            

            //Add Support Team Member with user with the permission set
            System.runAs(u)
            {
                Account a = new Account (Name = 'Support Team Member Test Account', Phone = '9725551212', Region__c = 'Central', BillingStreet = '500 5th Street', BillingCity = 'Dallas', BillingState = 'Texas', BillingPostalCode = '55555', ShippingStreet = '500 5th Street', ShippingCity = 'Dallas', ShippingState = 'Texas', ShippingPostalCode = '55555');
                //insert a;  
                
                try{                        
                //Support_Team_Member__c stm = new Support_Team_Member__c (Name = '', Team_Member__c = u2.id, Account__c = a.id, support_role__c = 'CSA');
                //insert stm;
                }catch(DMLException dm){
                    //System.assertEquals('Insert'',dm.message());
                }
            }
        }
        
         static testMethod void checkPermissionSet2()
        {
            Profile p = [SELECT Id FROM Profile WHERE Name='Frontier System Administrator' LIMIT 1];
           
            User u = new User(Alias = 'kev234', Email='standarduser@testorg.com',
                              EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US',
                              LocaleSidKey='en_US', ProfileId = p.Id,
                              TimeZoneSidKey='America/Los_Angeles',     UserName='csa_analyst@ftr.com');
            insert u;
           User u2 = new User(Alias = 'ktz234', Email='standarduser2@testorg.com',
                              EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US',
                              LocaleSidKey='en_US', ProfileId = p.Id,
                              TimeZoneSidKey='America/Los_Angeles',     UserName='support_team_member@ftr.com');
            insert u2;
            
            //Add Support Team Member with user with the permission set
           System.runAs(u)
            {
                Account a = new Account (Name = 'Support Team Member Test Account', Phone = '9725551212', Region__c = 'Central', BillingStreet = '500 5th Street', BillingCity = 'Dallas', BillingState = 'Texas', BillingPostalCode = '55555', ShippingStreet = '500 5th Street', ShippingCity = 'Dallas', ShippingState = 'Texas', ShippingPostalCode = '55555');
                insert a;  
                
                try{  
                Support_Team_Member__c stm = new Support_Team_Member__c (Name = '2323',
 Team_Member__c = userinfo.getuserid(), Account__c = a.id, support_role__c = 'National CSA');
                insert stm;                      
               //Support_Team_Member__c stm = new Support_Team_Member__c (Name = '', Team_Member__c = u2.id, Account__c = a.id, support_role__c = 'National CSA');
               // insert stm;
                }catch(DMLException dm){
                    //System.assertEquals('Insert'',dm.message());
                }
           }
        }
       
       
    }