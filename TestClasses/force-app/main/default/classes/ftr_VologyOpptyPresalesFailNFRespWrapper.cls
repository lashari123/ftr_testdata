/**********************************************************************************************
Name        :  ftr_VologyOpptyPresalesFailRespWrapper
Developer   :  RajuM
Description :  Response Wrapper class for failure code 404- Not Found on Vology Presales email notification
***********************************************************************************************/

public class ftr_VologyOpptyPresalesFailNFRespWrapper {

	public class Response {
		public String operationStatus;
		public ExecutionStatusMessage executionStatusMessage;
	}

	public class ExecutionStatusMessage {
		public String severity;
		public String service;
		public String operation;
		public String operationStatusCode;
		public String operationStatusDescription;
		public String miscellaneousInformation;
	}

	public Response response;

	
	public static ftr_VologyOpptyPresalesFailNFRespWrapper parse(String json) {
		return (ftr_VologyOpptyPresalesFailNFRespWrapper) System.JSON.deserialize(json, ftr_VologyOpptyPresalesFailNFRespWrapper.class);
	}
}