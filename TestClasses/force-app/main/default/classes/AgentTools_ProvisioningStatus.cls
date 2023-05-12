public class AgentTools_ProvisioningStatus {
		
	public String SelectedOption {get;set;}
	public String SelectedTab {get;set;}
	public String SearchCriteria {get;set;}
	public List<OrderData> OrderData {get;set;}
	
	public AgentTools_ProvisioningStatus(){
		SelectedTab = 'Orders';
		OrderData = new List<OrderData>();
	}
	
	public List<SelectOption> getOptions(){
		List<SelectOption> options = new List<SelectOption>();
		if(SelectedTab == 'Orders'){
			options.add(new SelectOption('Order #','OrderId'));		
			options.add(new SelectOption('Telephone #','ServiceId'));
		}
		if(SelectedTab == 'Tickets'){
			options.add(new SelectOption('Circuit ID','CircuitId'));
			options.add(new SelectOption('Telephone #','ServiceId'));
			options.add(new SelectOption('Ticket #','TicketId'));			
		}
		return options;		
	}
	
	public void ResetOrderData(){
		OrderData = new List<OrderData>();
	}
	
	public void RetrieveOrderData(){
		OrderData = new List<OrderData>();
		if(SearchCriteria != null){
			WS_ESB_ManageOrder.Callout ManageOrderGetOrderStatus_Callout = new WS_ESB_ManageOrder.Callout();		
			WS_ESB_ManageOrder.ManageOrderGetOrderStatusResponse  GetOrderStatus_Response = ManageOrderGetOrderStatus_Callout.GetOrderStatus(SearchCriteria);
			if(GetOrderStatus_Response.ProductOrder != null){
				for(WS_ESB_BusinessObjects.ProductOrder PO : GetOrderStatus_Response.ProductOrder){
					OrderData.add(new OrderData(PO));
				}
			}
		}
	}
	
	public List<OrderData> getProductOrders(){
		return OrderData;	
	}
	
	public class OrderData {
		public String OrderId {get;set;}
		public String CustomerName {get;set;}
		public String Type {get;set;}
		public String Status {get;set;}
		public String Stage {get;set;}
		public String DueDate {get;set;}
		public String Location {get;set;}
		public String TelephoneNumber {get;set;}
		public String CircuitId {get;set;}
		public String DataSource {get;set;}
		public OrderData(WS_ESB_BusinessObjects.ProductOrder PO){
			if(PO.DataSource != null){
				DataSource = PO.DataSource;
			}
			if(PO.OrderID != null){
				OrderId = PO.OrderID;
			}
			if(PO.OrderType != null){
				if(PO.OrderType.Description != null){
					Type = PO.OrderType.Description;
				}
			}
			if(PO.OrderStage != null){
				if(PO.OrderStage.Description != null){
					Stage = PO.OrderStage.Description;
				}
			}
			if(PO.CustomerAccount != null){
				if(PO.CustomerAccount.Customer != null){
					if(PO.CustomerAccount.Customer.Organization != null){
						if(PO.CustomerAccount.Customer.Organization.OrganizationName != null){
							if(PO.CustomerAccount.Customer.Organization.OrganizationName.TradingName != null){
								CustomerName = PO.CustomerAccount.Customer.Organization.OrganizationName.TradingName;
							}
						}				
					}
					if(PO.CustomerAccount.Customer.TelephoneNumber != null){
						if(PO.CustomerAccount.Customer.TelephoneNumber.Number_x != null){
							TelephoneNumber = PO.CustomerAccount.Customer.TelephoneNumber.Number_x;
						}	
					}					
				}
				if(PO.CustomerAccount.ServiceAddress != null){
					Location = '';
					if(PO.CustomerAccount.ServiceAddress.StreetNrFirst != null){
						Location += PO.CustomerAccount.ServiceAddress.StreetNrFirst + ' ';
					}
					if(PO.CustomerAccount.ServiceAddress.StreetName != null){
						Location += PO.CustomerAccount.ServiceAddress.StreetName + ' ';
					}
					if(PO.CustomerAccount.ServiceAddress.StreetSuffix != null){
						Location += PO.CustomerAccount.ServiceAddress.StreetSuffix + ' ';
					}
					Location += '<br/>';
					if(PO.CustomerAccount.ServiceAddress.Locality != null){
						Location += PO.CustomerAccount.ServiceAddress.Locality + ', ';
					}
					if(PO.CustomerAccount.ServiceAddress.StateOrProvince != null){
						Location += PO.CustomerAccount.ServiceAddress.StateOrProvince;
					}					
				}				
			}
			if(PO.OrderDueDate != null){
				DueDate = PO.OrderDueDate.date().format();
			}
			if(PO.OrderStatusDescription != null){
				Status = PO.OrderStatusDescription;
			}
			
		}
	}
	
	public class ProvisioningData {
		public List<WS_ESB_BusinessObjects.ProductOrder> ProductOrders {get;set;}
		public List<WS_ESB_tML_TA.RetrieveAttributesByTroubleReportIdRequestType> TroubleTickets {get;set;}
	}
	
}