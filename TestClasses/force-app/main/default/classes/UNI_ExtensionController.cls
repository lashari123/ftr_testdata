public with sharing class UNI_ExtensionController {
    public Integer EVCBWAssigned { get; set; }
    public String UNITag { get; set; }
    public List<EVC_UNI_Association__c> LinkedEVCs { get; set; }
    private Map<Id, DGF_Utilities.UNI_BW_Properties> uniProps;
    public Integer EVCSize { get; set; }
    public String TagNotes { get; set; }
    private UNI__c currentUNI;
    private final Id currentUNIId;
    ApexPages.StandardController stdCtrl;
    public UNI_ExtensionController() {}
    public UNI_ExtensionController(ApexPages.StandardController stdController) {
        this.stdCtrl = stdController;
        this.currentUNI = (UNI__c)stdController.getRecord();
        this.currentUNIId = stdController.getId();
        PageReference curPage = ApexPages.currentPage();
        if (this.currentUNIId == null) this.currentUNI.Enabled__c = true;
        Map<String,String> params = curPage.getParameters();
        Id dgfId = params.get('dgf');
        if (dgfId != null) this.currentUNI.DGF_Id__c = dgfId;
        Id siteId = params.get('site');
        if (siteId != null) this.currentUNI.Physical_Site__c = siteId;
        if (this.currentUNI.DGF_Id__c == null){
            this.currentUNI.DGF_Id__c = [SELECT DGF__c FROM Physical_Site__c WHERE Id = :this.currentUNI.Physical_Site__c LIMIT 1].DGF__c;
        }
        this.LinkedEVCs = getLinkedEVCList(this.currentUNIId); 
        this.uniProps = DGF_Utilities.GetMapFromEvcUniJunctions(this.LinkedEVCs);
        this.EVCSize = LinkedEVCs.size();
        DGF_Utilities.UNI_BW_Properties uniProp = uniProps.get(this.CurrentUNIId);
        if (uniProp != null) {
            this.currentUNI.UNI_Rate_Adjusted_BW__c = uniProp.Adjusted_BW;
            if(uniProp.IsOverrun)
                ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Adjusted Bandwidth is higher than Speed. Adjust Speed, Oversubscribe, or EVC Bandwidth to correct this issue.'));
        } 
        this.UNITag = currentUNI.Tag_Value__c;
    }
    
    public PageReference saveNew() {
        this.stdCtrl.save();
        Schema.DescribeSObjectResult describeResult = this.stdCtrl.getRecord().getSObjectType().getDescribe(); 
        PageReference pg = new PageReference('/' + describeResult.getKeyPrefix() + '/e?dgf=' + this.currentUNI.DGF_Id__c + '&site=' + this.currentUNI.Physical_Site__c);
        pg.setRedirect(true);
        return pg;
    }
    
    @TestVisible private static Integer computeEVCBWAssigned(Id UNIID) {
        List<EVC_UNI_Association__c> junctions = [SELECT EVC__r.Bandwidth__c FROM EVC_UNI_Association__c WHERE UNI__c = :UNIID];
        Integer res = 0;
        for (EVC_UNI_Association__c j : junctions) {
            if ((j.EVC__r.Bandwidth__c).isNumeric()) {
                res += Integer.valueOf(j.EVC__r.Bandwidth__c);
            }
        }
        return res;
    }

    public List<SelectOption> getPhysicalMediumOptions() {
        List<SelectOption> objPhysicalMedia = new List<SelectOption>();
        List<String> media = new List<String> {'--None--','Copper RJ45','Fiber Singlemode 1310nm','Fiber Multimode 850nm'};
        for (String m : media){
            objPhysicalMedia.add(new SelectOption(m,m));
        }
        return objPhysicalMedia;
    }
    public List<SelectOption> getTagOptions() {
        return VisualForceUtilities.getPicklistValueSelectOptions(UNI__c.Tag__c.getDescribe());
    }
    
    public List<SelectOption> getSpeedOptions() {
        return VisualForceUtilities.getPicklistValueSelectOptions(UNI__c.Speed__c.getDescribe());
    }
    
    public List<SelectOption> getModeOptions() {
        return VisualForceUtilities.getPicklistValueSelectOptions(UNI__c.Mode__c.getDescribe());
    }
    
    public List<SelectOption> getNegotiationOptions() {
        return VisualForceUtilities.getPicklistValueSelectOptions(UNI__c.Negotiation__c.getDescribe());
    }
    
    public List<SelectOption> getFrameSizeOptions() {
        return VisualForceUtilities.getPicklistValueSelectOptions(UNI__c.Frame_Size__c.getDescribe());
    }
    
    public List<SelectOption> getOversubscriptionOptions() {
        return VisualForceUtilities.getPicklistValueSelectOptions(UNI__c.Oversubscription__c.getDescribe());
    }
    
    public String Search_CID() {return '';}
    
    public List<EVC_UNI_Association__c> getLinkedEVCList(Id UNIId) {
        if (UNIId == null) return new List<EVC_UNI_Association__c>();
        return [SELECT Id, 
                UNI__c, 
                UNI__r.Speed_Value__c, 
                UNI__r.Oversubscription_Value__c, 
                UNI__r.Physical_Site__c,
                EVC__c, 
                EVC__r.Bandwidth_Value__c 
                FROM EVC_UNI_Association__c 
                WHERE UNI__c = :UNIId
                AND EVC__c != null];
    }
}