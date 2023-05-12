@isTest
public class test_Directory_Listing_Case{
   
   static testMethod void Create_Directory_Listing_Case(){

//Community Records
         
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

//Test code for Directory Listing Cases
       
        RecordType rt = [Select id from RecordType where name ='Directory Listing'];
        System.debug(rt.id);
                    
        Case c = new Case(RecordtypeId =rt.id, Telephone_Number__c='9725424200',Requested_Name__c='City of McKinney',Street_Address__c='222 E. Tennessee Avenue',City__c='McKinney',CAP_State__c='TX',Status='New',Listed_Name__c='City of McKinney',Office_Name__c='Bridgeport, WV',LOC__c='Dallas, McKinney, Allen',Listing_Type__c='Government',Problem_Category__c='Telephone Number Incorrect',Description='The Number is really 972-547-7550');
        insert c;
        
        c.Assigned_To__c=User2.id;
        update c;  
        
}}