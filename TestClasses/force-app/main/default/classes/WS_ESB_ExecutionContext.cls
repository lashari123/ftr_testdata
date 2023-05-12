public class WS_ESB_ExecutionContext {
	public class ExecutionStatus {
		public Boolean ExecutionStatusSuccessFlag {get;set;}
		public String ExecutionStatusAction {get;set;}
		public WS_ESB_ExecutionContext.ExecutionStatusMessage[] ExecutionStatusMessage {get;set;}
		private String[] ExecutionStatusSuccessFlag_type_info = new String[]{'ExecutionStatusSuccessFlag','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
		private String[] ExecutionStatusAction_type_info = new String[]{'ExecutionStatusAction','http://ibus.czncorp.com/ESB/ExecutionContext','ExecutionStatusActionEnum','0','1','false'};
		private String[] ExecutionStatusMessage_type_info = new String[]{'ExecutionStatusMessage','http://ibus.czncorp.com/ESB/ExecutionContext','ExecutionStatusMessage','0','-1','false'};
		private String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/ExecutionContext','false','false'};
		private String[] field_order_type_info = new String[]{'ExecutionStatusSuccessFlag','ExecutionStatusAction','ExecutionStatusMessage'};
	}
	public class ESBHeader {
		public WS_ESB_ExecutionContext.ConsumerInfo ConsumerInfo;
		public WS_ESB_ExecutionContext.ProviderInfo[] ProviderInfo;
		public Boolean Heartbeat;
		public String TrackingID;
		public WS_ESB_ExecutionContext.TraceResults TraceResults;
		public WS_ESB_ExecutionContext.TraceSettings TraceSettings;
		private String[] ConsumerInfo_type_info = new String[]{'ConsumerInfo','http://ibus.czncorp.com/ESB/ExecutionContext','ConsumerInfo','1','1','false'};
		private String[] ProviderInfo_type_info = new String[]{'ProviderInfo','http://ibus.czncorp.com/ESB/ExecutionContext','ProviderInfo','0','-1','false'};
		private String[] Heartbeat_type_info = new String[]{'Heartbeat','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
		private String[] TrackingID_type_info = new String[]{'TrackingID','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
		private String[] TraceResults_type_info = new String[]{'TraceResults','http://ibus.czncorp.com/ESB/ExecutionContext','TraceResults','0','1','false'};
		private String[] TraceSettings_type_info = new String[]{'TraceSettings','http://ibus.czncorp.com/ESB/ExecutionContext','TraceSettings','0','1','false'};
		private String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/ExecutionContext','false','false'};
		private String[] field_order_type_info = new String[]{'ConsumerInfo','ProviderInfo','Heartbeat','TrackingID','TraceResults','TraceSettings'};
		
		public ESBHeader(){
			ConsumerInfo = new WS_ESB_ExecutionContext.ConsumerInfo();
		}
	}
	public class ProviderInfo {
		public String ID;
		public String Name;
		public String ProviderType;
		public String VersionID;
		public DateTime VersionDateTime;
		public String Description;
		public String Location;
		public String TransactionID;
		private String[] ID_type_info = new String[]{'ID','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
		private String[] Name_type_info = new String[]{'Name','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
		private String[] ProviderType_type_info = new String[]{'ProviderType','http://ibus.czncorp.com/ESB/ExecutionContext','ProviderTypeEnum','0','1','false'};
		private String[] VersionID_type_info = new String[]{'VersionID','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
		private String[] VersionDateTime_type_info = new String[]{'VersionDateTime','http://www.w3.org/2001/XMLSchema','dateTime','0','1','false'};
		private String[] Description_type_info = new String[]{'Description','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
		private String[] Location_type_info = new String[]{'Location','http://www.w3.org/2001/XMLSchema','anyURI','0','1','false'};
		private String[] TransactionID_type_info = new String[]{'TransactionID','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
		private String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/ExecutionContext','false','false'};
		private String[] field_order_type_info = new String[]{'ID','Name','ProviderType','VersionID','VersionDateTime','Description','Location','TransactionID'};
	}
	public class TraceResults {
		public WS_ESB_ExecutionContext.TraceResult[] TraceResult;
		private String[] TraceResult_type_info = new String[]{'TraceResult','http://ibus.czncorp.com/ESB/ExecutionContext','TraceResult','0','-1','false'};
		private String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/ExecutionContext','false','false'};
		private String[] field_order_type_info = new String[]{'TraceResult'};
	}
	public class ConsumerInfo {
		public String TrackingID{get; set;}
		public String ApplicationID;
		public String EmployeeID;
		public String UserID;
		public String TransactionID;
		private String[] TrackingID_type_info = new String[]{'TrackingID','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
		private String[] ApplicationID_type_info = new String[]{'ApplicationID','http://ibus.czncorp.com/ESB/ExecutionContext','ApplicationIDEnum','1','1','false'};
		private String[] EmployeeID_type_info = new String[]{'EmployeeID','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
		private String[] UserID_type_info = new String[]{'UserID','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
		private String[] TransactionID_type_info = new String[]{'TransactionID','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
		private String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/ExecutionContext','false','false'};
		private String[] field_order_type_info = new String[]{'TrackingID','ApplicationID','EmployeeID','UserID','TransactionID'};
		
		public ConsumerInfo(){
			ApplicationID = WS_ESB_Settings__c.getOrgDefaults().EC_ApplicationID__c;//'SFDC';
			EmployeeID = WS_ESB_Settings__c.getOrgDefaults().EC_EmployeeID__c;//'123456';
			UserID = WS_ESB_Settings__c.getOrgDefaults().EC_UserID__c;//'ESB_REG';
		}
	}
	public class ExecutionContext {	
		public WS_ESB_ExecutionContext.ExecutionStatus ExecutionStatus {get;set;}
		public WS_ESB_ExecutionContext.ESBHeader ESBHeader {get;set;}
		private String[] ExecutionStatus_type_info = new String[]{'ExecutionStatus','http://ibus.czncorp.com/ESB/ExecutionContext','ExecutionStatus','0','1','false'};
		private String[] ESBHeader_type_info = new String[]{'ESBHeader','http://ibus.czncorp.com/ESB/ExecutionContext','ESBHeader','1','1','false'};
		private String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/ExecutionContext','false','false'};
		private String[] field_order_type_info = new String[]{'ExecutionStatus','ESBHeader'};
		
		public ExecutionContext(){
			ESBHeader = new WS_ESB_ExecutionContext.ESBHeader();
		}
	}
	public class TraceResult {
		public String HostName;
		public String Component;
		public DateTime DateTime_x;
		public String Message;
		private String[] HostName_type_info = new String[]{'HostName','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
		private String[] Component_type_info = new String[]{'Component','http://ibus.czncorp.com/ESB/ExecutionContext','ComponentEnum','0','1','false'};
		private String[] DateTime_x_type_info = new String[]{'DateTime','http://www.w3.org/2001/XMLSchema','dateTime','0','1','false'};
		private String[] Message_type_info = new String[]{'Message','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
		private String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/ExecutionContext','false','false'};
		private String[] field_order_type_info = new String[]{'HostName','Component','DateTime_x','Message'};
	}
	public class ExecutionStatusMessage {
		public String ExecutionStatusSeverity {get;set;}
		public String ExecutionStatusSource {get;set;}
		public String ExecutionStatusSourceOperation {get;set;}
		public String ExecutionStatusCode {get;set;}
		public String ExecutionStatusDescription {get;set;}
		public String ExecutionStatusText {get;set;}
		public String ExecutionStatusTarget {get;set;}
		public WS_ESB_ExecutionContext.ExecutionStatusMessage[] ExecutionStatusMessage {get;set;}
		private String[] ExecutionStatusSeverity_type_info = new String[]{'ExecutionStatusSeverity','http://ibus.czncorp.com/ESB/ExecutionContext','ExecutionStatusSeverityEnum','1','1','false'};
		private String[] ExecutionStatusSource_type_info = new String[]{'ExecutionStatusSource','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
		private String[] ExecutionStatusSourceOperation_type_info = new String[]{'ExecutionStatusSourceOperation','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
		private String[] ExecutionStatusCode_type_info = new String[]{'ExecutionStatusCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
		private String[] ExecutionStatusDescription_type_info = new String[]{'ExecutionStatusDescription','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
		private String[] ExecutionStatusText_type_info = new String[]{'ExecutionStatusText','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
		private String[] ExecutionStatusTarget_type_info = new String[]{'ExecutionStatusTarget','http://ibus.czncorp.com/ESB/ExecutionContext','ExecutionStatusTargetEnum','0','1','false'};
		private String[] ExecutionStatusMessage_type_info = new String[]{'ExecutionStatusMessage','http://ibus.czncorp.com/ESB/ExecutionContext','ExecutionStatusMessage','0','-1','false'};
		private String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/ExecutionContext','false','false'};
		private String[] field_order_type_info = new String[]{'ExecutionStatusSeverity','ExecutionStatusSource','ExecutionStatusSourceOperation','ExecutionStatusCode','ExecutionStatusDescription','ExecutionStatusText','ExecutionStatusTarget','ExecutionStatusMessage'};
	}
	public class TraceSettings {
		public Boolean TraceEnabled;
		public String Component;
		public String TraceLevel;
		private String[] TraceEnabled_type_info = new String[]{'TraceEnabled','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
		private String[] Component_type_info = new String[]{'Component','http://ibus.czncorp.com/ESB/ExecutionContext','ComponentEnum','0','1','false'};
		private String[] TraceLevel_type_info = new String[]{'TraceLevel','http://ibus.czncorp.com/ESB/ExecutionContext','TraceLevelEnum','0','1','false'};
		private String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/ExecutionContext','false','false'};
		private String[] field_order_type_info = new String[]{'TraceEnabled','Component','TraceLevel'};
	}
}