public class WS_ESB_ManageAccount {
    public static void TestCallout(String PhoneNumber, String DataRegion){
        WS_ESB_ManageAccount.Callout GetAccount_Callout = new WS_ESB_ManageAccount.Callout();
        WS_ESB_ManageAccount.ManageAccountGetAccountResponse  GetAccount_Response = GetAccount_Callout.GetAccount(PhoneNumber,DataRegion);
        system.debug(LoggingLevel.ERROR,json.serializepretty(GetAccount_Response));
    }
    
    public static void TestCallout1(String PhoneNumber, String DataRegion){
        WS_ESB_ManageAccount.Callout GetMemo_Callout = new WS_ESB_ManageAccount.Callout();
        WS_ESB_ManageAccount.ManageAccountGetMemoResponse  GetMemo_Response = GetMemo_Callout.GetMemo(PhoneNumber,DataRegion);
        //system.debug(LoggingLevel.ERROR,json.serializepretty(GetMemo_Response));
    }
    /*
    public static void TestCalloutUpdateMemo(String PhoneNumber, String DataRegion, String Action){
        WS_ESB_ManageAccount.Callout UpdateMemo_Callout = new WS_ESB_ManageAccount.Callout();
        WS_ESB_ManageAccount.ManageAccountUpdateMemoResponse  UpdateMemo_Response = UpdateMemo_Callout.UpdateMemo(PhoneNumber,DataRegion,Action);
        system.debug(json.serializepretty(UpdateMemo_Response));
    } */     
//--------------------------------------added-----------------------------------------------------------------------------------------------------------------------------------------------    
    public static void TestCalloutHg(String PhoneNumber, String DataRegion){
        WS_ESB_ManageAccount.Callout hgCo = new WS_ESB_ManageAccount.Callout();
        WS_ESB_ManageAccount.ManageAccountGetHuntGroupsResponse  res = hgCo.getHuntGroups(PhoneNumber,DataRegion);
        system.debug(json.serializepretty(res));
    }
//--------------------------------------added-----------------------------------------------------------------------------------------------------------------------------------------------    
    public class ManageAccountGetAccountRequest {
        public WS_ESB_ExecutionContext.ExecutionContext ExecutionContext; 
        public WS_ESB_ManageAccount.GetAccountRequestCriteria RequestCriteria;
        transient String[] ExecutionContext_type_info = new String[]{'ExecutionContext','http://ibus.czncorp.com/ESB/ExecutionContext','ExecutionContext','1','1','false'};
        transient String[] RequestCriteria_type_info = new String[]{'RequestCriteria','http://ibus.czncorp.com/ESB/ManageAccount','GetAccountRequestCriteria','0','1','false'};
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/ManageAccount','false','false'};
        transient String[] field_order_type_info = new String[]{'ExecutionContext','RequestCriteria'};
        public ManageAccountGetAccountRequest(){
           ExecutionContext = new WS_ESB_ExecutionContext.ExecutionContext();           
           RequestCriteria = new WS_ESB_ManageAccount.GetAccountRequestCriteria();
        }
    }
         
    public class GetAccountRequestCriteria {
        public WS_ESB_BusinessObjects.RequestAccountId AccountId;
        transient String[] AccountId_type_info = new String[]{'AccountId','http://ibus.czncorp.com/ESB/BusinessObjects','RequestAccountId','1','1','false'};
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/ManageAccount','false','false'};
        transient String[] field_order_type_info = new String[]{'AccountId'};
        public GetAccountRequestCriteria(){
           AccountId = new WS_ESB_BusinessObjects.RequestAccountId();
        }
    }
    
    
    public class ManageAccountGetAccountResponse {
        public WS_ESB_ExecutionContext.ExecutionContext ExecutionContext;
        public WS_ESB_ManageAccount.GetAccountRequestCriteria RequestCriteria;
        public WS_ESB_BusinessObjects.AccountId AccountId;
        public WS_ESB_BusinessObjects.CustomerAccount[] CustomerAccount;
        transient String[] ExecutionContext_type_info = new String[]{'ExecutionContext','http://ibus.czncorp.com/ESB/ExecutionContext','ExecutionContext','0','1','false'};
        transient String[] RequestCriteria_type_info = new String[]{'RequestCriteria','http://ibus.czncorp.com/ESB/ManageAccount','GetAccountRequestCriteria','1','1','false'};
        transient String[] AccountId_type_info = new String[]{'AccountId','http://ibus.czncorp.com/ESB/BusinessObjects','AccountId','0','1','false'};    
        transient String[] CustomerAccount_type_info = new String[]{'CustomerAccount','http://ibus.czncorp.com/ESB/BusinessObjects','CustomerAccount','0','-1','false'};
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/ManageAccount','false','false'};
        transient String[] field_order_type_info = new String[]{'ExecutionContext','RequestCriteria','AccountId','CustomerAccount'}; 
    }
    
    public class ErrorReport {
        public String StackTrace;
        public String Msg;
        public String FullClass;
        public String Class_x;
        public String ProcessStack;
        public String MsgCode;
        public anydata Data;
        
        transient String[] StackTrace_type_info = new String[]{'StackTrace','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] Msg_type_info = new String[]{'Msg','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] FullClass_type_info = new String[]{'FullClass','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] Class_x_type_info = new String[]{'Class','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] ProcessStack_type_info = new String[]{'ProcessStack','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] MsgCode_type_info = new String[]{'MsgCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] Data_type_info = new String[]{'Data','http://www.w3.org/2001/XMLSchema','anydata','0','1','false'};
        
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/ManageAccount','false','false'};
        transient String[] field_order_type_info = new String[]{'StackTrace','Msg','FullClass','Class_x','ProcessStack','MsgCode', 'Data'};
        
    }
    
    public class anydata {
        public ManageAccountGetAccountRequest ManageAccountGetAccountRequest;
        
        transient String[] ManageAccountGetAccountRequest_type_info = new String[]{'ManageAccountGetAccountRequest','http://ibus.czncorp.com/ESB/ManageAccount','ManageAccountGetAccountRequest','0','1','false'};
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/ManageAccount','false','false'};
        transient String[] field_order_type_info = new String[]{'ManageAccountGetAccountRequest'};
    }
    
    
    public class Callout {
        public String endpoint_x;
        public Map<String,String> inputHttpHeaders_x;
        public Map<String,String> outputHttpHeaders_x;
        public String clientCertName_x;
        public String clientCert_x;
        public String clientCertPasswd_x;
        public Integer timeout_x;
        transient String[] ns_map_type_info = new String[]{'http://ManageCollectionLibrary/ManageAccount', 'WS_ESB_ManageAccount', 'http://ibus.czncorp.com/ESB/ExecutionContext', 'WS_ESB_ExecutionContext', 'http://ibus.czncorp.com/ESB/BusinessObjects', 'WS_ESB_BusinessObjects', 'http://ibus.czncorp.com/ESB/ManageAccount', 'WS_ESB_ManageAccount'};
        public Callout(){       
            endpoint_x = WS_ESB_Settings__c.getOrgDefaults().URI_ManageAccount__c;
            //endpoint_x = 'https://esbdpruat.frontiercorp.com/esb/qat01/ManageAccountWeb/sca/WSExport';
            inputHttpHeaders_x = new Map<String,String>();
            inputHttpHeaders_x.put('Authorization', 'Basic ' + EncodingUtil.base64Encode(Blob.valueOf(WS_ESB_Settings__c.getOrgDefaults().HDR_Authorization__c)));
            inputHttpHeaders_x.put('apikey',WS_ESB_Settings__c.getOrgDefaults().Apigee_Token__c);
            //system.debug('Authorization Header:\n\n' + inputHttpHeaders_x);
            //system.debug('manage account url:' + endpoint_x);
            //system.debug('Hemantha test');
            outputHttpHeaders_x = new Map<String,String>();
            timeout_x = (integer)WS_ESB_Settings__c.getOrgDefaults().TO_ManageAccount__c;
        }
        public WS_ESB_ManageAccount.ManageAccountGetAccountResponse GetAccount(String PhoneNumber, String DataRegion) {    

            WS_ESB_ManageAccount.ManageAccountGetAccountRequest request_x = new WS_ESB_ManageAccount.ManageAccountGetAccountRequest();
            WS_ESB_ManageAccount.ManageAccountGetAccountResponse response_x;
            WS_ESB_ManageAccount.ErrorReport err_x;
            request_x.RequestCriteria.AccountId.PhoneNumberAsId = new WS_ESB_BusinessObjects.PhoneNumberAsId();
            request_x.RequestCriteria.AccountId.PhoneNumberAsId.TelephoneNumber.Number_x = PhoneNumber;
            request_x.RequestCriteria.AccountId.DataSourceEnvironment.DataRegion = DataRegion;
            Map<String, WS_ESB_ManageAccount.ManageAccountGetAccountResponse> response_map_x = new Map<String, WS_ESB_ManageAccount.ManageAccountGetAccountResponse>();
            Map<String, WS_ESB_ManageAccount.ErrorReport> err_map_x = new Map<String, WS_ESB_ManageAccount.ErrorReport>();
            response_map_x.put('response_x', response_x);
            err_map_x.put('err_x', err_x);
            //system.debug('request:' + request_x);
            
            try{
            WebServiceCallout.invoke(
                this,
                request_x,
                response_map_x,
                new String[]{endpoint_x,
                '',
                'http://ibus.czncorp.com/ESB/ManageAccount',          
                'ManageAccountGetAccountRequest',
                'http://ibus.czncorp.com/ESB/ManageAccount',
                'ManageAccountGetAccountResponse',
                'WS_ESB_ManageAccount.ManageAccountGetAccountResponse'}
            );
            //system.debug('Hemantha response:'+ response_map_x);
            /*
            WebServiceCallout.invoke(
                this,
                request_x,
                err_map_x,
                new String[]{endpoint_x,
                '',
                'http://ibus.czncorp.com/ESB/ManageAccount',          
                'ManageAccountGetAccountRequest',
                'http://www.tibco.com/pe/EngineTypes',
                'ErrorReport',
                'WS_ESB_ManageAccount.ErrorReport'}
            );
            */
            }catch(Exception e)
            {
                system.debug('SUNNY Exception in getAccount Call '+ e);
            }
            
            response_x = response_map_x.get('response_x');
            //if(response_x==null){
                //System.debug(err_map_x);
                //err_x = err_map_x.get('err_x');
                System.debug(json.serializepretty(response_x));
            //}
            
            return response_x;
        }
        /*
        public WS_ESB_ManageAccount.ManageAccountUpdateMemoResponse UpdateMemo(String PhoneNumber, String DataRegion, String Action){
         WS_ESB_ManageAccount.ManageAccountUpdateMemoRequest request_x = new WS_ESB_ManageAccount.ManageAccountUpdateMemoRequest();
         WS_ESB_ManageAccount.ManageAccountUpdateMemoResponse response_x;
         request_x.RequestCriteria = new WS_ESB_ManageAccount.UpdateMemoRequestCriteria();
         request_x.RequestCriteria.AccountId.PhoneNumberAsId = new WS_ESB_BusinessObjects.PhoneNumberAsId();
         request_x.RequestCriteria.AccountId.PhoneNumberAsId.TelephoneNumber = new WS_ESB_BusinessObjects.TelephoneNumber();
         request_x.RequestCriteria.AccountId.PhoneNumberAsId.TelephoneNumber.Number_x = PhoneNumber;
         request_x.RequestCriteria.AccountId.PhoneNumberAsId.SequenceNumber = 0;//added
         request_x.RequestCriteria.AccountId.DataSourceEnvironment.DataRegion = DataRegion;
         request_x.RequestCriteria.Action = Action;
         system.debug('request---\n\n'+json.serializepretty(request_x));
         Map<String, WS_ESB_ManageAccount.ManageAccountUpdateMemoResponse> response_map_x = new Map<String, WS_ESB_ManageAccount.ManageAccountUpdateMemoResponse>();
         response_map_x.put('response_x', response_x);
         WebServiceCallout.invoke(
                this,
                request_x,
                response_map_x,
                new String[]{endpoint_x,
                '',
                'http://ibus.czncorp.com/ESB/ManageAccount',          
                'ManageAccountUpdateMemoRequest',
                'http://ibus.czncorp.com/ESB/ManageAccount',
                'ManageAccountUpdateMemoResponse',
                'WS_ESB_ManageAccount.ManageAccountUpdateMemoResponse'}
            );
            //response_x = response_map_x.get('response_x');
            //return response_x;
            return null;
       }    
        */
       public WS_ESB_ManageAccount.ManageAccountGetMemoResponse GetMemo(String PhoneNumber, String DataRegion){
         WS_ESB_ManageAccount.ManageAccountGetMemoRequest request_x = new WS_ESB_ManageAccount.ManageAccountGetMemoRequest();
         WS_ESB_ManageAccount.ManageAccountGetMemoResponse response_x;
         request_x.RequestCriteria = new WS_ESB_ManageAccount.GetMemoRequestCriteria();
         request_x.RequestCriteria.AccountId.PhoneNumberAsId = new WS_ESB_BusinessObjects.PhoneNumberAsId();
         request_x.RequestCriteria.AccountId.PhoneNumberAsId.TelephoneNumber = new WS_ESB_BusinessObjects.TelephoneNumber();
         request_x.RequestCriteria.AccountId.PhoneNumberAsId.TelephoneNumber.Number_x = PhoneNumber;
         //request_x.RequestCriteria.AccountId.PhoneNumberAsId.SequenceNumber = 0;//added
         request_x.RequestCriteria.AccountId.DataSourceEnvironment.DataRegion = DataRegion;
         request_x.RequestCriteria.MemoCriteria.ReturnAllMemoSectionsFlag = true; //Added
         request_x.RequestCriteria.MemoCriteria.MaximumMemoCount = 120; //Added
         //system.debug('request---\n\n'+json.serializepretty(request_x));
         Map<String, WS_ESB_ManageAccount.ManageAccountGetMemoResponse> response_map_x = new Map<String, WS_ESB_ManageAccount.ManageAccountGetMemoResponse>();
         response_map_x.put('response_x', response_x);
         WebServiceCallout.invoke(
                this,
                request_x,
                response_map_x,
                new String[]{endpoint_x,
                '',
                'http://ibus.czncorp.com/ESB/ManageAccount',          
                'ManageAccountGetMemoRequest',
                'http://ibus.czncorp.com/ESB/ManageAccount',
                'ManageAccountGetMemoResponse',
                'WS_ESB_ManageAccount.ManageAccountGetMemoResponse'}
            );
            response_x = response_map_x.get('response_x');
            return response_x;
       }
       
 //--------------------------------------added-----------------------------------------------------------------------------------------------------------------------------------------------
     public WS_ESB_ManageAccount.ManageAccountGetHuntGroupsResponse getHuntGroups(String PhoneNumber, String DataRegion){
        WS_ESB_ManageAccount.ManageAccountGetHuntGroupsRequest request_x = new WS_ESB_ManageAccount.ManageAccountGetHuntGroupsRequest();
        WS_ESB_ManageAccount.ManageAccountGetHuntGroupsResponse response_x;
        request_x.RequestCriteria = new WS_ESB_ManageAccount.GetHuntGroupsRequestCriteria();
        request_x.RequestCriteria.TelephoneNumber = new WS_ESB_BusinessObjects.TelephoneNumber();
        request_x.RequestCriteria.TelephoneNumber.Number_x = PhoneNumber;
        System.debug(PhoneNumber+'asdfdfs'+DataRegion);
        request_x.RequestCriteria.DataRegion = DataRegion;  
        Map<String, WS_ESB_ManageAccount.ManageAccountGetHuntGroupsResponse> response_map_x = new Map<String, WS_ESB_ManageAccount.ManageAccountGetHuntGroupsResponse>();
        response_map_x.put('response_x', response_x);
        WebServiceCallout.invoke(
                                 this,
                                 request_x,
                                 response_map_x,
                                 new String[]{ endpoint_x,
                                             '',
                                             'http://ibus.czncorp.com/ESB/ManageAccount',
                                             'ManageAccountGetHuntGroupsRequest',
                                             'http://ibus.czncorp.com/ESB/ManageAccount',
                                             'ManageAccountGetHuntGroupsResponse',
                                             'WS_ESB_ManageAccount.ManageAccountGetHuntGroupsResponse'}
                                 );
        response_x = response_map_x.get('response_x');
        return response_x;  
    }
 //--------------------------------------added-----------------------------------------------------------------------------------------------------------------------------------------------      
 
       
       
    }
    
    public class ManageAccountGetMemoRequest{
        public WS_ESB_ExecutionContext.ExecutionContext ExecutionContext;
        public WS_ESB_ManageAccount.GetMemoRequestCriteria RequestCriteria;
        transient String[] ExecutionContext_type_info = new String[]{'ExecutionContext','http://ibus.czncorp.com/ESB/ExecutionContext','ExecutionContext','1','1','false'};
        transient String[] RequestCriteria_type_info = new String[]{'RequestCriteria','http://ibus.czncorp.com/ESB/ManageAccount','GetMemoRequestCriteria','0','1','false'};
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/ManageAccount','false','false'};
        transient String[] field_order_type_info = new String[]{'ExecutionContext','RequestCriteria'};
        public ManageAccountGetMemoRequest(){
            ExecutionContext = new WS_ESB_ExecutionContext.ExecutionContext();
            RequestCriteria = new WS_ESB_ManageAccount.GetMemoRequestCriteria();
        }
    }
    
    public class GetMemoRequestCriteria{
        public WS_ESB_BusinessObjects.RequestAccountId AccountId;
        public WS_ESB_ManageAccount.MemoCriteria MemoCriteria;
        transient String[] AccountId_type_info = new String[]{'AccountId','http://ibus.czncorp.com/ESB/BusinessObjects','RequestAccountId','0','1','false'};
        transient String[] MemoCriteria_type_info = new String[]{'MemoCriteria','http://ibus.czncorp.com/ESB/ManageAccount','MemoCriteria','0','1','false'};
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/ManageAccount','false','false'};
        transient String[] field_order_type_info = new String[]{'AccountId','MemoCriteria'};
        public GetMemoRequestCriteria(){
           AccountId = new WS_ESB_BusinessObjects.RequestAccountId();
           MemoCriteria = new WS_ESB_ManageAccount.MemoCriteria();//added
        }
    }
    public class MemoCriteria { //added
        public String MemoTemplateName;
        public String SequenceNumber;
        public WS_ESB_BusinessObjects.PhoneNumberAsId Key;
        public String MemoSectionName;
        public Boolean ReturnAllMemoSectionsFlag;
        public Integer MaximumMemoCount;
        transient String[] MemoTemplateName_type_info = new String[]{'MemoTemplateName','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] SequenceNumber_type_info = new String[]{'SequenceNumber','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] Key_type_info = new String[]{'Key','http://ibus.czncorp.com/ESB/BusinessObjects','PhoneNumberAsId','0','1','false'};
        transient String[] MemoSectionName_type_info = new String[]{'MemoSectionName','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] ReturnAllMemoSectionsFlag_type_info = new String[]{'ReturnAllMemoSectionsFlag','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        transient String[] MaximumMemoCount_type_info = new String[]{'MaximumMemoCount','http://www.w3.org/2001/XMLSchema','int','0','1','false'};
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/ManageAccount','false','false'};
        transient String[] field_order_type_info = new String[]{'MemoTemplateName','SequenceNumber','Key','MemoSectionName','ReturnAllMemoSectionsFlag','MaximumMemoCount'};
    }
    
    public class ManageAccountGetMemoResponse{
        public WS_ESB_ExecutionContext.ExecutionContext ExecutionContext;
        public WS_ESB_ManageAccount.GetMemoRequestCriteria RequestCriteria;
        public WS_ESB_BusinessObjects.AccountMemo[] AccountMemo;    
        public WS_ESB_BusinessObjects.ProspectMemo[] ProspectMemo;
        transient String[] ExecutionContext_type_info = new String[]{'ExecutionContext','http://ibus.czncorp.com/ESB/ExecutionContext','ExecutionContext','0','1','false'};
        transient String[] RequestCriteria_type_info = new String[]{'RequestCriteria','http://ibus.czncorp.com/ESB/ManageAccount','GetMemoRequestCriteria','1','1','false'};
        transient String[] AccountMemo_type_info = new String[]{'AccountMemo','http://ibus.czncorp.com/ESB/BusinessObjects','AccountMemo','0','1','false'};    
        transient String[] ProspectMemo_type_info = new String[]{'ProspectMemo','http://ibus.czncorp.com/ESB/BusinessObjects','ProspectMemo','0','-1','false'};
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/ManageAccount','false','false'};
        transient String[] field_order_type_info = new String[]{'ExecutionContext','RequestCriteria','AccountMemo','ProspectMemo'};              
    }
    /*
    public class ManageAccountUpdateMemoRequest{
        public WS_ESB_ExecutionContext.ExecutionContext ExecutionContext;
        public WS_ESB_ManageAccount.UpdateMemoRequestCriteria RequestCriteria;
        transient String[] ExecutionContext_type_info = new String[]{'ExecutionContext','http://ibus.czncorp.com/ESB/ExecutionContext','ExecutionContext','1','1','false'};
        transient String[] RequestCriteria_type_info = new String[]{'RequestCriteria','http://ibus.czncorp.com/ESB/ManageAccount','GetMemoRequestCriteria','0','1','false'};
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/ManageAccount','false','false'};
        transient String[] field_order_type_info = new String[]{'ExecutionContext','RequestCriteria'};
        public ManageAccountUpdateMemoRequest(){
            ExecutionContext = new WS_ESB_ExecutionContext.ExecutionContext();
            RequestCriteria = new WS_ESB_ManageAccount.UpdateMemoRequestCriteria();
        }
    }
     
    public class UpdateMemoRequestCriteria {
        public WS_ESB_BusinessObjects.RequestAccountId AccountId;
        public WS_ESB_BusinessObjects.CramComplaintMemo CramComplaintMemo;
        public WS_ESB_BusinessObjects.PaymentExtensionMemo PaymentExtensionMemo;
        public WS_ESB_BusinessObjects.RegulatoryComplaintMemo RegulatoryComplaintMemo;
        public WS_ESB_BusinessObjects.SlamComplaintMemo SlamComplaintMemo;
        public WS_ESB_BusinessObjects.BasicMemo BasicMemo;
        public String Action; 
        transient String[] AccountId_type_info = new String[]{'AccountId','http://ibus.czncorp.com/ESB/BusinessObjects','RequestAccountId','0','1','false'};
        transient String[] BasicMemo_type_info = new String[]{'BasicMemo','http://ibus.czncorp.com/ESB/ManageAccount','BasicMemo','0','1','false'};
        transient String[] CramComplaintMemo_type_info = new String[]{'CramComplaintMemo','http://ibus.czncorp.com/ESB/ManageAccount','CramComplaintMemo','0','1','false'};
        transient String[] PaymentExtensionMemo_type_info = new String[]{'PaymentExtensionMemo','http://ibus.czncorp.com/ESB/ManageAccount','PaymentExtensionMemo','0','1','false'};
        transient String[] RegulatoryComplaintMemo_type_info = new String[]{'RegulatoryComplaintMemo','http://ibus.czncorp.com/ESB/ManageAccount','RegulatoryComplaintMemo','0','1','false'};
        transient String[] SlamComplaintMemo_type_info = new String[]{'SlamComplaintMemo','http://ibus.czncorp.com/ESB/ManageAccount','SlamComplaintMemo','0','1','false'};
        transient String[] Action_type_info = new String[]{'Action','http://ibus.czncorp.com/ESB/ManageAccount','string','0','1','false'};
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/ManageAccount','false','false'};
        transient String[] field_order_type_info = new String[]{'AccountId','BasicMemo','CramComplaintMemo','PaymentExtensionMemo','RegulatoryComplaintMemo','SlamComplaintMemo','Action'};
        
         public UpdateMemoRequestCriteria(){
           AccountId = new WS_ESB_BusinessObjects.RequestAccountId();
         }
    }
    
    public class ManageAccountUpdateMemoResponse {
        public WS_ESB_ExecutionContext.ExecutionContext ExecutionContext;
        public WS_ESB_ManageAccount.UpdateMemoRequestCriteria RequestCriteria;
        transient String[] ExecutionContext_type_info = new String[]{'ExecutionContext','http://ibus.czncorp.com/ESB/ExecutionContext','ExecutionContext','0','1','false'};
        transient String[] RequestCriteria_type_info = new String[]{'RequestCriteria','http://ibus.czncorp.com/ESB/ManageAccount','UpdateMemoRequestCriteria','1','1','false'};
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/ManageAccount','false','false'};
        transient String[] field_order_type_info = new String[]{'ExecutionContext','RequestCriteria'};
    }
    */
  //--------------------------------------added-----------------------------------------------------------------------------------------------------------------------------------------------
public class ManageAccountGetHuntGroupsRequest {    
    public WS_ESB_ExecutionContext.ExecutionContext ExecutionContext; 
    public WS_ESB_ManageAccount.GetHuntGroupsRequestCriteria RequestCriteria;
    transient String[] ExecutionContext_type_info = new String[]{'ExecutionContext','http://ibus.czncorp.com/ESB/ExecutionContext', 'ExecutionContext', '0','1','false'};
    transient String[]RequestCriteria_type_info = new String[]{'RequestCriteria','http://ibus.czncorp.com/ESB/ManageAccount','GetHuntGroupsRequestCriteria','0','1','false'};
    transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/ManageAccount','false', 'false'};
    transient String[] field_order_type_info = new String[]{'ExecutionContext','RequestCriteria'};
    public ManageAccountGetHuntGroupsRequest(){
        ExecutionContext = new WS_ESB_ExecutionContext.ExecutionContext();
        RequestCriteria = new WS_ESB_ManageAccount.GetHuntGroupsRequestCriteria();
    } 
}

public class GetHuntGroupsRequestCriteria{
    public WS_ESB_BusinessObjects.TelephoneNumber TelephoneNumber;
    public String DataRegion { get; set; }
    transient String[] TelephoneNumber_type_info = new String[]{'TelephoneNumber','http://ibus.czncorp.com/ESB/BusinessObjects', 'TelephoneNumber', '0', '1', 'false' };
    transient String[] DataRegion_type_info = new String[]{'DataRegion', 'http://ibus.czncorp.com/ESB/BusinessObjects', 'DataRegion', '0', '1','false'};
    transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/ManageAccount','false', 'false'};
    transient String[] field_order_type_info = new String[]{'TelephoneNumber','DataRegion'};
    public GetHuntGroupsRequestCriteria(){
        TelephoneNumber = new WS_ESB_BusinessObjects.TelephoneNumber();
        //DataRegion = new WS_ESB_BusinessObjects.DataRegion();
    }
}

public class ManageAccountGetHuntGroupsResponse{
    public WS_ESB_ExecutionContext.ExecutionContext ExecutionContext;
    public WS_ESB_BusinessObjects.HuntGroups HuntGroups;
    public WS_ESB_ManageAccount.GetHuntGroupsRequestCriteria RequestCriteria;
    transient String[] ExecutionContext_type_info = new String[]{'ExecutionContext','http://ibus.czncorp.com/ESB/ExecutionContext','ExecutionContext', '0', '1', 'false'};
    transient String[] HuntGroups_type_info = new String[]{'HuntGroups', 'http://ibus.czncorp.com/ESB/BusinessObjects', 'HuntGroups', '0', '1', 'false'};
    transient String[] RequestCriteria_type_info = new String[]{'RequestCriteria','http://ibus.czncorp.com/ESB/ManageAccount', 'GetHuntGroupsRequestCriteria', '0', '1', 'false'};
    transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/ManageAccount', 'false', 'false'};
    transient String[] field_order_type_info = new String[]{'ExecutionContext', 'HuntGroups', 'RequestCriteria'};
}
//--------------------------------------added-----------------------------------------------------------------------------------------------------------------------------------------------
    
    
    
}