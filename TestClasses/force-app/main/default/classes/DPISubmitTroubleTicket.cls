public with sharing  class DPISubmitTroubleTicket {
    
    
     
    public  static void submitDpiTicket (Id stId){
        
        Remedy_Ticket__c st = [SELECT Id,Name,Customer_Ticket_Number__c,
                               Customer_Premise_Name__c,Customer_Address_City__c,
                               Service_Address_State__c,Customer_Address_Zip__c,
                               Customer_Civic_Address__c,Description__c,Local_Contact_Phone__c,
                               Company_Name__r.Name,Contact__r.Name,Reported_By_name__c,
                               Local_Contact_Email__c,Reported_By_name__r.Name,Impacted_Service__c,
                               Local_Contact_Phone2__c,Local_Contact_Email2__c,Local_Contact_Name2__c,
                               Is_Intrusive_Testing_Allowed__c,Send_update__c,Trouble_Type__c,Circuit_Id__c
                               FROM Remedy_Ticket__c WHERE Id =: stId];
      
         Remedy_Manage_Trouble_Tickets__c rm = Remedy_Manage_Trouble_Tickets__c.getInstance();         
         Http http = new Http();
         HttpRequest request = new HttpRequest();
        
        request.setEndpoint('https://api-qat01.frontier.com/trouble/v1/dpitroubletickets');
        Blob headerValue = Blob.valueOf(rm.Username__c + ':' + rm.Password__c);
        String authorizationHeader = 'Basic ' + EncodingUtil.base64Encode(headerValue);
        request.setHeader('Authorization', authorizationHeader);
        request.setHeader('Content-Type', 'application/json');
		//request.setHeader('Content-Length', '0' );
        request.setHeader('apikey', rm.Api_key__c);
        request.setHeader('ESB-requestingApplication', 'SFDC');
        request.setHeader('ESB-securityInfo.userId', 'ESB_REG');
        request.setMethod('POST');
       // request.setBody('{"troubleTicket": {"phoneNumber": "5705638425","type": "5008","notes": ["ONT down / all services out"],"aLocation": {"contact": {"name": "Hari Jadda","contactNumber": [{"phoneNumber": "5705638425","extension": "1234","type": "LANDLINE"}],"emailAddress": ["hjj017@ftr.com", "kxk991@ftr.com"],"remarks": "contact remarks"}},"remarks": "This is for testing for Enterprise Portal"},"autoSelectSchedule": true}');
       request.setBody(getDPIRequest(st));
        HttpResponse response;
        if(Test.isRunningTest()) {
             response = new HttpResponse();
            response.setStatusCode(200);
            response.setBody('');
        } else {
              response = http.send(request);
        }
         
        if (response.getStatusCode() == 200) {
            String res = response.getBody();
            system.debug(res);
            
        }
        
    }

    public static void getDPITicket(){
        Remedy_Manage_Trouble_Tickets__c rm = Remedy_Manage_Trouble_Tickets__c.getInstance();
          Http http = new Http();
         HttpRequest request = new HttpRequest();
		 String telNumber ='5705638425';
        request.setEndpoint('https://api-qat01.frontier.com/trouble/v1/dpitroubletickets?phoneNumber='+telNumber);
        Blob headerValue = Blob.valueOf(rm.Username__c + ':' + rm.Password__c);
        String authorizationHeader = 'Basic ' + EncodingUtil.base64Encode(headerValue);
        request.setHeader('Authorization', authorizationHeader);
        request.setHeader('Content-Type', 'application/json');
        request.setHeader('apikey', rm.Api_key__c);
        request.setMethod('GET');
       
        HttpResponse response;
        if(Test.isRunningTest()) {
            response = new HttpResponse();
            response.setStatusCode(200);
            response.setBody('');
        } else {
            response = http.send(request);
        }
        if (response.getStatusCode() == 200) {
           // String res = response.getBody();
            system.debug(response.getBody());
            
        }
    }
   
    public static String getDPIRequest(Remedy_Ticket__c st){
        String testNumber ='7845899';
		String testType='5037';
 		String input =  ' { "troubleTicket": {' +
					 '"phoneNumber":'+testNumber + ','+
                                '"type":'+st.Trouble_Type__c +','+
                                '"aLocation": {'+
                                                '"contact": {'+
																'"name":'+st.Local_Contact_Name2__c+','+
                                                                '"contactNumber": [{'+
                                                                                                '"phoneNumber":'+st.Local_Contact_Phone2__c+',' +
                                                                                                '"extension": "1234",' +
                                                                                                '"type": "LANDLINE"'+
                                                                                '}'+
                                                                ']'+','+
                                                                '"emailAddress":'+ '['+st.Local_Contact_Email2__c+'],'+
                                                                '"remarks": "contact remarks"'+
                                                '}'+
                                '}'+ ','+
                                '"remarks": "This is for testing for Enterprise Portal"'+
					'},'+
					'"autoSelectSchedule": true' +
					'}';
        return input;
    }

}