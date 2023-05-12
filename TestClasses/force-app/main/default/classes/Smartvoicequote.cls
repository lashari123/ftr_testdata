public class Smartvoicequote {
    public Opportunity opp {get;set;} 
    public Contact con{get;set;}
    public Account acc{get;set;}
    public string nowDate{get;set;}
    public string pageId{get;set;}
    public string scheduleId{get;set;}
    public string todayDate{get;set;}
    public string addSiteInfo{get;set;}
    public string addFrontierInfo{get;set;}
    
    public list<Integer> records{get;set;}
    public List<Site__c> lstSite{get;set;}
    public PriceBook2 brcbook{get;set;}
     public Site__c site{get;set;}
    public User user{get;set;}
    public List<OpportunityLineItem> licensesItemList {get;set;}
    public List<OpportunityLineItem> adOnItemList {get;set;}
    public List<OpportunityLineItem> TeleComItemList {get;set;}
    public List<OpportunityLineItem> ipPhoneItemList {get;set;}
    public List<OpportunityLineItem> RepairItemList {get;set;}
    public List<OpportunityLineItem> switchesItemList {get;set;}
    public List<OpportunityLineItem> equipmentItemList {get;set;}
    public List<OpportunityLineItem> broadbandItemList {get;set;}
    public List<OpportunityLineItem> FIOSItemList {get;set;}
    public List<OpportunityLineItem> fiberItemList {get;set;}
    public List<OpportunityLineItem> BHSIItemList {get;set;}
    public List<OpportunityLineItem> asymetricFiberItemList {get;set;}
    public List<OpportunityLineItem> setUpList {get;set;} 
    public List<OpportunityLineItem>  childList {get;set;}
    public List<Custom_Product__c> MiscellaneousList {get;set;}
    
    public List<OpportunityLineItem> licensesItemList2 {get;set;}
    public List<OpportunityLineItem> adOnItemList2 {get;set;}
    public List<OpportunityLineItem> TeleComItemList2 {get;set;}
    public List<OpportunityLineItem> ipPhoneItemList2 {get;set;}
    public List<OpportunityLineItem> RepairItemList2 {get;set;}
    public List<OpportunityLineItem> switchesItemList2 {get;set;}
    public List<OpportunityLineItem> equipmentItemList2 {get;set;}
    public List<OpportunityLineItem> broadbandItemList2 {get;set;}
    public List<OpportunityLineItem> FIOSItemList2 {get;set;}
    public List<OpportunityLineItem> fiberItemList2 {get;set;}
    public List<OpportunityLineItem> BHSIItemList2 {get;set;}
    public List<OpportunityLineItem> asymetricFiberItemList2 {get;set;}
    public List<OpportunityLineItem> setUpList2 {get;set;} 
    public List<OpportunityLineItem>  childList2 {get;set;} 
    public List<Custom_Product__c> MiscellaneousList2 {get;set;}
    public List<OpportunityLineItem>  installationList2 {get;set;}
    public List<OpportunityLineItem>  activationFeesList2 {get;set;}
     public List<OpportunityLineItem>  equipmentList2 {get;set;}
    
    public OpportunityLineItem premiumOppmrc{get;set;}
    public OpportunityLineItem premiumOppnrc{get;set;}
    public OpportunityLineItem premiumlusOppmrc{get;set;}
    public OpportunityLineItem premiumlusOppnrc{get;set;}
    public OpportunityLineItem conferenceOppmrc{get;set;}
    public OpportunityLineItem conferenceOppnrc{get;set;}
    public OpportunityLineItem analogOppmrc{get;set;}
    public OpportunityLineItem analogOppnrc{get;set;}
    public OpportunityLineItem additionalDIDmrc{get;set;}
    public OpportunityLineItem additionalDIDnrc{get;set;}
    public OpportunityLineItem additionalManagedAutoAttendantDmrc{get;set;}
    public OpportunityLineItem additionalManagedAutoAttendantDnrc{get;set;}
    public OpportunityLineItem directoryListingmrc{get;set;}
    public OpportunityLineItem directoryListingnrc{get;set;}
    public OpportunityLineItem E911mrc{get;set;}
    public OpportunityLineItem E911nrc{get;set;}
    public OpportunityLineItem extendedNumMrc{get;set;}
    public OpportunityLineItem extendedNumNrc{get;set;}
    public OpportunityLineItem monthlyAdminChargeMrc{get;set;}
    public OpportunityLineItem monthlyAdminChargeNrc{get;set;}
    public OpportunityLineItem multiLineHuntMrc{get;set;}
    public OpportunityLineItem multiLineHuntNrc{get;set;}
    public OpportunityLineItem premiumAttendantMrc{get;set;}
    public OpportunityLineItem premiumAttendantNrc{get;set;}
    public OpportunityLineItem tollFreeDomesticMrc{get;set;}
    public OpportunityLineItem tollFreeDomesticNrc{get;set;}
    public OpportunityLineItem tollFreeDomesticUSMrc{get;set;}
    public OpportunityLineItem tollFreeDomesticUSNrc{get;set;}
    public OpportunityLineItem tollFreeNumMrc{get;set;}
    public OpportunityLineItem tollFreeNumNrc{get;set;}
    public OpportunityLineItem TollTimemrc{get;set;}
    public OpportunityLineItem TollTimenrc{get;set;}
    
    public OpportunityLineItem smartBroadband12Mrc{get;set;}
    public OpportunityLineItem smartBroadband12Nrc{get;set;}
    public OpportunityLineItem smartBroadband18Mrc{get;set;}
    public OpportunityLineItem smartBroadband18Nrc{get;set;}
    public OpportunityLineItem smartBroadband25Mrc{get;set;}
    public OpportunityLineItem smartBroadband25Nrc{get;set;}
    public OpportunityLineItem smartBroadband35Mrc{get;set;}
    public OpportunityLineItem smartBroadband35Nrc{get;set;}
    public OpportunityLineItem smartBroadband45Mrc{get;set;}
    public OpportunityLineItem smartBroadband45Nrc{get;set;}
    public OpportunityLineItem smartBroadband70Mrc{get;set;}
    public OpportunityLineItem smartBroadband70Nrc{get;set;}
    public OpportunityLineItem smartBroadband90Mrc{get;set;}
    public OpportunityLineItem smartBroadband90Nrc{get;set;}
    public OpportunityLineItem smartBroadband115Mrc{get;set;}
    public OpportunityLineItem smartBroadband115Nrc{get;set;}
    public OpportunityLineItem SmartVoice_FiOS_100_100_BroadbandMrc{get;set;}
    public OpportunityLineItem SmartVoice_FiOS_100_100_BroadbandNrc{get;set;}
    public OpportunityLineItem SmartVoice_FiOS_500_500_BroadbandMrc{get;set;}
    public OpportunityLineItem SmartVoice_FiOS_500_500_BroadbandNrc{get;set;}
    public OpportunityLineItem SmartVoice_FiOS_1G_1G_BroadbandMrc{get;set;}
    public OpportunityLineItem SmartVoice_FiOS_1G_1G_BroadbandNrc{get;set;}
    public OpportunityLineItem SmartVoice_Fiber_100_100_BroadbandMrc{get;set;}
    public OpportunityLineItem SmartVoice_Fiber_100_100_BroadbandNrc{get;set;}
    public OpportunityLineItem SmartVoice_Fiber_500_500_BroadbandMrc{get;set;}
    public OpportunityLineItem SmartVoice_Fiber_500_500_BroadbandNrc{get;set;}
    public OpportunityLineItem SmartVoice_Fiber_1G_1G_BroadbandMrc{get;set;}
    public OpportunityLineItem SmartVoice_Fiber_1G_1G_BroadbandNrc{get;set;}
    public OpportunityLineItem smartBroadbandIpOptionEachMrc{get;set;}
    public OpportunityLineItem smartBroadbandIpOptionEachNrc{get;set;}
    public OpportunityLineItem smartBroadbandIpOption5IpsMrc{get;set;}
    public OpportunityLineItem smartBroadbandIpOption5IpsNrc{get;set;}
    public OpportunityLineItem smartBroadbandIpOption13IpsMrc{get;set;}
    public OpportunityLineItem smartBroadbandIpOption13IpsNrc{get;set;}
    
    public OpportunityLineItem smartVVX311Mrc{get;set;}
    public OpportunityLineItem smartVVX311Nrc{get;set;}
    public OpportunityLineItem smartVVX501Mrc{get;set;}
    public OpportunityLineItem smartVVX501Nrc{get;set;}
    public OpportunityLineItem smartVVX601Mrc{get;set;}
    public OpportunityLineItem smartVVX601Nrc{get;set;}
    public OpportunityLineItem smartSoundStation5000Mrc{get;set;}
    public OpportunityLineItem smartSoundStation5000Nrc{get;set;}
    public OpportunityLineItem smartSoundStation6000Mrc{get;set;}
    public OpportunityLineItem smartSoundStation6000Nrc{get;set;}
    public OpportunityLineItem smartSoundStation7000Mrc{get;set;}
    public OpportunityLineItem smartSoundStation7000Nrc{get;set;}
    public OpportunityLineItem smartNETGEARMrc{get;set;}
    public OpportunityLineItem smartNETGEARNrc{get;set;}
    public OpportunityLineItem smartPolycomATAMrc{get;set;}
    public OpportunityLineItem smartPolycomATANrc{get;set;}
    
    
    public OpportunityLineItem smartTechInstallFeeBHSIMrc{get;set;}
    public OpportunityLineItem smartTechInstallFeeBHSINrc{get;set;}
    public OpportunityLineItem smartTechInstallFeeFiberMrc{get;set;}
    public OpportunityLineItem smartTechInstallFeeFiberNrc{get;set;}
    public OpportunityLineItem smartTechInstallFeeFIOSMrc{get;set;}
    public OpportunityLineItem smartTechInstallFeeFIOSNrc{get;set;}
    public OpportunityLineItem smartEquipmentMrc{get;set;}
    public OpportunityLineItem smartEquipmentNrc{get;set;}
    
    
    public map<Integer,Site__c>siteAddressMap {get;set;}
    public map<Integer,String> siteAddressStrMap {get;set;}
    public map<Integer,Wrapperclass> wrapperMap{get;set;}
    public String Id {get;set;}
    public string smartVoicePdfPageId{get;set;}
    public string smartVoicePdf2PageId{get;set;}
    public string custName{get;set;}
    
    public decimal totmrc {get;set;}
    public decimal totnrc {get;set;}
    public decimal tottcv {get;set;}
    public Map<Integer,String> switchesMap {get;set;}
    public Map<Integer,String> licenseMap {get;set;}
    public Map<Integer,String> AddMap {get;set;} 
    public Map<Integer,String> teleComMap {get;set;} 
    public Map<Integer,String> IpMap {get;set;}
    public Map<Integer,String> RepMap {get;set;}
    public Map<Integer,String> equipmentMap {get;set;}
    public Map<Integer,String> broadbandMap {get;set;} 
    public Map<Integer,String> FIOSMap {get;set;}
    public Map<Integer,String> fiberMap {get;set;}
    public Map<Integer,String> BHSIMap {get;set;}
    public Map<Integer,String> asyFiberMap {get;set;}
    public Map<Integer,String> otherMap {get;set;}
    public Map<Integer,String> setupMap {get;set;}
    public Map<Integer,decimal> ActivationSite {get;set;}
    public Map<Integer,decimal> InstallationSite {get;set;}
    public decimal mrclic {get;set;}
    public decimal mrcIp {get;set;}
    public decimal mrcAddon {get;set;}
    public decimal mrcTeleCom {get;set;}
    public decimal mrcSwitch {get;set;}
    public decimal mrcRepair {get;set;}
    public decimal mrcEquipment {get;set;}
    public decimal mrcBroadband {get;set;}
    public decimal mrcFIOS {get;set;}
    public decimal mrcFiber {get;set;}
    public decimal mrcBHSI {get;set;}
    public decimal mrcAsyFiber {get;set;}
    public decimal mrcActivation {get;set;}
    public decimal mrcInstall {get;set;}
    public decimal mrcOther {get;set;}
    public decimal mrcTotal {get;set;}
    
    public decimal nrclic {get;set;}
    public decimal nrcIp {get;set;}
    public decimal nrcAddon {get;set;}
    public decimal nrcTeleCom {get;set;}
    public decimal nrcSwitch {get;set;}
    public decimal nrcRepair {get;set;}
    public decimal nrcEquipment{get;set;}
    public decimal nrcBroadband {get;set;}
    public decimal nrcFIOS {get;set;}
    public decimal nrcFiber {get;set;}
    public decimal nrcBHSI {get;set;}
    public decimal nrcAsyFiber {get;set;}
    public decimal nrcActivation {get;set;}
    public decimal nrcInstall {get;set;}
    public decimal nrcOther {get;set;}
    public decimal nrcTotal {get;set;}
    public String  OpportunityId {get;set;}
    
    
    
    public Smartvoicequote(ApexPages.StandardController controller){
        Id = ApexPages.currentPage().getParameters().get('id');
        OpportunityId = Id;
        records = new list<Integer>();
        site = new Site__c();
        totmrc = 0.0;
        totnrc = 0.0;
        tottcv = 0.0;
        otherMap = new Map<Integer,String>();
        RepMap = new Map<Integer,String>();
        IpMap = new Map<Integer,String>();
        AddMap = new Map<Integer,String>();
        teleComMap = new Map<Integer,String>();
        licenseMap = new Map<Integer,String>();
        switchesMap  = new Map<Integer,String>();
        equipmentMap = new Map<Integer,String>();
        broadbandMap = new Map<Integer,String>();
        FIOSMap = new Map<Integer,String>();
        fiberMap = new Map<Integer,String>();
        BHSIMap = new Map<Integer,String>();
        asyFiberMap = new Map<Integer,String>();
        InstallationSite = new Map<Integer,decimal>();
        wrapperMap = new map<Integer,Wrapperclass>();
        siteAddressMap = new map<Integer,Site__c>();
        siteAddressStrMap = new map<Integer,String>();
        setupMap = new map<Integer,String>();
        ActivationSite = new Map<Integer,decimal>();
        brcbook = new PriceBook2();
        user = new  User();
        licensesItemList = new List<OpportunityLineItem>();
        adOnItemList = new List<OpportunityLineItem>();
        TeleComItemList = new List<OpportunityLineItem>();
        ipPhoneItemList = new List<OpportunityLineItem>();
        RepairItemList = new List<OpportunityLineItem>();
        switchesItemList = new List<OpportunityLineItem>();
        equipmentItemList = new List<OpportunityLineItem>();
        broadbandItemList = new List<OpportunityLineItem>();
        FIOSItemList = new List<OpportunityLineItem>();
        fiberItemList = new List<OpportunityLineItem>();
        BHSIItemList = new List<OpportunityLineItem>();
        asymetricFiberItemList = new List<OpportunityLineItem>();
        setUpList = new List<OpportunityLineItem>();
        childList = new List<OpportunityLineItem>();
        
        MiscellaneousList = new List<Custom_Product__c>();
        
        premiumOppmrc = new OpportunityLineItem();
        premiumOppnrc = new OpportunityLineItem();
        premiumlusOppmrc = new OpportunityLineItem();
        premiumlusOppnrc = new OpportunityLineItem();
        conferenceOppmrc = new OpportunityLineItem();
        conferenceOppnrc = new OpportunityLineItem();
        analogOppmrc = new OpportunityLineItem();
        analogOppnrc = new OpportunityLineItem();
        additionalDIDmrc =  new OpportunityLineItem();
        additionalDIDnrc =  new OpportunityLineItem();
        additionalManagedAutoAttendantDmrc =  new OpportunityLineItem();
        additionalManagedAutoAttendantDnrc =  new OpportunityLineItem();
        directoryListingmrc =  new OpportunityLineItem();
        directoryListingnrc =  new OpportunityLineItem();
        E911mrc =  new OpportunityLineItem();
        E911nrc =  new OpportunityLineItem();
        extendedNumMrc =  new OpportunityLineItem();
        extendedNumNrc =  new OpportunityLineItem();
        monthlyAdminChargeMrc =  new OpportunityLineItem();
        monthlyAdminChargeNrc =  new OpportunityLineItem();
        multiLineHuntMrc =  new OpportunityLineItem();
        multiLineHuntNrc =  new OpportunityLineItem();
        premiumAttendantMrc =  new OpportunityLineItem();
        premiumAttendantNrc =  new OpportunityLineItem();
        tollFreeDomesticMrc =  new OpportunityLineItem();
        tollFreeDomesticNrc =  new OpportunityLineItem();
        tollFreeDomesticUSMrc =  new OpportunityLineItem();
        tollFreeDomesticUSNrc =  new OpportunityLineItem();
        tollFreeNumMrc =  new OpportunityLineItem();
        tollFreeNumNrc =  new OpportunityLineItem();
        
        smartBroadband12Mrc =  new OpportunityLineItem();
        smartBroadband12Nrc =  new OpportunityLineItem();
        smartBroadband18Mrc =  new OpportunityLineItem();
        smartBroadband18Nrc =  new OpportunityLineItem();
        smartBroadband25Mrc =  new OpportunityLineItem();
        smartBroadband25Nrc =  new OpportunityLineItem();
        smartBroadband35Mrc =  new OpportunityLineItem();
        smartBroadband35Nrc =  new OpportunityLineItem();
        smartBroadband45Mrc =  new OpportunityLineItem();
        smartBroadband45Nrc =  new OpportunityLineItem();
        smartBroadband70Mrc =  new OpportunityLineItem();
        smartBroadband70Nrc =  new OpportunityLineItem();
        smartBroadband90Mrc =  new OpportunityLineItem();
        smartBroadband90Nrc =  new OpportunityLineItem();
        smartBroadband115Mrc =  new OpportunityLineItem();
        smartBroadband115Nrc =  new OpportunityLineItem();
        SmartVoice_FiOS_100_100_BroadbandMrc =  new OpportunityLineItem();
        SmartVoice_FiOS_100_100_BroadbandNrc =  new OpportunityLineItem();
        SmartVoice_FiOS_500_500_BroadbandMrc =  new OpportunityLineItem();
        SmartVoice_FiOS_500_500_BroadbandNrc =  new OpportunityLineItem();
        SmartVoice_FiOS_1G_1G_BroadbandMrc =  new OpportunityLineItem();
        SmartVoice_FiOS_1G_1G_BroadbandNrc =  new OpportunityLineItem();
        SmartVoice_Fiber_100_100_BroadbandMrc =  new OpportunityLineItem();
        SmartVoice_Fiber_100_100_BroadbandNrc =  new OpportunityLineItem();
        SmartVoice_Fiber_500_500_BroadbandMrc =  new OpportunityLineItem();
        SmartVoice_Fiber_500_500_BroadbandNrc =  new OpportunityLineItem();
        SmartVoice_Fiber_1G_1G_BroadbandMrc =  new OpportunityLineItem();
        SmartVoice_Fiber_1G_1G_BroadbandNrc =  new OpportunityLineItem();
        smartBroadbandIpOptionEachMrc =  new OpportunityLineItem();
        smartBroadbandIpOptionEachNrc =  new OpportunityLineItem();
        smartBroadbandIpOption5IpsMrc =  new OpportunityLineItem();
        smartBroadbandIpOption5IpsNrc =  new OpportunityLineItem();
        smartBroadbandIpOption13IpsMrc =  new OpportunityLineItem();
        smartBroadbandIpOption13IpsNrc =  new OpportunityLineItem();
        
        smartVVX311Mrc =  new OpportunityLineItem();
        smartVVX311Nrc =  new OpportunityLineItem();
        smartVVX501Mrc =  new OpportunityLineItem();
        smartVVX501Nrc =  new OpportunityLineItem();
        smartVVX601Mrc =  new OpportunityLineItem();
        smartVVX601Nrc =  new OpportunityLineItem();
        smartSoundStation5000Mrc =  new OpportunityLineItem();
        smartSoundStation5000Nrc =  new OpportunityLineItem();
        smartSoundStation6000Mrc =  new OpportunityLineItem();
        smartSoundStation6000Nrc =  new OpportunityLineItem();
        smartSoundStation7000Mrc =  new OpportunityLineItem();
        smartSoundStation7000Nrc =  new OpportunityLineItem();
        smartNETGEARMrc =  new OpportunityLineItem();
        smartNETGEARNrc =  new OpportunityLineItem();
        smartPolycomATAMrc =  new OpportunityLineItem();
        smartPolycomATANrc =  new OpportunityLineItem();
        
        smartTechInstallFeeBHSIMrc =  new OpportunityLineItem();
        smartTechInstallFeeBHSINrc =  new OpportunityLineItem();
        smartTechInstallFeeFiberMrc =  new OpportunityLineItem();
        smartTechInstallFeeFiberNrc =  new OpportunityLineItem();
        smartTechInstallFeeFIOSMrc =  new OpportunityLineItem();
        smartTechInstallFeeFIOSNrc =  new OpportunityLineItem();
        smartEquipmentMrc =  new OpportunityLineItem();
        smartEquipmentNrc = new OpportunityLineItem();
        
        licensesItemList2 = new List<OpportunityLineItem>();
        adOnItemList2 = new List<OpportunityLineItem>();
        TeleComItemList2 = new List<OpportunityLineItem>();
        ipPhoneItemList2 = new List<OpportunityLineItem>();
        RepairItemList2 = new List<OpportunityLineItem>();
        switchesItemList2 = new List<OpportunityLineItem>();
        equipmentItemList2 = new List<OpportunityLineItem>();
        broadbandItemList2 = new List<OpportunityLineItem>();
        FIOSItemList2 = new List<OpportunityLineItem>();
        fiberItemList2 = new List<OpportunityLineItem>();
        BHSIItemList2 = new List<OpportunityLineItem>();
        asymetricFiberItemList2 = new List<OpportunityLineItem>();
        setUpList2 = new List<OpportunityLineItem>();
        childList2 = new List<OpportunityLineItem>();
        MiscellaneousList2 = new List<Custom_Product__c>();
        installationList2 = new List<OpportunityLineItem>();
        activationFeesList2 =  new List<OpportunityLineItem>();
        equipmentList2 =  new List<OpportunityLineItem>();
        nowDate = Datetime.now().format('dd/MM/yyyy');
        mrclic = 0.0;
        mrcIp = 0.0;
        mrcAddon = 0.0;
        mrcTeleCom = 0.0;
        mrcSwitch = 0.0;
        mrcRepair = 0.0;
        mrcEquipment = 0.0;
        mrcBroadband = 0.0;
        mrcFIOS = 0.0;
        mrcFiber = 0.0;
        mrcBHSI = 0.0;
        mrcAsyFiber = 0.0;
        mrcActivation = 0.0;
        mrcInstall =0.0;
        mrcOther = 0.0;
        mrcTotal = 0.0;
        nrclic = 0.0;
        nrcIp = 0.0;
        nrcAddon = 0.0;
        nrcTeleCom = 0.0;
        nrcSwitch = 0.0;
        nrcRepair = 0.0;
        nrcEquipment = 0.0;
        nrcBroadband = 0.0;
        nrcFIOS = 0.0;
        nrcFiber = 0.0;
        nrcBHSI = 0.0;
        nrcAsyFiber = 0.0;
        nrcActivation = 0.0;
        nrcInstall = 0.0;
        nrcOther = 0.0;
        nrcTotal = 0.0;
        smartVoicePdfPageId = '';
        smartVoicePdf2PageId = '';
        custName = '';
        todayDate = system.today().format();
        pageId = '';
        scheduleId = '';
        addFrontierInfo = '';
        addSiteInfo = '';
        TollTimemrc = new OpportunityLineItem();
        TollTimenrc = new OpportunityLineItem();
        
        
        String baseUrl = URL.getSalesforceBaseUrl().toExternalForm(); 
        system.debug('baseUrl========================='+baseUrl);
        //pageId =   baseUrl+'/apex/smartVoicecontractPdfChild3?core.apexpages.request.devconsole=1';
        pageId =   baseUrl+'/apex/smartVoicecontractPdfChild3?core.apexpages.request.devconsole=1&id='+Id;
        PageReference redirectPage = new PageReference(baseUrl+'/apex/smartVoicecontractPdfChild3?core.apexpages.request.devconsole=1'); 
        system.debug('redirectPage========================='+redirectPage);
        
        
        /*String baseUrl = URL.getSalesforceBaseUrl().toExternalForm(); 
system.debug('baseUrl========================='+baseUrl);
smartVoicePdfPageId =  baseUrl+'/apex/smartVoicecontractPdfChild?core.apexpages.request.devconsole=1';
PageReference redirectPage1 = new PageReference(baseUrl+'/apex/smartVoicecontractPdfChild?core.apexpages.request.devconsole=1'); 

smartVoicePdf2PageId =  baseUrl+'/apex/smartVoiceContractPdfChild2?core.apexpages.request.devconsole=1';
PageReference redirectPage2 = new PageReference(baseUrl+'/apex/smartVoiceContractPdfChild2?core.apexpages.request.devconsole=1'); 

*/
        
        
        if(Id != null) {
            opp = [Select id,Contact__c,Pricebook2Id,Contract_Term_Years__c,accountId,OwnerId,Company_size__c from Opportunity where id =: Id];
            if(opp!=null && opp.Company_size__c!=null){
                for(integer i=1;i<=opp.Company_size__c;i++) {
                    records.add(i);
                }
                
                lstSite = new List<Site__c> ();
                lstSite = [select id, Site_city__c ,Primary__c, Site_Country__c , Site_zipcode__c ,Site_Name__c, Site_Street__c ,Site_Number__c,State__c from Site__c where opportunity__c =: Id  ];
                for(Site__c s: lstSite){
                    System.debug('==site=='+s);
                    Integer siteno =  Integer.valueOf(s.Site_Number__c);
                    siteAddressMap.put(siteno,s); 
                    if(s.Primary__c == true){
                        site = s ;
                    }
                    siteAddressStrMap.put(siteno,s.Site_Street__c);
                }           
                
            }
            if(opp.OwnerId != null){
                user = [select id,Name from User where id =: opp.OwnerId limit 1];
            }
            if(opp.Pricebook2Id != null){
                brcbook = [select id,Name,Account_Type__c from PriceBook2 where id =: opp.Pricebook2Id limit 1];
            }
            if( opp.Contact__c != null) { 
                con = [Select id,Name,Phone,Email from Contact where id=: opp.Contact__c limit 1];
                system.debug('===========con====='+con);
            }
            if( opp.accountId != null) {
                acc = [Select id,Name,BillingStreet, BillingCity, BillingState, BillingPostalCode,BillingCountry, BillingLatitude, BillingLongitude FROM Account where id=:opp.AccountId limit 1];
            }
            
            licensesItemList = [Select id,Site__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c  from OpportunityLineItem where OpportunityId =: Id and (Category__c =: 'Smart Voice' AND Sub_Category__c=: 'Licenses')  and Releted__c !=: 'child' and SetUp__c !=: 'Setup'and Filter_Product__c =:'Parent' ORDER BY Index__c];
            adOnItemList = [Select id,Site__c,Product_Name__c,SetUp__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,nrc_total__c,Type_of_Billing__c,Term__c,Releted__c  from OpportunityLineItem where OpportunityId =: Id and (Category__c =: 'Smart Voice' AND Sub_Category__c=: 'Add-On') and Releted__c !=: 'child' and SetUp__c !=: 'Setup' and Filter_Product__c =:'Parent' ORDER BY Index__c];
            TeleComItemList = [Select id,Site__c,Product_Name__c,SetUp__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,nrc_total__c,Type_of_Billing__c,Term__c,Releted__c  from OpportunityLineItem where OpportunityId =: Id and (Category__c =: 'Smart Voice' AND Sub_Category__c=: 'Toll Free Bundle Minutes') and Releted__c !=: 'child' and SetUp__c !=: 'Setup' and Filter_Product__c =:'Parent' ORDER BY Index__c]; 
            ipPhoneItemList = [Select id,Equipment__c,Site__c,Product_Name__c,SetUp__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,nrc_total__c,Type_of_Billing__c,Term__c,Releted__c  from OpportunityLineItem where OpportunityId =: Id and (Category__c =: 'Smart Voice' AND Sub_Category__c=: 'IP Phones') and Releted__c !=: 'child' and SetUp__c !=: 'Setup' and Filter_Product__c =:'Parent' ORDER BY Index__c];
            RepairItemList = [Select id,Equipment__c,Site__c,Product_Name__c,SetUp__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,nrc_total__c,Type_of_Billing__c,Term__c,Releted__c  from OpportunityLineItem where OpportunityId =: Id and (Category__c =: 'Smart Voice' AND Sub_Category__c=: 'Repair') and Releted__c !=: 'child' and SetUp__c !=: 'Setup' and Filter_Product__c =:'Parent' ORDER BY Index__c];
            switchesItemList = [Select id,Site__c,Equipment__c,Product_Name__c,SetUp__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,nrc_total__c,Type_of_Billing__c,Term__c,Releted__c  from OpportunityLineItem where OpportunityId =: Id and (Category__c =: 'Smart Voice' AND Sub_Category__c=: 'Switches and PoE') and Releted__c !=: 'child' and SetUp__c !=: 'Setup' and Filter_Product__c =:'Parent' ORDER BY Index__c];
            equipmentItemList = [Select id,Site__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c  from OpportunityLineItem where OpportunityId =: Id and (Category__c =: 'Smart Voice' AND Sub_Category__c=: 'Equipment')  and Releted__c !=: 'child' and SetUp__c !=: 'Setup'and Filter_Product__c =:'Parent' ORDER BY Index__c];
            broadbandItemList = [Select id,Site__c,Product_Name__c,SetUp__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,nrc_total__c,Type_of_Billing__c,Term__c,Releted__c  from OpportunityLineItem where OpportunityId =: Id and (Category__c =: 'Smart Voice' AND Sub_Category__c=: 'Broadband') and Releted__c !=: 'child' and SetUp__c !=: 'Setup' and Filter_Product__c =:'Parent' ORDER BY Index__c];
            FIOSItemList = [Select id,Equipment__c,Site__c,Product_Name__c,SetUp__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,nrc_total__c,Type_of_Billing__c,Term__c,Releted__c  from OpportunityLineItem where OpportunityId =: Id and (Category__c =: 'Smart Voice' AND Sub_Category__c=: 'FIOS') and Releted__c !=: 'child' and SetUp__c !=: 'Setup' and Filter_Product__c =:'Parent' ORDER BY Index__c];
            fiberItemList = [Select id,Equipment__c,Site__c,Product_Name__c,SetUp__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,nrc_total__c,Type_of_Billing__c,Term__c,Releted__c  from OpportunityLineItem where OpportunityId =: Id and (Category__c =: 'Smart Voice' AND Sub_Category__c=: 'Fiber') and Releted__c !=: 'child' and SetUp__c !=: 'Setup' and Filter_Product__c =:'Parent' ORDER BY Index__c];
            BHSIItemList = [Select id,Site__c,Equipment__c,Product_Name__c,SetUp__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,nrc_total__c,Type_of_Billing__c,Term__c,Releted__c  from OpportunityLineItem where OpportunityId =: Id and (Category__c =: 'Smart Voice' AND Sub_Category__c=: 'BHSI') and Releted__c !=: 'child' and SetUp__c !=: 'Setup' and Filter_Product__c =:'Parent' ORDER BY Index__c];
            asymetricFiberItemList = [Select id,Site__c,Equipment__c,Product_Name__c,SetUp__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,nrc_total__c,Type_of_Billing__c,Term__c,Releted__c  from OpportunityLineItem where OpportunityId =: Id and (Category__c =: 'Smart Voice' AND Sub_Category__c=: 'Asymetric Fiber') and Releted__c !=: 'child' and SetUp__c !=: 'Setup' and Filter_Product__c =:'Parent' ORDER BY Index__c];
            setUpList = [Select id,Site__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,SetUp__c,Quantity,Sub_Total__c,TotalPrice,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,nrc_total__c,Type_of_Billing__c,Term__c,Releted__c  from OpportunityLineItem where OpportunityId =: Id  and Category__c =: 'Smart Voice' and SetUp__c =: 'Setup' and Releted__c !=: 'child' and Filter_Product__c =:'Child' ORDER BY Index__c];
            childList = [Select id,Site__c,Product_Name__c,Child__c,ProductCode,SetUp__c,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,nrc_total__c,Type_of_Billing__c,Term__c,Releted__c  from OpportunityLineItem where OpportunityId =: Id and Releted__c =: 'child' and SetUp__c !=: 'Setup' and Filter_Product__c =:'Child' and (Category__c =: 'Smart Voice' AND Sub_Category__c=: 'Installation')  ORDER BY Index__c];
            MiscellaneousList = [select id,ProductName__c,Quantity__c,Total__c,MrcPrice__c,Opportunity__c,NumberOfSites__c,Type_of_billing__c from Custom_Product__c where Opportunity__c =:Id and Quantity__c != null];
            
            if(licensesItemList != null && !licensesItemList.isEmpty()){
                for(OpportunityLineItem item:licensesItemList){
                    Integer siteno =  Integer.valueOf(item.Site_Number__c);
                    if(wrapperMap != null && !wrapperMap.isEmpty() && wrapperMap.containsKey(siteno)){
                        decimal mrc = 0.0;
                        decimal nrc = 0.0;
                        Wrapperclass w = new Wrapperclass(mrc,nrc);
                        w = wrapperMap.get(siteno);
                        if(item.Type_of_Billing__c == 'MRC'){
                            w.mrc = w.mrc + item.TotalPrice;
                        }else{
                            w.nrc = w.nrc + item.TotalPrice;
                        }
                        wrapperMap.put(siteno,w);
                        
                    }else{
                        decimal mrc = 0.0;
                        decimal nrc = 0.0;
                        if(item.Type_of_Billing__c == 'MRC'){
                            mrc = mrc + item.TotalPrice;
                        }else{
                            nrc = nrc + item.TotalPrice;
                        }
                        Wrapperclass w = new Wrapperclass(mrc,nrc);
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
                for(Site__c s: lstSite){
                    Integer siteno =  Integer.valueOf(s.Site_Number__c);
                    if(licenseMap != null && !licenseMap.isEmpty() && licenseMap.containsKey(siteno)){  
                    } else{
                        licenseMap.put(siteno,'false');
                    }
                }  
            }
            if(adOnItemList != null && !adOnItemList.isEmpty()){
                for(OpportunityLineItem item:adOnItemList){
                    Integer siteno =  Integer.valueOf(item.Site_Number__c);
                    if(wrapperMap != null && !wrapperMap.isEmpty() && wrapperMap.containsKey(siteno)){
                        decimal mrc = 0.0;
                        decimal nrc = 0.0;
                        Wrapperclass w = new Wrapperclass(mrc,nrc);
                        w = wrapperMap.get(siteno);
                        if(item.Type_of_Billing__c == 'MRC'){
                            w.mrc = w.mrc + item.TotalPrice;
                        }else{
                            w.nrc = w.nrc + item.TotalPrice;
                        }
                        wrapperMap.put(siteno,w);
                        
                    }else{
                        decimal mrc = 0.0;
                        decimal nrc = 0.0;
                        if(item.Type_of_Billing__c == 'MRC'){
                            mrc = mrc + item.TotalPrice;
                        }else{
                            nrc = nrc + item.TotalPrice;
                        }
                        Wrapperclass w = new Wrapperclass(mrc,nrc);
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
            
            
             if(TeleComItemList != null && !TeleComItemList.isEmpty()){
                for(OpportunityLineItem item : TeleComItemList){
                    Integer siteno =  Integer.valueOf(item.Site_Number__c);
                    if(wrapperMap != null && !wrapperMap.isEmpty() && wrapperMap.containsKey(siteno)){
                        decimal mrc = 0.0;
                        decimal nrc = 0.0;
                        Wrapperclass w = new Wrapperclass(mrc,nrc);
                        w = wrapperMap.get(siteno);
                        if(item.Type_of_Billing__c == 'MRC'){
                            w.mrc = w.mrc + item.TotalPrice;
                        }else{
                            w.nrc = w.nrc + item.TotalPrice;
                        }
                        wrapperMap.put(siteno,w);
                        
                    }else{
                        decimal mrc = 0.0;
                        decimal nrc = 0.0;
                        if(item.Type_of_Billing__c == 'MRC'){
                            mrc = mrc + item.TotalPrice;
                        }else{
                            nrc = nrc + item.TotalPrice;
                        }
                        Wrapperclass w = new Wrapperclass(mrc,nrc);
                        wrapperMap.put(siteno, w);
                    }
                    if(item.Type_of_Billing__c == 'MRC'){
                        totmrc = totmrc + item.TotalPrice;
                        mrcTeleCom = mrcTeleCom + item.TotalPrice;
                    }
                    else{
                        totnrc = totnrc + item.TotalPrice;
                        nrcTeleCom = nrcTeleCom + item.TotalPrice;
                    }
                    if(teleComMap != null && !teleComMap.isEmpty() && teleComMap.containsKey(siteno)){
                        String val = teleComMap.get(siteno);
                        teleComMap.put(siteno,val);     
                    }
                    else
                    {
                        teleComMap.put(siteno,'test');                        
                    }
                }
                
                for(Site__c s: lstSite){
                    Integer siteno =  Integer.valueOf(s.Site_Number__c);
                    if(teleComMap != null && !teleComMap.isEmpty() && teleComMap.containsKey(siteno)){  
                        
                        
                    } else{
                        AddMap.put(siteno,'false');
                    }
                } 
            }
            
            if(ipPhoneItemList != null && !ipPhoneItemList.isEmpty()){
                for(OpportunityLineItem item:ipPhoneItemList){
                    Integer siteno =  Integer.valueOf(item.Site_Number__c);
                    if(wrapperMap != null && !wrapperMap.isEmpty() && wrapperMap.containsKey(siteno)){
                        decimal mrc = 0.0;
                        decimal nrc = 0.0;
                        Wrapperclass w = new Wrapperclass(mrc,nrc);
                        w = wrapperMap.get(siteno);
                        if(item.Type_of_Billing__c == 'MRC'){
                            w.mrc = w.mrc + item.TotalPrice;
                        }else{
                            w.nrc = w.nrc + item.TotalPrice;
                            
                        }
                        wrapperMap.put(siteno,w);
                        
                    }else{
                        decimal mrc = 0.0;
                        decimal nrc = 0.0;
                        if(item.Type_of_Billing__c == 'MRC'){
                            mrc = mrc + item.TotalPrice;
                        }else{
                            nrc = nrc + item.TotalPrice;
                        }
                        Wrapperclass w = new Wrapperclass(mrc,nrc);
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
            if(RepairItemList != null && !RepairItemList.isEmpty()){
                for(OpportunityLineItem item:RepairItemList){
                    Integer siteno =  Integer.valueOf(item.Site_Number__c);
                    if(wrapperMap != null && !wrapperMap.isEmpty() && wrapperMap.containsKey(siteno)){
                        decimal mrc = 0.0;
                        decimal nrc = 0.0;
                        Wrapperclass w = new Wrapperclass(mrc,nrc);
                        w = wrapperMap.get(siteno);
                        if(item.Type_of_Billing__c == 'MRC'){
                            w.mrc = w.mrc + item.TotalPrice;
                        }else{
                            w.nrc = w.nrc + item.TotalPrice;
                        }
                        wrapperMap.put(siteno,w);
                        
                    }else{
                        decimal mrc = 0.0;
                        decimal nrc = 0.0;
                        if(item.Type_of_Billing__c == 'MRC'){
                            mrc = mrc + item.TotalPrice;
                        }else{
                            nrc = nrc + item.TotalPrice;
                        }
                        Wrapperclass w = new Wrapperclass(mrc,nrc);
                        wrapperMap.put(siteno, w);
                    }
                    if(item.Type_of_Billing__c == 'MRC'){
                        totmrc = totmrc + item.TotalPrice;
                        mrcRepair = mrcRepair + item.TotalPrice;
                    }
                    else{
                        totnrc = totnrc + item.TotalPrice;
                        nrcRepair = nrcRepair + item.TotalPrice;
                    }
                    if(RepMap != null && !RepMap.isEmpty() && RepMap.containsKey(siteno)){
                        String val = RepMap.get(siteno);
                        RepMap.put(siteno,val);     
                    }
                    else
                    {
                        RepMap.put(siteno,'test');                        
                    }
                }
                
                for(Site__c s: lstSite){
                    Integer siteno =  Integer.valueOf(s.Site_Number__c);
                    if(RepMap != null && !RepMap.isEmpty() && RepMap.containsKey(siteno)){  
                        
                        
                    } else{
                        RepMap.put(siteno,'false');
                    }
                }  
            }
            if(switchesItemList != null && !switchesItemList.isEmpty()){
                for(OpportunityLineItem item:switchesItemList){
                    Integer siteno =  Integer.valueOf(item.Site_Number__c);
                    if(wrapperMap != null && !wrapperMap.isEmpty() && wrapperMap.containsKey(siteno)){
                        decimal mrc = 0.0;
                        decimal nrc = 0.0;
                        Wrapperclass w = new Wrapperclass(mrc,nrc);
                        w = wrapperMap.get(siteno);
                        if(item.Type_of_Billing__c == 'MRC'){
                            w.mrc = w.mrc + item.TotalPrice;
                        }else{
                            w.nrc = w.nrc + item.TotalPrice;
                        }
                        wrapperMap.put(siteno,w);
                        
                    }else{
                        decimal mrc = 0.0;
                        decimal nrc = 0.0;
                        if(item.Type_of_Billing__c == 'MRC'){
                            mrc = mrc + item.TotalPrice;
                        }else{
                            nrc = nrc + item.TotalPrice;
                        }
                        Wrapperclass w = new Wrapperclass(mrc,nrc);
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
            if(equipmentItemList != null && !equipmentItemList.isEmpty()){
                for(OpportunityLineItem item:equipmentItemList){
                    Integer siteno =  Integer.valueOf(item.Site_Number__c);
                    if(wrapperMap != null && !wrapperMap.isEmpty() && wrapperMap.containsKey(siteno)){
                        decimal mrc = 0.0;
                        decimal nrc = 0.0;
                        Wrapperclass w = new Wrapperclass(mrc,nrc);
                        w = wrapperMap.get(siteno);
                        if(item.Type_of_Billing__c == 'MRC'){
                            w.mrc = w.mrc + item.TotalPrice;
                        }else{
                            w.nrc = w.nrc + item.TotalPrice;
                        }
                        wrapperMap.put(siteno,w);
                        
                    }else{
                        decimal mrc = 0.0;
                        decimal nrc = 0.0;
                        if(item.Type_of_Billing__c == 'MRC'){
                            mrc = mrc + item.TotalPrice;
                        }else{
                            nrc = nrc + item.TotalPrice;
                        }
                        Wrapperclass w = new Wrapperclass(mrc,nrc);
                        wrapperMap.put(siteno, w);
                    }
                    
                    if(item.Type_of_Billing__c == 'MRC'){
                        totmrc = totmrc + item.TotalPrice;
                        mrcEquipment = mrcEquipment + item.TotalPrice;
                    }
                    else{
                        totnrc = totnrc + item.TotalPrice;
                        nrcEquipment = nrcEquipment + item.TotalPrice;
                    }
                    if(equipmentMap != null && !equipmentMap.isEmpty() && equipmentMap.containsKey(siteno)){
                        String val = equipmentMap.get(siteno);
                        equipmentMap.put(siteno,val);     
                    }
                    else
                    {
                        equipmentMap.put(siteno,'test');                        
                    }
                }
                for(Site__c s: lstSite){
                    Integer siteno =  Integer.valueOf(s.Site_Number__c);
                    if(equipmentMap != null && !equipmentMap.isEmpty() && equipmentMap.containsKey(siteno)){  
                    } else{
                        equipmentMap.put(siteno,'false');
                    }
                }  
            }
            if(broadbandItemList != null && !broadbandItemList.isEmpty()){
                for(OpportunityLineItem item : broadbandItemList){
                    Integer siteno =  Integer.valueOf(item.Site_Number__c);
                    if(wrapperMap != null && !wrapperMap.isEmpty() && wrapperMap.containsKey(siteno)){
                        decimal mrc = 0.0;
                        decimal nrc = 0.0;
                        Wrapperclass w = new Wrapperclass(mrc,nrc);
                        w = wrapperMap.get(siteno);
                        if(item.Type_of_Billing__c == 'MRC'){
                            w.mrc = w.mrc + item.TotalPrice;
                        }else{
                            w.nrc = w.nrc + item.TotalPrice;
                        }
                        wrapperMap.put(siteno,w);
                        
                    }else{
                        decimal mrc = 0.0;
                        decimal nrc = 0.0;
                        if(item.Type_of_Billing__c == 'MRC'){
                            mrc = mrc + item.TotalPrice;
                        }else{
                            nrc = nrc + item.TotalPrice;
                        }
                        Wrapperclass w = new Wrapperclass(mrc,nrc);
                        wrapperMap.put(siteno, w);
                    }
                    if(item.Type_of_Billing__c == 'MRC'){
                        totmrc = totmrc + item.TotalPrice;
                        mrcBroadband = mrcBroadband + item.TotalPrice;
                    }
                    else{
                        totnrc = totnrc + item.TotalPrice;
                        nrcBroadband = nrcBroadband + item.TotalPrice;
                    }
                    if(broadbandMap != null && !broadbandMap.isEmpty() && broadbandMap.containsKey(siteno)){
                        String val = broadbandMap.get(siteno);
                        broadbandMap.put(siteno,val);     
                    }
                    else
                    {
                        broadbandMap.put(siteno,'test');                        
                    }
                }
                
                for(Site__c s: lstSite){
                    Integer siteno =  Integer.valueOf(s.Site_Number__c);
                    if(broadbandMap != null && !broadbandMap.isEmpty() && broadbandMap.containsKey(siteno)){  
                        
                        
                    } else{
                        broadbandMap.put(siteno,'false');
                    }
                } 
            }
            
            if(FIOSItemList != null && !FIOSItemList.isEmpty()){
                for(OpportunityLineItem item : FIOSItemList){
                    Integer siteno =  Integer.valueOf(item.Site_Number__c);
                    if(wrapperMap != null && !wrapperMap.isEmpty() && wrapperMap.containsKey(siteno)){
                        decimal mrc = 0.0;
                        decimal nrc = 0.0;
                        Wrapperclass w = new Wrapperclass(mrc,nrc);
                        w = wrapperMap.get(siteno);
                        if(item.Type_of_Billing__c == 'MRC'){
                            w.mrc = w.mrc + item.TotalPrice;
                        }else{
                            w.nrc = w.nrc + item.TotalPrice;
                        }
                        wrapperMap.put(siteno,w);
                        
                    }else{
                        decimal mrc = 0.0;
                        decimal nrc = 0.0;
                        if(item.Type_of_Billing__c == 'MRC'){
                            mrc = mrc + item.TotalPrice;
                        }else{
                            nrc = nrc + item.TotalPrice;
                        }
                        Wrapperclass w = new Wrapperclass(mrc,nrc);
                        wrapperMap.put(siteno, w);
                    }
                    if(item.Type_of_Billing__c == 'MRC'){
                        totmrc = totmrc + item.TotalPrice;
                        mrcFIOS = mrcFIOS + item.TotalPrice;
                    }
                    else{
                        totnrc = totnrc + item.TotalPrice;
                        nrcFIOS = nrcFIOS + item.TotalPrice;
                    }
                    if(FIOSMap != null && !FIOSMap.isEmpty() && FIOSMap.containsKey(siteno)){
                        String val = FIOSMap.get(siteno);
                        FIOSMap.put(siteno,val);     
                    }
                    else
                    {
                        FIOSMap.put(siteno,'test');                        
                    }
                }
                
                for(Site__c s: lstSite){
                    Integer siteno =  Integer.valueOf(s.Site_Number__c);
                    if(FIOSMap != null && !FIOSMap.isEmpty() && FIOSMap.containsKey(siteno)){  
                        
                        
                    } else{
                        FIOSMap.put(siteno,'false');
                    }
                }  
            }
            if(fiberItemList != null && !fiberItemList.isEmpty()){
                for(OpportunityLineItem item : fiberItemList){
                    Integer siteno =  Integer.valueOf(item.Site_Number__c);
                    if(wrapperMap != null && !wrapperMap.isEmpty() && wrapperMap.containsKey(siteno)){
                        decimal mrc = 0.0;
                        decimal nrc = 0.0;
                        Wrapperclass w = new Wrapperclass(mrc,nrc);
                        w = wrapperMap.get(siteno);
                        if(item.Type_of_Billing__c == 'MRC'){
                            w.mrc = w.mrc + item.TotalPrice;
                        }else{
                            w.nrc = w.nrc + item.TotalPrice;
                        }
                        wrapperMap.put(siteno,w);
                        
                    }else{
                        decimal mrc = 0.0;
                        decimal nrc = 0.0;
                        if(item.Type_of_Billing__c == 'MRC'){
                            mrc = mrc + item.TotalPrice;
                        }else{
                            nrc = nrc + item.TotalPrice;
                        }
                        Wrapperclass w = new Wrapperclass(mrc,nrc);
                        wrapperMap.put(siteno, w);
                    }
                    if(item.Type_of_Billing__c == 'MRC'){
                        totmrc = totmrc + item.TotalPrice;
                        mrcFiber = mrcFiber + item.TotalPrice;
                    }
                    else{
                        totnrc = totnrc + item.TotalPrice;
                        nrcFiber = nrcFiber + item.TotalPrice;
                    }
                    if(fiberMap != null && !fiberMap.isEmpty() && fiberMap.containsKey(siteno)){
                        String val = fiberMap.get(siteno);
                        fiberMap.put(siteno,val);     
                    }
                    else
                    {
                        fiberMap.put(siteno,'test');                        
                    }
                }
                
                for(Site__c s: lstSite){
                    Integer siteno =  Integer.valueOf(s.Site_Number__c);
                    if(fiberMap != null && !fiberMap.isEmpty() && fiberMap.containsKey(siteno)){  
                        
                        
                    } else{
                        fiberMap.put(siteno,'false');
                    }
                }  
            }
            if(BHSIItemList != null && !BHSIItemList.isEmpty()){
                for(OpportunityLineItem item : BHSIItemList){
                    Integer siteno =  Integer.valueOf(item.Site_Number__c);
                    if(wrapperMap != null && !wrapperMap.isEmpty() && wrapperMap.containsKey(siteno)){
                        decimal mrc = 0.0;
                        decimal nrc = 0.0;
                        Wrapperclass w = new Wrapperclass(mrc,nrc);
                        w = wrapperMap.get(siteno);
                        if(item.Type_of_Billing__c == 'MRC'){
                            w.mrc = w.mrc + item.TotalPrice;
                        }else{
                            w.nrc = w.nrc + item.TotalPrice;
                        }
                        wrapperMap.put(siteno,w);
                        
                    }else{
                        decimal mrc = 0.0;
                        decimal nrc = 0.0;
                        if(item.Type_of_Billing__c == 'MRC'){
                            mrc = mrc + item.TotalPrice;
                        }else{
                            nrc = nrc + item.TotalPrice;
                        }
                        Wrapperclass w = new Wrapperclass(mrc,nrc);
                        wrapperMap.put(siteno, w);
                    }
                    if(item.Type_of_Billing__c == 'MRC'){
                        totmrc = totmrc + item.TotalPrice;
                        mrcBHSI = mrcBHSI + item.TotalPrice;
                    }
                    else{
                        totnrc = totnrc + item.TotalPrice;
                        nrcBHSI = nrcBHSI + item.TotalPrice;
                    }
                    if(BHSIMap != null && !BHSIMap.isEmpty() && BHSIMap.containsKey(siteno)){
                        String val = BHSIMap.get(siteno);
                        BHSIMap.put(siteno,val);     
                    }
                    else
                    {
                        BHSIMap.put(siteno,'test');                        
                    }
                }
                
                for(Site__c s: lstSite){
                    Integer siteno =  Integer.valueOf(s.Site_Number__c);
                    if(BHSIMap != null && !BHSIMap.isEmpty() && BHSIMap.containsKey(siteno)){  
                    } else{
                        BHSIMap.put(siteno,'false');
                    }
                }   
            }
            
            /*if(asymetricFiberItemList != null && !asymetricFiberItemList.isEmpty()){
                for(OpportunityLineItem item : asymetricFiberItemList){
                    Integer siteno =  Integer.valueOf(item.Site_Number__c);
                    if(wrapperMap != null && !wrapperMap.isEmpty() && wrapperMap.containsKey(siteno)){
                        decimal mrc = 0.0;
                        decimal nrc = 0.0;
                        Wrapperclass w = new Wrapperclass(mrc,nrc);
                        w = wrapperMap.get(siteno);
                        if(item.Type_of_Billing__c == 'MRC'){
                            w.mrc = w.mrc + item.TotalPrice;
                        }else{
                            w.nrc = w.nrc + item.TotalPrice;
                        }
                        wrapperMap.put(siteno,w);
                        
                    }else{
                        decimal mrc = 0.0;
                        decimal nrc = 0.0;
                        if(item.Type_of_Billing__c == 'MRC'){
                            mrc = mrc + item.TotalPrice;
                        }else{
                            nrc = nrc + item.TotalPrice;
                        }
                        Wrapperclass w = new Wrapperclass(mrc,nrc);
                        wrapperMap.put(siteno, w);
                    }
                    if(item.Type_of_Billing__c == 'MRC'){
                        totmrc = totmrc + item.TotalPrice;
                        mrcAsyFiber = mrcAsyFiber + item.TotalPrice;
                    }
                    else{
                        totnrc = totnrc + item.TotalPrice;
                        nrcAsyFiber = nrcAsyFiber + item.TotalPrice;
                    }
                    if(asyFiberMap != null && !asyFiberMap.isEmpty() && asyFiberMap.containsKey(siteno)){
                        String val = asyFiberMap.get(siteno);
                        asyFiberMap.put(siteno,val);     
                    }
                    else
                    {
                        asyFiberMap.put(siteno,'test');                        
                    }
                }
                
                for(Site__c s: lstSite){
                    Integer siteno =  Integer.valueOf(s.Site_Number__c);
                    if(asyFiberMap != null && !asyFiberMap.isEmpty() && asyFiberMap.containsKey(siteno)){  
                    } else{
                        asyFiberMap.put(siteno,'false');
                    }
                }   
            }
            */
            if(setUpList != null && !setUpList.isEmpty()){
                for(OpportunityLineItem item:setUpList){
                    System.debug('====item setup==='+item);
                    Integer siteno =  Integer.valueOf(item.Site_Number__c);
                    if(wrapperMap != null && !wrapperMap.isEmpty() && wrapperMap.containsKey(siteno)){
                        decimal mrc = 0.0;
                        decimal nrc = 0.0;
                        Wrapperclass w = new Wrapperclass(mrc,nrc);
                        w = wrapperMap.get(siteno);
                        w.nrc = w.nrc + item.TotalPrice;
                        wrapperMap.put(siteno,w);
                        
                    }else{
                        decimal mrc = 0.0;
                        decimal nrc = 0.0;
                        nrc = nrc + item.TotalPrice;
                        Wrapperclass w = new Wrapperclass(mrc,nrc);
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
                
                for(Site__c s: lstSite){
                    Integer siteno =  Integer.valueOf(s.Site_Number__c);
                    if(otherMap != null && !otherMap.isEmpty() && otherMap.containsKey(siteno)){  
                        
                        
                    } else{
                        otherMap.put(siteno,'false');
                    }
                } 
            }
            
            if(childList != null && !childList.isEmpty()){
                for(OpportunityLineItem item : childList){
                    Integer siteno =  Integer.valueOf(item.Site_Number__c);
                    if(wrapperMap != null && !wrapperMap.isEmpty() && wrapperMap.containsKey(siteno)){
                        decimal mrc = 0.0;
                        decimal nrc = 0.0;
                        Wrapperclass w = new Wrapperclass(mrc,nrc);
                        w = wrapperMap.get(siteno);
                        if(item.Sub_Category__c == 'Installation'){
                            if(item.Type_of_Billing__c == 'MRC'){
                                w.mrc = w.mrc + item.TotalPrice;
                            }else{
                                w.nrc = w.nrc + item.TotalPrice;
                            }
                        }
                        wrapperMap.put(siteno,w);
                        
                    }else{
                        decimal mrc = 0.0;
                        decimal nrc = 0.0;
                        if(item.Sub_Category__c == 'Installation'){
                            if(item.Type_of_Billing__c == 'MRC'){
                                mrc = mrc + item.TotalPrice;
                            }else{
                                nrc = nrc + item.TotalPrice;
                            }
                        }
                        Wrapperclass w = new Wrapperclass(mrc,nrc);
                        wrapperMap.put(siteno, w);
                    }
                    
                    if(item.Sub_Category__c == 'Installation'){
                        if(item.Type_of_Billing__c == 'MRC'){
                            totmrc = totmrc + item.TotalPrice;
                            mrcInstall = mrcInstall + item.TotalPrice;
                        }else{
                            totnrc = totnrc + item.TotalPrice;
                            nrcInstall = nrcInstall + item.TotalPrice;
                        }
                    }
                    
                    if(InstallationSite != null && !InstallationSite.isEmpty() && InstallationSite.containsKey(siteno)){
                        decimal total =   InstallationSite.get(siteno);
                        if(item.Sub_Category__c == 'Installation'){
                            InstallationSite.put(siteno,total+item.TotalPrice);
                        }
                    }
                    else{
                        if(item.Sub_Category__c == 'Installation'){
                            InstallationSite.put(siteno,item.TotalPrice);
                        }
                    }
                }
                
                for(Site__c s: lstSite){
                    Integer siteno =  Integer.valueOf(s.Site_Number__c);
                    if(InstallationSite != null && !InstallationSite.isEmpty() && InstallationSite.containsKey(siteno)){
                        
                    }else{
                        decimal tot = 0.0;
                        InstallationSite.put(siteno,tot);
                        
                    }
                } 
            } 
            
            if(opp.Contract_Term_Years__c != null){
                tottcv = tottcv+(totmrc*12*opp.Contract_Term_Years__c + totnrc);
            }
            mrcTotal = mrclic + mrcIp + mrcAddon  + mrcTeleCom + mrcSwitch + mrcRepair + mrcEquipment + mrcBroadband + mrcFIOS + mrcFiber + mrcBHSI + mrcActivation + mrcInstall  ;
            nrcTotal = nrclic + nrcIp + nrcAddon  + nrcTeleCom +  nrcSwitch + nrcRepair + nrcEquipment + nrcBroadband + nrcFIOS + nrcFiber + nrcBHSI + nrcActivation + nrcInstall  ;
        }
    }
    
    // contract child
    public PageReference save() {
        system.debug('==clikOnSave==0'+Id);
        system.debug('===scheduleId===0'+scheduleId);
        system.debug('==oppId*************testhgcjkjhvjlhgkj=========='+Id);
        system.debug('==URL Id ==='+ApexPages.currentPage().getParameters().get('id'));
        OpportunityId = ApexPages.currentPage().getParameters().get('id');
        PageReference pageRef = Page.smartVoiceContractPdf3;
        pageRef.getParameters().put('scheduleId','scheduleId');
        pageRef.getParameters().put('todayDate','todayDate');
        pageRef.getParameters().put('addFrontierInfo','addFrontierInfo');
        pageRef.getParameters().put('addSiteInfo','addFrontierInfo');
        pageRef.getParameters().put('Id',OpportunityId);
        //pageRef.getParameters().put('oppId',Id);
        return pageRef ;
    }
    
    // smart voice contract pdf
    public void attachPdf(){
        system.debug('anuj pdf id' + Id);
        System.debug('===OpportunityId----'+OpportunityId);
        licensesItemList2 = [Select id,Site__c,PremiumRule__c,PremiumPlusRule__c,isConferenceRumSeatRule__c,isAnalogRule__c,isEssential__c,isElite__c,isPremier__c,isOutbound__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c  from OpportunityLineItem where OpportunityId =: Id and (Category__c =: 'Smart Voice' AND Sub_Category__c=: 'Licenses')  and Releted__c !=: 'child' and SetUp__c !=: 'Setup'and Filter_Product__c =:'Parent' ORDER BY Index__c];
        ipPhoneItemList2 = [Select id,Equipment__c,isVVX311__c,isVVX501__c,isVVX601__c,isSoundStationIp5000__c,isSoundStationIp6000__c,isSoundStationIp7000__c,Site__c,Product_Name__c,SetUp__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c  from OpportunityLineItem where OpportunityId =: Id and Category__c =: 'Smart Voice' AND (Sub_Category__c=: 'IP Phones' OR Sub_Category__c=: 'Installation') and Releted__c !=: 'child' and SetUp__c !=: 'Setup' and Filter_Product__c =:'Parent' ORDER BY Index__c];
        adOnItemList2 = [Select id,Site__c,isSmartAdditionalDID__c,isSmartAdditionalManagedAutoAttendant__c,isSmartDirectoryListing__c,isSmartE911__c,isSmartExtendedNum__c,isSmartMonthlyAdminCharge__c,isSmartMultiLineHunt__c,isSmartPremiumAttendant__c,isSmartTollFreeDomestic__c,isSmartTollFreeDomesticUS__c,isSmartTollFreeNum__c,isAdditionalDID__c,isCallerId__c,isAdditionalDirectory__c,isExtendedMarket__c,isAdditionalManaged__c,isBusinessAnalytic__c,isTollFreeNum__c,isE911__c,isWebFax__c,Product_Name__c,SetUp__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,nrc_total__c,Type_of_Billing__c,Term__c,Releted__c  from OpportunityLineItem where OpportunityId =: Id and (Category__c =: 'Smart Voice' AND Sub_Category__c=: 'Add-On') and Releted__c !=: 'child' and SetUp__c !=: 'Setup' and Filter_Product__c =:'Parent' ORDER BY Index__c];
        TeleComItemList2 = [Select id,Site__c,Product_Name__c,SetUp__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,nrc_total__c,Type_of_Billing__c,Term__c,Releted__c  from OpportunityLineItem where OpportunityId =: Id and (Category__c =: 'Smart Voice' AND Sub_Category__c=: 'Toll Free Bundle Minutes') and Releted__c !=: 'child' and SetUp__c !=: 'Setup' and Filter_Product__c =:'Parent' ORDER BY Index__c];
        switchesItemList2 = [Select id,isPolycomATA__c,Site__c,isNETGEAR__c,Equipment__c,Product_Name__c,SetUp__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c  from OpportunityLineItem where OpportunityId =: Id and (Category__c =: 'Smart Voice' AND Sub_Category__c=: 'Switches and PoE') and Releted__c !=: 'child' and SetUp__c !=: 'Setup' and Filter_Product__c =:'Parent' ORDER BY Index__c];
        RepairItemList2 = [Select id,Site__c,isEssential__c,isElite__c,isPremier__c,isOutbound__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c  from OpportunityLineItem where OpportunityId =: Id and (Category__c =: 'Smart Voice' AND Sub_Category__c=: 'Licenses')  and Releted__c !=: 'child' and SetUp__c !=: 'Setup'and Filter_Product__c =:'Parent' ORDER BY Index__c];
        equipmentItemList2 = [Select id,Site__c,isEssential__c,isElite__c,isPremier__c,isOutbound__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c  from OpportunityLineItem where OpportunityId =: Id and (Category__c =: 'Smart Voice' AND Sub_Category__c=: 'Licenses')  and Releted__c !=: 'child' and SetUp__c !=: 'Setup'and Filter_Product__c =:'Parent' ORDER BY Index__c];
        broadbandItemList2 = [Select id,Site__c,BroadbandIpOptionEach__c,BroadbandIpOption5Ips__c,BroadbandIpOption13Ips__c,isEssential__c,isElite__c,isPremier__c,isOutbound__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c  from OpportunityLineItem where OpportunityId =: Id and (Category__c =: 'Smart Voice' AND Sub_Category__c=: 'Broadband')  and Releted__c !=: 'child' and SetUp__c !=: 'Setup'and Filter_Product__c =:'Parent' ORDER BY Index__c];
        FIOSItemList2 = [Select id,Site__c,SmartVoice_FiOS_100_100_Broadband__c,SmartVoice_FiOS_500_500_Broadband__c,SmartVoice_FiOS_1G_1G_Broadband__c,isEssential__c,isElite__c,isPremier__c,isOutbound__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c  from OpportunityLineItem where OpportunityId =: Id and (Category__c =: 'Smart Voice' AND Sub_Category__c=: 'FIOS')  and Releted__c !=: 'child' and SetUp__c !=: 'Setup'and Filter_Product__c =:'Parent' ORDER BY Index__c];
        fiberItemList2 = [Select id,Site__c,SmartVoice_Fiber_100_100_Broadband__c,SmartVoice_Fiber_500_500_Broadband__c,SmartVoice_Fiber_1G_1G_Broadband__c,isEssential__c,isElite__c,isPremier__c,isOutbound__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c  from OpportunityLineItem where OpportunityId =: Id and (Category__c =: 'Smart Voice' AND Sub_Category__c =: 'Fiber')  and Releted__c !=: 'child' and SetUp__c !=: 'Setup'and Filter_Product__c =:'Parent' ORDER BY Index__c];
        BHSIItemList2 = [Select id,Site__c,SmartVoice_Broadband_12__c,SmartVoice_Broadband_18__c,SmartVoice_Broadband_25__c,SmartVoice_Broadband_35__c,SmartVoice_Broadband_45__c,SmartVoice_Broadband_70__c,SmartVoice_Broadband_90__c,SmartVoice_Broadband_115__c,isEssential__c,isElite__c,isPremier__c,isOutbound__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c  from OpportunityLineItem where OpportunityId =: Id and (Category__c =: 'Smart Voice' AND Sub_Category__c=: 'BHSI')  and Releted__c !=: 'child' and SetUp__c !=: 'Setup'and Filter_Product__c =:'Parent' ORDER BY Index__c];
        asymetricFiberItemList2 = [Select id,Site__c,isEssential__c,isElite__c,isPremier__c,isOutbound__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c  from OpportunityLineItem where OpportunityId =: Id and (Category__c =: 'Smart Voice' AND Sub_Category__c=: 'Licenses')  and Releted__c !=: 'child' and SetUp__c !=: 'Setup'and Filter_Product__c =:'Parent' ORDER BY Index__c];
        setUpList2 = [Select id,SmartVoice_Fiber_100_100_Broadband__c,SmartVoice_Fiber_500_500_Broadband__c,SmartVoice_Fiber_1G_1G_Broadband__c,SmartVoice_FiOS_100_100_Broadband__c,SmartVoice_FiOS_500_500_Broadband__c,SmartVoice_FiOS_1G_1G_Broadband__c,SmartVoice_Broadband_12__c,SmartVoice_Broadband_18__c,SmartVoice_Broadband_25__c,SmartVoice_Broadband_35__c,SmartVoice_Broadband_45__c,SmartVoice_Broadband_70__c,SmartVoice_Broadband_90__c,SmartVoice_Broadband_115__c,PremiumPlusRule__c,isConferenceRumSeatRule__c,isAnalogRule__c,isSmartAdditionalDID__c,isSmartPremiumAttendant__c,isSmartDirectoryListing__c,isSmartExtendedNum__c,isSmartTollFreeNum__c,isSmartMultiLineHunt__c,isSmartAdditionalManagedAutoAttendant__c,isSmartE911__c,isSmartMonthlyAdminCharge__c,PremiumRule__c,isSmartTollFreeDomestic__c,Site__c,isEssential__c,isElite__c,isPremier__c,isOutbound__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c  from OpportunityLineItem where OpportunityId =: Id and Category__c =: 'Smart Voice'  and Releted__c !=: 'child' and SetUp__c =: 'Setup'and Filter_Product__c =:'Child' ORDER BY Index__c];
        //  installationList2 = [Select id,Site__c,isTechInstallFeeBHSI__c,isTechInstallFeeFiber__c,isTechInstallFeeFIOS__c,isEssential__c,isElite__c,isPremier__c,isOutbound__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,Quantity,Sub_Total__c,TotalPrice,SetUp__c,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,Type_of_Billing__c,Term__c,Releted__c,Filter_Product__c  from OpportunityLineItem where OpportunityId =: Id and (Category__c =: 'Smart Voice' AND Sub_Category__c=: 'Licenses')  and Releted__c !=: 'child' and SetUp__c !=: 'Setup'and Filter_Product__c =:'Parent' ORDER BY Index__c];
        installationList2 = [Select id,Site__c,isTechInstallFeeBHSI__c,isTechInstallFeeFiber__c,isTechInstallFeeFIOS__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,SetUp__c,Quantity,Sub_Total__c,TotalPrice,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,nrc_total__c,Type_of_Billing__c,Term__c,Releted__c from OpportunityLineItem where OpportunityId =: Id and  (Category__c =: 'Smart Voice' AND Sub_Category__c=: 'Installation') and Releted__c =: 'child' and Filter_Product__c =:'Child' ORDER BY Index__c];
        activationFeesList2 = [Select id,Site__c,isPolycomATA__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,SetUp__c,Quantity,Sub_Total__c,TotalPrice,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,nrc_total__c,Type_of_Billing__c,Term__c,Releted__c from OpportunityLineItem where OpportunityId =: Id and  (Category__c =: 'Smart Voice' AND Sub_Category__c=: 'Activation Fees')  and SetUp__c =: 'Setup' and Releted__c !=: 'child' and Filter_Product__c =:'Child' ORDER BY Index__c];
                equipmentList2 = [Select id,Site__c,Equipment__c,Product_Name__c,ProductCode,Product2Id,Unit_Price__c,SetUp__c,Quantity,Sub_Total__c,TotalPrice,OpportunityId,Category__c,Sub_Category__c,Index__c,Site_Number__c,NRC__c,nrc_total__c,Type_of_Billing__c,Term__c,Releted__c from OpportunityLineItem where OpportunityId =: Id and  Category__c =: 'Smart Voice' and Equipment__c =: true ORDER BY Index__c];

        system.debug('======licensesItemList2========='+licensesItemList2.size());
        
        if(licensesItemList2 != null && !licensesItemList2.isEmpty()){
            for(OpportunityLineItem item:licensesItemList2){
                System.debug('====lic*******-----'+item);
                if(item.PremiumRule__c == true){
                    System.debug('====item.PremiumRule__c ==='+item.PremiumRule__c); 
                    if(item.Type_of_Billing__c == 'MRC'){
                        if(premiumOppmrc != null && premiumOppmrc.Quantity != null && item.Quantity != null && premiumOppmrc.TotalPrice  != null){
                            System.debug('====mrc qty ==='+premiumOppmrc);
                            premiumOppmrc.Quantity = premiumOppmrc.Quantity + item.Quantity;
                            premiumOppmrc.TotalPrice = premiumOppmrc.TotalPrice + item.TotalPrice;
                        }else{
                            premiumOppmrc =  item; 
                            
                        }  
                    }  
                    else{
                        if(premiumOppnrc != null && premiumOppnrc.Quantity != null && item.Quantity != null && premiumOppnrc.TotalPrice != null){
                            premiumOppnrc.Quantity = premiumOppnrc.Quantity + item.Quantity;
                            premiumOppnrc.TotalPrice = premiumOppnrc.TotalPrice + item.TotalPrice;
                        }else{
                            premiumOppnrc =  item; 
                        } 
                    }
                }
                if(item.PremiumPlusRule__c == true){
                    if(item.Type_of_Billing__c == 'MRC'){
                        if(premiumlusOppmrc != null && premiumlusOppmrc.Quantity != null && item.Quantity != null && premiumlusOppmrc.TotalPrice != null){
                            premiumlusOppmrc.Quantity = premiumlusOppmrc.Quantity + item.Quantity;
                            premiumlusOppmrc.TotalPrice = premiumlusOppmrc.TotalPrice + item.TotalPrice;
                        }else{
                            premiumlusOppmrc =  item; 
                            
                        }  
                    }  
                    else{
                        if(premiumlusOppnrc != null && premiumlusOppnrc.Quantity != null && item.Quantity != null &&  premiumlusOppnrc.TotalPrice != null){
                            premiumlusOppnrc.Quantity = premiumlusOppnrc.Quantity + item.Quantity;
                            premiumlusOppnrc.TotalPrice = premiumlusOppnrc.TotalPrice + item.TotalPrice;
                        }else{
                            premiumlusOppnrc =  item; 
                        } 
                    }
                }  
                if(item.isConferenceRumSeatRule__c == true){
                    if(item.Type_of_Billing__c == 'MRC'){
                        if(conferenceOppmrc != null && conferenceOppmrc.Quantity != null && item.Quantity != null && conferenceOppmrc.TotalPrice != null){
                            conferenceOppmrc.Quantity = conferenceOppmrc.Quantity + item.Quantity;
                            conferenceOppmrc.TotalPrice = conferenceOppmrc.TotalPrice + item.TotalPrice;
                        }else{
                            conferenceOppmrc =  item; 
                            
                        }  
                    }  
                    else{
                        if(conferenceOppnrc != null && conferenceOppnrc.Quantity != null && item.Quantity != null &&  conferenceOppnrc.TotalPrice != null){
                            conferenceOppnrc.Quantity = conferenceOppnrc.Quantity + item.Quantity;
                            conferenceOppnrc.TotalPrice = conferenceOppnrc.TotalPrice + item.TotalPrice;
                        }else{
                            conferenceOppnrc =  item; 
                        } 
                    }
                }  
                if(item.isAnalogRule__c == true){
                    if(item.Type_of_Billing__c == 'MRC'){
                        if(analogOppmrc != null && analogOppmrc.Quantity != null && item.Quantity != null && analogOppmrc.TotalPrice != null){
                            analogOppmrc.Quantity = analogOppmrc.Quantity + item.Quantity;
                            analogOppmrc.TotalPrice = analogOppmrc.TotalPrice + item.TotalPrice;
                        }else{
                            analogOppmrc =  item; 
                            
                        }  
                    }  
                    else{
                        if(analogOppnrc != null && analogOppnrc.Quantity != null && item.Quantity != null &&  analogOppnrc.TotalPrice != null){
                            analogOppnrc.Quantity = analogOppnrc.Quantity + item.Quantity;
                            analogOppnrc.TotalPrice = analogOppnrc.TotalPrice + item.TotalPrice;
                        }else{
                            analogOppnrc =  item; 
                        } 
                    }
                }  
            }
        }
        system.debug('======adOnItemList2========='+adOnItemList2.size());
        
        if(adOnItemList2 != null && !adOnItemList2.isEmpty()){
            for(OpportunityLineItem item:adOnItemList2){
                if(item.isSmartAdditionalDID__c == true){
                    system.debug('======anuj add on=========');
                    if(item.Type_of_Billing__c == 'MRC'){
                        if(additionalDIDmrc != null && additionalDIDmrc.Quantity != null && item.Quantity != null && additionalDIDmrc.TotalPrice != null){
                            additionalDIDmrc.Quantity = additionalDIDmrc.Quantity + item.Quantity;
                            additionalDIDmrc.TotalPrice = additionalDIDmrc.TotalPrice + item.TotalPrice;
                        }else{
                            additionalDIDmrc =  item; 
                            
                        }  
                    }  
                    else{
                        if(additionalDIDnrc != null && additionalDIDnrc.Quantity != null && item.Quantity !=null &&  additionalDIDnrc.TotalPrice != null){
                            additionalDIDnrc.Quantity = additionalDIDnrc.Quantity + item.Quantity;
                            additionalDIDnrc.TotalPrice = additionalDIDnrc.TotalPrice + item.TotalPrice;
                        }else{
                            additionalDIDnrc =  item; 
                        } 
                    }
                }
                if(item.isSmartAdditionalManagedAutoAttendant__c == true){
                    if(item.Type_of_Billing__c == 'MRC'){
                        if(additionalManagedAutoAttendantDmrc != null && additionalManagedAutoAttendantDmrc.Quantity != null && item.Quantity != null && additionalManagedAutoAttendantDmrc.TotalPrice != null){
                            additionalManagedAutoAttendantDmrc.Quantity = additionalManagedAutoAttendantDmrc.Quantity + item.Quantity;
                            additionalManagedAutoAttendantDmrc.TotalPrice = additionalManagedAutoAttendantDmrc.TotalPrice + item.TotalPrice;
                        }else{
                            additionalManagedAutoAttendantDmrc =  item; 
                            
                        }  
                    }  
                    else{
                        if(additionalManagedAutoAttendantDnrc != null && additionalManagedAutoAttendantDnrc.Quantity != null && item.Quantity !=null &&  additionalManagedAutoAttendantDnrc.TotalPrice != null){
                            additionalManagedAutoAttendantDnrc.Quantity = additionalManagedAutoAttendantDnrc.Quantity + item.Quantity;
                            additionalManagedAutoAttendantDnrc.TotalPrice = additionalManagedAutoAttendantDnrc.TotalPrice + item.TotalPrice;
                        }else{
                            additionalManagedAutoAttendantDnrc =  item; 
                        } 
                    }
                }
                if(item.isSmartDirectoryListing__c == true){
                    if(item.Type_of_Billing__c == 'MRC'){
                        if(directoryListingmrc != null && directoryListingmrc.Quantity != null && item.Quantity != null && directoryListingmrc.TotalPrice != null){
                            directoryListingmrc.Quantity = directoryListingmrc.Quantity + item.Quantity;
                            directoryListingmrc.TotalPrice = directoryListingmrc.TotalPrice + item.TotalPrice;
                        }else{
                            directoryListingmrc =  item; 
                            
                        }  
                    }  
                    else{
                        if(directoryListingnrc != null && directoryListingnrc.Quantity != null && item.Quantity !=null &&  directoryListingnrc.TotalPrice != null){
                            directoryListingnrc.Quantity = directoryListingnrc.Quantity + item.Quantity;
                            directoryListingnrc.TotalPrice = directoryListingnrc.TotalPrice + item.TotalPrice;
                        }else{
                            directoryListingnrc =  item; 
                        } 
                    }
                }
                if(item.isSmartE911__c == true){
                    if(item.Type_of_Billing__c == 'MRC'){
                        if(E911mrc != null && E911mrc.Quantity != null && item.Quantity != null && E911mrc.TotalPrice != null){
                            E911mrc.Quantity = E911mrc.Quantity + item.Quantity;
                            E911mrc.TotalPrice = E911mrc.TotalPrice + item.TotalPrice;
                        }else{
                            E911mrc =  item; 
                            
                        }  
                    }  
                    else{
                        if(E911nrc != null && E911nrc.Quantity != null && item.Quantity !=null &&  E911nrc.TotalPrice != null){
                            E911nrc.Quantity = E911nrc.Quantity + item.Quantity;
                            E911nrc.TotalPrice = E911nrc.TotalPrice + item.TotalPrice;
                        }else{
                            E911nrc =  item; 
                        } 
                    }
                }
                if(item.isSmartExtendedNum__c == true){
                    if(item.Type_of_Billing__c == 'MRC'){
                        if(extendedNumMrc != null && extendedNumMrc.Quantity != null && item.Quantity != null && extendedNumMrc.TotalPrice != null){
                            extendedNumMrc.Quantity = extendedNumMrc.Quantity + item.Quantity;
                            extendedNumMrc.TotalPrice = extendedNumMrc.TotalPrice + item.TotalPrice;
                        }else{
                            extendedNumMrc =  item; 
                            
                        }  
                    }  
                    else{
                        if(extendedNumNrc != null && extendedNumNrc.Quantity != null && item.Quantity !=null &&  extendedNumNrc.TotalPrice != null){
                            extendedNumNrc.Quantity = extendedNumNrc.Quantity + item.Quantity;
                            extendedNumNrc.TotalPrice = extendedNumNrc.TotalPrice + item.TotalPrice;
                        }else{
                            extendedNumNrc =  item; 
                        } 
                    }
                }
                if(item.isSmartMonthlyAdminCharge__c == true){
                    if(item.Type_of_Billing__c == 'MRC'){
                        if(monthlyAdminChargeMrc != null && monthlyAdminChargeMrc.Quantity != null && item.Quantity != null && monthlyAdminChargeMrc.TotalPrice != null){
                            monthlyAdminChargeMrc.Quantity = monthlyAdminChargeMrc.Quantity + item.Quantity;
                            monthlyAdminChargeMrc.TotalPrice = monthlyAdminChargeMrc.TotalPrice + item.TotalPrice;
                        }else{
                            monthlyAdminChargeMrc =  item; 
                            
                        }  
                    }  
                    else{
                        if(monthlyAdminChargeNrc != null && monthlyAdminChargeNrc.Quantity != null && item.Quantity !=null &&  monthlyAdminChargeNrc.TotalPrice != null){
                            monthlyAdminChargeNrc.Quantity = monthlyAdminChargeNrc.Quantity + item.Quantity;
                            monthlyAdminChargeNrc.TotalPrice = monthlyAdminChargeNrc.TotalPrice + item.TotalPrice;
                        }else{
                            monthlyAdminChargeNrc =  item; 
                        } 
                    }
                }
                if(item.isSmartMultiLineHunt__c == true){
                    if(item.Type_of_Billing__c == 'MRC'){
                        if(multiLineHuntMrc != null && multiLineHuntMrc.Quantity != null && item.Quantity != null && multiLineHuntMrc.TotalPrice != null){
                            multiLineHuntMrc.Quantity = multiLineHuntMrc.Quantity + item.Quantity;
                            multiLineHuntMrc.TotalPrice = multiLineHuntMrc.TotalPrice + item.TotalPrice;
                        }else{
                            multiLineHuntMrc =  item; 
                            
                        }  
                    }  
                    else{
                        if(multiLineHuntNrc != null && multiLineHuntNrc.Quantity != null && item.Quantity !=null &&  multiLineHuntNrc.TotalPrice != null){
                            multiLineHuntNrc.Quantity = multiLineHuntNrc.Quantity + item.Quantity;
                            multiLineHuntNrc.TotalPrice = multiLineHuntNrc.TotalPrice + item.TotalPrice;
                        }else{
                            multiLineHuntNrc =  item; 
                        } 
                    }
                } 
                if(item.isSmartPremiumAttendant__c == true){
                    if(item.Type_of_Billing__c == 'MRC'){
                        if(premiumAttendantMrc != null && premiumAttendantMrc.Quantity != null && item.Quantity != null && premiumAttendantMrc.TotalPrice != null){
                            premiumAttendantMrc.Quantity = premiumAttendantMrc.Quantity + item.Quantity;
                            premiumAttendantMrc.TotalPrice = premiumAttendantMrc.TotalPrice + item.TotalPrice;
                        }else{
                            premiumAttendantMrc =  item; 
                            
                        }  
                    }  
                    else{
                        if(premiumAttendantNrc != null && premiumAttendantNrc.Quantity != null && item.Quantity !=null &&  premiumAttendantNrc.TotalPrice != null){
                            premiumAttendantNrc.Quantity = premiumAttendantNrc.Quantity + item.Quantity;
                            premiumAttendantNrc.TotalPrice = premiumAttendantNrc.TotalPrice + item.TotalPrice;
                        }else{
                            premiumAttendantNrc =  item; 
                        } 
                    }
                }
                /*if(item.isSmartTollFreeDomestic__c == true){
                    if(item.Type_of_Billing__c == 'MRC'){
                        if(tollFreeDomesticMrc != null && tollFreeDomesticMrc.Quantity != null && item.Quantity != null && tollFreeDomesticMrc.TotalPrice != null){
                            tollFreeDomesticMrc.Quantity = tollFreeDomesticMrc.Quantity + item.Quantity;
                            tollFreeDomesticMrc.TotalPrice = tollFreeDomesticMrc.TotalPrice + item.TotalPrice;
                        }else{
                            tollFreeDomesticMrc =  item; 
                            
                        }  
                    }  
                    else{
                        if(tollFreeDomesticNrc != null && tollFreeDomesticNrc.Quantity != null && item.Quantity !=null &&  tollFreeDomesticNrc.TotalPrice != null){
                            tollFreeDomesticNrc.Quantity = tollFreeDomesticNrc.Quantity + item.Quantity;
                            tollFreeDomesticNrc.TotalPrice = tollFreeDomesticNrc.TotalPrice + item.TotalPrice;
                        }else{
                            tollFreeDomesticNrc =  item; 
                        } 
                    }
                } */
                if(item.isSmartTollFreeDomesticUS__c == true){
                    if(item.Type_of_Billing__c == 'MRC'){
                        if(tollFreeDomesticUSMrc != null && tollFreeDomesticUSMrc.Quantity != null && item.Quantity != null && tollFreeDomesticUSMrc.TotalPrice != null){
                            tollFreeDomesticUSMrc.Quantity = tollFreeDomesticUSMrc.Quantity + item.Quantity;
                            tollFreeDomesticUSMrc.TotalPrice = tollFreeDomesticUSMrc.TotalPrice + item.TotalPrice;
                        }else{
                            tollFreeDomesticUSMrc =  item; 
                            
                        }  
                    }  
                    else{
                        if(tollFreeDomesticUSNrc != null && tollFreeDomesticUSNrc.Quantity != null && item.Quantity !=null &&  tollFreeDomesticUSNrc.TotalPrice != null){
                            tollFreeDomesticUSNrc.Quantity = tollFreeDomesticUSNrc.Quantity + item.Quantity;
                            tollFreeDomesticUSNrc.TotalPrice = tollFreeDomesticUSNrc.TotalPrice + item.TotalPrice;
                        }else{
                            tollFreeDomesticUSNrc =  item; 
                        } 
                    }
                }
                if(item.isSmartTollFreeNum__c == true){
                    if(item.Type_of_Billing__c == 'MRC'){
                        if(tollFreeNumMrc != null && tollFreeNumMrc.Quantity != null && item.Quantity != null && tollFreeNumMrc.TotalPrice != null){
                            tollFreeNumMrc.Quantity = tollFreeNumMrc.Quantity + item.Quantity;
                            tollFreeNumMrc.TotalPrice = tollFreeNumMrc.TotalPrice + item.TotalPrice;
                        }else{
                            tollFreeNumMrc =  item; 
                            
                        }  
                    }  
                    else{
                        if(tollFreeNumNrc != null && tollFreeNumNrc.Quantity != null && item.Quantity !=null &&  tollFreeNumNrc.TotalPrice != null){
                            tollFreeNumNrc.Quantity = tollFreeNumNrc.Quantity + item.Quantity;
                            tollFreeNumNrc.TotalPrice = tollFreeNumNrc.TotalPrice + item.TotalPrice;
                        }else{
                            tollFreeNumNrc =  item; 
                        } 
                    }
                }
            }
        }
        
        if(FIOSItemList2 != null && !FIOSItemList2.isEmpty()){
            for(OpportunityLineItem item:FIOSItemList2){
                if(item.SmartVoice_FiOS_100_100_Broadband__c == true){
                    if(item.Type_of_Billing__c == 'MRC'){
                        if(SmartVoice_FiOS_100_100_BroadbandMrc != null && SmartVoice_FiOS_100_100_BroadbandMrc.Quantity != null && item.Quantity != null && SmartVoice_FiOS_100_100_BroadbandMrc.TotalPrice != null){
                            SmartVoice_FiOS_100_100_BroadbandMrc.Quantity = SmartVoice_FiOS_100_100_BroadbandMrc.Quantity + item.Quantity;
                            SmartVoice_FiOS_100_100_BroadbandMrc.TotalPrice = SmartVoice_FiOS_100_100_BroadbandMrc.TotalPrice + item.TotalPrice;
                        }else{
                            SmartVoice_FiOS_100_100_BroadbandMrc =  item; 
                            
                        }  
                    }  
                    else{
                        if(SmartVoice_FiOS_100_100_BroadbandNrc != null && SmartVoice_FiOS_100_100_BroadbandNrc.Quantity != null && item.Quantity !=null &&  SmartVoice_FiOS_100_100_BroadbandNrc.TotalPrice != null){
                            SmartVoice_FiOS_100_100_BroadbandNrc.Quantity = SmartVoice_FiOS_100_100_BroadbandNrc.Quantity + item.Quantity;
                            SmartVoice_FiOS_100_100_BroadbandNrc.TotalPrice = SmartVoice_FiOS_100_100_BroadbandNrc.TotalPrice + item.TotalPrice;
                        }else{
                            SmartVoice_FiOS_100_100_BroadbandNrc =  item; 
                        } 
                    }
                }
                if(item.SmartVoice_FiOS_500_500_Broadband__c == true){
                    if(item.Type_of_Billing__c == 'MRC'){
                        if(SmartVoice_FiOS_500_500_BroadbandMrc != null && SmartVoice_FiOS_500_500_BroadbandMrc.Quantity != null && item.Quantity != null && SmartVoice_FiOS_500_500_BroadbandMrc.TotalPrice != null){
                            SmartVoice_FiOS_500_500_BroadbandMrc.Quantity = SmartVoice_FiOS_500_500_BroadbandMrc.Quantity + item.Quantity;
                            SmartVoice_FiOS_500_500_BroadbandMrc.TotalPrice = SmartVoice_FiOS_500_500_BroadbandMrc.TotalPrice + item.TotalPrice;
                        }else{
                            SmartVoice_FiOS_500_500_BroadbandMrc =  item; 
                            
                        }  
                    }  
                    else{
                        if(SmartVoice_FiOS_500_500_BroadbandNrc != null && SmartVoice_FiOS_500_500_BroadbandNrc.Quantity != null && item.Quantity !=null &&  SmartVoice_FiOS_500_500_BroadbandNrc.TotalPrice != null){
                            SmartVoice_FiOS_500_500_BroadbandNrc.Quantity = SmartVoice_FiOS_500_500_BroadbandNrc.Quantity + item.Quantity;
                            SmartVoice_FiOS_500_500_BroadbandNrc.TotalPrice = SmartVoice_FiOS_500_500_BroadbandNrc.TotalPrice + item.TotalPrice;
                        }else{
                            SmartVoice_FiOS_500_500_BroadbandNrc =  item; 
                        } 
                    }
                }
                if(item.SmartVoice_FiOS_1G_1G_Broadband__c == true){
                    if(item.Type_of_Billing__c == 'MRC'){
                        if(SmartVoice_FiOS_1G_1G_BroadbandMrc != null && SmartVoice_FiOS_1G_1G_BroadbandMrc.Quantity != null && item.Quantity != null && SmartVoice_FiOS_1G_1G_BroadbandMrc.TotalPrice != null){
                            SmartVoice_FiOS_1G_1G_BroadbandMrc.Quantity = SmartVoice_FiOS_1G_1G_BroadbandMrc.Quantity + item.Quantity;
                            SmartVoice_FiOS_1G_1G_BroadbandMrc.TotalPrice = SmartVoice_FiOS_1G_1G_BroadbandMrc.TotalPrice + item.TotalPrice;
                        }else{
                            SmartVoice_FiOS_1G_1G_BroadbandMrc =  item; 
                            
                        }  
                    }  
                    else{
                        if(SmartVoice_FiOS_1G_1G_BroadbandNrc != null && SmartVoice_FiOS_1G_1G_BroadbandNrc.Quantity != null && item.Quantity !=null &&  SmartVoice_FiOS_1G_1G_BroadbandNrc.TotalPrice != null){
                            SmartVoice_FiOS_1G_1G_BroadbandNrc.Quantity = SmartVoice_FiOS_1G_1G_BroadbandNrc.Quantity + item.Quantity;
                            SmartVoice_FiOS_1G_1G_BroadbandNrc.TotalPrice = SmartVoice_FiOS_1G_1G_BroadbandNrc.TotalPrice + item.TotalPrice;
                        }else{
                            SmartVoice_FiOS_1G_1G_BroadbandNrc =  item; 
                        } 
                    }
                }
            }
        }
         system.debug('======fiberItemList2========='+fiberItemList2.size());
        if(fiberItemList2 != null && !fiberItemList2.isEmpty()){
            for(OpportunityLineItem item:fiberItemList2){
                if(item.SmartVoice_Fiber_100_100_Broadband__c == true){
                    if(item.Type_of_Billing__c == 'MRC'){
                        if(SmartVoice_Fiber_100_100_BroadbandMrc != null && SmartVoice_Fiber_100_100_BroadbandMrc.Quantity != null && item.Quantity != null && SmartVoice_Fiber_100_100_BroadbandMrc.TotalPrice != null){
                            SmartVoice_Fiber_100_100_BroadbandMrc.Quantity = SmartVoice_Fiber_100_100_BroadbandMrc.Quantity + item.Quantity;
                            SmartVoice_Fiber_100_100_BroadbandMrc.TotalPrice = SmartVoice_Fiber_100_100_BroadbandMrc.TotalPrice + item.TotalPrice;
                        }else{
                            SmartVoice_Fiber_100_100_BroadbandMrc =  item; 
                            
                        }  
                    }  
                    else{
                        if(SmartVoice_Fiber_100_100_BroadbandNrc != null && SmartVoice_Fiber_100_100_BroadbandNrc.Quantity != null && item.Quantity !=null &&  SmartVoice_Fiber_100_100_BroadbandNrc.TotalPrice != null){
                            SmartVoice_Fiber_100_100_BroadbandNrc.Quantity = SmartVoice_Fiber_100_100_BroadbandNrc.Quantity + item.Quantity;
                            SmartVoice_Fiber_100_100_BroadbandNrc.TotalPrice = SmartVoice_Fiber_100_100_BroadbandNrc.TotalPrice + item.TotalPrice;
                        }else{
                            SmartVoice_Fiber_100_100_BroadbandNrc =  item; 
                        } 
                    }
                }
                if(item.SmartVoice_Fiber_500_500_Broadband__c == true){
                    if(item.Type_of_Billing__c == 'MRC'){
                        if(SmartVoice_Fiber_500_500_BroadbandMrc != null && SmartVoice_Fiber_500_500_BroadbandMrc.Quantity != null && item.Quantity != null && SmartVoice_Fiber_500_500_BroadbandMrc.TotalPrice != null){
                            SmartVoice_Fiber_500_500_BroadbandMrc.Quantity = SmartVoice_Fiber_500_500_BroadbandMrc.Quantity + item.Quantity;
                            SmartVoice_Fiber_500_500_BroadbandMrc.TotalPrice = SmartVoice_Fiber_500_500_BroadbandMrc.TotalPrice + item.TotalPrice;
                        }else{
                            SmartVoice_Fiber_500_500_BroadbandMrc =  item; 
                            
                        }  
                    }  
                    else{
                        if(SmartVoice_Fiber_500_500_BroadbandNrc != null && SmartVoice_Fiber_500_500_BroadbandNrc.Quantity != null && item.Quantity !=null &&  SmartVoice_Fiber_500_500_BroadbandNrc.TotalPrice != null){
                            SmartVoice_Fiber_500_500_BroadbandNrc.Quantity = SmartVoice_Fiber_500_500_BroadbandNrc.Quantity + item.Quantity;
                            SmartVoice_Fiber_500_500_BroadbandNrc.TotalPrice = SmartVoice_Fiber_500_500_BroadbandNrc.TotalPrice + item.TotalPrice;
                        }else{
                            SmartVoice_Fiber_500_500_BroadbandNrc =  item; 
                        } 
                    }
                }
                if(item.SmartVoice_Fiber_1G_1G_Broadband__c == true){
                    if(item.Type_of_Billing__c == 'MRC'){
                        if(SmartVoice_Fiber_1G_1G_BroadbandMrc != null && SmartVoice_Fiber_1G_1G_BroadbandMrc.Quantity != null && item.Quantity != null && SmartVoice_Fiber_1G_1G_BroadbandMrc.TotalPrice != null){
                            SmartVoice_Fiber_1G_1G_BroadbandMrc.Quantity = SmartVoice_Fiber_1G_1G_BroadbandMrc.Quantity + item.Quantity;
                            SmartVoice_Fiber_1G_1G_BroadbandMrc.TotalPrice = SmartVoice_Fiber_1G_1G_BroadbandMrc.TotalPrice + item.TotalPrice;
                        }else{
                            SmartVoice_Fiber_1G_1G_BroadbandMrc =  item; 
                            
                        }  
                    }  
                    else{
                        if(SmartVoice_Fiber_1G_1G_BroadbandNrc != null && SmartVoice_Fiber_1G_1G_BroadbandNrc.Quantity != null && item.Quantity !=null &&  SmartVoice_Fiber_1G_1G_BroadbandNrc.TotalPrice != null){
                            SmartVoice_Fiber_1G_1G_BroadbandNrc.Quantity = SmartVoice_Fiber_1G_1G_BroadbandNrc.Quantity + item.Quantity;
                            SmartVoice_Fiber_1G_1G_BroadbandNrc.TotalPrice = SmartVoice_Fiber_1G_1G_BroadbandNrc.TotalPrice + item.TotalPrice;
                        }else{
                            SmartVoice_Fiber_1G_1G_BroadbandNrc =  item; 
                        } 
                    }
                }
            }
        }
        system.debug('======BHSIItemList2========='+BHSIItemList2.size());
        
        if(BHSIItemList2 != null && !BHSIItemList2.isEmpty()){
            for(OpportunityLineItem item:BHSIItemList2){
                if(item.SmartVoice_Broadband_12__c == true){
                    if(item.Type_of_Billing__c == 'MRC'){
                        if(smartBroadband12Mrc != null && smartBroadband12Mrc.Quantity != null && item.Quantity != null && smartBroadband12Mrc.TotalPrice != null){
                            smartBroadband12Mrc.Quantity = smartBroadband12Mrc.Quantity + item.Quantity;
                            smartBroadband12Mrc.TotalPrice = smartBroadband12Mrc.TotalPrice + item.TotalPrice;
                        }else{
                            smartBroadband12Mrc =  item; 
                            
                        }  
                    }  
                    else{
                        if(smartBroadband12Nrc != null && smartBroadband12Nrc.Quantity != null && item.Quantity !=null &&  smartBroadband12Nrc.TotalPrice != null){
                            smartBroadband12Nrc.Quantity = smartBroadband12Nrc.Quantity + item.Quantity;
                            smartBroadband12Nrc.TotalPrice = smartBroadband12Nrc.TotalPrice + item.TotalPrice;
                        }else{
                            smartBroadband12Nrc =  item; 
                        } 
                    }
                }
                if(item.SmartVoice_Broadband_18__c == true){
                    if(item.Type_of_Billing__c == 'MRC'){
                        if(smartBroadband18Mrc != null && smartBroadband18Mrc.Quantity != null && item.Quantity != null && smartBroadband18Mrc.TotalPrice != null){
                            smartBroadband18Mrc.Quantity = smartBroadband18Mrc.Quantity + item.Quantity;
                            smartBroadband18Mrc.TotalPrice = smartBroadband18Mrc.TotalPrice + item.TotalPrice;
                        }else{
                            smartBroadband18Mrc =  item; 
                            
                        }  
                    }  
                    else{
                        if(smartBroadband18Nrc != null && smartBroadband18Nrc.Quantity != null && item.Quantity !=null &&  smartBroadband18Nrc.TotalPrice != null){
                            smartBroadband18Nrc.Quantity = smartBroadband18Nrc.Quantity + item.Quantity;
                            smartBroadband18Nrc.TotalPrice = smartBroadband18Nrc.TotalPrice + item.TotalPrice;
                        }else{
                            smartBroadband18Nrc =  item; 
                        } 
                    }
                }
                if(item.SmartVoice_Broadband_25__c == true){
                    if(item.Type_of_Billing__c == 'MRC'){
                        if(smartBroadband25Mrc != null && smartBroadband25Mrc.Quantity != null && item.Quantity != null && smartBroadband25Mrc.TotalPrice != null){
                            smartBroadband25Mrc.Quantity = smartBroadband25Mrc.Quantity + item.Quantity;
                            smartBroadband25Mrc.TotalPrice = smartBroadband25Mrc.TotalPrice + item.TotalPrice;
                        }else{
                            smartBroadband25Mrc =  item; 
                            
                        }  
                    }  
                    else{
                        if(smartBroadband25Nrc != null && smartBroadband25Nrc.Quantity != null && item.Quantity !=null &&  smartBroadband25Nrc.TotalPrice != null){
                            smartBroadband25Nrc.Quantity = smartBroadband25Nrc.Quantity + item.Quantity;
                            smartBroadband25Nrc.TotalPrice = smartBroadband25Nrc.TotalPrice + item.TotalPrice;
                        }else{
                            smartBroadband25Nrc =  item; 
                        } 
                    }
                }
                if(item.SmartVoice_Broadband_35__c == true){
                    if(item.Type_of_Billing__c == 'MRC'){
                        if(smartBroadband35Mrc != null && smartBroadband35Mrc.Quantity != null && item.Quantity != null && smartBroadband35Mrc.TotalPrice != null){
                            smartBroadband35Mrc.Quantity = smartBroadband35Mrc.Quantity + item.Quantity;
                            smartBroadband35Mrc.TotalPrice = smartBroadband35Mrc.TotalPrice + item.TotalPrice;
                        }else{
                            smartBroadband35Mrc =  item; 
                            
                        }  
                    }  
                    else{
                        if(smartBroadband35Nrc != null && smartBroadband35Nrc.Quantity != null && item.Quantity !=null &&  smartBroadband35Nrc.TotalPrice != null){
                            smartBroadband35Nrc.Quantity = smartBroadband35Nrc.Quantity + item.Quantity;
                            smartBroadband35Nrc.TotalPrice = smartBroadband35Nrc.TotalPrice + item.TotalPrice;
                        }else{
                            smartBroadband35Nrc =  item; 
                        } 
                    }
                }
                if(item.SmartVoice_Broadband_45__c == true){
                    if(item.Type_of_Billing__c == 'MRC'){
                        if(smartBroadband45Mrc != null && smartBroadband45Mrc.Quantity != null && item.Quantity != null && smartBroadband45Mrc.TotalPrice != null){
                            smartBroadband45Mrc.Quantity = smartBroadband45Mrc.Quantity + item.Quantity;
                            smartBroadband45Mrc.TotalPrice = smartBroadband45Mrc.TotalPrice + item.TotalPrice;
                        }else{
                            smartBroadband45Mrc =  item; 
                            
                        }  
                    }  
                    else{
                        if(smartBroadband45Nrc != null && smartBroadband45Nrc.Quantity != null && item.Quantity !=null &&  smartBroadband45Nrc.TotalPrice != null){
                            smartBroadband45Nrc.Quantity = smartBroadband45Nrc.Quantity + item.Quantity;
                            smartBroadband45Nrc.TotalPrice = smartBroadband45Nrc.TotalPrice + item.TotalPrice;
                        }else{
                            smartBroadband45Nrc =  item; 
                        } 
                    }
                }
                if(item.SmartVoice_Broadband_70__c == true){
                    if(item.Type_of_Billing__c == 'MRC'){
                        if(smartBroadband70Mrc != null && smartBroadband70Mrc.Quantity != null && item.Quantity != null && smartBroadband70Mrc.TotalPrice != null){
                            smartBroadband70Mrc.Quantity = smartBroadband70Mrc.Quantity + item.Quantity;
                            smartBroadband70Mrc.TotalPrice = smartBroadband70Mrc.TotalPrice + item.TotalPrice;
                        }else{
                            smartBroadband70Mrc =  item; 
                            
                        }  
                    }  
                    else{
                        if(smartBroadband70Nrc != null && smartBroadband70Nrc.Quantity != null && item.Quantity !=null &&  smartBroadband70Nrc.TotalPrice != null){
                            smartBroadband70Nrc.Quantity = smartBroadband70Nrc.Quantity + item.Quantity;
                            smartBroadband70Nrc.TotalPrice = smartBroadband70Nrc.TotalPrice + item.TotalPrice;
                        }else{
                            smartBroadband70Nrc =  item; 
                        } 
                    }
                }
                if(item.SmartVoice_Broadband_90__c == true){
                    if(item.Type_of_Billing__c == 'MRC'){
                        if(smartBroadband90Mrc != null && smartBroadband90Mrc.Quantity != null && item.Quantity != null && smartBroadband90Mrc.TotalPrice != null){
                            smartBroadband90Mrc.Quantity = smartBroadband90Mrc.Quantity + item.Quantity;
                            smartBroadband90Mrc.TotalPrice = smartBroadband90Mrc.TotalPrice + item.TotalPrice;
                        }else{
                            smartBroadband90Mrc =  item; 
                            
                        }  
                    }  
                    else{
                        if(smartBroadband90Nrc != null && smartBroadband90Nrc.Quantity != null && item.Quantity !=null &&  smartBroadband90Nrc.TotalPrice != null){
                            smartBroadband90Nrc.Quantity = smartBroadband90Nrc.Quantity + item.Quantity;
                            smartBroadband90Nrc.TotalPrice = smartBroadband90Nrc.TotalPrice + item.TotalPrice;
                        }else{
                            smartBroadband90Nrc =  item; 
                        } 
                    }
                }
                if(item.SmartVoice_Broadband_115__c == true){
                    if(item.Type_of_Billing__c == 'MRC'){
                        if(smartBroadband115Mrc != null && smartBroadband115Mrc.Quantity != null && item.Quantity != null && smartBroadband115Mrc.TotalPrice != null){
                            smartBroadband115Mrc.Quantity = smartBroadband115Mrc.Quantity + item.Quantity;
                            smartBroadband115Mrc.TotalPrice = smartBroadband115Mrc.TotalPrice + item.TotalPrice;
                        }else{
                            smartBroadband115Mrc =  item; 
                            
                        }  
                    }  
                    else{
                        if(smartBroadband115Nrc != null && smartBroadband115Nrc.Quantity != null && item.Quantity !=null &&  smartBroadband115Nrc.TotalPrice != null){
                            smartBroadband115Nrc.Quantity = smartBroadband115Nrc.Quantity + item.Quantity;
                            smartBroadband115Nrc.TotalPrice = smartBroadband115Nrc.TotalPrice + item.TotalPrice;
                        }else{
                            smartBroadband115Nrc =  item; 
                        } 
                    }
                }
            }
        }
        
        if(broadbandItemList2 != null && !broadbandItemList2.isEmpty()){
            for(OpportunityLineItem item:broadbandItemList2){
                if(item.BroadbandIpOptionEach__c == true){
                    if(item.Type_of_Billing__c == 'MRC'){
                        if(smartBroadbandIpOptionEachMrc != null && smartBroadbandIpOptionEachMrc.Quantity != null && item.Quantity != null && smartBroadbandIpOptionEachMrc.TotalPrice  != null){
                            smartBroadbandIpOptionEachMrc.Quantity = smartBroadbandIpOptionEachMrc.Quantity + item.Quantity;
                            smartBroadbandIpOptionEachMrc.TotalPrice = smartBroadbandIpOptionEachMrc.TotalPrice + item.TotalPrice;
                        }else{
                            smartBroadbandIpOptionEachMrc =  item; 
                            
                        }  
                    }  
                    else{
                        if(smartBroadbandIpOptionEachNrc != null && smartBroadbandIpOptionEachNrc.Quantity != null && item.Quantity != null && smartBroadbandIpOptionEachNrc.TotalPrice != null){
                            smartBroadbandIpOptionEachNrc.Quantity = smartBroadbandIpOptionEachNrc.Quantity + item.Quantity;
                            smartBroadbandIpOptionEachNrc.TotalPrice = smartBroadbandIpOptionEachNrc.TotalPrice + item.TotalPrice;
                        }else{
                            smartBroadbandIpOptionEachNrc =  item; 
                        } 
                    }
                }
                if(item.BroadbandIpOption5Ips__c == true){
                    if(item.Type_of_Billing__c == 'MRC'){
                        if(smartBroadbandIpOption5IpsMrc != null && smartBroadbandIpOption5IpsMrc.Quantity != null && item.Quantity != null && smartBroadbandIpOption5IpsMrc.TotalPrice  != null){
                            smartBroadbandIpOption5IpsMrc.Quantity = smartBroadbandIpOption5IpsMrc.Quantity + item.Quantity;
                            smartBroadbandIpOption5IpsMrc.TotalPrice = smartBroadbandIpOption5IpsMrc.TotalPrice + item.TotalPrice;
                        }else{
                            smartBroadbandIpOption5IpsMrc =  item; 
                            
                        }  
                    }  
                    else{
                        if(smartBroadbandIpOption5IpsNrc != null && smartBroadbandIpOption5IpsNrc.Quantity != null && item.Quantity != null && smartBroadbandIpOption5IpsNrc.TotalPrice != null){
                            smartBroadbandIpOption5IpsNrc.Quantity = smartBroadbandIpOption5IpsNrc.Quantity + item.Quantity;
                            smartBroadbandIpOption5IpsNrc.TotalPrice = smartBroadbandIpOption5IpsNrc.TotalPrice + item.TotalPrice;
                        }else{
                            smartBroadbandIpOption5IpsNrc =  item; 
                        } 
                    }
                }
                if(item.BroadbandIpOption13Ips__c == true){
                    if(item.Type_of_Billing__c == 'MRC'){
                        if(smartBroadbandIpOption13IpsMrc != null && smartBroadbandIpOption13IpsMrc.Quantity != null && item.Quantity != null && smartBroadbandIpOption13IpsMrc.TotalPrice  != null){
                            smartBroadbandIpOption13IpsMrc.Quantity = smartBroadbandIpOption13IpsMrc.Quantity + item.Quantity;
                            smartBroadbandIpOption13IpsMrc.TotalPrice = smartBroadbandIpOption13IpsMrc.TotalPrice + item.TotalPrice;
                        }else{
                            smartBroadbandIpOption13IpsMrc =  item; 
                            
                        }  
                    }  
                    else{
                        if(smartBroadbandIpOption13IpsNrc != null && smartBroadbandIpOption13IpsNrc.Quantity != null && item.Quantity != null && smartBroadbandIpOption13IpsNrc.TotalPrice != null){
                            smartBroadbandIpOption13IpsNrc.Quantity = smartBroadbandIpOption13IpsNrc.Quantity + item.Quantity;
                            smartBroadbandIpOption13IpsNrc.TotalPrice = smartBroadbandIpOption13IpsNrc.TotalPrice + item.TotalPrice;
                        }else{
                            smartBroadbandIpOption13IpsNrc =  item; 
                        } 
                    }
                }
            }
        }
        system.debug('================ipPhoneItemList2==========='+ipPhoneItemList2.size());
        if(ipPhoneItemList2 != null && !ipPhoneItemList2.isEmpty()){
            for(OpportunityLineItem item:ipPhoneItemList2){
                if(item.isVVX311__c == true){
                    system.debug('================isVVX311__c===========');
                    if(item.Type_of_Billing__c == 'MRC'){
                        if(smartVVX311Mrc != null && smartVVX311Mrc.Quantity != null && item.Quantity != null && smartVVX311Mrc.TotalPrice != null){
                            smartVVX311Mrc.Quantity = smartVVX311Mrc.Quantity + item.Quantity;
                            smartVVX311Mrc.TotalPrice = smartVVX311Mrc.TotalPrice + item.TotalPrice;
                        }else{
                            smartVVX311Mrc =  item; 
                            
                        }  
                    }  
                    else{
                        if(smartVVX311Nrc != null && smartVVX311Nrc.Quantity != null && item.Quantity !=null &&  smartVVX311Nrc.TotalPrice != null){
                            smartVVX311Nrc.Quantity = smartVVX311Nrc.Quantity + item.Quantity;
                            smartVVX311Nrc.TotalPrice = smartVVX311Nrc.TotalPrice + item.TotalPrice;
                        }else{
                            smartVVX311Nrc =  item; 
                        } 
                    }
                }
                system.debug('================smartVVX311Mrc==========='+smartVVX311Mrc); 
                if(item.isVVX501__c == true){
                    system.debug('================isVVX501__c===========');
                    if(item.Type_of_Billing__c == 'MRC'){
                        if(smartVVX501Mrc != null && smartVVX501Mrc.Quantity != null && item.Quantity != null && smartVVX501Mrc.TotalPrice != null){
                            smartVVX501Mrc.Quantity = smartVVX501Mrc.Quantity + item.Quantity;
                            smartVVX501Mrc.TotalPrice = smartVVX501Mrc.TotalPrice + item.TotalPrice;
                        }else{
                            smartVVX501Mrc =  item; 
                            
                        }  
                    }  
                    else{
                        if(smartVVX501Nrc != null && smartVVX501Nrc.Quantity != null && item.Quantity !=null &&  smartVVX501Nrc.TotalPrice != null){
                            smartVVX501Nrc.Quantity = smartVVX501Nrc.Quantity + item.Quantity;
                            smartVVX501Nrc.TotalPrice = smartVVX501Nrc.TotalPrice + item.TotalPrice;
                        }else{
                            smartVVX501Nrc =  item; 
                        } 
                    }
                }
                system.debug('================smartVVX501Mrc==========='+smartVVX501Mrc); 
                
                if(item.isVVX601__c == true){
                    system.debug('================isVVX601__c===========');
                    if(item.Type_of_Billing__c == 'MRC'){
                        if(smartVVX601Mrc != null && smartVVX601Mrc.Quantity != null && item.Quantity != null && smartVVX601Mrc.TotalPrice != null){
                            smartVVX601Mrc.Quantity = smartVVX601Mrc.Quantity + item.Quantity;
                            smartVVX601Mrc.TotalPrice = smartVVX601Mrc.TotalPrice + item.TotalPrice;
                        }else{
                            smartVVX601Mrc =  item; 
                            
                        }  
                    }  
                    else{
                        if(smartVVX601Nrc != null && smartVVX601Nrc.Quantity != null && item.Quantity !=null &&  smartVVX601Nrc.TotalPrice != null){
                            smartVVX601Nrc.Quantity = smartVVX601Nrc.Quantity + item.Quantity;
                            smartVVX601Nrc.TotalPrice = smartVVX601Nrc.TotalPrice + item.TotalPrice;
                        }else{
                            smartVVX601Nrc =  item; 
                        } 
                    }
                }
                system.debug('================smartVVX601Nrc==========='+smartVVX601Nrc); 
                if(item.isSoundStationIp5000__c == true){
                    if(item.Type_of_Billing__c == 'MRC'){
                        if(smartSoundStation5000Mrc != null && smartSoundStation5000Mrc.Quantity != null && item.Quantity != null && smartSoundStation5000Mrc.TotalPrice != null){
                            smartSoundStation5000Mrc.Quantity = smartSoundStation5000Mrc.Quantity + item.Quantity;
                            smartSoundStation5000Mrc.TotalPrice = smartSoundStation5000Mrc.TotalPrice + item.TotalPrice;
                        }else{
                            smartSoundStation5000Mrc =  item; 
                            
                        }  
                    }  
                    else{
                        if(smartSoundStation5000Nrc != null && smartSoundStation5000Nrc.Quantity != null && item.Quantity !=null &&  smartSoundStation5000Nrc.TotalPrice != null){
                            smartSoundStation5000Nrc.Quantity = smartSoundStation5000Nrc.Quantity + item.Quantity;
                            smartSoundStation5000Nrc.TotalPrice = smartSoundStation5000Nrc.TotalPrice + item.TotalPrice;
                        }else{
                            smartSoundStation5000Nrc =  item; 
                        } 
                    }
                }
                if(item.isSoundStationIp6000__c == true){
                    if(item.Type_of_Billing__c == 'MRC'){
                        if(smartSoundStation6000Mrc != null && smartSoundStation6000Mrc.Quantity != null && item.Quantity != null && smartSoundStation6000Mrc.TotalPrice != null){
                            smartSoundStation6000Mrc.Quantity = smartSoundStation6000Mrc.Quantity + item.Quantity;
                            smartSoundStation6000Mrc.TotalPrice = smartSoundStation6000Mrc.TotalPrice + item.TotalPrice;
                        }else{
                            smartSoundStation6000Mrc =  item; 
                            
                        }  
                    }  
                    else{
                        if(smartSoundStation6000Nrc != null && smartSoundStation6000Nrc.Quantity != null && item.Quantity !=null &&  smartSoundStation6000Nrc.TotalPrice != null){
                            smartSoundStation6000Nrc.Quantity = smartSoundStation6000Nrc.Quantity + item.Quantity;
                            smartSoundStation6000Nrc.TotalPrice = smartSoundStation6000Nrc.TotalPrice + item.TotalPrice;
                        }else{
                            smartSoundStation6000Nrc =  item; 
                        } 
                    }
                }
                if(item.isSoundStationIp7000__c == true){
                    if(item.Type_of_Billing__c == 'MRC'){
                        if(smartSoundStation7000Mrc != null && smartSoundStation7000Mrc.Quantity != null && item.Quantity != null && smartSoundStation7000Mrc.TotalPrice != null){
                            smartSoundStation7000Mrc.Quantity = smartSoundStation7000Mrc.Quantity + item.Quantity;
                            smartSoundStation7000Mrc.TotalPrice = smartSoundStation7000Mrc.TotalPrice + item.TotalPrice;
                        }else{
                            smartSoundStation7000Mrc =  item; 
                            
                        }  
                    }  
                    else{
                        if(smartSoundStation7000Nrc != null && smartSoundStation7000Nrc.Quantity != null && item.Quantity !=null &&  smartSoundStation7000Nrc.TotalPrice != null){
                            smartSoundStation7000Nrc.Quantity = smartSoundStation7000Nrc.Quantity + item.Quantity;
                            smartSoundStation7000Nrc.TotalPrice = smartSoundStation7000Nrc.TotalPrice + item.TotalPrice;
                        }else{
                            smartSoundStation7000Nrc =  item; 
                        } 
                    }
                }
            }
        }
        system.debug('====switchesItemList2====='+switchesItemList2.size());
        if(switchesItemList2 != null && !switchesItemList2.isEmpty()){
            for(OpportunityLineItem item:switchesItemList2){
                if(item.isNETGEAR__c == true){
                    system.debug('====isNETGEAR__c=====');
                    
                    if(item.Type_of_Billing__c == 'MRC'){
                        if(smartNETGEARMrc != null && smartNETGEARMrc.Quantity != null && item.Quantity != null && smartNETGEARMrc.TotalPrice != null){
                            smartNETGEARMrc.Quantity = smartNETGEARMrc.Quantity + item.Quantity;
                            smartNETGEARMrc.TotalPrice = smartNETGEARMrc.TotalPrice + item.TotalPrice;
                        }else{
                            smartNETGEARMrc =  item; 
                            
                        }  
                    }  
                    else{
                        if(smartNETGEARNrc != null && smartNETGEARNrc.Quantity != null && item.Quantity !=null &&  smartNETGEARNrc.TotalPrice != null){
                            smartNETGEARNrc.Quantity = smartNETGEARNrc.Quantity + item.Quantity;
                            smartNETGEARNrc.TotalPrice = smartNETGEARNrc.TotalPrice + item.TotalPrice;
                        }else{
                            smartNETGEARNrc =  item; 
                        } 
                    }
                }
            }
        }
        system.debug('====switchesItemList2====='+switchesItemList2.size());
        if(switchesItemList2 != null && !switchesItemList2.isEmpty()){
            for(OpportunityLineItem item : switchesItemList2){
                if(item.isPolycomATA__c == true){
                    system.debug('====isPolycomATA__c=====');
                    if(item.Type_of_Billing__c == 'MRC'){
                        if(smartPolycomATAMrc != null && smartPolycomATAMrc.Quantity != null && item.Quantity != null && smartPolycomATAMrc.TotalPrice != null){
                            smartPolycomATAMrc.Quantity = smartPolycomATAMrc.Quantity + item.Quantity;
                            smartPolycomATAMrc.TotalPrice = smartPolycomATAMrc.TotalPrice + item.TotalPrice;
                        }else{
                            smartPolycomATAMrc =  item; 
                            
                        }  
                    }  
                    else{
                        if(smartPolycomATANrc != null && smartPolycomATANrc.Quantity != null && item.Quantity !=null &&  smartPolycomATANrc.TotalPrice != null){
                            smartPolycomATANrc.Quantity = smartPolycomATANrc.Quantity + item.Quantity;
                            smartPolycomATANrc.TotalPrice = smartPolycomATANrc.TotalPrice + item.TotalPrice;
                        }else{
                            smartPolycomATANrc =  item; 
                        } 
                    }
                }
            }
        }
            
           if(equipmentList2 != null && !equipmentList2.isEmpty()){
            for(OpportunityLineItem item : equipmentList2){
                    if(item.Type_of_Billing__c == 'MRC'){
                        if(smartEquipmentMrc != null && smartEquipmentMrc.Quantity != null && item.Quantity != null && smartEquipmentMrc.TotalPrice != null){
                            smartEquipmentMrc.Quantity = smartEquipmentMrc.Quantity + item.Quantity;
                            smartEquipmentMrc.TotalPrice = smartEquipmentMrc.TotalPrice + item.TotalPrice;
                        }else{
                            smartEquipmentMrc =  item; 
                            
                        }  
                    }  
                    else{
                        if(smartEquipmentNrc != null && smartEquipmentNrc.Quantity != null && item.Quantity !=null &&  smartEquipmentNrc.TotalPrice != null){
                            smartEquipmentNrc.Quantity = smartEquipmentNrc.Quantity + item.Quantity;
                            smartEquipmentNrc.TotalPrice = smartEquipmentNrc.TotalPrice + item.TotalPrice;
                        }else{
                            smartEquipmentNrc =  item; 
                        } 
                    }
                }
            }
                                                                                                                                                                                                                                                                                                                                                   
        
        system.debug('====installationList2====='+installationList2.size());
        if(installationList2 != null && !installationList2.isEmpty()){
            for(OpportunityLineItem item:installationList2){
                if(item.isTechInstallFeeBHSI__c == true){
                    system.debug('====isTechInstallFeeBHSI__c=====');
                    if(item.Type_of_Billing__c == 'MRC'){
                        if(smartTechInstallFeeBHSIMrc != null && smartTechInstallFeeBHSIMrc.Quantity != null && item.Quantity != null && smartTechInstallFeeBHSIMrc.TotalPrice != null){
                            smartTechInstallFeeBHSIMrc.Quantity = smartTechInstallFeeBHSIMrc.Quantity + item.Quantity;
                            smartTechInstallFeeBHSIMrc.TotalPrice = smartTechInstallFeeBHSIMrc.TotalPrice + item.TotalPrice;
                        }else{
                            smartTechInstallFeeBHSIMrc =  item; 
                            
                        }  
                    }  
                    else{
                        if(smartTechInstallFeeBHSINrc != null && smartTechInstallFeeBHSINrc.Quantity != null && item.Quantity !=null &&  smartTechInstallFeeBHSINrc.TotalPrice != null){
                            smartTechInstallFeeBHSINrc.Quantity = smartTechInstallFeeBHSINrc.Quantity + item.Quantity;
                            smartTechInstallFeeBHSINrc.TotalPrice = smartTechInstallFeeBHSINrc.TotalPrice + item.TotalPrice;
                        }else{
                            smartTechInstallFeeBHSINrc =  item; 
                        } 
                    }
                }
                if(item.isTechInstallFeeFiber__c == true){
                    system.debug('====isTechInstallFeeFiber__c=====');
                    if(item.Type_of_Billing__c == 'MRC'){
                        if(smartTechInstallFeeFiberMrc != null && smartTechInstallFeeFiberMrc.Quantity != null && item.Quantity != null && smartTechInstallFeeFiberMrc.TotalPrice != null){
                            smartTechInstallFeeFiberMrc.Quantity = smartTechInstallFeeFiberMrc.Quantity + item.Quantity;
                            smartTechInstallFeeFiberMrc.TotalPrice = smartTechInstallFeeFiberMrc.TotalPrice + item.TotalPrice;
                        }else{
                            smartTechInstallFeeBHSIMrc =  item; 
                            
                        }  
                    }  
                    else{
                        if(smartTechInstallFeeFiberNrc != null && smartTechInstallFeeFiberNrc.Quantity != null && item.Quantity !=null &&  smartTechInstallFeeFiberNrc.TotalPrice != null){
                            smartTechInstallFeeFiberNrc.Quantity = smartTechInstallFeeFiberNrc.Quantity + item.Quantity;
                            smartTechInstallFeeFiberNrc.TotalPrice = smartTechInstallFeeFiberNrc.TotalPrice + item.TotalPrice;
                        }else{
                            smartTechInstallFeeFiberNrc =  item; 
                        } 
                    }
                }
                if(item.isTechInstallFeeFIOS__c == true){
                    system.debug('====isTechInstallFeeFIOS__c=====');
                    if(item.Type_of_Billing__c == 'MRC'){
                        if(smartTechInstallFeeFIOSMrc != null && smartTechInstallFeeFIOSMrc.Quantity != null && item.Quantity != null && smartTechInstallFeeFIOSMrc.TotalPrice != null){
                            smartTechInstallFeeFIOSMrc.Quantity = smartTechInstallFeeFIOSMrc.Quantity + item.Quantity;
                            smartTechInstallFeeFIOSMrc.TotalPrice = smartTechInstallFeeFIOSMrc.TotalPrice + item.TotalPrice;
                        }else{
                            smartTechInstallFeeFIOSMrc =  item; 
                            
                        }  
                    }  
                    else{
                        if(smartTechInstallFeeFIOSNrc != null && smartTechInstallFeeFIOSNrc.Quantity != null && item.Quantity !=null &&  smartTechInstallFeeFIOSNrc.TotalPrice != null){
                            smartTechInstallFeeFIOSNrc.Quantity = smartTechInstallFeeFIOSNrc.Quantity + item.Quantity;
                            smartTechInstallFeeFIOSNrc.TotalPrice = smartTechInstallFeeFIOSNrc.TotalPrice + item.TotalPrice;
                        }else{
                            smartTechInstallFeeFIOSNrc =  item; 
                        } 
                    }
                }
                
            }
        }
        
         if(TeleComItemList2 != null && !TeleComItemList2.isEmpty()){
            for(OpportunityLineItem item : TeleComItemList2){
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
        
        if(setUpList2 != null && !setUpList2.isEmpty()){
            for(OpportunityLineItem item : setUpList2) {
                if(item.isSmartTollFreeDomestic__c == true){
                    if(TollTimenrc != null && TollTimenrc.Quantity != null && item.Quantity != null && TollTimenrc.TotalPrice != null){
                        TollTimenrc.Quantity = TollTimenrc.Quantity + item.Quantity;
                        TollTimenrc.TotalPrice = TollTimenrc.TotalPrice + item.TotalPrice;
                    }
                    else{
                        TollTimenrc = item;
                    } 
                    System.debug('====Activation Toll free Mins====='+item);
                }
               else if(item.PremiumRule__c == true){
                    if(premiumOppnrc != null && premiumOppnrc.Quantity != null && item.Quantity != null && premiumOppnrc.TotalPrice != null){
                        premiumOppnrc.Quantity = premiumOppnrc.Quantity + item.Quantity;
                        premiumOppnrc.TotalPrice = premiumOppnrc.TotalPrice + item.TotalPrice;
                    }else{
                        premiumOppnrc =  item; 
                    } 
                }
                else if(item.PremiumPlusRule__c == true){
                    if(premiumlusOppnrc != null && premiumlusOppnrc.Quantity != null && item.Quantity != null && premiumlusOppnrc.TotalPrice != null){
                        premiumlusOppnrc.Quantity = premiumlusOppnrc.Quantity + item.Quantity;
                        premiumlusOppnrc.TotalPrice = premiumlusOppnrc.TotalPrice + item.TotalPrice;
                    }else{
                        premiumlusOppnrc =  item; 
                    } 
                }
                 else if(item.isConferenceRumSeatRule__c == true){
                    if(conferenceOppnrc != null && conferenceOppnrc.Quantity != null && item.Quantity != null && conferenceOppnrc.TotalPrice != null){
                        conferenceOppnrc.Quantity = conferenceOppnrc.Quantity + item.Quantity;
                        conferenceOppnrc.TotalPrice = conferenceOppnrc.TotalPrice + item.TotalPrice;
                    }else{
                        conferenceOppnrc =  item; 
                    } 
                }
                else if(item.isAnalogRule__c == true){
                    if(analogOppnrc != null && analogOppnrc.Quantity != null && item.Quantity != null && analogOppnrc.TotalPrice != null){
                        analogOppnrc.Quantity = analogOppnrc.Quantity + item.Quantity;
                        analogOppnrc.TotalPrice = analogOppnrc.TotalPrice + item.TotalPrice;
                    }else{
                        analogOppnrc =  item; 
                    } 
                }
                else if(item.isSmartAdditionalDID__c == true){
                    if(additionalDIDnrc != null && additionalDIDnrc.Quantity != null && item.Quantity != null && additionalDIDnrc.TotalPrice != null){
                        additionalDIDnrc.Quantity = additionalDIDnrc.Quantity + item.Quantity;
                        additionalDIDnrc.TotalPrice = additionalDIDnrc.TotalPrice + item.TotalPrice;
                    }else{
                        additionalDIDnrc =  item; 
                    } 
                }
                else if(item.isSmartPremiumAttendant__c == true){
                    if(premiumAttendantNrc != null && premiumAttendantNrc.Quantity != null && item.Quantity != null && premiumAttendantNrc.TotalPrice != null){
                        premiumAttendantNrc.Quantity = premiumAttendantNrc.Quantity + item.Quantity;
                        premiumAttendantNrc.TotalPrice = premiumAttendantNrc.TotalPrice + item.TotalPrice;
                    }else{
                        premiumAttendantNrc =  item; 
                    } 
                }
                 else if(item.isSmartDirectoryListing__c == true){
                    if(directoryListingnrc != null && directoryListingnrc.Quantity != null && item.Quantity != null && directoryListingnrc.TotalPrice != null){
                        directoryListingnrc.Quantity = directoryListingnrc.Quantity + item.Quantity;
                        directoryListingnrc.TotalPrice = directoryListingnrc.TotalPrice + item.TotalPrice;
                    }else{
                        directoryListingnrc =  item; 
                    } 
                }
                 else if(item.isSmartExtendedNum__c == true){
                    if(extendedNumNrc != null && extendedNumNrc.Quantity != null && item.Quantity != null && extendedNumNrc.TotalPrice != null){
                        extendedNumNrc.Quantity = extendedNumNrc.Quantity + item.Quantity;
                        extendedNumNrc.TotalPrice = extendedNumNrc.TotalPrice + item.TotalPrice;
                    }else{
                        extendedNumNrc =  item; 
                    } 
                }
                 else if(item.isSmartTollFreeNum__c == true){
                    if(tollFreeNumNrc != null && tollFreeNumNrc.Quantity != null && item.Quantity != null && tollFreeNumNrc.TotalPrice != null){
                        tollFreeNumNrc.Quantity = tollFreeNumNrc.Quantity + item.Quantity;
                        tollFreeNumNrc.TotalPrice = tollFreeNumNrc.TotalPrice + item.TotalPrice;
                    }else{
                        tollFreeNumNrc =  item; 
                    } 
                }
                else if(item.isSmartMultiLineHunt__c == true){
                    if(multiLineHuntNrc != null && multiLineHuntNrc.Quantity != null && item.Quantity != null && multiLineHuntNrc.TotalPrice != null){
                        multiLineHuntNrc.Quantity = multiLineHuntNrc.Quantity + item.Quantity;
                        multiLineHuntNrc.TotalPrice = multiLineHuntNrc.TotalPrice + item.TotalPrice;
                    }else{
                        multiLineHuntNrc =  item; 
                    } 
                }
                else if(item.isSmartAdditionalManagedAutoAttendant__c == true){
                    if(additionalManagedAutoAttendantDnrc != null && additionalManagedAutoAttendantDnrc.Quantity != null && item.Quantity != null && additionalManagedAutoAttendantDnrc.TotalPrice != null){
                        additionalManagedAutoAttendantDnrc.Quantity = additionalManagedAutoAttendantDnrc.Quantity + item.Quantity;
                        additionalManagedAutoAttendantDnrc.TotalPrice = additionalManagedAutoAttendantDnrc.TotalPrice + item.TotalPrice;
                    }else{
                        additionalManagedAutoAttendantDnrc =  item; 
                    } 
                }
                else if(item.isSmartE911__c == true){
                    if(E911nrc != null && E911nrc.Quantity != null && item.Quantity != null && E911nrc.TotalPrice != null){
                        E911nrc.Quantity = E911nrc.Quantity + item.Quantity;
                        E911nrc.TotalPrice = E911nrc.TotalPrice + item.TotalPrice;
                    }else{
                        E911nrc =  item; 
                    } 
                }
                else if(item.isSmartMonthlyAdminCharge__c == true){
                    if(monthlyAdminChargeNrc != null && monthlyAdminChargeNrc.Quantity != null && item.Quantity != null && monthlyAdminChargeNrc.TotalPrice != null){
                        monthlyAdminChargeNrc.Quantity = monthlyAdminChargeNrc.Quantity + item.Quantity;
                        monthlyAdminChargeNrc.TotalPrice = monthlyAdminChargeNrc.TotalPrice + item.TotalPrice;
                    }else{
                        monthlyAdminChargeNrc =  item; 
                    } 
                }
                else if(item.SmartVoice_Broadband_12__c == true){
                     if(smartBroadband12Nrc != null && smartBroadband12Nrc.Quantity != null && item.Quantity != null && smartBroadband12Nrc.TotalPrice != null){
                        smartBroadband12Nrc.Quantity = smartBroadband12Nrc.Quantity + item.Quantity;
                        smartBroadband12Nrc.TotalPrice = smartBroadband12Nrc.TotalPrice + item.TotalPrice;
                    }else{
                        smartBroadband12Nrc =  item; 
                    } 
                }
                else if(item.SmartVoice_Broadband_18__c == true){
                     if(smartBroadband18Nrc != null && smartBroadband18Nrc.Quantity != null && item.Quantity != null && smartBroadband18Nrc.TotalPrice != null){
                        smartBroadband18Nrc.Quantity = smartBroadband18Nrc.Quantity + item.Quantity;
                        smartBroadband18Nrc.TotalPrice = smartBroadband18Nrc.TotalPrice + item.TotalPrice;
                    }else{
                        smartBroadband18Nrc =  item; 
                    } 
                } 
                else if(item.SmartVoice_Broadband_25__c == true){
                    if(smartBroadband25Nrc != null && smartBroadband25Nrc.Quantity != null && item.Quantity != null && smartBroadband25Nrc.TotalPrice != null){
                        smartBroadband25Nrc.Quantity = smartBroadband25Nrc.Quantity + item.Quantity;
                        smartBroadband25Nrc.TotalPrice = smartBroadband25Nrc.TotalPrice + item.TotalPrice;
                    }else{
                        smartBroadband25Nrc =  item; 
                    } 
                }
                else if(item.SmartVoice_Broadband_35__c == true){
                     if(smartBroadband35Nrc != null && smartBroadband35Nrc.Quantity != null && item.Quantity != null && smartBroadband35Nrc.TotalPrice != null){
                        smartBroadband35Nrc.Quantity = smartBroadband35Nrc.Quantity + item.Quantity;
                        smartBroadband35Nrc.TotalPrice = smartBroadband35Nrc.TotalPrice + item.TotalPrice;
                    }else{
                        smartBroadband35Nrc =  item; 
                    } 
                }
                else if(item.SmartVoice_Broadband_45__c == true){
                   if(smartBroadband45Nrc != null && smartBroadband45Nrc.Quantity != null && item.Quantity != null && smartBroadband45Nrc.TotalPrice != null){
                        smartBroadband45Nrc.Quantity = smartBroadband45Nrc.Quantity + item.Quantity;
                        smartBroadband45Nrc.TotalPrice = smartBroadband45Nrc.TotalPrice + item.TotalPrice;
                    }else{
                        smartBroadband45Nrc =  item; 
                    }  
                }
                else if(item.SmartVoice_Broadband_70__c == true){
                     if(smartBroadband70Nrc != null && smartBroadband70Nrc.Quantity != null && item.Quantity != null && smartBroadband70Nrc.TotalPrice != null){
                        smartBroadband70Nrc.Quantity = smartBroadband70Nrc.Quantity + item.Quantity;
                        smartBroadband70Nrc.TotalPrice = smartBroadband70Nrc.TotalPrice + item.TotalPrice;
                    }else{
                        smartBroadband70Nrc =  item; 
                    }  
                }
                else if(item.SmartVoice_Broadband_90__c == true){
                       if(smartBroadband90Nrc != null && smartBroadband90Nrc.Quantity != null && item.Quantity != null && smartBroadband90Nrc.TotalPrice != null){
                        smartBroadband90Nrc.Quantity = smartBroadband90Nrc.Quantity + item.Quantity;
                        smartBroadband90Nrc.TotalPrice = smartBroadband90Nrc.TotalPrice + item.TotalPrice;
                    }else{
                        smartBroadband90Nrc =  item; 
                    } 
                }
                else if(item.SmartVoice_Broadband_115__c == true){
                      if(smartBroadband115Nrc != null && smartBroadband115Nrc.Quantity != null && item.Quantity != null && smartBroadband115Nrc.TotalPrice != null){
                        smartBroadband115Nrc.Quantity = smartBroadband115Nrc.Quantity + item.Quantity;
                        smartBroadband115Nrc.TotalPrice = smartBroadband115Nrc.TotalPrice + item.TotalPrice;
                    }else{
                        smartBroadband115Nrc =  item; 
                    } 
                }
                else if(item.SmartVoice_FiOS_100_100_Broadband__c == true){
                    if(SmartVoice_FiOS_100_100_BroadbandNrc != null && SmartVoice_FiOS_100_100_BroadbandNrc.Quantity != null && item.Quantity != null && SmartVoice_FiOS_100_100_BroadbandNrc.TotalPrice != null){
                        SmartVoice_FiOS_100_100_BroadbandNrc.Quantity = SmartVoice_FiOS_100_100_BroadbandNrc.Quantity + item.Quantity;
                        SmartVoice_FiOS_100_100_BroadbandNrc.TotalPrice = SmartVoice_FiOS_100_100_BroadbandNrc.TotalPrice + item.TotalPrice;
                    }else{
                        SmartVoice_FiOS_100_100_BroadbandNrc =  item; 
                    } 
                }
                else if(item.SmartVoice_FiOS_500_500_Broadband__c == true){
                    if(SmartVoice_FiOS_500_500_BroadbandNrc != null && SmartVoice_FiOS_500_500_BroadbandNrc.Quantity != null && item.Quantity != null && SmartVoice_FiOS_500_500_BroadbandNrc.TotalPrice != null){
                        SmartVoice_FiOS_500_500_BroadbandNrc.Quantity = SmartVoice_FiOS_500_500_BroadbandNrc.Quantity + item.Quantity;
                        SmartVoice_FiOS_500_500_BroadbandNrc.TotalPrice = SmartVoice_FiOS_500_500_BroadbandNrc.TotalPrice + item.TotalPrice;
                    }else{
                        SmartVoice_FiOS_500_500_BroadbandNrc =  item; 
                    } 
                }
                else if(item.SmartVoice_FiOS_1G_1G_Broadband__c == true){
                    if(SmartVoice_FiOS_1G_1G_BroadbandNrc != null && SmartVoice_FiOS_1G_1G_BroadbandNrc.Quantity != null && item.Quantity != null && SmartVoice_FiOS_1G_1G_BroadbandNrc.TotalPrice != null){
                        SmartVoice_FiOS_1G_1G_BroadbandNrc.Quantity = SmartVoice_FiOS_1G_1G_BroadbandNrc.Quantity + item.Quantity;
                        SmartVoice_FiOS_1G_1G_BroadbandNrc.TotalPrice = SmartVoice_FiOS_1G_1G_BroadbandNrc.TotalPrice + item.TotalPrice;
                    }else{
                        SmartVoice_FiOS_1G_1G_BroadbandNrc =  item; 
                    } 
                }
                 else if(item.SmartVoice_FiOS_1G_1G_Broadband__c == true){
                    if(SmartVoice_FiOS_1G_1G_BroadbandNrc != null && SmartVoice_FiOS_1G_1G_BroadbandNrc.Quantity != null && item.Quantity != null && SmartVoice_FiOS_1G_1G_BroadbandNrc.TotalPrice != null){
                        SmartVoice_FiOS_1G_1G_BroadbandNrc.Quantity = SmartVoice_FiOS_1G_1G_BroadbandNrc.Quantity + item.Quantity;
                        SmartVoice_FiOS_1G_1G_BroadbandNrc.TotalPrice = SmartVoice_FiOS_1G_1G_BroadbandNrc.TotalPrice + item.TotalPrice;
                    }else{
                        SmartVoice_FiOS_1G_1G_BroadbandNrc =  item; 
                    } 
                }
                else if(item.SmartVoice_Fiber_100_100_Broadband__c == true){
                    if(SmartVoice_Fiber_100_100_BroadbandNrc != null && SmartVoice_Fiber_100_100_BroadbandNrc.Quantity != null && item.Quantity != null && SmartVoice_Fiber_100_100_BroadbandNrc.TotalPrice != null){
                        SmartVoice_Fiber_100_100_BroadbandNrc.Quantity = SmartVoice_Fiber_100_100_BroadbandNrc.Quantity + item.Quantity;
                        SmartVoice_Fiber_100_100_BroadbandNrc.TotalPrice = SmartVoice_Fiber_100_100_BroadbandNrc.TotalPrice + item.TotalPrice;
                    }else{
                        SmartVoice_Fiber_100_100_BroadbandNrc =  item; 
                    } 
                }
                else if(item.SmartVoice_Fiber_500_500_Broadband__c == true){
                     if(SmartVoice_Fiber_500_500_BroadbandNrc != null && SmartVoice_Fiber_500_500_BroadbandNrc.Quantity != null && item.Quantity != null && SmartVoice_Fiber_500_500_BroadbandNrc.TotalPrice != null){
                        SmartVoice_Fiber_500_500_BroadbandNrc.Quantity = SmartVoice_Fiber_500_500_BroadbandNrc.Quantity + item.Quantity;
                        SmartVoice_Fiber_500_500_BroadbandNrc.TotalPrice = SmartVoice_Fiber_500_500_BroadbandNrc.TotalPrice + item.TotalPrice;
                    }else{
                        SmartVoice_Fiber_500_500_BroadbandNrc =  item; 
                    }
                }
                 else if(item.SmartVoice_Fiber_1G_1G_Broadband__c == true){
                     if(SmartVoice_Fiber_1G_1G_BroadbandNrc != null && SmartVoice_Fiber_1G_1G_BroadbandNrc.Quantity != null && item.Quantity != null && SmartVoice_Fiber_1G_1G_BroadbandNrc.TotalPrice != null){
                        SmartVoice_Fiber_1G_1G_BroadbandNrc.Quantity = SmartVoice_Fiber_1G_1G_BroadbandNrc.Quantity + item.Quantity;
                        SmartVoice_Fiber_1G_1G_BroadbandNrc.TotalPrice = SmartVoice_Fiber_1G_1G_BroadbandNrc.TotalPrice + item.TotalPrice;
                    }else{
                        SmartVoice_Fiber_1G_1G_BroadbandNrc =  item; 
                    }
                }
            } 
        }
        
    }
    
    public class Wrapperclass{
        public  decimal mrc {get;set;}
        public decimal nrc{get;set;}
        public Wrapperclass(){
            
        }
        public Wrapperclass(decimal mrc,decimal nrc){
            this.mrc = mrc;
            this.nrc = nrc;
        }
    }  
}