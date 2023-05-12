@isTest
public class EquoteToolControllerV6Test {
    
    @isTest
    public static void EquoteToolControllerV6TestMethod1(){
        
        Contact con= new contact();
        con.LastName= 'Test';
        con.MobilePhone= '9898561236';
        con.Email = 'Test@gmail.com';
        con.phone='6739322567';
        insert con;       
        
        Product2 prod = new Product2(Name = 'Laptop X200',Quantity__c= '2',Child__c=true,IsActive=true,Product_Subcategory__c = 'Licenses',Family ='FAW',Product_Type__c ='FAW UCaaS',is_show_on_ux__c = true, Parent__c =true, Year__c = 'All');
        insert prod;
        
        Id standPricebookId = Test.getStandardPricebookId();
        PricebookEntry standardPrice = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = prod.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice;
        
        Pricebook2 customPB = new Pricebook2(Name='Custom Pricebook', isActive=true,Account_Type__c = 'type');
        insert customPB;
        
        PricebookEntry customPrice = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = prod.Id,UnitPrice = 12000, IsActive = true);
        insert customPrice;
        
        
        Opportunity opp=new Opportunity();
        opp.name='TestOpp';
         opp.StageName='Closed/Won';
        opp.Probability = 10;
        opp.Reason_Won_Lost__c ='Duplicate';
       
        //opp.Contact__c= con.id;
        opp.Contract_Term_Years__c=1;
        opp.CloseDate=System.today();
        //opp.StageName='New';
        //opp.AccountId=acc.id;
        opp.Company_size__c=1;
        //opp.Reason_Won_Lost__c=' Defining '; 
        opp.Company_size__c=5;
        opp.Pricebook2Id=customPB.id;
        opp.Types_of_Product__c='Smart Voice';
        insert opp;
        String recordId = opp.id;
        decimal value =opp.Contract_Term_Years__c;  
        String contract = String.valueOf(value);
        
        Custom_Product__c customproductlist =new Custom_Product__c();     
        customproductlist.ProductName__c=prod.name;
        customproductlist.NumberOfSites__c=2;   
        customproductlist.Quantity__c=3;
        customproductlist.Opportunity__c=opp.id;     
        customproductlist.Total__c=500;
        customproductlist.Quantity__c=2;
        customproductlist.MrcPrice__c=300;
        insert customproductlist;
        
        Rule1__c rule = new Rule1__c();
        rule.Product_Name__c = 'Laptop X200';
        rule.Condition__c = '<=';
        insert rule;
        
        Site__c site = new Site__c();
        site.Opportunity__c = opp.Id;
        site.PoE_option__c = 'switch';
        insert site;
        
        Integer siteNo= Integer.valueOf(customproductlist.NumberOfSites__c);
        //wrapper class
        boolean boolval=true;
        boolean boolval2=true;
        boolean boolval3=true;
        Decimal Total=2;
        Decimal NRCTotal=4;
        EquoteToolControllerV6.WrapperClass wrap = new EquoteToolControllerV6.WrapperClass(prod,boolval,boolval2,boolval3,customPrice,Total,NRCTotal);
        
        Test.startTest();
        EquoteToolControllerV6.updateOpportunity(recordId,contract);
        // EquoteToolControllerV6.getSiteAddress(recordId);
        EquoteToolControllerV6.getContactInfo(recordId); 
        EquoteToolControllerV6.typeofproduct(recordId,opp.Types_of_Product__c);
        EquoteToolControllerV6.getPicklistStateValue();
        EquoteToolControllerV6.updateContact(recordId,'name',con.email,con.Phone);
        //EquoteToolControllerV6.saveCustomProduct(new Custom_Product__c[]{customproductlist},recordId,siteNo);
        EquoteToolControllerV6.createSites('Switch',recordId,'BillingCity','Site_Street__c','BillingCountry','123456','AL' ,true,Integer.valueOf('1234'),'sitename');
        EquoteToolControllerV6.CompanySize(String.valueOf(opp.Company_size__c),recordId);
        EquoteToolControllerV6.getProduct(opp.Id);
        EquoteToolControllerV6.prod(opp.Id);
        EquoteToolControllerV6.prodTelecomm(opp.Id);
        EquoteToolControllerV6.prodIpPhones(opp.Id);
        EquoteToolControllerV6.prodAccessories(opp.Id);
        EquoteToolControllerV6.prodSwitchesAndPOE(opp.Id);
        EquoteToolControllerV6.QuoteType('type', recordId);
        
        EquoteToolControllerV6.rule1(new EquoteToolControllerV6.WrapperClass[]{wrap}, recordId);
        EquoteToolControllerV6.rule2(new EquoteToolControllerV6.WrapperClass[]{wrap}, new EquoteToolControllerV6.WrapperClass[]{wrap});
        EquoteToolControllerV6.telecommRule3(new EquoteToolControllerV6.WrapperClass[]{wrap}, new EquoteToolControllerV6.WrapperClass[]{wrap});
        EquoteToolControllerV6.poeSwitch(new EquoteToolControllerV6.WrapperClass[]{wrap},'Switch');
        EquoteToolControllerV6.saveRecord(recordId, new EquoteToolControllerV6.WrapperClass[]{wrap}, new EquoteToolControllerV6.WrapperClass[]{wrap}, new EquoteToolControllerV6.WrapperClass[]{wrap}, new EquoteToolControllerV6.WrapperClass[]{wrap}, new EquoteToolControllerV6.WrapperClass[]{wrap}, new EquoteToolControllerV6.WrapperClass[]{wrap}, 'switch', 2,site.Id);
       // EquoteToolControllerV6.saveRecordSmartProd(recordId, new EquoteToolControllerV6.WrapperClass[]{wrap}, new EquoteToolControllerV6.WrapperClass[]{wrap}, new EquoteToolControllerV6.WrapperClass[]{wrap}, new EquoteToolControllerV6.WrapperClass[]{wrap}, new EquoteToolControllerV6.WrapperClass[]{wrap}, new EquoteToolControllerV6.WrapperClass[]{wrap}, new EquoteToolControllerV6.WrapperClass[]{wrap}, new EquoteToolControllerV6.WrapperClass[]{wrap}, new EquoteToolControllerV6.WrapperClass[]{wrap}, new EquoteToolControllerV6.WrapperClass[]{wrap}, new EquoteToolControllerV6.WrapperClass[]{wrap},'switch', 2,site.Id);
        EquoteToolControllerV6.savePDFOpportunity(recordId);
        Test.stopTest();
    }
    
     @isTest
    public static void EquoteToolControllerV6TestMethod2(){
        
        Contact con= new contact();
        con.LastName= 'Test';
        con.MobilePhone= '9898561236';
        con.Email = 'Test@gmail.com';
        con.phone='6739322567';
        insert con;       
        
        Product2 prod = new Product2(Name = 'Laptop X200',Quantity__c= '2',Child__c=true,IsActive=true,Product_Subcategory__c = 'Licenses',Family ='Smart Voice',Product_Type__c ='Smart Voice',is_show_on_ux__c = true, Parent__c =true, Year__c = 'All');
        insert prod;
        
        Id standPricebookId = Test.getStandardPricebookId();
        PricebookEntry standardPrice = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = prod.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice;
        
        Pricebook2 customPB = new Pricebook2(Name='Custom Pricebook', isActive=true,Account_Type__c = 'type');
        insert customPB;
        
        PricebookEntry customPrice = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = prod.Id,UnitPrice = 12000, IsActive = true);
        insert customPrice;
        
        
        Opportunity opp=new Opportunity();
        opp.name='TestOpp';
        opp.StageName='Closed/Won';
        opp.Probability = 10;
        opp.Reason_Won_Lost__c ='Duplicate';
        opp.Contract_Term_Years__c=1;
        opp.CloseDate=System.today();
        opp.Company_size__c=1;
        opp.Company_size__c=5;
        opp.Pricebook2Id=customPB.id;
        opp.Contact__c = con.Id;
        opp.Types_of_Product__c='Smart Voice';
        insert opp;
        
        String recordId = opp.id;
        decimal value =opp.Contract_Term_Years__c;  
        String contract = String.valueOf(value);
        
        Custom_Product__c customproductlist =new Custom_Product__c();     
        customproductlist.ProductName__c=prod.name;
        customproductlist.NumberOfSites__c=2;   
        customproductlist.Quantity__c=3;
        customproductlist.Opportunity__c=opp.id;     
        customproductlist.Total__c=500;
        customproductlist.Quantity__c=2;
        customproductlist.MrcPrice__c=300;
        insert customproductlist;
         
        Site__c site = new Site__c();
        site.Opportunity__c = opp.Id;
        site.PoE_option__c = 'switch';
        insert site;
        
        Integer siteNo= Integer.valueOf(customproductlist.NumberOfSites__c);
        //wrapper class
        boolean boolval=true;
        boolean boolval2=true;
        boolean boolval3=true;
        Decimal Total=2;
        Decimal NRCTotal=4;
        List<Custom_Product__c>cusLst = new List<Custom_Product__c>();
        Custom_Product__c custom = new Custom_Product__c();
        custom.ProductName__c = 'cus1';
        custom.NumberOfSites__c = 1;
        custom.MrcPrice__c = 12;
        custom.Opportunity__c = opp.Id;
        custom.Quantity__c = 1;
        custom.Total__c = 12;
        custom.Type_of_billing__c = 'MRC';
        cusLst.add(custom);
        EquoteToolControllerV6.WrapperClass wrap = new EquoteToolControllerV6.WrapperClass(prod,boolval,boolval2,boolval3,customPrice,Total,NRCTotal);
        
        Test.startTest();
        EquoteToolControllerV6.fetchit();
        EquoteToolControllerV6.analogATArule(new EquoteToolControllerV6.WrapperClass[]{wrap}, new EquoteToolControllerV6.WrapperClass[]{wrap});
        EquoteToolControllerV6.saveCustomProduct(cusLst, opp.id, 1);
        EquoteToolControllerV6.getTypeOfProd(opp.Id);
        EquoteToolControllerV6.smartVoiceLicenseProd(opp.Id);
        EquoteToolControllerV6.smartVoiceAdOnProd(opp.Id);
        EquoteToolControllerV6.SmartVoiceIpPhonesProd(opp.Id);
        EquoteToolControllerV6.smartVoiceRepairProd(opp.Id);
        EquoteToolControllerV6.smartVoiceSwitchesAndPOEProd(opp.Id);
        EquoteToolControllerV6.smartVoiceFIOSProd(opp.Id);
        EquoteToolControllerV6.smartVoiceFiberProd(opp.Id);
        EquoteToolControllerV6.smartVoiceEquipmentProd(opp.Id);
        EquoteToolControllerV6.smartVoiceBroadbandProd(opp.Id);
        EquoteToolControllerV6.smartVoiceBHSIProd(opp.Id);
        EquoteToolControllerV6.smartVoiceAsymetricFiberProd(opp.Id);
        EquoteToolControllerV6.saveRecordSmartProd(recordId, new EquoteToolControllerV6.WrapperClass[]{wrap}, new EquoteToolControllerV6.WrapperClass[]{wrap}, new EquoteToolControllerV6.WrapperClass[]{wrap}, new EquoteToolControllerV6.WrapperClass[]{wrap}, new EquoteToolControllerV6.WrapperClass[]{wrap}, new EquoteToolControllerV6.WrapperClass[]{wrap}, new EquoteToolControllerV6.WrapperClass[]{wrap}, new EquoteToolControllerV6.WrapperClass[]{wrap}, new EquoteToolControllerV6.WrapperClass[]{wrap}, new EquoteToolControllerV6.WrapperClass[]{wrap}, new EquoteToolControllerV6.WrapperClass[]{wrap},'switch', 2,site.Id);
        Test.stopTest();
    }
}