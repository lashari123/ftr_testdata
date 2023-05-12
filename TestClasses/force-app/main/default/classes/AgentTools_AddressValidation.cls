global class AgentTools_AddressValidation {
    public String SelectedCriteria = 'Address';
    public RequestedAddress singleAddressLookup {get;set;}
    public List<RequestedAddress> multipleAddressLookup {get;set;}
    public List<ServiceAddress> ServiceAddresses {get;set;}
    public Integer SelectedRecordId {get;set;}
    public ServiceAddress SelectedRecord {get;set;}
    public Boolean DisplayPopup {get;set;}
    public string err = '';
    Map<String,String> technologyMap = new Map<String,String>();
    public string potsAvailableFlag {get;set;}
    public Boolean potsHsicapable {get;set;}
    public Boolean potsFibercapable {get;set;}
    public String toAddress {get;set;}
    public String setReplyTo {get;set;}

    global class LeadObject 
    {
         global string Street {get;set;}
         global string City {get;set;}
         global string StateCode {get;set;}
         global string State {get;set;}
         global string PostalCode {get;set;}
         global String Telephone {get;set;}
    }
    
    global AgentTools_AddressValidation(LeadObject this_lead){
        singleAddressLookup = new RequestedAddress();
        singleAddressLookup.Street = this_lead.Street;
        singleAddressLookup.City = this_lead.City;
        //singleAddressLookup.StateOrProvince = this_lead.StateCode;
        singleAddressLookup.StateOrProvince = this_lead.State;
        singleAddressLookup.PostalCode = this_lead.PostalCode;
        singleAddressLookup.Phone = this_lead.Telephone;
        ServiceAddresses = new List<ServiceAddress>();
        DisplayPopup = FALSE;
    }
    
    /*
    public AgentTools_AddressValidation(ApexPages.StandardController SC){
      if (!Test.isRunningTest()) { 
        SC.addFields(new String[]{'Street','City','State','PostalCode','Telephone'});
      }
        LeadObject this_lead = (LeadObject)SC.getRecord();
        singleAddressLookup = new RequestedAddress();
        singleAddressLookup.Street = this_lead.Street;
        singleAddressLookup.City = this_lead.City;
        //singleAddressLookup.StateOrProvince = this_lead.StateCode;
        singleAddressLookup.StateOrProvince = this_lead.State;
        singleAddressLookup.PostalCode = this_lead.PostalCode;
        singleAddressLookup.Phone = this_lead.Telephone;
        ServiceAddresses = new List<ServiceAddress>();
    }*/
    
    public ServiceAddress getServiceAddressDetail(){
        for(ServiceAddress this_record:ServiceAddresses){
            if(this_record.RecordId == SelectedRecordId){
                SelectedRecord = this_record;
            }
        }
        return SelectedRecord;
    }
    
    public void ShowPopup() {
        for(ServiceAddress this_record:ServiceAddresses){
            if(this_record.RecordId == SelectedRecordId){
                SelectedRecord = this_record;
            }
        }
        system.debug(logginglevel.info,selectedrecord);
        DisplayPopup = TRUE;
    }
    
    public void HidePopup(){
        SelectedRecord = new ServiceAddress();
        DisplayPopup = FALSE;
    }
    
    public void EmailError(Exception e){
        toAddress = System.Label.AddressValidation_toAddresses;
    	setReplyTo = System.Label.AddressValidation_setReplyTo;
        Messaging.reserveSingleEmailCapacity(2);
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] toAddresses = new String[]{toAddress}; //{'mohan.talluri@ftr.com'};
        mail.setToAddresses(toAddresses);
         
        mail.setReplyTo(setReplyTo);
        mail.setSenderDisplayName('Salesforce Automation');
        mail.setSubject(e.getTypeName() + ' - ' + e.getMessage());
        mail.setPlainTextBody('Stacktrace:\n\n' + e +'\n'+e.getStackTraceString()+'\n RequestAddress:  '+singleAddressLookup+'\n err'+err+'\n\n' + 'User Email: ' + userinfo.getUserEmail());
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
    } 
    
    public WS_ESB_ManageAddress.ManageAddressGetAddressRequest RTN_Request(){
        WS_ESB_ManageAddress.ManageAddressGetAddressRequest AddressRequest = new WS_ESB_ManageAddress.ManageAddressGetAddressRequest();
        AddressRequest.RequestCriteria.TelephoneNumber = new WS_ESB_BusinessObjects.TelephoneNumber();
        AddressRequest.RequestCriteria.TelephoneNumber.Number_x = singleAddressLookup.Phone.replaceAll('[^0-9]', '');
        AddressRequest.RequestCriteria.Action = 'RetrieveServiceAddress';
        return AddressRequest;
    }
    
    public WS_ESB_ManageAddress.ManageAddressGetAddressRequest RPSA_Request(){
        WS_ESB_ManageAddress.ManageAddressGetAddressRequest AddressRequest = new WS_ESB_ManageAddress.ManageAddressGetAddressRequest();
        WS_ESB_BusinessObjects.AddressType AddressType = new WS_ESB_BusinessObjects.AddressType();                      
        WS_ESB_BusinessObjects.AddressText AddressText = new WS_ESB_BusinessObjects.AddressText();
        AddressText.AddressText = singleAddressLookup.Street;
        AddressText.SequenceNumber = 1;     
        AddressType.PostalAddress.AddressText.add(AddressText);     
        AddressType.PostalAddress.Locality = singleAddressLookup.City;
        AddressType.PostalAddress.StateOrProvince = singleAddressLookup.StateOrProvince;
        AddressType.PostalAddress.Postcode = singleAddressLookup.PostalCode;
        AddressRequest.RequestCriteria.Action = 'RetrievePostalAndServiceAddress';
        AddressRequest.RequestCriteria.Address = AddressType;
        return AddressRequest;
    }
    
    public WS_ESB_ManageAddress.ManageAddressGetAddressRequest RSA_Request(){
        WS_ESB_ManageAddress.ManageAddressGetAddressRequest AddressRequest = new WS_ESB_ManageAddress.ManageAddressGetAddressRequest();
        WS_ESB_BusinessObjects.AddressType AddressType = new WS_ESB_BusinessObjects.AddressType();                      
        WS_ESB_BusinessObjects.AddressText AddressText = new WS_ESB_BusinessObjects.AddressText();
        AddressText.AddressText = singleAddressLookup.Street;
        AddressText.SequenceNumber = 1;     
        AddressType.PostalAddress.AddressText.add(AddressText);     
        AddressType.PostalAddress.Locality = singleAddressLookup.City;
        AddressType.PostalAddress.StateOrProvince = singleAddressLookup.StateOrProvince;
        AddressType.PostalAddress.PostCode = singleAddressLookup.PostalCode;
        AddressRequest.RequestCriteria.Action = 'RetrieveServiceAddress';
        AddressRequest.RequestCriteria.Address = AddressType;
        system.debug('Address Request:\n\n' + AddressRequest);
        return AddressRequest;
    }
    
    //public API_Callout__c LOG_API(Datetime StartTime, Map<String,String> OutputHeaders){
    //  API_Callout__c API_CALLOUT = new API_Callout__c();
    //  API_CALLOUT.DateTime__c = StartTime;
    //  API_CALLOUT.Duration__c = datetime.now().getTime() - StartTime.getTime();
    //  String this_status = OutputHeaders.get(null);           
    //  API_CALLOUT.StatusProtocol__c = this_status.left(this_status.indexOf(' '));
    //  API_CALLOUT.StatusCode__c = this_status.substring(this_status.indexOf(' '));
    //  API_CALLOUT.ClientIPs__c = OutputHeaders.get('X-Client-IP');
    //  return API_CALLOUT;
    //}
    //public API_Callout__c LOG_API(Datetime StartTime, Exception e){
    //  API_Callout__c API_CALLOUT = new API_Callout__c();
    //  API_CALLOUT.DateTime__c = StartTime;
    //  API_CALLOUT.StatusMessage__c = e.getMessage();
    //  return API_CALLOUT;
    //}
    
    private void getNewAddressess(List<WS_ESB_BusinessObjects.AddressType> addList, integer size){
        Integer i = 1; 
        for(WS_ESB_BusinessObjects.AddressType ThisAddress : addList){   
            System.debug('This Address----------------------------------'+JSON.SerializePretty(ThisAddress.ServiceAddress)+'----Size of list-----'+addList.size());
            if(i<size){
                ServiceAddress NewServiceAddress = new ServiceAddress();
                NewServiceAddress.RecordId = i;
                NewServiceAddress.Address = ThisAddress.ServiceAddress;                
                
                System.debug('NewServiceAddress.Address'+NewServiceAddress.Address);
                if(ThisAddress.ServiceAddress != null && ThisAddress.ServiceAddress.InternetInfo != null && 
                   ThisAddress.ServiceAddress.InternetInfo.Connections != null && ThisAddress.ServiceAddress.InternetInfo.Connections.Connection != null){
                                 
                       WS_ESB_BusinessObjects.InternetInfoType this_internetinfo = ThisAddress.ServiceAddress.InternetInfo ;
                       potsHsicapable = this_internetinfo.HSIAvailableFlag;
                       potsFibercapable = this_internetinfo.FiberProductCapableFlag;                       
                      
                       System.debug('potsHsicapable========='+potsHsicapable+'potsFibercapable========='+potsFibercapable);
                       System.debug('conncection Size--bbbbbbbbbbbbbbb----'+ ThisAddress.ServiceAddress.InternetInfo.Connections.Connection.size());
                       for(WS_ESB_BusinessObjects.ConnectionType this_connectiontype : ThisAddress.ServiceAddress.InternetInfo.Connections.Connection){
                           if(this_connectiontype.Technologies != null && this_connectiontype.Technologies.Technology != null){
                               System.debug('this_technology---size--------'+this_connectiontype.Technologies.Technology.size());
                               for(WS_ESB_BusinessObjects.TechnologyType this_technology : this_connectiontype.Technologies.Technology){                                   
                                   if(this_technology.CustomerType != null){
                                       if(this_technology.CustomerType == 'Business'){
                                           NewServiceAddress.Business_Technologies.add(this_technology);                                            
                                           if(this_technology.TechnologyGroup == 'IPTECH' && this_technology.Technology == 'DATA-VDSL'){
                                               NewServiceAddress.UVerseCapable = TRUE;
                                           }                                            
                                           /* Start - added for POTS availability */                                            
                                           if(this_technology.Technology != null && this_technology.TechFeature != null){
                                               technologyMap.put(this_technology.Technology,this_technology.TechFeature);
                                               System.debug('Technology=========='+this_technology.Technology+'======TechFeature=========='+this_technology.TechFeature);
                                           }
                                           NewServiceAddress.POTSCapable = FALSE;
                                           if( potsHsicapable && !potsFibercapable ){                    
                                               NewServiceAddress.POTSCapable = TRUE;
                                               System.debug('POTSCapable-195=========='+NewServiceAddress.POTSCapable);                    
                                           }                 
                                           else{                    
                                               if (technologyMap != null && technologyMap.size() > 0) {
                                                   System.debug('Technology Map=========='+technologyMap);
                                                   if (technologyMap.containsKey('XPON')) {
                                                       potsAvailableFlag = technologyMap.get('XPON'); 
                                                   } 
                                                   else if (technologyMap.containsKey('GPON')) {
                                                       potsAvailableFlag = technologyMap.get('GPON'); 
                                                   } 
                                                   else if (technologyMap.containsKey('BPON')) {
                                                       potsAvailableFlag = technologyMap.get('BPON'); 
                                                   }
                                               }
                                               if ('X'.equalsIgnoreCase(potsAvailableFlag)) {
                                                   NewServiceAddress.POTSCapable = TRUE;
                                                   System.debug('POTSCapable-213=========='+NewServiceAddress.POTSCapable);
                                               } 
                                           } 
                                           /* End - added for POTS availability */                                             
                                       }else if(this_technology.CustomerType == 'Residential'){
                                           NewServiceAddress.Residential_Technologies.add(this_technology);
                                       }                                       
                                   }
                               }
                           }
                       } 
                       ServiceAddresses.add(NewServiceAddress);
                       i++; 
                   }                
            }
            else
                break;
        }
        System.debug('ServiceAddresses.size() aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa----------  '+ServiceAddresses.size());
    }  
    
    public void RetrieveAddressRecords(){
        ServiceAddresses.clear();
        WS_ESB_ManageAddress.Callout AddressCallout = new WS_ESB_ManageAddress.Callout();
        Map<String,String> MAP_MESSAGES = new Map<String,String>();
        System.debug('Request============'+JSON.SerializePretty(singleAddressLookup));
        
        if(SelectedCriteria == 'Address'){
            Datetime RPSA_DT = datetime.now();
            system.debug('TESTING INSIDE ADDRESS============');
            try {               
                    WS_ESB_ManageAddress.ManageAddressGetAddressResponse Response = AddressCallout.GetAddress(RPSA_Request().RequestCriteria);
                    System.debug('Address============'+JSON.SerializePretty(Response.Address));
                	System.debug('ExecutionStatus============'+Response.ExecutionContext.ExecutionStatus);
                    
                    if(Response != null && Response.ExecutionContext != null && Response.ExecutionContext.ExecutionStatus != null ){
                        
                            System.debug('Response.ExecutionContext.ExecutionStatus.ExecutionStatusSuccessFlag'+Response.ExecutionContext.ExecutionStatus.ExecutionStatusSuccessFlag);
                            if(Response.Address != null){ 
                                System.debug('Address not Null.');      // Don't know the purpose of restricting the limit to 25 here.                                                                        
                                if(Response.Address.size() >= 1){//Example #5
                                    System.debug('22222222222222222222222222222222   Response.Address.size()---------'+Response.Address.size());
                                    getNewAddressess(Response.Address, 50);                                 
                                }
                            }else{
                                System.debug('else--------');//+JSON.SerializePretty(Response.ExecutionContext.ExecutionStatus));
                                if(Response.ExecutionContext.ExecutionStatus.ExecutionStatusMessage != null && Response.ExecutionContext.ExecutionStatus.ExecutionStatusMessage.size() > 0){
                                    for(WS_ESB_ExecutionContext.ExecutionStatusMessage Message : Response.ExecutionContext.ExecutionStatus.ExecutionStatusMessage){
                                        Set<String> AllowedStatusCodes = new Set<String>{'-99','57','-1'};
                                        if(Message.ExecutionStatusCode != null && AllowedStatusCodes.contains(Message.ExecutionStatusCode)){
                                            //System.debug('Message.ExecutionStatusCode-------------'+Message.ExecutionStatusCode);
                                            Datetime RSA_DT = datetime.now();
                                            try {
                                                WS_ESB_ManageAddress.ManageAddressGetAddressResponse Response2 = null;
                                                
                                                if(RSA_Request() != null && RSA_Request().RequestCriteria != null){
                                                    System.debug('RSA_Request().RequestCriteria---------------------'+RSA_Request().RequestCriteria);
                                                    Response2 = AddressCallout.GetAddress(RSA_Request().RequestCriteria);
                                                }
                                                System.debug('3333333333333Response2------------------------'+JSON.SerializePretty(Response2));
                                                
                                                if(Response2 != null && Response2.ExecutionContext != null && Response2.ExecutionContext.ExecutionStatus != null){
                                                   if(Response2.ExecutionContext.ExecutionStatus.ExecutionStatusSuccessFlag != null &&
                                                      Response2.ExecutionContext.ExecutionStatus.ExecutionStatusSuccessFlag){            
                                                       
                                                        System.debug('Response2.Address---------------'+Response2.Address);                                                            
                                                        if(Response2.Address != null && Response2.Address.size() > 0){
                                                            System.debug('Response2.Address.size()---------------'+Response2.Address.size());
                                                            getNewAddressess(Response.Address, 25);                                                     
                                                            }
                                                    }else{
                                                          System.debug('aaaaaaaaa check----------------- :'+Response2.ExecutionContext.ExecutionStatus.ExecutionStatusMessage);
                                                        if(Response2.ExecutionContext.ExecutionStatus.ExecutionStatusMessage != null && Response2.ExecutionContext.ExecutionStatus.ExecutionStatusMessage.size() > 0){
                                                            for(WS_ESB_ExecutionContext.ExecutionStatusMessage Message2 : Response2.ExecutionContext.ExecutionStatus.ExecutionStatusMessage){
                                                                if(Message2.ExecutionStatusDescription != null)
                                                                    ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.WARNING, Message2.ExecutionStatusDescription));                                                                 
                                                            }
                                                            System.debug('4444444444444444444444444444444444444444444444444444444444444444444');
                                                        }
                                                    }
                                               }
                                            }catch(Exception e){
                                                if(!Test.isRunningTest()){ 
                                                    //err = '555555555555';
                                                    EmailError(e);
                                                    System.debug('555555555555555555555555555555555555555555555555555555555555555555555555555');
                                                    ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Your request has encountered an error, your administrator has been notified'));
                                                    //LOG_API(RSA_DT,e);
                                                }
                                            }
                                        }
                                    }
                                }
                            }                           
                      }     
            }catch(Exception e){
                if(!Test.isRunningTest()){ 
                    //err = 'Exception 666666666';
                    EmailError(e);  
                    System.debug('Exception 66666666666666666666666666666666666666666666666666666666666666666666666666666666666');              
                    ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Your request has encountered an error, your administrator has been notified'));
               }
                else{
                    err = 'Exception==========';                     
                    System.debug('Exception=====================');              
                    ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Your request has encountered an error, your administrator has been notified'));
                   }
            }
            //insert LIST_CALLOUTS;
        }        
        
        if(SelectedCriteria == 'Telephone'){
            //system.debug('TESTING INSIDE TELEPHONE--Requuest Criteria:---'+RTN_Request().RequestCriteria);
            try{
                WS_ESB_ManageAddress.ManageAddressGetAddressResponse TN_Response = AddressCallout.GetAddress(RTN_Request().RequestCriteria);
                WS_ESB_ManageAddress.ManageAddressGetAddressRequest SN_Request = new WS_ESB_ManageAddress.ManageAddressGetAddressRequest();
                SN_Request.RequestCriteria.Address = new WS_ESB_BusinessObjects.AddressType();
                SN_Request.RequestCriteria.Action = 'RetrieveServiceAddress';
                
                if(TN_Response.Address != null) {
                    for(WS_ESB_BusinessObjects.AddressType this_address : TN_Response.Address){
                        SN_Request.RequestCriteria.Address.ServiceAddress = this_address.ServiceAddress;
                    }
                    
                    WS_ESB_ManageAddress.ManageAddressGetAddressResponse Response = AddressCallout.GetAddress(SN_Request.RequestCriteria);
                    
                    if(Response.ExecutionContext.ExecutionStatus.ExecutionStatusSuccessFlag){                                                                               
                        if(Response.Address.size() >= 1){//Example #5
                            System.debug('88888888888888888888888888888888888888888888888888--Response.Address.size()--'+Response.Address.size());
                            getNewAddressess(Response.Address, 50);                              
                        }
                    }
                }
                 
            }catch(Exception e){
                if(!Test.isRunningTest()){ 
                    //err = 'Exception 999989---';
                    EmailError(e);
                    System.debug('99999999999999999 Error retrieving service address using telephone. SN_Request.RequestCriteria');
                    ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Your request has encountered an error, your administrator has been notified'));
                }                
            }
        }
        system.debug(ServiceAddresses);
    }    
    
    public void ResetFields(){
        singleAddressLookup = new RequestedAddress();
        if(!ServiceAddresses.isEmpty()){
            ServiceAddresses.clear();
        }
    }
    
    public List<ServiceAddress> getAddressRecords() {
        return ServiceAddresses;
    }
    
    public List<SelectOption> getStates() {
        List<SelectOption> States = new List<SelectOption>();
        States.add(new selectOption('NONE','-- Select One --'));
        
        List<SelectOption> States1 = new List<SelectOption>();        
        States1.add(new selectOption('AL','AL - Alabama'));
        States1.add(new selectOption('AK','AK - Alaska'));
        States1.add(new selectOption('AZ','AZ - Arizona'));
        States1.add(new selectOption('AR','AR - Arkansas'));
        States1.add(new selectOption('CA','CA - California'));
        States1.add(new selectOption('CO','CO - Colorado'));
        States1.add(new selectOption('CT','CT - Connecticut'));
        States1.add(new selectOption('DE','DE - Delaware'));
        States1.add(new selectOption('DC','DC - District of Columbia'));
        States1.add(new selectOption('FL','FL - Florida'));
        States1.add(new selectOption('GA','GA - Georgia'));
        States1.add(new selectOption('HI','HI - Hawaii'));
        States1.add(new selectOption('ID','ID - Idaho'));
        States1.add(new selectOption('IL','IL - Illinois'));
        States1.add(new selectOption('IN','IN - Indiana'));
        States1.add(new selectOption('IA','IA - Iowa'));
        States1.add(new selectOption('KS','KS - Kansas'));
        States1.add(new selectOption('KY','KY - Kentucky'));
        States1.add(new selectOption('LA','LA - Louisiana'));
        States1.add(new selectOption('ME','ME - Maine'));
        States1.add(new selectOption('MD','MD - Maryland'));
        States1.add(new selectOption('MA','MA - Massachusetts'));
        States1.add(new selectOption('MI','MI - Michigan'));
        States1.add(new selectOption('MN','MN - Minnesota'));
        States1.add(new selectOption('MS','MS - Mississippi'));
        States1.add(new selectOption('MO','MO - Missouri'));
        States1.add(new selectOption('MT','MT - Montana'));
        States1.add(new selectOption('NE','NE - Nebraska'));
        States1.add(new selectOption('NV','NV - Nevada'));
        States1.add(new selectOption('NH','NH - New Hampshire'));
        States1.add(new selectOption('NJ','NJ - New Jersey'));
        States1.add(new selectOption('NM','NM - New Mexico'));
        States1.add(new selectOption('NY','NY - New York'));
        States1.add(new selectOption('NC','NC - North Carolina'));
        States1.add(new selectOption('ND','ND - North Dakota'));
        States1.add(new selectOption('OH','OH - Ohio'));
        States1.add(new selectOption('OK','OK - Oklahoma'));
        States1.add(new selectOption('OR','OR - Oregon'));
        States1.add(new selectOption('PA','PA - Pennsylvania'));
        States1.add(new selectOption('RI','RI - Rhode Island'));
        States1.add(new selectOption('SC','SC - South Caronlina'));
        States1.add(new selectOption('SD','SD - South Dakota'));
        States1.add(new selectOption('TN','TN - Tennessee'));
        States1.add(new selectOption('TX','TX - Texas'));
        States1.add(new selectOption('UT','UT - Utah'));
        States1.add(new selectOption('VT','VT - Vermont'));
        States1.add(new selectOption('VA','VA - Virginia'));
        States1.add(new selectOption('WA','WA - Washington'));
        States1.add(new selectOption('WV','WV - West Virginia'));
        States1.add(new selectOption('WI','WI - Wisconsin'));
        States1.add(new selectOption('WY','WY - Wyoming'));
        
        return States;
    }
    
    public class ServiceAddress{
        public Integer RecordId {get;set;}      
        public WS_ESB_BusinessObjects.CitizensServiceAddress Address {get;set;}
        public List<WS_ESB_BusinessObjects.TechnologyType> Business_Technologies {get;set;}
        public List<WS_ESB_BusinessObjects.TechnologyType> Residential_Technologies {get;set;}
        public Boolean UVerseCapable {get;set;}
        public Boolean POTSCapable {get;set;} //added the Flag for POTS availability
        
        public ServiceAddress(){
            Business_Technologies = new List<WS_ESB_BusinessObjects.TechnologyType>();
            Residential_Technologies = new List<WS_ESB_BusinessObjects.TechnologyType>();
        }
    }
    
    public class RequestedAddress {
        public String Street {get;set;}
        public String City {get;set;}
        public String StateOrProvince {get;set;}
        public String PostalCode {get;set;}
        public String Phone {get;set;}
    }

    global class HughesRequest {
        public String siteId {get;set;}
        public String customerId {get;set;}
        public String servicePhone {get;set;}
        public String serviceAddress1 {get;set;}
        public String serviceAddress2 {get;set;}
        public String city {get;set;}
        public String state {get;set;}
        public String zip {get;set;}
        public String hsiUpDown {get;set;}
        public String fiberUpDown {get;set;}
        public String fiberVideo {get;set;}
        public HughesRequest(){
            hsiUpDown = 'N/A';
            fiberUpDown = 'N/A';
            fiberVideo = 'N/A';
        }
    }
}