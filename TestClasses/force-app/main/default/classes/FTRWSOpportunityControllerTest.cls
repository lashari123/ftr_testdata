/**
 * @description       : This test class covers the following Apex classes:
 *      TBD_CLASS1
 *      TBD_CLASS2
 *      TBD_CLASS3
 * @author            : TBD
 * @version           : 1 
**/
@isTest(seeAllData = true)
public class FTRWSOpportunityControllerTest {
    
    public static Opportunity opp;
    
    public static Product2 createTestProduct(String name, String decription, String prodCode) {
        
        Product2 product = new Product2();
        product.name = 'EPATH 200M';
        product.ProductCode = prodCode;
        insert Product;
        return product;
    }
    
      public static PricebookEntry createPricebookEntry(Id pricebookId, Id productId, Decimal price) {
		PricebookEntry pe = new PricebookEntry(Pricebook2Id = pricebookId, Product2Id = productId, UnitPrice = price, IsActive = true);
        insert pe;
        return pe;
    }
    
    public static OpportunityLineItem createTestOpportunityLineItem(Id opportunityId, Product2 product, Id pricebookId) {
        Product2 p = createTestProduct ('Test Product', 'Test Description', '%999%');

        PricebookEntry pe = createPricebookEntry(pricebookId, p.iD, 10000);
        
        OpportunityLineItem oli = new OpportunityLineItem();
        oli.CPE_Gross_Margin__c = 0;
        oli.CPE_NRC_Price__c = 5.00;
        oli.NRC_Price__c = 12;
        oli.Product2 = p;
        oli.Service_Address__c = 'test';
        oli.Quantity = 1;
        oli.OpportunityId = opportunityId;
        oli.TotalPrice = 18.00;
        oli.PricebookEntryId = pe.Id;
        insert oli;
        return oli;
    }
    
    public static void createTestOpportunity() {

        Account acc = new Account();
        acc.Name='testAccount';
        insert acc;
        
        
        opp = new Opportunity();
        opp.Name='Test Opp';
        opp.StageName='Decision';
        opp.AccountId=acc.id;
        opp.CloseDate= System.today();
        opp.ForecastCategoryName='Commit';
        insert opp;
        
      	Note note1 = new Note();
        note1.Title = 'Test Note1';
        note1.ParentId = opp.Id;
        insert note1;

        Note note2 = new Note();
        note2.Title = 'Test Note2';
        note2.ParentId = opp.Id;
        insert note2;        
        
    }
    
    public static void prepareTestData() {
        
        createTestOpportunity();
        String gAddressStr = '{"actionStr":"CREATE","streetNo":"2001","streetName":"Solar Drive","city":"Oxnard", '+ 
            '"state":"California","unitNo":"","zipcode":"93036","gLat":34.2203155,"gLng":-119.1458787}';
        FTRWSGoogleAddress gAddress = (FTRWSGoogleAddress)JSON.deserialize(gAddressStr, FTRWSGoogleAddress.class);
        FTRWSAddress__c  address = new FTRWSAddress__c();
        address.Street_Number__c = gAddress.streetNo;
        address.Street_Name__c = gAddress.streetName;
        address.Street_Number__c = gAddress.streetNo;
        address.City__c = gAddress.city;
        address.State__c = gAddress.state;
        address.Zip_Code__c = gAddress.zipcode;
        address.Opportunity_ID__c = opp.id;
        address.G_Latitude__c = gAddress.gLat;
        address.G_Longitude__c = gAddress.gLng;
        
        insert address;
        
        RecordType quoteRecType = [SELECT Id FROM RecordType WHERE Name = 'Carrier Service' AND SobjectType = 'SterlingQuote__c' LIMIT 1];
        
       
        
         
        List<OpportunityLineItem> oliList = new List<OpportunityLineItem>();
        SterlingQuote__c quote = new SterlingQuote__c(Name = 'Test Quote 1', 
                                                        RecordType = quoteRecType, 
                                                        OpportunityId__c = opp.Id, 
                                                        IsSyncing__c = true);
        
        quote.Status__c = 'Draft';
        
        insert quote;
        
         Product2 product = createTestProduct('EPATH 2000M', 'EPATH 2000 M Platinum', '%999%');
        
Id pricebookId = Test.getStandardPricebookId();
        PricebookEntry standardPrice = new PricebookEntry(Pricebook2Id = pricebookId, Product2Id = product.Id,UnitPrice = 10000, IsActive = true);
        insert standardPrice;
        
        Pricebook2 customPB = new Pricebook2(Name='Custom Pricebook', isActive=true);
        insert customPB;              
        
         SterlingQuoteItem__c quoteItem = new SterlingQuoteItem__c();
        quoteItem.Name = product.name;
        quoteItem.Description__c = product.name;
        quoteItem.circuitType__c = 'EVC';
        
        quoteItem.SterlingQuote__c = quote.Id;
        quoteItem.Products__c = product.Id;
        quoteItem.Quantity__c = 1;
        quoteItem.PNum__c = 'EPAV1234567';
        
        String mrc = '200.00';
        if(mrc != null && mrc != '') {
        	quoteItem.StandardMRC__c = decimal.valueOf(mrc);    
        	quoteItem.NetNewMRR__c = decimal.valueOf(mrc);
        	quoteItem.AdjustedMRC__c = decimal.valueOf(mrc);
            
        }
        
        String nrc = '100.00';
        if(nrc != null && nrc != '') {
        	quoteItem.StandardNRC__c = decimal.valueOf(nrc);
            quoteItem.AdjustedNRC__c = decimal.valueOf(nrc);
        }
        
        
        quoteItem.ItemCode__c = 'MRCEPATH';
        quoteItem.NRC_Item_Code__c = 'NRCEPATH';
        
        
        Integer termLength = 2;       
        if(termLength != null && termLength != 0) {
        	quoteItem.TermLength__c = termLength;    
        }
		
        
        quoteItem.SA_StreetNrFirst__c = address.Street_Number__c;
        quoteItem.SA_StreetName__c = address.Street_Name__c;
        quoteItem.SA_UnitNumber__c = address.Unit_Number__c;
        quoteItem.Zipcode__c = address.Zip_Code__c;
        quoteItem.Locality__c = address.City__c;
        quoteItem.DSAT_AddressID__c = address.Id__c;
        quoteItem.ST_AddressID__c = address.Id;
        
        quoteItem.cvdratesource__c = 'Address';
        quoteItem.qos__c = 'Platinum';
        quoteItem.cvdPriceTier__c = '1';
        INSERT quoteItem;
        
        
		
        
        OpportunityLineItem oppLineItem = createTestOpportunityLineItem(opp.Id, product, pricebookId);
        
        
    }
       @isTest
    public static void testGetSterlingQuoteItems() {
        
        
        //*************************************************************

        Test.startTest();
        prepareTestData();
       // FTRWSAddressController.getDPIValResultWithAddressId(address.Id);
       FTRWSOpportunityController.getSterlingQuoteItems(opp.Id);
       FTRWSOpportunityController.getSterlingQuoteItemExport(opp.Id);
        Test.stopTest();
    }
    
    @isTest
    public static void testGetWSQuickQuote() {
        prepareTestData();
        String strOpportunityId = opp.Id;
        String commentStr = 'Test Comments';
        Test.startTest();
        FTRWSOpportunityController.getWSQuickQuote(strOpportunityId, commentStr);
        Test.stopTest();
    }
    
    @isTest
    public static void testAttachmentsAndWrappers () 
    {
                prepareTestData();
        List<FTRWSOpportunityController.AttachmentWrapper> TT = new List<FTRWSOpportunityController.AttachmentWrapper>();
		FTRWSOpportunityController.AttachmentWrapper objattach = new FTRWSOpportunityController.AttachmentWrapper();

		objAttach.Name = 'Testing';
		objAttach.typeOf = 'test';
		objAttach.ID = '1234';
		objAttach.createdById = 'test';
		objAttach.createByName = 'test name';
		objAttach.urlRedirection = 'Testing Name';
        objattach.LastModifiedDate = System.now();
		TT.add(objAttach);        
        
        
        FTRWSOpportunityController.WrapperOpportunityProduct wrapperProd = new FTRWSOpportunityController.WrapperOpportunityProduct();
        wrapperProd.AdjustedNRC = 200.00;
        wrapperProd.category = 'Test';
            wrapperProd.circuitType = 'EVC';
        wrapperProd.Id = '123456';
        wrapperProd.Name = 'Test';
        wrapperProd.NetNewMRR = 300.00;
        wrapperProd.NRC = 100.00;
        wrapperProd.Quantity = 1;
        wrapperProd.quoteId = '12345c';
        wrapperProd.quoteitemid = '1234dfgh';
        wrapperProd.recurringTotal = 500.00;
        wrapperProd.quoteRecordType = 'SFA';
        wrapperProd.RenewalMRR = 500.00;
        wrapperProd.ServiceAddress = 'Test';
        wrapperProd.SnECode = 'SNE1234';
        wrapperProd.Speed = '2000M';
        wrapperProd.TermLength = 3;
        wrapperProd.TotalCharge = 500.00;
        wrapperProd.TotalMRC = 300.00;
        wrapperProd.TotalNRC = 200.00;
        wrapperProd.url = 'www.test.com';
        wrapperProd.ZAddress = 'Test Z Address';
        wrapperProd.isSubmitted = true;
        wrapperProd.isPending = true;
        wrapperProd.isstatus = true;
        wrapperProd.isshow  = true;
        wrapperProd.SnEMRC = 'TestMRC';
        wrapperProd.SnENRC = 'TestNRC';
        wrapperProd.noOfBusinessDays = '5';    

       PageReference pdfPage = Page.WSCarrierSvcQuickQuote;
        Blob pdfBlob = Blob.toPdf('Testing pdf');//pdfPage.getContent();
         //Attachment oAtt = new Attachment(parentId = opp.Id, name = 'QuickQuote.pdf', body = pdfBlob);
        Attachment oAtt2 = new Attachment(parentId = opp.Id, name = 'QuickQuote.pdf', body = pdfBlob);
            insert oAtt2;

                
        Test.startTest();  
		FTRWSOpportunityController.initAttachmentSection(opp.Id);
		FTRWSOpportunityController.fetchAllAttachments(opp.Id);        
		Test.stopTest();
        
    }
}