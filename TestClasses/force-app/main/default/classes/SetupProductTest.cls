@isTest
public class SetupProductTest {
    @isTest
    public static void SetupProductTestMethod(){
        
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
        
        PricebookEntry customPrice = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = prod.Id,UnitPrice = 12000, IsActive = true,Type_of_Billing__c = 'MRC');
        insert customPrice;
        
        
         Product2 prod2 = new Product2(Name = 'test',Family = 'FAW',Product_Subcategory__c='Activation Charges',Child__c=true,IsActive = true);
        insert prod2;
           PricebookEntry standardPrice2 = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = prod2.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice2;
        PricebookEntry customPrice2 = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = prod2.Id,UnitPrice = 12000, IsActive = true,Type_of_Billing__c = 'NRC');
        insert customPrice2;
        
       
        
        
          Product_Linkage__c linkage = new Product_Linkage__c();
        linkage.Product_Name__c = prod.Id;
        linkage.Product_Name_Setup__c =  prod2.Id;
        insert linkage;

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
        insert opplst;
        
        
        OpportunityLineItem licensesItemList1 = new OpportunityLineItem();
        licensesItemList1.Site__c=site.id;
        licensesItemList1.Product_Name__c=prod.Name;
        licensesItemList1.Product2Id=prod.Id;
        licensesItemList1.Unit_Price__c=customPrice.UnitPrice;
        licensesItemList1.Quantity=2;
        licensesItemList1.Sub_Total__c=licensesItemList1.Quantity*licensesItemList1.Unit_Price__c;
        licensesItemList1.TotalPrice=licensesItemList1.Quantity*licensesItemList1.Unit_Price__c;
        licensesItemList1.Category__c=prod.Family;
        licensesItemList1.Sub_Category__c=prod.Product_Subcategory__c;
        licensesItemList1.OpportunityId=opp.id;
        licensesItemList1.Filter_Product__c ='Child';
        licensesItemList1.Site_Number__c=site.Site_Number__c;
        licensesItemList1.Type_of_Billing__c =customPrice.Type_of_Billing__c; 
        licensesItemList1.Equipment__c=prod.Equipment__c;
        licensesItemList1.Equote_ext_ID__c = 'test';
        licensesItemList1.Parent_ID__c = opplst[0].Id;
        licensesItemList1.Parent_Product_Name__c = opplst[0].Product_Name__c;
        insert licensesItemList1;
        
        
        
       /*  OpportunityLineItem licensesItemList2 = new OpportunityLineItem();
        licensesItemList2.Site__c=site.id;
        licensesItemList2.Product_Name__c=prod2.Name;
        licensesItemList2.Product2Id=prod2.Id;
        licensesItemList2.Unit_Price__c=customPrice2.UnitPrice;
        licensesItemList2.Quantity=2;
        licensesItemList2.Sub_Total__c=licensesItemList2.Quantity*licensesItemList2.Unit_Price__c;
        licensesItemList2.TotalPrice=licensesItemList2.Quantity*licensesItemList2.Unit_Price__c;
        licensesItemList2.Category__c=prod2.Family;
        licensesItemList2.Sub_Category__c=prod2.Product_Subcategory__c;
        licensesItemList2.OpportunityId=opp.id;
        licensesItemList2.Filter_Product__c ='Child';
        licensesItemList2.Site_Number__c=site.Site_Number__c;
        licensesItemList2.Type_of_Billing__c =customPrice2.Type_of_Billing__c; 
        licensesItemList2.Equipment__c=prod2.Equipment__c;
        opplst.add(licensesItemList2);
        insert opplst; */
        
        
       
        Test.startTest(); 
        SetupProduct.setup(opplst);
        SetupProduct.afterDeleteFunctionality(opplst);
        Test.stopTest();
        
        
    }
    
    
}