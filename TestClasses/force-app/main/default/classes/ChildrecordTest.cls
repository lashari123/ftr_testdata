@isTest
public class ChildrecordTest {
    @isTest
    public static void ChildrecordTestMethod(){
        /*Account acc=new Account();
        acc.Name='AccountTest';
        acc.BillingStreet='Palasiya'; 
        acc.BillingCity='Indore';
        acc.BillingState='Alberta';
        acc.BillingCountry='Canada';
        acc.BillingLatitude=+90 ;
        acc.BillingLongitude=+180;
        insert acc;*/
        
        Contact con= new contact();
        con.LastName= 'Test';
        con.MobilePhone= '9898561236';
        con.Email = 'Test@gmail.com';
        insert con;       
        
        Product2 prod = new Product2(Name = 'Laptop X200',Family = 'Hardware',Child__c=true,IsActive=true);
        insert prod;
        
        Id standPricebookId = Test.getStandardPricebookId();
        PricebookEntry standardPrice = new PricebookEntry(Pricebook2Id = standPricebookId, Product2Id = prod.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice;
        
        Pricebook2 customPB = new Pricebook2(Name='Custom Pricebook', isActive=true);
        insert customPB;
        
        PricebookEntry customPrice = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = prod.Id,UnitPrice = 12000, IsActive = true);
        insert customPrice;
        
        
        Opportunity opp=new Opportunity();
        opp.name='TestOpp';
        opp.Contact__c= con.id;
        opp.Contract_Term_Years__c=1;
        opp.CloseDate=System.today();
        opp.StageName='New';
        //opp.AccountId=acc.id;
        opp.Reason_Won_Lost__c=' Defining '; 
        opp.Company_size__c=5;
        opp.Pricebook2Id=customPB.id;
        insert opp;
      
        
        Site__c site=new Site__c();
        site.Site_Name__c='SiteTest';
        site.opportunity__c=opp.id;
        site.PoE_option__c='Switch';
        site.Primary__c=True;
        insert site;
        
        User usr=new User();
        usr.Id=opp.OwnerId;
        
        OpportunityLineItem licensesItemList = new OpportunityLineItem();
        licensesItemList.Site__c=site.id;
        licensesItemList.Product_Name__c='Patch Cord';
        licensesItemList.Product2Id=prod.Id;
        licensesItemList.Unit_Price__c=customPrice.UnitPrice;
        licensesItemList.Quantity=2;
        licensesItemList.Sub_Total__c=licensesItemList.Quantity*licensesItemList.Unit_Price__c;
        licensesItemList.TotalPrice=licensesItemList.Quantity*licensesItemList.Unit_Price__c;
        licensesItemList.Category__c='FAW';
        licensesItemList.Sub_Category__c='Licenses';
        licensesItemList.OpportunityId=opp.id;
        licensesItemList.Filter_Product__c ='Parent';
        licensesItemList.Equipment__c=true;
        licensesItemList.Type_of_Billing__c='MRC';
                insert licensesItemList;
        

        Test.startTest();   
        ApexPages.StandardController sc = new ApexPages.standardController(licensesItemList);
        Childrecord childRecrd= new Childrecord(sc);
        childRecrd.redircet();
        Test.stopTest();
}
}