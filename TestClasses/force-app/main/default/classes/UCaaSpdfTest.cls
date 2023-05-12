@isTest
public class UCaaSpdfTest {
    
    @isTest
    public static void UCaaSpdfTestMethod1(){
        Test.startTest();
        Contact con= new contact();
        con.LastName= 'Test';
        con.MobilePhone= '9898561236';
        con.Phone= '9898561236';
        con.Email = 'Test@gmail.com';
        insert con;       
        
        Product2 prod = new Product2(Name = 'Elite User 1 Yr',Family = 'FAW',Product_Subcategory__c='Licenses',Parent__c=true,Equipment__c =false);
        insert prod;
        
        Id standPricebookId = Test.getStandardPricebookId();
        PricebookEntry standardPrice = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = prod.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice;
        
        Pricebook2 customPB = new Pricebook2(Name='Custom Pricebook', isActive=true);
        insert customPB;
        
        PricebookEntry customPrice = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = prod.Id,UnitPrice = 12000, IsActive = true,Type_of_Billing__c = 'MRC');
        insert customPrice;
        
        Product2 prod1 = new Product2(Name = 'Toll Free Numbers',Family = 'FAW',Product_Subcategory__c='Add-On',Parent__c=true,Equipment__c =false);
        insert prod1;
        
        PricebookEntry standardPrice1 = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = prod1.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice1;
        
        PricebookEntry customPrice1 = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = prod1.Id,UnitPrice = 12000, IsActive = true,Type_of_Billing__c = 'MRC');
        insert customPrice1;
        
        Product2 prod2 = new Product2(Name = 'Toll Free Numbers',Family = 'FAW',Product_Subcategory__c='Toll Free Bundle Minutes',Parent__c=true,Equipment__c =false);
        insert prod2;
        
        PricebookEntry standardPrice2 = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = prod2.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice2;
        
        PricebookEntry customPrice2 = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = prod2.Id,UnitPrice = 12000, IsActive = true,Type_of_Billing__c = 'MRC');
        insert customPrice2;
        
        Product2 prod3 = new Product2(Name = '6920 IP Phone',Family = 'FAW',Product_Subcategory__c='IP Phones',Parent__c=true,Equipment__c =true);
        insert prod3;
        
        PricebookEntry standardPrice3 = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = prod3.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice3;
        
        PricebookEntry customPrice3 = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = prod3.Id,UnitPrice = 12000, IsActive = true,Type_of_Billing__c = 'MRC');
        insert customPrice3;
        
        Product2 prod4 = new Product2(Name = '69Xx Series Pkm',Family = 'FAW',Product_Subcategory__c='Accessories',Parent__c=true,Equipment__c =true);
        insert prod4;
        
        PricebookEntry standardPrice4 = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = prod4.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice4;
        
        PricebookEntry customPrice4 = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = prod4.Id,UnitPrice = 12000, IsActive = true,Type_of_Billing__c = 'MRC');
        insert customPrice4; 
        
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
        OpportunityLineItem licensesItemList = new OpportunityLineItem();
        licensesItemList.Site__c=site.id;
        licensesItemList.Product_Name__c=prod.Name;
        licensesItemList.Product2Id=prod.Id;
        licensesItemList.Unit_Price__c=customPrice.UnitPrice;
        licensesItemList.Quantity=2;
        licensesItemList.Sub_Total__c=licensesItemList.Quantity*licensesItemList.Unit_Price__c;
        licensesItemList.TotalPrice=licensesItemList.Quantity*licensesItemList.Unit_Price__c;
        licensesItemList.Category__c=prod.Family;
        licensesItemList.Sub_Category__c=prod.Product_Subcategory__c;
        licensesItemList.OpportunityId=opp.id;
        licensesItemList.Filter_Product__c ='Parent';
        licensesItemList.Site_Number__c=site.Site_Number__c;
        licensesItemList.Type_of_Billing__c =customPrice.Type_of_Billing__c; 
        licensesItemList.Equipment__c=prod.Equipment__c;
        opplst.add(licensesItemList);
        
        OpportunityLineItem tollList = new OpportunityLineItem();
        tollList.Product_Name__c=prod2.Name;
        tollList.Product2Id=prod2.Id;
        tollList.Unit_Price__c=customPrice2.UnitPrice;
        tollList.Quantity=2;
        tollList.Sub_Total__c=tollList.Quantity*tollList.Unit_Price__c;
        tollList.TotalPrice=tollList.Quantity*tollList.Unit_Price__c;
        tollList.Category__c=prod2.Family;
        tollList.Sub_Category__c=prod2.Product_Subcategory__c;
        tollList.OpportunityId=opp.id;
        tollList.Filter_Product__c ='Parent';
        tollList.Type_of_Billing__c =customPrice2.Type_of_Billing__c; 
        tollList.Equipment__c=prod2.Equipment__c;
        opplst.add(tollList);    
        
        OpportunityLineItem accessoriesItemList = new OpportunityLineItem();
        accessoriesItemList.Site__c=site.id;
        accessoriesItemList.Product_Name__c='E911';
        accessoriesItemList.Product2Id=prod1.Id;
        accessoriesItemList.Unit_Price__c=customPrice1.UnitPrice;
        accessoriesItemList.Quantity=2;
        accessoriesItemList.Sub_Total__c=accessoriesItemList.Quantity*accessoriesItemList.Unit_Price__c;
        accessoriesItemList.TotalPrice=accessoriesItemList.Quantity*accessoriesItemList.Unit_Price__c;
        accessoriesItemList.Category__c='FAW';
        accessoriesItemList.Sub_Category__c='Accessories';
        accessoriesItemList.OpportunityId=opp.id;
        accessoriesItemList.Filter_Product__c ='Parent';
        accessoriesItemList.Type_of_Billing__c = 'MRC';
        accessoriesItemList.Equipment__c=true;
        accessoriesItemList.Site_Number__c=2;
        opplst.add(accessoriesItemList);   
        
        
        OpportunityLineItem setUpList = new OpportunityLineItem();
        setUpList.Site__c=site.id;
        setUpList.Product_Name__c='Elite';
        setUpList.Unit_Price__c=customPrice3.UnitPrice;
        setUpList.Quantity=2;
        setUpList.Sub_Total__c=setUpList.Quantity*setUpList.Unit_Price__c;
        setUpList.TotalPrice=setUpList.Quantity*setUpList.Unit_Price__c;       
        setUpList.Product2Id=prod3.Id;
        setUpList.Category__c='FAW';
        setUpList.Sub_Category__c='Write In Part';
        setUpList.OpportunityId=opp.id;
        setUpList.Filter_Product__c ='Child';
        setUpList.SetUp__c = 'Setup' ;
        setUpList.Equipment__c=true;
        setUpList.Site_Number__c=2;
        setUpList.Type_of_Billing__c = 'MRC'; 
        opplst.add(setUpList);   
        
        
        OpportunityLineItem eliteOppnrc = new OpportunityLineItem();
        eliteOppnrc.Site__c=site.id;
        eliteOppnrc.Product_Name__c='Premier';
        eliteOppnrc.Product2Id=prod4.Id;
        eliteOppnrc.Unit_Price__c=customPrice4.UnitPrice;
        eliteOppnrc.Quantity=2;
        eliteOppnrc.Sub_Total__c=eliteOppnrc.Quantity*eliteOppnrc.Unit_Price__c;
        eliteOppnrc.TotalPrice=eliteOppnrc.Quantity*eliteOppnrc.Unit_Price__c;
        eliteOppnrc.Category__c='FAW';
        eliteOppnrc.Sub_Category__c='Licenses';
        eliteOppnrc.OpportunityId=opp.id;
        eliteOppnrc.Filter_Product__c ='Parent';
        eliteOppnrc.Site_Number__c=2;
        opplst.add(eliteOppnrc);   
        
        
        ApexPages.StandardController sc = new ApexPages.standardController(opp); 
        ApexPages.currentPage().getParameters().put('id',opp.id);
        UCaaSpdf ucsObj=new UCaaSpdf(sc);
        ucsObj.updateOpp();
        ucsObj.attachDocument();
        Test.stopTest();
        
    }
    
    @isTest
    public static void UCaaSMethod(){
        Test.startTest();
        Contact con= new contact();
        con.LastName= 'Test';
        con.Phone= '9898561236';
        con.Email = 'Test@gmail.com';
        insert con;       
        
        Product2 prod = new Product2(Name = 'Elite User 1 Yr',Family = 'FAW',Product_Subcategory__c='Licenses',Parent__c=true,Equipment__c =false);
        insert prod;
        
        Id standPricebookId = Test.getStandardPricebookId();
        PricebookEntry standardPrice = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = prod.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice;
        
        Pricebook2 customPB = new Pricebook2(Name='Custom Pricebook', isActive=true);
        insert customPB;
        
        PricebookEntry customPrice = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = prod.Id,UnitPrice = 12000, IsActive = true,Type_of_Billing__c = 'NRC');
        insert customPrice;
        
        
        Product2 prod1 = new Product2(Name = 'Premier User 1 Yr',Family = 'FAW',Product_Subcategory__c='Licenses',Parent__c=true,Equipment__c =false);
        insert prod1;
        PricebookEntry standardPrice1 = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = prod1.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice1;
        PricebookEntry customPrice1 = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = prod1.Id,UnitPrice = 12000, IsActive = true,Type_of_Billing__c = 'NRC');
        insert customPrice1;
        
        Product2 prod2 = new Product2(Name = 'Outbound User 1 Yr',Family = 'FAW',Product_Subcategory__c='Licenses',Parent__c=true,Equipment__c =false);
        insert prod2;
        PricebookEntry standardPrice2 = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = prod2.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice2;
        PricebookEntry customPrice2 = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = prod2.Id,UnitPrice = 12000, IsActive = true,Type_of_Billing__c = 'NRC');
        insert customPrice2;
        
        Product2 prod3 = new Product2(Name = 'Essentials User 1 Yr',Family = 'FAW',Product_Subcategory__c='Licenses',Parent__c=true,Equipment__c =false);
        insert prod3;
        PricebookEntry standardPrice3 = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = prod3.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice3;
        PricebookEntry customPrice3 = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = prod3.Id,UnitPrice = 12000, IsActive = true,Type_of_Billing__c = 'NRC');
        insert customPrice3;
        
        Product2 prod4 = new Product2(Name = 'Web Fax',Family = 'FAW',Product_Subcategory__c='Add-On',Parent__c=true,Equipment__c =false);
        insert prod4;
        PricebookEntry standardPrice4 = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = prod4.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice4;
        PricebookEntry customPrice4 = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = prod4.Id,UnitPrice = 12000, IsActive = true,Type_of_Billing__c = 'NRC');
        insert customPrice4;
        
        Product2 prod5 = new Product2(Name = 'Elite Set Up',Family = 'FAW',Product_Subcategory__c='Activation Charges',Child__c=true,Equipment__c =false);
        insert prod5;
        PricebookEntry standardPrice5 = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = prod5.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice5;
        PricebookEntry customPrice5 = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = prod5.Id,UnitPrice = 12000, IsActive = true,Type_of_Billing__c = 'NRC');
        insert customPrice5;
        
        Product2 prod6 = new Product2(Name = 'Toll Free Number',Family = 'FAW',Product_Subcategory__c='Add-On',child__c=true,Equipment__c =false);
        insert prod6;
        PricebookEntry standardPrice6 = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = prod6.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice6;
        PricebookEntry customPrice6 = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = prod6.Id,UnitPrice = 12000, IsActive = true,Type_of_Billing__c = 'NRC');
        insert customPrice6;
        
        Product2 prod7 = new Product2(Name = 'E911',Family = 'FAW',Product_Subcategory__c='Add-On',child__c=true,Equipment__c =false);
        insert prod7;
        PricebookEntry standardPrice7 = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = prod7.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice7;
        PricebookEntry customPrice7 = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = prod7.Id,UnitPrice = 12000, IsActive = true,Type_of_Billing__c = 'NRC');
        insert customPrice7;
        
        
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
        OpportunityLineItem licensesItemList = new OpportunityLineItem();
        licensesItemList.Site__c=site.id;
        licensesItemList.Product_Name__c=prod.Name;
        licensesItemList.Product2Id=prod.Id;
        licensesItemList.Unit_Price__c=customPrice.UnitPrice;
        licensesItemList.Quantity=2;
        licensesItemList.Sub_Total__c=licensesItemList.Quantity*licensesItemList.Unit_Price__c;
        licensesItemList.TotalPrice=licensesItemList.Quantity*licensesItemList.Unit_Price__c;
        licensesItemList.Category__c=prod.Family;
        licensesItemList.Sub_Category__c=prod.Product_Subcategory__c;
        licensesItemList.OpportunityId=opp.id;
        licensesItemList.Filter_Product__c ='Parent';
        licensesItemList.Site_Number__c=site.Site_Number__c;
        licensesItemList.Type_of_Billing__c =customPrice.Type_of_Billing__c; 
        licensesItemList.Equipment__c=prod.Equipment__c;
        licensesItemList.isElite__c = true;
        licensesItemList.isPremier__c = true;
        licensesItemList.isOutbound__c = true;
        licensesItemList.isEssential__c = true;
        opplst.add(licensesItemList);
        
        OpportunityLineItem eliteOppmrc = new OpportunityLineItem();
        eliteOppmrc.Site__c=site.id;
        eliteOppmrc.Product_Name__c=prod.Name;
        eliteOppmrc.Product2Id=prod.Id;
        eliteOppmrc.Unit_Price__c=customPrice.UnitPrice;
        eliteOppmrc.Quantity=2;
        eliteOppmrc.Sub_Total__c=eliteOppmrc.Quantity*eliteOppmrc.Unit_Price__c;
        eliteOppmrc.TotalPrice=eliteOppmrc.Quantity*eliteOppmrc.Unit_Price__c;
        eliteOppmrc.Category__c=prod.Family;
        eliteOppmrc.Sub_Category__c=prod.Product_Subcategory__c;
        eliteOppmrc.OpportunityId=opp.id;
        eliteOppmrc.Filter_Product__c ='Parent';
        eliteOppmrc.Site_Number__c=site.Site_Number__c;
        eliteOppmrc.Type_of_Billing__c =customPrice.Type_of_Billing__c; 
        eliteOppmrc.Equipment__c=prod.Equipment__c;
        eliteOppmrc.isElite__c = true;
        eliteOppmrc.isPremier__c = true;
        eliteOppmrc.isOutbound__c = true;
        eliteOppmrc.isEssential__c = true;
        opplst.add(eliteOppmrc);
        
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
        opplst.add(webFaxList1);
        
        OpportunityLineItem webFaxList11 = new OpportunityLineItem();
        webFaxList11.Site__c=site.id;
        webFaxList11.Product_Name__c=prod4.Name;
        webFaxList11.Product2Id=prod4.Id;
        webFaxList11.Unit_Price__c=customPrice4.UnitPrice;
        webFaxList11.Quantity=2;
        webFaxList11.Sub_Total__c=webFaxList11.Quantity*webFaxList11.Unit_Price__c;
        webFaxList11.TotalPrice=webFaxList11.Quantity*webFaxList11.Unit_Price__c;
        webFaxList11.Category__c=prod4.Family;
        webFaxList11.Sub_Category__c=prod4.Product_Subcategory__c;
        webFaxList11.OpportunityId=opp.id;
        webFaxList11.Filter_Product__c ='Parent';
        webFaxList11.Type_of_Billing__c =customPrice4.Type_of_Billing__c; 
        webFaxList11.Equipment__c=prod4.Equipment__c;
        opplst.add(webFaxList11);
        
        
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
        eliteSetup.Equipment__c=prod4.Equipment__c;
        //eliteSetup.Releted__c = 'child';
        eliteSetup.isElite__c = true;
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
        //eliteSetup1.Releted__c = 'child';
        eliteSetup1.Site_Number__c=site.Site_Number__c;
        eliteSetup1.Type_of_Billing__c =customPrice5.Type_of_Billing__c; 
        eliteSetup1.Equipment__c=prod4.Equipment__c;
        eliteSetup1.isPremier__c = true;
        opplst.add(eliteSetup1);
        OpportunityLineItem eliteSetup11 = new OpportunityLineItem();
        eliteSetup11.Site__c=site.id;
        eliteSetup11.Product_Name__c=prod5.Name;
        eliteSetup11.Product2Id=prod5.Id;
        eliteSetup11.Unit_Price__c=customPrice5.UnitPrice;
        eliteSetup11.Quantity=2;
        eliteSetup11.Sub_Total__c=eliteSetup1.Quantity*eliteSetup1.Unit_Price__c;
        eliteSetup11.TotalPrice=eliteSetup1.Quantity*eliteSetup1.Unit_Price__c;
        eliteSetup11.Category__c=prod5.Family;
        eliteSetup11.Sub_Category__c=prod5.Product_Subcategory__c;
        eliteSetup11.OpportunityId=opp.id;
        eliteSetup11.Filter_Product__c ='Child';
        eliteSetup11.SetUp__c = 'Setup';
        //eliteSetup1.Releted__c = 'child';
        eliteSetup11.Site_Number__c=site.Site_Number__c;
        eliteSetup11.Type_of_Billing__c =customPrice5.Type_of_Billing__c; 
        eliteSetup11.Equipment__c=prod4.Equipment__c;
        eliteSetup11.isEssential__c = true;
        opplst.add(eliteSetup11);
        OpportunityLineItem eliteSetup1a = new OpportunityLineItem();
        eliteSetup1a.Site__c=site.id;
        eliteSetup1a.Product_Name__c=prod5.Name;
        eliteSetup1a.Product2Id=prod5.Id;
        eliteSetup1a.Unit_Price__c=customPrice5.UnitPrice;
        eliteSetup1a.Quantity=2;
        eliteSetup1a.Sub_Total__c=eliteSetup1.Quantity*eliteSetup1.Unit_Price__c;
        eliteSetup1a.TotalPrice=eliteSetup1.Quantity*eliteSetup1.Unit_Price__c;
        eliteSetup1a.Category__c=prod5.Family;
        eliteSetup1a.Sub_Category__c=prod5.Product_Subcategory__c;
        eliteSetup1a.OpportunityId=opp.id;
        eliteSetup1a.Filter_Product__c ='Child';
        eliteSetup1a.SetUp__c = 'Setup';
        //eliteSetup1.Releted__c = 'child';
        eliteSetup1a.Site_Number__c=site.Site_Number__c;
        eliteSetup1a.Type_of_Billing__c =customPrice5.Type_of_Billing__c; 
        eliteSetup1a.Equipment__c=prod4.Equipment__c;
        eliteSetup1a.isOutbound__c = true;
        opplst.add(eliteSetup1a);
        OpportunityLineItem eliteSetup1b = new OpportunityLineItem();
        eliteSetup1b.Site__c=site.id;
        eliteSetup1b.Product_Name__c=prod5.Name;
        eliteSetup1b.Product2Id=prod5.Id;
        eliteSetup1b.Unit_Price__c=customPrice5.UnitPrice;
        eliteSetup1b.Quantity=2;
        eliteSetup1b.Sub_Total__c=eliteSetup1.Quantity*eliteSetup1.Unit_Price__c;
        eliteSetup1b.TotalPrice=eliteSetup1.Quantity*eliteSetup1.Unit_Price__c;
        eliteSetup1b.Category__c=prod5.Family;
        eliteSetup1b.Sub_Category__c=prod5.Product_Subcategory__c;
        eliteSetup1b.OpportunityId=opp.id;
        eliteSetup1b.Filter_Product__c ='Child';
        eliteSetup1b.SetUp__c = 'Setup';
        //eliteSetup1.Releted__c = 'child';
        eliteSetup1b.Site_Number__c=site.Site_Number__c;
        eliteSetup1b.Type_of_Billing__c =customPrice5.Type_of_Billing__c; 
        eliteSetup1b.Equipment__c=prod4.Equipment__c;
        eliteSetup1b.isAdditionalDID__c = true;
        opplst.add(eliteSetup1b);
        
        OpportunityLineItem eliteSetup1aa = new OpportunityLineItem();
        eliteSetup1aa.Site__c=site.id;
        eliteSetup1aa.Product_Name__c=prod5.Name;
        eliteSetup1aa.Product2Id=prod5.Id;
        eliteSetup1aa.Unit_Price__c=customPrice5.UnitPrice;
        eliteSetup1aa.Quantity=2;
        eliteSetup1aa.Sub_Total__c=eliteSetup1.Quantity*eliteSetup1.Unit_Price__c;
        eliteSetup1aa.TotalPrice=eliteSetup1.Quantity*eliteSetup1.Unit_Price__c;
        eliteSetup1aa.Category__c=prod5.Family;
        eliteSetup1aa.Sub_Category__c=prod5.Product_Subcategory__c;
        eliteSetup1aa.OpportunityId=opp.id;
        eliteSetup1aa.Filter_Product__c ='Child';
        eliteSetup1aa.SetUp__c = 'Setup';
        //eliteSetup1.Releted__c = 'child';
        eliteSetup1aa.Site_Number__c=site.Site_Number__c;
        eliteSetup1aa.Type_of_Billing__c =customPrice5.Type_of_Billing__c; 
        eliteSetup1aa.Equipment__c=prod4.Equipment__c;
        eliteSetup1aa.isAdditionalDirectory__c = true;
        opplst.add(eliteSetup1aa);
        
        OpportunityLineItem eliteSetup1ab = new OpportunityLineItem();
        eliteSetup1ab.Site__c=site.id;
        eliteSetup1ab.Product_Name__c=prod5.Name;
        eliteSetup1ab.Product2Id=prod5.Id;
        eliteSetup1ab.Unit_Price__c=customPrice5.UnitPrice;
        eliteSetup1ab.Quantity=2;
        eliteSetup1ab.Sub_Total__c=eliteSetup1.Quantity*eliteSetup1.Unit_Price__c;
        eliteSetup1ab.TotalPrice=eliteSetup1.Quantity*eliteSetup1.Unit_Price__c;
        eliteSetup1ab.Category__c=prod5.Family;
        eliteSetup1ab.Sub_Category__c=prod5.Product_Subcategory__c;
        eliteSetup1ab.OpportunityId=opp.id;
        eliteSetup1ab.Filter_Product__c ='Child';
        eliteSetup1ab.SetUp__c = 'Setup';
        //eliteSetup1.Releted__c = 'child';
        eliteSetup1ab.Site_Number__c=site.Site_Number__c;
        eliteSetup1ab.Type_of_Billing__c =customPrice5.Type_of_Billing__c; 
        eliteSetup1ab.Equipment__c=prod4.Equipment__c;
        eliteSetup1ab.isAdditionalManaged__c = true;
        opplst.add(eliteSetup1ab);
        
        OpportunityLineItem eliteSetup1ac = new OpportunityLineItem();
        eliteSetup1ac.Site__c=site.id;
        eliteSetup1ac.Product_Name__c=prod5.Name;
        eliteSetup1ac.Product2Id=prod5.Id;
        eliteSetup1ac.Unit_Price__c=customPrice5.UnitPrice;
        eliteSetup1ac.Quantity=2;
        eliteSetup1ac.Sub_Total__c=eliteSetup1.Quantity*eliteSetup1.Unit_Price__c;
        eliteSetup1ac.TotalPrice=eliteSetup1.Quantity*eliteSetup1.Unit_Price__c;
        eliteSetup1ac.Category__c=prod5.Family;
        eliteSetup1ac.Sub_Category__c=prod5.Product_Subcategory__c;
        eliteSetup1ac.OpportunityId=opp.id;
        eliteSetup1ac.Filter_Product__c ='Child';
        eliteSetup1ac.SetUp__c = 'Setup';
        //eliteSetup1.Releted__c = 'child';
        eliteSetup1ac.Site_Number__c=site.Site_Number__c;
        eliteSetup1ac.Type_of_Billing__c =customPrice5.Type_of_Billing__c; 
        eliteSetup1ac.Equipment__c=prod4.Equipment__c;
        eliteSetup1ac.isBusinessAnalytic__c = true;
        opplst.add(eliteSetup1ac);
        
        OpportunityLineItem eliteSetup1ae = new OpportunityLineItem();
        eliteSetup1ae.Site__c=site.id;
        eliteSetup1ae.Product_Name__c=prod5.Name;
        eliteSetup1ae.Product2Id=prod5.Id;
        eliteSetup1ae.Unit_Price__c=customPrice5.UnitPrice;
        eliteSetup1ae.Quantity=2;
        eliteSetup1ae.Sub_Total__c=eliteSetup1.Quantity*eliteSetup1.Unit_Price__c;
        eliteSetup1ae.TotalPrice=eliteSetup1.Quantity*eliteSetup1.Unit_Price__c;
        eliteSetup1ae.Category__c=prod5.Family;
        eliteSetup1ae.Sub_Category__c=prod5.Product_Subcategory__c;
        eliteSetup1ae.OpportunityId=opp.id;
        eliteSetup1ae.Filter_Product__c ='Child';
        eliteSetup1ae.SetUp__c = 'Setup';
        //eliteSetup1.Releted__c = 'child';
        eliteSetup1ae.Site_Number__c=site.Site_Number__c;
        eliteSetup1ae.Type_of_Billing__c =customPrice5.Type_of_Billing__c; 
        eliteSetup1ae.Equipment__c=prod4.Equipment__c;
        eliteSetup1ae.isCallerId__c = true;
        opplst.add(eliteSetup1ae);
        
        OpportunityLineItem eliteSetup1aef = new OpportunityLineItem();
        eliteSetup1aef.Site__c=site.id;
        eliteSetup1aef.Product_Name__c=prod5.Name;
        eliteSetup1aef.Product2Id=prod5.Id;
        eliteSetup1aef.Unit_Price__c=customPrice5.UnitPrice;
        eliteSetup1aef.Quantity=2;
        eliteSetup1aef.Sub_Total__c=eliteSetup1.Quantity*eliteSetup1.Unit_Price__c;
        eliteSetup1aef.TotalPrice=eliteSetup1.Quantity*eliteSetup1.Unit_Price__c;
        eliteSetup1aef.Category__c=prod5.Family;
        eliteSetup1aef.Sub_Category__c=prod5.Product_Subcategory__c;
        eliteSetup1aef.OpportunityId=opp.id;
        eliteSetup1aef.Filter_Product__c ='Child';
        eliteSetup1aef.SetUp__c = 'Setup';
        //eliteSetup1.Releted__c = 'child';
        eliteSetup1aef.Site_Number__c=site.Site_Number__c;
        eliteSetup1aef.Type_of_Billing__c =customPrice5.Type_of_Billing__c; 
        eliteSetup1aef.Equipment__c=prod4.Equipment__c;
        eliteSetup1aef.isE911__c = true;
        opplst.add(eliteSetup1aef);
        
        OpportunityLineItem eliteSetup1aeg = new OpportunityLineItem();
        eliteSetup1aeg.Site__c=site.id;
        eliteSetup1aeg.Product_Name__c=prod5.Name;
        eliteSetup1aeg.Product2Id=prod5.Id;
        eliteSetup1aeg.Unit_Price__c=customPrice5.UnitPrice;
        eliteSetup1aeg.Quantity=2;
        eliteSetup1aeg.Sub_Total__c=eliteSetup1.Quantity*eliteSetup1.Unit_Price__c;
        eliteSetup1aeg.TotalPrice=eliteSetup1.Quantity*eliteSetup1.Unit_Price__c;
        eliteSetup1aeg.Category__c=prod5.Family;
        eliteSetup1aeg.Sub_Category__c=prod5.Product_Subcategory__c;
        eliteSetup1aeg.OpportunityId=opp.id;
        eliteSetup1aeg.Filter_Product__c ='Child';
        eliteSetup1aeg.SetUp__c = 'Setup';
        //eliteSetup1.Releted__c = 'child';
        eliteSetup1aeg.Site_Number__c=site.Site_Number__c;
        eliteSetup1aeg.Type_of_Billing__c =customPrice5.Type_of_Billing__c; 
        eliteSetup1aeg.Equipment__c=prod4.Equipment__c;
        eliteSetup1aeg.isExtendedMarket__c = true;
        opplst.add(eliteSetup1aeg);
        
        OpportunityLineItem eliteSetup1aeh = new OpportunityLineItem();
        eliteSetup1aeh.Site__c=site.id;
        eliteSetup1aeh.Product_Name__c=prod5.Name;
        eliteSetup1aeh.Product2Id=prod5.Id;
        eliteSetup1aeh.Unit_Price__c=customPrice5.UnitPrice;
        eliteSetup1aeh.Quantity=2;
        eliteSetup1aeh.Sub_Total__c=eliteSetup1.Quantity*eliteSetup1.Unit_Price__c;
        eliteSetup1aeh.TotalPrice=eliteSetup1.Quantity*eliteSetup1.Unit_Price__c;
        eliteSetup1aeh.Category__c=prod5.Family;
        eliteSetup1aeh.Sub_Category__c=prod5.Product_Subcategory__c;
        eliteSetup1aeh.OpportunityId=opp.id;
        eliteSetup1aeh.Filter_Product__c ='Child';
        eliteSetup1aeh.SetUp__c = 'Setup';
        //eliteSetup1.Releted__c = 'child';
        eliteSetup1aeh.Site_Number__c=site.Site_Number__c;
        eliteSetup1aeh.Type_of_Billing__c =customPrice5.Type_of_Billing__c; 
        eliteSetup1aeh.Equipment__c=prod4.Equipment__c;
        eliteSetup1aeh.isTollFreeNum__c = true;
        opplst.add(eliteSetup1aeh);
        
        OpportunityLineItem eliteSet1 = new OpportunityLineItem();
        eliteSet1.Site__c=site.id;
        eliteSet1.Product_Name__c=prod5.Name;
        eliteSet1.Product2Id=prod5.Id;
        eliteSet1.Unit_Price__c=customPrice5.UnitPrice;
        eliteSet1.Quantity=2;
        eliteSet1.Sub_Total__c=eliteSetup1.Quantity*eliteSetup1.Unit_Price__c;
        eliteSet1.TotalPrice=eliteSetup1.Quantity*eliteSetup1.Unit_Price__c;
        eliteSet1.Category__c=prod5.Family;
        eliteSet1.Sub_Category__c='Toll Free Bundle Minutes';
        eliteSet1.OpportunityId=opp.id;
        eliteSet1.Filter_Product__c ='Child';
        eliteSet1.SetUp__c = 'Setup';
        //eliteSetup1.Releted__c = 'child';
        eliteSet1.Site_Number__c=site.Site_Number__c;
        eliteSet1.Type_of_Billing__c =customPrice5.Type_of_Billing__c; 
        eliteSet1.Equipment__c=prod4.Equipment__c;
        opplst.add(eliteSet1);
        
        OpportunityLineItem tollFreeSetup = new OpportunityLineItem();
        tollFreeSetup.Site__c=site.id;
        tollFreeSetup.Product_Name__c=prod6.Name;
        tollFreeSetup.Product2Id=prod6.Id;
        tollFreeSetup.Unit_Price__c=customPrice6.UnitPrice;
        tollFreeSetup.Quantity=2;
        tollFreeSetup.Sub_Total__c=tollFreeSetup.Quantity*tollFreeSetup.Unit_Price__c;
        tollFreeSetup.TotalPrice=tollFreeSetup.Quantity*tollFreeSetup.Unit_Price__c;
        tollFreeSetup.Category__c=prod6.Family;
        tollFreeSetup.Sub_Category__c=prod6.Product_Subcategory__c;
        tollFreeSetup.OpportunityId=opp.id;
        tollFreeSetup.Filter_Product__c ='Parent';
        tollFreeSetup.Site_Number__c=site.Site_Number__c;
        tollFreeSetup.Type_of_Billing__c =customPrice6.Type_of_Billing__c; 
        tollFreeSetup.Equipment__c=prod6.Equipment__c;
        tollFreeSetup.isAdditionalDID__c = true;
        tollFreeSetup.isAdditionalDirectory__c = true;
        tollFreeSetup.isAdditionalManaged__c = true;
        tollFreeSetup.isBusinessAnalytic__c = true;
        tollFreeSetup.isCallerId__c = true;
        tollFreeSetup.isE911__c = true;
        tollFreeSetup.isExtendedMarket__c = true;
        tollFreeSetup.isTollFreeNum__c = true;
        tollFreeSetup.isWebFax__c = true;
        opplst.add(tollFreeSetup);
        
        OpportunityLineItem tollFreeSetup1 = new OpportunityLineItem();
        tollFreeSetup1.Site__c=site.id;
        tollFreeSetup1.Product_Name__c=prod6.Name;
        tollFreeSetup1.Product2Id=prod6.Id;
        tollFreeSetup1.Unit_Price__c=customPrice6.UnitPrice;
        tollFreeSetup1.Quantity=2;
        tollFreeSetup1.Sub_Total__c=tollFreeSetup1.Quantity*tollFreeSetup1.Unit_Price__c;
        tollFreeSetup1.TotalPrice=tollFreeSetup1.Quantity*tollFreeSetup1.Unit_Price__c;
        tollFreeSetup1.Category__c=prod6.Family;
        tollFreeSetup1.Sub_Category__c=prod6.Product_Subcategory__c;
        tollFreeSetup1.OpportunityId=opp.id;
        tollFreeSetup1.Filter_Product__c ='Parent';
        tollFreeSetup1.Site_Number__c=site.Site_Number__c;
        tollFreeSetup1.Type_of_Billing__c =customPrice6.Type_of_Billing__c; 
        tollFreeSetup1.Equipment__c=prod6.Equipment__c;
        tollFreeSetup1.isAdditionalDID__c = true;
        tollFreeSetup1.isAdditionalDirectory__c = true;
        tollFreeSetup1.isAdditionalManaged__c = true;
        tollFreeSetup1.isBusinessAnalytic__c = true;
        tollFreeSetup1.isCallerId__c = true;
        tollFreeSetup1.isE911__c = true;
        tollFreeSetup1.isExtendedMarket__c = true;
        tollFreeSetup1.isTollFreeNum__c = true;
        tollFreeSetup1.isWebFax__c = true;
        opplst.add(tollFreeSetup1);
        
        OpportunityLineItem e911List = new OpportunityLineItem();
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
        e911List11.Sub_Total__c=e911List1.Quantity*e911List1.Unit_Price__c;
        e911List11.TotalPrice=e911List1.Quantity*e911List1.Unit_Price__c;
        e911List11.Category__c=prod7.Family;
        e911List11.Sub_Category__c='Toll Free Bundle Minutes';
        e911List11.OpportunityId=opp.id;
        e911List11.Filter_Product__c ='Parent';
        e911List11.Site_Number__c=site.Site_Number__c;
        e911List11.Type_of_Billing__c =customPrice7.Type_of_Billing__c; 
        e911List11.Equipment__c=prod7.Equipment__c;
        opplst.add(e911List11);
        
        
        insert opplst;
        ApexPages.StandardController sc = new ApexPages.standardController(opp); 
        ApexPages.currentPage().getParameters().put('id',opp.id);
        UCaaSpdf ucsObj=new UCaaSpdf(sc);
        ucsObj.updateOpp();
        ucsObj.attachDocument();
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
        
        Product2 prod1 = new Product2(Name = 'Premier User 1 Yr',Family = 'FAW',Product_Subcategory__c='Licenses',Parent__c=true,Equipment__c =false);
        insert prod1;
        PricebookEntry standardPrice1 = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = prod1.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice1;
        PricebookEntry customPrice1 = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = prod1.Id,UnitPrice = 12000, IsActive = true,Type_of_Billing__c = 'MRC');
        insert customPrice1;
        
        Product2 prod2 = new Product2(Name = 'Outbound User 1 Yr',Family = 'FAW',Product_Subcategory__c='Licenses',Parent__c=true,Equipment__c =false);
        insert prod2;
        PricebookEntry standardPrice2 = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = prod2.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice2;
        PricebookEntry customPrice2 = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = prod2.Id,UnitPrice = 12000, IsActive = true,Type_of_Billing__c = 'MRC');
        insert customPrice2;
        
        Product2 prod3 = new Product2(Name = 'Essentials User 1 Yr',Family = 'FAW',Product_Subcategory__c='Licenses',Parent__c=true,Equipment__c =false);
        insert prod3;
        PricebookEntry standardPrice3 = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = prod3.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice3;
        PricebookEntry customPrice3 = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = prod3.Id,UnitPrice = 12000, IsActive = true,Type_of_Billing__c = 'MRC');
        insert customPrice3;
        
        Product2 prod4 = new Product2(Name = 'Web Fax',Family = 'FAW',Product_Subcategory__c='Add-On',Parent__c=true,Equipment__c =false);
        insert prod4;
        PricebookEntry standardPrice4 = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = prod4.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice4;
        PricebookEntry customPrice4 = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = prod4.Id,UnitPrice = 12000, IsActive = true,Type_of_Billing__c = 'MRC');
        insert customPrice4;
        
        Product2 prod5 = new Product2(Name = 'Elite Set Up',Family = 'FAW',Product_Subcategory__c='Activation Charges',Child__c=true,Equipment__c =false);
        insert prod5;
        PricebookEntry standardPrice5 = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = prod5.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice5;
        PricebookEntry customPrice5 = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = prod5.Id,UnitPrice = 12000, IsActive = true,Type_of_Billing__c = 'NRC');
        insert customPrice5;
        
        Product2 prod6 = new Product2(Name = 'Toll Free Number',Family = 'FAW',Product_Subcategory__c='Add-On',child__c=true,Equipment__c =false);
        insert prod6;
        PricebookEntry standardPrice6 = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = prod6.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice6;
        PricebookEntry customPrice6 = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = prod6.Id,UnitPrice = 12000, IsActive = true,Type_of_Billing__c = 'MRC');
        insert customPrice6;
        
        Product2 prod7 = new Product2(Name = 'E911',Family = 'FAW',Product_Subcategory__c='Add-On',child__c=true,Equipment__c =false);
        insert prod7;
        PricebookEntry standardPrice7 = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = prod7.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice7;
        PricebookEntry customPrice7 = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = prod7.Id,UnitPrice = 12000, IsActive = true,Type_of_Billing__c = 'MRC');
        insert customPrice7;
        
        Product2 prod8 = new Product2(Name = 'test',Family = 'FAW',Product_Subcategory__c='Toll Free Bundle Minutes',Equipment__c =false);
        insert prod8;
        PricebookEntry standardPrice8 = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = prod8.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice8;
        PricebookEntry customPrice8 = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = prod8.Id,UnitPrice = 12000, IsActive = true,Type_of_Billing__c = 'NRC');
        insert customPrice8;
        
        
        
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
        premierList.isElite__c = true;
        premierList.isPremier__c = true;
        premierList.isOutbound__c = true;
        premierList.isEssential__c = true;
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
        
        opplst.add(eliteSetup1);
        
        OpportunityLineItem tollFreeSetup = new OpportunityLineItem();
        tollFreeSetup.Site__c=site.id;
        tollFreeSetup.Product_Name__c=prod6.Name;
        tollFreeSetup.Product2Id=prod6.Id;
        tollFreeSetup.Unit_Price__c=customPrice6.UnitPrice;
        tollFreeSetup.Quantity=2;
        tollFreeSetup.Sub_Total__c=tollFreeSetup.Quantity*tollFreeSetup.Unit_Price__c;
        tollFreeSetup.TotalPrice=tollFreeSetup.Quantity*tollFreeSetup.Unit_Price__c;
        tollFreeSetup.Category__c=prod6.Family;
        tollFreeSetup.Sub_Category__c=prod6.Product_Subcategory__c;
        tollFreeSetup.OpportunityId=opp.id;
        tollFreeSetup.Filter_Product__c ='Parent';
        tollFreeSetup.Site_Number__c=site.Site_Number__c;
        tollFreeSetup.Type_of_Billing__c =customPrice6.Type_of_Billing__c; 
        tollFreeSetup.Equipment__c=prod6.Equipment__c;
        opplst.add(tollFreeSetup);
        
        OpportunityLineItem tollFreeSetup1 = new OpportunityLineItem();
        tollFreeSetup1.Site__c=site.id;
        tollFreeSetup1.Product_Name__c=prod6.Name;
        tollFreeSetup1.Product2Id=prod6.Id;
        tollFreeSetup1.Unit_Price__c=customPrice6.UnitPrice;
        tollFreeSetup1.Quantity=2;
        tollFreeSetup1.Sub_Total__c=tollFreeSetup1.Quantity*tollFreeSetup1.Unit_Price__c;
        tollFreeSetup1.TotalPrice=tollFreeSetup1.Quantity*tollFreeSetup1.Unit_Price__c;
        tollFreeSetup1.Category__c=prod6.Family;
        tollFreeSetup1.Sub_Category__c=prod6.Product_Subcategory__c;
        tollFreeSetup1.OpportunityId=opp.id;
        tollFreeSetup1.Filter_Product__c ='Parent';
        tollFreeSetup1.Site_Number__c=site.Site_Number__c;
        tollFreeSetup1.Type_of_Billing__c =customPrice6.Type_of_Billing__c; 
        tollFreeSetup1.Equipment__c=prod6.Equipment__c;
        opplst.add(tollFreeSetup1);
        
        OpportunityLineItem e911List = new OpportunityLineItem();
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
        
        insert opplst;
        ApexPages.StandardController sc = new ApexPages.standardController(opp); 
        ApexPages.currentPage().getParameters().put('id',opp.id);
        UCaaSpdf ucsObj=new UCaaSpdf(sc);
        ucsObj.updateOpp();
        ucsObj.attachDocument();
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
        
        Product2 prod1 = new Product2(Name = 'test',Family = 'FAW',Parent__c=true,Equipment__c =false);
        insert prod1;
        PricebookEntry standardPrice1 = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = prod1.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice1;
        PricebookEntry customPrice1 = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = prod1.Id,UnitPrice = 12000, IsActive = true);
        insert customPrice1;
        
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
        OpportunityLineItem essentialList = new OpportunityLineItem();
        essentialList.Site__c=site.id;
        essentialList.Product_Name__c=prod1.Name;
        essentialList.Product2Id=prod1.Id;
        essentialList.Unit_Price__c=customPrice1.UnitPrice;
        essentialList.Quantity=2;
        essentialList.Sub_Total__c=essentialList.Quantity*essentialList.Unit_Price__c;
        essentialList.TotalPrice=essentialList.Quantity*essentialList.Unit_Price__c;
        essentialList.Category__c=prod1.Family;
        essentialList.Sub_Category__c='Material Installation';
        essentialList.OpportunityId=opp.id;
        essentialList.Filter_Product__c ='Child';
        essentialList.Releted__c = 'child';
        essentialList.Site_Number__c=site.Site_Number__c;
        essentialList.Type_of_Billing__c = 'MRC';
        essentialList.Equipment__c=prod1.Equipment__c;
        opplst.add(essentialList);
        
        
        OpportunityLineItem essentialList1 = new OpportunityLineItem();
        essentialList1.Site__c=site.id;
        essentialList1.Product_Name__c=prod1.Name;
        essentialList1.Product2Id=prod1.Id;
        essentialList1.Unit_Price__c=customPrice1.UnitPrice;
        essentialList1.Quantity=2;
        essentialList1.Sub_Total__c=essentialList1.Quantity*essentialList1.Unit_Price__c;
        essentialList1.TotalPrice=essentialList1.Quantity*essentialList1.Unit_Price__c;
        essentialList1.Category__c=prod1.Family;
        essentialList1.Sub_Category__c='Warranty';
        essentialList1.OpportunityId=opp.id;
        essentialList1.Filter_Product__c ='Child';
        essentialList1.Releted__c = 'child';
        essentialList1.Site_Number__c=site.Site_Number__c;
        essentialList1.Type_of_Billing__c = 'MRC';
        essentialList1.Equipment__c=prod1.Equipment__c;
        opplst.add(essentialList1);
        
        
        OpportunityLineItem child = new OpportunityLineItem();
        child.Site__c=site.id;
        child.Product_Name__c=prod1.Name;
        child.Product2Id=prod1.Id;
        child.Unit_Price__c=customPrice1.UnitPrice;
        child.Quantity=2;
        child.Sub_Total__c=child.Quantity*child.Unit_Price__c;
        child.TotalPrice=child.Quantity*child.Unit_Price__c;
        child.Category__c=prod1.Family;
        child.Sub_Category__c='Post Warranty Maintenance';
        child.OpportunityId=opp.id;
        child.Filter_Product__c ='Child';
        child.Releted__c = 'child';
        child.Site_Number__c=site.Site_Number__c;
        child.Type_of_Billing__c = 'MRC';
        child.Equipment__c=prod1.Equipment__c;
        opplst.add(child);
        insert opplst;
        
        ApexPages.StandardController sc = new ApexPages.standardController(opp); 
        ApexPages.currentPage().getParameters().put('id',opp.id);
        UCaaSpdf ucsObj=new UCaaSpdf(sc);
        ucsObj.updateOpp();
        ucsObj.attachDocument();
        Test.stopTest();
    }
    
    @isTest
    public static void UCaaSMethod3(){
        Test.startTest();
        Contact con= new contact();
        con.LastName= 'Test';
        con.Phone= '9898561236';
        con.Email = 'Test@gmail.com';
        insert con; 
        
        Id standPricebookId = Test.getStandardPricebookId();
        Pricebook2 customPB = new Pricebook2(Name='Custom Pricebook', isActive=true);
        insert customPB;
        
        Product2 prod1 = new Product2(Name = 'test',Family = 'FAW',Product_Subcategory__c = 'IP Phones', Product_Type__c = 'FAW UCaaS',is_show_on_ux__c = true,Parent__c = true);
        insert prod1;
        PricebookEntry standardPrice1 = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = prod1.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice1;
        PricebookEntry customPrice1 = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = prod1.Id,UnitPrice = 12000, IsActive = true);
        insert customPrice1;
        
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
        
        OpportunityLineItem ipphone = new OpportunityLineItem();
        ipphone.Site__c=site.id;
        ipphone.Product_Name__c=prod1.Name;
        ipphone.Product2Id=prod1.Id;
        ipphone.Unit_Price__c=customPrice1.UnitPrice;
        ipphone.Quantity=2;
        ipphone.Sub_Total__c=ipphone.Quantity*ipphone.Unit_Price__c;
        ipphone.TotalPrice=ipphone.Quantity*ipphone.Unit_Price__c;
        ipphone.Category__c=prod1.Family;
        ipphone.Sub_Category__c= prod1.Product_Subcategory__c;
        ipphone.OpportunityId=opp.id;
        ipphone.Filter_Product__c ='Parent';
        ipphone.Type_of_Billing__c = 'MRC';
        opplst.add(ipphone); 
        
        OpportunityLineItem switchprod = new OpportunityLineItem();
        switchprod.Site__c=site.id;
        switchprod.Product_Name__c=prod1.Name;
        switchprod.Product2Id=prod1.Id;
        switchprod.Unit_Price__c=customPrice1.UnitPrice;
        switchprod.Quantity=2;
        switchprod.Sub_Total__c=switchprod.Quantity*switchprod.Unit_Price__c;
        switchprod.TotalPrice=switchprod.Quantity*switchprod.Unit_Price__c;
        switchprod.Category__c=prod1.Family;
        switchprod.Sub_Category__c= 'Switches and PoE';
        switchprod.OpportunityId=opp.id;
        switchprod.Filter_Product__c ='Parent';
        switchprod.Type_of_Billing__c = 'MRC';
        opplst.add(switchprod);
        
        OpportunityLineItem switchprod1 = new OpportunityLineItem();
        switchprod1.Product_Name__c=prod1.Name;
        switchprod1.Product2Id=prod1.Id;
        switchprod1.Unit_Price__c=customPrice1.UnitPrice;
        switchprod1.Quantity=2;
        switchprod1.Sub_Total__c=switchprod1.Quantity*switchprod1.Unit_Price__c;
        switchprod1.TotalPrice=switchprod1.Quantity*switchprod1.Unit_Price__c;
        switchprod1.Category__c=prod1.Family;
        switchprod1.Sub_Category__c= 'Switches and PoE';
        switchprod1.OpportunityId=opp.id;
        switchprod1.Filter_Product__c ='Parent';
        switchprod1.Type_of_Billing__c = 'NRC';
        opplst.add(switchprod1);
        
        
        insert opplst;
        
        
        ApexPages.StandardController sc = new ApexPages.standardController(opp); 
        ApexPages.currentPage().getParameters().put('id',opp.id);
        UCaaSpdf ucsObj=new UCaaSpdf(sc);
        ucsObj.updateOpp();
        ucsObj.attachDocument();
        Test.stopTest();
        
    }
    
}