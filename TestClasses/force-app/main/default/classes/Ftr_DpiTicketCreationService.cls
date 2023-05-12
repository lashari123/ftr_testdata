public with sharing class Ftr_DpiTicketCreationService {
    
    public static HttpResponse Dpiticketservice(String phoneNumber, String name, String notes, String remarks, String email, String contactPhoneNumber, string location, string endPoint, string phoneType){
        
        system.debug('====ModiPhone==='+contactPhoneNumber.replaceAll('[^a-zA-Z0-9]', ''));
        String returnStr;
        Remedy_Manage_Trouble_Tickets__c rm = Remedy_Manage_Trouble_Tickets__c.getInstance();  
        
        system.debug('dpi==rm==='+rm.Username__c);
        system.debug('dpi==rm==='+rm.Password__c);
        List<String> str = New List<String>();
        str.add(notes);
        List<String> strEmails = New List<String>();
        strEmails.add(email);
        // Generating the JSON structure to create DPI ticket by using wrapperClass
        requestWrapperClass reqWrap = New requestWrapperClass();
        reqWrap.autoSelectSchedule = true;
        troubleTicket tt = New troubleTicket(); 
        tt.phoneNumber = phoneNumber;
        tt.type= phoneType;
        tt.remarks = remarks+' '+str;
        tt.notes = str;
        aLocation al = New aLocation();
        contact con = New contact();
        con.name = name;
        con.remarks = notes;
        con.emailAddress = strEmails;
        List<contactNumber> contNum = New List<contactNumber>();
        contactNumber cont = New contactNumber();
        cont.phoneNumber = contactPhoneNumber.replaceAll('[^a-zA-Z0-9]', '');
        cont.type = 'LANDLINE';
        cont.extension = '1234';
        contNum.add(cont);
        con.contactNumber = contNum;
        
        al.contact = con;
        tt.aLocation = al;
        reqWrap.troubleTicket = tt;
        
        String JSONStr = JSON.serialize(reqWrap);
        system.debug(JSONStr);
        
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        HttpResponse res = New HttpResponse();
        request.setEndpoint(endPoint);
        Blob headerValue = Blob.valueOf(rm.Username__c + ':' + rm.Password__c);
        String authorizationHeader = 'Basic ' + EncodingUtil.base64Encode(headerValue);
        request.setHeader('Authorization', authorizationHeader);
        request.setHeader('Content-Type', 'application/json');
        //request.setHeader('Content-Length', '0' );
        request.setHeader('apikey', rm.Api_key__c);
        request.setHeader('ESB-requestingApplication', 'SFDC');
        request.setHeader('ESB-securityInfo.userId', 'ESB_REG');
        request.setMethod('POST');
        request.setTimeout(120000);
        request.setbody(JSONStr);
        if(!test.isRunningTest()){
        res = http.send(request);
        }
        system.debug('res==='+res.getStatus());
        system.debug('res==='+res.getStatusCode());
        system.debug(res.getBody());
              
       
        return res;
    }
    public class requestWrapperClass{
        public Boolean autoSelectSchedule;
        public troubleTicket troubleTicket;
    }
    public class troubleTicket{
        public String phoneNumber;
        public String type;
        public List<String> notes;
        public string remarks;
        public aLocation aLocation;
       
    }
    // there are two types in the body one is object and list so we are declaring classes like that /'flower become object sqaure become list l
    public class aLocation{
        public contact contact;
    }
    public class contact{
        public string name;
        public List<contactNumber> contactNumber;
        public List<String> emailAddress;
        public string remarks;
    }
    public class contactNumber{
        public string phoneNumber;
        public string extension;
        public string type;
    }
    
    
}