public class EquoteToolUpdateController {
    
       @AuraEnabled
    public static String fetchit(){
        string urler = URL.getSalesforceBaseUrl().toExternalForm();
        
        return (urler);
    } 
    
    @auraEnabled 
    public static String getProductType(String recordId){
        String val = '';
        Opportunity opp = new Opportunity();
        if(recordId != null){
            opp = [select id,Contract_Term_Years__c,Types_of_Product__c from Opportunity where id =: recordId limit 1];
        }
        if(opp != null && opp.Types_of_Product__c != null){
            val = opp.Types_of_Product__c;
        }
        
        return val;
    }
    @auraEnabled 

    public static void deleteProd(list<object> allProductList,string recordId,integer siteNumber){
        system.debug('alll==========='+allProductList);
         system.debug('recordId==========='+recordId);
 system.debug('siteNumber==========='+siteNumber);
        
        
        
        Opportunity opp = new Opportunity();
        set<Id> ids = new set<Id>();
        if(recordId != null){
            opp = [select id,Pricebook2Id,Contract_Term_Years__c from Opportunity where id =: recordId limit 1];
        }
              
        
        List<OpportunityLineItem> oppItemList = new List<OpportunityLineItem>();
        List<OpportunityLineItem> oppLineItemList = new List<OpportunityLineItem>();
        List<OpportunityLineItem> oppLineItemList2 = new List<OpportunityLineItem>();
        if(recordId != null && siteNumber != null && opp.id != null){
            oppLineItemList = [Select id,Site__c,Product2Id,OpportunityId,Site_Number__c,Filter_Product__c from OpportunityLineItem where OpportunityId =: opp.id and Site_Number__c =: siteNumber and Filter_Product__c =: 'Parent'];
        }
         system.debug('========oppLineItemList========'+oppLineItemList.size());
       if(allProductList != null && !allProductList.isEmpty() && oppLineItemList != null && !oppLineItemList.isEmpty()){
             system.debug('========anuj ========');
            for(object wrap : allProductList){
                  for(OpportunityLineItem oppItem : oppLineItemList){
                    //  system.debug('========wrap ========'+wrap.Id);
              
          map<object,object> maps = new map<object,object>();        
                maps= (Map<object, object>)wrap;
                system.debug('==========maps==========='+maps);
                 system.debug('==========maps2==========='+maps.keyset());
                     system.debug('========oppItem ========'+oppItem);
                     system.debug('========oppItem.Product2Id========'+oppItem.Product2Id);
                  if(string.valueOf(maps.get('Id')) == oppItem.Product2Id){
                    }
                    else{
                        ids.add(oppItem.Id);
                    }
                }
            }
        }
       
        system.debug('========deletelistids========'+ids.size());
        oppLineItemList2 = [Select id,Site__c,Product2Id,OpportunityId,Site_Number__c,Filter_Product__c from OpportunityLineItem where id=: ids ];
                system.debug('========deletelist========'+oppLineItemList2);

        if(oppLineItemList2 != null && !oppLineItemList2.isEmpty()){
            delete oppLineItemList2;
        }
    }
    @auraEnabled  
    public static void deleteCustomProd(List<Custom_Product__c> prod,string recordId,integer siteNumber){
        Opportunity opp = new Opportunity();
        set<Id> ids = new set<Id>();
        if(recordId != null){
            opp = [select id,Pricebook2Id,Contract_Term_Years__c from Opportunity where id =: recordId limit 1];
        }
        List<Custom_Product__c> customProdList = new List<Custom_Product__c>();
        List<Custom_Product__c> customProdList2 = new List<Custom_Product__c>();
        if(recordId != null && siteNumber != null){
            customProdList =  [select Id,ProductName__c,Type_of_billing__c,MrcPrice__c,NumberOfSites__c,Quantity__c,Total__c,Opportunity__c,Custom_Product_Identity__c from Custom_Product__c where Opportunity__c =: recordId and NumberOfSites__c =: siteNumber];
        }
        system.debug('====customProdList===='+customProdList);
        if(customProdList != null && !customProdList.isEmpty() && prod != null && !prod.isEmpty()){
            for(Custom_Product__c cus : prod){
                for(Custom_Product__c custom : customProdList){
                    if(cus.Id == custom.Id){
                        
                    }
                    else{
                        ids.add(custom.Id);
                    }
                }
            }
        }
        system.debug('====ids===='+ids);
        if(ids != null && !ids.isEmpty()){
            customProdList2 =  [select Id,ProductName__c,Type_of_billing__c,MrcPrice__c,NumberOfSites__c,Quantity__c,Total__c,Opportunity__c,Custom_Product_Identity__c from Custom_Product__c where id =: ids];
        }
        system.debug('====customProdList2===='+customProdList2);
        try{
            if(customProdList2 != null && !customProdList2.isEmpty()){
                delete customProdList2;
            }
        }Catch(Exception e){}
    }
    
    @auraEnabled  
    public static void saveCustomProduct(List<Custom_Product__c> prod,string recordId,integer numberOfSites){
        system.debug('--recordId--'+numberOfSites);
        system.debug('--recordId--'+recordId);
        system.debug('========prodhhhhhhhhhhh============'+prod);
        List<Custom_Product__c> ucaasProd = new List<Custom_Product__c>();
        List<Custom_Product__c> customUpdateList = new  List<Custom_Product__c>();
        List<Custom_Product__c> customList = new  List<Custom_Product__c>();
        Map<String,Custom_Product__c> mapOfCusProd = new Map<String,Custom_Product__c>();
        Opportunity opp = new Opportunity();
        if(recordId != null){
            opp = [Select id,Name from Opportunity where id =: recordId];
        }
        System.debug('===opp=*==='+opp);
        if(recordId != null && numberOfSites != null){
            customList = [select Id,ProductName__c,Type_of_billing__c,MrcPrice__c,NumberOfSites__c,Quantity__c,Total__c,Opportunity__c,Custom_Product_Identity__c from Custom_Product__c where Opportunity__c =: recordId and NumberOfSites__c =: numberOfSites];
        }
        if(customList != null && !customList.isEmpty()){
            for(Custom_Product__c cus : customList){
                mapOfCusProd.put(cus.Custom_Product_Identity__c,cus);
            }
        }
        
        if(prod != null && !prod.isEmpty()){
            for(Custom_Product__c cust : prod){
                if(cust.Custom_Product_Identity__c != null){
                    if(mapOfCusProd != null && !mapOfCusProd.isEmpty() && mapOfCusProd.containsKey(cust.Custom_Product_Identity__c)){
                        Custom_Product__c custProd = mapOfCusProd.get(cust.Custom_Product_Identity__c);
                        custProd.Total__c  = cust.MrcPrice__c * cust.Quantity__c;
                        custProd.Opportunity__c = opp.Id;
                        custProd.NumberOfSites__c = numberOfSites;
                        custProd.MrcPrice__c = cust.MrcPrice__c;
                        custProd.ProductName__c = cust.ProductName__c;
                        custProd.Type_of_billing__c = cust.Type_of_billing__c;
                        custProd.Quantity__c = cust.Quantity__c;
                        customUpdateList.add(custProd);
                    }
                    else{
                        Custom_Product__c  cusProd = new Custom_Product__c();
                        cusProd.Total__c  = cust.MrcPrice__c * cust.Quantity__c;
                        cusProd.Opportunity__c = opp.Id;
                        cusProd.NumberOfSites__c = numberOfSites;
                        cusProd.MrcPrice__c = cust.MrcPrice__c;
                        cusProd.ProductName__c = cust.ProductName__c;
                        cusProd.Type_of_billing__c = cust.Type_of_billing__c;
                        cusProd.Quantity__c = cust.Quantity__c;
                        ucaasProd.add(cusProd);
                    }
                }
                else{
                    Custom_Product__c  cusProd = new Custom_Product__c();
                    cusProd.Total__c  = cust.MrcPrice__c * cust.Quantity__c;
                    cusProd.Opportunity__c = opp.Id;
                    cusProd.NumberOfSites__c = numberOfSites;
                    cusProd.MrcPrice__c = cust.MrcPrice__c;
                    cusProd.ProductName__c = cust.ProductName__c;
                    cusProd.Type_of_billing__c = cust.Type_of_billing__c;
                    cusProd.Quantity__c = cust.Quantity__c;
                    ucaasProd.add(cusProd); 
                    
                }
            }
        } 
        system.debug('======ucaasProd======'+ucaasProd);
        try{
            update customUpdateList;
            insert ucaasProd; 
        }catch(Exception e){}
    }
    @auraEnabled 
    public static void saveRecord(string recordId,list<WrapperClass> productList,list<WrapperClass> productListAddOn,list<WrapperClass> productListTelecomm,list<WrapperClass> productListIpPhones,list<WrapperClass> productListIPPhonePower,list<WrapperClass> swithesAndPOElist,string selVal4,Integer numberOfSites,string siteId){
        System.debug('==siteId=='+siteId);
        System.debug('==numberOfSites=='+numberOfSites);
        List<WrapperClass> productList1 = new List<WrapperClass> ();
        if(productList != null && !productList.isEmpty()){
            for(WrapperClass wrap : productList) {
                WrapperClass w = new WrapperClass(wrap.product,wrap.boolval,wrap.boolval2,wrap.boolval3,wrap.pricebookEntry,wrap.Total,wrap.NRCTotal);
                productList1.add(w);
                System.debug('==productList=='+wrap);
            }
        }
        System.debug('----productList----'+productList);
        List<OpportunityLineItem> oppItemList = new List<OpportunityLineItem>();
        Map<String,OpportunityLineItem> mapOfOpplineItem = new Map<String,OpportunityLineItem>();
        if(recordId != null && numberOfSites != null){
            oppItemList = [select id,Product2Id,Product_Name__c,Category__c,UNITCOST__c,GPM__c,DISCOUNT__c,Unit_Price__c,TotalPrice,PricebookEntryId,Index__c,Term__c,Part_Number__c,PoE__c,Filter_Product__c,Show_in_PDF__c,VENDOR_PRICE_LIST_TO_OFFER__c,Quantity,Sub_Category__c,Type_of_Billing__c,Product_Type__c,OpportunityId,Site__c,Equipment__c,Site_Number__c,PriceBook2Id__c from OpportunityLineItem where OpportunityId =: recordId AND Site_Number__c =: numberOfSites AND Filter_Product__c =: 'Parent' and Equote_ext_ID__c != null];
        }
        if(oppItemList != null && !oppItemList.isEmpty()){
            for(OpportunityLineItem oppItem: oppItemList){
                mapOfOpplineItem.put(oppItem.Product2Id,oppItem);
            }
        }
        
        
        list<OpportunityLineItem> opplistItem2 = new list<OpportunityLineItem>();
        Opportunity opp = new Opportunity();
        List<OpportunityLineItem> opplistItem = new List<OpportunityLineItem>();
        if(recordId != null){
            opp = [select id,Contract_Term_Years__c,Pricebook2Id from Opportunity where id =: recordId limit 1];
        }
        Integer sizeProd = 0;
        if(productList1 != null && !productList1.isEmpty() && opp != null){
            for(WrapperClass prod : productList1){
                System.debug('=======prod======lic==='+prod.product.Name);
                if(mapOfOpplineItem != null && !mapOfOpplineItem.isEmpty() && mapOfOpplineItem.containsKey(prod.product.Id)){
                    if(prod.boolval == true){
                        OpportunityLineItem existOppItem = mapOfOpplineItem.get(prod.product.Id);
                        existOppItem.Quantity = decimal.valueOf(prod.product.Quantity__c);
                        if(prod.pricebookEntry.Type_of_Billing__c == 'MRC'){
                            if(prod.pricebookEntry.UnitPrice != null) {
                                existOppItem.Unit_Price__c = prod.pricebookEntry.UnitPrice;
                                existOppItem.TotalPrice = existOppItem.Quantity * prod.pricebookEntry.UnitPrice;    
                            }   
                        }
                        else{
                            if(prod.pricebookEntry.UnitPrice != null) {
                                existOppItem.NRC__c = prod.pricebookEntry.UnitPrice;
                                existOppItem.TotalPrice = prod.pricebookEntry.UnitPrice * existOppItem.Quantity;   
                            } 
                        }
                        opplistItem2.add(existOppItem);
                    }
                }else{
                    if(prod.boolval == true){
                        OpportunityLineItem oppLineProd = new OpportunityLineItem();
                        oppLineProd.Product2Id = prod.product.Id;
                        oppLineProd.Product_Name__c = prod.product.Name;
                        oppLineProd.Category__c = prod.product.Family;
                        oppLineProd.Sub_Category__c = prod.product.Product_Subcategory__c;
                        oppLineProd.Type_of_Billing__c = prod.pricebookEntry.Type_of_Billing__c;
                        oppLineProd.Product_Type__c = prod.product.Product_Type__c;
                        oppLineProd.OpportunityId   = opp.Id;
                        oppLineProd.Equote_ext_ID__c = opp.Id+''+numberOfSites+''+System.Now();
                        oppLineProd.Site__c = siteId;
                        oppLineProd.Equipment__c = prod.product.Equipment__c;
                        oppLineProd.Site_Number__c = numberOfSites;
                        oppLineProd.PriceBook2Id__c = prod.pricebookEntry.Pricebook2Id;
                        oppLineProd.PricebookEntryId     = prod.pricebookEntry.id;
                        oppLineProd.Index__c = prod.product.License_Order__c;
                        oppLineProd.Quantity = decimal.valueOf(prod.product.Quantity__c);
                        oppLineProd.Term__c = prod.product.Term__c;
                        oppLineProd.Part_Number__c = prod.product.Part_Number_of_Product__c;
                        oppLineProd.PoE__c = selVal4;
                        oppLineProd.Filter_Product__c = 'Parent';
                        oppLineProd.Show_in_PDF__c = prod.product.Show_in_PDF__c;
                        oppLineProd.VENDOR_PRICE_LIST_TO_OFFER__c = prod.pricebookEntry.VENDORPRICELISTTOFTR__c;
                        oppLineProd.UNITCOST__c = prod.pricebookEntry.UNITCOST__c;
                        oppLineProd.GPM__c = prod.pricebookEntry.GPM__c;
                        oppLineProd.DISCOUNT__c = prod.pricebookEntry.DISCOUNT_Price__c;
                        oppLineProd.isE911__c = prod.product.isE911__c;
                        oppLineProd.isElite__c = prod.product.isElite__c;
                        oppLineProd.isEssential__c = prod.product.isEssential__c;
                        oppLineProd.isOutbound__c = prod.product.isOutbound__c;
                        oppLineProd.isPremier__c = prod.product.isPremier__c;
                        oppLineProd.isTollFreeNum__c = prod.product.isTollFreeNum__c;
                        oppLineProd.isWebFax__c = prod.product.isWebFax__c;
                        if(prod.pricebookEntry.Type_of_Billing__c == 'MRC'){
                            if(prod.pricebookEntry.UnitPrice != null) {
                                oppLineProd.Unit_Price__c = prod.pricebookEntry.UnitPrice;
                                oppLineProd.TotalPrice = oppLineProd.Quantity * prod.pricebookEntry.UnitPrice;    
                            }   
                        }
                        else{
                            if(prod.pricebookEntry.UnitPrice != null) {
                                oppLineProd.NRC__c = prod.pricebookEntry.UnitPrice;
                                oppLineProd.TotalPrice = prod.pricebookEntry.UnitPrice * oppLineProd.Quantity;   
                            } 
                        }
                        sizeProd += Integer.valueOf(prod.product.Quantity__c);
                        
                        opplistItem.add(oppLineProd);
                    }
                }
                
            }
        }
        List<WrapperClass> productListAddOn1 = new List<WrapperClass> ();
        if(productListAddOn != null && !productListAddOn.isEmpty()){
            for(WrapperClass wrap : productListAddOn) {
                WrapperClass w = new WrapperClass(wrap.product,wrap.boolval,wrap.boolval2,wrap.boolval3,wrap.pricebookEntry,wrap.Total,wrap.NRCTotal);
                productListAddOn1.add(w);
                System.debug('==productListAddOn1=='+wrap);
            }
        }
        System.debug('----productListAddOn1----'+productListAddOn1);
        if(productListAddOn1 != null && !productListAddOn1.isEmpty() && opp != null){
            for(WrapperClass prod : productListAddOn1){
                System.debug('=======prod======add==='+prod.product.Name);
                if(mapOfOpplineItem != null && !mapOfOpplineItem.isEmpty() && mapOfOpplineItem.containsKey(prod.product.Id)){
                    if(prod.boolval == true){
                        OpportunityLineItem existOppItem = mapOfOpplineItem.get(prod.product.Id);
                        existOppItem.Quantity = decimal.valueOf(prod.product.Quantity__c);
                        if(prod.pricebookEntry.Type_of_Billing__c == 'MRC'){
                            if(prod.pricebookEntry.UnitPrice != null) {
                                existOppItem.Unit_Price__c = prod.pricebookEntry.UnitPrice;
                                existOppItem.TotalPrice = existOppItem.Quantity * prod.pricebookEntry.UnitPrice;    
                            }   
                        }
                        else{
                            if(prod.pricebookEntry.UnitPrice != null) {
                                existOppItem.NRC__c = prod.pricebookEntry.UnitPrice;
                                existOppItem.TotalPrice = prod.pricebookEntry.UnitPrice * existOppItem.Quantity;   
                            } 
                        }
                        opplistItem2.add(existOppItem);
                    }
                }else{
                    if(prod.boolval == true){
                        OpportunityLineItem oppLineProd = new OpportunityLineItem();
                        oppLineProd.Product2Id = prod.product.Id;
                        oppLineProd.Product_Name__c = prod.product.Name;
                        oppLineProd.Category__c    = prod.product.Family;
                        oppLineProd.Sub_Category__c = prod.product.Product_Subcategory__c;
                        oppLineProd.Type_of_Billing__c = prod.pricebookEntry.Type_of_Billing__c;
                        oppLineProd.Product_Type__c = prod.product.Product_Type__c;
                        oppLineProd.OpportunityId  = opp.Id;
                        oppLineProd.Equote_ext_ID__c = opp.Id+''+numberOfSites+''+System.Now();
                        oppLineProd.Site__c = siteId;
                        oppLineProd.Equipment__c = prod.product.Equipment__c;
                        oppLineProd.Term__c = prod.product.Term__c;
                        oppLineProd.Site_Number__c = numberOfSites;
                        oppLineProd.Index__c = prod.product.License_Order__c;
                        oppLineProd.PriceBook2Id__c = prod.pricebookEntry.Pricebook2Id;
                        oppLineProd.PricebookEntryId    = prod.pricebookEntry.id;
                        oppLineProd.Quantity    = decimal.valueOf(prod.product.Quantity__c);
                        oppLineProd.Part_Number__c = prod.product.Part_Number_of_Product__c;
                        oppLineProd.PoE__c = selVal4;
                        oppLineProd.Show_in_PDF__c = prod.product.Show_in_PDF__c;
                        oppLineProd.Filter_Product__c = 'Parent';
                        oppLineProd.VENDOR_PRICE_LIST_TO_OFFER__c = prod.pricebookEntry.VENDORPRICELISTTOFTR__c;
                        oppLineProd.DISCOUNT__c = prod.pricebookEntry.DISCOUNT_Price__c;
                        oppLineProd.GPM__c = prod.pricebookEntry.GPM__c;
                        oppLineProd.UNITCOST__c = prod.pricebookEntry.UNITCOST__c;
                        oppLineProd.isE911__c = prod.product.isE911__c;
                        oppLineProd.isElite__c = prod.product.isElite__c;
                        oppLineProd.isEssential__c = prod.product.isEssential__c;
                        oppLineProd.isOutbound__c = prod.product.isOutbound__c;
                        oppLineProd.isPremier__c = prod.product.isPremier__c;
                        oppLineProd.isTollFreeNum__c = prod.product.isTollFreeNum__c;
                        oppLineProd.isWebFax__c = prod.product.isWebFax__c;
                        oppLineProd.isAdditionalDID__c = prod.product.isAdditionalDID__c;
                        oppLineProd.isCallerId__c = prod.product.isCallerId__c;
                        oppLineProd.isAdditionalDirectory__c = prod.product.isAdditionalDirectory__c;
                        oppLineProd.isExtendedMarket__c = prod.product.isExtendedMarket__c;
                        oppLineProd.isAdditionalManaged__c = prod.product.isAdditionalManaged__c;
                        oppLineProd.isBusinessAnalytic__c = prod.product.isBusinessAnalytic__c;
                        if(prod.pricebookEntry.Type_of_Billing__c == 'MRC'){
                            if(prod.pricebookEntry.UnitPrice != null) {
                                oppLineProd.Unit_Price__c = prod.pricebookEntry.UnitPrice;
                                oppLineProd.TotalPrice = oppLineProd.Quantity * prod.pricebookEntry.UnitPrice;    
                            }   
                        }
                        else{
                            if(prod.pricebookEntry.UnitPrice != null) {
                                oppLineProd.NRC__c = prod.pricebookEntry.UnitPrice;
                                oppLineProd.TotalPrice = prod.pricebookEntry.UnitPrice * oppLineProd.Quantity;   
                            } 
                        }
                        opplistItem.add(oppLineProd);
                    }
                }
                
            }
        }
        List<WrapperClass> productListTelecomm1 = new List<WrapperClass> ();
        if(productListTelecomm != null && !productListTelecomm.isEmpty()){ 
            for(WrapperClass wrap : productListTelecomm) {
                WrapperClass w = new WrapperClass(wrap.product,wrap.boolval,wrap.boolval2,wrap.boolval3,wrap.pricebookEntry,wrap.Total,wrap.NRCTotal);
                productListTelecomm1.add(w);
                System.debug('==productListTelecomm=='+wrap);
            }
        }
        System.debug('----productListTelecomm1----'+productListTelecomm1);
        if(productListTelecomm1 != null && !productListTelecomm1.isEmpty() && opp != null){
            for(WrapperClass prod : productListTelecomm1){
                System.debug('=======prod======add==='+prod.product.Name);
                if(mapOfOpplineItem != null && !mapOfOpplineItem.isEmpty() && mapOfOpplineItem.containsKey(prod.product.Id)){
                    if(prod.boolval == true){
                        OpportunityLineItem existOppItem = mapOfOpplineItem.get(prod.product.Id);
                        existOppItem.Quantity = decimal.valueOf(prod.product.Quantity__c);
                        if(prod.pricebookEntry.Type_of_Billing__c == 'MRC'){
                            if(prod.pricebookEntry.UnitPrice != null) {
                                existOppItem.Unit_Price__c = prod.pricebookEntry.UnitPrice;
                                existOppItem.TotalPrice = existOppItem.Quantity * prod.pricebookEntry.UnitPrice;    
                            }   
                        }
                        else{
                            if(prod.pricebookEntry.UnitPrice != null) {
                                existOppItem.NRC__c = prod.pricebookEntry.UnitPrice;
                                existOppItem.TotalPrice = prod.pricebookEntry.UnitPrice * existOppItem.Quantity;   
                            } 
                        }
                        opplistItem2.add(existOppItem);
                    }
                }else{
                    if(prod.boolval == true){
                        OpportunityLineItem oppLineProd = new OpportunityLineItem();
                        oppLineProd.Product2Id = prod.product.Id;
                        oppLineProd.Product_Name__c = prod.product.Name;
                        oppLineProd.Category__c    = prod.product.Family;
                        oppLineProd.Sub_Category__c = prod.product.Product_Subcategory__c;
                        oppLineProd.Type_of_Billing__c = prod.pricebookEntry.Type_of_Billing__c;
                        oppLineProd.Product_Type__c = prod.product.Product_Type__c;
                        oppLineProd.OpportunityId  = opp.Id;
                        oppLineProd.Equote_ext_ID__c = opp.Id+''+numberOfSites+''+System.Now();
                        oppLineProd.Site__c = siteId;
                        oppLineProd.Equipment__c = prod.product.Equipment__c;
                        oppLineProd.Term__c = prod.product.Term__c;
                        oppLineProd.Index__c = prod.product.License_Order__c;
                        oppLineProd.Site_Number__c = numberOfSites;
                        oppLineProd.PriceBook2Id__c = prod.pricebookEntry.Pricebook2Id;
                        oppLineProd.PricebookEntryId     = prod.pricebookEntry.id;
                        oppLineProd.Part_Number__c = prod.product.Part_Number_of_Product__c;
                        oppLineProd.PoE__c = selVal4;
                        oppLineProd.Show_in_PDF__c = prod.product.Show_in_PDF__c;
                        oppLineProd.Filter_Product__c = 'Parent';
                        oppLineProd.VENDOR_PRICE_LIST_TO_OFFER__c = prod.pricebookEntry.VENDORPRICELISTTOFTR__c;
                        oppLineProd.UNITCOST__c = prod.pricebookEntry.UNITCOST__c;
                        oppLineProd.GPM__c = prod.pricebookEntry.GPM__c;
                        oppLineProd.DISCOUNT__c = prod.pricebookEntry.DISCOUNT_Price__c;
                        oppLineProd.Quantity    = decimal.valueOf(prod.product.Quantity__c);
                        if(prod.pricebookEntry.Type_of_Billing__c == 'MRC'){
                            if(prod.pricebookEntry.UnitPrice != null) {
                                oppLineProd.Unit_Price__c = prod.pricebookEntry.UnitPrice;
                                oppLineProd.TotalPrice = oppLineProd.Quantity * prod.pricebookEntry.UnitPrice;    
                            }   
                        }
                        else{
                            if(prod.pricebookEntry.UnitPrice != null) {
                                oppLineProd.NRC__c = prod.pricebookEntry.UnitPrice;
                                oppLineProd.TotalPrice = prod.pricebookEntry.UnitPrice * oppLineProd.Quantity;   
                            } 
                        }
                        opplistItem.add(oppLineProd);
                    }
                }
                
            }
        }
        List<WrapperClass> productListIpPhones1 = new List<WrapperClass> ();
        if(productListIpPhones != null && !productListIpPhones.isEmpty()){
            for(WrapperClass wrap : productListIpPhones) {
                WrapperClass w = new WrapperClass(wrap.product,wrap.boolval,wrap.boolval2,wrap.boolval3,wrap.pricebookEntry,wrap.Total,wrap.NRCTotal);
                productListIpPhones1.add(w);
                System.debug('==productListIpPhones=='+wrap);
            }
        }
        //System.debug('----productListIpPhones1----'+productListIpPhones1);
        if(productListIpPhones1 != null && !productListIpPhones1.isEmpty() && opp != null){
            for(WrapperClass prod : productListIpPhones1){
                System.debug('=======prod======add==='+prod.product.Name);
                if(mapOfOpplineItem != null && !mapOfOpplineItem.isEmpty() && mapOfOpplineItem.containsKey(prod.product.Id)){
                    if(prod.boolval == true){
                        OpportunityLineItem existOppItem = mapOfOpplineItem.get(prod.product.Id);
                        existOppItem.Quantity = decimal.valueOf(prod.product.Quantity__c);
                        if(prod.pricebookEntry.Type_of_Billing__c == 'MRC'){
                            if(prod.pricebookEntry.UnitPrice != null) {
                                existOppItem.Unit_Price__c = prod.pricebookEntry.UnitPrice;
                                existOppItem.TotalPrice = existOppItem.Quantity * prod.pricebookEntry.UnitPrice;    
                            }   
                        }
                        else{
                            if(prod.pricebookEntry.UnitPrice != null) {
                                existOppItem.NRC__c = prod.pricebookEntry.UnitPrice;
                                existOppItem.TotalPrice = prod.pricebookEntry.UnitPrice * existOppItem.Quantity;   
                            } 
                        }
                        opplistItem2.add(existOppItem);
                    }
                }else{
                    if(prod.boolval == true){
                        OpportunityLineItem oppLineProd = new OpportunityLineItem();
                        oppLineProd.Product2Id = prod.product.Id;
                        oppLineProd.Product_Name__c = prod.product.Name;
                        oppLineProd.Category__c    = prod.product.Family;
                        oppLineProd.Sub_Category__c = prod.product.Product_Subcategory__c;
                        oppLineProd.Type_of_Billing__c = prod.pricebookEntry.Type_of_Billing__c;
                        oppLineProd.Product_Type__c = prod.product.Product_Type__c;
                        oppLineProd.OpportunityId  = opp.Id;
                        oppLineProd.Equote_ext_ID__c = opp.Id+''+numberOfSites+''+System.Now();
                        oppLineProd.Site__c = siteId;
                        oppLineProd.Equipment__c = prod.product.Equipment__c;
                        oppLineProd.Term__c = prod.product.Term__c;
                        oppLineProd.Index__c = prod.product.License_Order__c;
                        oppLineProd.Site_Number__c = numberOfSites;
                        oppLineProd.PriceBook2Id__c = prod.pricebookEntry.Pricebook2Id;
                        oppLineProd.PricebookEntryId    = prod.pricebookEntry.id;
                        oppLineProd.Part_Number__c = prod.product.Part_Number_of_Product__c;
                        oppLineProd.Quantity    = decimal.valueOf(prod.product.Quantity__c);
                        oppLineProd.PoE__c = selVal4;
                        oppLineProd.Filter_Product__c = 'Parent';
                        oppLineProd.VENDOR_PRICE_LIST_TO_OFFER__c = prod.pricebookEntry.VENDORPRICELISTTOFTR__c;
                        oppLineProd.GPM__c = prod.pricebookEntry.GPM__c;
                        oppLineProd.DISCOUNT__c = prod.pricebookEntry.DISCOUNT_Price__c;
                        oppLineProd.UNITCOST__c = prod.pricebookEntry.UNITCOST__c;
                        oppLineProd.Show_in_PDF__c = prod.product.Show_in_PDF__c;
                        if(prod.pricebookEntry.Type_of_Billing__c == 'MRC'){
                            if(prod.pricebookEntry.UnitPrice != null) {
                                oppLineProd.Unit_Price__c = prod.pricebookEntry.UnitPrice;
                                oppLineProd.TotalPrice = oppLineProd.Quantity * prod.pricebookEntry.UnitPrice;    
                            }   
                        }
                        else{
                            if(prod.pricebookEntry.UnitPrice != null) {
                                oppLineProd.NRC__c = prod.pricebookEntry.UnitPrice;
                                oppLineProd.TotalPrice = prod.pricebookEntry.UnitPrice * oppLineProd.Quantity;   
                            } 
                        }
                        opplistItem.add(oppLineProd);
                    }
                }
                
            }
        }
        List<WrapperClass> productListIPPhonePower1 = new List<WrapperClass> ();
        for(WrapperClass wrap : productListIPPhonePower) {
            WrapperClass w = new WrapperClass(wrap.product,wrap.boolval,wrap.boolval2,wrap.boolval3,wrap.pricebookEntry,wrap.Total,wrap.NRCTotal);
            productListIPPhonePower1.add(w);
            System.debug('==productListIPPhonePower1=='+wrap);
        }
        //System.debug('----productListIPPhonePower1----'+productListIPPhonePower1);
        if(productListIPPhonePower1 != null && !productListIPPhonePower1.isEmpty() && opp != null){
            for(WrapperClass prod : productListIPPhonePower1){
                System.debug('=======prod======add==='+prod.product.Name);
                if(mapOfOpplineItem != null && !mapOfOpplineItem.isEmpty() && mapOfOpplineItem.containsKey(prod.product.Id)){
                    if(prod.boolval == true){
                        OpportunityLineItem existOppItem = mapOfOpplineItem.get(prod.product.Id);
                        existOppItem.Quantity = decimal.valueOf(prod.product.Quantity__c);
                        if(prod.pricebookEntry.Type_of_Billing__c == 'MRC'){
                            if(prod.pricebookEntry.UnitPrice != null) {
                                existOppItem.Unit_Price__c = prod.pricebookEntry.UnitPrice;
                                existOppItem.TotalPrice = existOppItem.Quantity * prod.pricebookEntry.UnitPrice;    
                            }   
                        }
                        else{
                            if(prod.pricebookEntry.UnitPrice != null) {
                                existOppItem.NRC__c = prod.pricebookEntry.UnitPrice;
                                existOppItem.TotalPrice = prod.pricebookEntry.UnitPrice * existOppItem.Quantity;   
                            } 
                        }
                        opplistItem2.add(existOppItem);
                    }
                }else{
                    if(prod.boolval == true){
                        OpportunityLineItem oppLineProd = new OpportunityLineItem();
                        oppLineProd.Product2Id = prod.product.Id;
                        oppLineProd.Product_Name__c = prod.product.Name;
                        oppLineProd.Category__c    = prod.product.Family;
                        oppLineProd.Sub_Category__c = prod.product.Product_Subcategory__c;
                        oppLineProd.Type_of_Billing__c = prod.pricebookEntry.Type_of_Billing__c;
                        oppLineProd.Product_Type__c = prod.product.Product_Type__c;
                        oppLineProd.OpportunityId  = opp.Id;
                        oppLineProd.Equote_ext_ID__c = opp.Id+''+numberOfSites+''+System.Now();
                        oppLineProd.Site__c = siteId;
                        oppLineProd.Equipment__c = prod.product.Equipment__c;
                        oppLineProd.Term__c = prod.product.Term__c;
                        oppLineProd.Index__c = prod.product.License_Order__c;
                        oppLineProd.Site_Number__c = numberOfSites;
                        oppLineProd.PriceBook2Id__c = prod.pricebookEntry.Pricebook2Id;
                        oppLineProd.PricebookEntryId    = prod.pricebookEntry.id;
                        oppLineProd.Part_Number__c = prod.product.Part_Number_of_Product__c;
                        oppLineProd.PoE__c = selVal4;
                        oppLineProd.Show_in_PDF__c = prod.product.Show_in_PDF__c;
                        oppLineProd.Filter_Product__c = 'Parent';
                        oppLineProd.VENDOR_PRICE_LIST_TO_OFFER__c = prod.pricebookEntry.VENDORPRICELISTTOFTR__c;
                        oppLineProd.DISCOUNT__c = prod.pricebookEntry.DISCOUNT_Price__c;
                        oppLineProd.GPM__c = prod.pricebookEntry.GPM__c;
                        oppLineProd.UNITCOST__c = prod.pricebookEntry.UNITCOST__c;
                        oppLineProd.Quantity    = decimal.valueOf(prod.product.Quantity__c);
                        if(prod.pricebookEntry.Type_of_Billing__c == 'MRC'){
                            if(prod.pricebookEntry.UnitPrice != null) {
                                oppLineProd.Unit_Price__c = prod.pricebookEntry.UnitPrice;
                                oppLineProd.TotalPrice = oppLineProd.Quantity * prod.pricebookEntry.UnitPrice;    
                            }   
                        }
                        else{
                            if(prod.pricebookEntry.UnitPrice != null) {
                                oppLineProd.NRC__c = prod.pricebookEntry.UnitPrice;
                                oppLineProd.TotalPrice = prod.pricebookEntry.UnitPrice * oppLineProd.Quantity;   
                            } 
                        }
                        opplistItem.add(oppLineProd);
                    }
                }
                
            }
        }
        List<WrapperClass> swithesAndPOElist1 = new List<WrapperClass> ();
        for(WrapperClass wrap : swithesAndPOElist) {
            WrapperClass w = new WrapperClass(wrap.product,wrap.boolval,wrap.boolval2,wrap.boolval3,wrap.pricebookEntry,wrap.Total,wrap.NRCTotal);
            swithesAndPOElist1.add(w);
            System.debug('==swithesAndPOElist1=='+wrap);
        }
        if(swithesAndPOElist1 != null && !swithesAndPOElist1.isEmpty() && opp != null){
            for(WrapperClass prod : swithesAndPOElist1){
                System.debug('=======prod======add==='+prod.product.Name);
                if(mapOfOpplineItem != null && !mapOfOpplineItem.isEmpty() && mapOfOpplineItem.containsKey(prod.product.Id)){
                    if(prod.boolval == true){
                        OpportunityLineItem existOppItem = mapOfOpplineItem.get(prod.product.Id);
                        existOppItem.Quantity = decimal.valueOf(prod.product.Quantity__c);
                        if(prod.pricebookEntry.Type_of_Billing__c == 'MRC'){
                            if(prod.pricebookEntry.UnitPrice != null) {
                                existOppItem.Unit_Price__c = prod.pricebookEntry.UnitPrice;
                                existOppItem.TotalPrice = existOppItem.Quantity * prod.pricebookEntry.UnitPrice;    
                            }   
                        }
                        else{
                            if(prod.pricebookEntry.UnitPrice != null) {
                                existOppItem.NRC__c = prod.pricebookEntry.UnitPrice;
                                existOppItem.TotalPrice = prod.pricebookEntry.UnitPrice * existOppItem.Quantity;   
                            } 
                        }
                        opplistItem2.add(existOppItem);
                    }
                }else{
                    if(prod.boolval == true){
                        OpportunityLineItem oppLineProd = new OpportunityLineItem();
                        oppLineProd.Product2Id = prod.product.Id;
                        oppLineProd.Product_Name__c = prod.product.Name;
                        oppLineProd.Category__c    = prod.product.Family;
                        oppLineProd.Sub_Category__c = prod.product.Product_Subcategory__c;
                        oppLineProd.Type_of_Billing__c = prod.pricebookEntry.Type_of_Billing__c;
                        oppLineProd.Product_Type__c = prod.product.Product_Type__c;
                        oppLineProd.OpportunityId  = opp.Id;
                        oppLineProd.Equote_ext_ID__c = opp.Id+''+numberOfSites+''+System.Now();
                        oppLineProd.Site__c = siteId;
                        oppLineProd.Equipment__c = prod.product.Equipment__c;
                        oppLineProd.Term__c = prod.product.Term__c;
                        oppLineProd.Index__c = prod.product.License_Order__c;
                        oppLineProd.Site_Number__c = numberOfSites;
                        oppLineProd.PriceBook2Id__c = prod.pricebookEntry.Pricebook2Id;
                        oppLineProd.PricebookEntryId    = prod.pricebookEntry.id;
                        oppLineProd.Part_Number__c = prod.product.Part_Number_of_Product__c;
                        oppLineProd.PoE__c = selVal4;
                        oppLineProd.Show_in_PDF__c = prod.product.Show_in_PDF__c;
                        oppLineProd.Filter_Product__c = 'Parent';
                        oppLineProd.VENDOR_PRICE_LIST_TO_OFFER__c = prod.pricebookEntry.VENDORPRICELISTTOFTR__c;
                        oppLineProd.DISCOUNT__c = prod.pricebookEntry.DISCOUNT_Price__c;
                        oppLineProd.GPM__c = prod.pricebookEntry.GPM__c;
                        oppLineProd.UNITCOST__c = prod.pricebookEntry.UNITCOST__c;
                        oppLineProd.Quantity    = decimal.valueOf(prod.product.Quantity__c);
                        if(prod.pricebookEntry.Type_of_Billing__c == 'MRC'){
                            if(prod.pricebookEntry.UnitPrice != null) {
                                oppLineProd.Unit_Price__c = prod.pricebookEntry.UnitPrice;
                                oppLineProd.TotalPrice = oppLineProd.Quantity * prod.pricebookEntry.UnitPrice;    
                            }   
                        }
                        else{
                            if(prod.pricebookEntry.UnitPrice != null) {
                                oppLineProd.NRC__c = prod.pricebookEntry.UnitPrice;
                                oppLineProd.TotalPrice = prod.pricebookEntry.UnitPrice * oppLineProd.Quantity;   
                            } 
                        }
                        opplistItem.add(oppLineProd);
                    }
                }
                
            }
        }
        try{
            update opplistItem2;
            insert opplistItem;
        }catch(Exception e){}
    }
    @auraEnabled 
    public static void saveSmartRecord(string recordId,list<WrapperClass> productList,list<WrapperClass> productListAddOn,list<WrapperClass> productListIpPhones,list<WrapperClass> swithesAndPOElist,list<WrapperClass> productListRepair,list<WrapperClass> productListBroadband,list<WrapperClass> productListFIOS,list<WrapperClass> productListFiber,list<WrapperClass> productListBHSI,list<WrapperClass> productListEquipment,list<WrapperClass> productListTeleCom,string selVal4,Integer numberOfSites,string siteId){
        System.debug('==siteId=='+siteId);
        System.debug('==numberOfSites=='+numberOfSites);
        List<WrapperClass> productList1 = new List<WrapperClass> ();
        if(productList != null && !productList.isEmpty()){
            for(WrapperClass wrap : productList) {
                WrapperClass w = new WrapperClass(wrap.product,wrap.boolval,wrap.boolval2,wrap.boolval3,wrap.pricebookEntry,wrap.Total,wrap.NRCTotal);
                productList1.add(w);
                System.debug('==productList=='+wrap);
            }
        }
        System.debug('----productList----'+productList);
        List<OpportunityLineItem> oppItemList = new List<OpportunityLineItem>();
        Map<String,OpportunityLineItem> mapOfOpplineItem = new Map<String,OpportunityLineItem>();
        if(recordId != null && numberOfSites != null){
            oppItemList = [select id,Product2Id,Product_Name__c,Category__c,UNITCOST__c,GPM__c,DISCOUNT__c,Unit_Price__c,TotalPrice,PricebookEntryId,Index__c,Term__c,Part_Number__c,PoE__c,Filter_Product__c,Show_in_PDF__c,VENDOR_PRICE_LIST_TO_OFFER__c,Quantity,Sub_Category__c,Type_of_Billing__c,Product_Type__c,OpportunityId,Site__c,Equipment__c,Site_Number__c,PriceBook2Id__c from OpportunityLineItem where OpportunityId =: recordId AND Site_Number__c =: numberOfSites AND Filter_Product__c =: 'Parent' and Equote_ext_ID__c != null];
        }
        if(oppItemList != null && !oppItemList.isEmpty()){
            for(OpportunityLineItem oppItem: oppItemList){
                mapOfOpplineItem.put(oppItem.Product2Id,oppItem);
            }
        }
        
        
        list<OpportunityLineItem> opplistItem2 = new list<OpportunityLineItem>();
        Opportunity opp = new Opportunity();
        List<OpportunityLineItem> opplistItem = new List<OpportunityLineItem>();
        if(recordId != null){
            opp = [select id,Contract_Term_Years__c,Pricebook2Id from Opportunity where id =: recordId limit 1];
        }
        Integer sizeProd = 0;
        if(productList1 != null && !productList1.isEmpty() && opp != null){
            for(WrapperClass prod : productList1){
                System.debug('=======prod======lic==='+prod.product.Name);
                if(mapOfOpplineItem != null && !mapOfOpplineItem.isEmpty() && mapOfOpplineItem.containsKey(prod.product.Id)){
                    if(prod.boolval == true){
                        OpportunityLineItem existOppItem = mapOfOpplineItem.get(prod.product.Id);
                        existOppItem.Quantity = decimal.valueOf(prod.product.Quantity__c);
                        if(prod.pricebookEntry.Type_of_Billing__c == 'MRC'){
                            if(prod.pricebookEntry.UnitPrice != null) {
                                existOppItem.Unit_Price__c = prod.pricebookEntry.UnitPrice;
                                existOppItem.TotalPrice = existOppItem.Quantity * prod.pricebookEntry.UnitPrice;    
                            }   
                        }
                        else{
                            if(prod.pricebookEntry.UnitPrice != null) {
                                existOppItem.NRC__c = prod.pricebookEntry.UnitPrice;
                                existOppItem.TotalPrice = prod.pricebookEntry.UnitPrice * existOppItem.Quantity;   
                            } 
                        }
                        opplistItem2.add(existOppItem);
                    }
                }else{
                    if(prod.boolval == true){
                        OpportunityLineItem oppLineProd = new OpportunityLineItem();
                        oppLineProd.Product2Id = prod.product.Id;
                        oppLineProd.Product_Name__c = prod.product.Name;
                        oppLineProd.Category__c = prod.product.Family;
                        oppLineProd.Sub_Category__c = prod.product.Product_Subcategory__c;
                        oppLineProd.Type_of_Billing__c = prod.pricebookEntry.Type_of_Billing__c;
                        oppLineProd.Product_Type__c = prod.product.Product_Type__c;
                        oppLineProd.OpportunityId   = opp.Id;
                        oppLineProd.Equote_ext_ID__c = opp.Id+''+numberOfSites+''+System.Now();
                        oppLineProd.Site__c = siteId;
                        oppLineProd.Site_Number__c = numberOfSites;
                        oppLineProd.Equipment__c = prod.product.Equipment__c;
                        oppLineProd.PriceBook2Id__c = prod.pricebookEntry.Pricebook2Id;
                        oppLineProd.PricebookEntryId     = prod.pricebookEntry.id;
                        oppLineProd.Index__c = prod.product.License_Order__c;
                        oppLineProd.Quantity = decimal.valueOf(prod.product.Quantity__c);
                        oppLineProd.Part_Number__c = prod.product.Part_Number_of_Product__c;
                        oppLineProd.PoE__c = selVal4;
                        oppLineProd.Filter_Product__c = 'Parent';
                        oppLineProd.Show_in_PDF__c = prod.product.Show_in_PDF__c;
                        oppLineProd.VENDOR_PRICE_LIST_TO_OFFER__c = prod.pricebookEntry.VENDORPRICELISTTOFTR__c;
                        oppLineProd.GPM__c = prod.pricebookEntry.GPM__c;
                        oppLineProd.UNITCOST__c = prod.pricebookEntry.UNITCOST__c;
                        oppLineProd.DISCOUNT__c = prod.pricebookEntry.DISCOUNT_Price__c;
                        if(prod.pricebookEntry.Type_of_Billing__c == 'MRC'){
                            if(prod.pricebookEntry.UnitPrice != null) {
                                oppLineProd.Unit_Price__c = prod.pricebookEntry.UnitPrice;
                                oppLineProd.TotalPrice = prod.pricebookEntry.UnitPrice * oppLineProd.Quantity;   
                            }   
                        }
                        else{
                            if(prod.pricebookEntry.UnitPrice != null) {
                                oppLineProd.NRC__c = prod.pricebookEntry.UnitPrice;
                                oppLineProd.TotalPrice = prod.pricebookEntry.UnitPrice * oppLineProd.Quantity;   
                            } 
                        }
                        opplistItem.add(oppLineProd);
                    }
                }
                
            }
        }
        List<WrapperClass> productListAddOn1 = new List<WrapperClass> ();
        if(productListAddOn != null && !productListAddOn.isEmpty()){
            for(WrapperClass wrap : productListAddOn) {
                WrapperClass w = new WrapperClass(wrap.product,wrap.boolval,wrap.boolval2,wrap.boolval3,wrap.pricebookEntry,wrap.Total,wrap.NRCTotal);
                productListAddOn1.add(w);
                System.debug('==productListAddOn1=='+wrap);
            }
        }
        System.debug('----productListAddOn1----'+productListAddOn1);
        if(productListAddOn1 != null && !productListAddOn1.isEmpty() && opp != null){
            for(WrapperClass prod : productListAddOn1){
                System.debug('=======prod======add==='+prod.product.Name);
                if(mapOfOpplineItem != null && !mapOfOpplineItem.isEmpty() && mapOfOpplineItem.containsKey(prod.product.Id)){
                    if(prod.boolval == true){
                        OpportunityLineItem existOppItem = mapOfOpplineItem.get(prod.product.Id);
                        existOppItem.Quantity = decimal.valueOf(prod.product.Quantity__c);
                        if(prod.pricebookEntry.Type_of_Billing__c == 'MRC'){
                            if(prod.pricebookEntry.UnitPrice != null) {
                                existOppItem.Unit_Price__c = prod.pricebookEntry.UnitPrice;
                                existOppItem.TotalPrice = existOppItem.Quantity * prod.pricebookEntry.UnitPrice;    
                            }   
                        }
                        else{
                            if(prod.pricebookEntry.UnitPrice != null) {
                                existOppItem.NRC__c = prod.pricebookEntry.UnitPrice;
                                existOppItem.TotalPrice = prod.pricebookEntry.UnitPrice * existOppItem.Quantity;   
                            } 
                        }
                        opplistItem2.add(existOppItem);
                    }
                }else{
                    if(prod.boolval == true){
                        OpportunityLineItem oppLineProd = new OpportunityLineItem();
                        oppLineProd.Product2Id = prod.product.Id;
                        oppLineProd.Product_Name__c = prod.product.Name;
                        oppLineProd.Category__c = prod.product.Family;
                        oppLineProd.Sub_Category__c = prod.product.Product_Subcategory__c;
                        oppLineProd.Type_of_Billing__c = prod.pricebookEntry.Type_of_Billing__c;
                        oppLineProd.Product_Type__c = prod.product.Product_Type__c;
                        oppLineProd.OpportunityId   = opp.Id;
                        oppLineProd.Equote_ext_ID__c = opp.Id+''+numberOfSites+''+System.Now();
                        oppLineProd.Site__c = siteId;
                        oppLineProd.Site_Number__c = numberOfSites;
                        oppLineProd.Equipment__c = prod.product.Equipment__c;
                        oppLineProd.PriceBook2Id__c = prod.pricebookEntry.Pricebook2Id;
                        oppLineProd.PricebookEntryId     = prod.pricebookEntry.id;
                        oppLineProd.Index__c = prod.product.License_Order__c;
                        oppLineProd.Quantity = decimal.valueOf(prod.product.Quantity__c);
                        oppLineProd.Part_Number__c = prod.product.Part_Number_of_Product__c;
                        oppLineProd.PoE__c = selVal4;
                        oppLineProd.Filter_Product__c = 'Parent';
                        oppLineProd.Show_in_PDF__c = prod.product.Show_in_PDF__c;
                        oppLineProd.VENDOR_PRICE_LIST_TO_OFFER__c = prod.pricebookEntry.VENDORPRICELISTTOFTR__c;
                        oppLineProd.GPM__c = prod.pricebookEntry.GPM__c;
                        oppLineProd.UNITCOST__c = prod.pricebookEntry.UNITCOST__c;
                        oppLineProd.DISCOUNT__c = prod.pricebookEntry.DISCOUNT_Price__c;
                        if(prod.pricebookEntry.Type_of_Billing__c == 'MRC'){
                            if(prod.pricebookEntry.UnitPrice != null) {
                                oppLineProd.Unit_Price__c = prod.pricebookEntry.UnitPrice;
                                oppLineProd.TotalPrice = prod.pricebookEntry.UnitPrice * oppLineProd.Quantity;   
                            }   
                        }
                        else{
                            if(prod.pricebookEntry.UnitPrice != null) {
                                oppLineProd.NRC__c = prod.pricebookEntry.UnitPrice;
                                oppLineProd.TotalPrice = prod.pricebookEntry.UnitPrice * oppLineProd.Quantity;   
                            } 
                        }
                        opplistItem.add(oppLineProd);
                    }
                }
                
            }
        }
        
        
         List<WrapperClass> productListTeleCom1 = new List<WrapperClass> ();
        if(productListTeleCom != null && !productListTeleCom.isEmpty()){
            for(WrapperClass wrap : productListTeleCom) {
                WrapperClass w = new WrapperClass(wrap.product,wrap.boolval,wrap.boolval2,wrap.boolval3,wrap.pricebookEntry,wrap.Total,wrap.NRCTotal);
                productListTeleCom1.add(w);
                System.debug('==productListTeleCom1=='+wrap);
            }
        }
        System.debug('----productListAddOn1----'+productListAddOn1);
        if(productListTeleCom1 != null && !productListTeleCom1.isEmpty() && opp != null){
            for(WrapperClass prod : productListTeleCom1){
                System.debug('=======prod======add==='+prod.product.Name);
                if(mapOfOpplineItem != null && !mapOfOpplineItem.isEmpty() && mapOfOpplineItem.containsKey(prod.product.Id)){
                    if(prod.boolval == true){
                        OpportunityLineItem existOppItem = mapOfOpplineItem.get(prod.product.Id);
                        existOppItem.Quantity = decimal.valueOf(prod.product.Quantity__c);
                        if(prod.pricebookEntry.Type_of_Billing__c == 'MRC'){
                            if(prod.pricebookEntry.UnitPrice != null) {
                                existOppItem.Unit_Price__c = prod.pricebookEntry.UnitPrice;
                                existOppItem.TotalPrice = existOppItem.Quantity * prod.pricebookEntry.UnitPrice;    
                            }   
                        }
                        else{
                            if(prod.pricebookEntry.UnitPrice != null) {
                                existOppItem.NRC__c = prod.pricebookEntry.UnitPrice;
                                existOppItem.TotalPrice = prod.pricebookEntry.UnitPrice * existOppItem.Quantity;   
                            } 
                        }
                        opplistItem2.add(existOppItem);
                    }
                }else{
                    if(prod.boolval == true){
                        OpportunityLineItem oppLineProd = new OpportunityLineItem();
                        oppLineProd.Product2Id = prod.product.Id;
                        oppLineProd.Product_Name__c = prod.product.Name;
                        oppLineProd.Category__c = prod.product.Family;
                        oppLineProd.Sub_Category__c = prod.product.Product_Subcategory__c;
                        oppLineProd.Type_of_Billing__c = prod.pricebookEntry.Type_of_Billing__c;
                        oppLineProd.Product_Type__c = prod.product.Product_Type__c;
                        oppLineProd.OpportunityId   = opp.Id;
                        oppLineProd.Equote_ext_ID__c = opp.Id+''+numberOfSites+''+System.Now();
                        oppLineProd.Site__c = siteId;
                        oppLineProd.Site_Number__c = numberOfSites;
                        oppLineProd.Equipment__c = prod.product.Equipment__c;
                        oppLineProd.PriceBook2Id__c = prod.pricebookEntry.Pricebook2Id;
                        oppLineProd.PricebookEntryId     = prod.pricebookEntry.id;
                        oppLineProd.Index__c = prod.product.License_Order__c;
                        oppLineProd.Quantity = decimal.valueOf(prod.product.Quantity__c);
                        oppLineProd.Part_Number__c = prod.product.Part_Number_of_Product__c;
                        oppLineProd.PoE__c = selVal4;
                        oppLineProd.Filter_Product__c = 'Parent';
                        oppLineProd.Show_in_PDF__c = prod.product.Show_in_PDF__c;
                        oppLineProd.VENDOR_PRICE_LIST_TO_OFFER__c = prod.pricebookEntry.VENDORPRICELISTTOFTR__c;
                        oppLineProd.GPM__c = prod.pricebookEntry.GPM__c;
                        oppLineProd.UNITCOST__c = prod.pricebookEntry.UNITCOST__c;
                        oppLineProd.DISCOUNT__c = prod.pricebookEntry.DISCOUNT_Price__c;
                        if(prod.pricebookEntry.Type_of_Billing__c == 'MRC'){
                            if(prod.pricebookEntry.UnitPrice != null) {
                                oppLineProd.Unit_Price__c = prod.pricebookEntry.UnitPrice;
                                oppLineProd.TotalPrice = prod.pricebookEntry.UnitPrice * oppLineProd.Quantity;   
                            }   
                        }
                        else{
                            if(prod.pricebookEntry.UnitPrice != null) {
                                oppLineProd.NRC__c = prod.pricebookEntry.UnitPrice;
                                oppLineProd.TotalPrice = prod.pricebookEntry.UnitPrice * oppLineProd.Quantity;   
                            } 
                        }
                        opplistItem.add(oppLineProd);
                    }
                }
                
            }
        }
        
        List<WrapperClass> productListIpPhones1 = new List<WrapperClass> ();
        if(productListIpPhones != null && !productListIpPhones.isEmpty()){
            for(WrapperClass wrap : productListIpPhones) {
                WrapperClass w = new WrapperClass(wrap.product,wrap.boolval,wrap.boolval2,wrap.boolval3,wrap.pricebookEntry,wrap.Total,wrap.NRCTotal);
                productListIpPhones1.add(w);
                System.debug('==productListIpPhones=='+wrap);
            }
        }
        //System.debug('----productListIpPhones1----'+productListIpPhones1);
        if(productListIpPhones1 != null && !productListIpPhones1.isEmpty() && opp != null){
            for(WrapperClass prod : productListIpPhones1){
                System.debug('=======prod======add==='+prod.product.Name);
                if(mapOfOpplineItem != null && !mapOfOpplineItem.isEmpty() && mapOfOpplineItem.containsKey(prod.product.Id)){
                    if(prod.boolval == true){
                        OpportunityLineItem existOppItem = mapOfOpplineItem.get(prod.product.Id);
                        existOppItem.Quantity = decimal.valueOf(prod.product.Quantity__c);
                        if(prod.pricebookEntry.Type_of_Billing__c == 'MRC'){
                            if(prod.pricebookEntry.UnitPrice != null) {
                                existOppItem.Unit_Price__c = prod.pricebookEntry.UnitPrice;
                                existOppItem.TotalPrice = existOppItem.Quantity * prod.pricebookEntry.UnitPrice;    
                            }   
                        }
                        else{
                            if(prod.pricebookEntry.UnitPrice != null) {
                                existOppItem.NRC__c = prod.pricebookEntry.UnitPrice;
                                existOppItem.TotalPrice = prod.pricebookEntry.UnitPrice * existOppItem.Quantity;   
                            } 
                        }
                        opplistItem2.add(existOppItem);
                    }
                }else{
                    if(prod.boolval == true){
                        OpportunityLineItem oppLineProd = new OpportunityLineItem();
                        oppLineProd.Product2Id = prod.product.Id;
                        oppLineProd.Product_Name__c = prod.product.Name;
                        oppLineProd.Category__c = prod.product.Family;
                        oppLineProd.Sub_Category__c = prod.product.Product_Subcategory__c;
                        oppLineProd.Type_of_Billing__c = prod.pricebookEntry.Type_of_Billing__c;
                        oppLineProd.Product_Type__c = prod.product.Product_Type__c;
                        oppLineProd.OpportunityId   = opp.Id;
                        oppLineProd.Equote_ext_ID__c = opp.Id+''+numberOfSites+''+System.Now();
                        oppLineProd.Site__c = siteId;
                        oppLineProd.Site_Number__c = numberOfSites;
                        oppLineProd.Equipment__c = prod.product.Equipment__c;
                        oppLineProd.PriceBook2Id__c = prod.pricebookEntry.Pricebook2Id;
                        oppLineProd.PricebookEntryId     = prod.pricebookEntry.id;
                        oppLineProd.Index__c = prod.product.License_Order__c;
                        oppLineProd.Quantity = decimal.valueOf(prod.product.Quantity__c);
                        oppLineProd.Part_Number__c = prod.product.Part_Number_of_Product__c;
                        oppLineProd.PoE__c = selVal4;
                        oppLineProd.Filter_Product__c = 'Parent';
                        oppLineProd.Show_in_PDF__c = prod.product.Show_in_PDF__c;
                        oppLineProd.VENDOR_PRICE_LIST_TO_OFFER__c = prod.pricebookEntry.VENDORPRICELISTTOFTR__c;
                        oppLineProd.GPM__c = prod.pricebookEntry.GPM__c;
                        oppLineProd.UNITCOST__c = prod.pricebookEntry.UNITCOST__c;
                        oppLineProd.DISCOUNT__c = prod.pricebookEntry.DISCOUNT_Price__c;
                        if(prod.pricebookEntry.Type_of_Billing__c == 'MRC'){
                            if(prod.pricebookEntry.UnitPrice != null) {
                                oppLineProd.Unit_Price__c = prod.pricebookEntry.UnitPrice;
                                oppLineProd.TotalPrice = prod.pricebookEntry.UnitPrice * oppLineProd.Quantity;   
                            }   
                        }
                        else{
                            if(prod.pricebookEntry.UnitPrice != null) {
                                oppLineProd.NRC__c = prod.pricebookEntry.UnitPrice;
                                oppLineProd.TotalPrice = prod.pricebookEntry.UnitPrice * oppLineProd.Quantity;   
                            } 
                        }
                        opplistItem.add(oppLineProd);
                    }
                }
                
            }
        }
        List<WrapperClass> swithesAndPOElist1 = new List<WrapperClass> ();
        for(WrapperClass wrap : swithesAndPOElist) {
            WrapperClass w = new WrapperClass(wrap.product,wrap.boolval,wrap.boolval2,wrap.boolval3,wrap.pricebookEntry,wrap.Total,wrap.NRCTotal);
            swithesAndPOElist1.add(w);
            System.debug('==swithesAndPOElist1=='+wrap);
        }
        if(swithesAndPOElist1 != null && !swithesAndPOElist1.isEmpty() && opp != null){
            for(WrapperClass prod : swithesAndPOElist1){
                System.debug('=======prod======add==='+prod.product.Name);
                if(mapOfOpplineItem != null && !mapOfOpplineItem.isEmpty() && mapOfOpplineItem.containsKey(prod.product.Id)){
                    if(prod.boolval == true){
                        OpportunityLineItem existOppItem = mapOfOpplineItem.get(prod.product.Id);
                        existOppItem.Quantity = decimal.valueOf(prod.product.Quantity__c);
                        if(prod.pricebookEntry.Type_of_Billing__c == 'MRC'){
                            if(prod.pricebookEntry.UnitPrice != null) {
                                existOppItem.Unit_Price__c = prod.pricebookEntry.UnitPrice;
                                existOppItem.TotalPrice = existOppItem.Quantity * prod.pricebookEntry.UnitPrice;    
                            }   
                        }
                        else{
                            if(prod.pricebookEntry.UnitPrice != null) {
                                existOppItem.NRC__c = prod.pricebookEntry.UnitPrice;
                                existOppItem.TotalPrice = prod.pricebookEntry.UnitPrice * existOppItem.Quantity;   
                            } 
                        }
                        opplistItem2.add(existOppItem);
                    }
                }else{
                    if(prod.boolval == true){
                        OpportunityLineItem oppLineProd = new OpportunityLineItem();
                        oppLineProd.Product2Id = prod.product.Id;
                        oppLineProd.Product_Name__c = prod.product.Name;
                        oppLineProd.Category__c = prod.product.Family;
                        oppLineProd.Sub_Category__c = prod.product.Product_Subcategory__c;
                        oppLineProd.Type_of_Billing__c = prod.pricebookEntry.Type_of_Billing__c;
                        oppLineProd.Product_Type__c = prod.product.Product_Type__c;
                        oppLineProd.OpportunityId   = opp.Id;
                        oppLineProd.Equote_ext_ID__c = opp.Id+''+numberOfSites+''+System.Now();
                        oppLineProd.Site__c = siteId;
                        oppLineProd.Site_Number__c = numberOfSites;
                        oppLineProd.Equipment__c = prod.product.Equipment__c;
                        oppLineProd.PriceBook2Id__c = prod.pricebookEntry.Pricebook2Id;
                        oppLineProd.PricebookEntryId     = prod.pricebookEntry.id;
                        oppLineProd.Index__c = prod.product.License_Order__c;
                        oppLineProd.Quantity = decimal.valueOf(prod.product.Quantity__c);
                        oppLineProd.Part_Number__c = prod.product.Part_Number_of_Product__c;
                        oppLineProd.PoE__c = selVal4;
                        oppLineProd.Filter_Product__c = 'Parent';
                        oppLineProd.Show_in_PDF__c = prod.product.Show_in_PDF__c;
                        oppLineProd.VENDOR_PRICE_LIST_TO_OFFER__c = prod.pricebookEntry.VENDORPRICELISTTOFTR__c;
                        oppLineProd.GPM__c = prod.pricebookEntry.GPM__c;
                        oppLineProd.UNITCOST__c = prod.pricebookEntry.UNITCOST__c;
                        oppLineProd.DISCOUNT__c = prod.pricebookEntry.DISCOUNT_Price__c;
                        if(prod.pricebookEntry.Type_of_Billing__c == 'MRC'){
                            if(prod.pricebookEntry.UnitPrice != null) {
                                oppLineProd.Unit_Price__c = prod.pricebookEntry.UnitPrice;
                                oppLineProd.TotalPrice = prod.pricebookEntry.UnitPrice * oppLineProd.Quantity;   
                            }   
                        }
                        else{
                            if(prod.pricebookEntry.UnitPrice != null) {
                                oppLineProd.NRC__c = prod.pricebookEntry.UnitPrice;
                                oppLineProd.TotalPrice = prod.pricebookEntry.UnitPrice * oppLineProd.Quantity;   
                            } 
                        }
                        opplistItem.add(oppLineProd);
                    }
                }
                
            }
        }
        
        List<WrapperClass> productListRepair1 = new List<WrapperClass> ();
        for(WrapperClass wrap : productListRepair) {
            WrapperClass w = new WrapperClass(wrap.product,wrap.boolval,wrap.boolval2,wrap.boolval3,wrap.pricebookEntry,wrap.Total,wrap.NRCTotal);
            productListRepair1.add(w);
            System.debug('==productListRepair1=='+wrap);
        }
        if(productListRepair1 != null && !productListRepair1.isEmpty() && opp != null){
            for(WrapperClass prod : productListRepair1){
                System.debug('=======prod======add==='+prod.product.Name);
                if(mapOfOpplineItem != null && !mapOfOpplineItem.isEmpty() && mapOfOpplineItem.containsKey(prod.product.Id)){
                    if(prod.boolval == true){
                        OpportunityLineItem existOppItem = mapOfOpplineItem.get(prod.product.Id);
                        existOppItem.Quantity = decimal.valueOf(prod.product.Quantity__c);
                        if(prod.pricebookEntry.Type_of_Billing__c == 'MRC'){
                            if(prod.pricebookEntry.UnitPrice != null) {
                                existOppItem.Unit_Price__c = prod.pricebookEntry.UnitPrice;
                                existOppItem.TotalPrice = existOppItem.Quantity * prod.pricebookEntry.UnitPrice;    
                            }   
                        }
                        else{
                            if(prod.pricebookEntry.UnitPrice != null) {
                                existOppItem.NRC__c = prod.pricebookEntry.UnitPrice;
                                existOppItem.TotalPrice = prod.pricebookEntry.UnitPrice * existOppItem.Quantity;   
                            } 
                        }
                        opplistItem2.add(existOppItem);
                    }
                }else{
                    if(prod.boolval == true){
                        OpportunityLineItem oppLineProd = new OpportunityLineItem();
                        oppLineProd.Product2Id = prod.product.Id;
                        oppLineProd.Product_Name__c = prod.product.Name;
                        oppLineProd.Category__c = prod.product.Family;
                        oppLineProd.Sub_Category__c = prod.product.Product_Subcategory__c;
                        oppLineProd.Type_of_Billing__c = prod.pricebookEntry.Type_of_Billing__c;
                        oppLineProd.Product_Type__c = prod.product.Product_Type__c;
                        oppLineProd.OpportunityId   = opp.Id;
                        oppLineProd.Equote_ext_ID__c = opp.Id+''+numberOfSites+''+System.Now();
                        oppLineProd.Site__c = siteId;
                        oppLineProd.Site_Number__c = numberOfSites;
                        oppLineProd.Equipment__c = prod.product.Equipment__c;
                        oppLineProd.PriceBook2Id__c = prod.pricebookEntry.Pricebook2Id;
                        oppLineProd.PricebookEntryId     = prod.pricebookEntry.id;
                        oppLineProd.Index__c = prod.product.License_Order__c;
                        oppLineProd.Quantity = decimal.valueOf(prod.product.Quantity__c);
                        oppLineProd.Part_Number__c = prod.product.Part_Number_of_Product__c;
                        oppLineProd.PoE__c = selVal4;
                        oppLineProd.Filter_Product__c = 'Parent';
                        oppLineProd.Show_in_PDF__c = prod.product.Show_in_PDF__c;
                        oppLineProd.VENDOR_PRICE_LIST_TO_OFFER__c = prod.pricebookEntry.VENDORPRICELISTTOFTR__c;
                        oppLineProd.GPM__c = prod.pricebookEntry.GPM__c;
                        oppLineProd.UNITCOST__c = prod.pricebookEntry.UNITCOST__c;
                        oppLineProd.DISCOUNT__c = prod.pricebookEntry.DISCOUNT_Price__c;
                        if(prod.pricebookEntry.Type_of_Billing__c == 'MRC'){
                            if(prod.pricebookEntry.UnitPrice != null) {
                                oppLineProd.Unit_Price__c = prod.pricebookEntry.UnitPrice;
                                oppLineProd.TotalPrice = prod.pricebookEntry.UnitPrice * oppLineProd.Quantity;   
                            }   
                        }
                        else{
                            if(prod.pricebookEntry.UnitPrice != null) {
                                oppLineProd.NRC__c = prod.pricebookEntry.UnitPrice;
                                oppLineProd.TotalPrice = prod.pricebookEntry.UnitPrice * oppLineProd.Quantity;   
                            } 
                        }
                        opplistItem.add(oppLineProd);
                    }
                }
                
            }
        }
        List<WrapperClass> productListBroadband1 = new List<WrapperClass> ();
        if(productListBroadband != null && !productListBroadband.isEmpty()){
            for(WrapperClass wrap : productListBroadband) {
                WrapperClass w = new WrapperClass(wrap.product,wrap.boolval,wrap.boolval2,wrap.boolval3,wrap.pricebookEntry,wrap.Total,wrap.NRCTotal);
                productListBroadband1.add(w);
            }
        }
        if(productListBroadband1 != null && !productListBroadband1.isEmpty() && opp != null){
            for(WrapperClass prod : productListBroadband1){
                System.debug('=======prod======add==='+prod.product.Name);
                if(mapOfOpplineItem != null && !mapOfOpplineItem.isEmpty() && mapOfOpplineItem.containsKey(prod.product.Id)){
                    if(prod.boolval == true){
                        OpportunityLineItem existOppItem = mapOfOpplineItem.get(prod.product.Id);
                        existOppItem.Quantity = decimal.valueOf(prod.product.Quantity__c);
                        if(prod.pricebookEntry.Type_of_Billing__c == 'MRC'){
                            if(prod.pricebookEntry.UnitPrice != null) {
                                existOppItem.Unit_Price__c = prod.pricebookEntry.UnitPrice;
                                existOppItem.TotalPrice = existOppItem.Quantity * prod.pricebookEntry.UnitPrice;    
                            }   
                        }
                        else{
                            if(prod.pricebookEntry.UnitPrice != null) {
                                existOppItem.NRC__c = prod.pricebookEntry.UnitPrice;
                                existOppItem.TotalPrice = prod.pricebookEntry.UnitPrice * existOppItem.Quantity;   
                            } 
                        }
                        opplistItem2.add(existOppItem);
                    }
                }else{
                    if(prod.boolval == true){
                        OpportunityLineItem oppLineProd = new OpportunityLineItem();
                        oppLineProd.Product2Id = prod.product.Id;
                        oppLineProd.Product_Name__c = prod.product.Name;
                        oppLineProd.Category__c = prod.product.Family;
                        oppLineProd.Sub_Category__c = prod.product.Product_Subcategory__c;
                        oppLineProd.Type_of_Billing__c = prod.pricebookEntry.Type_of_Billing__c;
                        oppLineProd.Product_Type__c = prod.product.Product_Type__c;
                        oppLineProd.OpportunityId   = opp.Id;
                        oppLineProd.Equote_ext_ID__c = opp.Id+''+numberOfSites+''+System.Now();
                        oppLineProd.Site__c = siteId;
                        oppLineProd.Site_Number__c = numberOfSites;
                        oppLineProd.Equipment__c = prod.product.Equipment__c;
                        oppLineProd.PriceBook2Id__c = prod.pricebookEntry.Pricebook2Id;
                        oppLineProd.PricebookEntryId     = prod.pricebookEntry.id;
                        oppLineProd.Index__c = prod.product.License_Order__c;
                        oppLineProd.Quantity = decimal.valueOf(prod.product.Quantity__c);
                        oppLineProd.Part_Number__c = prod.product.Part_Number_of_Product__c;
                        oppLineProd.PoE__c = selVal4;
                        oppLineProd.Filter_Product__c = 'Parent';
                        oppLineProd.Show_in_PDF__c = prod.product.Show_in_PDF__c;
                        oppLineProd.VENDOR_PRICE_LIST_TO_OFFER__c = prod.pricebookEntry.VENDORPRICELISTTOFTR__c;
                        oppLineProd.GPM__c = prod.pricebookEntry.GPM__c;
                        oppLineProd.UNITCOST__c = prod.pricebookEntry.UNITCOST__c;
                        oppLineProd.DISCOUNT__c = prod.pricebookEntry.DISCOUNT_Price__c;
                        if(prod.pricebookEntry.Type_of_Billing__c == 'MRC'){
                            if(prod.pricebookEntry.UnitPrice != null) {
                                oppLineProd.Unit_Price__c = prod.pricebookEntry.UnitPrice;
                                oppLineProd.TotalPrice = prod.pricebookEntry.UnitPrice * oppLineProd.Quantity;   
                            }   
                        }
                        else{
                            if(prod.pricebookEntry.UnitPrice != null) {
                                oppLineProd.NRC__c = prod.pricebookEntry.UnitPrice;
                                oppLineProd.TotalPrice = prod.pricebookEntry.UnitPrice * oppLineProd.Quantity;   
                            } 
                        }
                        opplistItem.add(oppLineProd);
                    }
                }
                
            }
        }
        
        List<WrapperClass> productListFIOS1 = new List<WrapperClass> ();
        if(productListFIOS != null && !productListFIOS.isEmpty()){
            for(WrapperClass wrap : productListFIOS) {
                WrapperClass w = new WrapperClass(wrap.product,wrap.boolval,wrap.boolval2,wrap.boolval3,wrap.pricebookEntry,wrap.Total,wrap.NRCTotal);
                productListFIOS1.add(w);
            }
        }
        if(productListFIOS1 != null && !productListFIOS1.isEmpty() && opp != null){
            for(WrapperClass prod : productListFIOS1){
                System.debug('=======prod======add==='+prod.product.Name);
                if(mapOfOpplineItem != null && !mapOfOpplineItem.isEmpty() && mapOfOpplineItem.containsKey(prod.product.Id)){
                    if(prod.boolval == true){
                        OpportunityLineItem existOppItem = mapOfOpplineItem.get(prod.product.Id);
                        existOppItem.Quantity = decimal.valueOf(prod.product.Quantity__c);
                        if(prod.pricebookEntry.Type_of_Billing__c == 'MRC'){
                            if(prod.pricebookEntry.UnitPrice != null) {
                                existOppItem.Unit_Price__c = prod.pricebookEntry.UnitPrice;
                                existOppItem.TotalPrice = existOppItem.Quantity * prod.pricebookEntry.UnitPrice;    
                            }   
                        }
                        else{
                            if(prod.pricebookEntry.UnitPrice != null) {
                                existOppItem.NRC__c = prod.pricebookEntry.UnitPrice;
                                existOppItem.TotalPrice = prod.pricebookEntry.UnitPrice * existOppItem.Quantity;   
                            } 
                        }
                        opplistItem2.add(existOppItem);
                    }
                }else{
                    if(prod.boolval == true){
                        OpportunityLineItem oppLineProd = new OpportunityLineItem();
                        oppLineProd.Product2Id = prod.product.Id;
                        oppLineProd.Product_Name__c = prod.product.Name;
                        oppLineProd.Category__c = prod.product.Family;
                        oppLineProd.Sub_Category__c = prod.product.Product_Subcategory__c;
                        oppLineProd.Type_of_Billing__c = prod.pricebookEntry.Type_of_Billing__c;
                        oppLineProd.Product_Type__c = prod.product.Product_Type__c;
                        oppLineProd.OpportunityId   = opp.Id;
                        oppLineProd.Equote_ext_ID__c = opp.Id+''+numberOfSites+''+System.Now();
                        oppLineProd.Site__c = siteId;
                        oppLineProd.Site_Number__c = numberOfSites;
                        oppLineProd.Equipment__c = prod.product.Equipment__c;
                        oppLineProd.PriceBook2Id__c = prod.pricebookEntry.Pricebook2Id;
                        oppLineProd.PricebookEntryId     = prod.pricebookEntry.id;
                        oppLineProd.Index__c = prod.product.License_Order__c;
                        oppLineProd.Quantity = decimal.valueOf(prod.product.Quantity__c);
                        oppLineProd.Part_Number__c = prod.product.Part_Number_of_Product__c;
                        oppLineProd.PoE__c = selVal4;
                        oppLineProd.Filter_Product__c = 'Parent';
                        oppLineProd.Show_in_PDF__c = prod.product.Show_in_PDF__c;
                        oppLineProd.VENDOR_PRICE_LIST_TO_OFFER__c = prod.pricebookEntry.VENDORPRICELISTTOFTR__c;
                        oppLineProd.GPM__c = prod.pricebookEntry.GPM__c;
                        oppLineProd.UNITCOST__c = prod.pricebookEntry.UNITCOST__c;
                        oppLineProd.DISCOUNT__c = prod.pricebookEntry.DISCOUNT_Price__c;
                        if(prod.pricebookEntry.Type_of_Billing__c == 'MRC'){
                            if(prod.pricebookEntry.UnitPrice != null) {
                                oppLineProd.Unit_Price__c = prod.pricebookEntry.UnitPrice;
                                oppLineProd.TotalPrice = prod.pricebookEntry.UnitPrice * oppLineProd.Quantity;   
                            }   
                        }
                        else{
                            if(prod.pricebookEntry.UnitPrice != null) {
                                oppLineProd.NRC__c = prod.pricebookEntry.UnitPrice;
                                oppLineProd.TotalPrice = prod.pricebookEntry.UnitPrice * oppLineProd.Quantity;   
                            } 
                        }
                        opplistItem.add(oppLineProd);
                    }
                }
                
            }
        }
        
        List<WrapperClass> productListFiber1 = new List<WrapperClass> ();
        if(productListFiber != null && !productListFiber.isEmpty()){
            for(WrapperClass wrap : productListFiber) {
                WrapperClass w = new WrapperClass(wrap.product,wrap.boolval,wrap.boolval2,wrap.boolval3,wrap.pricebookEntry,wrap.Total,wrap.NRCTotal);
                productListFiber1.add(w);
            }
        }
        if(productListFiber1 != null && !productListFiber1.isEmpty() && opp != null){
            for(WrapperClass prod : productListFiber1){
                System.debug('=======prod======add==='+prod.product.Name);
                if(mapOfOpplineItem != null && !mapOfOpplineItem.isEmpty() && mapOfOpplineItem.containsKey(prod.product.Id)){
                    if(prod.boolval == true){
                        OpportunityLineItem existOppItem = mapOfOpplineItem.get(prod.product.Id);
                        existOppItem.Quantity = decimal.valueOf(prod.product.Quantity__c);
                        if(prod.pricebookEntry.Type_of_Billing__c == 'MRC'){
                            if(prod.pricebookEntry.UnitPrice != null) {
                                existOppItem.Unit_Price__c = prod.pricebookEntry.UnitPrice;
                                existOppItem.TotalPrice = existOppItem.Quantity * prod.pricebookEntry.UnitPrice;    
                            }   
                        }
                        else{
                            if(prod.pricebookEntry.UnitPrice != null) {
                                existOppItem.NRC__c = prod.pricebookEntry.UnitPrice;
                                existOppItem.TotalPrice = prod.pricebookEntry.UnitPrice * existOppItem.Quantity;   
                            } 
                        }
                        opplistItem2.add(existOppItem);
                    }
                }else{
                    if(prod.boolval == true){
                        OpportunityLineItem oppLineProd = new OpportunityLineItem();
                        oppLineProd.Product2Id = prod.product.Id;
                        oppLineProd.Product_Name__c = prod.product.Name;
                        oppLineProd.Category__c = prod.product.Family;
                        oppLineProd.Sub_Category__c = prod.product.Product_Subcategory__c;
                        oppLineProd.Type_of_Billing__c = prod.pricebookEntry.Type_of_Billing__c;
                        oppLineProd.Product_Type__c = prod.product.Product_Type__c;
                        oppLineProd.OpportunityId   = opp.Id;
                        oppLineProd.Equote_ext_ID__c = opp.Id+''+numberOfSites+''+System.Now();
                        oppLineProd.Site__c = siteId;
                        oppLineProd.Site_Number__c = numberOfSites;
                        oppLineProd.Equipment__c = prod.product.Equipment__c;
                        oppLineProd.PriceBook2Id__c = prod.pricebookEntry.Pricebook2Id;
                        oppLineProd.PricebookEntryId     = prod.pricebookEntry.id;
                        oppLineProd.Index__c = prod.product.License_Order__c;
                        oppLineProd.Quantity = decimal.valueOf(prod.product.Quantity__c);
                        oppLineProd.Part_Number__c = prod.product.Part_Number_of_Product__c;
                        oppLineProd.PoE__c = selVal4;
                        oppLineProd.Filter_Product__c = 'Parent';
                        oppLineProd.Show_in_PDF__c = prod.product.Show_in_PDF__c;
                        oppLineProd.VENDOR_PRICE_LIST_TO_OFFER__c = prod.pricebookEntry.VENDORPRICELISTTOFTR__c;
                        oppLineProd.GPM__c = prod.pricebookEntry.GPM__c;
                        oppLineProd.UNITCOST__c = prod.pricebookEntry.UNITCOST__c;
                        oppLineProd.DISCOUNT__c = prod.pricebookEntry.DISCOUNT_Price__c;
                        if(prod.pricebookEntry.Type_of_Billing__c == 'MRC'){
                            if(prod.pricebookEntry.UnitPrice != null) {
                                oppLineProd.Unit_Price__c = prod.pricebookEntry.UnitPrice;
                                oppLineProd.TotalPrice = prod.pricebookEntry.UnitPrice * oppLineProd.Quantity;   
                            }   
                        }
                        else{
                            if(prod.pricebookEntry.UnitPrice != null) {
                                oppLineProd.NRC__c = prod.pricebookEntry.UnitPrice;
                                oppLineProd.TotalPrice = prod.pricebookEntry.UnitPrice * oppLineProd.Quantity;   
                            } 
                        }
                        opplistItem.add(oppLineProd);
                    }
                }
                
            }
        }
        
        List<WrapperClass> productListBHSI1 = new List<WrapperClass> ();
        if(productListBHSI != null && !productListBHSI.isEmpty()){
            for(WrapperClass wrap : productListBHSI) {
                WrapperClass w = new WrapperClass(wrap.product,wrap.boolval,wrap.boolval2,wrap.boolval3,wrap.pricebookEntry,wrap.Total,wrap.NRCTotal);
                productListBHSI1.add(w);
            }
        }
        if(productListBHSI1 != null && !productListBHSI1.isEmpty() && opp != null){
            for(WrapperClass prod : productListBHSI1){
                System.debug('=======prod======add==='+prod.product.Name);
                if(mapOfOpplineItem != null && !mapOfOpplineItem.isEmpty() && mapOfOpplineItem.containsKey(prod.product.Id)){
                    if(prod.boolval == true){
                        OpportunityLineItem existOppItem = mapOfOpplineItem.get(prod.product.Id);
                        existOppItem.Quantity = decimal.valueOf(prod.product.Quantity__c);
                        if(prod.pricebookEntry.Type_of_Billing__c == 'MRC'){
                            if(prod.pricebookEntry.UnitPrice != null) {
                                existOppItem.Unit_Price__c = prod.pricebookEntry.UnitPrice;
                                existOppItem.TotalPrice = existOppItem.Quantity * prod.pricebookEntry.UnitPrice;    
                            }   
                        }
                        else{
                            if(prod.pricebookEntry.UnitPrice != null) {
                                existOppItem.NRC__c = prod.pricebookEntry.UnitPrice;
                                existOppItem.TotalPrice = prod.pricebookEntry.UnitPrice * existOppItem.Quantity;   
                            } 
                        }
                        opplistItem2.add(existOppItem);
                    }
                }else{
                    if(prod.boolval == true){
                        OpportunityLineItem oppLineProd = new OpportunityLineItem();
                        oppLineProd.Product2Id = prod.product.Id;
                        oppLineProd.Product_Name__c = prod.product.Name;
                        oppLineProd.Category__c = prod.product.Family;
                        oppLineProd.Sub_Category__c = prod.product.Product_Subcategory__c;
                        oppLineProd.Type_of_Billing__c = prod.pricebookEntry.Type_of_Billing__c;
                        oppLineProd.Product_Type__c = prod.product.Product_Type__c;
                        oppLineProd.OpportunityId   = opp.Id;
                        oppLineProd.Equote_ext_ID__c = opp.Id+''+numberOfSites+''+System.Now();
                        oppLineProd.Site__c = siteId;
                        oppLineProd.Site_Number__c = numberOfSites;
                        oppLineProd.Equipment__c = prod.product.Equipment__c;
                        oppLineProd.PriceBook2Id__c = prod.pricebookEntry.Pricebook2Id;
                        oppLineProd.PricebookEntryId     = prod.pricebookEntry.id;
                        oppLineProd.Index__c = prod.product.License_Order__c;
                        oppLineProd.Quantity = decimal.valueOf(prod.product.Quantity__c);
                        oppLineProd.Part_Number__c = prod.product.Part_Number_of_Product__c;
                        oppLineProd.PoE__c = selVal4;
                        oppLineProd.Filter_Product__c = 'Parent';
                        oppLineProd.Show_in_PDF__c = prod.product.Show_in_PDF__c;
                        oppLineProd.VENDOR_PRICE_LIST_TO_OFFER__c = prod.pricebookEntry.VENDORPRICELISTTOFTR__c;
                        oppLineProd.GPM__c = prod.pricebookEntry.GPM__c;
                        oppLineProd.UNITCOST__c = prod.pricebookEntry.UNITCOST__c;
                        oppLineProd.DISCOUNT__c = prod.pricebookEntry.DISCOUNT_Price__c;
                        if(prod.pricebookEntry.Type_of_Billing__c == 'MRC'){
                            if(prod.pricebookEntry.UnitPrice != null) {
                                oppLineProd.Unit_Price__c = prod.pricebookEntry.UnitPrice;
                                oppLineProd.TotalPrice = prod.pricebookEntry.UnitPrice * oppLineProd.Quantity;   
                            }   
                        }
                        else{
                            if(prod.pricebookEntry.UnitPrice != null) {
                                oppLineProd.NRC__c = prod.pricebookEntry.UnitPrice;
                                oppLineProd.TotalPrice = prod.pricebookEntry.UnitPrice * oppLineProd.Quantity;   
                            } 
                        }
                        opplistItem.add(oppLineProd);
                    }
                }
                
            }
        }
        
       /* List<WrapperClass> productListAsymetricFiber1 = new List<WrapperClass> ();
        if(productListAsymetricFiber != null && !productListAsymetricFiber.isEmpty()){
            for(WrapperClass wrap : productListAsymetricFiber) {
                WrapperClass w = new WrapperClass(wrap.product,wrap.boolval,wrap.boolval2,wrap.boolval3,wrap.pricebookEntry,wrap.Total,wrap.NRCTotal);
                productListAsymetricFiber1.add(w);
            }
        }
        if(productListAsymetricFiber1 != null && !productListAsymetricFiber1.isEmpty() && opp != null){
            for(WrapperClass prod : productListAsymetricFiber1){
                System.debug('=======prod======add==='+prod.product.Name);
                if(mapOfOpplineItem != null && !mapOfOpplineItem.isEmpty() && mapOfOpplineItem.containsKey(prod.product.Id)){
                    if(prod.boolval == true){
                        OpportunityLineItem existOppItem = mapOfOpplineItem.get(prod.product.Id);
                        existOppItem.Quantity = decimal.valueOf(prod.product.Quantity__c);
                        if(prod.pricebookEntry.Type_of_Billing__c == 'MRC'){
                            if(prod.pricebookEntry.UnitPrice != null) {
                                existOppItem.Unit_Price__c = prod.pricebookEntry.UnitPrice;
                                existOppItem.TotalPrice = existOppItem.Quantity * prod.pricebookEntry.UnitPrice;    
                            }   
                        }
                        else{
                            if(prod.pricebookEntry.UnitPrice != null) {
                                existOppItem.NRC__c = prod.pricebookEntry.UnitPrice;
                                existOppItem.TotalPrice = prod.pricebookEntry.UnitPrice * existOppItem.Quantity;   
                            } 
                        }
                        opplistItem2.add(existOppItem);
                    }
                }else{
                    if(prod.boolval == true){
                        OpportunityLineItem oppLineProd = new OpportunityLineItem();
                        oppLineProd.Product2Id = prod.product.Id;
                        oppLineProd.Product_Name__c = prod.product.Name;
                        oppLineProd.Category__c = prod.product.Family;
                        oppLineProd.Sub_Category__c = prod.product.Product_Subcategory__c;
                        oppLineProd.Type_of_Billing__c = prod.pricebookEntry.Type_of_Billing__c;
                        oppLineProd.Product_Type__c = prod.product.Product_Type__c;
                        oppLineProd.OpportunityId   = opp.Id;
                        oppLineProd.Equote_ext_ID__c = opp.Id+''+numberOfSites+''+System.Now();
                        oppLineProd.Site__c = siteId;
                        oppLineProd.Site_Number__c = numberOfSites;
                        oppLineProd.Equipment__c = prod.product.Equipment__c;
                        oppLineProd.PriceBook2Id__c = prod.pricebookEntry.Pricebook2Id;
                        oppLineProd.PricebookEntryId     = prod.pricebookEntry.id;
                        oppLineProd.Index__c = prod.product.License_Order__c;
                        oppLineProd.Quantity = decimal.valueOf(prod.product.Quantity__c);
                        oppLineProd.Part_Number__c = prod.product.Part_Number_of_Product__c;
                        oppLineProd.PoE__c = selVal4;
                        oppLineProd.Filter_Product__c = 'Parent';
                        oppLineProd.Show_in_PDF__c = prod.product.Show_in_PDF__c;
                        oppLineProd.VENDOR_PRICE_LIST_TO_OFFER__c = prod.pricebookEntry.VENDORPRICELISTTOFTR__c;
                        oppLineProd.GPM__c = prod.pricebookEntry.GPM__c;
                        oppLineProd.UNITCOST__c = prod.pricebookEntry.UNITCOST__c;
                        oppLineProd.DISCOUNT__c = prod.pricebookEntry.DISCOUNT_Price__c;
                        if(prod.pricebookEntry.Type_of_Billing__c == 'MRC'){
                            if(prod.pricebookEntry.UnitPrice != null) {
                                oppLineProd.Unit_Price__c = prod.pricebookEntry.UnitPrice;
                                oppLineProd.TotalPrice = prod.pricebookEntry.UnitPrice * oppLineProd.Quantity;   
                            }   
                        }
                        else{
                            if(prod.pricebookEntry.UnitPrice != null) {
                                oppLineProd.NRC__c = prod.pricebookEntry.UnitPrice;
                                oppLineProd.TotalPrice = prod.pricebookEntry.UnitPrice * oppLineProd.Quantity;   
                            } 
                        }
                        opplistItem.add(oppLineProd);
                    }
                }
                
            }
        }
        */
        List<WrapperClass> productListEquipment1 = new List<WrapperClass> ();
        if(productListEquipment != null && !productListEquipment.isEmpty()){
            for(WrapperClass wrap : productListEquipment) {
                WrapperClass w = new WrapperClass(wrap.product,wrap.boolval,wrap.boolval2,wrap.boolval3,wrap.pricebookEntry,wrap.Total,wrap.NRCTotal);
                productListEquipment1.add(w);
            }
        }
        if(productListEquipment1 != null && !productListEquipment1.isEmpty() && opp != null){
            for(WrapperClass prod : productListEquipment1){
                System.debug('=======prod======add==='+prod.product.Name);
                if(mapOfOpplineItem != null && !mapOfOpplineItem.isEmpty() && mapOfOpplineItem.containsKey(prod.product.Id)){
                    if(prod.boolval == true){
                        OpportunityLineItem existOppItem = mapOfOpplineItem.get(prod.product.Id);
                        existOppItem.Quantity = decimal.valueOf(prod.product.Quantity__c);
                        if(prod.pricebookEntry.Type_of_Billing__c == 'MRC'){
                            if(prod.pricebookEntry.UnitPrice != null) {
                                existOppItem.Unit_Price__c = prod.pricebookEntry.UnitPrice;
                                existOppItem.TotalPrice = existOppItem.Quantity * prod.pricebookEntry.UnitPrice;    
                            }   
                        }
                        else{
                            if(prod.pricebookEntry.UnitPrice != null) {
                                existOppItem.NRC__c = prod.pricebookEntry.UnitPrice;
                                existOppItem.TotalPrice = prod.pricebookEntry.UnitPrice * existOppItem.Quantity;   
                            } 
                        }
                        opplistItem2.add(existOppItem);
                    }
                }else{
                    if(prod.boolval == true){
                        OpportunityLineItem oppLineProd = new OpportunityLineItem();
                        oppLineProd.Product2Id = prod.product.Id;
                        oppLineProd.Product_Name__c = prod.product.Name;
                        oppLineProd.Category__c = prod.product.Family;
                        oppLineProd.Sub_Category__c = prod.product.Product_Subcategory__c;
                        oppLineProd.Type_of_Billing__c = prod.pricebookEntry.Type_of_Billing__c;
                        oppLineProd.Product_Type__c = prod.product.Product_Type__c;
                        oppLineProd.OpportunityId   = opp.Id;
                        oppLineProd.Equote_ext_ID__c = opp.Id+''+numberOfSites+''+System.Now();
                        oppLineProd.Site__c = siteId;
                        oppLineProd.Site_Number__c = numberOfSites;
                        oppLineProd.Equipment__c = prod.product.Equipment__c;
                        oppLineProd.PriceBook2Id__c = prod.pricebookEntry.Pricebook2Id;
                        oppLineProd.PricebookEntryId     = prod.pricebookEntry.id;
                        oppLineProd.Index__c = prod.product.License_Order__c;
                        oppLineProd.Quantity = decimal.valueOf(prod.product.Quantity__c);
                        oppLineProd.Part_Number__c = prod.product.Part_Number_of_Product__c;
                        oppLineProd.PoE__c = selVal4;
                        oppLineProd.Filter_Product__c = 'Parent';
                        oppLineProd.Show_in_PDF__c = prod.product.Show_in_PDF__c;
                        oppLineProd.VENDOR_PRICE_LIST_TO_OFFER__c = prod.pricebookEntry.VENDORPRICELISTTOFTR__c;
                        oppLineProd.GPM__c = prod.pricebookEntry.GPM__c;
                        oppLineProd.UNITCOST__c = prod.pricebookEntry.UNITCOST__c;
                        oppLineProd.DISCOUNT__c = prod.pricebookEntry.DISCOUNT_Price__c;
                        if(prod.pricebookEntry.Type_of_Billing__c == 'MRC'){
                            if(prod.pricebookEntry.UnitPrice != null) {
                                oppLineProd.Unit_Price__c = prod.pricebookEntry.UnitPrice;
                                oppLineProd.TotalPrice = prod.pricebookEntry.UnitPrice * oppLineProd.Quantity;   
                            }   
                        }
                        else{
                            if(prod.pricebookEntry.UnitPrice != null) {
                                oppLineProd.NRC__c = prod.pricebookEntry.UnitPrice;
                                oppLineProd.TotalPrice = prod.pricebookEntry.UnitPrice * oppLineProd.Quantity;   
                            } 
                        }
                        opplistItem.add(oppLineProd);
                    }
                }
                
            }
        }
        
        try{
            update opplistItem2;
            insert opplistItem;
        }catch(Exception e){}
    }
    
    /*  @auraEnabled 
public static String rule1(List<WrapperClass> wraperlist,string recordId){
String error = 'false';
Rule1__c rule = new Rule1__c();
rule = [select id,Product_Name__c,Condition__c from Rule1__c limit 1];
Opportunity opp = new Opportunity();
opp = [select id,Company_size__c from Opportunity where id =: recordId limit 1];
if(opp != null && rule != null){
if(wraperlist != null && !wraperlist.isEmpty()){
for(WrapperClass wrap : wraperlist){
if(wrap.boolval == true){
if((wrap.product.Name).contains(rule.Product_Name__c)){
if('>=' == rule.Condition__c){
Integer quanity = Integer.valueOf(wrap.product.Quantity__c);
if(quanity >= opp.Company_size__c){
error = 'Please enter qunatity less than company site on ' +rule.Product_Name__c+ ' product';
break;
}
}
else if('<=' == rule.Condition__c){
Integer quanity = Integer.valueOf(wrap.product.Quantity__c);
if(quanity <= opp.Company_size__c){
error = 'Please enter qunatity less than company site on ' +rule.Product_Name__c+ ' product';
break;
}
}
else if('==' == rule.Condition__c){
Integer quanity = Integer.valueOf(wrap.product.Quantity__c);
if(quanity == opp.Company_size__c){
error = 'Please enter qunatity less than company site on ' +rule.Product_Name__c+ ' product';
break;
}
}
else if('>' == rule.Condition__c){
Integer quanity = Integer.valueOf(wrap.product.Quantity__c);
if(quanity > opp.Company_size__c){
error = 'Please enter qunatity less than company site on ' +rule.Product_Name__c+ ' product';
break;
}
}
else if('<' == rule.Condition__c){
Integer quanity = Integer.valueOf(wrap.product.Quantity__c);
if(quanity < opp.Company_size__c){
error = 'Please enter qunatity less than company site on ' +rule.Product_Name__c+ ' product';
break;
}
}
} 
}
}
}
}
return error;
}
*/ 
      //This rule for analog ATA
      @auraEnabled 
     public static String analogATArule(List<WrapperClass> licenseList,List<WrapperClass> switchPoeList){
        string error = 'false';
        Boolean check = false;
        if(switchPoeList != null && !switchPoeList.isEmpty()){
            for(WrapperClass lic : switchPoeList){
                if(lic.boolval == true && lic.product.isATArule__c == true){
                    check = true;
    
                }
                else{
                    error = 'false';
                }
            }
        }
        else{
             error = 'false';
        }
        if(check){
            if(licenseList != null && !licenseList.isEmpty()){
                for(WrapperClass lic : licenseList){
                    if(lic.boolval == true && lic.product.isAnalogRule__c == true){
                        error = 'false';
                        break;
                    }
                    else{
                       error = 'analog product is required for ATA'; 
                    }
                }
            }
        }
        return error;
    }
      // This rule is for smart Voice IP Phone  Quantity
    @auraEnabled 
    public static String smartVoiceIpPhoneRule(List<WrapperClass> licenselist,List<WrapperClass> phonelist){
        string error = 'false';
        integer licenseQty = 0;
        integer phoneQty = 0;
        System.debug('===it is working===5====');
        if(licenselist != null && !licenselist.isEmpty()){
            for(WrapperClass lic : licenselist){
                if(lic.boolval == true && lic.product.PremiumPlusRule__c == true){
                    integer qty = integer.valueOf(lic.product.Quantity__c);
                    licenseQty =  licenseQty + qty;
                    System.debug('===it is working===1====');
                }
            }
        }
        
        if(phonelist != null && !phonelist.isEmpty()){
            for(WrapperClass phone : phonelist){
                if(phone.boolval == true && phone.product.isSmartIpPhoneRule__c == true){
                    integer qty = integer.valueOf(phone.product.Quantity__c);
                    phoneQty =  phoneQty + qty;
                    System.debug('===it is working===2====');
                }
            }
        }
        if(phoneQty != null && licenseQty != null){
            if(phoneQty <= licenseQty){
                error = 'false';
            }
            else{
                error = 'Total of Licenses Premium Plus >= Total of Iphones VVX 311 + VVX 501 + VVX 601';
            }
            System.debug('===it is working===3===='+error);
        }
        if(phoneQty < 1){
            error = 'false';
        }
        System.debug('===it is working===4====');
        return error;
    }
    
     // This rule is for smart Voice IP Soundstation  Quantity
     @auraEnabled 
    public static String smartVoiceIpSoundStationRule(List<WrapperClass> licenselist,List<WrapperClass> phonelist){
        string error = 'false';
        integer licenseQty = 0;
        integer phoneQty = 0;
        
        if(licenselist != null && !licenselist.isEmpty()){
            for(WrapperClass lic : licenselist){
                if(lic.boolval == true && lic.product.isConferenceRumSeatRule__c == true){
                    integer qty = integer.valueOf(lic.product.Quantity__c);
                    licenseQty =  licenseQty + qty;
                }
            }
        }
        
        if(phonelist != null && !phonelist.isEmpty()){
            for(WrapperClass phone : phonelist){
                if(phone.boolval == true && phone.product.isIpSoundStationRule__c == true){
                    integer qty = integer.valueOf(phone.product.Quantity__c);
                    phoneQty =  phoneQty + qty;
                }
            }
        }
        if(phoneQty != null && licenseQty != null){
            if(phoneQty <= licenseQty){
                error = 'false';
            }
            else{
                error = 'Total of Licenses Premium Plus >= Total of IP Soundstation 5000  + IP Soundstation 6000  + IP Soundstation 7000 ';
            }
        }
        if(phoneQty < 1){
            error = 'false';
        }
        
        return error;
    }
   
    
      /* //This rule for analog ATA
      @auraEnabled 
    public static String analogATArule(List<WrapperClass> licenseList,List<WrapperClass> switchPoeList){
        string error = 'ATA is required for analog product';
        Boolean checkTollMin = false;
        if(licenseList != null && !licenseList.isEmpty()){  
            for(WrapperClass lic : licenseList){
                if(lic.boolval == true && lic.product.isAnalogRule__c){
                    checkTollMin = true;
                    system.debug('====checkTollMin1======'+ checkTollMin);
                }
                else{
                    error = 'false';
                     system.debug('====checkTollMin2======'+ checkTollMin);
                }
            }
        }
        else{
            error = 'false';
             system.debug('====checkTollMin3======'+ checkTollMin);
        }
        
        if(checkTollMin){
            if(switchPoeList != null && !switchPoeList.isEmpty()){
                for(WrapperClass SwitchPoe : switchPoeList){
                    if(SwitchPoe.boolval == true){
                        if(SwitchPoe.product.isATArule__c == true){
                            if(SwitchPoe.product.Quantity__c != null){
                                error = 'false';
                                break;
                                system.debug('====checbjkdfhewlgfhwrlwrlwrckTollMin3======');
                            }
                            else{
                                error = 'ATA is required for analog product';
                                break;
                                System.debug('=====testelse===');
                            }
                        }else{
                            error = 'ATA is required for analog product';
                        }
                    }
                    else{
                        error = 'ATA is required for analog product';
                    }
                }
            }
            else{
                error = 'ATA is required for analog product';
            }
        }
        
        return error;
    } */
    
    @auraEnabled 
    public static String rule2(List<WrapperClass> licenselist,List<WrapperClass> phonelist){
        String error = 'false';
        Integer licenseQunatity = 0;
        Integer phoneQunatity = 0;
        Integer licenseQunatity2 = 0;
        Integer phoneQunatity2 = 0;
        if(licenselist != null && !licenselist.isEmpty()){
            for(WrapperClass lin : licenselist){
                if(lin.boolval == true && lin.product.IpPhoneRule1__c == true){
                    Integer quanity = Integer.valueOf(lin.product.Quantity__c);
                    licenseQunatity = licenseQunatity + quanity;
                    system.debug('==licenseQunatity========'+licenseQunatity);
                }
                if(lin.boolval == true && lin.product.IpPhoneRule2__c == true){
                    Integer quanity = Integer.valueOf(lin.product.Quantity__c);
                    licenseQunatity2 = licenseQunatity2 + quanity;
                    system.debug('==licenseQunatity2========'+licenseQunatity2);
                }
            }
        }
        
        if(phonelist != null && !phonelist.isEmpty()){
            
            for(WrapperClass phone : phonelist){
                if(phone.boolval == true && phone.product.IpPhoneRule1__c == true){
                    Integer quanity = Integer.valueOf(phone.product.Quantity__c);
                    phoneQunatity = phoneQunatity + quanity;
                }
                if(phone.boolval == true && phone.product.IpPhoneRule2__c == true){
                    Integer quanity = Integer.valueOf(phone.product.Quantity__c);
                    phoneQunatity2 = phoneQunatity2 + quanity;
                }
            }
            
        }
        if(licenseQunatity2 != 0 || licenseQunatity != 0){
            if(phoneQunatity > licenseQunatity){
                error = 'Total of Licenses Essential + Premier + Elite >= Total of Iphones 6920 + 6930 + 6940';
            }
        }
        if(licenseQunatity2 != 0 || licenseQunatity != 0){
            if(phoneQunatity2 > licenseQunatity2){
                error = 'Licenses Outboud >= Total of Analog + Paging Adapter';
            }
        }
        
        return error;
    }
    
    //This rule for Toll Free Bundle Minutes
     @auraEnabled 
    public static String telecommRule3(List<WrapperClass> addOnList,List<WrapperClass> telecommList){
        string error = 'One Toll free number is required from Add on for the Toll free bundle minutes';
        Boolean checkTollMin = false;
        if(telecommList != null && !telecommList.isEmpty()){
            for(WrapperClass tel : telecommList){
                if(tel.boolval == true){
                    checkTollMin = true;
                    
                }
                else{
                    error = 'false';
                }
            }
        }
        else{
            error = 'false';
        }
        
        if(checkTollMin){
            if(addOnList != null && !addOnList.isEmpty()){
                for(WrapperClass add : addOnList){
                    if(add.boolval == true){
                        if(add.product.TollFreeRule__c == true){
                            if(add.product.Quantity__c != null){
                                error = 'false';
                                break;
                            }
                            else{
                                error = 'One Toll free number is required from Add on for the Toll free bundle minutes';
                                break;
                                System.debug('=====testelse===');
                            }
                        }else{
                            error = 'One Toll free number is required from Add on for the Toll free bundle minutes';
                        }
                    }
                    else{
                        error = 'One Toll free number is required from Add on for the Toll free bundle minutes';
                    }
                }
            }
        }
        
        return error;
    }
    
    @auraEnabled 
    public static String poeSwitch(List<WrapperClass> swithesAndPOElist,string poe){
        system.debug('===size========'+swithesAndPOElist.size());
        system.debug('=====poe==='+poe);
        String errormessage = 'false';  
        Boolean check = false;
        if(poe == 'Switch'){
            if(swithesAndPOElist != null && !swithesAndPOElist.isEmpty()){
                for(WrapperClass switches : swithesAndPOElist){
                    if(switches.boolval == true ){
                        if(switches.product.POE_Switch_Rule__c == true && switches.product.Quantity__c != null){
                            check = true;
                        } 
                    }
                }
            }
        }
        else if(poe == 'Customer Provided' || poe == 'Not PoE' ){
            check = true;
        }
        if(check){
            errormessage = 'false';
        }else{
            errormessage = 'Please select at least one PoE';
        }
        return errormessage; 
    }
    @auraEnabled 
    public static List<Integer> getSiteNumber(String recordId){
        system.debug('==recordId========='+recordId);
        List<Integer> siteno = new List<Integer>();
        List<Site__c> sitelst = new List<Site__c>();
        if(recordId != null){
            sitelst = [Select id,Site_Number__c,Opportunity__c from Site__c where Opportunity__c =: recordId ORDER BY Site_Number__c ]; 
        }
        system.debug('==site========='+sitelst);
        if(sitelst != null && !sitelst.isEmpty()){
            for(Site__c s : sitelst){
                if(s.Site_Number__c != null){
                    siteno.add(Integer.valueOf(s.Site_Number__c));
                }
            }
        }
        system.debug('==siteno========='+siteno);
        return siteno;
    }
    @auraEnabled 
    public static string getSiteId(String recordId,integer siteNumber){
        system.debug('==recordId========='+recordId);
        string siteId = '';
        List<Site__c> sitelst = new List<Site__c>();
        if(recordId != null){
            sitelst = [Select id,Site_Number__c,Opportunity__c from Site__c where Opportunity__c =: recordId AND Site_Number__c =: siteNumber]; 
        }
        system.debug('==site========='+sitelst);
        if(sitelst != null && !sitelst.isEmpty()){
            for(Site__c s : sitelst){
                if(s.Site_Number__c != null){
                    siteId = s.Id;
                }
            }
        }
        system.debug('==siteId========='+siteId);
        return siteId;
    }
    @auraEnabled 
    public static string typeOfPoe(String recordId,integer site){
        system.debug('=====recordId====='+recordId);
        system.debug('=====site====='+site);
        //  decimal s = decimal.valueOf(site);
        List<Site__c> sitelst = new List<Site__c>();
        if(recordId != null){
            sitelst = [Select id,Site_Number__c,PoE_option__c,Opportunity__c from Site__c where Opportunity__c =: recordId AND  Site_Number__c =: site]; 
        }
        system.debug('=====sitelst====='+sitelst);
        string poe;
        for(Site__c s1 : sitelst){
            poe = s1.PoE_option__c;
        }
        system.debug('=====poe====='+poe);
        return poe; 
    }
    @auraEnabled 
    public static string prodType(String recordId){
        Opportunity opp = new Opportunity();
        string typeProduct ;
        if(recordId != null){
            opp = [select id,Types_of_Product__c from Opportunity where id =: recordId limit 1];
        }
        if(opp.Types_of_Product__c != null){
            typeProduct  = opp.Types_of_Product__c;
        }
        return typeProduct;
    }
    
    @auraEnabled 
    public static List<WrapperClass> getLicenseprodList(String recordId,integer siteNumber){
        List<Product2> pro = new List<Product2>();
        PriceBookId__c pricebook = new PriceBookId__c();
        List<PricebookEntry> priceEntry = new List<PricebookEntry>();
        Set<Id> productId = new Set<Id>();
        Opportunity opp = new Opportunity();
        List<Product2> productTolllist = new List<Product2>();
        List<OpportunityLineItem> oppItemlst = new List<OpportunityLineItem>();
        Map<String,String> mapOppQuantity  = new Map<String,String>();
        list<WrapperClass> wrapList = new list<WrapperClass>();
        if(recordId != null){
            opp = [select id,Pricebook2Id,Contract_Term_Years__c from Opportunity where id =: recordId limit 1];
        }
        System.debug('==ids=='+recordId);
        String year = '';
        if(opp != null && opp.Contract_Term_Years__c != null){
            year = String.valueOf(opp.Contract_Term_Years__c);
        }
        if(opp.id != null && siteNumber != null){
            oppItemlst = [Select id,Site__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC_Price__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c from OpportunityLineItem where OpportunityId =: opp.id and Site_Number__c =: siteNumber and Filter_Product__c =: 'Parent' and Equote_ext_ID__c != null];
        }
        if(oppItemlst != null && !oppItemlst.isEmpty()){
            for(OpportunityLineItem oppItem : oppItemlst){
                Integer Qty = Integer.valueOf(oppItem.Quantity);
                mapOppQuantity.put(oppItem.Product2Id,String.valueOf(Qty));
            }
        }
        
        pro = [select id,isEssential__c,isElite__c,isPremier__c,isOutbound__c,isTollFreeNum__c,isE911__c,isWebFax__c,Family,Name,Equipment__c,Product_Subcategory__c,IpPhoneRule1__c,IpPhoneRule2__c,Year__c,Product_Type__c,is_show_on_ux__c,Term__c,Description,ProductCode,IsActive,License_Order__c,Part_Number__c,Part_Number_of_Product__c,SetUp_Order__c,Child__c,Parent__c,Show_in_PDF__c from Product2 where IsActive =: true AND (Product_Subcategory__c =:'Licenses' AND Family =: 'FAW')AND (Product_Type__c =: 'FAW UCaaS'  AND is_show_on_ux__c =: true AND Parent__c =:true) and (Year__c =: year OR Year__c =: 'All') ORDER BY License_Order__c ];
        
        System.debug('-------pro------'+pro);
        if(pro != null && !pro.isEmpty()){
            for(Product2 p : pro){
                productId.add(p.id);
            }
        }
        
        priceEntry = [Select id,UnitPrice,NRC_Unit_Price__c,Pricebook2Id,Product2Id,Type_of_Billing__c,VENDORPRICELISTTOFTR__c,UNITCOST__c,GPM__c,DISCOUNT_Price__c,IsActive from PricebookEntry where Product2Id =: productId and Pricebook2Id =: opp.Pricebook2Id and IsActive =: true];
        System.debug('====priceEntry====='+priceEntry);
        for(PricebookEntry e : priceEntry) {
            System.debug('====e==='+e);
        }
        
        if(pro != null && !pro.isEmpty()){
            if(priceEntry != null && !priceEntry.isEmpty()) {
                for(Product2 p : pro){
                    for(PricebookEntry prcEntry : priceEntry){
                        System.debug('===prcEntry====='+prcEntry);
                        if(p.id == prcEntry.Product2Id){
                            if(mapOppQuantity != null && !mapOppQuantity.isEmpty() && mapOppQuantity.containsKey(p.id)){
                                p.Quantity__c = mapOppQuantity.get(p.id);
                                WrapperClass wrap = new WrapperClass(p,true,true,false,prcEntry,0,0);  
                                wrapList.add(wrap);
                            }else{
                                WrapperClass wrap = new WrapperClass(p,false,true,false,prcEntry,0,0); 
                                wrapList.add(wrap);
                            }
                            
                        }
                    }
                }
            }
        }
        system.debug('------wrapList------'+wrapList);
        return wrapList;
    }
    @auraEnabled 
    public static List<WrapperClass> getIpPhoneProdList(String recordId,integer siteNumber){
        List<Product2> pro = new List<Product2>();
        PriceBookId__c pricebook = new PriceBookId__c();
        List<PricebookEntry> priceEntry = new List<PricebookEntry>();
        Set<Id> productId = new Set<Id>();
        Opportunity opp = new Opportunity();
        List<Product2> productTolllist = new List<Product2>();
        List<OpportunityLineItem> oppItemlst = new List<OpportunityLineItem>();
        Map<String,String> mapOppQuantity  = new Map<String,String>();
        list<WrapperClass> wrapList = new list<WrapperClass>();
        if(recordId != null){
            opp = [select id,Pricebook2Id,Contract_Term_Years__c from Opportunity where id =: recordId limit 1];
        }
        System.debug('==ids=='+recordId);
        String year = '';
        if(opp != null && opp.Contract_Term_Years__c != null){
            year = String.valueOf(opp.Contract_Term_Years__c);
        }
        if(opp.Id != null && siteNumber != null){
            oppItemlst = [Select id,Site__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC_Price__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c from OpportunityLineItem where OpportunityId =: opp.Id and Site_Number__c =: siteNumber and Filter_Product__c =: 'Parent' and Equote_ext_ID__c != null];
        }
        if(oppItemlst != null && !oppItemlst.isEmpty()){
            for(OpportunityLineItem oppItem : oppItemlst){
                Integer Qty = Integer.valueOf(oppItem.Quantity);
                mapOppQuantity.put(oppItem.Product2Id,String.valueOf(Qty));
            }
        }
        
        pro = [select id,Family,Name,IpPhone__c,IpPhoneRule1__c,IpPhoneRule2__c,Equipment__c,Product_Subcategory__c,Year__c,Product_Type__c,is_show_on_ux__c,Part_Number__c,Term__c,Part_Number_of_Product__c,Description,ProductCode,IsActive,License_Order__c,SetUp_Order__c,Child__c,Parent__c,Show_in_PDF__c,POE__c,Accessories__c,Accessories1__c from Product2 where IsActive =: true AND (Product_Subcategory__c =:'IP Phones' AND Family =: 'FAW') AND (Product_Type__c =: 'FAW UCaaS' AND is_show_on_ux__c =: true AND Parent__c =:true) AND (Year__c =: year OR Year__c =: 'All') ORDER BY License_Order__c ] ;
        
        System.debug('-------pro------'+pro);
        if(pro != null && !pro.isEmpty()){
            for(Product2 p : pro){
                productId.add(p.id);
            }
        }
        
        priceEntry = [Select id,UnitPrice,NRC_Unit_Price__c,Pricebook2Id,Product2Id,Type_of_Billing__c,VENDORPRICELISTTOFTR__c,UNITCOST__c,GPM__c,DISCOUNT_Price__c,IsActive from PricebookEntry where Product2Id =: productId and Pricebook2Id =: opp.Pricebook2Id and IsActive =: true];
        System.debug('====priceEntry====='+priceEntry);
        for(PricebookEntry e : priceEntry) {
            System.debug('====e==='+e);
        }
        
        if(pro != null && !pro.isEmpty()){
            if(priceEntry != null && !priceEntry.isEmpty()) {
                for(Product2 p : pro){
                    for(PricebookEntry prcEntry : priceEntry){
                        System.debug('===prcEntry====='+prcEntry);
                        if(p.id == prcEntry.Product2Id){
                            if(mapOppQuantity != null && !mapOppQuantity.isEmpty() && mapOppQuantity.containsKey(p.id)){
                                p.Quantity__c = mapOppQuantity.get(p.id);
                                WrapperClass wrap = new WrapperClass(p,true,true,false,prcEntry,0,0);  
                                wrapList.add(wrap);
                            }else{
                                WrapperClass wrap = new WrapperClass(p,false,true,false,prcEntry,0,0); 
                                wrapList.add(wrap);
                            }
                            
                        }
                    }
                }
            }
        }
        system.debug('------wrapList------'+wrapList);
        return wrapList;
    }
    @auraEnabled 
    public static List<WrapperClass> getAddOnProdList(String recordId,integer siteNumber){
        List<Product2> pro = new List<Product2>();
        PriceBookId__c pricebook = new PriceBookId__c();
        List<PricebookEntry> priceEntry = new List<PricebookEntry>();
        Set<Id> productId = new Set<Id>();
        Opportunity opp = new Opportunity();
        List<Product2> productTolllist = new List<Product2>();
        List<OpportunityLineItem> oppItemlst = new List<OpportunityLineItem>();
        Map<String,String> mapOppQuantity  = new Map<String,String>();
        list<WrapperClass> wrapList = new list<WrapperClass>();
        if(recordId != null){
            opp = [select id,Pricebook2Id,Contract_Term_Years__c from Opportunity where id =: recordId limit 1];
        }
        System.debug('==ids=='+recordId);
        String year = '';
        if(opp != null && opp.Contract_Term_Years__c != null){
            year = String.valueOf(opp.Contract_Term_Years__c);
        }
        if(opp.id != null && siteNumber != null){
            oppItemlst = [Select id,Site__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC_Price__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c from OpportunityLineItem where OpportunityId =: opp.id and Site_Number__c =: siteNumber and Filter_Product__c =: 'Parent' and Equote_ext_ID__c != null];
        }
        if(oppItemlst != null && !oppItemlst.isEmpty()){
            for(OpportunityLineItem oppItem : oppItemlst){
                Integer Qty = Integer.valueOf(oppItem.Quantity);
                mapOppQuantity.put(oppItem.Product2Id,String.valueOf(Qty));
            }
        }
        
        pro = [select id,isEssential__c,isElite__c,isAdditionalDID__c,isCallerId__c,isAdditionalDirectory__c,isExtendedMarket__c,isAdditionalManaged__c,isBusinessAnalytic__c,isPremier__c,isOutbound__c,isTollFreeNum__c,isE911__c,isWebFax__c,Family,Name,Product_Subcategory__c,Equipment__c,TollFreeRule__c,Year__c,Product_Type__c,is_show_on_ux__c,Term__c,Part_Number__c,Part_Number_of_Product__c,Description,ProductCode,IsActive,License_Order__c,SetUp_Order__c,Child__c,Parent__c,Show_in_PDF__c from Product2 where IsActive =: true AND (Product_Subcategory__c =:'Add-On' AND Family =: 'FAW') AND (Product_Type__c =: 'FAW UCaaS' AND is_show_on_ux__c =: true AND Parent__c =:true) AND (Year__c =: year OR Year__c =: 'All') ORDER BY License_Order__c ] ;
        
        System.debug('-------pro------'+pro);
        if(pro != null && !pro.isEmpty()){
            for(Product2 p : pro){
                productId.add(p.id);
            }
        }
        
        priceEntry = [Select id,UnitPrice,NRC_Unit_Price__c,Pricebook2Id,Product2Id,Type_of_Billing__c,VENDORPRICELISTTOFTR__c,UNITCOST__c,GPM__c,DISCOUNT_Price__c,IsActive from PricebookEntry where Product2Id =: productId and Pricebook2Id =: opp.Pricebook2Id and IsActive =: true];
        System.debug('====priceEntry====='+priceEntry);
        for(PricebookEntry e : priceEntry) {
            System.debug('====e==='+e);
        }
        
        if(pro != null && !pro.isEmpty()){
            if(priceEntry != null && !priceEntry.isEmpty()) {
                for(Product2 p : pro){
                    for(PricebookEntry prcEntry : priceEntry){
                        System.debug('===prcEntry====='+prcEntry);
                        if(p.id == prcEntry.Product2Id){
                            if(mapOppQuantity != null && !mapOppQuantity.isEmpty() && mapOppQuantity.containsKey(p.id)){
                                p.Quantity__c = mapOppQuantity.get(p.id);
                                WrapperClass wrap = new WrapperClass(p,true,true,false,prcEntry,0,0);  
                                wrapList.add(wrap);
                            }else{
                                WrapperClass wrap = new WrapperClass(p,false,true,false,prcEntry,0,0); 
                                wrapList.add(wrap);
                            }
                            
                        }
                    }
                }
            }
        }
        system.debug('------wrapList------'+wrapList);
        return wrapList;
    }
    @auraEnabled 
    public static List<WrapperClass> getTelecommProdList(String recordId,integer siteNumber){
        List<Product2> pro = new List<Product2>();
        PriceBookId__c pricebook = new PriceBookId__c();
        List<PricebookEntry> priceEntry = new List<PricebookEntry>();
        Set<Id> productId = new Set<Id>();
        Opportunity opp = new Opportunity();
        List<Product2> productTolllist = new List<Product2>();
        List<OpportunityLineItem> oppItemlst = new List<OpportunityLineItem>();
        Map<String,String> mapOppQuantity  = new Map<String,String>();
        list<WrapperClass> wrapList = new list<WrapperClass>();
        if(recordId != null){
            opp = [select id,Pricebook2Id,Contract_Term_Years__c from Opportunity where id =: recordId limit 1];
        }
        System.debug('==ids=='+recordId);
        String year = '';
        if(opp != null && opp.Contract_Term_Years__c != null){
            year =  String.valueOf(opp.Contract_Term_Years__c);
        }
        if(opp.id != null && siteNumber != null){
            oppItemlst = [Select id,Site__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC_Price__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c from OpportunityLineItem where OpportunityId =: opp.id and Site_Number__c =: siteNumber and Filter_Product__c =: 'Parent' and Equote_ext_ID__c != null];
        }
        if(oppItemlst != null && !oppItemlst.isEmpty()){
            for(OpportunityLineItem oppItem : oppItemlst){
                Integer Qty = Integer.valueOf(oppItem.Quantity);
                mapOppQuantity.put(oppItem.Product2Id,String.valueOf(Qty));
            }
        }
        
        pro = [select id,Family,Name,Product_Subcategory__c,Equipment__c,TollFreeRule__c,Year__c,Product_Type__c,is_show_on_ux__c,Term__c,Part_Number__c,Part_Number_of_Product__c,Description,ProductCode,IsActive,License_Order__c,SetUp_Order__c,Child__c,Parent__c,Show_in_PDF__c from Product2 where IsActive =: true AND (Product_Subcategory__c =:'Toll Free Bundle Minutes' AND Family =: 'FAW') AND (Product_Type__c =: 'FAW UCaaS' AND is_show_on_ux__c =: true AND Parent__c =:true) AND (Year__c =: year OR Year__c =: 'All') ORDER BY License_Order__c];
        
        System.debug('-------pro------'+pro);
        if(pro != null && !pro.isEmpty()){
            for(Product2 p : pro){
                productId.add(p.id);
            }
        }
        
        priceEntry = [Select id,UnitPrice,NRC_Unit_Price__c,Pricebook2Id,Product2Id,Type_of_Billing__c,VENDORPRICELISTTOFTR__c,UNITCOST__c,GPM__c,DISCOUNT_Price__c,IsActive from PricebookEntry where Product2Id =: productId and Pricebook2Id =: opp.Pricebook2Id and IsActive =: true];
        System.debug('====priceEntry====='+priceEntry);
        for(PricebookEntry e : priceEntry) {
            System.debug('====e==='+e);
        }
        
        if(pro != null && !pro.isEmpty()){
            if(priceEntry != null && !priceEntry.isEmpty()) {
                for(Product2 p : pro){
                    for(PricebookEntry prcEntry : priceEntry){
                        System.debug('===prcEntry====='+prcEntry);
                        if(p.id == prcEntry.Product2Id){
                            if(mapOppQuantity != null && !mapOppQuantity.isEmpty() && mapOppQuantity.containsKey(p.id)){
                                p.Quantity__c = mapOppQuantity.get(p.id);
                                WrapperClass wrap = new WrapperClass(p,true,true,false,prcEntry,0,0);  
                                wrapList.add(wrap);
                            }else{
                                WrapperClass wrap = new WrapperClass(p,false,true,false,prcEntry,0,0); 
                                wrapList.add(wrap);
                            }
                            
                        }
                    }
                }
            }
        }
        system.debug('------wrapList------'+wrapList);
        return wrapList;
    }
    @auraEnabled 
    public static List<WrapperClass> getSwitchProdList(String recordId,integer siteNumber){
        List<Product2> pro = new List<Product2>();
        PriceBookId__c pricebook = new PriceBookId__c();
        List<PricebookEntry> priceEntry = new List<PricebookEntry>();
        Set<Id> productId = new Set<Id>();
        Opportunity opp = new Opportunity();
        List<Product2> productTolllist = new List<Product2>();
        List<OpportunityLineItem> oppItemlst = new List<OpportunityLineItem>();
        Map<String,String> mapOppQuantity  = new Map<String,String>();
        list<WrapperClass> wrapList = new list<WrapperClass>();
        if(recordId != null){
            opp = [select id,Pricebook2Id,Contract_Term_Years__c from Opportunity where id =: recordId limit 1];
        }
        System.debug('==ids=='+recordId);
        String year = '';
        if(opp != null && opp.Contract_Term_Years__c != null){
            year = String.valueOf(opp.Contract_Term_Years__c);
        }
        if(opp.id != null && siteNumber != null){
            oppItemlst = [Select id,Site__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC_Price__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c from OpportunityLineItem where OpportunityId =: opp.id and Site_Number__c =: siteNumber and Filter_Product__c =: 'Parent' and Equote_ext_ID__c != null];
        }
        if(oppItemlst != null && !oppItemlst.isEmpty()){
            for(OpportunityLineItem oppItem : oppItemlst){
                Integer Qty = Integer.valueOf(oppItem.Quantity);
                mapOppQuantity.put(oppItem.Product2Id,String.valueOf(Qty));
            }
        }
        
        pro = [select id,Family,Name,Product_Subcategory__c,Year__c,Equipment__c,Product_Type__c,Term__c,is_show_on_ux__c,Part_Number__c,Description,Part_Number_of_Product__c,ProductCode,IsActive,License_Order__c,SetUp_Order__c,Child__c,Parent__c,Show_in_PDF__c,POE_Switch_Rule__c from Product2 where IsActive =: true AND (Product_Subcategory__c =:'Switches and PoE' AND Family =: 'FAW') AND (Product_Type__c =: 'FAW UCaaS' AND is_show_on_ux__c =: true AND Parent__c =:true) AND (Year__c =: year OR Year__c =: 'All') ORDER BY License_Order__c ];
        
        System.debug('-------pro------'+pro);
        if(pro != null && !pro.isEmpty()){
            for(Product2 p : pro){
                productId.add(p.id);
            }
        }
        
        priceEntry = [Select id,UnitPrice,NRC_Unit_Price__c,Pricebook2Id,Product2Id,Type_of_Billing__c,VENDORPRICELISTTOFTR__c,UNITCOST__c,GPM__c,DISCOUNT_Price__c,IsActive from PricebookEntry where Product2Id =: productId and Pricebook2Id =: opp.Pricebook2Id and IsActive =: true];
        System.debug('====priceEntry====='+priceEntry);
        for(PricebookEntry e : priceEntry) {
            System.debug('====e==='+e);
        }
        
        if(pro != null && !pro.isEmpty()){
            if(priceEntry != null && !priceEntry.isEmpty()) {
                for(Product2 p : pro){
                    for(PricebookEntry prcEntry : priceEntry){
                        System.debug('===prcEntry====='+prcEntry);
                        if(p.id == prcEntry.Product2Id){
                            if(mapOppQuantity != null && !mapOppQuantity.isEmpty() && mapOppQuantity.containsKey(p.id)){
                                p.Quantity__c = mapOppQuantity.get(p.id);
                                WrapperClass wrap = new WrapperClass(p,true,true,false,prcEntry,0,0);  
                                wrapList.add(wrap);
                            }else{
                                WrapperClass wrap = new WrapperClass(p,false,true,false,prcEntry,0,0); 
                                wrapList.add(wrap);
                            }
                            
                        }
                    }
                }
            }
        }
        system.debug('------wrapList------'+wrapList);
        return wrapList;
    }
    @auraEnabled 
    public static List<WrapperClass> getAccessoriesProdList(String recordId,integer siteNumber){
        List<Product2> pro = new List<Product2>();
        PriceBookId__c pricebook = new PriceBookId__c();
        List<PricebookEntry> priceEntry = new List<PricebookEntry>();
        Set<Id> productId = new Set<Id>();
        Opportunity opp = new Opportunity();
        List<Product2> productTolllist = new List<Product2>();
        List<OpportunityLineItem> oppItemlst = new List<OpportunityLineItem>();
        Map<String,String> mapOppQuantity  = new Map<String,String>();
        list<WrapperClass> wrapList = new list<WrapperClass>();
        if(recordId != null){
            opp = [select id,Pricebook2Id,Contract_Term_Years__c from Opportunity where id =: recordId limit 1];
        }
        System.debug('==ids=='+recordId);
        String year = '';
        if(opp != null && opp.Contract_Term_Years__c != null){
            year = String.valueOf(opp.Contract_Term_Years__c);
        }
        if(opp.id != null && siteNumber != null){
            oppItemlst = [Select id,Site__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC_Price__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c from OpportunityLineItem where OpportunityId =: opp.id and Site_Number__c =: siteNumber and Filter_Product__c =: 'Parent' and Equote_ext_ID__c != null];
        }
        if(oppItemlst != null && !oppItemlst.isEmpty()){
            for(OpportunityLineItem oppItem : oppItemlst){
                Integer Qty = Integer.valueOf(oppItem.Quantity);
                mapOppQuantity.put(oppItem.Product2Id,String.valueOf(Qty));
            }
        }
        
        pro = [select id,Family,Name,Product_Subcategory__c,Year__c,Equipment__c,Product_Type__c,is_show_on_ux__c,Part_Number__c,Term__c,Part_Number_of_Product__c,Description,ProductCode,IsActive,License_Order__c,SetUp_Order__c,Child__c,Parent__c,Show_in_PDF__c,Accessories__c,Accessories1__c from Product2 where IsActive =: true AND (Product_Subcategory__c =:'Accessories' AND Family =: 'FAW') AND (Product_Type__c =: 'FAW UCaaS' AND is_show_on_ux__c =: true AND Parent__c =:true) AND (Year__c =: year OR Year__c =: 'All') ORDER BY License_Order__c ];
        
        System.debug('-------pro------'+pro);
        if(pro != null && !pro.isEmpty()){
            for(Product2 p : pro){
                productId.add(p.id);
            }
        }
        
        priceEntry = [Select id,UnitPrice,NRC_Unit_Price__c,Pricebook2Id,Product2Id,Type_of_Billing__c,VENDORPRICELISTTOFTR__c,UNITCOST__c,GPM__c,DISCOUNT_Price__c,IsActive from PricebookEntry where Product2Id =: productId and Pricebook2Id =: opp.Pricebook2Id and IsActive =: true];
        System.debug('====priceEntry====='+priceEntry);
        for(PricebookEntry e : priceEntry) {
            System.debug('====e==='+e);
        }
        
        if(pro != null && !pro.isEmpty()){
            if(priceEntry != null && !priceEntry.isEmpty()) {
                for(Product2 p : pro){
                    for(PricebookEntry prcEntry : priceEntry){
                        System.debug('===prcEntry====='+prcEntry);
                        if(p.id == prcEntry.Product2Id){
                            if(mapOppQuantity != null && !mapOppQuantity.isEmpty() && mapOppQuantity.containsKey(p.id)){
                                p.Quantity__c = mapOppQuantity.get(p.id);
                                WrapperClass wrap = new WrapperClass(p,true,true,false,prcEntry,0,0);  
                                wrapList.add(wrap);
                            }else{
                                WrapperClass wrap = new WrapperClass(p,false,true,false,prcEntry,0,0); 
                                wrapList.add(wrap);
                            }
                            
                        }
                    }
                }
            }
        }
        system.debug('------wrapList------'+wrapList);
        return wrapList;
    }
    @auraEnabled 
    public static List<WrapperClass> getLicenseSmartProdList(String recordId,integer siteNumber){
        List<Product2> pro = new List<Product2>();
        PriceBookId__c pricebook = new PriceBookId__c();
        List<PricebookEntry> priceEntry = new List<PricebookEntry>();
        Set<Id> productId = new Set<Id>();
        Opportunity opp = new Opportunity();
        List<Product2> productTolllist = new List<Product2>();
        List<OpportunityLineItem> oppItemlst = new List<OpportunityLineItem>();
        Map<String,String> mapOppQuantity  = new Map<String,String>();
        list<WrapperClass> wrapList = new list<WrapperClass>();
        if(recordId != null){
            opp = [select id,Pricebook2Id,Contract_Term_Years__c from Opportunity where id =: recordId limit 1];
        }
        System.debug('==ids=='+recordId);
        String year = '';
        if(opp != null && opp.Contract_Term_Years__c != null){
            String.valueOf(opp.Contract_Term_Years__c);
        }
        if(opp.id != null && siteNumber != null){
            oppItemlst = [Select id,Site__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC_Price__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c from OpportunityLineItem where OpportunityId =: opp.id and Site_Number__c =: siteNumber and Filter_Product__c =: 'Parent' and Equote_ext_ID__c != null];
        }
        if(oppItemlst != null && !oppItemlst.isEmpty()){
            for(OpportunityLineItem oppItem : oppItemlst){
                Integer Qty = Integer.valueOf(oppItem.Quantity);
                mapOppQuantity.put(oppItem.Product2Id,String.valueOf(Qty));
            }
        }
        
        pro = [select id,Family,Name,isConferenceRumSeatRule__c,PremiumRule__c,PremiumPlusRule__c,isAnalogRule__c,Equipment__c,Product_Subcategory__c,Year__c,Product_Type__c,is_show_on_ux__c,Description,ProductCode,IsActive,License_Order__c,Part_Number_of_Product__c,Child__c,Parent__c,Show_in_PDF__c,Item_Code__c,S_E_LOOP__c,S_E_PORT__c from Product2 where IsActive =: true AND (Product_Subcategory__c =:'Licenses' AND Family =: 'Smart Voice')AND (Product_Type__c =: 'Smart Voice'  AND is_show_on_ux__c =: true AND Parent__c =:true) and (Year__c =: year OR Year__c =: 'All') ORDER BY License_Order__c ];
        
        System.debug('-------pro------'+pro);
        if(pro != null && !pro.isEmpty()){
            for(Product2 p : pro){
                productId.add(p.id);
            }
        }
        
        priceEntry = [Select id,UnitPrice,Pricebook2Id,Product2Id,NRC_Unit_Price__c,Type_of_Billing__c,VENDORPRICELISTTOFTR__c,UNITCOST__c,GPM__c,DISCOUNT_Price__c from PricebookEntry where Product2Id =: productId and Pricebook2Id =: opp.Pricebook2Id];
        System.debug('====priceEntry====='+priceEntry);
        for(PricebookEntry e : priceEntry) {
            System.debug('====e==='+e);
        }
        
        if(pro != null && !pro.isEmpty()){
            if(priceEntry != null && !priceEntry.isEmpty()) {
                for(Product2 p : pro){
                    for(PricebookEntry prcEntry : priceEntry){
                        System.debug('===prcEntry====='+prcEntry);
                        if(p.id == prcEntry.Product2Id){
                            if(mapOppQuantity != null && !mapOppQuantity.isEmpty() && mapOppQuantity.containsKey(p.id)){
                                p.Quantity__c = mapOppQuantity.get(p.id);
                                WrapperClass wrap = new WrapperClass(p,true,true,false,prcEntry,0,0);  
                                wrapList.add(wrap);
                            }else{
                                WrapperClass wrap = new WrapperClass(p,false,true,false,prcEntry,0,0); 
                                wrapList.add(wrap);
                            }
                            
                        }
                    }
                }
            }
        }
        system.debug('------wrapList------'+wrapList);
        return wrapList;
    }
    @auraEnabled 
    public static List<WrapperClass> getAddOnSmartProdList(String recordId,integer siteNumber){
        List<Product2> pro = new List<Product2>();
        PriceBookId__c pricebook = new PriceBookId__c();
        List<PricebookEntry> priceEntry = new List<PricebookEntry>();
        Set<Id> productId = new Set<Id>();
        Opportunity opp = new Opportunity();
        List<Product2> productTolllist = new List<Product2>();
        List<OpportunityLineItem> oppItemlst = new List<OpportunityLineItem>();
        Map<String,String> mapOppQuantity  = new Map<String,String>();
        list<WrapperClass> wrapList = new list<WrapperClass>();
        if(recordId != null){
            opp = [select id,Pricebook2Id,Contract_Term_Years__c from Opportunity where id =: recordId limit 1];
        }
        System.debug('==ids=='+recordId);
        String year = '';
        if(opp != null && opp.Contract_Term_Years__c != null){
            year = String.valueOf(opp.Contract_Term_Years__c);
        }
        if(opp.id != null && siteNumber != null){
            oppItemlst = [Select id,Site__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC_Price__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c from OpportunityLineItem where OpportunityId =: opp.id and Site_Number__c =: siteNumber and Filter_Product__c =: 'Parent' and Equote_ext_ID__c != null];
        }
        if(oppItemlst != null && !oppItemlst.isEmpty()){
            for(OpportunityLineItem oppItem : oppItemlst){
                Integer Qty = Integer.valueOf(oppItem.Quantity);
                mapOppQuantity.put(oppItem.Product2Id,String.valueOf(Qty));
            }
        }
        
        pro = [select id,Family,Name,TollFreeRule__c,Equipment__c,Product_Subcategory__c,Year__c,Product_Type__c,is_show_on_ux__c,Description,ProductCode,IsActive,License_Order__c,Part_Number_of_Product__c,Child__c,Parent__c,Show_in_PDF__c,Item_Code__c,S_E_LOOP__c,S_E_PORT__c from Product2 where IsActive =: true AND (Product_Subcategory__c =:'Add-On' AND Family =: 'Smart Voice')AND (Product_Type__c =: 'Smart Voice'  AND is_show_on_ux__c =: true AND Parent__c =:true) and (Year__c =: year OR Year__c =: 'All') ORDER BY License_Order__c ];
        
        System.debug('-------pro------'+pro);
        if(pro != null && !pro.isEmpty()){
            for(Product2 p : pro){
                productId.add(p.id);
            }
        }
        
        priceEntry = [Select id,UnitPrice,Pricebook2Id,Product2Id,NRC_Unit_Price__c,Type_of_Billing__c,VENDORPRICELISTTOFTR__c,UNITCOST__c,GPM__c,DISCOUNT_Price__c from PricebookEntry where Product2Id =: productId and Pricebook2Id =: opp.Pricebook2Id];
        System.debug('====priceEntry====='+priceEntry);
        for(PricebookEntry e : priceEntry) {
            System.debug('====e==='+e);
        }
        
        if(pro != null && !pro.isEmpty()){
            if(priceEntry != null && !priceEntry.isEmpty()) {
                for(Product2 p : pro){
                    for(PricebookEntry prcEntry : priceEntry){
                        System.debug('===prcEntry====='+prcEntry);
                        if(p.id == prcEntry.Product2Id){
                            if(mapOppQuantity != null && !mapOppQuantity.isEmpty() && mapOppQuantity.containsKey(p.id)){
                                p.Quantity__c = mapOppQuantity.get(p.id);
                                WrapperClass wrap = new WrapperClass(p,true,true,false,prcEntry,0,0);  
                                wrapList.add(wrap);
                            }else{
                                WrapperClass wrap = new WrapperClass(p,false,true,false,prcEntry,0,0); 
                                wrapList.add(wrap);
                            }
                            
                        }
                    }
                }
            }
        }
        system.debug('------wrapList------'+wrapList);
        return wrapList;
    }
    @auraEnabled 
    public static List<WrapperClass> getIpPhoneSmartProdList(String recordId,integer siteNumber){
        List<Product2> pro = new List<Product2>();
        PriceBookId__c pricebook = new PriceBookId__c();
        List<PricebookEntry> priceEntry = new List<PricebookEntry>();
        Set<Id> productId = new Set<Id>();
        Opportunity opp = new Opportunity();
        List<Product2> productTolllist = new List<Product2>();
        List<OpportunityLineItem> oppItemlst = new List<OpportunityLineItem>();
        Map<String,String> mapOppQuantity  = new Map<String,String>();
        list<WrapperClass> wrapList = new list<WrapperClass>();
        if(recordId != null){
            opp = [select id,Pricebook2Id,Contract_Term_Years__c from Opportunity where id =: recordId limit 1];
        }
        System.debug('==ids=='+recordId);
        String year = '';
        if(opp != null && opp.Contract_Term_Years__c != null){
            year = String.valueOf(opp.Contract_Term_Years__c);
        }
        if(opp.id != null && siteNumber != null){
            oppItemlst = [Select id,Site__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC_Price__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c from OpportunityLineItem where OpportunityId =: opp.id and Site_Number__c =: siteNumber and Filter_Product__c =: 'Parent' and Equote_ext_ID__c != null];
        }
        if(oppItemlst != null && !oppItemlst.isEmpty()){
            for(OpportunityLineItem oppItem : oppItemlst){
                Integer Qty = Integer.valueOf(oppItem.Quantity);
                mapOppQuantity.put(oppItem.Product2Id,String.valueOf(Qty));
            }
        }
        
        pro = [select id,Family,Name,isSmartIpPhoneRule__c,isIpSoundStationRule__c,Equipment__c,Product_Subcategory__c,Year__c,Product_Type__c,is_show_on_ux__c,Description,ProductCode,IsActive,License_Order__c,Part_Number_of_Product__c,Child__c,Parent__c,Show_in_PDF__c,Item_Code__c,S_E_LOOP__c,S_E_PORT__c from Product2 where IsActive =: true AND (Product_Subcategory__c =:'IP Phones' AND Family =: 'Smart Voice')AND (Product_Type__c =: 'Smart Voice'  AND is_show_on_ux__c =: true AND Parent__c =:true) and (Year__c =: year OR Year__c =: 'All') ORDER BY License_Order__c ];
        
        System.debug('-------pro------'+pro);
        if(pro != null && !pro.isEmpty()){
            for(Product2 p : pro){
                productId.add(p.id);
            }
        }
        
        priceEntry = [Select id,UnitPrice,Pricebook2Id,Product2Id,NRC_Unit_Price__c,Type_of_Billing__c,VENDORPRICELISTTOFTR__c,UNITCOST__c,GPM__c,DISCOUNT_Price__c from PricebookEntry where Product2Id =: productId and Pricebook2Id =: opp.Pricebook2Id];
        System.debug('====priceEntry====='+priceEntry);
        for(PricebookEntry e : priceEntry) {
            System.debug('====e==='+e);
        }
        
        if(pro != null && !pro.isEmpty()){
            if(priceEntry != null && !priceEntry.isEmpty()) {
                for(Product2 p : pro){
                    for(PricebookEntry prcEntry : priceEntry){
                        System.debug('===prcEntry====='+prcEntry);
                        if(p.id == prcEntry.Product2Id){
                            if(mapOppQuantity != null && !mapOppQuantity.isEmpty() && mapOppQuantity.containsKey(p.id)){
                                p.Quantity__c = mapOppQuantity.get(p.id);
                                WrapperClass wrap = new WrapperClass(p,true,true,false,prcEntry,0,0);  
                                wrapList.add(wrap);
                            }else{
                                WrapperClass wrap = new WrapperClass(p,false,true,false,prcEntry,0,0); 
                                wrapList.add(wrap);
                            }
                            
                        }
                    }
                }
            }
        }
        system.debug('------wrapList------'+wrapList);
        return wrapList;
    }
    @auraEnabled 
    public static List<WrapperClass> getSwitchesSmartProdList(String recordId,integer siteNumber){
        List<Product2> pro = new List<Product2>();
        PriceBookId__c pricebook = new PriceBookId__c();
        List<PricebookEntry> priceEntry = new List<PricebookEntry>();
        Set<Id> productId = new Set<Id>();
        Opportunity opp = new Opportunity();
        List<Product2> productTolllist = new List<Product2>();
        List<OpportunityLineItem> oppItemlst = new List<OpportunityLineItem>();
        Map<String,String> mapOppQuantity  = new Map<String,String>();
        list<WrapperClass> wrapList = new list<WrapperClass>();
        if(recordId != null){
            opp = [select id,Pricebook2Id,Contract_Term_Years__c from Opportunity where id =: recordId limit 1];
        }
        System.debug('==ids=='+recordId);
        String year = '';
        if(opp != null && opp.Contract_Term_Years__c != null){
            year = String.valueOf(opp.Contract_Term_Years__c);
        }
        if(opp.id != null && siteNumber != null){
            oppItemlst = [Select id,Site__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC_Price__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c from OpportunityLineItem where OpportunityId =: opp.id and Site_Number__c =: siteNumber and Filter_Product__c =: 'Parent' and Equote_ext_ID__c != null];
        }
        if(oppItemlst != null && !oppItemlst.isEmpty()){
            for(OpportunityLineItem oppItem : oppItemlst){
                Integer Qty = Integer.valueOf(oppItem.Quantity);
                mapOppQuantity.put(oppItem.Product2Id,String.valueOf(Qty));
            }
        }
        
        pro = [select id,Family,Name,Equipment__c,isATArule__c,Product_Subcategory__c,Year__c,Product_Type__c,is_show_on_ux__c,Description,ProductCode,IsActive,License_Order__c,Part_Number_of_Product__c,Child__c,Parent__c,Show_in_PDF__c,Item_Code__c,S_E_LOOP__c,S_E_PORT__c from Product2 where IsActive =: true AND (Product_Subcategory__c =:'Switches and PoE' AND Family =: 'Smart Voice')AND (Product_Type__c =: 'Smart Voice'  AND is_show_on_ux__c =: true AND Parent__c =:true) and (Year__c =: year OR Year__c =: 'All') ORDER BY License_Order__c ];
        
        System.debug('-------pro------'+pro);
        if(pro != null && !pro.isEmpty()){
            for(Product2 p : pro){
                productId.add(p.id);
            }
        }
        
        priceEntry = [Select id,UnitPrice,Pricebook2Id,Product2Id,NRC_Unit_Price__c,Type_of_Billing__c,VENDORPRICELISTTOFTR__c,UNITCOST__c,GPM__c,DISCOUNT_Price__c from PricebookEntry where Product2Id =: productId and Pricebook2Id =: opp.Pricebook2Id];
        System.debug('====priceEntry====='+priceEntry);
        for(PricebookEntry e : priceEntry) {
            System.debug('====e==='+e);
        }
        
        if(pro != null && !pro.isEmpty()){
            if(priceEntry != null && !priceEntry.isEmpty()) {
                for(Product2 p : pro){
                    for(PricebookEntry prcEntry : priceEntry){
                        System.debug('===prcEntry====='+prcEntry);
                        if(p.id == prcEntry.Product2Id){
                            if(mapOppQuantity != null && !mapOppQuantity.isEmpty() && mapOppQuantity.containsKey(p.id)){
                                p.Quantity__c = mapOppQuantity.get(p.id);
                                WrapperClass wrap = new WrapperClass(p,true,true,false,prcEntry,0,0);  
                                wrapList.add(wrap);
                            }else{
                                WrapperClass wrap = new WrapperClass(p,false,true,false,prcEntry,0,0); 
                                wrapList.add(wrap);
                            }
                            
                        }
                    }
                }
            }
        }
        system.debug('------wrapList------'+wrapList);
        return wrapList;
    }
    @auraEnabled 
    public static List<WrapperClass> smartVoiceBroadbandProd(String recordId,integer siteNumber){
        List<Product2> pro = new List<Product2>();
        PriceBookId__c pricebook = new PriceBookId__c();
        List<PricebookEntry> priceEntry = new List<PricebookEntry>();
        Set<Id> productId = new Set<Id>();
        Opportunity opp = new Opportunity();
        List<Product2> productTolllist = new List<Product2>();
        List<OpportunityLineItem> oppItemlst = new List<OpportunityLineItem>();
        Map<String,String> mapOppQuantity  = new Map<String,String>();
        list<WrapperClass> wrapList = new list<WrapperClass>();
        if(recordId != null){
            opp = [select id,Pricebook2Id,Contract_Term_Years__c from Opportunity where id =: recordId limit 1];
        }
        System.debug('==ids=='+recordId);
        String year = '';
        if(opp != null && opp.Contract_Term_Years__c != null){
            year = String.valueOf(opp.Contract_Term_Years__c);
        }
        if(opp.id != null && siteNumber != null){
            oppItemlst = [Select id,Site__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC_Price__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c from OpportunityLineItem where OpportunityId =: opp.id and Site_Number__c =: siteNumber and Filter_Product__c =: 'Parent' and Equote_ext_ID__c != null];
        }
        if(oppItemlst != null && !oppItemlst.isEmpty()){
            for(OpportunityLineItem oppItem : oppItemlst){
                Integer Qty = Integer.valueOf(oppItem.Quantity);
                mapOppQuantity.put(oppItem.Product2Id,String.valueOf(Qty));
            }
        }
        
        pro = [select id,Family,Name,Equipment__c,Product_Subcategory__c,Year__c,Product_Type__c,is_show_on_ux__c,Description,ProductCode,IsActive,License_Order__c,Part_Number_of_Product__c,Child__c,Parent__c,Show_in_PDF__c,Item_Code__c,S_E_LOOP__c,S_E_PORT__c from Product2 where (IsActive =: true AND is_show_on_ux__c =: true) AND (Product_Subcategory__c =:'Broadband' AND Family =: 'Smart Voice') AND Product_Type__c =: 'Smart Voice' AND (Year__c =: year OR Year__c =: 'All')];
        
        System.debug('-------pro------'+pro);
        if(pro != null && !pro.isEmpty()){
            for(Product2 p : pro){
                productId.add(p.id);
            }
        }
        
        priceEntry = [Select id,UnitPrice,Pricebook2Id,Product2Id,NRC_Unit_Price__c,Type_of_Billing__c,VENDORPRICELISTTOFTR__c,UNITCOST__c,GPM__c,DISCOUNT_Price__c from PricebookEntry where Product2Id =: productId and Pricebook2Id =: opp.Pricebook2Id];
        System.debug('====priceEntry====='+priceEntry);
        for(PricebookEntry e : priceEntry) {
            System.debug('====e==='+e);
        }
        
        if(pro != null && !pro.isEmpty()){
            if(priceEntry != null && !priceEntry.isEmpty()) {
                for(Product2 p : pro){
                    for(PricebookEntry prcEntry : priceEntry){
                        System.debug('===prcEntry====='+prcEntry);
                        if(p.id == prcEntry.Product2Id){
                            if(mapOppQuantity != null && !mapOppQuantity.isEmpty() && mapOppQuantity.containsKey(p.id)){
                                p.Quantity__c = mapOppQuantity.get(p.id);
                                WrapperClass wrap = new WrapperClass(p,true,true,false,prcEntry,0,0);  
                                wrapList.add(wrap);
                            }else{
                                WrapperClass wrap = new WrapperClass(p,false,true,false,prcEntry,0,0); 
                                wrapList.add(wrap);
                            }
                            
                        }
                    }
                }
            }
        }
        system.debug('------wrapList------'+wrapList);
        return wrapList;
    }
    
    @auraEnabled 
    public static List<WrapperClass> smartVoiceRepairProd(String recordId,integer siteNumber){
        List<Product2> pro = new List<Product2>();
        PriceBookId__c pricebook = new PriceBookId__c();
        List<PricebookEntry> priceEntry = new List<PricebookEntry>();
        Set<Id> productId = new Set<Id>();
        Opportunity opp = new Opportunity();
        List<Product2> productTolllist = new List<Product2>();
        List<OpportunityLineItem> oppItemlst = new List<OpportunityLineItem>();
        Map<String,String> mapOppQuantity  = new Map<String,String>();
        list<WrapperClass> wrapList = new list<WrapperClass>();
        if(recordId != null){
            opp = [select id,Pricebook2Id,Contract_Term_Years__c from Opportunity where id =: recordId limit 1];
        }
        System.debug('==ids=='+recordId);
        String year = '';
        if(opp != null && opp.Contract_Term_Years__c != null){
            year = String.valueOf(opp.Contract_Term_Years__c);
        }
        if(opp.id != null && siteNumber != null){
            oppItemlst = [Select id,Site__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC_Price__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c from OpportunityLineItem where OpportunityId =: opp.id and Site_Number__c =: siteNumber and Filter_Product__c =: 'Parent' and Equote_ext_ID__c != null];
        }
        if(oppItemlst != null && !oppItemlst.isEmpty()){
            for(OpportunityLineItem oppItem : oppItemlst){
                Integer Qty = Integer.valueOf(oppItem.Quantity);
                mapOppQuantity.put(oppItem.Product2Id,String.valueOf(Qty));
            }
        }
        
        pro = [select id,Family,Name,Equipment__c,Product_Subcategory__c,Year__c,Product_Type__c,is_show_on_ux__c,Description,ProductCode,IsActive,License_Order__c,Part_Number_of_Product__c,Child__c,Parent__c,Show_in_PDF__c,Item_Code__c,S_E_LOOP__c,S_E_PORT__c from Product2 where IsActive =: true AND (Product_Subcategory__c =:'Repair' AND Family =: 'Smart Voice')AND (Product_Type__c =: 'Smart Voice'  AND is_show_on_ux__c =: true AND Parent__c =:true) and (Year__c =: year OR Year__c =: 'All') ORDER BY License_Order__c ];
        
        System.debug('-------pro------'+pro);
        if(pro != null && !pro.isEmpty()){
            for(Product2 p : pro){
                productId.add(p.id);
            }
        }
        
        priceEntry = [Select id,UnitPrice,Pricebook2Id,Product2Id,NRC_Unit_Price__c,Type_of_Billing__c,VENDORPRICELISTTOFTR__c,UNITCOST__c,GPM__c,DISCOUNT_Price__c from PricebookEntry where Product2Id =: productId and Pricebook2Id =: opp.Pricebook2Id];
        System.debug('====priceEntry====='+priceEntry);
        for(PricebookEntry e : priceEntry) {
            System.debug('====e==='+e);
        }
        
        if(pro != null && !pro.isEmpty()){
            if(priceEntry != null && !priceEntry.isEmpty()) {
                for(Product2 p : pro){
                    for(PricebookEntry prcEntry : priceEntry){
                        System.debug('===prcEntry====='+prcEntry);
                        if(p.id == prcEntry.Product2Id){
                            if(mapOppQuantity != null && !mapOppQuantity.isEmpty() && mapOppQuantity.containsKey(p.id)){
                                p.Quantity__c = mapOppQuantity.get(p.id);
                                WrapperClass wrap = new WrapperClass(p,true,true,false,prcEntry,0,0);  
                                wrapList.add(wrap);
                            }else{
                                WrapperClass wrap = new WrapperClass(p,false,true,false,prcEntry,0,0); 
                                wrapList.add(wrap);
                            }
                            
                        }
                    }
                }
            }
        }
        system.debug('------wrapList------'+wrapList);
        return wrapList;
    }
    
    @auraEnabled 
    public static List<WrapperClass> smartVoiceFIOSProd(String recordId,integer siteNumber){
        List<Product2> pro = new List<Product2>();
        PriceBookId__c pricebook = new PriceBookId__c();
        List<PricebookEntry> priceEntry = new List<PricebookEntry>();
        Set<Id> productId = new Set<Id>();
        Opportunity opp = new Opportunity();
        List<Product2> productTolllist = new List<Product2>();
        List<OpportunityLineItem> oppItemlst = new List<OpportunityLineItem>();
        Map<String,String> mapOppQuantity  = new Map<String,String>();
        list<WrapperClass> wrapList = new list<WrapperClass>();
        if(recordId != null){
            opp = [select id,Pricebook2Id,Contract_Term_Years__c from Opportunity where id =: recordId limit 1];
        }
        System.debug('==ids=='+recordId);
        String year = '';
        if(opp != null && opp.Contract_Term_Years__c != null){
            year = String.valueOf(opp.Contract_Term_Years__c);
        }
        if(opp.id != null && siteNumber != null){
            oppItemlst = [Select id,Site__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC_Price__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c from OpportunityLineItem where OpportunityId =: opp.id and Site_Number__c =: siteNumber and Filter_Product__c =: 'Parent' and Equote_ext_ID__c != null];
        }
        if(oppItemlst != null && !oppItemlst.isEmpty()){
            for(OpportunityLineItem oppItem : oppItemlst){
                Integer Qty = Integer.valueOf(oppItem.Quantity);
                mapOppQuantity.put(oppItem.Product2Id,String.valueOf(Qty));
            }
        }
        
        pro = [select id,Family,Name,Equipment__c,Product_Subcategory__c,Year__c,Product_Type__c,is_show_on_ux__c,Description,ProductCode,IsActive,License_Order__c,Part_Number_of_Product__c,Child__c,Parent__c,Show_in_PDF__c,Item_Code__c,S_E_LOOP__c,S_E_PORT__c from Product2 where IsActive =: true AND (Product_Subcategory__c =:'FIOS' AND Family =: 'Smart Voice')AND (Product_Type__c =: 'Smart Voice'  AND is_show_on_ux__c =: true AND Parent__c =:true) and (Year__c =: year OR Year__c =: 'All') ORDER BY License_Order__c ];
        
        System.debug('-------pro------'+pro);
        if(pro != null && !pro.isEmpty()){
            for(Product2 p : pro){
                productId.add(p.id);
            }
        }
        
        priceEntry = [Select id,UnitPrice,Pricebook2Id,Product2Id,NRC_Unit_Price__c,Type_of_Billing__c,VENDORPRICELISTTOFTR__c,UNITCOST__c,GPM__c,DISCOUNT_Price__c from PricebookEntry where Product2Id =: productId and Pricebook2Id =: opp.Pricebook2Id];
        System.debug('====priceEntry====='+priceEntry);
        for(PricebookEntry e : priceEntry) {
            System.debug('====e==='+e);
        }
        
        if(pro != null && !pro.isEmpty()){
            if(priceEntry != null && !priceEntry.isEmpty()) {
                for(Product2 p : pro){
                    for(PricebookEntry prcEntry : priceEntry){
                        System.debug('===prcEntry====='+prcEntry);
                        if(p.id == prcEntry.Product2Id){
                            if(mapOppQuantity != null && !mapOppQuantity.isEmpty() && mapOppQuantity.containsKey(p.id)){
                                p.Quantity__c = mapOppQuantity.get(p.id);
                                WrapperClass wrap = new WrapperClass(p,true,true,false,prcEntry,0,0);  
                                wrapList.add(wrap);
                            }else{
                                WrapperClass wrap = new WrapperClass(p,false,true,false,prcEntry,0,0); 
                                wrapList.add(wrap);
                            }
                            
                        }
                    }
                }
            }
        }
        system.debug('------wrapList------'+wrapList);
        return wrapList;
    }
    
    @auraEnabled 
    public static List<WrapperClass> smartVoiceFiberProd(String recordId,integer siteNumber){
        List<Product2> pro = new List<Product2>();
        PriceBookId__c pricebook = new PriceBookId__c();
        List<PricebookEntry> priceEntry = new List<PricebookEntry>();
        Set<Id> productId = new Set<Id>();
        Opportunity opp = new Opportunity();
        List<Product2> productTolllist = new List<Product2>();
        List<OpportunityLineItem> oppItemlst = new List<OpportunityLineItem>();
        Map<String,String> mapOppQuantity  = new Map<String,String>();
        list<WrapperClass> wrapList = new list<WrapperClass>();
        if(recordId != null){
            opp = [select id,Pricebook2Id,Contract_Term_Years__c from Opportunity where id =: recordId limit 1];
        }
        System.debug('==ids=='+recordId);
        String year = '';
        if(opp != null && opp.Contract_Term_Years__c != null){
            year = String.valueOf(opp.Contract_Term_Years__c);
        }
        if(opp.id != null && siteNumber != null){
            oppItemlst = [Select id,Site__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC_Price__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c from OpportunityLineItem where OpportunityId =: opp.id and Site_Number__c =: siteNumber and Filter_Product__c =: 'Parent' and Equote_ext_ID__c != null];
        }
        if(oppItemlst != null && !oppItemlst.isEmpty()){
            for(OpportunityLineItem oppItem : oppItemlst){
                Integer Qty = Integer.valueOf(oppItem.Quantity);
                mapOppQuantity.put(oppItem.Product2Id,String.valueOf(Qty));
            }
        }
        
        pro = [select id,Family,Name,Equipment__c,Product_Subcategory__c,Year__c,Product_Type__c,is_show_on_ux__c,Description,ProductCode,IsActive,License_Order__c,Part_Number_of_Product__c,Child__c,Parent__c,Show_in_PDF__c,Item_Code__c,S_E_LOOP__c,S_E_PORT__c from Product2 where IsActive =: true AND (Product_Subcategory__c =:'Fiber' AND Family =: 'Smart Voice')AND (Product_Type__c =: 'Smart Voice'  AND is_show_on_ux__c =: true AND Parent__c =:true) and (Year__c =: year OR Year__c =: 'All') ORDER BY License_Order__c ];
        
        System.debug('-------pro------'+pro);
        if(pro != null && !pro.isEmpty()){
            for(Product2 p : pro){
                productId.add(p.id);
            }
        }
        
        priceEntry = [Select id,UnitPrice,Pricebook2Id,Product2Id,NRC_Unit_Price__c,Type_of_Billing__c,VENDORPRICELISTTOFTR__c,UNITCOST__c,GPM__c,DISCOUNT_Price__c from PricebookEntry where Product2Id =: productId and Pricebook2Id =: opp.Pricebook2Id];
        System.debug('====priceEntry====='+priceEntry);
        for(PricebookEntry e : priceEntry) {
            System.debug('====e==='+e);
        }
        
        if(pro != null && !pro.isEmpty()){
            if(priceEntry != null && !priceEntry.isEmpty()) {
                for(Product2 p : pro){
                    for(PricebookEntry prcEntry : priceEntry){
                        System.debug('===prcEntry====='+prcEntry);
                        if(p.id == prcEntry.Product2Id){
                            if(mapOppQuantity != null && !mapOppQuantity.isEmpty() && mapOppQuantity.containsKey(p.id)){
                                p.Quantity__c = mapOppQuantity.get(p.id);
                                WrapperClass wrap = new WrapperClass(p,true,true,false,prcEntry,0,0);  
                                wrapList.add(wrap);
                            }else{
                                WrapperClass wrap = new WrapperClass(p,false,true,false,prcEntry,0,0); 
                                wrapList.add(wrap);
                            }
                            
                        }
                    }
                }
            }
        }
        system.debug('------wrapList------'+wrapList);
        return wrapList;
    }
    
    
    @auraEnabled 
    public static List<WrapperClass> smartVoiceBHSIProd(String recordId,integer siteNumber){
        List<Product2> pro = new List<Product2>();
        PriceBookId__c pricebook = new PriceBookId__c();
        List<PricebookEntry> priceEntry = new List<PricebookEntry>();
        Set<Id> productId = new Set<Id>();
        Opportunity opp = new Opportunity();
        List<Product2> productTolllist = new List<Product2>();
        List<OpportunityLineItem> oppItemlst = new List<OpportunityLineItem>();
        Map<String,String> mapOppQuantity  = new Map<String,String>();
        list<WrapperClass> wrapList = new list<WrapperClass>();
        if(recordId != null){
            opp = [select id,Pricebook2Id,Contract_Term_Years__c from Opportunity where id =: recordId limit 1];
        }
        System.debug('==ids=='+recordId);
        String year = '';
        if(opp != null && opp.Contract_Term_Years__c != null){
            year = String.valueOf(opp.Contract_Term_Years__c);
        }
        if(opp.id != null && siteNumber != null){
            oppItemlst = [Select id,Site__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC_Price__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c from OpportunityLineItem where OpportunityId =: opp.id and Site_Number__c =: siteNumber and Filter_Product__c =: 'Parent' and Equote_ext_ID__c != null];
        }
        if(oppItemlst != null && !oppItemlst.isEmpty()){
            for(OpportunityLineItem oppItem : oppItemlst){
                Integer Qty = Integer.valueOf(oppItem.Quantity);
                mapOppQuantity.put(oppItem.Product2Id,String.valueOf(Qty));
            }
        }
        
        pro = [select id,Family,Name,Equipment__c,Product_Subcategory__c,Year__c,Product_Type__c,is_show_on_ux__c,Description,ProductCode,IsActive,License_Order__c,Part_Number_of_Product__c,Child__c,Parent__c,Show_in_PDF__c,Item_Code__c,S_E_LOOP__c,S_E_PORT__c from Product2 where IsActive =: true AND (Product_Subcategory__c =:'BHSI' AND Family =: 'Smart Voice')AND (Product_Type__c =: 'Smart Voice'  AND is_show_on_ux__c =: true AND Parent__c =:true) and (Year__c =: year OR Year__c =: 'All') ORDER BY License_Order__c ];
        
        System.debug('-------pro------'+pro);
        if(pro != null && !pro.isEmpty()){
            for(Product2 p : pro){
                productId.add(p.id);
            }
        }
        
        priceEntry = [Select id,UnitPrice,Pricebook2Id,Product2Id,NRC_Unit_Price__c,Type_of_Billing__c,VENDORPRICELISTTOFTR__c,UNITCOST__c,GPM__c,DISCOUNT_Price__c from PricebookEntry where Product2Id =: productId and Pricebook2Id =: opp.Pricebook2Id];
        System.debug('====priceEntry====='+priceEntry);
        for(PricebookEntry e : priceEntry) {
            System.debug('====e==='+e);
        }
        
        if(pro != null && !pro.isEmpty()){
            if(priceEntry != null && !priceEntry.isEmpty()) {
                for(Product2 p : pro){
                    for(PricebookEntry prcEntry : priceEntry){
                        System.debug('===prcEntry====='+prcEntry);
                        if(p.id == prcEntry.Product2Id){
                            if(mapOppQuantity != null && !mapOppQuantity.isEmpty() && mapOppQuantity.containsKey(p.id)){
                                p.Quantity__c = mapOppQuantity.get(p.id);
                                WrapperClass wrap = new WrapperClass(p,true,true,false,prcEntry,0,0);  
                                wrapList.add(wrap);
                            }else{
                                WrapperClass wrap = new WrapperClass(p,false,true,false,prcEntry,0,0); 
                                wrapList.add(wrap);
                            }
                            
                        }
                    }
                }
            }
        }
        system.debug('------wrapList------'+wrapList);
        return wrapList;
    }
    
    
    @auraEnabled 
    public static List<WrapperClass> smartVoiceAsymetricFiberProd(String recordId,integer siteNumber){
        List<Product2> pro = new List<Product2>();
        PriceBookId__c pricebook = new PriceBookId__c();
        List<PricebookEntry> priceEntry = new List<PricebookEntry>();
        Set<Id> productId = new Set<Id>();
        Opportunity opp = new Opportunity();
        List<Product2> productTolllist = new List<Product2>();
        List<OpportunityLineItem> oppItemlst = new List<OpportunityLineItem>();
        Map<String,String> mapOppQuantity  = new Map<String,String>();
        list<WrapperClass> wrapList = new list<WrapperClass>();
        if(recordId != null){
            opp = [select id,Pricebook2Id,Contract_Term_Years__c from Opportunity where id =: recordId limit 1];
        }
        System.debug('==ids=='+recordId);
        String year = '';
        if(opp != null && opp.Contract_Term_Years__c != null){
            year = String.valueOf(opp.Contract_Term_Years__c);
        }
        if(opp.id != null && siteNumber != null){
            oppItemlst = [Select id,Site__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC_Price__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c from OpportunityLineItem where OpportunityId =: opp.id and Site_Number__c =: siteNumber and Filter_Product__c =: 'Parent' and Equote_ext_ID__c != null];
        }
        if(oppItemlst != null && !oppItemlst.isEmpty()){
            for(OpportunityLineItem oppItem : oppItemlst){
                Integer Qty = Integer.valueOf(oppItem.Quantity);
                mapOppQuantity.put(oppItem.Product2Id,String.valueOf(Qty));
            }
        }
        
        pro = [select id,Family,Name,Equipment__c,Product_Subcategory__c,Year__c,Product_Type__c,is_show_on_ux__c,Description,ProductCode,IsActive,License_Order__c,Part_Number_of_Product__c,Child__c,Parent__c,Show_in_PDF__c,Item_Code__c,S_E_LOOP__c,S_E_PORT__c from Product2 where IsActive =: true AND (Product_Subcategory__c =:'Asymetric Fiber' AND Family =: 'Smart Voice')AND (Product_Type__c =: 'Smart Voice'  AND is_show_on_ux__c =: true AND Parent__c =:true) and (Year__c =: year OR Year__c =: 'All') ORDER BY License_Order__c ];
        
        System.debug('-------pro------'+pro);
        if(pro != null && !pro.isEmpty()){
            for(Product2 p : pro){
                productId.add(p.id);
            }
        }
        
        priceEntry = [Select id,UnitPrice,Pricebook2Id,Product2Id,NRC_Unit_Price__c,Type_of_Billing__c,VENDORPRICELISTTOFTR__c,UNITCOST__c,GPM__c,DISCOUNT_Price__c from PricebookEntry where Product2Id =: productId and Pricebook2Id =: opp.Pricebook2Id];
        System.debug('====priceEntry====='+priceEntry);
        for(PricebookEntry e : priceEntry) {
            System.debug('====e==='+e);
        }
        
        if(pro != null && !pro.isEmpty()){
            if(priceEntry != null && !priceEntry.isEmpty()) {
                for(Product2 p : pro){
                    for(PricebookEntry prcEntry : priceEntry){
                        System.debug('===prcEntry====='+prcEntry);
                        if(p.id == prcEntry.Product2Id){
                            if(mapOppQuantity != null && !mapOppQuantity.isEmpty() && mapOppQuantity.containsKey(p.id)){
                                p.Quantity__c = mapOppQuantity.get(p.id);
                                WrapperClass wrap = new WrapperClass(p,true,true,false,prcEntry,0,0);  
                                wrapList.add(wrap);
                            }else{
                                WrapperClass wrap = new WrapperClass(p,false,true,false,prcEntry,0,0); 
                                wrapList.add(wrap);
                            }
                            
                        }
                    }
                }
            }
        }
        system.debug('------wrapList------'+wrapList);
        return wrapList;
    }
    
    @auraEnabled 
    public static List<WrapperClass> smartVoiceEquipmentProd(String recordId,integer siteNumber){
        List<Product2> pro = new List<Product2>();
        PriceBookId__c pricebook = new PriceBookId__c();
        List<PricebookEntry> priceEntry = new List<PricebookEntry>();
        Set<Id> productId = new Set<Id>();
        Opportunity opp = new Opportunity();
        List<Product2> productTolllist = new List<Product2>();
        List<OpportunityLineItem> oppItemlst = new List<OpportunityLineItem>();
        Map<String,String> mapOppQuantity  = new Map<String,String>();
        list<WrapperClass> wrapList = new list<WrapperClass>();
        if(recordId != null){
            opp = [select id,Pricebook2Id,Contract_Term_Years__c from Opportunity where id =: recordId limit 1];
        }
        System.debug('==ids=='+recordId);
        String year = '';
        if(opp != null && opp.Contract_Term_Years__c != null){
            year = String.valueOf(opp.Contract_Term_Years__c);
        }
        if(opp.id != null && siteNumber != null){
            oppItemlst = [Select id,Site__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC_Price__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c from OpportunityLineItem where OpportunityId =: opp.id and Site_Number__c =: siteNumber and Filter_Product__c =: 'Parent' and Equote_ext_ID__c != null];
        }
        if(oppItemlst != null && !oppItemlst.isEmpty()){
            for(OpportunityLineItem oppItem : oppItemlst){
                Integer Qty = Integer.valueOf(oppItem.Quantity);
                mapOppQuantity.put(oppItem.Product2Id,String.valueOf(Qty));
            }
        }
        
        pro = [select id,Family,Name,Equipment__c,Product_Subcategory__c,Year__c,Product_Type__c,is_show_on_ux__c,Description,ProductCode,IsActive,License_Order__c,Part_Number_of_Product__c,Child__c,Parent__c,Show_in_PDF__c,Item_Code__c,S_E_LOOP__c,S_E_PORT__c from Product2 where IsActive =: true AND (Product_Subcategory__c =:'Equipment' AND Family =: 'Smart Voice')AND (Product_Type__c =: 'Smart Voice'  AND is_show_on_ux__c =: true AND Parent__c =:true) and (Year__c =: year OR Year__c =: 'All') ORDER BY License_Order__c ];
        
        System.debug('-------pro------'+pro);
        if(pro != null && !pro.isEmpty()){
            for(Product2 p : pro){
                productId.add(p.id);
            }
        }
        
        priceEntry = [Select id,UnitPrice,Pricebook2Id,Product2Id,NRC_Unit_Price__c,Type_of_Billing__c,VENDORPRICELISTTOFTR__c,UNITCOST__c,GPM__c,DISCOUNT_Price__c from PricebookEntry where Product2Id =: productId and Pricebook2Id =: opp.Pricebook2Id];
        System.debug('====priceEntry====='+priceEntry);
        for(PricebookEntry e : priceEntry) {
            System.debug('====e==='+e);
        }
        
        if(pro != null && !pro.isEmpty()){
            if(priceEntry != null && !priceEntry.isEmpty()) {
                for(Product2 p : pro){
                    for(PricebookEntry prcEntry : priceEntry){
                        System.debug('===prcEntry====='+prcEntry);
                        if(p.id == prcEntry.Product2Id){
                            if(mapOppQuantity != null && !mapOppQuantity.isEmpty() && mapOppQuantity.containsKey(p.id)){
                                p.Quantity__c = mapOppQuantity.get(p.id);
                                WrapperClass wrap = new WrapperClass(p,true,true,false,prcEntry,0,0);  
                                wrapList.add(wrap);
                            }else{
                                WrapperClass wrap = new WrapperClass(p,false,true,false,prcEntry,0,0); 
                                wrapList.add(wrap);
                            }
                            
                        }
                    }
                }
            }
        }
        system.debug('------wrapList------'+wrapList);
        return wrapList;
    }
    
    
        
    @auraEnabled 
    public static List<WrapperClass> smartVoiceTelecommProd(String recordId,integer siteNumber){
        List<Product2> pro = new List<Product2>();
        PriceBookId__c pricebook = new PriceBookId__c();
        List<PricebookEntry> priceEntry = new List<PricebookEntry>();
        Set<Id> productId = new Set<Id>();
        Opportunity opp = new Opportunity();
        List<OpportunityLineItem> oppItemlst = new List<OpportunityLineItem>();
        Map<String,String> mapOppQuantity  = new Map<String,String>();
        list<WrapperClass> wrapList = new list<WrapperClass>();
        if(recordId != null){
            opp = [select id,Pricebook2Id,Contract_Term_Years__c from Opportunity where id =: recordId limit 1];
        }
        System.debug('==ids=='+recordId);
        String year = '';
        if(opp != null && opp.Contract_Term_Years__c != null){
            year = String.valueOf(opp.Contract_Term_Years__c);
        }
        if(opp.id != null && siteNumber != null){
            oppItemlst = [Select id,Site__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC_Price__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c from OpportunityLineItem where OpportunityId =: opp.id and Site_Number__c =: siteNumber and Filter_Product__c =: 'Parent' and Equote_ext_ID__c != null];
        }
        if(oppItemlst != null && !oppItemlst.isEmpty()){
            for(OpportunityLineItem oppItem : oppItemlst){
                Integer Qty = Integer.valueOf(oppItem.Quantity);
                mapOppQuantity.put(oppItem.Product2Id,String.valueOf(Qty));
            }
        }
        
        pro = [select id,Family,Name,Equipment__c,Product_Subcategory__c,Year__c,Product_Type__c,is_show_on_ux__c,Description,ProductCode,IsActive,License_Order__c,Part_Number_of_Product__c,Child__c,Parent__c,Show_in_PDF__c,Item_Code__c,S_E_LOOP__c,S_E_PORT__c from Product2 where IsActive =: true AND (Product_Subcategory__c =:'Toll Free Bundle Minutes' AND Family =: 'Smart Voice')AND (Product_Type__c =: 'Smart Voice'  AND is_show_on_ux__c =: true AND Parent__c =:true) and (Year__c =: year OR Year__c =: 'All') ORDER BY License_Order__c ];
        
        System.debug('-------pro------'+pro);
        if(pro != null && !pro.isEmpty()){
            for(Product2 p : pro){
                productId.add(p.id);
            }
        }
        
        priceEntry = [Select id,UnitPrice,Pricebook2Id,Product2Id,NRC_Unit_Price__c,Type_of_Billing__c,VENDORPRICELISTTOFTR__c,UNITCOST__c,GPM__c,DISCOUNT_Price__c from PricebookEntry where Product2Id =: productId and Pricebook2Id =: opp.Pricebook2Id];
        System.debug('====priceEntry====='+priceEntry);
        for(PricebookEntry e : priceEntry) {
            System.debug('====e==='+e);
        }
        
        if(pro != null && !pro.isEmpty()){
            if(priceEntry != null && !priceEntry.isEmpty()) {
                for(Product2 p : pro){
                    for(PricebookEntry prcEntry : priceEntry){
                        System.debug('===prcEntry====='+prcEntry);
                        if(p.id == prcEntry.Product2Id){
                            if(mapOppQuantity != null && !mapOppQuantity.isEmpty() && mapOppQuantity.containsKey(p.id)){
                                p.Quantity__c = mapOppQuantity.get(p.id);
                                WrapperClass wrap = new WrapperClass(p,true,true,false,prcEntry,0,0);  
                                wrapList.add(wrap);
                            }else{
                                WrapperClass wrap = new WrapperClass(p,false,true,false,prcEntry,0,0); 
                                wrapList.add(wrap);
                            }
                            
                        }
                    }
                }
            }
        }
        system.debug('------wrapList------'+wrapList);
        return wrapList;
    }
    
    @auraEnabled 
    public static List<Custom_Product__c> getCustomProdList(String recordId,integer siteNumber){
        List<Custom_Product__c> customList = new  List<Custom_Product__c>();
        customList = [select id,ProductName__c,Type_of_billing__c,MrcPrice__c,NumberOfSites__c,Quantity__c,Total__c,Opportunity__c,Custom_Product_Identity__c from Custom_Product__c where Opportunity__c =: recordId AND NumberOfSites__c =: siteNumber];
        return customList;
    }
    
    public class WrapperClass{
        @AuraEnabled public  Product2 product {get;set;}
        @AuraEnabled public boolean boolval {get;set;}
        @AuraEnabled public boolean boolval2 {get;set;}
        @AuraEnabled public boolean boolval3 {get;set;}
        @AuraEnabled public PricebookEntry pricebookEntry {get;set;}
        @AuraEnabled public Decimal Total {get;set;}
        @AuraEnabled public Decimal NRCTotal {get;set;}
        //  @AuraEnabled public OpportunityLineItem oppItem {get;set;}
        public WrapperClass(){
        }
        
        public WrapperClass(Product2 product,boolean boolval,boolean boolval2,boolean boolval3, PricebookEntry pricebookEntry, Decimal Total,Decimal NRCTotal) {
            this.product = product;
            this.boolval = boolval;
            this.boolval2 = boolval2;
            this.boolval3 = boolval3;
            this.pricebookEntry = pricebookEntry;
            this.Total = Total;
            this.NRCTotal = NRCTotal;
            //  this.oppItem = oppItem;
        }
    } 
    
}