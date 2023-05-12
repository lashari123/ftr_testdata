public class WS_BPM_BusinessObjects {
	
	public class msg_LookupRequest {
		public WS_BPM_BusinessObjects.Header Header;
		public WS_BPM_BusinessObjects.LookupRequest Payload;
		transient String[] Header_type_info = new String[]{'Header','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/messageview','Header','0','1','false'};
		transient String[] Payload_type_info = new String[]{'Payload','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/messageview','LookupRequest','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/messageview','true','false'};
		transient String[] field_order_type_info = new String[]{'Header','Payload'};
		
		public msg_LookupRequest(String Type, String TelephoneNumber, String DataRegion) {
			Header = new WS_BPM_BusinessObjects.Header();
			Payload = new WS_BPM_BusinessObjects.LookupRequest(Type, TelephoneNumber, DataRegion);
		}
	}
	
	 public class msg_Service {
		public WS_BPM_BusinessObjects.Header Header;
		public WS_BPM_BusinessObjects.Service[] Payload;
		transient String[] Header_type_info = new String[]{'Header','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/messageview','Header','0','1','false'};
		transient String[] Payload_type_info = new String[]{'Payload','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/messageview','Service','0','-1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/messageview','false','false'};
		transient String[] field_order_type_info = new String[]{'Header','Payload'};
	}
	
	public class Header {
		public String CorrelationId_T;
		public String ActivityName_T;
		public String MsgType_T;
		public String Priority_T;
		public String Source;
		public String ActivityStatusEnum_T;
		public String MessageId;
		public WS_BPM_BusinessObjects.CharacteristicSpecification[] MessageProp_T;
		public WS_BPM_BusinessObjects.CharacteristicSpecification[] Security_T;
		public DateTime Timestamp;
		public String FailureReplytoURI_T;
		public WS_BPM_BusinessObjects.CharacteristicSpecification[] ConsumerInfo;
		public WS_BPM_BusinessObjects.CharacteristicSpecification[] ProviderInfo;
		public WS_BPM_BusinessObjects.HeaderExtension HeaderExtension;
		transient String[] CorrelationId_T_type_info = new String[]{'CorrelationId_T','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','string','0','1','false'};
		transient String[] ActivityName_T_type_info = new String[]{'ActivityName_T','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','string','0','1','false'};
		transient String[] MsgType_T_type_info = new String[]{'MsgType_T','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','string','0','1','false'};
		transient String[] Priority_T_type_info = new String[]{'Priority_T','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','string','0','1','false'};
		transient String[] Source_type_info = new String[]{'Source','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','string','0','1','false'};
		transient String[] ActivityStatusEnum_T_type_info = new String[]{'ActivityStatusEnum_T','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','string','0','1','false'};
		transient String[] MessageId_type_info = new String[]{'MessageId','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','string','0','1','false'};
		transient String[] MessageProp_T_type_info = new String[]{'MessageProp_T','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','CharacteristicSpecification','0','-1','false'};
		transient String[] Security_T_type_info = new String[]{'Security_T','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','CharacteristicSpecification','0','-1','false'};
		transient String[] Timestamp_type_info = new String[]{'Timestamp','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','dateTime','0','1','false'};
		transient String[] FailureReplytoURI_T_type_info = new String[]{'FailureReplytoURI_T','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','string','0','1','false'};
		transient String[] ConsumerInfo_type_info = new String[]{'ConsumerInfo','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','CharacteristicSpecification','0','-1','false'};
		transient String[] ProviderInfo_type_info = new String[]{'ProviderInfo','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','CharacteristicSpecification','0','-1','false'};
		transient String[] HeaderExtension_type_info = new String[]{'HeaderExtension','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','HeaderExtension','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','true','false'};
		transient String[] field_order_type_info = new String[]{'CorrelationId_T','ActivityName_T','MsgType_T','Priority_T','Source','ActivityStatusEnum_T','MessageId','MessageProp_T','Security_T','Timestamp','FailureReplytoURI_T','ConsumerInfo','ProviderInfo','HeaderExtension'};
	
		public Header () {
			Source = 'ESB';
			MessageProp_T = new List<WS_BPM_BusinessObjects.CharacteristicSpecification>();
			Security_T = new List<WS_BPM_BusinessObjects.CharacteristicSpecification>();
			WS_BPM_BusinessObjects.CharacteristicSpecification EmployeeID = new WS_BPM_BusinessObjects.CharacteristicSpecification();
			EmployeeID.name = 'employeeID';
			EmployeeID.Value.Value = '11111';
			Security_T.add(EmployeeID);
			WS_BPM_BusinessObjects.CharacteristicSpecification UserID = new WS_BPM_BusinessObjects.CharacteristicSpecification();
			UserID.name = 'userID';
			UserID.Value.Value = 'ESB_REG';
			Security_T.add(UserID);
		}
	}
	
	public class LookupRequest {
		public WS_BPM_BusinessObjects.SearchCriteria SearchCriteria;
		public WS_BPM_BusinessObjects.FilterCriteria FilterCriteria;
		transient String[] SearchCriteria_type_info = new String[]{'SearchCriteria','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','SearchCriteria','0','1','false'};
		transient String[] FilterCriteria_type_info = new String[]{'FilterCriteria','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','FilterCriteria','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','true','false'};
		transient String[] field_order_type_info = new String[]{'SearchCriteria','FilterCriteria'};
		
		public LookupRequest(String Type, String TelephoneNumber, String DataRegion) {
			Type = 'retrieveHuntGroup';
			if(Type == 'retrieveHuntGroup') {
				SearchCriteria = new WS_BPM_BusinessObjects.SearchCriteria(Type, TelephoneNumber, DataRegion);
				FilterCriteria = new WS_BPM_BusinessObjects.FilterCriteria(Type, TelephoneNumber, DataRegion);
			}
		}
	}
	
	public class SearchCriteria {
		public WS_BPM_BusinessObjects.Entity[] Entities;
		transient String[] Entities_type_info = new String[]{'Entities','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','Entity','0','-1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','true','false'};
		transient String[] field_order_type_info = new String[]{'Entities'};
		
		public SearchCriteria (String Type, String TelephoneNumber, String DataRegion) {
			Entities = new List<WS_BPM_BusinessObjects.Entity>();
			WS_BPM_BusinessObjects.Entity EntityFirst = new WS_BPM_BusinessObjects.Entity();
			WS_BPM_BusinessObjects.CharacteristicSpecification phoneNumber = new WS_BPM_BusinessObjects.CharacteristicSpecification();
			phoneNumber.name = 'telephoneNumber';
			phoneNumber.Value.Value = TelephoneNumber;
			EntityFirst.Characteristics.add(phoneNumber);
			WS_BPM_BusinessObjects.CharacteristicSpecification environment = new WS_BPM_BusinessObjects.CharacteristicSpecification();
			environment.name = 'environment';
			environment.valueType = 'string';
			environment.Value.Value = DataRegion;
			EntityFirst.Characteristics.add(environment);
			Entities.add(EntityFirst);
		}
	} 
	
	public class FilterCriteria {
		public WS_BPM_BusinessObjects.Entity[] Entities;
		transient String[] Entities_type_info = new String[]{'Entities','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','Entity','0','-1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','true','false'};
		transient String[] field_order_type_info = new String[]{'Entities'};
		
		public FilterCriteria(String Type, String TelephoneNumber, String DataRegion) {
			Entities = new List<WS_BPM_BusinessObjects.Entity>();
			WS_BPM_BusinessObjects.Entity Entityloop = new WS_BPM_BusinessObjects.Entity();
			Entityloop.name = 'IncludeItems';
			WS_BPM_BusinessObjects.CharacteristicSpecification huntGroupsOwnedByBTN = new WS_BPM_BusinessObjects.CharacteristicSpecification();
			huntGroupsOwnedByBTN.name = 'huntGroupsOwnedByBTN';
			Entityloop.Characteristics.add(huntGroupsOwnedByBTN);
			Entities.add(Entityloop);
		}
	}
	
	public class Entity {
		public String ID;
		public String name;
		public String type_x;
		public WS_BPM_BusinessObjects.CharacteristicSpecification[] Characteristics;
		public WS_BPM_BusinessObjects.Entity[] NestedEntity;
		transient String[] ID_type_info = new String[]{'ID','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','string','0','1','true'};
		transient String[] name_type_info = new String[]{'name','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','string','0','1','true'};
		transient String[] type_x_type_info = new String[]{'type','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','string','0','1','false'};
		transient String[] Characteristics_type_info = new String[]{'Characteristics','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','CharacteristicSpecification','0','-1','true'};
		transient String[] NestedEntity_type_info = new String[]{'NestedEntity','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','Entity','0','-1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','true','false'};
		transient String[] field_order_type_info = new String[]{'ID','name','type_x','Characteristics','NestedEntity'};
		
		public Entity() {
			Characteristics = new List<WS_BPM_BusinessObjects.CharacteristicSpecification>();
			
		}
	}
	
	public class CharacteristicSpecification {
		public String name;
		public String valueType;
		public String description;
		public WS_BPM_BusinessObjects.CharacteristicValue Value;
		transient String[] name_type_info = new String[]{'name','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','string','0','1','true'};
		transient String[] valueType_type_info = new String[]{'valueType','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','string','0','1','true'};
		transient String[] description_type_info = new String[]{'description','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','string','0','1','true'};
		transient String[] Value_type_info = new String[]{'Value','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','CharacteristicValue','0','1','true'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','true','false'};
		transient String[] field_order_type_info = new String[]{'name','valueType','description','Value'};
		
		public CharacteristicSpecification() {
			Value = new WS_BPM_BusinessObjects.CharacteristicValue();
		}
	}
	public class CharacteristicValue {
		public String value;
		transient String[] value_type_info = new String[]{'value','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','string','0','1','true'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','true','false'};
		transient String[] field_order_type_info = new String[]{'value'};
	}
	
	public class ExecutionStatusMessage {
		public String ExecutionStatusSeverity;
		public String ExecutionStatusSource;
		public String ExecutionStatusSourceOperation;
		public String ExecutionStatusCode;
		public String ExecutionStatusDescription;
		public String ExecutionStatusText;
		public WS_BPM_BusinessObjects.ExecutionStatusMessage[] ExecutionStatusMessage;
		transient String[] ExecutionStatusSeverity_type_info = new String[]{'ExecutionStatusSeverity','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common/extensions','ExecutionStatusSeverityEnum','1','1','false'};
		transient String[] ExecutionStatusSource_type_info = new String[]{'ExecutionStatusSource','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common/extensions','string','0','1','false'};
		transient String[] ExecutionStatusSourceOperation_type_info = new String[]{'ExecutionStatusSourceOperation','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common/extensions','string','0','1','false'};
		transient String[] ExecutionStatusCode_type_info = new String[]{'ExecutionStatusCode','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common/extensions','string','0','1','false'};
		transient String[] ExecutionStatusDescription_type_info = new String[]{'ExecutionStatusDescription','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common/extensions','string','0','1','false'};
		transient String[] ExecutionStatusText_type_info = new String[]{'ExecutionStatusText','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common/extensions','string','0','1','false'};
		transient String[] ExecutionStatusMessage_type_info = new String[]{'ExecutionStatusMessage','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common/extensions','ExecutionStatusMessage','0','-1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common/extensions','false','false'};
		transient String[] field_order_type_info = new String[]{'ExecutionStatusSeverity','ExecutionStatusSource','ExecutionStatusSourceOperation','ExecutionStatusCode','ExecutionStatusDescription','ExecutionStatusText','ExecutionStatusMessage'};
	}
	
	public class HeaderExtension {
		public WS_BPM_BusinessObjects.ExecutionStatusMessage ExecutionStatusMessage;
		transient String[] ExecutionStatusMessage_type_info = new String[]{'ExecutionStatusMessage','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common/extensions','ExecutionStatusMessage','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common/extensions','false','false'};
		transient String[] field_order_type_info = new String[]{'ExecutionStatusMessage'};
	}
	
	public class Service {
		public WS_BPM_BusinessObjects.IBMTelecomRootObject ServiceIdentification;
		public WS_BPM_BusinessObjects.CharacteristicSpecification[] ServiceDescribedBy;
		public Boolean hasStarted;
		public WS_BPM_BusinessObjects.Place ServiceLocation;
		public WS_BPM_BusinessObjects.ResourceFacingService[] ResourceFacingServices;
		public WS_BPM_BusinessObjects.ServiceExtension ServiceExtension;
		transient String[] ServiceIdentification_type_info = new String[]{'ServiceIdentification','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','IBMTelecomRootObject','0','1','false'};
		transient String[] ServiceDescribedBy_type_info = new String[]{'ServiceDescribedBy','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','CharacteristicSpecification','0','-1','false'};
		transient String[] hasStarted_type_info = new String[]{'hasStarted','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','boolean','0','1','false'};
		transient String[] ServiceLocation_type_info = new String[]{'ServiceLocation','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','Place','0','1','false'};
		transient String[] ResourceFacingServices_type_info = new String[]{'ResourceFacingServices','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','ResourceFacingService','0','-1','false'};
		transient String[] ServiceExtension_type_info = new String[]{'ServiceExtension','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','ServiceExtension','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','true','false'};
		transient String[] field_order_type_info = new String[]{'ServiceIdentification','ServiceDescribedBy','hasStarted','ServiceLocation','ResourceFacingServices','ServiceExtension'};
	}
	public class Activity {
		public WS_BPM_BusinessObjects.IBMTelecomRootObject ID;
		public String description;
		public DateTime dateCreated;
		public String subject;
		public String stateCode;
		public String subStateCode;
		public String createdBy;
		public Date activityDate;
		public WS_BPM_BusinessObjects.Entity AssociatedEntity;
		transient String[] ID_type_info = new String[]{'ID','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','IBMTelecomRootObject','0','1','false'};
		transient String[] description_type_info = new String[]{'description','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','string','0','1','false'};
		transient String[] dateCreated_type_info = new String[]{'dateCreated','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','dateTime','0','1','false'};
		transient String[] subject_type_info = new String[]{'subject','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','string','0','1','false'};
		transient String[] stateCode_type_info = new String[]{'stateCode','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','string','0','1','false'};
		transient String[] subStateCode_type_info = new String[]{'subStateCode','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','string','0','1','false'};
		transient String[] createdBy_type_info = new String[]{'createdBy','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','string','0','1','false'};
		transient String[] activityDate_type_info = new String[]{'activityDate','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','date','0','1','false'};
		transient String[] AssociatedEntity_type_info = new String[]{'AssociatedEntity','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','Entity','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','true','false'};
		transient String[] field_order_type_info = new String[]{'ID','description','dateCreated','subject','stateCode','subStateCode','createdBy','activityDate','AssociatedEntity'};
	}
	
	public class CodeDescription {
		public String code;
		public String description;
		transient String[] code_type_info = new String[]{'code','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','string','0','1','false'};
		transient String[] description_type_info = new String[]{'description','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','string','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','true','false'};
		transient String[] field_order_type_info = new String[]{'code','description'};
	}
	public class ContactMedium {
		public WS_BPM_BusinessObjects.GeographicAddress GeographicAddress;
		public WS_BPM_BusinessObjects.GeographicAddress PostalAddress;
		public String eMailAddress;
		public String[] telephoneNumber;
		public WS_BPM_BusinessObjects.CharacteristicSpecification[] CharacteristicSpecification;
		public WS_BPM_BusinessObjects.ContactMediumExtension ContactMediumExtension;
		transient String[] GeographicAddress_type_info = new String[]{'GeographicAddress','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','GeographicAddress','0','1','true'};
		transient String[] PostalAddress_type_info = new String[]{'PostalAddress','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','GeographicAddress','0','1','true'};
		transient String[] eMailAddress_type_info = new String[]{'eMailAddress','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','string','0','1','true'};
		transient String[] telephoneNumber_type_info = new String[]{'telephoneNumber','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','string','0','-1','true'};
		transient String[] CharacteristicSpecification_type_info = new String[]{'CharacteristicSpecification','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','CharacteristicSpecification','0','-1','false'};
		transient String[] ContactMediumExtension_type_info = new String[]{'ContactMediumExtension','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','ContactMediumExtension','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','true','false'};
		transient String[] field_order_type_info = new String[]{'GeographicAddress','PostalAddress','eMailAddress','telephoneNumber','CharacteristicSpecification','ContactMediumExtension'};
	}
	public class ContactProfile {
		public Boolean doNotEmailFlag;
		public Boolean doNotMailFlag;
		public Boolean doNotPhoneFlag;
		public WS_BPM_BusinessObjects.TelephoneContact[] TelephoneContacts;
		public WS_BPM_BusinessObjects.EmailContact[] EmailContacts;
		public Date outboundDialingRulesExplainedOn;
		transient String[] doNotEmailFlag_type_info = new String[]{'doNotEmailFlag','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','boolean','0','1','false'};
		transient String[] doNotMailFlag_type_info = new String[]{'doNotMailFlag','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','boolean','0','1','false'};
		transient String[] doNotPhoneFlag_type_info = new String[]{'doNotPhoneFlag','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','boolean','0','1','false'};
		transient String[] TelephoneContacts_type_info = new String[]{'TelephoneContacts','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','TelephoneContact','0','-1','false'};
		transient String[] EmailContacts_type_info = new String[]{'EmailContacts','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','EmailContact','0','-1','false'};
		transient String[] outboundDialingRulesExplainedOn_type_info = new String[]{'outboundDialingRulesExplainedOn','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','date','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','true','false'};
		transient String[] field_order_type_info = new String[]{'doNotEmailFlag','doNotMailFlag','doNotPhoneFlag','TelephoneContacts','EmailContacts','outboundDialingRulesExplainedOn'};
	}
	public class EmailContact {
		public String id;
		public String name;
		public String address;
		public Boolean accountInfoFlag;
		public Boolean frontierMarketingFlag;
		public Boolean thirdPartyMarketingFlag;
		public DateTime modifiedOn;
		public Boolean isValid;
		public Boolean isDeleted;
		public Boolean isOurEmail;
		public String providedEmailAddressFlag;
		public String receiveAccountInfoFlag;
		public String receiveOffersFlag;
		public String receiveThirdPartyOffersFlag;
		public String lastUpdateSource;
		public WS_BPM_BusinessObjects.CharacteristicSpecification[] Characteristics;
		transient String[] id_type_info = new String[]{'id','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','string','0','1','false'};
		transient String[] name_type_info = new String[]{'name','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','string','0','1','false'};
		transient String[] address_type_info = new String[]{'address','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','string','0','1','false'};
		transient String[] accountInfoFlag_type_info = new String[]{'accountInfoFlag','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','boolean','0','1','false'};
		transient String[] frontierMarketingFlag_type_info = new String[]{'frontierMarketingFlag','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','boolean','0','1','false'};
		transient String[] thirdPartyMarketingFlag_type_info = new String[]{'thirdPartyMarketingFlag','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','boolean','0','1','false'};
		transient String[] modifiedOn_type_info = new String[]{'modifiedOn','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','dateTime','0','1','false'};
		transient String[] isValid_type_info = new String[]{'isValid','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','boolean','0','1','false'};
		transient String[] isDeleted_type_info = new String[]{'isDeleted','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','boolean','0','1','false'};
		transient String[] isOurEmail_type_info = new String[]{'isOurEmail','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','boolean','0','1','false'};
		transient String[] providedEmailAddressFlag_type_info = new String[]{'providedEmailAddressFlag','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','string','0','1','false'};
		transient String[] receiveAccountInfoFlag_type_info = new String[]{'receiveAccountInfoFlag','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','string','0','1','false'};
		transient String[] receiveOffersFlag_type_info = new String[]{'receiveOffersFlag','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','string','0','1','false'};
		transient String[] receiveThirdPartyOffersFlag_type_info = new String[]{'receiveThirdPartyOffersFlag','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','string','0','1','false'};
		transient String[] lastUpdateSource_type_info = new String[]{'lastUpdateSource','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','string','0','1','false'};
		transient String[] Characteristics_type_info = new String[]{'Characteristics','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','CharacteristicSpecification','0','-1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','true','false'};
		transient String[] field_order_type_info = new String[]{'id','name','address','accountInfoFlag','frontierMarketingFlag','thirdPartyMarketingFlag','modifiedOn','isValid','isDeleted','isOurEmail','providedEmailAddressFlag','receiveAccountInfoFlag','receiveOffersFlag','receiveThirdPartyOffersFlag','lastUpdateSource','Characteristics'};
	}
	
	public class Exception_x {
		public String Code;
		public String Name;
		public String Category;
		public String Reason;
		public String ResultingState;
		public String OriginalRequest;
		public String ErrorOrigin;
		public String ApplicationException;
		public DateTime Timestamp;
		public String Tags;
		public WS_BPM_BusinessObjects.CharacteristicSpecification[] AdditionalInformation;
		transient String[] Code_type_info = new String[]{'Code','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','string','0','1','false'};
		transient String[] Name_type_info = new String[]{'Name','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','string','0','1','false'};
		transient String[] Category_type_info = new String[]{'Category','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','string','0','1','false'};
		transient String[] Reason_type_info = new String[]{'Reason','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','string','0','1','false'};
		transient String[] ResultingState_type_info = new String[]{'ResultingState','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','string','0','1','false'};
		transient String[] OriginalRequest_type_info = new String[]{'OriginalRequest','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','string','0','1','false'};
		transient String[] ErrorOrigin_type_info = new String[]{'ErrorOrigin','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','string','0','1','false'};
		transient String[] ApplicationException_type_info = new String[]{'ApplicationException','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','string','0','1','false'};
		transient String[] Timestamp_type_info = new String[]{'Timestamp','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','dateTime','0','1','false'};
		transient String[] Tags_type_info = new String[]{'Tags','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','string','0','1','false'};
		transient String[] AdditionalInformation_type_info = new String[]{'AdditionalInformation','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','CharacteristicSpecification','0','-1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','true','false'};
		transient String[] field_order_type_info = new String[]{'Code','Name','Category','Reason','ResultingState','OriginalRequest','ErrorOrigin','ApplicationException','Timestamp','Tags','AdditionalInformation'};
	}
	
	public class GeographicAddress {
		public WS_BPM_BusinessObjects.UrbanPropertyAddress UrbanPropertyAddress;
		public String stateOrProvince;
		public String country;
		public WS_BPM_BusinessObjects.CharacteristicSpecification[] CharacteristicSpecification;
		public WS_BPM_BusinessObjects.GeographicAddressExtension GeographicAddressExtension;
		transient String[] UrbanPropertyAddress_type_info = new String[]{'UrbanPropertyAddress','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','UrbanPropertyAddress','0','1','true'};
		transient String[] stateOrProvince_type_info = new String[]{'stateOrProvince','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','string','0','1','true'};
		transient String[] country_type_info = new String[]{'country','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','string','0','1','true'};
		transient String[] CharacteristicSpecification_type_info = new String[]{'CharacteristicSpecification','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','CharacteristicSpecification','0','-1','false'};
		transient String[] GeographicAddressExtension_type_info = new String[]{'GeographicAddressExtension','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','GeographicAddressExtension','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','true','false'};
		transient String[] field_order_type_info = new String[]{'UrbanPropertyAddress','stateOrProvince','country','CharacteristicSpecification','GeographicAddressExtension'};
	}
	
	public class IBMTelecomRootObject {
		public String ID;
		public String name;
		public String type_x;
		public String description;
		transient String[] ID_type_info = new String[]{'ID','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','string','0','1','true'};
		transient String[] name_type_info = new String[]{'name','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','string','0','1','true'};
		transient String[] type_x_type_info = new String[]{'type','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','string','0','1','false'};
		transient String[] description_type_info = new String[]{'description','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','string','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','false','false'};
		transient String[] field_order_type_info = new String[]{'ID','name','type_x','description'};
	}
	public class Individual {
		public WS_BPM_BusinessObjects.IndividualName IndividualName;
		public String gender;
		public String placeOfBirth;
		public String nationality;
		public String maritalStatus;
		public Boolean hasDisabilities;
		public String countryOfBirth;
		public String driversLicenseNumber;
		public String socialSecurtyNumber;
		public String taxIdentificationNumber;
		public String nationalIdentityCardNumber;
		public String employeeIdentityNumber;
		public String passportNumber;
		public String passportIssuingCountry;
		public WS_BPM_BusinessObjects.TimePeriod AliveDuring;
		public WS_BPM_BusinessObjects.IndividualExtension IndividualExtension;
		public WS_BPM_BusinessObjects.ContactMedium ContactMedium;
		transient String[] IndividualName_type_info = new String[]{'IndividualName','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','IndividualName','0','1','true'};
		transient String[] gender_type_info = new String[]{'gender','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','string','0','1','true'};
		transient String[] placeOfBirth_type_info = new String[]{'placeOfBirth','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','string','0','1','true'};
		transient String[] nationality_type_info = new String[]{'nationality','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','string','0','1','true'};
		transient String[] maritalStatus_type_info = new String[]{'maritalStatus','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','string','0','1','true'};
		transient String[] hasDisabilities_type_info = new String[]{'hasDisabilities','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','boolean','0','1','true'};
		transient String[] countryOfBirth_type_info = new String[]{'countryOfBirth','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','string','0','1','true'};
		transient String[] driversLicenseNumber_type_info = new String[]{'driversLicenseNumber','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','string','0','1','true'};
		transient String[] socialSecurtyNumber_type_info = new String[]{'socialSecurtyNumber','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','string','0','1','true'};
		transient String[] taxIdentificationNumber_type_info = new String[]{'taxIdentificationNumber','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','string','0','1','true'};
		transient String[] nationalIdentityCardNumber_type_info = new String[]{'nationalIdentityCardNumber','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','string','0','1','true'};
		transient String[] employeeIdentityNumber_type_info = new String[]{'employeeIdentityNumber','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','string','0','1','true'};
		transient String[] passportNumber_type_info = new String[]{'passportNumber','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','string','0','1','true'};
		transient String[] passportIssuingCountry_type_info = new String[]{'passportIssuingCountry','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','string','0','1','true'};
		transient String[] AliveDuring_type_info = new String[]{'AliveDuring','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','TimePeriod','0','1','false'};
		transient String[] IndividualExtension_type_info = new String[]{'IndividualExtension','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','IndividualExtension','0','1','false'};
		transient String[] ContactMedium_type_info = new String[]{'ContactMedium','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','ContactMedium','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','true','false'};
		transient String[] field_order_type_info = new String[]{'IndividualName','gender','placeOfBirth','nationality','maritalStatus','hasDisabilities','countryOfBirth','driversLicenseNumber','socialSecurtyNumber','taxIdentificationNumber','nationalIdentityCardNumber','employeeIdentityNumber','passportNumber','passportIssuingCountry','AliveDuring','IndividualExtension','ContactMedium'};
	}
	public class IndividualName {
		public String familyName;
		public String givenName;
		public String middleNames;
		public String formOfAddress;
		public String familyGeneration;
		public String qualifications;
		public WS_BPM_BusinessObjects.CharacteristicSpecification[] CharacteristicSpecification;
		transient String[] familyName_type_info = new String[]{'familyName','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','string','0','1','true'};
		transient String[] givenName_type_info = new String[]{'givenName','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','string','0','1','true'};
		transient String[] middleNames_type_info = new String[]{'middleNames','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','string','0','1','true'};
		transient String[] formOfAddress_type_info = new String[]{'formOfAddress','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','string','0','1','true'};
		transient String[] familyGeneration_type_info = new String[]{'familyGeneration','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','string','0','1','true'};
		transient String[] qualifications_type_info = new String[]{'qualifications','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','string','0','1','true'};
		transient String[] CharacteristicSpecification_type_info = new String[]{'CharacteristicSpecification','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','CharacteristicSpecification','0','-1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','true','false'};
		transient String[] field_order_type_info = new String[]{'familyName','givenName','middleNames','formOfAddress','familyGeneration','qualifications','CharacteristicSpecification'};
	}
	
	public class Money {
		public Double amount;
		public String unitsOrCurrency;
		transient String[] amount_type_info = new String[]{'amount','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','double','0','1','true'};
		transient String[] unitsOrCurrency_type_info = new String[]{'unitsOrCurrency','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','string','0','1','true'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','true','false'};
		transient String[] field_order_type_info = new String[]{'amount','unitsOrCurrency'};
	}
	public class Note {
		public String ID;
		public String text;
		public String createdBy;
		public DateTime creationDate;
		public Boolean isInternalOnly;
		public Boolean isHighPriority;
		transient String[] ID_type_info = new String[]{'ID','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','string','0','1','false'};
		transient String[] text_type_info = new String[]{'text','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','string','0','1','false'};
		transient String[] createdBy_type_info = new String[]{'createdBy','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','string','0','1','false'};
		transient String[] creationDate_type_info = new String[]{'creationDate','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','dateTime','0','1','false'};
		transient String[] isInternalOnly_type_info = new String[]{'isInternalOnly','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','boolean','0','1','false'};
		transient String[] isHighPriority_type_info = new String[]{'isHighPriority','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','boolean','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','true','false'};
		transient String[] field_order_type_info = new String[]{'ID','text','createdBy','creationDate','isInternalOnly','isHighPriority'};
	}
	public class Organization {
		public WS_BPM_BusinessObjects.OrganizationName OrganizationName;
		public Boolean isLegalEntity;
		public String organizationIdentificationNumber;
		transient String[] OrganizationName_type_info = new String[]{'OrganizationName','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','OrganizationName','0','1','true'};
		transient String[] isLegalEntity_type_info = new String[]{'isLegalEntity','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','boolean','0','1','true'};
		transient String[] organizationIdentificationNumber_type_info = new String[]{'organizationIdentificationNumber','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','string','0','1','true'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','true','false'};
		transient String[] field_order_type_info = new String[]{'OrganizationName','isLegalEntity','organizationIdentificationNumber'};
	}
	public class OrganizationName {
		public String tradingName;
		public String nameType;
		transient String[] tradingName_type_info = new String[]{'tradingName','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','string','0','1','true'};
		transient String[] nameType_type_info = new String[]{'nameType','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','string','0','1','true'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','true','false'};
		transient String[] field_order_type_info = new String[]{'tradingName','nameType'};
	}
	public class Party {
		public String partyID;
		public String languageAbility;
		public WS_BPM_BusinessObjects.Individual Individual;
		public WS_BPM_BusinessObjects.Organization Organization;
		public WS_BPM_BusinessObjects.Entity AdditionalInformation;
		public WS_BPM_BusinessObjects.PartyExtension PartyExtension;
		public WS_BPM_BusinessObjects.GeographicAddress[] PostalAddress;
		public WS_BPM_BusinessObjects.CharacteristicSpecification[] Characteristics;
		transient String[] partyID_type_info = new String[]{'partyID','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','string','0','1','true'};
		transient String[] languageAbility_type_info = new String[]{'languageAbility','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','string','0','1','true'};
		transient String[] Individual_type_info = new String[]{'Individual','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','Individual','0','1','true'};
		transient String[] Organization_type_info = new String[]{'Organization','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','Organization','0','1','true'};
		transient String[] AdditionalInformation_type_info = new String[]{'AdditionalInformation','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','Entity','0','1','true'};
		transient String[] PartyExtension_type_info = new String[]{'PartyExtension','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','PartyExtension','0','1','false'};
		transient String[] PostalAddress_type_info = new String[]{'PostalAddress','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','GeographicAddress','0','-1','false'};
		transient String[] Characteristics_type_info = new String[]{'Characteristics','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','CharacteristicSpecification','0','-1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','true','false'};
		transient String[] field_order_type_info = new String[]{'partyID','languageAbility','Individual','Organization','AdditionalInformation','PartyExtension','PostalAddress','Characteristics'};
	}
	public class PartyInteractionRole {
		public WS_BPM_BusinessObjects.IBMTelecomRootObject ID;
		public WS_BPM_BusinessObjects.CharacteristicSpecification[] Characteristics;
		transient String[] ID_type_info = new String[]{'ID','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','IBMTelecomRootObject','0','1','false'};
		transient String[] Characteristics_type_info = new String[]{'Characteristics','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','CharacteristicSpecification','0','-1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','true','false'};
		transient String[] field_order_type_info = new String[]{'ID','Characteristics'};
	}
	public class PartyRole {
		public String roleType;
		public WS_BPM_BusinessObjects.ContactMedium ContactMedium;
		public String status;
		public String description;
		public WS_BPM_BusinessObjects.Party Party;
		public WS_BPM_BusinessObjects.PartyRoleAssociation[] PartyRoleAssociation;
		public WS_BPM_BusinessObjects.CharacteristicSpecification[] CharacteristicSpecification;
		public WS_BPM_BusinessObjects.PartyRoleExtension PartyRoleExtension;
		public WS_BPM_BusinessObjects.ContactProfile ContactProfile;
		public WS_BPM_BusinessObjects.Activity[] Activities;
		public WS_BPM_BusinessObjects.Note[] Notes;
		public WS_BPM_BusinessObjects.PartyInteractionRole[] PartyInteractionRoles;
		transient String[] roleType_type_info = new String[]{'roleType','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','string','0','1','true'};
		transient String[] ContactMedium_type_info = new String[]{'ContactMedium','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','ContactMedium','0','1','true'};
		transient String[] status_type_info = new String[]{'status','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','string','0','1','true'};
		transient String[] description_type_info = new String[]{'description','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','string','0','1','true'};
		transient String[] Party_type_info = new String[]{'Party','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','Party','0','1','false'};
		transient String[] PartyRoleAssociation_type_info = new String[]{'PartyRoleAssociation','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','PartyRoleAssociation','0','-1','false'};
		transient String[] CharacteristicSpecification_type_info = new String[]{'CharacteristicSpecification','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','CharacteristicSpecification','0','-1','false'};
		transient String[] PartyRoleExtension_type_info = new String[]{'PartyRoleExtension','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','PartyRoleExtension','0','1','false'};
		transient String[] ContactProfile_type_info = new String[]{'ContactProfile','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','ContactProfile','0','1','false'};
		transient String[] Activities_type_info = new String[]{'Activities','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','Activity','0','-1','false'};
		transient String[] Notes_type_info = new String[]{'Notes','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','Note','0','-1','false'};
		transient String[] PartyInteractionRoles_type_info = new String[]{'PartyInteractionRoles','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','PartyInteractionRole','0','-1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','true','false'};
		transient String[] field_order_type_info = new String[]{'roleType','ContactMedium','status','description','Party','PartyRoleAssociation','CharacteristicSpecification','PartyRoleExtension','ContactProfile','Activities','Notes','PartyInteractionRoles'};
	}
	public class PartyRoleAssociation {
		public String associationType;
		public WS_BPM_BusinessObjects.TimePeriod ValidFor;
		public String status;
		public WS_BPM_BusinessObjects.PartyRole[] PartyRole;
		public WS_BPM_BusinessObjects.CharacteristicSpecification[] CharacteristicSpecification;
		transient String[] associationType_type_info = new String[]{'associationType','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','string','0','1','false'};
		transient String[] ValidFor_type_info = new String[]{'ValidFor','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','TimePeriod','0','1','false'};
		transient String[] status_type_info = new String[]{'status','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','string','0','1','false'};
		transient String[] PartyRole_type_info = new String[]{'PartyRole','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','PartyRole','0','-1','false'};
		transient String[] CharacteristicSpecification_type_info = new String[]{'CharacteristicSpecification','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','CharacteristicSpecification','0','-1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','true','false'};
		transient String[] field_order_type_info = new String[]{'associationType','ValidFor','status','PartyRole','CharacteristicSpecification'};
	}
	public class Place {
		public String ID;
		public WS_BPM_BusinessObjects.GeographicAddress GeographicAddress;
		transient String[] ID_type_info = new String[]{'ID','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','string','0','1','true'};
		transient String[] GeographicAddress_type_info = new String[]{'GeographicAddress','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','GeographicAddress','0','1','true'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','true','false'};
		transient String[] field_order_type_info = new String[]{'ID','GeographicAddress'};
	}
	
	public class Specification {
		public String id;
		public String name;
		public String description;
		public String brand;
		public String lifecycleStatus;
		public WS_BPM_BusinessObjects.Entity[] SpecCharacteristic;
		transient String[] id_type_info = new String[]{'id','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','string','0','1','false'};
		transient String[] name_type_info = new String[]{'name','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','string','0','1','false'};
		transient String[] description_type_info = new String[]{'description','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','string','0','1','false'};
		transient String[] brand_type_info = new String[]{'brand','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','string','0','1','false'};
		transient String[] lifecycleStatus_type_info = new String[]{'lifecycleStatus','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','string','0','1','false'};
		transient String[] SpecCharacteristic_type_info = new String[]{'SpecCharacteristic','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','Entity','0','-1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','true','false'};
		transient String[] field_order_type_info = new String[]{'id','name','description','brand','lifecycleStatus','SpecCharacteristic'};
	}
	public class TelephoneContact {
		public String number_x;
		public String type_x;
		public String outboundDialing;
		transient String[] number_x_type_info = new String[]{'number','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','string','0','1','false'};
		transient String[] type_x_type_info = new String[]{'type','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','string','0','1','false'};
		transient String[] outboundDialing_type_info = new String[]{'outboundDialing','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','string','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','true','false'};
		transient String[] field_order_type_info = new String[]{'number_x','type_x','outboundDialing'};
	}
	public class TimePeriod {
		public DateTime startDate;
		public DateTime endDate;
		transient String[] startDate_type_info = new String[]{'startDate','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','dateTime','0','1','true'};
		transient String[] endDate_type_info = new String[]{'endDate','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','dateTime','0','1','true'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','true','false'};
		transient String[] field_order_type_info = new String[]{'startDate','endDate'};
	}
	public class UrbanPropertyAddress {
		public String streetNrFirst;
		public String streetNrFirstSuffix;
		public String streetNrLast;
		public String streetNrLastSuffix;
		public String streetName;
		public String streetType;
		public String streetSuffix;
		public String locality;
		public String postcode;
		public WS_BPM_BusinessObjects.UrbanPropertySubAddress UrbanPropertySubAddress;
		public WS_BPM_BusinessObjects.UrbanPropertyAddressExtension UrbanPropertyAddressExtension;
		transient String[] streetNrFirst_type_info = new String[]{'streetNrFirst','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','string','0','1','true'};
		transient String[] streetNrFirstSuffix_type_info = new String[]{'streetNrFirstSuffix','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','string','0','1','true'};
		transient String[] streetNrLast_type_info = new String[]{'streetNrLast','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','string','0','1','true'};
		transient String[] streetNrLastSuffix_type_info = new String[]{'streetNrLastSuffix','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','string','0','1','true'};
		transient String[] streetName_type_info = new String[]{'streetName','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','string','0','1','true'};
		transient String[] streetType_type_info = new String[]{'streetType','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','string','0','1','true'};
		transient String[] streetSuffix_type_info = new String[]{'streetSuffix','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','string','0','1','true'};
		transient String[] locality_type_info = new String[]{'locality','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','string','0','1','true'};
		transient String[] postcode_type_info = new String[]{'postcode','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','string','0','1','true'};
		transient String[] UrbanPropertySubAddress_type_info = new String[]{'UrbanPropertySubAddress','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','UrbanPropertySubAddress','0','1','true'};
		transient String[] UrbanPropertyAddressExtension_type_info = new String[]{'UrbanPropertyAddressExtension','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','UrbanPropertyAddressExtension','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','true','false'};
		transient String[] field_order_type_info = new String[]{'streetNrFirst','streetNrFirstSuffix','streetNrLast','streetNrLastSuffix','streetName','streetType','streetSuffix','locality','postcode','UrbanPropertySubAddress','UrbanPropertyAddressExtension'};
	}
	public class UrbanPropertySubAddress {
		public String subUnitType;
		public String subUnitNr;
		public String levelType;
		public String levelNr;
		public String buildingName;
		public WS_BPM_BusinessObjects.UrbanPropertySubAddressExtension UrbanPropertySubAddress;
		transient String[] subUnitType_type_info = new String[]{'subUnitType','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','string','0','1','true'};
		transient String[] subUnitNr_type_info = new String[]{'subUnitNr','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','string','0','1','true'};
		transient String[] levelType_type_info = new String[]{'levelType','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','string','0','1','true'};
		transient String[] levelNr_type_info = new String[]{'levelNr','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','string','0','1','true'};
		transient String[] buildingName_type_info = new String[]{'buildingName','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','string','0','1','true'};
		transient String[] UrbanPropertySubAddress_type_info = new String[]{'UrbanPropertySubAddress','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','UrbanPropertySubAddressExtension','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common','true','false'};
		transient String[] field_order_type_info = new String[]{'subUnitType','subUnitNr','levelType','levelNr','buildingName','UrbanPropertySubAddress'};
	}

	public class AgreementExtension {
		public String prospectAccountNumber;
		transient String[] prospectAccountNumber_type_info = new String[]{'prospectAccountNumber','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','string','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','true','false'};
		transient String[] field_order_type_info = new String[]{'prospectAccountNumber'};
	}
	public class AgreementItemExtension {
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','true','false'};
		transient String[] field_order_type_info = new String[]{};
	}
	public class AppointmentExtension {
		public String appointmentCode;
		public String scheduleCode;
		public WS_BPM_BusinessObjects.TimePeriod PlannedDuration;
		public WS_BPM_BusinessObjects.Quantity AvailableUnitsQuantity;
		public WS_BPM_BusinessObjects.CalendarEntry CalendarEntry;
		public WS_BPM_BusinessObjects.Work Work;
		public String workOrderNumber;
		public String resourcePoolId;
		public String timeSlotType;
		public Boolean customerNegotiatedFlag;
		public WS_BPM_BusinessObjects.PartyRole[] PartyRole;
		public String[] remark;
		public String resultCode;
		public WS_BPM_BusinessObjects.CodeDescription[] Messages;
		transient String[] appointmentCode_type_info = new String[]{'appointmentCode','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','string','0','1','false'};
		transient String[] scheduleCode_type_info = new String[]{'scheduleCode','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','string','0','1','false'};
		transient String[] PlannedDuration_type_info = new String[]{'PlannedDuration','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','TimePeriod','0','1','false'};
		transient String[] AvailableUnitsQuantity_type_info = new String[]{'AvailableUnitsQuantity','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','Quantity','0','1','false'};
		transient String[] CalendarEntry_type_info = new String[]{'CalendarEntry','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','CalendarEntry','0','1','false'};
		transient String[] Work_type_info = new String[]{'Work','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','Work','0','1','false'};
		transient String[] workOrderNumber_type_info = new String[]{'workOrderNumber','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','string','0','1','false'};
		transient String[] resourcePoolId_type_info = new String[]{'resourcePoolId','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','string','0','1','false'};
		transient String[] timeSlotType_type_info = new String[]{'timeSlotType','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','string','0','1','false'};
		transient String[] customerNegotiatedFlag_type_info = new String[]{'customerNegotiatedFlag','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','boolean','0','1','false'};
		transient String[] PartyRole_type_info = new String[]{'PartyRole','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','PartyRole','0','-1','false'};
		transient String[] remark_type_info = new String[]{'remark','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','string','0','-1','false'};
		transient String[] resultCode_type_info = new String[]{'resultCode','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','string','0','1','false'};
		transient String[] Messages_type_info = new String[]{'Messages','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','CodeDescription','0','-1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','true','false'};
		transient String[] field_order_type_info = new String[]{'appointmentCode','scheduleCode','PlannedDuration','AvailableUnitsQuantity','CalendarEntry','Work','workOrderNumber','resourcePoolId','timeSlotType','customerNegotiatedFlag','PartyRole','remark','resultCode','Messages'};
	}
	public class CustomerOrderExtension {
		public String partnerId;
		public String partnerType;
		public WS_BPM_BusinessObjects.Tax[] Tax;
		public WS_BPM_BusinessObjects.Tax[] AlternatePriceTax;
		public WS_BPM_BusinessObjects.CodeDescription StageCodeDescription;
		public Boolean recordsOnlyFlag;
		public Boolean lockedFlag;
		public String orderHash;
		public String[] orderRemark;
		public String salesChannelPartnerId;
		public String referredById;
		public String salesChannelTrackingId;
		public String marketingProgram;
		public String[] customerRemark;
		public Boolean modifiableFlag;
		public String processingDirection;
		public String actionReason;
		public Boolean customerWillAdviseFlag;
		public String interceptTelephoneNumber;
		public DateTime interceptRemovalDate;
		public WS_BPM_BusinessObjects.Money RecommendedDepositAmount;
		public Boolean primaryServiceFlag;
		public WS_BPM_BusinessObjects.Memo[] Memo;
		public Integer groupOrderTransactionCount;
		public Boolean isGroupOrderMember;
		public WS_BPM_BusinessObjects.AccountId AccountId;
		public String orderTypeDescription;
		public DateTime postedDate;
		public WS_BPM_BusinessObjects.AccountId BillingAccountId;
		public String orderTypeClassification;
		public Boolean isNewConstruction;
		transient String[] partnerId_type_info = new String[]{'partnerId','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','string','0','1','false'};
		transient String[] partnerType_type_info = new String[]{'partnerType','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','string','0','1','false'};
		transient String[] Tax_type_info = new String[]{'Tax','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','Tax','0','-1','false'};
		transient String[] AlternatePriceTax_type_info = new String[]{'AlternatePriceTax','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','Tax','0','-1','false'};
		transient String[] StageCodeDescription_type_info = new String[]{'StageCodeDescription','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','CodeDescription','0','1','false'};
		transient String[] recordsOnlyFlag_type_info = new String[]{'recordsOnlyFlag','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','boolean','0','1','false'};
		transient String[] lockedFlag_type_info = new String[]{'lockedFlag','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','boolean','0','1','false'};
		transient String[] orderHash_type_info = new String[]{'orderHash','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','string','0','1','false'};
		transient String[] orderRemark_type_info = new String[]{'orderRemark','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','string','0','-1','false'};
		transient String[] salesChannelPartnerId_type_info = new String[]{'salesChannelPartnerId','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','string','0','1','false'};
		transient String[] referredById_type_info = new String[]{'referredById','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','string','0','1','false'};
		transient String[] salesChannelTrackingId_type_info = new String[]{'salesChannelTrackingId','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','string','0','1','false'};
		transient String[] marketingProgram_type_info = new String[]{'marketingProgram','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','string','0','1','false'};
		transient String[] customerRemark_type_info = new String[]{'customerRemark','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','string','0','-1','false'};
		transient String[] modifiableFlag_type_info = new String[]{'modifiableFlag','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','boolean','0','1','false'};
		transient String[] processingDirection_type_info = new String[]{'processingDirection','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','string','0','1','false'};
		transient String[] actionReason_type_info = new String[]{'actionReason','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','string','0','1','false'};
		transient String[] customerWillAdviseFlag_type_info = new String[]{'customerWillAdviseFlag','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','boolean','0','1','false'};
		transient String[] interceptTelephoneNumber_type_info = new String[]{'interceptTelephoneNumber','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','string','0','1','false'};
		transient String[] interceptRemovalDate_type_info = new String[]{'interceptRemovalDate','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','dateTime','0','1','false'};
		transient String[] RecommendedDepositAmount_type_info = new String[]{'RecommendedDepositAmount','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','Money','0','1','false'};
		transient String[] primaryServiceFlag_type_info = new String[]{'primaryServiceFlag','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','boolean','0','1','false'};
		transient String[] Memo_type_info = new String[]{'Memo','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','Memo','0','-1','false'};
		transient String[] groupOrderTransactionCount_type_info = new String[]{'groupOrderTransactionCount','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','int','0','1','false'};
		transient String[] isGroupOrderMember_type_info = new String[]{'isGroupOrderMember','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','boolean','0','1','false'};
		transient String[] AccountId_type_info = new String[]{'AccountId','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','AccountId','0','1','false'};
		transient String[] orderTypeDescription_type_info = new String[]{'orderTypeDescription','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','string','0','1','false'};
		transient String[] postedDate_type_info = new String[]{'postedDate','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','dateTime','0','1','false'};
		transient String[] BillingAccountId_type_info = new String[]{'BillingAccountId','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','AccountId','0','1','false'};
		transient String[] orderTypeClassification_type_info = new String[]{'orderTypeClassification','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','string','0','1','false'};
		transient String[] isNewConstruction_type_info = new String[]{'isNewConstruction','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','boolean','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','true','false'};
		transient String[] field_order_type_info = new String[]{'partnerId','partnerType','Tax','AlternatePriceTax','StageCodeDescription','recordsOnlyFlag','lockedFlag','orderHash','orderRemark','salesChannelPartnerId','referredById','salesChannelTrackingId','marketingProgram','customerRemark','modifiableFlag','processingDirection','actionReason','customerWillAdviseFlag','interceptTelephoneNumber','interceptRemovalDate','RecommendedDepositAmount','primaryServiceFlag','Memo','groupOrderTransactionCount','isGroupOrderMember','AccountId','orderTypeDescription','postedDate','BillingAccountId','orderTypeClassification','isNewConstruction'};
	}
	public class LogicalResourceExtension {
		public WS_BPM_BusinessObjects.PhoneNumber PhoneNumber;
		public String accountSpeed;
		public String availableMaxProductSpeed;
		public String orderedSpeed;
		public String adslCapableReason;
		public Boolean adslCapableFlag;
		public Boolean sdslCapableFlag;
		public String sdslCapableReason;
		public WS_BPM_BusinessObjects.LocalLoop LocalLoop;
		public String availableSpeed;
		transient String[] PhoneNumber_type_info = new String[]{'PhoneNumber','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','PhoneNumber','0','1','false'};
		transient String[] accountSpeed_type_info = new String[]{'accountSpeed','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','string','0','1','false'};
		transient String[] availableMaxProductSpeed_type_info = new String[]{'availableMaxProductSpeed','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','string','0','1','false'};
		transient String[] orderedSpeed_type_info = new String[]{'orderedSpeed','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','string','0','1','false'};
		transient String[] adslCapableReason_type_info = new String[]{'adslCapableReason','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','string','0','1','false'};
		transient String[] adslCapableFlag_type_info = new String[]{'adslCapableFlag','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','boolean','0','1','false'};
		transient String[] sdslCapableFlag_type_info = new String[]{'sdslCapableFlag','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','boolean','0','1','false'};
		transient String[] sdslCapableReason_type_info = new String[]{'sdslCapableReason','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','string','0','1','false'};
		transient String[] LocalLoop_type_info = new String[]{'LocalLoop','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','LocalLoop','0','1','false'};
		transient String[] availableSpeed_type_info = new String[]{'availableSpeed','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','string','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','true','false'};
		transient String[] field_order_type_info = new String[]{'PhoneNumber','accountSpeed','availableMaxProductSpeed','orderedSpeed','adslCapableReason','adslCapableFlag','sdslCapableFlag','sdslCapableReason','LocalLoop','availableSpeed'};
	}
	public class PackageExtension {
		public String packageName;
		transient String[] packageName_type_info = new String[]{'packageName','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','string','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','true','false'};
		transient String[] field_order_type_info = new String[]{'packageName'};
	}
	public class PhysicalPortExtension {
		
		transient String[] virtualPathId_type_info = new String[]{'virtualPathId','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','string','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','true','false'};
		transient String[] field_order_type_info = new String[]{'virtualPathId'};
	}
	public class PhysicalResourceExtension {
		public String type_x;
		public String commonLanguageLocationIdentifier;
		public String officeId;
		public String manufacturer;
		public String model;
		public String plantType;
		public WS_BPM_BusinessObjects.Quantity Quantity;
		transient String[] type_x_type_info = new String[]{'type','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','string','0','1','false'};
		transient String[] commonLanguageLocationIdentifier_type_info = new String[]{'commonLanguageLocationIdentifier','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','string','0','1','false'};
		transient String[] officeId_type_info = new String[]{'officeId','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','string','0','1','false'};
		transient String[] manufacturer_type_info = new String[]{'manufacturer','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','string','0','1','false'};
		transient String[] model_type_info = new String[]{'model','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','string','0','1','false'};
		transient String[] plantType_type_info = new String[]{'plantType','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','string','0','1','false'};
		transient String[] Quantity_type_info = new String[]{'Quantity','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','Quantity','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','true','false'};
		transient String[] field_order_type_info = new String[]{'type_x','commonLanguageLocationIdentifier','officeId','manufacturer','model','plantType','Quantity'};
	}
	public class ProdPriceAlterationExtension {
		public Double percentage;
		transient String[] percentage_type_info = new String[]{'percentage','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','double','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','true','false'};
		transient String[] field_order_type_info = new String[]{'percentage'};
	}
	public class ProductExtension {
		public String sku;
		public String genericSKU;
		public WS_BPM_BusinessObjects.CallingCard[] CallingCard;
		public WS_BPM_BusinessObjects.RolloverMinutes[] RolloverMinutes;
		public WS_BPM_BusinessObjects.CallingPlan[] CallingPlan;
		public String installSOTTNumber;
		public String packageCode;
		public Boolean isTaxExempt;
		public String removalSOTTNumber;
		public WS_BPM_BusinessObjects.Quantity Quantity;
		transient String[] sku_type_info = new String[]{'sku','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','string','0','1','false'};
		transient String[] genericSKU_type_info = new String[]{'genericSKU','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','string','0','1','false'};
		transient String[] CallingCard_type_info = new String[]{'CallingCard','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','CallingCard','0','-1','false'};
		transient String[] RolloverMinutes_type_info = new String[]{'RolloverMinutes','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','RolloverMinutes','0','-1','false'};
		transient String[] CallingPlan_type_info = new String[]{'CallingPlan','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','CallingPlan','0','-1','false'};
		transient String[] installSOTTNumber_type_info = new String[]{'installSOTTNumber','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','string','0','1','false'};
		transient String[] packageCode_type_info = new String[]{'packageCode','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','string','0','1','false'};
		transient String[] isTaxExempt_type_info = new String[]{'isTaxExempt','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','boolean','0','1','false'};
		transient String[] removalSOTTNumber_type_info = new String[]{'removalSOTTNumber','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','string','0','1','false'};
		transient String[] Quantity_type_info = new String[]{'Quantity','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','Quantity','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','true','false'};
		transient String[] field_order_type_info = new String[]{'sku','genericSKU','CallingCard','RolloverMinutes','CallingPlan','installSOTTNumber','packageCode','isTaxExempt','removalSOTTNumber','Quantity'};
	}
	public class ProductPromotionExtension {
		public Boolean isProductTerm;
		public Integer productTermLength;
		public DateTime productTermEndDate;
		public Boolean termEndDateMismatch;
		public WS_BPM_BusinessObjects.TimePeriod ContractValidFor;
		public String contractStatus;
		public WS_BPM_BusinessObjects.Entity OrderReference;
		public WS_BPM_BusinessObjects.Entity DiscountInformation;
		public Integer gracePeriodDays;
		public String autoRenewStatus;
		public WS_BPM_BusinessObjects.Entity PenaltyInformation;
		transient String[] isProductTerm_type_info = new String[]{'isProductTerm','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','boolean','0','1','false'};
		transient String[] productTermLength_type_info = new String[]{'productTermLength','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','int','0','1','false'};
		transient String[] productTermEndDate_type_info = new String[]{'productTermEndDate','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','dateTime','0','1','false'};
		transient String[] termEndDateMismatch_type_info = new String[]{'termEndDateMismatch','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','boolean','0','1','false'};
		transient String[] ContractValidFor_type_info = new String[]{'ContractValidFor','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','TimePeriod','0','1','false'};
		transient String[] contractStatus_type_info = new String[]{'contractStatus','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','string','0','1','false'};
		transient String[] OrderReference_type_info = new String[]{'OrderReference','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','Entity','0','1','false'};
		transient String[] DiscountInformation_type_info = new String[]{'DiscountInformation','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','Entity','0','1','false'};
		transient String[] gracePeriodDays_type_info = new String[]{'gracePeriodDays','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','int','0','1','false'};
		transient String[] autoRenewStatus_type_info = new String[]{'autoRenewStatus','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','string','0','1','false'};
		transient String[] PenaltyInformation_type_info = new String[]{'PenaltyInformation','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','Entity','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','true','false'};
		transient String[] field_order_type_info = new String[]{'isProductTerm','productTermLength','productTermEndDate','termEndDateMismatch','ContractValidFor','contractStatus','OrderReference','DiscountInformation','gracePeriodDays','autoRenewStatus','PenaltyInformation'};
	}
	public class RelatedOrdersExtension {
		public String environment;
		public String serviceType;
		public String dpiOrderType;
		public WS_BPM_BusinessObjects.AccountId AccountId;
		public String groupSequenceNumber;
		public String relationshipType;
		public String dependentCrmClass;
		public String stageCode;
		public String leadEnvironment;
		public String leadOrderNumber;
		transient String[] environment_type_info = new String[]{'environment','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','string','0','1','false'};
		transient String[] serviceType_type_info = new String[]{'serviceType','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','string','0','1','false'};
		transient String[] dpiOrderType_type_info = new String[]{'dpiOrderType','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','string','0','1','false'};
		transient String[] AccountId_type_info = new String[]{'AccountId','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','AccountId','0','1','false'};
		transient String[] groupSequenceNumber_type_info = new String[]{'groupSequenceNumber','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','string','0','1','false'};
		transient String[] relationshipType_type_info = new String[]{'relationshipType','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','string','0','1','false'};
		transient String[] dependentCrmClass_type_info = new String[]{'dependentCrmClass','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','string','0','1','false'};
		transient String[] stageCode_type_info = new String[]{'stageCode','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','string','0','1','false'};
		transient String[] leadEnvironment_type_info = new String[]{'leadEnvironment','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','string','0','1','false'};
		transient String[] leadOrderNumber_type_info = new String[]{'leadOrderNumber','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','string','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','true','false'};
		transient String[] field_order_type_info = new String[]{'environment','serviceType','dpiOrderType','AccountId','groupSequenceNumber','relationshipType','dependentCrmClass','stageCode','leadEnvironment','leadOrderNumber'};
	}
	public class ResourceExtension {
		public Boolean techDeliveryAvailable;
		public WS_BPM_BusinessObjects.LineCardHistory[] LineCardHistory;
		public WS_BPM_BusinessObjects.CharacteristicSpecification[] CharacteristicSpecification;
		transient String[] techDeliveryAvailable_type_info = new String[]{'techDeliveryAvailable','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','boolean','0','1','false'};
		transient String[] LineCardHistory_type_info = new String[]{'LineCardHistory','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','LineCardHistory','0','-1','false'};
		transient String[] CharacteristicSpecification_type_info = new String[]{'CharacteristicSpecification','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','CharacteristicSpecification','0','-1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','true','false'};
		transient String[] field_order_type_info = new String[]{'techDeliveryAvailable','LineCardHistory','CharacteristicSpecification'};
	}
	public class ResourceFacingServiceExtension {
		public WS_BPM_BusinessObjects.Connection[] Connection;
		public Boolean techDeliveryAvailable;
		public String tnPoolType;
		public WS_BPM_BusinessObjects.HuntGroup[] HuntGroup;
		public String serviceNPANXX;
		public String wireCenterClliCode;
		public String wireCenter;
		public WS_BPM_BusinessObjects.EmailAccount EmailAccount;
		transient String[] Connection_type_info = new String[]{'Connection','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','Connection','0','-1','false'};
		transient String[] techDeliveryAvailable_type_info = new String[]{'techDeliveryAvailable','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','boolean','0','1','false'};
		transient String[] tnPoolType_type_info = new String[]{'tnPoolType','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','string','0','1','false'};
		transient String[] HuntGroup_type_info = new String[]{'HuntGroup','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','HuntGroup','0','-1','false'};
		transient String[] serviceNPANXX_type_info = new String[]{'serviceNPANXX','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','string','0','1','false'};
		transient String[] wireCenterClliCode_type_info = new String[]{'wireCenterClliCode','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','string','0','1','false'};
		transient String[] wireCenter_type_info = new String[]{'wireCenter','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','string','0','1','false'};
		transient String[] EmailAccount_type_info = new String[]{'EmailAccount','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','EmailAccount','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','false','false'};
		transient String[] field_order_type_info = new String[]{'Connection','techDeliveryAvailable','tnPoolType','HuntGroup','serviceNPANXX','wireCenterClliCode','wireCenter','EmailAccount'};
	}
	public class ServiceExtension {
		public String serviceItemCode;
		transient String[] serviceItemCode_type_info = new String[]{'serviceItemCode','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','string','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/fulfillment/extensions','true','false'};
		transient String[] field_order_type_info = new String[]{'serviceItemCode'};
	}

	public class AccountsReceivable {
		public WS_BPM_BusinessObjects.Money OriginalAmount;
		public WS_BPM_BusinessObjects.AccountsReceivableDetail[] AccountsReceivableDetail;
		transient String[] OriginalAmount_type_info = new String[]{'OriginalAmount','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','Money','0','1','false'};
		transient String[] AccountsReceivableDetail_type_info = new String[]{'AccountsReceivableDetail','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','AccountsReceivableDetail','0','-1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','true','false'};
		transient String[] field_order_type_info = new String[]{'OriginalAmount','AccountsReceivableDetail'};
	}
	public class AccountsReceivableDetail {
		public DateTime transactionDate;
		public DateTime postDateTime;
		public WS_BPM_BusinessObjects.Money Amount;
		public WS_BPM_BusinessObjects.Tax Tax;
		public WS_BPM_BusinessObjects.Toll Toll;
		public WS_BPM_BusinessObjects.GLAccount GLAccount;
		public WS_BPM_BusinessObjects.CustomerPayment[] CustomerPayment;
		public WS_BPM_BusinessObjects.CustomerAdjustment[] CustomerAdjustment;
		public WS_BPM_BusinessObjects.Money RemainingAmount;
		public DateTime billDate;
		transient String[] transactionDate_type_info = new String[]{'transactionDate','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','dateTime','0','1','false'};
		transient String[] postDateTime_type_info = new String[]{'postDateTime','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','dateTime','0','1','false'};
		transient String[] Amount_type_info = new String[]{'Amount','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','Money','0','1','false'};
		transient String[] Tax_type_info = new String[]{'Tax','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','Tax','0','1','false'};
		transient String[] Toll_type_info = new String[]{'Toll','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','Toll','0','1','false'};
		transient String[] GLAccount_type_info = new String[]{'GLAccount','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','GLAccount','0','1','false'};
		transient String[] CustomerPayment_type_info = new String[]{'CustomerPayment','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','CustomerPayment','0','-1','false'};
		transient String[] CustomerAdjustment_type_info = new String[]{'CustomerAdjustment','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','CustomerAdjustment','0','-1','false'};
		transient String[] RemainingAmount_type_info = new String[]{'RemainingAmount','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','Money','0','1','false'};
		transient String[] billDate_type_info = new String[]{'billDate','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','dateTime','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','true','false'};
		transient String[] field_order_type_info = new String[]{'transactionDate','postDateTime','Amount','Tax','Toll','GLAccount','CustomerPayment','CustomerAdjustment','RemainingAmount','billDate'};
	}
	public class Agreement {
		public String agreementDocumentNumber;
		public WS_BPM_BusinessObjects.TimePeriod AgreementPeriod;
		public WS_BPM_BusinessObjects.AgreementItem[] AgreementItem;
		public WS_BPM_BusinessObjects.AgreementAuthorization AgreementAuthorization;
		public WS_BPM_BusinessObjects.AgreementTermOrCondition AgreementTermOrCondition;
		public WS_BPM_BusinessObjects.Entity CustomerAccountId;
		public WS_BPM_BusinessObjects.CharacteristicSpecification[] CharacteristicSpecification;
		public WS_BPM_BusinessObjects.AgreementExtension AgreementExtension;
		transient String[] agreementDocumentNumber_type_info = new String[]{'agreementDocumentNumber','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','true'};
		transient String[] AgreementPeriod_type_info = new String[]{'AgreementPeriod','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','TimePeriod','0','1','true'};
		transient String[] AgreementItem_type_info = new String[]{'AgreementItem','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','AgreementItem','0','-1','true'};
		transient String[] AgreementAuthorization_type_info = new String[]{'AgreementAuthorization','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','AgreementAuthorization','0','1','true'};
		transient String[] AgreementTermOrCondition_type_info = new String[]{'AgreementTermOrCondition','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','AgreementTermOrCondition','0','1','true'};
		transient String[] CustomerAccountId_type_info = new String[]{'CustomerAccountId','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','Entity','0','1','false'};
		transient String[] CharacteristicSpecification_type_info = new String[]{'CharacteristicSpecification','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','CharacteristicSpecification','0','-1','false'};
		transient String[] AgreementExtension_type_info = new String[]{'AgreementExtension','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','AgreementExtension','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','true','false'};
		transient String[] field_order_type_info = new String[]{'agreementDocumentNumber','AgreementPeriod','AgreementItem','AgreementAuthorization','AgreementTermOrCondition','CustomerAccountId','CharacteristicSpecification','AgreementExtension'};
	}
	public class AgreementAuthorization {
		public String agreementAuthorizationDate;
		public String agreementAuthorzedBy;
		public String agreementSignatureRepresentation;
		public String agreementAuthorizationState;
		transient String[] agreementAuthorizationDate_type_info = new String[]{'agreementAuthorizationDate','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','true'};
		transient String[] agreementAuthorzedBy_type_info = new String[]{'agreementAuthorzedBy','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','true'};
		transient String[] agreementSignatureRepresentation_type_info = new String[]{'agreementSignatureRepresentation','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','true'};
		transient String[] agreementAuthorizationState_type_info = new String[]{'agreementAuthorizationState','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','true'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','true','false'};
		transient String[] field_order_type_info = new String[]{'agreementAuthorizationDate','agreementAuthorzedBy','agreementSignatureRepresentation','agreementAuthorizationState'};
	}
	public class AgreementItem {
		public String[] Products;
		public WS_BPM_BusinessObjects.AgreementItemExtension AgreementItemExtension;
		public WS_BPM_BusinessObjects.AgreementItem[] ComponentAgreementItems;
		public WS_BPM_BusinessObjects.BusinessInteractionItem[] BusinessInteractionItem;
		transient String[] Products_type_info = new String[]{'Products','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','-1','true'};
		transient String[] AgreementItemExtension_type_info = new String[]{'AgreementItemExtension','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','AgreementItemExtension','0','1','false'};
		transient String[] ComponentAgreementItems_type_info = new String[]{'ComponentAgreementItems','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','AgreementItem','0','-1','false'};
		transient String[] BusinessInteractionItem_type_info = new String[]{'BusinessInteractionItem','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','BusinessInteractionItem','0','-1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','true','false'};
		transient String[] field_order_type_info = new String[]{'Products','AgreementItemExtension','ComponentAgreementItems','BusinessInteractionItem'};
	}
	public class AgreementTermOrCondition {
		public String description;
		public String productOfferingTerm;
		transient String[] description_type_info = new String[]{'description','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','true'};
		transient String[] productOfferingTerm_type_info = new String[]{'productOfferingTerm','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','true'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','true','false'};
		transient String[] field_order_type_info = new String[]{'description','productOfferingTerm'};
	}
	public class Appointment {
		public WS_BPM_BusinessObjects.TimePeriod businessTimePeriod;
		public DateTime notificationTime;
		public WS_BPM_BusinessObjects.AppointmentExtension AppointmentExtension;
		public WS_BPM_BusinessObjects.CharacteristicSpecification[] Characteristics;
		transient String[] businessTimePeriod_type_info = new String[]{'businessTimePeriod','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','TimePeriod','0','1','false'};
		transient String[] notificationTime_type_info = new String[]{'notificationTime','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','dateTime','0','1','false'};
		transient String[] AppointmentExtension_type_info = new String[]{'AppointmentExtension','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','AppointmentExtension','0','1','false'};
		transient String[] Characteristics_type_info = new String[]{'Characteristics','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','CharacteristicSpecification','0','-1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','true','false'};
		transient String[] field_order_type_info = new String[]{'businessTimePeriod','notificationTime','AppointmentExtension','Characteristics'};
	}
	public class ArrayOfCustCreditProfileReference {
		public WS_BPM_BusinessObjects.CustCreditProfileReference[] CustCreditProfileReference;
		transient String[] CustCreditProfileReference_type_info = new String[]{'CustCreditProfileReference','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','CustCreditProfileReference','0','-1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','true','false'};
		transient String[] field_order_type_info = new String[]{'CustCreditProfileReference'};
	}
	public class ArrayOfPaymentPlan {
		public WS_BPM_BusinessObjects.PaymentPlan[] PaymentPlan;
		transient String[] PaymentPlan_type_info = new String[]{'PaymentPlan','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','PaymentPlan','0','-1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','true','false'};
		transient String[] field_order_type_info = new String[]{'PaymentPlan'};
	}
	public class BusinessInteraction {
		public String ID;
		public String interactionType;
		public DateTime interactionDate;
		public DateTime interactionDateComplete;
		public String interactionStatus;
		public String interactionPlace;
		public String[] description;
		public WS_BPM_BusinessObjects.BusinessInteractionItem[] InteractionItems;
		public WS_BPM_BusinessObjects.CharacteristicSpecification[] CharacteristicSpecification;
		transient String[] ID_type_info = new String[]{'ID','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','true'};
		transient String[] interactionType_type_info = new String[]{'interactionType','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','true'};
		transient String[] interactionDate_type_info = new String[]{'interactionDate','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','dateTime','0','1','true'};
		transient String[] interactionDateComplete_type_info = new String[]{'interactionDateComplete','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','dateTime','0','1','true'};
		transient String[] interactionStatus_type_info = new String[]{'interactionStatus','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','true'};
		transient String[] interactionPlace_type_info = new String[]{'interactionPlace','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','true'};
		transient String[] description_type_info = new String[]{'description','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','-1','true'};
		transient String[] InteractionItems_type_info = new String[]{'InteractionItems','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','BusinessInteractionItem','0','-1','true'};
		transient String[] CharacteristicSpecification_type_info = new String[]{'CharacteristicSpecification','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','CharacteristicSpecification','0','-1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','true','false'};
		transient String[] field_order_type_info = new String[]{'ID','interactionType','interactionDate','interactionDateComplete','interactionStatus','interactionPlace','description','InteractionItems','CharacteristicSpecification'};
	}
	public class BusinessInteractionItem {
		public String quantity;
		public String action;
		public String verb;
		public WS_BPM_BusinessObjects.Place Location;
		public WS_BPM_BusinessObjects.ProductOffering ProductOffering;
		public WS_BPM_BusinessObjects.Product Product;
		public WS_BPM_BusinessObjects.Service Service;
		public WS_BPM_BusinessObjects.BusinessInteractionItemPrice ItemPrice;
		public WS_BPM_BusinessObjects.CharacteristicSpecification[] AdditionalInformation;
		transient String[] quantity_type_info = new String[]{'quantity','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','true'};
		transient String[] action_type_info = new String[]{'action','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','true'};
		transient String[] verb_type_info = new String[]{'verb','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','true'};
		transient String[] Location_type_info = new String[]{'Location','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','Place','0','1','true'};
		transient String[] ProductOffering_type_info = new String[]{'ProductOffering','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','ProductOffering','0','1','true'};
		transient String[] Product_type_info = new String[]{'Product','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','Product','0','1','false'};
		transient String[] Service_type_info = new String[]{'Service','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','Service','0','1','false'};
		transient String[] ItemPrice_type_info = new String[]{'ItemPrice','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','BusinessInteractionItemPrice','0','1','true'};
		transient String[] AdditionalInformation_type_info = new String[]{'AdditionalInformation','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','CharacteristicSpecification','0','-1','true'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','true','false'};
		transient String[] field_order_type_info = new String[]{'quantity','action','verb','Location','ProductOffering','Product','Service','ItemPrice','AdditionalInformation'};
	}
	public class BusinessInteractionItemPrice {
		public WS_BPM_BusinessObjects.Money price;
		transient String[] price_type_info = new String[]{'price','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','Money','0','1','true'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','true','false'};
		transient String[] field_order_type_info = new String[]{'price'};
	}
	public class CreditCard {
		public String cardIssuer;
		public String primaryAccountNumber;
		public String cardHolderFullName;
		public DateTime cardExpirationDate;
		public String securityCode;
		public String amountTransaction;
		public DateTime transmissionDatetime;
		public DateTime dateTimeLocalTransaction;
		public WS_BPM_BusinessObjects.CharacteristicSpecification[] CharacteristicSpecification;
		transient String[] cardIssuer_type_info = new String[]{'cardIssuer','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','false'};
		transient String[] primaryAccountNumber_type_info = new String[]{'primaryAccountNumber','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','false'};
		transient String[] cardHolderFullName_type_info = new String[]{'cardHolderFullName','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','false'};
		transient String[] cardExpirationDate_type_info = new String[]{'cardExpirationDate','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','dateTime','0','1','false'};
		transient String[] securityCode_type_info = new String[]{'securityCode','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','false'};
		transient String[] amountTransaction_type_info = new String[]{'amountTransaction','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','false'};
		transient String[] transmissionDatetime_type_info = new String[]{'transmissionDatetime','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','dateTime','0','1','false'};
		transient String[] dateTimeLocalTransaction_type_info = new String[]{'dateTimeLocalTransaction','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','dateTime','0','1','false'};
		transient String[] CharacteristicSpecification_type_info = new String[]{'CharacteristicSpecification','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','CharacteristicSpecification','0','-1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','true','false'};
		transient String[] field_order_type_info = new String[]{'cardIssuer','primaryAccountNumber','cardHolderFullName','cardExpirationDate','securityCode','amountTransaction','transmissionDatetime','dateTimeLocalTransaction','CharacteristicSpecification'};
	}
	public class CurrentTreatmentStatus {
		public DateTime startDate;
		public Boolean reconnectFeeFlag;
		public String status;
		public String description;
		transient String[] startDate_type_info = new String[]{'startDate','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','dateTime','0','1','false'};
		transient String[] reconnectFeeFlag_type_info = new String[]{'reconnectFeeFlag','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','boolean','0','1','false'};
		transient String[] status_type_info = new String[]{'status','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','false'};
		transient String[] description_type_info = new String[]{'description','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','true','false'};
		transient String[] field_order_type_info = new String[]{'startDate','reconnectFeeFlag','status','description'};
	}
	public class CustCreditProfileReference {
		public String financialInstitutionName;
		public String financialInstitutionAccoutNumber;
		public String financialInstitutionAccountType;
		public String ISO9362Code;
		public String ISO13616Code_IBAN;
		public String branchNameOrLocation;
		public WS_BPM_BusinessObjects.Party ContactPerson;
		public String routingNumber;
		public String IssuerIdentificationNumber_IIN;
		transient String[] financialInstitutionName_type_info = new String[]{'financialInstitutionName','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','false'};
		transient String[] financialInstitutionAccoutNumber_type_info = new String[]{'financialInstitutionAccoutNumber','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','false'};
		transient String[] financialInstitutionAccountType_type_info = new String[]{'financialInstitutionAccountType','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','false'};
		transient String[] ISO9362Code_type_info = new String[]{'ISO9362Code','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','false'};
		transient String[] ISO13616Code_IBAN_type_info = new String[]{'ISO13616Code-IBAN','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','false'};
		transient String[] branchNameOrLocation_type_info = new String[]{'branchNameOrLocation','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','false'};
		transient String[] ContactPerson_type_info = new String[]{'ContactPerson','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','Party','0','1','false'};
		transient String[] routingNumber_type_info = new String[]{'routingNumber','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','false'};
		transient String[] IssuerIdentificationNumber_IIN_type_info = new String[]{'IssuerIdentificationNumber-IIN','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','true','false'};
		transient String[] field_order_type_info = new String[]{'financialInstitutionName','financialInstitutionAccoutNumber','financialInstitutionAccountType','ISO9362Code','ISO13616Code_IBAN','branchNameOrLocation','ContactPerson','routingNumber','IssuerIdentificationNumber_IIN'};
	}
	public class Customer {
		public String ID;
		public String customerStatus;
		public Integer customerRank;
		public WS_BPM_BusinessObjects.PartyRole[] CustomerDetails;
		public WS_BPM_BusinessObjects.CustomerAccount[] CustomerAccount;
		public WS_BPM_BusinessObjects.CustomerCreditProfile CustomerCreditProfile;
		public WS_BPM_BusinessObjects.CustomerPayment CustomerPayment;
		public WS_BPM_BusinessObjects.CustomerExtension CustomerExtension;
		public WS_BPM_BusinessObjects.CharacteristicSpecification[] CharacteristicSpecification;
		public WS_BPM_BusinessObjects.CustCreditProfileReference BankingInfo;
		public WS_BPM_BusinessObjects.Customer CustomerStateBeforeUpdate;
		transient String[] ID_type_info = new String[]{'ID','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','true'};
		transient String[] customerStatus_type_info = new String[]{'customerStatus','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','true'};
		transient String[] customerRank_type_info = new String[]{'customerRank','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','int','0','1','true'};
		transient String[] CustomerDetails_type_info = new String[]{'CustomerDetails','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','PartyRole','0','-1','false'};
		transient String[] CustomerAccount_type_info = new String[]{'CustomerAccount','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','CustomerAccount','0','-1','true'};
		transient String[] CustomerCreditProfile_type_info = new String[]{'CustomerCreditProfile','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','CustomerCreditProfile','0','1','true'};
		transient String[] CustomerPayment_type_info = new String[]{'CustomerPayment','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','CustomerPayment','0','1','false'};
		transient String[] CustomerExtension_type_info = new String[]{'CustomerExtension','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','CustomerExtension','0','1','false'};
		transient String[] CharacteristicSpecification_type_info = new String[]{'CharacteristicSpecification','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','CharacteristicSpecification','0','-1','false'};
		transient String[] BankingInfo_type_info = new String[]{'BankingInfo','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','CustCreditProfileReference','0','1','false'};
		transient String[] CustomerStateBeforeUpdate_type_info = new String[]{'CustomerStateBeforeUpdate','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','Customer','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','true','false'};
		transient String[] field_order_type_info = new String[]{'ID','customerStatus','customerRank','CustomerDetails','CustomerAccount','CustomerCreditProfile','CustomerPayment','CustomerExtension','CharacteristicSpecification','BankingInfo','CustomerStateBeforeUpdate'};
	}
	public class CustomerAccount {
		public WS_BPM_BusinessObjects.IBMTelecomRootObject CustomerAccountIdentification;
		public String accountType;
		public String accountStatus;
		public WS_BPM_BusinessObjects.Money creditLimit;
		public String PIN;
		public Double customerAccountChargeSum;
		public WS_BPM_BusinessObjects.CustomerAccountProductInvolvement[] CustomerAccountProductInvolvement;
		public WS_BPM_BusinessObjects.CustomerAccountContact AccountContact;
		public WS_BPM_BusinessObjects.CustomerBill[] CustomerBill;
		public WS_BPM_BusinessObjects.CustomerBillingCreditBalance AccountCreditBalance;
		public WS_BPM_BusinessObjects.PaymentPlan PaymentPlan;
		public WS_BPM_BusinessObjects.CharacteristicSpecification[] CustomerAccountCharacteristicValue;
		public WS_BPM_BusinessObjects.CustomerAccount ParentCustomerAccount;
		public WS_BPM_BusinessObjects.CustomerAccountExtension CustomerAccountExtension;
		public WS_BPM_BusinessObjects.CustomerPayment[] CustomerPayment;
		public WS_BPM_BusinessObjects.CustomerAdjustment[] CustomerAdjustment;
		public WS_BPM_BusinessObjects.CustomerOrder[] CustomerOrder;
		public WS_BPM_BusinessObjects.CustomerCreditProfile CustomerCreditProfile;
		public WS_BPM_BusinessObjects.ProductPromotion[] ProductPromotions;
		transient String[] CustomerAccountIdentification_type_info = new String[]{'CustomerAccountIdentification','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','IBMTelecomRootObject','0','1','true'};
		transient String[] accountType_type_info = new String[]{'accountType','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','true'};
		transient String[] accountStatus_type_info = new String[]{'accountStatus','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','true'};
		transient String[] creditLimit_type_info = new String[]{'creditLimit','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','Money','0','1','true'};
		transient String[] PIN_type_info = new String[]{'PIN','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','true'};
		transient String[] customerAccountChargeSum_type_info = new String[]{'customerAccountChargeSum','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','double','0','1','true'};
		transient String[] CustomerAccountProductInvolvement_type_info = new String[]{'CustomerAccountProductInvolvement','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','CustomerAccountProductInvolvement','0','-1','true'};
		transient String[] AccountContact_type_info = new String[]{'AccountContact','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','CustomerAccountContact','0','1','true'};
		transient String[] CustomerBill_type_info = new String[]{'CustomerBill','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','CustomerBill','0','-1','true'};
		transient String[] AccountCreditBalance_type_info = new String[]{'AccountCreditBalance','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','CustomerBillingCreditBalance','0','1','true'};
		transient String[] PaymentPlan_type_info = new String[]{'PaymentPlan','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','PaymentPlan','0','1','false'};
		transient String[] CustomerAccountCharacteristicValue_type_info = new String[]{'CustomerAccountCharacteristicValue','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','CharacteristicSpecification','0','-1','false'};
		transient String[] ParentCustomerAccount_type_info = new String[]{'ParentCustomerAccount','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','CustomerAccount','0','1','false'};
		transient String[] CustomerAccountExtension_type_info = new String[]{'CustomerAccountExtension','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','CustomerAccountExtension','0','1','false'};
		transient String[] CustomerPayment_type_info = new String[]{'CustomerPayment','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','CustomerPayment','0','-1','false'};
		transient String[] CustomerAdjustment_type_info = new String[]{'CustomerAdjustment','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','CustomerAdjustment','0','-1','false'};
		transient String[] CustomerOrder_type_info = new String[]{'CustomerOrder','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','CustomerOrder','0','-1','false'};
		transient String[] CustomerCreditProfile_type_info = new String[]{'CustomerCreditProfile','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','CustomerCreditProfile','0','1','false'};
		transient String[] ProductPromotions_type_info = new String[]{'ProductPromotions','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','ProductPromotion','0','-1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','true','false'};
		transient String[] field_order_type_info = new String[]{'CustomerAccountIdentification','accountType','accountStatus','creditLimit','PIN','customerAccountChargeSum','CustomerAccountProductInvolvement','AccountContact','CustomerBill','AccountCreditBalance','PaymentPlan','CustomerAccountCharacteristicValue','ParentCustomerAccount','CustomerAccountExtension','CustomerPayment','CustomerAdjustment','CustomerOrder','CustomerCreditProfile','ProductPromotions'};
	}
	public class CustomerAccountContact {
		public String contactType;
		public WS_BPM_BusinessObjects.ContactMedium ContactMedium;
		transient String[] contactType_type_info = new String[]{'contactType','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','true'};
		transient String[] ContactMedium_type_info = new String[]{'ContactMedium','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','ContactMedium','0','1','true'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','true','false'};
		transient String[] field_order_type_info = new String[]{'contactType','ContactMedium'};
	}
	public class CustomerAccountProductInvolvement {
		public WS_BPM_BusinessObjects.ProductOffering productOffering;
		public WS_BPM_BusinessObjects.Product product;
		public String status;
		transient String[] productOffering_type_info = new String[]{'productOffering','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','ProductOffering','0','1','true'};
		transient String[] product_type_info = new String[]{'product','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','Product','0','1','true'};
		transient String[] status_type_info = new String[]{'status','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','true'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','true','false'};
		transient String[] field_order_type_info = new String[]{'productOffering','product','status'};
	}
	public class CustomerBill {
		public String customerAccountId;
		public String billNo;
		public WS_BPM_BusinessObjects.Money billAmount;
		public WS_BPM_BusinessObjects.CustomerBillingCycle BillingCycle;
		public String billFormat;
		public WS_BPM_BusinessObjects.CustomerBillExtension CustomerBillExtension;
		public WS_BPM_BusinessObjects.AccountsReceivableDetail[] AccountsReceivableDetail;
		public WS_BPM_BusinessObjects.CharacteristicSpecification[] CharacteristicSpecification;
		transient String[] customerAccountId_type_info = new String[]{'customerAccountId','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','true'};
		transient String[] billNo_type_info = new String[]{'billNo','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','true'};
		transient String[] billAmount_type_info = new String[]{'billAmount','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','Money','0','1','true'};
		transient String[] BillingCycle_type_info = new String[]{'BillingCycle','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','CustomerBillingCycle','0','1','true'};
		transient String[] billFormat_type_info = new String[]{'billFormat','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','true'};
		transient String[] CustomerBillExtension_type_info = new String[]{'CustomerBillExtension','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','CustomerBillExtension','0','1','false'};
		transient String[] AccountsReceivableDetail_type_info = new String[]{'AccountsReceivableDetail','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','AccountsReceivableDetail','0','-1','false'};
		transient String[] CharacteristicSpecification_type_info = new String[]{'CharacteristicSpecification','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','CharacteristicSpecification','0','-1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','true','false'};
		transient String[] field_order_type_info = new String[]{'customerAccountId','billNo','billAmount','BillingCycle','billFormat','CustomerBillExtension','AccountsReceivableDetail','CharacteristicSpecification'};
	}
	public class CustomerBillingCreditBalance {
		public WS_BPM_BusinessObjects.TimePeriod validFor;
		public WS_BPM_BusinessObjects.Money creditBalanceAmount;
		transient String[] validFor_type_info = new String[]{'validFor','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','TimePeriod','0','1','true'};
		transient String[] creditBalanceAmount_type_info = new String[]{'creditBalanceAmount','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','Money','0','1','true'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','true','false'};
		transient String[] field_order_type_info = new String[]{'validFor','creditBalanceAmount'};
	}
	public class CustomerBillingCycle {
		public WS_BPM_BusinessObjects.TimePeriod cyclePeriod;
		public DateTime billingDate;
		public DateTime chargeDate;
		public DateTime creditDate;
		public DateTime mailingDate;
		public DateTime paymentDueDate;
		public Boolean triggeredByScheduler;
		public Boolean triggeredByCustomer;
		public Boolean triggeredByProvider;
		public Boolean triggeredByAccountClose;
		public String description;
		public WS_BPM_BusinessObjects.CharacteristicSpecification[] CharacteristicSpecification;
		public Integer billCycle;
		transient String[] cyclePeriod_type_info = new String[]{'cyclePeriod','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','TimePeriod','0','1','true'};
		transient String[] billingDate_type_info = new String[]{'billingDate','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','dateTime','0','1','true'};
		transient String[] chargeDate_type_info = new String[]{'chargeDate','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','dateTime','0','1','true'};
		transient String[] creditDate_type_info = new String[]{'creditDate','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','dateTime','0','1','true'};
		transient String[] mailingDate_type_info = new String[]{'mailingDate','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','dateTime','0','1','true'};
		transient String[] paymentDueDate_type_info = new String[]{'paymentDueDate','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','dateTime','0','1','true'};
		transient String[] triggeredByScheduler_type_info = new String[]{'triggeredByScheduler','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','boolean','0','1','true'};
		transient String[] triggeredByCustomer_type_info = new String[]{'triggeredByCustomer','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','boolean','0','1','true'};
		transient String[] triggeredByProvider_type_info = new String[]{'triggeredByProvider','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','boolean','0','1','true'};
		transient String[] triggeredByAccountClose_type_info = new String[]{'triggeredByAccountClose','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','boolean','0','1','true'};
		transient String[] description_type_info = new String[]{'description','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','true'};
		transient String[] CharacteristicSpecification_type_info = new String[]{'CharacteristicSpecification','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','CharacteristicSpecification','0','-1','false'};
		transient String[] billCycle_type_info = new String[]{'billCycle','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','int','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','true','false'};
		transient String[] field_order_type_info = new String[]{'cyclePeriod','billingDate','chargeDate','creditDate','mailingDate','paymentDueDate','triggeredByScheduler','triggeredByCustomer','triggeredByProvider','triggeredByAccountClose','description','CharacteristicSpecification','billCycle'};
	}
	public class CustomerCreditProfile {
		public String ID;
		public String customerID;
		public DateTime creditProfileDate;
		public DateTime[] creditProfileHistoryDates;
		public WS_BPM_BusinessObjects.TimePeriod validFor;
		public Integer creditRiskRating;
		public Integer creditScore;
		public WS_BPM_BusinessObjects.ArrayOfCustCreditProfileReference CustCreditProfileReference;
		public WS_BPM_BusinessObjects.CharacteristicSpecification[] CharacteristicSpecification;
		public WS_BPM_BusinessObjects.CustomerCreditProfileExtension CustomerCreditProfileExtension;
		transient String[] ID_type_info = new String[]{'ID','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','true'};
		transient String[] customerID_type_info = new String[]{'customerID','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','true'};
		transient String[] creditProfileDate_type_info = new String[]{'creditProfileDate','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','dateTime','0','1','true'};
		transient String[] creditProfileHistoryDates_type_info = new String[]{'creditProfileHistoryDates','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','dateTime','0','-1','false'};
		transient String[] validFor_type_info = new String[]{'validFor','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','TimePeriod','0','1','true'};
		transient String[] creditRiskRating_type_info = new String[]{'creditRiskRating','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','int','0','1','true'};
		transient String[] creditScore_type_info = new String[]{'creditScore','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','int','0','1','true'};
		transient String[] CustCreditProfileReference_type_info = new String[]{'CustCreditProfileReference','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','ArrayOfCustCreditProfileReference','0','1','false'};
		transient String[] CharacteristicSpecification_type_info = new String[]{'CharacteristicSpecification','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','CharacteristicSpecification','0','-1','false'};
		transient String[] CustomerCreditProfileExtension_type_info = new String[]{'CustomerCreditProfileExtension','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','CustomerCreditProfileExtension','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','true','false'};
		transient String[] field_order_type_info = new String[]{'ID','customerID','creditProfileDate','creditProfileHistoryDates','validFor','creditRiskRating','creditScore','CustCreditProfileReference','CharacteristicSpecification','CustomerCreditProfileExtension'};
	}
	public class CustomerOrder {
		public String purchaseOrderNumber;
		public String customerOrderType;
		public Integer assignedPriority;
		public DateTime dueDate;
		public WS_BPM_BusinessObjects.BusinessInteraction ProductOrder;
		public WS_BPM_BusinessObjects.PartyRole[] OrderPlacedForCustomer;
		public WS_BPM_BusinessObjects.Agreement Agreement;
		public WS_BPM_BusinessObjects.RelatedOrders[] relatedOrders;
		public WS_BPM_BusinessObjects.CustomerOrderItem[] CustomerOrderItem;
		public WS_BPM_BusinessObjects.CustomerOrderExtension CustomerOrderExtension;
		public WS_BPM_BusinessObjects.RelatedOrders[] PartnerRelatedOrders;
		public WS_BPM_BusinessObjects.Appointment[] Appointment;
		public WS_BPM_BusinessObjects.CharacteristicSpecification[] Characteristics;
		transient String[] purchaseOrderNumber_type_info = new String[]{'purchaseOrderNumber','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','false'};
		transient String[] customerOrderType_type_info = new String[]{'customerOrderType','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','false'};
		transient String[] assignedPriority_type_info = new String[]{'assignedPriority','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','int','0','1','false'};
		transient String[] dueDate_type_info = new String[]{'dueDate','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','dateTime','0','1','false'};
		transient String[] ProductOrder_type_info = new String[]{'ProductOrder','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','BusinessInteraction','0','1','false'};
		transient String[] OrderPlacedForCustomer_type_info = new String[]{'OrderPlacedForCustomer','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','PartyRole','0','-1','false'};
		transient String[] Agreement_type_info = new String[]{'Agreement','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','Agreement','0','1','false'};
		transient String[] relatedOrders_type_info = new String[]{'relatedOrders','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','RelatedOrders','0','-1','false'};
		transient String[] CustomerOrderItem_type_info = new String[]{'CustomerOrderItem','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','CustomerOrderItem','0','-1','false'};
		transient String[] CustomerOrderExtension_type_info = new String[]{'CustomerOrderExtension','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','CustomerOrderExtension','0','1','false'};
		transient String[] PartnerRelatedOrders_type_info = new String[]{'PartnerRelatedOrders','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','RelatedOrders','0','-1','false'};
		transient String[] Appointment_type_info = new String[]{'Appointment','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','Appointment','0','-1','false'};
		transient String[] Characteristics_type_info = new String[]{'Characteristics','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','CharacteristicSpecification','0','-1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','true','false'};
		transient String[] field_order_type_info = new String[]{'purchaseOrderNumber','customerOrderType','assignedPriority','dueDate','ProductOrder','OrderPlacedForCustomer','Agreement','relatedOrders','CustomerOrderItem','CustomerOrderExtension','PartnerRelatedOrders','Appointment','Characteristics'};
	}
	public class CustomerOrderItem {
		public WS_BPM_BusinessObjects.BusinessInteractionItem[] BusinessInteractionItem;
		public String orderLineNumber;
		public String chargeType;
		public String prorateCode;
		public Boolean isTaxable;
		public String overrideReason;
		public String overrideCode;
		public String processingDirection;
		public String shippingMethod;
		transient String[] BusinessInteractionItem_type_info = new String[]{'BusinessInteractionItem','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','BusinessInteractionItem','0','-1','false'};
		transient String[] orderLineNumber_type_info = new String[]{'orderLineNumber','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','false'};
		transient String[] chargeType_type_info = new String[]{'chargeType','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','false'};
		transient String[] prorateCode_type_info = new String[]{'prorateCode','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','false'};
		transient String[] isTaxable_type_info = new String[]{'isTaxable','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','boolean','0','1','false'};
		transient String[] overrideReason_type_info = new String[]{'overrideReason','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','false'};
		transient String[] overrideCode_type_info = new String[]{'overrideCode','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','false'};
		transient String[] processingDirection_type_info = new String[]{'processingDirection','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','false'};
		transient String[] shippingMethod_type_info = new String[]{'shippingMethod','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','true','false'};
		transient String[] field_order_type_info = new String[]{'BusinessInteractionItem','orderLineNumber','chargeType','prorateCode','isTaxable','overrideReason','overrideCode','processingDirection','shippingMethod'};
	}
	public class CustomerPayment {
		public WS_BPM_BusinessObjects.Money amount;
		public DateTime paymentDate;
		public WS_BPM_BusinessObjects.Money remainingAmount;
		public WS_BPM_BusinessObjects.ArrayOfPaymentPlan PaymentPlan;
		public WS_BPM_BusinessObjects.CustomerPaymentHistory PaymentHistory;
		public WS_BPM_BusinessObjects.ThirdPartyPayeeAgency ThirdPartyPayeeAgency;
		public WS_BPM_BusinessObjects.CustomerPaymentExtension CustomerPaymentExtension;
		public WS_BPM_BusinessObjects.IBMTelecomRootObject ID;
		public WS_BPM_BusinessObjects.CharacteristicSpecification[] CharacteristicSpecification;
		transient String[] amount_type_info = new String[]{'amount','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','Money','0','1','false'};
		transient String[] paymentDate_type_info = new String[]{'paymentDate','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','dateTime','0','1','false'};
		transient String[] remainingAmount_type_info = new String[]{'remainingAmount','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','Money','0','1','false'};
		transient String[] PaymentPlan_type_info = new String[]{'PaymentPlan','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','ArrayOfPaymentPlan','0','1','false'};
		transient String[] PaymentHistory_type_info = new String[]{'PaymentHistory','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','CustomerPaymentHistory','0','1','false'};
		transient String[] ThirdPartyPayeeAgency_type_info = new String[]{'ThirdPartyPayeeAgency','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','ThirdPartyPayeeAgency','0','1','false'};
		transient String[] CustomerPaymentExtension_type_info = new String[]{'CustomerPaymentExtension','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','CustomerPaymentExtension','0','1','false'};
		transient String[] ID_type_info = new String[]{'ID','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','IBMTelecomRootObject','0','1','false'};
		transient String[] CharacteristicSpecification_type_info = new String[]{'CharacteristicSpecification','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','CharacteristicSpecification','0','-1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','true','false'};
		transient String[] field_order_type_info = new String[]{'amount','paymentDate','remainingAmount','PaymentPlan','PaymentHistory','ThirdPartyPayeeAgency','CustomerPaymentExtension','ID','CharacteristicSpecification'};
	}
	public class CustomerPaymentHistory {
		public WS_BPM_BusinessObjects.Money amount;
		public DateTime paymentDate;
		public String paymentIdentifier;
		public String paymentMethod;
		public String paymentNotes;
		public WS_BPM_BusinessObjects.IBMTelecomRootObject ID;
		public WS_BPM_BusinessObjects.CharacteristicSpecification Characteristics;
		transient String[] amount_type_info = new String[]{'amount','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','Money','0','1','false'};
		transient String[] paymentDate_type_info = new String[]{'paymentDate','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','dateTime','0','1','false'};
		transient String[] paymentIdentifier_type_info = new String[]{'paymentIdentifier','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','false'};
		transient String[] paymentMethod_type_info = new String[]{'paymentMethod','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','false'};
		transient String[] paymentNotes_type_info = new String[]{'paymentNotes','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','false'};
		transient String[] ID_type_info = new String[]{'ID','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','IBMTelecomRootObject','0','1','false'};
		transient String[] Characteristics_type_info = new String[]{'Characteristics','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','CharacteristicSpecification','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','true','false'};
		transient String[] field_order_type_info = new String[]{'amount','paymentDate','paymentIdentifier','paymentMethod','paymentNotes','ID','Characteristics'};
	}
	public class CustomerTreatmentProfile {
		public DateTime writtenOffDate;
		public String collectionAgency;
		public DateTime lastUpdateDate;
		public String lastUpdateBy;
		public String pointsSinceLastPromotion;
		public DateTime lastStatusChangeDate;
		public String pointsWithinPromotionPeriod;
		public DateTime promotionPeriodStartDate;
		public WS_BPM_BusinessObjects.CurrentTreatmentStatus CurrentTreatmentStatus;
		transient String[] writtenOffDate_type_info = new String[]{'writtenOffDate','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','dateTime','0','1','false'};
		transient String[] collectionAgency_type_info = new String[]{'collectionAgency','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','false'};
		transient String[] lastUpdateDate_type_info = new String[]{'lastUpdateDate','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','dateTime','0','1','false'};
		transient String[] lastUpdateBy_type_info = new String[]{'lastUpdateBy','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','false'};
		transient String[] pointsSinceLastPromotion_type_info = new String[]{'pointsSinceLastPromotion','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','false'};
		transient String[] lastStatusChangeDate_type_info = new String[]{'lastStatusChangeDate','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','dateTime','0','1','false'};
		transient String[] pointsWithinPromotionPeriod_type_info = new String[]{'pointsWithinPromotionPeriod','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','false'};
		transient String[] promotionPeriodStartDate_type_info = new String[]{'promotionPeriodStartDate','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','dateTime','0','1','false'};
		transient String[] CurrentTreatmentStatus_type_info = new String[]{'CurrentTreatmentStatus','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','CurrentTreatmentStatus','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','true','false'};
		transient String[] field_order_type_info = new String[]{'writtenOffDate','collectionAgency','lastUpdateDate','lastUpdateBy','pointsSinceLastPromotion','lastStatusChangeDate','pointsWithinPromotionPeriod','promotionPeriodStartDate','CurrentTreatmentStatus'};
	}
	public class DeferredPaymentArrangement {
		public WS_BPM_BusinessObjects.Money TotalDeferredAmount;
		public WS_BPM_BusinessObjects.Money RemainingDeferredAmount;
		public String numberOfInstallments;
		public String remainingNumberOfInstallments;
		public WS_BPM_BusinessObjects.Money FirstMonthInstallmentAmount;
		public WS_BPM_BusinessObjects.Money AdditionalMonthInstallmentAmount;
		public String deferredPaymentArrangmentDescription;
		public String closedBy;
		public DateTime closedDate;
		public WS_BPM_BusinessObjects.AccountsReceivable AccountsReceivable;
		transient String[] TotalDeferredAmount_type_info = new String[]{'TotalDeferredAmount','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','Money','0','1','false'};
		transient String[] RemainingDeferredAmount_type_info = new String[]{'RemainingDeferredAmount','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','Money','0','1','false'};
		transient String[] numberOfInstallments_type_info = new String[]{'numberOfInstallments','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','false'};
		transient String[] remainingNumberOfInstallments_type_info = new String[]{'remainingNumberOfInstallments','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','false'};
		transient String[] FirstMonthInstallmentAmount_type_info = new String[]{'FirstMonthInstallmentAmount','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','Money','0','1','false'};
		transient String[] AdditionalMonthInstallmentAmount_type_info = new String[]{'AdditionalMonthInstallmentAmount','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','Money','0','1','false'};
		transient String[] deferredPaymentArrangmentDescription_type_info = new String[]{'deferredPaymentArrangmentDescription','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','false'};
		transient String[] closedBy_type_info = new String[]{'closedBy','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','false'};
		transient String[] closedDate_type_info = new String[]{'closedDate','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','dateTime','0','1','false'};
		transient String[] AccountsReceivable_type_info = new String[]{'AccountsReceivable','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','AccountsReceivable','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','true','false'};
		transient String[] field_order_type_info = new String[]{'TotalDeferredAmount','RemainingDeferredAmount','numberOfInstallments','remainingNumberOfInstallments','FirstMonthInstallmentAmount','AdditionalMonthInstallmentAmount','deferredPaymentArrangmentDescription','closedBy','closedDate','AccountsReceivable'};
	}
	public class DirectDepositPM {
		public String depositTransactionID;
		public WS_BPM_BusinessObjects.Money depositAmount;
		public DateTime depositDateTime;
		public String exchangeID;
		public String frequency;
		transient String[] depositTransactionID_type_info = new String[]{'depositTransactionID','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','false'};
		transient String[] depositAmount_type_info = new String[]{'depositAmount','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','Money','0','1','false'};
		transient String[] depositDateTime_type_info = new String[]{'depositDateTime','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','dateTime','0','1','false'};
		transient String[] exchangeID_type_info = new String[]{'exchangeID','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','false'};
		transient String[] frequency_type_info = new String[]{'frequency','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','true','false'};
		transient String[] field_order_type_info = new String[]{'depositTransactionID','depositAmount','depositDateTime','exchangeID','frequency'};
	}
	public class LogicalResource {
		public String status;
		public String serviceState;
		public Boolean isOperational;
		public String networkVCI;
		public String networkVPI;
		public String subscriberVPI;
		public String subscriberVCI;
		public String managementIP;
		public String managementIPV6;
		public String terminationPoint;
		public WS_BPM_BusinessObjects.CharacteristicSpecification[] LogicalResourceCharacteristicValues;
		public WS_BPM_BusinessObjects.PhysicalResource[] PhysicalResources;
		public WS_BPM_BusinessObjects.LogicalResourceExtension LogicalResourceExtension;
		public WS_BPM_BusinessObjects.IBMTelecomRootObject ID;
		public WS_BPM_BusinessObjects.LogicalResource[] LogicalResources;
		transient String[] status_type_info = new String[]{'status','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','false'};
		transient String[] serviceState_type_info = new String[]{'serviceState','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','false'};
		transient String[] isOperational_type_info = new String[]{'isOperational','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','boolean','0','1','false'};
		transient String[] networkVCI_type_info = new String[]{'networkVCI','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','false'};
		transient String[] networkVPI_type_info = new String[]{'networkVPI','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','false'};
		transient String[] subscriberVPI_type_info = new String[]{'subscriberVPI','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','false'};
		transient String[] subscriberVCI_type_info = new String[]{'subscriberVCI','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','false'};
		transient String[] managementIP_type_info = new String[]{'managementIP','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','false'};
		transient String[] managementIPV6_type_info = new String[]{'managementIPV6','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','false'};
		transient String[] terminationPoint_type_info = new String[]{'terminationPoint','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','false'};
		transient String[] LogicalResourceCharacteristicValues_type_info = new String[]{'LogicalResourceCharacteristicValues','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','CharacteristicSpecification','0','-1','false'};
		transient String[] PhysicalResources_type_info = new String[]{'PhysicalResources','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','PhysicalResource','0','-1','false'};
		transient String[] LogicalResourceExtension_type_info = new String[]{'LogicalResourceExtension','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','LogicalResourceExtension','0','1','false'};
		transient String[] ID_type_info = new String[]{'ID','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','IBMTelecomRootObject','0','1','false'};
		transient String[] LogicalResources_type_info = new String[]{'LogicalResources','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','LogicalResource','0','-1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','true','false'};
		transient String[] field_order_type_info = new String[]{'status','serviceState','isOperational','networkVCI','networkVPI','subscriberVPI','subscriberVCI','managementIP','managementIPV6','terminationPoint','LogicalResourceCharacteristicValues','PhysicalResources','LogicalResourceExtension','ID','LogicalResources'};
	}
	public class MarketingCampaign {
		public String ID;
		public String name;
		public String description;
		public String mcType;
		public WS_BPM_BusinessObjects.TimePeriod validFor;
		public String status;
		public WS_BPM_BusinessObjects.GeographicAddress GeographicAddress;
		public String[] salesChannel;
		public WS_BPM_BusinessObjects.CharacteristicSpecification[] MarketingCampaignCharacteristicValue;
		transient String[] ID_type_info = new String[]{'ID','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','false'};
		transient String[] name_type_info = new String[]{'name','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','false'};
		transient String[] description_type_info = new String[]{'description','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','false'};
		transient String[] mcType_type_info = new String[]{'mcType','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','false'};
		transient String[] validFor_type_info = new String[]{'validFor','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','TimePeriod','0','1','false'};
		transient String[] status_type_info = new String[]{'status','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','false'};
		transient String[] GeographicAddress_type_info = new String[]{'GeographicAddress','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','GeographicAddress','0','1','false'};
		transient String[] salesChannel_type_info = new String[]{'salesChannel','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','-1','false'};
		transient String[] MarketingCampaignCharacteristicValue_type_info = new String[]{'MarketingCampaignCharacteristicValue','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','CharacteristicSpecification','0','-1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','true','false'};
		transient String[] field_order_type_info = new String[]{'ID','name','description','mcType','validFor','status','GeographicAddress','salesChannel','MarketingCampaignCharacteristicValue'};
	}
	public class Network {
		public String networkAdministrativeState;
		public Boolean isNetworkOperational;
		public String layerRates;
		public WS_BPM_BusinessObjects.PhysicalPort PhysicalPort;
		transient String[] networkAdministrativeState_type_info = new String[]{'networkAdministrativeState','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','false'};
		transient String[] isNetworkOperational_type_info = new String[]{'isNetworkOperational','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','boolean','0','1','false'};
		transient String[] layerRates_type_info = new String[]{'layerRates','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','false'};
		transient String[] PhysicalPort_type_info = new String[]{'PhysicalPort','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','PhysicalPort','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','true','false'};
		transient String[] field_order_type_info = new String[]{'networkAdministrativeState','isNetworkOperational','layerRates','PhysicalPort'};
	}
	public class PaymentMethod {
		public String paymentMethodName;
		public WS_BPM_BusinessObjects.CreditCard CreditCardPM;
		public WS_BPM_BusinessObjects.ThirdPartyCollectionPM ThirdPartyCollectionPM;
		public WS_BPM_BusinessObjects.DirectDepositPM DirectDepositPM;
		public WS_BPM_BusinessObjects.PaymentMethodExtension PaymentMethodExtension;
		transient String[] paymentMethodName_type_info = new String[]{'paymentMethodName','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','false'};
		transient String[] CreditCardPM_type_info = new String[]{'CreditCardPM','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','CreditCard','0','1','false'};
		transient String[] ThirdPartyCollectionPM_type_info = new String[]{'ThirdPartyCollectionPM','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','ThirdPartyCollectionPM','0','1','false'};
		transient String[] DirectDepositPM_type_info = new String[]{'DirectDepositPM','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','DirectDepositPM','0','1','false'};
		transient String[] PaymentMethodExtension_type_info = new String[]{'PaymentMethodExtension','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','PaymentMethodExtension','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','true','false'};
		transient String[] field_order_type_info = new String[]{'paymentMethodName','CreditCardPM','ThirdPartyCollectionPM','DirectDepositPM','PaymentMethodExtension'};
	}
	public class PaymentPlan {
		public String ID;
		public String priority;
		public String status;
		public String paymentPlanType;
		public String paymentRule;
		public Boolean autoPayment;
		public WS_BPM_BusinessObjects.PaymentMethod PaymentMethods;
		public WS_BPM_BusinessObjects.CharacteristicSpecification[] CharacteristicSpecification;
		transient String[] ID_type_info = new String[]{'ID','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','false'};
		transient String[] priority_type_info = new String[]{'priority','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','false'};
		transient String[] status_type_info = new String[]{'status','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','false'};
		transient String[] paymentPlanType_type_info = new String[]{'paymentPlanType','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','false'};
		transient String[] paymentRule_type_info = new String[]{'paymentRule','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','false'};
		transient String[] autoPayment_type_info = new String[]{'autoPayment','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','boolean','0','1','false'};
		transient String[] PaymentMethods_type_info = new String[]{'PaymentMethods','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','PaymentMethod','0','1','false'};
		transient String[] CharacteristicSpecification_type_info = new String[]{'CharacteristicSpecification','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','CharacteristicSpecification','0','-1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','true','false'};
		transient String[] field_order_type_info = new String[]{'ID','priority','status','paymentPlanType','paymentRule','autoPayment','PaymentMethods','CharacteristicSpecification'};
	}
	public class PhysicalPort {
		public String customerInterfaceNumber;
		public String status;
		public Boolean hasCarrierDetect;
		public Boolean hasDataLink;
		public Boolean isInterfaceEnabled;
		public String vendorInterfaceNumber;
		public String protocol;
		public String ifType;
		public String portNumber;
		public String typeOfPort;
		public Integer duplexMode;
		public String cardMaxBandwidth;
		public String chassisType;
		public String rackHeight;
		public String typeOfRack;
		public String vendorPortName;
		public String circuitID;
		public WS_BPM_BusinessObjects.PhysicalPortExtension PhysicalPortExtension;
		transient String[] customerInterfaceNumber_type_info = new String[]{'customerInterfaceNumber','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','false'};
		transient String[] status_type_info = new String[]{'status','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','false'};
		transient String[] hasCarrierDetect_type_info = new String[]{'hasCarrierDetect','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','boolean','0','1','false'};
		transient String[] hasDataLink_type_info = new String[]{'hasDataLink','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','boolean','0','1','false'};
		transient String[] isInterfaceEnabled_type_info = new String[]{'isInterfaceEnabled','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','boolean','0','1','false'};
		transient String[] vendorInterfaceNumber_type_info = new String[]{'vendorInterfaceNumber','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','false'};
		transient String[] protocol_type_info = new String[]{'protocol','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','false'};
		transient String[] ifType_type_info = new String[]{'ifType','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','false'};
		transient String[] portNumber_type_info = new String[]{'portNumber','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','false'};
		transient String[] typeOfPort_type_info = new String[]{'typeOfPort','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','false'};
		transient String[] duplexMode_type_info = new String[]{'duplexMode','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','int','0','1','false'};
		transient String[] cardMaxBandwidth_type_info = new String[]{'cardMaxBandwidth','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','false'};
		transient String[] chassisType_type_info = new String[]{'chassisType','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','false'};
		transient String[] rackHeight_type_info = new String[]{'rackHeight','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','false'};
		transient String[] typeOfRack_type_info = new String[]{'typeOfRack','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','false'};
		transient String[] vendorPortName_type_info = new String[]{'vendorPortName','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','false'};
		transient String[] circuitID_type_info = new String[]{'circuitID','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','false'};
		transient String[] PhysicalPortExtension_type_info = new String[]{'PhysicalPortExtension','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','PhysicalPortExtension','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','true','false'};
		transient String[] field_order_type_info = new String[]{'customerInterfaceNumber','status','hasCarrierDetect','hasDataLink','isInterfaceEnabled','vendorInterfaceNumber','protocol','ifType','portNumber','typeOfPort','duplexMode','cardMaxBandwidth','chassisType','rackHeight','typeOfRack','vendorPortName','circuitID','PhysicalPortExtension'};
	}
	public class PhysicalResource {
		public String ID;
		public String name;
		public DateTime manufactureDate;
		public String otherIdentifier;
		public String serialNumber;
		public String versionNumber;
		public WS_BPM_BusinessObjects.Network Network;
		public WS_BPM_BusinessObjects.CharacteristicSpecification[] PhysicalResourceCharacteristicValues;
		public WS_BPM_BusinessObjects.PhysicalResourceExtension PhysicalResourceExtension;
		transient String[] ID_type_info = new String[]{'ID','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','false'};
		transient String[] name_type_info = new String[]{'name','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','false'};
		transient String[] manufactureDate_type_info = new String[]{'manufactureDate','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','dateTime','0','1','false'};
		transient String[] otherIdentifier_type_info = new String[]{'otherIdentifier','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','false'};
		transient String[] serialNumber_type_info = new String[]{'serialNumber','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','false'};
		transient String[] versionNumber_type_info = new String[]{'versionNumber','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','false'};
		transient String[] Network_type_info = new String[]{'Network','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','Network','0','1','false'};
		transient String[] PhysicalResourceCharacteristicValues_type_info = new String[]{'PhysicalResourceCharacteristicValues','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','CharacteristicSpecification','0','-1','false'};
		transient String[] PhysicalResourceExtension_type_info = new String[]{'PhysicalResourceExtension','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','PhysicalResourceExtension','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','true','false'};
		transient String[] field_order_type_info = new String[]{'ID','name','manufactureDate','otherIdentifier','serialNumber','versionNumber','Network','PhysicalResourceCharacteristicValues','PhysicalResourceExtension'};
	}
	public class ProdPriceAlteration {
		public String priceType;
		public WS_BPM_BusinessObjects.Money price;
		public WS_BPM_BusinessObjects.ProdPriceAlterationExtension ProdPriceAlterationExtension;
		transient String[] priceType_type_info = new String[]{'priceType','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','true'};
		transient String[] price_type_info = new String[]{'price','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','Money','0','1','true'};
		transient String[] ProdPriceAlterationExtension_type_info = new String[]{'ProdPriceAlterationExtension','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','ProdPriceAlterationExtension','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','true','false'};
		transient String[] field_order_type_info = new String[]{'priceType','price','ProdPriceAlterationExtension'};
	}
	public class Product {
		public WS_BPM_BusinessObjects.IBMTelecomRootObject ID;
		public String productSerialNumber;
		public String name;
		public String description;
		public WS_BPM_BusinessObjects.ProductPrice ProductPrice;
		public WS_BPM_BusinessObjects.TimePeriod validFor;
		public String productStatus;
		public String productCategory;
		public WS_BPM_BusinessObjects.CharacteristicSpecification[] ProductAttributes;
		public WS_BPM_BusinessObjects.Specification ProductSpecification;
		public WS_BPM_BusinessObjects.Service[] Services;
		public WS_BPM_BusinessObjects.ProductExtension ProductExtension;
		public WS_BPM_BusinessObjects.Product[] ComponentProducts;
		public WS_BPM_BusinessObjects.PackageExtension PackageExtension;
		transient String[] ID_type_info = new String[]{'ID','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','IBMTelecomRootObject','0','1','false'};
		transient String[] productSerialNumber_type_info = new String[]{'productSerialNumber','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','true'};
		transient String[] name_type_info = new String[]{'name','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','false'};
		transient String[] description_type_info = new String[]{'description','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','true'};
		transient String[] ProductPrice_type_info = new String[]{'ProductPrice','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','ProductPrice','0','1','true'};
		transient String[] validFor_type_info = new String[]{'validFor','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','TimePeriod','0','1','false'};
		transient String[] productStatus_type_info = new String[]{'productStatus','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','false'};
		transient String[] productCategory_type_info = new String[]{'productCategory','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','false'};
		transient String[] ProductAttributes_type_info = new String[]{'ProductAttributes','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','CharacteristicSpecification','0','-1','false'};
		transient String[] ProductSpecification_type_info = new String[]{'ProductSpecification','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','Specification','0','1','false'};
		transient String[] Services_type_info = new String[]{'Services','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','Service','0','-1','false'};
		transient String[] ProductExtension_type_info = new String[]{'ProductExtension','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','ProductExtension','0','1','false'};
		transient String[] ComponentProducts_type_info = new String[]{'ComponentProducts','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','Product','0','-1','false'};
		transient String[] PackageExtension_type_info = new String[]{'PackageExtension','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','PackageExtension','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','true','false'};
		transient String[] field_order_type_info = new String[]{'ID','productSerialNumber','name','description','ProductPrice','validFor','productStatus','productCategory','ProductAttributes','ProductSpecification','Services','ProductExtension','ComponentProducts','PackageExtension'};
	}
	public class ProductOffering {
		public String ID;
		public String name;
		public String description;
		public String status;
		public WS_BPM_BusinessObjects.TimePeriod validFor;
		public WS_BPM_BusinessObjects.Money offeringPrice;
		public String salesChannel;
		public String place;
		public WS_BPM_BusinessObjects.TimePeriod ProductOfferingTerm;
		public WS_BPM_BusinessObjects.ProdPriceAlteration ProdPriceAlteration;
		public WS_BPM_BusinessObjects.Product[] Product;
		public WS_BPM_BusinessObjects.ProductPromotion[] ProductPromotions;
		public WS_BPM_BusinessObjects.ProdOfferPriceCharge[] ProdOfferPriceCharge;
		public WS_BPM_BusinessObjects.CharacteristicSpecification[] CharacteristicSpecification;
		transient String[] ID_type_info = new String[]{'ID','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','true'};
		transient String[] name_type_info = new String[]{'name','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','true'};
		transient String[] description_type_info = new String[]{'description','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','true'};
		transient String[] status_type_info = new String[]{'status','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','true'};
		transient String[] validFor_type_info = new String[]{'validFor','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','TimePeriod','0','1','true'};
		transient String[] offeringPrice_type_info = new String[]{'offeringPrice','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','Money','0','1','true'};
		transient String[] salesChannel_type_info = new String[]{'salesChannel','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','true'};
		transient String[] place_type_info = new String[]{'place','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','true'};
		transient String[] ProductOfferingTerm_type_info = new String[]{'ProductOfferingTerm','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','TimePeriod','0','1','false'};
		transient String[] ProdPriceAlteration_type_info = new String[]{'ProdPriceAlteration','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','ProdPriceAlteration','0','1','true'};
		transient String[] Product_type_info = new String[]{'Product','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','Product','0','-1','false'};
		transient String[] ProductPromotions_type_info = new String[]{'ProductPromotions','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','ProductPromotion','0','-1','false'};
		transient String[] ProdOfferPriceCharge_type_info = new String[]{'ProdOfferPriceCharge','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','ProdOfferPriceCharge','0','-1','false'};
		transient String[] CharacteristicSpecification_type_info = new String[]{'CharacteristicSpecification','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','CharacteristicSpecification','0','-1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','true','false'};
		transient String[] field_order_type_info = new String[]{'ID','name','description','status','validFor','offeringPrice','salesChannel','place','ProductOfferingTerm','ProdPriceAlteration','Product','ProductPromotions','ProdOfferPriceCharge','CharacteristicSpecification'};
	}
	public class ProductPrice {
		public WS_BPM_BusinessObjects.Money regularPrice;
		public WS_BPM_BusinessObjects.Money discountProductPriceWithAlteration;
		public WS_BPM_BusinessObjects.ProdPriceAlteration[] ProdPriceAlteration;
		transient String[] regularPrice_type_info = new String[]{'regularPrice','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','Money','0','1','true'};
		transient String[] discountProductPriceWithAlteration_type_info = new String[]{'discountProductPriceWithAlteration','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','Money','0','1','true'};
		transient String[] ProdPriceAlteration_type_info = new String[]{'ProdPriceAlteration','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','ProdPriceAlteration','0','-1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','true','false'};
		transient String[] field_order_type_info = new String[]{'regularPrice','discountProductPriceWithAlteration','ProdPriceAlteration'};
	}
	public class ProductPromotion {
		public WS_BPM_BusinessObjects.MarketingCampaign MarketingCampaign;
		public WS_BPM_BusinessObjects.ProductPromotionExtension ProductPromotionExtension;
		public WS_BPM_BusinessObjects.IBMTelecomRootObject ID;
		public WS_BPM_BusinessObjects.CharacteristicSpecification[] AdditionalInfo;
		transient String[] MarketingCampaign_type_info = new String[]{'MarketingCampaign','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','MarketingCampaign','0','1','false'};
		transient String[] ProductPromotionExtension_type_info = new String[]{'ProductPromotionExtension','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','ProductPromotionExtension','0','1','false'};
		transient String[] ID_type_info = new String[]{'ID','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','IBMTelecomRootObject','0','1','false'};
		transient String[] AdditionalInfo_type_info = new String[]{'AdditionalInfo','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','CharacteristicSpecification','0','-1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','true','false'};
		transient String[] field_order_type_info = new String[]{'MarketingCampaign','ProductPromotionExtension','ID','AdditionalInfo'};
	}
	public class RelatedOrders {
		public String orderNumber;
		public String orderType;
		public String orderDate;
		public String orderStatus;
		public String description;
		public WS_BPM_BusinessObjects.RelatedOrdersExtension RelatedOrdersExtension;
		public WS_BPM_BusinessObjects.CharacteristicSpecification[] CharacteristicSpecification;
		transient String[] orderNumber_type_info = new String[]{'orderNumber','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','false'};
		transient String[] orderType_type_info = new String[]{'orderType','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','false'};
		transient String[] orderDate_type_info = new String[]{'orderDate','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','false'};
		transient String[] orderStatus_type_info = new String[]{'orderStatus','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','false'};
		transient String[] description_type_info = new String[]{'description','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','false'};
		transient String[] RelatedOrdersExtension_type_info = new String[]{'RelatedOrdersExtension','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','RelatedOrdersExtension','0','1','false'};
		transient String[] CharacteristicSpecification_type_info = new String[]{'CharacteristicSpecification','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','CharacteristicSpecification','0','-1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','true','false'};
		transient String[] field_order_type_info = new String[]{'orderNumber','orderType','orderDate','orderStatus','description','RelatedOrdersExtension','CharacteristicSpecification'};
	}
	public class Resource {
		public WS_BPM_BusinessObjects.IBMTelecomRootObject ResourceIdentification;
		public WS_BPM_BusinessObjects.Place ResourceLocation;
		public WS_BPM_BusinessObjects.CharacteristicSpecification[] ResourceDescribedBy;
		public String productIdentifer;
		public String usageState;
		public WS_BPM_BusinessObjects.ResourceFacingService[] ResourceFacingServices;
		public WS_BPM_BusinessObjects.ResourceExtension ResourceExtension;
		public WS_BPM_BusinessObjects.BusinessInteraction BusinessInteraction;
		transient String[] ResourceIdentification_type_info = new String[]{'ResourceIdentification','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','IBMTelecomRootObject','0','1','true'};
		transient String[] ResourceLocation_type_info = new String[]{'ResourceLocation','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','Place','0','1','true'};
		transient String[] ResourceDescribedBy_type_info = new String[]{'ResourceDescribedBy','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','CharacteristicSpecification','0','-1','true'};
		transient String[] productIdentifer_type_info = new String[]{'productIdentifer','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','true'};
		transient String[] usageState_type_info = new String[]{'usageState','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','true'};
		transient String[] ResourceFacingServices_type_info = new String[]{'ResourceFacingServices','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','ResourceFacingService','0','-1','false'};
		transient String[] ResourceExtension_type_info = new String[]{'ResourceExtension','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','ResourceExtension','0','1','false'};
		transient String[] BusinessInteraction_type_info = new String[]{'BusinessInteraction','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','BusinessInteraction','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','true','false'};
		transient String[] field_order_type_info = new String[]{'ResourceIdentification','ResourceLocation','ResourceDescribedBy','productIdentifer','usageState','ResourceFacingServices','ResourceExtension','BusinessInteraction'};
	}
	public class ResourceFacingService {
		public WS_BPM_BusinessObjects.LogicalResource[] logicalResource;
		public WS_BPM_BusinessObjects.PhysicalResource[] physicalResource;
		public WS_BPM_BusinessObjects.IBMTelecomRootObject ResourceFacingServiceId;
		public WS_BPM_BusinessObjects.CharacteristicSpecification[] CharacteristicSpecification;
		public WS_BPM_BusinessObjects.ResourceFacingServiceExtension ResourceFacingServiceExtension;
		transient String[] logicalResource_type_info = new String[]{'logicalResource','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','LogicalResource','0','-1','true'};
		transient String[] physicalResource_type_info = new String[]{'physicalResource','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','PhysicalResource','0','-1','true'};
		transient String[] ResourceFacingServiceId_type_info = new String[]{'ResourceFacingServiceId','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','IBMTelecomRootObject','0','1','false'};
		transient String[] CharacteristicSpecification_type_info = new String[]{'CharacteristicSpecification','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','CharacteristicSpecification','0','-1','false'};
		transient String[] ResourceFacingServiceExtension_type_info = new String[]{'ResourceFacingServiceExtension','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','ResourceFacingServiceExtension','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','true','false'};
		transient String[] field_order_type_info = new String[]{'logicalResource','physicalResource','ResourceFacingServiceId','CharacteristicSpecification','ResourceFacingServiceExtension'};
	}
	public class ResourceOrder {
		public String resourceOrderNumber;
		public DateTime dueDate;
		public WS_BPM_BusinessObjects.Resource ResourceOrderDetails;
		public WS_BPM_BusinessObjects.BusinessInteraction BusinessInteraction;
		transient String[] resourceOrderNumber_type_info = new String[]{'resourceOrderNumber','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','true'};
		transient String[] dueDate_type_info = new String[]{'dueDate','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','dateTime','0','1','true'};
		transient String[] ResourceOrderDetails_type_info = new String[]{'ResourceOrderDetails','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','Resource','0','1','true'};
		transient String[] BusinessInteraction_type_info = new String[]{'BusinessInteraction','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','BusinessInteraction','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','true','false'};
		transient String[] field_order_type_info = new String[]{'resourceOrderNumber','dueDate','ResourceOrderDetails','BusinessInteraction'};
	}
	
	public class ThirdPartyCollectionPM {
		public String thirdPartyID;
		public String thirdPartyName;
		public String thirdPartyType;
		public DateTime transactionDateTime;
		public WS_BPM_BusinessObjects.ThirdPartyCollectionPMExtension ThirdPartyCollectionPMExtension;
		transient String[] thirdPartyID_type_info = new String[]{'thirdPartyID','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','false'};
		transient String[] thirdPartyName_type_info = new String[]{'thirdPartyName','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','false'};
		transient String[] thirdPartyType_type_info = new String[]{'thirdPartyType','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','false'};
		transient String[] transactionDateTime_type_info = new String[]{'transactionDateTime','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','dateTime','0','1','false'};
		transient String[] ThirdPartyCollectionPMExtension_type_info = new String[]{'ThirdPartyCollectionPMExtension','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','ThirdPartyCollectionPMExtension','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','true','false'};
		transient String[] field_order_type_info = new String[]{'thirdPartyID','thirdPartyName','thirdPartyType','transactionDateTime','ThirdPartyCollectionPMExtension'};
	}
	public class ThirdPartyPayeeAgency {
		public String Name;
		transient String[] Name_type_info = new String[]{'Name','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','true','false'};
		transient String[] field_order_type_info = new String[]{'Name'};
	}
	public class Treatment {
		public WS_BPM_BusinessObjects.BusinessInteraction BusinessInteraction;
		public WS_BPM_BusinessObjects.CharacteristicSpecification[] CharacteristicSpecification;
		public WS_BPM_BusinessObjects.TreatmentDeferredPaymentArrangement TreatmentDeferredPaymentArrangement;
		public WS_BPM_BusinessObjects.TreatmentNoticeWithChargeDetails TreatmentNoticeWithChargeDetails;
		public WS_BPM_BusinessObjects.TreatmentNonSufficientlyFundedCheck TreatmentNonSufficientlyFundedCheck;
		public WS_BPM_BusinessObjects.TreatmentOverride TreatmentOverride;
		public Integer billCycle;
		public String creditRating;
		public String userId;
		transient String[] BusinessInteraction_type_info = new String[]{'BusinessInteraction','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','BusinessInteraction','0','1','false'};
		transient String[] CharacteristicSpecification_type_info = new String[]{'CharacteristicSpecification','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','CharacteristicSpecification','0','-1','false'};
		transient String[] TreatmentDeferredPaymentArrangement_type_info = new String[]{'TreatmentDeferredPaymentArrangement','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','TreatmentDeferredPaymentArrangement','0','1','false'};
		transient String[] TreatmentNoticeWithChargeDetails_type_info = new String[]{'TreatmentNoticeWithChargeDetails','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','TreatmentNoticeWithChargeDetails','0','1','false'};
		transient String[] TreatmentNonSufficientlyFundedCheck_type_info = new String[]{'TreatmentNonSufficientlyFundedCheck','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','TreatmentNonSufficientlyFundedCheck','0','1','false'};
		transient String[] TreatmentOverride_type_info = new String[]{'TreatmentOverride','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','TreatmentOverride','0','1','false'};
		transient String[] billCycle_type_info = new String[]{'billCycle','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','int','0','1','false'};
		transient String[] creditRating_type_info = new String[]{'creditRating','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','false'};
		transient String[] userId_type_info = new String[]{'userId','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','true','false'};
		transient String[] field_order_type_info = new String[]{'BusinessInteraction','CharacteristicSpecification','TreatmentDeferredPaymentArrangement','TreatmentNoticeWithChargeDetails','TreatmentNonSufficientlyFundedCheck','TreatmentOverride','billCycle','creditRating','userId'};
	}
	public class TreatmentDeferredPaymentArrangement {
		public WS_BPM_BusinessObjects.DeferredPaymentArrangement[] DeferredPaymentArrangement;
		transient String[] DeferredPaymentArrangement_type_info = new String[]{'DeferredPaymentArrangement','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','DeferredPaymentArrangement','0','-1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','true','false'};
		transient String[] field_order_type_info = new String[]{'DeferredPaymentArrangement'};
	}
	public class TreatmentNonSufficientlyFundedCheck {
		public DateTime checkPostDate;
		public String checkNumber;
		public String bankDepositID;
		transient String[] checkPostDate_type_info = new String[]{'checkPostDate','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','dateTime','0','1','false'};
		transient String[] checkNumber_type_info = new String[]{'checkNumber','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','false'};
		transient String[] bankDepositID_type_info = new String[]{'bankDepositID','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','string','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','true','false'};
		transient String[] field_order_type_info = new String[]{'checkPostDate','checkNumber','bankDepositID'};
	}
	public class TreatmentNoticeWithChargeDetails {
		public WS_BPM_BusinessObjects.Money DetailAmount;
		public WS_BPM_BusinessObjects.AccountsReceivable AccountsReceivable;
		transient String[] DetailAmount_type_info = new String[]{'DetailAmount','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','Money','0','1','false'};
		transient String[] AccountsReceivable_type_info = new String[]{'AccountsReceivable','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','AccountsReceivable','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','true','false'};
		transient String[] field_order_type_info = new String[]{'DetailAmount','AccountsReceivable'};
	}
	public class TreatmentOverride {
		public WS_BPM_BusinessObjects.Money MinimumReminderAmount;
		public WS_BPM_BusinessObjects.Money MinimumDisconnectAmount;
		transient String[] MinimumReminderAmount_type_info = new String[]{'MinimumReminderAmount','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','Money','0','1','false'};
		transient String[] MinimumDisconnectAmount_type_info = new String[]{'MinimumDisconnectAmount','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','Money','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','true','false'};
		transient String[] field_order_type_info = new String[]{'MinimumReminderAmount','MinimumDisconnectAmount'};
	}
	public class TreatmentProfile {
		public WS_BPM_BusinessObjects.CustomerTreatmentProfile CustomerTreatmentProfile;
		public WS_BPM_BusinessObjects.Treatment[] Treatment;
		public WS_BPM_BusinessObjects.AccountId AccountId;
		transient String[] CustomerTreatmentProfile_type_info = new String[]{'CustomerTreatmentProfile','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','CustomerTreatmentProfile','0','1','false'};
		transient String[] Treatment_type_info = new String[]{'Treatment','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','Treatment','0','-1','false'};
		transient String[] AccountId_type_info = new String[]{'AccountId','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','AccountId','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/systemview','true','false'};
		transient String[] field_order_type_info = new String[]{'CustomerTreatmentProfile','Treatment','AccountId'};
	}

	public class AccountId {
		public String accountNumber;
		public WS_BPM_BusinessObjects.PhoneAsId PhoneAsId;
		public String universalServiceId;
		public WS_BPM_BusinessObjects.CharacteristicSpecification[] CharacteristicSpecification;
		transient String[] accountNumber_type_info = new String[]{'accountNumber','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] PhoneAsId_type_info = new String[]{'PhoneAsId','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','PhoneAsId','0','1','false'};
		transient String[] universalServiceId_type_info = new String[]{'universalServiceId','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] CharacteristicSpecification_type_info = new String[]{'CharacteristicSpecification','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','CharacteristicSpecification','0','-1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','true','false'};
		transient String[] field_order_type_info = new String[]{'accountNumber','PhoneAsId','universalServiceId','CharacteristicSpecification'};
	}
	public class AmountEntity {
		public String id;
		public String name;
		public WS_BPM_BusinessObjects.Money Amount;
		public String type_x;
		public WS_BPM_BusinessObjects.CharacteristicSpecification[] CharacteristicSpecification;
		public WS_BPM_BusinessObjects.AmountEntity NestedEntity;
		transient String[] id_type_info = new String[]{'id','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] name_type_info = new String[]{'name','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] Amount_type_info = new String[]{'Amount','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','Money','0','1','false'};
		transient String[] type_x_type_info = new String[]{'type','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] CharacteristicSpecification_type_info = new String[]{'CharacteristicSpecification','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','CharacteristicSpecification','0','-1','false'};
		transient String[] NestedEntity_type_info = new String[]{'NestedEntity','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','AmountEntity','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','true','false'};
		transient String[] field_order_type_info = new String[]{'id','name','Amount','type_x','CharacteristicSpecification','NestedEntity'};
	}
	public class BalanceAmount {
		public WS_BPM_BusinessObjects.Money TotalAmount;
		public WS_BPM_BusinessObjects.Money InstallmentAmount;
		public WS_BPM_BusinessObjects.Money RevolvingAmount;
		public WS_BPM_BusinessObjects.Money ClosedWithBalanceAmount;
		transient String[] TotalAmount_type_info = new String[]{'TotalAmount','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','Money','0','1','false'};
		transient String[] InstallmentAmount_type_info = new String[]{'InstallmentAmount','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','Money','0','1','false'};
		transient String[] RevolvingAmount_type_info = new String[]{'RevolvingAmount','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','Money','0','1','false'};
		transient String[] ClosedWithBalanceAmount_type_info = new String[]{'ClosedWithBalanceAmount','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','Money','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','true','false'};
		transient String[] field_order_type_info = new String[]{'TotalAmount','InstallmentAmount','RevolvingAmount','ClosedWithBalanceAmount'};
	}
	public class BridgeTap {
		public WS_BPM_BusinessObjects.GaugeSegment[] GaugeSegment;
		public WS_BPM_BusinessObjects.NetworkLocation NetworkLocation;
		transient String[] GaugeSegment_type_info = new String[]{'GaugeSegment','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','GaugeSegment','0','-1','false'};
		transient String[] NetworkLocation_type_info = new String[]{'NetworkLocation','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','NetworkLocation','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','true','false'};
		transient String[] field_order_type_info = new String[]{'GaugeSegment','NetworkLocation'};
	}
	public class Cable {
		public String id;
		public String pair;
		transient String[] id_type_info = new String[]{'id','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] pair_type_info = new String[]{'pair','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','true','false'};
		transient String[] field_order_type_info = new String[]{'id','pair'};
	}
	public class CalendarEntry {
		public String id;
		public String status;
		public DateTime creationDate;
		public String comment;
		transient String[] id_type_info = new String[]{'id','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] status_type_info = new String[]{'status','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] creationDate_type_info = new String[]{'creationDate','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','dateTime','0','1','false'};
		transient String[] comment_type_info = new String[]{'comment','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','true','false'};
		transient String[] field_order_type_info = new String[]{'id','status','creationDate','comment'};
	}
	public class CallDetail {
		public WS_BPM_BusinessObjects.IBMTelecomRootObject ID;
		public DateTime callDateTime;
		public WS_BPM_BusinessObjects.AccountId Source;
		public WS_BPM_BusinessObjects.AccountId Target;
		public WS_BPM_BusinessObjects.AccountId MemberAccount;
		public WS_BPM_BusinessObjects.Quantity VoiceCallBillableDuration;
		public WS_BPM_BusinessObjects.GeographicAddress FromVoiceCallLocation;
		public WS_BPM_BusinessObjects.GeographicAddress ToVoiceCallLocation;
		public WS_BPM_BusinessObjects.Money UsageCharge;
		public WS_BPM_BusinessObjects.Money AdjustedChargeAmount;
		public String emrIndicator;
		public String callInvestigationStatus;
		public String rateClass;
		public String messageType;
		public String ratePeriod;
		public Boolean splitCallFlag;
		public WS_BPM_BusinessObjects.CodeDescription CallingPlanCode;
		public String recordId;
		public String interExchangeCarrierId;
		public String printExclusionIndicator;
		public WS_BPM_BusinessObjects.Money OriginalCharge;
		public WS_BPM_BusinessObjects.CharacteristicSpecification[] Characteristics;
		public String memberSequenceNumber;
		public WS_BPM_BusinessObjects.Tax ApplicableTax;
		transient String[] ID_type_info = new String[]{'ID','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','IBMTelecomRootObject','0','1','false'};
		transient String[] callDateTime_type_info = new String[]{'callDateTime','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','dateTime','0','1','false'};
		transient String[] Source_type_info = new String[]{'Source','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','AccountId','0','1','false'};
		transient String[] Target_type_info = new String[]{'Target','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','AccountId','0','1','false'};
		transient String[] MemberAccount_type_info = new String[]{'MemberAccount','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','AccountId','0','1','false'};
		transient String[] VoiceCallBillableDuration_type_info = new String[]{'VoiceCallBillableDuration','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','Quantity','0','1','false'};
		transient String[] FromVoiceCallLocation_type_info = new String[]{'FromVoiceCallLocation','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','GeographicAddress','0','1','false'};
		transient String[] ToVoiceCallLocation_type_info = new String[]{'ToVoiceCallLocation','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','GeographicAddress','0','1','false'};
		transient String[] UsageCharge_type_info = new String[]{'UsageCharge','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','Money','0','1','false'};
		transient String[] AdjustedChargeAmount_type_info = new String[]{'AdjustedChargeAmount','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','Money','0','1','false'};
		transient String[] emrIndicator_type_info = new String[]{'emrIndicator','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] callInvestigationStatus_type_info = new String[]{'callInvestigationStatus','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] rateClass_type_info = new String[]{'rateClass','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] messageType_type_info = new String[]{'messageType','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] ratePeriod_type_info = new String[]{'ratePeriod','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] splitCallFlag_type_info = new String[]{'splitCallFlag','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','boolean','0','1','false'};
		transient String[] CallingPlanCode_type_info = new String[]{'CallingPlanCode','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','CodeDescription','0','1','false'};
		transient String[] recordId_type_info = new String[]{'recordId','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] interExchangeCarrierId_type_info = new String[]{'interExchangeCarrierId','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] printExclusionIndicator_type_info = new String[]{'printExclusionIndicator','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] OriginalCharge_type_info = new String[]{'OriginalCharge','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','Money','0','1','false'};
		transient String[] Characteristics_type_info = new String[]{'Characteristics','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','CharacteristicSpecification','0','-1','false'};
		transient String[] memberSequenceNumber_type_info = new String[]{'memberSequenceNumber','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] ApplicableTax_type_info = new String[]{'ApplicableTax','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','Tax','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','true','false'};
		transient String[] field_order_type_info = new String[]{'ID','callDateTime','Source','Target','MemberAccount','VoiceCallBillableDuration','FromVoiceCallLocation','ToVoiceCallLocation','UsageCharge','AdjustedChargeAmount','emrIndicator','callInvestigationStatus','rateClass','messageType','ratePeriod','splitCallFlag','CallingPlanCode','recordId','interExchangeCarrierId','printExclusionIndicator','OriginalCharge','Characteristics','memberSequenceNumber','ApplicableTax'};
	}
	public class CallingCard {
		public String billingNumberScreening;
		public String cardCode;
		public String cardNumber;
		public String cardStyle;
		public String carrierCode;
		public String serviceClass;
		public DateTime effectiveDate;
		public WS_BPM_BusinessObjects.CharacteristicSpecification[] CharacteristicValue;
		public String orderCode;
		public String originatingStationEquipment;
		public String outPhoneNumber;
		public String personalIdentificationNumber;
		public String cardQuantity;
		public String status;
		public String saleType;
		public String sequenceNumber;
		public String orderId;
		public String personalIdentificationNumberAction;
		public String callType;
		public String cardType;
		transient String[] billingNumberScreening_type_info = new String[]{'billingNumberScreening','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] cardCode_type_info = new String[]{'cardCode','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] cardNumber_type_info = new String[]{'cardNumber','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] cardStyle_type_info = new String[]{'cardStyle','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] carrierCode_type_info = new String[]{'carrierCode','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] serviceClass_type_info = new String[]{'serviceClass','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] effectiveDate_type_info = new String[]{'effectiveDate','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','dateTime','0','1','false'};
		transient String[] CharacteristicValue_type_info = new String[]{'CharacteristicValue','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','CharacteristicSpecification','0','-1','false'};
		transient String[] orderCode_type_info = new String[]{'orderCode','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] originatingStationEquipment_type_info = new String[]{'originatingStationEquipment','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] outPhoneNumber_type_info = new String[]{'outPhoneNumber','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] personalIdentificationNumber_type_info = new String[]{'personalIdentificationNumber','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] cardQuantity_type_info = new String[]{'cardQuantity','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] status_type_info = new String[]{'status','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] saleType_type_info = new String[]{'saleType','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] sequenceNumber_type_info = new String[]{'sequenceNumber','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] orderId_type_info = new String[]{'orderId','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] personalIdentificationNumberAction_type_info = new String[]{'personalIdentificationNumberAction','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] callType_type_info = new String[]{'callType','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] cardType_type_info = new String[]{'cardType','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','true','false'};
		transient String[] field_order_type_info = new String[]{'billingNumberScreening','cardCode','cardNumber','cardStyle','carrierCode','serviceClass','effectiveDate','CharacteristicValue','orderCode','originatingStationEquipment','outPhoneNumber','personalIdentificationNumber','cardQuantity','status','saleType','sequenceNumber','orderId','personalIdentificationNumberAction','callType','cardType'};
	}
	public class CallingPlan {
		public WS_BPM_BusinessObjects.TimePeriod ValidFor;
		public String toGroup;
		public String taxCode;
		public String toPlace;
		public String toState;
		public String callingPlanCode;
		public String description;
		public String jurisdiction;
		transient String[] ValidFor_type_info = new String[]{'ValidFor','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','TimePeriod','0','1','false'};
		transient String[] toGroup_type_info = new String[]{'toGroup','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] taxCode_type_info = new String[]{'taxCode','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] toPlace_type_info = new String[]{'toPlace','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] toState_type_info = new String[]{'toState','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] callingPlanCode_type_info = new String[]{'callingPlanCode','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] description_type_info = new String[]{'description','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] jurisdiction_type_info = new String[]{'jurisdiction','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','true','false'};
		transient String[] field_order_type_info = new String[]{'ValidFor','toGroup','taxCode','toPlace','toState','callingPlanCode','description','jurisdiction'};
	}
	public class CallSummary {
		public Integer voiceCallCount;
		public WS_BPM_BusinessObjects.Quantity VoiceCallActualDuration;
		public WS_BPM_BusinessObjects.Quantity VoiceCallBillableDuration;
		public DateTime callDateTime;
		public WS_BPM_BusinessObjects.AccountId Source;
		public Boolean voiceCallBilledFlag;
		public String voiceCallServiceUsageType;
		public WS_BPM_BusinessObjects.CharacteristicSpecification[] Characteristics;
		transient String[] voiceCallCount_type_info = new String[]{'voiceCallCount','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','int','0','1','false'};
		transient String[] VoiceCallActualDuration_type_info = new String[]{'VoiceCallActualDuration','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','Quantity','0','1','false'};
		transient String[] VoiceCallBillableDuration_type_info = new String[]{'VoiceCallBillableDuration','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','Quantity','0','1','false'};
		transient String[] callDateTime_type_info = new String[]{'callDateTime','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','dateTime','0','1','false'};
		transient String[] Source_type_info = new String[]{'Source','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','AccountId','0','1','false'};
		transient String[] voiceCallBilledFlag_type_info = new String[]{'voiceCallBilledFlag','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','boolean','0','1','false'};
		transient String[] voiceCallServiceUsageType_type_info = new String[]{'voiceCallServiceUsageType','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] Characteristics_type_info = new String[]{'Characteristics','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','CharacteristicSpecification','0','-1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','true','false'};
		transient String[] field_order_type_info = new String[]{'voiceCallCount','VoiceCallActualDuration','VoiceCallBillableDuration','callDateTime','Source','voiceCallBilledFlag','voiceCallServiceUsageType','Characteristics'};
	}
	public class Connection {
		public String centralOffice;
		public String centralOfficeClliCode;
		public String origination;
		public String remoteOfficeClliCode;
		public String terminalId;
		public String terminalSpeed;
		public WS_BPM_BusinessObjects.Technology[] Technology;
		transient String[] centralOffice_type_info = new String[]{'centralOffice','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] centralOfficeClliCode_type_info = new String[]{'centralOfficeClliCode','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] origination_type_info = new String[]{'origination','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] remoteOfficeClliCode_type_info = new String[]{'remoteOfficeClliCode','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] terminalId_type_info = new String[]{'terminalId','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] terminalSpeed_type_info = new String[]{'terminalSpeed','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] Technology_type_info = new String[]{'Technology','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','Technology','0','-1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','true','false'};
		transient String[] field_order_type_info = new String[]{'centralOffice','centralOfficeClliCode','origination','remoteOfficeClliCode','terminalId','terminalSpeed','Technology'};
	}
	public class CreditLiability {
		public String accountIdentifier;
		public WS_BPM_BusinessObjects.PartyRole[] PartyRole;
		public WS_BPM_BusinessObjects.CharacteristicSpecification[] CharacteristicSpecification;
		public Boolean furtherReviewRequired;
		public DateTime accountClosedDate;
		public DateTime accountOpenedDate;
		public String closedAccountLiabilityReasonCode;
		public DateTime accountPaidDate;
		public DateTime accountStatusDate;
		public WS_BPM_BusinessObjects.Money chargeOffAmount;
		public String collateralDescription;
		public String deferredAccountTerms;
		public Boolean consumerDisputeIndicator;
		public DateTime consumerDisputedDate;
		public Boolean matchedInternatllyFlag;
		public Boolean derogatoryDataIndicator;
		public WS_BPM_BusinessObjects.Money HighBalanceAmount;
		public WS_BPM_BusinessObjects.Money HighCreditAmount;
		public DateTime lastActivityDate;
		public String mannerOfPayment;
		public String lateCount;
		public WS_BPM_BusinessObjects.Money OriginalLoanAmount;
		public WS_BPM_BusinessObjects.Money ActualPaymentAmount;
		public WS_BPM_BusinessObjects.Money ScheduledPaymentAmount;
		public String monthsReviewedCount;
		public WS_BPM_BusinessObjects.Money PastDueAmount;
		public String termsDescription;
		public WS_BPM_BusinessObjects.Money UnpaidBalanceAmount;
		public DateTime accountReportedDate;
		public WS_BPM_BusinessObjects.CodeDescription ServiceTypeCodeDescription;
		transient String[] accountIdentifier_type_info = new String[]{'accountIdentifier','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] PartyRole_type_info = new String[]{'PartyRole','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','PartyRole','0','-1','false'};
		transient String[] CharacteristicSpecification_type_info = new String[]{'CharacteristicSpecification','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','CharacteristicSpecification','0','-1','false'};
		transient String[] furtherReviewRequired_type_info = new String[]{'furtherReviewRequired','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','boolean','0','1','false'};
		transient String[] accountClosedDate_type_info = new String[]{'accountClosedDate','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','dateTime','0','1','false'};
		transient String[] accountOpenedDate_type_info = new String[]{'accountOpenedDate','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','dateTime','0','1','false'};
		transient String[] closedAccountLiabilityReasonCode_type_info = new String[]{'closedAccountLiabilityReasonCode','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] accountPaidDate_type_info = new String[]{'accountPaidDate','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','dateTime','0','1','false'};
		transient String[] accountStatusDate_type_info = new String[]{'accountStatusDate','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','dateTime','0','1','false'};
		transient String[] chargeOffAmount_type_info = new String[]{'chargeOffAmount','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','Money','0','1','false'};
		transient String[] collateralDescription_type_info = new String[]{'collateralDescription','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] deferredAccountTerms_type_info = new String[]{'deferredAccountTerms','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] consumerDisputeIndicator_type_info = new String[]{'consumerDisputeIndicator','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','boolean','0','1','false'};
		transient String[] consumerDisputedDate_type_info = new String[]{'consumerDisputedDate','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','dateTime','0','1','false'};
		transient String[] matchedInternatllyFlag_type_info = new String[]{'matchedInternatllyFlag','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','boolean','0','1','false'};
		transient String[] derogatoryDataIndicator_type_info = new String[]{'derogatoryDataIndicator','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','boolean','0','1','false'};
		transient String[] HighBalanceAmount_type_info = new String[]{'HighBalanceAmount','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','Money','0','1','false'};
		transient String[] HighCreditAmount_type_info = new String[]{'HighCreditAmount','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','Money','0','1','false'};
		transient String[] lastActivityDate_type_info = new String[]{'lastActivityDate','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','dateTime','0','1','false'};
		transient String[] mannerOfPayment_type_info = new String[]{'mannerOfPayment','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] lateCount_type_info = new String[]{'lateCount','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] OriginalLoanAmount_type_info = new String[]{'OriginalLoanAmount','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','Money','0','1','false'};
		transient String[] ActualPaymentAmount_type_info = new String[]{'ActualPaymentAmount','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','Money','0','1','false'};
		transient String[] ScheduledPaymentAmount_type_info = new String[]{'ScheduledPaymentAmount','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','Money','0','1','false'};
		transient String[] monthsReviewedCount_type_info = new String[]{'monthsReviewedCount','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] PastDueAmount_type_info = new String[]{'PastDueAmount','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','Money','0','1','false'};
		transient String[] termsDescription_type_info = new String[]{'termsDescription','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] UnpaidBalanceAmount_type_info = new String[]{'UnpaidBalanceAmount','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','Money','0','1','false'};
		transient String[] accountReportedDate_type_info = new String[]{'accountReportedDate','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','dateTime','0','1','false'};
		transient String[] ServiceTypeCodeDescription_type_info = new String[]{'ServiceTypeCodeDescription','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','CodeDescription','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','true','false'};
		transient String[] field_order_type_info = new String[]{'accountIdentifier','PartyRole','CharacteristicSpecification','furtherReviewRequired','accountClosedDate','accountOpenedDate','closedAccountLiabilityReasonCode','accountPaidDate','accountStatusDate','chargeOffAmount','collateralDescription','deferredAccountTerms','consumerDisputeIndicator','consumerDisputedDate','matchedInternatllyFlag','derogatoryDataIndicator','HighBalanceAmount','HighCreditAmount','lastActivityDate','mannerOfPayment','lateCount','OriginalLoanAmount','ActualPaymentAmount','ScheduledPaymentAmount','monthsReviewedCount','PastDueAmount','termsDescription','UnpaidBalanceAmount','accountReportedDate','ServiceTypeCodeDescription'};
	}
	public class CreditScore {
		public String scoreModel;
		public String scoreValue;
		public Boolean alert;
		public WS_BPM_BusinessObjects.CodeDescription CodeDescriptionPair;
		public WS_BPM_BusinessObjects.CodeDescription ScoreRatingCodeDescription;
		public WS_BPM_BusinessObjects.CodeDescription FactorCodeDescription;
		public WS_BPM_BusinessObjects.InformationalMessage[] InformationalMessages;
		public WS_BPM_BusinessObjects.CharacteristicSpecification[] CharacteristicSpecification;
		transient String[] scoreModel_type_info = new String[]{'scoreModel','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] scoreValue_type_info = new String[]{'scoreValue','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] alert_type_info = new String[]{'alert','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','boolean','0','1','false'};
		transient String[] CodeDescriptionPair_type_info = new String[]{'CodeDescriptionPair','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','CodeDescription','0','1','false'};
		transient String[] ScoreRatingCodeDescription_type_info = new String[]{'ScoreRatingCodeDescription','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','CodeDescription','0','1','false'};
		transient String[] FactorCodeDescription_type_info = new String[]{'FactorCodeDescription','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','CodeDescription','0','1','false'};
		transient String[] InformationalMessages_type_info = new String[]{'InformationalMessages','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','InformationalMessage','0','-1','false'};
		transient String[] CharacteristicSpecification_type_info = new String[]{'CharacteristicSpecification','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','CharacteristicSpecification','0','-1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','true','false'};
		transient String[] field_order_type_info = new String[]{'scoreModel','scoreValue','alert','CodeDescriptionPair','ScoreRatingCodeDescription','FactorCodeDescription','InformationalMessages','CharacteristicSpecification'};
	}
	public class CreditSummary {
		public WS_BPM_BusinessObjects.BalanceAmount BalanceAmount;
		public String closedAccounts;
		public String collectionCount;
		public String collectionsTransferred;
		public String employmentInquiriesCount;
		public String foreignBureauInfo;
		public String inquiriesCount;
		public String installmentAccounts;
		public String mortgageAccounts;
		public DateTime mostRecentTradeDate;
		public String currentDelinquentOrDerogatory;
		public DateTime oldestTradeDate;
		public String openAccounts;
		public String paidAccounts;
		public String periodInquiries;
		public String publicRecords;
		public WS_BPM_BusinessObjects.Money RealEstateBalanceAmount;
		public WS_BPM_BusinessObjects.Money RealEstatePaymentAmount;
		public String revolvingAccounts;
		public String revolvingAvailablePercent;
		public String otherOrTrades;
		public String wasDelinquentOrDerogatory;
		public WS_BPM_BusinessObjects.DelinquencyCounters DelinquencyCounters;
		transient String[] BalanceAmount_type_info = new String[]{'BalanceAmount','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','BalanceAmount','0','1','false'};
		transient String[] closedAccounts_type_info = new String[]{'closedAccounts','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] collectionCount_type_info = new String[]{'collectionCount','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] collectionsTransferred_type_info = new String[]{'collectionsTransferred','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] employmentInquiriesCount_type_info = new String[]{'employmentInquiriesCount','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] foreignBureauInfo_type_info = new String[]{'foreignBureauInfo','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] inquiriesCount_type_info = new String[]{'inquiriesCount','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] installmentAccounts_type_info = new String[]{'installmentAccounts','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] mortgageAccounts_type_info = new String[]{'mortgageAccounts','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] mostRecentTradeDate_type_info = new String[]{'mostRecentTradeDate','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','dateTime','0','1','false'};
		transient String[] currentDelinquentOrDerogatory_type_info = new String[]{'currentDelinquentOrDerogatory','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] oldestTradeDate_type_info = new String[]{'oldestTradeDate','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','dateTime','0','1','false'};
		transient String[] openAccounts_type_info = new String[]{'openAccounts','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] paidAccounts_type_info = new String[]{'paidAccounts','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] periodInquiries_type_info = new String[]{'periodInquiries','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] publicRecords_type_info = new String[]{'publicRecords','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] RealEstateBalanceAmount_type_info = new String[]{'RealEstateBalanceAmount','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','Money','0','1','false'};
		transient String[] RealEstatePaymentAmount_type_info = new String[]{'RealEstatePaymentAmount','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','Money','0','1','false'};
		transient String[] revolvingAccounts_type_info = new String[]{'revolvingAccounts','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] revolvingAvailablePercent_type_info = new String[]{'revolvingAvailablePercent','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] otherOrTrades_type_info = new String[]{'otherOrTrades','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] wasDelinquentOrDerogatory_type_info = new String[]{'wasDelinquentOrDerogatory','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] DelinquencyCounters_type_info = new String[]{'DelinquencyCounters','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','DelinquencyCounters','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','true','false'};
		transient String[] field_order_type_info = new String[]{'BalanceAmount','closedAccounts','collectionCount','collectionsTransferred','employmentInquiriesCount','foreignBureauInfo','inquiriesCount','installmentAccounts','mortgageAccounts','mostRecentTradeDate','currentDelinquentOrDerogatory','oldestTradeDate','openAccounts','paidAccounts','periodInquiries','publicRecords','RealEstateBalanceAmount','RealEstatePaymentAmount','revolvingAccounts','revolvingAvailablePercent','otherOrTrades','wasDelinquentOrDerogatory','DelinquencyCounters'};
	}
	public class CustomerAdjustment {
		public String status;
		public WS_BPM_BusinessObjects.Money AdjustmentAmount;
		public DateTime adjustmentDate;
		public String referenceNumber;
		public String batchId;
		public String batchSequenceNumber;
		public DateTime postDateTime;
		public String postedBy;
		public String adjustmentType;
		public String adjustmentDescription;
		public WS_BPM_BusinessObjects.CodeDescription ChargeCodeDescription;
		public String reasonCode;
		public WS_BPM_BusinessObjects.Money PriorMonthAdjustment;
		public String postingStatus;
		public WS_BPM_BusinessObjects.Tax[] Tax;
		public WS_BPM_BusinessObjects.GLAccount GLAccount;
		public WS_BPM_BusinessObjects.CharacteristicSpecification[] CharacteristicSpecification;
		public String bankName;
		public WS_BPM_BusinessObjects.AccountId BillingAccountId;
		public WS_BPM_BusinessObjects.AccountId MemberAccountId;
		public String parentCaseId;
		public String childCaseId;
		public WS_BPM_BusinessObjects.CustomerAdjustment[] CustomerAdjustmentBeforeUpdate;
		transient String[] status_type_info = new String[]{'status','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] AdjustmentAmount_type_info = new String[]{'AdjustmentAmount','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','Money','0','1','false'};
		transient String[] adjustmentDate_type_info = new String[]{'adjustmentDate','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','dateTime','0','1','false'};
		transient String[] referenceNumber_type_info = new String[]{'referenceNumber','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] batchId_type_info = new String[]{'batchId','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] batchSequenceNumber_type_info = new String[]{'batchSequenceNumber','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] postDateTime_type_info = new String[]{'postDateTime','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','dateTime','0','1','false'};
		transient String[] postedBy_type_info = new String[]{'postedBy','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] adjustmentType_type_info = new String[]{'adjustmentType','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] adjustmentDescription_type_info = new String[]{'adjustmentDescription','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] ChargeCodeDescription_type_info = new String[]{'ChargeCodeDescription','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','CodeDescription','0','1','false'};
		transient String[] reasonCode_type_info = new String[]{'reasonCode','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] PriorMonthAdjustment_type_info = new String[]{'PriorMonthAdjustment','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','Money','0','1','false'};
		transient String[] postingStatus_type_info = new String[]{'postingStatus','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] Tax_type_info = new String[]{'Tax','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','Tax','0','-1','false'};
		transient String[] GLAccount_type_info = new String[]{'GLAccount','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','GLAccount','0','1','false'};
		transient String[] CharacteristicSpecification_type_info = new String[]{'CharacteristicSpecification','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','CharacteristicSpecification','0','-1','false'};
		transient String[] bankName_type_info = new String[]{'bankName','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] BillingAccountId_type_info = new String[]{'BillingAccountId','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','AccountId','0','1','false'};
		transient String[] MemberAccountId_type_info = new String[]{'MemberAccountId','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','AccountId','0','1','false'};
		transient String[] parentCaseId_type_info = new String[]{'parentCaseId','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] childCaseId_type_info = new String[]{'childCaseId','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] CustomerAdjustmentBeforeUpdate_type_info = new String[]{'CustomerAdjustmentBeforeUpdate','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','CustomerAdjustment','0','-1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','true','false'};
		transient String[] field_order_type_info = new String[]{'status','AdjustmentAmount','adjustmentDate','referenceNumber','batchId','batchSequenceNumber','postDateTime','postedBy','adjustmentType','adjustmentDescription','ChargeCodeDescription','reasonCode','PriorMonthAdjustment','postingStatus','Tax','GLAccount','CharacteristicSpecification','bankName','BillingAccountId','MemberAccountId','parentCaseId','childCaseId','CustomerAdjustmentBeforeUpdate'};
	}
	public class DelinquencyCount {
		public String count;
		public String derogatory;
		public String currentNegativeCount;
		public String previousNegativeCount;
		public String previousTimesNegativeCount;
		transient String[] count_type_info = new String[]{'count','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] derogatory_type_info = new String[]{'derogatory','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] currentNegativeCount_type_info = new String[]{'currentNegativeCount','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] previousNegativeCount_type_info = new String[]{'previousNegativeCount','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] previousTimesNegativeCount_type_info = new String[]{'previousTimesNegativeCount','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','true','false'};
		transient String[] field_order_type_info = new String[]{'count','derogatory','currentNegativeCount','previousNegativeCount','previousTimesNegativeCount'};
	}
	public class DelinquencyCounters {
		public WS_BPM_BusinessObjects.DelinquencyCount DelinquencyCount;
		transient String[] DelinquencyCount_type_info = new String[]{'DelinquencyCount','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','DelinquencyCount','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','true','false'};
		transient String[] field_order_type_info = new String[]{'DelinquencyCount'};
	}
	public class Delivery {
		public WS_BPM_BusinessObjects.Quantity DirectoryLabelQuantity;
		public WS_BPM_BusinessObjects.Quantity MidiLabelQuantity;
		public WS_BPM_BusinessObjects.PartyRole[] AlternateAddressPartyRole;
		public String deliveryType;
		transient String[] DirectoryLabelQuantity_type_info = new String[]{'DirectoryLabelQuantity','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','Quantity','0','1','false'};
		transient String[] MidiLabelQuantity_type_info = new String[]{'MidiLabelQuantity','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','Quantity','0','1','false'};
		transient String[] AlternateAddressPartyRole_type_info = new String[]{'AlternateAddressPartyRole','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','PartyRole','0','-1','false'};
		transient String[] deliveryType_type_info = new String[]{'deliveryType','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','true','false'};
		transient String[] field_order_type_info = new String[]{'DirectoryLabelQuantity','MidiLabelQuantity','AlternateAddressPartyRole','deliveryType'};
	}
	public class Directory {
		public WS_BPM_BusinessObjects.Delivery Delivery;
		public WS_BPM_BusinessObjects.Error[] Error;
		public WS_BPM_BusinessObjects.Listing[] Listing;
		public String directoryListingType;
		public String directoryListingAllowance;
		public WS_BPM_BusinessObjects.Quantity AdditionalDirectoryQuantity;
		public WS_BPM_BusinessObjects.Quantity AdditionalMidiQuantity;
		transient String[] Delivery_type_info = new String[]{'Delivery','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','Delivery','0','1','false'};
		transient String[] Error_type_info = new String[]{'Error','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','Error','0','-1','false'};
		transient String[] Listing_type_info = new String[]{'Listing','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','Listing','0','-1','false'};
		transient String[] directoryListingType_type_info = new String[]{'directoryListingType','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] directoryListingAllowance_type_info = new String[]{'directoryListingAllowance','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] AdditionalDirectoryQuantity_type_info = new String[]{'AdditionalDirectoryQuantity','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','Quantity','0','1','false'};
		transient String[] AdditionalMidiQuantity_type_info = new String[]{'AdditionalMidiQuantity','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','Quantity','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','true','false'};
		transient String[] field_order_type_info = new String[]{'Delivery','Error','Listing','directoryListingType','directoryListingAllowance','AdditionalDirectoryQuantity','AdditionalMidiQuantity'};
	}
	public class DistributionPoint {
		public String id;
		public String route;
		transient String[] id_type_info = new String[]{'id','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] route_type_info = new String[]{'route','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','true','false'};
		transient String[] field_order_type_info = new String[]{'id','route'};
	}
	public class EarlyTerminationFee {
		public WS_BPM_BusinessObjects.Money Amount;
		public String contractStatus;
		public DateTime contractTermDate;
		public String promoId;
		public String promoSeq;
		transient String[] Amount_type_info = new String[]{'Amount','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','Money','0','1','false'};
		transient String[] contractStatus_type_info = new String[]{'contractStatus','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] contractTermDate_type_info = new String[]{'contractTermDate','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','dateTime','0','1','false'};
		transient String[] promoId_type_info = new String[]{'promoId','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] promoSeq_type_info = new String[]{'promoSeq','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','true','false'};
		transient String[] field_order_type_info = new String[]{'Amount','contractStatus','contractTermDate','promoId','promoSeq'};
	}
	public class EmailAccount {
		public WS_BPM_BusinessObjects.IBMTelecomRootObject ID;
		public String localPart;
		public String domain;
		public String status;
		public WS_BPM_BusinessObjects.CharacteristicSpecification[] Characteristics;
		transient String[] ID_type_info = new String[]{'ID','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','IBMTelecomRootObject','0','1','false'};
		transient String[] localPart_type_info = new String[]{'localPart','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] domain_type_info = new String[]{'domain','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] status_type_info = new String[]{'status','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] Characteristics_type_info = new String[]{'Characteristics','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','CharacteristicSpecification','0','-1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','true','false'};
		transient String[] field_order_type_info = new String[]{'ID','localPart','domain','status','Characteristics'};
	}
	public class Error {
		public String errorCode;
		public DateTime lastUpdate;
		public String serviceOrderNumber;
		public String status;
		public String yppaBookCode;
		transient String[] errorCode_type_info = new String[]{'errorCode','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] lastUpdate_type_info = new String[]{'lastUpdate','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','dateTime','0','1','false'};
		transient String[] serviceOrderNumber_type_info = new String[]{'serviceOrderNumber','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] status_type_info = new String[]{'status','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] yppaBookCode_type_info = new String[]{'yppaBookCode','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','true','false'};
		transient String[] field_order_type_info = new String[]{'errorCode','lastUpdate','serviceOrderNumber','status','yppaBookCode'};
	}
	public class FraudPrevention {
		public Integer fraudIndexScore;
		public Integer quizAssessmentScore;
		public Integer overallScore;
		public Integer matchAssessmentScore;
		public WS_BPM_BusinessObjects.QuestionAnswer[] QuestionAnswer;
		transient String[] fraudIndexScore_type_info = new String[]{'fraudIndexScore','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','int','0','1','false'};
		transient String[] quizAssessmentScore_type_info = new String[]{'quizAssessmentScore','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','int','0','1','false'};
		transient String[] overallScore_type_info = new String[]{'overallScore','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','int','0','1','false'};
		transient String[] matchAssessmentScore_type_info = new String[]{'matchAssessmentScore','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','int','0','1','false'};
		transient String[] QuestionAnswer_type_info = new String[]{'QuestionAnswer','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','QuestionAnswer','0','-1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','true','false'};
		transient String[] field_order_type_info = new String[]{'fraudIndexScore','quizAssessmentScore','overallScore','matchAssessmentScore','QuestionAnswer'};
	}
	public class GaugeSegment {
		public WS_BPM_BusinessObjects.QuantityDecimal Distance;
		public String code;
		transient String[] Distance_type_info = new String[]{'Distance','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','QuantityDecimal','0','1','false'};
		transient String[] code_type_info = new String[]{'code','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','true','false'};
		transient String[] field_order_type_info = new String[]{'Distance','code'};
	}
	public class GLAccount {
		public String glAccountId;
		public String glAccountName;
		public WS_BPM_BusinessObjects.GLEntity GLEntity;
		public WS_BPM_BusinessObjects.GLAccountingCategory GLAccountingCategory;
		public WS_BPM_BusinessObjects.GLAccountingPresentationEntity GLAccountingPresentationEntity;
		transient String[] glAccountId_type_info = new String[]{'glAccountId','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] glAccountName_type_info = new String[]{'glAccountName','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] GLEntity_type_info = new String[]{'GLEntity','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','GLEntity','0','1','false'};
		transient String[] GLAccountingCategory_type_info = new String[]{'GLAccountingCategory','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','GLAccountingCategory','0','1','false'};
		transient String[] GLAccountingPresentationEntity_type_info = new String[]{'GLAccountingPresentationEntity','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','GLAccountingPresentationEntity','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','true','false'};
		transient String[] field_order_type_info = new String[]{'glAccountId','glAccountName','GLEntity','GLAccountingCategory','GLAccountingPresentationEntity'};
	}
	public class GLAccountingCategory {
		public WS_BPM_BusinessObjects.IBMTelecomRootObject GLAccountingCategoryId;
		public String description;
		transient String[] GLAccountingCategoryId_type_info = new String[]{'GLAccountingCategoryId','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','IBMTelecomRootObject','0','1','false'};
		transient String[] description_type_info = new String[]{'description','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','true','false'};
		transient String[] field_order_type_info = new String[]{'GLAccountingCategoryId','description'};
	}
	public class GLAccountingPresentationEntity {
		public WS_BPM_BusinessObjects.IBMTelecomRootObject ID;
		public String description;
		transient String[] ID_type_info = new String[]{'ID','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','IBMTelecomRootObject','0','1','false'};
		transient String[] description_type_info = new String[]{'description','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','true','false'};
		transient String[] field_order_type_info = new String[]{'ID','description'};
	}
	public class GLEntity {
		public WS_BPM_BusinessObjects.IBMTelecomRootObject GLAccountingEntityId;
		public String glEntityDescription;
		transient String[] GLAccountingEntityId_type_info = new String[]{'GLAccountingEntityId','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','IBMTelecomRootObject','0','1','false'};
		transient String[] glEntityDescription_type_info = new String[]{'glEntityDescription','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','true','false'};
		transient String[] field_order_type_info = new String[]{'GLAccountingEntityId','glEntityDescription'};
	}
	public class GlobalAccount {
		public String name;
		public String number_x;
		transient String[] name_type_info = new String[]{'name','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] number_x_type_info = new String[]{'number','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','true','false'};
		transient String[] field_order_type_info = new String[]{'name','number_x'};
	}
	public class GlobalPosition {
		public String longitude;
		public String latitude;
		public String geoCode;
		transient String[] longitude_type_info = new String[]{'longitude','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] latitude_type_info = new String[]{'latitude','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] geoCode_type_info = new String[]{'geoCode','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','true','false'};
		transient String[] field_order_type_info = new String[]{'longitude','latitude','geoCode'};
	}
	public class History {
		public Boolean isAutoPay;
		public DateTime connectDate;
		public Boolean isInError;
		public DateTime freePaperWindowDate;
		public String lastActionCode;
		public String printConsent;
		public String lastUpdated;
		transient String[] isAutoPay_type_info = new String[]{'isAutoPay','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','boolean','0','1','false'};
		transient String[] connectDate_type_info = new String[]{'connectDate','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','dateTime','0','1','false'};
		transient String[] isInError_type_info = new String[]{'isInError','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','boolean','0','1','false'};
		transient String[] freePaperWindowDate_type_info = new String[]{'freePaperWindowDate','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','dateTime','0','1','false'};
		transient String[] lastActionCode_type_info = new String[]{'lastActionCode','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] printConsent_type_info = new String[]{'printConsent','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] lastUpdated_type_info = new String[]{'lastUpdated','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','true','false'};
		transient String[] field_order_type_info = new String[]{'isAutoPay','connectDate','isInError','freePaperWindowDate','lastActionCode','printConsent','lastUpdated'};
	}
	public class HuntGroup {
		public WS_BPM_BusinessObjects.IBMTelecomRootObject GroupID;
		public WS_BPM_BusinessObjects.Member[] Member;
		public String pilotPhoneNumber;
		public Integer count;
		transient String[] GroupID_type_info = new String[]{'GroupID','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','IBMTelecomRootObject','0','1','false'};
		transient String[] Member_type_info = new String[]{'Member','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','Member','0','-1','false'};
		transient String[] pilotPhoneNumber_type_info = new String[]{'pilotPhoneNumber','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] count_type_info = new String[]{'count','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','int','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','false','false'};
		transient String[] field_order_type_info = new String[]{'GroupID','Member','pilotPhoneNumber','count'};
	}
	public class InformationalMessage {
		public String type_x;
		public String source;
		public String classification;
		public WS_BPM_BusinessObjects.TimePeriod ValidFor;
		public String[] text;
		public String repositoryCode;
		transient String[] type_x_type_info = new String[]{'type','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] source_type_info = new String[]{'source','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] classification_type_info = new String[]{'classification','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] ValidFor_type_info = new String[]{'ValidFor','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','TimePeriod','0','1','false'};
		transient String[] text_type_info = new String[]{'text','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','-1','false'};
		transient String[] repositoryCode_type_info = new String[]{'repositoryCode','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','true','false'};
		transient String[] field_order_type_info = new String[]{'type_x','source','classification','ValidFor','text','repositoryCode'};
	}
	public class LineCardHistory {
		public WS_BPM_BusinessObjects.TimePeriod ValidFor;
		public String distPairType;
		public String lineCardNameTag;
		public String name;
		public String phone;
		transient String[] ValidFor_type_info = new String[]{'ValidFor','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','TimePeriod','0','1','false'};
		transient String[] distPairType_type_info = new String[]{'distPairType','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] lineCardNameTag_type_info = new String[]{'lineCardNameTag','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] name_type_info = new String[]{'name','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] phone_type_info = new String[]{'phone','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','true','false'};
		transient String[] field_order_type_info = new String[]{'ValidFor','distPairType','lineCardNameTag','name','phone'};
	}
	public class Listing {
		public String descriptionLine;
		public WS_BPM_BusinessObjects.ListingInfo ListingInfo;
		public String listWithPhoneNumber;
		transient String[] descriptionLine_type_info = new String[]{'descriptionLine','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] ListingInfo_type_info = new String[]{'ListingInfo','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','ListingInfo','0','1','false'};
		transient String[] listWithPhoneNumber_type_info = new String[]{'listWithPhoneNumber','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','false','false'};
		transient String[] field_order_type_info = new String[]{'descriptionLine','ListingInfo','listWithPhoneNumber'};
	}
	public class ListingInfo {
		public String[] directoryCodeNumber;
		public Integer directoryTextLineNumber;
		public String directoryText;
		transient String[] directoryCodeNumber_type_info = new String[]{'directoryCodeNumber','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','-1','false'};
		transient String[] directoryTextLineNumber_type_info = new String[]{'directoryTextLineNumber','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','int','0','1','false'};
		transient String[] directoryText_type_info = new String[]{'directoryText','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','true','false'};
		transient String[] field_order_type_info = new String[]{'directoryCodeNumber','directoryTextLineNumber','directoryText'};
	}
	public class LoadCoil {
		public String type_x;
		public WS_BPM_BusinessObjects.NetworkLocation NetworkLocation;
		transient String[] type_x_type_info = new String[]{'type','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] NetworkLocation_type_info = new String[]{'NetworkLocation','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','NetworkLocation','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','true','false'};
		transient String[] field_order_type_info = new String[]{'type_x','NetworkLocation'};
	}
	public class LocalLoop {
		public String wireCenter;
		public WS_BPM_BusinessObjects.Quantity VoiceInsertionLoss;
		public WS_BPM_BusinessObjects.BridgeTap[] BridgeTap;
		public WS_BPM_BusinessObjects.DistributionPoint DistributionPoint;
		public WS_BPM_BusinessObjects.LocalLoopSegment[] LocalLoopSegment;
		transient String[] wireCenter_type_info = new String[]{'wireCenter','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] VoiceInsertionLoss_type_info = new String[]{'VoiceInsertionLoss','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','Quantity','0','1','false'};
		transient String[] BridgeTap_type_info = new String[]{'BridgeTap','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','BridgeTap','0','-1','false'};
		transient String[] DistributionPoint_type_info = new String[]{'DistributionPoint','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','DistributionPoint','0','1','false'};
		transient String[] LocalLoopSegment_type_info = new String[]{'LocalLoopSegment','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','LocalLoopSegment','0','-1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','true','false'};
		transient String[] field_order_type_info = new String[]{'wireCenter','VoiceInsertionLoss','BridgeTap','DistributionPoint','LocalLoopSegment'};
	}
	public class LocalLoopSegment {
		public String id;
		public WS_BPM_BusinessObjects.Cable[] Cable;
		public WS_BPM_BusinessObjects.LocalLoopSegmentLocation Location;
		public WS_BPM_BusinessObjects.LoadCoil[] LoadCoil;
		public WS_BPM_BusinessObjects.GaugeSegment[] GaugeSegment;
		transient String[] id_type_info = new String[]{'id','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] Cable_type_info = new String[]{'Cable','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','Cable','0','-1','false'};
		transient String[] Location_type_info = new String[]{'Location','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','LocalLoopSegmentLocation','0','1','false'};
		transient String[] LoadCoil_type_info = new String[]{'LoadCoil','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','LoadCoil','0','-1','false'};
		transient String[] GaugeSegment_type_info = new String[]{'GaugeSegment','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','GaugeSegment','0','-1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','true','false'};
		transient String[] field_order_type_info = new String[]{'id','Cable','Location','LoadCoil','GaugeSegment'};
	}
	public class LocalLoopSegmentLocation {
		public String type_x;
		public WS_BPM_BusinessObjects.NetworkLocation NetworkLocation;
		transient String[] type_x_type_info = new String[]{'type','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] NetworkLocation_type_info = new String[]{'NetworkLocation','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','NetworkLocation','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','true','false'};
		transient String[] field_order_type_info = new String[]{'type_x','NetworkLocation'};
	}
	public class LoyaltyPoints {
		public DateTime dateBilled;
		public DateTime dateSent;
		public Boolean isEligible;
		public String pointsLastMonth;
		public Boolean optedInFlag;
		public String recordType;
		public Boolean redeemEligible;
		public Integer pointsToDate;
		transient String[] dateBilled_type_info = new String[]{'dateBilled','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','dateTime','0','1','false'};
		transient String[] dateSent_type_info = new String[]{'dateSent','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','dateTime','0','1','false'};
		transient String[] isEligible_type_info = new String[]{'isEligible','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','boolean','0','1','false'};
		transient String[] pointsLastMonth_type_info = new String[]{'pointsLastMonth','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] optedInFlag_type_info = new String[]{'optedInFlag','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','boolean','0','1','false'};
		transient String[] recordType_type_info = new String[]{'recordType','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] redeemEligible_type_info = new String[]{'redeemEligible','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','boolean','0','1','false'};
		transient String[] pointsToDate_type_info = new String[]{'pointsToDate','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','int','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','true','false'};
		transient String[] field_order_type_info = new String[]{'dateBilled','dateSent','isEligible','pointsLastMonth','optedInFlag','recordType','redeemEligible','pointsToDate'};
	}
	public class Member {
		public String phoneNumber;
		public Integer groupSequenceNumber;
		transient String[] phoneNumber_type_info = new String[]{'phoneNumber','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] groupSequenceNumber_type_info = new String[]{'groupSequenceNumber','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','int','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','false','false'};
		transient String[] field_order_type_info = new String[]{'phoneNumber','groupSequenceNumber'};
	}
	public class Memo {
		public String templateName;
		public Integer templateOccurrence;
		public String memoKey;
		public String sectionName;
		public WS_BPM_BusinessObjects.Entity AdditionalInformation;
		public String context;
		public String type_x;
		public String hashKey;
		public WS_BPM_BusinessObjects.RawText[] RawText;
		public String templateDescription;
		public String templateVersion;
		public String createdBy;
		public DateTime createdDate;
		public WS_BPM_BusinessObjects.IBMTelecomRootObject ID;
		public WS_BPM_BusinessObjects.MemoAttribute[] Attribute;
		transient String[] templateName_type_info = new String[]{'templateName','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] templateOccurrence_type_info = new String[]{'templateOccurrence','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','int','0','1','false'};
		transient String[] memoKey_type_info = new String[]{'memoKey','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] sectionName_type_info = new String[]{'sectionName','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] AdditionalInformation_type_info = new String[]{'AdditionalInformation','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','Entity','0','1','false'};
		transient String[] context_type_info = new String[]{'context','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] type_x_type_info = new String[]{'type','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] hashKey_type_info = new String[]{'hashKey','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] RawText_type_info = new String[]{'RawText','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','RawText','0','-1','false'};
		transient String[] templateDescription_type_info = new String[]{'templateDescription','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] templateVersion_type_info = new String[]{'templateVersion','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] createdBy_type_info = new String[]{'createdBy','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] createdDate_type_info = new String[]{'createdDate','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','dateTime','0','1','false'};
		transient String[] ID_type_info = new String[]{'ID','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','IBMTelecomRootObject','0','1','false'};
		transient String[] Attribute_type_info = new String[]{'Attribute','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','MemoAttribute','0','-1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','true','false'};
		transient String[] field_order_type_info = new String[]{'templateName','templateOccurrence','memoKey','sectionName','AdditionalInformation','context','type_x','hashKey','RawText','templateDescription','templateVersion','createdBy','createdDate','ID','Attribute'};
	}
	public class MemoAttribute {
		public String textLine;
		public Boolean isEditable;
		public Integer sequenceNumber;
		public WS_BPM_BusinessObjects.CharacteristicSpecification[] CharacteristicSpecification;
		public WS_BPM_BusinessObjects.CharacteristicSpecification[] Facet;
		transient String[] textLine_type_info = new String[]{'textLine','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] isEditable_type_info = new String[]{'isEditable','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','boolean','0','1','false'};
		transient String[] sequenceNumber_type_info = new String[]{'sequenceNumber','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','int','0','1','false'};
		transient String[] CharacteristicSpecification_type_info = new String[]{'CharacteristicSpecification','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','CharacteristicSpecification','0','-1','false'};
		transient String[] Facet_type_info = new String[]{'Facet','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','CharacteristicSpecification','0','-1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','true','false'};
		transient String[] field_order_type_info = new String[]{'textLine','isEditable','sequenceNumber','CharacteristicSpecification','Facet'};
	}
	public class NetworkLocation {
		public WS_BPM_BusinessObjects.Quantity DistanceFromWireCenter;
		public WS_BPM_BusinessObjects.GlobalPosition GlobalPosition;
		transient String[] DistanceFromWireCenter_type_info = new String[]{'DistanceFromWireCenter','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','Quantity','0','1','false'};
		transient String[] GlobalPosition_type_info = new String[]{'GlobalPosition','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','GlobalPosition','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','true','false'};
		transient String[] field_order_type_info = new String[]{'DistanceFromWireCenter','GlobalPosition'};
	}
	public class NorthAmericanPhoneNumber {
		public String npa;
		public String nxx;
		public String station;
		transient String[] npa_type_info = new String[]{'npa','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] nxx_type_info = new String[]{'nxx','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] station_type_info = new String[]{'station','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','true','false'};
		transient String[] field_order_type_info = new String[]{'npa','nxx','station'};
	}
	public class OnlineBillPay {
		public Boolean disabled;
		public String enrollmentStatus;
		public WS_BPM_BusinessObjects.Profile Profile;
		public WS_BPM_BusinessObjects.History[] Histories;
		transient String[] disabled_type_info = new String[]{'disabled','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','boolean','0','1','false'};
		transient String[] enrollmentStatus_type_info = new String[]{'enrollmentStatus','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] Profile_type_info = new String[]{'Profile','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','Profile','0','1','false'};
		transient String[] Histories_type_info = new String[]{'Histories','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','History','0','-1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','true','false'};
		transient String[] field_order_type_info = new String[]{'disabled','enrollmentStatus','Profile','Histories'};
	}
	public class PhoneAsId {
		public String telephoneNumber;
		public String sequenceNumber;
		transient String[] telephoneNumber_type_info = new String[]{'telephoneNumber','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] sequenceNumber_type_info = new String[]{'sequenceNumber','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','true','false'};
		transient String[] field_order_type_info = new String[]{'telephoneNumber','sequenceNumber'};
	}
	public class PhoneNumber {
		public String telephoneNumber;
		public Integer reassignmentNumber;
		public WS_BPM_BusinessObjects.NorthAmericanPhoneNumber NorthAmericanPhoneNumber;
		transient String[] telephoneNumber_type_info = new String[]{'telephoneNumber','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] reassignmentNumber_type_info = new String[]{'reassignmentNumber','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','int','0','1','false'};
		transient String[] NorthAmericanPhoneNumber_type_info = new String[]{'NorthAmericanPhoneNumber','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','NorthAmericanPhoneNumber','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','true','false'};
		transient String[] field_order_type_info = new String[]{'telephoneNumber','reassignmentNumber','NorthAmericanPhoneNumber'};
	}
	public class ProdOfferPriceCharge {
		public WS_BPM_BusinessObjects.ProdOfferPriceCharge AlternateProdOfferPriceCharge;
		public WS_BPM_BusinessObjects.Money price;
		public String priceType;
		public String period;
		transient String[] AlternateProdOfferPriceCharge_type_info = new String[]{'AlternateProdOfferPriceCharge','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','ProdOfferPriceCharge','0','1','false'};
		transient String[] price_type_info = new String[]{'price','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','Money','0','1','false'};
		transient String[] priceType_type_info = new String[]{'priceType','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] period_type_info = new String[]{'period','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','true','false'};
		transient String[] field_order_type_info = new String[]{'AlternateProdOfferPriceCharge','price','priceType','period'};
	}
	public class Profile {
		public WS_BPM_BusinessObjects.SecurityQuestion[] SecurityQuestion;
		public String emailAddress;
		public String enrollInEBPP;
		public String userId;
		public String domain;
		transient String[] SecurityQuestion_type_info = new String[]{'SecurityQuestion','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','SecurityQuestion','0','-1','false'};
		transient String[] emailAddress_type_info = new String[]{'emailAddress','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] enrollInEBPP_type_info = new String[]{'enrollInEBPP','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] userId_type_info = new String[]{'userId','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] domain_type_info = new String[]{'domain','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','true','false'};
		transient String[] field_order_type_info = new String[]{'SecurityQuestion','emailAddress','enrollInEBPP','userId','domain'};
	}
	public class Quantity {
		public Integer amount;
		public String units;
		transient String[] amount_type_info = new String[]{'amount','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','int','0','1','false'};
		transient String[] units_type_info = new String[]{'units','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','true','false'};
		transient String[] field_order_type_info = new String[]{'amount','units'};
	}
	public class QuantityDecimal {
		public Decimal amount;
		public String units;
		transient String[] amount_type_info = new String[]{'amount','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','decimal','0','1','false'};
		transient String[] units_type_info = new String[]{'units','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','true','false'};
		transient String[] field_order_type_info = new String[]{'amount','units'};
	}
	public class QuestionAnswer {
		public WS_BPM_BusinessObjects.SequenceText QuestionText;
		public WS_BPM_BusinessObjects.SequenceText[] Choices;
		transient String[] QuestionText_type_info = new String[]{'QuestionText','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','SequenceText','0','1','false'};
		transient String[] Choices_type_info = new String[]{'Choices','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','SequenceText','0','-1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','true','false'};
		transient String[] field_order_type_info = new String[]{'QuestionText','Choices'};
	}
	public class RawText {
		public String textLine;
		public Boolean isEditable;
		transient String[] textLine_type_info = new String[]{'textLine','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] isEditable_type_info = new String[]{'isEditable','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','boolean','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','true','false'};
		transient String[] field_order_type_info = new String[]{'textLine','isEditable'};
	}
	public class RolloverMinutes {
		public String availableRollover;
		public String callingPlanCode;
		public String callingPlanDescription;
		public WS_BPM_BusinessObjects.SequencedValue[] CarryOverMonth;
		public String lastMonthRollover;
		public String lastUpdatedByJobName;
		public String lastUpdatedByUser;
		public DateTime lastUpdatedDateTime;
		public String maximumRollover;
		public String memberExchange;
		public String memberLine;
		public Integer memberReassignmentSeq;
		public String monthlyAllowance;
		public Integer remainingMinutes;
		public Integer unbilledMinutes;
		transient String[] availableRollover_type_info = new String[]{'availableRollover','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] callingPlanCode_type_info = new String[]{'callingPlanCode','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] callingPlanDescription_type_info = new String[]{'callingPlanDescription','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] CarryOverMonth_type_info = new String[]{'CarryOverMonth','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','SequencedValue','0','-1','false'};
		transient String[] lastMonthRollover_type_info = new String[]{'lastMonthRollover','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] lastUpdatedByJobName_type_info = new String[]{'lastUpdatedByJobName','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] lastUpdatedByUser_type_info = new String[]{'lastUpdatedByUser','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] lastUpdatedDateTime_type_info = new String[]{'lastUpdatedDateTime','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','dateTime','0','1','false'};
		transient String[] maximumRollover_type_info = new String[]{'maximumRollover','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] memberExchange_type_info = new String[]{'memberExchange','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] memberLine_type_info = new String[]{'memberLine','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] memberReassignmentSeq_type_info = new String[]{'memberReassignmentSeq','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','int','0','1','false'};
		transient String[] monthlyAllowance_type_info = new String[]{'monthlyAllowance','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] remainingMinutes_type_info = new String[]{'remainingMinutes','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','int','0','1','false'};
		transient String[] unbilledMinutes_type_info = new String[]{'unbilledMinutes','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','int','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','true','false'};
		transient String[] field_order_type_info = new String[]{'availableRollover','callingPlanCode','callingPlanDescription','CarryOverMonth','lastMonthRollover','lastUpdatedByJobName','lastUpdatedByUser','lastUpdatedDateTime','maximumRollover','memberExchange','memberLine','memberReassignmentSeq','monthlyAllowance','remainingMinutes','unbilledMinutes'};
	}
	public class SatelliteUsageDetail {
		public Integer fairAccessPolicy;
		public WS_BPM_BusinessObjects.CharacteristicSpecification[] Characteristics;
		public String additionalBandWidthAllowed;
		public String bandwidthResetDayOfMonth;
		public String bandwidthResetDayOfWeek;
		public String bandwidthResetHourOfDay;
		public Integer remainingAnytimeBandwidth;
		public Integer totalBonusBandwidth;
		public Integer remainingBonusBandwidth;
		public Integer remainingTokenBandwidth;
		public String satellite;
		transient String[] fairAccessPolicy_type_info = new String[]{'fairAccessPolicy','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','int','0','1','false'};
		transient String[] Characteristics_type_info = new String[]{'Characteristics','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','CharacteristicSpecification','0','-1','false'};
		transient String[] additionalBandWidthAllowed_type_info = new String[]{'additionalBandWidthAllowed','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] bandwidthResetDayOfMonth_type_info = new String[]{'bandwidthResetDayOfMonth','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] bandwidthResetDayOfWeek_type_info = new String[]{'bandwidthResetDayOfWeek','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] bandwidthResetHourOfDay_type_info = new String[]{'bandwidthResetHourOfDay','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] remainingAnytimeBandwidth_type_info = new String[]{'remainingAnytimeBandwidth','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','int','0','1','false'};
		transient String[] totalBonusBandwidth_type_info = new String[]{'totalBonusBandwidth','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','int','0','1','false'};
		transient String[] remainingBonusBandwidth_type_info = new String[]{'remainingBonusBandwidth','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','int','0','1','false'};
		transient String[] remainingTokenBandwidth_type_info = new String[]{'remainingTokenBandwidth','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','int','0','1','false'};
		transient String[] satellite_type_info = new String[]{'satellite','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','true','false'};
		transient String[] field_order_type_info = new String[]{'fairAccessPolicy','Characteristics','additionalBandWidthAllowed','bandwidthResetDayOfMonth','bandwidthResetDayOfWeek','bandwidthResetHourOfDay','remainingAnytimeBandwidth','totalBonusBandwidth','remainingBonusBandwidth','remainingTokenBandwidth','satellite'};
	}
	public class SecurityQuestion {
		public String securityQuestion;
		public String securityAnswer;
		transient String[] securityQuestion_type_info = new String[]{'securityQuestion','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] securityAnswer_type_info = new String[]{'securityAnswer','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','true','false'};
		transient String[] field_order_type_info = new String[]{'securityQuestion','securityAnswer'};
	}
	public class SequencedValue {
		public Integer sequenceNumber;
		public Double value;
		transient String[] sequenceNumber_type_info = new String[]{'sequenceNumber','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','int','0','1','false'};
		transient String[] value_type_info = new String[]{'value','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','double','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','true','false'};
		transient String[] field_order_type_info = new String[]{'sequenceNumber','value'};
	}
	public class SequenceText {
		public Integer number_x;
		public String text;
		transient String[] number_x_type_info = new String[]{'number','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','int','0','1','false'};
		transient String[] text_type_info = new String[]{'text','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','true','false'};
		transient String[] field_order_type_info = new String[]{'number_x','text'};
	}
	public class ServiceUsage {
		public WS_BPM_BusinessObjects.IBMTelecomRootObject ServiceID;
		public WS_BPM_BusinessObjects.Usage[] Usage;
		transient String[] ServiceID_type_info = new String[]{'ServiceID','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','IBMTelecomRootObject','0','1','false'};
		transient String[] Usage_type_info = new String[]{'Usage','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','Usage','0','-1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','true','false'};
		transient String[] field_order_type_info = new String[]{'ServiceID','Usage'};
	}
	public class Tax {
		public WS_BPM_BusinessObjects.IBMTelecomRootObject ID;
		public WS_BPM_BusinessObjects.Money Amount;
		public WS_BPM_BusinessObjects.TaxCode TaxCode;
		public WS_BPM_BusinessObjects.Money TaxableAmount;
		transient String[] ID_type_info = new String[]{'ID','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','IBMTelecomRootObject','0','1','false'};
		transient String[] Amount_type_info = new String[]{'Amount','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','Money','0','1','false'};
		transient String[] TaxCode_type_info = new String[]{'TaxCode','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','TaxCode','0','1','false'};
		transient String[] TaxableAmount_type_info = new String[]{'TaxableAmount','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','Money','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','true','false'};
		transient String[] field_order_type_info = new String[]{'ID','Amount','TaxCode','TaxableAmount'};
	}
	public class TaxCertificate {
		public WS_BPM_BusinessObjects.IBMTelecomRootObject ID;
		public WS_BPM_BusinessObjects.PartyRole[] PartyRole;
		public String customerType;
		public String status;
		public String updatingOrderId;
		public WS_BPM_BusinessObjects.TaxExemption[] TaxExemption;
		public String taxCertificateNumber;
		public String lastServiceOrderToUpdate;
		transient String[] ID_type_info = new String[]{'ID','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','IBMTelecomRootObject','0','1','false'};
		transient String[] PartyRole_type_info = new String[]{'PartyRole','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','PartyRole','0','-1','false'};
		transient String[] customerType_type_info = new String[]{'customerType','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] status_type_info = new String[]{'status','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] updatingOrderId_type_info = new String[]{'updatingOrderId','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] TaxExemption_type_info = new String[]{'TaxExemption','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','TaxExemption','0','-1','false'};
		transient String[] taxCertificateNumber_type_info = new String[]{'taxCertificateNumber','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] lastServiceOrderToUpdate_type_info = new String[]{'lastServiceOrderToUpdate','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','true','false'};
		transient String[] field_order_type_info = new String[]{'ID','PartyRole','customerType','status','updatingOrderId','TaxExemption','taxCertificateNumber','lastServiceOrderToUpdate'};
	}
	public class TaxCode {
		public WS_BPM_BusinessObjects.CodeDescription TaxCodeDescription;
		public String taxPercentage;
		public String taxingSequence;
		public String taxCategory;
		public String sourceProcessName;
		transient String[] TaxCodeDescription_type_info = new String[]{'TaxCodeDescription','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','CodeDescription','0','1','false'};
		transient String[] taxPercentage_type_info = new String[]{'taxPercentage','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] taxingSequence_type_info = new String[]{'taxingSequence','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] taxCategory_type_info = new String[]{'taxCategory','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] sourceProcessName_type_info = new String[]{'sourceProcessName','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','true','false'};
		transient String[] field_order_type_info = new String[]{'TaxCodeDescription','taxPercentage','taxingSequence','taxCategory','sourceProcessName'};
	}
	public class TaxExemption {
		public String type_x;
		public String issuingJurisdiction;
		public String exemptCode;
		public WS_BPM_BusinessObjects.TimePeriod ValidFor;
		public Boolean exemptFlag;
		transient String[] type_x_type_info = new String[]{'type','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] issuingJurisdiction_type_info = new String[]{'issuingJurisdiction','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] exemptCode_type_info = new String[]{'exemptCode','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] ValidFor_type_info = new String[]{'ValidFor','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','TimePeriod','0','1','false'};
		transient String[] exemptFlag_type_info = new String[]{'exemptFlag','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','boolean','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','true','false'};
		transient String[] field_order_type_info = new String[]{'type_x','issuingJurisdiction','exemptCode','ValidFor','exemptFlag'};
	}
	public class TaxProfile {
		public Boolean isFederalTaxExempt;
		public String stateTaxCode;
		public WS_BPM_BusinessObjects.CodeDescription TaxDistrict;
		public WS_BPM_BusinessObjects.TaxCertificate TaxCertificate;
		public WS_BPM_BusinessObjects.TaxCode[] TaxCode;
		public String federalTaxId;
		transient String[] isFederalTaxExempt_type_info = new String[]{'isFederalTaxExempt','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','boolean','0','1','false'};
		transient String[] stateTaxCode_type_info = new String[]{'stateTaxCode','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] TaxDistrict_type_info = new String[]{'TaxDistrict','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','CodeDescription','0','1','false'};
		transient String[] TaxCertificate_type_info = new String[]{'TaxCertificate','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','TaxCertificate','0','1','false'};
		transient String[] TaxCode_type_info = new String[]{'TaxCode','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','TaxCode','0','-1','false'};
		transient String[] federalTaxId_type_info = new String[]{'federalTaxId','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','true','false'};
		transient String[] field_order_type_info = new String[]{'isFederalTaxExempt','stateTaxCode','TaxDistrict','TaxCertificate','TaxCode','federalTaxId'};
	}
	public class Technology {
		public String additionalSpeedInfo;
		public String availableSpeed;
		public String businessOrResidential;
		public String defaultModem;
		public String marketOffering;
		public String maxDslamSpeed;
		public String technologyGroup;
		public String technologyItem;
		public String technologyName;
		public Boolean prepaidBroadBandCapable;
		transient String[] additionalSpeedInfo_type_info = new String[]{'additionalSpeedInfo','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] availableSpeed_type_info = new String[]{'availableSpeed','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] businessOrResidential_type_info = new String[]{'businessOrResidential','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] defaultModem_type_info = new String[]{'defaultModem','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] marketOffering_type_info = new String[]{'marketOffering','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] maxDslamSpeed_type_info = new String[]{'maxDslamSpeed','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] technologyGroup_type_info = new String[]{'technologyGroup','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] technologyItem_type_info = new String[]{'technologyItem','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] technologyName_type_info = new String[]{'technologyName','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','string','0','1','false'};
		transient String[] prepaidBroadBandCapable_type_info = new String[]{'prepaidBroadBandCapable','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','boolean','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','true','false'};
		transient String[] field_order_type_info = new String[]{'additionalSpeedInfo','availableSpeed','businessOrResidential','defaultModem','marketOffering','maxDslamSpeed','technologyGroup','technologyItem','technologyName','prepaidBroadBandCapable'};
	}
	public class Toll {
		public WS_BPM_BusinessObjects.Money Amount;
		transient String[] Amount_type_info = new String[]{'Amount','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','Money','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','true','false'};
		transient String[] field_order_type_info = new String[]{'Amount'};
	}
	public class Usage {
		public WS_BPM_BusinessObjects.IBMTelecomRootObject ID;
		public WS_BPM_BusinessObjects.TimePeriod duration;
		public WS_BPM_BusinessObjects.CharacteristicSpecification[] UsageDescribedBy;
		public WS_BPM_BusinessObjects.CharacteristicSpecification[] UsageSpecification;
		public WS_BPM_BusinessObjects.Money Price;
		public WS_BPM_BusinessObjects.CallDetail CallDetail;
		public WS_BPM_BusinessObjects.CallSummary CallSummary;
		public WS_BPM_BusinessObjects.SatelliteUsageDetail SatelliteUsageDetail;
		transient String[] ID_type_info = new String[]{'ID','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','IBMTelecomRootObject','0','1','false'};
		transient String[] duration_type_info = new String[]{'duration','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','TimePeriod','0','1','false'};
		transient String[] UsageDescribedBy_type_info = new String[]{'UsageDescribedBy','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','CharacteristicSpecification','0','-1','false'};
		transient String[] UsageSpecification_type_info = new String[]{'UsageSpecification','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','CharacteristicSpecification','0','-1','false'};
		transient String[] Price_type_info = new String[]{'Price','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','Money','0','1','false'};
		transient String[] CallDetail_type_info = new String[]{'CallDetail','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','CallDetail','0','1','false'};
		transient String[] CallSummary_type_info = new String[]{'CallSummary','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','CallSummary','0','1','false'};
		transient String[] SatelliteUsageDetail_type_info = new String[]{'SatelliteUsageDetail','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','SatelliteUsageDetail','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','true','false'};
		transient String[] field_order_type_info = new String[]{'ID','duration','UsageDescribedBy','UsageSpecification','Price','CallDetail','CallSummary','SatelliteUsageDetail'};
	}
	public class Work {
		public WS_BPM_BusinessObjects.Quantity UnitsQuantity;
		public Integer numberOfResources;
		transient String[] UnitsQuantity_type_info = new String[]{'UnitsQuantity','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','Quantity','0','1','false'};
		transient String[] numberOfResources_type_info = new String[]{'numberOfResources','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','int','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiercommon','true','false'};
		transient String[] field_order_type_info = new String[]{'UnitsQuantity','numberOfResources'};
	}

	public class AddressText {
		public Integer sequenceNumber;
		public String addressText;
		transient String[] sequenceNumber_type_info = new String[]{'sequenceNumber','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common/extensions','int','0','1','false'};
		transient String[] addressText_type_info = new String[]{'addressText','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common/extensions','string','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common/extensions','true','false'};
		transient String[] field_order_type_info = new String[]{'sequenceNumber','addressText'};
	}
	public class ContactMediumExtension {
		public String canBeReachedAt;
		public String canBeReachedAtOutboundDialing;
		transient String[] canBeReachedAt_type_info = new String[]{'canBeReachedAt','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common/extensions','string','0','1','false'};
		transient String[] canBeReachedAtOutboundDialing_type_info = new String[]{'canBeReachedAtOutboundDialing','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common/extensions','string','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common/extensions','true','false'};
		transient String[] field_order_type_info = new String[]{'canBeReachedAt','canBeReachedAtOutboundDialing'};
	}
	
	public class GeographicAddressExtension {
		public Boolean isInFootprint;
		public String addressDescription;
		public String addressType;
		public WS_BPM_BusinessObjects.AddressText[] AddressText;
		public String[] addressRemark;
		transient String[] isInFootprint_type_info = new String[]{'isInFootprint','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common/extensions','boolean','0','1','false'};
		transient String[] addressDescription_type_info = new String[]{'addressDescription','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common/extensions','string','0','1','false'};
		transient String[] addressType_type_info = new String[]{'addressType','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common/extensions','string','0','1','false'};
		transient String[] AddressText_type_info = new String[]{'AddressText','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common/extensions','AddressText','0','-1','false'};
		transient String[] addressRemark_type_info = new String[]{'addressRemark','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common/extensions','string','0','-1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common/extensions','true','false'};
		transient String[] field_order_type_info = new String[]{'isInFootprint','addressDescription','addressType','AddressText','addressRemark'};
	}
	
	public class IndividualExtension {
		public String age;
		transient String[] age_type_info = new String[]{'age','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common/extensions','string','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common/extensions','true','false'};
		transient String[] field_order_type_info = new String[]{'age'};
	}
	public class PartyExtension {
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common/extensions','true','false'};
		transient String[] field_order_type_info = new String[]{};
	}
	public class PartyRoleExtension {
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common/extensions','true','false'};
		transient String[] field_order_type_info = new String[]{};
	}
	public class UrbanPropertyAddressExtension {
		public String subDivision;
		public String streetPrefix;
		public String localityId;
		transient String[] subDivision_type_info = new String[]{'subDivision','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common/extensions','string','0','1','false'};
		transient String[] streetPrefix_type_info = new String[]{'streetPrefix','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common/extensions','string','0','1','false'};
		transient String[] localityId_type_info = new String[]{'localityId','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common/extensions','string','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common/extensions','true','false'};
		transient String[] field_order_type_info = new String[]{'subDivision','streetPrefix','localityId'};
	}
	public class UrbanPropertySubAddressExtension {
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/common/extensions','true','false'};
		transient String[] field_order_type_info = new String[]{};
	}

	public class CustomerAccountExtension {
		public WS_BPM_BusinessObjects.AccountId AccountId;
		public Integer quantiyOfAdjustments;
		public WS_BPM_BusinessObjects.Money TotalAdjustmentAmount;
		public WS_BPM_BusinessObjects.Entity[] RelatedAccounts;
		public WS_BPM_BusinessObjects.Entity ProprietaryInformation;
		public WS_BPM_BusinessObjects.Entity AuditInformation;
		public WS_BPM_BusinessObjects.Money SecurityDepositAmount;
		public WS_BPM_BusinessObjects.OnlineBillPay OnlineBillPay;
		public WS_BPM_BusinessObjects.GlobalAccount GlobalAccount;
		public DateTime lastDNPDate;
		public DateTime lastNSFDate;
		public DateTime lastNoticeDate;
		public String currentTreatmentStatus;
		public WS_BPM_BusinessObjects.Money PastDueAmount;
		public String interExchangeCarrierLockInfo;
		public Boolean exchangeCarrierLockFlag;
		public WS_BPM_BusinessObjects.TimePeriod ConnectDate;
		public WS_BPM_BusinessObjects.AmountEntity[] AmountEntity;
		public DateTime lastPaymentDate;
		public DateTime lastStatementDate;
		public DateTime lastStatementDueDate;
		public WS_BPM_BusinessObjects.CodeDescription ServiceType;
		public Boolean isSelectedForDNP;
		public WS_BPM_BusinessObjects.Entity Preferences;
		public WS_BPM_BusinessObjects.TaxProfile TaxProfile;
		public String contactName;
		public DateTime lastTreatmentDate;
		public DateTime writtenOffDate;
		public WS_BPM_BusinessObjects.Entity SubscriptionActivity;
		public DateTime statementDueDate;
		transient String[] AccountId_type_info = new String[]{'AccountId','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/billing/extensions','AccountId','0','1','false'};
		transient String[] quantiyOfAdjustments_type_info = new String[]{'quantiyOfAdjustments','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/billing/extensions','int','0','1','false'};
		transient String[] TotalAdjustmentAmount_type_info = new String[]{'TotalAdjustmentAmount','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/billing/extensions','Money','0','1','false'};
		transient String[] RelatedAccounts_type_info = new String[]{'RelatedAccounts','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/billing/extensions','Entity','0','-1','false'};
		transient String[] ProprietaryInformation_type_info = new String[]{'ProprietaryInformation','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/billing/extensions','Entity','0','1','false'};
		transient String[] AuditInformation_type_info = new String[]{'AuditInformation','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/billing/extensions','Entity','0','1','false'};
		transient String[] SecurityDepositAmount_type_info = new String[]{'SecurityDepositAmount','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/billing/extensions','Money','0','1','false'};
		transient String[] OnlineBillPay_type_info = new String[]{'OnlineBillPay','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/billing/extensions','OnlineBillPay','0','1','false'};
		transient String[] GlobalAccount_type_info = new String[]{'GlobalAccount','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/billing/extensions','GlobalAccount','0','1','false'};
		transient String[] lastDNPDate_type_info = new String[]{'lastDNPDate','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/billing/extensions','dateTime','0','1','false'};
		transient String[] lastNSFDate_type_info = new String[]{'lastNSFDate','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/billing/extensions','dateTime','0','1','false'};
		transient String[] lastNoticeDate_type_info = new String[]{'lastNoticeDate','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/billing/extensions','dateTime','0','1','false'};
		transient String[] currentTreatmentStatus_type_info = new String[]{'currentTreatmentStatus','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/billing/extensions','string','0','1','false'};
		transient String[] PastDueAmount_type_info = new String[]{'PastDueAmount','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/billing/extensions','Money','0','1','false'};
		transient String[] interExchangeCarrierLockInfo_type_info = new String[]{'interExchangeCarrierLockInfo','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/billing/extensions','string','0','1','false'};
		transient String[] exchangeCarrierLockFlag_type_info = new String[]{'exchangeCarrierLockFlag','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/billing/extensions','boolean','0','1','false'};
		transient String[] ConnectDate_type_info = new String[]{'ConnectDate','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/billing/extensions','TimePeriod','0','1','false'};
		transient String[] AmountEntity_type_info = new String[]{'AmountEntity','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/billing/extensions','AmountEntity','0','-1','false'};
		transient String[] lastPaymentDate_type_info = new String[]{'lastPaymentDate','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/billing/extensions','dateTime','0','1','false'};
		transient String[] lastStatementDate_type_info = new String[]{'lastStatementDate','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/billing/extensions','dateTime','0','1','false'};
		transient String[] lastStatementDueDate_type_info = new String[]{'lastStatementDueDate','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/billing/extensions','dateTime','0','1','false'};
		transient String[] ServiceType_type_info = new String[]{'ServiceType','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/billing/extensions','CodeDescription','0','1','false'};
		transient String[] isSelectedForDNP_type_info = new String[]{'isSelectedForDNP','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/billing/extensions','boolean','0','1','false'};
		transient String[] Preferences_type_info = new String[]{'Preferences','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/billing/extensions','Entity','0','1','false'};
		transient String[] TaxProfile_type_info = new String[]{'TaxProfile','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/billing/extensions','TaxProfile','0','1','false'};
		transient String[] contactName_type_info = new String[]{'contactName','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/billing/extensions','string','0','1','false'};
		transient String[] lastTreatmentDate_type_info = new String[]{'lastTreatmentDate','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/billing/extensions','dateTime','0','1','false'};
		transient String[] writtenOffDate_type_info = new String[]{'writtenOffDate','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/billing/extensions','dateTime','0','1','false'};
		transient String[] SubscriptionActivity_type_info = new String[]{'SubscriptionActivity','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/billing/extensions','Entity','0','1','false'};
		transient String[] statementDueDate_type_info = new String[]{'statementDueDate','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/billing/extensions','dateTime','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/billing/extensions','true','false'};
		transient String[] field_order_type_info = new String[]{'AccountId','quantiyOfAdjustments','TotalAdjustmentAmount','RelatedAccounts','ProprietaryInformation','AuditInformation','SecurityDepositAmount','OnlineBillPay','GlobalAccount','lastDNPDate','lastNSFDate','lastNoticeDate','currentTreatmentStatus','PastDueAmount','interExchangeCarrierLockInfo','exchangeCarrierLockFlag','ConnectDate','AmountEntity','lastPaymentDate','lastStatementDate','lastStatementDueDate','ServiceType','isSelectedForDNP','Preferences','TaxProfile','contactName','lastTreatmentDate','writtenOffDate','SubscriptionActivity','statementDueDate'};
	}
	public class CustomerBillExtension {
		public WS_BPM_BusinessObjects.Money PriorBillAmount;
		public WS_BPM_BusinessObjects.Money PriorBillAdjustmentAmount;
		public WS_BPM_BusinessObjects.Money TotalPaymentAmount;
		public DateTime lastPaymentDate;
		public WS_BPM_BusinessObjects.Money NonProRatedChargesAmount;
		public WS_BPM_BusinessObjects.Money ProRatedChargesAndCurrentAdjustmentAmount;
		public WS_BPM_BusinessObjects.Toll Toll;
		public WS_BPM_BusinessObjects.Tax Tax;
		public WS_BPM_BusinessObjects.AmountEntity[] AmountEntity;
		public WS_BPM_BusinessObjects.CharacteristicSpecification[] CharacteristicSpecification;
		public String billingMethod;
		public String existingPaymentExtension;
		public Boolean onDeferredPaymentArrangement;
		public String billType;
		public WS_BPM_BusinessObjects.ServiceUsage[] ServiceUsage;
		transient String[] PriorBillAmount_type_info = new String[]{'PriorBillAmount','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/billing/extensions','Money','0','1','false'};
		transient String[] PriorBillAdjustmentAmount_type_info = new String[]{'PriorBillAdjustmentAmount','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/billing/extensions','Money','0','1','false'};
		transient String[] TotalPaymentAmount_type_info = new String[]{'TotalPaymentAmount','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/billing/extensions','Money','0','1','false'};
		transient String[] lastPaymentDate_type_info = new String[]{'lastPaymentDate','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/billing/extensions','dateTime','0','1','false'};
		transient String[] NonProRatedChargesAmount_type_info = new String[]{'NonProRatedChargesAmount','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/billing/extensions','Money','0','1','false'};
		transient String[] ProRatedChargesAndCurrentAdjustmentAmount_type_info = new String[]{'ProRatedChargesAndCurrentAdjustmentAmount','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/billing/extensions','Money','0','1','false'};
		transient String[] Toll_type_info = new String[]{'Toll','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/billing/extensions','Toll','0','1','false'};
		transient String[] Tax_type_info = new String[]{'Tax','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/billing/extensions','Tax','0','1','false'};
		transient String[] AmountEntity_type_info = new String[]{'AmountEntity','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/billing/extensions','AmountEntity','0','-1','false'};
		transient String[] CharacteristicSpecification_type_info = new String[]{'CharacteristicSpecification','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/billing/extensions','CharacteristicSpecification','0','-1','false'};
		transient String[] billingMethod_type_info = new String[]{'billingMethod','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/billing/extensions','string','0','1','false'};
		transient String[] existingPaymentExtension_type_info = new String[]{'existingPaymentExtension','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/billing/extensions','string','0','1','false'};
		transient String[] onDeferredPaymentArrangement_type_info = new String[]{'onDeferredPaymentArrangement','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/billing/extensions','boolean','0','1','false'};
		transient String[] billType_type_info = new String[]{'billType','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/billing/extensions','string','0','1','false'};
		transient String[] ServiceUsage_type_info = new String[]{'ServiceUsage','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/billing/extensions','ServiceUsage','0','-1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/billing/extensions','true','false'};
		transient String[] field_order_type_info = new String[]{'PriorBillAmount','PriorBillAdjustmentAmount','TotalPaymentAmount','lastPaymentDate','NonProRatedChargesAmount','ProRatedChargesAndCurrentAdjustmentAmount','Toll','Tax','AmountEntity','CharacteristicSpecification','billingMethod','existingPaymentExtension','onDeferredPaymentArrangement','billType','ServiceUsage'};
	}
	public class CustomerCreditProfileExtension {
		public String customerFileAccessPin;
		public String serviceAddressState;
		public WS_BPM_BusinessObjects.CreditSummary CreditSummary;
		public WS_BPM_BusinessObjects.CreditScore CreditScore;
		public WS_BPM_BusinessObjects.CreditLiability[] CreditLiability;
		public WS_BPM_BusinessObjects.CreditLiability[] CSA;
		public WS_BPM_BusinessObjects.CreditLiability[] UCA;
		public WS_BPM_BusinessObjects.Entity[] RedFlag;
		public String atRiskToChurnScore;
		public String propensityToPayScore;
		public String RentBuyOwn;
		public WS_BPM_BusinessObjects.FraudPrevention FraudPrevention;
		public DateTime lastNPDDate;
		public WS_BPM_BusinessObjects.Money amountDueOver60Days;
		public Boolean isSalesWorthy;
		public WS_BPM_BusinessObjects.EarlyTerminationFee EarlyTerminationFee;
		transient String[] customerFileAccessPin_type_info = new String[]{'customerFileAccessPin','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/billing/extensions','string','0','1','false'};
		transient String[] serviceAddressState_type_info = new String[]{'serviceAddressState','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/billing/extensions','string','0','1','false'};
		transient String[] CreditSummary_type_info = new String[]{'CreditSummary','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/billing/extensions','CreditSummary','0','1','false'};
		transient String[] CreditScore_type_info = new String[]{'CreditScore','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/billing/extensions','CreditScore','0','1','false'};
		transient String[] CreditLiability_type_info = new String[]{'CreditLiability','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/billing/extensions','CreditLiability','0','-1','false'};
		transient String[] CSA_type_info = new String[]{'CSA','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/billing/extensions','CreditLiability','0','-1','false'};
		transient String[] UCA_type_info = new String[]{'UCA','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/billing/extensions','CreditLiability','0','-1','false'};
		transient String[] RedFlag_type_info = new String[]{'RedFlag','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/billing/extensions','Entity','0','-1','false'};
		transient String[] atRiskToChurnScore_type_info = new String[]{'atRiskToChurnScore','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/billing/extensions','string','0','1','false'};
		transient String[] propensityToPayScore_type_info = new String[]{'propensityToPayScore','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/billing/extensions','string','0','1','false'};
		transient String[] RentBuyOwn_type_info = new String[]{'RentBuyOwn','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/billing/extensions','string','0','1','false'};
		transient String[] FraudPrevention_type_info = new String[]{'FraudPrevention','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/billing/extensions','FraudPrevention','0','1','false'};
		transient String[] lastNPDDate_type_info = new String[]{'lastNPDDate','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/billing/extensions','dateTime','0','1','false'};
		transient String[] amountDueOver60Days_type_info = new String[]{'amountDueOver60Days','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/billing/extensions','Money','0','1','false'};
		transient String[] isSalesWorthy_type_info = new String[]{'isSalesWorthy','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/billing/extensions','boolean','0','1','false'};
		transient String[] EarlyTerminationFee_type_info = new String[]{'EarlyTerminationFee','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/billing/extensions','EarlyTerminationFee','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/billing/extensions','true','false'};
		transient String[] field_order_type_info = new String[]{'customerFileAccessPin','serviceAddressState','CreditSummary','CreditScore','CreditLiability','CSA','UCA','RedFlag','atRiskToChurnScore','propensityToPayScore','RentBuyOwn','FraudPrevention','lastNPDDate','amountDueOver60Days','isSalesWorthy','EarlyTerminationFee'};
	}
	public class CustomerExtension {
		public WS_BPM_BusinessObjects.Directory Directory;
		public WS_BPM_BusinessObjects.CodeDescription UpSellDisqualification;
		public WS_BPM_BusinessObjects.LoyaltyPoints LoyaltyPoints;
		public String customerPricingSegmentIndicator;
		public Boolean isFederalTaxExempt;
		public String pricingSegmentIndicator;
		public String customerType;
		public Date customerSince;
		transient String[] Directory_type_info = new String[]{'Directory','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/billing/extensions','Directory','0','1','false'};
		transient String[] UpSellDisqualification_type_info = new String[]{'UpSellDisqualification','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/billing/extensions','CodeDescription','0','1','false'};
		transient String[] LoyaltyPoints_type_info = new String[]{'LoyaltyPoints','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/billing/extensions','LoyaltyPoints','0','1','false'};
		transient String[] customerPricingSegmentIndicator_type_info = new String[]{'customerPricingSegmentIndicator','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/billing/extensions','string','0','1','false'};
		transient String[] isFederalTaxExempt_type_info = new String[]{'isFederalTaxExempt','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/billing/extensions','boolean','0','1','false'};
		transient String[] pricingSegmentIndicator_type_info = new String[]{'pricingSegmentIndicator','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/billing/extensions','string','0','1','false'};
		transient String[] customerType_type_info = new String[]{'customerType','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/billing/extensions','string','0','1','false'};
		transient String[] customerSince_type_info = new String[]{'customerSince','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/billing/extensions','date','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/billing/extensions','true','false'};
		transient String[] field_order_type_info = new String[]{'Directory','UpSellDisqualification','LoyaltyPoints','customerPricingSegmentIndicator','isFederalTaxExempt','pricingSegmentIndicator','customerType','customerSince'};
	}
	public class CustomerPaymentExtension {
		public String batchId;
		public String batchSequenceNumber;
		public String postDateTime;
		public String postedBy;
		public String status;
		public String referenceNumber;
		public String source;
		public WS_BPM_BusinessObjects.AccountId BillingAccountId;
		public WS_BPM_BusinessObjects.AccountId MemberAccountId;
		public WS_BPM_BusinessObjects.ContactMedium ContactMedium;
		public String paymentReason;
		transient String[] batchId_type_info = new String[]{'batchId','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/billing/extensions','string','0','1','false'};
		transient String[] batchSequenceNumber_type_info = new String[]{'batchSequenceNumber','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/billing/extensions','string','0','1','false'};
		transient String[] postDateTime_type_info = new String[]{'postDateTime','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/billing/extensions','string','0','1','false'};
		transient String[] postedBy_type_info = new String[]{'postedBy','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/billing/extensions','string','0','1','false'};
		transient String[] status_type_info = new String[]{'status','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/billing/extensions','string','0','1','false'};
		transient String[] referenceNumber_type_info = new String[]{'referenceNumber','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/billing/extensions','string','0','1','false'};
		transient String[] source_type_info = new String[]{'source','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/billing/extensions','string','0','1','false'};
		transient String[] BillingAccountId_type_info = new String[]{'BillingAccountId','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/billing/extensions','AccountId','0','1','false'};
		transient String[] MemberAccountId_type_info = new String[]{'MemberAccountId','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/billing/extensions','AccountId','0','1','false'};
		transient String[] ContactMedium_type_info = new String[]{'ContactMedium','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/billing/extensions','ContactMedium','0','1','false'};
		transient String[] paymentReason_type_info = new String[]{'paymentReason','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/billing/extensions','string','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/billing/extensions','true','false'};
		transient String[] field_order_type_info = new String[]{'batchId','batchSequenceNumber','postDateTime','postedBy','status','referenceNumber','source','BillingAccountId','MemberAccountId','ContactMedium','paymentReason'};
	}
	public class PaymentMethodExtension {
		public String description;
		public WS_BPM_BusinessObjects.ContactMedium ContactMedium;
		transient String[] description_type_info = new String[]{'description','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/billing/extensions','string','0','1','false'};
		transient String[] ContactMedium_type_info = new String[]{'ContactMedium','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/billing/extensions','ContactMedium','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/billing/extensions','true','false'};
		transient String[] field_order_type_info = new String[]{'description','ContactMedium'};
	}
	public class ThirdPartyCollectionPMExtension {
		public String routingNumber;
		transient String[] routingNumber_type_info = new String[]{'routingNumber','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/billing/extensions','string','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/billing/extensions','true','false'};
		transient String[] field_order_type_info = new String[]{'routingNumber'};
	}

	public class msg_Customer {
		public WS_BPM_BusinessObjects.Header Header;
		public WS_BPM_BusinessObjects.Customer[] Payload;
		transient String[] Header_type_info = new String[]{'Header','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/messageview','Header','0','1','false'};
		transient String[] Payload_type_info = new String[]{'Payload','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/messageview','Customer','0','-1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/messageview','false','false'};
		transient String[] field_order_type_info = new String[]{'Header','Payload'};
	}
	public class msg_CustomerAccount {
		public WS_BPM_BusinessObjects.Header Header;
		public WS_BPM_BusinessObjects.CustomerAccount[] Payload;
		transient String[] Header_type_info = new String[]{'Header','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/messageview','Header','0','1','false'};
		transient String[] Payload_type_info = new String[]{'Payload','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/messageview','CustomerAccount','0','-1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/messageview','false','false'};
		transient String[] field_order_type_info = new String[]{'Header','Payload'};
	}
	public class msg_Exception_x {
		public WS_BPM_BusinessObjects.Header Header;
		public WS_BPM_BusinessObjects.Exception_x Payload;
		transient String[] Header_type_info = new String[]{'Header','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/messageview','Header','0','1','false'};
		transient String[] Payload_type_info = new String[]{'Payload','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/messageview','Exception','0','1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/messageview','false','false'};
		transient String[] field_order_type_info = new String[]{'Header','Payload'};
	}
	
	public class msg_Place {
		public WS_BPM_BusinessObjects.Header Header;
		public WS_BPM_BusinessObjects.Place[] Payload;
		transient String[] Header_type_info = new String[]{'Header','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/messageview','Header','0','1','false'};
		transient String[] Payload_type_info = new String[]{'Payload','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/messageview','Place','0','-1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/messageview','false','false'};
		transient String[] field_order_type_info = new String[]{'Header','Payload'};
	}
	public class msg_Product {
		public WS_BPM_BusinessObjects.Header Header;
		public WS_BPM_BusinessObjects.Product[] Product;
		transient String[] Header_type_info = new String[]{'Header','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/messageview','Header','0','1','false'};
		transient String[] Product_type_info = new String[]{'Product','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/messageview','Product','0','-1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/messageview','false','false'};
		transient String[] field_order_type_info = new String[]{'Header','Product'};
	}
	public class msg_Resource {
		public WS_BPM_BusinessObjects.Header Header;
		public WS_BPM_BusinessObjects.Resource[] Payload;
		transient String[] Header_type_info = new String[]{'Header','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/messageview','Header','0','1','false'};
		transient String[] Payload_type_info = new String[]{'Payload','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/messageview','Resource','0','-1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/messageview','false','false'};
		transient String[] field_order_type_info = new String[]{'Header','Payload'};
	}
	public class msg_ResourceOrder {
		public WS_BPM_BusinessObjects.Header Header;
		public WS_BPM_BusinessObjects.ResourceOrder[] Payload;
		transient String[] Header_type_info = new String[]{'Header','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/messageview','Header','0','1','false'};
		transient String[] Payload_type_info = new String[]{'Payload','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/messageview','ResourceOrder','0','-1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/messageview','false','false'};
		transient String[] field_order_type_info = new String[]{'Header','Payload'};
	}
	
	
	public class msg_CustomerAccountId {
		public WS_BPM_BusinessObjects.Header Header;
		public WS_BPM_BusinessObjects.AccountId[] Payload;
		transient String[] Header_type_info = new String[]{'Header','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiermessageview','Header','0','1','false'};
		transient String[] Payload_type_info = new String[]{'Payload','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiermessageview','AccountId','0','-1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiermessageview','false','false'};
		transient String[] field_order_type_info = new String[]{'Header','Payload'};
	}
	public class msg_Memo {
		public WS_BPM_BusinessObjects.Header Header;
		public WS_BPM_BusinessObjects.Memo[] Payload;
		transient String[] Header_type_info = new String[]{'Header','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiermessageview','Header','0','1','false'};
		transient String[] Payload_type_info = new String[]{'Payload','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiermessageview','Memo','0','-1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiermessageview','false','false'};
		transient String[] field_order_type_info = new String[]{'Header','Payload'};
	}
	public class msg_TreatmentHistory {
		public WS_BPM_BusinessObjects.Header Header;
		public WS_BPM_BusinessObjects.TreatmentProfile[] Payload;
		transient String[] Header_type_info = new String[]{'Header','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiermessageview','Header','0','1','false'};
		transient String[] Payload_type_info = new String[]{'Payload','http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiermessageview','TreatmentProfile','0','-1','false'};
		transient String[] apex_schema_type_info = new String[]{'http://www.ibm.com/telecom/v8.5.0/businessobject/system/sid-v12.5/frontiermessageview','false','false'};
		transient String[] field_order_type_info = new String[]{'Header','Payload'};
	}
	
}