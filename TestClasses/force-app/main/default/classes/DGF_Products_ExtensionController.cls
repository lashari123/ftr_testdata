public class DGF_Products_ExtensionController {
    private DGF__c currentDGF;
    private Id opportunityId;
    public List<SterlingQuoteItem__c> quoteItems { get; set; }
    public Boolean showQuoteItems { get; set; }
    public DGF_Products_ExtensionController(ApexPages.StandardController stdController) {
        this.currentDGF = (DGF__c)stdController.getRecord();
        this.opportunityId = this.currentDGF.Opportunity__c;
        this.quoteItems = DGF_Utilities.getQuoteItems(this.opportunityId);
        this.showQuoteItems = quoteItems.size() > 0;
    }
}