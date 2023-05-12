@isTest
global class WS_ESB_ManageOrderMockWSTest implements WebServiceMock {
   global void doInvoke(Object stub,
			            Object request,
			            Map<String, Object> response,
			            String endpoint,
			            String soapAction,
			            String requestName,
			            String responseNS,
			            String responseName,
			            String responseType){
	WS_ESB_ManageOrder.ManageOrderGetOrderStatusResponse resp = new WS_ESB_ManageOrder.ManageOrderGetOrderStatusResponse();   	
	//------------------------------------------------------------------------------------------------------------------------------------------------
           WS_ESB_ExecutionContext.ExecutionStatusMessage exStatusMes = new WS_ESB_ExecutionContext.ExecutionStatusMessage();
           exStatusMes.ExecutionStatusSeverity = 'asdf';
		   exStatusMes.ExecutionStatusSource = 'asdf';
		   exStatusMes.ExecutionStatusSourceOperation = 'asdf';
		   exStatusMes.ExecutionStatusCode = 'asdf';
		   exStatusMes.ExecutionStatusDescription = 'asdf';
		   exStatusMes.ExecutionStatusText  = 'asdf';
		   exStatusMes.ExecutionStatusTarget = 'asdf';
		   exStatusMes.ExecutionStatusMessage = new WS_ESB_ExecutionContext.ExecutionStatusMessage[]{};
		   exStatusMes.ExecutionStatusMessage.add(exStatusMes);
           
           resp.ExecutionContext = new WS_ESB_ExecutionContext.ExecutionContext();
           resp.ExecutionContext.ExecutionStatus = new WS_ESB_ExecutionContext.ExecutionStatus();
           resp.ExecutionContext.ExecutionStatus.ExecutionStatusSuccessFlag = true;
		   resp.ExecutionContext.ExecutionStatus.ExecutionStatusAction = 'asdf';
		   resp.ExecutionContext.ExecutionStatus.ExecutionStatusMessage = new WS_ESB_ExecutionContext.ExecutionStatusMessage[]{};
		   resp.ExecutionContext.ExecutionStatus.ExecutionStatusMessage.add(exStatusMes);
           
		   resp.ExecutionContext.ESBHeader = new WS_ESB_ExecutionContext.ESBHeader();
		   resp.ExecutionContext.ESBHeader.ConsumerInfo = new WS_ESB_ExecutionContext.ConsumerInfo();
		   resp.ExecutionContext.ESBHeader.ConsumerInfo.TrackingID = 'asdf';
		   resp.ExecutionContext.ESBHeader.ConsumerInfo.ApplicationID = 'asdf';
		   resp.ExecutionContext.ESBHeader.ConsumerInfo.EmployeeID = 'asdf';
		   resp.ExecutionContext.ESBHeader.ConsumerInfo.UserID = 'asdf';
		   resp.ExecutionContext.ESBHeader.ConsumerInfo.TransactionID = 'asdf';
		   
		   WS_ESB_ExecutionContext.ProviderInfo prInfo = new WS_ESB_ExecutionContext.ProviderInfo();
		   prInfo.ID = 'asdf';
		   prInfo.Name = 'asdf';
		   prInfo.ProviderType = 'asdf';
		   prInfo.VersionID = 'asdf';
		   prInfo.VersionDateTime = DateTime.now();
		   prInfo.Description = 'asdf';
		   prInfo.Location = 'asdf';
		   prInfo.TransactionID = 'asdf';
		
		   resp.ExecutionContext.ESBHeader.ProviderInfo = new WS_ESB_ExecutionContext.ProviderInfo[]{};
		   resp.ExecutionContext.ESBHeader.ProviderInfo.add(prInfo);
		   resp.ExecutionContext.ESBHeader.Heartbeat = true;
		   resp.ExecutionContext.ESBHeader.TrackingID = 'trackthis';
		   
		   WS_ESB_ExecutionContext.TraceResult trcRes = new WS_ESB_ExecutionContext.TraceResult();
		   trcRes.HostName = 'asdf';
		   trcRes.Component = 'asdf';
		   trcRes.DateTime_x = DateTime.now();
		   trcRes.Message = 'asdf';
		   
		   resp.ExecutionContext.ESBHeader.TraceResults = new WS_ESB_ExecutionContext.TraceResults();
		   resp.ExecutionContext.ESBHeader.TraceResults.TraceResult = new WS_ESB_ExecutionContext.TraceResult[]{};
		   resp.ExecutionContext.ESBHeader.TraceResults.TraceResult.add(trcRes);
		   
		   
		   resp.ExecutionContext.ESBHeader.TraceSettings = new WS_ESB_ExecutionContext.TraceSettings();       
		   resp.ExecutionContext.ESBHeader.TraceSettings.TraceEnabled = true;
		   resp.ExecutionContext.ESBHeader.TraceSettings.Component = 'asdf';
		   resp.ExecutionContext.ESBHeader.TraceSettings.TraceLevel = 'asdf';    
  	//------------------------------------------------------------------------------------------------------------------------------------------------
  		              	
  		   WS_ESB_BusinessObjects.OrderInfo orInfo = new WS_ESB_BusinessObjects.OrderInfo();
  		   orInfo.OrderNumber = 'asdf';
           orInfo.Environment = 'asdf';
  		   
   		   resp.RequestCriteria = new WS_ESB_ManageOrder.ManageOrderGetOrderStatusRequestCriteria();
  		   resp.RequestCriteria.ServiceId = 'asdf';
		   resp.RequestCriteria.OrderId = 'asdf';
		   resp.RequestCriteria.LeadOrderId = orInfo;
    //------------------------------------------------------------------------------------------------------------------------------------------------
    resp.ProductOrder = new WS_ESB_BusinessObjects.ProductOrder[]{};   			
	//---------------------------------------------------------------------------------------------------------------------------	
	response.put('response_x', resp);	
	}
}

/*
public WS_ESB_ExecutionContext.ExecutionContext ExecutionContext;
    public WS_ESB_ManageOrder.ManageOrderGetOrderStatusRequestCriteria RequestCriteria;
    public WS_ESB_BusinessObjects.ProductOrder[] ProductOrder {get;set;}
*/