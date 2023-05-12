@isTest
public class Smartvoicequote_Test {
    @isTest
    public static void Smartvoicemthd1(){
        Test.startTest();
        Contact con= new contact();
        con.LastName= 'Test';
        con.MobilePhone= '9898561236';
        con.Email = 'Test@gmail.com';
        insert con;  
        
        Product2 prod = new Product2(Name = 'Laptop',IsActive=true,Year__c ='All', Parent__c=true);
        insert prod;
        
        Id standPricebookId = Test.getStandardPricebookId();
        PricebookEntry standardPrice = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = prod.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice;
        
        Pricebook2 customPB = new Pricebook2(Name='Custom Pricebook', isActive=true);
        insert customPB;
        
        PricebookEntry priceEntrylist = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = prod.Id,UnitPrice = 12000, IsActive = true);
        insert priceEntrylist;
        
        Opportunity opp=new Opportunity();
        opp.name='TestOpp';
        opp.Contact__c= con.id; 
        opp.Contract_Term_Years__c=1;
        opp.CloseDate=System.today();
        opp.StageName='New';
        opp.Company_size__c = 100000;
        opp.Reason_Won_Lost__c=' Defining '; 
        opp.Types_of_Product__c='Frontier Anyware';
        opp.Pricebook2Id=customPB.id;
        insert opp;
        
        Site__c site = new Site__c();
        site.Opportunity__c = opp.Id;
        site.PoE_option__c = 'Switch';
        insert site;
        
        List<OpportunityLineItem> oppLineLst = new List<OpportunityLineItem>();
        
        OpportunityLineItem oppLine = new OpportunityLineItem();
        oppLine.Product_Name__c='Patch Cord';
        oppLine.Site__c = site.Id;
        oppLine.Product2Id=prod.Id;
        oppLine.Unit_Price__c=priceEntrylist.UnitPrice;
        oppLine.Quantity=2;
        oppLine.Sub_Total__c=oppLine.Quantity*oppLine.Unit_Price__c;
        oppLine.TotalPrice=oppLine.Quantity*oppLine.Unit_Price__c;
        oppLine.OpportunityId=opp.id;
        oppLine.Category__c = 'Smart Voice';
        oppLine.Sub_Category__c = 'Licenses';
        oppline.Filter_Product__c = 'Parent';
        //insert oppLine; 
        oppLineLst.add(oppline);
        
        OpportunityLineItem oppLn = new OpportunityLineItem();
        oppLn.Product_Name__c='Patch Cord';
        oppLn.Site__c = site.Id;
        oppLn.Product2Id=prod.Id;
        oppLn.Unit_Price__c=priceEntrylist.UnitPrice;
        oppLn.Quantity=2;
        oppLn.Sub_Total__c=oppLine.Quantity*oppLine.Unit_Price__c;
        oppLn.TotalPrice=oppLine.Quantity*oppLine.Unit_Price__c;
        oppLn.OpportunityId=opp.id;
        oppLn.Type_of_billing__c = 'MRC';
        oppLn.Category__c = 'Smart Voice';
        oppLn.Sub_Category__c = 'Licenses';
        oppLn.Filter_Product__c = 'Parent';
        // insert oppLn; 
        oppLineLst.add(oppLn);
        insert oppLineLst;
        
        PageReference pageRef = Page.SmartVoiceQuote; 
        Test.setCurrentPage(pageRef);
        pageRef.getParameters().put('id',opp.Id);
        ApexPages.StandardController sc = new ApexPages.standardController(opp);
        Smartvoicequote Smartvoice= new Smartvoicequote(sc);
        Smartvoice.attachPdf();
        Smartvoice.save();
        Test.stopTest();
    }
    
    @isTest
    public static void Smartvoicemthd2(){
        Test.startTest();
        Contact con= new contact();
        con.LastName= 'Test';
        con.MobilePhone= '9898561236';
        con.Email = 'Test@gmail.com';
        insert con;  
        
        Product2 prod = new Product2(Name = 'Laptop',IsActive=true,Year__c ='All', Parent__c=true);
        insert prod;
        
        Id standPricebookId = Test.getStandardPricebookId();
        PricebookEntry standardPrice = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = prod.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice;
        
        Pricebook2 customPB = new Pricebook2(Name='Custom Pricebook', isActive=true);
        insert customPB;
        
        PricebookEntry priceEntrylist = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = prod.Id,UnitPrice = 12000, IsActive = true);
        insert priceEntrylist;
        
        Opportunity opp=new Opportunity();
        opp.name='TestOpp';
        opp.Contact__c= con.id; 
        opp.Contract_Term_Years__c=1;
        opp.CloseDate=System.today();
        opp.StageName='New';
        opp.Company_size__c = 100000;
        opp.Reason_Won_Lost__c=' Defining '; 
        opp.Types_of_Product__c='Frontier Anyware';
        opp.Pricebook2Id=customPB.id;
        insert opp;
        
        Site__c site = new Site__c();
        site.Opportunity__c = opp.Id;
        site.PoE_option__c = 'Switch';
        insert site;
        
        List<OpportunityLineItem> oppLineLst = new List<OpportunityLineItem>();
        
        OpportunityLineItem oppLine = new OpportunityLineItem();
        oppLine.Product_Name__c='Patch Cord';
        oppLine.Site__c = site.Id;
        oppLine.Product2Id=prod.Id;
        oppLine.Unit_Price__c=priceEntrylist.UnitPrice;
        oppLine.Quantity=2;
        oppLine.Sub_Total__c=oppLine.Quantity*oppLine.Unit_Price__c;
        oppLine.TotalPrice=oppLine.Quantity*oppLine.Unit_Price__c;
        oppLine.OpportunityId=opp.id;
        oppLine.Category__c = 'Smart Voice';
        oppLine.Sub_Category__c = 'Add-On';
        oppline.Filter_Product__c = 'Parent';
       // insert oppLine; 
       oppLineLst.add(oppline);
        
        OpportunityLineItem oppLn = new OpportunityLineItem();
        oppLn.Product_Name__c='Patch Cord';
        oppLn.Site__c = site.Id;
        oppLn.Product2Id=prod.Id;
        oppLn.Unit_Price__c=priceEntrylist.UnitPrice;
        oppLn.Quantity=2;
        oppLn.Sub_Total__c=oppLine.Quantity*oppLine.Unit_Price__c;
        oppLn.TotalPrice=oppLine.Quantity*oppLine.Unit_Price__c;
        oppLn.OpportunityId=opp.id;
        oppLn.Type_of_billing__c = 'MRC';
        oppLn.Category__c = 'Smart Voice';
        oppLn.Sub_Category__c = 'Add-On';
         oppLn.Filter_Product__c = 'Parent';
        //insert oppLn; 
        oppLineLst.add(oppLn);
        insert oppLineLst;
        PageReference pageRef = Page.SmartVoiceQuote; 
        Test.setCurrentPage(pageRef);
        pageRef.getParameters().put('id',opp.Id);
        ApexPages.StandardController sc = new ApexPages.standardController(opp);
        Smartvoicequote Smartvoice= new Smartvoicequote(sc);
        Test.stopTest();
    }
    
    @isTest
    public static void Smartvoicemthd3(){
        Test.startTest();
        Contact con= new contact();
        con.LastName= 'Test';
        con.MobilePhone= '9898561236';
        con.Email = 'Test@gmail.com';
        insert con;  
        
        Product2 prod = new Product2(Name = 'Laptop',IsActive=true,Year__c ='All', Parent__c=true);
        insert prod;
        
        Id standPricebookId = Test.getStandardPricebookId();
        PricebookEntry standardPrice = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = prod.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice;
        
        Pricebook2 customPB = new Pricebook2(Name='Custom Pricebook', isActive=true);
        insert customPB;
        
        PricebookEntry priceEntrylist = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = prod.Id,UnitPrice = 12000, IsActive = true);
        insert priceEntrylist;
        
        Opportunity opp=new Opportunity();
        opp.name='TestOpp';
        opp.Contact__c= con.id; 
        opp.Contract_Term_Years__c=1;
        opp.CloseDate=System.today();
        opp.StageName='New';
        opp.Company_size__c = 100000;
        opp.Reason_Won_Lost__c=' Defining '; 
        opp.Types_of_Product__c='Frontier Anyware';
        opp.Pricebook2Id=customPB.id;
        insert opp;
        
        Site__c site = new Site__c();
        site.Opportunity__c = opp.Id;
        site.PoE_option__c = 'Switch';
        insert site;
        
        List<OpportunityLineItem> oppLineLst = new List<OpportunityLineItem>();
        
        OpportunityLineItem oppLine = new OpportunityLineItem();
        oppLine.Product_Name__c='Patch Cord';
        oppLine.Site__c = site.Id;
        oppLine.Product2Id=prod.Id;
        oppLine.Unit_Price__c=priceEntrylist.UnitPrice;
        oppLine.Quantity=2;
        oppLine.Sub_Total__c=oppLine.Quantity*oppLine.Unit_Price__c;
        oppLine.TotalPrice=oppLine.Quantity*oppLine.Unit_Price__c;
        oppLine.OpportunityId=opp.id;
        oppLine.Category__c = 'Smart Voice';
        oppLine.Sub_Category__c = 'IP Phones';
        oppline.Filter_Product__c = 'Parent';
       // insert oppLine; 
       oppLineLst.add(oppline);
        
        OpportunityLineItem oppLn = new OpportunityLineItem();
        oppLn.Product_Name__c='Patch Cord';
        oppLn.Site__c = site.Id;
        oppLn.Product2Id=prod.Id;
        oppLn.Unit_Price__c=priceEntrylist.UnitPrice;
        oppLn.Quantity=2;
        oppLn.Sub_Total__c=oppLine.Quantity*oppLine.Unit_Price__c;
        oppLn.TotalPrice=oppLine.Quantity*oppLine.Unit_Price__c;
        oppLn.OpportunityId=opp.id;
        oppLn.Type_of_billing__c = 'MRC';
        oppLn.Category__c = 'Smart Voice';
        oppLn.Sub_Category__c = 'IP Phones';
         oppLn.Filter_Product__c = 'Parent';
        //insert oppLn; 
        oppLineLst.add(oppLn);
        
        insert oppLineLst;
        PageReference pageRef = Page.SmartVoiceQuote; 
        // Test.startTest();
        Test.setCurrentPage(pageRef);
        pageRef.getParameters().put('id',opp.Id);
        ApexPages.StandardController sc = new ApexPages.standardController(opp);
        Smartvoicequote Smartvoice= new Smartvoicequote(sc);
        Test.stopTest();
    }
    
    
    
      @isTest
    public static void Smartvoicemthd11(){
        Test.startTest();
        Contact con= new contact();
        con.LastName= 'Test';
        con.MobilePhone= '9898561236';
        con.Email = 'Test@gmail.com';
        insert con;  
        
        Product2 prod = new Product2(Name = 'Laptop',IsActive=true,Year__c ='All', Parent__c=true);
        insert prod;
        
        Id standPricebookId = Test.getStandardPricebookId();
        PricebookEntry standardPrice = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = prod.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice;
        
        Pricebook2 customPB = new Pricebook2(Name='Custom Pricebook', isActive=true);
        insert customPB;
        
        PricebookEntry priceEntrylist = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = prod.Id,UnitPrice = 12000, IsActive = true);
        insert priceEntrylist;
        
        Opportunity opp=new Opportunity();
        opp.name='TestOpp';
        opp.Contact__c= con.id; 
        opp.Contract_Term_Years__c=1;
        opp.CloseDate=System.today();
        opp.StageName='New';
        opp.Company_size__c = 100000;
        opp.Reason_Won_Lost__c=' Defining '; 
        opp.Types_of_Product__c='Frontier Anyware';
        opp.Pricebook2Id=customPB.id;
        insert opp;
        
        Site__c site = new Site__c();
        site.Opportunity__c = opp.Id;
        site.PoE_option__c = 'Switch';
        insert site;
        
        List<OpportunityLineItem> oppLineLst = new List<OpportunityLineItem>();
        
        OpportunityLineItem oppLine = new OpportunityLineItem();
        oppLine.Product_Name__c='Patch Cord';
        oppLine.Site__c = site.Id;
        oppLine.Product2Id=prod.Id;
        oppLine.Unit_Price__c=priceEntrylist.UnitPrice;
        oppLine.Quantity=2;
        oppLine.Sub_Total__c=oppLine.Quantity*oppLine.Unit_Price__c;
        oppLine.TotalPrice=oppLine.Quantity*oppLine.Unit_Price__c;
        oppLine.OpportunityId=opp.id;
        oppLine.Category__c = 'Smart Voice';
        oppLine.Sub_Category__c = 'FIOS';
        oppline.Filter_Product__c = 'Parent';
       // insert oppLine; 
       oppLineLst.add(oppline);
        
        OpportunityLineItem oppLn = new OpportunityLineItem();
        oppLn.Product_Name__c='Patch Cord';
        oppLn.Site__c = site.Id;
        oppLn.Product2Id=prod.Id;
        oppLn.Unit_Price__c=priceEntrylist.UnitPrice;
        oppLn.Quantity=2;
        oppLn.Sub_Total__c=oppLine.Quantity*oppLine.Unit_Price__c;
        oppLn.TotalPrice=oppLine.Quantity*oppLine.Unit_Price__c;
        oppLn.OpportunityId=opp.id;
        oppLn.Type_of_billing__c = 'MRC';
        oppLn.Category__c = 'Smart Voice';
        oppLn.Sub_Category__c = 'FIOS';
        oppLn.Filter_Product__c = 'Parent';
        //insert oppLn; 
        oppLineLst.add(oppLn);
        
        insert oppLineLst;
        PageReference pageRef = Page.SmartVoiceQuote; 
        // Test.startTest();
        Test.setCurrentPage(pageRef);
        pageRef.getParameters().put('id',opp.Id);
        ApexPages.StandardController sc = new ApexPages.standardController(opp);
        Smartvoicequote Smartvoice= new Smartvoicequote(sc);
        Test.stopTest();
    }
    
    
    
    
    
    
      @isTest
    public static void Smartvoicemthd12(){
        Test.startTest();
        Contact con= new contact();
        con.LastName= 'Test';
        con.MobilePhone= '9898561236';
        con.Email = 'Test@gmail.com';
        insert con;  
        
        Product2 prod = new Product2(Name = 'Laptop',IsActive=true,Year__c ='All', Parent__c=true);
        insert prod;
        
        Id standPricebookId = Test.getStandardPricebookId();
        PricebookEntry standardPrice = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = prod.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice;
        
        Pricebook2 customPB = new Pricebook2(Name='Custom Pricebook', isActive=true);
        insert customPB;
        
        PricebookEntry priceEntrylist = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = prod.Id,UnitPrice = 12000, IsActive = true);
        insert priceEntrylist;
        
        Opportunity opp=new Opportunity();
        opp.name='TestOpp';
        opp.Contact__c= con.id; 
        opp.Contract_Term_Years__c=1;
        opp.CloseDate=System.today();
        opp.StageName='New';
        opp.Company_size__c = 100000;
        opp.Reason_Won_Lost__c=' Defining '; 
        opp.Types_of_Product__c='Frontier Anyware';
        opp.Pricebook2Id=customPB.id;
        insert opp;
        
        Site__c site = new Site__c();
        site.Opportunity__c = opp.Id;
        site.PoE_option__c = 'Switch';
        insert site;
        
        List<OpportunityLineItem> oppLineLst = new List<OpportunityLineItem>();
        
        OpportunityLineItem oppLine = new OpportunityLineItem();
        oppLine.Product_Name__c='Patch Cord';
        oppLine.Site__c = site.Id;
        oppLine.Product2Id=prod.Id;
        oppLine.Unit_Price__c=priceEntrylist.UnitPrice;
        oppLine.Quantity=2;
        oppLine.Sub_Total__c=oppLine.Quantity*oppLine.Unit_Price__c;
        oppLine.TotalPrice=oppLine.Quantity*oppLine.Unit_Price__c;
        oppLine.OpportunityId=opp.id;
        oppLine.Category__c = 'Smart Voice';
        oppLine.Sub_Category__c = 'Broadband';
        oppline.Filter_Product__c = 'Parent';
       // insert oppLine; 
       oppLineLst.add(oppline);
        
        OpportunityLineItem oppLn = new OpportunityLineItem();
        oppLn.Product_Name__c='Patch Cord';
        oppLn.Site__c = site.Id;
        oppLn.Product2Id=prod.Id;
        oppLn.Unit_Price__c=priceEntrylist.UnitPrice;
        oppLn.Quantity=2;
        oppLn.Sub_Total__c=oppLine.Quantity*oppLine.Unit_Price__c;
        oppLn.TotalPrice=oppLine.Quantity*oppLine.Unit_Price__c;
        oppLn.OpportunityId=opp.id;
        oppLn.Type_of_billing__c = 'MRC';
        oppLn.Category__c = 'Smart Voice';
        oppLn.Sub_Category__c = 'Broadband';
        oppLn.Filter_Product__c = 'Parent';
        //insert oppLn; 
        oppLineLst.add(oppLn);
        
        insert oppLineLst;
        PageReference pageRef = Page.SmartVoiceQuote; 
        // Test.startTest();
        Test.setCurrentPage(pageRef);
        pageRef.getParameters().put('id',opp.Id);
        ApexPages.StandardController sc = new ApexPages.standardController(opp);
        Smartvoicequote Smartvoice= new Smartvoicequote(sc);
        Test.stopTest();
    }
    
          @isTest
    public static void Smartvoicemthd13(){
        Test.startTest();
        Contact con= new contact();
        con.LastName= 'Test';
        con.MobilePhone= '9898561236';
        con.Email = 'Test@gmail.com';
        insert con;  
        
        Product2 prod = new Product2(Name = 'Laptop',IsActive=true,Year__c ='All', Parent__c=true);
        insert prod;
        
        Id standPricebookId = Test.getStandardPricebookId();
        PricebookEntry standardPrice = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = prod.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice;
        
        Pricebook2 customPB = new Pricebook2(Name='Custom Pricebook', isActive=true);
        insert customPB;
        
        PricebookEntry priceEntrylist = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = prod.Id,UnitPrice = 12000, IsActive = true);
        insert priceEntrylist;
        
        Opportunity opp=new Opportunity();
        opp.name='TestOpp';
        opp.Contact__c= con.id; 
        opp.Contract_Term_Years__c=1;
        opp.CloseDate=System.today();
        opp.StageName='New';
        opp.Company_size__c = 100000;
        opp.Reason_Won_Lost__c=' Defining '; 
        opp.Types_of_Product__c='Frontier Anyware';
        opp.Pricebook2Id=customPB.id;
        insert opp;
        
        Site__c site = new Site__c();
        site.Opportunity__c = opp.Id;
        site.PoE_option__c = 'Switch';
        insert site;
        
        List<OpportunityLineItem> oppLineLst = new List<OpportunityLineItem>();
        
        OpportunityLineItem oppLine = new OpportunityLineItem();
        oppLine.Product_Name__c='Patch Cord';
        oppLine.Site__c = site.Id;
        oppLine.Product2Id=prod.Id;
        oppLine.Unit_Price__c=priceEntrylist.UnitPrice;
        oppLine.Quantity=2;
        oppLine.Sub_Total__c=oppLine.Quantity*oppLine.Unit_Price__c;
        oppLine.TotalPrice=oppLine.Quantity*oppLine.Unit_Price__c;
        oppLine.OpportunityId=opp.id;
        oppLine.Category__c = 'Smart Voice';
        oppLine.Sub_Category__c = 'Fiber';
        oppline.Filter_Product__c = 'Parent';
       // insert oppLine; 
       oppLineLst.add(oppline);
        
        OpportunityLineItem oppLn = new OpportunityLineItem();
        oppLn.Product_Name__c='Patch Cord';
        oppLn.Site__c = site.Id;
        oppLn.Product2Id=prod.Id;
        oppLn.Unit_Price__c=priceEntrylist.UnitPrice;
        oppLn.Quantity=2;
        oppLn.Sub_Total__c=oppLine.Quantity*oppLine.Unit_Price__c;
        oppLn.TotalPrice=oppLine.Quantity*oppLine.Unit_Price__c;
        oppLn.OpportunityId=opp.id;
        oppLn.Type_of_billing__c = 'MRC';
        oppLn.Category__c = 'Smart Voice';
        oppLn.Sub_Category__c = 'Fiber';
        oppLn.Filter_Product__c = 'Parent';
        //insert oppLn; 
        oppLineLst.add(oppLn);
        
        insert oppLineLst;
        PageReference pageRef = Page.SmartVoiceQuote; 
        // Test.startTest();
        Test.setCurrentPage(pageRef);
        pageRef.getParameters().put('id',opp.Id);
        ApexPages.StandardController sc = new ApexPages.standardController(opp);
        Smartvoicequote Smartvoice= new Smartvoicequote(sc);
        Test.stopTest();
    }
        @isTest
    public static void Smartvoicemthd14(){
        Test.startTest();
        Contact con= new contact();
        con.LastName= 'Test';
        con.MobilePhone= '9898561236';
        con.Email = 'Test@gmail.com';
        insert con;  
        
        Product2 prod = new Product2(Name = 'Laptop',IsActive=true,Year__c ='All', Parent__c=true);
        insert prod;
        
        Id standPricebookId = Test.getStandardPricebookId();
        PricebookEntry standardPrice = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = prod.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice;
        
        Pricebook2 customPB = new Pricebook2(Name='Custom Pricebook', isActive=true);
        insert customPB;
        
        PricebookEntry priceEntrylist = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = prod.Id,UnitPrice = 12000, IsActive = true);
        insert priceEntrylist;
        
        Opportunity opp=new Opportunity();
        opp.name='TestOpp';
        opp.Contact__c= con.id; 
        opp.Contract_Term_Years__c=1;
        opp.CloseDate=System.today();
        opp.StageName='New';
        opp.Company_size__c = 100000;
        opp.Reason_Won_Lost__c=' Defining '; 
        opp.Types_of_Product__c='Frontier Anyware';
        opp.Pricebook2Id=customPB.id;
        insert opp;
        
        Site__c site = new Site__c();
        site.Opportunity__c = opp.Id;
        site.PoE_option__c = 'Switch';
        insert site;
        
        List<OpportunityLineItem> oppLineLst = new List<OpportunityLineItem>();
        
        OpportunityLineItem oppLine = new OpportunityLineItem();
        oppLine.Product_Name__c='Patch Cord';
        oppLine.Site__c = site.Id;
        oppLine.Product2Id=prod.Id;
        oppLine.Unit_Price__c=priceEntrylist.UnitPrice;
        oppLine.Quantity=2;
        oppLine.Sub_Total__c=oppLine.Quantity*oppLine.Unit_Price__c;
        oppLine.TotalPrice=oppLine.Quantity*oppLine.Unit_Price__c;
        oppLine.OpportunityId=opp.id;
        oppLine.Category__c = 'Smart Voice';
        oppLine.Sub_Category__c = 'BHSI';
        oppline.Filter_Product__c = 'Parent';
       // insert oppLine; 
       oppLineLst.add(oppline);
        
        OpportunityLineItem oppLn = new OpportunityLineItem();
        oppLn.Product_Name__c='Patch Cord';
        oppLn.Site__c = site.Id;
        oppLn.Product2Id=prod.Id;
        oppLn.Unit_Price__c=priceEntrylist.UnitPrice;
        oppLn.Quantity=2;
        oppLn.Sub_Total__c=oppLine.Quantity*oppLine.Unit_Price__c;
        oppLn.TotalPrice=oppLine.Quantity*oppLine.Unit_Price__c;
        oppLn.OpportunityId=opp.id;
        oppLn.Type_of_billing__c = 'MRC';
        oppLn.Category__c = 'Smart Voice';
        oppLn.Sub_Category__c = 'BHSI';
        oppLn.Filter_Product__c = 'Parent';
        //insert oppLn; 
        oppLineLst.add(oppLn);
        
        insert oppLineLst;
        PageReference pageRef = Page.SmartVoiceQuote; 
        // Test.startTest();
        Test.setCurrentPage(pageRef);
        pageRef.getParameters().put('id',opp.Id);
        ApexPages.StandardController sc = new ApexPages.standardController(opp);
        Smartvoicequote Smartvoice= new Smartvoicequote(sc);
        Test.stopTest();
    }
    
        @isTest
    public static void Smartvoicemthd15(){
        Test.startTest();
        Contact con= new contact();
        con.LastName= 'Test';
        con.MobilePhone= '9898561236';
        con.Email = 'Test@gmail.com';
        insert con;  
        
        Product2 prod = new Product2(Name = 'Laptop',IsActive=true,Year__c ='All', Parent__c=true);
        insert prod;
        
        Id standPricebookId = Test.getStandardPricebookId();
        PricebookEntry standardPrice = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = prod.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice;
        
        Pricebook2 customPB = new Pricebook2(Name='Custom Pricebook', isActive=true);
        insert customPB;
        
        PricebookEntry priceEntrylist = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = prod.Id,UnitPrice = 12000, IsActive = true);
        insert priceEntrylist;
        
        Opportunity opp=new Opportunity();
        opp.name='TestOpp';
        opp.Contact__c= con.id; 
        opp.Contract_Term_Years__c=1;
        opp.CloseDate=System.today();
        opp.StageName='New';
        opp.Company_size__c = 100000;
        opp.Reason_Won_Lost__c=' Defining '; 
        opp.Types_of_Product__c='Frontier Anyware';
        opp.Pricebook2Id=customPB.id;
        insert opp;
        
        Site__c site = new Site__c();
        site.Opportunity__c = opp.Id;
        site.PoE_option__c = 'Switch';
        insert site;
        
        List<OpportunityLineItem> oppLineLst = new List<OpportunityLineItem>();
        
        OpportunityLineItem oppLine = new OpportunityLineItem();
        oppLine.Product_Name__c='Patch Cord';
        oppLine.Site__c = site.Id;
        oppLine.Product2Id=prod.Id;
        oppLine.Unit_Price__c=priceEntrylist.UnitPrice;
        oppLine.Quantity=2;
        oppLine.Sub_Total__c=oppLine.Quantity*oppLine.Unit_Price__c;
        oppLine.TotalPrice=oppLine.Quantity*oppLine.Unit_Price__c;
        oppLine.OpportunityId=opp.id;
        oppLine.Category__c = 'Smart Voice';
        oppLine.Sub_Category__c = 'Toll Free Bundle Minutes';
        oppline.Filter_Product__c = 'Parent';
       // insert oppLine; 
       oppLineLst.add(oppline);
        
        OpportunityLineItem oppLn = new OpportunityLineItem();
        oppLn.Product_Name__c='Patch Cord';
        oppLn.Site__c = site.Id;
        oppLn.Product2Id=prod.Id;
        oppLn.Unit_Price__c=priceEntrylist.UnitPrice;
        oppLn.Quantity=2;
        oppLn.Sub_Total__c=oppLine.Quantity*oppLine.Unit_Price__c;
        oppLn.TotalPrice=oppLine.Quantity*oppLine.Unit_Price__c;
        oppLn.OpportunityId=opp.id;
        oppLn.Type_of_billing__c = 'MRC';
        oppLn.Category__c = 'Smart Voice';
        oppLn.Sub_Category__c = 'Toll Free Bundle Minutes';
        oppLn.Filter_Product__c = 'Parent';
        //insert oppLn; 
        oppLineLst.add(oppLn);
        
        insert oppLineLst;
        PageReference pageRef = Page.SmartVoiceQuote; 
        // Test.startTest();
        Test.setCurrentPage(pageRef);
        pageRef.getParameters().put('id',opp.Id);
        ApexPages.StandardController sc = new ApexPages.standardController(opp);
        Smartvoicequote Smartvoice= new Smartvoicequote(sc);
        Test.stopTest();
    }
    
     @isTest
    public static void Smartvoicemthd16(){
        Test.startTest();
        Contact con= new contact();
        con.LastName= 'Test';
        con.MobilePhone= '9898561236';
        con.Email = 'Test@gmail.com';
        insert con;  
        
        Product2 prod = new Product2(Name = 'Laptop',IsActive=true,Year__c ='All', Parent__c=true);
        insert prod;
        
        Id standPricebookId = Test.getStandardPricebookId();
        PricebookEntry standardPrice = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = prod.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice;
        
        Pricebook2 customPB = new Pricebook2(Name='Custom Pricebook', isActive=true);
        insert customPB;
        
        PricebookEntry priceEntrylist = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = prod.Id,UnitPrice = 12000, IsActive = true);
        insert priceEntrylist;
        
        Opportunity opp=new Opportunity();
        opp.name='TestOpp';
        opp.Contact__c= con.id; 
        opp.Contract_Term_Years__c=1;
        opp.CloseDate=System.today();
        opp.StageName='New';
        opp.Company_size__c = 100000;
        opp.Reason_Won_Lost__c=' Defining '; 
        opp.Types_of_Product__c='Frontier Anyware';
        opp.Pricebook2Id=customPB.id;
        insert opp;
        
        Site__c site = new Site__c();
        site.Opportunity__c = opp.Id;
        site.PoE_option__c = 'Switch';
        insert site;
        
        List<OpportunityLineItem> oppLineLst = new List<OpportunityLineItem>();
        
        OpportunityLineItem oppLine = new OpportunityLineItem();
        oppLine.Product_Name__c='Patch Cord';
        oppLine.Site__c = site.Id;
        oppLine.Product2Id=prod.Id;
        oppLine.Unit_Price__c=priceEntrylist.UnitPrice;
        oppLine.Quantity=2;
        oppLine.Sub_Total__c=oppLine.Quantity*oppLine.Unit_Price__c;
        oppLine.TotalPrice=oppLine.Quantity*oppLine.Unit_Price__c;
        oppLine.OpportunityId=opp.id;
        oppLine.Category__c = 'Smart Voice';
        oppLine.Sub_Category__c = 'Installation';
        oppLine.Releted__c = 'child';
        oppline.Filter_Product__c = 'Child';
       // insert oppLine; 
       oppLineLst.add(oppline);
        
        OpportunityLineItem oppLn = new OpportunityLineItem();
        oppLn.Product_Name__c='Patch Cord';
        oppLn.Site__c = site.Id;
        oppLn.Product2Id=prod.Id;
        oppLn.Unit_Price__c=priceEntrylist.UnitPrice;
        oppLn.Quantity=2;
        oppLn.Sub_Total__c=oppLine.Quantity*oppLine.Unit_Price__c;
        oppLn.TotalPrice=oppLine.Quantity*oppLine.Unit_Price__c;
        oppLn.OpportunityId=opp.id;
        oppLn.Type_of_billing__c = 'MRC';
        oppLn.Category__c = 'Smart Voice';
        oppLn.Sub_Category__c = 'Installation';
         oppLn.Releted__c = 'child';
        oppLn.Filter_Product__c = 'Child';
        //insert oppLn; 
        oppLineLst.add(oppLn);
        
        insert oppLineLst;
        PageReference pageRef = Page.SmartVoiceQuote; 
        // Test.startTest();
        Test.setCurrentPage(pageRef);
        pageRef.getParameters().put('id',opp.Id);
        ApexPages.StandardController sc = new ApexPages.standardController(opp);
        Smartvoicequote Smartvoice= new Smartvoicequote(sc);
        Test.stopTest();
    }
        
    
      @isTest
    public static void UCaaSMethod1(){
        Test.startTest();
        Contact con= new contact();
        con.LastName= 'Test';
        con.Phone= '9898561236';
        con.Email = 'Test@gmail.com';
        insert con; 
        
        Id standPricebookId = Test.getStandardPricebookId();
        Pricebook2 customPB = new Pricebook2(Name='Custom Pricebook', isActive=true);
        insert customPB;
        
        Product2 prod1 = new Product2(Name = 'Premium',Family = 'Smart Voice',Product_Subcategory__c='Licenses',Parent__c=true,Equipment__c =false);
        insert prod1;
        PricebookEntry standardPrice1 = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = prod1.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice1;
        PricebookEntry customPrice1 = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = prod1.Id,UnitPrice = 12000, IsActive = true,Type_of_Billing__c = 'MRC');
        insert customPrice1;
        
        Product2 prod2 = new Product2(Name = 'Premium Plus',Family = 'Smart Voice',Product_Subcategory__c='Licenses',Parent__c=true,Equipment__c =false);
        insert prod2;
        PricebookEntry standardPrice2 = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = prod2.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice2;
        PricebookEntry customPrice2 = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = prod2.Id,UnitPrice = 12000, IsActive = true,Type_of_Billing__c = 'MRC');
        insert customPrice2;
        
        Product2 prod3 = new Product2(Name = 'Analog',Family = 'Smart Voice',Product_Subcategory__c='Licenses',Parent__c=true,Equipment__c =false);
        insert prod3;
        PricebookEntry standardPrice3 = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = prod3.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice3;
        PricebookEntry customPrice3 = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = prod3.Id,UnitPrice = 12000, IsActive = true,Type_of_Billing__c = 'MRC');
        insert customPrice3;
        
        Product2 prod4 = new Product2(Name = 'Conference Room Seat',Family = 'Smart Voice',Product_Subcategory__c='Licenses',Parent__c=true,Equipment__c =false);
        insert prod4;
        PricebookEntry standardPrice4 = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = prod4.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice4;
        PricebookEntry customPrice4 = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = prod4.Id,UnitPrice = 12000, IsActive = true,Type_of_Billing__c = 'MRC');
        insert customPrice4;
        
      /*  Product2 prod5 = new Product2(Name = 'Elite Set Up',Family = 'Smart Voice',Product_Subcategory__c='Activation Charges',Child__c=true,Equipment__c =false);
        insert prod5;
        PricebookEntry standardPrice5 = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = prod5.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice5;
        PricebookEntry customPrice5 = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = prod5.Id,UnitPrice = 12000, IsActive = true,Type_of_Billing__c = 'NRC');
        insert customPrice5;*/
        
        Product2 prod6 = new Product2(Name = 'Additional DIDs for reserve or Auto Attendant',Family = 'Smart Voice',Product_Subcategory__c='Add-On',child__c=true,Equipment__c =false);
        insert prod6;
        PricebookEntry standardPrice6 = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = prod6.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice6;
        PricebookEntry customPrice6 = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = prod6.Id,UnitPrice = 12000, IsActive = true,Type_of_Billing__c = 'MRC');
        insert customPrice6;
        
       /* Product2 prod7 = new Product2(Name = 'Premium Auto Attendant',Family = 'Smart Voice',Product_Subcategory__c='Add-On',child__c=true,Equipment__c =false);
        insert prod7;
        PricebookEntry standardPrice7 = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = prod7.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice7;
        PricebookEntry customPrice7 = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = prod7.Id,UnitPrice = 12000, IsActive = true,Type_of_Billing__c = 'MRC');
        insert customPrice7;
        
        Product2 prod8 = new Product2(Name = 'Directory Listings',Family = 'Smart Voice',Product_Subcategory__c='Add-On',Equipment__c =false);
        insert prod8;
        PricebookEntry standardPrice8 = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = prod8.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice8;
        PricebookEntry customPrice8 = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = prod8.Id,UnitPrice = 12000, IsActive = true,Type_of_Billing__c = 'NRC');
        insert customPrice8;
        
           Product2 prod9 = new Product2(Name = 'Extended Market Number',Family = 'Smart Voice',Product_Subcategory__c='Add-On',Equipment__c =false);
        insert prod8;
        PricebookEntry standardPrice9 = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = prod9.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice9;
        PricebookEntry customPrice9 = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = prod9.Id,UnitPrice = 12000, IsActive = true,Type_of_Billing__c = 'NRC');
        insert customPrice9;
        
           Product2 prod10 = new Product2(Name = 'Toll Free Number',Family = 'Smart Voice',Product_Subcategory__c='Add-On',Equipment__c =false);
        insert prod10;
        PricebookEntry standardPrice10 = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = prod10.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice10;
        PricebookEntry customPrice10 = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = prod10.Id,UnitPrice = 12000, IsActive = true,Type_of_Billing__c = 'NRC');
        insert customPrice10;
        
           Product2 prod11 = new Product2(Name = 'Toll Free Domestic Block of Time',Family = 'Smart Voice',Product_Subcategory__c='Add-On',Equipment__c =false);
        insert prod11;
        PricebookEntry standardPrice11 = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = prod11.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice11;
        PricebookEntry customPrice11 = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = prod11.Id,UnitPrice = 12000, IsActive = true,Type_of_Billing__c = 'NRC');
        insert customPrice11;
        
           Product2 prod12 = new Product2(Name = 'Toll Free Domestic US Overage Rate Per Minute ',Family = 'Smart Voice',Product_Subcategory__c='Add-On',Equipment__c =false);
        insert prod12;
        PricebookEntry standardPrice12 = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = prod12.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice12;
        PricebookEntry customPrice12 = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = prod12.Id,UnitPrice = 12000, IsActive = true,Type_of_Billing__c = 'NRC');
        insert customPrice12;
        
           Product2 prod13 = new Product2(Name = 'Multi Line HUNT Group',Family = 'Smart Voice',Product_Subcategory__c='Add-On',Equipment__c =false);
        insert prod13;
        PricebookEntry standardPrice13 = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = prod13.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice13;
        PricebookEntry customPrice13 = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = prod13.Id,UnitPrice = 12000, IsActive = true,Type_of_Billing__c = 'NRC');
        insert customPrice13;
        
           Product2 prod14 = new Product2(Name = 'Additional Managed Auto Attendants ',Family = 'Smart Voice',Product_Subcategory__c='Add-On',Equipment__c =false);
        insert prod14;
        PricebookEntry standardPrice14 = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = prod14.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice14;
        PricebookEntry customPrice14 = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = prod14.Id,UnitPrice = 12000, IsActive = true,Type_of_Billing__c = 'NRC');
        insert customPrice14;
        
           Product2 prod15 = new Product2(Name = 'E-911',Family = 'Smart Voice',Product_Subcategory__c='Add-On',Equipment__c =false);
        insert prod15;
        PricebookEntry standardPrice15 = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = prod15.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice15;
        PricebookEntry customPrice15 = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = prod15.Id,UnitPrice = 12000, IsActive = true,Type_of_Billing__c = 'NRC');
        insert customPrice15;
        
         Product2 prod16 = new Product2(Name = 'Monthly Feature Admin Charge',Family = 'Smart Voice',Product_Subcategory__c='Add-On',Equipment__c =false);
        insert prod16;
        PricebookEntry standardPrice16 = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = prod16.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice16;
        PricebookEntry customPrice16 = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = prod16.Id,UnitPrice = 12000, IsActive = true,Type_of_Billing__c = 'NRC');
        insert customPrice16;
        */
           Product2 prod17 = new Product2(Name = 'SmartVoice + FiOS 100/100 Broadband (Only Premium Plus; First Seat) ',Family = 'Smart Voice',Product_Subcategory__c='FIOS',Equipment__c =false);
        insert prod17;
        PricebookEntry standardPrice17 = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = prod17.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice17;
        PricebookEntry customPrice17 = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = prod17.Id,UnitPrice = 12000, IsActive = true,Type_of_Billing__c = 'MRC');
        insert customPrice17;
        
           Product2 prod18 = new Product2(Name = 'SmartVoice + FiOS 500/500 Broadband (Only Premium Plus; First Seat)',Family = 'Smart Voice',Product_Subcategory__c='FIOS',Equipment__c =false);
        insert prod18;
        PricebookEntry standardPrice18 = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = prod18.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice18;
        PricebookEntry customPrice18 = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = prod18.Id,UnitPrice = 12000, IsActive = true,Type_of_Billing__c = 'MRC');
        insert customPrice18;
        
         Product2 prod19 = new Product2(Name = 'SmartVoice + FiOS 1G /1G Broadband (Only Premium Plus; First Seat) ',Family = 'Smart Voice',Product_Subcategory__c='FIOS',Equipment__c =false);
        insert prod19;
        PricebookEntry standardPrice19 = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = prod19.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice19;
        PricebookEntry customPrice19 = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = prod19.Id,UnitPrice = 12000, IsActive = true,Type_of_Billing__c = 'MRC');
        insert customPrice19;
        
            Product2 prod20 = new Product2(Name = 'SmartVoice + Fiber 100/100 Broadband (Only Premium Plus; First Seat)  ',Family = 'Smart Voice',Product_Subcategory__c='Fiber',Equipment__c =false);
        insert prod20;
        PricebookEntry standardPrice20 = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = prod20.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice20;
        PricebookEntry customPrice20 = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = prod20.Id,UnitPrice = 12000, IsActive = true,Type_of_Billing__c = 'MRC');
        insert customPrice20;
        
           Product2 prod21 = new Product2(Name = 'SmartVoice + Fiber  500/500 Broadband (Only Premium Plus; First Seat)',Family = 'Smart Voice',Product_Subcategory__c='Fiber',Equipment__c =false);
        insert prod21;
        PricebookEntry standardPrice21 = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = prod21.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice21;
        PricebookEntry customPrice21 = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = prod21.Id,UnitPrice = 12000, IsActive = true,Type_of_Billing__c = 'MRC');
        insert customPrice21;
        
         Product2 prod22 = new Product2(Name = 'SmartVoice + Fiber 1G /1G Broadband (Only Premium Plus; First Seat)  ',Family = 'Smart Voice',Product_Subcategory__c='Fiber',Equipment__c =false);
        insert prod22;
        PricebookEntry standardPrice22 = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = prod22.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice22;
        PricebookEntry customPrice22 = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = prod22.Id,UnitPrice = 12000, IsActive = true,Type_of_Billing__c = 'MRC');
        insert customPrice22;
        
          Product2 prod23 = new Product2(Name = 'SmartVoice + Fiber 100/100 Broadband (Only Premium Plus; First Seat)  ',Family = 'Smart Voice',Product_Subcategory__c='IP Phones',Equipment__c =false);
        insert prod23;
        PricebookEntry standardPrice23 = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = prod23.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice23;
        PricebookEntry customPrice23 = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = prod23.Id,UnitPrice = 12000, IsActive = true,Type_of_Billing__c = 'MRC');
        insert customPrice23;
        
           Product2 prod24 = new Product2(Name = 'SmartVoice + Fiber  500/500 Broadband (Only Premium Plus; First Seat)',Family = 'Smart Voice',Product_Subcategory__c='IP Phones',Equipment__c =false);
        insert prod24;
        PricebookEntry standardPrice24 = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = prod24.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice24;
        PricebookEntry customPrice24 = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = prod24.Id,UnitPrice = 12000, IsActive = true,Type_of_Billing__c = 'MRC');
        insert customPrice24;
        
         Product2 prod25 = new Product2(Name = 'SmartVoice + Fiber 1G /1G Broadband (Only Premium Plus; First Seat)  ',Family = 'Smart Voice',Product_Subcategory__c='IP Phones',Equipment__c =false);
        insert prod25;
        PricebookEntry standardPrice25 = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = prod25.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice25;
        PricebookEntry customPrice25 = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = prod25.Id,UnitPrice = 12000, IsActive = true,Type_of_Billing__c = 'MRC');
        insert customPrice25;
        
         Product2 prod26 = new Product2(Name = 'SmartVoice + Fiber 100/100 Broadband (Only Premium Plus; First Seat)  ',Family = 'Smart Voice',Product_Subcategory__c='IP Phones',Equipment__c =false);
        insert prod26;
        PricebookEntry standardPrice26 = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = prod26.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice26;
        PricebookEntry customPrice26 = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = prod26.Id,UnitPrice = 12000, IsActive = true,Type_of_Billing__c = 'MRC');
        insert customPrice26;
        
           Product2 prod27 = new Product2(Name = 'SmartVoice + Fiber  500/500 Broadband (Only Premium Plus; First Seat)',Family = 'Smart Voice',Product_Subcategory__c='IP Phones',Equipment__c =false);
        insert prod27;
        PricebookEntry standardPrice27 = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = prod27.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice27;
        PricebookEntry customPrice27 = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = prod27.Id,UnitPrice = 12000, IsActive = true,Type_of_Billing__c = 'MRC');
        insert customPrice27;
        
         Product2 prod28 = new Product2(Name = 'SmartVoice + Fiber 1G /1G Broadband (Only Premium Plus; First Seat)  ',Family = 'Smart Voice',Product_Subcategory__c='IP Phones',Equipment__c =false);
        insert prod28;
        PricebookEntry standardPrice28 = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = prod28.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice28;
        PricebookEntry customPrice28 = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = prod28.Id,UnitPrice = 12000, IsActive = true,Type_of_Billing__c = 'MRC');
        insert customPrice28;
        
        Opportunity opp=new Opportunity();
        opp.name='TestOpp';
        opp.Contact__c= con.id;
        opp.Contract_Term_Years__c=1;
        opp.CloseDate=System.today();
        opp.StageName='New';
        opp.Company_size__c=5;
        opp.Pricebook2Id=customPB.id;
        opp.Reason_Won_Lost__c = 'Track Record';
        insert opp;
        String recordId = opp.id;
        
        Site__c site=new Site__c();
        site.Site_Name__c='SiteTest';
        site.opportunity__c=opp.id;
        site.PoE_option__c='Switch';
        site.Primary__c=True;
        site.Site_Number__c = 1;
        insert site;
        
        List<OpportunityLineItem>opplst = new List<OpportunityLineItem>();
        OpportunityLineItem premierList = new OpportunityLineItem();
        premierList.Site__c=site.id;
        premierList.Product_Name__c=prod1.Name;
        premierList.Product2Id=prod1.Id;
        premierList.Unit_Price__c=customPrice1.UnitPrice;
        premierList.Quantity=2;
        premierList.Sub_Total__c=premierList.Quantity*premierList.Unit_Price__c;
        premierList.TotalPrice=premierList.Quantity*premierList.Unit_Price__c;
        premierList.Category__c=prod1.Family;
        premierList.Sub_Category__c=prod1.Product_Subcategory__c;
        premierList.OpportunityId=opp.id;
        premierList.Filter_Product__c ='Parent';
        premierList.Site_Number__c=site.Site_Number__c;
        premierList.Type_of_Billing__c =customPrice1.Type_of_Billing__c; 
        premierList.Equipment__c=prod1.Equipment__c;
        premierList.PremiumRule__c = true;
        premierList.PremiumPlusRule__c = true;
        premierList.isConferenceRumSeatRule__c = true;
        premierList.isAnalogRule__c = true;
        opplst.add(premierList);
        
        OpportunityLineItem premierList1 = new OpportunityLineItem();
        premierList1.Site__c=site.id;
        premierList1.Product_Name__c=prod1.Name;
        premierList1.Product2Id=prod1.Id;
        premierList1.Unit_Price__c=customPrice1.UnitPrice;
        premierList1.Quantity=2;
        premierList1.Sub_Total__c=premierList1.Quantity*premierList1.Unit_Price__c;
        premierList1.TotalPrice=premierList1.Quantity*premierList1.Unit_Price__c;
        premierList1.Category__c=prod1.Family;
        premierList1.Sub_Category__c=prod1.Product_Subcategory__c;
        premierList1.OpportunityId=opp.id;
        premierList1.Filter_Product__c ='Parent';
        premierList1.Site_Number__c=site.Site_Number__c;
        premierList1.Type_of_Billing__c =customPrice1.Type_of_Billing__c; 
        premierList1.Equipment__c=prod1.Equipment__c;
         premierList1.PremiumRule__c = true;
        premierList1.PremiumPlusRule__c = true;
        premierList1.isConferenceRumSeatRule__c = true;
        premierList1.isAnalogRule__c = true;
      
        opplst.add(premierList1);
        
        
        
        OpportunityLineItem outboundList = new OpportunityLineItem();
        outboundList.Site__c=site.id;
        outboundList.Product_Name__c=prod2.Name;
        outboundList.Product2Id=prod2.Id;
        outboundList.Unit_Price__c=customPrice2.UnitPrice;
        outboundList.Quantity=2;
        outboundList.Sub_Total__c=outboundList.Quantity*outboundList.Unit_Price__c;
        outboundList.TotalPrice=outboundList.Quantity*outboundList.Unit_Price__c;
        outboundList.Category__c=prod2.Family;
        outboundList.Sub_Category__c=prod2.Product_Subcategory__c;
        outboundList.OpportunityId=opp.id;
        outboundList.Filter_Product__c ='Parent';
        outboundList.Site_Number__c=site.Site_Number__c;
        outboundList.Type_of_Billing__c =customPrice2.Type_of_Billing__c; 
        outboundList.Equipment__c=prod2.Equipment__c;
        opplst.add(outboundList);
        
        OpportunityLineItem outboundList1 = new OpportunityLineItem();
        outboundList1.Site__c=site.id;
        outboundList1.Product_Name__c=prod2.Name;
        outboundList1.Product2Id=prod2.Id;
        outboundList1.Unit_Price__c=customPrice2.UnitPrice;
        outboundList1.Quantity=2;
        outboundList1.Sub_Total__c=outboundList1.Quantity*outboundList1.Unit_Price__c;
        outboundList1.TotalPrice=outboundList1.Quantity*outboundList1.Unit_Price__c;
        outboundList1.Category__c=prod2.Family;
        outboundList1.Sub_Category__c=prod2.Product_Subcategory__c;
        outboundList1.OpportunityId=opp.id;
        outboundList1.Filter_Product__c ='Parent';
        outboundList1.Site_Number__c=site.Site_Number__c;
        outboundList1.Type_of_Billing__c =customPrice2.Type_of_Billing__c; 
        outboundList1.Equipment__c=prod2.Equipment__c;
        opplst.add(outboundList1);
        
        OpportunityLineItem essentialList = new OpportunityLineItem();
        essentialList.Site__c=site.id;
        essentialList.Product_Name__c=prod3.Name;
        essentialList.Product2Id=prod3.Id;
        essentialList.Unit_Price__c=customPrice3.UnitPrice;
        essentialList.Quantity=2;
        essentialList.Sub_Total__c=essentialList.Quantity*essentialList.Unit_Price__c;
        essentialList.TotalPrice=essentialList.Quantity*essentialList.Unit_Price__c;
        essentialList.Category__c=prod3.Family;
        essentialList.Sub_Category__c=prod3.Product_Subcategory__c;
        essentialList.OpportunityId=opp.id;
        essentialList.Filter_Product__c ='Parent';
        essentialList.Site_Number__c=site.Site_Number__c;
        essentialList.Type_of_Billing__c =customPrice3.Type_of_Billing__c; 
        essentialList.Equipment__c=prod3.Equipment__c;
        opplst.add(essentialList);
        
        OpportunityLineItem essentialList1 = new OpportunityLineItem();
        essentialList1.Site__c=site.id;
        essentialList1.Product_Name__c=prod3.Name;
        essentialList1.Product2Id=prod3.Id;
        essentialList1.Unit_Price__c=customPrice3.UnitPrice;
        essentialList1.Quantity=2;
        essentialList1.Sub_Total__c=essentialList1.Quantity*essentialList1.Unit_Price__c;
        essentialList1.TotalPrice=essentialList1.Quantity*essentialList1.Unit_Price__c;
        essentialList1.Category__c=prod3.Family;
        essentialList1.Sub_Category__c=prod3.Product_Subcategory__c;
        essentialList1.OpportunityId=opp.id;
        essentialList1.Filter_Product__c ='Parent';
        essentialList1.Site_Number__c=site.Site_Number__c;
        essentialList1.Type_of_Billing__c =customPrice3.Type_of_Billing__c; 
        essentialList1.Equipment__c=prod3.Equipment__c;
        opplst.add(essentialList1);
        
        OpportunityLineItem webFaxList = new OpportunityLineItem();
        webFaxList.Site__c=site.id;
        webFaxList.Product_Name__c=prod4.Name;
        webFaxList.Product2Id=prod4.Id;
        webFaxList.Unit_Price__c=customPrice4.UnitPrice;
        webFaxList.Quantity=2;
        webFaxList.Sub_Total__c=webFaxList.Quantity*webFaxList.Unit_Price__c;
        webFaxList.TotalPrice=webFaxList.Quantity*webFaxList.Unit_Price__c;
        webFaxList.Category__c=prod4.Family;
        webFaxList.Sub_Category__c=prod4.Product_Subcategory__c;
        webFaxList.OpportunityId=opp.id;
        webFaxList.Filter_Product__c ='Parent';
        webFaxList.Site_Number__c=site.Site_Number__c;
        webFaxList.Type_of_Billing__c =customPrice4.Type_of_Billing__c; 
        webFaxList.Equipment__c=prod4.Equipment__c;
        webFaxList.isAdditionalDID__c = true;
        webFaxList.isAdditionalDirectory__c = true;
        webFaxList.isAdditionalManaged__c = true;
        webFaxList.isBusinessAnalytic__c = true;
        webFaxList.isCallerId__c = true;
        webFaxList.isE911__c = true;
        webFaxList.isExtendedMarket__c = true;
        webFaxList.isTollFreeNum__c = true;
        webFaxList.isWebFax__c = true;
        opplst.add(webFaxList);
        
        
        OpportunityLineItem webFaxList1 = new OpportunityLineItem();
        webFaxList1.Site__c=site.id;
        webFaxList1.Product_Name__c=prod4.Name;
        webFaxList1.Product2Id=prod4.Id;
        webFaxList1.Unit_Price__c=customPrice4.UnitPrice;
        webFaxList1.Quantity=2;
        webFaxList1.Sub_Total__c=webFaxList1.Quantity*webFaxList1.Unit_Price__c;
        webFaxList1.TotalPrice=webFaxList1.Quantity*webFaxList1.Unit_Price__c;
        webFaxList1.Category__c=prod4.Family;
        webFaxList1.Sub_Category__c=prod4.Product_Subcategory__c;
        webFaxList1.OpportunityId=opp.id;
        webFaxList1.Filter_Product__c ='Parent';
        webFaxList1.Site_Number__c=site.Site_Number__c;
        webFaxList1.Type_of_Billing__c =customPrice4.Type_of_Billing__c; 
        webFaxList1.Equipment__c=prod4.Equipment__c;
        webFaxList1.isAdditionalDID__c = true;
        webFaxList1.isAdditionalDirectory__c = true;
        webFaxList1.isAdditionalManaged__c = true;
        webFaxList1.isBusinessAnalytic__c = true;
        webFaxList1.isCallerId__c = true;
        webFaxList1.isE911__c = true;
        webFaxList1.isExtendedMarket__c = true;
        webFaxList1.isTollFreeNum__c = true;
        webFaxList1.isWebFax__c = true;
        opplst.add(webFaxList1);
        
        
      /*  
        OpportunityLineItem eliteSetup = new OpportunityLineItem();
        eliteSetup.Site__c=site.id;
        eliteSetup.Product_Name__c=prod5.Name;
        eliteSetup.Product2Id=prod5.Id;
        eliteSetup.Unit_Price__c=customPrice5.UnitPrice;
        eliteSetup.Quantity=2;
        eliteSetup.Sub_Total__c=eliteSetup.Quantity*eliteSetup.Unit_Price__c;
        eliteSetup.TotalPrice=eliteSetup.Quantity*eliteSetup.Unit_Price__c;
        eliteSetup.Category__c=prod5.Family;
        eliteSetup.Sub_Category__c=prod5.Product_Subcategory__c;
        eliteSetup.OpportunityId=opp.id;
        eliteSetup.Filter_Product__c ='Child';
        eliteSetup.SetUp__c = 'Setup';
        eliteSetup.Site_Number__c=site.Site_Number__c;
        eliteSetup.Type_of_Billing__c =customPrice5.Type_of_Billing__c; 
        eliteSetup.Equipment__c=prod5.Equipment__c;
        eliteSetup.Releted__c = 'child';
        
        opplst.add(eliteSetup);
        
        OpportunityLineItem eliteSetup1 = new OpportunityLineItem();
        eliteSetup1.Site__c=site.id;
        eliteSetup1.Product_Name__c=prod5.Name;
        eliteSetup1.Product2Id=prod5.Id;
        eliteSetup1.Unit_Price__c=customPrice5.UnitPrice;
        eliteSetup1.Quantity=2;
        eliteSetup1.Sub_Total__c=eliteSetup1.Quantity*eliteSetup1.Unit_Price__c;
        eliteSetup1.TotalPrice=eliteSetup1.Quantity*eliteSetup1.Unit_Price__c;
        eliteSetup1.Category__c=prod5.Family;
        eliteSetup1.Sub_Category__c=prod5.Product_Subcategory__c;
        eliteSetup1.OpportunityId=opp.id;
        eliteSetup1.Filter_Product__c ='Child';
        eliteSetup1.SetUp__c = 'Setup';
        eliteSetup1.Site_Number__c=site.Site_Number__c;
        eliteSetup1.Type_of_Billing__c =customPrice5.Type_of_Billing__c; 
        eliteSetup1.Equipment__c=prod5.Equipment__c;
        eliteSetup1.Releted__c = 'child';
        
        opplst.add(eliteSetup1);*/
        
        OpportunityLineItem addOn1 = new OpportunityLineItem();
        addOn1.Site__c=site.id;
        addOn1.Product_Name__c=prod6.Name;
        addOn1.Product2Id=prod6.Id;
        addOn1.Unit_Price__c=customPrice6.UnitPrice;
        addOn1.Quantity=2;
        addOn1.Sub_Total__c=addOn1.Quantity*addOn1.Unit_Price__c;
        addOn1.TotalPrice=addOn1.Quantity*addOn1.Unit_Price__c;
        addOn1.Category__c=prod6.Family;
        addOn1.Sub_Category__c=prod6.Product_Subcategory__c;
        addOn1.OpportunityId=opp.id;
        addOn1.Filter_Product__c ='Parent';
        addOn1.Site_Number__c=site.Site_Number__c;
        addOn1.Type_of_Billing__c =customPrice6.Type_of_Billing__c; 
        addOn1.Equipment__c=prod6.Equipment__c;
        addOn1.isSmartAdditionalDID__c = true;
        addOn1.isSmartAdditionalManagedAutoAttendant__c = true;
        addOn1.isSmartDirectoryListing__c = true;
        addOn1.isSmartE911__c = true;
        addOn1.isSmartExtendedNum__c = true;
        addOn1.isSmartMonthlyAdminCharge__c = true;
        addOn1.isSmartMultiLineHunt__c = true;
        addOn1.isSmartPremiumAttendant__c = true;
        addOn1.isSmartTollFreeDomesticUS__c = true;
        addOn1.isSmartTollFreeNum__c = true;
        opplst.add(addOn1);
        
       OpportunityLineItem addOn2 = new OpportunityLineItem();
        addOn2.Site__c=site.id;
        addOn2.Product_Name__c=prod6.Name;
        addOn2.Product2Id=prod6.Id;
        addOn2.Unit_Price__c=customPrice6.UnitPrice;
        addOn2.Quantity=2;
        addOn2.Sub_Total__c=addOn2.Quantity*addOn2.Unit_Price__c;
        addOn2.TotalPrice=addOn2.Quantity*addOn2.Unit_Price__c;
        addOn2.Category__c=prod6.Family;
        addOn2.Sub_Category__c=prod6.Product_Subcategory__c;
        addOn2.OpportunityId=opp.id;
        addOn2.Filter_Product__c ='Parent';
        addOn2.Site_Number__c=site.Site_Number__c;
        addOn2.Type_of_Billing__c =customPrice6.Type_of_Billing__c; 
        addOn2.Equipment__c=prod6.Equipment__c;
        addOn2.isSmartAdditionalDID__c = true;
        addOn2.isSmartAdditionalManagedAutoAttendant__c = true;
        addOn2.isSmartDirectoryListing__c = true;
        addOn2.isSmartE911__c = true;
        addOn2.isSmartExtendedNum__c = true;
        addOn2.isSmartMonthlyAdminCharge__c = true;
        addOn2.isSmartMultiLineHunt__c = true;
        addOn2.isSmartPremiumAttendant__c = true;
        addOn2.isSmartTollFreeDomesticUS__c = true;
        addOn2.isSmartTollFreeNum__c = true;
        opplst.add(addOn2);
        
        
          OpportunityLineItem FIOSlist1 = new OpportunityLineItem();
        FIOSlist1.Site__c=site.id;
        FIOSlist1.Product_Name__c=prod17.Name;
        FIOSlist1.Product2Id=prod17.Id;
        FIOSlist1.Unit_Price__c=customPrice6.UnitPrice;
        FIOSlist1.Quantity=2;
        FIOSlist1.Sub_Total__c=FIOSlist1.Quantity*FIOSlist1.Unit_Price__c;
        FIOSlist1.TotalPrice=FIOSlist1.Quantity*FIOSlist1.Unit_Price__c;
        FIOSlist1.Category__c=prod17.Family;
        FIOSlist1.Sub_Category__c=prod17.Product_Subcategory__c;
        FIOSlist1.OpportunityId=opp.id;
        FIOSlist1.Filter_Product__c ='Parent';
        FIOSlist1.Site_Number__c=site.Site_Number__c;
        FIOSlist1.Type_of_Billing__c =customPrice6.Type_of_Billing__c; 
        FIOSlist1.Equipment__c=prod17.Equipment__c;
        FIOSlist1.SmartVoice_FiOS_100_100_Broadband__c = true;
        FIOSlist1.SmartVoice_FiOS_500_500_Broadband__c = true;
        FIOSlist1.SmartVoice_FiOS_1G_1G_Broadband__c = true;
         opplst.add(FIOSlist1);
        
   OpportunityLineItem FIOSlist2 = new OpportunityLineItem();
        FIOSlist2.Site__c=site.id;
        FIOSlist2.Product_Name__c=prod17.Name;
        FIOSlist2.Product2Id=prod17.Id;
        FIOSlist2.Unit_Price__c=customPrice6.UnitPrice;
        FIOSlist2.Quantity=2;
        FIOSlist2.Sub_Total__c=FIOSlist1.Quantity*FIOSlist1.Unit_Price__c;
        FIOSlist2.TotalPrice=FIOSlist1.Quantity*FIOSlist1.Unit_Price__c;
        FIOSlist2.Category__c=prod17.Family;
        FIOSlist2.Sub_Category__c=prod17.Product_Subcategory__c;
        FIOSlist2.OpportunityId=opp.id;
        FIOSlist2.Filter_Product__c ='Parent';
        FIOSlist2.Site_Number__c=site.Site_Number__c;
        FIOSlist2.Type_of_Billing__c =customPrice6.Type_of_Billing__c; 
        FIOSlist2.Equipment__c=prod17.Equipment__c;
        FIOSlist2.SmartVoice_FiOS_100_100_Broadband__c = true;
        FIOSlist2.SmartVoice_FiOS_500_500_Broadband__c = true;
        FIOSlist2.SmartVoice_FiOS_1G_1G_Broadband__c = true;
         opplst.add(FIOSlist2);
        
                  OpportunityLineItem fiberList1 = new OpportunityLineItem();
        fiberList1.Site__c=site.id;
        fiberList1.Product_Name__c=prod20.Name;
        fiberList1.Product2Id=prod20.Id;
        fiberList1.Unit_Price__c=customPrice6.UnitPrice;
        fiberList1.Quantity=2;
        fiberList1.Sub_Total__c=fiberList1.Quantity*fiberList1.Unit_Price__c;
        fiberList1.TotalPrice=fiberList1.Quantity*fiberList1.Unit_Price__c;
        fiberList1.Category__c=prod20.Family;
        fiberList1.Sub_Category__c=prod20.Product_Subcategory__c;
        fiberList1.OpportunityId=opp.id;
        fiberList1.Filter_Product__c ='Parent';
        fiberList1.Site_Number__c=site.Site_Number__c;
        fiberList1.Type_of_Billing__c =customPrice6.Type_of_Billing__c; 
        fiberList1.Equipment__c=prod20.Equipment__c;
        fiberList1.SmartVoice_Fiber_100_100_Broadband__c = true;
        fiberList1.SmartVoice_Fiber_500_500_Broadband__c = true;
        fiberList1.SmartVoice_Fiber_1G_1G_Broadband__c = true;
         opplst.add(fiberList1);
        
   OpportunityLineItem fiberList2 = new OpportunityLineItem();
        fiberList2.Site__c=site.id;
        fiberList2.Product_Name__c=prod20.Name;
        fiberList2.Product2Id=prod20.Id;
        fiberList2.Unit_Price__c=customPrice6.UnitPrice;
        fiberList2.Quantity=2;
        fiberList2.Sub_Total__c=fiberList2.Quantity*fiberList2.Unit_Price__c;
        fiberList2.TotalPrice=fiberList2.Quantity*fiberList2.Unit_Price__c;
        fiberList2.Category__c=prod20.Family;
        fiberList2.Sub_Category__c=prod20.Product_Subcategory__c;
        fiberList2.OpportunityId=opp.id;
        fiberList2.Filter_Product__c ='Parent';
        fiberList2.Site_Number__c=site.Site_Number__c;
        fiberList2.Type_of_Billing__c =customPrice6.Type_of_Billing__c; 
        fiberList2.Equipment__c=prod20.Equipment__c;
        fiberList2.SmartVoice_Fiber_100_100_Broadband__c = true;
        fiberList2.SmartVoice_Fiber_500_500_Broadband__c = true;
        fiberList2.SmartVoice_Fiber_1G_1G_Broadband__c = true;
         opplst.add(fiberList2);
        
        
        OpportunityLineItem ipPhoneList1 = new OpportunityLineItem();
        ipPhoneList1.Site__c=site.id;
        ipPhoneList1.Product_Name__c=prod23.Name;
        ipPhoneList1.Product2Id=prod23.Id;
        ipPhoneList1.Unit_Price__c=customPrice6.UnitPrice;
        ipPhoneList1.Quantity=2;
        ipPhoneList1.Sub_Total__c=ipPhoneList1.Quantity*ipPhoneList1.Unit_Price__c;
        ipPhoneList1.TotalPrice=ipPhoneList1.Quantity*ipPhoneList1.Unit_Price__c;
        ipPhoneList1.Category__c=prod23.Family;
        ipPhoneList1.Sub_Category__c=prod23.Product_Subcategory__c;
        ipPhoneList1.OpportunityId=opp.id;
        ipPhoneList1.Filter_Product__c ='Parent';
        ipPhoneList1.Site_Number__c=site.Site_Number__c;
        ipPhoneList1.Type_of_Billing__c =customPrice6.Type_of_Billing__c; 
        ipPhoneList1.Equipment__c=prod23.Equipment__c;
        ipPhoneList1.isVVX311__c = true;
        ipPhoneList1.isVVX501__c = true;
        ipPhoneList1.isVVX601__c = true;
        ipPhoneList1.isSoundStationIp5000__c = true;
        ipPhoneList1.isSoundStationIp6000__c = true;
        ipPhoneList1.isSoundStationIp7000__c = true;
       
        opplst.add(ipPhoneList1);
        
        OpportunityLineItem ipPhoneList2 = new OpportunityLineItem();
        ipPhoneList2.Site__c=site.id;
        ipPhoneList2.Product_Name__c=prod23.Name;
        ipPhoneList2.Product2Id=prod23.Id;
        ipPhoneList2.Unit_Price__c=customPrice6.UnitPrice;
        ipPhoneList2.Quantity=2;
        ipPhoneList2.Sub_Total__c=ipPhoneList2.Quantity*ipPhoneList2.Unit_Price__c;
        ipPhoneList2.TotalPrice=ipPhoneList2.Quantity*ipPhoneList2.Unit_Price__c;
        ipPhoneList2.Category__c=prod23.Family;
        ipPhoneList2.Sub_Category__c=prod23.Product_Subcategory__c;
        ipPhoneList2.OpportunityId=opp.id;
        ipPhoneList2.Filter_Product__c ='Parent';
        ipPhoneList2.Site_Number__c=site.Site_Number__c;
        ipPhoneList2.Type_of_Billing__c =customPrice6.Type_of_Billing__c; 
        ipPhoneList2.Equipment__c=prod23.Equipment__c;
        ipPhoneList2.isVVX311__c = true;
        ipPhoneList2.isVVX501__c = true;
        ipPhoneList2.isVVX601__c = true;
         ipPhoneList2.isSoundStationIp5000__c = true;
        ipPhoneList2.isSoundStationIp6000__c = true;
        ipPhoneList2.isSoundStationIp7000__c = true;
       
        opplst.add(ipPhoneList2);
        
     /*    OpportunityLineItem e911List = new OpportunityLineItem();
        e911List.Site__c=site.id;
        e911List.Product_Name__c=prod7.Name;
        e911List.Product2Id=prod7.Id;
        e911List.Unit_Price__c=customPrice7.UnitPrice;
        e911List.Quantity=2;
        e911List.Sub_Total__c=e911List.Quantity*e911List.Unit_Price__c;
        e911List.TotalPrice=e911List.Quantity*e911List.Unit_Price__c;
        e911List.Category__c=prod7.Family;
        e911List.Sub_Category__c=prod7.Product_Subcategory__c;
        e911List.OpportunityId=opp.id;
        e911List.Filter_Product__c ='Parent';
        e911List.Site_Number__c=site.Site_Number__c;
        e911List.Type_of_Billing__c =customPrice7.Type_of_Billing__c; 
        e911List.Equipment__c=prod7.Equipment__c;
        opplst.add(e911List);
        
       
        OpportunityLineItem e911List1 = new OpportunityLineItem();
        e911List1.Site__c=site.id;
        e911List1.Product_Name__c=prod7.Name;
        e911List1.Product2Id=prod7.Id;
        e911List1.Unit_Price__c=customPrice7.UnitPrice;
        e911List1.Quantity=2;
        e911List1.Sub_Total__c=e911List1.Quantity*e911List1.Unit_Price__c;
        e911List1.TotalPrice=e911List1.Quantity*e911List1.Unit_Price__c;
        e911List1.Category__c=prod7.Family;
        e911List1.Sub_Category__c=prod7.Product_Subcategory__c;
        e911List1.OpportunityId=opp.id;
        e911List1.Filter_Product__c ='Parent';
        e911List1.Site_Number__c=site.Site_Number__c;
        e911List1.Type_of_Billing__c =customPrice7.Type_of_Billing__c; 
        e911List1.Equipment__c=prod7.Equipment__c;
        opplst.add(e911List1);
        
        OpportunityLineItem e911List11 = new OpportunityLineItem();
        e911List11.Site__c=site.id;
        e911List11.Product_Name__c=prod7.Name;
        e911List11.Product2Id=prod7.Id;
        e911List11.Unit_Price__c=customPrice7.UnitPrice;
        e911List11.Quantity=2;
        e911List11.Sub_Total__c=e911List11.Quantity*e911List11.Unit_Price__c;
        e911List11.TotalPrice=e911List11.Quantity*e911List11.Unit_Price__c;
        e911List11.Category__c=prod7.Family;
        e911List11.Sub_Category__c='Toll Free Bundle Minutes';
        e911List11.OpportunityId=opp.id;
        e911List11.Filter_Product__c ='Parent';
        e911List11.Site_Number__c=site.Site_Number__c;
        e911List11.Type_of_Billing__c =customPrice7.Type_of_Billing__c; 
        e911List11.Equipment__c=prod7.Equipment__c;
        opplst.add(e911List11);
        
        OpportunityLineItem ipphone = new OpportunityLineItem();
        ipphone.Site__c=site.id;
        ipphone.Product_Name__c=prod7.Name;
        ipphone.Product2Id=prod7.Id;
        ipphone.Unit_Price__c=customPrice7.UnitPrice;
        ipphone.Quantity=2;
        ipphone.Sub_Total__c=ipphone.Quantity*ipphone.Unit_Price__c;
        ipphone.TotalPrice=ipphone.Quantity*ipphone.Unit_Price__c;
        ipphone.Category__c=prod7.Family;
        ipphone.Sub_Category__c='IP Phones';
        ipphone.OpportunityId=opp.id;
        ipphone.Filter_Product__c ='Parent';
        ipphone.Type_of_Billing__c =customPrice7.Type_of_Billing__c; 
        ipphone.Equipment__c=prod7.Equipment__c;
        opplst.add(ipphone);
        
        OpportunityLineItem ipphone1 = new OpportunityLineItem();
        ipphone1.Site__c=site.id;
        ipphone1.Product_Name__c=prod7.Name;
        ipphone1.Product2Id=prod7.Id;
        ipphone1.Unit_Price__c=customPrice7.UnitPrice;
        ipphone1.Quantity=2;
        ipphone1.Sub_Total__c=ipphone1.Quantity*ipphone1.Unit_Price__c;
        ipphone1.TotalPrice=ipphone1.Quantity*ipphone1.Unit_Price__c;
        ipphone1.Category__c=prod7.Family;
        ipphone1.Sub_Category__c='IP Phones';
        ipphone1.OpportunityId=opp.id;
        ipphone1.Filter_Product__c ='Parent';
        ipphone1.Type_of_Billing__c =customPrice7.Type_of_Billing__c; 
        ipphone1.Equipment__c=prod7.Equipment__c;
        ipphone1.Site_Number__c = 1;
        opplst.add(ipphone1);
        
        OpportunityLineItem ac = new OpportunityLineItem();
        ac.Site__c=site.id;
        ac.Product_Name__c=prod7.Name;
        ac.Product2Id=prod7.Id;
        ac.Unit_Price__c=customPrice7.UnitPrice;
        ac.Quantity=2;
        ac.Sub_Total__c=ac.Quantity*ac.Unit_Price__c;
        ac.TotalPrice=ac.Quantity*ac.Unit_Price__c;
        ac.Category__c=prod7.Family;
        ac.Sub_Category__c='Accessories';
        ac.OpportunityId=opp.id;
        ac.Filter_Product__c ='Parent';
        ac.Type_of_Billing__c =customPrice7.Type_of_Billing__c; 
        ac.Equipment__c=prod7.Equipment__c;
        opplst.add(ac);
        
        OpportunityLineItem acc = new OpportunityLineItem();
        acc.Site__c=site.id;
        acc.Product_Name__c=prod7.Name;
        acc.Product2Id=prod7.Id;
        acc.Unit_Price__c=customPrice7.UnitPrice;
        acc.Quantity=2;
        acc.Sub_Total__c=acc.Quantity*acc.Unit_Price__c;
        acc.TotalPrice=acc.Quantity*acc.Unit_Price__c;
        acc.Category__c=prod7.Family;
        acc.Sub_Category__c='Accessories';
        acc.OpportunityId=opp.id;
        acc.Filter_Product__c ='Parent';
        acc.Type_of_Billing__c =customPrice7.Type_of_Billing__c; 
        acc.Equipment__c=prod7.Equipment__c;
        acc.Site_Number__c = 1;
        opplst.add(acc);
        
        
        OpportunityLineItem tollfree = new OpportunityLineItem();
        tollfree.Site__c=site.id;
        tollfree.Product_Name__c=prod8.Name;
        tollfree.Product2Id=prod8.Id;
        tollfree.Unit_Price__c=customPrice8.UnitPrice;
        tollfree.Quantity=2;
        tollfree.Sub_Total__c=tollfree.Quantity*tollfree.Unit_Price__c;
        tollfree.TotalPrice=tollfree.Quantity*tollfree.Unit_Price__c;
        tollfree.Category__c=prod8.Family;
        tollfree.Sub_Category__c= prod8.Product_Subcategory__c;
        tollfree.OpportunityId=opp.id;
        tollfree.Filter_Product__c ='Parent';
        tollfree.Type_of_Billing__c =customPrice8.Type_of_Billing__c; 
        tollfree.Equipment__c=prod8.Equipment__c;
        opplst.add(tollfree);
        */
        insert opplst;
        ApexPages.StandardController sc = new ApexPages.standardController(opp); 
        ApexPages.currentPage().getParameters().put('id',opp.id);
        Smartvoicequote smartQuote =new Smartvoicequote(sc);
        smartQuote.attachPdf();
        Test.stopTest();
    }
    
       @isTest
    public static void UCaaSMethod2(){
        Test.startTest();
        Contact con= new contact();
        con.LastName= 'Test';
        con.Phone= '9898561236';
        con.Email = 'Test@gmail.com';
        insert con; 
        
        Id standPricebookId = Test.getStandardPricebookId();
        Pricebook2 customPB = new Pricebook2(Name='Custom Pricebook', isActive=true);
        insert customPB;
        
        Product2 prod1 = new Product2(Name = 'Premium',Family = 'Smart Voice',Product_Subcategory__c='Licenses',Parent__c=true,Equipment__c =false);
        insert prod1;
        PricebookEntry standardPrice1 = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = prod1.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice1;
        PricebookEntry customPrice1 = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = prod1.Id,UnitPrice = 12000, IsActive = true,Type_of_Billing__c = 'NRC');
        insert customPrice1;
        
        Product2 prod2 = new Product2(Name = 'Premium Plus',Family = 'Smart Voice',Product_Subcategory__c='Licenses',Parent__c=true,Equipment__c =false);
        insert prod2;
        PricebookEntry standardPrice2 = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = prod2.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice2;
        PricebookEntry customPrice2 = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = prod2.Id,UnitPrice = 12000, IsActive = true,Type_of_Billing__c = 'NRC');
        insert customPrice2;
        
        Product2 prod3 = new Product2(Name = 'Analog',Family = 'Smart Voice',Product_Subcategory__c='Licenses',Parent__c=true,Equipment__c =false);
        insert prod3;
        PricebookEntry standardPrice3 = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = prod3.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice3;
        PricebookEntry customPrice3 = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = prod3.Id,UnitPrice = 12000, IsActive = true,Type_of_Billing__c = 'NRC');
        insert customPrice3;
        
        Product2 prod4 = new Product2(Name = 'Conference Room Seat',Family = 'Smart Voice',Product_Subcategory__c='Licenses',Parent__c=true,Equipment__c =false);
        insert prod4;
        PricebookEntry standardPrice4 = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = prod4.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice4;
        PricebookEntry customPrice4 = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = prod4.Id,UnitPrice = 12000, IsActive = true,Type_of_Billing__c = 'NRC');
        insert customPrice4;
        
      /*  Product2 prod5 = new Product2(Name = 'Elite Set Up',Family = 'Smart Voice',Product_Subcategory__c='Activation Charges',Child__c=true,Equipment__c =false);
        insert prod5;
        PricebookEntry standardPrice5 = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = prod5.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice5;
        PricebookEntry customPrice5 = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = prod5.Id,UnitPrice = 12000, IsActive = true,Type_of_Billing__c = 'NRC');
        insert customPrice5;*/
        
        Product2 prod6 = new Product2(Name = 'Additional DIDs for reserve or Auto Attendant',Family = 'Smart Voice',Product_Subcategory__c='Add-On',child__c=true,Equipment__c =false);
        insert prod6;
        PricebookEntry standardPrice6 = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = prod6.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice6;
        PricebookEntry customPrice6 = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = prod6.Id,UnitPrice = 12000, IsActive = true,Type_of_Billing__c = 'NRC');
        insert customPrice6;
        
       /* Product2 prod7 = new Product2(Name = 'Premium Auto Attendant',Family = 'Smart Voice',Product_Subcategory__c='Add-On',child__c=true,Equipment__c =false);
        insert prod7;
        PricebookEntry standardPrice7 = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = prod7.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice7;
        PricebookEntry customPrice7 = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = prod7.Id,UnitPrice = 12000, IsActive = true,Type_of_Billing__c = 'MRC');
        insert customPrice7;
        
        Product2 prod8 = new Product2(Name = 'Directory Listings',Family = 'Smart Voice',Product_Subcategory__c='Add-On',Equipment__c =false);
        insert prod8;
        PricebookEntry standardPrice8 = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = prod8.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice8;
        PricebookEntry customPrice8 = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = prod8.Id,UnitPrice = 12000, IsActive = true,Type_of_Billing__c = 'NRC');
        insert customPrice8;
        
           Product2 prod9 = new Product2(Name = 'Extended Market Number',Family = 'Smart Voice',Product_Subcategory__c='Add-On',Equipment__c =false);
        insert prod8;
        PricebookEntry standardPrice9 = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = prod9.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice9;
        PricebookEntry customPrice9 = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = prod9.Id,UnitPrice = 12000, IsActive = true,Type_of_Billing__c = 'NRC');
        insert customPrice9;
        
           Product2 prod10 = new Product2(Name = 'Toll Free Number',Family = 'Smart Voice',Product_Subcategory__c='Add-On',Equipment__c =false);
        insert prod10;
        PricebookEntry standardPrice10 = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = prod10.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice10;
        PricebookEntry customPrice10 = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = prod10.Id,UnitPrice = 12000, IsActive = true,Type_of_Billing__c = 'NRC');
        insert customPrice10;
        
           Product2 prod11 = new Product2(Name = 'Toll Free Domestic Block of Time',Family = 'Smart Voice',Product_Subcategory__c='Add-On',Equipment__c =false);
        insert prod11;
        PricebookEntry standardPrice11 = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = prod11.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice11;
        PricebookEntry customPrice11 = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = prod11.Id,UnitPrice = 12000, IsActive = true,Type_of_Billing__c = 'NRC');
        insert customPrice11;
        
           Product2 prod12 = new Product2(Name = 'Toll Free Domestic US Overage Rate Per Minute ',Family = 'Smart Voice',Product_Subcategory__c='Add-On',Equipment__c =false);
        insert prod12;
        PricebookEntry standardPrice12 = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = prod12.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice12;
        PricebookEntry customPrice12 = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = prod12.Id,UnitPrice = 12000, IsActive = true,Type_of_Billing__c = 'NRC');
        insert customPrice12;
        
           Product2 prod13 = new Product2(Name = 'Multi Line HUNT Group',Family = 'Smart Voice',Product_Subcategory__c='Add-On',Equipment__c =false);
        insert prod13;
        PricebookEntry standardPrice13 = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = prod13.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice13;
        PricebookEntry customPrice13 = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = prod13.Id,UnitPrice = 12000, IsActive = true,Type_of_Billing__c = 'NRC');
        insert customPrice13;
        
           Product2 prod14 = new Product2(Name = 'Additional Managed Auto Attendants ',Family = 'Smart Voice',Product_Subcategory__c='Add-On',Equipment__c =false);
        insert prod14;
        PricebookEntry standardPrice14 = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = prod14.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice14;
        PricebookEntry customPrice14 = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = prod14.Id,UnitPrice = 12000, IsActive = true,Type_of_Billing__c = 'NRC');
        insert customPrice14;
        
           Product2 prod15 = new Product2(Name = 'E-911',Family = 'Smart Voice',Product_Subcategory__c='Add-On',Equipment__c =false);
        insert prod15;
        PricebookEntry standardPrice15 = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = prod15.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice15;
        PricebookEntry customPrice15 = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = prod15.Id,UnitPrice = 12000, IsActive = true,Type_of_Billing__c = 'NRC');
        insert customPrice15;
        
         Product2 prod16 = new Product2(Name = 'Monthly Feature Admin Charge',Family = 'Smart Voice',Product_Subcategory__c='Add-On',Equipment__c =false);
        insert prod16;
        PricebookEntry standardPrice16 = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = prod16.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice16;
        PricebookEntry customPrice16 = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = prod16.Id,UnitPrice = 12000, IsActive = true,Type_of_Billing__c = 'NRC');
        insert customPrice16;
        */
              Product2 prod17 = new Product2(Name = 'SmartVoice + FiOS 100/100 Broadband (Only Premium Plus; First Seat) ',Family = 'Smart Voice',Product_Subcategory__c='FIOS',Equipment__c =false);
        insert prod17;
        PricebookEntry standardPrice17 = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = prod17.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice17;
        PricebookEntry customPrice17 = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = prod17.Id,UnitPrice = 12000, IsActive = true,Type_of_Billing__c = 'NRC');
        insert customPrice17;
        
           Product2 prod18 = new Product2(Name = 'SmartVoice + FiOS 500/500 Broadband (Only Premium Plus; First Seat)',Family = 'Smart Voice',Product_Subcategory__c='FIOS',Equipment__c =false);
        insert prod18;
        PricebookEntry standardPrice18 = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = prod18.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice18;
        PricebookEntry customPrice18 = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = prod18.Id,UnitPrice = 12000, IsActive = true,Type_of_Billing__c = 'NRC');
        insert customPrice18;
        
         Product2 prod19 = new Product2(Name = 'SmartVoice + FiOS 1G /1G Broadband (Only Premium Plus; First Seat) ',Family = 'Smart Voice',Product_Subcategory__c='FIOS',Equipment__c =false);
        insert prod19;
        PricebookEntry standardPrice19 = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = prod19.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice19;
        PricebookEntry customPrice19 = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = prod19.Id,UnitPrice = 12000, IsActive = true,Type_of_Billing__c = 'NRC');
        insert customPrice19;
        
              Product2 prod20 = new Product2(Name = 'SmartVoice + Fiber 100/100 Broadband (Only Premium Plus; First Seat)  ',Family = 'Smart Voice',Product_Subcategory__c='Fiber',Equipment__c =false);
        insert prod20;
        PricebookEntry standardPrice20 = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = prod20.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice20;
        PricebookEntry customPrice20 = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = prod20.Id,UnitPrice = 12000, IsActive = true,Type_of_Billing__c = 'NRC');
        insert customPrice20;
        
           Product2 prod21 = new Product2(Name = 'SmartVoice + Fiber  500/500 Broadband (Only Premium Plus; First Seat)',Family = 'Smart Voice',Product_Subcategory__c='Fiber',Equipment__c =false);
        insert prod21;
        PricebookEntry standardPrice21 = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = prod21.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice21;
        PricebookEntry customPrice21 = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = prod21.Id,UnitPrice = 12000, IsActive = true,Type_of_Billing__c = 'NRC');
        insert customPrice21;
        
         Product2 prod22 = new Product2(Name = 'SmartVoice + Fiber 1G /1G Broadband (Only Premium Plus; First Seat)  ',Family = 'Smart Voice',Product_Subcategory__c='Fiber',Equipment__c =false);
        insert prod22;
        PricebookEntry standardPrice22 = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = prod22.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice22;
        PricebookEntry customPrice22 = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = prod22.Id,UnitPrice = 12000, IsActive = true,Type_of_Billing__c = 'NRC');
        insert customPrice22;
        
          Product2 prod23 = new Product2(Name = 'SmartVoice + Fiber 100/100 Broadband (Only Premium Plus; First Seat)  ',Family = 'Smart Voice',Product_Subcategory__c='IP Phones',Equipment__c =false);
        insert prod23;
        PricebookEntry standardPrice23 = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = prod23.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice23;
        PricebookEntry customPrice23 = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = prod23.Id,UnitPrice = 12000, IsActive = true,Type_of_Billing__c = 'NRC');
        insert customPrice23;
        
           Product2 prod24 = new Product2(Name = 'SmartVoice + Fiber  500/500 Broadband (Only Premium Plus; First Seat)',Family = 'Smart Voice',Product_Subcategory__c='IP Phones',Equipment__c =false);
        insert prod24;
        PricebookEntry standardPrice24 = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = prod24.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice24;
        PricebookEntry customPrice24 = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = prod24.Id,UnitPrice = 12000, IsActive = true,Type_of_Billing__c = 'NRC');
        insert customPrice24;
        
         Product2 prod25 = new Product2(Name = 'SmartVoice + Fiber 1G /1G Broadband (Only Premium Plus; First Seat)  ',Family = 'Smart Voice',Product_Subcategory__c='IP Phones',Equipment__c =false);
        insert prod25;
        PricebookEntry standardPrice25 = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = prod25.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice25;
        PricebookEntry customPrice25 = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = prod25.Id,UnitPrice = 12000, IsActive = true,Type_of_Billing__c = 'NRC');
        insert customPrice25;
        
          Product2 prod26 = new Product2(Name = 'SmartVoice + Fiber 100/100 Broadband (Only Premium Plus; First Seat)  ',Family = 'Smart Voice',Product_Subcategory__c='IP Phones',Equipment__c =false);
        insert prod26;
        PricebookEntry standardPrice26 = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = prod26.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice26;
        PricebookEntry customPrice26 = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = prod26.Id,UnitPrice = 12000, IsActive = true,Type_of_Billing__c = 'NRC');
        insert customPrice26;
        
           Product2 prod27 = new Product2(Name = 'SmartVoice + Fiber  500/500 Broadband (Only Premium Plus; First Seat)',Family = 'Smart Voice',Product_Subcategory__c='IP Phones',Equipment__c =false);
        insert prod27;
        PricebookEntry standardPrice27 = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = prod27.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice27;
        PricebookEntry customPrice27 = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = prod27.Id,UnitPrice = 12000, IsActive = true,Type_of_Billing__c = 'NRC');
        insert customPrice27;
        
         Product2 prod28 = new Product2(Name = 'SmartVoice + Fiber 1G /1G Broadband (Only Premium Plus; First Seat)  ',Family = 'Smart Voice',Product_Subcategory__c='IP Phones',Equipment__c =false);
        insert prod28;
        PricebookEntry standardPrice28 = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = prod28.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice28;
        PricebookEntry customPrice28 = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = prod28.Id,UnitPrice = 12000, IsActive = true,Type_of_Billing__c = 'NRC');
        insert customPrice28;
        
        Opportunity opp=new Opportunity();
        opp.name='TestOpp';
        opp.Contact__c= con.id;
        opp.Contract_Term_Years__c=1;
        opp.CloseDate=System.today();
        opp.StageName='New';
        opp.Company_size__c=5;
        opp.Pricebook2Id=customPB.id;
        opp.Reason_Won_Lost__c = 'Track Record';
        insert opp;
        String recordId = opp.id;
        
        Site__c site=new Site__c();
        site.Site_Name__c='SiteTest';
        site.opportunity__c=opp.id;
        site.PoE_option__c='Switch';
        site.Primary__c=True;
        site.Site_Number__c = 1;
        insert site;
        
        List<OpportunityLineItem>opplst = new List<OpportunityLineItem>();
        OpportunityLineItem premierList = new OpportunityLineItem();
        premierList.Site__c=site.id;
        premierList.Product_Name__c=prod1.Name;
        premierList.Product2Id=prod1.Id;
        premierList.Unit_Price__c=customPrice1.UnitPrice;
        premierList.Quantity=2;
        premierList.Sub_Total__c=premierList.Quantity*premierList.Unit_Price__c;
        premierList.TotalPrice=premierList.Quantity*premierList.Unit_Price__c;
        premierList.Category__c=prod1.Family;
        premierList.Sub_Category__c=prod1.Product_Subcategory__c;
        premierList.OpportunityId=opp.id;
        premierList.Filter_Product__c ='Parent';
        premierList.Site_Number__c=site.Site_Number__c;
        premierList.Type_of_Billing__c =customPrice1.Type_of_Billing__c; 
        premierList.Equipment__c=prod1.Equipment__c;
        premierList.PremiumRule__c = true;
        premierList.PremiumPlusRule__c = true;
        premierList.isConferenceRumSeatRule__c = true;
        premierList.isAnalogRule__c = true;
        opplst.add(premierList);
        
        OpportunityLineItem premierList1 = new OpportunityLineItem();
        premierList1.Site__c=site.id;
        premierList1.Product_Name__c=prod1.Name;
        premierList1.Product2Id=prod1.Id;
        premierList1.Unit_Price__c=customPrice1.UnitPrice;
        premierList1.Quantity=2;
        premierList1.Sub_Total__c=premierList1.Quantity*premierList1.Unit_Price__c;
        premierList1.TotalPrice=premierList1.Quantity*premierList1.Unit_Price__c;
        premierList1.Category__c=prod1.Family;
        premierList1.Sub_Category__c=prod1.Product_Subcategory__c;
        premierList1.OpportunityId=opp.id;
        premierList1.Filter_Product__c ='Parent';
        premierList1.Site_Number__c=site.Site_Number__c;
        premierList1.Type_of_Billing__c =customPrice1.Type_of_Billing__c; 
        premierList1.Equipment__c=prod1.Equipment__c;
         premierList1.PremiumRule__c = true;
        premierList1.PremiumPlusRule__c = true;
        premierList1.isConferenceRumSeatRule__c = true;
        premierList1.isAnalogRule__c = true;
      
        opplst.add(premierList1);
        
        
        
        OpportunityLineItem outboundList = new OpportunityLineItem();
        outboundList.Site__c=site.id;
        outboundList.Product_Name__c=prod2.Name;
        outboundList.Product2Id=prod2.Id;
        outboundList.Unit_Price__c=customPrice2.UnitPrice;
        outboundList.Quantity=2;
        outboundList.Sub_Total__c=outboundList.Quantity*outboundList.Unit_Price__c;
        outboundList.TotalPrice=outboundList.Quantity*outboundList.Unit_Price__c;
        outboundList.Category__c=prod2.Family;
        outboundList.Sub_Category__c=prod2.Product_Subcategory__c;
        outboundList.OpportunityId=opp.id;
        outboundList.Filter_Product__c ='Parent';
        outboundList.Site_Number__c=site.Site_Number__c;
        outboundList.Type_of_Billing__c =customPrice2.Type_of_Billing__c; 
        outboundList.Equipment__c=prod2.Equipment__c;
        opplst.add(outboundList);
        
        OpportunityLineItem outboundList1 = new OpportunityLineItem();
        outboundList1.Site__c=site.id;
        outboundList1.Product_Name__c=prod2.Name;
        outboundList1.Product2Id=prod2.Id;
        outboundList1.Unit_Price__c=customPrice2.UnitPrice;
        outboundList1.Quantity=2;
        outboundList1.Sub_Total__c=outboundList1.Quantity*outboundList1.Unit_Price__c;
        outboundList1.TotalPrice=outboundList1.Quantity*outboundList1.Unit_Price__c;
        outboundList1.Category__c=prod2.Family;
        outboundList1.Sub_Category__c=prod2.Product_Subcategory__c;
        outboundList1.OpportunityId=opp.id;
        outboundList1.Filter_Product__c ='Parent';
        outboundList1.Site_Number__c=site.Site_Number__c;
        outboundList1.Type_of_Billing__c =customPrice2.Type_of_Billing__c; 
        outboundList1.Equipment__c=prod2.Equipment__c;
        opplst.add(outboundList1);
        
        OpportunityLineItem essentialList = new OpportunityLineItem();
        essentialList.Site__c=site.id;
        essentialList.Product_Name__c=prod3.Name;
        essentialList.Product2Id=prod3.Id;
        essentialList.Unit_Price__c=customPrice3.UnitPrice;
        essentialList.Quantity=2;
        essentialList.Sub_Total__c=essentialList.Quantity*essentialList.Unit_Price__c;
        essentialList.TotalPrice=essentialList.Quantity*essentialList.Unit_Price__c;
        essentialList.Category__c=prod3.Family;
        essentialList.Sub_Category__c=prod3.Product_Subcategory__c;
        essentialList.OpportunityId=opp.id;
        essentialList.Filter_Product__c ='Parent';
        essentialList.Site_Number__c=site.Site_Number__c;
        essentialList.Type_of_Billing__c =customPrice3.Type_of_Billing__c; 
        essentialList.Equipment__c=prod3.Equipment__c;
        opplst.add(essentialList);
        
        OpportunityLineItem essentialList1 = new OpportunityLineItem();
        essentialList1.Site__c=site.id;
        essentialList1.Product_Name__c=prod3.Name;
        essentialList1.Product2Id=prod3.Id;
        essentialList1.Unit_Price__c=customPrice3.UnitPrice;
        essentialList1.Quantity=2;
        essentialList1.Sub_Total__c=essentialList1.Quantity*essentialList1.Unit_Price__c;
        essentialList1.TotalPrice=essentialList1.Quantity*essentialList1.Unit_Price__c;
        essentialList1.Category__c=prod3.Family;
        essentialList1.Sub_Category__c=prod3.Product_Subcategory__c;
        essentialList1.OpportunityId=opp.id;
        essentialList1.Filter_Product__c ='Parent';
        essentialList1.Site_Number__c=site.Site_Number__c;
        essentialList1.Type_of_Billing__c =customPrice3.Type_of_Billing__c; 
        essentialList1.Equipment__c=prod3.Equipment__c;
        opplst.add(essentialList1);
        
        OpportunityLineItem webFaxList = new OpportunityLineItem();
        webFaxList.Site__c=site.id;
        webFaxList.Product_Name__c=prod4.Name;
        webFaxList.Product2Id=prod4.Id;
        webFaxList.Unit_Price__c=customPrice4.UnitPrice;
        webFaxList.Quantity=2;
        webFaxList.Sub_Total__c=webFaxList.Quantity*webFaxList.Unit_Price__c;
        webFaxList.TotalPrice=webFaxList.Quantity*webFaxList.Unit_Price__c;
        webFaxList.Category__c=prod4.Family;
        webFaxList.Sub_Category__c=prod4.Product_Subcategory__c;
        webFaxList.OpportunityId=opp.id;
        webFaxList.Filter_Product__c ='Parent';
        webFaxList.Site_Number__c=site.Site_Number__c;
        webFaxList.Type_of_Billing__c =customPrice4.Type_of_Billing__c; 
        webFaxList.Equipment__c=prod4.Equipment__c;
        webFaxList.isAdditionalDID__c = true;
        webFaxList.isAdditionalDirectory__c = true;
        webFaxList.isAdditionalManaged__c = true;
        webFaxList.isBusinessAnalytic__c = true;
        webFaxList.isCallerId__c = true;
        webFaxList.isE911__c = true;
        webFaxList.isExtendedMarket__c = true;
        webFaxList.isTollFreeNum__c = true;
        webFaxList.isWebFax__c = true;
        opplst.add(webFaxList);
        
        
        OpportunityLineItem webFaxList1 = new OpportunityLineItem();
        webFaxList1.Site__c=site.id;
        webFaxList1.Product_Name__c=prod4.Name;
        webFaxList1.Product2Id=prod4.Id;
        webFaxList1.Unit_Price__c=customPrice4.UnitPrice;
        webFaxList1.Quantity=2;
        webFaxList1.Sub_Total__c=webFaxList1.Quantity*webFaxList1.Unit_Price__c;
        webFaxList1.TotalPrice=webFaxList1.Quantity*webFaxList1.Unit_Price__c;
        webFaxList1.Category__c=prod4.Family;
        webFaxList1.Sub_Category__c=prod4.Product_Subcategory__c;
        webFaxList1.OpportunityId=opp.id;
        webFaxList1.Filter_Product__c ='Parent';
        webFaxList1.Site_Number__c=site.Site_Number__c;
        webFaxList1.Type_of_Billing__c =customPrice4.Type_of_Billing__c; 
        webFaxList1.Equipment__c=prod4.Equipment__c;
        webFaxList1.isAdditionalDID__c = true;
        webFaxList1.isAdditionalDirectory__c = true;
        webFaxList1.isAdditionalManaged__c = true;
        webFaxList1.isBusinessAnalytic__c = true;
        webFaxList1.isCallerId__c = true;
        webFaxList1.isE911__c = true;
        webFaxList1.isExtendedMarket__c = true;
        webFaxList1.isTollFreeNum__c = true;
        webFaxList1.isWebFax__c = true;
        opplst.add(webFaxList1);
        
        
      /*  
        OpportunityLineItem eliteSetup = new OpportunityLineItem();
        eliteSetup.Site__c=site.id;
        eliteSetup.Product_Name__c=prod5.Name;
        eliteSetup.Product2Id=prod5.Id;
        eliteSetup.Unit_Price__c=customPrice5.UnitPrice;
        eliteSetup.Quantity=2;
        eliteSetup.Sub_Total__c=eliteSetup.Quantity*eliteSetup.Unit_Price__c;
        eliteSetup.TotalPrice=eliteSetup.Quantity*eliteSetup.Unit_Price__c;
        eliteSetup.Category__c=prod5.Family;
        eliteSetup.Sub_Category__c=prod5.Product_Subcategory__c;
        eliteSetup.OpportunityId=opp.id;
        eliteSetup.Filter_Product__c ='Child';
        eliteSetup.SetUp__c = 'Setup';
        eliteSetup.Site_Number__c=site.Site_Number__c;
        eliteSetup.Type_of_Billing__c =customPrice5.Type_of_Billing__c; 
        eliteSetup.Equipment__c=prod5.Equipment__c;
        eliteSetup.Releted__c = 'child';
        
        opplst.add(eliteSetup);
        
        OpportunityLineItem eliteSetup1 = new OpportunityLineItem();
        eliteSetup1.Site__c=site.id;
        eliteSetup1.Product_Name__c=prod5.Name;
        eliteSetup1.Product2Id=prod5.Id;
        eliteSetup1.Unit_Price__c=customPrice5.UnitPrice;
        eliteSetup1.Quantity=2;
        eliteSetup1.Sub_Total__c=eliteSetup1.Quantity*eliteSetup1.Unit_Price__c;
        eliteSetup1.TotalPrice=eliteSetup1.Quantity*eliteSetup1.Unit_Price__c;
        eliteSetup1.Category__c=prod5.Family;
        eliteSetup1.Sub_Category__c=prod5.Product_Subcategory__c;
        eliteSetup1.OpportunityId=opp.id;
        eliteSetup1.Filter_Product__c ='Child';
        eliteSetup1.SetUp__c = 'Setup';
        eliteSetup1.Site_Number__c=site.Site_Number__c;
        eliteSetup1.Type_of_Billing__c =customPrice5.Type_of_Billing__c; 
        eliteSetup1.Equipment__c=prod5.Equipment__c;
        eliteSetup1.Releted__c = 'child';
        
        opplst.add(eliteSetup1);*/
        
        OpportunityLineItem addOn1 = new OpportunityLineItem();
        addOn1.Site__c=site.id;
        addOn1.Product_Name__c=prod6.Name;
        addOn1.Product2Id=prod6.Id;
        addOn1.Unit_Price__c=customPrice6.UnitPrice;
        addOn1.Quantity=2;
        addOn1.Sub_Total__c=addOn1.Quantity*addOn1.Unit_Price__c;
        addOn1.TotalPrice=addOn1.Quantity*addOn1.Unit_Price__c;
        addOn1.Category__c=prod6.Family;
        addOn1.Sub_Category__c=prod6.Product_Subcategory__c;
        addOn1.OpportunityId=opp.id;
        addOn1.Filter_Product__c ='Parent';
        addOn1.Site_Number__c=site.Site_Number__c;
        addOn1.Type_of_Billing__c =customPrice6.Type_of_Billing__c; 
        addOn1.Equipment__c=prod6.Equipment__c;
        addOn1.isSmartAdditionalDID__c = true;
        addOn1.isSmartAdditionalManagedAutoAttendant__c = true;
        addOn1.isSmartDirectoryListing__c = true;
        addOn1.isSmartE911__c = true;
        addOn1.isSmartExtendedNum__c = true;
        addOn1.isSmartMonthlyAdminCharge__c = true;
        addOn1.isSmartMultiLineHunt__c = true;
        addOn1.isSmartPremiumAttendant__c = true;
        addOn1.isSmartTollFreeDomesticUS__c = true;
        addOn1.isSmartTollFreeNum__c = true;
        opplst.add(addOn1);
        
       OpportunityLineItem addOn2 = new OpportunityLineItem();
        addOn2.Site__c=site.id;
        addOn2.Product_Name__c=prod6.Name;
        addOn2.Product2Id=prod6.Id;
        addOn2.Unit_Price__c=customPrice6.UnitPrice;
        addOn2.Quantity=2;
        addOn2.Sub_Total__c=addOn2.Quantity*addOn2.Unit_Price__c;
        addOn2.TotalPrice=addOn2.Quantity*addOn2.Unit_Price__c;
        addOn2.Category__c=prod6.Family;
        addOn2.Sub_Category__c=prod6.Product_Subcategory__c;
        addOn2.OpportunityId=opp.id;
        addOn2.Filter_Product__c ='Parent';
        addOn2.Site_Number__c=site.Site_Number__c;
        addOn2.Type_of_Billing__c =customPrice6.Type_of_Billing__c; 
        addOn2.Equipment__c=prod6.Equipment__c;
        addOn2.isSmartAdditionalDID__c = true;
        addOn2.isSmartAdditionalManagedAutoAttendant__c = true;
        addOn2.isSmartDirectoryListing__c = true;
        addOn2.isSmartE911__c = true;
        addOn2.isSmartExtendedNum__c = true;
        addOn2.isSmartMonthlyAdminCharge__c = true;
        addOn2.isSmartMultiLineHunt__c = true;
        addOn2.isSmartPremiumAttendant__c = true;
        addOn2.isSmartTollFreeDomesticUS__c = true;
        addOn2.isSmartTollFreeNum__c = true;
        opplst.add(addOn2);
        
          OpportunityLineItem FIOSlist1 = new OpportunityLineItem();
        FIOSlist1.Site__c=site.id;
        FIOSlist1.Product_Name__c=prod17.Name;
        FIOSlist1.Product2Id=prod17.Id;
        FIOSlist1.Unit_Price__c=customPrice6.UnitPrice;
        FIOSlist1.Quantity=2;
        FIOSlist1.Sub_Total__c=FIOSlist1.Quantity*FIOSlist1.Unit_Price__c;
        FIOSlist1.TotalPrice=FIOSlist1.Quantity*FIOSlist1.Unit_Price__c;
        FIOSlist1.Category__c=prod17.Family;
        FIOSlist1.Sub_Category__c=prod17.Product_Subcategory__c;
        FIOSlist1.OpportunityId=opp.id;
        FIOSlist1.Filter_Product__c ='Parent';
        FIOSlist1.Site_Number__c=site.Site_Number__c;
        FIOSlist1.Type_of_Billing__c =customPrice6.Type_of_Billing__c; 
        FIOSlist1.Equipment__c=prod17.Equipment__c;
        FIOSlist1.SmartVoice_FiOS_100_100_Broadband__c = true;
        FIOSlist1.SmartVoice_FiOS_500_500_Broadband__c = true;
        FIOSlist1.SmartVoice_FiOS_1G_1G_Broadband__c = true;
         opplst.add(FIOSlist1);
        
   OpportunityLineItem FIOSlist2 = new OpportunityLineItem();
        FIOSlist2.Site__c=site.id;
        FIOSlist2.Product_Name__c=prod17.Name;
        FIOSlist2.Product2Id=prod17.Id;
        FIOSlist2.Unit_Price__c=customPrice6.UnitPrice;
        FIOSlist2.Quantity=2;
        FIOSlist2.Sub_Total__c=FIOSlist1.Quantity*FIOSlist1.Unit_Price__c;
        FIOSlist2.TotalPrice=FIOSlist1.Quantity*FIOSlist1.Unit_Price__c;
        FIOSlist2.Category__c=prod17.Family;
        FIOSlist2.Sub_Category__c=prod17.Product_Subcategory__c;
        FIOSlist2.OpportunityId=opp.id;
        FIOSlist2.Filter_Product__c ='Parent';
        FIOSlist2.Site_Number__c=site.Site_Number__c;
        FIOSlist2.Type_of_Billing__c =customPrice6.Type_of_Billing__c; 
        FIOSlist2.Equipment__c=prod17.Equipment__c;
        FIOSlist2.SmartVoice_FiOS_100_100_Broadband__c = true;
        FIOSlist2.SmartVoice_FiOS_500_500_Broadband__c = true;
        FIOSlist2.SmartVoice_FiOS_1G_1G_Broadband__c = true;
         opplst.add(FIOSlist2);
        
                   OpportunityLineItem fiberList1 = new OpportunityLineItem();
        fiberList1.Site__c=site.id;
        fiberList1.Product_Name__c=prod20.Name;
        fiberList1.Product2Id=prod20.Id;
        fiberList1.Unit_Price__c=customPrice6.UnitPrice;
        fiberList1.Quantity=2;
        fiberList1.Sub_Total__c=fiberList1.Quantity*fiberList1.Unit_Price__c;
        fiberList1.TotalPrice=fiberList1.Quantity*fiberList1.Unit_Price__c;
        fiberList1.Category__c=prod20.Family;
        fiberList1.Sub_Category__c=prod20.Product_Subcategory__c;
        fiberList1.OpportunityId=opp.id;
        fiberList1.Filter_Product__c ='Parent';
        fiberList1.Site_Number__c=site.Site_Number__c;
        fiberList1.Type_of_Billing__c =customPrice6.Type_of_Billing__c; 
        fiberList1.Equipment__c=prod20.Equipment__c;
        fiberList1.SmartVoice_Fiber_100_100_Broadband__c = true;
        fiberList1.SmartVoice_Fiber_500_500_Broadband__c = true;
        fiberList1.SmartVoice_Fiber_1G_1G_Broadband__c = true;
         opplst.add(fiberList1);
        
   OpportunityLineItem fiberList2 = new OpportunityLineItem();
        fiberList2.Site__c=site.id;
        fiberList2.Product_Name__c=prod20.Name;
        fiberList2.Product2Id=prod20.Id;
        fiberList2.Unit_Price__c=customPrice6.UnitPrice;
        fiberList2.Quantity=2;
        fiberList2.Sub_Total__c=fiberList2.Quantity*fiberList2.Unit_Price__c;
        fiberList2.TotalPrice=fiberList2.Quantity*fiberList2.Unit_Price__c;
        fiberList2.Category__c=prod20.Family;
        fiberList2.Sub_Category__c=prod20.Product_Subcategory__c;
        fiberList2.OpportunityId=opp.id;
        fiberList2.Filter_Product__c ='Parent';
        fiberList2.Site_Number__c=site.Site_Number__c;
        fiberList2.Type_of_Billing__c =customPrice6.Type_of_Billing__c; 
        fiberList2.Equipment__c=prod20.Equipment__c;
        fiberList2.SmartVoice_Fiber_100_100_Broadband__c = true;
        fiberList2.SmartVoice_Fiber_500_500_Broadband__c = true;
        fiberList2.SmartVoice_Fiber_1G_1G_Broadband__c = true;
         opplst.add(fiberList2);
        
      
        OpportunityLineItem ipPhoneList1 = new OpportunityLineItem();
        ipPhoneList1.Site__c=site.id;
        ipPhoneList1.Product_Name__c=prod23.Name;
        ipPhoneList1.Product2Id=prod23.Id;
        ipPhoneList1.Unit_Price__c=customPrice6.UnitPrice;
        ipPhoneList1.Quantity=2;
        ipPhoneList1.Sub_Total__c=ipPhoneList1.Quantity*ipPhoneList1.Unit_Price__c;
        ipPhoneList1.TotalPrice=ipPhoneList1.Quantity*ipPhoneList1.Unit_Price__c;
        ipPhoneList1.Category__c=prod23.Family;
        ipPhoneList1.Sub_Category__c=prod23.Product_Subcategory__c;
        ipPhoneList1.OpportunityId=opp.id;
        ipPhoneList1.Filter_Product__c ='Parent';
        ipPhoneList1.Site_Number__c=site.Site_Number__c;
        ipPhoneList1.Type_of_Billing__c =customPrice6.Type_of_Billing__c; 
        ipPhoneList1.Equipment__c=prod23.Equipment__c;
        ipPhoneList1.isVVX311__c = true;
        ipPhoneList1.isVVX501__c = true;
        ipPhoneList1.isVVX601__c = true;
        ipPhoneList1.isSoundStationIp5000__c = true;
        ipPhoneList1.isSoundStationIp6000__c = true;
        ipPhoneList1.isSoundStationIp7000__c = true;
       
        opplst.add(ipPhoneList1);
        
        OpportunityLineItem ipPhoneList2 = new OpportunityLineItem();
        ipPhoneList2.Site__c=site.id;
        ipPhoneList2.Product_Name__c=prod23.Name;
        ipPhoneList2.Product2Id=prod23.Id;
        ipPhoneList2.Unit_Price__c=customPrice6.UnitPrice;
        ipPhoneList2.Quantity=2;
        ipPhoneList2.Sub_Total__c=ipPhoneList2.Quantity*ipPhoneList2.Unit_Price__c;
        ipPhoneList2.TotalPrice=ipPhoneList2.Quantity*ipPhoneList2.Unit_Price__c;
        ipPhoneList2.Category__c=prod23.Family;
        ipPhoneList2.Sub_Category__c=prod23.Product_Subcategory__c;
        ipPhoneList2.OpportunityId=opp.id;
        ipPhoneList2.Filter_Product__c ='Parent';
        ipPhoneList2.Site_Number__c=site.Site_Number__c;
        ipPhoneList2.Type_of_Billing__c =customPrice6.Type_of_Billing__c; 
        ipPhoneList2.Equipment__c=prod23.Equipment__c;
        ipPhoneList2.isVVX311__c = true;
        ipPhoneList2.isVVX501__c = true;
        ipPhoneList2.isVVX601__c = true;
         ipPhoneList2.isSoundStationIp5000__c = true;
        ipPhoneList2.isSoundStationIp6000__c = true;
        ipPhoneList2.isSoundStationIp7000__c = true;
       
        opplst.add(ipPhoneList2);
        
     /*    OpportunityLineItem e911List = new OpportunityLineItem();
        e911List.Site__c=site.id;
        e911List.Product_Name__c=prod7.Name;
        e911List.Product2Id=prod7.Id;
        e911List.Unit_Price__c=customPrice7.UnitPrice;
        e911List.Quantity=2;
        e911List.Sub_Total__c=e911List.Quantity*e911List.Unit_Price__c;
        e911List.TotalPrice=e911List.Quantity*e911List.Unit_Price__c;
        e911List.Category__c=prod7.Family;
        e911List.Sub_Category__c=prod7.Product_Subcategory__c;
        e911List.OpportunityId=opp.id;
        e911List.Filter_Product__c ='Parent';
        e911List.Site_Number__c=site.Site_Number__c;
        e911List.Type_of_Billing__c =customPrice7.Type_of_Billing__c; 
        e911List.Equipment__c=prod7.Equipment__c;
        opplst.add(e911List);
        
       
        OpportunityLineItem e911List1 = new OpportunityLineItem();
        e911List1.Site__c=site.id;
        e911List1.Product_Name__c=prod7.Name;
        e911List1.Product2Id=prod7.Id;
        e911List1.Unit_Price__c=customPrice7.UnitPrice;
        e911List1.Quantity=2;
        e911List1.Sub_Total__c=e911List1.Quantity*e911List1.Unit_Price__c;
        e911List1.TotalPrice=e911List1.Quantity*e911List1.Unit_Price__c;
        e911List1.Category__c=prod7.Family;
        e911List1.Sub_Category__c=prod7.Product_Subcategory__c;
        e911List1.OpportunityId=opp.id;
        e911List1.Filter_Product__c ='Parent';
        e911List1.Site_Number__c=site.Site_Number__c;
        e911List1.Type_of_Billing__c =customPrice7.Type_of_Billing__c; 
        e911List1.Equipment__c=prod7.Equipment__c;
        opplst.add(e911List1);
        
        OpportunityLineItem e911List11 = new OpportunityLineItem();
        e911List11.Site__c=site.id;
        e911List11.Product_Name__c=prod7.Name;
        e911List11.Product2Id=prod7.Id;
        e911List11.Unit_Price__c=customPrice7.UnitPrice;
        e911List11.Quantity=2;
        e911List11.Sub_Total__c=e911List11.Quantity*e911List11.Unit_Price__c;
        e911List11.TotalPrice=e911List11.Quantity*e911List11.Unit_Price__c;
        e911List11.Category__c=prod7.Family;
        e911List11.Sub_Category__c='Toll Free Bundle Minutes';
        e911List11.OpportunityId=opp.id;
        e911List11.Filter_Product__c ='Parent';
        e911List11.Site_Number__c=site.Site_Number__c;
        e911List11.Type_of_Billing__c =customPrice7.Type_of_Billing__c; 
        e911List11.Equipment__c=prod7.Equipment__c;
        opplst.add(e911List11);
        
        OpportunityLineItem ipphone = new OpportunityLineItem();
        ipphone.Site__c=site.id;
        ipphone.Product_Name__c=prod7.Name;
        ipphone.Product2Id=prod7.Id;
        ipphone.Unit_Price__c=customPrice7.UnitPrice;
        ipphone.Quantity=2;
        ipphone.Sub_Total__c=ipphone.Quantity*ipphone.Unit_Price__c;
        ipphone.TotalPrice=ipphone.Quantity*ipphone.Unit_Price__c;
        ipphone.Category__c=prod7.Family;
        ipphone.Sub_Category__c='IP Phones';
        ipphone.OpportunityId=opp.id;
        ipphone.Filter_Product__c ='Parent';
        ipphone.Type_of_Billing__c =customPrice7.Type_of_Billing__c; 
        ipphone.Equipment__c=prod7.Equipment__c;
        opplst.add(ipphone);
        
        OpportunityLineItem ipphone1 = new OpportunityLineItem();
        ipphone1.Site__c=site.id;
        ipphone1.Product_Name__c=prod7.Name;
        ipphone1.Product2Id=prod7.Id;
        ipphone1.Unit_Price__c=customPrice7.UnitPrice;
        ipphone1.Quantity=2;
        ipphone1.Sub_Total__c=ipphone1.Quantity*ipphone1.Unit_Price__c;
        ipphone1.TotalPrice=ipphone1.Quantity*ipphone1.Unit_Price__c;
        ipphone1.Category__c=prod7.Family;
        ipphone1.Sub_Category__c='IP Phones';
        ipphone1.OpportunityId=opp.id;
        ipphone1.Filter_Product__c ='Parent';
        ipphone1.Type_of_Billing__c =customPrice7.Type_of_Billing__c; 
        ipphone1.Equipment__c=prod7.Equipment__c;
        ipphone1.Site_Number__c = 1;
        opplst.add(ipphone1);
        
        OpportunityLineItem ac = new OpportunityLineItem();
        ac.Site__c=site.id;
        ac.Product_Name__c=prod7.Name;
        ac.Product2Id=prod7.Id;
        ac.Unit_Price__c=customPrice7.UnitPrice;
        ac.Quantity=2;
        ac.Sub_Total__c=ac.Quantity*ac.Unit_Price__c;
        ac.TotalPrice=ac.Quantity*ac.Unit_Price__c;
        ac.Category__c=prod7.Family;
        ac.Sub_Category__c='Accessories';
        ac.OpportunityId=opp.id;
        ac.Filter_Product__c ='Parent';
        ac.Type_of_Billing__c =customPrice7.Type_of_Billing__c; 
        ac.Equipment__c=prod7.Equipment__c;
        opplst.add(ac);
        
        OpportunityLineItem acc = new OpportunityLineItem();
        acc.Site__c=site.id;
        acc.Product_Name__c=prod7.Name;
        acc.Product2Id=prod7.Id;
        acc.Unit_Price__c=customPrice7.UnitPrice;
        acc.Quantity=2;
        acc.Sub_Total__c=acc.Quantity*acc.Unit_Price__c;
        acc.TotalPrice=acc.Quantity*acc.Unit_Price__c;
        acc.Category__c=prod7.Family;
        acc.Sub_Category__c='Accessories';
        acc.OpportunityId=opp.id;
        acc.Filter_Product__c ='Parent';
        acc.Type_of_Billing__c =customPrice7.Type_of_Billing__c; 
        acc.Equipment__c=prod7.Equipment__c;
        acc.Site_Number__c = 1;
        opplst.add(acc);
        
        
        OpportunityLineItem tollfree = new OpportunityLineItem();
        tollfree.Site__c=site.id;
        tollfree.Product_Name__c=prod8.Name;
        tollfree.Product2Id=prod8.Id;
        tollfree.Unit_Price__c=customPrice8.UnitPrice;
        tollfree.Quantity=2;
        tollfree.Sub_Total__c=tollfree.Quantity*tollfree.Unit_Price__c;
        tollfree.TotalPrice=tollfree.Quantity*tollfree.Unit_Price__c;
        tollfree.Category__c=prod8.Family;
        tollfree.Sub_Category__c= prod8.Product_Subcategory__c;
        tollfree.OpportunityId=opp.id;
        tollfree.Filter_Product__c ='Parent';
        tollfree.Type_of_Billing__c =customPrice8.Type_of_Billing__c; 
        tollfree.Equipment__c=prod8.Equipment__c;
        opplst.add(tollfree);
        */
        insert opplst;
        ApexPages.StandardController sc = new ApexPages.standardController(opp); 
        ApexPages.currentPage().getParameters().put('id',opp.id);
        Smartvoicequote smartQuote =new Smartvoicequote(sc);
        smartQuote.attachPdf();
        Test.stopTest();
    }
    
    @isTest
    public static void Smartvoicemthd4(){
        Test.startTest();
        Contact con= new contact();
        con.LastName= 'Test';
        con.MobilePhone= '9898561236';
        con.Email = 'Test@gmail.com';
        insert con;  
        
        Product2 prod = new Product2(Name = 'Laptop',IsActive=true,Year__c ='All', Parent__c=true);
        insert prod;
        
        Id standPricebookId = Test.getStandardPricebookId();
        PricebookEntry standardPrice = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = prod.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice;
        
        Pricebook2 customPB = new Pricebook2(Name='Custom Pricebook', isActive=true);
        insert customPB;
        
        PricebookEntry priceEntrylist = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = prod.Id,UnitPrice = 12000, IsActive = true);
        insert priceEntrylist;
        
        Opportunity opp=new Opportunity();
        opp.name='TestOpp';
        opp.Contact__c= con.id; 
        opp.Contract_Term_Years__c=1;
        opp.CloseDate=System.today();
        opp.StageName='New';
        opp.Company_size__c = 100000;
        opp.Reason_Won_Lost__c=' Defining '; 
        opp.Types_of_Product__c='Frontier Anyware';
        opp.Pricebook2Id=customPB.id;
        insert opp;
        
        Site__c site = new Site__c();
        site.Opportunity__c = opp.Id;
        site.PoE_option__c = 'Switch';
        insert site;
        
        List<OpportunityLineItem> oppLineLst = new List<OpportunityLineItem>();
        
        OpportunityLineItem oppLine = new OpportunityLineItem();
        oppLine.Product_Name__c='Patch Cord';
        oppLine.Site__c = site.Id;
        oppLine.Product2Id=prod.Id;
        oppLine.Unit_Price__c=priceEntrylist.UnitPrice;
        oppLine.Quantity=2;
        oppLine.Sub_Total__c=oppLine.Quantity*oppLine.Unit_Price__c;
        oppLine.TotalPrice=oppLine.Quantity*oppLine.Unit_Price__c;
        oppLine.OpportunityId=opp.id;
        oppLine.Category__c = 'Smart Voice';
        oppLine.Sub_Category__c = 'Repair';
        oppline.Filter_Product__c = 'Parent';
        //insert oppLine; 
        oppLineLst.add(oppline);
        
        OpportunityLineItem oppLn = new OpportunityLineItem();
        oppLn.Product_Name__c='Patch Cord';
        oppLn.Site__c = site.Id;
        oppLn.Product2Id=prod.Id;
        oppLn.Unit_Price__c=priceEntrylist.UnitPrice;
        oppLn.Quantity=2;
        oppLn.Sub_Total__c=oppLine.Quantity*oppLine.Unit_Price__c;
        oppLn.TotalPrice=oppLine.Quantity*oppLine.Unit_Price__c;
        oppLn.OpportunityId=opp.id;
        oppLn.Type_of_billing__c = 'MRC';
        oppLn.Category__c = 'Smart Voice';
        oppLn.Sub_Category__c = 'Repair';
        oppLn.Filter_Product__c = 'Parent';
        //insert oppLn; 
        oppLineLst.add(oppLn);
        insert oppLineLst;
        PageReference pageRef = Page.SmartVoiceQuote; 
        // Test.startTest();
        Test.setCurrentPage(pageRef);
        pageRef.getParameters().put('id',opp.Id);
        ApexPages.StandardController sc = new ApexPages.standardController(opp);
        Smartvoicequote Smartvoice= new Smartvoicequote(sc);
        Test.stopTest();
    }
    
    @isTest
    public static void Smartvoicemthd5(){
        Test.startTest();
        Contact con= new contact();
        con.LastName= 'Test';
        con.MobilePhone= '9898561236';
        con.Email = 'Test@gmail.com';
        insert con;  
        
        Product2 prod = new Product2(Name = 'Laptop',IsActive=true,Year__c ='All', Parent__c=true);
        insert prod;
        
        Id standPricebookId = Test.getStandardPricebookId();
        PricebookEntry standardPrice = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = prod.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice;
        
        Pricebook2 customPB = new Pricebook2(Name='Custom Pricebook', isActive=true);
        insert customPB;
        
        PricebookEntry priceEntrylist = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = prod.Id,UnitPrice = 12000, IsActive = true);
        insert priceEntrylist;
        
        Opportunity opp=new Opportunity();
        opp.name='TestOpp';
        opp.Contact__c= con.id; 
        opp.Contract_Term_Years__c=1;
        opp.CloseDate=System.today();
        opp.StageName='New';
        opp.Company_size__c = 100000;
        opp.Reason_Won_Lost__c=' Defining '; 
        opp.Types_of_Product__c='Frontier Anyware';
        opp.Pricebook2Id=customPB.id;
        insert opp;
        
        Site__c site = new Site__c();
        site.Opportunity__c = opp.Id;
        site.PoE_option__c = 'Switch';
        insert site;
        
        List<OpportunityLineItem> oppLineLst = new List<OpportunityLineItem>();
        
        OpportunityLineItem oppLine = new OpportunityLineItem();
        oppLine.Product_Name__c='Patch Cord';
        oppLine.Site__c = site.Id;
        oppLine.Product2Id=prod.Id;
        oppLine.Unit_Price__c=priceEntrylist.UnitPrice;
        oppLine.Quantity=2;
        oppLine.Sub_Total__c=oppLine.Quantity*oppLine.Unit_Price__c;
        oppLine.TotalPrice=oppLine.Quantity*oppLine.Unit_Price__c;
        oppLine.OpportunityId=opp.id;
        oppLine.Category__c = 'Smart Voice';
        oppLine.Sub_Category__c = 'Switches and PoE';
        oppline.Filter_Product__c = 'Parent';
        //insert oppLine; 
        oppLineLst.add(oppline);
        
        OpportunityLineItem oppLn = new OpportunityLineItem();
        oppLn.Product_Name__c='Patch Cord';
        oppLn.Site__c = site.Id;
        oppLn.Product2Id=prod.Id;
        oppLn.Unit_Price__c=priceEntrylist.UnitPrice;
        oppLn.Quantity=2;
        oppLn.Sub_Total__c=oppLine.Quantity*oppLine.Unit_Price__c;
        oppLn.TotalPrice=oppLine.Quantity*oppLine.Unit_Price__c;
        oppLn.OpportunityId=opp.id;
        oppLn.Type_of_billing__c = 'MRC';
        oppLn.Category__c = 'Smart Voice';
        oppLn.Sub_Category__c = 'Switches and PoE';
        oppLn.Filter_Product__c = 'Parent';
        //insert oppLn; 
        oppLineLst.add(oppLn);
        insert oppLineLst;
        PageReference pageRef = Page.SmartVoiceQuote; 
        //Test.startTest();
        Test.setCurrentPage(pageRef);
        pageRef.getParameters().put('id',opp.Id);
        ApexPages.StandardController sc = new ApexPages.standardController(opp);
        Smartvoicequote Smartvoice= new Smartvoicequote(sc);
        Test.stopTest();
    }
    
    @isTest
    public static void Smartvoicemthd6(){
        Test.startTest();
        Contact con= new contact();
        con.LastName= 'Test';
        con.MobilePhone= '9898561236';
        con.Email = 'Test@gmail.com';
        insert con;  
        
        Product2 prod = new Product2(Name = 'Laptop',IsActive=true,Year__c ='All', Parent__c=true);
        insert prod;
        
        Id standPricebookId = Test.getStandardPricebookId();
        PricebookEntry standardPrice = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = prod.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice;
        
        Pricebook2 customPB = new Pricebook2(Name='Custom Pricebook', isActive=true);
        insert customPB;
        
        PricebookEntry priceEntrylist = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = prod.Id,UnitPrice = 12000, IsActive = true);
        insert priceEntrylist;
        
        Opportunity opp=new Opportunity();
        opp.name='TestOpp';
        opp.Contact__c= con.id; 
        opp.Contract_Term_Years__c=1;
        opp.CloseDate=System.today();
        opp.StageName='New';
        opp.Company_size__c = 100000;
        opp.Reason_Won_Lost__c=' Defining '; 
        opp.Types_of_Product__c='Frontier Anyware';
        opp.Pricebook2Id=customPB.id;
        insert opp;
        
        Site__c site = new Site__c();
        site.Opportunity__c = opp.Id;
        site.PoE_option__c = 'Switch';
        insert site;
        
        List<OpportunityLineItem> oppLineLst = new List<OpportunityLineItem>();
        
        OpportunityLineItem oppLine = new OpportunityLineItem();
        oppLine.Product_Name__c='Patch Cord';
        oppLine.Site__c = site.Id;
        oppLine.Product2Id=prod.Id;
        oppLine.Unit_Price__c=priceEntrylist.UnitPrice;
        oppLine.Quantity=2;
        oppLine.Site_Number__c = 123456;
        oppLine.Sub_Total__c=oppLine.Quantity*oppLine.Unit_Price__c;
        oppLine.TotalPrice=oppLine.Quantity*oppLine.Unit_Price__c;
        oppLine.OpportunityId=opp.id;
        oppLine.Category__c = 'Smart Voice';
        oppLine.Sub_Category__c = 'Switches and PoE';
        oppLine.SetUp__c = 'Setup';
        oppline.Filter_Product__c = 'Child';
        //insert oppLine;
        oppLineLst.add(oppline); 
        
        OpportunityLineItem oppLn = new OpportunityLineItem();
        oppLn.Product_Name__c='Patch Cord';
        oppLn.Site__c = site.Id;
        oppLn.Product2Id=prod.Id;
        oppLn.Site_Number__c = 123456;
        oppLn.Unit_Price__c=priceEntrylist.UnitPrice;
        oppLn.Quantity=2;
        oppLn.Sub_Total__c=oppLn.Quantity*oppLn.Unit_Price__c;
        oppLn.TotalPrice=oppLn.Quantity*oppLn.Unit_Price__c;
        oppLn.OpportunityId=opp.id;
        oppLn.Type_of_billing__c = 'MRC';
        oppLn.Category__c = 'Smart Voice';
        oppLn.Sub_Category__c = 'Switches and PoE';
        oppLn.SetUp__c = 'Setup';
        oppLn.Filter_Product__c = 'Child';
       // insert oppLn; 
       oppLineLst.add(oppLn);
        
        Custom_Product__c customProd = new Custom_Product__c();
        customProd.Opportunity__c =opp.Id ;
        customProd.Total__c = 12345;
        customProd.NumberOfSites__c = 2 ;
        customProd.Type_of_billing__c = 'MRC';
        customProd.Quantity__c = 2;
        insert customProd;
        
        Custom_Product__c customP = new Custom_Product__c();
        customP.Opportunity__c =opp.Id ;
        customP.Total__c = 12345;
        customP.Quantity__c = 2;
        insert customP;
        insert oppLineLst;
        PageReference pageRef = Page.SmartVoiceQuote; 
        // Test.startTest();
        Test.setCurrentPage(pageRef);
        pageRef.getParameters().put('id',opp.Id);
        ApexPages.StandardController sc = new ApexPages.standardController(opp);
        Smartvoicequote Smartvoice= new Smartvoicequote(sc);
        Test.stopTest();
    }
    @isTest
    public static void Smartvoicemthd7(){
        Test.startTest();
        Contact con= new contact();
        con.LastName= 'Test';
        con.MobilePhone= '9898561236';
        con.Email = 'Test@gmail.com';
        insert con;  
        
        Product2 prod = new Product2(Name = 'Laptop',IsActive=true,Year__c ='All', Parent__c=true);
        insert prod;
        
        Id standPricebookId = Test.getStandardPricebookId();
        PricebookEntry standardPrice = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = prod.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice;
        
        Pricebook2 customPB = new Pricebook2(Name='Custom Pricebook', isActive=true);
        insert customPB;
        
        PricebookEntry priceEntrylist = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = prod.Id,UnitPrice = 12000, IsActive = true);
        insert priceEntrylist;
        
        Opportunity opp=new Opportunity();
        opp.name='TestOpp';
        opp.Contact__c= con.id; 
        opp.Contract_Term_Years__c=1;
        opp.CloseDate=System.today();
        opp.StageName='New';
        opp.Company_size__c = 100000;
        opp.Reason_Won_Lost__c=' Defining '; 
        opp.Types_of_Product__c='Frontier Anyware';
        opp.Pricebook2Id=customPB.id;
        insert opp;
        
        Site__c site = new Site__c();
        site.Opportunity__c = opp.Id;
        site.PoE_option__c = 'Switch';
        insert site;
        
        List<OpportunityLineItem> oppLineLst = new List<OpportunityLineItem>();
        
        OpportunityLineItem oppLine = new OpportunityLineItem();
        oppLine.Product_Name__c='Patch Cord';
        oppLine.Site__c = site.Id;
        oppLine.Product2Id=prod.Id;
        oppLine.Unit_Price__c=priceEntrylist.UnitPrice;
        oppLine.Quantity=2;
        oppLine.Sub_Total__c=oppLine.Quantity*oppLine.Unit_Price__c;
        oppLine.TotalPrice=oppLine.Quantity*oppLine.Unit_Price__c;
        oppLine.OpportunityId=opp.id;
        oppLine.Category__c = 'Smart Voice';
        oppLine.Sub_Category__c = 'Switches and PoE';
        oppline.Filter_Product__c = 'Parent';
        oppline.Site_Number__c = 1;
       // insert oppLine; 
       oppLineLst.add(oppline);
        
        OpportunityLineItem oppLn = new OpportunityLineItem();
        oppLn.Product_Name__c='Patch Cord';
        oppLn.Site__c = site.Id;
        oppLn.Product2Id=prod.Id;
        oppLn.Unit_Price__c=priceEntrylist.UnitPrice;
        oppLn.Quantity=2;
        oppLn.Sub_Total__c=oppLine.Quantity*oppLine.Unit_Price__c;
        oppLn.TotalPrice=oppLine.Quantity*oppLine.Unit_Price__c;
        oppLn.OpportunityId=opp.id;
        oppLn.Type_of_billing__c = 'MRC';
        oppLn.Category__c = 'Smart Voice';
        oppLn.Sub_Category__c = 'Switches and PoE';
        oppLn.Filter_Product__c = 'Parent';
        oppLn.Site_Number__c = 1;
        //insert oppLn; 
        oppLineLst.add(oppLn);
        
        OpportunityLineItem oppLn1 = new OpportunityLineItem();
        oppLn1.Product_Name__c='Patch Cord';
        oppLn1.Site__c = site.Id;
        oppLn1.Product2Id=prod.Id;
        oppLn1.Unit_Price__c=priceEntrylist.UnitPrice;
        oppLn1.Quantity=2;
        oppLn1.Sub_Total__c=oppLn1.Quantity*oppLn1.Unit_Price__c;
        oppLn1.TotalPrice=oppLn1.Quantity*oppLn1.Unit_Price__c;
        oppLn1.OpportunityId=opp.id;
        oppLn1.Type_of_billing__c = 'MRC';
        oppLn1.Category__c = 'Smart Voice';
        oppLn1.Sub_Category__c = 'Licenses';
        oppLn1.Filter_Product__c = 'Parent';
        oppLn1.Site_Number__c = 1;
        //insert oppLn1; 
        oppLineLst.add(oppLn1);
        
        OpportunityLineItem oppLn2 = new OpportunityLineItem();
        oppLn2.Product_Name__c='Patch Cord';
        oppLn2.Site__c = site.Id;
        oppLn2.Product2Id=prod.Id;
        oppLn2.Unit_Price__c=priceEntrylist.UnitPrice;
        oppLn2.Quantity=2;
        oppLn2.Sub_Total__c=oppLn2.Quantity*oppLn2.Unit_Price__c;
        oppLn2.TotalPrice=oppLn2.Quantity*oppLn2.Unit_Price__c;
        oppLn2.OpportunityId=opp.id;
        oppLn2.Type_of_billing__c = 'MRC';
        oppLn2.Category__c = 'Smart Voice';
        oppLn2.Sub_Category__c = 'Licenses';
        oppLn2.Filter_Product__c = 'Parent';
        oppLn2.Site_Number__c = 1;
       // insert oppLn2;
        oppLineLst.add(oppLn2);
        
        OpportunityLineItem oppLn3 = new OpportunityLineItem();
        oppLn3.Product_Name__c='Patch Cord';
        oppLn3.Site__c = site.Id;
        oppLn3.Product2Id=prod.Id;
        oppLn3.Unit_Price__c=priceEntrylist.UnitPrice;
        oppLn3.Quantity=2;
        oppLn3.Sub_Total__c=oppLn3.Quantity*oppLn3.Unit_Price__c;
        oppLn3.TotalPrice=oppLn3.Quantity*oppLn3.Unit_Price__c;
        oppLn3.OpportunityId=opp.id;
        oppLn3.Type_of_billing__c = 'MRC';
        oppLn3.Category__c = 'Smart Voice';
        oppLn3.Sub_Category__c = 'Equipment';
        oppLn3.Filter_Product__c = 'Parent';
        oppLn3.Site_Number__c = 1;
       // insert oppLn3;
       oppLineLst.add(oppLn3); 
        
        OpportunityLineItem oppLn4 = new OpportunityLineItem();
        oppLn4.Product_Name__c='Patch Cord';
        //oppLn4.Site__c = site.Id;
        oppLn4.Product2Id=prod.Id;
        oppLn4.Unit_Price__c=priceEntrylist.UnitPrice;
        oppLn4.Quantity=2;
        oppLn4.Sub_Total__c=oppLn4.Quantity*oppLn4.Unit_Price__c;
        oppLn4.TotalPrice=oppLn4.Quantity*oppLn4.Unit_Price__c;
        oppLn4.OpportunityId=opp.id;
        oppLn4.Type_of_billing__c = 'MRC';
        oppLn4.Category__c = 'Smart Voice';
        oppLn4.Sub_Category__c = 'Equipment';
        oppLn4.Filter_Product__c = 'Parent';
        //oppLn4.Site_Number__c = 1;
        //insert oppLn4; 
        oppLineLst.add(oppLn4);
        
        OpportunityLineItem oppLn5 = new OpportunityLineItem();
        oppLn5.Product_Name__c='Patch Cord';
        //oppLn4.Site__c = site.Id;
        oppLn5.Product2Id=prod.Id;
        oppLn5.Unit_Price__c=priceEntrylist.UnitPrice;
        oppLn5.Quantity=2;
        oppLn5.Sub_Total__c=oppLn5.Quantity*oppLn5.Unit_Price__c;
        oppLn5.TotalPrice=oppLn5.Quantity*oppLn5.Unit_Price__c;
        oppLn5.OpportunityId=opp.id;
        oppLn5.Type_of_billing__c = 'NRC';
        oppLn5.Category__c = 'Smart Voice';
        oppLn5.Sub_Category__c = 'Equipment';
        oppLn5.Filter_Product__c = 'Parent';
        //oppLn4.Site_Number__c = 1;
       // insert oppLn5; 
       oppLineLst.add(oppLn5);
        insert oppLineLst;
        PageReference pageRef = Page.SmartVoiceQuote; 
        // Test.startTest();
        Test.setCurrentPage(pageRef);
        pageRef.getParameters().put('id',opp.Id);
        ApexPages.StandardController sc = new ApexPages.standardController(opp);
        Smartvoicequote Smartvoice= new Smartvoicequote(sc);
        Test.stopTest();
    }
    @isTest
    public static void Smartvoicemthd8(){
        Test.startTest();
        Contact con= new contact();
        con.LastName= 'Test';
        con.MobilePhone= '9898561236';
        con.Email = 'Test@gmail.com';
        insert con;  
        
        Product2 prod = new Product2(Name = 'Laptop',IsActive=true,Year__c ='All', Parent__c=true);
        insert prod;
        
        Id standPricebookId = Test.getStandardPricebookId();
        PricebookEntry standardPrice = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = prod.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice;
        
        Pricebook2 customPB = new Pricebook2(Name='Custom Pricebook', isActive=true);
        insert customPB;
        
        PricebookEntry priceEntrylist = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = prod.Id,UnitPrice = 12000, IsActive = true);
        insert priceEntrylist;
        
        Opportunity opp=new Opportunity();
        opp.name='TestOpp';
        opp.Contact__c= con.id; 
        opp.Contract_Term_Years__c=1;
        opp.CloseDate=System.today();
        opp.StageName='New';
        opp.Company_size__c = 100000;
        opp.Reason_Won_Lost__c=' Defining '; 
        opp.Types_of_Product__c='Frontier Anyware';
        opp.Pricebook2Id=customPB.id;
        insert opp;
        
        Site__c site = new Site__c();
        site.Opportunity__c = opp.Id;
        site.PoE_option__c = 'Switch';
        insert site;
        
        List<OpportunityLineItem> oppLineLst = new List<OpportunityLineItem>();
        
        OpportunityLineItem oppLn = new OpportunityLineItem();
        oppLn.Product_Name__c='Patch Cord';
        oppLn.Site__c = site.Id;
        oppLn.Product2Id=prod.Id;
        oppLn.Unit_Price__c=priceEntrylist.UnitPrice;
        oppLn.Quantity=2;
        oppLn.Sub_Total__c=oppLn.Quantity*oppLn.Unit_Price__c;
        oppLn.TotalPrice=oppLn.Quantity*oppLn.Unit_Price__c;
        oppLn.OpportunityId=opp.id;
        oppLn.Type_of_billing__c = 'MRC';
        oppLn.Category__c = 'Smart Voice';
        oppLn.Sub_Category__c = 'Repair';
        oppLn.Filter_Product__c = 'Parent';
        oppLn.Site_Number__c = 1;
        //insert oppLn; 
        oppLineLst.add(oppLn);
        
        OpportunityLineItem oppLn1 = new OpportunityLineItem();
        oppLn1.Product_Name__c='Patch Cord';
        oppLn1.Site__c = site.Id;
        oppLn1.Product2Id=prod.Id;
        oppLn1.Unit_Price__c=priceEntrylist.UnitPrice;
        oppLn1.Quantity=2;
        oppLn1.Sub_Total__c=oppLn1.Quantity*oppLn1.Unit_Price__c;
        oppLn1.TotalPrice=oppLn1.Quantity*oppLn1.Unit_Price__c;
        oppLn1.OpportunityId=opp.id;
        oppLn1.Type_of_billing__c = 'NRC';
        oppLn1.Category__c = 'Smart Voice';
        oppLn1.Sub_Category__c = 'Repair';
        oppLn1.Filter_Product__c = 'Parent';
        oppLn1.Site_Number__c = 1;
        //insert oppLn1;
        oppLineLst.add(oppLn1);
        
        OpportunityLineItem oppLn2 = new OpportunityLineItem();
        oppLn2.Product_Name__c='Patch Cord';
        //oppLn2.Site__c = site.Id;
        oppLn2.Product2Id=prod.Id;
        oppLn2.Unit_Price__c=priceEntrylist.UnitPrice;
        oppLn2.Quantity=2;
        oppLn2.Sub_Total__c=oppLn2.Quantity*oppLn2.Unit_Price__c;
        oppLn2.TotalPrice=oppLn2.Quantity*oppLn2.Unit_Price__c;
        oppLn2.OpportunityId=opp.id;
        oppLn2.Type_of_billing__c = 'NRC';
        oppLn2.Category__c = 'Smart Voice';
        oppLn2.Sub_Category__c = 'Broadband';
        oppLn2.Filter_Product__c = 'Parent';
        //oppLn2.Site_Number__c = 1;
      //  insert oppLn2; 
        oppLineLst.add(oppLn2);
        
        OpportunityLineItem oppLn6 = new OpportunityLineItem();
        oppLn6.Product_Name__c='Patch Cord';
        oppLn6.Site__c = site.Id;
        oppLn6.Product2Id=prod.Id;
        oppLn6.Unit_Price__c=priceEntrylist.UnitPrice;
        oppLn6.Quantity=2;
        oppLn6.Sub_Total__c=oppLn6.Quantity*oppLn6.Unit_Price__c;
        oppLn6.TotalPrice=oppLn6.Quantity*oppLn6.Unit_Price__c;
        oppLn6.OpportunityId=opp.id;
        oppLn6.Type_of_billing__c = 'MRC';
        oppLn6.Category__c = 'Smart Voice';
        oppLn6.Sub_Category__c = 'Broadband';
        oppLn6.Filter_Product__c = 'Parent';
        oppLn6.Site_Number__c = 1;
       // insert oppLn6; 
       oppLineLst.add(oppLn6);
        
        OpportunityLineItem oppLn7 = new OpportunityLineItem();
        oppLn7.Product_Name__c='Patch Cord';
        oppLn7.Site__c = site.Id;
        oppLn7.Product2Id=prod.Id;
        oppLn7.Unit_Price__c=priceEntrylist.UnitPrice;
        oppLn7.Quantity=2;
        oppLn7.Sub_Total__c=oppLn7.Quantity*oppLn7.Unit_Price__c;
        oppLn7.TotalPrice=oppLn7.Quantity*oppLn7.Unit_Price__c;
        oppLn7.OpportunityId=opp.id;
        oppLn7.Type_of_billing__c = 'NRC';
        oppLn7.Category__c = 'Smart Voice';
        oppLn7.Sub_Category__c = 'Broadband';
        oppLn7.Filter_Product__c = 'Parent';
        oppLn7.Site_Number__c = 1;
        //insert oppLn7; 
        oppLineLst.add(oppLn7);
        
        OpportunityLineItem oppLn4 = new OpportunityLineItem();
        oppLn4.Product_Name__c='Patch Cord';
        oppLn4.Site__c = site.Id;
        oppLn4.Product2Id=prod.Id;
        oppLn4.Unit_Price__c=priceEntrylist.UnitPrice;
        oppLn4.Quantity=2;
        oppLn4.Sub_Total__c=oppLn4.Quantity*oppLn4.Unit_Price__c;
        oppLn4.TotalPrice=oppLn4.Quantity*oppLn4.Unit_Price__c;
        oppLn4.OpportunityId=opp.id;
        oppLn4.Type_of_billing__c = 'MRC';
        oppLn4.Category__c = 'Smart Voice';
        oppLn4.Sub_Category__c = 'FIOS';
        oppLn4.Filter_Product__c = 'Parent';
        oppLn4.Site_Number__c = 1;
        //insert oppLn4;
        oppLineLst.add(oppLn4); 
        
        OpportunityLineItem oppLn5 = new OpportunityLineItem();
        oppLn5.Product_Name__c='Patch Cord';
        oppLn5.Site__c = site.Id;
        oppLn5.Product2Id=prod.Id;
        oppLn5.Unit_Price__c=priceEntrylist.UnitPrice;
        oppLn5.Quantity=2;
        oppLn5.Sub_Total__c=oppLn5.Quantity*oppLn5.Unit_Price__c;
        oppLn5.TotalPrice=oppLn5.Quantity*oppLn5.Unit_Price__c;
        oppLn5.OpportunityId=opp.id;
        oppLn5.Type_of_billing__c = 'NRC';
        oppLn5.Category__c = 'Smart Voice';
        oppLn5.Sub_Category__c = 'FIOS';
        oppLn5.Filter_Product__c = 'Parent';
        oppLn5.Site_Number__c = 1;
        //insert oppLn5; 
        oppLineLst.add(oppLn5);
        insert oppLineLst;
        PageReference pageRef = Page.SmartVoiceQuote; 
        //Test.startTest();
        Test.setCurrentPage(pageRef);
        pageRef.getParameters().put('id',opp.Id);
        ApexPages.StandardController sc = new ApexPages.standardController(opp);
        Smartvoicequote Smartvoice= new Smartvoicequote(sc);
        //Smartvoicequote.save2();
        Test.stopTest();
    }
    @isTest
    public static void Smartvoicemthd9(){
        Test.startTest();
        Contact con= new contact();
        con.LastName= 'Test';
        con.MobilePhone= '9898561236';
        con.Email = 'Test@gmail.com';
        insert con;  
        
        Product2 prod = new Product2(Name = 'Laptop',IsActive=true,Year__c ='All', Parent__c=true);
        insert prod;
        
        Id standPricebookId = Test.getStandardPricebookId();
        PricebookEntry standardPrice = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = prod.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice;
        
        Pricebook2 customPB = new Pricebook2(Name='Custom Pricebook', isActive=true);
        insert customPB;
        
        PricebookEntry priceEntrylist = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = prod.Id,UnitPrice = 12000, IsActive = true);
        insert priceEntrylist;
        
        Opportunity opp=new Opportunity();
        opp.name='TestOpp';
        opp.Contact__c= con.id; 
        opp.Contract_Term_Years__c=1;
        opp.CloseDate=System.today();
        opp.StageName='New';
        opp.Company_size__c = 100000;
        opp.Reason_Won_Lost__c=' Defining '; 
        opp.Types_of_Product__c='Frontier Anyware';
        opp.Pricebook2Id=customPB.id;
        insert opp;
        
        Site__c site = new Site__c();
        site.Opportunity__c = opp.Id;
        site.PoE_option__c = 'Switch';
        insert site;
        
        List<OpportunityLineItem> oppLineLst = new List<OpportunityLineItem>();
        
        OpportunityLineItem oppLn = new OpportunityLineItem();
        oppLn.Product_Name__c='Patch Cord';
        //oppLn.Site__c = site.Id;
        oppLn.Product2Id=prod.Id;
        oppLn.Unit_Price__c=priceEntrylist.UnitPrice;
        oppLn.Quantity=2;
        oppLn.Sub_Total__c=oppLn.Quantity*oppLn.Unit_Price__c;
        oppLn.TotalPrice=oppLn.Quantity*oppLn.Unit_Price__c;
        oppLn.OpportunityId=opp.id;
        oppLn.Type_of_billing__c = 'NRC';
        oppLn.Category__c = 'Smart Voice';
        oppLn.Sub_Category__c = 'Fiber';
        oppLn.Filter_Product__c = 'Parent';
        //oppLn.Site_Number__c = 1;
       // insert oppLn;
       oppLineLst.add(oppLn);
        
        OpportunityLineItem oppLn1 = new OpportunityLineItem();
        oppLn1.Product_Name__c='Patch Cord';
        oppLn1.Site__c = site.Id;
        oppLn1.Product2Id=prod.Id;
        oppLn1.Unit_Price__c=priceEntrylist.UnitPrice;
        oppLn1.Quantity=2;
        oppLn1.Sub_Total__c=oppLn1.Quantity*oppLn1.Unit_Price__c;
        oppLn1.TotalPrice=oppLn1.Quantity*oppLn1.Unit_Price__c;
        oppLn1.OpportunityId=opp.id;
        oppLn1.Type_of_billing__c = 'MRC';
        oppLn1.Category__c = 'Smart Voice';
        oppLn1.Sub_Category__c = 'Fiber';
        oppLn1.Filter_Product__c = 'Parent';
        oppLn1.Site_Number__c = 1;
        //insert oppLn1; 
        oppLineLst.add(oppLn1);
        
        OpportunityLineItem oppLn2 = new OpportunityLineItem();
        oppLn2.Product_Name__c='Patch Cord';
        oppLn2.Site__c = site.Id;
        oppLn2.Product2Id=prod.Id;
        oppLn2.Unit_Price__c=priceEntrylist.UnitPrice;
        oppLn2.Quantity=2;
        oppLn2.Sub_Total__c=oppLn2.Quantity*oppLn2.Unit_Price__c;
        oppLn2.TotalPrice=oppLn2.Quantity*oppLn2.Unit_Price__c;
        oppLn2.OpportunityId=opp.id;
        oppLn2.Type_of_billing__c = 'NRC';
        oppLn2.Category__c = 'Smart Voice';
        oppLn2.Sub_Category__c = 'Fiber';
        oppLn2.Filter_Product__c = 'Parent';
        oppLn2.Site_Number__c = 1;
       // insert oppLn2;
        oppLineLst.add(oppLn2); 
        
        OpportunityLineItem oppLn3 = new OpportunityLineItem();
        oppLn3.Product_Name__c='Patch Cord';
        //oppLn2.Site__c = site.Id;
        oppLn3.Product2Id=prod.Id;
        oppLn3.Unit_Price__c=priceEntrylist.UnitPrice;
        oppLn3.Quantity=2;
        oppLn3.Sub_Total__c=oppLn3.Quantity*oppLn3.Unit_Price__c;
        oppLn3.TotalPrice=oppLn3.Quantity*oppLn3.Unit_Price__c;
        oppLn3.OpportunityId=opp.id;
        oppLn3.Type_of_billing__c = 'NRC';
        oppLn3.Category__c = 'Smart Voice';
        oppLn3.Sub_Category__c = 'FIOS';
        oppLn3.Filter_Product__c = 'Parent';
        //oppLn2.Site_Number__c = 1;
        //insert oppLn3; 
        oppLineLst.add(oppLn3); 
     
        /* 
OpportunityLineItem oppLn4 = new OpportunityLineItem();
oppLn4.Product_Name__c='Patch Cord';
oppLn4.Site__c = site.Id;
oppLn4.Product2Id=prod.Id;
oppLn4.Unit_Price__c=priceEntrylist.UnitPrice;
oppLn4.Quantity=2;
oppLn4.Sub_Total__c=oppLn4.Quantity*oppLn4.Unit_Price__c;
oppLn4.TotalPrice=oppLn4.Quantity*oppLn4.Unit_Price__c;
oppLn4.OpportunityId=opp.id;
oppLn4.Type_of_billing__c = 'NRC';
oppLn4.Category__c = 'Smart Voice';
oppLn4.Sub_Category__c = 'Add-On';
oppLn4.Filter_Product__c = 'Parent';
oppLn4.Site_Number__c = 1;
insert oppLn4; 

OpportunityLineItem oppLn5 = new OpportunityLineItem();
oppLn5.Product_Name__c='Patch Cord';
oppLn5.Site__c = site.Id;
oppLn5.Product2Id=prod.Id;
oppLn5.Unit_Price__c=priceEntrylist.UnitPrice;
oppLn5.Quantity=2;
oppLn5.Sub_Total__c=oppLn5.Quantity*oppLn5.Unit_Price__c;
oppLn5.TotalPrice=oppLn5.Quantity*oppLn5.Unit_Price__c;
oppLn5.OpportunityId=opp.id;
oppLn5.Type_of_billing__c = 'MRC';
oppLn5.Category__c = 'Smart Voice';
oppLn5.Sub_Category__c = 'Add-On';
oppLn5.Filter_Product__c = 'Parent';
oppLn5.Site_Number__c = 1;
insert oppLn5; 

OpportunityLineItem oppLn6 = new OpportunityLineItem();
oppLn6.Product_Name__c='Patch Cord';
//oppLn6.Site__c = site.Id;
oppLn6.Product2Id=prod.Id;
oppLn6.Unit_Price__c=priceEntrylist.UnitPrice;
oppLn6.Quantity=2;
oppLn6.Sub_Total__c=oppLn6.Quantity*oppLn6.Unit_Price__c;
oppLn6.TotalPrice=oppLn6.Quantity*oppLn6.Unit_Price__c;
oppLn6.OpportunityId=opp.id;
oppLn6.Type_of_billing__c = 'MRC';
oppLn6.Category__c = 'Smart Voice';
oppLn6.Sub_Category__c = 'BHSI';
oppLn6.Filter_Product__c = 'Parent';
//oppLn6.Site_Number__c = 1;
insert oppLn6;  */
        insert oppLineLst;
        PageReference pageRef = Page.SmartVoiceQuote; 
        // Test.startTest();
        Test.setCurrentPage(pageRef);
        pageRef.getParameters().put('id',opp.Id);
        ApexPages.StandardController sc = new ApexPages.standardController(opp);
        Smartvoicequote Smartvoice= new Smartvoicequote(sc);
        //Smartvoicequote.save2();
        Test.stopTest();
    } 
    
    @isTest
    public static void Smartvoicemthd10(){
       /* Test.startTest();
        Contact con= new contact();
        con.LastName= 'Test';
        con.MobilePhone= '9898561236';
        con.Email = 'Test@gmail.com';
        insert con;  
        
        Product2 prod = new Product2(Name = 'Laptop',IsActive=true,Year__c ='All', Parent__c=true);
        insert prod;
        
        Id standPricebookId = Test.getStandardPricebookId();
        PricebookEntry standardPrice = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = prod.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice;
        
        Pricebook2 customPB = new Pricebook2(Name='Custom Pricebook', isActive=true);
        insert customPB;
        
        PricebookEntry priceEntrylist = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = prod.Id,UnitPrice = 12000, IsActive = true);
        insert priceEntrylist;
        
        Opportunity opp=new Opportunity();
        opp.name='TestOpp';
        opp.Contact__c= con.id; 
        opp.Contract_Term_Years__c=1;
        opp.CloseDate=System.today();
        opp.StageName='New';
        opp.Company_size__c = 100000;
        opp.Reason_Won_Lost__c=' Defining '; 
        opp.Types_of_Product__c='Smart Voice';
        opp.Pricebook2Id=customPB.id;
        insert opp;
        
        Site__c site = new Site__c();
        site.Opportunity__c = opp.Id;
        site.PoE_option__c = 'Switch';
        insert site;
        
        List<OpportunityLineItem> oppLineLst = new List<OpportunityLineItem>();
        
        OpportunityLineItem oppLn7 = new OpportunityLineItem();
        oppLn7.Product_Name__c='Patch Cord';
        oppLn7.Site__c = site.Id;
        oppLn7.Product2Id=prod.Id;
        oppLn7.Unit_Price__c=priceEntrylist.UnitPrice;
        oppLn7.Quantity=2;
        oppLn7.Sub_Total__c=oppLn7.Quantity*oppLn7.Unit_Price__c;
        oppLn7.TotalPrice=oppLn7.Quantity*oppLn7.Unit_Price__c;
        oppLn7.OpportunityId=opp.id;
        oppLn7.Type_of_billing__c = 'MRC';
        oppLn7.Category__c = 'Smart Voice';
        oppLn7.Sub_Category__c = 'BHSI';
        oppLn7.Filter_Product__c = 'Parent';
        oppLn7.Site_Number__c = 1;
        //insert oppLn7; 
        oppLineLst.add(oppLn7);
        
        OpportunityLineItem oppLn8 = new OpportunityLineItem();
        oppLn8.Product_Name__c='Patch Cord';
        oppLn8.Site__c = site.Id;
        oppLn8.Product2Id=prod.Id;
        oppLn8.Unit_Price__c=priceEntrylist.UnitPrice;
        oppLn8.Quantity=2;
        oppLn8.Sub_Total__c=oppLn8.Quantity*oppLn8.Unit_Price__c;
        oppLn8.TotalPrice=oppLn8.Quantity*oppLn8.Unit_Price__c;
        oppLn8.OpportunityId=opp.id;
        oppLn8.Type_of_billing__c = 'NRC';
        oppLn8.Category__c = 'Smart Voice';
        oppLn8.Sub_Category__c = 'BHSI';
        oppLn8.Filter_Product__c = 'Parent';
        oppLn8.Site_Number__c = 1;
        //insert oppLn8; 
        oppLineLst.add(oppLn8);
        
        OpportunityLineItem oppLn = new OpportunityLineItem();
        oppLn.Product_Name__c='Patch Cord';
        oppLn.Site__c = site.Id;
        oppLn.Product2Id = prod.Id;
        oppLn.Unit_Price__c = priceEntrylist.UnitPrice;
        oppLn.Quantity = 2;
        oppLn.Sub_Total__c = oppLn.Quantity*oppLn.Unit_Price__c;
        oppLn.TotalPrice = oppLn.Quantity*oppLn.Unit_Price__c;
        oppLn.OpportunityId = opp.id;
        oppLn.Type_of_billing__c = 'MRC';
        oppLn.Category__c = 'Smart Voice';
        oppLn.Sub_Category__c = 'Asymetric Fiber';
        oppLn.Filter_Product__c = 'Parent';
        oppLn.Site_Number__c = 1;
        insert oppLn; 
        oppLineLst.add(oppLn);
        
        OpportunityLineItem oppLn1 = new OpportunityLineItem();
        oppLn1.Product_Name__c='Patch Cord';
        oppLn1.Site__c = site.Id;
        oppLn1.Product2Id = prod.Id;
        oppLn1.Unit_Price__c = priceEntrylist.UnitPrice;
        oppLn1.Quantity=2;
        oppLn1.Sub_Total__c = oppLn1.Quantity*oppLn1.Unit_Price__c;
        oppLn1.TotalPrice = oppLn1.Quantity*oppLn1.Unit_Price__c;
        oppLn1.OpportunityId = opp.id;
        oppLn1.Type_of_billing__c = 'NRC';
        oppLn1.Category__c = 'Smart Voice';
        oppLn1.Sub_Category__c = 'Asymetric Fiber';
        oppLn1.Filter_Product__c = 'Parent';
        oppLn1.Site_Number__c = 1;
        //insert oppLn1; 
        oppLineLst.add(oppLn1);
        
        OpportunityLineItem oppLn2 = new OpportunityLineItem();
        oppLn2.Product_Name__c='Patch Cord';
        //oppLn2.Site__c = site.Id;
        oppLn2.Product2Id=prod.Id;
        oppLn2.Unit_Price__c = priceEntrylist.UnitPrice;
        oppLn2.Quantity=2;
        oppLn2.Sub_Total__c = oppLn2.Quantity*oppLn2.Unit_Price__c;
        oppLn2.TotalPrice = oppLn2.Quantity*oppLn2.Unit_Price__c;
        oppLn2.OpportunityId = opp.id;
        oppLn2.Type_of_billing__c = 'NRC';
        oppLn2.Category__c = 'Smart Voice';
        oppLn2.Sub_Category__c = 'Asymetric Fiber';
        oppLn2.Filter_Product__c = 'Parent';
        //oppLn2.Site_Number__c = 1;
        //insert oppLn2;
        oppLineLst.add(oppLn2); 
        insert oppLineLst;
        //PageReference pageRef = Page.SmartVoiceQuote; 
        // Test.startTest();
        //Test.setCurrentPage(pageRef);
        //pageRef.getParameters().put('id',opp.Id);
        ApexPages.StandardController sc = new ApexPages.standardController(opp);
        Smartvoicequote Smartvoice= new Smartvoicequote(sc);
        // Smartvoicequote.save2();
        Test.stopTest(); */
    }
    
}