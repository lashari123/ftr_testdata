@isTest
public class ParentRelationTest {
    @isTest
    public static void ParentTestMethod1(){
        
        Contact con= new contact();
        con.LastName= 'Test';
        con.MobilePhone= '9898561236';
        con.Email = 'Test@gmail.com';
        insert con;       
        
        Product2 prodparent = new Product2(Name = 'StreamLine Unit Bundle - 48 port',IsActive=true,Year__c ='All', Parent__c=true,
                                           PoE_provided_by_customer__c='All',
                                           PoE_provided_by_Frontier__c  ='All',
                                           PowerPhone_provided_by_Frontier__c='All' ,
                                           Equipment__c=true );
        insert prodparent;
        
        Product2 prodchild = new Product2(Name = '50 Port System Harness',IsActive=true,Year__c ='All',Child__c=true, PoE_provided_by_customer__c='All',
                                          PoE_provided_by_Frontier__c   ='All',
                                          PowerPhone_provided_by_Frontier__c='All',
                                          Part_Number_of_Product__c='51300751',Equipment__c=true
                                         );
        insert prodchild;
        
        Id standPricebookId = Test.getStandardPricebookId();
        PricebookEntry standardPrice = new PricebookEntry(Pricebook2Id = standPricebookId, 
                                                          Product2Id = prodparent.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice;
        PricebookEntry standardPrice1 = new PricebookEntry(Pricebook2Id = standPricebookId, 
                                                          Product2Id = prodchild.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice1;
        
        Pricebook2 customPB = new Pricebook2(Name='Custom Pricebook', isActive=true);
        insert customPB;
        PricebookEntry customPrice = new PricebookEntry(Pricebook2Id =customPB.Id, Product2Id = prodparent.Id,UnitPrice = 12000, IsActive = true);
        insert customPrice;
        PricebookEntry customPrice1 = new PricebookEntry(Pricebook2Id =customPB.Id, Product2Id = prodchild.Id,UnitPrice = 12000, IsActive = true);
        insert customPrice1;
        
        UCaaS_Parent_Child__c ParentchildProducts=new UCaaS_Parent_Child__c();
        ParentchildProducts.PowerPhone_provided_by_Frontier__c='true';
        ParentchildProducts.Parent_ID__c=prodparent.id;
        ParentchildProducts.Child_ID__c=prodchild.id;
        ParentchildProducts.PoE_provided_by_customer__c='All';
        ParentchildProducts.PoE_provided_by_Frontier__c ='All';
        ParentchildProducts.PowerPhone_provided_by_Frontier__c  ='All';
        ParentchildProducts.Price_Book__c=customPB.id;
        ParentchildProducts.Qty__c=2;
         ParentchildProducts.Types_of_Product__c = 'Frontier Anyware';
        ParentchildProducts.isActive__c = true;
        insert ParentchildProducts;
         
        Opportunity opp=new Opportunity();
        opp.name='TestOpp';
        opp.Contact__c= con.id;
        opp.Contract_Term_Years__c=1;
        opp.CloseDate=System.today();
        opp.StageName='Closed/Won';
        opp.Probability = 10;
        opp.Reason_Won_Lost__c ='Duplicate';
        opp.Company_size__c=5;
        opp.Pricebook2Id=customPB.id;
        opp.Total_NRC__c=2;
        opp.Pricebook2Id=customPB.id;
        opp.Types_of_Product__c = 'Frontier Anyware';
        insert opp;
        String recordId = opp.id;
        
        Site__c site=new Site__c();
        site.Site_Name__c='SiteTest';
        site.opportunity__c=opp.id;
        site.PoE_option__c='Switch';
        site.Primary__c=True;
        insert site;
        Equipment__c equipmentlst= new Equipment__c();
        equipmentlst.Equipment__c=true;
        equipmentlst.Site__c=opp.id;
        equipmentlst.Filter_Product__c ='parent';   
        equipmentlst.OpportunityId__c=opp.id;
        equipmentlst.Product__c=prodparent.id;
        equipmentlst.Product_Name__c=prodparent.name;   
        equipmentlst.Quantity__c=2;
        equipmentlst.Unit_Price__c=customPrice.UnitPrice;
        equipmentlst.Total_Price__c=equipmentlst.Quantity__c*equipmentlst.Unit_Price__c;   
        insert equipmentlst;
         
        OpportunityLineItem linelist1 = new OpportunityLineItem();
        linelist1.Site__c=site.id;
        linelist1.Product_Name__c='Patch Cord';
        linelist1.Product2Id=prodparent.Id;
        linelist1.Unit_Price__c=customPrice.UnitPrice;
        linelist1.Quantity=2;
        linelist1.Sub_Total__c=linelist1.Quantity*linelist1.Unit_Price__c;
        linelist1.TotalPrice=linelist1.Quantity*linelist1.Unit_Price__c;
        linelist1.Category__c='FAW';
        linelist1.Sub_Category__c='Material Installation';
        linelist1.OpportunityId=opp.id;
        linelist1.SetUp__c = 'Setup';
        insert linelist1; 
        
        OpportunityLineItem linelist2 = new OpportunityLineItem();
        linelist2.Site__c=site.id;
        linelist2.Product_Name__c='Patch Cord';
        linelist2.Product2Id=prodparent.Id;
        linelist2.Unit_Price__c=customPrice.UnitPrice;
        linelist2.Quantity=2;
        linelist2.Sub_Total__c=linelist2.Quantity*linelist2.Unit_Price__c;
        linelist2.TotalPrice=linelist2.Quantity*linelist2.Unit_Price__c;
        linelist2.Category__c='FAW';
        linelist2.Sub_Category__c='Material Installation';
        linelist2.OpportunityId=opp.id;
        linelist2.Filter_Product__c ='Child';
        linelist2.Equipment__c=true;
        linelist2.SetUp__c = 'Setup';
        insert linelist2; 
    }
    @isTest
    public static void ParentTestMethod2(){
        Contact con= new contact();
        con.LastName= 'Test';
        con.MobilePhone= '9898561236';
        con.Email = 'Test@gmail.com';
        insert con;       
        
        
        Product2 prod = new Product2(Name = 'testParent',Family = 'Hardware',Parent__c=true,IsActive=true,Year__c ='All');
        insert prod;
        
        Product2 childprodlst = new Product2(Name = 'testChild',IsActive=true,Year__c ='All',Child__c=true);
        insert childprodlst;
        
        Id standPricebookId = Test.getStandardPricebookId();
        PricebookEntry standardPrice = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = prod.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice;
        PricebookEntry standardPrice1 = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = childprodlst.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice1;
        
        Pricebook2 customPB = new Pricebook2(Name='Custom Pricebook', isActive=true);
        insert customPB;
        
        PricebookEntry customPrice = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = prod.Id,UnitPrice = 12000, IsActive = true);
        insert customPrice;
        PricebookEntry customPrice1 = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = childprodlst.Id,UnitPrice = 12000, IsActive = true);
        insert customPrice1;
        
        UCaaS_Parent_Child__c ParentchildProducts = new UCaaS_Parent_Child__c();
        ParentchildProducts.PowerPhone_provided_by_Frontier__c='true';
        ParentchildProducts.Parent_ID__c=prod.id;
        ParentchildProducts.Child_ID__c=childprodlst.id;
        ParentchildProducts.PoE_provided_by_customer__c='TRUE';
        ParentchildProducts.PoE_provided_by_Frontier__c ='All';
        ParentchildProducts.PowerPhone_provided_by_Frontier__c  ='All';
        ParentchildProducts.Price_Book__c=customPB.id;
        ParentchildProducts.Qty__c=2;
         ParentchildProducts.Types_of_Product__c = 'Frontier Anyware';
        ParentchildProducts.isActive__c = true;
        insert ParentchildProducts;
        
        Opportunity opp=new Opportunity();
        opp.name='TestOpp';
        opp.Contact__c= con.id;
        opp.Contract_Term_Years__c=1;
        opp.CloseDate=System.today();
        opp.StageName='Closed/Won';
        opp.Probability = 10;
        opp.Reason_Won_Lost__c ='Duplicate';
        opp.Company_size__c=5;
        opp.Pricebook2Id=customPB.id;
        opp.Total_NRC__c=2;
        opp.Types_of_Product__c = 'Frontier Anyware';
        insert opp;
        String recordId = opp.id;
        
        Site__c site=new Site__c();
        site.Site_Name__c='SiteTest';
        site.opportunity__c=opp.id;
        site.PoE_option__c='Not PoE';
        site.Primary__c=True;
        insert site;
        
        Equipment__c equipmentlst= new Equipment__c();
        equipmentlst.Equipment__c=true;
        equipmentlst.Site__c=opp.id;
        equipmentlst.Filter_Product__c ='parent';   
        equipmentlst.OpportunityId__c=opp.id;
        equipmentlst.Product__c=prod.id;
        equipmentlst.Product_Name__c=prod.name;   
        //equipmentlst.Child_Product__c=product.id;
        equipmentlst.Quantity__c=2;
        equipmentlst.Unit_Price__c=customPrice.UnitPrice;
        equipmentlst.Total_Price__c=equipmentlst.Quantity__c*equipmentlst.Unit_Price__c;   
        insert equipmentlst;
        
        OpportunityLineItem linelist1 = new OpportunityLineItem();
        linelist1.Site__c=site.id;
        linelist1.Product_Name__c='Patch Cord';
        linelist1.Product2Id=prod.Id;
        linelist1.Unit_Price__c=customPrice.UnitPrice;
        linelist1.Quantity=2;
        linelist1.Sub_Total__c=linelist1.Quantity*linelist1.Unit_Price__c;
        linelist1.TotalPrice=linelist1.Quantity*linelist1.Unit_Price__c;
        linelist1.Category__c='FAW';
        linelist1.Sub_Category__c='Material Installation';
        linelist1.OpportunityId=opp.id;
        linelist1.Filter_Product__c ='child';
        linelist1.Equipment__c=true;
        linelist1.Releted__c = 'child';
        insert linelist1; 
    }
    @isTest
    public static void ParentTestMethod3(){
        Contact con= new contact();
        con.LastName= 'Test';
        con.MobilePhone= '9898561236';
        con.Email = 'Test@gmail.com';
        insert con;       
        
        Product2 prodparent = new Product2(Name = 'testParent',IsActive=true,Year__c ='All', Parent__c=true);
        insert prodparent;
        
        Product2 childprodlst = new Product2(Name = 'testChild',IsActive=true,Year__c ='All',Child__c=true, PoE_provided_by_customer__c='All');                                          
        insert childprodlst;
        
        Id standPricebookId = Test.getStandardPricebookId();
        PricebookEntry standardPrice = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = prodparent.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice;
        PricebookEntry standardPrice1 = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = childprodlst.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice1;
        
        Pricebook2 customPB = new Pricebook2(Name='Custom Pricebook', isActive=true);
        insert customPB;
        
        PricebookEntry priceEntrylist = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = prodparent.Id,UnitPrice = 12000, IsActive = true);
        insert priceEntrylist;
         PricebookEntry priceEntrylist1 = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = childprodlst.Id,UnitPrice = 12000, IsActive = true);
        insert priceEntrylist1;
        
        
        UCaaS_Parent_Child__c ParentchildProducts=new UCaaS_Parent_Child__c();
        ParentchildProducts.PowerPhone_provided_by_Frontier__c='true';
        ParentchildProducts.Parent_ID__c=prodparent.id;
        ParentchildProducts.Child_ID__c=childprodlst.id;
        ParentchildProducts.PoE_provided_by_customer__c='TRUE';
        ParentchildProducts.PoE_provided_by_Frontier__c ='All';
        ParentchildProducts.PowerPhone_provided_by_Frontier__c  ='All';
        ParentchildProducts.Price_Book__c=customPB.id;
        ParentchildProducts.Qty__c=2;
         ParentchildProducts.Types_of_Product__c = 'Frontier Anyware';
        ParentchildProducts.isActive__c = true;
        insert ParentchildProducts;
         
        Opportunity opp=new Opportunity();
        opp.name='TestOpp';
        opp.Contact__c= con.id;
        opp.Contract_Term_Years__c=1;
        opp.CloseDate=System.today();
        opp.StageName='Closed/Won';
        opp.Probability = 10;
        opp.Reason_Won_Lost__c ='Duplicate';
        opp.Company_size__c=5;
        opp.Pricebook2Id=customPB.id;
        opp.Total_NRC__c=2;
        opp.Types_of_Product__c = 'Frontier Anyware';
        insert opp;
        String recordId = opp.id;
        
        Site__c site=new Site__c();
        site.Site_Name__c='SiteTest';
        site.opportunity__c=opp.id;
        site.PoE_option__c='Customer Provided';
        site.Primary__c=True;
        insert site;
         
        OpportunityLineItem linelist1 = new OpportunityLineItem();
        linelist1.Site__c=site.id;
        linelist1.Product_Name__c='Patch Cord';
        linelist1.Product2Id=prodparent.Id;
        linelist1.Unit_Price__c=priceEntrylist.UnitPrice;
        linelist1.Quantity=2;
        linelist1.Sub_Total__c=linelist1.Quantity*linelist1.Unit_Price__c;
        linelist1.TotalPrice=linelist1.Quantity*linelist1.Unit_Price__c;
        linelist1.Category__c='FAW';
        linelist1.Sub_Category__c='Post Warranty Maintenance';
        linelist1.OpportunityId=opp.id;
        linelist1.Filter_Product__c ='child';
        linelist1.Equipment__c=true;
        linelist1.Releted__c = 'child';
        insert linelist1; 
    }
    @isTest
    public static void ParentTestMethod4(){
       
        Contact con= new contact();
        con.LastName= 'Test';
        con.MobilePhone= '9898561236';
        con.Email = 'Test@gmail.com';
        insert con;       
        
        Product2 prodparent = new Product2(Name ='testParent',IsActive=true,Year__c ='All', Parent__c=true);
        insert prodparent;
        
        Product2 prod = new Product2(Name = 'Laptop',IsActive=true,Year__c ='All', Parent__c=true);
        insert prod;
        
        Product2 childprodlst = new Product2(Name = 'testChild',IsActive=true,Year__c ='All',Child__c=true);
        insert childprodlst;
        System.debug('&&&Product2&&&'+childprodlst);
        
        Id standPricebookId = Test.getStandardPricebookId();
        PricebookEntry standardPrice = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = prodparent.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice;
        PricebookEntry standardPrice2 = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = prod.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice2;
        PricebookEntry standardPrice3 = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = childprodlst.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice3;
        
        Pricebook2 customPB = new Pricebook2(Name='Custom Pricebook', isActive=true);
        insert customPB;
        
        PricebookEntry priceEntrylist = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = prodparent.Id,UnitPrice = 12000, IsActive = true);
        insert priceEntrylist;
        PricebookEntry priceEntrylist2 = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = prod.Id,UnitPrice = 12000, IsActive = true);
        insert priceEntrylist2;
         PricebookEntry priceEntrylist3 = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = childprodlst.Id,UnitPrice = 12000, IsActive = true);
        insert priceEntrylist3;
        
          
        UCaaS_Parent_Child__c ParentchildProducts=new UCaaS_Parent_Child__c();
        ParentchildProducts.PowerPhone_provided_by_Frontier__c='true';
        ParentchildProducts.Parent_ID__c=prodparent.id;
        ParentchildProducts.Child_ID__c=childprodlst.id;
        ParentchildProducts.PoE_provided_by_customer__c='TRUE';
        ParentchildProducts.PoE_provided_by_Frontier__c ='All';
        ParentchildProducts.PowerPhone_provided_by_Frontier__c  ='All';
        ParentchildProducts.Price_Book__c=customPB.id;
        ParentchildProducts.Qty__c=2;
         ParentchildProducts.Types_of_Product__c = 'Frontier Anyware';
        ParentchildProducts.isActive__c = true;
        insert ParentchildProducts;
          
        Product_Linkage__c linkagelist=new Product_Linkage__c();
        linkagelist.Product_Name__c=prodparent.id;
        linkagelist.Product_Name_Setup__c=childprodlst.id;
        insert linkagelist;  
        
        Opportunity opp=new Opportunity();
        opp.name='TestOpp';
        opp.Contact__c= con.id;
        opp.Contract_Term_Years__c=1;
        opp.CloseDate=System.today();
        opp.StageName='Closed/Won';
        opp.Probability = 10;
        opp.Reason_Won_Lost__c ='Duplicate';
        opp.Company_size__c=5;
        opp.Pricebook2Id=customPB.id;
        opp.Types_of_Product__c = 'Frontier Anyware';
        opp.Total_NRC__c=2;
        insert opp;
        String recordId = opp.id;
        
        Site__c site=new Site__c();
        site.Site_Name__c='SiteTest';
        site.opportunity__c=opp.id;
        site.PoE_option__c='Customer Provided';
        site.Primary__c=True;
        insert site;
        
        Equipment__c equipmentlst= new Equipment__c();
        equipmentlst.Equipment__c=true;
        equipmentlst.Site__c=opp.id;
        equipmentlst.Filter_Product__c ='parent';   
        equipmentlst.OpportunityId__c=opp.id;
        equipmentlst.Product__c=prodparent.id;
        equipmentlst.Product_Name__c=prodparent.name;   
        //equipmentlst.Child_Product__c=product.id;
        equipmentlst.Quantity__c=2;
        equipmentlst.Unit_Price__c=priceEntrylist.UnitPrice;
        equipmentlst.Total_Price__c=equipmentlst.Quantity__c*equipmentlst.Unit_Price__c;   
        insert equipmentlst;
        
        User usr=new User();
        usr.Id=opp.OwnerId;
        
        OpportunityLineItem linelist = new OpportunityLineItem();
        linelist.Site__c=site.id;
        linelist.Product_Name__c='Patch Cord';
        linelist.Product2Id=prodparent.Id;
        linelist.Unit_Price__c=priceEntrylist2.UnitPrice;
        linelist.Quantity=2;
        linelist.Sub_Total__c=linelist.Quantity*linelist.Unit_Price__c;
        linelist.TotalPrice=linelist.Quantity*linelist.Unit_Price__c;
        linelist.Category__c='FAW';
        linelist.Sub_Category__c='Post Warranty Maintenance';
        linelist.OpportunityId=opp.id;
        linelist.Filter_Product__c ='Parent';
        linelist.Equipment__c=true;
        linelist.Type_of_Billing__c = 'MRC';
        linelist.Releted__c = 'child';
        insert linelist; 
        
        OpportunityLineItem linelist1 = new OpportunityLineItem();
        linelist1.Site__c=site.id;
        linelist1.Product_Name__c='Patch Cord';
        linelist1.Product2Id=prod.Id;
        linelist1.Unit_Price__c=priceEntrylist2.UnitPrice;
        linelist1.Quantity=2;
        linelist1.Sub_Total__c=linelist1.Quantity*linelist1.Unit_Price__c;
        linelist1.TotalPrice=linelist1.Quantity*linelist1.Unit_Price__c;
        linelist1.Category__c='FAW';
        linelist1.Sub_Category__c='Post Warranty Maintenance';
        linelist1.OpportunityId=opp.id;
        linelist1.Filter_Product__c ='Parent';
        linelist1.Equipment__c=true;
        linelist1.Type_of_Billing__c = 'MRC';
        linelist1.Releted__c = 'child';
        insert linelist1; 
        }
    @isTest
    public static void ParentTestMethod5(){
         
        Contact con= new contact();
        con.LastName= 'Test';
        con.MobilePhone= '9898561236';
        con.Email = 'Test@gmail.com';
        insert con;       
        
        Product2 prodparent = new Product2(Name = 'testParent',IsActive=true,Year__c ='All', Parent__c=true);
        insert prodparent;
        Product2 prod = new Product2(Name = 'testParent',IsActive=true,Year__c ='All', Parent__c=true);
        insert prod;
        
        Product2 childprodlst = new Product2(Name = 'testChild',IsActive=true,Year__c ='All',Child__c=true,Maintenance_Universal__c =true);
        insert childprodlst;
        
        Id standPricebookId = Test.getStandardPricebookId();
        PricebookEntry standardPrice = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = prodparent.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice;
        PricebookEntry standardPrice2 = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = prod.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice2;
         PricebookEntry standardPrice3 = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = childprodlst.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice3;

        
        Pricebook2 customPB = new Pricebook2(Name='Custom Pricebook', isActive=true);
        insert customPB;
        
        PricebookEntry priceEntrylist = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = prodparent.Id,UnitPrice = 12000, IsActive = true);
        insert priceEntrylist;
        PricebookEntry priceEntrylist2 = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = prod.Id,UnitPrice = 12000, IsActive = true);
        insert priceEntrylist2;
        PricebookEntry priceEntrylist3 = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = childprodlst.Id,UnitPrice = 12000, IsActive = true);
        insert priceEntrylist3;
        
        UCaaS_Parent_Child__c ParentchildProducts=new UCaaS_Parent_Child__c();
        ParentchildProducts.PowerPhone_provided_by_Frontier__c='true';
        ParentchildProducts.Parent_ID__c=prodparent.Id;
        ParentchildProducts.Child_ID__c=childprodlst.id;
        ParentchildProducts.PoE_provided_by_customer__c='TRUE';
        ParentchildProducts.PoE_provided_by_Frontier__c ='All';
        ParentchildProducts.Qty__c=2;
        ParentchildProducts.Types_of_Product__c = 'Frontier Anyware';
        ParentchildProducts.isActive__c =true;
        insert ParentchildProducts;
        
         
        Product_Linkage__c linkagelist=new Product_Linkage__c();
        linkagelist.Product_Name__c=prodparent.id;
        linkagelist.Product_Name_Setup__c=childprodlst.id;
        insert linkagelist; 
        
        Opportunity opp=new Opportunity();
        opp.name='TestOpp';
        opp.Contact__c= con.id;
        opp.Contract_Term_Years__c=1;
        opp.CloseDate=System.today();
        opp.StageName='Closed/Won';
        opp.Probability = 10;
        opp.Reason_Won_Lost__c ='Duplicate';
        opp.Company_size__c=5;
        opp.Pricebook2Id=customPB.id;
        opp.Total_NRC__c=2;
        opp.Types_of_Product__c = 'Frontier Anyware';
        insert opp;
        
        String recordId = opp.id;
        
        Site__c site=new Site__c();
        site.Site_Name__c='SiteTest';
        site.opportunity__c=opp.id;
        site.PoE_option__c='Customer Provided';
        site.Primary__c=True;
        insert site;
        
        Equipment__c equipmentlst= new Equipment__c();
        equipmentlst.Equipment__c=true;
        equipmentlst.Site__c=opp.id;
        equipmentlst.Filter_Product__c ='parent';   
        equipmentlst.Product__c=prodparent.id;
        equipmentlst.Product_Name__c=prodparent.name;   
        equipmentlst.Quantity__c=2;
        equipmentlst.Unit_Price__c=priceEntrylist.UnitPrice;
        equipmentlst.Total_Price__c=equipmentlst.Quantity__c*equipmentlst.Unit_Price__c;   
        insert equipmentlst;
        
        User usr=new User();
        usr.Id=opp.OwnerId;
        
        OpportunityLineItem linelist = new OpportunityLineItem();
        linelist.Site__c=site.id;
        linelist.Product_Name__c='Patch Cord';
        linelist.Product2Id=prodparent.Id;
        linelist.Unit_Price__c=priceEntrylist.UnitPrice;
        linelist.Quantity=2;
        linelist.Sub_Total__c=linelist.Quantity*linelist.Unit_Price__c;
        linelist.TotalPrice=linelist.Quantity*linelist.Unit_Price__c;
        linelist.Category__c='FAW';
        linelist.Sub_Category__c='Post Warranty Maintenance';
        linelist.OpportunityId=opp.id;
        linelist.Filter_Product__c ='Parent';
        linelist.Equipment__c=true;
        linelist.Type_of_Billing__c = 'MRC';
        linelist.Releted__c = 'child';
        insert linelist; 
         
    }
    @isTest
    public static void ParentTestMethod6(){
        Contact con= new contact();
        con.LastName= 'Test';
        con.MobilePhone= '9898561236';
        con.Email = 'Test@gmail.com';
        insert con;       
        
        Product2 prodparent = new Product2(Name = 'testParent',IsActive=true,Year__c ='All', Parent__c=true);
        insert prodparent;
        
        Product2 childprodlst = new Product2(Name = 'testChild',IsActive=true,Year__c ='All',Child__c=true);
        insert childprodlst;
        
        Id standPricebookId = Test.getStandardPricebookId();
        PricebookEntry standardPrice = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = prodparent.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice;
        PricebookEntry standardPrice2 = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = childprodlst.Id,UnitPrice = 10000, IsActive = true,Type_of_Billing__c = 'MRC');
        insert standardPrice2;
        
        Pricebook2 customPB = new Pricebook2(Name='Custom Pricebook', isActive=true);
        insert customPB;
        
        PricebookEntry priceEntrylist = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = prodparent.Id,UnitPrice = 12000, IsActive = true);
        insert priceEntrylist;
        PricebookEntry priceEntrylist2 = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = childprodlst.Id,UnitPrice = 12000, IsActive = true,Type_of_Billing__c = 'MRC');
        insert priceEntrylist2;
        
        Product_Linkage__c linkagelist=new Product_Linkage__c();
        linkagelist.Product_Name__c=prodparent.Id;
        linkagelist.Product_Name_Setup__c=prodparent.Id;
        insert linkagelist; 
        
        UCaaS_Parent_Child__c ParentchildProducts=new UCaaS_Parent_Child__c();
        ParentchildProducts.PowerPhone_provided_by_Frontier__c='true';
        ParentchildProducts.Parent_ID__c=prodparent.Id;
        ParentchildProducts.Child_ID__c=childprodlst.id;
        ParentchildProducts.PoE_provided_by_customer__c='TRUE';
        ParentchildProducts.PoE_provided_by_Frontier__c ='All';
        ParentchildProducts.Qty__c=2;
         ParentchildProducts.Types_of_Product__c = 'Frontier Anyware';
        ParentchildProducts.isActive__c = true;
        insert ParentchildProducts;
        
        Opportunity opp=new Opportunity();
        opp.name='TestOpp';
        opp.Contact__c= con.id;
        opp.Contract_Term_Years__c=1;
        opp.CloseDate=System.today();
        opp.StageName='Closed/Won';
        opp.Probability = 10;
        opp.Reason_Won_Lost__c ='Duplicate';
        opp.Company_size__c=5;
        opp.Pricebook2Id=customPB.id;
        opp.Types_of_Product__c = 'Frontier Anyware';
        
        opp.Total_NRC__c=2;
        insert opp;
        String recordId = opp.id;
        
        Site__c site=new Site__c();
        site.Site_Name__c='SiteTest';
        site.opportunity__c=opp.id;
        site.PoE_option__c='Customer Provided';
        site.Primary__c=True;
        insert site;
        
        Equipment__c equipmentlst= new Equipment__c();
        equipmentlst.Equipment__c=true;
        equipmentlst.Site__c=opp.id;
        equipmentlst.Filter_Product__c ='parent';   
        equipmentlst.Product__c=prodparent.id;
        equipmentlst.Product_Name__c=prodparent.name;   
        equipmentlst.Quantity__c=2;
        equipmentlst.Unit_Price__c=priceEntrylist.UnitPrice;
        equipmentlst.Total_Price__c=equipmentlst.Quantity__c*equipmentlst.Unit_Price__c;   
        insert equipmentlst;
        
        OpportunityLineItem linelist = new OpportunityLineItem();
        linelist.Site__c=site.id;
        linelist.Product_Name__c='Patch Cord';
        linelist.Product2Id=prodparent.Id;
        linelist.Unit_Price__c=priceEntrylist.UnitPrice;
        linelist.Quantity=2;
        linelist.Sub_Total__c=linelist.Quantity*linelist.Unit_Price__c;
        linelist.TotalPrice=linelist.Quantity*linelist.Unit_Price__c;
        linelist.Category__c='FAW';
        linelist.Sub_Category__c='Post Warranty Maintenance';
        linelist.OpportunityId=opp.id;
        linelist.Filter_Product__c ='Parent';
        linelist.Equipment__c=true;
        linelist.Type_of_Billing__c = 'MRC';
        linelist.Releted__c = 'child';
        insert linelist; 
    }
    
    @isTest
    public static void ParentTestMethod7(){
        
        Contact con= new contact();
        con.LastName= 'Test';
        con.MobilePhone= '9898561236';
        con.Email = 'Test@gmail.com';
        insert con;       
        
        Product2 prodparent = new Product2(Name = 'StreamLine Unit Bundle - 48 port',IsActive=true,Year__c ='All', Parent__c=true,
                                           Equipment__c=true );
        insert prodparent;
        
        Product2 childprodlst = new Product2(Name = '50 Port System Harness',IsActive=true,Year__c ='All',Child__c=true,
                                             Part_Number_of_Product__c='51300751',Equipment__c=true
                                            );
        insert childprodlst;
        Id standPricebookId = Test.getStandardPricebookId();
        PricebookEntry standardPrice = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = prodparent.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice;
        PricebookEntry standardPrice1= new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = childprodlst.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice1;
        Pricebook2 customPB = new Pricebook2(Name='Custom Pricebook', isActive=true);
        insert customPB;
        
        UCaaS_Parent_Child__c ParentchildProducts=new UCaaS_Parent_Child__c();
        ParentchildProducts.PowerPhone_provided_by_Frontier__c='true';
        ParentchildProducts.Parent_ID__c=  prodparent.Id;
        ParentchildProducts.Child_ID__c=childprodlst.id;
        ParentchildProducts.Types_of_Product__c = 'Smart Voice';
        ParentchildProducts.isActive__c = true;
        insert ParentchildProducts;
        
        Opportunity opp=new Opportunity();
        opp.name='TestOpp';
        opp.Contact__c= con.id;
        opp.Contract_Term_Years__c=1;
        opp.CloseDate=System.today();
        opp.StageName='Closed/Won';
        opp.Probability = 10;
        opp.Reason_Won_Lost__c ='Duplicate'; 
        opp.Company_size__c=5;
        opp.Pricebook2Id=customPB.id;
        opp.Types_of_Product__c = 'Smart Voice';
        insert opp;
        String recordId = opp.id;
        
        
        PricebookEntry priceEntrylist = new PricebookEntry(Pricebook2Id =opp.Pricebook2Id, Product2Id = prodparent.Id,UnitPrice = 12000, IsActive = true);
        insert priceEntrylist;
        
        PricebookEntry priceEntrylist1 = new PricebookEntry(Pricebook2Id =opp.Pricebook2Id, Product2Id = childprodlst.Id,UnitPrice = 12000, IsActive = true);
        insert priceEntrylist1;
        
        Site__c site=new Site__c();
        site.Site_Name__c='SiteTest';
        site.opportunity__c=opp.id;
        site.PoE_option__c='Customer Provided';
        site.Primary__c=True;
        insert site;
        
        OpportunityLineItem linelist1 = new OpportunityLineItem();
        linelist1.Site__c=site.id;
        linelist1.Product_Name__c=prodparent.name;
        linelist1.Product2Id=prodparent.Id;
        linelist1.Unit_Price__c=priceEntrylist.UnitPrice;
        linelist1.Quantity=2;
        linelist1.Sub_Total__c=linelist1.Quantity*linelist1.Unit_Price__c;
        linelist1.TotalPrice=linelist1.Quantity*linelist1.Unit_Price__c;
        linelist1.Category__c='Smart Voice';
        linelist1.OpportunityId=opp.id;
        linelist1.Filter_Product__c ='parent';
        linelist1.Equipment__c=true;
        linelist1.Parent_ID__c='ParentId';
        linelist1.Type_of_Billing__c='MRC';
        insert linelist1;
    }
}