global class BatchforProductCatalog implements Database.batchable<WS_SFA_ManageProductCatalog.Item>{ 
    global final List<WS_SFA_ManageProductCatalog.Item> lstItem;
  //  global final List<WS_SFA_ManageProductCatalog.Item> lstlstItem;  
    
    global BatchforProductCatalog(List<WS_SFA_ManageProductCatalog.Item> li){
        lstItem = li;
    }
     
   global List<WS_SFA_ManageProductCatalog.Item> start(Database.BatchableContext info){ 
       return lstItem;  
   }     
   
   global void execute(Database.BatchableContext info, List<WS_SFA_ManageProductCatalog.Item> scope){
  
	  set<String> setItemId = new set<String>();
	  set<String> setProductId = new set<string>();  
	  map<String,Product2> mapProduct = new map<String,Product2>();
	  
  //Get the Unique Item IDs
	  for(WS_SFA_ManageProductCatalog.Item objLI:scope){
	   setItemId.add(objLI.ItemID);
	  }
	  
	  
	  for(Product2 objP:[select id, name, SKU__c from Product2 where SKU__c in:setItemId]){    //Move to Map
	   mapProduct.put(objP.SKU__c,objP);
	  }
	  
	  list<product2> lstProduct = new list<product2>();
	  //Update the values now
	  
	  List<PricebookEntry> lstPriceBook = new List<PricebookEntry>();
	  List<Pricebook2> lstPB = [SELECT Id,Name FROM Pricebook2 WHERE  isStandard=true limit 1];
	
	          for(WS_SFA_ManageProductCatalog.Item itm : scope){
			   Product2 oProd;
			   if(mapProduct.get(itm.ItemId) != null){
			    oProd= mapProduct.get(itm.ItemId);
			   }
			   else{
			    oProd= new Product2();
			   }
			   
			   oProd.sku__c = itm.ItemID;
			   
			   system.debug('#########'+itm.PrimaryInformation.ShortDescription);
			
			   if(itm.PrimaryInformation.ShortDescription == '' || itm.PrimaryInformation.ShortDescription == null){
			    oprod.Name='Testing';
			   }
			   else{
			    oProd.Name = itm.PrimaryInformation.ShortDescription;
			    system.debug('name'+oprod.Name);
			   }
			   
			   oProd.UnitPrice__c=itm.PrimaryInformation.UnitCost;
			   oProd.IsActive=true;
			   lstProduct.add(oProd);
			   
			   system.debug('listproduct'+lstproduct);
			  }
	  
			  if(lstProduct.size()>0){
			   upsert lstProduct;
			  }
			  
		    for(Product2 objp:lstProduct){
			   setProductId.add(objp.Id);
				  }
		  
		  map<String,PricebookEntry> mapPricebookEntry = new map<String,PricebookEntry>();
		  for(PricebookEntry pe:[select id, name,Product2Id from PricebookEntry where Product2Id In:setProductId ]){
		   mapPricebookEntry.put(pe.Product2Id,pe);
		  }
   
		   for(Product2 objp:lstProduct){
		   system.debug('onjp'+objp.Id);
		   
		   //  PricebookEntry objpb = new PricebookEntry();
  			 PricebookEntry objpb;
			 if(mapPricebookEntry.get(objp.Id) != null){
			
			objpb= mapPricebookEntry.get(objp.Id);
			objpb.UnitPrice = Decimal.valueof(objp.UnitPrice__c);
			objpb.IsActive=true;
			}
			else{
			objpb = new PricebookEntry();
			objpb.Product2Id = objp.id;
			objpb.UnitPrice = Decimal.valueof(objp.UnitPrice__c);
			objpb.Pricebook2Id = lstPB[0].id;
			objpb.IsActive=true;
			
			}
			
			objpb.UseStandardPrice=false;
			
			   lstPriceBook.add(objpb);
			   
			  }
			  
			  System.debug('*** lstPriceBook ' + lstPriceBook.size());
			  
			  if(lstPriceBook.size() > 0){
			   upsert lstPriceBook;
			  }

 }     
   global void finish(Database.BatchableContext info){
   } 
}