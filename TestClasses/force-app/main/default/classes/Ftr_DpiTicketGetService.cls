public with sharing class Ftr_DpiTicketGetService {
    public static HttpResponse GetDpiticketservice(String tktNumber, string environment){
        Remedy_Manage_Trouble_Tickets__c rm = Remedy_Manage_Trouble_Tickets__c.getInstance();  
        	Dpi_Get_status__c dpiget= Dpi_Get_status__c.getInstance();
        
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        HttpResponse res = New HttpResponse();
        request.setEndpoint(dpiget.Endpoint__c+ 'ticketNumber=' + tktNumber + '&environment=' + environment);
        Blob headerValue = Blob.valueOf(rm.Username__c + ':' + rm.Password__c);
        String authorizationHeader = 'Basic ' + EncodingUtil.base64Encode(headerValue);
        request.setHeader('Authorization', authorizationHeader);
        request.setHeader('Content-Type', 'application/json');
        request.setHeader('apikey', rm.Api_key__c);
        request.setMethod('GET');
        request.setTimeout(120000);
        HttpResponse response;
        if(Test.isRunningTest()) {
            res = new HttpResponse();
            res.setStatusCode(200);
            res.setBody('');
        } else {
            res = http.send(request);
        }
        
        system.debug('res==='+res.getStatus());
        system.debug('res==='+res.getStatusCode());
        system.debug('res==='+res.getBody());
        
        return res;
    }
    
    
}