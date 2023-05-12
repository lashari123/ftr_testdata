public class FTRWSDSATAddressResponse {
    
    public FTRWSDSATAddressResponse() {
 
    }
    
    public @AuraEnabled String businessName{get;set;}
    public @AuraEnabled String dsatId{get;set;}
    public @AuraEnabled String vfoRecordId{get;set;}
    public @AuraEnabled String m6OrderNumber{get;set;}
    public @AuraEnabled String createdBy{get;set;}
    public @AuraEnabled String creatorEmail{get;set;}
    public @AuraEnabled String createdById {get;set;} 
    
    public @AuraEnabled String opened{get;set;}
    public @AuraEnabled boolean inFootprint{get;set;}
    public @AuraEnabled String market{get;set;}
    public @AuraEnabled String level{get;set;}
    public @AuraEnabled String products{get;set;}
    public @AuraEnabled String wireCenterCLLI{get;set;}
    

    public @AuraEnabled String siteName{get;set;}
    public @AuraEnabled String wireCenterQoS{get;set;}
    public @AuraEnabled String wireCenterSpeed{get;set;}
    public @AuraEnabled boolean litBuilding{get;set;}
    public @AuraEnabled String fiberDistance{get;set;}

    public @AuraEnabled String copperDistance{get;set;}
    public @AuraEnabled String fiberTier{get;set;}
    public @AuraEnabled String copperTier{get;set;}
    public @AuraEnabled String Address{get;set;}
    public @AuraEnabled String City{get;set;}
    public @AuraEnabled String State{get;set;}
    public @AuraEnabled String ZipCode{get;set;}
    public @AuraEnabled String latitude{get;set;}
    public @AuraEnabled String longitude{get;set;}
    public @AuraEnabled String fiberQualification{get;set;}
    public @AuraEnabled String copperQualification{get;set;}
    public @AuraEnabled String HBE_Legacy{get;set;} 
    public @AuraEnabled String Nearby_HBE_SWC_CLLI{get;set;} // change tst to hbe
    
        
        
}