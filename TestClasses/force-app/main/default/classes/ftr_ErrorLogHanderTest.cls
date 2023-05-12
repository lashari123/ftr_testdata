@isTest
public class ftr_ErrorLogHanderTest {
		
	@isTest    
	static void insertErrorLogsTest(){
                
    	Error_Log__c err = new Error_Log__c(); 
        err.Class_Name__c = 'Testclass';
        err.Method_Name__c = 'TestMethod';    
        err.Description__c = 'TestMessage';
        err.Stack_Trace__c = 'TestTrace';
        err.Line_Number__c = 12;   
        
        insert err;
        
        Exception ex;// = '{"response": {"operationStatus": "FALSE","executionStatusMessage": {"severity": "ERROR","service": "CommunicationManagement", "operation": "SendVologyEmail", "operationStatusCode": "000-000-0002", "operationStatusDescription": "Failure", "miscellaneousInformation":"API encountered a non-recoverable error and was not able to process the request." }} }';
        ftr_ErrorLogHandler.insertErrorLogs('Testclass','TestMethod',ex);
        ftr_ErrorLogHandler.insertErrorDescriptions('Testclass','TestMethod','TestTrace');
    }

}