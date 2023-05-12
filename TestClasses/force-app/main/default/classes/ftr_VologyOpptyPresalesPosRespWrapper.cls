/**********************************************************************************************
Name        :  ftr_VologyOpptyPresalesSuResponseWrapper
Developer   :  RajuM
Description :  Response Wrapper class for Success-200 (OK) on Vology Presales email notification
***********************************************************************************************/

public class ftr_VologyOpptyPresalesPosRespWrapper {
    
    public class Response {        
		
        public String operationStatus;
		public Cls_ExecutionStatusMessage_F executionStatusMessage;
	}

	public class Cls_ExecutionStatusMessage {
		public String severity;
		public String service;
		public String operation;
		public String operationStatusCode;
		public String operationStatusDescription;
		public String miscellaneousInformation;
	}	
    
    public class Cls_ExecutionStatusMessage_F {
		public String severity;
		public String service;
		public String operation;
		public String operationStatusCode;
		public String operationStatusDescription;
		public String miscellaneousInformation;
		public Cls_ExecutionStatusMessage executionStatusMessage1;
	}
	
    public Response response;
    
    public static ftr_VologyOpptyPresalesPosRespWrapper parse(String json) {
		return (ftr_VologyOpptyPresalesPosRespWrapper) System.JSON.deserialize(json, ftr_VologyOpptyPresalesPosRespWrapper.class);
	}

}