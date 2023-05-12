/**************************************************************************************************
Name        :  ftr_WebServiceCalloutUtility
Developer   :  RajuM
Description :  This is a generic Webservice Utility class for any callouts we make from FTR 
****************************************************************************************************/

public with sharing class ftr_WebServiceCalloutUtility {
    
    //generic PSOT-method used to make extenal callouts
    public static HttpResponse callPostMethodService(Map<string, string> headers, string body, string endpoint){
        
      try {
            // Instantiate a new http object
            Http h = new Http();
            
            // Instantiate a new HTTP request
            HttpRequest req = new HttpRequest();
            for(string key: headers.keySet()){
                if(headers.get(key) != null){
                    req.setHeader(key, headers.get(key));
                    System.debug('req.headers in webcallout========'+(headers.get(key)));
                }
                
            }
            
            //specify the method (GET) as well as the endpoint
            req.setEndpoint(endpoint);
            req.setMethod('POST');
            //req.setHeader('Accept', 'application/json');
            //set body for the request
            if(body != null){
                req.setBody(body);
            }
            System.debug('body in webcallout========'+body);
            System.debug('endpoint in webcallout========'+endpoint);
            System.debug('headers in webcallout========'+headers);
          	
            //HttpResponse res =makeRequest(req);
            //return res; 
            //HttpResponse res = h.send(req);
            //return res;           
          
            HttpResponse res ;
            // Send the request, and return a response
            if(!Test.isRunningTest()) {
                res = h.send(req);
                
            }else{            
                res = new HttpResponse();
                res.setHeader('Content-Type', 'application/json');
                res.setBody('{\"emailTo\":[\"ftrqatestone@gmail.com\"],\"emailCc\":[],\"emailBcc\":[],\"emailFrom\":\"SEUserIdName\",\"opportunityId\":\"xyz123\",\"opportunityName\":\"opp123\",\"customerFirstName\":\"Adaams\",\"customerLastName\":\"Gomez\",\"customerAddress\":{\"addressLine1\":\"1313 Mocking Bird\",\"addressLine2\":\"Ln 1\",\"city\":\"Mocking Bird Heights\",\"state\":\"NY\",\"zipCode\":\"08057\"},\"customerNeedDescription\":\"customer need wifi svc\",\"leadProductList\":\"product1, product2 etc\"}');
                res.setStatusCode(200);
                //return res;
            }              
            return res; 
       } 
        catch(Exception ex){
            ftr_ErrorLogHandler.insertErrorLogs('FL_WebServiceCalloutUtility','callPostMethodService', ex);
            return null;
        } 
    }
    
    //Method to get the endpoint and headers in Map<string, object> structure from Custom Metadatatype
    //Param: string input for integration details
    
    public static Map<string, object> getIntegrationDetails(string mdtWebserviceName){
        
        Map<string, Object> mapIntegrationData = new Map<string, Object>();
        
        IntegrationAPIConfig__mdt interfaceDetails = [select DeveloperName, QueryParam__c, Endpoint__c, Authorization_Header__c, ApiKey__c from IntegrationAPIConfig__mdt where DeveloperName =: mdtWebserviceName limit 1]; 
        
        string endpoint = interfaceDetails.Endpoint__c; 
        
        if(string.isNotBlank(interfaceDetails.QueryParam__c)){
            endpoint += '?'+ interfaceDetails.QueryParam__c;
        }
        mapIntegrationData.put('endpoint', endpoint);
        
        if(string.isNotBlank(interfaceDetails.Authorization_Header__c)){
            mapIntegrationData.put('headers', getHeaders(interfaceDetails.Authorization_Header__c));
        } 
        
        if(string.isNotBlank(interfaceDetails.ApiKey__c)){
            mapIntegrationData.put('apikey',interfaceDetails.ApiKey__c);           
        }
        
        return mapIntegrationData;
    }     
    
    //Description: Method to get the headers in Map<string, string> structure
    //Param: Headers in string format with semicolon separated
    
    public static Map<string,string> getHeaders(string headers){
        Map<string, string> mapHeaders = new Map<string, string>();
        string[] apiHeaders = headers.split(';');
        for (string header : apiHeaders) {
            string[] hdr = header.split(':');
            mapHeaders.put(hdr[0], hdr[1]);
        }
        return mapHeaders;        
    } 
    
}