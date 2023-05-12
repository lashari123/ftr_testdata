public class WS_ESB_ManageAddress {

    public static void TestCallout(WS_ESB_ManageAddress.GetAddressRequestCriteria rc){
        WS_ESB_ManageAddress.Callout co = new WS_ESB_ManageAddress.Callout();
        WS_ESB_ManageAddress.ManageAddressGetAddressResponse maga = co.GetAddress(rc); 
    }
    public static void TestCallout1(WS_ESB_ExecutionContext.ExecutionContext ec,WS_ESB_ManageAddress.SearchAddressRequestCriteria sc){
        WS_ESB_ManageAddress.Callout co = new WS_ESB_ManageAddress.Callout();
        WS_ESB_ManageAddress.ManageAddressSearchAddressResponse maga = co.SearchAddress(ec, sc); 
    }
    public class Callout {
        public String endpoint_x;
        public Map<String,String> inputHttpHeaders_x;
        public Map<String,String> outputHttpHeaders_x;
        public String clientCertName_x;
        public String clientCert_x;
        public String clientCertPasswd_x;
        public Integer timeout_x;
        private String[] ns_map_type_info = new String[]{'http://ManageAddressLibrary/ManageAddressInterface', 'WS_ESB_ManageAddress', 'http://ibus.czncorp.com/ESB/ManageAddress', 'WS_ESB_ManageAddress', 'http://ManageAddressLibrary/ManageAddress', 'WS_ESB_ManageAddress', 'http://ibus.czncorp.com/ESB/ExecutionContext', 'WS_ESB_ExecutionContext', 'http://ibus.czncorp.com/ESB/BusinessObjects', 'WS_ESB_BusinessObjects'};
        public Callout(){
            endpoint_x = WS_ESB_Settings__c.getOrgDefaults().URI_ManageAddress__c;
            inputHttpHeaders_x = new Map<String,String>();
            inputHttpHeaders_x.put('Authorization', 'Basic ' + EncodingUtil.base64Encode(Blob.valueOf(WS_ESB_Settings__c.getOrgDefaults().HDR_Authorization__c))); //'sfacom:frontier123'
            inputHttpHeaders_x.put('apikey',WS_ESB_Settings__c.getOrgDefaults().Apigee_Token__c);
            outputHttpHeaders_x = new Map<String,String>();
            timeout_x = (integer)WS_ESB_Settings__c.getOrgDefaults().TO_ManageAddress__c;
        }
        public WS_ESB_ManageAddress.ManageAddressGetAddressResponse GetAddress(WS_ESB_ManageAddress.GetAddressRequestCriteria RequestCriteria) {
            WS_ESB_ManageAddress.ManageAddressGetAddressRequest request_x = new WS_ESB_ManageAddress.ManageAddressGetAddressRequest();
            WS_ESB_ManageAddress.ManageAddressGetAddressResponse response_x;
            request_x.ExecutionContext = new WS_ESB_ExecutionContext.ExecutionContext();
            request_x.RequestCriteria = RequestCriteria;
            Map<String, WS_ESB_ManageAddress.ManageAddressGetAddressResponse> response_map_x = new Map<String, WS_ESB_ManageAddress.ManageAddressGetAddressResponse>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
                this,
                request_x,
                response_map_x,
                new String[]{endpoint_x,
                '',
                'http://ibus.czncorp.com/ESB/ManageAddress',
                'ManageAddressGetAddressRequest',
                'http://ibus.czncorp.com/ESB/ManageAddress',
                'ManageAddressGetAddressResponse',
                'WS_ESB_ManageAddress.ManageAddressGetAddressResponse'}
            );
            response_x = response_map_x.get('response_x');
            return response_x;
        }
        public WS_ESB_ManageAddress.ManageAddressSearchAddressResponse SearchAddress(WS_ESB_ExecutionContext.ExecutionContext ExecutionContext,WS_ESB_ManageAddress.SearchAddressRequestCriteria RequestCriteria) {
            WS_ESB_ManageAddress.ManageAddressSearchAddressRequest request_x = new WS_ESB_ManageAddress.ManageAddressSearchAddressRequest();
            WS_ESB_ManageAddress.ManageAddressSearchAddressResponse response_x;
            request_x.ExecutionContext = ExecutionContext;
            request_x.RequestCriteria = RequestCriteria;
            Map<String, WS_ESB_ManageAddress.ManageAddressSearchAddressResponse> response_map_x = new Map<String, WS_ESB_ManageAddress.ManageAddressSearchAddressResponse>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
                this,
                request_x,
                response_map_x,
                new String[]{endpoint_x,
                '',
                'http://ibus.czncorp.com/ESB/ManageAddress',
                'ManageAddressSearchAddressRequest',
                'http://ibus.czncorp.com/ESB/ManageAddress',
                'ManageAddressSearchAddressResponse',
                'WS_ESB_ManageAddress.ManageAddressSearchAddressResponse'}
            );
            response_x = response_map_x.get('response_x');
            return response_x;
        }
    }   
    public class ManageAddressSearchAddressResponse {
        public WS_ESB_ExecutionContext.ExecutionContext ExecutionContext;
        public WS_ESB_ManageAddress.SearchAddressRequestCriteria RequestCriteria;
        public WS_ESB_BusinessObjects.AddressType[] Address;
    private String[] ExecutionContext_type_info = new String[]{'ExecutionContext','http://ibus.czncorp.com/ESB/ExecutionContext','ExecutionContext','0','1','false'};
    private String[] RequestCriteria_type_info = new String[]{'RequestCriteria','http://ibus.czncorp.com/ESB/ManageAddress','SearchAddressRequestCriteria','0','1','false'};
    private String[] Address_type_info = new String[]{'Address','http://ibus.czncorp.com/ESB/BusinessObjects','AddressType','0','-1','false'};
    private String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/ManageAddress','false','false'};
    private String[] field_order_type_info = new String[]{'ExecutionContext','RequestCriteria','Address'};
    }
    public class ManageAddressSearchAddressRequest {
    public WS_ESB_ExecutionContext.ExecutionContext ExecutionContext;
    public WS_ESB_ManageAddress.SearchAddressRequestCriteria RequestCriteria;
    private String[] ExecutionContext_type_info = new String[]{'ExecutionContext','http://ibus.czncorp.com/ESB/ExecutionContext','ExecutionContext','1','1','false'};
    private String[] RequestCriteria_type_info = new String[]{'RequestCriteria','http://ibus.czncorp.com/ESB/ManageAddress','SearchAddressRequestCriteria','0','1','false'};
    private String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/ManageAddress','false','false'};
    private String[] field_order_type_info = new String[]{'ExecutionContext','RequestCriteria'};
    
    public ManageAddressSearchAddressRequest(){
        ExecutionContext = new WS_ESB_ExecutionContext.ExecutionContext();
        RequestCriteria = new WS_ESB_ManageAddress.SearchAddressRequestCriteria();
    }
    }
    public class ManageAddressGetAddressRequest {
    public WS_ESB_ExecutionContext.ExecutionContext ExecutionContext;
    public WS_ESB_ManageAddress.GetAddressRequestCriteria RequestCriteria;
    private String[] ExecutionContext_type_info = new String[]{'ExecutionContext','http://ibus.czncorp.com/ESB/ExecutionContext','ExecutionContext','1','1','false'};
    private String[] RequestCriteria_type_info = new String[]{'RequestCriteria','http://ibus.czncorp.com/ESB/ManageAddress','GetAddressRequestCriteria','0','1','false'};
    private String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/ManageAddress','false','false'};
    private String[] field_order_type_info = new String[]{'ExecutionContext','RequestCriteria'};
    
    public ManageAddressGetAddressRequest(){
        ExecutionContext = new WS_ESB_ExecutionContext.ExecutionContext();
        RequestCriteria = new WS_ESB_ManageAddress.GetAddressRequestCriteria();
    }
    }
    public class SearchAddressRequestCriteria {
    public WS_ESB_BusinessObjects.IndividualName IndividualName;
    public WS_ESB_BusinessObjects.AddressType Address;
    public WS_ESB_BusinessObjects.TelephoneNumber TelephoneNumber;
    public String[] ExactMatchFor;
    public String Action;
    public Integer MaximumCount;
    private String[] IndividualName_type_info = new String[]{'IndividualName','http://ibus.czncorp.com/ESB/BusinessObjects','IndividualName','0','1','false'};
    private String[] Address_type_info = new String[]{'Address','http://ibus.czncorp.com/ESB/BusinessObjects','AddressType','0','1','false'};
    private String[] TelephoneNumber_type_info = new String[]{'TelephoneNumber','http://ibus.czncorp.com/ESB/BusinessObjects','TelephoneNumber','0','1','false'};
    private String[] ExactMatchFor_type_info = new String[]{'ExactMatchFor','http://www.w3.org/2001/XMLSchema','string','0','-1','false'};
    private String[] Action_type_info = new String[]{'Action','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
    private String[] MaximumCount_type_info = new String[]{'MaximumCount','http://www.w3.org/2001/XMLSchema','integer','0','1','false'};
    private String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/ManageAddress','false','false'};
    private String[] field_order_type_info = new String[]{'IndividualName','Address','TelephoneNumber','ExactMatchFor','Action','MaximumCount'};
    
    public SearchAddressRequestCriteria(){
        Address = new WS_ESB_BusinessObjects.AddressType();
        MaximumCount = 10000;
    }
    }
    public class ManageAddressGetAddressResponse {
    public WS_ESB_ExecutionContext.ExecutionContext ExecutionContext;
    public WS_ESB_ManageAddress.GetAddressRequestCriteria RequestCriteria;
    public WS_ESB_BusinessObjects.AddressType[] Address;
    private String[] ExecutionContext_type_info = new String[]{'ExecutionContext','http://ibus.czncorp.com/ESB/ExecutionContext','ExecutionContext','0','1','false'};
    private String[] RequestCriteria_type_info = new String[]{'RequestCriteria','http://ibus.czncorp.com/ESB/ManageAddress','GetAddressRequestCriteria','0','1','false'};
    private String[] Address_type_info = new String[]{'Address','http://ibus.czncorp.com/ESB/BusinessObjects','AddressType','0','-1','false'};
    private String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/ManageAddress','false','false'};
    private String[] field_order_type_info = new String[]{'ExecutionContext','RequestCriteria','Address'};
    }
    public class GetAddressRequestCriteria {
    public WS_ESB_BusinessObjects.AddressType Address;
    public WS_ESB_BusinessObjects.TelephoneNumber TelephoneNumber;
    public String CircuitId;
    public Boolean IncludeProcessingOptionsFlag;
    public Boolean IncludeDuplicateAddressFlag;
    public String Action;
    public String ResultFilterIndicator;
    private String[] Address_type_info = new String[]{'Address','http://ibus.czncorp.com/ESB/BusinessObjects','AddressType','0','1','false'};
    private String[] TelephoneNumber_type_info = new String[]{'TelephoneNumber','http://ibus.czncorp.com/ESB/BusinessObjects','TelephoneNumber','0','1','false'};
    private String[] CircuitId_type_info = new String[]{'CircuitId','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
    private String[] IncludeProcessingOptionsFlag_type_info = new String[]{'IncludeProcessingOptionsFlag','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
    private String[] IncludeDuplicateAddressFlag_type_info = new String[]{'IncludeDuplicateAddressFlag','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
    private String[] Action_type_info = new String[]{'Action','http://www.w3.org/2001/XMLSchema','string','1','1','false'};
    private String[] ResultFilterIndicator_type_info = new String[]{'ResultFilterIndicator','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
    private String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/ManageAddress','false','false'};
    private String[] field_order_type_info = new String[]{'Address','TelephoneNumber','CircuitId','IncludeProcessingOptionsFlag','IncludeDuplicateAddressFlag','Action','ResultFilterIndicator'};
    
    public GetAddressRequestCriteria(){
        Address = new WS_ESB_BusinessObjects.AddressType();
        IncludeDuplicateAddressFlag = true;
        IncludeProcessingOptionsFlag = true;
        //Action = 'RetrievePostalAndServiceAddress';
        //Action = 'RetrieveServiceAddress';
    }
    }
}