public class Physical_Site_ExtensionController {
	public Integer cnlSpeed { get; set; }
    public Physical_Site_ExtensionController(ApexPages.StandardController stdController) {
        this.cnlSpeed = DGF_Utilities.getSiteCnlSpeed((Physical_Site__c)stdController.getRecord());
    }
}