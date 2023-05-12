public class UCaaSpdf {
    public Opportunity opp {get;set;} 
    public Contact con{get;set;}
    public Account acc{get;set;}
    public string nowDate{get;set;}
    public string pageId{get;set;}
    public list<Integer> records{get;set;}
    public List<Site__c> lstSite{get;set;}
    public PriceBook2 brcbook{get;set;}  
    public User user{get;set;}
    public List<OpportunityLineItem> Prodlst {get;set;}
    public List<OpportunityLineItem> childIpPhoneList {get;set;}
    public List<OpportunityLineItem> childAccessoriesList {get;set;}
    public List<OpportunityLineItem> childSwitchPoeList {get;set;}
    public List<OpportunityLineItem> childMiscellaneousList {get;set;}
    public List<OpportunityLineItem> licensesItemList {get;set;}
    public List<OpportunityLineItem> adOnItemList {get;set;}
    public List<OpportunityLineItem> tollItemList {get;set;}
    public List<OpportunityLineItem> licList {get;set;}
    public List<OpportunityLineItem> addOnList {get;set;}
    public List<OpportunityLineItem> tollFreeList {get;set;}
    public List<OpportunityLineItem> ipPhoneList {get;set;}
    public List<OpportunityLineItem> accessoriesList {get;set;}
    public List<OpportunityLineItem> switchesPoeList {get;set;}
    public List<OpportunityLineItem> miscellaneousChildList {get;set;}
    public List<OpportunityLineItem> ipPhoneItemList {get;set;}
    public List<OpportunityLineItem> accessoriesItemList {get;set;}
    public List<OpportunityLineItem> switchesItemList {get;set;}
    public List<OpportunityLineItem> technicalItemList {get;set;}
    public List<OpportunityLineItem> writeInItemList {get;set;}
    public List<OpportunityLineItem> setUpList {get;set;} 
    public List<OpportunityLineItem>  childList {get;set;} 
    public List<OpportunityLineItem>  childList2 {get;set;} 
    public List<Custom_Product__c> MiscellaneousList {get;set;}
    public map<Integer,Site__c>siteAddressMap {get;set;}
    public map<Integer,String> siteAddressStrMap {get;set;}
    public map<Integer,Wrapperclass> wrapperMap{get;set;}
    public String Id = '';
    public decimal totmrc {get;set;}
    public decimal totnrc {get;set;}
    public decimal tottcv {get;set;}
    public Map<Integer,String> switchesMap {get;set;}
    public Map<Integer,String> licenseMap {get;set;}
    public Map<Integer,String> AddMap {get;set;} 
    public Map<Integer,String> tollMap {get;set;}
    public Map<Integer,String> IpMap {get;set;}
    public Map<Integer,String> AccMap {get;set;}
    public Map<Integer,String> TsMap {get;set;}
    public Map<Integer,String> WriteMap {get;set;}
    public Map<Integer,String> otherMap {get;set;}
    public Map<Integer,String> childMap {get;set;}
    public Map<Integer,String> setupMap {get;set;}
    public Map<Integer,decimal> ActivationSite {get;set;}
    public Map<Integer,decimal> InstallationSite {get;set;}
    public Map<Integer,decimal> WarrantySite {get;set;}
    public decimal mrclic {get;set;}
    public decimal mrcIp {get;set;}
    public decimal mrcAddon {get;set;}
    public decimal mrcToll {get;set;}
    public decimal mrcSwitch {get;set;}
    public decimal mrcAccess {get;set;}
    public decimal mrcActivation {get;set;}
    public decimal mrcInstall {get;set;}
    public decimal mrcOther {get;set;}
    public decimal mrcTotal {get;set;}
    public decimal mrcWarranty {get;set;}
    public decimal nrclic {get;set;}
    public decimal nrcIp {get;set;}
    public decimal nrcAddon {get;set;}
    public decimal nrcToll {get;set;}
    public decimal nrcSwitch {get;set;}
    public decimal nrcAccess {get;set;}
    public decimal nrcActivation {get;set;}
    public decimal nrcInstall {get;set;}
    public decimal nrcOther {get;set;}
    public decimal nrcTotal {get;set;}
    public decimal ncWarranty {get;set;}
    public decimal postWarranty {get;set;}
    public decimal postWarrantyQty {get;set;}
    public decimal installationQty {get;set;}
    public decimal warrantyReserveQty {get;set;}
    public Contract__c cont{get;set;}
    public OpportunityLineItem parentLicense {get;set;}
    public OpportunityLineItem parentAddOn {get;set;}
    public OpportunityLineItem parentTollFree {get;set;}
    public OpportunityLineItem parentLicAddOnTollFree {get;set;}
    public OpportunityLineItem childIpPhone {get;set;}
    public OpportunityLineItem childAccessories {get;set;}
    public OpportunityLineItem childSwitchPoe {get;set;}
    public OpportunityLineItem childIpPhoneAccessoriesSwitchPoe {get;set;}
    
    public OpportunityLineItem eliteOppnrc {get;set;}
    public OpportunityLineItem eliteOppmrc {get;set;}
    public OpportunityLineItem premierOppmrc {get;set;}
    public OpportunityLineItem premierOppnrc {get;set;}
    public OpportunityLineItem essentialsOppmrc {get;set;}
    public OpportunityLineItem essentialOppnrc {get;set;}
    public OpportunityLineItem outboundOppmrc {get;set;}
    public OpportunityLineItem outboundOppnrc {get;set;}
    public OpportunityLineItem WebFaxmrc {get;set;}
    public OpportunityLineItem WebFaxnrc {get;set;}
    public OpportunityLineItem TollFreeNumbermrc {get;set;}
    public OpportunityLineItem TollFreeNumbernrc {get;set;}
    public OpportunityLineItem E911mrc {get;set;}
    public OpportunityLineItem E911nrc {get;set;}
    public OpportunityLineItem AdditionalDIDmrc {get;set;}
    public OpportunityLineItem AdditionalDIDnrc {get;set;}
    public OpportunityLineItem CallerIdmrc {get;set;}
    public OpportunityLineItem CallerIdnrc {get;set;}
    public OpportunityLineItem AdditionalDirectorymrc {get;set;}
    public OpportunityLineItem AdditionalDirectorynrc {get;set;}
    public OpportunityLineItem ExtendedMarketmrc {get;set;}
    public OpportunityLineItem ExtendedMarketnrc {get;set;}
    public OpportunityLineItem AdditionalManagedmrc {get;set;}
    public OpportunityLineItem AdditionalManagednrc {get;set;}
    public OpportunityLineItem BusinessAnalyticmrc {get;set;}
    public OpportunityLineItem BusinessAnalyticnrc {get;set;}
    public OpportunityLineItem TollTimemrc{get;set;}
    public OpportunityLineItem TollTimenrc{get;set;}
    public Site__c Primarysite {get;set;}
    public List<OpportunityLineItem> EquipmentIpPhone{get;set;}
    public List<OpportunityLineItem> EquipmentSwitch{get;set;}
    public List<OpportunityLineItem> EqmtAccessories{get;set;}
    public List<OpportunityLineItem> ipPhoneItemList1 {get;set;}
    public List<OpportunityLineItem> accessoriesItemList1 {get;set;}
    public List<OpportunityLineItem> switchesItemList1 {get;set;}
    public List<OpportunityLineItem> licensesItemList1 {get;set;}
    public List<OpportunityLineItem> licensesItemList2 {get;set;}
    public List<OpportunityLineItem> adOnItemList1 {get;set;}
    public List<OpportunityLineItem> adOnItemList2 {get;set;}
    public List<OpportunityLineItem> tollItemList1 {get;set;}
    public List<OpportunityLineItem> tollItemList2 {get;set;}
    public List<OpportunityLineItem> setUpList1 {get;set;}
    public string hyperLink {get;set;}
    public string scheduleId{get;set;}
    public string todayDate{get;set;}
    public string addSiteInfo{get;set;}
    public string addFrontierInfo{get;set;}
    public String  OpportunityId {get;set;}
    
    public UCaaSpdf(ApexPages.StandardController controller){
        Id = ApexPages.currentPage().getParameters().get('id');
         OpportunityId = Id;
        records = new list<Integer>();
        cont = new Contract__c();
        totmrc = 0.0;
        totnrc = 0.0;
        tottcv = 0.0;
        otherMap = new Map<Integer,String>();
        TsMap = new Map<Integer,String>();
        WriteMap = new Map<Integer,String>();
        AccMap = new Map<Integer,String>();
        IpMap = new Map<Integer,String>();
        tollMap = new Map<Integer,String>();
        AddMap = new Map<Integer,String>();
        licenseMap = new Map<Integer,String>();
        switchesMap  = new Map<Integer,String>();
        childMap =  new Map<Integer,String>();
        wrapperMap = new map<Integer,Wrapperclass>();
        siteAddressMap = new map<Integer,Site__c>();
        siteAddressStrMap = new map<Integer,String>();
        setupMap = new map<Integer,String>();
        ActivationSite = new Map<Integer,decimal>();
        InstallationSite = new Map<Integer,decimal>();
        WarrantySite = new Map<Integer,decimal>();
        brcbook = new PriceBook2();
        user = new  User();
        childIpPhoneList = new List<OpportunityLineItem>();
        childAccessoriesList = new List<OpportunityLineItem>();
        childSwitchPoeList = new List<OpportunityLineItem>();
        childMiscellaneousList =  new List<OpportunityLineItem>();
        licensesItemList = new List<OpportunityLineItem>();
        tollItemList =  new List<OpportunityLineItem>();
        adOnItemList = new List<OpportunityLineItem>();
        licList = new List<OpportunityLineItem>();
        addOnList = new List<OpportunityLineItem>();
        tollFreeList = new List<OpportunityLineItem>();
        ipPhoneList = new List<OpportunityLineItem>();
        accessoriesList = new List<OpportunityLineItem>();
        switchesPoeList = new List<OpportunityLineItem>();
        miscellaneousChildList = new List<OpportunityLineItem>();
        ipPhoneItemList = new List<OpportunityLineItem>();
        accessoriesItemList = new List<OpportunityLineItem>();
        switchesItemList = new List<OpportunityLineItem>();
        technicalItemList = new List<OpportunityLineItem>();
        writeInItemList = new List<OpportunityLineItem>();
        setUpList = new List<OpportunityLineItem>();
        childList = new List<OpportunityLineItem>();
        childList2 = new List<OpportunityLineItem>();
        MiscellaneousList = new List<Custom_Product__c>();
        Prodlst = new List<OpportunityLineItem>();
        System.debug('----Opp Id----'+Id);
        // nowDate = Datetime.now().format('dd/MM/yyyy');
        nowDate = system.today().format();
        mrclic = 0.0;
        mrcIp = 0.0;
        mrcAddon = 0.0;
        mrcToll = 0.0;
        mrcSwitch = 0.0;
        mrcAccess = 0.0;
        mrcActivation = 0.0;
        mrcInstall = 0.0;
        mrcOther = 0.0;
        mrcTotal = 0.0;
        mrcWarranty = 0.0;
        ncWarranty = 0.0;
        postWarranty = 0.0;
        postWarrantyQty = 0.0;
        installationQty = 0.0;
        warrantyReserveQty = 0.0;
        nrclic = 0.0;
        nrcIp = 0.0;
        nrcAddon = 0.0;
        nrcToll = 0.0;
        nrcSwitch = 0.0;
        nrcAccess = 0.0;
        nrcActivation = 0.0;
        nrcInstall = 0.0;
        nrcOther = 0.0;
        nrcTotal = 0.0;
        parentLicense = new OpportunityLineItem();
        parentAddOn = new OpportunityLineItem();
        parentTollFree = new OpportunityLineItem();
        parentLicAddOnTollFree = new OpportunityLineItem();
        childIpPhone = new OpportunityLineItem();
        childAccessories = new OpportunityLineItem();
        childSwitchPoe = new OpportunityLineItem();
        childIpPhoneAccessoriesSwitchPoe = new OpportunityLineItem();
        
        eliteOppmrc = new OpportunityLineItem();
        eliteOppnrc = new OpportunityLineItem();
        premierOppmrc = new OpportunityLineItem();
        premierOppnrc = new OpportunityLineItem();
        essentialsOppmrc = new OpportunityLineItem();
        essentialOppnrc = new OpportunityLineItem(); 
        outboundOppmrc = new OpportunityLineItem();
        outboundOppnrc = new OpportunityLineItem(); 
        WebFaxmrc = new OpportunityLineItem();
        WebFaxnrc = new OpportunityLineItem();
        TollFreeNumbermrc = new OpportunityLineItem();
        TollFreeNumbernrc = new OpportunityLineItem();
        E911mrc = new OpportunityLineItem();
        E911nrc = new OpportunityLineItem();
        AdditionalDIDmrc = new OpportunityLineItem();
        AdditionalDIDnrc = new OpportunityLineItem();
        CallerIdmrc = new OpportunityLineItem();
        CallerIdnrc = new OpportunityLineItem();
        AdditionalDirectorymrc = new OpportunityLineItem();
        AdditionalDirectorynrc = new OpportunityLineItem();
        ExtendedMarketmrc = new OpportunityLineItem();
        ExtendedMarketnrc = new OpportunityLineItem();
        AdditionalManagedmrc = new OpportunityLineItem();
        AdditionalManagednrc = new OpportunityLineItem();
        BusinessAnalyticmrc = new OpportunityLineItem();
        BusinessAnalyticnrc = new OpportunityLineItem();
        
        TollTimemrc = new OpportunityLineItem();
        TollTimenrc = new OpportunityLineItem();
        Primarysite = new Site__c();
        EquipmentIpPhone = new List<OpportunityLineItem>();
        EquipmentSwitch = new List<OpportunityLineItem>();
        EqmtAccessories = new List<OpportunityLineItem>();
        ipPhoneItemList1 = new List<OpportunityLineItem>();
        accessoriesItemList1 = new List<OpportunityLineItem>();
        switchesItemList1 = new List<OpportunityLineItem>();
        licensesItemList1 = new List<OpportunityLineItem>();
        licensesItemList2 = new List<OpportunityLineItem>();
        tollItemList1 =  new List<OpportunityLineItem>();
        tollItemList2 =  new List<OpportunityLineItem>();
        adOnItemList1 = new List<OpportunityLineItem>();
        adOnItemList2 =  new List<OpportunityLineItem>();
        setUpList1 = new List<OpportunityLineItem>();
        pageId = '';
        hyperLink = '';
        scheduleId = '';
        todayDate = '';
        addFrontierInfo = '';
        addSiteInfo = '';
        
         String baseUrl = URL.getSalesforceBaseUrl().toExternalForm(); 
        system.debug('baseUrl========================='+baseUrl);
        //pageId =   baseUrl+'/apex/smartVoicecontractPdfChild3?core.apexpages.request.devconsole=1';
        pageId =   baseUrl+'/apex/ContractPdfChild?core.apexpages.request.devconsole=1&id='+Id;
        PageReference redirectPage = new PageReference(baseUrl+'/apex/ContractPdfChild?core.apexpages.request.devconsole=1'); 
        system.debug('redirectPage========================='+redirectPage);
      
        
        /*String baseUrl = URL.getSalesforceBaseUrl().toExternalForm(); 
        system.debug('baseUrl========================='+baseUrl);
        pageId =   baseUrl+'/apex/ContractPdfChild?core.apexpages.request.devconsole=1';
        PageReference redirectPage = new PageReference(baseUrl+'/apex/ContractPdfChild?core.apexpages.request.devconsole=1'); 
        system.debug('redirectPage========================='+redirectPage);
         /* PageReference pageRef2 = Page.ContractPdfChild;
system.debug('jycukvyukikvj'+pageRef2);
String uiThemeDisplayed = UserInfo.getUiThemeDisplayed();
System.debug('url ==='+ApexPages.currentPage().getHeaders().get('Host'));
if(uiThemeDisplayed == 'Theme4d'){
PageReference pageRef = new PageReference('https://'+ApexPages.currentPage().getHeaders().get('Host')+'/'+Id); 
System.debug('===pageId2==='+pageRef);
//PageReference pageRef = new PageReference('https://ftr--ucaastest.lightning.force.com/lightning/r/OpportunityLineItem/'+childid+'/view');
// return pageRef;
}else{
//PageReference pageRef = new PageReference('https://ftr--ucaastest.cs45.my.salesforce.com/'+childid);
PageReference pageRef = new PageReference('https://'+ApexPages.currentPage().getHeaders().get('Host')+'/'+Id); 
System.debug('===pageId2==='+pageRef);
//            return pageRef;
}
*/
        
        if(Id != null) {
            opp = [Select id,Contact__c,Pricebook2Id,Contract_Term_Years__c,accountId,OwnerId,Company_size__c from Opportunity where id =: Id];
            // hyperLink = 'https://ftr--ucaastest--c.cs45.visual.force.com/apex/ContractPdfChild?core.apexpages.request.devconsole=1';
            if(opp!=null && opp.Company_size__c!=null){
                for(integer i=1;i<=opp.Company_size__c;i++) {
                    records.add(i);
                    System.debug('====='+i);
                }
                lstSite = new List<Site__c> ();
                lstSite = [select id, Site_city__c ,Primary__c, Site_Country__c , Site_zipcode__c ,Site_Name__c, Site_Street__c ,Site_Number__c,State__c from Site__c where opportunity__c =: Id  ];
                if(lstSite != null && !lstSite.isEmpty()){
                    for(Site__c s: lstSite){
                        Integer siteno =  Integer.valueOf(s.Site_Number__c);
                        siteAddressMap.put(siteno,s); 
                        
                        siteAddressStrMap.put(siteno,s.Site_Street__c);
                        if(s.Primary__c == True){
                            Primarysite = s;
                        }
                    }
                }
                
            }
            
            cont = [select id,Opportunity__c from Contract__c where Opportunity__c =: Id];
            if(opp.OwnerId != null){
                user = [select id,Name from User where id =: opp.OwnerId limit 1];
            }
            if(opp.Pricebook2Id != null){
                brcbook = [select id,Name,Account_Type__c from PriceBook2 where id =: opp.Pricebook2Id limit 1];
            }
            if( opp.Contact__c != null) { 
                con = [Select id,Name,Phone,Email from Contact where id=: opp.Contact__c limit 1];
                /* if(con != null && con.Phone != null){
String cntPhone = con.Phone;
String PhoneDigits = '';
if(cntPhone.length() >= 10){
PhoneDigits = cntPhone.substring(0,3) + '-' ;
PhoneDigits = PhoneDigits + cntPhone.substring(3,6) + '-';
PhoneDigits = PhoneDigits + cntPhone.substring(6,10);
con.Phone = PhoneDigits; 
}
}*/
            } 
            if( opp.accountId != null) {
                acc = [Select id,Name,BillingStreet, BillingCity, BillingState, BillingPostalCode,BillingCountry, BillingLatitude, BillingLongitude FROM Account where id=:opp.AccountId limit 1];
            }
            
            licensesItemList = [Select id,Site__c,isEssential__c,isElite__c,isPremier__c,isOutbound__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c  from OpportunityLineItem where OpportunityId =: Id and (Category__c =: 'FAW' AND Sub_Category__c=: 'Licenses')  and Releted__c !=: 'child' and SetUp__c !=: 'Setup'and Filter_Product__c =:'Parent' ORDER BY Index__c];
            adOnItemList = [Select id,Site__c,isAdditionalDID__c,isCallerId__c,isAdditionalDirectory__c,isExtendedMarket__c,isAdditionalManaged__c,isBusinessAnalytic__c,isTollFreeNum__c,isE911__c,isWebFax__c,Product_Name__c,SetUp__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,nrc_total__c,Type_of_Billing__c,Term__c,Releted__c  from OpportunityLineItem where OpportunityId =: Id and (Category__c =: 'FAW' AND Sub_Category__c=: 'Add-On') and Releted__c !=: 'child' and SetUp__c !=: 'Setup' and Filter_Product__c =:'Parent' ORDER BY Index__c];
            tollItemList = [Select id,Site__c,Product_Name__c,SetUp__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,nrc_total__c,Type_of_Billing__c,Term__c,Releted__c  from OpportunityLineItem where OpportunityId =: Id and (Category__c =: 'FAW' AND Sub_Category__c=: 'Toll Free Bundle Minutes') and Releted__c !=: 'child' and SetUp__c !=: 'Setup' and Filter_Product__c =:'Parent' ORDER BY Index__c];
            ipPhoneItemList = [Select id,Equipment__c,Site__c,Product_Name__c,SetUp__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,nrc_total__c,Type_of_Billing__c,Term__c,Releted__c  from OpportunityLineItem where OpportunityId =: Id and Category__c =: 'FAW' AND (Sub_Category__c=: 'IP Phones' OR Sub_Category__c=: 'Installation') and Releted__c !=: 'child' and SetUp__c !=: 'Setup' and Filter_Product__c =:'Parent' ORDER BY Index__c];
            accessoriesItemList = [Select id,Equipment__c,Site__c,Product_Name__c,SetUp__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,nrc_total__c,Type_of_Billing__c,Term__c,Releted__c  from OpportunityLineItem where OpportunityId =: Id and Category__c =: 'FAW' AND (Sub_Category__c =: 'Accessories' OR Sub_Category__c =: 'Miscelaneous Materials') and Releted__c !=: 'child' and SetUp__c !=: 'Setup' and Filter_Product__c =:'Parent' ORDER BY Index__c];
            switchesItemList = [Select id,Site__c,Equipment__c,Product_Name__c,SetUp__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,nrc_total__c,Type_of_Billing__c,Term__c,Releted__c  from OpportunityLineItem where OpportunityId =: Id and (Category__c =: 'FAW' AND Sub_Category__c=: 'Switches and PoE') and Releted__c !=: 'child' and SetUp__c !=: 'Setup' and Filter_Product__c =:'Parent' ORDER BY Index__c];
            setUpList = [Select id,Site__c,isEssential__c,isElite__c,isPremier__c,isOutbound__c,isTollFreeNum__c,isE911__c,isWebFax__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,SetUp__c,Quantity,Sub_Total__c,TotalPrice,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,nrc_total__c,Type_of_Billing__c,Term__c,Releted__c  from OpportunityLineItem where OpportunityId =: Id  and SetUp__c =: 'Setup' and Releted__c !=: 'child' and Filter_Product__c =:'Child' ORDER BY Index__c];
            childList = [Select id,Site__c,Product_Name__c,Child__c,ProductCode,SetUp__c,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,nrc_total__c,Type_of_Billing__c,Term__c,Releted__c  from OpportunityLineItem where OpportunityId =: Id and Releted__c =: 'child' and SetUp__c !=: 'Setup' and Filter_Product__c =:'Child'  ORDER BY Index__c];
            MiscellaneousList = [select id,ProductName__c,Quantity__c,Total__c,MrcPrice__c,Opportunity__c,NumberOfSites__c,Type_of_billing__c from Custom_Product__c where Opportunity__c =:Id and Quantity__c != null];
            Prodlst = [Select id,Site__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c,Equipment__c,VENDOR_PRICE_LIST_TO_OFFER__c,GPM__c,DISCOUNT__c,UNITCOST__c  from OpportunityLineItem where OpportunityId =: Id and Category__c =: 'FAW' and Equipment__c =:True ORDER BY Index__c];
            
            
            if(licensesItemList != null && !licensesItemList.isEmpty()){
                for(OpportunityLineItem item:licensesItemList){
                    Integer siteno =  Integer.valueOf(item.Site_Number__c);
                    if(wrapperMap != null && !wrapperMap.isEmpty() && wrapperMap.containsKey(siteno)){
                        decimal mrc = 0.0;
                        decimal nrc = 0.0;
                        decimal tcv = 0.0;
                        Wrapperclass w = new Wrapperclass(tcv,mrc,nrc);
                        w = wrapperMap.get(siteno);
                        if(item.Type_of_Billing__c == 'MRC'){
                            w.mrc = w.mrc + item.TotalPrice;
                        }else{
                            w.nrc = w.nrc + item.TotalPrice;
                        }
                        w.tcv = w.tcv+(mrc*12+nrc);
                        wrapperMap.put(siteno,w);
                        
                    }else{
                        decimal mrc = 0.0;
                        decimal nrc = 0.0;
                        decimal tcv = 0.0;
                        if(item.Type_of_Billing__c == 'MRC'){
                            mrc = mrc + item.TotalPrice;
                        }else{
                            nrc = nrc + item.TotalPrice;
                        }
                        tcv = mrc*12+nrc;
                        Wrapperclass w = new Wrapperclass(tcv,mrc,nrc);
                        wrapperMap.put(siteno, w);
                    }
                    
                    if(item.Type_of_Billing__c == 'MRC'){
                        totmrc = totmrc + item.TotalPrice;
                        mrclic = mrclic + item.TotalPrice;
                    }
                    else{
                        totnrc = totnrc + item.TotalPrice;
                        nrclic = nrclic + item.TotalPrice;
                    }
                    if(licenseMap != null && !licenseMap.isEmpty() && licenseMap.containsKey(siteno)){
                        String val = licenseMap.get(siteno);
                        licenseMap.put(siteno,val);     
                    }
                    else
                    {
                        licenseMap.put(siteno,'test');                        
                    }
                }
                if(lstSite != null && !lstSite.isEmpty()){
                    for(Site__c s: lstSite){
                        Integer siteno =  Integer.valueOf(s.Site_Number__c);
                        
                        if(licenseMap != null && !licenseMap.isEmpty() && licenseMap.containsKey(siteno)){  
                        } else{
                            licenseMap.put(siteno,'false');
                        }
                        
                    }
                }
            }
            if(adOnItemList != null && !adOnItemList.isEmpty()){
                for(OpportunityLineItem item:adOnItemList){
                    Integer siteno =  Integer.valueOf(item.Site_Number__c);
                    if(wrapperMap != null && !wrapperMap.isEmpty() && wrapperMap.containsKey(siteno)){
                        decimal mrc = 0.0;
                        decimal nrc = 0.0;
                        decimal tcv = 0.0;
                        Wrapperclass w = new Wrapperclass(tcv,mrc,nrc);
                        w = wrapperMap.get(siteno);
                        if(item.Type_of_Billing__c == 'MRC'){
                            w.mrc = w.mrc + item.TotalPrice;
                        }else{
                            w.nrc = w.nrc + item.TotalPrice;
                            
                        }
                        w.tcv = w.tcv+(mrc*12+nrc);
                        wrapperMap.put(siteno,w);
                        
                    }else{
                        decimal mrc = 0.0;
                        decimal nrc = 0.0;
                        decimal tcv = 0.0;
                        if(item.Type_of_Billing__c == 'MRC'){
                            mrc = mrc + item.TotalPrice;
                        }else{
                            nrc = nrc + item.TotalPrice;
                        }
                        tcv = mrc*12+nrc;
                        Wrapperclass w = new Wrapperclass(tcv,mrc,nrc);
                        wrapperMap.put(siteno, w);
                    }
                    if(item.Type_of_Billing__c == 'MRC'){
                        totmrc = totmrc + item.TotalPrice;
                        mrcAddon = mrcAddon + item.TotalPrice;
                    }
                    else{
                        totnrc = totnrc + item.TotalPrice;
                        nrcAddon = nrcAddon + item.TotalPrice;
                    }
                    if(AddMap != null && !AddMap.isEmpty() && AddMap.containsKey(siteno)){
                        String val = AddMap.get(siteno);
                        AddMap.put(siteno,val);     
                    }
                    else
                    {
                        AddMap.put(siteno,'test');                        
                    }
                    
                }
                
                for(Site__c s: lstSite){
                    Integer siteno =  Integer.valueOf(s.Site_Number__c);
                    if(AddMap != null && !AddMap.isEmpty() && AddMap.containsKey(siteno)){  
                    } else{
                        AddMap.put(siteno,'false');
                    }
                } 
            }
            if(tollItemList != null && !tollItemList.isEmpty()){
                for(OpportunityLineItem item:tollItemList){
                    Integer siteno =  Integer.valueOf(item.Site_Number__c);
                    if(wrapperMap != null && !wrapperMap.isEmpty() && wrapperMap.containsKey(siteno)){
                        decimal mrc = 0.0;
                        decimal nrc = 0.0;
                        decimal tcv = 0.0;
                        Wrapperclass w = new Wrapperclass(tcv,mrc,nrc);
                        w = wrapperMap.get(siteno);
                        if(item.Type_of_Billing__c == 'MRC'){
                            w.mrc = w.mrc + item.TotalPrice;
                        }else{
                            
                            w.nrc = w.nrc + item.TotalPrice;
                            
                        }
                        w.tcv = w.tcv+(mrc*12+nrc);
                        wrapperMap.put(siteno,w);
                        
                    }else{
                        decimal mrc = 0.0;
                        decimal nrc = 0.0;
                        decimal tcv = 0.0;
                        if(item.Type_of_Billing__c == 'MRC'){
                            mrc = mrc + item.TotalPrice;
                        }else{
                            nrc = nrc + item.TotalPrice;
                        }
                        tcv = mrc*12+nrc;
                        Wrapperclass w = new Wrapperclass(tcv,mrc,nrc);
                        wrapperMap.put(siteno, w);
                    }
                    if(item.Type_of_Billing__c == 'MRC'){
                        totmrc = totmrc + item.TotalPrice;
                        mrcToll = mrcToll + item.TotalPrice;
                    }
                    else{
                        
                        totnrc = totnrc + item.TotalPrice;
                        nrcToll = nrcToll + item.TotalPrice;
                        
                    }
                    
                    if(tollMap != null && !tollMap.isEmpty() && tollMap.containsKey(siteno)){
                        String val = tollMap.get(siteno);
                        tollMap.put(siteno,val);     
                    }
                    else
                    {
                        tollMap.put(siteno,'test');                        
                    }
                    
                }
                
                for(Site__c s: lstSite){
                    Integer siteno =  Integer.valueOf(s.Site_Number__c);
                    if(tollMap != null && !tollMap.isEmpty() && tollMap.containsKey(siteno)){  
                    } else{
                        tollMap.put(siteno,'false');
                    }
                } 
            }
            if(ipPhoneItemList != null && !ipPhoneItemList.isEmpty()){
                for(OpportunityLineItem item:ipPhoneItemList){
                    Integer siteno =  Integer.valueOf(item.Site_Number__c);
                    if(wrapperMap != null && !wrapperMap.isEmpty() && wrapperMap.containsKey(siteno)){
                        decimal mrc = 0.0;
                        decimal nrc = 0.0;
                        decimal tcv = 0.0;
                        Wrapperclass w = new Wrapperclass(tcv,mrc,nrc);
                        w = wrapperMap.get(siteno);
                        if(item.Type_of_Billing__c == 'MRC'){
                            w.mrc = w.mrc + item.TotalPrice;
                        }else{
                            w.nrc = w.nrc + item.TotalPrice;
                        }
                        
                        w.tcv = w.tcv+(mrc*12+nrc);
                        wrapperMap.put(siteno,w);
                        
                    }else{
                        decimal mrc = 0.0;
                        decimal nrc = 0.0;
                        decimal tcv = 0.0;
                        if(item.Type_of_Billing__c == 'MRC'){
                            mrc = mrc + item.TotalPrice;
                        }else{
                            nrc = nrc + item.TotalPrice;
                            
                        }
                        tcv = mrc*12+nrc;
                        Wrapperclass w = new Wrapperclass(tcv,mrc,nrc);
                        wrapperMap.put(siteno, w);
                    }
                    if(item.Type_of_Billing__c == 'MRC'){
                        totmrc = totmrc + item.TotalPrice;
                        mrcIp = mrcIp + item.TotalPrice;
                    }
                    else{
                        totnrc = totnrc + item.TotalPrice;
                        nrcIp = nrcIp + item.TotalPrice;
                        
                    }
                    
                    if(IpMap != null && !IpMap.isEmpty() && IpMap.containsKey(siteno)){
                        String val = IpMap.get(siteno);
                        IpMap.put(siteno,val);     
                    }
                    else
                    {
                        IpMap.put(siteno,'test');                        
                    }
                }
                
                for(Site__c s: lstSite){
                    Integer siteno =  Integer.valueOf(s.Site_Number__c);
                    if(IpMap != null && !IpMap.isEmpty() && IpMap.containsKey(siteno)){  
                        
                        
                    } else{
                        IpMap.put(siteno,'false');
                    }
                }  
            }
            if(accessoriesItemList != null && !accessoriesItemList.isEmpty()){
                for(OpportunityLineItem item:accessoriesItemList){
                    Integer siteno =  Integer.valueOf(item.Site_Number__c);
                    if(wrapperMap != null && !wrapperMap.isEmpty() && wrapperMap.containsKey(siteno)){
                        decimal mrc = 0.0;
                        decimal nrc = 0.0;
                        decimal tcv = 0.0;
                        Wrapperclass w = new Wrapperclass(tcv,mrc,nrc);
                        w = wrapperMap.get(siteno);
                        if(item.Type_of_Billing__c == 'MRC'){
                            w.mrc = w.mrc + item.TotalPrice;
                        }else{
                            w.nrc = w.nrc + item.TotalPrice;
                        }
                        
                        w.tcv = w.tcv+(mrc*12+nrc);
                        wrapperMap.put(siteno,w);
                        
                    }else{
                        decimal mrc = 0.0;
                        decimal nrc = 0.0;
                        decimal tcv = 0.0;
                        if(item.Type_of_Billing__c == 'MRC'){
                            mrc = mrc + item.TotalPrice;
                        }else{
                            nrc = nrc + item.TotalPrice;
                        }
                        tcv = mrc*12+nrc;
                        Wrapperclass w = new Wrapperclass(tcv,mrc,nrc);
                        wrapperMap.put(siteno, w);
                    }
                    if(item.Type_of_Billing__c == 'MRC'){
                        totmrc = totmrc + item.TotalPrice;
                        mrcAccess = mrcAccess + item.TotalPrice;
                    }
                    else{
                        totnrc = totnrc + item.TotalPrice;
                        nrcAccess = nrcAccess + item.TotalPrice;
                    }
                    if(AccMap != null && !AccMap.isEmpty() && AccMap.containsKey(siteno)){
                        String val = AccMap.get(siteno);
                        AccMap.put(siteno,val);     
                    }
                    else
                    {
                        AccMap.put(siteno,'test');                        
                    }
                    
                }
                
                for(Site__c s: lstSite){
                    Integer siteno =  Integer.valueOf(s.Site_Number__c);
                    if(AccMap != null && !AccMap.isEmpty() && AccMap.containsKey(siteno)){  
                        
                        
                    } else{
                        AccMap.put(siteno,'false');
                    }
                }  
            }
            if(switchesItemList != null && !switchesItemList.isEmpty()){
                for(OpportunityLineItem item:switchesItemList){
                    Integer siteno =  Integer.valueOf(item.Site_Number__c);
                    if(wrapperMap != null && !wrapperMap.isEmpty() && wrapperMap.containsKey(siteno)){
                        decimal mrc = 0.0;
                        decimal nrc = 0.0;
                        decimal tcv = 0.0;
                        Wrapperclass w = new Wrapperclass(tcv,mrc,nrc);
                        w = wrapperMap.get(siteno);
                        if(item.Type_of_Billing__c == 'MRC'){
                            w.mrc = w.mrc + item.TotalPrice;
                        }else{
                            w.nrc = w.nrc + item.TotalPrice;
                        }
                        
                        w.tcv = w.tcv+(mrc*12+nrc);
                        wrapperMap.put(siteno,w);
                        
                    }else{
                        decimal mrc = 0.0;
                        decimal nrc = 0.0;
                        decimal tcv = 0.0;
                        if(item.Type_of_Billing__c == 'MRC'){
                            mrc = mrc + item.TotalPrice;
                        }else{
                            nrc = nrc + item.TotalPrice;
                        }
                        tcv = mrc*12+nrc;
                        Wrapperclass w = new Wrapperclass(tcv,mrc,nrc);
                        wrapperMap.put(siteno, w);
                    }
                    if(item.Type_of_Billing__c == 'MRC'){
                        totmrc = totmrc + item.TotalPrice;
                        mrcSwitch = mrcSwitch + item.TotalPrice;
                    }
                    else{
                        totnrc = totnrc + item.TotalPrice;
                        nrcSwitch = nrcSwitch + item.TotalPrice;
                    }
                    if(switchesMap != null && !switchesMap.isEmpty() && switchesMap.containsKey(siteno)){
                        String val = switchesMap.get(siteno);
                        switchesMap.put(siteno,val);     
                    }
                    else
                    {
                        switchesMap.put(siteno,'test');                        
                    }
                    
                }
                
                for(Site__c s: lstSite){
                    Integer siteno =  Integer.valueOf(s.Site_Number__c);
                    if(switchesMap != null && !switchesMap.isEmpty() && switchesMap.containsKey(siteno)){  
                        
                    } else{
                        switchesMap.put(siteno,'false');
                    }
                }   
            }
            
            if(setUpList != null && !setUpList.isEmpty()){
                for(OpportunityLineItem item:setUpList){
                    Integer siteno =  Integer.valueOf(item.Site_Number__c);
                    if(wrapperMap != null && !wrapperMap.isEmpty() && wrapperMap.containsKey(siteno)){
                        decimal mrc = 0.0;
                        decimal nrc = 0.0;
                        decimal tcv = 0.0;
                        Wrapperclass w = new Wrapperclass(tcv,mrc,nrc);
                        w = wrapperMap.get(siteno);
                        w.nrc = w.nrc + item.TotalPrice;
                        w.tcv = w.tcv+(w.mrc*12+w.nrc);
                        wrapperMap.put(siteno,w);
                        
                    }else{
                        decimal mrc = 0.0;
                        decimal nrc = 0.0;
                        decimal tcv = 0.0;
                        
                        nrc = nrc + item.TotalPrice;
                        tcv = mrc*12+nrc;
                        Wrapperclass w = new Wrapperclass(tcv,mrc,nrc);
                        wrapperMap.put(siteno, w);
                        
                    }
                    
                    totnrc = totnrc + item.TotalPrice;
                    nrcActivation = nrcActivation + item.TotalPrice;
                    
                    if(ActivationSite != null && !ActivationSite.isEmpty() && ActivationSite.containsKey(siteno)){
                        decimal total =   ActivationSite.get(siteno);
                        ActivationSite.put(siteno,total+item.TotalPrice);
                    }
                    else{
                        ActivationSite.put(siteno,item.TotalPrice);
                    }
                    
                    if(setupMap != null && !setupMap.isEmpty() && setupMap.containsKey(siteno)){
                        String val = setupMap.get(siteno);
                        setupMap.put(siteno,val);     
                    }
                    else
                    {
                        setupMap.put(siteno,'test');                        
                    }
                    
                }
                
                for(Site__c s: lstSite){
                    Integer siteno =  Integer.valueOf(s.Site_Number__c);
                    if(setupMap != null && !setupMap.isEmpty() && setupMap.containsKey(siteno)){  
                        
                    } else{
                        setupMap.put(siteno,'false');
                    }
                    
                    if(ActivationSite != null && !ActivationSite.isEmpty() && ActivationSite.containsKey(siteno)){
                        
                    }else{
                        decimal tot = 0.0;
                        ActivationSite.put(siteno,tot);
                        
                    }
                } 
            }
            
            if(childList != null && !childList.isEmpty()){
                for(OpportunityLineItem item : childList){
                    Integer siteno =  Integer.valueOf(item.Site_Number__c);
                    if(wrapperMap != null && !wrapperMap.isEmpty() && wrapperMap.containsKey(siteno)){
                        decimal mrc = 0.0;
                        decimal nrc = 0.0;
                        decimal tcv = 0.0;
                        Wrapperclass w = new Wrapperclass(tcv,mrc,nrc);
                        w = wrapperMap.get(siteno);
                        if(item.Sub_Category__c == 'Material Installation'){
                            w.nrc = w.nrc + item.TotalPrice;
                        }
                        else if(item.Sub_Category__c == 'Warranty'){
                            w.nrc = w.nrc + item.TotalPrice;
                        } 
                        else if(item.Sub_Category__c == 'Post Warranty Maintenance'){
                            
                            w.nrc = w.nrc + item.TotalPrice;
                        }
                        else{}
                        
                        w.tcv = w.tcv+(w.mrc*12+w.nrc);
                        wrapperMap.put(siteno,w);
                        
                    }else{
                        decimal mrc = 0.0;
                        decimal nrc = 0.0;
                        decimal tcv = 0.0;
                        if(item.Sub_Category__c == 'Material Installation'){
                            nrc = nrc + item.TotalPrice;
                            
                        }
                        else if(item.Sub_Category__c == 'Warranty'){
                            nrc = nrc + item.TotalPrice;
                        } 
                        else if(item.Sub_Category__c == 'Post Warranty Maintenance'){
                            
                            nrc = nrc + item.TotalPrice;
                        }
                        else{
                            
                        }
                        tcv = mrc*12+nrc;
                        Wrapperclass w = new Wrapperclass(tcv,mrc,nrc);
                        wrapperMap.put(siteno, w);
                    }
                    
                    if(item.Sub_Category__c == 'Material Installation'){
                        
                        totnrc = totnrc + item.TotalPrice;
                        nrcInstall = nrcInstall + item.TotalPrice;
                    }
                    if(item.Sub_Category__c == 'Warranty' || item.Sub_Category__c == 'Post Warranty Maintenance'){
                        totnrc = totnrc + item.TotalPrice;
                        ncWarranty = ncWarranty + item.TotalPrice;
                        // installationQty = installationQty + item.Quantity;
                    } 
                    
                    if( item.Sub_Category__c == 'Post Warranty Maintenance'){
                        totnrc = totnrc + item.TotalPrice;
                        postWarranty = postWarranty + item.TotalPrice ;
                        postWarrantyQty = postWarrantyQty + item.Quantity;
                        
                    }
                    
                    if(InstallationSite != null && !InstallationSite.isEmpty() && InstallationSite.containsKey(siteno)){
                        
                        decimal total =   InstallationSite.get(siteno);
                        if(item.Sub_Category__c == 'Material Installation' || item.Sub_Category__c == 'Warranty' || item.Sub_Category__c == 'Post Warranty Maintenance'){
                            InstallationSite.put(siteno,total+item.TotalPrice);
                        }
                        else{
                            
                        }
                    }
                    else{
                        if(item.Sub_Category__c == 'Material Installation' || item.Sub_Category__c == 'Warranty' || item.Sub_Category__c == 'Post Warranty Maintenance'){
                            InstallationSite.put(siteno,item.TotalPrice);
                        }
                        else{
                            
                        }
                    }
                    
                    if(WarrantySite != null && !WarrantySite.isEmpty() && WarrantySite.containsKey(siteno)){
                        decimal total =   WarrantySite.get(siteno);
                        if(item.Sub_Category__c == 'Warranty' || item.Sub_Category__c == 'Post Warranty Maintenance'){
                            WarrantySite.put(siteno,total+item.TotalPrice);
                        }
                        else{
                            
                        }
                    }else{
                        if(item.Sub_Category__c == 'Warranty' || item.Sub_Category__c == 'Post Warranty Maintenance'){
                            WarrantySite.put(siteno,item.TotalPrice);
                        }
                        else{
                            
                        } 
                    }
                    
                    if(childMap != null && !childMap.isEmpty() && childMap.containsKey(siteno)){
                        String val = childMap.get(siteno);
                        childMap.put(siteno,val);     
                    }
                    else
                    {
                        childMap.put(siteno,'test');                        
                    }
                }
                
                for(Site__c s: lstSite){
                    Integer siteno =  Integer.valueOf(s.Site_Number__c);
                    if(childMap != null && !childMap.isEmpty() && childMap.containsKey(siteno)){  
                        
                        
                    } else{
                        childMap.put(siteno,'false');
                    }
                    if(InstallationSite != null && !InstallationSite.isEmpty() && InstallationSite.containsKey(siteno)){
                        
                    }else{
                        decimal tot = 0.0;
                        InstallationSite.put(siteno,tot);
                        
                    }
                } 
            } 
            
            
            if(MiscellaneousList != null  && !MiscellaneousList.isEmpty()){
                for(Custom_Product__c item : MiscellaneousList){
                    Integer siteno =  Integer.valueOf(item.NumberOfSites__c);
                    
                    if(item.Type_of_billing__c == 'MRC'){
                        mrcOther = mrcOther + item.Total__c;
                    }else{
                        nrcOther  = nrcOther + item.Total__c;
                    }
                    
                    
                    if(otherMap != null && !otherMap.isEmpty() && otherMap.containsKey(siteno)){
                        String val = otherMap.get(siteno);
                        otherMap.put(siteno,val);     
                    }
                    else
                    {
                        otherMap.put(siteno,'test');                        
                    }
                    
                }
                if(lstSite != null && !lstSite.isEmpty()){
                    for(Site__c s: lstSite){
                        if(s.Site_Number__c != null){
                            Integer siteno =  Integer.valueOf(s.Site_Number__c);
                            if(otherMap != null && !otherMap.isEmpty() && otherMap.containsKey(siteno)){  
                                
                                
                            } else{
                                otherMap.put(siteno,'false');
                            }
                        }
                    } 
                }
            }
            if(opp.Contract_Term_Years__c != null) {
                tottcv = tottcv+(totmrc*12*opp.Contract_Term_Years__c+totnrc);
            }
           
            mrcTotal = mrclic + mrcIp + mrcAddon + mrcToll + mrcSwitch + mrcAccess + mrcActivation + mrcInstall ;
            nrcTotal = nrclic + nrcIp + nrcAddon + nrcToll + nrcSwitch + nrcAccess + nrcActivation + nrcInstall + ncWarranty;
        }
    }
    
    public void updateOpp(){
        if(Id != null){
            
        }
    }
    
    // save method
      public PageReference save() {
        system.debug('==clikOnSave==0'+Id);
        system.debug('===scheduleId===0'+scheduleId);
        system.debug('==oppId*************testhgcjkjhvjlhgkj=========='+Id);
        system.debug('==URL Id ==='+ApexPages.currentPage().getParameters().get('id'));
        OpportunityId = ApexPages.currentPage().getParameters().get('id');
        PageReference pageRef = Page.ContractPdf;
        pageRef.getParameters().put('scheduleId','scheduleId');
        pageRef.getParameters().put('todayDate','todayDate');
        pageRef.getParameters().put('addFrontierInfo','addFrontierInfo');
        pageRef.getParameters().put('addSiteInfo','addFrontierInfo');
        pageRef.getParameters().put('Id',OpportunityId);
        //pageRef.getParameters().put('oppId',Id);
        return pageRef ;
    }
    
   
    
    
    
    // 
    // Contract pdf
    public void attachDocument(){
        childIpPhoneList = [Select id,Site__c,isEssential__c,isElite__c,isPremier__c,isOutbound__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c  from OpportunityLineItem where OpportunityId =: Id and (Category__c =: 'FAW' AND Sub_Category__c=: 'IP Phones')  and Releted__c =: 'child' and SetUp__c !=: 'Setup'and Filter_Product__c =:'Child' ORDER BY Index__c];
        childAccessoriesList = [Select id,Site__c,isEssential__c,isElite__c,isPremier__c,isOutbound__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c  from OpportunityLineItem where OpportunityId =: Id and (Category__c =: 'FAW' AND Sub_Category__c=: 'Accessories')  and Releted__c =: 'child' and SetUp__c !=: 'Setup'and Filter_Product__c =:'Child' ORDER BY Index__c];
        childSwitchPoeList = [Select id,Site__c,isEssential__c,isElite__c,isPremier__c,isOutbound__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c  from OpportunityLineItem where OpportunityId =: Id and (Category__c =: 'FAW' AND Sub_Category__c=: 'Switches and PoE')  and Releted__c =: 'child' and SetUp__c !=: 'Setup'and Filter_Product__c =:'Child' ORDER BY Index__c];
        childMiscellaneousList = [Select id,Site__c,isEssential__c,isElite__c,isPremier__c,isOutbound__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c  from OpportunityLineItem where OpportunityId =: Id and (Category__c =: 'FAW' AND Sub_Category__c=: 'Miscelaneous Materials')  and Releted__c =: 'child' and SetUp__c !=: 'Setup'and Filter_Product__c =:'Child' ORDER BY Index__c];
        licensesItemList1 = [Select id,Site__c,isEssential__c,isElite__c,isPremier__c,isOutbound__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c  from OpportunityLineItem where OpportunityId =: Id and (Category__c =: 'FAW' AND Sub_Category__c=: 'Licenses')  and Releted__c !=: 'child' and SetUp__c !=: 'Setup'and Filter_Product__c =:'Parent' ORDER BY Index__c];
        licensesItemList2 = [Select id,Site__c,isEssential__c,isElite__c,isPremier__c,isOutbound__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c  from OpportunityLineItem where OpportunityId =: Id and (Category__c =: 'FAW' AND Sub_Category__c=: 'Licenses')  and Releted__c !=: 'child' and SetUp__c !=: 'Setup'and Filter_Product__c =:'Parent' ORDER BY Index__c];
        adOnItemList1 = [Select id,Site__c,isAdditionalDID__c,isCallerId__c,isAdditionalDirectory__c,isExtendedMarket__c,isAdditionalManaged__c,isBusinessAnalytic__c,isTollFreeNum__c,isE911__c,isWebFax__c,Product_Name__c,SetUp__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,nrc_total__c,Type_of_Billing__c,Term__c,Releted__c  from OpportunityLineItem where OpportunityId =: Id and (Category__c =: 'FAW' AND Sub_Category__c=: 'Add-On') and Releted__c !=: 'child' and SetUp__c !=: 'Setup' and Filter_Product__c =:'Parent' ORDER BY Index__c];
        adOnItemList2 = [Select id,Site__c,isAdditionalDID__c,isCallerId__c,isAdditionalDirectory__c,isExtendedMarket__c,isAdditionalManaged__c,isBusinessAnalytic__c,isTollFreeNum__c,isE911__c,isWebFax__c,Product_Name__c,SetUp__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,nrc_total__c,Type_of_Billing__c,Term__c,Releted__c  from OpportunityLineItem where OpportunityId =: Id and (Category__c =: 'FAW' AND Sub_Category__c=: 'Add-On') and Releted__c !=: 'child' and SetUp__c !=: 'Setup' and Filter_Product__c =:'Parent' ORDER BY Index__c];
        tollItemList1 = [Select id,Site__c,Product_Name__c,SetUp__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,nrc_total__c,Type_of_Billing__c,Term__c,Releted__c  from OpportunityLineItem where OpportunityId =: Id and (Category__c =: 'FAW' AND Sub_Category__c=: 'Toll Free Bundle Minutes') and Releted__c !=: 'child' and SetUp__c !=: 'Setup' and Filter_Product__c =:'Parent' ORDER BY Index__c];
        tollItemList2 = [Select id,Site__c,Product_Name__c,SetUp__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,nrc_total__c,Type_of_Billing__c,Term__c,Releted__c  from OpportunityLineItem where OpportunityId =: Id and (Category__c =: 'FAW' AND Sub_Category__c=: 'Toll Free Bundle Minutes') and Releted__c !=: 'child' and SetUp__c !=: 'Setup' and Filter_Product__c =:'Parent' ORDER BY Index__c];
        ipPhoneItemList1 = [Select id,Equipment__c,Site__c,Product_Name__c,SetUp__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c  from OpportunityLineItem where OpportunityId =: Id and Category__c =: 'FAW' AND (Sub_Category__c=: 'IP Phones' OR Sub_Category__c=: 'Installation') and Releted__c !=: 'child' and SetUp__c !=: 'Setup' and Filter_Product__c =:'Parent' ORDER BY Index__c];
        accessoriesItemList1 = [Select id,Equipment__c,Site__c,Product_Name__c,SetUp__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c  from OpportunityLineItem where OpportunityId =: Id and (Category__c =: 'FAW' AND Sub_Category__c=: 'Accessories') and Releted__c !=: 'child' and SetUp__c !=: 'Setup' and Filter_Product__c =:'Parent' ORDER BY Index__c];
        switchesItemList1 = [Select id,Site__c,Equipment__c,Product_Name__c,SetUp__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c  from OpportunityLineItem where OpportunityId =: Id and (Category__c =: 'FAW' AND Sub_Category__c=: 'Switches and PoE') and Releted__c !=: 'child' and SetUp__c !=: 'Setup' and Filter_Product__c =:'Parent' ORDER BY Index__c];
        setUpList1 = [Select id,Site__c,isAdditionalDID__c,isCallerId__c,isAdditionalDirectory__c,isExtendedMarket__c,isAdditionalManaged__c,isBusinessAnalytic__c,isEssential__c,isElite__c,isPremier__c,isOutbound__c,isTollFreeNum__c,isE911__c,isWebFax__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,SetUp__c,Quantity,Sub_Total__c,TotalPrice,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,nrc_total__c,Type_of_Billing__c,Term__c,Releted__c  from OpportunityLineItem where OpportunityId =: Id  and SetUp__c =: 'Setup' and Releted__c !=: 'child' and Filter_Product__c =:'Child' ORDER BY Index__c];
        childList2 = [Select id,Site__c,Product_Name__c,Child__c,ProductCode,SetUp__c,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,nrc_total__c,Type_of_Billing__c,Term__c,Releted__c  from OpportunityLineItem where OpportunityId =: Id and  Releted__c =: 'child' and SetUp__c !=: 'Setup' and Filter_Product__c =:'Child'  ORDER BY Index__c];
        system.debug('===childList2==' + childList2);
        if(childList2 != null && !childList2.isEmpty()){
            for(OpportunityLineItem item : childList2){
                System.debug('====childList2*******-----'+item);
                if(item.Sub_Category__c == 'Warranty' || item.Sub_Category__c == 'Post Warranty Maintenance'){
                    installationQty = installationQty + item.Quantity;
                }
                if(item.Sub_Category__c == 'Warranty'){
                    warrantyReserveQty = warrantyReserveQty + item.Quantity;
                }
            }
        }
        
        
        map<string,OpportunityLineItem> licMap = new map<string,OpportunityLineItem>();
        set<Id> licId = new set<Id>();
        if(licensesItemList2 != null && !licensesItemList2.isEmpty()){
            for(OpportunityLineItem item : licensesItemList2){
                licId.add(item.Product2Id);
                if(licMap != null && !licMap.isEmpty() && licMap.containsKey(item.Product2Id)){
                    OpportunityLineItem lineProduct =  licMap.get(item.Product2Id);
                    lineProduct.Quantity = lineProduct.Quantity + item.Quantity;
                    licMap.put(item.Product2Id,lineProduct); 
                }
                else{
                    licMap.put(item.Product2Id,item);
                }
            }
        }
        
        if(licId != null && !licId.isEmpty()){
            for(String ids : licId){
                licList.add(licMap.get(ids));
            }
        }  
        
        map<string,OpportunityLineItem> addOnMap = new map<string,OpportunityLineItem>();
        set<Id> addOnId = new set<Id>();
        if(adOnItemList2 != null && !adOnItemList2.isEmpty()){
            for(OpportunityLineItem item : adOnItemList2){
                addOnId.add(item.Product2Id);
                if(addOnMap != null && !addOnMap.isEmpty() && addOnMap.containsKey(item.Product2Id)){
                    OpportunityLineItem lineProduct =  addOnMap.get(item.Product2Id);
                    lineProduct.Quantity = lineProduct.Quantity + item.Quantity;
                    addOnMap.put(item.Product2Id,lineProduct); 
                }
                else{
                    addOnMap.put(item.Product2Id,item);
                }
            }
        }
        
        if(addOnId != null && !addOnId.isEmpty()){
            for(String ids : addOnId){
                addOnList.add(addOnMap.get(ids));
            }
        }         
        
        map<string,OpportunityLineItem> tollFreeMap = new map<string,OpportunityLineItem>();
        set<Id> tollFreeId = new set<Id>();
        if(tollItemList2 != null && !tollItemList2.isEmpty()){
            for(OpportunityLineItem item : tollItemList2){
                tollFreeId.add(item.Product2Id);
                if(tollFreeMap != null && !tollFreeMap.isEmpty() && tollFreeMap.containsKey(item.Product2Id)){
                    OpportunityLineItem lineProduct =  tollFreeMap.get(item.Product2Id);
                    lineProduct.Quantity = lineProduct.Quantity + item.Quantity;
                    tollFreeMap.put(item.Product2Id,lineProduct); 
                }
                else{
                    tollFreeMap.put(item.Product2Id,item);
                }
            }
        }
        
        if(tollFreeId != null && !tollFreeId.isEmpty()){
            for(String ids : tollFreeId){
                tollFreeList.add(tollFreeMap.get(ids));
            }
        }         
        map<string,OpportunityLineItem> ipPhonesMaps = new map<string,OpportunityLineItem>();
        set<Id> ipPhoneId = new set<Id>();
        if(childIpPhoneList != null && !childIpPhoneList.isEmpty()){
            for(OpportunityLineItem item : childIpPhoneList){
                ipPhoneId.add(item.Product2Id);
                if(ipPhonesMaps != null && !ipPhonesMaps.isEmpty() && ipPhonesMaps.containsKey(item.Product2Id)){
                    OpportunityLineItem lineProduct =  ipPhonesMaps.get(item.Product2Id);
                    lineProduct.Quantity = lineProduct.Quantity + item.Quantity;
                    ipPhonesMaps.put(item.Product2Id,lineProduct); 
                }
                else{
                    ipPhonesMaps.put(item.Product2Id,item);
                }
            }
        }
        
        if(ipPhoneId != null && !ipPhoneId.isEmpty()){
            for(String ids : ipPhoneId){
                ipPhoneList.add(ipPhonesMaps.get(ids));
            }
        }         
        map<string,OpportunityLineItem> accessoriesMap = new map<string,OpportunityLineItem>();
        set<Id> accessoriesId = new set<Id>();
        if(childAccessoriesList != null && !childAccessoriesList.isEmpty()){
            for(OpportunityLineItem item : childAccessoriesList){
                accessoriesId.add(item.Product2Id);
                if(accessoriesMap != null && !accessoriesMap.isEmpty() && accessoriesMap.containsKey(item.Product2Id)){
                    OpportunityLineItem lineProduct =  accessoriesMap.get(item.Product2Id);
                    lineProduct.Quantity = lineProduct.Quantity + item.Quantity;
                    accessoriesMap.put(item.Product2Id,lineProduct); 
                }
                else{
                    accessoriesMap.put(item.Product2Id,item);
                }
            }
        }
        
        if(accessoriesId != null && !accessoriesId.isEmpty()){
            for(String ids : accessoriesId){
                accessoriesList.add(accessoriesMap.get(ids));
            }
        }   
        map<string,OpportunityLineItem> switchesPoeMap = new map<string,OpportunityLineItem>();
        set<Id> switchesPoeId = new set<Id>();
        if(childSwitchPoeList != null && !childSwitchPoeList.isEmpty()){
            for(OpportunityLineItem item : childSwitchPoeList){
                switchesPoeId.add(item.Product2Id);
                if(switchesPoeMap != null && !switchesPoeMap.isEmpty() && switchesPoeMap.containsKey(item.Product2Id)){
                    OpportunityLineItem lineProduct =  switchesPoeMap.get(item.Product2Id);
                    lineProduct.Quantity = lineProduct.Quantity + item.Quantity;
                    switchesPoeMap.put(item.Product2Id,lineProduct); 
                }
                else{
                    switchesPoeMap.put(item.Product2Id,item);
                }
            }
        }
        
        if(switchesPoeId != null && !switchesPoeId.isEmpty()){
            for(String ids : switchesPoeId){
                switchesPoeList.add(switchesPoeMap.get(ids));
            }
        }        
        
        map<string,OpportunityLineItem> miscellaneousMap = new map<string,OpportunityLineItem>();
        set<Id> miscellaneousId = new set<Id>();
        if(childMiscellaneousList != null && !childMiscellaneousList.isEmpty()){
            for(OpportunityLineItem item : childMiscellaneousList){
                miscellaneousId.add(item.Product2Id);
                if(miscellaneousMap != null && !miscellaneousMap.isEmpty() && miscellaneousMap.containsKey(item.Product2Id)){
                    OpportunityLineItem lineProduct =  miscellaneousMap.get(item.Product2Id);
                    lineProduct.Quantity = lineProduct.Quantity + item.Quantity;
                    miscellaneousMap.put(item.Product2Id,lineProduct); 
                }
                else{
                    miscellaneousMap.put(item.Product2Id,item);
                }
            }
        }
        
        if(miscellaneousId != null && !miscellaneousId.isEmpty()){
            for(String ids : miscellaneousId){
                miscellaneousChildList.add(miscellaneousMap.get(ids));
            }
        }    
        
        
        
        
        
        /* if(licensesItemList2 != null && !licensesItemList2.isEmpty()){
for(OpportunityLineItem item:licensesItemList2){
System.debug('====licensesItemList2*******-----'+item);
if(item.Type_of_Billing__c == 'MRC'){
if(parentLicense != null && parentLicense.Quantity != null && item.Quantity != null && parentLicense.TotalPrice  != null){
System.debug('====mrc qty if ==='+item.Quantity);
parentLicense.Quantity = parentLicense.Quantity + item.Quantity;
System.debug('====parentLicense.Quantity ==='+parentLicense.Quantity);
parentLicense.TotalPrice = parentLicense.TotalPrice + item.TotalPrice;
}else{
System.debug('====mrc qty else ==='+item.Quantity);
parentLicense =  item; 

}  
}  
else{
if(parentLicense != null && parentLicense.Quantity != null && item.Quantity != null && parentLicense.TotalPrice != null){
parentLicense.Quantity = parentLicense.Quantity + item.Quantity;
parentLicense.TotalPrice = parentLicense.TotalPrice + item.TotalPrice;
}else{
parentLicense =  item; 
} 
}
}
}
System.debug('====parentLicense out if *******-----'+parentLicense.Quantity);
if(adOnItemList2 != null && !adOnItemList2.isEmpty()){
for(OpportunityLineItem item:adOnItemList2){
System.debug('====adOnItemList2*******-----'+item);
if(item.Type_of_Billing__c == 'MRC'){
if(parentAddOn != null && parentAddOn.Quantity != null && item.Quantity != null && parentAddOn.TotalPrice  != null){
System.debug('====mrc qty ==='+eliteOppmrc);
parentAddOn.Quantity = parentAddOn.Quantity + item.Quantity;
parentAddOn.TotalPrice = parentAddOn.TotalPrice + item.TotalPrice;
}else{
parentAddOn =  item; 

}  
}  
else{
if(parentAddOn != null && parentAddOn.Quantity != null && item.Quantity != null && parentAddOn.TotalPrice != null){
parentAddOn.Quantity = parentAddOn.Quantity + item.Quantity;
parentAddOn.TotalPrice = parentAddOn.TotalPrice + item.TotalPrice;
}else{
parentAddOn =  item; 
} 
}
}
}
System.debug('====parentAddOn*******-----'+parentAddOn.Quantity);

if(tollItemList2 != null && !tollItemList2.isEmpty()){
for(OpportunityLineItem item:tollItemList2){
System.debug('====tollItemList2*******-----'+item);
if(item.Type_of_Billing__c == 'MRC'){
if(parentTollFree != null && parentTollFree.Quantity != null && item.Quantity != null && parentTollFree.TotalPrice  != null){
System.debug('====mrc qty ==='+eliteOppmrc);
parentTollFree.Quantity = parentTollFree.Quantity + item.Quantity;
parentTollFree.TotalPrice = parentTollFree.TotalPrice + item.TotalPrice;
}else{
parentTollFree =  item; 

}  
}  
else{
if(parentTollFree != null && parentTollFree.Quantity != null && item.Quantity != null && parentTollFree.TotalPrice != null){
parentTollFree.Quantity = parentTollFree.Quantity + item.Quantity;
parentTollFree.TotalPrice = parentTollFree.TotalPrice + item.TotalPrice;
}else{
parentTollFree =  item; 
} 
}
}
}
System.debug('====parentTollFree*******-----'+parentTollFree.Quantity);
if(childIpPhoneList != null && !childIpPhoneList.isEmpty()){
for(OpportunityLineItem item:childIpPhoneList){
System.debug('====lic*******-----'+item);
if(item.Type_of_Billing__c == 'MRC'){
if(childIpPhone != null && childIpPhone.Quantity != null && item.Quantity != null && childIpPhone.TotalPrice  != null){
System.debug('====mrc qty ==='+childIpPhone);
childIpPhone.Quantity = childIpPhone.Quantity + item.Quantity;
childIpPhone.TotalPrice = childIpPhone.TotalPrice + item.TotalPrice;
}else{
childIpPhone =  item; 

}  
}  
else{
if(childIpPhone != null && childIpPhone.Quantity != null && item.Quantity != null && childIpPhone.TotalPrice != null){
childIpPhone.Quantity = childIpPhone.Quantity + item.Quantity;
childIpPhone.TotalPrice = childIpPhone.TotalPrice + item.TotalPrice;
}else{
childIpPhone =  item; 
} 
}
}
}
System.debug('====childIpPhone*******-----'+childIpPhone.Quantity);
if(childAccessoriesList != null && !childAccessoriesList.isEmpty()){
for(OpportunityLineItem item:childAccessoriesList){
System.debug('====lic*******-----'+item);
if(item.Type_of_Billing__c == 'MRC'){
if(childAccessories != null && childAccessories.Quantity != null && item.Quantity != null && childAccessories.TotalPrice  != null){
System.debug('====mrc qty ==='+childAccessories);
childAccessories.Quantity = childAccessories.Quantity + item.Quantity;
childAccessories.TotalPrice = childAccessories.TotalPrice + item.TotalPrice;
}else{
childAccessories =  item; 

}  
}  
else{
if(childAccessories != null && childAccessories.Quantity != null && item.Quantity != null && childAccessories.TotalPrice != null){
childAccessories.Quantity = childAccessories.Quantity + item.Quantity;
childAccessories.TotalPrice = childAccessories.TotalPrice + item.TotalPrice;
}else{
childAccessories =  item; 
} 
}
}
}
if(childSwitchPoeList != null && !childSwitchPoeList.isEmpty()){
for(OpportunityLineItem item:childSwitchPoeList){
System.debug('====lic*******-----'+item);
if(item.Type_of_Billing__c == 'MRC'){
if(childSwitchPoe != null && childSwitchPoe.Quantity != null && item.Quantity != null && childSwitchPoe.TotalPrice  != null){
System.debug('====mrc qty ==='+childSwitchPoe);
childSwitchPoe.Quantity = childSwitchPoe.Quantity + item.Quantity;
childSwitchPoe.TotalPrice = childSwitchPoe.TotalPrice + item.TotalPrice;
}else{
childSwitchPoe =  item; 

}  
}  
else{
if(childSwitchPoe != null && childSwitchPoe.Quantity != null && item.Quantity != null && childSwitchPoe.TotalPrice != null){
childSwitchPoe.Quantity = childSwitchPoe.Quantity + item.Quantity;
childSwitchPoe.TotalPrice = childSwitchPoe.TotalPrice + item.TotalPrice;
}else{
childSwitchPoe =  item; 
} 
}
}
}




system.debug('=======parentLicense======='+ parentLicense.TotalPrice);
system.debug('=======parentAddOn======='+ parentAddOn.TotalPrice);
system.debug('=======parentTollFree======='+ parentTollFree.TotalPrice);
if(parentLicense.Quantity != null && parentAddOn.Quantity != null && parentTollFree.Quantity != null){
parentLicAddOnTollFree.Quantity = parentLicense.Quantity + parentAddOn.Quantity + parentTollFree.Quantity;
}
if(parentLicense.TotalPrice != null && parentAddOn.TotalPrice != null && parentTollFree.TotalPrice != null){
parentLicAddOnTollFree.TotalPrice = parentLicense.TotalPrice + parentAddOn.TotalPrice + parentTollFree.TotalPrice;
}
if(childIpPhone.Quantity != null && childAccessories.Quantity != null && childSwitchPoe.Quantity != null){
childIpPhoneAccessoriesSwitchPoe.Quantity = childIpPhone.Quantity + childAccessories.Quantity + childSwitchPoe.Quantity;
}
if(childIpPhone.TotalPrice != null && childAccessories.TotalPrice != null && childSwitchPoe.TotalPrice != null){
childIpPhoneAccessoriesSwitchPoe.TotalPrice = childIpPhone.TotalPrice + childAccessories.TotalPrice + childSwitchPoe.TotalPrice;
}
*/
        
        
        if(licensesItemList1 != null && !licensesItemList1.isEmpty()){
            for(OpportunityLineItem item:licensesItemList1){
                System.debug('====lic*******-----'+item);
                if(item.isElite__c == true){
                    System.debug('====item.isElite__c ==='+item.isElite__c); 
                    if(item.Type_of_Billing__c == 'MRC'){
                        if(eliteOppmrc != null && eliteOppmrc.Quantity != null && item.Quantity != null && eliteOppmrc.TotalPrice  != null){
                            System.debug('====mrc qty ==='+eliteOppmrc);
                            eliteOppmrc.Quantity = eliteOppmrc.Quantity + item.Quantity;
                            eliteOppmrc.TotalPrice = eliteOppmrc.TotalPrice + item.TotalPrice;
                        }else{
                            eliteOppmrc =  item; 
                            
                        }  
                    }  
                    else{
                        if(eliteOppnrc != null && eliteOppnrc.Quantity != null && item.Quantity != null && eliteOppnrc.TotalPrice != null){
                            eliteOppnrc.Quantity = eliteOppnrc.Quantity + item.Quantity;
                            eliteOppnrc.TotalPrice = eliteOppnrc.TotalPrice + item.TotalPrice;
                        }else{
                            eliteOppnrc =  item; 
                        } 
                    }
                }
                
                if(item.isPremier__c == true){
                    if(item.Type_of_Billing__c == 'MRC'){
                        if(premierOppmrc != null && premierOppmrc.Quantity != null && item.Quantity != null && premierOppmrc.TotalPrice != null){
                            premierOppmrc.Quantity = premierOppmrc.Quantity + item.Quantity;
                            premierOppmrc.TotalPrice = premierOppmrc.TotalPrice + item.TotalPrice;
                        }else{
                            premierOppmrc =  item; 
                            
                        }  
                    }  
                    else{
                        if(premierOppnrc != null && premierOppnrc.Quantity != null && item.Quantity != null &&  premierOppnrc.TotalPrice != null){
                            premierOppnrc.Quantity = premierOppnrc.Quantity + item.Quantity;
                            premierOppnrc.TotalPrice = premierOppnrc.TotalPrice + item.TotalPrice;
                        }else{
                            premierOppnrc =  item; 
                        } 
                    }
                }  
                
                if(item.isEssential__c == true){
                    if(item.Type_of_Billing__c == 'MRC'){
                        if(essentialsOppmrc != null && essentialsOppmrc.Quantity != null && item.Quantity != null && essentialsOppmrc.TotalPrice != null){
                            essentialsOppmrc.Quantity = essentialsOppmrc.Quantity + item.Quantity;
                            essentialsOppmrc.TotalPrice = essentialsOppmrc.TotalPrice + item.TotalPrice;
                        }else{
                            essentialsOppmrc =  item; 
                            
                        }  
                    }  
                    else{
                        if(essentialOppnrc != null && essentialOppnrc.Quantity != null && item.Quantity != null && essentialOppnrc.TotalPrice != null) {
                            essentialOppnrc.Quantity = essentialOppnrc.Quantity + item.Quantity;
                            essentialOppnrc.TotalPrice = essentialOppnrc.TotalPrice + item.TotalPrice;
                        }else{
                            essentialOppnrc =  item; 
                        } 
                    }
                }
                
                if(item.isOutbound__c == true){
                    if(item.Type_of_Billing__c == 'MRC'){
                        if(outboundOppmrc != null && outboundOppmrc.Quantity != null && item.Quantity != null && outboundOppmrc.TotalPrice != null){
                            outboundOppmrc.Quantity = outboundOppmrc.Quantity + item.Quantity;
                            outboundOppmrc.TotalPrice = outboundOppmrc.TotalPrice + item.TotalPrice;
                        }else{
                            outboundOppmrc =  item; 
                            
                        }  
                    }  
                    else{
                        if(outboundOppnrc != null && outboundOppnrc.Quantity != null && item.Quantity != null && outboundOppnrc.TotalPrice != null){
                            essentialOppnrc.Quantity = outboundOppnrc.Quantity + item.Quantity;
                            outboundOppnrc.TotalPrice = outboundOppnrc.TotalPrice + item.TotalPrice;
                        }else{
                            outboundOppnrc =  item; 
                        } 
                    }
                }
                
            }
        } 
        if(adOnItemList1 != null && !adOnItemList1.isEmpty()){
            for(OpportunityLineItem item:adOnItemList1){
                if(item.isWebFax__c == true){
                    if(item.Type_of_Billing__c == 'MRC'){
                        if(WebFaxmrc != null && WebFaxmrc.Quantity != null && item.Quantity != null && WebFaxmrc.TotalPrice != null){
                            WebFaxmrc.Quantity = WebFaxmrc.Quantity + item.Quantity;
                            WebFaxmrc.TotalPrice = WebFaxmrc.TotalPrice + item.TotalPrice;
                        }else{
                            WebFaxmrc =  item; 
                            
                        }  
                    }  
                    else{
                        if(WebFaxnrc != null && WebFaxnrc.Quantity != null && item.Quantity !=null &&  WebFaxnrc.TotalPrice != null){
                            WebFaxnrc.Quantity = WebFaxnrc.Quantity + item.Quantity;
                            WebFaxnrc.TotalPrice = WebFaxnrc.TotalPrice + item.TotalPrice;
                        }else{
                            WebFaxnrc =  item; 
                        } 
                    }
                }
                
                
                if(item.isTollFreeNum__c == true){
                    if(item.Type_of_Billing__c == 'MRC'){
                        if(TollFreeNumbermrc != null && TollFreeNumbermrc.Quantity != null && item.Quantity != null && TollFreeNumbermrc.TotalPrice != null){
                            TollFreeNumbermrc.Quantity = TollFreeNumbermrc.Quantity + item.Quantity;
                            TollFreeNumbermrc.TotalPrice = TollFreeNumbermrc.TotalPrice + item.TotalPrice;
                        }else{
                            TollFreeNumbermrc =  item; 
                        }  
                    }  
                    else{
                        if(TollFreeNumbernrc != null && TollFreeNumbernrc.Quantity != null && item.Quantity !=null && TollFreeNumbernrc.TotalPrice != null){
                            TollFreeNumbernrc.Quantity = TollFreeNumbernrc.Quantity + item.Quantity;
                            TollFreeNumbernrc.TotalPrice = TollFreeNumbernrc.TotalPrice + item.TotalPrice;
                        }else{
                            TollFreeNumbernrc =  item; 
                        } 
                    }
                }
                
                if(item.isE911__c == true){
                    if(item.Type_of_Billing__c == 'MRC'){
                        if(E911mrc != null && E911mrc.Quantity != null && item.Quantity != null && E911mrc.TotalPrice != null){
                            E911mrc.Quantity = E911mrc.Quantity + item.Quantity;
                            E911mrc.TotalPrice = E911mrc.TotalPrice + item.TotalPrice;
                        }else{
                            E911mrc =  item; 
                        }  
                    }  
                    else{
                        if(E911nrc != null && E911nrc.Quantity != null && item.Quantity !=null && E911nrc.TotalPrice != null){
                            E911nrc.Quantity = E911nrc.Quantity + item.Quantity;
                            E911nrc.TotalPrice = E911nrc.TotalPrice + item.TotalPrice;
                        }else{
                            E911nrc =  item; 
                        } 
                    }
                }
                if(item.isAdditionalDID__c == true){
                    if(item.Type_of_Billing__c == 'MRC'){
                        if(AdditionalDIDmrc != null && AdditionalDIDmrc.Quantity != null && item.Quantity != null && AdditionalDIDmrc.TotalPrice != null){
                            AdditionalDIDmrc.Quantity = AdditionalDIDmrc.Quantity + item.Quantity;
                            AdditionalDIDmrc.TotalPrice = AdditionalDIDmrc.TotalPrice + item.TotalPrice;
                        }else{
                            AdditionalDIDmrc =  item; 
                        }  
                    }  
                    else{
                        if(AdditionalDIDnrc != null && AdditionalDIDnrc.Quantity != null && item.Quantity !=null && AdditionalDIDnrc.TotalPrice != null){
                            AdditionalDIDnrc.Quantity = AdditionalDIDnrc.Quantity + item.Quantity;
                            AdditionalDIDnrc.TotalPrice = AdditionalDIDnrc.TotalPrice + item.TotalPrice;
                        }else{
                            AdditionalDIDnrc =  item; 
                        } 
                    }
                }
                if(item.isCallerId__c == true){
                    // if(item.Type_of_Billing__c == 'MRC'){
                    if(CallerIdmrc != null && CallerIdmrc.Quantity != null && item.Quantity != null && CallerIdmrc  != null){
                        CallerIdmrc.Quantity = CallerIdmrc.Quantity + item.Quantity;
                        CallerIdmrc.TotalPrice = CallerIdmrc.TotalPrice + item.TotalPrice;
                    }else{
                        CallerIdmrc =  item; 
                        // }  
                    }  
                    /* else{ 
if(CallerIdnrc != null && CallerIdnrc.Quantity != null && item.Quantity !=null && CallerIdnrc.TotalPrice != null){
CallerIdnrc.Quantity = CallerIdnrc.Quantity + item.Quantity;
CallerIdnrc.TotalPrice = CallerIdnrc.TotalPrice + item.TotalPrice;
}else{
CallerIdnrc =  item; 
} 
} */
                }
                if(item.isAdditionalDirectory__c == true){
                    if(item.Type_of_Billing__c == 'MRC'){
                        if(AdditionalDirectorymrc != null && AdditionalDirectorymrc.Quantity != null && item.Quantity != null && AdditionalDirectorymrc.TotalPrice != null){
                            AdditionalDirectorymrc.Quantity = AdditionalDirectorymrc.Quantity + item.Quantity;
                            AdditionalDirectorymrc.TotalPrice = AdditionalDirectorymrc.TotalPrice + item.TotalPrice;
                        }else{
                            AdditionalDirectorymrc =  item; 
                        }  
                    }  
                    else{
                        if(AdditionalDirectorynrc != null && AdditionalDirectorynrc.Quantity != null && item.Quantity !=null && AdditionalDirectorynrc.TotalPrice  != null){
                            AdditionalDirectorynrc.Quantity = AdditionalDirectorynrc.Quantity + item.Quantity;
                            AdditionalDirectorynrc.TotalPrice = AdditionalDirectorynrc.TotalPrice + item.TotalPrice;
                        }else{
                            AdditionalDirectorynrc =  item; 
                        } 
                    }
                }
                if(item.isExtendedMarket__c == true){
                    if(item.Type_of_Billing__c == 'MRC'){
                        if(ExtendedMarketmrc != null && ExtendedMarketmrc.Quantity != null && item.Quantity != null && ExtendedMarketmrc.TotalPrice != null){
                            ExtendedMarketmrc.Quantity = ExtendedMarketmrc.Quantity + item.Quantity;
                            ExtendedMarketmrc.TotalPrice = ExtendedMarketmrc.TotalPrice + item.TotalPrice;
                        }else{
                            ExtendedMarketmrc =  item; 
                        }  
                    }  
                    else{
                        if(ExtendedMarketnrc != null && ExtendedMarketnrc.Quantity != null && item.Quantity !=null &&  ExtendedMarketnrc.TotalPrice != null){
                            ExtendedMarketnrc.Quantity = ExtendedMarketnrc.Quantity + item.Quantity;
                            ExtendedMarketnrc.TotalPrice = ExtendedMarketnrc.TotalPrice + item.TotalPrice;
                        }else{
                            ExtendedMarketnrc =  item; 
                        } 
                    }
                }
                if(item.isAdditionalManaged__c == true){
                    if(item.Type_of_Billing__c == 'MRC'){
                        if(AdditionalManagedmrc != null && AdditionalManagedmrc.Quantity != null && item.Quantity != null && AdditionalManagedmrc.TotalPrice != null){
                            AdditionalManagedmrc.Quantity = AdditionalManagedmrc.Quantity + item.Quantity;
                            AdditionalManagedmrc.TotalPrice = AdditionalManagedmrc.TotalPrice + item.TotalPrice;
                        }else{
                            AdditionalManagedmrc =  item; 
                        }  
                    }  
                    else{
                        if(AdditionalManagednrc != null && AdditionalManagednrc.Quantity != null && item.Quantity !=null && AdditionalManagednrc.TotalPrice != null){
                            AdditionalManagednrc.Quantity = AdditionalManagednrc.Quantity + item.Quantity;
                            AdditionalManagednrc.TotalPrice = AdditionalManagednrc.TotalPrice + item.TotalPrice;
                        }else{
                            AdditionalManagednrc =  item; 
                        } 
                    }
                }
                if(item.isBusinessAnalytic__c == true){
                    if(item.Type_of_Billing__c == 'MRC'){
                        if(BusinessAnalyticmrc != null && BusinessAnalyticmrc.Quantity != null && item.Quantity != null && BusinessAnalyticmrc.TotalPrice != null){
                            BusinessAnalyticmrc.Quantity = BusinessAnalyticmrc.Quantity + item.Quantity;
                            BusinessAnalyticmrc.TotalPrice = BusinessAnalyticmrc.TotalPrice + item.TotalPrice;
                        }else{
                            BusinessAnalyticmrc =  item; 
                        }  
                    }  
                    else{
                        if(BusinessAnalyticnrc != null && BusinessAnalyticnrc.Quantity != null && item.Quantity !=null && BusinessAnalyticnrc.TotalPrice != null){
                            BusinessAnalyticnrc.Quantity = BusinessAnalyticnrc.Quantity + item.Quantity;
                            BusinessAnalyticnrc.TotalPrice = BusinessAnalyticnrc.TotalPrice + item.TotalPrice;
                        }else{
                            BusinessAnalyticnrc =  item; 
                        } 
                    }
                }
            }
        }
        
        
        if(tollItemList1 != null && !tollItemList1.isEmpty()){
            for(OpportunityLineItem item:tollItemList1){
                if(item.Type_of_Billing__c == 'MRC'){
                    if(TollTimemrc != null && TollTimemrc.Quantity != null && item.Quantity != null && TollTimemrc.TotalPrice != null){
                        TollTimemrc.Quantity = TollTimemrc.Quantity + item.Quantity;
                        TollTimemrc.TotalPrice = TollTimemrc.TotalPrice + item.TotalPrice;
                    }
                    else{
                        TollTimemrc = item;
                    }
                }
                else{
                    if(TollTimenrc != null && TollTimenrc.Quantity != null && item.Quantity != null && TollTimenrc.TotalPrice != null){
                        TollTimenrc.Quantity = TollTimenrc.Quantity + item.Quantity;
                        TollTimenrc.TotalPrice = TollTimenrc.TotalPrice + item.TotalPrice;
                    }
                    else{
                        TollTimenrc = item;
                    } 
                }
            }
        }
        
        if(setUpList1 != null && !setUpList1.isEmpty()){
            for(OpportunityLineItem item : setUpList1){
                if(item.isElite__c == true){
                    if(eliteOppnrc != null && eliteOppnrc.Quantity != null && item.Quantity != null && eliteOppnrc.TotalPrice != null){
                        eliteOppnrc.Quantity = eliteOppnrc.Quantity + item.Quantity;
                        eliteOppnrc.TotalPrice = eliteOppnrc.TotalPrice + item.TotalPrice;
                    }else{
                        eliteOppnrc =  item; 
                    } 
                }
                else if(item.isPremier__c == true){
                    if(premierOppnrc != null && premierOppnrc.Quantity != null && item.Quantity != null && premierOppnrc.TotalPrice != null){
                        premierOppnrc.Quantity = premierOppnrc.Quantity + item.Quantity;
                        premierOppnrc.TotalPrice = premierOppnrc.TotalPrice + item.TotalPrice;
                    }else{
                        premierOppnrc =  item; 
                    } 
                    
                }
                else if(item.isEssential__c == true){
                    if(essentialOppnrc != null && essentialOppnrc.Quantity != null && item.Quantity != null && essentialOppnrc.TotalPrice != null){
                        essentialOppnrc.Quantity = essentialOppnrc.Quantity + item.Quantity;
                        essentialOppnrc.TotalPrice = essentialOppnrc.TotalPrice + item.TotalPrice;
                    }else{
                        essentialOppnrc =  item; 
                    } 
                    
                }
                else if(item.isOutbound__c == true){
                    if(outboundOppnrc != null && outboundOppnrc.Quantity != null && item.Quantity != null && outboundOppnrc.TotalPrice != null){
                        essentialOppnrc.Quantity = outboundOppnrc.Quantity + item.Quantity;
                        outboundOppnrc.TotalPrice = outboundOppnrc.TotalPrice + item.TotalPrice;
                    }else{
                        outboundOppnrc =  item; 
                    } 
                }
                else if(item.isWebFax__c == true){
                    if(WebFaxnrc != null && WebFaxnrc.Quantity != null && item.Quantity !=null && WebFaxnrc.TotalPrice != null){
                        WebFaxnrc.Quantity = WebFaxnrc.Quantity + item.Quantity;
                        WebFaxnrc.TotalPrice = WebFaxnrc.TotalPrice + item.TotalPrice;
                    }else{
                        WebFaxnrc =  item; 
                    } 
                }
                else if(item.isTollFreeNum__c == true){
                    if(TollFreeNumbernrc != null && TollFreeNumbernrc.Quantity != null && item.Quantity !=null && TollFreeNumbernrc.TotalPrice != null){
                        TollFreeNumbernrc.Quantity = TollFreeNumbernrc.Quantity + item.Quantity;
                        TollFreeNumbernrc.TotalPrice = TollFreeNumbernrc.TotalPrice + item.TotalPrice;
                    }else{
                        TollFreeNumbernrc =  item; 
                    } 
                }
                else if(item.isE911__c == true){
                    if(E911nrc != null && E911nrc.Quantity != null && item.Quantity !=null && E911nrc.TotalPrice != null){
                        E911nrc.Quantity = E911nrc.Quantity + item.Quantity;
                        E911nrc.TotalPrice = E911nrc.TotalPrice + item.TotalPrice;
                    }else{
                        E911nrc =  item; 
                    } 
                }
                else if(item.isAdditionalDID__c == true){
                    if(AdditionalDIDnrc != null && AdditionalDIDnrc.Quantity != null && item.Quantity !=null && AdditionalDIDnrc.TotalPrice != null){
                        AdditionalDIDnrc.Quantity = AdditionalDIDnrc.Quantity + item.Quantity;
                        AdditionalDIDnrc.TotalPrice = AdditionalDIDnrc.TotalPrice + item.TotalPrice;
                    }else{
                        AdditionalDIDnrc =  item; 
                    } 
                }
                else if(item.isAdditionalDirectory__c == true){
                    if(AdditionalDirectorynrc != null && AdditionalDirectorynrc.Quantity != null && item.Quantity !=null && AdditionalDirectorynrc.TotalPrice != null){
                        AdditionalDirectorynrc.Quantity = AdditionalDirectorynrc.Quantity + item.Quantity;
                        AdditionalDirectorynrc.TotalPrice = AdditionalDirectorynrc.TotalPrice + item.TotalPrice;
                    }else{
                        AdditionalDirectorynrc =  item; 
                    } 
                }
                else if(item.isAdditionalManaged__c == true){
                    if(AdditionalManagednrc != null && AdditionalManagednrc.Quantity != null && item.Quantity !=null &&  AdditionalManagednrc.TotalPrice != null){
                        AdditionalManagednrc.Quantity = AdditionalManagednrc.Quantity + item.Quantity;
                        AdditionalManagednrc.TotalPrice = AdditionalManagednrc.TotalPrice + item.TotalPrice;
                    }else{
                        AdditionalManagednrc =  item; 
                    } 
                }
                else if(item.isBusinessAnalytic__c == true){
                    if(BusinessAnalyticnrc != null && BusinessAnalyticnrc.Quantity != null && item.Quantity !=null && BusinessAnalyticnrc.TotalPrice != null){
                        BusinessAnalyticnrc.Quantity = BusinessAnalyticnrc.Quantity + item.Quantity;
                        BusinessAnalyticnrc.TotalPrice = BusinessAnalyticnrc.TotalPrice + item.TotalPrice;
                    }else{
                        BusinessAnalyticnrc =  item; 
                    } 
                }
                else if(item.isCallerId__c == true){
                    if(CallerIdnrc != null && CallerIdnrc.Quantity != null && item.Quantity !=null && CallerIdnrc.TotalPrice != null){
                        CallerIdnrc.Quantity = CallerIdnrc.Quantity + item.Quantity;
                        CallerIdnrc.TotalPrice = CallerIdnrc.TotalPrice + item.TotalPrice;
                    }else{
                        CallerIdnrc =  item; 
                    } 
                    
                }
                else if(item.isExtendedMarket__c == true){
                    if(ExtendedMarketnrc != null && ExtendedMarketnrc.Quantity != null && item.Quantity !=null && ExtendedMarketnrc.TotalPrice != null){
                        ExtendedMarketnrc.Quantity = ExtendedMarketnrc.Quantity + item.Quantity;
                        ExtendedMarketnrc.TotalPrice = ExtendedMarketnrc.TotalPrice + item.TotalPrice;
                    }else{
                        ExtendedMarketnrc =  item; 
                    } 
                    
                }
                else if(item.Sub_Category__c == 'Toll Free Bundle Minutes'){
                    if(TollTimenrc != null && TollTimenrc.Quantity != null && item.Quantity != null && TollTimenrc.TotalPrice != null){
                        TollTimenrc.Quantity = TollTimenrc.Quantity + item.Quantity;
                        TollTimenrc.TotalPrice = TollTimenrc.TotalPrice + item.TotalPrice;
                    }
                    else{
                        TollTimenrc = item;
                    } 
                }
                else{
                    
                }
            }
        }
        Map<String,OpportunityLineItem> IpphoneMap = new Map<String,OpportunityLineItem>();
        set<String> IPprodId = new set<String>();
        if(ipPhoneItemList != null && !ipPhoneItemList.isEmpty()){
            for(OpportunityLineItem item : ipPhoneItemList){
                IPprodId.add(item.Product2Id);
                if(item.Equipment__c){
                    String prodId = item.Product2Id;
                    if(IpphoneMap != null && !IpphoneMap.isEmpty() && IpphoneMap.containsKey(prodId)){
                        OpportunityLineItem lineProduct =  IpphoneMap.get(prodId);
                        lineProduct.Quantity = lineProduct.Quantity + item.Quantity;
                        IpphoneMap.put(prodId,lineProduct); 
                    }else{
                        IpphoneMap.put(prodId,item);
                    }
                }
            }
        }
        if(IPprodId != null && !IPprodId.isEmpty()){
            for(String prodid : IPprodId){
                EquipmentIpPhone.add(IpphoneMap.get(prodid));
            }
        }
        
        Map<String,OpportunityLineItem> SwitchMap = new Map<String,OpportunityLineItem>();
        set<String> SwitchprodId = new set<String>();
        if(switchesItemList != null && !switchesItemList.isEmpty()){
            for(OpportunityLineItem item : switchesItemList){
                SwitchprodId.add(item.Product2Id);
                if(item.Equipment__c){
                    String prodId = item.Product2Id;
                    if(SwitchMap != null && !SwitchMap.isEmpty() && SwitchMap.containsKey(prodId)){
                        OpportunityLineItem lineProduct =  SwitchMap.get(prodId);
                        lineProduct.Quantity = lineProduct.Quantity + item.Quantity;
                        SwitchMap.put(prodId,lineProduct); 
                    }else{
                        SwitchMap.put(prodId,item);
                    }
                }
            }
        }
        if(SwitchprodId != null && !SwitchprodId.isEmpty()){
            for(String prodid : SwitchprodId){
                EquipmentSwitch.add(SwitchMap.get(prodid));
            }
        }
        
        Map<String,OpportunityLineItem> AccessroiesMap = new Map<String,OpportunityLineItem>();
        set<String> AccessroiesprodId = new set<String>();
        if(accessoriesItemList != null && !accessoriesItemList.isEmpty()){
            for(OpportunityLineItem item : accessoriesItemList){
                AccessroiesprodId.add(item.Product2Id);
                if(item.Equipment__c){
                    String prodId = item.Product2Id;
                    if(AccessroiesMap != null && !AccessroiesMap.isEmpty() && AccessroiesMap.containsKey(prodId)){
                        OpportunityLineItem lineProduct =  AccessroiesMap.get(prodId);
                        lineProduct.Quantity = lineProduct.Quantity + item.Quantity;
                        AccessroiesMap.put(prodId,lineProduct); 
                    }else{
                        AccessroiesMap.put(prodId,item);
                    }
                }
            }
        }
        if(AccessroiesprodId != null && !AccessroiesprodId.isEmpty()){
            for(String prodid : AccessroiesprodId){
                EqmtAccessories.add(AccessroiesMap.get(prodid));
            }
        }
        
    }
    public class Wrapperclass{
        public  decimal tcv {get;set;}
        public  decimal mrc {get;set;}
        public decimal nrc{get;set;}
        public Wrapperclass(){
            
        }
        public Wrapperclass(decimal tcv,decimal mrc,decimal nrc){
            this.tcv = tcv;
            this.mrc = mrc;
            this.nrc = nrc;
        }
    }  
}