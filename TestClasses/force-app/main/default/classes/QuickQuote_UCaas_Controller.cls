public class QuickQuote_UCaas_Controller {
    public Decimal totalUpfrontCostHardware {get; set;}
    public Decimal totalMonthlyRecurringCharge {get; set;}
    public Decimal monthlyRecurringHardware {get; set;}
    public Decimal totalNRCValue1 {get; set;}
    public Decimal totalMRCValue1 {get; set;}
    public Integer NumSQIs1 {get; set;}
    
    public Decimal totalNRCValue2 {get; set;}
    public Decimal totalMRCValue2 {get; set;}
    public Integer NumSQIs2 {get; set;}
    
    public Decimal totalNRCValue3 {get; set;}
    public Decimal totalMRCValue3 {get; set;}
    public Integer NumSQIs3 {get; set;}
    
    public Decimal totalNRCValue4 {get; set;}
    public Decimal totalMRCValue4 {get; set;}
    public Integer NumSQIs4 {get; set;}
    public Decimal totalUnitPriceNRCValue4 {get; set;}
    
    public Decimal totalNRCValue5 {get; set;}
    public Decimal totalMRCValue5 {get; set;}
    public Integer NumSQIs5 {get; set;}
    public Id oppId {get; set;}
    public Set<Id> quoteIds {get; set;}
    public Opportunity opp {get; set;}
    public String comments {get; set;}
    
    public QuickQuote_UCaas_Controller() {
        init(ApexPages.currentPage().getParameters().get('oid'));
    }
    
    @TestVisible
    private Void init(Id opportunityId) {
        if(opportunityId != null) {
            this.oppId = opportunityId;
            this.opp = getCurrentOpportunity(opportunityId);
            this.comments = ApexPages.currentPage().getParameters().get('c');
            try {
                this.quoteIds = SterlingQuoteUtility.getQuoteIdsFromOpportunity(opportunityId).keySet();
            } catch (Exception ex) {
                System.debug(ex.getMessage());
            }
        }
    }
    
    @TestVisible
    private static Opportunity getCurrentOpportunity(Id oppId) {
        return[SELECT 
                Account.Name,
                Account.BillingStreet,
                Account.BillingCity,
                Account.BillingState,
                Account.BillingPostalCode,
                Account.BillingCountry,
                Account.Phone, 
                Account.SB_Email__c,
                AccountId
            FROM Opportunity 
            WHERE id = :oppId
            LIMIT 1];    
    }
    
    public List<Quote_Line_Item_Product_Wrapper> getFirstQuickQuoteWrapper() {
        List<Quote_Line_Item_Product_Wrapper> quickQuoteWrapper = new List<Quote_Line_Item_Product_Wrapper>();
        List<Quote_Line_Item_Product_Wrapper> Wrapper = Quote_Line_Item_Product_Wrapper.getQuickQuoteWrappers(this.oppId, this.quoteIds);
        if(Wrapper != null && Wrapper.size() >0){
            for(Quote_Line_Item_Product_Wrapper wrap : Wrapper) {
                if(wrap.category == 'Services') {
                    quickQuoteWrapper.add(wrap);
                }
            }
        }
        
        totalUpfrontCostHardware = 0;
        totalMonthlyRecurringCharge = 0;
        monthlyRecurringHardware = 0;
        totalNRCValue1 = 0;
        totalMRCValue1 = 0;
        NumSQIs1 = 0;
        for(Quote_Line_Item_Product_Wrapper sqi : quickQuoteWrapper)
        {
            NumSQIs1++;
            totalNRCValue1 += sqi.NRC;
            totalMRCValue1 += sqi.TotalCharge;
        }
        
        totalUpfrontCostHardware += totalNRCValue1;
        totalMonthlyRecurringCharge += totalMRCValue1;
        
        return quickQuoteWrapper;
    }
    
    public List<Quote_Line_Item_Product_Wrapper> getSecondQuickQuoteWrapper() {
        List<Quote_Line_Item_Product_Wrapper> quickQuoteWrapper = new List<Quote_Line_Item_Product_Wrapper>();
        List<Quote_Line_Item_Product_Wrapper> Wrapper = Quote_Line_Item_Product_Wrapper.getQuickQuoteWrappers(this.oppId, this.quoteIds);
        if(Wrapper != null && Wrapper.size() >0){
            for(Quote_Line_Item_Product_Wrapper wrap : Wrapper) {
                if(wrap.category == 'Installation') {
                    quickQuoteWrapper.add(wrap);
                }
            }
        }
        
        totalNRCValue2 = 0;
        NumSQIs2 = 0;
        for(Quote_Line_Item_Product_Wrapper sqi : quickQuoteWrapper)
        {
            NumSQIs2++;
            totalNRCValue2 += sqi.NRC;
        }
        
        totalUpfrontCostHardware += totalNRCValue2;
        
        return quickQuoteWrapper;
    }
    
    public List<Quote_Line_Item_Product_Wrapper> getThirdQuickQuoteWrapper() {
        List<Quote_Line_Item_Product_Wrapper> quickQuoteWrapper = new List<Quote_Line_Item_Product_Wrapper>();
        List<Quote_Line_Item_Product_Wrapper> Wrapper = Quote_Line_Item_Product_Wrapper.getQuickQuoteWrappers(this.oppId, this.quoteIds);
        if(Wrapper != null && Wrapper.size() >0){
            for(Quote_Line_Item_Product_Wrapper wrap : Wrapper) {
                if(wrap.category == 'Hardware/Matls') {
                    quickQuoteWrapper.add(wrap);
                }
            }
        }
        
        totalNRCValue3 = 0;
        totalMRCValue3 = 0;
        NumSQIs3 = 0;
        for(Quote_Line_Item_Product_Wrapper sqi : quickQuoteWrapper)
        {
            NumSQIs3++;
            totalNRCValue3 += sqi.TotalNRC;
            totalMRCValue3 += sqi.TotalCharge;
        }
        
        totalUpfrontCostHardware += totalNRCValue3;
        totalMonthlyRecurringCharge += totalMRCValue3;
        monthlyRecurringHardware += totalMRCValue3;
        
        return quickQuoteWrapper;
    }
    
    public List<Quote_Line_Item_Product_Wrapper> getFourthQuickQuoteWrapper() {
        List<Quote_Line_Item_Product_Wrapper> quickQuoteWrapper = new List<Quote_Line_Item_Product_Wrapper>();
        List<Quote_Line_Item_Product_Wrapper> Wrapper = Quote_Line_Item_Product_Wrapper.getQuickQuoteWrappers(this.oppId, this.quoteIds);
        if(Wrapper != null && Wrapper.size() >0){
            for(Quote_Line_Item_Product_Wrapper wrap : Wrapper) {
                if(wrap.category == 'Phone Power') {
                    quickQuoteWrapper.add(wrap);
                }
            }
        }
        
        totalUnitPriceNRCValue4 = 0;
        totalNRCValue4 = 0;
        NumSQIs4 = 0;
        for(Quote_Line_Item_Product_Wrapper sqi : quickQuoteWrapper)
        {
            NumSQIs4++;
            totalUnitPriceNRCValue4 += sqi.AdjustedNRC;
            totalNRCValue4 += sqi.NRC;
        }
        
        totalUpfrontCostHardware += totalNRCValue4;
        
        return quickQuoteWrapper;
    }
    
    public List<Quote_Line_Item_Product_Wrapper> getFifthQuickQuoteWrapper() {
        List<Quote_Line_Item_Product_Wrapper> quickQuoteWrapper = new List<Quote_Line_Item_Product_Wrapper>();
        List<Quote_Line_Item_Product_Wrapper> Wrapper = Quote_Line_Item_Product_Wrapper.getQuickQuoteWrappers(this.oppId, this.quoteIds);
        if(Wrapper != null && Wrapper.size() >0){
            for(Quote_Line_Item_Product_Wrapper wrap : Wrapper) {
                if(wrap.category == 'Write-In Parts') {
                    quickQuoteWrapper.add(wrap);
                }
            }
        }
        
        totalNRCValue5 = 0;
        totalMRCValue5 = 0;
        NumSQIs5 = 0;
        for(Quote_Line_Item_Product_Wrapper sqi : quickQuoteWrapper)
        {
            NumSQIs5++;
            totalNRCValue5 += sqi.TotalNRC;
            totalMRCValue5 += sqi.TotalCharge;
        }
        
        totalUpfrontCostHardware += totalNRCValue5;
        totalMonthlyRecurringCharge += totalMRCValue5;
        monthlyRecurringHardware += totalMRCValue5;
        
        return quickQuoteWrapper;
    }
}