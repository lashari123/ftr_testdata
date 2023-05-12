public  class RemedySubmitTroubleTicket {
    
    
    public static string reqBody = '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:ECPManageTicket"><soapenv:Header><urn:AuthenticationInfo><urn:userName>ECP</urn:userName><urn:password>ECP</urn:password><urn:authentication>?</urn:authentication><urn:locale>?</urn:locale><urn:timeZone></urn:timeZone></urn:AuthenticationInfo></soapenv:Header><soapenv:Body><urn:TroubleTicketCreation><urn:Submitter>ECP</urn:Submitter><urn:Assigned_To></urn:Assigned_To><urn:Fld-OPTicketID></urn:Fld-OPTicketID><urn:Fld-SiteID2></urn:Fld-SiteID2><urn:Fld-CircuitID>61/HFGS/999999/   /CWTS/   </urn:Fld-CircuitID><urn:Fld-EscalationLevel>0</urn:Fld-EscalationLevel><urn:Fld-EscalationPerson>?</urn:Fld-EscalationPerson><urn:Fld-EscalationPhone>?</urn:Fld-EscalationPhone><urn:Fld-EscalationReason>?</urn:Fld-EscalationReason><urn:Fld-EscalationRequestDate></urn:Fld-EscalationRequestDate><urn:Fld-TelecommunicationServicePriorityCd></urn:Fld-TelecommunicationServicePriorityCd><urn:Fld-CustomerTroubleTickNum>1234</urn:Fld-CustomerTroubleTickNum><urn:Fld-ManagerContactPersonName>Stormy</urn:Fld-ManagerContactPersonName><urn:Fld-ManagerContactPersonPhone>999999999</urn:Fld-ManagerContactPersonPhone><urn:Fld-TimelineTextEntry>?</urn:Fld-TimelineTextEntry><urn:Fld-ALocationAccessName1></urn:Fld-ALocationAccessName1><urn:Fld-ALocationAccessName2></urn:Fld-ALocationAccessName2><urn:Fld-ALocationAccessPhoneNumber1>?</urn:Fld-ALocationAccessPhoneNumber1><urn:Fld-CustomerAddressCity></urn:Fld-CustomerAddressCity><urn:Fld-CustomerAddressState></urn:Fld-CustomerAddressState><urn:Fld-CustomerAddressZip></urn:Fld-CustomerAddressZip><urn:Fld-CustomerCivicAddress></urn:Fld-CustomerCivicAddress><urn:EXCHANGE_CARRIER_CIRCUIT_ID_D></urn:EXCHANGE_CARRIER_CIRCUIT_ID_D><urn:EXCHANGE_CARRIER_CIRCUIT_ID_N></urn:EXCHANGE_CARRIER_CIRCUIT_ID_N><urn:FLD-Circuit_Design__ID></urn:FLD-Circuit_Design__ID><urn:Fld-ALocationAccessEmail1>?</urn:Fld-ALocationAccessEmail1><urn:Fld-TransactionType>RequestTroubleReportCreationRequest</urn:Fld-TransactionType><urn:Fld-ImpactofService>?</urn:Fld-ImpactofService><urn:Fld-NetworkElement>?</urn:Fld-NetworkElement><urn:Fld-TroubleType>Alarm</urn:Fld-TroubleType><urn:ALAH-Monday>?</urn:ALAH-Monday><urn:ALAH-Tuesday>?</urn:ALAH-Tuesday><urn:ALAH-Wednesday>?</urn:ALAH-Wednesday><urn:ALAH-Thursday>?</urn:ALAH-Thursday><urn:ALAH-Friday>?</urn:ALAH-Friday><urn:ALAH-Saturday>?</urn:ALAH-Saturday><urn:ALAH-Sunday>?</urn:ALAH-Sunday><urn:ALAH-IntervalStart></urn:ALAH-IntervalStart><urn:ALAH-IntervalEnd></urn:ALAH-IntervalEnd><urn:Fld-DescriptionOfSympton>?</urn:Fld-DescriptionOfSympton><urn:Fld-NormalCircuiteID></urn:Fld-NormalCircuiteID><urn:FLD-CustomerName>Testing</urn:FLD-CustomerName><urn:ALOC_CLLI></urn:ALOC_CLLI><urn:ACNA>STO</urn:ACNA><urn:FLD-STATUSDESC>?</urn:FLD-STATUSDESC><urn:FLD-TYPEDESC>?</urn:FLD-TYPEDESC><urn:Fld-RequestType>?</urn:Fld-RequestType><urn:Fld-TroubleTypeINT>?</urn:Fld-TroubleTypeINT></urn:TroubleTicketCreation></soapenv:Body></soapenv:Envelope>';
    private static final String REQUEST_METHOD_POST = 'POST';
    private static final String AUTHORIZATION = 'Authorization';
    private static final String CONTENT_TYPE = 'Content-Type';
    private static final String API_KEY = 'apikey';
    private static final String SOAP_ACTION = 'SOAPAction';
    private static final String CREATE_ACTION = 'RequestTroubleReportCreationRequest';
    private static final String UPDATE_ACTION = 'ModifyAttributeRequest';
    
    public static Boolean isUpdate = false;
    public static String ticketNumber {get;set;}
    
   
    @future(callout=true)
    public static void submitTicket(Id stId, String transactionType, string action){
        
        Remedy_Ticket__c st  = [SELECT Id,Name,Customer_Ticket_Number__c,
                                Customer_Premise_Name__c,Customer_Address_City__c,
                                Service_Address_State__c,Customer_Address_Zip__c,
                                Customer_Civic_Address__c,Description__c,Local_Contact_Phone__c,
                                Company_Name__r.Name,Contact__r.Name,Reported_By_name__c,Reported_By_Send_Update__c,
                                Reported_By_Text_Number__c,Reported_By_Text_Send_Updates__c,
                                Local_Contact_Email__c,Reported_By_name__r.Name,Impacted_Service__c,
                                Local_Contact_Phone2__c,Local_Contact_Email2__c,Local_Contact_Name2__c,
                                Is_Intrusive_Testing_Allowed__c,Send_update__c,	Local_Text_Send_Updates__c,Trouble_Type__c,Circuit_Id__c,
                                Preferred_Contact_method__c,Escalate_Reason__c,Access_Hours__c,
                                Reported_By_Name_Text__c, Reported_By_Email__c, Reported_By_Phone__c,
                                Remedy_Trouble_Report_Status__c, Ticket_Status_Detail__c,
                                Additional_Contact_Email_1__c,Additional_Contact_Email_2__c,
                                Additional_Contact_Email_3__c, Additional_Contact_Email_4__c,
                                Additional_Contact_Email_5__c,Additional_Contact_Email_6__c,
                                Additional_Contact_Email_7__c,Additional_Contact_Email_8__c,
                                Additional_Contact_Phone_1__c,Additional_Contact_Phone_2__c,
                                Additional_Contact_Phone_3__c,Additional_Contact_Phone_4__c,
                                Additional_Contact_Phone_5__c,Additional_Contact_Phone_6__c,
                                Additional_Contact_Phone_7__c,Additional_Contact_Phone_8__c,
                                Send_update_1__c,Send_update_2__c,Send_update_3__c,Send_update_4__c,
                                Send_update_5__c,Send_update_6__c,Send_update_7__c,Send_update_8__c,
                                LocalContactText__c
                                FROM Remedy_Ticket__c WHERE Id =: stId];              
        
        system.debug('==='+transactionType);
        system.debug('==='+st.Escalate_Reason__c);
        
        List<User> currentUserList = [SELECT Id,Name,ContactId,Contact.AccountId FROM User WHERE Id =: UserInfo.getUserId()];
        User currentUser = !currentUserList.isEmpty()? currentUserList.get(0) : null;
        
        Remedy_Manage_Trouble_Tickets__c rm = Remedy_Manage_Trouble_Tickets__c.getInstance();
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(rm.End_point__c);
        
        Blob headerValue = Blob.valueOf(rm.Username__c + ':' + rm.Password__c);
        String authorizationHeader = 'Basic ' + EncodingUtil.base64Encode(headerValue);
        request.setHeader(AUTHORIZATION, authorizationHeader);
        request.setHeader(SOAP_ACTION, rm.SOAP_Action__c);
        
        request.setHeader(API_KEY,rm.Api_key__c);
        request.setHeader(CONTENT_TYPE, rm.Content_Type__c);
        request.setMethod(REQUEST_METHOD_POST);
        request.setBody(getRequestBody(st,transactionType, action));
        request.setTimeout(120000);
        HttpResponse response;
        if(Test.isRunningTest()) {
            response = new HttpResponse();
            response.setStatusCode(200);
            response.setBody('OP12345678901234567890');
        } else {
            response = http.send(request);
        }  
        if (response.getStatusCode() == 200) {
            String res = response.getBody();
            st.Customer_Ticket_Number__c = res.substring(res.indexOf('OP'), res.indexOf('OP')+15);
            st.Reported_By_name__c = UserInfo.getUserId();
            //st.Contact__c = currentUser.ContactId;
            // st.Company_Name__c = '0011k00000jCpebAAC'; //currentUser.Contact.AccountId;
            ticketNumber = st.Customer_Ticket_Number__c;
            System.debug(st);
            if(transactionType == CREATE_ACTION && !isUpdate){
                isUpdate = true;
                update st;
                if (st.Circuit_Id__c != '' && st.Circuit_Id__c != null){    
                    List<Asset__c> assets = [SELECT Id,Name,dpi_STATE__c,dpi_CITY__c,DPI_SERVICEADDRESS__c,dpi_ZIPCODE__c,
                                             DPI_POSTALCODE__c,Account__c,
                                             PRODUCT_DESCRIPTION_c__c,CircuitId__c,dpi_WTN__c FROM Asset__c
                                             WHERE CircuitId__c =: st.Circuit_Id__c];
                    for(Asset__c asset : assets){
                        asset.Ticket_Number_Ref__c = st.Customer_Ticket_Number__c;     
                        asset.Ticket_Id__c = st.Id;
                    }
                    update assets;
                }
            }              
        }else{
            if(currentUser != null)
            	createCase(currentUser.Contact.AccountId,response.getStatusCode() +'', response.getStatus() ,response.getBody(), request.getBody());
        }
    }
    
    @AuraEnabled
    public static User getCurrentUserData(){
        return [SELECT Id,Name FROM User WHERE Id =: UserInfo.getUserId()];
    }
    
    @AuraEnabled
    public static User getUserById(String userId){
        return [SELECT Id,Name,Email,Phone FROM User WHERE Id =: userId limit 1];
    }
    
    @AuraEnabled
    public static List<Remedy_Ticket__c> getTickets(Boolean isHomePage){
        User u = [select id , contactId from user where id =: userInfo.getUserId()];
        Contact con = New Contact();
        if(u.ContactId != null)
            con = [select id,AccountId from Contact where id=: u.ContactId];
        
        if(isHomePage){
            return [SELECT Id,Name,Customer_Ticket_Number__c,Company_Name__r.Name,Reported_By_name__r.Name,CreatedDate,Description__c,
                    Local_Contact_Email__c,Contact__r.Name,Local_Contact_Phone__c,Customer_Address_City__c,Service_Address_State__c,
                    Status__c,Impacted_Service__c,Service_Product_disc__c,DpiStatusChevron__c,Circuit_Id__c,Send_update__c,LocalContactText__c,Reported_By_Text_Number__c,
                    Additional_Contact_Email_1__c, Additional_Contact_Email_2__c, Additional_Contact_Email_3__c, Additional_Contact_Email_4__c, 
                    Additional_Contact_Email_5__c, Additional_Contact_Email_6__c, Additional_Contact_Email_7__c, Additional_Contact_Email_8__c,
                    Additional_Contact_Phone_1__c,Additional_Contact_Phone_2__c,Additional_Contact_Phone_3__c,Additional_Contact_Phone_4__c,
                    Additional_Contact_Phone_5__c,Additional_Contact_Phone_6__c,Additional_Contact_Phone_7__c,Additional_Contact_Phone_8__c,
                    Additional_Contact_Name_1__c, Additional_Contact_Name_2__c, Additional_Contact_Name_3__c, Additional_Contact_Name_4__c,
                    Additional_Contact_Name_5__c, Additional_Contact_Name_6__c, Additional_Contact_Name_7__c, Additional_Contact_Name_8__c,
                    Additional_Contact_Name_Text_1__c, Additional_Contact_Name_Text_2__c, Additional_Contact_Name_Text_3__c, Additional_Contact_Name_Text_4__c, 
                    Additional_Contact_Name_Text_5__c, Additional_Contact_Name_Text_6__c, Additional_Contact_Name_Text_7__c, Additional_Contact_Name_Text_8__c, 
                    Send_update_1__c, Send_update_2__c,Send_update_3__c,Send_update_4__c,Send_update_5__c,Send_update_6__c,Send_update_7__c,Send_update_8__c,
                    Reported_By_Name_Text__c,Reported_By_Email__c,Reported_By_Phone__c,Customer_Civic_Address__c,Customer_Address_Zip__c,Escalate_Time_Stamp__c,Escalated__c    
                    FROM Remedy_Ticket__c  where  Company_Name__c =: con.AccountId  AND Status__c != 'Closed' AND Status__c != 'Cancelled' ORDER BY CreatedDate DESC ];
            
        }
        else{
            return [SELECT Id,Name,Customer_Ticket_Number__c,Company_Name__r.Name,Reported_By_name__r.Name,CreatedDate,Description__c,
                    Local_Contact_Email__c,Contact__r.Name,Local_Contact_Phone__c,Customer_Address_City__c,Service_Address_State__c,LocalContactText__c,Reported_By_Text_Number__c,
                    Additional_Contact_Email_1__c, Additional_Contact_Email_2__c, Additional_Contact_Email_3__c, Additional_Contact_Email_4__c, 
                    Additional_Contact_Email_5__c, Additional_Contact_Email_6__c, Additional_Contact_Email_7__c, Additional_Contact_Email_8__c,
                    Additional_Contact_Phone_1__c,Additional_Contact_Phone_2__c,Additional_Contact_Phone_3__c,Additional_Contact_Phone_4__c,
                    Additional_Contact_Phone_5__c,Additional_Contact_Phone_6__c,Additional_Contact_Phone_7__c,Additional_Contact_Phone_8__c,
                    Additional_Contact_Name_1__c, Additional_Contact_Name_2__c, Additional_Contact_Name_3__c, Additional_Contact_Name_4__c,
                    Additional_Contact_Name_5__c, Additional_Contact_Name_6__c, Additional_Contact_Name_7__c, Additional_Contact_Name_8__c,
                    Additional_Contact_Name_Text_1__c, Additional_Contact_Name_Text_2__c, Additional_Contact_Name_Text_3__c, Additional_Contact_Name_Text_4__c, 
                    Additional_Contact_Name_Text_5__c, Additional_Contact_Name_Text_6__c, Additional_Contact_Name_Text_7__c, Additional_Contact_Name_Text_8__c, 
                    Send_update_1__c, Send_update_2__c,Send_update_3__c,Send_update_4__c,Send_update_5__c,Send_update_6__c,Send_update_7__c,Send_update_8__c,
                    Reported_By_Name_Text__c,Reported_By_Email__c,Reported_By_Phone__c,Status__c,Impacted_Service__c,Escalate_Time_Stamp__c,DpiStatusChevron__c,Circuit_Id__c,
                    Customer_Civic_Address__c,Customer_Address_Zip__c,Service_Product_disc__c,Escalated__c  
                    FROM Remedy_Ticket__c where  Company_Name__c =: con.AccountId ORDER BY CreatedDate DESC];
            //where Company_Name__c =: con.AccountId
        }
    }
    
    @AuraEnabled
    public static Remedy_Ticket__c getAccessHours(String recId) {
        return [SELECT Id, Access_Hours__c, Send_update__c FROM Remedy_Ticket__c WHERE Id =: recId];
    }
    
    @AuraEnabled
    public static Boolean setAccessHours(String recId, String accessHours, String preferredMethod, string reportedBy) {
       try{
           if(reportedBy == null) reportedBy = UserInfo.getUserId();
           user u = [SELECT Id,Name,Email,Phone FROM User WHERE Id =: reportedBy limit 1];
           Remedy_Ticket__c rt = new Remedy_Ticket__c(Id = recId, Access_Hours__c=accessHours, Preferred_Contact_method__c=preferredMethod);
           if(reportedBy == null) {
               rt.Reported_By_Email__c = u.Email;
               rt.Reported_By_Phone__c = u.Phone;
               rt.Reported_By_Name_Text__c = u.Name;
           }
           update rt;
           return true;
        } catch(exception e) {
            return false;
        }
    }
    
    @AuraEnabled
    public static String checkTicketNumber(Id recId){
        Remedy_Ticket__c st = [SELECT Id,Customer_Ticket_Number__c FROM Remedy_Ticket__c WHERE Id =: recId];
        return st.Customer_Ticket_Number__c;
    }
    
    @AuraEnabled
    public static Remedy_Ticket__c searchTicket(String ticketNumber){
        Remedy_Manage_Trouble_Tickets__c rm = Remedy_Manage_Trouble_Tickets__c.getInstance();
        Get_Remedy_Ticket_Details_v1__c rmd = Get_Remedy_Ticket_Details_v1__c.getInstance();
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        if(!test.isRunningTest()){
            request.setEndpoint(rmd.End_Point__c);
        }
        
        Blob headerValue = Blob.valueOf(rmd.Username__c + ':' + rmd.Password__c);
        String authorizationHeader = 'Basic ' + EncodingUtil.base64Encode(headerValue);
        request.setHeader(AUTHORIZATION, authorizationHeader);
        request.setHeader(SOAP_ACTION, rm.SOAP_Action__c);
        
        request.setHeader(API_KEY,rm.Api_key__c);
        request.setHeader(CONTENT_TYPE, rm.Content_Type__c);
        request.setMethod(REQUEST_METHOD_POST);
        
        request.setBody(getSearchTicketRequestBody(ticketNumber)); // change back to ticketNumber
        HttpResponse response;
        if(Test.isRunningTest()) {
            response = new HttpResponse();
            response.setBody('<test></test>');
        } else {
            response = http.send(request);
        }
        Dom.Document doc = new Dom.Document();
        doc.load(response.getBody());
        
        Dom.XMLNode root = doc.getRootElement();
        String requestStatus = '';
        String reportStatus = '';
        for(Dom.XMLNode child : root.getChildElements()) {
            for(Dom.XMLNode c : child.getChildElements()) {
                for(Dom.XMLNode p : c.getChildElements()) {
                    System.debug(p.getName());
                    if(p.getName() == 'Fld-RequestStatus'){
                        requestStatus = p.getText();
                    }
                    else if(p.getName() == 'Fld-TroubleReportStatus'){  
                        reportStatus = p.getText();
                    }
                }
                
                
                
            }
        }
        
        List<Remedy_Ticket__c> ticketInfoList  = [SELECT Id,Name,Status__c,Customer_Ticket_Number__c,Local_Contact_Email2__c,Local_Text_Send_Updates__c,LocalContactText__c,Reported_By_name__c,
                                                  Additional_Contact_Email_1__c, Additional_Contact_Email_2__c, Additional_Contact_Email_3__c, Additional_Contact_Email_4__c, 
                                                  Additional_Contact_Email_5__c, Additional_Contact_Email_6__c, Additional_Contact_Email_7__c, Additional_Contact_Email_8__c,
                                                  Additional_Contact_Phone_1__c,Additional_Contact_Phone_2__c,Additional_Contact_Phone_3__c,Additional_Contact_Phone_4__c,
                                                  Additional_Contact_Phone_5__c,Additional_Contact_Phone_6__c,Additional_Contact_Phone_7__c,Additional_Contact_Phone_8__c,
                                                  Additional_Contact_Name_1__c, Additional_Contact_Name_2__c, Additional_Contact_Name_3__c, Additional_Contact_Name_4__c,
                                                  Additional_Contact_Name_5__c, Additional_Contact_Name_6__c, Additional_Contact_Name_7__c, Additional_Contact_Name_8__c,
                                                  Additional_Contact_Name_Text_1__c, Additional_Contact_Name_Text_2__c, Additional_Contact_Name_Text_3__c, Additional_Contact_Name_Text_4__c,Preferred_Contact_method__c,
                                                  Additional_Contact_Name_Text_5__c, Additional_Contact_Name_Text_6__c, Additional_Contact_Name_Text_7__c, Additional_Contact_Name_Text_8__c, 
                                                  Contact__c,CreatedDate,Local_Contact_Phone2__c,Customer_Address_City__c,Service_Address_State__c,DpiStatusChevron__c,
                                                  Send_update_1__c, Send_update_2__c,Send_update_3__c,Send_update_4__c,Send_update_5__c,Send_update_6__c,Send_update_7__c,Send_update_8__c,Reported_By_Send_Update__c,
                                                  Reported_By_Name_Text__c,Reported_By_Email__c,Reported_By_Phone__c,Reported_By_Text_Number__c,Reported_By_Text_Send_Updates__c,Customer_Address_Zip__c,Company_Name__c,Description__c,Is_Intrusive_Testing_Allowed__c,Send_update__c,Escalate_Time_Stamp__c,Disable_Finish__c
                                                  FROM Remedy_Ticket__c WHERE Customer_Ticket_Number__c =: ticketNumber]; // change back to tickectNuber in where condition
        
        Remedy_Ticket__c ticketInfo;
        
        //ticketInfo.Status__c = requestStatus;
        //ticketInfo.Report_Status__c = reportStatus;
        if(ticketInfoList.size() > 0) {
            ticketInfo = ticketInfoList.get(0);
            setTicketStatus(ticketInfo, requestStatus, reportStatus);
            update ticketInfo;
        }
        
        if (requestStatus.toLowerCase() == 'closed' || requestStatus.toLowerCase() == 'cancelled' || 
            reportStatus.toLowerCase() == 'closed' || reportStatus.toLowerCase() == 'cancelled'){
                for(Remedy_Ticket__c remedyTkt:ticketInfoList){
                    clearTicketRefFromAsset(remedyTkt.Id);
                }
            }
        
        return ticketInfo;
    }
    
    
    public static Remedy_Ticket__c setTicketStatus(Remedy_Ticket__c ticketInfo, String requestStatus, String reportStatus){
        List<Trouble_Ticket_Chevron__mdt> troubleTicketChevron = [SELECT MasterLabel, Remedy_Trouble_Report_Status__c,
                                                                  Ticket_Status_Detail__c,Remedy_Ticket_Status__c
                                                                  FROM Trouble_Ticket_Chevron__mdt];
        
        Map<String,Trouble_Ticket_Chevron__mdt> chevronMap = new Map<String,Trouble_Ticket_Chevron__mdt>();
        //Map<String,Trouble_Ticket_Chevron__mdt> ticketStatusDetailMap = new Map<String,Trouble_Ticket_Chevron__mdt>();
        
        for (Trouble_Ticket_Chevron__mdt ttc : troubleTicketChevron) {
            chevronMap.put((ttc.Remedy_Ticket_Status__c+ttc.Remedy_Trouble_Report_Status__c).toLowercase(), ttc);
            // ticketStatusDetailMap.put(ttc.Remedy_Ticket_Status__c+ttc.Remedy_Trouble_Report_Status__c, ttc);
        }
        ticketInfo.Status__c = chevronMap.containsKey((requestStatus+reportStatus).toLowercase())? 
            chevronMap.get((requestStatus+reportStatus).toLowercase()).MasterLabel : null;
        ticketInfo.Ticket_Status_Detail__c = chevronMap.containsKey((requestStatus+reportStatus).toLowercase())? 
            chevronMap.get((requestStatus+reportStatus).toLowercase()).Ticket_Status_Detail__c : null;
        System.debug(ticketInfo);
        return ticketInfo;
    }
    
    
    public static String getSearchTicketRequestBody(String ticketNumber){
        return '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:ECPGetTicketDetail">'+
            '<soapenv:Header>'+
            '</soapenv:Header>'+
            '<soapenv:Body>'+
            '<urn:GetTicketDetail>'+
            '<urn:Fld-RequestID>'+ticketNumber+'</urn:Fld-RequestID>'+
            '</urn:GetTicketDetail>'+
            '</soapenv:Body>'+
            '</soapenv:Envelope>';
    }
    
    public static String getRequestBody(Remedy_Ticket__c st, String transactionType, string action){
        String ticketNum = st.Customer_Ticket_Number__c == null ? '' : st.Customer_Ticket_Number__c;
        // String escalationDate = String.valueOf(st.Escalation_Request_Date__c.month()+'/'+st.Escalation_Request_Date__c.day()+'/'+st.Escalation_Request_Date__c.year());
        String body;
        string sendLCText = 'No';
        string reportedByText = 'No';
        string escalationPerson= '';
        string escalationPhone = '';
        string escalationReason = '';
        integer escalationLevel = 0;
        string additionalEmail = getAdditionalEmails(st);
        string addTextNumber1 = '';
        string addTextNumber2 = '';
        string addTextNumber3 = '';
        string addTextNumber4 = '';
        string addTextNumber5 = '';
        string addTextNumber6 = '';
        string addTextNumber7 = '';
        string addTextNumber8 = '';
        string sendLCEmail = 'No';
        string reportedByEmail = 'No';
        string preferredContactMethod = st.Preferred_Contact_method__c;
        string sendAddlEmailUpdates = 'No';
        
        if (additionalEmail.length() > 0){
            sendAddlEmailUpdates = 'Yes';
        }
        
        if (st.Send_update__c == 'Yes'){
            sendLCEmail = 'Yes';
        }        
        
        if (st.Local_Text_Send_Updates__c == 'Yes'){
            sendLCText = 'Yes';
        } 
        
        if (st.Reported_By_Text_Send_Updates__c == 'Yes'){
            reportedByText = 'Yes';
        } 
        
        if (st.Reported_By_Send_Update__c == 'Yes'){
            reportedByEmail = 'Yes';
        } 
        
        
        if (st.Additional_Contact_Phone_1__c != '' && st.Additional_Contact_Phone_1__c != null){
            addTextNumber1 = st.Additional_Contact_Phone_1__c;
        }
        
        if (st.Additional_Contact_Phone_2__c != '' && st.Additional_Contact_Phone_2__c != null){
            addTextNumber2 = st.Additional_Contact_Phone_2__c;
        }
        
        if (st.Additional_Contact_Phone_3__c != '' && st.Additional_Contact_Phone_3__c != null){
            addTextNumber3 = st.Additional_Contact_Phone_3__c;
        }
        
        if (st.Additional_Contact_Phone_4__c != '' && st.Additional_Contact_Phone_4__c != null){
            addTextNumber4 = st.Additional_Contact_Phone_4__c;
        }
        
        if (st.Additional_Contact_Phone_5__c != '' && st.Additional_Contact_Phone_5__c != null){
            addTextNumber5 = st.Additional_Contact_Phone_5__c;
        }
        
        if (st.Additional_Contact_Phone_6__c != '' && st.Additional_Contact_Phone_6__c != null){
            addTextNumber6 = st.Additional_Contact_Phone_6__c;
        }
        
        if (st.Additional_Contact_Phone_7__c != '' && st.Additional_Contact_Phone_7__c != null){
            addTextNumber7 = st.Additional_Contact_Phone_7__c;
        }
        
        if (st.Additional_Contact_Phone_8__c != '' && st.Additional_Contact_Phone_8__c != null){
            addTextNumber8 = st.Additional_Contact_Phone_8__c;
        }
        
        
        
        if (st.Escalate_Reason__c != null){
            escalationPerson = st.Reported_By_name__r.Name;
            escalationPhone = st.Local_Contact_Phone2__c;
            escalationReason = st.Escalate_Reason__c;
            escalationLevel = 5;
        }
        if (action == 'create'){
        body = '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:ECPManageTicket">' +
            '<soapenv:Header />' +
            '<soapenv:Body>' +
            '<urn:TroubleTicketCreation>' +
            '<urn:Submitter>' +  + '</urn:Submitter>' +
            '<urn:Assigned_To>' +  + '</urn:Assigned_To>' +
            '<urn:Fld-OPTicketID>' + ticketNum   + '</urn:Fld-OPTicketID>' +
            '<urn:SEL-Source>' +  + '</urn:SEL-Source>' +
            '<urn:Fld-SiteID2>' +  + '</urn:Fld-SiteID2>' +
            '<urn:Fld-CircuitID>' + st.Circuit_Id__c + '</urn:Fld-CircuitID>' +
            '<urn:Fld-TicketPriority>' +  + '</urn:Fld-TicketPriority>' +
            '<urn:Fld-NetworkElement>' +  + '</urn:Fld-NetworkElement>' +
            '<urn:Fld-ImpactofService>' +  + '</urn:Fld-ImpactofService>' +
            '<urn:Fld-RequestType>' +  + '</urn:Fld-RequestType>' +
            '<urn:Fld-DescriptionOfSympton>' + st.Description__c + '  Advised Of Charges : YES,' + '</urn:Fld-DescriptionOfSympton>' +
            '<urn:Fld-EscalationLevel>' + escalationLevel  + '</urn:Fld-EscalationLevel>' +
            '<urn:Fld-EscalationPerson>' + escalationPerson + '</urn:Fld-EscalationPerson>' +
            '<urn:Fld-EscalationPhone>' + escalationPhone + '</urn:Fld-EscalationPhone>' +
            '<urn:Fld-EscalationReason>' + escalationReason + '</urn:Fld-EscalationReason>' +
            '<urn:Fld-EscalationRequestDate />' +
            '<urn:Fld-TelecommunicationServicePriorityCd />' +
            '<urn:Fld-CustomerTroubleTickNum>' +  + '</urn:Fld-CustomerTroubleTickNum>' +
            '<urn:Fld-TroubleTypeTXT>' +  + '</urn:Fld-TroubleTypeTXT>' +
            '<urn:Fld-TroubleTypeINT>' +  + '</urn:Fld-TroubleTypeINT>' +
            '<urn:Fld-TransactionType>' + transactionType  + '</urn:Fld-TransactionType>' +
            '<urn:Fld-TroubleType>' + st.Trouble_Type__c + '</urn:Fld-TroubleType>' +
            '<urn:Fld-CustomerAddressCity>' + st.Customer_Address_City__c + '</urn:Fld-CustomerAddressCity>' +
            '<urn:Fld-CustomerAddressState>' + st.Service_Address_State__c + '</urn:Fld-CustomerAddressState>' +
            '<urn:Fld-CustomerAddressZip>' + st.Customer_Address_Zip__c + '</urn:Fld-CustomerAddressZip>' +
            '<urn:Fld-CustomerCivicAddress>' + st.Customer_Civic_Address__c + '</urn:Fld-CustomerCivicAddress>' +
            '<urn:FLD-CustomerName>' + st.Company_Name__r.Name  + '</urn:FLD-CustomerName>' +
            '<urn:Fld-TroubleReportStatus>' + 'New'  + '</urn:Fld-TroubleReportStatus>' +
            '<urn:Fld-TroubleReportState>' + 'openActive'  + '</urn:Fld-TroubleReportState>' +
            '<urn:IntrusiveTestAuth>' + st.Is_Intrusive_Testing_Allowed__c + '</urn:IntrusiveTestAuth>' +
            '<urn:Fld-SupportLevel>' +  + '</urn:Fld-SupportLevel>' +
            '<urn:Legacy_CTF>' +  + '</urn:Legacy_CTF>' +
            '<urn:Fld-PortalMessage>' +  + '</urn:Fld-PortalMessage>' +
            '<urn:Customer_Contact_Method>' + preferredContactMethod  + '</urn:Customer_Contact_Method>' +
            '<urn:Send_Local_Contact_Updates>' + sendLCEmail + '</urn:Send_Local_Contact_Updates>' +
            '<urn:Send_LC_Text>' + sendLCText + '</urn:Send_LC_Text>' +
            '<urn:Send_AddlEmail_Updates>' + sendAddlEmailUpdates  + '</urn:Send_AddlEmail_Updates>' +
            '<urn:Reported_By_Name>' + (st.Reported_By_Name_Text__c != null ? st.Reported_By_Name_Text__c : '') + '</urn:Reported_By_Name>' +
            '<urn:Reported_By_Phone>' + (st.Reported_By_Phone__c != null ? st.Reported_By_Phone__c : '') + '</urn:Reported_By_Phone>' +
            '<urn:Reported_By_Email>' + (st.Reported_By_Email__c != null ? st.Reported_By_Email__c : '') + '</urn:Reported_By_Email>' +
            '<urn:Fld-SMS_Mobile_Numbers>' + (st.Reported_By_Text_Number__c != null ? st.Reported_By_Text_Number__c : '') + '</urn:Fld-SMS_Mobile_Numbers>' +
            '<urn:Send_SMS_Updates>' + reportedByText + '</urn:Send_SMS_Updates>' +
            '<urn:Local_Contact_Name>' + st.Local_Contact_Name2__c  + '</urn:Local_Contact_Name>' +
            '<urn:Local_Contact_Phone>' + (st.Local_Contact_Phone2__c != null ? st.Local_Contact_Phone2__c :'') + '</urn:Local_Contact_Phone>' +
            '<urn:Local_Contact_Email>' + (st.Local_Contact_Email2__c != null ? st.Local_Contact_Email2__c :'') + '</urn:Local_Contact_Email>' +
            '<urn:Fld-LC_Text_Number>' +  (st.LocalContactText__c != null? st.LocalContactText__c :'') + '</urn:Fld-LC_Text_Number>' +
            '<urn:Additional_Email_Addresses >' + additionalEmail + '</urn:Additional_Email_Addresses>' +
            '<urn:Send_RptBy_Updates>' + reportedByEmail + '</urn:Send_RptBy_Updates>' +
            '<urn:Fld-Text_Number_8>' + addTextNumber7 + '</urn:Fld-Text_Number_8>' +
            '<urn:Fld-Text_Number_2>' + addTextNumber1  + '</urn:Fld-Text_Number_2>' +
            '<urn:Send_Text_8>' + (st.Send_update_7__c != null? st.Send_update_7__c :'') + '</urn:Send_Text_8>' +
            '<urn:Fld-Text_Number_9>' + addTextNumber8 + '</urn:Fld-Text_Number_9>' +
            '<urn:Send_Text_9>' + (st.Send_update_8__c != null? st.Send_update_8__c :'') + '</urn:Send_Text_9>' +
            '<urn:Fld-Text_Number_4>' + addTextNumber3 + '</urn:Fld-Text_Number_4>' +
            '<urn:Fld-Text_Number_7>' + addTextNumber6 + '</urn:Fld-Text_Number_7>' +
            '<urn:Fld-Text_Number_5>' + addTextNumber4 + '</urn:Fld-Text_Number_5>' +
            '<urn:Fld-Text_Number_3>' + addTextNumber2  + '</urn:Fld-Text_Number_3>' +
            '<urn:Fld-Text_Number_6>' + addTextNumber5 + '</urn:Fld-Text_Number_6>' +
            '<urn:Send_SMS>' +  + '</urn:Send_SMS>' +
            '<urn:Send_Text_2>' + (st.Send_update_1__c != null? st.Send_update_1__c :'')  + '</urn:Send_Text_2>' +
            '<urn:Send_Text_3>' + (st.Send_update_2__c != null? st.Send_update_2__c :'') + '</urn:Send_Text_3>' +
            '<urn:Send_Text_4>' + (st.Send_update_3__c != null? st.Send_update_3__c :'') + '</urn:Send_Text_4>' +
            '<urn:Send_Text_5>' + (st.Send_update_4__c != null? st.Send_update_4__c :'') + '</urn:Send_Text_5>' +
            '<urn:Send_Text_6>' + (st.Send_update_5__c != null? st.Send_update_5__c :'') + '</urn:Send_Text_6>' +
            '<urn:Send_Text_7>' + (st.Send_update_6__c != null? st.Send_update_6__c :'') + '</urn:Send_Text_7>' +
            '<urn:Fld-TimelineTextEntry></urn:Fld-TimelineTextEntry>' +
            '<urn:Fld-ALocationAccessName2>' +  + '</urn:Fld-ALocationAccessName2>' +
            '<urn:AccHrs_ALOC>' + st.Access_Hours__c + '</urn:AccHrs_ALOC>' +
            '<urn:AccHrs_ZLOC>' +  + '</urn:AccHrs_ZLOC>' +
            '<urn:AccHrs_MOAH>' +  + '</urn:AccHrs_MOAH>' +
            '</urn:TroubleTicketCreation>' +
            '</soapenv:Body>' +
            '</soapenv:Envelope>';
        }else if (action == 'escalation'){
            body = '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:ECPManageTicket">' +
            '<soapenv:Header />' +
            '<soapenv:Body>' +
            '<urn:TroubleTicketCreation>' +
            '<urn:Submitter></urn:Submitter>' +
            '<urn:Assigned_To>' +  + '</urn:Assigned_To>' +
            '<urn:Fld-OPTicketID>' + ticketNum   + '</urn:Fld-OPTicketID>' +
            '<urn:Fld-TicketPriority></urn:Fld-TicketPriority>' +
            '<urn:Fld-EscalationLevel>' + escalationLevel  + '</urn:Fld-EscalationLevel>' +
            '<urn:Fld-EscalationPerson>' + escalationPerson + '</urn:Fld-EscalationPerson>' +
            '<urn:Fld-EscalationPhone>' + escalationPhone + '</urn:Fld-EscalationPhone>' +
            '<urn:Fld-EscalationReason>' + escalationReason + '</urn:Fld-EscalationReason>' +
            '<urn:Fld-TransactionType>' + transactionType  + '</urn:Fld-TransactionType>' +
            '<urn:Fld-TroubleType>' + st.Trouble_Type__c + '</urn:Fld-TroubleType>' +            
            '</urn:TroubleTicketCreation>' +
            '</soapenv:Body>' +
            '</soapenv:Envelope>';
        }else if (action == 'update'){
            body = '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:ECPManageTicket">' +
            '<soapenv:Header />' +
            '<soapenv:Body>' +
            '<urn:TroubleTicketCreation>' +
            '<urn:Submitter>' +  + '</urn:Submitter>' +
            '<urn:Assigned_To>' +  + '</urn:Assigned_To>' +
            '<urn:Fld-OPTicketID>' + ticketNum   + '</urn:Fld-OPTicketID>' +
            '<urn:Fld-TicketPriority>' +  + '</urn:Fld-TicketPriority>' +
            '<urn:Fld-TransactionType>' + transactionType + '</urn:Fld-TransactionType>' +
            '<urn:IntrusiveTestAuth>' + st.Is_Intrusive_Testing_Allowed__c + '</urn:IntrusiveTestAuth>' +
            '<urn:Fld-SupportLevel>' +  + '</urn:Fld-SupportLevel>' +
            '<urn:Legacy_CTF>' +  + '</urn:Legacy_CTF>' +
            '<urn:Fld-PortalMessage>' +  + '</urn:Fld-PortalMessage>' +
            '<urn:Customer_Contact_Method>' + st.Preferred_Contact_method__c  + '</urn:Customer_Contact_Method>' +
            '<urn:Send_Local_Contact_Updates>' + sendLCEmail + '</urn:Send_Local_Contact_Updates>' +
            '<urn:Send_LC_Text>' + sendLCText + '</urn:Send_LC_Text>' +
            '<urn:Send_AddlEmail_Updates>' + sendAddlEmailUpdates + '</urn:Send_AddlEmail_Updates>' +
            '<urn:Reported_By_Name>' + st.Reported_By_Name_Text__c + '</urn:Reported_By_Name>' +
            '<urn:Reported_By_Phone>' + st.Reported_By_Phone__c  + '</urn:Reported_By_Phone>' +
            '<urn:Reported_By_Email>' + st.Reported_By_Email__c + '</urn:Reported_By_Email>' +
            '<urn:Fld-SMS_Mobile_Numbers>' + (st.Reported_By_Text_Number__c != null ? st.Reported_By_Text_Number__c : '') + '</urn:Fld-SMS_Mobile_Numbers>' +
            '<urn:Send_SMS_Updates>' + reportedByText + '</urn:Send_SMS_Updates>' +
            '<urn:Local_Contact_Name>' + st.Local_Contact_Name2__c  + '</urn:Local_Contact_Name>' +
            '<urn:Local_Contact_Phone>' + st.Local_Contact_Phone2__c + '</urn:Local_Contact_Phone>' +
            '<urn:Local_Contact_Email>' + st.Local_Contact_Email2__c + '</urn:Local_Contact_Email>' +
            '<urn:Fld-LC_Text_Number>' +  (st.LocalContactText__c != null? st.LocalContactText__c :'') + '</urn:Fld-LC_Text_Number>' +
            '<urn:Additional_Email_Addresses >' + additionalEmail + '</urn:Additional_Email_Addresses>' +
            '<urn:Send_RptBy_Updates>' + reportedByEmail + '</urn:Send_RptBy_Updates>' +
            '<urn:Fld-Text_Number_8>' + addTextNumber7 + '</urn:Fld-Text_Number_8>' +
            '<urn:Fld-Text_Number_2>' + addTextNumber1  + '</urn:Fld-Text_Number_2>' +
            '<urn:Send_Text_8>' + (st.Send_update_7__c != null? st.Send_update_7__c :'') + '</urn:Send_Text_8>' +
            '<urn:Fld-Text_Number_9>' + addTextNumber8 + '</urn:Fld-Text_Number_9>' +
            '<urn:Send_Text_9>' + (st.Send_update_8__c != null? st.Send_update_8__c :'') + '</urn:Send_Text_9>' +
            '<urn:Fld-Text_Number_4>' + addTextNumber3 + '</urn:Fld-Text_Number_4>' +
            '<urn:Fld-Text_Number_7>' + addTextNumber6 + '</urn:Fld-Text_Number_7>' +
            '<urn:Fld-Text_Number_5>' + addTextNumber4 + '</urn:Fld-Text_Number_5>' +
            '<urn:Fld-Text_Number_3>' + addTextNumber2  + '</urn:Fld-Text_Number_3>' +
            '<urn:Fld-Text_Number_6>' + addTextNumber5 + '</urn:Fld-Text_Number_6>' +
            '<urn:Send_SMS>' +  + '</urn:Send_SMS>' +
            '<urn:Send_Text_2>' + (st.Send_update_1__c != null? st.Send_update_1__c :'')  + '</urn:Send_Text_2>' +
            '<urn:Send_Text_3>' + (st.Send_update_2__c != null? st.Send_update_2__c :'') + '</urn:Send_Text_3>' +
            '<urn:Send_Text_4>' + (st.Send_update_3__c != null? st.Send_update_3__c :'') + '</urn:Send_Text_4>' +
            '<urn:Send_Text_5>' + (st.Send_update_4__c != null? st.Send_update_4__c :'') + '</urn:Send_Text_5>' +
            '<urn:Send_Text_6>' + (st.Send_update_5__c != null? st.Send_update_5__c :'') + '</urn:Send_Text_6>' +
            '<urn:Send_Text_7>' + (st.Send_update_6__c != null? st.Send_update_6__c :'') + '</urn:Send_Text_7>' +
            '<urn:Fld-TimelineTextEntry></urn:Fld-TimelineTextEntry>' +
            '<urn:Fld-ALocationAccessName2>' +  + '</urn:Fld-ALocationAccessName2>' +
            '<urn:AccHrs_ALOC>' + st.Access_Hours__c + '</urn:AccHrs_ALOC>' +
            '<urn:AccHrs_ZLOC>' +  + '</urn:AccHrs_ZLOC>' +
            '<urn:AccHrs_MOAH>' +  + '</urn:AccHrs_MOAH>' +
            '</urn:TroubleTicketCreation>' +
            '</soapenv:Body>' +
            '</soapenv:Envelope>';       
        }
        System.debug('Remedy Tkt Request body:' + body);
        
        return body;
        
    }
    @AuraEnabled
    public static String updateTicket(id recId, String reasons){
        String str;
        system.debug(reasons);
        system.debug(recId);
        try{
            if(reasons != null){
                Remedy_Ticket__c rt = New Remedy_Ticket__c();
                rt.Id = recId;
                rt.Escalate_Reason__c = reasons;
                rt.Escalate_Time_Stamp__c = system.now();
                rt.Escalated_Person_Name__c = UserInfo.getUserId();
                rt.Disable_Finish__c= true;
                rt.Escalated__c  = 'Escalated!';
                update rt;
                str = 'Record updated successfully';
            }
        } catch(DMLException ex){
            str = string.valueOf(ex.getMessage());
        }
        return str;
    }
    
    @AuraEnabled
    public static String updateRemedyTicket(Remedy_Ticket__c rt){
        Map<String, Object> response = new Map<String, Object>();
        try {
            update rt;
            response.put('hasError', Boolean.valueOf('false'));
            response.put('errorMessage', String.valueOf(''));
        } catch(Exception ex){
            response.put('hasError', Boolean.valueOf('true'));
            response.put('errorMessage', String.valueOf(ex.getMessage()));
        }
        return JSON.serialize(response);
    }
    
    @AuraEnabled
    public static string getDPITicketStatus(id recId){
        
        Remedy_Ticket__c ticket = [SELECT Id,Circuit_Id__c,Customer_Ticket_Number__c,Environment__c from Remedy_Ticket__c where id =: recId];
        string statusCode;
        HttpResponse  res = New HttpResponse();
        responseDPIWrapperClass wrap = New responseDPIWrapperClass();
        if(Test.isRunningTest()) {
            res = new HttpResponse();
            res.setStatusCode(200);
            res.setBody('{"troubleTicket": [{"status": "0","stageCode":{"code":"CAN"}}]}');
        } else {
            res= Ftr_DpiTicketGetService.GetDpiticketservice(ticket.Customer_Ticket_Number__c, ticket.Environment__c);
        }   
        system.debug(res.getStatus());
        if(res.getStatusCode() == 200) { 
            wrap = (responseDPIWrapperClass)JSON.deserialize(res.getBody(), responseDPIWrapperClass.class); 
            statusCode = wrap.troubleTicket[0].stageCode.code;
            if(statusCode == 'CAN' || statusCode == 'Y' ){
                Remedy_Ticket__c rem = New Remedy_Ticket__c();
                rem.Id = recId;
                rem.Status__c = 'Cancelled';
                update rem;
                clearTicketRefFromAsset(recId);
            }
            if(statusCode == 'END' ||statusCode =='COM' || test.isRunningTest()){
                Remedy_Ticket__c rem = New Remedy_Ticket__c();
                rem.Id = recId;
                rem.Status__c = 'Resolved';
                update rem;
                clearTicketRefFromAsset(recId);
            }
            if(statusCode == 'CC' || statusCode == 'DIS' || statusCode == 'IXC'  || test.isRunningTest()){
                Remedy_Ticket__c rem = New Remedy_Ticket__c();
                rem.Id = recId;
                rem.Status__c = 'Assigned';
                update rem;
            }
        }
        return statusCode;
    }
    
    public static void clearTicketRefFromAsset(id tktId){
        
        List<Asset__c> assets = [SELECT Id,Name,dpi_STATE__c,dpi_CITY__c,DPI_SERVICEADDRESS__c,dpi_ZIPCODE__c,
                                 DPI_POSTALCODE__c,Account__c,
                                 PRODUCT_DESCRIPTION_c__c,CircuitId__c,dpi_WTN__c FROM Asset__c
                                 WHERE Ticket_Id__c =: tktId];
        for(Asset__c asset : assets){
            asset.Ticket_Number_Ref__c = '';     
            asset.Ticket_Id__c = '';
        }
        update assets;
    }
    // This Method create notes is used to insert the fields into community notes object from portal
    @AuraEnabled
    public static Id createNotes(String description,String recId){
        
        User user = [SELECT firstname, lastname from User where Id =: UserInfo.getUserId()];
        Community_Note__c cn = new Community_Note__c();
        cn.SubmitTicket__c = recId;
        // cn.Subject__c = sub;
        cn.Description__c = description;
        cn.Entered_By__c = (user.FirstName == null? '':user.FirstName) + ' ' + user.LastName;
        cn.User_Type__c = 'E';
        INSERT cn;
        
        return cn.Id;
        
    }
    // community notes end here
    @AuraEnabled
    public static List < Community_Note__c > getNotesList(String ticketId) {
        
        List < Community_Note__c > l_cn = [ SELECT Id, Name,  Description__c,createddate,CreatedById,Entered_By__c,User_Type__c,Entered_By_UserType__c,SubmitTicket__r.Contact__c,Customer_Name__c FROM Community_Note__c WHERE SubmitTicket__c=:ticketId ORDER BY CreatedDate DESC ];
        for(Community_Note__c cn:l_cn){
           // if(String.isBlank(cn.User_Type__c))
              //  cn.Entered_By__c += ','+cn.User_Type__c; 
            
        }
        return l_cn;
    }
    
    
    
    public class responseDPIWrapperClass{
        @AuraEnabled public List<troubleTicket> troubleTicket;
    }
    public class troubleTicket{
        @AuraEnabled public stageCode stageCode;
        @AuraEnabled public string status;
    }
    public class stageCode{
        @AuraEnabled public string code;
    }
    
    @AuraEnabled
    public static FTRRemedyGetNotes.getListValues_element[] getRemedyNotes(String ticketNumber){
        Remedy_Manage_Trouble_Tickets__c rm = Remedy_Manage_Trouble_Tickets__c.getInstance();
        Remedy_Ticket_Get_Notes__c rtnotes = Remedy_Ticket_Get_Notes__c.getInstance();
        
        FTRRemedyGetNotes.Portal_GetTimelimeSoap remedyNotesApi = new FTRRemedyGetNotes.Portal_GetTimelimeSoap();
        Blob headerValue = Blob.valueOf(rm.Username__c + ':' + rm.Password__c);
        String authorizationHeader = 'Basic ' + EncodingUtil.base64Encode(headerValue);
        
        Map<String,String> requestHeaderMap = new Map<String,String>();
        requestHeaderMap.put(AUTHORIZATION, authorizationHeader);
        requestHeaderMap.put(SOAP_ACTION, rm.SOAP_Action__c);
        requestHeaderMap.put(API_KEY, rm.Api_key__c);
        requestHeaderMap.put(CONTENT_TYPE, rm.Content_Type__c);
        remedyNotesApi.inputHttpHeaders_x = requestHeaderMap;
        remedyNotesApi.endpoint_x = rtnotes.EndPoint__c;

        string qualification = 'Fld-RequestID="' +  ticketNumber + '"';
        string startRecord ='';
        string maxLimit ='';
        FTRRemedyGetNotes.getListValues_element[] returnValue = remedyNotesApi.Timeline_Request(qualification, startRecord, maxLimit);
        System.debug('returnValue::'+returnValue);
        string portalMessage;
        System.debug('tkt number:' + ticketNumber);
        Id remedyTktId = getRemedyTicketId(ticketNumber);
        List<string> existingEntryIdList = getExistingNotes(remedyTktId);
        system.debug('noteElement : '+returnValue[0]);
        for (FTRRemedyGetNotes.getListValues_element noteElement : returnValue ){
            portalMessage = null;
            portalMessage = noteElement.Fld_PortalMessage;
            System.debug('existing entry list:' + existingEntryIdList);
            System.debug('note Element:' + noteElement.Fld_EntryID);
            if (!existingEntryIdList.contains(noteElement.Fld_EntryID)){
                if (portalMessage != null){
                    System.debug('portal message:' + portalMessage);
                    updateNotesEntryId(noteElement);
                }else{
                    System.debug('note Element 2:' + noteElement.Fld_EntryID);
                    string timelinePublicOption = noteElement.Ck_TimelinePublicOption;
                    if (timelinePublicOption == 'Yes'){
                    	addNotesToSFA(noteElement,remedyTktId);
                    }
                }
            }
        }
        return returnValue;
    }
    
    private static void updateNotesEntryId(FTRRemedyGetNotes.getListValues_element element){
        Id notesId = element.Fld_PortalMessage;
        System.debug('notes Id:' + notesId);
        Community_Note__c notes = [SELECT EntryID__c, User_Type__c, CreatedById FROM Community_Note__c WHERE Id=:notesId];
        notes.EntryID__c = element.Fld_EntryID;
        //notes.User_Type__c = 'E';
        UPDATE notes;
    }
    
    //This method will return existing notes from SFA
    public static List<string> getExistingNotes(string submitTicketId){
        //Id submitTicketId = getRemedyTicketId(ticketNumber);
        System.debug('submit ticket id:' + submitTicketId);
        List<Community_Note__c> existingNotes = [SELECT EntryID__c FROM Community_Note__c WHERE SubmitTicket__c = :submitTicketId];
        System.debug('existing notes:' + existingNotes);
        List<string> entryIdList = new List<string>();
        for (Community_Note__c notes : existingNotes){
            entryIdList.add(notes.EntryID__c);
        }
        System.debug('entryIdList:' + entryIdList);
        return entryIdList;
    }
    
    public static Id getRemedyTicketId(string ticketNumber){
        List<Remedy_Ticket__c> submitTicketIdList = [SELECT Id FROM Remedy_Ticket__c WHERE Customer_Ticket_Number__c = :ticketNumber];
        //Id tktId = [SELECT Id FROM Remedy_Ticket__c WHERE Customer_Ticket_Number__c = :ticketNumber];
        Id tktId = null;
        System.debug('tkt Id 1:' + submitTicketIdList);
        for (Remedy_Ticket__c tkt: submitTicketIdList){
            tktId = tkt.Id;
            System.debug('tkt Id 2:' + tktId);
            break;
        }
        System.debug('tkt Id:' + tktId);
        return tktId;
    }
    
    public static void addNotesToSFA(FTRRemedyGetNotes.getListValues_element element,id submitTicketId ){
        Community_Note__c note = new Community_Note__c();
        note.Description__c = element.Fld_ActionDetails;
        note.Entered_By__c = 'Frontier NOC' ;
        note.EntryID__c = element.Fld_EntryID;
        note.SubmitTicket__c = submitTicketId;
        note.User_Type__c = 'I';
        INSERT note;
    }
    
    
    @AuraEnabled
    @future(callout=true)
    public static void sendRemedyNotes(Id notesId){        
        Community_Note__c notes  = [SELECT Id,Description__c,Entered_By__c,SubmitTicket__c, EntryID__c
                                    FROM Community_Note__c WHERE Id =: notesId];
        
        if (notes.EntryID__c != null && notes.EntryID__c != ''){
            return; // do not add it to SFA
        }
        
        string transactionType = 'ModifyAttributeRequest';        
        Remedy_Ticket__c remedyTicket = [Select Customer_Ticket_Number__c FROM Remedy_Ticket__c WHERE Id =: notes.SubmitTicket__c];        
        User currentUser = [SELECT Id,Name,ContactId,Contact.AccountId FROm User WHERE Id =: UserInfo.getUserId()];        
        Remedy_Manage_Trouble_Tickets__c rm = Remedy_Manage_Trouble_Tickets__c.getInstance();
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(rm.End_point__c);
        
        Blob headerValue = Blob.valueOf(rm.Username__c + ':' + rm.Password__c);
        String authorizationHeader = 'Basic ' + EncodingUtil.base64Encode(headerValue);
        request.setHeader(AUTHORIZATION, authorizationHeader);
        request.setHeader(SOAP_ACTION, rm.SOAP_Action__c);
        
        request.setHeader(API_KEY,rm.Api_key__c);
        request.setHeader(CONTENT_TYPE, rm.Content_Type__c);
        request.setMethod(REQUEST_METHOD_POST);
        request.setBody(createNotesRequestBody(notes,transactionType,remedyTicket.Customer_Ticket_Number__c));
        request.setTimeout(120000);
        HttpResponse response;
        if(Test.isRunningTest()) {
            response = new HttpResponse();
            response.setStatusCode(200);
            response.setBody('OP12345678901234567890');
        } else {
            response = http.send(request);
        }  
        if (response.getStatusCode() == 200) {
            String res = response.getBody();
            System.debug('response:' + res);
            //notes.User_Type__c = 'E';
            //notes.EntryID__c = ''; //TODO update the notes id
            //notes.Entered_By__c = notes.CreatedById; //TODO 
            //update notes;
            //call getNotesList to update EntryId
            getRemedyNotes(remedyTicket.Customer_Ticket_Number__c);
        }
    }
    
    public static string createNotesRequestBody(Community_Note__c notes, string transactionType, string ticketNum){
        string body =    '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:ECPManageTicket">'+
            '<soapenv:Header>'+
            '</soapenv:Header>'+
            '<soapenv:Body>'+
            '<urn:TroubleTicketCreation>'+
            '<urn:Submitter></urn:Submitter>'+
            '<urn:Assigned_To></urn:Assigned_To>'+
            '<urn:Fld-OPTicketID>'+ticketNum+'</urn:Fld-OPTicketID>'+    
            '<urn:Fld-TicketPriority></urn:Fld-TicketPriority>' +
            '<urn:Fld-TransactionType>'+transactionType+'</urn:Fld-TransactionType>'+
            '<urn:Fld-PortalMessage>' + notes.Id  +'</urn:Fld-PortalMessage>' + 
            '<urn:Fld-TimelineTextEntry>'+ notes.Description__c +'</urn:Fld-TimelineTextEntry>'+            
            '</urn:TroubleTicketCreation>'+
            '</soapenv:Body>'+
            '</soapenv:Envelope>';
        System.debug('body:' + body);
        return body;
    }
    
    private static string getAdditionalEmails(Remedy_Ticket__c st){
        string emailList = '';
        if (st.Additional_Contact_Email_1__c != '' && st.Additional_Contact_Email_1__c != null ){
            emailList += st.Additional_Contact_Email_1__c ;
        }
        
        if (st.Additional_Contact_Email_2__c != '' && st.Additional_Contact_Email_2__c != null ){
            emailList += ';' + st.Additional_Contact_Email_2__c  ;
        }
        
        if (st.Additional_Contact_Email_3__c != '' && st.Additional_Contact_Email_3__c != null){
            emailList += ';' + st.Additional_Contact_Email_3__c  ;
        }
        
        if (st.Additional_Contact_Email_4__c != '' && st.Additional_Contact_Email_4__c != null){
            emailList += ';' + st.Additional_Contact_Email_4__c ;
        }
        
        if (st.Additional_Contact_Email_5__c != '' && st.Additional_Contact_Email_5__c != null){
            emailList += ';' + st.Additional_Contact_Email_5__c ;
        }
        
        if (st.Additional_Contact_Email_6__c != '' && st.Additional_Contact_Email_6__c != null){
            emailList += ';' + st.Additional_Contact_Email_6__c;
        }
        
        if (st.Additional_Contact_Email_7__c != '' && st.Additional_Contact_Email_7__c != null){
            emailList += ';' + st.Additional_Contact_Email_7__c;
        }
        
        if (st.Additional_Contact_Email_8__c != '' && st.Additional_Contact_Email_8__c != null){
            emailList += ';' + st.Additional_Contact_Email_8__c;
        }
        
        return emailList;
    }
    
    
    public static void createCase(Id accountId, string code, string errorStatus, string resBody, string reqBody){        
        RecordType rtype = [SELECT Id, description from RecordType  where name = 'Enterprise Portal Support Request' LIMIT 1];
        Case caseObject = new Case();
        caseObject.RecordTypeId = rtype.Id;
        caseObject.Case_Owner__c = 'Enterprise Portal Support Queue';
        caseObject.Status = 'New';
        caseObject.Subject = 'Error Code:' + code + ' Error Status:' + errorStatus;
        caseObject.Description = 'There was an error while creating/updating ticket:' + resBody;
        caseObject.AccountId = accountId;   
        caseObject.Comments__c = 'Request:' + reqBody;
        INSERT caseObject;        
    }
}