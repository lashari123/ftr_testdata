@RestResource(urlMapping='/Circuits/*')

global with sharing class ECPCircuitWebService {
    
  //======================================================================================
  // *** REST GET *** : Require field should not be empty, method to get account Circuit List
  //======================================================================================  
  @HttpGet
  global static void doGet() {

      String accNum = RestContext.request.params.get('accountnumber');
      
      // validate Input parameters.
      ECPHandler.Error resBody = validateInputParams(accNum);
        
      if (resBody != null)
      {
        List<ECPHandler.Error> listval = new List<ECPHandler.Error>();
        listval.add(resBody);
        RestContext.response.responseBody = Blob.valueOf(JSON.serializePretty(listval));
      }
      else
      {
        try{
          // Now we are good to process the request.   
          ECPHandler ecp = new ECPHandler(); 
          RestContext.response.responseBody = Blob.valueOf(ecp.getCustomerInventory(accNum));              
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