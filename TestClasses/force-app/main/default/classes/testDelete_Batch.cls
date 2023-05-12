@IsTest
public class testDelete_Batch {

    static testmethod void insertTask()  {
    
    account A = new account();
    a.name = 'new account';
    a.phone = '9876543210';
    a.region__c = 'west';
    
    insert a;
    
    Task t = new Task();
    Task t2 = new Task();
    
    t.status='Not Started';
    t.Priority = 'High';
    t.Description = 'Description';
    t.activitydate = system.today();
    t.WhatId = a.ID;
    
    insert t;
    
    t2.status='Not Started';
    t2.Priority = 'High';
    t2.Description = 'Description';
    t2.activitydate = system.today()-15;
    t2.Whatid = a.Id;
    
    insert t2;
    
    t.Description= 'Visit';
Update t;
//Id batchInstanceID = Database.executeBatch(new Delete_Batch());
String query = 'SELECT Id FROM Task';
       Test.startTest();
       Delete_Batch c = new Delete_Batch(query);
       Database.executeBatch(c);
       Test.stopTest();
    }}