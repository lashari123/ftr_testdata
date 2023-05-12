global class WS_SFDC_Datatypes{
    
    public class sObjectDescribe{
        public String name {get;set;}
        public String label {get;set;}
        public Boolean customSetting {get;set;}
        public Boolean undeletable {get;set;}
        public Boolean mergeable {get;set;}
        public Boolean replicateable {get;set;}
        public Boolean triggerable {get;set;}
        public Boolean feedEnabled {get;set;}
        public Boolean retrieveable {get;set;}
        public Boolean deprecatedAndHidden {get;set;}
        public WS_SFDC_Datatypes.sObjectDescribeURIs urls {get;set;}
        public WS_SFDC_Datatypes.sObjectFieldDescribe[] fields {get;set;}
        public Boolean custom {get;set;}
        public String keyPrefix {get;set;}
        public Boolean searchable {get;set;}
        public Boolean activateable {get;set;}
        public Boolean layoutable {get;set;}
        public String labelPlural {get;set;}
        public Boolean queryable {get;set;}
        public Boolean createable {get;set;}
        public Boolean deletable {get;set;}
        public Boolean updateable {get;set;}        
    }
    
    public class sObjectDescribeURIs{       
        public String describe {get;set;}
        public String layouts {get;set;}
        public String rowTemplate {get;set;}
        public String sobject_x {get;set;}
        public String uiEditTemplate {get;set;}
        public String uiDetailTemplate {get;set;}
        public String uiNewRecord {get;set;}
    }
    
    public class sObjectFieldDescribe{
        public Boolean autoNumber {get;set;}
        public Integer byteLength {get;set;}
        public Boolean calculated {get;set;}
        public String calculatedFormula {get;set;}
        public Boolean cascadeDelete {get;set;}
        public Boolean caseSensitive {get;set;}
        public String controllerName {get;set;} 
        public Boolean createable {get;set;}
        public Boolean custom {get;set;}
        public String defaultValue {get;set;}
        public String defaultValueFormula {get;set;}
        public Boolean defaultedOnCreate {get;set;}
        public Boolean dependentPicklist {get;set;}
        public Boolean deprecatedAndHidden {get;set;}       
        public Integer digits {get;set;}
        public Boolean displayLocationInDecimal {get;set;}
        public Boolean externalId {get;set;}
        public Boolean filterable {get;set;}
        public Boolean groupable {get;set;}
        public Boolean htmlFormatted {get;set;}
        public Boolean idLookup {get;set;} 
        public String inlineHelpText {get;set;}
        public String label {get;set;}
        public Integer length {get;set;}
        public String name {get;set;}
        public Boolean nameField {get;set;}
        public Boolean namePointing {get;set;}
        public Boolean nillable {get;set;}
        public Boolean permissionable {get;set;}
        //public String[] picklistValues {get;set;}
        public Integer precision {get;set;}
        //public String[] referenceTo {get;set;}
        public String relationshipName {get;set;}
        public String relationshipOrder {get;set;}
        public Boolean restrictedDelete {get;set;}
        public Boolean restrictedPicklist {get;set;}
        public Integer scale {get;set;}
        public String soapType {get;set;}
        public Boolean sortable {get;set;}
        public String type {get;set;}
        public Boolean unique {get;set;}
        public Boolean updateable {get;set;}        
        public Boolean writeRequiresMasterRead {get;set;}
    }
    
    public class LoginResponse{
        public String id {get;set;}
        public String issued_at {get;set;}
        public String instance_url {get;set;}
        public String signature {get;set;}
        public String access_token {get;set;}
    }
    
    
    
    global class sObjectCollection{
        public sObject__c sObjectRecord {get;set;}
        public Map<String,sObjectField__c> sObjectFields {get;set;}
    }
}