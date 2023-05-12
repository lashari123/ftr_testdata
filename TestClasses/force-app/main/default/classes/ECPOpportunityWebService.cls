@RestResource(urlMapping='/Opportunities/*')

global with sharing class ECPOpportunityWebService {
    
  //======================================================================================
  // *** REST GET *** : Require field should not be empty, method to get Opportunity List
  //======================================================================================  
  @HttpGet
  global static void doGet() {

      String bilg = RestContext.request.params.get('billingAddr');
      String shpg = RestContext.request.params.get('shippingAddr');
      String lead = RestContext.request.params.get('leadsource');
      
      bilg = (bilg != null) ? bilg.trim() : '';
      shpg = (shpg != null) ? shpg.trim() : '';
      
      // validate Input parameters.
      ECPHandler.Error resBody = validateInputParams(bilg, shpg, lead);
        
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
          RestContext.response.responseBody = Blob.valueOf(ecp.extractOpportunities(bilg, shpg, lead));
        }catch(Exception e) {
            RestContext.response.responseBody = Blob.valueOf(JSON.serializePretty(new ECPHandler.Error('1100', e.getMessage())));
        }
      }
  }
  
  global static ECPHandler.Error validateInputParams(String bilg, String shpg, String lead)
  {
      ECPHandler.Error resBody;
      boolean isBillingEmpty = String.isEmpty(bilg);
      boolean isShippingEmpty = String.isEmpty(shpg);
      boolean validBillingAddress = false;
      boolean validShippingAddress = false;
      boolean isLeadEmpty = String.isEmpty(lead);
      
      if (!isBillingEmpty && bilg.length() >= 10)
          validBillingAddress = true;

      if (!isShippingEmpty && shpg.length() >= 10)
          validShippingAddress = true;
                  
      if (isBillingEmpty && isShippingEmpty)
      {
        resBody = new ECPHandler.Error();
        resBody.FaultCode = '1000';
        resBody.FaultDescription = 'Input parameter missing: Both billingAddr [Billing Address] and shippingAddr [Shipping Address] can not be empty.';
      } else if (!validBillingAddress && !validShippingAddress) {
        resBody = new ECPHandler.Error();
        resBody.FaultCode = '1001';
        resBody.FaultDescription = 'Please enter valid billingAddr [Billing Address] OR shippingAddr [Shipping Address].';
      } else if (isLeadEmpty) {
        resBody = new ECPHandler.Error();
        resBody.FaultCode = '1002';
        resBody.FaultDescription = 'Input parameter missing: leadsource [Lead Source] is a required field to process Request.';
      }
      
      return resBody;
  }
    
}