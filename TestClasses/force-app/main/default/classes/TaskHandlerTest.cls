@isTest(SeeAllData=true) 
public with sharing class TaskHandlerTest {
    static testMethod void testCreatesalescase() {
        Account NewAccount = new Account();
        NewAccount.Name = 'new account';
        newaccount.phone = '9999999999';
        insert newaccount;
        
        
        Case newCase = new case();
        newCase.account = newaccount;
        insert newCase;
                
        Task NewTask = New Task();
        NewTask.ActivityDate = date.Today();
        NewTask.Status = 'On Hold';
        NewTask.Subject = 'New Task';
        NewTask.RecordTypeId =[SELECT Id FROM RecordType WHERE Name = 'RFP Task' AND SobjectType = 'TASK' limit 1].Id;
        insert NewTask;
                
        NewTask = [SELECT ID,Description,subject FROM Task WHERE subject = 'New Task' LIMIT 1];
        NewTask.Description = 'New Description';
        update NewTask;
    }
}