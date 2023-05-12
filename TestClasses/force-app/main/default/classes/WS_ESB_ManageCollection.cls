public class WS_ESB_ManageCollection {
    public static void Test_GetAccountsReceivable(String PhoneNumber, String DataRegion, Boolean IncludeSummary){
        WS_ESB_ManageCollection.Callout GetAR_Callout = new WS_ESB_ManageCollection.Callout();
        WS_ESB_ManageCollection.Response_GetAccountsReceivable  GetAR_Response = GetAR_Callout.GetAccountsReceivable(PhoneNumber,DataRegion,IncludeSummary);
        //system.debug(GetAR_Response);
        system.debug(JSON.serializePretty(GetAR_Response.AccountsReceivable));
    }
    
    public static void Test_GetPayment(String PhoneNumber, String SequenceNumber, String DataRegion){
        WS_ESB_ManageCollection.Callout GetPayment_Callout = new WS_ESB_ManageCollection.Callout();
        WS_ESB_ManageCollection.Response_GetPayment GetPayment_Response = GetPayment_Callout.GetPayment(PhoneNumber,SequenceNumber,DataRegion);
        //system.debug(GetPayment_Response);
        system.debug(JSON.serializePretty(GetPayment_Response.PaymentDetail));
    }
    
    public static void Test_GetAdjustment(String PhoneNumber, String SequenceNumber, String DataRegion){
        WS_ESB_ManageCollection.Callout GetAdjustment_Callout = new WS_ESB_ManageCollection.Callout();
        WS_ESB_ManageCollection.Response_GetAdjustment GetAdjustment_Response = GetAdjustment_Callout.GetAdjustment(PhoneNumber,SequenceNumber,DataRegion);
        //system.debug(GetAdjustment_Response);
        system.debug(JSON.serializePretty(GetAdjustment_Response.AdjustmentDetail));
    }
    
    public class RequestContainer_GetAccountsReceivable {
        public WS_ESB_ManageCollection.REQUEST_GetAccountsReceivable Request;
        transient String[] Request_type_info = new String[]{'ManageCollectionGetAccountsReceivableRequest','http://ibus.czncorp.com/ESB/ManageCollection','WS_ESB_ManageCollection.REQUEST_GetAccountsReceivable','1','1','true'};
        transient String[] apex_schema_type_info = new String[]{'http://ManageCollectionLibrary/ManageCollection','false','false'};
        transient String[] field_order_type_info = new String[]{'Request'};
        public RequestContainer_GetAccountsReceivable(){
            Request = new WS_ESB_ManageCollection.Request_GetAccountsReceivable();
        }
    }
    
    public class RequestCriteria_GetAccountsReceivable {
        public WS_ESB_BusinessObjects.RequestAccountId AccountId;
    public Boolean IncludeBTNSummariesFlag;
    transient String[] AccountId_type_info = new String[]{'AccountId','http://ibus.czncorp.com/ESB/BusinessObjects','RequestAccountId','1','1','false'};
    transient String[] IncludeBTNSummariesFlag_type_info = new String[]{'IncludeBTNSummariesFlag','http://www.w3.org/2001/XMLSchema','Boolean','0','1','false'};
    transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/ManageCollection','false','false'};
    transient String[] field_order_type_info = new String[]{'AccountId','IncludeBTNSummariesFlag'};
    public RequestCriteria_GetAccountsReceivable(){
        AccountId = new WS_ESB_BusinessObjects.RequestAccountId();
    }
    }
    
    public class Request_GetAccountsReceivable {
        public WS_ESB_ExecutionContext.ExecutionContext ExecutionContext;
    public WS_ESB_ManageCollection.RequestCriteria_GetAccountsReceivable RequestCriteria;
    transient String[] ExecutionContext_type_info = new String[]{'ExecutionContext','http://ibus.czncorp.com/ESB/ExecutionContext','ExecutionContext','1','1','false'};
    transient String[] RequestCriteria_type_info = new String[]{'RequestCriteria','http://ibus.czncorp.com/ESB/ManageCollection','GetAccountsReceivableRequestCriteria','0','1','false'};
    transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/ManageCollection','false','false'};
    transient String[] field_order_type_info = new String[]{'ExecutionContext','RequestCriteria'};
    public Request_GetAccountsReceivable(){
        ExecutionContext = new WS_ESB_ExecutionContext.ExecutionContext();
        RequestCriteria = new WS_ESB_ManageCollection.RequestCriteria_GetAccountsReceivable();
    }
    }
    
    public class ResponseContainer_GetAccountsReceivable {
    public WS_ESB_ManageCollection.Response_GetAccountsReceivable Response;
    transient String[] Response_type_info = new String[]{'ManageCollectionGetAccountsReceivableResponse','http://ibus.czncorp.com/ESB/ManageCollection','WS_ESB_ManageCollection.Response_GetAccountsReceivable','1','1','true'};
    transient String[] apex_schema_type_info = new String[]{'http://ManageCollectionLibrary/ManageCollection','false','false'};
    transient String[] field_order_type_info = new String[]{'Response'};
    }
    
    public class Response_GetAccountsReceivable {
    public WS_ESB_ExecutionContext.ExecutionContext ExecutionContext;
    public WS_ESB_ManageCollection.RequestCriteria_GetAccountsReceivable RequestCriteria;
    public WS_ESB_BusinessObjects.AccountId AccountId {get;set;}    
    public WS_ESB_BusinessObjects.AccountsReceivable[] AccountsReceivable {get;set;}
    public WS_ESB_BusinessObjects.PendingAccountsReceivable PendingAccountsReceivable {get;set;}
    transient String[] ExecutionContext_type_info = new String[]{'ExecutionContext','http://ibus.czncorp.com/ESB/ExecutionContext','ExecutionContext','0','1','false'};
    transient String[] RequestCriteria_type_info = new String[]{'RequestCriteria','http://ibus.czncorp.com/ESB/ManageCollection','GetAccountsReceivableRequestCriteria','1','1','false'};
    transient String[] AccountId_type_info = new String[]{'AccountId','http://ibus.czncorp.com/ESB/BusinessObjects','AccountId','0','1','false'};    
    transient String[] AccountsReceivable_type_info = new String[]{'AccountsReceivable','http://ibus.czncorp.com/ESB/BusinessObjects','AccountsReceivable','0','-1','false'};
    transient String[] PendingAccountsReceivable_type_info = new String[]{'PendingAccountsReceivable','http://ibus.czncorp.com/ESB/BusinessObjects','PendingAccountsReceivable','0','1','false'};
    transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/ManageCollection','false','false'};
    transient String[] field_order_type_info = new String[]{'ExecutionContext','RequestCriteria','AccountId','AccountsReceivable','PendingAccountsReceivable'};
    }
    
    
    public class Callout {
        public String endpoint_x = 'https://esbdprprd.frontiercorp.com/ManageCollection';
        public Map<String,String> inputHttpHeaders_x;
        public Map<String,String> outputHttpHeaders_x;
        public String clientCertName_x;
        public String clientCert_x;
        public String clientCertPasswd_x;
        public Integer timeout_x;
        transient String[] ns_map_type_info = new String[]{'http://ManageCollectionLibrary/ManageCollection', 'WS_ESB_ManageCollection', 'http://ibus.czncorp.com/ESB/ExecutionContext', 'WS_ESB_ExecutionContext', 'http://ibus.czncorp.com/ESB/BusinessObjects', 'WS_ESB_BusinessObjects', 'http://ibus.czncorp.com/ESB/ManageCollection', 'WS_ESB_ManageCollection'};
        public Callout(){       
                endpoint_x = WS_ESB_Settings__c.getOrgDefaults().URI_ManageCollection__c;
                //endpoint_x = 'https://esbdpruat.frontiercorp.com/esb/qat01/ManageCollectionWeb/sca/WSExport';
                inputHttpHeaders_x = new Map<String,String>();
                inputHttpHeaders_x.put('Authorization', 'Basic ' + EncodingUtil.base64Encode(Blob.valueOf(WS_ESB_Settings__c.getOrgDefaults().HDR_Authorization__c)));
                inputHttpHeaders_x.put('apikey',WS_ESB_Settings__c.getOrgDefaults().Apigee_Token__c);
                outputHttpHeaders_x = new Map<String,String>();
                timeout_x = (integer)WS_ESB_Settings__c.getOrgDefaults().TO_ManageCollection__c;
        }
        public WS_ESB_ManageCollection.Response_GetAccountsReceivable GetAccountsReceivable(String PhoneNumber, String DataRegion, Boolean IncludeSummary) {
            WS_ESB_ManageCollection.RequestContainer_GetAccountsReceivable request_x = new WS_ESB_ManageCollection.RequestContainer_GetAccountsReceivable();        
            WS_ESB_ManageCollection.ResponseContainer_GetAccountsReceivable response_x;
            request_x.Request.RequestCriteria = new WS_ESB_ManageCollection.RequestCriteria_GetAccountsReceivable();        
            request_x.Request.RequestCriteria.AccountId.PhoneNumberAsId = new WS_ESB_BusinessObjects.PhoneNumberAsId();
            request_x.Request.RequestCriteria.AccountId.PhoneNumberAsId.TelephoneNumber = new WS_ESB_BusinessObjects.TelephoneNumber();        
            request_x.Request.RequestCriteria.AccountId.PhoneNumberAsId.TelephoneNumber.Number_x = PhoneNumber;
            request_x.Request.RequestCriteria.AccountId.DataSourceEnvironment.DataRegion = DataRegion;
            request_x.Request.RequestCriteria.IncludeBTNSummariesFlag = IncludeSummary;
            Map<String, WS_ESB_ManageCollection.ResponseContainer_GetAccountsReceivable> response_map_x = new Map<String, WS_ESB_ManageCollection.ResponseContainer_GetAccountsReceivable>();
            response_map_x.put('response_x', response_x);
            //try{
            WebServiceCallout.invoke(
              this,
              request_x,
              response_map_x,
              new String[]{endpoint_x,
              '',
              'http://ManageCollectionLibrary/ManageCollection',
              'GetAccountsReceivable',
              'http://ManageCollectionLibrary/ManageCollection',
              'GetAccountsReceivableResponse',
              'WS_ESB_ManageCollection.ResponseContainer_GetAccountsReceivable'}
            );
            /*}catch(Exception ex){
                system.debug('GetAccountsReceivableResponse Exception ::  '+response_map_x);
                system.debug('GetAccountsReceivableResponse Exception2 ::  '+ex);
            }*/
            
            //system.debug('GetAccountsReceivableResponse ::  '+response_map_x);
            
            response_x = response_map_x.get('response_x');
            //system.debug('arec response'+response_x);
            return response_x.Response;        
        }
        
        public WS_ESB_ManageCollection.Response_GetPayment GetPayment(String PhoneNumber, String SequenceNumber, String DataRegion) {
            WS_ESB_ManageCollection.RequestContainer_GetPayment request_x = new WS_ESB_ManageCollection.RequestContainer_GetPayment();        
            WS_ESB_ManageCollection.ResponseContainer_GetPayment response_x;
            request_x.Request.RequestCriteria = new WS_ESB_ManageCollection.RequestCriteria_GetPayment();
            request_x.Request.RequestCriteria.AccountId.PhoneNumberAsId = new WS_ESB_BusinessObjects.PhoneNumberAsId();
            request_x.Request.RequestCriteria.AccountId.PhoneNumberAsId.TelephoneNumber = new WS_ESB_BusinessObjects.TelephoneNumber();        
            request_x.Request.RequestCriteria.AccountId.PhoneNumberAsId.TelephoneNumber.Number_x = PhoneNumber;
            request_x.Request.RequestCriteria.AccountId.PhoneNumberAsId.SequenceNumber = integer.valueOf(SequenceNumber);
            request_x.Request.RequestCriteria.AccountId.DataSourceEnvironment.DataRegion = DataRegion;
            Map<String, WS_ESB_ManageCollection.ResponseContainer_GetPayment> response_map_x = new Map<String, WS_ESB_ManageCollection.ResponseContainer_GetPayment>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
              this,
              request_x,
              response_map_x,
              new String[]{endpoint_x,
              '',
              'http://ManageCollectionLibrary/ManageCollection',
              'GetPayment',
              'http://ManageCollectionLibrary/ManageCollection',
              'GetPaymentResponse',
              'WS_ESB_ManageCollection.ResponseContainer_GetPayment'}
            );
            response_x = response_map_x.get('response_x');
            return response_x.Response;        
        }
        
        public WS_ESB_ManageCollection.Response_GetAdjustment GetAdjustment(String PhoneNumber, String SequenceNumber, String DataRegion) {
            WS_ESB_ManageCollection.RequestContainer_GetAdjustment request_x = new WS_ESB_ManageCollection.RequestContainer_GetAdjustment();        
            WS_ESB_ManageCollection.ResponseContainer_GetAdjustment response_x;
            request_x.Request.RequestCriteria = new WS_ESB_ManageCollection.RequestCriteria_GetAdjustment();
            request_x.Request.RequestCriteria.AccountId.PhoneNumberAsId = new WS_ESB_BusinessObjects.PhoneNumberAsId();
            request_x.Request.RequestCriteria.AccountId.PhoneNumberAsId.TelephoneNumber = new WS_ESB_BusinessObjects.TelephoneNumber();        
            request_x.Request.RequestCriteria.AccountId.PhoneNumberAsId.TelephoneNumber.Number_x = PhoneNumber;
            request_x.Request.RequestCriteria.AccountId.PhoneNumberAsId.SequenceNumber = integer.valueOf(SequenceNumber);
            request_x.Request.RequestCriteria.AccountId.DataSourceEnvironment.DataRegion = DataRegion;
            Map<String, WS_ESB_ManageCollection.ResponseContainer_GetAdjustment> response_map_x = new Map<String, WS_ESB_ManageCollection.ResponseContainer_GetAdjustment>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
              this,
              request_x,
              response_map_x,
              new String[]{endpoint_x,
              '',
              'http://ManageCollectionLibrary/ManageCollection',
              'GetAdjustment',
              'http://ManageCollectionLibrary/ManageCollection',
              'GetAdjustmentResponse',
              'WS_ESB_ManageCollection.ResponseContainer_GetAdjustment'}
            );
            response_x = response_map_x.get('response_x');
            return response_x.Response;        
        }
    }
    
    public class RequestContainer_GetPayment {
        public WS_ESB_ManageCollection.Request_GetPayment Request;
        transient String[] Request_type_info = new String[]{'ManageCollectionGetPaymentRequest','http://ibus.czncorp.com/ESB/ManageCollection','WS_ESB_ManageCollection.Request_GetPayment','1','1','true'};
        transient String[] apex_schema_type_info = new String[]{'http://ManageCollectionLibrary/ManageCollection','false','false'};
        transient String[] field_order_type_info = new String[]{'Request'};
        public RequestContainer_GetPayment(){
            Request = new WS_ESB_ManageCollection.Request_GetPayment();
        }
    }
    
    public class RequestCriteria_GetPayment {
        public WS_ESB_BusinessObjects.RequestAccountId AccountId;
        public Boolean IncludeOnlyPostedPaymentsNeverOnBillFlag;
        transient String[] AccountId_type_info = new String[]{'AccountId','http://ibus.czncorp.com/ESB/BusinessObjects','RequestAccountId','1','1','false'};
        transient String[] IncludeOnlyPostedPaymentsNeverOnBillFlag_type_info = new String[]{'IncludeOnlyPostedPaymentsNeverOnBillFlag','http://www.w3.org/2001/XMLSchema','Boolean','0','1','false'};
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/ManageCollection','false','false'};
        transient String[] field_order_type_info = new String[]{'AccountId','IncludeOnlyPostedPaymentsNeverOnBillFlag'};
        public RequestCriteria_GetPayment(){
            AccountId = new WS_ESB_BusinessObjects.RequestAccountId();
            IncludeOnlyPostedPaymentsNeverOnBillFlag = false;
        }
    }
    
    public class Request_GetPayment {
        public WS_ESB_ExecutionContext.ExecutionContext ExecutionContext;
        public WS_ESB_ManageCollection.RequestCriteria_GetPayment RequestCriteria;
        transient String[] ExecutionContext_type_info = new String[]{'ExecutionContext','http://ibus.czncorp.com/ESB/ExecutionContext','ExecutionContext','1','1','false'};
        transient String[] RequestCriteria_type_info = new String[]{'RequestCriteria','http://ibus.czncorp.com/ESB/ManageCollection','GetAccountsReceivableRequestCriteria','0','1','false'};
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/ManageCollection','false','false'};
        transient String[] field_order_type_info = new String[]{'ExecutionContext','RequestCriteria'};
        public Request_GetPayment(){
            ExecutionContext = new WS_ESB_ExecutionContext.ExecutionContext();
            RequestCriteria = new WS_ESB_ManageCollection.RequestCriteria_GetPayment();
        }
    }
    
    public class ResponseContainer_GetPayment {
        public WS_ESB_ManageCollection.Response_GetPayment Response;
        transient String[] Response_type_info = new String[]{'ManageCollectionGetPaymentResponse','http://ibus.czncorp.com/ESB/ManageCollection','WS_ESB_ManageCollection.Response_GetAccountsReceivable','1','1','true'};
        transient String[] apex_schema_type_info = new String[]{'http://ManageCollectionLibrary/ManageCollection','false','false'};
        transient String[] field_order_type_info = new String[]{'Response'};
    }
    
    public class Response_GetPayment {
        public WS_ESB_ExecutionContext.ExecutionContext ExecutionContext;
        public WS_ESB_ManageCollection.RequestCriteria_GetPayment RequestCriteria;
        public WS_ESB_BusinessObjects.CustomerPayment PaymentDetail;
        transient String[] ExecutionContext_type_info = new String[]{'ExecutionContext','http://ibus.czncorp.com/ESB/ExecutionContext','ExecutionContext','0','1','false'};
        transient String[] RequestCriteria_type_info = new String[]{'RequestCriteria','http://ibus.czncorp.com/ESB/ManageCollection','GetAccountsReceivableRequestCriteria','0','1','false'};
        transient String[] PaymentDetail_type_info = new String[]{'PaymentDetail','http://ibus.czncorp.com/ESB/BusinessObjects','WS_ESB_BusinessObjects.CustomerPayment','0','1','false'};    
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/ManageCollection','false','false'};
        transient String[] field_order_type_info = new String[]{'ExecutionContext','RequestCriteria','PaymentDetail'};
    }
    
    public class RequestContainer_GetAdjustment {
        public WS_ESB_ManageCollection.Request_GetAdjustment Request;
        transient String[] Request_type_info = new String[]{'ManageCollectionGetAdjustmentRequest','http://ibus.czncorp.com/ESB/ManageCollection','WS_ESB_ManageCollection.Request_GetAdjustment','1','1','true'};
        transient String[] apex_schema_type_info = new String[]{'http://ManageCollectionLibrary/ManageCollection','false','false'};
        transient String[] field_order_type_info = new String[]{'Request'};
        public RequestContainer_GetAdjustment(){
            Request = new WS_ESB_ManageCollection.Request_GetAdjustment();
        }
    }
    
    public class RequestCriteria_GetAdjustment {
        public WS_ESB_BusinessObjects.RequestAccountId AccountId;
        public Boolean IncludeOnlyPostedAdjustmentsNeverOnBillFlag;
        transient String[] AccountId_type_info = new String[]{'AccountId','http://ibus.czncorp.com/ESB/BusinessObjects','RequestAccountId','1','1','false'};
        transient String[] IncludeOnlyPostedAdjustmentsNeverOnBillFlag_type_info = new String[]{'IncludeOnlyPostedAdjustmentsNeverOnBillFlag','http://www.w3.org/2001/XMLSchema','Boolean','0','1','false'};
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/ManageCollection','false','false'};
        transient String[] field_order_type_info = new String[]{'AccountId','IncludeOnlyPostedAdjustmentsNeverOnBillFlag'};
        public RequestCriteria_GetAdjustment(){
            AccountId = new WS_ESB_BusinessObjects.RequestAccountId();
            IncludeOnlyPostedAdjustmentsNeverOnBillFlag = false;
        }
    }
    
    public class Request_GetAdjustment {
        public WS_ESB_ExecutionContext.ExecutionContext ExecutionContext;
        public WS_ESB_ManageCollection.RequestCriteria_GetAdjustment RequestCriteria;
        transient String[] ExecutionContext_type_info = new String[]{'ExecutionContext','http://ibus.czncorp.com/ESB/ExecutionContext','ExecutionContext','1','1','false'};
        transient String[] RequestCriteria_type_info = new String[]{'RequestCriteria','http://ibus.czncorp.com/ESB/ManageCollection','GetAccountsReceivableRequestCriteria','0','1','false'};
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/ManageCollection','false','false'};
        transient String[] field_order_type_info = new String[]{'ExecutionContext','RequestCriteria'};
        public Request_GetAdjustment(){
            ExecutionContext = new WS_ESB_ExecutionContext.ExecutionContext();
            RequestCriteria = new WS_ESB_ManageCollection.RequestCriteria_GetAdjustment();
        }
    }
    
    public class ResponseContainer_GetAdjustment {
        public WS_ESB_ManageCollection.Response_GetAdjustment Response;
        transient String[] Response_type_info = new String[]{'ManageCollectionGetAdjustmentResponse','http://ibus.czncorp.com/ESB/ManageCollection','WS_ESB_ManageCollection.Response_GetAccountsReceivable','1','1','true'};
        transient String[] apex_schema_type_info = new String[]{'http://ManageCollectionLibrary/ManageCollection','false','false'};
        transient String[] field_order_type_info = new String[]{'Response'};
    }
    
    public class Response_GetAdjustment {
        public WS_ESB_ExecutionContext.ExecutionContext ExecutionContext;
        public WS_ESB_ManageCollection.RequestCriteria_GetAdjustment RequestCriteria; 
        public WS_ESB_BusinessObjects.AdjustmentDetail[] AdjustmentDetail;
        transient String[] ExecutionContext_type_info = new String[]{'ExecutionContext','http://ibus.czncorp.com/ESB/ExecutionContext','ExecutionContext','0','1','false'};
        transient String[] RequestCriteria_type_info = new String[]{'RequestCriteria','http://ibus.czncorp.com/ESB/ManageCollection','GetAccountsReceivableRequestCriteria','0','1','false'};
        transient String[] AdjustmentDetail_type_info = new String[]{'AdjustmentDetail','http://ibus.czncorp.com/ESB/BusinessObjects','WS_ESB_BusinessObjects.AdjustmentDetail','0','1','false'};    
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/ManageCollection','false','false'};
        transient String[] field_order_type_info = new String[]{'ExecutionContext','RequestCriteria','AdjustmentDetail'};
    }
        
}