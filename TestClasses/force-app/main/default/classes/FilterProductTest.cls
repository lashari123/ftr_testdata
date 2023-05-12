@isTest
public class FilterProductTest {
    @isTest
    public static void m1(){
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
        
        Id RecordTypeIdContact = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Equote').getRecordTypeId();
        Opportunity opp=new Opportunity();
        opp.name='TestOpp';
        opp.Contact__c= con.id; 
        opp.Contract_Term_Years__c=1;
        opp.CloseDate=System.today();
        //opp.StageName='New';
          opp.StageName='Closed/Won';
        opp.Probability = 10;
        opp.Reason_Won_Lost__c ='Duplicate';
        opp.Company_size__c = 1;
        //opp.Reason_Won_Lost__c=' Defining '; 
        opp.Types_of_Product__c='Flex 2.0';
        opp.Pricebook2Id=customPB.id;
         opp.RecordtypeId = RecordTypeIdContact;
        insert opp;
        
        Site__c site = new Site__c();
        site.Opportunity__c = opp.Id;
        site.Site_Number__c = 1233;
        site.PoE_option__c = 'Switch';
        insert site;
        List <OpportunityLineItem> oppLinelst = new List <OpportunityLineItem>();
        
        OpportunityLineItem oppLine = new OpportunityLineItem();
        oppLine.Product_Name__c='Patch Cord';
        oppLine.Site__c = site.Id;
        oppLine.Product2Id=prod.Id;
        oppLine.Unit_Price__c=priceEntrylist.UnitPrice;
        oppLine.Quantity=2;
        oppLine.Sub_Total__c=oppLine.Quantity*oppLine.Unit_Price__c;
        oppLine.TotalPrice=oppLine.Quantity*oppLine.Unit_Price__c;
        oppLine.OpportunityId=opp.id;
        oppLine.Category__c = 'FAW';
        oppLine.Product_Name__c = 'Elite';
        oppLine.Sub_Category__c = 'Licenses';
        oppLine.Releted__c = 'child';
        oppLine.Type_of_billing__c = 'MRC';
        oppline.Filter_Product__c = 'Parent';
        insert oppline;
        
        ApexPages.StandardController sc = new ApexPages.standardController(opp); 
        ApexPages.currentPage().getParameters().put('id',opp.id);
        FilterProduct filter=new FilterProduct(sc);
        filter.Site = 'All';
        List<SelectOption> options = Filter.getItems();
        //System.assert(filter.getItems().size() > 0);
        filter.change1();
        
        Test.stopTest();
    }
    @isTest
    public static void m2(){
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
        
        Id RecordTypeIdContact = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Equote').getRecordTypeId();
        Opportunity opp=new Opportunity();
        opp.name='TestOpp';
        opp.Contact__c= con.id; 
        opp.Contract_Term_Years__c=1;
        opp.CloseDate=System.today();
       // opp.StageName='New';
         opp.StageName='Closed/Won';
        opp.Probability = 10;
        opp.Reason_Won_Lost__c ='Duplicate';
        opp.Company_size__c = 1;
       // opp.Reason_Won_Lost__c=' Defining '; 
        opp.Types_of_Product__c='Smart Voice';
        opp.Pricebook2Id=customPB.id;
         opp.RecordtypeId = RecordTypeIdContact;
        insert opp;
        
        Site__c site = new Site__c();
        site.Opportunity__c = opp.Id;
        site.PoE_option__c = 'Switch';
        insert site;
        List <OpportunityLineItem> oppLinelst = new List <OpportunityLineItem>();
        OpportunityLineItem oppLn = new OpportunityLineItem();
        oppLn.Product_Name__c='Patch Cord';
        oppLn.Site__c = site.Id;
        oppLn.Product2Id=prod.Id;
        oppLn.Unit_Price__c=priceEntrylist.UnitPrice;
        oppLn.Quantity=2;
        oppLn.Sub_Total__c=oppLn.Quantity*oppLn.Unit_Price__c;
        oppLn.TotalPrice=oppLn.Quantity*oppLn.Unit_Price__c;
        oppLn.OpportunityId=opp.id;
        oppLn.Category__c = 'Smart Voice';
        oppLn.Product_Name__c = 'Elite';
        oppLn.Sub_Category__c = 'Licenses';
        oppLn.Releted__c = 'child';
        oppLn.Type_of_billing__c = 'MRC';
        oppLn.Filter_Product__c = 'Parent';
        insert oppLn;
        
        OpportunityLineItem oppLine = new OpportunityLineItem();
        oppLine.Product_Name__c='Patch Cord';
        oppLine.Site__c = site.Id;
        oppLine.Product2Id=prod.Id;
        oppLine.Unit_Price__c=priceEntrylist.UnitPrice;
        oppLine.Quantity=2;
        oppLine.Parent_ID__c = oppLn.Id;
        oppLine.Sub_Total__c=oppLine.Quantity*oppLine.Unit_Price__c;
        oppLine.TotalPrice=oppLine.Quantity*oppLine.Unit_Price__c;
        oppLine.OpportunityId=opp.id;
        oppLine.Category__c = 'Smart Voice';
        oppLine.Product_Name__c = 'Elite';
        oppLine.Sub_Category__c = 'Licenses';
        oppLine.Releted__c = 'child';
        oppLine.Type_of_billing__c = 'MRC';
        oppline.Filter_Product__c = 'Parent';
        insert oppline;
        
        ApexPages.StandardController sc = new ApexPages.standardController(opp); 
        ApexPages.currentPage().getParameters().put('id',opp.id);
        FilterProduct filter=new FilterProduct(sc);
        filter.productType = 'License';
        filter.change1();
        
        FilterProduct filter1=new FilterProduct(sc);
        filter1.productType = 'License';
        filter1.TypeOfBilling = 'MRC';
        filter1.site = '1';
        filter1.change1();
        
        FilterProduct filter2=new FilterProduct(sc);
        filter2.productType = 'License';
        filter2.site = '1';
        filter2.change1();
        
        FilterProduct filter3=new FilterProduct(sc);
        filter3.TypeOfBilling = 'MRC';
        filter3.productType = 'License';
        filter3.Site = 'All';
        filter3.change1();
        
        FilterProduct filter4=new FilterProduct(sc);
        filter4.SubCategory = 'License';
        filter4.productType = 'License';
        filter4.change1();
        
        FilterProduct filter5=new FilterProduct(sc);
        filter5.productType = 'License';
        filter5.SubCategory = 'License';
        filter5.TypeOfBilling = 'MRC';
        filter5.site = '1';
        filter5.change1();
        
        FilterProduct filter6=new FilterProduct(sc);
        filter6.productType = 'License';
        filter6.SubCategory = 'License';
        filter6.site = '1';
        filter6.change1();
        
        FilterProduct filter7=new FilterProduct(sc);
        filter7.TypeOfBilling = 'MRC';
        filter7.SubCategory = 'License';
        filter7.productType = 'License';
        filter7.Site = 'All';
        filter7.change1();
        
        //System.assert(filter.getItems().size() > 0);
        Test.stopTest();
    }
    
    @isTest
    public static void m3(){
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
        Id RecordTypeIdContact = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Equote').getRecordTypeId();
        
        Opportunity opp=new Opportunity();
        opp.name='TestOpp';
        opp.Contact__c= con.id; 
        opp.Contract_Term_Years__c=1;
        opp.CloseDate=System.today();
        //opp.StageName='New';
          opp.StageName='Closed/Won';
        opp.Probability = 10;
        opp.Reason_Won_Lost__c ='Duplicate';
        opp.Company_size__c = 1;
       // opp.Reason_Won_Lost__c=' Defining '; 
        opp.Types_of_Product__c='Smart Voice';
        opp.Pricebook2Id=customPB.id;
         opp.RecordtypeId = RecordTypeIdContact;
        insert opp;
        
        Site__c site = new Site__c();
        site.Opportunity__c = opp.Id;
        site.PoE_option__c = 'Switch';
        insert site;
        List <OpportunityLineItem> oppLinelst = new List <OpportunityLineItem>();
        
        OpportunityLineItem oppLine = new OpportunityLineItem();
        oppLine.Product_Name__c='Patch Cord';
        oppLine.Site__c = site.Id;
        oppLine.Product2Id=prod.Id;
        oppLine.Unit_Price__c=priceEntrylist.UnitPrice;
        oppLine.Quantity=2;
        oppLine.Sub_Total__c=oppLine.Quantity*oppLine.Unit_Price__c;
        oppLine.TotalPrice=oppLine.Quantity*oppLine.Unit_Price__c;
        oppLine.OpportunityId=opp.id;
        oppLine.Category__c = 'FAW';
        oppLine.Product_Name__c = 'Elite';
        oppLine.Sub_Category__c = 'Licenses';
        oppLine.Releted__c = 'child';
        oppLine.Type_of_billing__c = 'MRC';
        oppline.Filter_Product__c = 'Parent';
        insert oppline;
        
        ApexPages.StandardController sc = new ApexPages.standardController(opp); 
        ApexPages.currentPage().getParameters().put('id',opp.id);
        FilterProduct filter16=new FilterProduct(sc);
        filter16.productType = 'Child';
        filter16.TypeOfBilling='MRC';
        filter16.Site ='All';
        filter16.change1();
        
        FilterProduct filter17=new FilterProduct(sc);
        filter17.productType = 'Child';
        filter17.Site ='1';
        filter17.change1();
        
        FilterProduct filter18=new FilterProduct(sc);
        filter18.productType = 'Child';
        filter18.TypeOfBilling='MRC';
        filter18.Site ='1';
        filter18.change1();
        
        FilterProduct filter19=new FilterProduct(sc);
        filter19.productType = 'Child';
        filter19.Site ='1';
        filter19.SubCategory = 'Licenses';
        filter19.change1();
        
        FilterProduct filter20=new FilterProduct(sc);
        filter20.productType = 'Child';
        filter20.Site ='All';
        filter20.SubCategory = 'Licenses';
        filter20.change1();
        
        FilterProduct filter21=new FilterProduct(sc);
        filter21.productType = 'Child';
        filter21.Site ='1';
        filter21.SubCategory = 'All';
        filter21.change1();
        
        FilterProduct filter22=new FilterProduct(sc);
        filter22.productType = 'Child';
        filter22.Site ='All';
        filter22.SubCategory = 'All';
        filter22.TypeOfBilling = 'All';
        filter22.change1();
        
        FilterProduct filter23=new FilterProduct(sc);
        filter23.productType = 'Child';
        filter23.Site ='1';
        filter23.TypeOfBilling = 'MRC';
        filter23.SubCategory = 'Licenses';
        filter23.change1();
        
        FilterProduct filter24=new FilterProduct(sc);
        filter24.productType = 'Child';
        filter24.Site ='All';
        filter24.change1();
        
        FilterProduct filter2=new FilterProduct(sc);
        filter2.SubCategory='Licenses'; 
        filter2.productType = 'Equipment';
        filter2.change1();
        
        FilterProduct filter3=new FilterProduct(sc);
        filter3.Site = '1';
        filter3.productType='All'; 
        filter3.change1(); 
        
        FilterProduct filter4=new FilterProduct(sc);
        filter4.Site = 'All';
        filter4.SubCategory='Licenses'; 
        filter4.change1();
        
        FilterProduct filter5=new FilterProduct(sc);
        filter5.Site = 'All';
        filter5.change1();
        
        FilterProduct filterabc=new FilterProduct(sc);
        filterabc.Site = '1';
        filterabc.TypeOfBilling = 'MRC';
        filterabc.productType='All'; 
        filterabc.change1(); 
        
        FilterProduct filtera1=new FilterProduct(sc);
        filtera1.Site = 'All';
        filterabc.TypeOfBilling = 'MRC';
        filtera1.SubCategory='Licenses'; 
        filtera1.change1();
        
        FilterProduct filtera2=new FilterProduct(sc);
        filtera2.Site = 'All';
        filtera2.change1();
        Test.stopTest();
    }
    
    
    @isTest
    public static void m5(){
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
        Id RecordTypeIdContact = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Equote').getRecordTypeId();
        
        Opportunity opp=new Opportunity();
        opp.name='TestOpp';
        opp.Contact__c= con.id; 
        opp.Contract_Term_Years__c=1;
        opp.CloseDate=System.today();
        //opp.StageName='New';
          opp.StageName='Closed/Won';
        opp.Probability = 10;
        opp.Reason_Won_Lost__c ='Duplicate';
        opp.Company_size__c = 1;
        //opp.Reason_Won_Lost__c=' Defining '; 
        opp.Types_of_Product__c='Frontier Anyware';
        opp.Pricebook2Id=customPB.id;
        opp.RecordtypeId = RecordTypeIdContact;
        insert opp;
        
        Site__c site = new Site__c();
        site.Opportunity__c = opp.Id;
        site.PoE_option__c = 'Switch';
        insert site;
        List <OpportunityLineItem> oppLinelst = new List <OpportunityLineItem>();
        
        OpportunityLineItem oppLine = new OpportunityLineItem();
        oppLine.Product_Name__c='Patch Cord';
        oppLine.Site__c = site.Id;
        oppLine.Product2Id=prod.Id;
        oppLine.Unit_Price__c=priceEntrylist.UnitPrice;
        oppLine.Quantity=2;
        oppLine.Sub_Total__c=oppLine.Quantity*oppLine.Unit_Price__c;
        oppLine.TotalPrice=oppLine.Quantity*oppLine.Unit_Price__c;
        oppLine.OpportunityId=opp.id;
        oppLine.Category__c = 'FAW';
        oppLine.Product_Name__c = 'Elite';
        oppLine.Sub_Category__c = 'Licenses';
        oppLine.Releted__c = 'child';
        oppLine.Type_of_billing__c = 'MRC';
        oppline.Filter_Product__c = 'Parent';
        insert oppline;
        
        ApexPages.StandardController sc = new ApexPages.standardController(opp); 
        ApexPages.currentPage().getParameters().put('id',opp.id);
        FilterProduct filter16=new FilterProduct(sc);
        filter16.productType = 'Child';
        filter16.TypeOfBilling='MRC';
        filter16.Site ='All';
        filter16.change1();
        
        FilterProduct filter17=new FilterProduct(sc);
        filter17.productType = 'Child';
        filter17.Site ='1';
        filter17.change1();
        
        FilterProduct filter18=new FilterProduct(sc);
        filter18.productType = 'Child';
        filter18.TypeOfBilling='MRC';
        filter18.Site ='1';
        filter18.change1();
        
        FilterProduct filter19=new FilterProduct(sc);
        filter19.productType = 'Child';
        filter19.Site ='1';
        filter19.SubCategory = 'Licenses';
        filter19.change1();
        
        FilterProduct filter20=new FilterProduct(sc);
        filter20.productType = 'Child';
        filter20.Site ='All';
        filter20.SubCategory = 'Licenses';
        filter20.change1();
        
        FilterProduct filter21=new FilterProduct(sc);
        filter21.productType = 'Child';
        filter21.Site ='1';
        filter21.SubCategory = 'All';
        filter21.change1();
        
        FilterProduct filter22=new FilterProduct(sc);
        filter22.productType = 'Child';
        filter22.Site ='All';
        filter22.SubCategory = 'All';
        filter22.TypeOfBilling = 'All';
        filter22.change1();
        
        FilterProduct filter23=new FilterProduct(sc);
        filter23.productType = 'Child';
        filter23.Site ='1';
        filter23.TypeOfBilling = 'MRC';
        filter23.SubCategory = 'Licenses';
        filter23.change1();
        
        FilterProduct filter24=new FilterProduct(sc);
        filter24.productType = 'Child';
        filter24.Site ='All';
        filter24.change1();
        
        FilterProduct filter2=new FilterProduct(sc);
        filter2.SubCategory='Licenses'; 
        filter2.productType = 'Equipment';
        filter2.change1();
        
        FilterProduct filter3=new FilterProduct(sc);
        filter3.Site = '1';
        filter3.productType='All'; 
        filter3.change1(); 
        
        FilterProduct filter4=new FilterProduct(sc);
        filter4.Site = 'All';
        filter4.SubCategory='Licenses'; 
        filter4.change1();
        
        FilterProduct filter5=new FilterProduct(sc);
        filter5.Site = 'All';
        filter5.change1();
        
        FilterProduct filterabc=new FilterProduct(sc);
        filterabc.Site = '1';
        filterabc.TypeOfBilling = 'MRC';
        filterabc.productType='All'; 
        filterabc.change1(); 
        
        FilterProduct filtera1=new FilterProduct(sc);
        filtera1.Site = 'All';
        filterabc.TypeOfBilling = 'MRC';
        filtera1.SubCategory='Licenses'; 
        filtera1.change1();
        
        FilterProduct filtera2=new FilterProduct(sc);
        filtera2.Site = 'All';
        filtera2.change1();
      /*  
        FilterProduct filter181 =  new FilterProduct(sc);
        filter181.SubCategory = 'All';
        filter181.TypeOfBilling = 'MRC';
        filter181.change1();
        Test.stopTest(); */
    }
    
    @isTest
    public static void m6(){
        Test.startTest();
        Contact con= new contact();
        con.LastName= 'Test';
        con.MobilePhone= '9898561236';
        con.Email = 'Test@gmail.com';
        insert con;  
        
        Id RecordTypeIdContact = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Equote').getRecordTypeId();
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
        //opp.StageName='New';
          opp.StageName='Closed/Won';
        opp.Probability = 10;
        opp.Reason_Won_Lost__c ='Duplicate';
        opp.Company_size__c = 1;
       // opp.Reason_Won_Lost__c=' Defining '; 
        opp.Types_of_Product__c='Frontier Anyware';
        opp.Pricebook2Id=customPB.id;
        opp.RecordtypeId = RecordTypeIdContact;
        insert opp;
        
        Site__c site = new Site__c();
        site.Opportunity__c = opp.Id;
        site.PoE_option__c = 'Switch';
        insert site;
        List <OpportunityLineItem> oppLinelst = new List <OpportunityLineItem>();
        
        OpportunityLineItem oppLine = new OpportunityLineItem();
        oppLine.Product_Name__c='Patch Cord';
        oppLine.Site__c = site.Id;
        oppLine.Product2Id=prod.Id;
        oppLine.Unit_Price__c=priceEntrylist.UnitPrice;
        oppLine.Quantity=2;
        oppLine.Sub_Total__c=oppLine.Quantity*oppLine.Unit_Price__c;
        oppLine.TotalPrice=oppLine.Quantity*oppLine.Unit_Price__c;
        oppLine.OpportunityId=opp.id;
        oppLine.Category__c = 'FAW';
        oppLine.Product_Name__c = 'Elite';
        oppLine.Sub_Category__c = 'Licenses';
        oppLine.Releted__c = 'child';
        oppLine.Type_of_billing__c = 'MRC';
        oppline.Filter_Product__c = 'Parent';
        insert oppline;
        
        ApexPages.StandardController sc = new ApexPages.standardController(opp); 
        ApexPages.currentPage().getParameters().put('id',opp.id);
        FilterProduct filter2=new FilterProduct(sc);
        filter2.SubCategory='Licenses'; 
        filter2.TypeOfBilling='MRC';
        filter2.change1();
        
        FilterProduct filter3=new FilterProduct(sc);
        filter3.SubCategory='Licenses'; 
        filter3.TypeOfBilling='MRC';
        filter3.Site ='1';
        filter3.change1();
        
        FilterProduct filter4=new FilterProduct(sc);
        filter4.productType = 'Parent';
        filter4.site= 'All';
        filter4.change1();
        
        FilterProduct filter6=new FilterProduct(sc);
        filter6.productType = 'Equipment';
        filter6.TypeOfBilling='MRC';
        filter6.change1();
        
        FilterProduct filtereq=new FilterProduct(sc);
        filtereq.productType = 'Equipment';
        filtereq.change1();
        
        FilterProduct filter6eq=new FilterProduct(sc);
        filter6eq.productType = 'Equipment';
        filter6eq.TypeOfBilling='MRC';
        filter6eq.Site = '1';
        filter6eq.change1();
        
        FilterProduct filterequip=new FilterProduct(sc);
        filterequip.productType = 'Equipment';
        filterequip.Site = '1';
        filterequip.change1();
        
        FilterProduct filter7=new FilterProduct(sc);
        filter7.productType = 'Parent';
        filter7.TypeOfBilling='MRC';
        filter7.Site ='All';
        filter7.change1();
        
        FilterProduct filter8=new FilterProduct(sc);
        filter8.productType = 'Parent';
        filter8.Site ='1';
        filter8.change1();
        
        FilterProduct filter9=new FilterProduct(sc);
        filter9.productType = 'Parent';
        filter9.TypeOfBilling='MRC';
        filter9.Site ='1';
        filter9.change1();
        
        FilterProduct filter10=new FilterProduct(sc);
        filter10.productType = 'Parent';
        filter10.Site ='1';
        filter10.SubCategory = 'Licenses';
        filter10.change1();
        
        FilterProduct filter11=new FilterProduct(sc);
        filter11.productType = 'Parent';
        filter11.Site ='All';
        filter11.SubCategory = 'Licenses';
        filter11.change1();
        
        FilterProduct filter12=new FilterProduct(sc);
        filter12.productType = 'Parent';
        filter12.Site ='1';
        filter12.SubCategory = 'All';
        filter12.change1();
        
        FilterProduct filter13=new FilterProduct(sc);
        filter13.productType = 'Parent';
        filter13.Site ='All';
        filter13.SubCategory = 'All';
        filter13.change1();
        
        FilterProduct filter14=new FilterProduct(sc);
        filter14.productType = 'Parent';
        filter14.Site ='1';
        filter14.TypeOfBilling = 'MRC';
        filter14.SubCategory = 'Licenses';
        filter14.change1();
        
        FilterProduct filter15=new FilterProduct(sc);
        filter15.productType = 'Parent';
        filter15.Site ='All';
        filter15.TypeOfBilling = 'MRC';
        filter15.SubCategory = 'Licenses';
        filter15.change1();
        
      /*  FilterProduct filter1811 =  new FilterProduct(sc);
        filter1811.SubCategory = 'Licenses';
        filter1811.TypeOfBilling = 'All';
        filter1811.Site = '1';
        filter1811.change1();
        */
        Test.stopTest();
    }
    
    @isTest
    public static void m7(){
        Test.startTest();
        Contact con= new contact();
        con.LastName= 'Test';
        con.MobilePhone= '9898561236';
        con.Email = 'Test@gmail.com';
        insert con;  
        Id RecordTypeIdContact = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Equote').getRecordTypeId();
        
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
        //opp.StageName='New';
          opp.StageName='Closed/Won';
        opp.Probability = 10;
        opp.Reason_Won_Lost__c ='Duplicate';
        opp.Company_size__c = 1;
        //opp.Reason_Won_Lost__c=' Defining '; 
        opp.Types_of_Product__c='Smart Voice';
        opp.Pricebook2Id=customPB.id;
         opp.RecordtypeId = RecordTypeIdContact;
        insert opp;
        
        Site__c site = new Site__c();
        site.Opportunity__c = opp.Id;
        site.PoE_option__c = 'Switch';
        insert site;
        List <OpportunityLineItem> oppLinelst = new List <OpportunityLineItem>();
        
        OpportunityLineItem oppLine = new OpportunityLineItem();
        oppLine.Product_Name__c='Patch Cord';
        oppLine.Site__c = site.Id;
        oppLine.Product2Id=prod.Id;
        oppLine.Unit_Price__c=priceEntrylist.UnitPrice;
        oppLine.Quantity=2;
        oppLine.Sub_Total__c=oppLine.Quantity*oppLine.Unit_Price__c;
        oppLine.TotalPrice=oppLine.Quantity*oppLine.Unit_Price__c;
        oppLine.OpportunityId=opp.id;
        oppLine.Category__c = 'FAW';
        oppLine.Product_Name__c = 'Elite';
        oppLine.Sub_Category__c = 'Licenses';
        oppLine.Releted__c = 'child';
        oppLine.Type_of_billing__c = 'MRC';
        oppline.Filter_Product__c = 'Parent';
        insert oppline;
        
        ApexPages.StandardController sc = new ApexPages.standardController(opp); 
        ApexPages.currentPage().getParameters().put('id',opp.id);
        FilterProduct filter2=new FilterProduct(sc);
        filter2.SubCategory='Licenses'; 
        filter2.TypeOfBilling='MRC';
        filter2.change1();
        
        FilterProduct filter3=new FilterProduct(sc);
        filter3.SubCategory='Licenses'; 
        filter3.TypeOfBilling='MRC';
        filter3.Site ='1';
        filter3.change1();
        
        FilterProduct filter4=new FilterProduct(sc);
        filter4.productType = 'Parent';
        filter4.site= 'All';
        filter4.change1();
        
        FilterProduct filter6=new FilterProduct(sc);
        filter6.productType = 'Equipment';
        filter6.TypeOfBilling='MRC';
        filter6.change1();
        
        FilterProduct filtereq=new FilterProduct(sc);
        filtereq.productType = 'Equipment';
        filtereq.change1();
        
        FilterProduct filter6eq=new FilterProduct(sc);
        filter6eq.productType = 'Equipment';
        filter6eq.TypeOfBilling='MRC';
        filter6eq.Site = '1';
        filter6eq.change1();
        
        FilterProduct filterequip=new FilterProduct(sc);
        filterequip.productType = 'Equipment';
        filterequip.Site = '1';
        filterequip.change1();
        
        FilterProduct filter7=new FilterProduct(sc);
        filter7.productType = 'Parent';
        filter7.TypeOfBilling='MRC';
        filter7.Site ='All';
        filter7.change1();
        
        FilterProduct filter8=new FilterProduct(sc);
        filter8.productType = 'Parent';
        filter8.Site ='1';
        filter8.change1();
        
        FilterProduct filter9=new FilterProduct(sc);
        filter9.productType = 'Parent';
        filter9.TypeOfBilling='MRC';
        filter9.Site ='1';
        filter9.change1();
        
        FilterProduct filter10=new FilterProduct(sc);
        filter10.productType = 'Parent';
        filter10.Site ='1';
        filter10.SubCategory = 'Licenses';
        filter10.change1();
        
        FilterProduct filter11=new FilterProduct(sc);
        filter11.productType = 'Parent';
        filter11.Site ='All';
        filter11.SubCategory = 'Licenses';
        filter11.change1();
        
        FilterProduct filter12=new FilterProduct(sc);
        filter12.productType = 'Parent';
        filter12.Site ='1';
        filter12.SubCategory = 'All';
        filter12.change1();
        
        FilterProduct filter13=new FilterProduct(sc);
        filter13.productType = 'Parent';
        filter13.Site ='All';
        filter13.SubCategory = 'All';
        filter13.change1();
        
        FilterProduct filter14=new FilterProduct(sc);
        filter14.productType = 'Parent';
        filter14.Site ='1';
        filter14.TypeOfBilling = 'MRC';
        filter14.SubCategory = 'Licenses';
        filter14.change1();
        
        FilterProduct filter15=new FilterProduct(sc);
        filter15.productType = 'Parent';
        filter15.Site ='All';
        filter15.TypeOfBilling = 'MRC';
        filter15.SubCategory = 'Licenses';
        filter15.change1();
        filter15.SaveAsExcel();
        filter15.change2();
        
      /*  FilterProduct filter181 =  new FilterProduct(sc);
        filter181.prodType = 'Frontier Anyware';
        filter181.SubCategory = 'Licenses';
        filter181.TypeOfBilling = 'MRC';
        filter181.Site = 'All';
        filter181.productType = 'Child';
        filter181.change1();*/
        Test.stopTest();
    }
    @isTest
    public static void m8(){
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
        Id RecordTypeIdContact = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Equote').getRecordTypeId();
        
        Opportunity opp=new Opportunity();
        opp.name='TestOpp';
        opp.Contact__c= con.id; 
        opp.Contract_Term_Years__c=1;
        opp.CloseDate=System.today();
        //opp.StageName='New';
          opp.StageName='Closed/Won';
        opp.Probability = 10;
        opp.Reason_Won_Lost__c ='Duplicate';
        opp.Company_size__c = 1;
        //opp.Reason_Won_Lost__c=' Defining '; 
        opp.Types_of_Product__c='Frontier Anyware';
        opp.Pricebook2Id=customPB.id;
         opp.RecordtypeId = RecordTypeIdContact;
        insert opp;
        
        Site__c site = new Site__c();
        site.Opportunity__c = opp.Id;
        site.PoE_option__c = 'Switch';
        insert site;
        List <OpportunityLineItem> oppLinelst = new List <OpportunityLineItem>();
        
        OpportunityLineItem oppLine = new OpportunityLineItem();
        oppLine.Product_Name__c='Patch Cord';
        oppLine.Site__c = site.Id;
        oppLine.Product2Id=prod.Id;
        oppLine.Unit_Price__c=priceEntrylist.UnitPrice;
        oppLine.Quantity=2;
        oppLine.Sub_Total__c=oppLine.Quantity*oppLine.Unit_Price__c;
        oppLine.TotalPrice=oppLine.Quantity*oppLine.Unit_Price__c;
        oppLine.OpportunityId=opp.id;
        oppLine.Category__c = 'FAW';
        oppLine.Product_Name__c = 'Elite';
        oppLine.Sub_Category__c = 'Licenses';
        oppLine.Releted__c = 'child';
        oppLine.Type_of_billing__c = 'MRC';
        oppline.Filter_Product__c = 'Parent';
        insert oppline;
        
        ApexPages.StandardController sc = new ApexPages.standardController(opp); 
        ApexPages.currentPage().getParameters().put('id',opp.id);
        FilterProduct filter =  new FilterProduct(sc);
        filter.prodType = 'Frontier Anyware';
        filter.SubCategory = 'Licenses';
        filter.TypeOfBilling = 'MRC';
        filter.productType = 'Equipment';
        filter.change1();
        
        FilterProduct filtera =  new FilterProduct(sc);
        filtera.prodType = 'Frontier Anyware';
        filtera.SubCategory = 'Licenses';
        filtera.TypeOfBilling = 'MRC';
        filtera.Site = '1';
        filtera.productType = 'Equipment';
        filtera.change1();
        
        FilterProduct filter81 =  new FilterProduct(sc);
        filter81.prodType = 'Frontier Anyware';
        filter81.SubCategory = 'Licenses';
        filter81.TypeOfBilling = 'All';
        filter81.Site = '1';
        filter81.productType = 'Equipment';
        filter81.change1();
        
        FilterProduct filterb =  new FilterProduct(sc);
        filterb.prodType = 'Frontier Anyware';
        filterb.SubCategory = 'All';
        filterb.TypeOfBilling = 'All';
        filterb.Site = 'All';
        filterb.productType = 'test';
        filterb.change1();
        
        FilterProduct filterc =  new FilterProduct(sc);
        filterc.prodType = 'Frontier Anyware';
        filterc.SubCategory = 'All';
        filterc.TypeOfBilling = 'All';
        filterc.Site = '1';
        filterc.productType = 'test';
        filterc.change1();
        
        FilterProduct filterd =  new FilterProduct(sc);
        filterd.prodType = 'Frontier Anyware';
        filterd.SubCategory = 'All';
        filterd.TypeOfBilling = 'MRC';
        filterd.Site = 'All';
        filterd.productType = 'test';
        filterd.change1();
        
        FilterProduct filtere =  new FilterProduct(sc);
        filtere.prodType = 'Frontier Anyware';
        filtere.SubCategory = 'All';
        filtere.TypeOfBilling = 'MRC';
        filtere.Site = '1';
        filtere.productType = 'test';
        filtere.change1();
        
        FilterProduct filterf =  new FilterProduct(sc);
        filterf.prodType = 'Frontier Anyware';
        filterf.SubCategory = 'Licenses';
        filterf.TypeOfBilling = 'MRC';
        filterf.Site = '1';
        filterf.productType = 'test';
        filterf.change1();
        
        FilterProduct filterg =  new FilterProduct(sc);
        filterg.prodType = 'Frontier Anyware';
        filterg.SubCategory = 'Licenses';
        filterg.TypeOfBilling = 'All';
        filterg.Site = 'All';
        filterg.productType = 'test';
        filterg.change1();
        
        FilterProduct filterh =  new FilterProduct(sc);
        filterh.prodType = 'Frontier Anyware';
        filterh.SubCategory = 'Licenses';
        filterh.TypeOfBilling = 'All';
        filterh.Site = '1';
        filterh.productType = 'test';
        filterh.change1();
        
        FilterProduct filteri =  new FilterProduct(sc);
        filteri.prodType = 'Frontier Anyware';
        filteri.SubCategory = 'Licenses';
        filteri.TypeOfBilling = 'MRC';
        filteri.Site = 'All';
        filteri.productType = 'test';
        filteri.change1();
        filteri.FilterType = 'val2';
        filteri.contractTable = true;
        filteri.change2();
        
        Test.stopTest();
    }
    
    @isTest
    public static void m9(){
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
        
        Id RecordTypeIdContact = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Equote').getRecordTypeId();
        
        Opportunity opp=new Opportunity();
        opp.name='TestOpp';
        opp.Contact__c= con.id; 
        opp.Contract_Term_Years__c=1;
        opp.CloseDate=System.today();
        opp.StageName='Closed/Won';
        opp.Probability = 10;
        opp.Reason_Won_Lost__c ='Duplicate';
        opp.Company_size__c = 1;
        opp.Types_of_Product__c='Frontier Anyware';
        opp.Pricebook2Id=customPB.id;
         opp.RecordtypeId = RecordTypeIdContact;
        insert opp;
        
        Site__c site = new Site__c();
        site.Opportunity__c = opp.Id;
        site.PoE_option__c = 'Switch';
        insert site;
        List <OpportunityLineItem> oppLinelst = new List <OpportunityLineItem>();
        
        OpportunityLineItem oppLine = new OpportunityLineItem();
        oppLine.Product_Name__c='Patch Cord';
        oppLine.Site__c = site.Id;
        oppLine.Product2Id=prod.Id;
        oppLine.Unit_Price__c=priceEntrylist.UnitPrice;
        oppLine.Quantity=2;
        oppLine.Sub_Total__c=oppLine.Quantity*oppLine.Unit_Price__c;
        oppLine.TotalPrice=oppLine.Quantity*oppLine.Unit_Price__c;
        oppLine.OpportunityId=opp.id;
        oppLine.Category__c = 'FAW';
        oppLine.Sub_Category__c = 'Licenses';
        oppLine.Type_of_billing__c = 'MRC';
        oppline.Filter_Product__c = 'Parent';
        oppLinelst.add(oppline);
        
        OpportunityLineItem oppLine1 = new OpportunityLineItem();
        oppLine1.Product_Name__c='Patch Cord';
        oppLine1.Site__c = site.Id;
        oppLine1.Product2Id=prod.Id;
        oppLine1.Unit_Price__c=priceEntrylist.UnitPrice;
        oppLine1.Quantity=2;
        oppLine1.Sub_Total__c=oppLine1.Quantity*oppLine1.Unit_Price__c;
        oppLine1.TotalPrice=oppLine1.Quantity*oppLine1.Unit_Price__c;
        oppLine1.OpportunityId=opp.id;
        oppLine1.Category__c = 'FAW';
        oppLine1.Sub_Category__c = 'Add-On';
        oppLine1.Type_of_billing__c = 'MRC';
        oppLine1.Filter_Product__c = 'Parent';
        oppLinelst.add(oppLine1);
        
        OpportunityLineItem oppLine2 = new OpportunityLineItem();
        oppLine2.Product_Name__c='Patch Cord';
        oppLine2.Site__c = site.Id;
        oppLine2.Product2Id=prod.Id;
        oppLine2.Unit_Price__c=priceEntrylist.UnitPrice;
        oppLine2.Quantity=2;
        oppLine2.Sub_Total__c=oppLine2.Quantity*oppLine2.Unit_Price__c;
        oppLine2.TotalPrice=oppLine2.Quantity*oppLine2.Unit_Price__c;
        oppLine2.OpportunityId=opp.id;
        oppLine2.Category__c = 'FAW';
        oppLine2.Sub_Category__c = 'Toll Free Bundle Minutes';
        oppLine2.Type_of_billing__c = 'MRC';
        oppLine2.Filter_Product__c = 'Parent';
        oppLinelst.add(oppLine2);
        
        OpportunityLineItem oppLine3 = new OpportunityLineItem();
        oppLine3.Product_Name__c='Patch Cord';
        oppLine3.Site__c = site.Id;
        oppLine3.Product2Id=prod.Id;
        oppLine3.Unit_Price__c=priceEntrylist.UnitPrice;
        oppLine3.Quantity=2;
        oppLine3.Sub_Total__c=oppLine3.Quantity*oppLine3.Unit_Price__c;
        oppLine3.TotalPrice=oppLine3.Quantity*oppLine3.Unit_Price__c;
        oppLine3.OpportunityId=opp.id;
        oppLine3.Category__c = 'FAW';
        oppLine3.Sub_Category__c = 'IP Phones';
        oppLine3.Type_of_billing__c = 'MRC';
        oppLine3.Filter_Product__c = 'Child';
        oppLine3.Releted__c = 'child';
        oppLinelst.add(oppLine3);
        
        OpportunityLineItem oppLine4 = new OpportunityLineItem();
        oppLine4.Product_Name__c='Patch Cord';
        oppLine4.Site__c = site.Id;
        oppLine4.Product2Id=prod.Id;
        oppLine4.Unit_Price__c=priceEntrylist.UnitPrice;
        oppLine4.Quantity=2;
        oppLine4.Sub_Total__c=oppLine4.Quantity*oppLine4.Unit_Price__c;
        oppLine4.TotalPrice=oppLine4.Quantity*oppLine4.Unit_Price__c;
        oppLine4.OpportunityId=opp.id;
        oppLine4.Category__c = 'FAW';
        oppLine4.Sub_Category__c = 'Switches and PoE';
        oppLine4.Type_of_billing__c = 'MRC';
        oppLine4.Filter_Product__c = 'Child';
        oppLine4.Releted__c = 'child';
        oppLinelst.add(oppLine4);
        
        OpportunityLineItem oppLine5 = new OpportunityLineItem();
        oppLine5.Product_Name__c='Patch Cord';
        oppLine5.Site__c = site.Id;
        oppLine5.Product2Id=prod.Id;
        oppLine5.Unit_Price__c=priceEntrylist.UnitPrice;
        oppLine5.Quantity=2;
        oppLine5.Sub_Total__c=oppLine5.Quantity*oppLine5.Unit_Price__c;
        oppLine5.TotalPrice=oppLine5.Quantity*oppLine5.Unit_Price__c;
        oppLine5.OpportunityId=opp.id;
        oppLine5.Category__c = 'FAW';
        oppLine5.Sub_Category__c = 'Accessories';
        oppLine5.Type_of_billing__c = 'MRC';
        oppLine5.Filter_Product__c = 'Child';
        oppLine5.Releted__c = 'child';
        oppLinelst.add(oppLine5);
        
        insert oppLinelst;
        
        ApexPages.StandardController sc = new ApexPages.standardController(opp); 
        ApexPages.currentPage().getParameters().put('id',opp.id);
        FilterProduct filtera =  new FilterProduct(sc);
        filtera.FilterType = 'val3';
        filtera.contractTable = true;
        filtera.change2();
        FilterProduct filterb =  new FilterProduct(sc);
        filterb.FilterType = 'val4';
        filterb.contractTable = true;
        filterb.change2();
         FilterProduct filterc =  new FilterProduct(sc);
        filterc.FilterType = 'val5';
        filterc.contractTable = true;
        filterc.change2();
         FilterProduct filterd =  new FilterProduct(sc);
        filterd.FilterType = 'val6';
        filterd.contractTable = true;
        filterd.change2();
        Test.stopTest();
    }       
}