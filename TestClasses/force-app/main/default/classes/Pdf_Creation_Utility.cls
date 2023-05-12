global class Pdf_Creation_Utility {
    global class Pdf_Parameters {
        @InvocableVariable
        global String companyName;

        @InvocableVariable
        global String oppId;

        //* Quick Quote - Standard
        //* Quick Quote - UCaaS
        //* Proposal - Standard 
        //* Proposal - Cloud Managed IT
        //* Proposal - UCaaS: Cash Payment
        //* Proposal - UCaaS: Frontier Financing
        @InvocableVariable
        global String type;

        @InvocableVariable
        global String comments;

        @InvocableVariable
        global String currentCapabilities;

        @InvocableVariable
        global String futureNeeds;
    }

    global class Pdf_Creation_Result {
        @InvocableVariable
        global Boolean success;

        @InvocableVariable
        global String errorMessage;
    }

    @InvocableMethod(label = 'Create Pdf')
    public static List<Pdf_Creation_Result> createPdf(List<Pdf_Parameters> params) {
        Pdf_Creation_Result res = new Pdf_Creation_Result();
        try {
            PageReference pdfPage = getPdfPageReference(params[0].type);
            Blob pdfBlob = getPdfBlob(pdfPage, params[0]);
            createLinkedFile(params[0], pdfBlob);
            res.success = true;
        }
        catch(Exception ex) {
            res.success = false;
            res.errorMessage = ex.getMessage() 
                + ' : ' + ex.getLineNumber() 
                + ' Stack Trace: ' + ex.getStackTraceString()
                + ' Params: ' + params;
        }
        return new List<Pdf_Creation_Utility.Pdf_Creation_Result> {res};
    }

    @TestVisible
    private static PageReference getPdfPageReference(String pageType) {
        map<String, PageReference> pageTypes = new map<String, PageReference> {
            'QUICK QUOTE - UCAAS' => Page.QuickQuote_UCaaS,
            'QUICK QUOTE - STANDARD' => Page.QuickQuote,
            'PROPOSAL - UCAAS: CASH PAYMENT' => Page.CreateUCaaSProposal,
            'PROPOSAL - UCAAS: FRONTIER FINANCING' => Page.CreateUCaaSProposal,
            'PROPOSAL - CLOUD MANAGED IT' => Page.CreateCloudManagedITProposal,
            'PROPOSAL - STANDARD' => Page.CreateProposal
        };
        return pageTypes.get(pageType.toUpperCase());
    }

    @TestVisible
    private static Blob getPdfBlob(PageReference pdfPage, Pdf_Parameters params) {
        if (params.type.startsWithIgnoreCase('QUICK QUOTE')) {
	        pdfPage.getParameters().put('oid', params.oppId);
            pdfPage.getParameters().put('c', params.comments);
        }
        if (params.type.startsWithIgnoreCase('PROPOSAL')) {
	        pdfPage.getParameters().put('oppId', params.oppId);
            pdfPage.getParameters().put('proposalCompany', params.currentCapabilities);
            pdfPage.getParameters().put('proposalFuture', params.futureNeeds);
        }
        
        if (!Test.isRunningTest()) return pdfPage.getContent();
        else return Blob.toPdf('Test Content');
    }

    private static Void createLinkedFile(Pdf_Parameters params, Blob pdfBody) {
        ContentVersion pdf = createPdf(pdfBody, params);
        createLink(pdf.Id, params.oppId);
    }

    @TestVisible
    private static String getPdfMainType(Pdf_Parameters params) {
        return params.type.split(' - ')[0];
    }
    
    private static ContentVersion createPdf(Blob pdfBody, Pdf_Parameters params ) {
        ContentVersion pdf = new ContentVersion();
        String mainType = getPdfMainType(params);
        String datePath = Datetime.now().format().replace('/', '-');
        String path = mainType == 'Quick Quote' ? 'Quick_Quote.pdf' : params.companyName + mainType.center(1,'_') + datePath + '.pdf';
        pdf.Title = mainType + '_' + datePath;
        pdf.PathOnClient = path;
        pdf.VersionData = pdfBody;
        pdf.ContentLocation = 'S';
        insert pdf;
        return pdf;
    }

    private static Void createLink(Id pdfId, Id opportunityId) {
        ContentDocumentLink link = new ContentDocumentLink();
        link.ContentDocumentId = [SELECT Id, ContentDocumentId FROM ContentVersion WHERE Id = :pdfId].ContentDocumentId;
        link.LinkedEntityId = opportunityId;
        link.ShareType = 'I';
        insert link;
    }
}