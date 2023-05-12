public class DGF_ExtensionController {
    //public List<SterlingQuoteItem__c> quoteItems { get; set; }
    //public Boolean showQuoteItems { get; set; }
    private DGF__c ThisDGF;
    private Id ThisDGFId;
    private Map<Id, DGF_Utilities.UNI_BW_Properties> uniProps;
    private List<EVC_UNI_Association__c> junctions;
    public DGF_ExtensionController(ApexPages.StandardController stdController) {
        this.ThisDGF = (DGF__c)stdController.getRecord();
        this.ThisDGFId = stdController.getId();
        this.junctions = DGF_Utilities.getAllEvcUniJunctionsForDgf(this.ThisDGFId);
        this.uniProps = DGF_Utilities.GetMapFromEvcUniJunctions(junctions);
        if (hasBandwidthOverrun(uniProps)){
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'EVC Adjusted Bandwidth is higher than Speed on one of the UNIs. Adjust UNI Speed, UNI Oversubscribe, or EVC Bandwidth to correct this issue.'));
        }
    }
    private Boolean hasBandwidthOverrun(Map<Id,DGF_Utilities.UNI_BW_Properties> uniProps) {
        Set<Id> unis = uniProps.keySet();
        for (Id uni : unis) {
            if (uniProps.get(uni).IsOverrun) return true;
        }
        return false;
    }
}