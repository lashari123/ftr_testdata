/**
 * This class contains unit tests for validating the behavior of Apex classes
 * and triggers.
 *
 * Unit tests are class methods that verify whether a particular piece
 * of code is working properly. Unit test methods take no arguments,
 * commit no data to the database, and are flagged with the testMethod
 * keyword in the method definition.
 *
 * All test methods in an organization are executed whenever Apex code is deployed
 * to a production organization to confirm correctness, ensure code
 * coverage, and prevent regressions. All Apex classes are
 * required to have at least 75% code coverage in order to be deployed
 * to a production organization. In addition, all triggers must have some code coverage.
 * 
 * The @isTest class annotation indicates this class only contains test
 * methods. Classes defined with the @isTest annotation do not count against
 * the organization size limit for all Apex scripts.
 *
 * See the Apex Language Reference for more information about Testing and Code Coverage.
 */
@isTest (SeeAllData=true)
private class Test_WS_SFDC_Datatypes {

    static testMethod void myUnitTest() {
        // TO DO: implement unit test
        
         WS_SFDC_Datatypes.sObjectDescribeURIs sObjDesUr = new WS_SFDC_Datatypes.sObjectDescribeURIs();
        sObjDesUr.describe = 'adsf';
        sObjDesUr.layouts = 'adsf';
        sObjDesUr.rowTemplate = 'adsf';
        sObjDesUr.sobject_x = 'adsf';
        sObjDesUr.uiEditTemplate = 'adsf';
        sObjDesUr.uiDetailTemplate = 'adsf';
        sObjDesUr.uiNewRecord = 'adsf';
        
        
        WS_SFDC_Datatypes.sObjectFieldDescribe sObjFld = new WS_SFDC_Datatypes.sObjectFieldDescribe();
        sObjFld.autoNumber = true;
        sObjFld.byteLength = 1;
        sObjFld.calculated = true;
        sObjFld.calculatedFormula = 'asdf';
        sObjFld.cascadeDelete = true;
        sObjFld.caseSensitive = true;
        sObjFld.controllerName = 'asdf';    
        sObjFld.createable = true;
        sObjFld.custom = true;
        sObjFld.defaultValue = 'asdf';
        sObjFld.defaultValueFormula = 'asdf';
        sObjFld.defaultedOnCreate = true;
        sObjFld.dependentPicklist = true;
        sObjFld.deprecatedAndHidden = true;     
        sObjFld.digits = 1;
        sObjFld.displayLocationInDecimal = true;
        sObjFld.externalId = true;
        sObjFld.filterable = true;
        sObjFld.groupable = true;
        sObjFld.htmlFormatted = true;
        sObjFld.idLookup = true; 
        sObjFld.inlineHelpText = 'asdf';
        sObjFld.label = 'asdf';
        sObjFld.length = 1;
        sObjFld.name = 'asdf';
        sObjFld.nameField = true;
        sObjFld.namePointing = true;
        sObjFld.nillable = true;
        sObjFld.permissionable = true;
        sObjFld.precision = 1;
        sObjFld.relationshipName = 'asdf';
        sObjFld.relationshipOrder = 'asdf';
        sObjFld.restrictedDelete = true;
        sObjFld.restrictedPicklist = true;
        sObjFld.scale = 1;
        sObjFld.soapType = 'asdf';
        sObjFld.sortable = true;
        sObjFld.type = 'asdf';
        sObjFld.unique = true;
        sObjFld.updateable = true;      
        sObjFld.writeRequiresMasterRead = true;
        
        
        WS_SFDC_Datatypes.sObjectDescribe sObjDes = new WS_SFDC_Datatypes.sObjectDescribe();
        sObjDes.name = 'asbf';
        sObjDes.label = 'asbf';
        sObjDes.customSetting = true;
        sObjDes.undeletable = true;
        sObjDes.mergeable = true;
        sObjDes.replicateable = true;
        sObjDes.triggerable = true;
        sObjDes.feedEnabled = true;
        sObjDes.retrieveable = true;
        sObjDes.deprecatedAndHidden = true;
        sObjDes.urls = sObjDesUr;
        sObjDes.fields = new WS_SFDC_Datatypes.sObjectFieldDescribe[]{};
        sObjDes.fields.add(sObjFld );
        sObjDes.custom = true;
        sObjDes.keyPrefix = 'asbf';
        sObjDes.searchable = true;
        sObjDes.activateable = true;
        sObjDes.layoutable = true;
        sObjDes.labelPlural = 'asbf';
        sObjDes.queryable = true;
        sObjDes.createable = true;
        sObjDes.deletable = true;
        sObjDes.updateable = true;  
        
        
        WS_SFDC_Datatypes.LoginResponse lgnRes = new WS_SFDC_Datatypes.LoginResponse();
        lgnRes.id = 'asdf';
        lgnRes.issued_at = 'asdf';
        lgnRes.instance_url = 'asdf';
        lgnRes.signature = 'asdf';
        lgnRes.access_token = 'asdf';
        
        
        
        WS_SFDC_Datatypes.sObjectCollection sObjCol = new WS_SFDC_Datatypes.sObjectCollection();
        /*public sObject__c sObjectRecord {get;set;}
        public Map<String,sObjectField__c> sObjectFields {get;set;}
        sObjCol.sObjectFields = new Map<String,sObjectField__c>();
        sObjCol.sObjectFields.put('asdf', );
        */
        sObject__c sObj = new sObject__c ();
        sObjCol.sObjectRecord = sObj;
        
    }
}