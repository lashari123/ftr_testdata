public class RestCallerApiService {
    
    @AuraEnabled
    public static String getPhoneNumber(String recordId) {
        return [select Id, phone from Contact where Id =: recordId].phone;
    }
    
    @AuraEnabled
    public static void login(String phoneNo) {
        HttpRequest requestHttp = new HttpRequest();
        HttpResponse response;
        requestHttp.setEndpoint('https://pop1-apps.mycontactcenter.net/api/v1/tokens');
        requestHttp.setHeader('Content-Type', 'application/json');   
        requestHttp.setMethod('POST');
        String body = '{"AccountId": "frontiercom","Username": "apitoken","Password": "Frontier2020"}';
        requestHttp.setBody(body);
        
        try{
            if(!Test.isRunningTest()) {
                response = new Http().send( requestHttp );
            } else {
                response = new HttpResponse();
                response.setHeader('Content-Type', 'application/json');
                response.setBody('{"Token": "lrk+qhuiFz/jKCNArLjZJRqVR8738IczpIAsGjKMorI=","CreationDateUtc": "2021-01-12T22:49:48.1963664Z","ExpirationDateUtc": "2021-01-12T23:09:48.1963664Z"}');
                response.setStatusCode(200);
            }
            System.debug('response '+ response.getBody());
            Map<String, String> tokenBody = (Map<String, String>)JSON.deserialize(response.getBody(), Map<String, String>.class);
            System.debug('tokenBody '+ tokenBody);
            getSession(tokenBody.get('Token'), phoneNo);
        }catch(Exception e){
            System.debug('@@ Exception while Logging  - ' + e.getMessage());
            
        }
        
	}
    
    public static HttpResponse getSession(String accessToken, String phoneNo) {//misty.king@ftr.com
        String endpoint = 'https://pop1-apps.mycontactcenter.net/api/v1/cca/sessions?phoneNumber=&username=misty.king@ftr.com&email=';
        HttpRequest requestHttp = new HttpRequest();
        HttpResponse response;
        requestHttp.setEndpoint(endpoint);
        requestHttp.setHeader('Content-Type', 'application/json');
        requestHttp.setHeader('Token', '' + accessToken);
        requestHttp.setMethod('GET');
        
        try{
            if(!Test.isRunningTest()) {
            	response = new Http().send( requestHttp );
            } else {
                response = new HttpResponse();
                response.setHeader('Content-Type', 'application/json');
                response.setBody('[{"SessionId": "DEF4337D-B2F1-467B-8785-5C8E033B0001","AgentId": 1022720,"Username": "misty.king@ftr.com","PhoneNumber": "4698994463","StartDate": "2021-01-12T10:38:04.72"}]');
                response.setStatusCode(200);
            }
            System.debug(response);
            System.debug('response '+ response.getBody());
            List<Map<String, String>> sessionBody = (List<Map<String, String>>)JSON.deserialize(response.getBody(), List<Map<String, String>>.class);
            System.debug('sessionBody '+ sessionBody);
            makeRequest(accessToken, sessionBody.get(0).get('SessionId'), phoneNo);
        }catch(Exception e){
            System.debug('@@ Exception while session  - ' + e.getMessage());
            return null;
        }
        return response;
	}
    
    public static HttpResponse makeRequest(String accessToken, String sessionId, String phoneNo) {
        String endpoint = 'https://pop1-apps.mycontactcenter.net/api/v1/cca/sessions/' + sessionId + '/dial';
        HttpRequest requestHttp = new HttpRequest();
        HttpResponse response;
        requestHttp.setEndpoint(endpoint);
        requestHttp.setHeader('Content-Type', 'application/json');
        requestHttp.setHeader('Token', '' + accessToken);
        requestHttp.setMethod('POST');
        String body = '{"OrgPhoneNo": "6472771007","DstPhoneNo": "' + phoneNo + '","CallingName": "' + UserInfo.getName() + '","CallingNumber": "8888088088","ExecutionAsync": true,"ReturnRecUrl": true}';
        requestHttp.setBody(body);
        
        try{
            if(!Test.isRunningTest()) {
            	response = new Http().send( requestHttp );
            } else {
                response = new HttpResponse();
                response.setHeader('Content-Type', 'application/json');
                response.setBody('{"Message": "An error has occurred."}');
                response.setStatusCode(200);
            }
            System.debug('@@ body json- '+ response.getBody());
            Map<String, String> result = (Map<String, String>)JSON.deserialize(response.getBody(), Map<String, String>.class);
            System.debug('sessionBody '+ result);
            
        }catch(Exception e){
            System.debug('@@ Exception while Logging  - ' + e.getMessage());
            return null;
        }
        return response;
	}
    
}