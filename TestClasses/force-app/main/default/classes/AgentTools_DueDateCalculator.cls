public class AgentTools_DueDateCalculator {
	
	public String FacilityStatus1 = 'Facilities Available';
	public String FacilityStatus2 = 'Facilities Unvailable, ICB Required';
	public String WarningMessage1 = 'Product and Facility Status are Mandatory';
	public String WarningMessage2 = 'Due Date Calculation not available for current Product / Facility Status combination';
	public String SelectedProduct {get;set;}
	public String SelectedFacilityStatus {get;set;}
	public Boolean DueDateAdmin {get;set;}
	public Date CalculatedDate {get;set;}
	
	public AgentTools_DueDateCalculator() {    
		if(Userinfo.getUserId().startsWith(System.Label.DueDateAdmin)){
			DueDateAdmin = true;
		}
	}
	
	public PageReference EditDueDateMatrix() {
		PageReference objPR = new PageReference('/a0E/o');
		return objPR;
	}
	
	public List<selectOption> getFacilityStatus() {
		List<selectOption> options = new List<selectOption>();
		options.add(new selectOption('', '- None -'));
		options.add(new selectOption(FacilityStatus1, FacilityStatus1));
		options.add(new selectOption(FacilityStatus2, FacilityStatus2));
        
		if(SelectedProduct != null && SelectedFacilityStatus == null){
			SelectedFacilityStatus = FacilityStatus2;
		}

		return options;
	}
	
	public List<selectOption> getProducts() {
		List<selectOption> options = new List<selectOption>();
		options.add(new selectOption('', '- None -'));
		for (ProductDetails__c Product : [SELECT ICBRequired__c,Id,Name,SIFAvailable__c FROM ProductDetails__c]) { 
			options.add(new selectOption(Product.SIFAvailable__c+','+Product.ICBRequired__c, Product.Name));
		}
		return options;
	}
	
	public void CalculateDate() {
		CalculatedDate = null;

		if(SelectedProduct == null || SelectedFacilityStatus == null){
			ApexPages.addmessage(new ApexPages.message(ApexPages.severity.WARNING,WarningMessage1));
		}else{
			String[] CalculationArray = SelectedProduct.split(',');
			String CalculationValue = 'N/A';
			if(SelectedFacilityStatus.equals(FacilityStatus1)){ CalculationValue = CalculationArray[0]; }
			if(SelectedFacilityStatus.equals(FacilityStatus2)){ CalculationValue = CalculationArray[1]; }
			if(CalculationValue != 'N/A'){
				Date Today = date.today();
				//If the order comes in after 3pm, the Due Date Calculation should begin on the next day. 
				if(datetime.now().hour() >= 15){
					Date newDate = Today.addDays(Integer.valueOf(execSatSun(Integer.valueof(CalculationValue))));
					CalculatedDate = newDate;
				}else{
					//- If the order comes in before 3pm, the Due Date Calculation should begin on the same day.
					date newDate = Today.addDays(Integer.valueOf(execSatSun(Integer.valueof(CalculationValue)))-1);
					CalculatedDate = newDate;
				}
			}else{
				ApexPages.addmessage(new ApexPages.message(ApexPages.severity.WARNING,WarningMessage2));
				CalculatedDate = null;
			}
		}
	}
	
	public Integer execSatSun(Integer Days) {
		Date CurrentDate = date.today();
		Integer CurrentYear = date.today().year();
        
		Date LaborDay = date.newinstance(CurrentYear,9,3);
		Date Thanksgiving = date.newinstance(CurrentYear,11,22);
		Date Christmas = date.newinstance(CurrentYear,12,25);
        
		for(Integer i=1; i <= Days; i++){
			Date newDate=null;
			if(datetime.now().hour() >= 15){
				newDate = CurrentDate.addDays(i);
			}else{
				newDate = CurrentDate.addDays(i-1);
			}
			if( newDate.isSameDay(newDate.toStartOfWeek()) || newDate.isSameDay(newDate.toStartOfWeek().addDays(6)) || newDate.isSameDay(LaborDay) || newDate.isSameDay(Thanksgiving) || newDate.isSameDay(Christmas) ){
				Days++;
			}
		}
		
		return Days;
	}
}