public class AssetTreeItems {
    @AuraEnabled
    public String name {get;set;}
    @AuraEnabled
    public String label {get;set;}
    @AuraEnabled
    public String metatext {get;set;}
    @AuraEnabled
    public Boolean expanded {get;set;}    
    @AuraEnabled
    public String state {get;set;}        
    @AuraEnabled
    public String city {get;set;}
    @AuraEnabled
    public String street {get;set;}    
    @AuraEnabled
    public List<AssetTreeItems> items {get;set;}
}