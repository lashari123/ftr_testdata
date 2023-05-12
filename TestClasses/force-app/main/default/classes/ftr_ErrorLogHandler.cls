/*******************************************************************************************
Name        :  ftr_ErrorLogHander
Developer   :  RajuM
Description :  This class inserts Error logs from Webservice callouts
********************************************************************************************/

public with sharing class ftr_ErrorLogHandler {
    
    public static void insertErrorLogs(String cName, String mName, Exception ex ){
                
        Error_Log__c err = new Error_Log__c(); 
        err.Class_Name__c = cName;
        err.Method_Name__c = mName;
        
        if(ex != null){     
            
            err.Description__c = ex.getMessage();
            err.Stack_Trace__c = ex.getStackTraceString();
            err.Line_Number__c = ex.getLineNumber();            
        } 
        
        insert err;
    }
    
    public static void insertErrorDescriptions(String cName, String mName, String descrp){
        
        Error_Log__c err = new Error_Log__c(); 
        err.Class_Name__c = cName;
        err.Method_Name__c = mName;
        
        if(string.isNotBlank(descrp)){
            err.Description__c = descrp;            
        }
        
        insert err ;        
    }    
    
}