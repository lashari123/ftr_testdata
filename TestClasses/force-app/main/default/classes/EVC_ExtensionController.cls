public with sharing class EVC_ExtensionController {
    public SelectOption[] selectedUNIs { get; set; }
    public SelectOption[] UNIOptions { get; set; }
    public List<EVC_UNI_Association__c> linkedUNIs { get; set; }
    public String iiDisabled { get; set; }
    public String CE_VLAN_Disabled { get; set; }
    public String CE_VLAN_ID_Disabled { get; set; }
    public String CustomSLADisabled { get; set; }
    public Boolean CE_VLAN_2_Rendered { get; set; }
    public String CE_VLAN_ID_Label { get; set; }
    public String CE_VLAN_ID_2_Label { get; set; }
    public String CE_VLAN_ID_Preservation_Label { get; set; }
    public String CE_VLAN_ID_Preservation_2_Label { get; set; }
    //public String RouterTerminationDisabled { get; set; }
    public String DGFProduct { get; set; }
    public String ClassOfServiceDisabled { get; set; }
    Public List<SelectOption> EVCSubtypeOptions { get; set; }
    
    private DGF__c currentDGF;
    private Id currentEVCId;
    private Id currentDGFId;
    private EVC__c currentEVC;
    private ApexPages.StandardController stdCtrl = null;
    private List<EVC_UNI_Association__c> allJunctions;
    private Map<Id, DGF_Utilities.UNI_BW_Properties> uniProps;
    
    public EVC_ExtensionController() {}
    
    public EVC_ExtensionController(ApexPages.StandardController stdController) {
        this.stdCtrl = stdController;
        selectedUNIs = new SelectOption[]{};
        UNIOptions = new SelectOption[]{};
        currentEVC = (EVC__c)stdController.getRecord();
        this.currentEVCId = ApexPages.currentPage().getParameters().get('id');
        Id dgfParam = ApexPages.currentPage().getParameters().get('dgf');
        if (dgfParam != null) {
            this.currentEVC.DGF__c = dgfParam;
        } else {
            dgfParam = this.currentEVC.DGF__c;
        }
        if (this.currentEVCId != null) this.linkedUNIs = getCurrentlyLinkedUnis(currentEVCId);
        selectedUNIs = getCurrentlyLinkedUniOptions(linkedUNIs);
        this.currentDGFId = dgfParam != null ? dgfParam : this.currentEVC.DGF__c;
        this.currentDGF = [SELECT Product_Requested2__c FROM DGF__c WHERE Id = :currentDGFId LIMIT 1][0];
        this.DGFProduct = currentDGF.Product_Requested2__c;
        this.ClassOfServiceDisabled = 'false';
		this.CE_VLAN_ID_Disabled = null;
        this.CE_VLAN_2_Rendered = this.CurrentEVC.Type__c == 'ELINE';
        this.CE_VLAN_ID_Label = this.CE_VLAN_ID_2_Label = 'CE-VLAN Id';
        this.CE_VLAN_ID_Preservation_Label = this.CE_VLAN_ID_Preservation_2_Label = 'CE-VLAN Id Preservation';
        this.EVCSubtypeOptions = getPicklistValueSelectOptions(EVC__c.Subtype__c.getDescribe());
        List<Id> linkedUniIds = getLinkedUNIIds(this.linkedUNIs);
        this.UNIOptions = getAvailableUNIs(currentDGFId, linkedUniIds);
        this.allJunctions = DGF_Utilities.getAllEvcUniJunctionsForDgf(this.currentDGFId);
        this.uniProps = DGF_Utilities.GetMapFromEvcUniJunctions(allJunctions);
        for (Id uniId : linkedUniIds) {
            DGF_Utilities.UNI_BW_Properties uniProp = uniProps.get(uniId);
            if (uniProp != null && uniProp.IsOverrun == true) {
                ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Adjusted Bandwidth is higher than UNI Speed for one of the linked UNIs. Adjust UNI Speed, UNI Oversubscribe, or EVC Bandwidth to correct this issue.'));            
            	break;
            }
        }
    }
    
    public PageReference doCancel() {
        PageReference temp = this.stdCtrl.cancel();
        return new PageReference('/' + this.currentEVC.DGF__c);
    }

    @TestVisible private static List<Id> getLinkedUNIIds(List<EVC_UNI_Association__c> junction) {
        List<Id> UNIIds = new List<Id>();
        if (junction != null) {
            for (EVC_UNI_Association__c j : junction) {
                UNIIds.add((Id)j.UNI__c);
            }
        }
        return UNIIds;
    }

    @TestVisible private static SelectOption[] getAvailableUNIs (id DGFId, List<Id> currentlyLinkedUniIds) {
        // Do not comment out the debug line below
        // for some reason, salesforce is failing to completely resolve currentlyLinkedUniIds
        // and the debug line is doing something to force that resolution
        // without the debug line, this method will return all UNIs, not just the currently unselected ones for this EVC
        // :-(
        System.debug('currentlyLinkedUniIds: ' + currentlyLinkedUniIds);
        
        SelectOption[] res = new SelectOption[]{};
        List<UNI__c> availableUNIs = [SELECT Id, Name FROM UNI__c WHERE Physical_Site__r.DGF__c = :DGFId];
        for (UNI__c u : availableUNIs) {
            if (!currentlyLinkedUniIds.contains(u.Id)) {
               res.add(new SelectOption(u.Id, u.Name));
            }
        }
        return res;
    }
    
    @TestVisible private static SelectOption[] getCurrentlyLinkedUniOptions(List<EVC_UNI_Association__c> UNIs) {
        SelectOption[] res = new SelectOption[]{};
            if (UNIs != null) {
                for (EVC_UNI_Association__c u : UNIs) {
                    res.add(new SelectOption((String)u.UNI__c, u.UNI__r.Name));
                }    
            }        
        return res;
    }
    
    @TestVisible private static List<EVC_UNI_Association__c> getCurrentlyLinkedUnis(Id EVCId) {
        return [SELECT Id, UNI__r.Id, UNI__r.Name, UNI__r.Bandwidth_Overrun__c, UNI__r.Speed_Value__c, UNI__r.Oversubscription_Value__c FROM EVC_UNI_Association__c WHERE EVC__c = :EVCId];
    }
    
    @TestVisible private static Boolean isCeVlanIdValid(Integer ceVlanId) {
        return ceVlanId == null || (ceVlanId > -1 && ceVlanId < 4097);
    }
    
    public PageReference saveAndNewEVC() {
        if (!validateUnis(this.selectedUNIs, this.currentEVC.Type__c)) return null;
        if (this.currentEVC.Type__c == 'EIA') {
            this.currentEVC.Interstate_Intrastate__c = 'Interstate';
            this.currentEVC.Subtype__c = 'Internet';
        }
        if (this.currentEVC.Type__c != 'ELINE') this.currentEVC.Class_of_Service__c = 'Silver';
        
        if (!isCeVlanIdValid(Integer.valueOf(this.currentEVC.CE_VLAN_ID__c)) || !isCeVlanIdValid(Integer.valueOf(this.currentEVC.CE_VLAN_ID2__c))) {
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'CE-VLAN Id must be between 0 and 4094.'));            
            return null;
        }
        
        upsert this.currentEVC;
        
        List<EVC_UNI_Association__c> currentAssociations = getCurrentAssociations(this.currentEVC.Id);
        delete getAssociationsToDelete(this.selectedUNIs, currentAssociations);
        insert getAssociationsToAdd(this.currentEVC.Id, this.currentDGF.Id, this.selectedUNIs, currentAssociations);
 		DGF_Utilities.updateAllCnlSpeedsInDgf(this.currentDGF.Id);
       
		Schema.DescribeSObjectResult describeResult = this.stdCtrl.getRecord().getSObjectType().getDescribe(); 
        PageReference pg = new PageReference('/' + describeResult.getKeyPrefix() + '/e?');
        pg.getParameters().put('dgf',currentDGFId);
        pg.setRedirect(true);
        return pg;
    }
    
    public PageReference saveEVC() {
        if (!isCeVlanIdValid(Integer.valueOf(this.currentEVC.CE_VLAN_ID__c)) || !isCeVlanIdValid(Integer.valueOf(this.currentEVC.CE_VLAN_ID2__c))) {
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'CE-VLAN Id must be between 0 and 4094.'));            
            return null;
        }
        
        if (!validateUnis(this.selectedUNIs, this.currentEVC.Type__c)) {
			return null;            
        }
        
        upsert this.currentEVC;
        List<EVC_UNI_Association__c> currentAssociations = getCurrentAssociations(this.currentEVC.Id);
        delete getAssociationsToDelete(this.selectedUNIs, currentAssociations);
        insert getAssociationsToAdd(this.currentEVC.Id, this.currentDGF.Id, this.selectedUNIs, currentAssociations);
		DGF_Utilities.updateAllCnlSpeedsInDgf(this.currentDGF.Id);
        PageReference pg = new PageReference('/' + this.currentEVC.Id);        
        return pg;
    }

    @TestVisible private static Boolean validateUNIs(SelectOption[] unis, String type) {
        Integer n = unis.size();
        if (type == 'EIA' && n > 1) {
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Only 1 UNI allowed for EIA.'));
            return false;
        }
        if (type == 'ELINE' && n > 2) {
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'No more than 2 UNIs allowed for ELINE.'));
            return false;
        }
        return true;
    }

    @TestVisible private static List<EVC_UNI_Association__c> getCurrentAssociations(Id EVCId) {
        return [SELECT UNI__c FROM EVC_UNI_Association__c WHERE EVC__c = :EVCId];
    }
    
    @TestVisible private static List<EVC_UNI_Association__c> getAssociationsToAdd(Id EVCId, Id DGFId, SelectOption[] selectedUNIOptions, List<EVC_UNI_Association__c> currentAssociations) {
        Set<Id> uniIds = getUniIdsFromAssociationList(currentAssociations);
        List<EVC_UNI_Association__c> junctions = new List<EVC_UNI_Association__c>();
        for (SelectOption u : selectedUNIOptions) {
            Id uni = u.getValue();
            if (!uniIds.contains(uni)) {
	            junctions.add(New EVC_UNI_Association__c(EVC__c = EVCId, UNI__c = uni, DGF_Id__c = DGFId));
            }
        }
        return junctions;
    }
    
    @TestVisible private static Set<Id> getUniIdsFromAssociationList(List<EVC_UNI_Association__c> junctions) {
        Set<Id> uniIds = new Set<Id>();
        for (EVC_UNI_Association__c j : junctions) {
            uniIds.add(j.UNI__c);
        }
        return uniIds;
    }

    @TestVisible private static Set<Id> getUniIdsFromSelectedUnis(SelectOption[] selectedUNIOptions) {
        Set<Id> uniIds = new Set<Id>();
        for (SelectOption o : selectedUNIOptions) {
            uniIds.add(o.getValue());
        }
        return uniIds;
    }
    
    @TestVisible private static List<EVC_UNI_Association__c> getAssociationsToDelete(SelectOption[] selectedUNIOptions, List<EVC_UNI_Association__c> currentAssociations ) {
		Set<Id> selectedUniIds = getUniIdsFromSelectedUnis(selectedUNIOptions);
        List<EVC_UNI_Association__c> associationsToDelete = new List<EVC_UNI_Association__c>();
        for (EVC_UNI_Association__c j : currentAssociations) {
            if (!selectedUniIds.contains(j.UNI__c)) {
                associationsToDelete.add(j);
            }
        }
        return associationsToDelete;
    }
    
    public List<SelectOption> getEVCTypeOptions() {
        return getPicklistValueSelectOptions(EVC__c.Type__c.getDescribe());
    }
    
    public List<SelectOption> getEVCBandwidthOptions() {
        return getPicklistValueSelectOptions(EVC__c.Bandwidth__c.getDescribe());
    }
    
    public List<SelectOption> getEVCServiceClassOptions() {
        if (this.DGFProduct == 'ELAN') return new List<SelectOption>{new SelectOption('Silver','Silver')};
        return getPicklistValueSelectOptions(EVC__c.Class_of_Service__c.getDescribe());
    }
    
    public List<SelectOption> getInterstateIntrastateOptions() {
        return getPicklistValueSelectOptions(EVC__c.Interstate_Intrastate__c.getDescribe());
    }

    private static List<SelectOption> getPicklistValueSelectOptions(Schema.DescribeFieldResult fieldResult) {
        List<SelectOption> picklistValueSelectOptions = new List<SelectOption>();
        List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
        for (Schema.PicklistEntry p : ple) {
            picklistValueSelectOptions.add(new SelectOption(p.getValue(),p.getLabel()));
        }
        return picklistValueSelectOptions;
    }

}