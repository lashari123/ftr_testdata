global class WebServiceInitializer{
    public String user_id_in {set;get;}
    public String sell_rep_cris_num_in {set;get;}
    public String action_in {set;get;}
    public String customer_name_in {set;get;}
    public String city_in {set;get;}
    public String state_in {set;get;}
    public String oso_number {set;get;}
    public String segment_cd_in {set;get;}
     public String Application_ID {set;get;}
    
    public String customerNumber {set;get;}
    webService static String getResponseFromWS(String accountId){
        ibusCzncorpComEsbManageprospect.ManageProspectSubmitProspectResponse manageProspectResp;
        String customerNumber = '';
        //Create Object to use Stub class
        manageprospectlibraryManageprospect.ManageProspectWSExport_ManageProspectHttpPort wsReq = new manageprospectlibraryManageprospect.ManageProspectWSExport_ManageProspectHttpPort();
        ibusCzncorpComEsbExecutioncontext.ExecutionContext execContext = new ibusCzncorpComEsbExecutioncontext.ExecutionContext();
        ibusCzncorpComEsbBusinessobjects.SubmitProspectRequestCriteria reqCriteria = new ibusCzncorpComEsbBusinessobjects.SubmitProspectRequestCriteria();
        ibusCzncorpComEsbBusinessobjects.CitizensPostalAddress customerAddr = new ibusCzncorpComEsbBusinessobjects.CitizensPostalAddress();
        ibusCzncorpComEsbBusinessobjects.ProspectContact prospectContact = new ibusCzncorpComEsbBusinessobjects.ProspectContact();
        ibusCzncorpComEsbBusinessobjects.TelephoneNumber telePhoneNum = new ibusCzncorpComEsbBusinessobjects.TelephoneNumber();
        ibusCzncorpComEsbBusinessobjects.NorthAmericanTelephoneNumber northAmericanTelNo = new ibusCzncorpComEsbBusinessobjects.NorthAmericanTelephoneNumber();
        ibusCzncorpComEsbBusinessobjects.AddressText[] addressTextArr = new ibusCzncorpComEsbBusinessobjects.AddressText[2];
        ibusCzncorpComEsbBusinessobjects.AddressText  addressText = null;
        Account accountRecord = null;
        User u = null;
        //Object which stores Response
        try{
        
        System.Debug('REACHED WEBSERVICE APEX CLASS VIA JAVASCRIPT ACTION');
        System.Debug('ACCOUNT ID');
        System.Debug(accountId);        
        //USET Object
        List<User> uArray = [select id,LastName,CRIS_ID__c,Name,Email from User where id =: UserInfo.getUserId()];
        if( uArray.size() > 0 )
            u = uArray[0];
         //Retrieve Account Object/Company Object here
       // Account accountRecord = new Account(Id = accountId); 
        List<Account> accountRecordArr =[SELECT Name,Customer_Number__c,Legal_City__c,Legal_Country__c,Legal_Zip__c,Legal_State__c,Legal_Street__c,Phone FROM Account WHERE id =:accountId LIMIT 1];
        if( accountRecordArr.size() > 0 )
            accountRecord = accountRecordArr[0];
            System.Debug('Account Record Retre..');
        System.Debug(accountRecordArr.size());
        if( accountRecord != null && u != null ){
            //Setting ESB Header
            ibusCzncorpComEsbExecutioncontext.ESBHeader eSBHeader = new ibusCzncorpComEsbExecutioncontext.ESBHeader();
            ibusCzncorpComEsbExecutioncontext.ConsumerInfo consumerInfo = new ibusCzncorpComEsbExecutioncontext.ConsumerInfo();
            ibusCzncorpComEsbExecutioncontext.ProviderInfo providerInfo = new ibusCzncorpComEsbExecutioncontext.ProviderInfo();
            consumerInfo.EmployeeID = u.CRIS_ID__c; //To be made dynamic Later
            consumerInfo.UserID = u.LastName; //To be made dynamic Later  
            consumerInfo.ApplicationID= 'CIM';     
            eSBHeader.ConsumerInfo = consumerInfo;
            Map<String,String> inita=new Map<String,String>();
            
             inita.put('Authorization', 'Basic b25ldmlldzpvbmV2aWV3MTIz'); 
             //inita.put('Username', 'oneview');         
                      //inita.put('Password', 'oneview123');  
            //Setting ESB Header to Execution Context
            execContext.ESBHeader = eSBHeader;
            
            //Map for States
            Map<String,String> stateMaps = new Map<String,String>();
            stateMaps.put('ALABAMA','AL');
 stateMaps.put('ALASKA','AK');
 stateMaps.put('ARIZONA','AZ');
 stateMaps.put('ARKANSAS','AR');
 stateMaps.put('CALIFORNIA','CA');
 stateMaps.put('COLORADO','CO');
 stateMaps.put('CONNECTICUT','CT');
 stateMaps.put('DELWARE','DE');
 stateMaps.put('FLORIDA','FL');
 stateMaps.put('GEORGIA','GA');
 stateMaps.put('HAWAII','HI');
 stateMaps.put('IDAHO','ID');
 stateMaps.put('ILLINOIS','IL');
 stateMaps.put('INDIANA','IN');
 stateMaps.put('IOWA','IA');
 stateMaps.put('KANSAS','KS');
 stateMaps.put('KENTUCKY','KY');
 stateMaps.put('LOUISIANA','LA');
 stateMaps.put('MAINE','ME');
 stateMaps.put('MARYLAND','MD');
 stateMaps.put('MASSACHUSETTS','MA');
 stateMaps.put('MICHIGAN','MI');
 stateMaps.put('MINNESOTA','MN');
 stateMaps.put('MISSISSIPPI','MS');
 stateMaps.put('MISSOURI','MO');
 stateMaps.put('MONTANA','MT');
 stateMaps.put('NEBRASKA','NE');
 stateMaps.put('NEVADA','NV');
 stateMaps.put('NEWHAMPSHIRE','NH');
 stateMaps.put('NEWJERSEY','NJ');
 stateMaps.put('NEWMEXICO','NM');
 stateMaps.put('NEWYORK','NY');
 stateMaps.put('NORTHCAROLINA','NC');
 stateMaps.put('NORTHDAKOTA','ND');
 stateMaps.put('OHIO','OH');
 stateMaps.put('OKLAHOMA','OK');
 stateMaps.put('OREGON','OR');
 stateMaps.put('PENNSYLVANIA','PA');
 stateMaps.put('RHODEISLAND','RI');
 stateMaps.put('SOUTHCAROLINA','SC');
 stateMaps.put('SOUTHDAKOTA','SD');
 stateMaps.put('TENNESSEE','TN');
 stateMaps.put('TEXAS','TX');
 stateMaps.put('UTAH','UT');
 stateMaps.put('VERMONT','VT');
 stateMaps.put('VIRGINIA','VA');
 stateMaps.put('WASHINGTON','WA');
 stateMaps.put('WESTVIRGINIA','WV');
 stateMaps.put('WISCONSIN','WI');
 stateMaps.put('WYOMING','WY');
 
 
 
 
 
            
            //Setting Request Criteria
            reqCriteria.Action = 'Create';
            reqCriteria.CustomerName = accountRecord.Name;
            customerAddr.Locality = accountRecord.Legal_City__c;
            String postalCodeStr = accountRecord.Legal_Zip__c;//substring(0,9)
            if( postalCodeStr.length() > 9 ){
                postalCodeStr = postalCodeStr.substring(0,9);
            }
             customerAddr.Postcode = postalCodeStr.replace('-','');
             String legalState = accountRecord.Legal_State__c;
             legalState = legalState.replace(' ' ,'');
             legalState = legalState.toUpperCase();
             if( stateMaps.containsKey(legalState) ){
                 legalState = stateMaps.get(legalState);
             }
            customerAddr.StateOrProvince = legalState;
            addressText = new ibusCzncorpComEsbBusinessobjects.AddressText();
            String addressStr = accountRecord.Legal_Street__c;//.substring(0,45)
            if( addressStr.length() > 45 ){
                addressStr = addressStr.substring(0,45);
            }
            addressText.AddressText = addressStr;
            addressText.SequenceNumber = 1;
            addressTextArr[0] = addressText;
            addressText = new ibusCzncorpComEsbBusinessobjects.AddressText();
            addressText.AddressText = 'null';
            addressText.SequenceNumber = 2;
            addressTextArr[1] = addressText;
            customerAddr.AddressText = addressTextArr;
           // prospectContact.Sequence = 1;
            prospectContact.Name = '';
            System.Debug('CName');
            System.Debug(accountRecord.Name);
            System.Debug('City');
            System.Debug(accountRecord.Legal_City__c);
            System.Debug('Post Code');
            System.Debug(postalCodeStr);
            System.Debug('Stree');
            System.Debug(addressTextArr[0].AddressText);
            System.Debug('Billing State');
            System.Debug(legalState);
            System.Debug('User Id');
            System.Debug(u.LastName);
             System.Debug('Emp Id');
            System.Debug(u.CRIS_ID__c);
           // northAmericanTelNo.NPA = '234';
           // northAmericanTelNo.NXX = '234';
            //northAmericanTelNo.Station = '234234';
            //telePhoneNum.NorthAmericanNumber = northAmericanTelNo;
            String tPhone = accountRecord.Phone;
            tPhone = tPhone.replace('(','');
            tPhone = tPhone.replace(')','');
            tPhone = tPhone.replace('-','');
            tPhone = tPhone.replace(' ','');
            telePhoneNum.Number_x = tPhone;
           // telePhoneNum.Extension = '511';
            prospectContact.TelephoneNumber = telePhoneNum;
            reqCriteria.CustomerAddress = customerAddr;
            reqCriteria.CustomerContact = prospectContact;             
            reqCriteria.CustomerSegmentCode ='99';
            
            //Setting Headers for Datapower URL
            wsReq.inputHttpHeaders_x = inita; 
        }
            
        //Now Invoke Requesting by calling SubmitProspect Function
        
            manageProspectResp = wsReq.SubmitProspect(execContext,reqCriteria);
         }
         catch(Exception e){
            customerNumber = e.getMessage();
             System.Debug(e);
         }
        System.Debug('COMPLETED WEBSERVICE CALL');
        System.Debug(manageProspectResp);
        //Response is stored in manageProspectResp
        //Now Parse Response Object for CutomerNumber using its Corresponding class
        if( manageProspectResp != null ){
            customerNumber = manageProspectResp.CustomerNumber;
        }
        System.Debug('CUSTOMER NUMBER FROM WEBSERVICE RESPONSE : ');
        System.Debug(customerNumber);
        try{
            if( customerNumber != '' ){           
                accountRecord.Customer_Number__c = customerNumber;
                update accountRecord;
            }
        }
        catch(Exception e){
            //customerNumber = e.getMessage();
             System.Debug(e);
         }
      return customerNumber;     
        
    }
    
}