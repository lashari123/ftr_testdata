public class SetupProduct{
    public static void setup(List<OpportunityLineItem> lineitemlist){
        List<OpportunityLineItem> linesetuplist = new List<OpportunityLineItem>();
        if(lineitemlist != null && !lineitemlist.isEmpty()){
            Opportunity opp = new Opportunity();
            Set<Id>parentId = new Set<Id>();
            Set<Id>childId = new Set<Id>();
            Set<Id>setId = new Set<Id>();
            List<Product2> prodlst = new List<Product2>();
            List<Product_Linkage__c> linkagelist = new List<Product_Linkage__c>();
            List<PricebookEntry> priceEntry = new List<PricebookEntry>();
            List<Wrapperclass> wraperlst = new List<Wrapperclass>();
            
            Map<String,Wrapperclass> MapOfWrapper = new Map<String,Wrapperclass>();
            if(lineitemlist.size()> 0 && lineitemlist[0].OpportunityId != null){
                opp = [Select id,Contact__c,Pricebook2Id,Contract_Term_Years__c,accountId,OwnerId,Company_size__c,Total_NRC__c,Total_Contract_MRR__c,MRC__c from Opportunity where id =: lineitemlist[0].OpportunityId limit 1];
            }
            if(opp.Contract_Term_Years__c != null && opp.Contract_Term_Years__c < 2){
                for(OpportunityLineItem item : lineitemlist){
                    parentId.add(item.Product2Id); 
                }
                if(ParentId.size() > 0 && ParentId != null && !ParentId.isEmpty()){
                    linkagelist = [Select id,Product_Name__c,Product_Name_Setup__c from Product_Linkage__c where Product_Name__c!=null and Product_Name__c =: ParentId];
                }
                if(linkagelist.size() > 0 && linkagelist != null && !linkagelist.isEmpty()){
                    for(Product_Linkage__c linkage : linkagelist){
                        if(linkage.Product_Name_Setup__c != null){
                            childId.add(linkage.Product_Name_Setup__c);
                        }
                    }
                }
                if(childId.size() > 0 && childId != null && !childId.isEmpty()){
                    prodlst  = [select id,Name,Family,Description,Term__c,Equipment__c,IsActive,Product_Type__c,Product_Subcategory__c,Part_Number__c,Type_of_Billing__c,Year__c,License_Order__c,Part_Number_of_Product__c,Show_in_PDF__c,isAdditionalDID__c,isCallerId__c,isAdditionalDirectory__c,isExtendedMarket__c,isAdditionalManaged__c,isBusinessAnalytic__c,isE911__c,PremiumRule__c,PremiumPlusRule__c,isConferenceRumSeatRule__c,isAnalogRule__c,isElite__c,isEssential__c,isOutbound__c,isPremier__c,isTollFreeNum__c,isWebFax__c,isPolycomATA__c,isTechInstallFeeBHSI__c,isTechInstallFeeFiber__c,isTechInstallFeeFIOS__c from Product2 where id =:childId and (IsActive =: TRUE and Child__c =: TRUE) ORDER BY License_Order__c ];
                }
                if(prodlst.size() > 0 &&  prodlst != null && !prodlst.isEmpty()){
                    for(Product2 p: prodlst) {
                        setId.add(p.id);
                    }
                }
                if(setId.size() > 0 &&  setId != null && !setId.isEmpty()){
                    priceEntry = [Select id,UnitPrice,Pricebook2Id,Type_of_Billing__c,Product2Id,VENDORPRICELISTTOFTR__c,UNITCOST__c,GPM__c,DISCOUNT_Price__c from PricebookEntry where Product2Id =: setId and Pricebook2Id =: opp.Pricebook2Id and IsActive =: true];
                }
                if(prodlst.size() > 0 && prodlst != null && !prodlst.isEmpty()){
                    if(priceEntry != null && !priceEntry.isEmpty()){
                        for(Product2 prod : prodlst){
                            for(PricebookEntry entry : priceEntry){
                                if(prod.id == entry.Product2Id){
                                    Wrapperclass w = new Wrapperclass(prod,entry);
                                    wraperlst.add(w);
                                }
                            }
                        }
                    }
                }
                if(wraperlst != null && !wraperlst.isEmpty()){
                    if(linkagelist != null && !linkagelist.isEmpty()){
                        for(Wrapperclass wrap : wraperlst){
                            for(Product_Linkage__c linkage : linkagelist){
                                if(linkage.Product_Name_Setup__c == wrap.product.id){
                                    MapOfWrapper.put(linkage.Product_Name__c,wrap);
                                }
                            }
                        }
                    }
                }
                if(MapOfWrapper != null && !MapOfWrapper.isEmpty()){
                    // Integer count1 = 0;
                    for(OpportunityLineItem item : lineitemlist){
                        if(MapOfWrapper.containsKey(item.Product2Id)){
                            Wrapperclass wrapval = MapOfWrapper.get(item.Product2Id);
                            
                            if(wrapval != null){
                                //   count1++;
                                OpportunityLineItem oppLineProdhard = new OpportunityLineItem();
                                oppLineProdhard.Product2Id = wrapval.product.Id;
                                oppLineProdhard.Product_Name__c = wrapval.product.Name;
                                oppLineProdhard.Category__c = wrapval.product.Family;
                                oppLineProdhard.Site_Number__c = item.Site_Number__c;
                                oppLineProdhard.Site__c = item.Site__c;
                                oppLineProdhard.Equipment__c = wrapval.product.Equipment__c;
                                oppLineProdhard.Term__c = wrapval.product.Term__c;
                                oppLineProdhard.Index__c = wrapval.product.License_Order__c;
                                oppLineProdhard.Sub_Category__c = wrapval.product.Product_Subcategory__c;
                                oppLineProdhard.Type_of_Billing__c = wrapval.priceEntry.Type_of_Billing__c;
                                oppLineProdhard.Product_Type__c = wrapval.product.Product_Type__c;
                                oppLineProdhard.OpportunityId   = opp.id;
                                oppLineProdhard.Equote_ext_ID__c = opp.Id+''+item.Site__c+''+System.Now();
                                oppLineProdhard.PriceBook2Id__c = wrapval.priceEntry.Pricebook2Id;
                                oppLineProdhard.PricebookEntryId     = wrapval.priceEntry.id;
                                oppLineProdhard.Part_Number__c = wrapval.product.Part_Number_of_Product__c;
                                oppLineProdhard.Parent_ID__c = item.id;
                                oppLineProdhard.Parent_Product_Name__c = item.Product_Name__c;
                                oppLineProdhard.Quantity  = item.Quantity;
                                oppLineProdhard.SetUp__c = 'Setup';
                                oppLineProdhard.NRC__c = wrapval.priceEntry.UnitPrice;
                                oppLineProdhard.TotalPrice = wrapval.priceEntry.UnitPrice*oppLineProdhard.Quantity;
                                oppLineProdhard.Show_in_PDF__c = wrapval.product.Show_in_PDF__c;
                                oppLineProdhard.Filter_Product__c = 'Child';
                                oppLineProdhard.VENDOR_PRICE_LIST_TO_OFFER__c = wrapval.priceEntry.VENDORPRICELISTTOFTR__c;
                                oppLineProdhard.UNITCOST__c = wrapval.priceEntry.UNITCOST__c;
                                oppLineProdhard.GPM__c = wrapval.priceEntry.GPM__c;
                                oppLineProdhard.DISCOUNT__c = wrapval.priceEntry.DISCOUNT_Price__c;
                                oppLineProdhard.isE911__c = wrapval.product.isE911__c;
                                oppLineProdhard.isElite__c = wrapval.product.isElite__c;
                                oppLineProdhard.isEssential__c =  wrapval.product.isEssential__c;
                                oppLineProdhard.PremiumRule__c =  wrapval.product.PremiumRule__c;
                                 oppLineProdhard.PremiumPlusRule__c =  wrapval.product.PremiumPlusRule__c;
                                 oppLineProdhard.isConferenceRumSeatRule__c =  wrapval.product.isConferenceRumSeatRule__c;
                                 oppLineProdhard.isAnalogRule__c =  wrapval.product.isAnalogRule__c;
                                oppLineProdhard.isOutbound__c = wrapval.product.isOutbound__c;
                                oppLineProdhard.isPremier__c = wrapval.product.isPremier__c;
                                oppLineProdhard.isTollFreeNum__c = wrapval.product.isTollFreeNum__c;
                                oppLineProdhard.isWebFax__c = wrapval.product.isWebFax__c;
                                oppLineProdhard.isAdditionalDID__c = wrapval.product.isAdditionalDID__c;
                                oppLineProdhard.isCallerId__c =  wrapval.product.isCallerId__c;
                                oppLineProdhard.isAdditionalDirectory__c = wrapval.product.isAdditionalDirectory__c;
                                oppLineProdhard.isExtendedMarket__c = wrapval.product.isExtendedMarket__c;
                                oppLineProdhard.isAdditionalManaged__c = wrapval.product.isAdditionalManaged__c;
                                oppLineProdhard.isBusinessAnalytic__c = wrapval.product.isBusinessAnalytic__c;
                                oppLineProdhard.isPolycomATA__c = wrapval.product.isPolycomATA__c;
                                oppLineProdhard.isTechInstallFeeBHSI__c = wrapval.product.isTechInstallFeeBHSI__c;
                                oppLineProdhard.isTechInstallFeeFiber__c = wrapval.product.isTechInstallFeeFiber__c;
                                oppLineProdhard.isTechInstallFeeFIOS__c = wrapval.product.isTechInstallFeeFIOS__c;
                                linesetuplist.add(oppLineProdhard);
                            }
                        }
                    }
                } 
                try{
                    insert linesetuplist;
                }catch(Exception e){
                    
                }
            }
        }
        //return linesetuplist;
    }
    public static void updateParentQty(List<OpportunityLineItem> newlinelist,List<OpportunityLineItem> oldlinelist){
        List<Equipment__c> equipmentlst = new List<Equipment__c>();
        List<Equipment__c> updateEquipmentlst = new List<Equipment__c>();
        Map<String,decimal> MapOfQTY = new Map<String,decimal>();
        Set<Id> prodId = new Set<Id>();
        if(newlinelist != null && !newlinelist.isEmpty()){
            for(OpportunityLineItem item : newlinelist){
                if(item.Filter_Product__c == 'Parent'){
                    prodId.add(item.Product2Id);
                }
            }
            Id oppId = newlinelist[0].OpportunityId;
            
            if(prodId != null && !prodId.isEmpty() && oppId != null){
                equipmentlst = [select id,Equipment__c,Quantity__c,Product__c,Filter_Product__c,Part_Number__c,Unit_Price__c,Product_Name__c,OpportunityId__c,Total_Price__c  from Equipment__c where OpportunityId__c =: oppId and Product__c =: prodId];
            }
            if(oldlinelist != null && !oldlinelist.isEmpty()){
                for(OpportunityLineItem item : newlinelist){
                    for(OpportunityLineItem lineitem : oldlinelist) {
                        if(item.id == lineitem.id){
                            decimal qty = item.Quantity - lineitem.Quantity;
                            MapOfQTY.put(item.Product2Id,qty);
                        }
                    }
                }
            }
            if(equipmentlst != null && !equipmentlst.isEmpty()){
                for(Equipment__c equip : equipmentlst){
                    if(MapOfQTY != null && !MapOfQTY.isEmpty() && MapOfQTY.containsKey(equip.Product__c)){
                        decimal quanity =  MapOfQTY.get(equip.Product__c);
                        if(equip.Quantity__c != null && quanity != null){
                        equip.Quantity__c = equip.Quantity__c + quanity;
                        }
                        if(equip.Quantity__c != null && equip.Unit_Price__c != null){
                        equip.Total_Price__c = equip.Quantity__c * equip.Unit_Price__c;
                        }
                        updateEquipmentlst.add(equip);
                    }
                }
            }
            try{
                update updateEquipmentlst;
            }catch(Exception e){
                
            }
        }
        
        // *************Update 1st Year Maintenance Reserve Universal Product****************
        String Id = '';
        Decimal Sno = 0;
        String siteId = '';
        Decimal UnitCost = 0;
        Decimal Percentage1 = 0;
        Decimal margin = 0.3;
        Decimal Calculation = 1-margin; 
        Decimal UnitPrice = 0;
        Decimal rounded = 0;
        List<OpportunityLineItem> childLst = new List<OpportunityLineItem>();
        List<OpportunityLineItem> MaintanceChild = new List<OpportunityLineItem>();
        if(newlinelist != null && !newlinelist.isEmpty()){
            Id = newlinelist[0].OpportunityId;
            Sno = newlinelist[0].Site_Number__c;
            siteId = newlinelist[0].Site__c;
        }
        childLst = [Select id,Site__c,Equipment__c,Product_Name__c,Part_Number__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c,PoE__c,Parent_ID__c,UNITCOST__c,Maintenance_Universal__c  from OpportunityLineItem where Equote_ext_ID__c != null and Filter_Product__c  =: 'Child' and OpportunityId  =: Id and Site_Number__c =: Sno and Site__c =: siteId] ;
        if(childLst != null && !childLst.isEmpty()){
            for(OpportunityLineItem item : childLst){
                if(item.Maintenance_Universal__c == false){
                    if(item.Sub_Category__c == 'IP Phones' || item.Sub_Category__c == 'Switches and PoE' || item.Sub_Category__c == 'Accessories'){
                        if(item.UNITCOST__c != null && item.Quantity != null){
                            UnitCost = UnitCost + (item.UNITCOST__c * item.Quantity);
                        }
                    }
                }else{
                    MaintanceChild.add(item);
                }
            }
            Percentage1 = UnitCost * 0.03;
            rounded = Percentage1 / Calculation;
            UnitPrice = rounded.setScale(2, RoundingMode.HALF_UP);
        }
        if(MaintanceChild != null && !MaintanceChild.isEmpty()){
            for(OpportunityLineItem childItem : MaintanceChild){
                if(childItem.Type_of_Billing__c == 'MRC'){
                    childItem.Unit_Price__c = UnitPrice;
                    childItem.TotalPrice = childItem.Unit_Price__c * childItem.Quantity;
                }else{
                    childItem.NRC__c = UnitPrice;
                    childItem.TotalPrice = childItem.NRC__c * childItem.Quantity;
                }
            }
            try{
                update MaintanceChild; 
            }
            catch(Exception e){}
        }
    }
    public class Wrapperclass{
        public  Product2 product {get;set;}
        public  PricebookEntry priceEntry {get;set;}
        
        public Wrapperclass(){
            
        }
        public Wrapperclass(Product2 product,PricebookEntry priceEntry){
            this.product = product;
            this.priceEntry = priceEntry;
        }
    } 
    
    public static void afterDeleteFunctionality(List<OpportunityLineItem> lineProductlst){
        // **************Delete Child Products***************
        set<Id> ids = new set<Id>();
        List<OpportunityLineItem> oppLineItemList = new List<OpportunityLineItem>();
        if(lineProductlst != null && !lineProductlst.isEmpty()){
            for(OpportunityLineItem oppItem : lineProductlst){
                //  system.debug('=======ids========'+oppItem.Id +'=='+oppItem.Product_Name__c);
                ids.add(oppItem.id);
            }
        }
        if(ids != null && !ids.isEmpty()){
            oppLineItemList = [Select id,Site__c,Equipment__c,Product_Name__c,Part_Number__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c,PoE__c,Parent_ID__c  from OpportunityLineItem where  Equote_ext_ID__c !=null and Filter_Product__c  ='Child' and Parent_ID__c!=null and Parent_ID__c IN: ids] ;
        }
        if(oppLineItemList != null && !oppLineItemList.isEmpty()){
            try{
                delete oppLineItemList;  
            }
            catch(Exception e){ }
        }
        
        //**************Delete Parent Equipment**********************
        List<OpportunityLineItem> LineItemList = new List<OpportunityLineItem>();
        List<OpportunityLineItem>remainingList = new List<OpportunityLineItem>();
        List<Equipment__c> equipmentlst = new List<Equipment__c>();
        Map<String,OpportunityLineItem> mapOfproduct = new Map<String,OpportunityLineItem>();
        Set<String>ProdId = new Set<String>();
        Set<String>ProductId = new Set<String>();
        String oppId = '';
        if(lineProductlst != null && !lineProductlst.isEmpty()){
            oppId = lineProductlst[0].OpportunityId;
            for(OpportunityLineItem item : lineProductlst){
                ProdId.add(item.Product2Id);
                System.debug('====ProdId===='+ProdId);
            }
        }
        if(ProdId != null && !ProdId.isEmpty()){
            remainingList = [Select id,Site__c,Equipment__c,Product_Name__c,Part_Number__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c,PoE__c,Parent_ID__c  from OpportunityLineItem where  Equote_ext_ID__c !=null  and Product2Id =: ProdId and OpportunityId =: oppId] ;
        }
        if(remainingList != null && !remainingList.isEmpty()){
            for(OpportunityLineItem lineItem : remainingList){
                mapOfproduct.put(lineItem.Product2Id,lineItem);
            } 
        }
        if(ProdId != null && !ProdId.isEmpty()){
            for(String pId : ProdId){
                if(mapOfproduct != null && !mapOfproduct.isEmpty() && mapOfproduct.containsKey(pId)){
                    
                }else{
                    ProductId.add(pId) ;
                }
            }
        }
        if(ProductId != null && !ProductId.isEmpty()){
            equipmentlst = [select id,Equipment__c,Quantity__c,Product__c,Filter_Product__c,Part_Number__c,Unit_Price__c,Product_Name__c,OpportunityId__c,Total_Price__c  from Equipment__c where OpportunityId__c =: oppId and Product__c =: ProductId];
        }
        try{
            if(equipmentlst != null && !equipmentlst.isEmpty()){
                delete equipmentlst;
            }
        }catch(Exception e){}
        
        //************** 1 year Mainteance Product update *************************
        
        Boolean check = false;
        String OpportunityId = '';
        Decimal Sno = 0;
        String siteId = '';
        Decimal UnitCost = 0;
        Decimal Percentage1 = 0;
        Decimal margin = 0.3;
        Decimal Calculation = 1-margin; 
        Decimal UnitPrice = 0;
        Decimal rounded = 0;
        List<OpportunityLineItem> childLst = new List<OpportunityLineItem>();
        List<OpportunityLineItem> MaintanceChild = new List<OpportunityLineItem>();
        if(lineProductlst != null && !lineProductlst.isEmpty()){
            for(OpportunityLineItem item : lineProductlst){
                if(item.Filter_Product__c == 'Child' ){
                    if(item.Sub_Category__c == 'IP Phones' || item.Sub_Category__c == 'Switches and PoE' || item.Sub_Category__c == 'Accessories'){
                        OpportunityId = item.OpportunityId;
                        siteId = item.Site__c;
                        Sno = item.Site_Number__c;
                        check = true;
                        break;
                    }
                }
                
            }
        }
        childLst = [Select id,Site__c,Equipment__c,Product_Name__c,Part_Number__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c,PoE__c,Parent_ID__c,UNITCOST__c,Maintenance_Universal__c  from OpportunityLineItem where Equote_ext_ID__c != null and Filter_Product__c  =: 'Child' and OpportunityId  =: OpportunityId and Site_Number__c =: Sno and Site__c =: siteId] ;
        if(childLst != null && !childLst.isEmpty()){
            for(OpportunityLineItem item : childLst){
                if(item.Maintenance_Universal__c == false){
                    if(item.Sub_Category__c == 'IP Phones' || item.Sub_Category__c == 'Switches and PoE' || item.Sub_Category__c == 'Accessories'){
                        UnitCost = UnitCost + (item.UNITCOST__c * item.Quantity);
                    }
                }else{
                    MaintanceChild.add(item);
                }
            }
            Percentage1 = UnitCost * 0.03;
            rounded = Percentage1 / Calculation;
            UnitPrice = rounded.setScale(2, RoundingMode.HALF_UP);
        }
        if(MaintanceChild != null && !MaintanceChild.isEmpty()){
            for(OpportunityLineItem childItem : MaintanceChild){
                if(childItem.Type_of_Billing__c == 'MRC'){
                    childItem.Unit_Price__c = UnitPrice;
                    childItem.TotalPrice = childItem.Unit_Price__c * childItem.Quantity;
                }else{
                    childItem.NRC__c = UnitPrice;
                    childItem.TotalPrice = childItem.NRC__c * childItem.Quantity;
                }
            }
            try{
                update MaintanceChild; 
            }
            catch(Exception e){}
        }
    }
}