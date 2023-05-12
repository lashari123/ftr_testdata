/**********************************************************************************************
Name        :  ftr_VologyOpptyPresalesFailRespWrapper
Developer   :  RajuM
Description :  Response Wrapper class for failure code 401- UnAuthorized on Vology Presales email notification
***********************************************************************************************/

public class ftr_VologyOpptyPresalesFailUARespWrapper {

	public Error error;

	public class Error {
		public String exceptionType;
		public String messageId;
		public String text;
	}
	
	public static ftr_VologyOpptyPresalesFailUARespWrapper parse(String json) {
		return (ftr_VologyOpptyPresalesFailUARespWrapper) System.JSON.deserialize(json, ftr_VologyOpptyPresalesFailUARespWrapper.class);
	}
}