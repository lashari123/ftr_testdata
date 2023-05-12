public class FilterProduct {
    public String Id;
    public Opportunity opp{get;set;}
    public Boolean FrontierAnyware {get;set;}
    public Boolean SmartVoice {get;set;}
    public Boolean Flex {get;set;}
    public Boolean showTable {get;set;}
    public String productType {get;set;}
    public String FilterType {get;set;}
    public String SubCategory {get;set;}
    public String Site{get;set;}
    public String TypeOfBilling{get;set;}
    public List<OpportunityLineItem> Prodlst {get;set;}
    public List<Site__c> sitelst {get;set;}
    public Map<Id,String> noChildMap {get;set;}
    public List<OpportunityLineItem>childItemLst {get;set;}
    public string prodType  {get;set;}
    public string renderAsExcel{get;set;}
    public Boolean contractTable {get;set;}
    public Boolean Licenses {get;set;}
    Public Boolean AddOn {get;set;}
    public Boolean TollFree {get;set;}
    public Boolean IpPhone {get;set;}
    public Boolean SwitchesPOE {get;set;}
    public Boolean Accessories {get;set;}
    public Boolean Miscellaneous {get;set;}
    public Boolean Installation {get;set;}
    public Boolean WarrantyReserve {get;set;}
    public Boolean PostWarranty {get;set;}
    public List<OpportunityLineItem> parentLicensesLst {get;set;}
    public List<OpportunityLineItem> parentAddOnLst {get;set;}
    public List<OpportunityLineItem> parentTollfreeLst {get;set;}
    public List<OpportunityLineItem> childIpphoneLst {get;set;}
    public List<OpportunityLineItem> childSwitchLst {get;set;}
    public List<OpportunityLineItem> childAccessoriesLst {get;set;}
    public List<OpportunityLineItem> childMiscellaneousLst {get;set;}
    public List<OpportunityLineItem> InstallationLst {get;set;}
    public List<OpportunityLineItem> warrantyLst {get;set;}
    public List<OpportunityLineItem> postWarrantyLst {get;set;}
    
    public FilterProduct(ApexPages.StandardController controller){
        productType = 'All';
        SubCategory = 'All';
        Site = 'All';
        TypeOfBilling = 'All';
        Prodlst = new List<OpportunityLineItem>();
        sitelst = new List<Site__c>();
        noChildMap = new Map<Id,String>();
        childItemLst = new List<OpportunityLineItem>();
        prodType = '';
        contractTable = false;
        FilterType = 'val1';
        Licenses  = false; 
        AddOn   = false; 
        TollFree   = false; 
        IpPhone   = false; 
        SwitchesPOE  = false;  
        Accessories   = false; 
        Miscellaneous   = false; 
        Installation   = false; 
        WarrantyReserve   = false; 
        PostWarranty   = false; 
        parentLicensesLst = new List<OpportunityLineItem>();
        parentAddOnLst = new List<OpportunityLineItem>();
        parentTollfreeLst = new List<OpportunityLineItem>();
        childIpphoneLst = new List<OpportunityLineItem>();
        childSwitchLst =  new List<OpportunityLineItem>();
        childAccessoriesLst = new List<OpportunityLineItem>();
        childMiscellaneousLst = new List<OpportunityLineItem>();
        InstallationLst = new List<OpportunityLineItem>();
        warrantyLst = new List<OpportunityLineItem>();
        postWarrantyLst =  new List<OpportunityLineItem>();  
        
        Id = ApexPages.currentPage().getParameters().get('id');
        if(Id != null){
            opp = [select id,Types_of_Product__c from Opportunity where id =: Id limit 1];
            
            sitelst = [select id,Site_Number__c,Opportunity__c from Site__c where Opportunity__c =: Id ORDER BY Site_Number__c];
            if(opp != null){
                if(opp.Types_of_Product__c == 'Frontier Anyware'){
                    FrontierAnyware = true;
                    prodType = 'Frontier Anyware';
                    if(productType != null && SubCategory != null && Site != null && TypeOfBilling != null){
                        if(productType == 'All' && SubCategory == 'All' && Site == 'All' && TypeOfBilling == 'All'){
                            Prodlst = [Select id,Equipment__c,lineItem__c,Part_Number__c,Site__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c,VENDOR_PRICE_LIST_TO_OFFER__c,GPM__c,DISCOUNT__c,UNITCOST__c  from OpportunityLineItem where OpportunityId =: Id and Category__c =: 'FAW' ORDER BY Index__c];  
                            
                        }
                    }
                    
                }else if(opp.Types_of_Product__c == 'Smart Voice'){
                    FrontierAnyware = true;
                    SmartVoice = true;
                    prodType = 'Smart Voice';
                    if(productType != null && SubCategory != null && Site != null && TypeOfBilling != null){
                        if(productType == 'All' && SubCategory == 'All' && Site == 'All' && TypeOfBilling == 'All'){
                            Prodlst = [Select id,Equipment__c,lineItem__c,Part_Number__c,Site__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c,VENDOR_PRICE_LIST_TO_OFFER__c,GPM__c,DISCOUNT__c,UNITCOST__c  from OpportunityLineItem where OpportunityId =: Id and Category__c =: 'Smart Voice' ORDER BY Index__c];  
                        }
                    }
                }else if(opp.Types_of_Product__c == 'Flex 2.0'){
                    Flex = true;
                }
                else{}
            } 
            
        }
        
    }
    public List<SelectOption> getItems() {
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('All','All'));
        if(sitelst != null && !sitelst.isEmpty()){
            for(Site__c s : sitelst){
                
                String  sitenum = String.valueOf(s.Site_Number__c);
                options.add(new SelectOption(sitenum,sitenum));
            }
        }
        return options;
    }
    
    /*public String[] getsites() {
//If multiselect is noChild, sites must be of type String
return sites;
}

public void setsites(String[] sites) {
//If multiselect is noChild, sites must be of type String
this.sites = sites;
}  */
    
    public PageReference  change1(){
        System.debug('==contractTable ****8===='+contractTable);
        System.debug('second time '+SubCategory);
        System.Debug('===before second Prodlst==='+Prodlst);
        System.debug('====prodType ss==='+prodType);
        if(prodType == 'Frontier Anyware'){
            if(productType != null && SubCategory != null && TypeOfBilling != null && Site != null){
                Prodlst = new List<OpportunityLineItem>();
                noChildMap = new Map<Id,String>();
                if(productType == 'All'){
                    if(SubCategory == 'All'){
                        if(TypeOfBilling == 'All'){
                            if(Site == 'All'){
                                Prodlst = [Select id,Equipment__c,lineItem__c,Part_Number__c,Site__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c,VENDOR_PRICE_LIST_TO_OFFER__c,GPM__c,DISCOUNT__c,UNITCOST__c  from OpportunityLineItem where OpportunityId =: Id and Category__c =: 'FAW' ORDER BY Index__c]; 
                            }else{
                                Integer sitenum = Integer.valueOf(Site);
                                Prodlst = [Select id,Equipment__c,lineItem__c,Part_Number__c,Site__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c,VENDOR_PRICE_LIST_TO_OFFER__c,GPM__c,DISCOUNT__c,UNITCOST__c  from OpportunityLineItem where OpportunityId =: Id and Category__c =: 'FAW' and Site_Number__c =:sitenum ORDER BY Index__c];   
                            }
                        }
                        else{
                            if(Site == 'All'){
                                Prodlst = [Select id,Equipment__c,lineItem__c,Part_Number__c,Site__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c,VENDOR_PRICE_LIST_TO_OFFER__c,GPM__c,DISCOUNT__c,UNITCOST__c  from OpportunityLineItem where OpportunityId =: Id and Category__c =: 'FAW' and Type_of_Billing__c =:TypeOfBilling ORDER BY Index__c]; 
                            }else{
                                Integer sitenum = Integer.valueOf(Site);
                                Prodlst = [Select id,Equipment__c,lineItem__c,Part_Number__c,Site__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c,VENDOR_PRICE_LIST_TO_OFFER__c,GPM__c,DISCOUNT__c,UNITCOST__c  from OpportunityLineItem where OpportunityId =: Id and Category__c =: 'FAW' and Type_of_Billing__c =:TypeOfBilling and Site_Number__c =:sitenum ORDER BY Index__c];
                            }
                        }
                    }
                    else{
                        if(TypeOfBilling == 'All'){
                            if(Site == 'All'){
                                Prodlst = [Select id,Equipment__c,lineItem__c,Part_Number__c,Site__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c,VENDOR_PRICE_LIST_TO_OFFER__c,GPM__c,DISCOUNT__c,UNITCOST__c  from OpportunityLineItem where OpportunityId =: Id and Category__c =: 'FAW' and Sub_Category__c =:SubCategory ORDER BY Index__c];  
                            }else{
                                Integer sitenum = Integer.valueOf(Site);
                                Prodlst = [Select id,Equipment__c,lineItem__c,Part_Number__c,Site__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c,VENDOR_PRICE_LIST_TO_OFFER__c,GPM__c,DISCOUNT__c,UNITCOST__c  from OpportunityLineItem where OpportunityId =: Id and Category__c =: 'FAW' and Sub_Category__c =:SubCategory and Site_Number__c =:sitenum ORDER BY Index__c];
                            }
                        }else{
                            if(Site == 'All'){
                                Prodlst = [Select id,Equipment__c,lineItem__c,Part_Number__c,Site__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c,VENDOR_PRICE_LIST_TO_OFFER__c,GPM__c,DISCOUNT__c,UNITCOST__c  from OpportunityLineItem where OpportunityId =: Id and Category__c =: 'FAW' and Sub_Category__c =:SubCategory and Type_of_Billing__c =:TypeOfBilling ORDER BY Index__c];   
                            }else{
                                Integer sitenum = Integer.valueOf(Site);
                                Prodlst = [Select id,Equipment__c,lineItem__c,Part_Number__c,Site__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c,VENDOR_PRICE_LIST_TO_OFFER__c,GPM__c,DISCOUNT__c,UNITCOST__c  from OpportunityLineItem where OpportunityId =: Id and Category__c =: 'FAW' and Sub_Category__c =:SubCategory and Type_of_Billing__c =:TypeOfBilling and Site_Number__c =:sitenum ORDER BY Index__c];   
                            }
                        }
                    }
                    
                }else if(productType == 'Parent'){
                    if(SubCategory == 'All'){
                        if(TypeOfBilling == 'All'){
                            if(Site == 'All'){
                                Prodlst = [Select id,Equipment__c,Site__c,lineItem__c,Part_Number__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c,VENDOR_PRICE_LIST_TO_OFFER__c,GPM__c,DISCOUNT__c,UNITCOST__c  from OpportunityLineItem where OpportunityId =: Id and Category__c =: 'FAW' and Filter_Product__c =:'Parent' ORDER BY Index__c];
                            }
                            else{
                                Integer sitenum = Integer.valueOf(Site);
                                Prodlst = [Select id,Equipment__c,lineItem__c,Site__c,Part_Number__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c,VENDOR_PRICE_LIST_TO_OFFER__c,GPM__c,DISCOUNT__c,UNITCOST__c  from OpportunityLineItem where OpportunityId =: Id and Category__c =: 'FAW' and Filter_Product__c =:'Parent' and Site_Number__c =: sitenum ORDER BY Index__c];  
                            }
                        }
                        else{
                            if(Site == 'All'){ 
                                Prodlst = [Select id,Equipment__c,lineItem__c,Site__c,Part_Number__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c,VENDOR_PRICE_LIST_TO_OFFER__c,GPM__c,DISCOUNT__c,UNITCOST__c  from OpportunityLineItem where OpportunityId =: Id and Category__c =: 'FAW' and Filter_Product__c =:'Parent' and Type_of_Billing__c =:TypeOfBilling ORDER BY Index__c];  
                            }else{
                                Integer sitenum = Integer.valueOf(Site);
                                Prodlst = [Select id,Equipment__c,lineItem__c,Site__c,Part_Number__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c,VENDOR_PRICE_LIST_TO_OFFER__c,GPM__c,DISCOUNT__c,UNITCOST__c  from OpportunityLineItem where OpportunityId =: Id and Category__c =: 'FAW' and Filter_Product__c =:'Parent' and Type_of_Billing__c =:TypeOfBilling and Site_Number__c =: sitenum ORDER BY Index__c]; 
                            }
                        }
                    }else{
                        if(TypeOfBilling == 'All'){
                            if(Site == 'All'){ 
                                Prodlst = [Select id,Equipment__c,lineItem__c,Site__c,Part_Number__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c,VENDOR_PRICE_LIST_TO_OFFER__c,GPM__c,DISCOUNT__c,UNITCOST__c  from OpportunityLineItem where OpportunityId =: Id and Category__c =: 'FAW' and Filter_Product__c =:'Parent' and Sub_Category__c =:SubCategory ORDER BY Index__c];
                            }else{
                                Integer sitenum = Integer.valueOf(Site);
                                Prodlst = [Select id,Equipment__c,lineItem__c,Site__c,Part_Number__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c,VENDOR_PRICE_LIST_TO_OFFER__c,GPM__c,DISCOUNT__c,UNITCOST__c  from OpportunityLineItem where OpportunityId =: Id and Category__c =: 'FAW' and Filter_Product__c =:'Parent' and Sub_Category__c =:SubCategory and Site_Number__c =: sitenum ORDER BY Index__c];    
                            }  
                        }
                        else{
                            if(Site == 'All'){  
                                Prodlst = [Select id,Equipment__c,lineItem__c,Site__c,Part_Number__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c,VENDOR_PRICE_LIST_TO_OFFER__c,GPM__c,DISCOUNT__c,UNITCOST__c  from OpportunityLineItem where OpportunityId =: Id and Category__c =: 'FAW' and Filter_Product__c =:'Parent' and Sub_Category__c =:SubCategory and Type_of_Billing__c =:TypeOfBilling ORDER BY Index__c]; 
                            }else{
                                Integer sitenum = Integer.valueOf(Site);
                                Prodlst = [Select id,Equipment__c,lineItem__c,Site__c,Part_Number__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c,VENDOR_PRICE_LIST_TO_OFFER__c,GPM__c,DISCOUNT__c,UNITCOST__c  from OpportunityLineItem where OpportunityId =: Id and Category__c =: 'FAW' and Filter_Product__c =:'Parent' and Sub_Category__c =:SubCategory and Type_of_Billing__c =:TypeOfBilling and Site_Number__c =: sitenum ORDER BY Index__c];
                            }
                        }
                    }
                    
                }
                else if(productType == 'Child'){
                    if(SubCategory == 'All'){
                        if(TypeOfBilling == 'All'){
                            if(Site == 'All'){ 
                                Prodlst = [Select id,Equipment__c,lineItem__c,Part_Number__c,Site__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c,VENDOR_PRICE_LIST_TO_OFFER__c,GPM__c,DISCOUNT__c,UNITCOST__c  from OpportunityLineItem where OpportunityId =: Id and Category__c =: 'FAW' and Filter_Product__c =:'Child' ORDER BY Index__c];
                            }else{
                                Integer sitenum = Integer.valueOf(Site);
                                Prodlst = [Select id,Equipment__c,lineItem__c,Part_Number__c,Site__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c,VENDOR_PRICE_LIST_TO_OFFER__c,GPM__c,DISCOUNT__c,UNITCOST__c  from OpportunityLineItem where OpportunityId =: Id and Category__c =: 'FAW' and Filter_Product__c =:'Child' and Site_Number__c =: sitenum ORDER BY Index__c];  
                            }
                        }else{
                            if(Site == 'All'){ 
                                Prodlst = [Select id,Equipment__c,lineItem__c,Part_Number__c,Site__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c,VENDOR_PRICE_LIST_TO_OFFER__c,GPM__c,DISCOUNT__c,UNITCOST__c  from OpportunityLineItem where OpportunityId =: Id and Category__c =: 'FAW' and Filter_Product__c =:'Child' and Type_of_Billing__c =:TypeOfBilling ORDER BY Index__c];  
                            }else{
                                Integer sitenum = Integer.valueOf(Site);
                                Prodlst = [Select id,Equipment__c,lineItem__c,Part_Number__c,Site__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c,VENDOR_PRICE_LIST_TO_OFFER__c,GPM__c,DISCOUNT__c,UNITCOST__c  from OpportunityLineItem where OpportunityId =: Id and Category__c =: 'FAW' and Filter_Product__c =:'Child' and Type_of_Billing__c =:TypeOfBilling and Site_Number__c =: sitenum ORDER BY Index__c];   
                            }
                        }
                    }
                    else{
                        if(TypeOfBilling == 'All'){
                            if(Site == 'All'){
                                Prodlst = [Select id,Equipment__c,lineItem__c,Part_Number__c,Site__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c,VENDOR_PRICE_LIST_TO_OFFER__c,GPM__c,DISCOUNT__c,UNITCOST__c  from OpportunityLineItem where OpportunityId =: Id and Category__c =: 'FAW' and Filter_Product__c =:'Child' and Sub_Category__c =:SubCategory ORDER BY Index__c];   
                            }else{
                                Integer sitenum = Integer.valueOf(Site);
                                Prodlst = [Select id,Equipment__c,lineItem__c,Part_Number__c,Site__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c,VENDOR_PRICE_LIST_TO_OFFER__c,GPM__c,DISCOUNT__c,UNITCOST__c  from OpportunityLineItem where OpportunityId =: Id and Category__c =: 'FAW' and Filter_Product__c =:'Child' and Sub_Category__c =:SubCategory and Site_Number__c =: sitenum ORDER BY Index__c];   
                            }
                        }
                        else{
                            if(Site == 'All'){
                                Prodlst = [Select id,Equipment__c,lineItem__c,Part_Number__c,Site__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c,VENDOR_PRICE_LIST_TO_OFFER__c,GPM__c,DISCOUNT__c,UNITCOST__c  from OpportunityLineItem where OpportunityId =: Id and Category__c =: 'FAW' and Filter_Product__c =:'Child' and Sub_Category__c =:SubCategory and Type_of_Billing__c =:TypeOfBilling ORDER BY Index__c];  
                            }else{
                                Integer sitenum = Integer.valueOf(Site);   
                                Prodlst = [Select id,Equipment__c,lineItem__c,Part_Number__c,Site__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c,VENDOR_PRICE_LIST_TO_OFFER__c,GPM__c,DISCOUNT__c,UNITCOST__c  from OpportunityLineItem where OpportunityId =: Id and Category__c =: 'FAW' and Filter_Product__c =:'Child' and Sub_Category__c =:SubCategory and Type_of_Billing__c =:TypeOfBilling and Site_Number__c =: sitenum ORDER BY Index__c];
                            }
                        }
                    }
                    
                }
                else if(productType == 'Equipment'){
                    if(SubCategory == 'All'){
                        if(TypeOfBilling == 'All'){
                            if(Site == 'All'){
                                Prodlst = [Select id,lineItem__c,Part_Number__c,Site__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c,Equipment__c,VENDOR_PRICE_LIST_TO_OFFER__c,GPM__c,DISCOUNT__c,UNITCOST__c  from OpportunityLineItem where OpportunityId =: Id and Category__c =: 'FAW' and Equipment__c =:True ORDER BY Index__c];
                            }else{
                                Integer sitenum = Integer.valueOf(Site);  
                                Prodlst = [Select id,lineItem__c,Part_Number__c,Site__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c,Equipment__c,VENDOR_PRICE_LIST_TO_OFFER__c,GPM__c,DISCOUNT__c,UNITCOST__c  from OpportunityLineItem where OpportunityId =: Id and Category__c =: 'FAW' and Equipment__c =:True and Site_Number__c =: sitenum ORDER BY Index__c];
                            }
                        }else{
                            if(Site == 'All'){
                                Prodlst = [Select id,lineItem__c,Part_Number__c,Site__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c,Equipment__c,VENDOR_PRICE_LIST_TO_OFFER__c,GPM__c,DISCOUNT__c,UNITCOST__c  from OpportunityLineItem where OpportunityId =: Id and Category__c =: 'FAW' and Equipment__c =:True and Type_of_Billing__c =:TypeOfBilling ORDER BY Index__c];   
                            }else{
                                Integer sitenum = Integer.valueOf(Site);  
                                Prodlst = [Select id,lineItem__c,Part_Number__c,Site__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c,Equipment__c,VENDOR_PRICE_LIST_TO_OFFER__c,GPM__c,DISCOUNT__c,UNITCOST__c  from OpportunityLineItem where OpportunityId =: Id and Category__c =: 'FAW' and Equipment__c =:True and Type_of_Billing__c =:TypeOfBilling and Site_Number__c =: sitenum ORDER BY Index__c]; 
                            }
                        }
                    }else{
                        if(TypeOfBilling == 'All'){   
                            if(Site == 'All'){
                                Prodlst = [Select id,lineItem__c,Part_Number__c,Site__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c,Equipment__c,VENDOR_PRICE_LIST_TO_OFFER__c,GPM__c,DISCOUNT__c,UNITCOST__c  from OpportunityLineItem where OpportunityId =: Id and Category__c =: 'FAW' and Equipment__c =:True and Sub_Category__c =:SubCategory ORDER BY Index__c];
                            }else{
                                Integer sitenum = Integer.valueOf(Site);
                                Prodlst = [Select id,lineItem__c,Part_Number__c,Site__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c,Equipment__c,VENDOR_PRICE_LIST_TO_OFFER__c,GPM__c,DISCOUNT__c,UNITCOST__c  from OpportunityLineItem where OpportunityId =: Id and Category__c =: 'FAW' and Equipment__c =:True and Sub_Category__c =:SubCategory and Site_Number__c =: sitenum ORDER BY Index__c];    
                            }
                        }else{
                            if(Site == 'All'){
                                Prodlst = [Select id,lineItem__c,Part_Number__c,Site__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c,Equipment__c,VENDOR_PRICE_LIST_TO_OFFER__c,GPM__c,DISCOUNT__c,UNITCOST__c  from OpportunityLineItem where OpportunityId =: Id and Category__c =: 'FAW' and Equipment__c =:True and Sub_Category__c =:SubCategory and Type_of_Billing__c =:TypeOfBilling ORDER BY Index__c];  
                            }else{
                                Integer sitenum = Integer.valueOf(Site);  
                                Prodlst = [Select id,lineItem__c,Part_Number__c,Site__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c,Equipment__c,VENDOR_PRICE_LIST_TO_OFFER__c,GPM__c,DISCOUNT__c,UNITCOST__c  from OpportunityLineItem where OpportunityId =: Id and Category__c =: 'FAW' and Equipment__c =:True and Sub_Category__c =:SubCategory and Type_of_Billing__c =:TypeOfBilling and Site_Number__c =: sitenum ORDER BY Index__c];
                            }
                        }
                    }
                    
                } else{
                    if(SubCategory == 'All'){
                        if(TypeOfBilling == 'All'){
                            if(Site == 'All'){
                                Prodlst = [Select id,lineItem__c,Part_Number__c,Site__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c,Equipment__c,VENDOR_PRICE_LIST_TO_OFFER__c,GPM__c,DISCOUNT__c,UNITCOST__c  from OpportunityLineItem where OpportunityId =: Id and Category__c =: 'FAW'  and Filter_Product__c =:'Parent' ORDER BY Index__c];
                            }else{
                                Integer sitenum = Integer.valueOf(Site);  
                                Prodlst = [Select id,lineItem__c,Part_Number__c,Site__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c,Equipment__c,VENDOR_PRICE_LIST_TO_OFFER__c,GPM__c,DISCOUNT__c,UNITCOST__c  from OpportunityLineItem where OpportunityId =: Id and Category__c =: 'FAW'  and Filter_Product__c =:'Parent' and Site_Number__c =: sitenum ORDER BY Index__c];
                            }
                        }else{
                            if(Site == 'All'){
                                Prodlst = [Select id,lineItem__c,Part_Number__c,Site__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c,Equipment__c,VENDOR_PRICE_LIST_TO_OFFER__c,GPM__c,DISCOUNT__c,UNITCOST__c  from OpportunityLineItem where OpportunityId =: Id and Category__c =: 'FAW'  and Filter_Product__c =:'Parent' and Type_of_Billing__c =:TypeOfBilling ORDER BY Index__c];   
                            }else{
                                Integer sitenum = Integer.valueOf(Site);  
                                Prodlst = [Select id,lineItem__c,Part_Number__c,Site__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c,Equipment__c,VENDOR_PRICE_LIST_TO_OFFER__c,GPM__c,DISCOUNT__c,UNITCOST__c  from OpportunityLineItem where OpportunityId =: Id and Category__c =: 'FAW'  and Filter_Product__c =:'Parent' and Type_of_Billing__c =:TypeOfBilling and Site_Number__c =: sitenum ORDER BY Index__c]; 
                            }
                        }
                    }else{
                        if(TypeOfBilling == 'All'){   
                            if(Site == 'All'){
                                Prodlst = [Select id,lineItem__c,Part_Number__c,Site__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c,Equipment__c,VENDOR_PRICE_LIST_TO_OFFER__c,GPM__c,DISCOUNT__c,UNITCOST__c  from OpportunityLineItem where OpportunityId =: Id and Category__c =: 'FAW'  and Filter_Product__c =:'Parent' and Sub_Category__c =:SubCategory ORDER BY Index__c];
                            }else{
                                Integer sitenum = Integer.valueOf(Site);
                                Prodlst = [Select id,lineItem__c,Part_Number__c,Site__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c,Equipment__c,VENDOR_PRICE_LIST_TO_OFFER__c,GPM__c,DISCOUNT__c,UNITCOST__c  from OpportunityLineItem where OpportunityId =: Id and Category__c =: 'FAW'  and Filter_Product__c =:'Parent' and Sub_Category__c =:SubCategory and Site_Number__c =: sitenum ORDER BY Index__c];    
                            }
                        }else{
                            if(Site == 'All'){
                                Prodlst = [Select id,lineItem__c,Part_Number__c,Site__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c,Equipment__c,VENDOR_PRICE_LIST_TO_OFFER__c,GPM__c,DISCOUNT__c,UNITCOST__c  from OpportunityLineItem where OpportunityId =: Id and Category__c =: 'FAW'  and Filter_Product__c =:'Parent' and Sub_Category__c =:SubCategory and Type_of_Billing__c =:TypeOfBilling ORDER BY Index__c];  
                            }else{
                                Integer sitenum = Integer.valueOf(Site);  
                                Prodlst = [Select id,lineItem__c,Part_Number__c,Site__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c,Equipment__c,VENDOR_PRICE_LIST_TO_OFFER__c,GPM__c,DISCOUNT__c,UNITCOST__c  from OpportunityLineItem where OpportunityId =: Id and Category__c =: 'FAW'  and Filter_Product__c =:'Parent' and Sub_Category__c =:SubCategory and Type_of_Billing__c =:TypeOfBilling and Site_Number__c =: sitenum ORDER BY Index__c];
                            }
                        }
                    }
                    
                    
                    
                    // Prodlst = [Select id,Site__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c  from OpportunityLineItem where OpportunityId =: Id and Category__c =: 'FAW' and Filter_Product__c =:'Parent' ORDER BY Index__c];
                    
                    Set<String> parentId = new Set<String>();
                    if(Prodlst != null && !Prodlst.isEmpty()){
                        for(OpportunityLineItem oppline : Prodlst){
                            parentId.add(oppline.id);
                        }
                    }
                    if(parentId != null && !parentId.isEmpty()){
                        childItemLst = [Select id,Equipment__c,lineItem__c,Part_Number__c,Site__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c,Parent_ID__c,VENDOR_PRICE_LIST_TO_OFFER__c,GPM__c,DISCOUNT__c,UNITCOST__c from OpportunityLineItem where Parent_ID__c =: parentId];
                    }
                    
                    if(Prodlst != null && !Prodlst.isEmpty()){
                        for(OpportunityLineItem opp : Prodlst){
                            for(OpportunityLineItem child : childItemLst){
                                if(opp.id == child.Parent_ID__c){
                                    noChildMap.put(opp.id,'yes');
                                } 
                            }
                        }
                        
                        for(OpportunityLineItem opp : Prodlst){
                            if(noChildMap.containsKey(opp.id)){
                                
                            }else{
                                noChildMap.put(opp.id,'No');
                            }
                        } 
                    }
                }
            }   
        }
        else if (prodType == 'Smart Voice'){
            if(productType != null && SubCategory != null && TypeOfBilling != null && Site != null){
                Prodlst = new List<OpportunityLineItem>();
                noChildMap = new Map<Id,String>();
                if(productType == 'All'){
                    if(SubCategory == 'All'){
                        if(TypeOfBilling == 'All'){
                            if(Site == 'All'){
                                Prodlst = [Select id,Equipment__c,lineItem__c,Part_Number__c,Site__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c,VENDOR_PRICE_LIST_TO_OFFER__c,GPM__c,DISCOUNT__c,UNITCOST__c  from OpportunityLineItem where OpportunityId =: Id and Category__c =: 'Smart Voice' ORDER BY Index__c]; 
                            }else{
                                Integer sitenum = Integer.valueOf(Site);
                                Prodlst = [Select id,Equipment__c,lineItem__c,Part_Number__c,Site__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c,VENDOR_PRICE_LIST_TO_OFFER__c,GPM__c,DISCOUNT__c,UNITCOST__c  from OpportunityLineItem where OpportunityId =: Id and Category__c =: 'Smart Voice' and Site_Number__c =:sitenum ORDER BY Index__c];   
                            }
                        }
                        else{
                            if(Site == 'All'){
                                Prodlst = [Select id,Equipment__c,lineItem__c,Part_Number__c,Site__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c,VENDOR_PRICE_LIST_TO_OFFER__c,GPM__c,DISCOUNT__c,UNITCOST__c  from OpportunityLineItem where OpportunityId =: Id and Category__c =: 'Smart Voice' and Type_of_Billing__c =:TypeOfBilling ORDER BY Index__c]; 
                            }else{
                                Integer sitenum = Integer.valueOf(Site);
                                Prodlst = [Select id,Equipment__c,lineItem__c,Part_Number__c,Site__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c,VENDOR_PRICE_LIST_TO_OFFER__c,GPM__c,DISCOUNT__c,UNITCOST__c  from OpportunityLineItem where OpportunityId =: Id and Category__c =: 'Smart Voice' and Type_of_Billing__c =:TypeOfBilling and Site_Number__c =:sitenum ORDER BY Index__c];
                            }
                        }
                    }
                    else{
                        if(TypeOfBilling == 'All'){
                            if(Site == 'All'){
                                Prodlst = [Select id,Equipment__c,lineItem__c,Part_Number__c,Site__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c,VENDOR_PRICE_LIST_TO_OFFER__c,GPM__c,DISCOUNT__c,UNITCOST__c  from OpportunityLineItem where OpportunityId =: Id and Category__c =: 'Smart Voice' and Sub_Category__c =:SubCategory ORDER BY Index__c];  
                            }else{
                                Integer sitenum = Integer.valueOf(Site);
                                Prodlst = [Select id,Equipment__c,lineItem__c,Part_Number__c,Site__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c,VENDOR_PRICE_LIST_TO_OFFER__c,GPM__c,DISCOUNT__c,UNITCOST__c  from OpportunityLineItem where OpportunityId =: Id and Category__c =: 'Smart Voice' and Sub_Category__c =:SubCategory and Site_Number__c =:sitenum ORDER BY Index__c];
                            }
                        }else{
                            if(Site == 'All'){
                                Prodlst = [Select id,Equipment__c,lineItem__c,Part_Number__c,Site__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c,VENDOR_PRICE_LIST_TO_OFFER__c,GPM__c,DISCOUNT__c,UNITCOST__c  from OpportunityLineItem where OpportunityId =: Id and Category__c =: 'Smart Voice' and Sub_Category__c =:SubCategory and Type_of_Billing__c =:TypeOfBilling ORDER BY Index__c];   
                            }else{
                                Integer sitenum = Integer.valueOf(Site);
                                Prodlst = [Select id,Equipment__c,lineItem__c,Part_Number__c,Site__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c,VENDOR_PRICE_LIST_TO_OFFER__c,GPM__c,DISCOUNT__c,UNITCOST__c  from OpportunityLineItem where OpportunityId =: Id and Category__c =: 'Smart Voice' and Sub_Category__c =:SubCategory and Type_of_Billing__c =:TypeOfBilling and Site_Number__c =:sitenum ORDER BY Index__c];   
                            }
                        }
                    }
                    
                }else if(productType == 'Parent'){
                    if(SubCategory == 'All'){
                        if(TypeOfBilling == 'All'){
                            if(Site == 'All'){
                                Prodlst = [Select id,Equipment__c,lineItem__c,Part_Number__c,Site__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c,VENDOR_PRICE_LIST_TO_OFFER__c,GPM__c,DISCOUNT__c,UNITCOST__c  from OpportunityLineItem where OpportunityId =: Id and Category__c =: 'Smart Voice' and Filter_Product__c =:'Parent' ORDER BY Index__c];
                            }
                            else{
                                Integer sitenum = Integer.valueOf(Site);
                                Prodlst = [Select id,Equipment__c,lineItem__c,Part_Number__c,Site__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c,VENDOR_PRICE_LIST_TO_OFFER__c,GPM__c,DISCOUNT__c,UNITCOST__c  from OpportunityLineItem where OpportunityId =: Id and Category__c =: 'Smart Voice' and Filter_Product__c =:'Parent' and Site_Number__c =: sitenum ORDER BY Index__c];  
                            }
                        }
                        else{
                            if(Site == 'All'){ 
                                Prodlst = [Select id,Equipment__c,lineItem__c,Part_Number__c,Site__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c,VENDOR_PRICE_LIST_TO_OFFER__c,GPM__c,DISCOUNT__c,UNITCOST__c  from OpportunityLineItem where OpportunityId =: Id and Category__c =: 'Smart Voice' and Filter_Product__c =:'Parent' and Type_of_Billing__c =:TypeOfBilling ORDER BY Index__c];  
                            }else{
                                Integer sitenum = Integer.valueOf(Site);
                                Prodlst = [Select id,Equipment__c,lineItem__c,Part_Number__c,Site__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c,VENDOR_PRICE_LIST_TO_OFFER__c,GPM__c,DISCOUNT__c,UNITCOST__c  from OpportunityLineItem where OpportunityId =: Id and Category__c =: 'Smart Voice' and Filter_Product__c =:'Parent' and Type_of_Billing__c =:TypeOfBilling and Site_Number__c =: sitenum ORDER BY Index__c]; 
                            }
                        }
                    }else{
                        if(TypeOfBilling == 'All'){
                            if(Site == 'All'){ 
                                Prodlst = [Select id,Equipment__c,lineItem__c,Part_Number__c,Site__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c,VENDOR_PRICE_LIST_TO_OFFER__c,GPM__c,DISCOUNT__c,UNITCOST__c  from OpportunityLineItem where OpportunityId =: Id and Category__c =: 'Smart Voice' and Filter_Product__c =:'Parent' and Sub_Category__c =:SubCategory ORDER BY Index__c];
                            }else{
                                Integer sitenum = Integer.valueOf(Site);
                                Prodlst = [Select id,Equipment__c,lineItem__c,Part_Number__c,Site__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c,VENDOR_PRICE_LIST_TO_OFFER__c,GPM__c,DISCOUNT__c,UNITCOST__c  from OpportunityLineItem where OpportunityId =: Id and Category__c =: 'Smart Voice' and Filter_Product__c =:'Parent' and Sub_Category__c =:SubCategory and Site_Number__c =: sitenum ORDER BY Index__c];    
                            }  
                        }
                        else{
                            if(Site == 'All'){  
                                Prodlst = [Select id,Equipment__c,lineItem__c,Part_Number__c,Site__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c,VENDOR_PRICE_LIST_TO_OFFER__c,GPM__c,DISCOUNT__c,UNITCOST__c  from OpportunityLineItem where OpportunityId =: Id and Category__c =: 'Smart Voice' and Filter_Product__c =:'Parent' and Sub_Category__c =:SubCategory and Type_of_Billing__c =:TypeOfBilling ORDER BY Index__c]; 
                            }else{
                                Integer sitenum = Integer.valueOf(Site);
                                Prodlst = [Select id,Equipment__c,lineItem__c,Part_Number__c,Site__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c,VENDOR_PRICE_LIST_TO_OFFER__c,GPM__c,DISCOUNT__c,UNITCOST__c  from OpportunityLineItem where OpportunityId =: Id and Category__c =: 'Smart Voice' and Filter_Product__c =:'Parent' and Sub_Category__c =:SubCategory and Type_of_Billing__c =:TypeOfBilling and Site_Number__c =: sitenum ORDER BY Index__c];
                            }
                        }
                    }
                    
                }
                else if(productType == 'Child'){
                    if(SubCategory == 'All'){
                        if(TypeOfBilling == 'All'){
                            if(Site == 'All'){ 
                                Prodlst = [Select id,Equipment__c,lineItem__c,Part_Number__c,Site__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c,VENDOR_PRICE_LIST_TO_OFFER__c,GPM__c,DISCOUNT__c,UNITCOST__c  from OpportunityLineItem where OpportunityId =: Id and Category__c =: 'Smart Voice' and Filter_Product__c =:'Child' ORDER BY Index__c];
                            }else{
                                Integer sitenum = Integer.valueOf(Site);
                                Prodlst = [Select id,Equipment__c,lineItem__c,Part_Number__c,Site__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c,VENDOR_PRICE_LIST_TO_OFFER__c,GPM__c,DISCOUNT__c,UNITCOST__c  from OpportunityLineItem where OpportunityId =: Id and Category__c =: 'Smart Voice' and Filter_Product__c =:'Child' and Site_Number__c =: sitenum ORDER BY Index__c];  
                            }
                        }else{
                            if(Site == 'All'){ 
                                Prodlst = [Select id,Equipment__c,lineItem__c,Part_Number__c,Site__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c,VENDOR_PRICE_LIST_TO_OFFER__c,GPM__c,DISCOUNT__c,UNITCOST__c  from OpportunityLineItem where OpportunityId =: Id and Category__c =: 'Smart Voice' and Filter_Product__c =:'Child' and Type_of_Billing__c =:TypeOfBilling ORDER BY Index__c];  
                            }else{
                                Integer sitenum = Integer.valueOf(Site);
                                Prodlst = [Select id,Equipment__c,lineItem__c,Part_Number__c,Site__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c,VENDOR_PRICE_LIST_TO_OFFER__c,GPM__c,DISCOUNT__c,UNITCOST__c  from OpportunityLineItem where OpportunityId =: Id and Category__c =: 'Smart Voice' and Filter_Product__c =:'Child' and Type_of_Billing__c =:TypeOfBilling and Site_Number__c =: sitenum ORDER BY Index__c];   
                            }
                        }
                    }
                    else{
                        if(TypeOfBilling == 'All'){
                            if(Site == 'All'){
                                Prodlst = [Select id,Equipment__c,lineItem__c,Part_Number__c,Site__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c,VENDOR_PRICE_LIST_TO_OFFER__c,GPM__c,DISCOUNT__c,UNITCOST__c  from OpportunityLineItem where OpportunityId =: Id and Category__c =: 'Smart Voice' and Filter_Product__c =:'Child' and Sub_Category__c =:SubCategory ORDER BY Index__c];   
                            }else{
                                Integer sitenum = Integer.valueOf(Site);
                                Prodlst = [Select id,Equipment__c,lineItem__c,Part_Number__c,Site__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c,VENDOR_PRICE_LIST_TO_OFFER__c,GPM__c,DISCOUNT__c,UNITCOST__c  from OpportunityLineItem where OpportunityId =: Id and Category__c =: 'Smart Voice' and Filter_Product__c =:'Child' and Sub_Category__c =:SubCategory and Site_Number__c =: sitenum ORDER BY Index__c];   
                            }
                        }
                        else{
                            if(Site == 'All'){
                                Prodlst = [Select id,Equipment__c,lineItem__c,Part_Number__c,Site__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c,VENDOR_PRICE_LIST_TO_OFFER__c,GPM__c,DISCOUNT__c,UNITCOST__c  from OpportunityLineItem where OpportunityId =: Id and Category__c =: 'Smart Voice' and Filter_Product__c =:'Child' and Sub_Category__c =:SubCategory and Type_of_Billing__c =:TypeOfBilling ORDER BY Index__c];  
                            }else{
                                Integer sitenum = Integer.valueOf(Site);   
                                Prodlst = [Select id,Equipment__c,lineItem__c,Part_Number__c,Site__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c,VENDOR_PRICE_LIST_TO_OFFER__c,GPM__c,DISCOUNT__c,UNITCOST__c  from OpportunityLineItem where OpportunityId =: Id and Category__c =: 'Smart Voice' and Filter_Product__c =:'Child' and Sub_Category__c =:SubCategory and Type_of_Billing__c =:TypeOfBilling and Site_Number__c =: sitenum ORDER BY Index__c];
                            }
                        }
                    }
                    
                }
                else if(productType == 'Equipment'){
                    if(SubCategory == 'All'){
                        if(TypeOfBilling == 'All'){
                            if(Site == 'All'){
                                Prodlst = [Select id,lineItem__c,Part_Number__c,Site__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c,Equipment__c,VENDOR_PRICE_LIST_TO_OFFER__c,GPM__c,DISCOUNT__c,UNITCOST__c  from OpportunityLineItem where OpportunityId =: Id and Category__c =: 'Smart Voice' and Equipment__c =:True ORDER BY Index__c];
                            }else{
                                Integer sitenum = Integer.valueOf(Site);  
                                Prodlst = [Select id,lineItem__c,Part_Number__c,Site__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c,Equipment__c,VENDOR_PRICE_LIST_TO_OFFER__c,GPM__c,DISCOUNT__c,UNITCOST__c  from OpportunityLineItem where OpportunityId =: Id and Category__c =: 'Smart Voice' and Equipment__c =:True and Site_Number__c =: sitenum ORDER BY Index__c];
                            }
                        }else{
                            if(Site == 'All'){
                                Prodlst = [Select id,lineItem__c,Part_Number__c,Site__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c,Equipment__c,VENDOR_PRICE_LIST_TO_OFFER__c,GPM__c,DISCOUNT__c,UNITCOST__c  from OpportunityLineItem where OpportunityId =: Id and Category__c =: 'Smart Voice' and Equipment__c =:True and Type_of_Billing__c =:TypeOfBilling ORDER BY Index__c];   
                            }else{
                                Integer sitenum = Integer.valueOf(Site);  
                                Prodlst = [Select id,lineItem__c,Part_Number__c,Site__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c,Equipment__c,VENDOR_PRICE_LIST_TO_OFFER__c,GPM__c,DISCOUNT__c,UNITCOST__c  from OpportunityLineItem where OpportunityId =: Id and Category__c =: 'Smart Voice' and Equipment__c =:True and Type_of_Billing__c =:TypeOfBilling and Site_Number__c =: sitenum ORDER BY Index__c]; 
                            }
                        }
                    }else{
                        if(TypeOfBilling == 'All'){   
                            if(Site == 'All'){
                                Prodlst = [Select id,lineItem__c,Part_Number__c,Site__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c,Equipment__c,VENDOR_PRICE_LIST_TO_OFFER__c,GPM__c,DISCOUNT__c,UNITCOST__c  from OpportunityLineItem where OpportunityId =: Id and Category__c =: 'Smart Voice' and Equipment__c =:True and Sub_Category__c =:SubCategory ORDER BY Index__c];
                            }else{
                                Integer sitenum = Integer.valueOf(Site);
                                Prodlst = [Select id,lineItem__c,Part_Number__c,Site__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c,Equipment__c,VENDOR_PRICE_LIST_TO_OFFER__c,GPM__c,DISCOUNT__c,UNITCOST__c  from OpportunityLineItem where OpportunityId =: Id and Category__c =: 'Smart Voice' and Equipment__c =:True and Sub_Category__c =:SubCategory and Site_Number__c =: sitenum ORDER BY Index__c];    
                            }
                        }else{
                            if(Site == 'All'){
                                Prodlst = [Select id,lineItem__c,Part_Number__c,Site__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c,Equipment__c,VENDOR_PRICE_LIST_TO_OFFER__c,GPM__c,DISCOUNT__c,UNITCOST__c  from OpportunityLineItem where OpportunityId =: Id and Category__c =: 'Smart Voice' and Equipment__c =:True and Sub_Category__c =:SubCategory and Type_of_Billing__c =:TypeOfBilling ORDER BY Index__c];  
                            }else{
                                Integer sitenum = Integer.valueOf(Site);  
                                Prodlst = [Select id,lineItem__c,Part_Number__c,Site__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c,Equipment__c,VENDOR_PRICE_LIST_TO_OFFER__c,GPM__c,DISCOUNT__c,UNITCOST__c  from OpportunityLineItem where OpportunityId =: Id and Category__c =: 'Smart Voice' and Equipment__c =:True and Sub_Category__c =:SubCategory and Type_of_Billing__c =:TypeOfBilling and Site_Number__c =: sitenum ORDER BY Index__c];
                            }
                        }
                    }
                    
                } else{
                    if(SubCategory == 'All'){
                        if(TypeOfBilling == 'All'){
                            if(Site == 'All'){
                                Prodlst = [Select id,lineItem__c,Part_Number__c,Site__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c,Equipment__c,VENDOR_PRICE_LIST_TO_OFFER__c,GPM__c,DISCOUNT__c,UNITCOST__c  from OpportunityLineItem where OpportunityId =: Id and Category__c =: 'Smart Voice'  and Filter_Product__c =:'Parent' ORDER BY Index__c];
                            }else{
                                Integer sitenum = Integer.valueOf(Site);  
                                Prodlst = [Select id,lineItem__c,Part_Number__c,Site__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c,Equipment__c,VENDOR_PRICE_LIST_TO_OFFER__c,GPM__c,DISCOUNT__c,UNITCOST__c  from OpportunityLineItem where OpportunityId =: Id and Category__c =: 'Smart Voice'  and Filter_Product__c =:'Parent' and Site_Number__c =: sitenum ORDER BY Index__c];
                            }
                        }else{
                            if(Site == 'All'){
                                Prodlst = [Select id,lineItem__c,Part_Number__c,Site__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c,Equipment__c,VENDOR_PRICE_LIST_TO_OFFER__c,GPM__c,DISCOUNT__c,UNITCOST__c  from OpportunityLineItem where OpportunityId =: Id and Category__c =: 'Smart Voice'  and Filter_Product__c =:'Parent' and Type_of_Billing__c =:TypeOfBilling ORDER BY Index__c];   
                            }else{
                                Integer sitenum = Integer.valueOf(Site);  
                                Prodlst = [Select id,lineItem__c,Part_Number__c,Site__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c,Equipment__c,VENDOR_PRICE_LIST_TO_OFFER__c,GPM__c,DISCOUNT__c,UNITCOST__c  from OpportunityLineItem where OpportunityId =: Id and Category__c =: 'Smart Voice'  and Filter_Product__c =:'Parent' and Type_of_Billing__c =:TypeOfBilling and Site_Number__c =: sitenum ORDER BY Index__c]; 
                            }
                        }
                    }else{
                        if(TypeOfBilling == 'All'){   
                            if(Site == 'All'){
                                Prodlst = [Select id,lineItem__c,Part_Number__c,Site__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c,Equipment__c,VENDOR_PRICE_LIST_TO_OFFER__c,GPM__c,DISCOUNT__c,UNITCOST__c  from OpportunityLineItem where OpportunityId =: Id and Category__c =: 'Smart Voice'  and Filter_Product__c =:'Parent' and Sub_Category__c =:SubCategory ORDER BY Index__c];
                            }else{
                                Integer sitenum = Integer.valueOf(Site);
                                Prodlst = [Select id,lineItem__c,Part_Number__c,Site__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c,Equipment__c,VENDOR_PRICE_LIST_TO_OFFER__c,GPM__c,DISCOUNT__c,UNITCOST__c  from OpportunityLineItem where OpportunityId =: Id and Category__c =: 'Smart Voice'  and Filter_Product__c =:'Parent' and Sub_Category__c =:SubCategory and Site_Number__c =: sitenum ORDER BY Index__c];    
                            }
                        }else{
                            if(Site == 'All'){
                                Prodlst = [Select id,lineItem__c,Part_Number__c,Site__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c,Equipment__c,VENDOR_PRICE_LIST_TO_OFFER__c,GPM__c,DISCOUNT__c,UNITCOST__c  from OpportunityLineItem where OpportunityId =: Id and Category__c =: 'Smart Voice'  and Filter_Product__c =:'Parent' and Sub_Category__c =:SubCategory and Type_of_Billing__c =:TypeOfBilling ORDER BY Index__c];  
                            }else{
                                Integer sitenum = Integer.valueOf(Site);  
                                Prodlst = [Select id,lineItem__c,Part_Number__c,Site__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c,Equipment__c,VENDOR_PRICE_LIST_TO_OFFER__c,GPM__c,DISCOUNT__c,UNITCOST__c  from OpportunityLineItem where OpportunityId =: Id and Category__c =: 'Smart Voice'  and Filter_Product__c =:'Parent' and Sub_Category__c =:SubCategory and Type_of_Billing__c =:TypeOfBilling and Site_Number__c =: sitenum ORDER BY Index__c];
                            }
                        }
                    }
                    
                    
                    
                    // Prodlst = [Select id,Site__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c  from OpportunityLineItem where OpportunityId =: Id and Category__c =: 'FAW' and Filter_Product__c =:'Parent' ORDER BY Index__c];
                    
                    Set<String> parentId = new Set<String>();
                    if(Prodlst != null && !Prodlst.isEmpty()){
                        for(OpportunityLineItem oppline : Prodlst){
                            parentId.add(oppline.id);
                        }
                    }
                    if(parentId != null && !parentId.isEmpty()){
                        childItemLst = [Select id,Equipment__c,lineItem__c,Part_Number__c,Site__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c,Parent_ID__c,VENDOR_PRICE_LIST_TO_OFFER__c,GPM__c,DISCOUNT__c,UNITCOST__c from OpportunityLineItem where Parent_ID__c =: parentId];
                    }
                    
                    if(Prodlst != null && !Prodlst.isEmpty()){
                        for(OpportunityLineItem opp : Prodlst){
                            for(OpportunityLineItem child : childItemLst){
                                if(opp.id == child.Parent_ID__c){
                                    noChildMap.put(opp.id,'yes');
                                } 
                            }
                        }
                        
                        for(OpportunityLineItem opp : Prodlst){
                            if(noChildMap.containsKey(opp.id)){
                                
                            }else{
                                noChildMap.put(opp.id,'No');
                            }
                        } 
                    }
                }
            }
        }
        System.Debug('===second Prodlst==='+Prodlst);
        return null;
    }
    public PageReference SaveAsExcel() {
        System.debug('=====productType****************'+productType);
        renderAsExcel='application/vnd.ms-excel#Product Report.xls';
        System.debug('===prodType==='+prodType);
        PageReference pdfPage = Page.FilterProductCSV; //create a page reference to our Pdf2 Visualforce pageuj7k
        pdfPage.getParameters().put('prodType',prodType);
        pdfPage.getParameters().put('productType', productType);
        pdfPage.getParameters().put('SubCategory',SubCategory);
        pdfPage.getParameters().put('Site',Site);
        pdfPage.getParameters().put('TypeOfBilling',TypeOfBilling);
        pdfPage.getParameters().put('Id',Id);
        pdfPage.getParameters().put('renderAsExcel',renderAsExcel);
        pdfPage.getParameters().put('FilterType',FilterType);
        pdfPage.setRedirect(false);
        return pdfPage;
    }
    public PageReference change2(){
        System.debug('==contractTable==='+contractTable);
        String Val = 'All';
        if(FilterType == 'val1'){
            Val = 'All';
        }else if(FilterType == 'val2'){
            Val = 'Parent (Licenses, Add-On and Toll Free)';
        }else if(FilterType == 'val3'){
            Val = 'Child (Ipphone, Accesories,Switches POE and Miscellaneous)';
        }else if(FilterType == 'val4'){
            Val = 'One line Installation';
        }else if(FilterType == 'val5'){
            Val = 'One line 1 Yr Warranty Reserve';
        }else if(FilterType == 'val6'){
            Val = 'One line PostWarranty';
        }
        if(contractTable){
            productType = Val;
            parentLicensesLst = new List<OpportunityLineItem>();
            parentAddOnLst = new List<OpportunityLineItem>();
            parentTollfreeLst = new List<OpportunityLineItem>();
            childIpphoneLst = new List<OpportunityLineItem>();
            childSwitchLst = new List<OpportunityLineItem>();
            childAccessoriesLst = new List<OpportunityLineItem>();
            childMiscellaneousLst = new List<OpportunityLineItem>();
            InstallationLst = new List<OpportunityLineItem>();
            warrantyLst = new List<OpportunityLineItem>();
            postWarrantyLst = new List<OpportunityLineItem>();
            List<OpportunityLineItem> licLst = new List<OpportunityLineItem>();
            List<OpportunityLineItem> addOnLst = new List<OpportunityLineItem>();
            List<OpportunityLineItem> tollFreeLst = new List<OpportunityLineItem>();
            List<OpportunityLineItem> IpPhoneLst = new List<OpportunityLineItem>();
            List<OpportunityLineItem> switchLst = new List<OpportunityLineItem>();
            List<OpportunityLineItem> AccessoriesLst = new List<OpportunityLineItem>();
            List<OpportunityLineItem> MiscellaneousLst = new List<OpportunityLineItem>();
            List<OpportunityLineItem> installLst = new List<OpportunityLineItem>();
            List<OpportunityLineItem> wLst = new List<OpportunityLineItem>();
            List<OpportunityLineItem> postwLst = new List<OpportunityLineItem>();
            Map<String,OpportunityLineItem> licMap = new Map<String,OpportunityLineItem>(); 
            Map<String,OpportunityLineItem> addOnMap = new Map<String,OpportunityLineItem>();
            Map<String,OpportunityLineItem> tollMap = new Map<String,OpportunityLineItem>(); 
            Map<String,OpportunityLineItem>IpMap = new Map<String,OpportunityLineItem>();
            Map<String,OpportunityLineItem>switchMap = new Map<String,OpportunityLineItem>();
            Map<String,OpportunityLineItem>accMap = new Map<String,OpportunityLineItem>();
            Map<String,OpportunityLineItem>MiscellaneousMap = new Map<String,OpportunityLineItem>();
            Map<String,OpportunityLineItem>installationMap = new Map<String,OpportunityLineItem>();
            Map<String,OpportunityLineItem>wMap = new Map<String,OpportunityLineItem>();
            Map<String,OpportunityLineItem>postwMap = new Map<String,OpportunityLineItem>();
            Set<String>ProdId = new Set<String>();
            if(Id != null){
                licLst = [Select id,lineItem__c,Part_Number__c,Site__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c,Equipment__c,VENDOR_PRICE_LIST_TO_OFFER__c,GPM__c,DISCOUNT__c,UNITCOST__c  from OpportunityLineItem where OpportunityId =: Id and (Category__c =: 'FAW' AND Sub_Category__c=: 'Licenses')  and Releted__c !=: 'child' and SetUp__c !=: 'Setup'and Filter_Product__c =:'Parent' ORDER BY Index__c];
                addOnLst = [Select id,lineItem__c,Part_Number__c,Site__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c,Equipment__c,VENDOR_PRICE_LIST_TO_OFFER__c,GPM__c,DISCOUNT__c,UNITCOST__c  from OpportunityLineItem where OpportunityId =: Id and (Category__c =: 'FAW' AND Sub_Category__c=: 'Add-On')  and Releted__c !=: 'child' and SetUp__c !=: 'Setup'and Filter_Product__c =:'Parent' ORDER BY Index__c];
                tollFreeLst = [Select id,lineItem__c,Part_Number__c,Site__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c,Equipment__c,VENDOR_PRICE_LIST_TO_OFFER__c,GPM__c,DISCOUNT__c,UNITCOST__c  from OpportunityLineItem where OpportunityId =: Id and (Category__c =: 'FAW' AND Sub_Category__c=: 'Toll Free Bundle Minutes')  and Releted__c !=: 'child' and SetUp__c !=: 'Setup'and Filter_Product__c =:'Parent' ORDER BY Index__c]; 
                IpPhoneLst = [Select id,lineItem__c,Part_Number__c,Site__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c,Equipment__c,VENDOR_PRICE_LIST_TO_OFFER__c,GPM__c,DISCOUNT__c,UNITCOST__c  from OpportunityLineItem where OpportunityId =: Id and (Category__c =: 'FAW' AND Sub_Category__c=: 'IP Phones')  and Releted__c =: 'child' and Filter_Product__c =:'Child' ORDER BY Index__c];
                switchLst = [Select id,lineItem__c,Part_Number__c,Site__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c,Equipment__c,VENDOR_PRICE_LIST_TO_OFFER__c,GPM__c,DISCOUNT__c,UNITCOST__c  from OpportunityLineItem where OpportunityId =: Id and (Category__c =: 'FAW' AND Sub_Category__c=: 'Switches and PoE')  and Releted__c =: 'child' and Filter_Product__c =:'Child' ORDER BY Index__c];
                AccessoriesLst = [Select id,lineItem__c,Part_Number__c,Site__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c,Equipment__c,VENDOR_PRICE_LIST_TO_OFFER__c,GPM__c,DISCOUNT__c,UNITCOST__c  from OpportunityLineItem where OpportunityId =: Id and (Category__c =: 'FAW' AND Sub_Category__c=: 'Accessories')  and Releted__c =: 'child' and Filter_Product__c =:'Child' ORDER BY Index__c];
                MiscellaneousLst = [Select id,lineItem__c,Part_Number__c,Site__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c,Equipment__c,VENDOR_PRICE_LIST_TO_OFFER__c,GPM__c,DISCOUNT__c,UNITCOST__c  from OpportunityLineItem where OpportunityId =: Id and (Category__c =: 'FAW' AND Sub_Category__c=: 'Miscelaneous Materials')  and Releted__c =: 'child' and Filter_Product__c =:'Child' ORDER BY Index__c];
                installLst =  [Select id,lineItem__c,Part_Number__c,Site__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c,Equipment__c,VENDOR_PRICE_LIST_TO_OFFER__c,GPM__c,DISCOUNT__c,UNITCOST__c  from OpportunityLineItem where OpportunityId =: Id and Category__c =: 'FAW' AND (Sub_Category__c=: 'Warranty' OR Sub_Category__c=: 'Post Warranty Maintenance' OR Sub_Category__c=: 'Material Installation') ORDER BY Index__c];
                wLst = [Select id,lineItem__c,Part_Number__c,Site__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c,Equipment__c,VENDOR_PRICE_LIST_TO_OFFER__c,GPM__c,DISCOUNT__c,UNITCOST__c  from OpportunityLineItem where OpportunityId =: Id and Category__c =: 'FAW' AND (Sub_Category__c=: 'Warranty' OR Maintenance_Universal__c =: true) ORDER BY Index__c];
                postwLst = [Select id,lineItem__c,Part_Number__c,Site__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c,Equipment__c,VENDOR_PRICE_LIST_TO_OFFER__c,GPM__c,DISCOUNT__c,UNITCOST__c  from OpportunityLineItem where OpportunityId =: Id and Category__c =: 'FAW' AND Sub_Category__c=: 'Post Warranty Maintenance'  ORDER BY Index__c];
            }
            if(licLst != null && !licLst.isEmpty()){
                for(OpportunityLineItem lic : licLst) {
                    ProdId.add(lic.Product2Id);
                    if(licMap != null && !licMap.isEmpty() && licMap.containsKey(lic.Product2Id)){
                        OpportunityLineItem item = licMap.get(lic.Product2Id);
                        item.Quantity = item.Quantity + lic.Quantity;
                        item.TotalPrice = item.TotalPrice + lic.TotalPrice;
                        licMap.put(lic.Product2Id,item);
                    }else{
                        licMap.put(lic.Product2Id,lic);
                    }
                }
            }
            if(addOnLst != null && !addOnLst.isEmpty()){
                for(OpportunityLineItem addon : addOnLst){
                    ProdId.add(addon.Product2Id);
                    if(addOnMap != null && !addOnMap.isEmpty() && addOnMap.containsKey(addon.Product2Id)){
                        OpportunityLineItem item = addOnMap.get(addon.Product2Id);
                        item.Quantity = item.Quantity + addon.Quantity;
                        item.TotalPrice = item.TotalPrice + addon.TotalPrice;
                        addOnMap.put(addon.Product2Id,item);
                    }else{
                        addOnMap.put(addon.Product2Id,addon);
                    }
                }
            }
            if(tollFreeLst != null && !tollFreeLst.isEmpty()){
                for(OpportunityLineItem tollFree : tollFreeLst){
                    ProdId.add(tollFree.Product2Id);
                    if(tollMap != null && !tollMap.isEmpty() && tollMap.containsKey(tollFree.Product2Id)){
                        OpportunityLineItem item = tollMap.get(tollFree.Product2Id);
                        item.Quantity = item.Quantity + tollFree.Quantity;
                        item.TotalPrice = item.TotalPrice + tollFree.TotalPrice;
                        tollMap.put(tollFree.Product2Id,item);
                    }else{
                        tollMap.put(tollFree.Product2Id,tollFree);
                    }
                }
            }
            if(IpPhoneLst != null && !IpPhoneLst.isEmpty()){
                for(OpportunityLineItem ipPhone : IpPhoneLst){
                    ProdId.add(ipPhone.Product2Id);
                    if(IpMap != null && !IpMap.isEmpty() && IpMap.containsKey(ipPhone.Product2Id)){
                        OpportunityLineItem item = IpMap.get(ipPhone.Product2Id);
                        item.Quantity = item.Quantity + ipPhone.Quantity;
                        item.TotalPrice = item.TotalPrice + ipPhone.TotalPrice;
                        IpMap.put(ipPhone.Product2Id,item);
                    }else{
                        IpMap.put(ipPhone.Product2Id,ipPhone);
                    }
                }
            }
            if(switchLst != null && !switchLst.isEmpty()){
                for(OpportunityLineItem poe : switchLst){
                    ProdId.add(poe.Product2Id);
                    if(switchMap != null && !switchMap.isEmpty() && switchMap.containsKey(poe.Product2Id)){
                        OpportunityLineItem item = switchMap.get(poe.Product2Id);
                        item.Quantity = item.Quantity + poe.Quantity;
                        item.TotalPrice = item.TotalPrice + poe.TotalPrice;
                        switchMap.put(poe.Product2Id,item);
                    }else{
                        switchMap.put(poe.Product2Id,poe);
                    }
                }
            }
            if(AccessoriesLst != null && !AccessoriesLst.isEmpty()){
                for(OpportunityLineItem acc : AccessoriesLst){
                    ProdId.add(acc.Product2Id);
                    if(accMap != null && !accMap.isEmpty() && accMap.containsKey(acc.Product2Id)){
                        OpportunityLineItem item = accMap.get(acc.Product2Id);
                        item.Quantity = item.Quantity + acc.Quantity;
                        item.TotalPrice = item.TotalPrice + acc.TotalPrice;
                        accMap.put(acc.Product2Id,item);
                    }else{
                        accMap.put(acc.Product2Id,acc);
                    }
                }
            }
            if(MiscellaneousLst != null && !MiscellaneousLst.isEmpty()){
                for(OpportunityLineItem miscell : MiscellaneousLst){
                    ProdId.add(miscell.Product2Id);
                    if(MiscellaneousMap != null && !MiscellaneousMap.isEmpty() && MiscellaneousMap.containsKey(miscell.Product2Id)){
                        OpportunityLineItem item = MiscellaneousMap.get(miscell.Product2Id);
                        item.Quantity = item.Quantity + miscell.Quantity;
                        item.TotalPrice = item.TotalPrice + miscell.TotalPrice;
                        MiscellaneousMap.put(miscell.Product2Id,item);
                    }else{
                        MiscellaneousMap.put(miscell.Product2Id,miscell);
                    }
                }
            }
            if(installLst != null && !installLst.isEmpty()){
                for(OpportunityLineItem install : installLst){
                    ProdId.add(install.Product2Id);
                    if(installationMap != null && !installationMap.isEmpty() && installationMap.containsKey(install.Product2Id)){
                        OpportunityLineItem item = installationMap.get(install.Product2Id);
                        item.Quantity = item.Quantity + install.Quantity;
                        item.TotalPrice = item.TotalPrice + install.TotalPrice;
                        installationMap.put(install.Product2Id,item);
                    }else{
                        installationMap.put(install.Product2Id,install);
                    }
                }
            }
            if(wLst != null && !wLst.isEmpty()){
                for(OpportunityLineItem warranty : wLst){
                    ProdId.add(warranty.Product2Id);
                    if(wMap != null && !wMap.isEmpty() && wMap.containsKey(warranty.Product2Id)){
                        OpportunityLineItem item = wMap.get(warranty.Product2Id);
                        item.Quantity = item.Quantity + warranty.Quantity;
                        item.TotalPrice = item.TotalPrice + warranty.TotalPrice;
                        wMap.put(warranty.Product2Id,item);
                    }else{
                        wMap.put(warranty.Product2Id,warranty);
                    }
                }
            }
            if(postwLst != null && !postwLst.isEmpty()){
                for(OpportunityLineItem postW : postwLst){
                    ProdId.add(postW.Product2Id);
                    if(postwMap != null && !postwMap.isEmpty() && postwMap.containsKey(postW.Product2Id)){
                        OpportunityLineItem item = postwMap.get(postW.Product2Id);
                        item.Quantity = item.Quantity + postW.Quantity;
                        item.TotalPrice = item.TotalPrice + postW.TotalPrice;
                        postwMap.put(postW.Product2Id,item);
                    }else{
                        postwMap.put(postW.Product2Id,postW);
                    }
                }
            }
            if(ProdId != null && !ProdId.isEmpty()){
                for(String pid : ProdId){
                    if(licMap != null && !licMap.isEmpty() && licMap.containsKey(pid)){
                        parentLicensesLst.add(licMap.get(pid));
                    }
                    if(addOnMap != null && !addOnMap.isEmpty() && addOnMap.containsKey(pid)){
                        parentAddOnLst.add(addOnMap.get(pid));
                    }
                    if(tollMap != null && !tollMap.isEmpty() && tollMap.containsKey(pid)){
                        parentTollfreeLst.add(tollMap.get(pid));
                    }
                    if(IpMap != null && !IpMap.isEmpty() && IpMap.containsKey(pid)){
                        childIpphoneLst.add(IpMap.get(pid)); 
                    }
                    if(switchMap != null && !switchMap.isEmpty() && switchMap.containsKey(pid)){
                        childSwitchLst.add(switchMap.get(pid));
                    }
                    if(accMap != null && !accMap.isEmpty() && accMap.containsKey(pid)){
                        childAccessoriesLst.add(accMap.get(pid));
                    }
                    if(MiscellaneousMap != null && !MiscellaneousMap.isEmpty() && MiscellaneousMap.containsKey(pid)){
                        childMiscellaneousLst.add(MiscellaneousMap.get(pid));
                    }
                    if(installationMap != null && !installationMap.isEmpty() && installationMap.containsKey(pid)){
                        InstallationLst.add(installationMap.get(pid));
                    }
                    if(wMap != null && !wMap.isEmpty() && wMap.containsKey(pid)){
                        warrantyLst.add(wMap.get(pid));
                    }
                    if(postwMap != null && !postwMap.isEmpty() && postwMap.containsKey(pid)){
                        postWarrantyLst.add(postwMap.get(pid));
                    }
                }
            }
            if(FilterType == 'val1'){
                if(parentLicensesLst != null && !parentLicensesLst.isEmpty()){
                    Licenses  = true;
                }
                if(parentAddOnLst != null && !parentAddOnLst.isEmpty()){
                    AddOn   = true; 
                }
                if(parentTollfreeLst != null && !parentTollfreeLst.isEmpty()){
                    TollFree   = true; 
                }
                if(childIpphoneLst != null && !childIpphoneLst.isEmpty()){
                    IpPhone   = true; 
                }
                if(childSwitchLst != null && !childSwitchLst.isEmpty()){
                    SwitchesPOE  = true;  
                }
                if(childAccessoriesLst != null && !childAccessoriesLst.isEmpty()){
                    Accessories   = true; 
                }
                if(childMiscellaneousLst != null && !childMiscellaneousLst.isEmpty()){
                    Miscellaneous   = true; 
                }
                if(InstallationLst != null && !InstallationLst.isEmpty()){
                    Installation   = true;
                }
                if(warrantyLst != null && !warrantyLst.isEmpty()){
                    WarrantyReserve   = true; 
                }
                if(postWarrantyLst != null && !postWarrantyLst.isEmpty()){
                    PostWarranty   = true; 
                }
            }else if(FilterType == 'val2'){
                if(parentLicensesLst != null && !parentLicensesLst.isEmpty()){
                    Licenses  = true;
                }
                if(parentAddOnLst != null && !parentAddOnLst.isEmpty()){
                    AddOn   = true; 
                }
                if(parentTollfreeLst != null && !parentTollfreeLst.isEmpty()){
                    TollFree   = true; 
                }
                IpPhone   = false; 
                SwitchesPOE  = false;  
                Accessories   = false; 
                Miscellaneous   = false; 
                Installation   = false; 
                WarrantyReserve   = false; 
                PostWarranty   = false; 
            }else if(FilterType == 'val3'){
                Licenses  = false; 
                AddOn   = false; 
                TollFree   = false; 
                if(childIpphoneLst != null && !childIpphoneLst.isEmpty()){
                    IpPhone   = true; 
                }
                if(childSwitchLst != null && !childSwitchLst.isEmpty()){
                    SwitchesPOE  = true;  
                }
                if(childAccessoriesLst != null && !childAccessoriesLst.isEmpty()){
                    Accessories   = true; 
                }
                if(childMiscellaneousLst != null && !childMiscellaneousLst.isEmpty()){
                    Miscellaneous   = true; 
                } 
                Installation   = false; 
                WarrantyReserve   = false; 
                PostWarranty   = false;
            }else if(FilterType == 'val4'){
                Licenses  = false; 
                AddOn   = false; 
                TollFree   = false; 
                IpPhone   = false; 
                SwitchesPOE  = false;  
                Accessories   = false; 
                Miscellaneous   = false; 
                if(InstallationLst != null && !InstallationLst.isEmpty()){
                    Installation   = true;
                }
                WarrantyReserve   = false; 
                PostWarranty   = false;
            }else if(FilterType == 'val5'){
                Licenses  = false; 
                AddOn   = false; 
                TollFree   = false; 
                IpPhone   = false; 
                SwitchesPOE  = false;  
                Accessories   = false; 
                Miscellaneous   = false; 
                Installation   = false; 
                if(warrantyLst != null && !warrantyLst.isEmpty()){
                    WarrantyReserve   = true; 
                } 
                PostWarranty   = false;
            }else if(FilterType == 'val6'){
                Licenses  = false; 
                AddOn   = false; 
                TollFree   = false; 
                IpPhone   = false; 
                SwitchesPOE  = false;  
                Accessories   = false; 
                Miscellaneous   = false; 
                Installation   = false; 
                WarrantyReserve   = false; 
                if(postWarrantyLst != null && !postWarrantyLst.isEmpty()){
                    PostWarranty   = true; 
                }
            }
            
        }else{
            productType = 'All';
            SubCategory = 'All';
            Site = 'All';
            TypeOfBilling = 'All';
        }
        return null;
    }
}