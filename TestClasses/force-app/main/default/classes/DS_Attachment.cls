public with sharing class DS_Attachment {
    
    public static Http http = new Http();
    public static HttpRequest req = null;
    
    public static HttpRequest getHttpRequest(){
        if (req == null)
            req = new HttpRequest();
            
        return req;
    }  
    
    public static HttpRequest initializeRequest(string URL) {
        req = getHttpRequest();
        req.setEndpoint(URL);
        req.setMethod('GET');
        req.setHeader('Authorization','OAuth 00Dc0000003kDHv!ARsAQFHVH7D1jKWfC.A4i2k7gjMLrHlmWDSxfNd2AkflguitpDJd0uczKyBTCFEIU7EDC5ocJVWHdPYSrH.AO9hVypIYTvye');
        req.setHeader('Content-Type', 'application/pdf');        
        return req;
    }
    
    public static Attachment getAttachment(){
        Attachment att = [select name, body,parentId from Attachment where parentID = '0014C000003vhrP' limit 1];
        
        return att;
    }
    
    @future(callout=true)
    public static void getAndInsertAttachment(string envId, string id){
        HttpResponse res = null;
        Attachment attReturned = null;
        req = initializeRequest('https://cs14.salesforce.com/services/apexrest/Envelope/Attachment?envid='+envId);
        
        System.debug(req);
        res = http.send(req);
        System.debug('Process send   ====   '+res.getStatusCode());
        if(res.getStatusCode() == 200){   
           Attachment attInsert = new Attachment();
           attInsert.name = 'DS_'+envid+'.pdf';
           attInsert.Body = res.getBodyAsBLob();
		   attInsert.ParentId = id; 
		   
		   insert attInsert;            
        }
    }
}