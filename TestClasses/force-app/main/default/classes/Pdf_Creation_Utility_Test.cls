@IsTest
public with sharing class Pdf_Creation_Utility_Test {
    @IsTest
    private static Void createPdf_Test() {
        runCreatePdfTestWithType('Quick Quote - Standard');
        runCreatePdfTestWithType('Quick Quote - UCaaS');
        runCreatePdfTestWithType('Proposal - Standard');
        runCreatePdfTestWithType('Proposal - Cloud Managed IT');
        runCreatePdfTestWithType('Proposal - UCaaS: Cash Payment');
        runCreatePdfTestWithType('Proposal - UCaaS: Frontier Financing');
    }

    private static Void runCreatePdfTestWithType(String pdfType) {
        String criteria;
        String criteriaBackground = 'GIVEN there is a valid opportunity ';
        
        Opportunity oppFixture = Test_Fixture_Factory.createTestOpportunity();
        List<Pdf_Creation_Utility.Pdf_Parameters> paramList = new List<Pdf_Creation_Utility.Pdf_Parameters>();
        Pdf_Creation_Utility.Pdf_Parameters params = new Pdf_Creation_Utility.Pdf_Parameters();
        params.oppId = oppFixture.Id;
        params.type = pdfType;
        params.comments = 'test';
        paramList.add(params);

        criteria = criteriaBackground
            + ' WHEN createPdf is called with Pdf_Parameters.type = ' + params.type
            + ' THEN the return value.success should be true';
        List<Pdf_Creation_Utility.Pdf_Creation_Result> res = Pdf_Creation_Utility.createPdf(paramList);
        System.assert(res[0].success, criteria + ' but was actually ' + res[0].success);

        criteria = criteriaBackground
            + ' WHEN createPdf is called with Pdf_Parameters.type = ' + params.type
            + ' THEN a query for a related ContentDocumentLink should not return null';
        ContentDocumentLink link = [SELECT Id, LinkedEntityId, ContentDocumentId, ShareType FROM ContentDocumentLink WHERE LinkedEntityId = :oppFixture.Id];
        System.assert(link != null, criteria);

        criteria = criteriaBackground
            + ' WHEN createPdf is called with Pdf_Parameters.type = ' + params.type
            + ' THEN a query for a related ContentVersion should not return null';
        ContentVersion content = [SELECT Id, ContentDocumentId FROM ContentVersion WHERE ContentDocumentId = :link.ContentDocumentId LIMIT 1];
        System.assert(content != null, 'ContentVersion was null but should not have been');
    }
 
    @IsTest
    private static Void createPdf_With_Bad_Opportunity_Test() {
        Test.startTest();
        String criteria;
        String criteriaBackground = 'GIVEN there is not a valid opportunity ';
        
        List<Pdf_Creation_Utility.Pdf_Parameters> paramList = new List<Pdf_Creation_Utility.Pdf_Parameters>();
        Pdf_Creation_Utility.Pdf_Parameters params = new Pdf_Creation_Utility.Pdf_Parameters();
        params.oppId = null;
        params.type = 'Quick Quote - Standard';
        params.comments = 'test';
        paramList.add(params);
        
        criteria = criteriaBackground
            + ' WHEN createPdf is called with Pdf_Parameters.type = ' + params.type
            + ' THEN the return value.success should be false but was actually ';
        List<Pdf_Creation_Utility.Pdf_Creation_Result> res = Pdf_Creation_Utility.createPdf(paramList);
        System.assert(!res[0].success, criteria + res[0].success);
        Test.stopTest();
    }

    @IsTest
    private static Void createPdf_With_Bad_Pdf_Type_Test() {
        Test.startTest();
        String criteria;
        String criteriaBackground = 'GIVEN there is a valid opportunity ';
        
        Opportunity oppFixture = Test_Fixture_Factory.createTestOpportunity();

        List<Pdf_Creation_Utility.Pdf_Parameters> paramList = new List<Pdf_Creation_Utility.Pdf_Parameters>();
        Pdf_Creation_Utility.Pdf_Parameters params = new Pdf_Creation_Utility.Pdf_Parameters();
        params.oppId = oppFixture.Id;
        params.type = 'Non-existent Pdf Type';
        params.comments = 'test';
        paramList.add(params);
        
        criteria = criteriaBackground
            + ' WHEN createPdf is called with Pdf_Parameters.type = ' + params.type
            + ' THEN the return value.success should be false but was actually ';
        List<Pdf_Creation_Utility.Pdf_Creation_Result> res = Pdf_Creation_Utility.createPdf(paramList);
      //  System.assert(!res[0].success, criteria + res[0].success);
        Test.stopTest();
    }
    
    //@IsTest
    private static Void getPdfPageReference_Test() {
        PageReference pageRef = Pdf_Creation_Utility.getPdfPageReference('QUICK QUOTE - UCAAS');
        System.assert(pageRef != null, 'getPdfPageReference with QUICK QUOTE - UCAAS returned null when it should have returned a PageReference');

        pageRef = Pdf_Creation_Utility.getPdfPageReference('QUICK QUOTE - STANDARD');
        System.assert(pageRef != null, 'getPdfPageReference with QUICK QUOTE - STANDARD returned null when it should have returned a PageReference');

        pageRef = Pdf_Creation_Utility.getPdfPageReference('PROPOSAL - UCAAS: CASH PAYMENT');
        System.assert(pageRef != null, 'getPdfPageReference with PROPOSAL - UCAAS: CASH PAYMENT returned null when it should have returned a PageReference');

        pageRef = Pdf_Creation_Utility.getPdfPageReference('PROPOSAL - UCAAS: FRONTIER FINANCING');
        System.assert(pageRef != null, 'getPdfPageReference with PROPOSAL - UCAAS: FRONTIER FINANCING returned null when it should have returned a PageReference');

        pageRef = Pdf_Creation_Utility.getPdfPageReference('PROPOSAL - CLOUD MANAGED IT');
        System.assert(pageRef != null, 'getPdfPageReference with PROPOSAL - CLOUD MANAGED IT returned null when it should have returned a PageReference');
        
        pageRef = Pdf_Creation_Utility.getPdfPageReference('PROPOSAL - STANDARD');
        System.assert(pageRef != null, 'getPdfPageReference with PROPOSAL - STANDARD returned null when it should have returned a PageReference');

        pageRef = Pdf_Creation_Utility.getPdfPageReference('');
        System.assert(pageRef == null, 'getPdfPageReference with null returned a PageReference when it should have returned null');
    }
    
    //@IsTest
    private static Void getPdfBlob_Test() {
        Opportunity opp = Test_Fixture_Factory.createTestOpportunity();
        String requirement = 'WHEN getPdfBlob is called with Page.QuickQuote AND comments = comments' 
            + ' AND oid = existing opportunity id'
            + ' THEN the returned value should not be null BUT it was.';
        PageReference pdfPage = Page.QuickQuote;
        Pdf_Creation_Utility.Pdf_Parameters params = new Pdf_Creation_Utility.Pdf_Parameters();
        params.type = 'QUICK QUOTE - STANDARD';
        params.comments = 'comments';
        params.oppId = opp.Id;
        Blob res = Pdf_Creation_Utility.getPdfBlob(pdfPage, params);
        System.assert(res != null, requirement);
    }


}