@isTest
public class sendEscalationEmailBatch_test {
    static TestMethod Void testStart() {
        List<Case> testCases = new List<Case>();
        Set<Id> testIds = new Set<Id>();
        test.startTest();

        RecordType rt = [SELECT Id FROM RecordType WHERE Name = 'Out of Franchise' AND SobjectType = 'Case' LIMIT 1];
        Id rtId = rt.Id;
        
        Case testCase = new Case();
        testCase.RecordTypeId = rtId;
        testCase.DPI_Plant_Tables_Queue_Status__c = 'IN PROGRESS';
        testCase.DPI_Plant_Tables_Queue_Due_Date__c = Date.today() - 10;
        testCases.add(testCase);

        testCase = new Case();
        testCase.RecordTypeId = rtId;
        testCase.DPI_Tables_Queue_Status__c = 'IN PROGRESS';
        testCase.DPI_Tables_Queue_Due_Date__c = Date.today() - 10;
        testCases.add(testCase);

        testCase = new Case();
        testCase.RecordTypeId = rtId;
        testCase.EDW_Queue_Status__c = 'IN PROGRESS';
        testCase.EDW_Queue_Due_Date__c = Date.today() - 10;
        testCases.add(testCase);
        
        testCase = new Case();
        testCase.RecordTypeId = rtId;
        testCase.Taxation_Queue_Status__c = 'IN PROGRESS';
        testCase.Taxation_Queue_Due_Date__c = Date.today() - 10;
        testCases.add(testCase);

        testCase = new Case();
        testCase.RecordTypeId = rtId;
        testCase.Initiator_Queue_Status__c = 'IN PROGRESS';
        testCase.Initiator_Queue_Due_Date__c = Date.today() - 10;
        testCases.add(testCase);
        
        testCase = new Case();
        testCase.RecordTypeId = rtId;
        testCase.Order_Writer_Queue_Status__c = 'IN PROGRESS';
        testCase.Order_Writer_Queue_Due_Date__c = Date.today() - 10;
        testCases.add(testCase);
        
        testCase = new Case();
        testCase.RecordTypeId = rtId;
        testCase.X911_Queue_1_Status__c = 'IN PROGRESS';
        testCase.X911_Queue_1_Due_Date__c = Date.today() - 10;
        testCases.add(testCase);
        
        testCase = new Case();
        testCase.RecordTypeId = rtId;
        testCase.X911_Queue_2_Status__c = 'IN PROGRESS';
        testCase.X911_Queue_2_Due_Date__c = Date.today() - 10;
        testCases.add(testCase);
        
        insert testCases;
        
        for (Case tc : testCases){
            testIds.add(tc.Id);
        }
        
        sendEscalationEmailBatch objSendEscalationEmailBatch = new sendEscalationEmailBatch();
        Database.executeBatch(objSendEscalationEmailBatch, 200);
        List<Case> resultCases = [SELECT Id, 
                                  DPI_Plant_Tables_Queue_Status__c,
                                  DPI_Tables_Queue_Status__c,
                                  EDW_Queue_Status__c,
                                  Taxation_Queue_Status__c,
                                  Initiator_Queue_Status__c,
                                  Order_Writer_Queue_Status__c,
                                  X911_Queue_1_Status__c,
                                  X911_Queue_2_Status__c
                                  FROM Case 
                                  WHERE Id IN :testIds]; // AND DPI_Plant_Tables_Queue_Status__c = 'JEOPARDY'];
        system.debug('resultCases: ' + resultCases);
        //system.assert(resultCases.size() > 0);
        
        sendEscalationEmailBatchSchedule batchSched = new sendEscalationEmailBatchSchedule();
        batchSched.execute(null);
        
        test.stopTest();
    }
}