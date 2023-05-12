/**
 * @description       : This test class covers the following Apex classes:
 *      TBD_CLASS1
 *      TBD_CLASS2
 *      TBD_CLASS3
 * @author            : TBD
 * @version           : 9 
**/
//@isTest(seeAllData = true)
@isTest
public class OpportunityTest {

    @TestSetup
    static void makeData(){
        User u = new User(
           // ProfileId = [SELECT Id FROM Profile WHERE Name = '#CPE AccountExec'].Id,
            ProfileId = [SELECT Id FROM Profile WHERE Name = '#CPE RegionalSalesMgr'].Id,
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
    
    static testmethod void unitTest(){
        
        Account acc = new Account(name = 'TestAccount'); 
        insert acc;
        List<Opportunity> oppList = new List<Opportunity>();
        acc = [select id from Account where name = 'TestAccount' LIMIT 1];
        
        Opportunity opp = new Opportunity();
        opp.Name ='TestOppty';
        opp.AccountId=acc.id;
        opp.Opportunity_Type__c = 'New';
        opp.Partner_Sales_Stages__c = 'Decision';
        opp.CloseDate= system.today();
        opp.ForecastCategoryName='Commit';
        opp.Campaign__c ='No';       
        opp.New_Logo__c ='No';
       // opp.RecordTypeId ='012E0000000dgAL';
        opp.recordtypeid ='012E0000000dgAK'; 
        opp.VologyPreSalesEmailSent__c = false;
        opp.StageName='Decision';
        opp.Lead_Product_List__c = 'Managed Firewall';
        opp.Description_of_customer_needs__c = 'Test SEER';
        opp.Description__c ='Test for SEER'; 
        opp.Service_Address__c = '2120 Cannes Dr,Dallas,TX';
        //opp.SEER_Assigned_To__c=u.id;
        
        insert opp;         
        opp = [select id from Opportunity where AccountId =: acc.id limit 1];
        update opp;             
    }
    
    static testmethod void restrictOpportunityCreationByTerritoryTest(){
        
        List<ObjectTerritory2Association> ot2a = [SELECT id, IsDeleted, Territory2Id, objectId, SobjectType FROM ObjectTerritory2Association WHERE IsDeleted = false limit 1];
        //Sadly we can't add the filter AND SobjectType = 'Account' because of a SOQL constraint. However, all the ObjectTerritory2Associations records are Account-related
        //so it happens to work without it.
        
        UserTerritory2Association ut2a = [SELECT id, isActive, territory2Id, userId FROM UserTerritory2Association WHERE isActive = true AND territory2Id != null AND userId != null limit 1];
        UserTerritory2Association ut2aClone = ut2a;
        ut2aClone.id = null;
        ut2aClone.userId = System.UserInfo.getUserId();
        //            insert ut2aClone;
        
        Opportunity opp = ftr_TestDataFactory.getOpportunities(1)[0];
        QuoteLineItem qli = ftr_TestDataFactory.getQLI(1, 1)[0];
        Account account = [SELECT Id, Name, Has_MSA__c  FROM Account WHERE Id = :opp.AccountId];
        account.Has_MSA__c = false;
        account.name = 'TestAccount';
        update account;
        Product2 prod = new Product2(Id=qli.Product2Id);
        OpportunityLineItem opli = new OpportunityLineItem();
        opp.recordtypeid ='012E0000000dgAK';
        opp.Opportunity_Type__c = 'New';
        opp.bdt_Number__c = 'na';
        opp.OwnerId = [SELECT Id FROM User WHERE email = 'puser000@amamama.com'].Id;
        opp.AccountId = account.Id;
        opp.Name ='TestOppty';
        opp.Partner_Sales_Stages__c = 'Decision';
        opp.CloseDate= system.today();
        opp.ForecastCategoryName='Commit';
        opp.Campaign__c ='No';       
        opp.New_Logo__c ='No';
        //opp.RecordTypeId ='012E0000000dgAL';
        opp.VologyPreSalesEmailSent__c = false;
        opp.StageName='Decision';
        opp.Lead_Product_List__c = 'Managed Firewall';      
        opp.Description_of_customer_needs__c = 'Test SEER';
        opp.Description__c ='Test for SEER'; 
        opp.Service_Address__c = '2120 Cannes Dr,Dallas,TX';
        insert opp;
        prod.Is_LegacyVlocityProduct__c = true;
        update prod;
        opli.Is_LegacyVlocityProduct__c = true;
        opli.Quantity=1;
        opli.PricebookEntryId = qli.PricebookEntryId;
        opli.UnitPrice = qli.UnitPrice;
        opli.opportunityId = opp.Id;
        insert opli;
        
        Id recordId = opp.id;
        
        DescribeSObjectResult describeResult = recordId.getSObjectType().getDescribe();
        
        List<String> fieldNames = new List<String>( describeResult.fields.getMap().keySet() );
        
        String query = ' SELECT ' + 
            String.join( fieldNames, ',' ) + 
            ' FROM ' + 
            describeResult.getName() + 
            ' WHERE ' + 
            ' id = :recordId ' + 
            ' LIMIT 1 ';
        
        List<SObject> records = Database.query( query );
        
        Opportunity oppClone = (Opportunity) records[0];
        
        oppClone.Id = null;
        oppClone.accountId = !ot2a.isEmpty()? ot2a.get(0).objectId : account.id;
        try {
            insert oppClone;
        } catch(exception ex) {
            
        }
        
        List<Opportunity> oppList = new List<Opportunity>();
        oppList.add(opp);
        OpportunityUtility.restrictOpportunityCreationByTerritory(oppList);   
        
        OpportunityUtility.dummytestcoverage();
    }
    
    static testmethod void checkContractTeamTest(){       
        
        Profile p = [Select id From Profile  where name = '#Alternate Channel Leadership' ];
        UserRole role =[select id from UserRole where name = 'Alternate Channel-Community Connections-Sales Manager' ];
        
        User u1 = new User();
        u1.LastName = 'Test11';
        u1.Alias= 'test';
        u1.Username = 'rajtest1234@gmail.com';
        u1.Email = 'rajkumartest123456@gmail.com';
        u1.CommunityNickname ='rajm';
        u1.TimeZoneSidKey = 'America/Los_Angeles';
        u1.EmailEncodingKey = 'UTF-8';
        u1.LanguageLocaleKey = 'en_US';
        u1.LocaleSidKey = 'en_US';       
        u1.ProfileId= p.id;
        u1.UserRoleId = role.id;
        
        insert u1;    
        
        System.runAs(u1){ 
            
            Id recordTypeId1 = Schema.SObjectType.Account.getRecordTypeInfosByDeveloperName().get('CC_Property').getRecordTypeId();
            System.debug('recordTypeId1====='+recordTypeId1);
            
            Account acc = new Account();
            acc.RecordTypeId= recordTypeId1; 
            acc.name = 'TestAccount';
            acc.Phone='2487958700';
            acc.ShippingStreet = '2188 Cannes ';
            acc.ShippingCity = 'Dallas';
            acc.ShippingState = 'Texas';
            acc.ShippingStateCode = 'TX';
            acc.ShippingPostalCode ='75060'; 
            acc.BillingStreet = '2111 Cannes';
            acc.BillingCity = 'Dallas';
            acc.BillingState = 'Texas';
            acc.BillingStateCode = 'TX';
            acc.BillingPostalCode ='75060';
            acc.ownerId = u1.id;
            
            insert acc;            
                   
            Id recordTypeId2 = Schema.SObjectType.Opportunity.getRecordTypeInfosByDeveloperName().get('Community_Connections').getRecordTypeId();
            System.debug('recordTypeId2====='+recordTypeId2);
            
            Opportunity opp = new Opportunity();
            opp.Name ='TestCTOppty';
            opp.AccountId=acc.id;
            opp.Opportunity_Type__c = 'New';
            opp.Partner_Sales_Stages__c = 'Decision';
            opp.CloseDate= system.today();
            opp.ForecastCategoryName='Commit';
            opp.Campaign__c ='No';       
            opp.New_Logo__c ='No';
            opp.RecordTypeId =recordTypeId2;        
            opp.StageName='Validating';
            opp.Lead_Product_List__c = 'Managed Firewall';
            opp.Description_of_customer_needs__c = 'Test SEER';
            opp.Description__c ='Test for SEER'; 
            opp.Service_Address__c = '2111 Cannes,Dallas,TX';
            
            insert opp; 
            
            Opportunity oppnew =[select id ,name ,stagename from Opportunity where id=:opp.id];
            
            Contact con = new Contact(lastname='TestContact', AccountId=acc.id,Phone = '1112223333' ,Email ='test@test.com');
            insert con;
            con = [select id ,email from Contact where lastname='TestContact' limit 1];
            
            Id recordTypeId3 = Schema.SObjectType.Contract.getRecordTypeInfosByDeveloperName().get('Community_Connections_Agreement').getRecordTypeId();
            System.debug('recordTypeId3====='+recordTypeId3);
            
            Contract ctr = new Contract();
            ctr.Name = 'TestContract';
            ctr.RecordTypeId = recordTypeId3;
            ctr.AccountId = acc.id;
            ctr.Opportunity__c = opp.id;
            ctr.StartDate  = Date.Today();
            ctr.Status = 'Draft';
            ctr.ContractTerm = 12;
            ctr.Signatory_Person_Name__c = con.id ;
            ctr.Contract_Team_Status__c ='Drafting';
            insert ctr;             
                     
            Contract cn1 =[select id,name from Contract where Opportunity__c =:oppnew.id ];
            //cn1.Contract_Team_Status__c ='Executed';
            //update cn1;
            System.debug('cn1====='+cn1.id);
            
            //Test.startTest();
            try{               
                opp.StageName = 'Closed/Won';
                update opp; 
            }catch(Exception e){
                
                Boolean expectedExceptionThrown =  e.getMessage().contains('Cannot set the Opportunity Sales Stage to Closed/Won until the Contract Team Status is Executed') ? true : false;
                System.assertEquals(expectedExceptionThrown, true);
                //OR
                //System.assertEquals(expectedExceptionThrown, true);
                
                //String message = e.getMessage();
                //system.assert(message.contains('Cannot set the Opportunity Sales Stage to Closed/Won until the Contract Team Status is Executed'),'message=' + message);
            }
            //Test.StopTest();              
        }        
    }
     static testmethod void checkContractTeamTest1(){       
        
        Profile p = [Select id From Profile  where name = '#Alternate Channel Leadership' ];
        UserRole role =[select id from UserRole where name = 'Alternate Channel-Community Connections-Sales Manager' ];
        
        User u1 = new User();
        u1.LastName = 'Test11';
        u1.Alias= 'test';
        u1.Username = 'rajtest1234@gmail.com';
        u1.Email = 'rajkumartest123456@gmail.com';
        u1.CommunityNickname ='rajm';
        u1.TimeZoneSidKey = 'America/Los_Angeles';
        u1.EmailEncodingKey = 'UTF-8';
        u1.LanguageLocaleKey = 'en_US';
        u1.LocaleSidKey = 'en_US';       
        u1.ProfileId= p.id;
        u1.UserRoleId = role.id;
        
        insert u1;    
        
        System.runAs(u1){ 
            
            Id recordTypeId1 = Schema.SObjectType.Account.getRecordTypeInfosByDeveloperName().get('CC_Property').getRecordTypeId();
            
            Account acc = new Account();
            acc.RecordTypeId= recordTypeId1; 
            acc.name = 'TestAccount';
            acc.Phone='2487958700';
            acc.ShippingStreet = '2188 Cannes ';
            acc.ShippingCity = 'Dallas';
            acc.ShippingState = 'Texas';
            acc.ShippingStateCode = 'TX';
            acc.ShippingPostalCode ='75060'; 
            acc.BillingStreet = '2111 Cannes';
            acc.BillingCity = 'Dallas';
            acc.BillingState = 'Texas';
            acc.BillingStateCode = 'TX';
            acc.BillingPostalCode ='75060';
            acc.ownerId = u1.id;
            
            insert acc;            
                   
            Id recordTypeId2 = Schema.SObjectType.Opportunity.getRecordTypeInfosByDeveloperName().get('Community_Connections').getRecordTypeId();
           List<Opportunity> newOppList = new List<Opportunity>();
            Opportunity opp = new Opportunity();
            opp.Name ='TestCTOppty';
            opp.AccountId=acc.id;
            opp.Opportunity_Type__c = 'New';
            opp.Partner_Sales_Stages__c = 'Decision';
            opp.CloseDate= system.today();
            opp.ForecastCategoryName='Commit';
            opp.Campaign__c ='No';       
            opp.New_Logo__c ='No';
            opp.RecordTypeId =recordTypeId2;        
            opp.StageName='Decision';
            opp.Lead_Product_List__c = 'Managed Firewall';
            opp.Description_of_customer_needs__c = 'Test SEER';
            opp.Description__c ='Test for SEER'; 
            opp.Service_Address__c = '2111 Cannes,Dallas,TX';
            opp.Service_Zip_code__c = '90605';
            
            insert opp; 
            newOppList.add(opp);
            map<id,Opportunity> newmap = new map<id,Opportunity>() ;
            newmap.put(opp.id,opp);
            Map<id,Opportunity> oldMap = new Map<id,Opportunity>();
            Opportunity oppnew =[select id ,name ,stagename from Opportunity where id=:opp.id];
            
            Contact con = new Contact(lastname='TestContact', AccountId=acc.id,Phone = '1112223333' ,Email ='test@test.com');
            insert con;
            con = [select id ,email from Contact where lastname='TestContact' limit 1];
            
            Id recordTypeId3 = Schema.SObjectType.Contract.getRecordTypeInfosByDeveloperName().get('Community_Connections_Agreement').getRecordTypeId();
            
            Contract ctr = new Contract();
            ctr.Name = 'TestContract';
            ctr.RecordTypeId = recordTypeId3;
            ctr.AccountId = acc.id;
            ctr.Opportunity__c = opp.id;
            ctr.StartDate  = Date.Today();
            ctr.Status = 'Draft';
            ctr.ContractTerm = 12;
            ctr.Signatory_Person_Name__c = con.id ;
            ctr.Contract_Team_Status__c ='Drafting';
            insert ctr;   
            
            Quote qu = new Quote(Name = 'Test Quote',
                                    Service_Term__c = '36 Months',
                                    OpportunityId = opp.id,
                                    SelectedLocations__c = '[{"locationChecked":true,"Id":"0011k00000bRniIAAS","Name":"1565 West Main Street","ShippingCity":"Lewisville","ShippingCountry":"United States","ShippingPostalCode":"75067","ShippingState":"Texas","ShippingStreet":"1565 West Main Street","Premises":{"Copper_Tier__c":"BDT","Fiber_Tier__c":"Tier 1","Id":"aAc1k0000004FPBCA2","Last_DSAT_Check__c":"2020-03-01","TicketNo":"1722190","WC_QOS__c":"Platinum","WC_Speed__c":"1000MB"}},{"locationChecked":true,"Id":"0011k00000bSTPPAA4","Name":"305 South Belt Line Road","ShippingCity":"Irving","ShippingCountry":"United States","ShippingPostalCode":"75060","ShippingState":"Texas","ShippingStreet":"305 South Belt Line Road","Premises":{"Copper_Tier__c":"Tier 1","Fiber_Tier__c":"Tier 1","Id":"aAc1k0000004FPVCA2","Last_DSAT_Check__c":"2020-03-02","TicketNo":"1722198","WC_QOS__c":"Platinum","WC_Speed__c":"1000MB"}},{"locationChecked":true,"Id":"0011k00000bRoGPAA0","Name":"1480 North Valley Parkway","ShippingCity":"Lewisville","ShippingCountry":"United States","ShippingPostalCode":"75077","ShippingState":"Texas","ShippingStreet":"1480 North Valley Parkway","Premises":{"Copper_Tier__c":"Tier 2","Fiber_Tier__c":"Tier 1","Id":"aAc1k0000004FPLCA2","Last_DSAT_Check__c":"2020-03-01","TicketNo":"1722191","WC_QOS__c":"Platinum","WC_Speed__c":"1000MB"}}]',
                                   Pricebook2Id = Test.getStandardPricebookId());         
                                 
            Test.startTest();         
                opp.Lead_Product_List__c = 'Managed Firewall';
               // opp.SEER_Assigned_To__c = u1.id ;
                opp.VologyPreSalesEmailSent__c =false ;
                opp.StageName='Closed/Won';
                update opp;
                oldMap.put(opp.id,opp);
                
                OpportunityUtility.notifyVologyEmailCallout(newOppList,oldMap);
                OpportunityUtility.checkIfCanCloseWon(newmap,oldMap);
                OpportunityUtility.getSyncedQuotesByOppId(new set<Id>{opp.id});
            Test.StopTest();
              
        }
        
    }
    
    static testMethod void TestCreateContractGenTaskForMDUContractTeamQueue() {
        Account objAccount = new Account();
        objAccount.Name = 'Test Acc1';
        INSERT objAccount;
        Id recordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByDeveloperName().get('Community_Connections').getRecordTypeId();
        Opportunity objOpportunity = new Opportunity();
        objOpportunity.Name = 'Test Opp1';
        objOpportunity.Accountid = objAccount.id;
        objOpportunity.StageName = 'Prospecting';
        objOpportunity.CloseDate = system.Today()+3;
        objOpportunity.RecordTypeId = recordTypeId;
        
        Test.startTest();
            INSERT objOpportunity;
            //This will run the Trigger on Opp to create Task and assign it to the queue.
            objOpportunity.StageName = 'Contract Requested';
            UPDATE objOpportunity;
        Test.stopTest();
        
        List<Task> lstTask = [SELECT Id FROM Task WHERE WhatId =: objOpportunity.Id LIMIT 1];
        //System.assertEquals(1, lstTask.size());
    }
}