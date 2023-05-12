@isTest
public class EquoteToolUpdateControllerTest {
    @isTest
    public static void EquoteToolUpdateControllerTestMethod(){
        Contact con= new contact();
        con.LastName= 'Test';
        con.MobilePhone= '9898561236';
        con.Email = 'Test@gmail.com';
        con.phone='6739322567';
        insert con;  
        
        Product2 prod = new Product2(Name = 'Elite User 1 Yr',Family = 'FAW',Product_Subcategory__c='Licenses',Parent__c=true,Equipment__c =false,Quantity__c='1');
        insert prod;
        
        Id standPricebookId = Test.getStandardPricebookId();
        PricebookEntry standardPrice = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = prod.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice;
        
        Pricebook2 customPB = new Pricebook2(Name='Custom Pricebook', isActive=true);
        insert customPB;
        
        PricebookEntry customPrice = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = prod.Id,UnitPrice = 12000, IsActive = true,Type_of_Billing__c = 'MRC');
        insert customPrice;
        
        Product2 prod1 = new Product2(Name = 'Elite User 1 Yr',Family = 'FAW',Product_Subcategory__c='Licenses',Parent__c=true,Equipment__c =false,Quantity__c='1');
        insert prod1;
        
        PricebookEntry standardPrice1 = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = prod1.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice1;
        
        Pricebook2 customPB1 = new Pricebook2(Name='Custom Pricebook', isActive=true);
        insert customPB1;
        
        PricebookEntry customPrice1 = new PricebookEntry(Pricebook2Id = customPB1.Id, Product2Id = prod1.Id,UnitPrice = 12000, IsActive = true,Type_of_Billing__c = 'NRC');
        insert customPrice1;
        
        Product2 prod3 = new Product2(Name = 'Elite User 1 Yr',Family = 'FAW',Product_Subcategory__c='Licenses',Parent__c=true,Equipment__c =false,Quantity__c='2',IpPhoneRule1__c = true,IpPhoneRule2__c = true,isSmartIpPhoneRule__c = true,isIpSoundStationRule__c = true);
        insert prod3;
        PricebookEntry standardPrice2 = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = prod3.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice2;
        PricebookEntry customPrice2 = new PricebookEntry(Pricebook2Id = customPB1.Id, Product2Id = prod3.Id,UnitPrice = 12000, IsActive = true,Type_of_Billing__c = 'NRC');
        insert customPrice2;
        
        Product2 prod4 = new Product2(Name = 'Elite User 1 Yr',Family = 'FAW',Product_Subcategory__c='Licenses',Parent__c=true,Equipment__c =false,Quantity__c='1',IpPhoneRule1__c = true,IpPhoneRule2__c = true,PremiumPlusRule__c = true,isConferenceRumSeatRule__c = true);
        insert prod4;
        PricebookEntry standardPrice3 = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = prod4.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice3;
        PricebookEntry customPrice3 = new PricebookEntry(Pricebook2Id = customPB1.Id, Product2Id = prod4.Id,UnitPrice = 12000, IsActive = true,Type_of_Billing__c = 'NRC');
        insert customPrice3;
        
        
        Id RecordTypeIdContact = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Equote').getRecordTypeId();
        
        Opportunity opp=new Opportunity();
        opp.name='TestOpp';
        opp.StageName='Closed/Won';
        opp.Probability = 10;
        opp.Reason_Won_Lost__c ='Duplicate';
        opp.Contact__c= con.id;
        opp.Contract_Term_Years__c=1;
        opp.CloseDate=System.today();
        // opp.StageName='New';
        //opp.AccountId=acc.id;
        opp.Company_size__c=1;
        //  opp.Reason_Won_Lost__c=' Defining '; 
        opp.Company_size__c=5;
        opp.Pricebook2Id=customPB.id;
        opp.Types_of_Product__c='Smart Voice';
         opp.RecordtypeId = RecordTypeIdContact;
        insert opp;
        Site__c site = new Site__c();
        site.Site_Number__c = 1;
        site.Opportunity__c = opp.id;
        site.PoE_option__c = 'Switch';
        string poe = site.PoE_option__c;
        insert site;
        string selVal4 = site.PoE_option__c;
        string siteId = site.Id;
        integer siteNumber = integer.valueOf(site.Site_Number__c);
        integer numberOfSites = integer.valueOf(site.Site_Number__c);
        String recordId = opp.id;
        decimal value =opp.Contract_Term_Years__c;  
        String contract = String.valueOf(value);
        
        List<Custom_Product__c> customproductlist2 =new List<Custom_Product__c>();   
        Custom_Product__c customproductlist =new Custom_Product__c();     
        customproductlist.ProductName__c='testProd';
        customproductlist.NumberOfSites__c=2;   
        customproductlist.Quantity__c=3;
        customproductlist.Opportunity__c=opp.id;     
        customproductlist.Total__c=900;
        customproductlist.MrcPrice__c=300;
        customproductlist2.add(customproductlist);
       // insert customproductlist2;
        
         
        Custom_Product__c customlist =new Custom_Product__c();     
        customlist.ProductName__c='testProd2';
        customlist.NumberOfSites__c=2;   
        customlist.Quantity__c=3;
        customlist.Opportunity__c=opp.id;     
        customlist.Total__c=900;
        customlist.MrcPrice__c=300;
        customproductlist2.add(customlist);
        insert customproductlist2;
        
        List<OpportunityLineItem> oppLst = new List<OpportunityLineItem>();
        OpportunityLineItem oppLn = new OpportunityLineItem();
        oppLn.Product_Name__c='Patch Cord';
        oppLn.Site__c = site.Id;
        oppLn.Product2Id=prod.Id;
        oppLn.Unit_Price__c=customPrice.UnitPrice;
        oppLn.Quantity=2;
        oppLn.Sub_Total__c=oppLn.Quantity*oppLn.Unit_Price__c;
        oppLn.TotalPrice=oppLn.Quantity*oppLn.Unit_Price__c;
        oppLn.OpportunityId=opp.id;
        oppLn.Type_of_billing__c = 'MRC';
        oppLn.Category__c = 'FAW';
        oppLn.Sub_Category__c = 'Licenses';
        oppLn.Filter_Product__c = 'Parent';
        oppLn.Equote_ext_ID__c = 'test';
        oppLn.Site_Number__c = site.Site_Number__c;
        oppLst.add(oppLn);
        
       /* OpportunityLineItem oppLn1 = new OpportunityLineItem();
        oppLn1.Product_Name__c='Patch Cord';
        oppLn1.Site__c = site.Id;
        oppLn1.Product2Id=prod1.Id;
        oppLn1.Unit_Price__c=customPrice1.UnitPrice;
        oppLn1.Quantity=2;
        oppLn1.Sub_Total__c=oppLn1.Quantity*oppLn1.Unit_Price__c;
        oppLn1.TotalPrice=oppLn1.Quantity*oppLn1.Unit_Price__c;
        oppLn1.OpportunityId=opp.id;
        oppLn1.Type_of_billing__c = 'NRC';
        oppLn1.Category__c = 'FAW';
        oppLn1.Sub_Category__c = 'Licenses';
        oppLn1.Filter_Product__c = 'Parent';
        oppLn1.Equote_ext_ID__c = 'test';
        oppLn1.Site_Number__c = site.Site_Number__c;
        oppLst.add(oppLn1); */
        
        insert oppLst; 
        
        boolean boolval = true;
        boolean boolval2 = true;
        boolean boolval3 = false;
        Decimal Total=2;
        Decimal NRCTotal=4;
        List<EquoteToolUpdateController.WrapperClass>wrapLst = new List<EquoteToolUpdateController.WrapperClass>();
        EquoteToolUpdateController.WrapperClass wrap = new EquoteToolUpdateController.WrapperClass(prod,boolval,boolval2,boolval3,customPrice,Total,NRCTotal);
        wrapLst.add(wrap);
        EquoteToolUpdateController.WrapperClass wrap1 = new EquoteToolUpdateController.WrapperClass(prod1,boolval,boolval2,boolval3,customPrice,Total,NRCTotal);
        wrapLst.add(wrap1);
        EquoteToolUpdateController.WrapperClass wrap11 = new EquoteToolUpdateController.WrapperClass(prod4,boolval,boolval2,boolval3,customPrice,Total,NRCTotal);
        wrapLst.add(wrap11);
        List<EquoteToolUpdateController.WrapperClass>wrapLst1 = new List<EquoteToolUpdateController.WrapperClass>();
        EquoteToolUpdateController.WrapperClass wrap2 = new EquoteToolUpdateController.WrapperClass(prod3,boolval,boolval2,boolval3,customPrice,Total,NRCTotal);
        wrapLst1.add(wrap2);
        EquoteToolUpdateController.WrapperClass wrap3 = new EquoteToolUpdateController.WrapperClass(prod1,boolval,boolval2,boolval3,customPrice,Total,NRCTotal);
        wrapLst1.add(wrap3);
        
        Test.startTest();
        EquoteToolUpdateController.fetchit();
        EquoteToolUpdateController.getProductType(recordId);
        EquoteToolUpdateController.getSiteNumber(recordId);
        EquoteToolUpdateController.getSiteId(recordId,siteNumber);
        EquoteToolUpdateController.typeOfPoe(recordId,siteNumber);
        EquoteToolUpdateController.prodType(recordId);
        EquoteToolUpdateController.getLicenseprodList(recordId,siteNumber);
        EquoteToolUpdateController.getIpPhoneProdList(recordId,siteNumber);
        EquoteToolUpdateController.getAddOnProdList(recordId,siteNumber);
        EquoteToolUpdateController.getIpPhoneProdList(recordId,siteNumber);
        EquoteToolUpdateController.getTelecommProdList(recordId,siteNumber);
        EquoteToolUpdateController.getSwitchProdList(recordId,siteNumber);
        EquoteToolUpdateController.getAccessoriesProdList(recordId,siteNumber);
        EquoteToolUpdateController.getLicenseSmartProdList(recordId,siteNumber);
        EquoteToolUpdateController.getAddOnSmartProdList(recordId,siteNumber);
        EquoteToolUpdateController.getIpPhoneSmartProdList(recordId,siteNumber);
        EquoteToolUpdateController.smartVoiceBroadbandProd(recordId,siteNumber);
        EquoteToolUpdateController.smartVoiceRepairProd(recordId,siteNumber);
        EquoteToolUpdateController.smartVoiceFIOSProd(recordId,siteNumber);
        EquoteToolUpdateController.smartVoiceFiberProd(recordId,siteNumber);
        EquoteToolUpdateController.smartVoiceBHSIProd(recordId,siteNumber);
        EquoteToolUpdateController.smartVoiceEquipmentProd(recordId,siteNumber);
        EquoteToolUpdateController.getSwitchesSmartProdList(recordId,siteNumber);
        EquoteToolUpdateController.smartVoiceTelecommProd(recordId,siteNumber);
        // EquoteToolUpdateController.getRepairSmartProdList(recordId,siteNumber);
        EquoteToolUpdateController.getCustomProdList(recordId,siteNumber);
        
        EquoteToolUpdateController.analogATArule(wrapLst,wrapLst);
        EquoteToolUpdateController.rule2(wrapLst,wrapLst1);
        EquoteToolUpdateController.telecommRule3(wrapLst,wrapLst);
        EquoteToolUpdateController.poeSwitch(wrapLst,poe);
        
        
        EquoteToolUpdateController.saveCustomProduct(customproductlist2,recordId,2);
        List<Custom_Product__c> customproductlist3 = new List<Custom_Product__c>(); 
        customproductlist3 = [Select id,ProductName__c,NumberOfSites__c,Type_of_billing__c,Quantity__c,Total__c,MrcPrice__c,Custom_Product_Identity__c from Custom_Product__c where id =: customproductlist2[0].id];
        EquoteToolUpdateController.saveCustomProduct(customproductlist3,recordId,2);
        EquoteToolUpdateController.saveRecord(recordId,wrapLst,wrapLst,wrapLst,wrapLst,wrapLst,wrapLst,selVal4,numberOfSites,siteId);
        EquoteToolUpdateController.saveSmartRecord(recordId,wrapLst,wrapLst,wrapLst,wrapLst,wrapLst,wrapLst,wrapLst,wrapLst,wrapLst,wrapLst,wrapLst,selVal4,numberOfSites,siteId);
        
        EquoteToolUpdateController.smartVoiceIpPhoneRule(wrapLst,wrapLst1);
        EquoteToolUpdateController.smartVoiceIpSoundStationRule(wrapLst,wrapLst1);
        EquoteToolUpdateController.smartVoiceAsymetricFiberProd(recordId,numberOfSites);
        /* EquoteToolUpdateController.getSwitchesSmartProdList(recordId,siteNumber);
EquoteToolUpdateController.getSwitchesSmartProdList(recordId,siteNumber);

EquoteToolUpdateController.getSwitchesSmartProdList(recordId,siteNumber);
*/
        
        List<Object> allProductList = new List<Object>();
        EquoteToolUpdateController.deleteProd(allProductList,recordId,siteNumber);
        EquoteToolUpdateController.deleteCustomProd(customproductlist2,recordId,siteNumber);
        Test.stopTest();
    }
}