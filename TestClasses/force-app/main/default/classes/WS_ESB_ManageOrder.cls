public class WS_ESB_ManageOrder {
	public static void TestCallout(String ServiceId){
		WS_ESB_ManageOrder.Callout ManageOrderGetOrderStatus_Callout = new WS_ESB_ManageOrder.Callout();
		WS_ESB_ManageOrder.ManageOrderGetOrderStatusResponse  GetOrderStatus_Response = ManageOrderGetOrderStatus_Callout.GetOrderStatus(ServiceId);
	}
	public class ManageOrderGetOrderStatusRequest {
		public WS_ESB_ExecutionContext.ExecutionContext ExecutionContext;
    public WS_ESB_ManageOrder.ManageOrderGetOrderStatusRequestCriteria RequestCriteria;
    transient String[] ExecutionContext_type_info = new String[]{'ExecutionContext','http://ibus.czncorp.com/ESB/ExecutionContext','ExecutionContext','1','1','false'};
    transient String[] RequestCriteria_type_info = new String[]{'RequestCriteria','http://ibus.czncorp.com/ESB/ManageOrder','ManageOrderGetOrderStatusRequestCriteria','0','1','false'};
    transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/ManageOrder','false','false'};
    transient String[] field_order_type_info = new String[]{'ExecutionContext','RequestCriteria'};
    public ManageOrderGetOrderStatusRequest(){
    	ExecutionContext = new WS_ESB_ExecutionContext.ExecutionContext();
    	RequestCriteria = new WS_ESB_ManageOrder.ManageOrderGetOrderStatusRequestCriteria();
    }
	}
	public class ManageOrderGetOrderStatusResponse {
		public WS_ESB_ExecutionContext.ExecutionContext ExecutionContext;
    public WS_ESB_ManageOrder.ManageOrderGetOrderStatusRequestCriteria RequestCriteria;
    public WS_ESB_BusinessObjects.ProductOrder[] ProductOrder {get;set;}
    transient String[] ExecutionContext_type_info = new String[]{'ExecutionContext','http://ibus.czncorp.com/ESB/ManageOrder','ExecutionContext','0','1','false'};
		transient String[] RequestCriteria_type_info = new String[]{'RequestCriteria','http://ibus.czncorp.com/ESB/ManageOrder','','0','1','false'};
		transient String[] ProductOrder_type_info = new String[]{'ProductOrder','http://ibus.czncorp.com/ESB/BusinessObjects','','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/ManageOrder','false','false'};
		transient String[] field_order_type_info = new String[]{'ExecutionContext','RequestCriteria','ProductOrder'};    
	}
	public class ManageOrderGetOrderStatusRequestCriteria {
		public String ServiceId;
		public String OrderId;
		public WS_ESB_BusinessObjects.OrderInfo LeadOrderId;
		transient String[] ServiceId_type_info = new String[]{'ServiceId','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
		transient String[] OrderId_type_info = new String[]{'OrderId','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
		transient String[] LeadOrderId_type_info = new String[]{'LeadOrderId','http://ibus.czncorp.com/ESB/BusinessObjects','OrderInfo','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/ManageOrder','false','false'};
		transient String[] field_order_type_info = new String[]{'ServiceId','OrderId','LeadOrderId'};		
	}
	
	public class Callout {
		public String endpoint_x;
    public Map<String,String> inputHttpHeaders_x;
    public Map<String,String> outputHttpHeaders_x;
    public String clientCertName_x;
    public String clientCert_x;
    public String clientCertPasswd_x;
    public Integer timeout_x;
    transient String[] ns_map_type_info = new String[]{'http://ManageCollectionLibrary/ManageOrder', 'WS_ESB_ManageOrder', 'http://ibus.czncorp.com/ESB/ExecutionContext', 'WS_ESB_ExecutionContext', 'http://ibus.czncorp.com/ESB/BusinessObjects', 'WS_ESB_BusinessObjects', 'http://ibus.czncorp.com/ESB/ManageOrder', 'WS_ESB_ManageOrder'};
    public Callout(){    	
			endpoint_x = WS_ESB_Settings__c.getOrgDefaults().URI_ManageOrder__c;
			inputHttpHeaders_x = new Map<String,String>();
			inputHttpHeaders_x.put('Authorization', 'Basic ' + EncodingUtil.base64Encode(Blob.valueOf(WS_ESB_Settings__c.getOrgDefaults().HDR_Authorization__c)));
                        inputHttpHeaders_x.put('apikey',WS_ESB_Settings__c.getOrgDefaults().Apigee_Token__c);
			outputHttpHeaders_x = new Map<String,String>();
			timeout_x = (integer)WS_ESB_Settings__c.getOrgDefaults().TO_ManageOrder__c;			
    }
    public WS_ESB_ManageOrder.ManageOrderGetOrderStatusResponse GetOrderStatus(String ServiceId){
			WS_ESB_ManageOrder.ManageOrderGetOrderStatusRequest request_x = new WS_ESB_ManageOrder.ManageOrderGetOrderStatusRequest();
			request_x.RequestCriteria.ServiceId = ServiceId;
	    WS_ESB_ManageOrder.ManageOrderGetOrderStatusResponse response_x;
	    Map<String, WS_ESB_ManageOrder.ManageOrderGetOrderStatusResponse> response_map_x = new Map<String, WS_ESB_ManageOrder.ManageOrderGetOrderStatusResponse>();
	    response_map_x.put('response_x', response_x);
	    WebServiceCallout.invoke(
	      this,
	      request_x,
	      response_map_x,
	      new String[]{endpoint_x,
	      '',
	      'http://ibus.czncorp.com/ESB/ManageOrder',          
	      'ManageOrderGetOrderStatusRequest',
	      'http://ibus.czncorp.com/ESB/ManageOrder',
	      'ManageOrderGetOrderStatusResponse',
	      'WS_ESB_ManageOrder.ManageOrderGetOrderStatusResponse'}
	    );
	    response_x = response_map_x.get('response_x');
	    return response_x;
		}
	}
}