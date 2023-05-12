@IsTest
public class ftrProductWrapper_Test {
    private static ftrProductWrapper getTestProductWrapper() {
        ftrProductWrapper pw = new ftrProductWrapper();
        pw.addressCategory = 'Legal';
        pw.addressCity = 'Dallas';
        pw.addressPostalCode = '44444';
        pw.addressState = 'TX';
        pw.cpe = 0;
        pw.cpeGrossMargin = 0;
        pw.discountType = 'None';
        pw.family = 'Ethernet';
        pw.id = '748374swoihnwef';
        pw.name = 'test';
        pw.netNewMrr = 0;
        pw.nrc = 0;
        pw.pricebookEntryId = '98h34fiuns8shef';
        pw.productCode = '%843%';
        pw.quantity = 1;
        pw.quoteItemId = '9283nfsube';
        pw.renewalMrr  = 0;
        pw.term = 12;
        pw.unitPrice = 0;
        return pw;
    }

    @IsTest
    private static Void productWrapperBaseConstructor_Test(){
        ftrProductWrapper pw = getTestProductWrapper();
        System.assert(pw != null && pw.name == 'test', 
            'GIVEN that there is no ProductWrapper instance, ' + 
            'WHEN a ProductWrapper constructor is called with no parameters ' + 
            'AND the fields are populated ' + 
            'THEN the ProductWrapper should exist ' + 
            'AND the fields should be populated');
    }

    @IsTest
    private static Void productWrapperFromProductConstructor_Test(){
        Product2 testProduct = Test_Fixture_Factory.createTestProduct('test', 'test', '%111%');
        testProduct.family = 'Ethernet';
        testProduct.UnitPrice__c = '1';
        ftrProductWrapper pw = new ftrProductWrapper(testProduct);
        System.assert(pw != null && pw.name == 'test', 
            'GIVEN that there is a Product2, ' + 
            'WHEN a ProductWrapper constructor is called with a Product2 as parameter ' + 
            'THEN the ProductWrapper should exist ' + 
            'AND the fields should be populated');
    }
    
    @IsTest
    private static Void productWrapperFromSterlingQuoteItemConstructor_Test(){
        Test.startTest();
        Opportunity testOpp = Test_Fixture_Factory.createTestOpportunity();
        SterlingQuote__c testQuote = Test_Fixture_Factory.createTestQuote(testOpp.Id, 'None', '');
        SterlingQuoteItem__c testQuoteItem = [SELECT Id, name, DiscountType__c, Quantity__c, Category__c, Products__c, Pricebook_Entry_Id__c, TermLength__c,
                                              		NetNewMRR__c, renewal_mrr_original__c, AdjustedNRC__c, CPE_NRC_Price__c, CPE_Gross_Margin__c,
                                              		Products__r.Family, Products__r.ProductCode, Products__r.UnitPrice__c
                                                FROM SterlingQuoteItem__c 
                                                WHERE SterlingQuote__c = :testQuote.Id 
                                                LIMIT 1];

        ftrProductWrapper pw = new ftrProductWrapper(testQuoteItem);
        System.assert(pw != null, 
            'GIVEN that there is a SterlingQuoteItem__c, ' + 
            'WHEN a ProductWrapper constructor is called with a SterlingQuoteItem__c as parameter ' + 
            'THEN the ProductWrapper should exist');
        system.debug ('testQuote.Id' +testQuote.Id);
        SterlingQuoteItem__c testQuoteItem2 = pw.toSterlingQuoteItem(testQuote.Id);
        System.assert(testQuoteItem2 != null, 
            'GIVEN that there is a ProductWrapper, ' + 
            'WHEN ProductWrapper.toSterlingQuoteItem is caled ' + 
            'THEN the SterlingQuoteItem__c should exist');
        Test.stopTest();
    }

    //@IsTest
    private static Void productWrapperToSterlingQuoteItem_Test() {
        Test.startTest();
        ftrProductWrapper pw = getTestProductWrapper();
        Opportunity testOpp = Test_Fixture_Factory.createTestOpportunity();
        SterlingQuote__c testQuote = Test_Fixture_Factory.createTestQuote(testOpp.Id, 'None', '');
        SterlingQuoteItem__c testQuoteItem = pw.toSterlingQuoteItem(testQuote.Id);
        System.assert(testQuoteItem != null, 
            'GIVEN that there is a ProductWrapper, ' + 
            'WHEN ProductWrapper.toSterlingQuoteItem is caled ' + 
            'THEN the SterlingQuoteItem__c should exist');
        Test.stopTest();
    }
}