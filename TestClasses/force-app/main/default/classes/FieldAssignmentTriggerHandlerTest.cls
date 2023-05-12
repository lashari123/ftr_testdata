/**
 * @description       : This test class covers the following Apex classes:
 *      TBD_CLASS1
 *      TBD_CLASS2
 *      TBD_CLASS3
 * @author            : TBD
 * @version           : 1 
**/
@isTest
public class FieldAssignmentTriggerHandlerTest {
    @testSetup static void prepareTestData() {
        Account a = new Account();
        a.Name = 'Test Account';
        insert a;
        WorkGroup__c wgrp1 = new WorkGroup__c();
        wgrp1.Name = 'Customer';
        wgrp1.Field__c = 'Network_Project_Specialist__c';
        wgrp1.Priority__c = 2;
        wgrp1.SupportedProducts__c = 'SDWAN;SDWAN - New or Upgrade Ethernet;Ethernet;IP Connect';
        wgrp1.ProductsForCheckingExistingRecords__c = 'SDWAN;Ethernet;SIP';
        insert wgrp1;
        FieldAssignment__c fAssmnt = new FieldAssignment__c();
        fAssmnt.UserId__c =  UserInfo.getUserId();
        fAssmnt.WorkGroupId__c = wgrp1.Id; 
        fAssmnt.AccountId__c = a.Id;
        fAssmnt.Primary__c= true; 
        fAssmnt.State__c = 'TX';
        fAssmnt.OutOfOffice__c = false;
        insert fAssmnt;
    }
    @isTest static void testOooSync() {
        Account a = new Account();
        a.Name = 'Test Account';
        insert a;
        
        WorkGroup__c wgrp2 = new WorkGroup__c();
        wgrp2.Name = 'Complex';
        wgrp2.Field__c = 'Network_Project_Specialist__c';
        wgrp2.Priority__c = 3;
        wgrp2.SupportedProducts__c = 'SDWAN;SDWAN - New or Upgrade Ethernet;Ethernet;IP Connect';
        wgrp2.ProductsForCheckingExistingRecords__c = 'SDWAN;Ethernet;SIP';
        insert wgrp2;
        FieldAssignment__c fAssmnt = new FieldAssignment__c();
        fAssmnt.UserId__c =  UserInfo.getUserId();
        fAssmnt.WorkGroupId__c = wgrp2.Id; 
        //fAssmnt.AccountId__c = a.Id;
        fAssmnt.Primary__c= true; 
        fAssmnt.State__c = 'TX';
        fAssmnt.States__c = 'TX;CT;CA;IL';
        fAssmnt.OutOfOffice__c = true;
        insert fAssmnt;
        Integer count = [Select count() from FieldAssignment__c where OutOfOffice__c = true];
        System.assertEquals(2, count);
        fAssmnt.OutOfOffice__c = false;
        update fAssmnt;
    }
}