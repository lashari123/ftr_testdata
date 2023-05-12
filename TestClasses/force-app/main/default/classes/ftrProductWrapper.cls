public class ftrProductWrapper {
    @AuraEnabled public String Id { get; set; }
    @AuraEnabled public String quoteItemId { get; set; }
    @AuraEnabled public String name { get; set; }
    @AuraEnabled public String family { get; set; }
    @AuraEnabled public String productCode { get; set; }
    @AuraEnabled public Decimal unitPrice { get; set; }
    @AuraEnabled public Integer quantity { get; set; }
    @AuraEnabled public Integer term { get; set; }
    @AuraEnabled public Decimal netNewMrr { get; set; }
    @AuraEnabled public Decimal renewalMrr { get; set; }
    @AuraEnabled public Decimal nrc { get; set; }
    @AuraEnabled public Decimal cpe { get; set; }
    @AuraEnabled public Decimal cpeGrossMargin { get; set; }
    @AuraEnabled public String discountType { get; set; }
    @AuraEnabled public String addressCategory { get; set; }
    @AuraEnabled public String addressStreet { get; set; }
    @AuraEnabled public String addressCity { get; set; }
    @AuraEnabled public String addressState { get; set; }
    @AuraEnabled public String addressPostalCode { get; set; }
    @AuraEnabled public String pricebookEntryId { get; set; }
    
    public ftrProductWrapper() {}
    
    public ftrProductWrapper(Product2 product) {
        this.Id = product.Id;
        this.name = product.name;
        this.family = product.family;
        this.productCode = product.ProductCode;
        this.unitPrice = Utilities.isNumericOrDecimal(product.UnitPrice__c) ? Decimal.valueOf(product.UnitPrice__c) : 0;
        this.quantity = 1;
        this.term = 0;
        this.netNewMrr = 0;
        this.renewalMrr = 0;
        this.nrc = 0;
        this.cpe = 0;
        this.cpeGrossMargin = 0;
        this.discountType = 'None';
    }

    public ftrProductWrapper(SterlingQuoteItem__c quoteItem) {
        this.Id = quoteItem.Products__c;
        this.quoteItemId = quoteItem.Id;
        this.pricebookEntryId = quoteItem.Pricebook_Entry_Id__c;
        this.name = quoteItem.name;
        this.family = quoteItem.Products__r.Family;
        this.productCode = quoteItem.Products__r.ProductCode;
        this.unitPrice = Utilities.isNumericOrDecimal(quoteItem.Products__r.UnitPrice__c) ? Decimal.valueOf(quoteItem.Products__r.UnitPrice__c) : 0;
        this.quantity = Integer.valueOf(quoteItem.Quantity__c);
        this.term = Integer.valueOf(quoteItem.TermLength__c);
        this.netNewMrr = quoteItem.NetNewMRR__c;
        this.renewalMrr = quoteItem.renewal_mrr_original__c;
        this.nrc = quoteItem.AdjustedNRC__C;
        this.cpe = quoteItem.CPE_NRC_Price__c;
        this.cpeGrossMargin = quoteItem.CPE_Gross_Margin__c;
        this.discountType = quoteItem.DiscountType__c;
    }
    
    public SterlingQuoteItem__c toSterlingQuoteItem(Id SterlingQuoteId)  {
        return new SterlingQuoteItem__c (
        	Products__c 				= this.Id,
            Pricebook_Entry_Id__c		= this.pricebookEntryId,
            name 						= this.name,
            SterlingQuote__c 			= SterlingQuoteId,
            DiscountType__c				= this.discountType,
            Quantity__c					= this.quantity,
            TermLength__c				= this.term,
            CPE_NRC_Price__c			= this.cpe,
            CPE_Gross_Margin__c			= this.cpeGrossMargin,
            NetNewMRR__c				= this.netNewMrr,
            AdjustedNRC__C				= this.nrc,
            renewal_mrr_original__c		= this.renewalMrr,
            AdjustedMRC__c				= this.renewalMrr + this.netNewMrr,
            TotalPrice__c				= (this.quantity * this.term * (this.renewalMrr + this.netNewMrr)) + this.nrc + this.cpe,
            PA_AddressLine1__c			= this.addressCategory == 'Legal' ? this.addressStreet : null,
            SA_StreetName__c			= new List<String>{'Shipping','Billing'}.contains(this.addressCategory) ? this.addressStreet : null,
            Locality__c					= this.addressCity,
            StateProvince__c			= this.addressState,
            Zipcode__c					= this.addressPostalCode
        );
    }
}