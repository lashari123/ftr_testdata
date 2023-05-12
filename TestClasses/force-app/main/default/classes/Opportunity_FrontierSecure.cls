public with sharing class Opportunity_FrontierSecure{
	
	public Opportunity CurrentOpportunity {get;set;}
	public Id OpportunityId {get;set;}
	public List<ProductView> listProducts {get;set;}
	public List<ProductView> listTechSupport {get;set;}

	public Opportunity_FrontierSecure(ApexPages.StandardController controller){
		OpportunityId = controller.getId();
		if(!test.isRunningTest()){
			controller.addfields(new List<String>{'Id','StageName','FSecure_ContractValue__c','FSecure_EstimatedFTEs__c','FSecure_ProductContractDuration__c','FSecure_MonthlyNetAdditions__c','FSecure_TechSupportContractDuration__c'});
		}
		CurrentOpportunity = (opportunity)controller.getRecord();
		listProducts = new List<ProductView>();
		listTechSupport = new List<ProductView>();
	}
	
	public Boolean getPendingApproval(){
		Boolean PendingApproval = false;
		List<ProcessInstance> listPI = new List<ProcessInstance>();
		listPI = [SELECT Id,Status,TargetObjectId FROM ProcessInstance WHERE TargetObjectId = :OpportunityId];
		if(listPI.size() > 0){
			for(ProcessInstance PI : listPI){
				if(PI.Status == 'Pending'){
					PendingApproval = true;
				}
			}
		}
		return PendingApproval;
	}
	
	public Boolean getIsCurrentApprover(){
		Boolean isCurrentApprover = false;
		List<ProcessInstance> listPI = new List<ProcessInstance>();
		listPI = [SELECT TargetObjectId,Status,Id,(SELECT Id, ProcessInstanceId, ActorId FROM Workitems) FROM ProcessInstance WHERE TargetObjectId = :OpportunityId];
		if(listPI.size() > 0){
			for(ProcessInstance PI : listPI){
				for(ProcessInstanceWorkitem w : PI.Workitems){
					if(w.ActorId == userinfo.getuserid()){				
						isCurrentApprover = true;
					}
				}
			}
		}
		return isCurrentApprover;
	}

	public List<ProductView> getProducts(){		
		listProducts.clear();
		List<OpportunityLineItem> listOppItems = new List<OpportunityLineItem>();
		Set<Id> ProductIds = new Set<Id>();
		listOppItems = [SELECT Id, Discount, ListPrice, PricebookEntryId, Product2.Id, Product2.Name, Product2.FSecure_Distribution__c, Quantity, SubTotal, TotalPrice, UnitPrice FROM OpportunityLineItem WHERE Product2.Name != 'Tiered Technical Support' AND OpportunityId = :OpportunityId];
		Integer IdCounter = 0;
		for(OpportunityLineItem oli : listOppItems){
			ProductIds.add(oli.Product2.Id);
			listProducts.add(new ProductView(IdCounter,oli));
			IdCounter++;
		}
		List<PriceBookEntry> listPriceBookEntries = new List<PriceBookEntry>();
		listPriceBookEntries = [SELECT Id, Name, UnitPrice, Product2.FSecure_Distribution__c FROM PriceBookEntry WHERE Product2.Id NOT IN :ProductIds AND Name != 'Tiered Technical Support' AND Pricebook2.Name = 'Frontier Secure'];
		for(PriceBookEntry pbe : listPriceBookEntries){
			listProducts.add(new ProductView(IdCounter,pbe));
			IdCounter++;
		}
		for(ProductView pv : listProducts){
			pv.TotalMRC = pv.Offered * pv.MRC;
		}
		listProducts.sort();
		return listProducts;
	}
	
	public List<ProductView> getTechSupport(){
		listTechSupport.clear();
		List<OpportunityLineItem> listOppItems = new List<OpportunityLineItem>();
		Set<Id> ProductIds = new Set<Id>();
		listOppItems = [SELECT Id, Discount, ListPrice, PricebookEntryId, Product2.Id, Product2.Name, Product2.FSecure_Distribution__c, Quantity, SubTotal, TotalPrice, UnitPrice FROM OpportunityLineItem WHERE Product2.Name = 'Tiered Technical Support' AND OpportunityId = :OpportunityId];
		Integer IdCounter = 0;
		for(OpportunityLineItem oli : listOppItems){
			ProductIds.add(oli.Product2.Id);
			listTechSupport.add(new ProductView(IdCounter,oli));
			IdCounter++;
		}
		List<PriceBookEntry> listPriceBookEntries = new List<PriceBookEntry>();
		listPriceBookEntries = [SELECT Id, Name, UnitPrice, Product2.FSecure_Distribution__c FROM PriceBookEntry WHERE Product2.Id NOT IN :ProductIds AND Name = 'Tiered Technical Support' AND Pricebook2.Name = 'Frontier Secure'];
		for(PriceBookEntry pbe : listPriceBookEntries){
			listTechSupport.add(new ProductView(IdCounter,pbe));
			IdCounter++;
		}
		for(ProductView pv : listTechSupport){
			pv.TotalMRC = pv.Offered * pv.MRC;
		}
		listTechSupport.sort();
		return listTechSupport;
	}
	
	public void UpdateProducts(){
		List<OpportunityLineItem> newItems = new List<OpportunityLineItem>();
		List<OpportunityLineItem> updateItems = new List<OpportunityLineItem>();
		List<OpportunityLineItem> removeItems = new List<OpportunityLineItem>();
		
		Decimal ARPC = 0.00;
		Decimal ARPC_Distro = 0.00;
		
		Decimal ProductValue = 0.00;
		if(CurrentOpportunity.FSecure_ProductContractDuration__c != null && CurrentOpportunity.FSecure_ProductContractDuration__c != 0 && CurrentOpportunity.FSecure_MonthlyNetAdditions__c != null && CurrentOpportunity.FSecure_MonthlyNetAdditions__c != 0){
			if(CurrentOpportunity.FSecure_ProductContractDuration__c > 0 && CurrentOpportunity.FSecure_MonthlyNetAdditions__c > 0){
				for(ProductView x : listProducts){
					if(x.Product == null && x.Included){
						ARPC_Distro += (x.ProductEntry.Product2.FSecure_Distribution__c/100);
					}else if(x.Product != null && x.Included){
						ARPC_Distro += (x.Product.Product2.FSecure_Distribution__c/100);
					}			
				}
				for(ProductView x : listProducts){
					if(x.Product == null && x.Included){
						ARPC += ((x.ProductEntry.Product2.FSecure_Distribution__c/100)/ARPC_Distro) * x.MRC;//x.ProductEntry.UnitPrice;
					}else if(x.Product != null && x.Included){
						ARPC += ((x.Product.Product2.FSecure_Distribution__c/100)/ARPC_Distro) * x.MRC;//x.Product.UnitPrice;
					}			
				}		
				
				Map<Integer,Decimal> mapFrontierRevenue = new Map<Integer,Decimal>();					
				mapFrontierRevenue.put(1,CurrentOpportunity.FSecure_MonthlyNetAdditions__c * 78 * ARPC);
				mapFrontierRevenue.put(2,(CurrentOpportunity.FSecure_MonthlyNetAdditions__c * 12 * 1 * 12 * ARPC) + mapFrontierRevenue.get(1));
				mapFrontierRevenue.put(3,(CurrentOpportunity.FSecure_MonthlyNetAdditions__c * 12 * 2 * 12 * ARPC) + mapFrontierRevenue.get(1));
				mapFrontierRevenue.put(4,(CurrentOpportunity.FSecure_MonthlyNetAdditions__c * 12 * 3 * 12 * ARPC) + mapFrontierRevenue.get(1));
				mapFrontierRevenue.put(5,(CurrentOpportunity.FSecure_MonthlyNetAdditions__c * 12 * 4 * 12 * ARPC) + mapFrontierRevenue.get(1));
				
				Map<Integer,Decimal> mapCompoundMultiplier = new Map<Integer,Decimal>();
				mapCompoundMultiplier.put(1,mapFrontierRevenue.get(1));
				mapCompoundMultiplier.put(2,mapFrontierRevenue.get(1)+mapFrontierRevenue.get(2));
				mapCompoundMultiplier.put(3,mapFrontierRevenue.get(1)+mapFrontierRevenue.get(2)+mapFrontierRevenue.get(3));
				mapCompoundMultiplier.put(4,mapFrontierRevenue.get(1)+mapFrontierRevenue.get(2)+mapFrontierRevenue.get(3)+mapFrontierRevenue.get(4));
				mapCompoundMultiplier.put(5,mapFrontierRevenue.get(1)+mapFrontierRevenue.get(2)+mapFrontierRevenue.get(3)+mapFrontierRevenue.get(4)+mapFrontierRevenue.get(5));
							
				if(CurrentOpportunity.FSecure_ProductContractDuration__c != null){
					if(mapCompoundMultiplier.get((integer)CurrentOpportunity.FSecure_ProductContractDuration__c) != null){
						ProductValue = mapCompoundMultiplier.get((integer)CurrentOpportunity.FSecure_ProductContractDuration__c);
					}
				}
				
				for(ProductView x : listProducts){
					if(x.Product == null && x.Included){
						OpportunityLineItem oli = new OpportunityLineItem();
						oli.OpportunityId = OpportunityId;
						oli.PricebookEntryId = x.ProductEntry.Id;
						oli.Quantity = CurrentOpportunity.FSecure_MonthlyNetAdditions__c;
						oli.UnitPrice = x.MRC;
						newItems.add(oli);
					}else if(x.Product != null && x.Included){
						x.Product.Quantity = CurrentOpportunity.FSecure_MonthlyNetAdditions__c;
						x.Product.UnitPrice = x.MRC;
						updateItems.add(x.Product);
					}else if(x.Product != null && x.Included == FALSE){
						removeItems.add(x.Product);
					}			
				}
			}
		}else{
			CurrentOpportunity.FSecure_ProductContractDuration__c = 0;
			CurrentOpportunity.FSecure_MonthlyNetAdditions__c = 0;
			for(ProductView x : listProducts){
				if(x.Product != null){
					removeItems.add(x.Product);
				}			
			}
		}
		
		Decimal TechSupportValue = 0.00;
		if(CurrentOpportunity.FSecure_TechSupportContractDuration__c != null && CurrentOpportunity.FSecure_TechSupportContractDuration__c != 0 && CurrentOpportunity.FSecure_EstimatedFTEs__c != null && CurrentOpportunity.FSecure_EstimatedFTEs__c != 0){
			for(ProductView x : listTechSupport){
				if(x.Product == null && x.Included){
					OpportunityLineItem oli = new OpportunityLineItem();
					oli.OpportunityId = OpportunityId;
					oli.PricebookEntryId = x.ProductEntry.Id;
					oli.Quantity = CurrentOpportunity.FSecure_EstimatedFTEs__c;
					oli.UnitPrice = x.MRC;
					newItems.add(oli);
					if(CurrentOpportunity.FSecure_TechSupportContractDuration__c != null){
						if(CurrentOpportunity.FSecure_EstimatedFTEs__c != null){
							TechSupportValue = ((CurrentOpportunity.FSecure_EstimatedFTEs__c * (x.MRC * 1.15) * ((integer)CurrentOpportunity.FSecure_TechSupportContractDuration__c)/12)/(0.15-1))*-1;
						}
					}
				}else if(x.Product != null && x.Included){
					x.Product.Quantity = CurrentOpportunity.FSecure_EstimatedFTEs__c;
					x.Product.UnitPrice = x.MRC;
					updateItems.add(x.Product);
					if(CurrentOpportunity.FSecure_EstimatedFTEs__c != null && CurrentOpportunity.FSecure_TechSupportContractDuration__c != null){
						TechSupportValue = ((CurrentOpportunity.FSecure_EstimatedFTEs__c * (x.MRC * 1.15) * ((integer)CurrentOpportunity.FSecure_TechSupportContractDuration__c)/12)/(0.15-1))*-1;
					}
				}else if(x.Product != null && x.Included == FALSE){
					removeItems.add(x.Product);
					TechSupportValue = 0.00;
				}			
			}
		}else{
			CurrentOpportunity.FSecure_TechSupportContractDuration__c = 0;
			CurrentOpportunity.FSecure_EstimatedFTEs__c = 0;
			for(ProductView x : listTechSupport){
				if(x.Product != null){
					removeItems.add(x.Product);
				}			
			}
		}
		
		CurrentOpportunity.FSecure_ContractValue__c = ProductValue + TechSupportValue;
		
		if(newItems.size() > 0){
			insert newItems;
		}
		if(updateItems.size() > 0){
			update updateItems;
		}
		if(removeItems.size() > 0){
			delete removeItems;
		}
		update CurrentOpportunity;
	}
	
	public void ResetProducts(){
		CurrentOpportunity.FSecure_ProductContractDuration__c = 0;		
		CurrentOpportunity.FSecure_MonthlyNetAdditions__c = 0;
		CurrentOpportunity.FSecure_TechSupportContractDuration__c = 0;
		CurrentOpportunity.FSecure_EstimatedFTEs__c = 0;
		CurrentOpportunity.FSecure_ContractValue__c = 0.00;
		List<OpportunityLineItem> removeItems = new List<OpportunityLineItem>();
		removeItems = [SELECT Id FROM OpportunityLineItem WHERE OpportunityId = :OpportunityId];
		if(removeItems.size() > 0){
			delete removeItems;
		}
		update CurrentOpportunity;		
	}
	
	public List<SelectOption> getContractOptions(){
		List<SelectOption> options = new List<SelectOption>();
		options.add(new SelectOption('1','1'));
		options.add(new SelectOption('2','2'));
		options.add(new SelectOption('3','3'));
		options.add(new SelectOption('4','4'));
		options.add(new SelectOption('5','5'));
		return options;
	}
	
	public class ProductView implements Comparable{
		public Integer Item {get;set;}
		public Id Id {get;set;}
		public String Name {get;set;}
		public Integer Offered {get;set;}
		public Boolean Included {get;set;}
		public Decimal ARPC_Product;
		public Decimal MRC {get;set;}
		public Decimal TotalMRC {get;set;}
		public OpportunityLineItem Product;
		public PricebookEntry ProductEntry;
		public String ProductType;
		
		public ProductView(Integer i,OpportunityLineItem oli){
			Item = i;
			Id = oli.Id;
			Name = oli.Product2.Name;
			Offered = (integer)oli.Quantity;
			Included = TRUE;
			MRC = oli.UnitPrice;
			TotalMRC = (integer)oli.Quantity * oli.UnitPrice;
			Product = oli;
			if(oli.Product2.Name == 'Tiered Technical Support'){
				ProductType = 'Technical Support';
			}else{
				ProductType = 'Product Offering';
			}			
		}
		
		public ProductView(Integer i,PricebookEntry pbe){
			Item = i;
			Name = pbe.Name;
			Offered = 0;
			MRC = pbe.UnitPrice;
			TotalMRC = 0.00;
			ProductEntry = pbe;
			if(pbe.Name == 'Tiered Technical Support'){
				ProductType = 'Technical Support';
			}else{
				ProductType = 'Product Offering';
			}		
		}
		
		public Integer compareTo(Object compareTo) {
			ProductView compareToPV = (ProductView)compareTo;
			if (Name == compareToPV.Name) return 0;
			if (Name > compareToPV.Name) return 1;
			return -1;  
		}
	}

}