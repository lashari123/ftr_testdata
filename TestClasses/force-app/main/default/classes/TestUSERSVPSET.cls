/**
 * This class contains unit tests for validating the behavior of Apex classes
 * and triggers.
 *
 * Unit tests are class methods that verify whether a particular piece
 * of code is working properly. Unit test methods take no arguments,
 * commit no data to the database, and are flagged with the testMethod
 * keyword in the method definition.
 *
 * All test methods in an organization are executed whenever Apex code is deployed
 * to a production organization to confirm correctness, ensure code
 * coverage, and prevent regressions. All Apex classes are
 * required to have at least 75% code coverage in order to be deployed
 * to a production organization. In addition, all triggers must have some code coverage.
 * 
 * The @isTest class annotation indicates this class only contains test
 * methods. Classes defined with the @isTest annotation do not count against
 * the organization size limit for all Apex scripts.
 *
 * See the Apex Language Reference for more information about Testing and Code Coverage.
 */
@isTest (seealldata = true)
private class TestUSERSVPSET {

    static testMethod void myUnitTest() {
        id userid = userinfo.getUserId();
        User mgr = [select managerid, svp__c from user where id =:userid];
        
       Profile p = [SELECT Id FROM Profile WHERE Name='Standard User']; 
       
      User u = new User();
      u.Alias = 'standt';
      u.Email='standarduser@testorg.com'; 
      u.EmailEncodingKey='UTF-8';
      u.LastName='Testing';
      u.LanguageLocaleKey='en_US'; 
      u.LocaleSidKey='en_US';
      u.ProfileId = p.Id;
      u.city='Plano';
      u.state ='Texas';
      u.managerid=mgr.ManagerId;
      u.TimeZoneSidKey='America/Los_Angeles';
      u.UserName='teststandarduser1@testorg.com';
      system.debug('Inserted User = ' + u);
      insert u;   
     
      User u1 =  [select managerid, svp__c from user where id =:u.Id];
      u1.ManagerId = u.ManagerId;
      u1.SVP__c = u.SVP__c;
      update u1;
    }
}