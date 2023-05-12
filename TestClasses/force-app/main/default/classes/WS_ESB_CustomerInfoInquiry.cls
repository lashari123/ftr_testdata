public  class WS_ESB_CustomerInfoInquiry {
    
    public static void HuntGroupCallout(String Type, String PhoneNumber, String DataRegion){
        WS_ESB_CustomerInfoInquiry.Callout GetHuntGroup_Callout = new WS_ESB_CustomerInfoInquiry.Callout();
        WS_ESB_CustomerInfoInquiry.retrieveCustomerServiceConfigurationResponse_element  GetHuntGroup_Response = new WS_ESB_CustomerInfoInquiry.retrieveCustomerServiceConfigurationResponse_element();
        GetHuntGroup_Response.retrieveCustomerServiceConfigurationOutput = GetHuntGroup_Callout.retrieveHuntGroup(Type, PhoneNumber, DataRegion);
        system.debug(LoggingLevel.ERROR,json.serialize(GetHuntGroup_Response));
    }
    
    public class retrieveCustomerServiceConfiguration_element {
        public WS_BPM_BusinessObjects.msg_LookupRequest retrieveCustomerServiceConfigurationInput;
        transient String[] retrieveCustomerServiceConfigurationInput_type_info = new String[]{'retrieveCustomerServiceConfigurationInput','http://TPFCRMAI/AIS/CustomerInformationInquiry','msg_LookupRequest','1','1','true'};
        transient String[] apex_schema_type_info = new String[]{'http://TPFCRMAI/AIS/CustomerInformationInquiry','true','false'};
        transient String[] field_order_type_info = new String[]{'retrieveCustomerServiceConfigurationInput'};
        
        public retrieveCustomerServiceConfiguration_element(String Type, String TelephoneNumber, String DataRegion) {       
            retrieveCustomerServiceConfigurationInput = new WS_BPM_BusinessObjects.msg_LookupRequest(Type, TelephoneNumber, DataRegion);
        }
    }
    
    public class retrieveCustomerServiceConfigurationResponse_element {
        public WS_BPM_BusinessObjects.msg_Service retrieveCustomerServiceConfigurationOutput;
        transient String[] retrieveCustomerServiceConfigurationOutput_type_info = new String[]{'retrieveCustomerServiceConfigurationOutput','http://TPFCRMAI/AIS/CustomerInformationInquiry','msg_Service','1','1','true'};
        transient String[] apex_schema_type_info = new String[]{'http://TPFCRMAI/AIS/CustomerInformationInquiry','false','false'};
        transient String[] field_order_type_info = new String[]{'retrieveCustomerServiceConfigurationOutput'};
    }
    
    public class Callout {
        public String endpoint_x;
        //public WS_BPM_BusinessObjects.SecurityHeader Security = new WS_BPM_BusinessObjects.SecurityHeader('s_dpi_datapower', 'Service6023');
		//private String Security_hns;
        public Map<String,String> inputHttpHeaders_x;
        public Map<String,String> outputHttpHeaders_x;
        public String clientCertName_x;
        public String clientCert_x;
        public String clientCertPasswd_x;
        public Integer timeout_x;
        transient String[] ns_map_type_info = new String[]{'http://TPFCRMAI/AIS/CustomerInformationInquiry','WS_ESB_CustomerInfoInquiry','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','WS_BPM_BusinessObjects','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','WS_BPM_BusinessObjects','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','WS_BPM_BusinessObjects','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','WS_BPM_BusinessObjects','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common/extensions','WS_BPM_BusinessObjects','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/billing/extensions','WS_BPM_BusinessObjects','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/messageview','WS_BPM_BusinessObjects','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiermessageview','WS_BPM_BusinessObjects'};
        public Callout(){       
            endpoint_x = WS_ESB_Settings__c.getOrgDefaults().URI_CustomerInformationInquiry__c;
            inputHttpHeaders_x = new Map<String,String>();
            //inputHttpHeaders_x.put('Authorization', 'Basic ' + EncodingUtil.base64Encode(Blob.valueOf(WS_ESB_Settings__c.getOrgDefaults().HDR_Authorization__c)));
            inputHttpHeaders_x.put('Authorization', 'Basic c2ZhY29tOmZyb250aWVyMTIz');
            system.debug('Authorization Header:\n\n' + inputHttpHeaders_x);
            outputHttpHeaders_x = new Map<String,String>();
            timeout_x = (integer)WS_ESB_Settings__c.getOrgDefaults().TO_CustomerInformationInquiry__c;
        }
        
        public WS_BPM_BusinessObjects.msg_Service retrieveCustomerServiceConfiguration(WS_BPM_BusinessObjects.msg_LookupRequest retrieveCustomerServiceConfigurationInput, String Type, String TelephoneNumber, String DataRegion) {
            WS_ESB_CustomerInfoInquiry.retrieveCustomerServiceConfiguration_element request_x = new WS_ESB_CustomerInfoInquiry.retrieveCustomerServiceConfiguration_element(Type, TelephoneNumber, DataRegion);
            WS_ESB_CustomerInfoInquiry.retrieveCustomerServiceConfigurationResponse_element response_x;
            request_x.retrieveCustomerServiceConfigurationInput = retrieveCustomerServiceConfigurationInput;
            Map<String, WS_ESB_CustomerInfoInquiry.retrieveCustomerServiceConfigurationResponse_element> response_map_x = new Map<String, WS_ESB_CustomerInfoInquiry.retrieveCustomerServiceConfigurationResponse_element>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
                this,
                request_x,
                response_map_x,
                new String[]{endpoint_x,
                '',
                'http://TPFCRMAI/AIS/CustomerInformationInquiry',
                'retrieveCustomerServiceConfiguration',
                'http://TPFCRMAI/AIS/CustomerInformationInquiry',
                'retrieveCustomerServiceConfigurationResponse',
                'WS_ESB_CustomerInfoInquiry.retrieveCustomerServiceConfigurationResponse_element'}
            );
            response_x = response_map_x.get('response_x');
            return response_x.retrieveCustomerServiceConfigurationOutput;
        }               
        
        public WS_BPM_BusinessObjects.msg_Service retrieveHuntGroup(String Type, String TelephoneNumber, String DataRegion) {
            WS_ESB_CustomerInfoInquiry.retrieveCustomerServiceConfiguration_element request_x = new WS_ESB_CustomerInfoInquiry.retrieveCustomerServiceConfiguration_element('retrieveHuntGroup', TelephoneNumber, DataRegion);
            WS_ESB_CustomerInfoInquiry.retrieveCustomerServiceConfigurationResponse_element response_x;
            //request_x.retrieveCustomerServiceConfigurationInput = new WS_ESB_CustomerInfoInquiry.retrieveCustomerServiceConfiguration_element.;
            Map<String, WS_ESB_CustomerInfoInquiry.retrieveCustomerServiceConfigurationResponse_element> response_map_x = new Map<String, WS_ESB_CustomerInfoInquiry.retrieveCustomerServiceConfigurationResponse_element>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
                this,
                request_x,
                response_map_x,
                new String[]{endpoint_x,
                '',
                'http://TPFCRMAI/AIS/CustomerInformationInquiry',
                'retrieveCustomerServiceConfiguration',
                'http://TPFCRMAI/AIS/CustomerInformationInquiry',
                'retrieveCustomerServiceConfigurationResponse',
                'WS_ESB_CustomerInfoInquiry.retrieveCustomerServiceConfigurationResponse_element'}
            );
            response_x = response_map_x.get('response_x');
            return response_x.retrieveCustomerServiceConfigurationOutput;
        }
    }
    
    

}