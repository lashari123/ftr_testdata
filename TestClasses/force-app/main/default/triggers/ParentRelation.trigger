trigger ParentRelation on OpportunityLineItem (After insert,After Update,After delete) {
    
    if(Trigger.isAfter && Trigger.isdelete){
        if(Trigger.old != null && !Trigger.old.isEmpty()){
            SetupProduct.afterDeleteFunctionality(Trigger.old);
        }
    }
    
    if(Trigger.isAfter && Trigger.isInsert){
        List<OpportunityLineItem> afterInsertLineItemLst = new List<OpportunityLineItem>();
        Opportunity opp = new Opportunity();
        Integer ContractYear = 0;
        List<OpportunityLineItem> lineitemlist = new List<OpportunityLineItem>();
        List<OpportunityLineItem> linesetuplist = new List<OpportunityLineItem>();
        List<OpportunityLineItem> UniversalLst = new List<OpportunityLineItem>();
        if(Trigger.new != null && !Trigger.new.isEmpty()) {
            
            List<OpportunityLineItem> linelist = new List<OpportunityLineItem>();
            List<OpportunityLineItem> linelist1 = new List<OpportunityLineItem>();
            List<UCaaS_Parent_Child__c>ParentchildProducts = new List<UCaaS_Parent_Child__c>();
            List<Product2> childprodlst = new List<Product2>();
            List<PricebookEntry> priceEntrylist = new List<PricebookEntry>();
            Map<String,Set<OpportunityLineItem>> ParentMap = new Map<String,Set<OpportunityLineItem>>();
            Map<String,OpportunityLineItem> InsertMap = new Map<String,OpportunityLineItem>();
            Map<String,String> checkmap = new Map<String,String>();
            Map<String,Map<String,Integer>> MultiplyQTY = new Map<String,Map<String,Integer>>();
            Set<Id> ParentId = new Set<Id>();
            Set<Id> lineId = new Set<Id>();
            Set<Id> childId = new Set<Id>();
            Set<Id>childprodId = new Set<Id>();
            
            Site__c site = new Site__c();
            Boolean Maintenance = false;
            
            for(OpportunityLineItem item : Trigger.new){
                lineId.add(item.id);
            }
            if(lineId != null && !lineId.isEmpty()){
                linelist = [Select id,ProductFamily__c,SmartVoice_Fiber_100_100_Broadband__c,SmartVoice_Fiber_500_500_Broadband__c,SmartVoice_Fiber_1G_1G_Broadband__c,SmartVoice_FiOS_100_100_Broadband__c,SmartVoice_FiOS_500_500_Broadband__c,SmartVoice_FiOS_1G_1G_Broadband__c,SmartVoice_Broadband_12__c,SmartVoice_Broadband_18__c,SmartVoice_Broadband_25__c,SmartVoice_Broadband_35__c,SmartVoice_Broadband_45__c,SmartVoice_Broadband_70__c,SmartVoice_Broadband_90__c,SmartVoice_Broadband_115__c,site__c,Equipment__c,Product_Name__c,Part_Number__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c,PoE__c  from OpportunityLineItem where id =: lineId] ;
                afterInsertLineItemLst = [Select id,ProductFamily__c,GPM__c,CPE_Gross_Margin__c,CPE_NRC_Price__c,OpportunityRecordType__c,CPQ_NetNewMRR__c,Types_of_Product__c,Site__c,Equipment__c,Product_Name__c,Part_Number__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c,PoE__c  from OpportunityLineItem where id =: lineId] ;
                if(linelist[0].OpportunityId != null){
                    opp = [Select id,RecordType.Name,Types_of_Product__c,Contact__c,Pricebook2Id,Contract_Term_Years__c,accountId,OwnerId,Company_size__c,Total_NRC__c,Total_Contract_MRR__c,MRC__c from Opportunity where id =: linelist[0].OpportunityId limit 1];
                }
                if(opp.Contract_Term_Years__c != null){
                    ContractYear =  Integer.valueOf(opp.Contract_Term_Years__c);
                }
                linelist1 = [Select id,Site__c,Equipment__c,Product_Name__c,Part_Number__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c,PoE__c  from OpportunityLineItem where id =: lineId] ;
            }
            List<Equipment__c> equipmentlst = new List<Equipment__c>();
            List<Equipment__c> eqmtlst = new List<Equipment__c>();
            List<Equipment__c> upeqmtlst = new List<Equipment__c>();
            if(opp != null){
                equipmentlst = [select id,Equipment__c,Quantity__c,Product__c,Filter_Product__c,Part_Number__c,Unit_Price__c,Product_Name__c,OpportunityId__c,Total_Price__c  from Equipment__c where OpportunityId__c =: opp.Id];
            }
            if(equipmentlst != null && !equipmentlst.isEmpty()){
                Map<String,Equipment__c> eqmap = new Map<String,Equipment__c>();
                for(Equipment__c ement : equipmentlst){
                    if(linelist1 != null && !linelist1.isEmpty()){
                        for(OpportunityLineItem oppitem : linelist1){
                            if(oppitem.Filter_Product__c == 'Parent'){
                                if(ement.Product__c == oppitem.Product2Id){
                                    if(ement.Quantity__c !=  null && oppitem.Quantity != null){
                                        ement.Quantity__c = ement.Quantity__c + oppitem.Quantity;
                                    }
                                    if(oppitem.Type_of_Billing__c == 'MRC'){
                                        ement.Unit_Price__c = oppitem.Unit_Price__c;
                                    }else{
                                        ement.Unit_Price__c = oppitem.NRC__c;
                                    }
                                    if(ement.Quantity__c != null && ement.Unit_Price__c != null){
                                        ement.Total_Price__c = ement.Quantity__c * ement.Unit_Price__c;
                                    }
                                    upeqmtlst.add(ement);
                                    eqmap.put(oppitem.Product2Id,ement);
                                }
                            }
                        }
                    }
                }
                
                Map<String,OpportunityLineItem> EqmtMap = new  Map<String,OpportunityLineItem>();
                Set<String> EqmtId = new Set<String>();
                if(linelist1 != null && !linelist1.isEmpty()){
                    for(OpportunityLineItem oppitem : linelist1){
                        if(eqmap != null && !eqmap.isEmpty() && eqmap.containsKey(oppitem.Product2Id)){
                            
                        }
                        else{
                            EqmtId.add(oppitem.Product2Id);
                            if(EqmtMap != null && !EqmtMap.isEmpty() && EqmtMap.containsKey(oppitem.Product2Id)){
                                OpportunityLineItem lineItem = EqmtMap.get(oppitem.Product2Id);
                                if(oppitem.Filter_Product__c == 'Parent'){
                                    lineItem.Quantity = lineItem.Quantity + oppitem.Quantity;
                                    EqmtMap.put(oppitem.Product2Id,lineItem);
                                }
                            }
                            else{
                                if(oppitem.Filter_Product__c == 'Parent'){
                                    EqmtMap.put(oppitem.Product2Id,oppitem);  
                                }
                            }
                        }
                    }
                    
                    if(EqmtId != null && !EqmtId.isEmpty()){
                        for(String prodid : EqmtId){
                            
                            OpportunityLineItem oppitem1 = EqmtMap.get(prodid);
                            if(oppitem1 != null){
                                
                                Equipment__c eqmt = new Equipment__c();
                                eqmt.OpportunityId__c = oppitem1.OpportunityId;
                                eqmt.Product_Name__c = oppitem1.Product_Name__c;
                                eqmt.Part_Number__c = oppitem1.Part_Number__c;
                                eqmt.Quantity__c = oppitem1.Quantity;
                                eqmt.Product__c = oppitem1.Product2Id;
                                eqmt.Product_Code__c = oppitem1.ProductCode;
                                if(oppitem1.Type_of_Billing__c == 'MRC'){
                                    eqmt.Unit_Price__c = oppitem1.Unit_Price__c;
                                }else{
                                    eqmt.Unit_Price__c =  oppitem1.NRC__c;
                                }
                                eqmt.Total_Price__c = eqmt.Unit_Price__c * eqmt.Quantity__c;
                                eqmtlst.add(eqmt);
                            }
                            
                        }
                    }
                    
                }
                try{
                    insert eqmtlst;
                    update upeqmtlst;
                }catch(Exception e){}
            }
            else{
                Map<String,OpportunityLineItem> EqmtMap = new  Map<String,OpportunityLineItem>();
                Set<String> EqmtId = new Set<String>();
                if(linelist1 != null && !linelist1.isEmpty()){
                    for(OpportunityLineItem oppitem : linelist1){
                        EqmtId.add(oppitem.Product2Id);
                        if(EqmtMap != null && !EqmtMap.isEmpty() && EqmtMap.containsKey(oppitem.Product2Id)){
                            OpportunityLineItem lineItem = EqmtMap.get(oppitem.Product2Id);
                            if(oppitem.Filter_Product__c == 'Parent'){
                                lineItem.Quantity = lineItem.Quantity + oppitem.Quantity;
                                EqmtMap.put(oppitem.Product2Id,lineItem);
                            }
                        }
                        else{
                            if(oppitem.Filter_Product__c == 'Parent'){
                                EqmtMap.put(oppitem.Product2Id,oppitem);  
                            }
                        }
                    }
                }
                if(EqmtId != null && !EqmtId.isEmpty()){
                    for(String prodid : EqmtId){
                        OpportunityLineItem oppitem = EqmtMap.get(prodid);
                        if(oppitem != null){
                            Equipment__c eqmt = new Equipment__c();
                            eqmt.OpportunityId__c = oppitem.OpportunityId;
                            eqmt.Product_Name__c = oppitem.Product_Name__c;
                            eqmt.Part_Number__c = oppitem.Part_Number__c;
                            eqmt.Quantity__c = oppitem.Quantity;
                            eqmt.Product_Code__c = oppitem.ProductCode;
                            eqmt.Product__c = oppitem.Product2Id;
                            if(oppitem.Type_of_Billing__c == 'MRC'){
                                eqmt.Unit_Price__c =  oppitem.Unit_Price__c;
                            }else{
                                eqmt.Unit_Price__c = oppitem.NRC__c;
                            }
                            if(eqmt.Unit_Price__c != null && eqmt.Quantity__c != null){
                                eqmt.Total_Price__c = eqmt.Unit_Price__c * eqmt.Quantity__c;
                            }
                            eqmtlst.add(eqmt);
                        }
                        
                    }
                }
                insert eqmtlst;
            }
            
            
            //   New Section  Custom Revenu Generate
            
            
            if(linelist != null && !linelist.isEmpty()){
                for(OpportunityLineItem oppitem : linelist){
                    ParentId.add(oppitem.Product2Id);
                    
                }
                
            } 
            // Closing of New Section 
            
            if(linelist[0].Site__c != null){
                site = [select id,PoE_option__c from Site__c where id =: linelist[0].Site__c limit 1];
            }
            
            String year = '';
            if(opp.Contract_Term_Years__c != null){
                year = String.valueOf(opp.Contract_Term_Years__c);
            }
            if(ParentId != null && !ParentId.isEmpty() && opp.Pricebook2Id  != null){
                System.debug('===if parent***'+ParentId);
                if(opp.Types_of_Product__c != null && opp.Types_of_Product__c == 'Frontier Anyware'){
                    System.debug('===types of product=='+opp.Types_of_Product__c);
                    if(site.PoE_option__c != null && site.PoE_option__c.contains('Customer Provided')){
                        ParentchildProducts = [Select id,Parent_ID__c,Child_ID__c,Price_Book__c,Qty__c,PoE_provided_by_customer__c,isActive__c from UCaaS_Parent_Child__c where Parent_ID__c =: ParentId and Price_Book__c =: opp.Pricebook2Id and (PoE_provided_by_customer__c =: 'All' OR PoE_provided_by_customer__c =: 'TRUE') and Types_of_Product__c =: opp.Types_of_Product__c and isActive__c =: true];
                        if(ParentchildProducts.isEmpty()){
                            ParentchildProducts = [Select id,Parent_ID__c,Child_ID__c,Price_Book__c,Qty__c,PoE_provided_by_customer__c,isActive__c from UCaaS_Parent_Child__c where Parent_ID__c =: ParentId and (Price_Book__c  =: null and Price_Book__c !=: opp.Pricebook2Id) and (PoE_provided_by_customer__c =: 'All' OR PoE_provided_by_customer__c =: 'TRUE') and Types_of_Product__c =: opp.Types_of_Product__c and isActive__c =: true] ;
                        }
                    }
                    else if(site.PoE_option__c !=null && site.PoE_option__c.contains('Switch')){
                        ParentchildProducts = [Select id,Parent_ID__c,Child_ID__c,Price_Book__c,Qty__c,PoE_provided_by_Frontier__c,isActive__c from UCaaS_Parent_Child__c where Parent_ID__c =: ParentId and Price_Book__c =: opp.Pricebook2Id and (PoE_provided_by_Frontier__c =: 'All' OR PoE_provided_by_Frontier__c =: 'TRUE') and Types_of_Product__c =: opp.Types_of_Product__c and isActive__c =: true];
                        if(ParentchildProducts.isEmpty()){
                            ParentchildProducts = [Select id,Parent_ID__c,Child_ID__c,Price_Book__c,Qty__c,PoE_provided_by_Frontier__c,isActive__c from UCaaS_Parent_Child__c where Parent_ID__c =: ParentId and (Price_Book__c  =: null and Price_Book__c !=: opp.Pricebook2Id) and (PoE_provided_by_Frontier__c =: 'All' OR PoE_provided_by_Frontier__c =: 'TRUE') and Types_of_Product__c =: opp.Types_of_Product__c and isActive__c =: true];
                        }
                    }
                    else if(site.PoE_option__c !=null && site.PoE_option__c.contains('Not PoE')){
                        ParentchildProducts = [Select id,Parent_ID__c,Child_ID__c,Price_Book__c,Qty__c,PowerPhone_provided_by_Frontier__c,isActive__c from UCaaS_Parent_Child__c where Parent_ID__c =: ParentId and Price_Book__c =: opp.Pricebook2Id and (PowerPhone_provided_by_Frontier__c =: 'All' OR PowerPhone_provided_by_Frontier__c =: 'TRUE') and Types_of_Product__c =: opp.Types_of_Product__c and isActive__c =: true];
                        if(ParentchildProducts.isEmpty()){
                            ParentchildProducts = [Select id,Parent_ID__c,Child_ID__c,Price_Book__c,Qty__c,PowerPhone_provided_by_Frontier__c,isActive__c from UCaaS_Parent_Child__c where Parent_ID__c =: ParentId and (Price_Book__c  =: null and Price_Book__c !=: opp.Pricebook2Id) and (PowerPhone_provided_by_Frontier__c =: 'All' OR PowerPhone_provided_by_Frontier__c =: 'TRUE') and Types_of_Product__c =: opp.Types_of_Product__c and isActive__c =: true];
                        }
                    }
                    System.debug('====parent child***'+ParentchildProducts);
                }
                else if(opp.Types_of_Product__c != null && opp.Types_of_Product__c == 'Smart Voice'){
                    ParentchildProducts = [Select id,Parent_ID__c,Child_ID__c,Types_of_Product__c,Qty__c,isActive__c from UCaaS_Parent_Child__c where Parent_ID__c =: ParentId and Types_of_Product__c =: opp.Types_of_Product__c and isActive__c =: true];
                    System.debug(' if smartv oop==='+ParentchildProducts);
                }
            }
            
            if(ParentchildProducts != null && !ParentchildProducts.isEmpty()){
                for(UCaaS_Parent_Child__c childprod : ParentchildProducts){
                    childId.add(childprod.Child_ID__c);
                    System.debug('===***childprod smart***'+childprod);
                }
                if(linelist != null && !linelist.isEmpty()){
                    for(OpportunityLineItem oppitem : linelist){
                        for(UCaaS_Parent_Child__c childprod : ParentchildProducts){
                            if(oppitem.Product2Id == childprod.Parent_ID__c){
                                if(ParentMap != null && !ParentMap.isEmpty() && ParentMap.containsKey(childprod.Child_ID__c)){
                                    Set<OpportunityLineItem> opplinelst =  ParentMap.get(childprod.Child_ID__c);
                                    opplinelst.add(oppitem);
                                    ParentMap.put(childprod.Child_ID__c,opplinelst);
                                }else{
                                    Set<OpportunityLineItem> opplst = new Set<OpportunityLineItem>();
                                    opplst.add(oppitem);
                                    ParentMap.put(childprod.Child_ID__c,opplst);
                                }
                                checkmap.put(childprod.Child_ID__c,childprod.Parent_ID__c);
                                if(childprod.Qty__c != null){
                                    Map<String,Integer> childMap = new Map<String,Integer>();
                                    childMap.put(childprod.Child_ID__c,Integer.valueOf(childprod.Qty__c));
                                    MultiplyQTY.put(childprod.Parent_ID__c,childMap);
                                }
                            }
                        }
                    }
                }
            }
            
            if(childId != null && !childId.isEmpty()){
                System.debug('==**smart childId**'+childId);
                childprodlst  = [select id,SmartVoice_Fiber_100_100_Broadband__c,SmartVoice_Fiber_500_500_Broadband__c,SmartVoice_Fiber_1G_1G_Broadband__c,SmartVoice_FiOS_1G_1G_Broadband__c,SmartVoice_FiOS_100_100_Broadband__c,SmartVoice_FiOS_500_500_Broadband__c,SmartVoice_Broadband_12__c,SmartVoice_Broadband_18__c,SmartVoice_Broadband_25__c,SmartVoice_Broadband_35__c,SmartVoice_Broadband_45__c,SmartVoice_Broadband_70__c,SmartVoice_Broadband_90__c,SmartVoice_Broadband_115__c,isSmartTollFreeNum__c,isSmartMonthlyAdminCharge__c,isSmartE911__c,isSmartMultiLineHunt__c,isSmartExtendedNum__c,PremiumRule__c,PremiumPlusRule__c,isAnalogRule__c,isConferenceRumSeatRule__c,isSmartAdditionalDID__c,isSmartPremiumAttendant__c,isSmartDirectoryListing__c,isSmartTollFreeDomestic__c,Setup__c,Name,Family,Description,Equipment__c,Term__c,IsActive,Product_Type__c,Child__c,Product_Subcategory__c,Part_Number__c,Type_of_Billing__c,Year__c,Part_Number_of_Product__c,License_Order__c,Show_in_PDF__c,Term1yr__c,multiply__c,Maintenance_Universal__c,isPolycomATA__c,isTechInstallFeeBHSI__c,isTechInstallFeeFiber__c,isTechInstallFeeFIOS__c from Product2 where id =:childId and (Year__c =: year OR Year__c =: 'All') and (Child__c =: TRUE AND IsActive =:TRUE) and Term1yr__c !=: year ORDER BY License_Order__c ];
            }
            if(childprodlst != null && !childprodlst.isEmpty()){
                for(Product2 prod : childprodlst){
                    childprodId.add(prod.id);
                    System.debug('==**child prod**=='+prod);
                }
            }
            
            if(childprodId != null && opp.Pricebook2Id != null){
                priceEntrylist = [Select id,UnitPrice,Pricebook2Id,Type_of_Billing__c,Product2Id,VENDORPRICELISTTOFTR__c,UNITCOST__c,GPM__c,DISCOUNT_Price__c,multiply__c,IsActive from PricebookEntry where Product2Id =: childprodId and Pricebook2Id =: opp.Pricebook2Id and IsActive =: true];
            }
            if(priceEntrylist != null && !priceEntrylist.isEmpty()){
                if(childprodlst != null && !childprodlst.isEmpty()){
                    for(PricebookEntry entry : priceEntrylist){
                        for(Product2 pro : childprodlst){
                            if(entry.Product2Id == pro.id){
                                if(pro.Maintenance_Universal__c == false){
                                    if(ParentMap != null && !ParentMap.isEmpty() && ParentMap.containsKey(pro.id)){
                                        Set<OpportunityLineItem> oppparentitemlst = ParentMap.get(pro.id);   
                                        for(OpportunityLineItem oppparentitem : oppparentitemlst){
                                            Integer qty = 1;
                                            OpportunityLineItem oppLineRelated = new OpportunityLineItem();
                                            oppLineRelated.Product2Id = pro.Id;
                                            oppLineRelated.Product_Name__c = pro.Name;
                                            oppLineRelated.Category__c = pro.Family;
                                            oppLineRelated.Site_Number__c = oppparentitem.Site_Number__c;
                                            oppLineRelated.Site__c = oppparentitem.Site__c;
                                            oppLineRelated.Equipment__c = pro.Equipment__c;
                                            oppLineRelated.Term__c = pro.Term__c;
                                            oppLineRelated.Index__c = pro.License_Order__c;
                                            oppLineRelated.Sub_Category__c = pro.Product_Subcategory__c;
                                            oppLineRelated.Type_of_Billing__c = entry.Type_of_Billing__c;
                                            oppLineRelated.Product_Type__c = pro.Product_Type__c;
                                            oppLineRelated.OpportunityId   = opp.id;
                                            oppLineRelated.Equote_ext_ID__c = opp.Id+''+oppparentitem.Site__c+''+System.Now();
                                            oppLineRelated.PriceBook2Id__c = entry.Pricebook2Id;
                                            oppLineRelated.PricebookEntryId     = entry.id;
                                            oppLineRelated.Part_Number__c = pro.Part_Number_of_Product__c;
                                            if(MultiplyQTY != null && !MultiplyQTY.isEmpty() && MultiplyQTY.containsKey(oppparentitem.Product2Id)){
                                                Map<String,Integer> chdmap = MultiplyQTY.get(oppparentitem.Product2Id);
                                                if(chdmap != null && !chdmap.isEmpty() && chdmap.containsKey(pro.Id)){
                                                    qty = chdmap.get(pro.Id);
                                                }
                                            }
                                            
                                            oppLineRelated.Quantity     = oppparentitem.Quantity * qty;
                                            if(entry.Type_of_Billing__c == 'MRC'){
                                                if(pro.multiply__c != null && pro.multiply__c == true){
                                                    if(entry.multiply__c != null){
                                                        oppLineRelated.Unit_Price__c = entry.UnitPrice * entry.multiply__c;
                                                        oppLineRelated.TotalPrice = oppLineRelated.Unit_Price__c*oppLineRelated.Quantity; 
                                                    }
                                                }else{
                                                    oppLineRelated.Unit_Price__c = entry.UnitPrice;
                                                    oppLineRelated.TotalPrice = oppLineRelated.Unit_Price__c*oppLineRelated.Quantity;  
                                                }
                                                
                                            } else{
                                                if(pro.multiply__c != null && pro.multiply__c == true){
                                                    if(entry.multiply__c != null){
                                                        system.debug('');
                                                        oppLineRelated.NRC__c = entry.UnitPrice * entry.multiply__c;
                                                        oppLineRelated.TotalPrice = oppLineRelated.NRC__c*oppLineRelated.Quantity;
                                                    }
                                                }else{
                                                    oppLineRelated.NRC__c = entry.UnitPrice;
                                                    oppLineRelated.TotalPrice = oppLineRelated.NRC__c*oppLineRelated.Quantity;                                                  
                                                }
                                            }
                                            if(pro.Setup__c){
                                                oppLineRelated.SetUp__c = 'Setup';
                                            }else{
                                                oppLineRelated.Releted__c = 'child';
                                            }
                                            oppLineRelated.Child__c = pro.Child__c;
                                            oppLineRelated.Parent_ID__c = oppparentitem.Id;
                                            oppLineRelated.Parent_Product_Name__c  = oppparentitem.Product_Name__c;
                                            oppLineRelated.Filter_Product__c = 'Child';
                                            oppLineRelated.Show_in_PDF__c = pro.Show_in_PDF__c;
                                            oppLineRelated.VENDOR_PRICE_LIST_TO_OFFER__c = entry.VENDORPRICELISTTOFTR__c;
                                            oppLineRelated.DISCOUNT__c = entry.DISCOUNT_Price__c;
                                            oppLineRelated.GPM__c = entry.GPM__c;
                                            oppLineRelated.UNITCOST__c = entry.UNITCOST__c;
                                            oppLineRelated.isPolycomATA__c = pro.isPolycomATA__c;
                                            oppLineRelated.isTechInstallFeeBHSI__c = pro.isTechInstallFeeBHSI__c;
                                            oppLineRelated.isTechInstallFeeFiber__c = pro.isTechInstallFeeFiber__c;
                                            oppLineRelated.isTechInstallFeeFIOS__c = pro.isTechInstallFeeFIOS__c;
                                            oppLineRelated.isSmartTollFreeDomestic__c = pro.isSmartTollFreeDomestic__c;
                                            oppLineRelated.PremiumRule__c = pro.PremiumRule__c;
                                            oppLineRelated.PremiumPlusRule__c = pro.PremiumPlusRule__c;
                                            oppLineRelated.isConferenceRumSeatRule__c = pro.isConferenceRumSeatRule__c;
                                            oppLineRelated.isAnalogRule__c = pro.isAnalogRule__c;
                                            oppLineRelated.isSmartAdditionalDID__c = pro.isSmartAdditionalDID__c;
                                            oppLineRelated.isSmartPremiumAttendant__c = pro.isSmartPremiumAttendant__c;
                                            oppLineRelated.isSmartDirectoryListing__c = pro.isSmartDirectoryListing__c;
                                            oppLineRelated.isSmartExtendedNum__c = pro.isSmartExtendedNum__c;
                                            oppLineRelated.isSmartMultiLineHunt__c = pro.isSmartMultiLineHunt__c;
                                            oppLineRelated.isSmartE911__c = pro.isSmartE911__c;
                                            oppLineRelated.isSmartMonthlyAdminCharge__c = pro.isSmartMonthlyAdminCharge__c;
                                            opplineRelated.isSmartTollFreeNum__c = pro.isSmartTollFreeNum__c;
                                            if(oppparentitem.SmartVoice_Broadband_12__c == true){
                                            opplineRelated.SmartVoice_Broadband_12__c = pro.SmartVoice_Broadband_12__c;
                                            }
                                            else if(oppparentitem.SmartVoice_Broadband_18__c == true){
                                            opplineRelated.SmartVoice_Broadband_18__c = pro.SmartVoice_Broadband_18__c;
                                            }
                                            else if(oppparentitem.SmartVoice_Broadband_25__c == true){
                                            opplineRelated.SmartVoice_Broadband_25__c = pro.SmartVoice_Broadband_25__c;
                                            }
                                            else if(oppparentitem.SmartVoice_Broadband_35__c == true){
                                            opplineRelated.SmartVoice_Broadband_35__c = pro.SmartVoice_Broadband_35__c;
                                            }
                                            else if(oppparentitem.SmartVoice_Broadband_45__c == true){
                                            opplineRelated.SmartVoice_Broadband_45__c = pro.SmartVoice_Broadband_45__c;
                                            }
                                            else if(oppparentitem.SmartVoice_Broadband_70__c == true){
                                            opplineRelated.SmartVoice_Broadband_70__c = pro.SmartVoice_Broadband_70__c;
                                            }
                                            else if(oppparentitem.SmartVoice_Broadband_90__c == true){
                                            opplineRelated.SmartVoice_Broadband_90__c = pro.SmartVoice_Broadband_90__c;
                                            }
                                            else if(oppparentitem.SmartVoice_Broadband_115__c == true){
                                            opplineRelated.SmartVoice_Broadband_115__c = pro.SmartVoice_Broadband_115__c;
                                            }
                                            else if(oppparentitem.SmartVoice_FiOS_100_100_Broadband__c == true){
                                            opplineRelated.SmartVoice_FiOS_100_100_Broadband__c = pro.SmartVoice_FiOS_100_100_Broadband__c;
                                            }
                                            else if(oppparentitem.SmartVoice_FiOS_500_500_Broadband__c == true){
                                            opplineRelated.SmartVoice_FiOS_500_500_Broadband__c = pro.SmartVoice_FiOS_500_500_Broadband__c;
                                            }
                                            else if(oppparentitem.SmartVoice_FiOS_1G_1G_Broadband__c == true){
                                            opplineRelated.SmartVoice_FiOS_1G_1G_Broadband__c = pro.SmartVoice_FiOS_1G_1G_Broadband__c;
                                            }
                                            else if(oppparentitem.SmartVoice_Fiber_100_100_Broadband__c == true){
                                            opplineRelated.SmartVoice_Fiber_100_100_Broadband__c = pro.SmartVoice_Fiber_100_100_Broadband__c;
                                            }
                                            else if(oppparentitem.SmartVoice_Fiber_500_500_Broadband__c == true){
                                            opplineRelated.SmartVoice_Fiber_500_500_Broadband__c = pro.SmartVoice_Fiber_500_500_Broadband__c;
                                            }
                                            else if(oppparentitem.SmartVoice_Fiber_1G_1G_Broadband__c == true){
                                            opplineRelated.SmartVoice_Fiber_1G_1G_Broadband__c = pro.SmartVoice_Fiber_1G_1G_Broadband__c;
                                            }
                                            lineitemlist.add(oppLineRelated);
                                            InsertMap.put(pro.id,oppLineRelated);
                                        }
                                    }
                                }else{
                                    Maintenance = true;
                                }
                            }
                        }
                    }
                    
                    if(Maintenance){
                        Set<String> MaintenanceId = new Set<String>();
                        Decimal siteno = 0;
                        String siteId = '';
                        Decimal UnitCost = 0;
                        Decimal Percentage1 = 0;
                        Decimal margin = 0.3;
                        Decimal Calculation = 1-margin; 
                        Decimal UnitPrice = 0;
                        Decimal rounded = 0;
                        List<OpportunityLineItem> MaintenanceLst = new List<OpportunityLineItem>();
                        
                        for(Product2 pro : childprodlst){
                            if(pro.Maintenance_Universal__c){
                                MaintenanceId.add(pro.id);
                                Set<OpportunityLineItem> lineProdLst = ParentMap.get(pro.id); 
                                if(lineProdLst != null && !lineProdLst.isEmpty()){
                                    for(OpportunityLineItem item : lineProdLst){
                                        siteno = item.Site_Number__c;
                                        siteId = item.Site__c;
                                        break;
                                    }
                                }
                            }
                        }
                        // System.debug('******siteno*****'+siteno);
                        //System.debug('******siteId*****'+siteId);
                        // System.debug('*******MaintenanceId*********'+MaintenanceId);
                        if(lineitemlist != null && !lineitemlist.isEmpty()){
                            for(OpportunityLineItem item : lineitemlist){
                                if(item.Sub_Category__c == 'IP Phones' || item.Sub_Category__c == 'Switches and PoE' || item.Sub_Category__c == 'Accessories'){
                                    UnitCost = UnitCost + (item.UNITCOST__c * item.Quantity);
                                }
                            }
                            //  System.debug('==unit cost=='+UnitCost);
                            Percentage1 = UnitCost * 0.03;
                            rounded = Percentage1 / Calculation;
                            UnitPrice = rounded.setScale(2, RoundingMode.HALF_UP);
                            // System.debug('====Percentage1==='+Percentage1);
                            //  System.debug('=====Calculation===='+Calculation);
                        }
                        //  System.debug('===UnitPrice==='+UnitPrice);
                        MaintenanceLst = [Select id,Site__c,Equipment__c,Product_Name__c,Part_Number__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c,PoE__c,Parent_ID__c  from OpportunityLineItem where  Product2Id =:MaintenanceId  and Equote_ext_ID__c != null and Filter_Product__c  =: 'Child' and OpportunityId   =: opp.id and Site_Number__c =: siteno and Site__c =: siteId] ;
                        if(MaintenanceLst != null && !MaintenanceLst.isEmpty()){
                            //  System.debug('==MaintLst=='+MaintenanceLst);
                        }
                        else{ 
                            // System.debug('===MaintenanceLst==='+MaintenanceLst);
                            for(PricebookEntry entry : priceEntrylist){
                                for(Product2 pro : childprodlst){
                                    if(entry.Product2Id == pro.id){
                                        if(pro.Maintenance_Universal__c){
                                            //System.debug('===main pro'+pro);
                                            OpportunityLineItem maintenanceItem = new OpportunityLineItem();
                                            maintenanceItem.Product2Id = pro.Id;
                                            maintenanceItem.Product_Name__c = pro.Name;
                                            maintenanceItem.Category__c = pro.Family;
                                            if(siteno > 0){
                                                maintenanceItem.Site_Number__c = siteno;   
                                            }
                                            maintenanceItem.Site__c = siteId;
                                            maintenanceItem.Equipment__c = pro.Equipment__c;
                                            maintenanceItem.Term__c = pro.Term__c;
                                            maintenanceItem.Index__c = pro.License_Order__c;
                                            maintenanceItem.Sub_Category__c = pro.Product_Subcategory__c;
                                            maintenanceItem.Type_of_Billing__c = entry.Type_of_Billing__c;
                                            maintenanceItem.Product_Type__c = pro.Product_Type__c;
                                            maintenanceItem.OpportunityId   = opp.id;
                                            maintenanceItem.Equote_ext_ID__c = opp.Id+''+siteId+''+System.Now();
                                            maintenanceItem.PriceBook2Id__c = entry.Pricebook2Id;
                                            maintenanceItem.PricebookEntryId     = entry.id;
                                            maintenanceItem.Part_Number__c = pro.Part_Number_of_Product__c;
                                            maintenanceItem.Releted__c = 'child';
                                            maintenanceItem.Child__c = pro.Child__c;
                                            maintenanceItem.Parent_ID__c = '';
                                            maintenanceItem.Parent_Product_Name__c  =  '';
                                            maintenanceItem.Filter_Product__c = 'Child';
                                            maintenanceItem.Show_in_PDF__c = pro.Show_in_PDF__c;
                                            maintenanceItem.Quantity = 1;
                                            maintenanceItem.VENDOR_PRICE_LIST_TO_OFFER__c = entry.VENDORPRICELISTTOFTR__c;
                                            maintenanceItem.DISCOUNT__c = entry.DISCOUNT_Price__c;
                                            maintenanceItem.GPM__c = entry.GPM__c;
                                            maintenanceItem.UNITCOST__c = entry.UNITCOST__c;
                                            maintenanceItem.Maintenance_Universal__c = pro.Maintenance_Universal__c;
                                            if(entry.Type_of_Billing__c == 'MRC'){
                                                maintenanceItem.Unit_Price__c = UnitPrice * entry.UnitPrice;
                                                maintenanceItem.TotalPrice = maintenanceItem.Unit_Price__c*maintenanceItem.Quantity;  
                                            }else{
                                                // System.debug('===UnitPrice********+===='+UnitPrice);
                                                maintenanceItem.NRC__c = UnitPrice * entry.UnitPrice;
                                                maintenanceItem.TotalPrice = maintenanceItem.NRC__c*maintenanceItem.Quantity;                                   
                                            }
                                            UniversalLst.add(maintenanceItem); 
                                        }
                                        
                                    }
                                }
                            } 
                        }
                    }
                }
                try{
                    if(lineitemlist.size() >0 ){
                        insert lineitemlist;
                    }
                    //  System.debug('===UniversalLst==='+UniversalLst);
                    insert UniversalLst;
                }catch(Exception e){
                    
                }
            }
            
        }
        
        if(afterInsertLineItemLst != null && !afterInsertLineItemLst.isEmpty()){
            for(OpportunityLineItem lItem : afterInsertLineItemLst){
                if(opp.RecordType.Name == 'Equote' && (lItem.Types_of_Product__c == 'Frontier Anyware' || lItem.Types_of_Product__c == 'Smart Voice')){
                    if(lItem.Filter_Product__c == 'Parent' && lItem.Type_of_Billing__c == 'MRC' && lItem.TotalPrice != null){
                        lItem.CPQ_NetNewMRR__c = lItem.TotalPrice;
                    }else{
                        lItem.CPQ_NetNewMRR__c = 0.0; 
                    }
                    if(opp.RecordType.Name != null && opp.Contract_Term_Years__c != null){
                        lItem.OpportunityRecordType__c = opp.RecordType.Name;
                        lItem.Opportunity_Contract_Term_Year__c = opp.Contract_Term_Years__c;
                    }
                    if(lItem.Equipment__c == true && lItem.Type_of_Billing__c == 'NRC' && lItem.TotalPrice != null){
                        lItem.CPE_NRC_Price__c = lItem.TotalPrice;
                        lItem.CPE_Gross_Margin__c = lItem.GPM__c;
                       // lItem.ProductFamily__c = 'CPE';
                    }
                    else{
                        lItem.CPE_NRC_Price__c = 0.0; 
                    }
                }
            }
        }
        
        try{
            update afterInsertLineItemLst;
        }catch(Exception e){}
        
        if(Trigger.New != null && !Trigger.New.isEmpty()){
            if(ContractYear < 2){
                SetupProduct.setup(Trigger.New);
            }
        }
        
    }
    
    if(Trigger.isAfter && Trigger.isUpdate && ReccursionCls.runOnce == true){
        ReccursionCls.runOnce =false;
        //************  Child Product Update ***************************
        List<OpportunityLineItem> afterUpdateLineItemLst = new List<OpportunityLineItem>();
        List<OpportunityLineItem> lineitemlist = new List<OpportunityLineItem>();
        List<OpportunityLineItem> linechildlist = new List<OpportunityLineItem>();
        List<OpportunityLineItem> Updatechildlist = new List<OpportunityLineItem>();
        List<UCaaS_Parent_Child__c>ParentchildProducts = new List<UCaaS_Parent_Child__c>();
        Map<String,Integer> QtyMap = new Map<String,Integer>();
        Opportunity opp = new Opportunity();
        Set<Id> lineId = new Set<Id>();
        Set<Id> prodId = new Set<Id>(); 
        if(Trigger.new != null && !Trigger.new.isEmpty()) {
            for(OpportunityLineItem item : Trigger.new){
                lineId.add(item.id);
            }
        }
        if(lineId.size() > 0 && lineId != null && !lineId.isEmpty()){
            lineitemlist = [Select id,Site__c,Equipment__c,Product_Name__c,Part_Number__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c,PoE__c  from OpportunityLineItem where id IN: lineId] ;
            if(lineId.size()>0){
                linechildlist = [Select id,Site__c,Equipment__c,Product_Name__c,Part_Number__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c,PoE__c,Parent_ID__c  from OpportunityLineItem where  Equote_ext_ID__c !=null and Filter_Product__c  =: 'Child' and Parent_ID__c!=null and Parent_ID__c IN: lineId] ;
            }
        }
        
        if(lineitemlist.size()> 0 && lineitemlist[0].OpportunityId != null){
            opp = [Select id,RecordType.Name,Contact__c,Pricebook2Id,Contract_Term_Years__c,accountId,OwnerId,Company_size__c,Total_NRC__c,Total_Contract_MRR__c,MRC__c from Opportunity where id =: lineitemlist[0].OpportunityId limit 1];
        } 
        if(lineitemlist.size()> 0 && lineitemlist != null && !lineitemlist.isEmpty()){
            for(OpportunityLineItem oppitem : lineitemlist){
                prodId.add(oppitem.Product2Id);
            }
        }
        if(prodId.size()> 0 && prodId != null && !prodId.isEmpty() && opp.Pricebook2Id != null){
            ParentchildProducts = [Select id,Parent_ID__c,Child_ID__c,Price_Book__c,Qty__c,PoE_provided_by_customer__c from UCaaS_Parent_Child__c where Parent_ID__c !=null and Parent_ID__c =: prodId and Price_Book__c =: opp.Pricebook2Id] ;
            if(ParentchildProducts.isEmpty  ()){
                ParentchildProducts = [Select id,Parent_ID__c,Child_ID__c,Price_Book__c,Qty__c,PoE_provided_by_customer__c from UCaaS_Parent_Child__c where Parent_ID__c!=null and Parent_ID__c =: prodId and Price_Book__c!=null and Price_Book__c !=: opp.Pricebook2Id] ;
            }
        }
        
        if(ParentchildProducts.size()> 0 && ParentchildProducts != null && !ParentchildProducts.isEmpty()){
            for(UCaaS_Parent_Child__c item : ParentchildProducts){
                if(lineitemlist != null && !lineitemlist.isEmpty()){
                    for(OpportunityLineItem oppitem : lineitemlist){
                        if(oppitem.Product2Id == item.Parent_ID__c){
                            if(item.Qty__c != null){
                                QtyMap.put(oppitem.Id,Integer.valueOf(item.Qty__c));
                            }
                            else{
                                QtyMap.put(oppitem.Id,1);                                
                            }
                        }
                    }
                }
            }
        }
        if(lineitemlist.size()> 0 && lineitemlist != null && !lineitemlist.isEmpty()){
            for(OpportunityLineItem oppitem : lineitemlist){
                if(linechildlist != null && !linechildlist.isEmpty()){
                    for(OpportunityLineItem oppChild : linechildlist){
                        if(oppitem.Id == oppChild.Parent_ID__c){
                            Integer qty = QtyMap.get(oppitem.Id);
                            if(qty !=  null && oppitem.Quantity != null){
                                oppChild.Quantity = oppitem.Quantity * qty;
                                if(oppChild.Type_of_Billing__c == 'MRC'){
                                    oppChild.TotalPrice = oppChild.Quantity * oppChild.Unit_Price__c;
                                }else{
                                    oppChild.TotalPrice = oppChild.Quantity * oppChild.NRC__c;
                                }
                                Updatechildlist.add(oppChild);
                            }
                        }
                    }
                }
            }
        }
        try{
            // System.debug('===Updatechildlist==='+Updatechildlist.size());
            if(Updatechildlist.size() > 0){
                update Updatechildlist;  
            }
        }
        catch(Exception e){
            
        }
        
        //*******************************
        //*************SetUp Product Update***********
        List<OpportunityLineItem> linelst = new List<OpportunityLineItem>();
        List<OpportunityLineItem> lineSetuplst = new List<OpportunityLineItem>();
        List<OpportunityLineItem> updateSetuplst = new List<OpportunityLineItem>();
        Set<Id> Ids = new Set<Id>();
        Set<Id> ParentId = new Set<Id>();
        if(Trigger.new != null && !Trigger.new.isEmpty()) {
            for(OpportunityLineItem item : Trigger.new){
                lineId.add(item.id);
            }
        }
        if(lineId.size() > 0 && lineId != null && !lineId.isEmpty()){
            linelst = [Select id,Site__c,Equipment__c,Product_Name__c,Part_Number__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c,PoE__c  from OpportunityLineItem where id =: lineId and Filter_Product__c!=null and Filter_Product__c =: 'Parent'];
        }
        if(linelst.size() > 0 && linelst != null && !linelst.isEmpty()){
            for(OpportunityLineItem litem : linelst){
                ParentId.add(litem.Id);
            }
        }
        if(ParentId.size() > 0 && ParentId != null && !ParentId.isEmpty()){
            lineSetuplst = [Select id,Site__c,Equipment__c,Product_Name__c,Part_Number__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c,PoE__c,Parent_ID__c  from OpportunityLineItem where  Equote_ext_ID__c !=null and Filter_Product__c!=null and Filter_Product__c =: 'Child' and SetUp__c!=null and SetUp__c =: 'Setup' and Parent_ID__c!=null and Parent_ID__c =: ParentId];
        }
        if(lineSetuplst.size() > 0 && lineSetuplst != null && !lineSetuplst.isEmpty()){
            if(linelst != null && !linelst.isEmpty()){
                for(OpportunityLineItem litem : linelst){
                    for(OpportunityLineItem setupitem : lineSetuplst){
                        if(litem.id == setupitem.Parent_ID__c){
                            setupitem.Quantity = litem.Quantity;
                            setupitem.TotalPrice = setupitem.Quantity * setupitem.NRC__c;
                            updateSetuplst.add(setupitem);
                        }
                    }
                }
            }
        }
        try{
            if(updateSetuplst.size() > 0){
                update updateSetuplst; 
            }
        }
        catch(Exception e){
            
        }
        
        // ************Opportunity Revenue Section ************************
        afterUpdateLineItemLst = [Select id,ProductFamily__c,GPM__c,CPE_Gross_Margin__c,CPE_NRC_Price__c,OpportunityRecordType__c,CPQ_NetNewMRR__c,Types_of_Product__c,Site__c,Equipment__c,Product_Name__c,Part_Number__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c,PoE__c  from OpportunityLineItem where Id =: lineId] ;
        if(afterUpdateLineItemLst != null && !afterUpdateLineItemLst.isEmpty()){
            for(OpportunityLineItem lItem : afterUpdateLineItemLst){
                if(opp.RecordType.Name == 'Equote' && (lItem.Types_of_Product__c == 'Frontier Anyware' || lItem.Types_of_Product__c == 'Smart Voice')){
                    if(lItem.Filter_Product__c == 'Parent' && lItem.Type_of_Billing__c == 'MRC' && lItem.TotalPrice != null){
                        lItem.CPQ_NetNewMRR__c = lItem.TotalPrice;
                    }else{
                        lItem.CPQ_NetNewMRR__c = 0.0; 
                    }
                    if(opp.RecordType.Name != null && opp.Contract_Term_Years__c != null){
                        lItem.OpportunityRecordType__c = opp.RecordType.Name;
                        lItem.Opportunity_Contract_Term_Year__c = opp.Contract_Term_Years__c;
                    }
                    if(lItem.Equipment__c == true && lItem.Type_of_Billing__c == 'NRC' && lItem.TotalPrice != null){
                        lItem.CPE_NRC_Price__c = lItem.TotalPrice;
                        lItem.CPE_Gross_Margin__c = lItem.GPM__c;
                       //  lItem.ProductFamily__c = 'CPE';
                    }else{
                        lItem.CPE_NRC_Price__c = 0.0;
                    }
                }
            }
        }
        
        try{
            update afterUpdateLineItemLst;
        }catch(Exception e){}
        
        
        if(Trigger.new != null && !Trigger.new.isEmpty()) {
            SetupProduct.updateParentQty(Trigger.new,Trigger.old);
        }
        ReccursionCls.runOnce =false;
        
    }
    
}