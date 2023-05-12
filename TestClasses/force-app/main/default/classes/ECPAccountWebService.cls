/***********************************************************************************
Name : ECPAccountWebService
Created By : Mohan Talluri (mohan.talluri@ftr.com)
Created Date : January 26, 2016
Description :  An Apex REST service to support the following

1. GET/Account - Extracts all accounts and builds a hierarchy to send as response.
***********************************************************************************/

@RestResource(urlMapping='/Accounts/*')

global with sharing class ECPAccountWebService {


  //======================================================================================
  // *** REST GET *** : Require field should not be empty, method to get account Hierarchy
  //======================================================================================  
  @HttpGet
  global static void doGet() {

      String accNum = RestContext.request.params.get('accountnumber');
      
      // validate Input parameters.
      ECPHandler.Error resBody = validateInputParams(accNum);
        
      if (resBody != null)
      {
        //Apex not intelligent enough if written code (new List<ECPHandler.Error>()).add(resBody) directly.
        List<ECPHandler.Error> errList = new List<ECPHandler.Error>();
        errList.add(resBody);
        RestContext.response.responseBody = Blob.valueOf(JSON.serializePretty(errList));
      }
      else
      {
        try{
          // Now we are good to process the request.    
          ECPHandler ecp = new ECPHandler();
          RestContext.response.responseBody = Blob.valueOf(ecp.getAccountHierarcy(accNum));              
        }catch(Exception e) {
            RestContext.response.responseBody = Blob.valueOf(JSON.serializePretty(new ECPHandler.Error('1100', e.getMessage())));
        }
      }
  }
  
  global static ECPHandler.Error validateInputParams(String accNum)
  {
      ECPHandler.Error resBody;
      
      if (String.isEmpty(accNum))
      {
        resBody = new ECPHandler.Error();
        resBody.FaultCode = '1000';
        resBody.FaultDescription = 'Input parameter missing: accountnumber [Account Number] is mandatory to process the request.';
      }
      
      return resBody;
  }
  
}