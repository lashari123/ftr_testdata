public class WS_SFDC{
    
    public static WS_SFDC_Datatypes.LoginResponse Login(){
        HttpRequest Request = new HttpRequest();
        //Request.setEndpoint(WS_SFDC_Settings__c.getOrgDefaults().URI_oAuth__c);//('https://test.salesforce.com/services/oauth2/token');
        Request.setEndpoint('https://test.salesforce.com/services/oauth2/token');
        Request.setMethod('GET');
        Request.setHeader('Content-Type','application/x-www-form-urlencoded');
        Request.setBody(
            'grant_type=' + WS_SFDC_Settings__c.getOrgDefaults().oAuth_GrantType__c + '&' +//'grant_type=password&' + 
            'client_id=' + WS_SFDC_Settings__c.getOrgDefaults().oAuth_ClientId__c + '&' +//'client_id=3MVG9Gmy2zmPB01qzbozDdpMCSKut9TQncLtgUoY0bO1SIoSeZqAwQhOtQWWN86uV6.LvmbCzrYPPyX09y5Lr&' + 
            'client_secret=' + WS_SFDC_Settings__c.getOrgDefaults().oAuth_ClientSecret__c + '&' +//'client_secret=799990979001458073&' + 
            'username=' + WS_SFDC_Settings__c.getOrgDefaults().oAuth_Username__c + '&' +//'username=randy.buhrt%40ftr.com.sfa.esbdev&' + 
            'password=' + WS_SFDC_Settings__c.getOrgDefaults().oAuth_Password__c + WS_SFDC_Settings__c.getOrgDefaults().oAuth_SecurityToken__c//'password=M3k0milofgvxcAWEctXl6Lsq3K5E02YJX'
        );
        HttpResponse Response = new http().send(Request);
        return (WS_SFDC_Datatypes.LoginResponse)JSON.deserialize(Response.getbody(), WS_SFDC_Datatypes.LoginResponse.class);
    }
    
    public static WS_SFDC_Datatypes.sObjectCollection sObjectCollection(String SessionID, String sObjectName){
        HttpRequest Request = new HttpRequest();
        Request.setEndpoint('https://' + URL.getSalesforceBaseUrl().getHost() + '/services/data/v28.0/sobjects/' + sObjectName + '/describe');
        Request.setMethod('GET');
        Request.setHeader('Authorization','Bearer ' + SessionID);
        HttpResponse Response = new http().send(Request);
        if(Response.getStatusCode() == 200){
            WS_SFDC_Datatypes.sObjectDescribe sObjectDescribe = (WS_SFDC_Datatypes.sObjectDescribe)JSON.deserialize(Response.getBody().replace('"sobject"','"sobject_x"'),WS_SFDC_Datatypes.sObjectDescribe.class);
            WS_SFDC_Datatypes.sObjectCollection sObjectCollection = new WS_SFDC_Datatypes.sObjectCollection();
            sObjectCollection.sObjectRecord =
                new sObject__c(
                    Name = sObjectDescribe.name,
                    name__c = sObjectDescribe.name,
                    label__c = sObjectDescribe.label,
                    customSetting__c = sObjectDescribe.customSetting,
                    undeletable__c = sObjectDescribe.undeletable,
                    mergeable__c = sObjectDescribe.mergeable,
                    replicateable__c = sObjectDescribe.replicateable,
                    triggerable__c = sObjectDescribe.triggerable,
                    feedEnabled__c = sObjectDescribe.feedEnabled,
                    retrieveable__c = sObjectDescribe.retrieveable,
                    deprecatedAndHidden__c = sObjectDescribe.deprecatedAndHidden,
                    URI_describe__c = sObjectDescribe.urls.describe,
                    URI_layouts__c = sObjectDescribe.urls.layouts,                                      
                    URI_rowTemplate__c = sObjectDescribe.urls.rowTemplate,
                    URI_sObject__c = sObjectDescribe.urls.sobject_x,
                    URI_uiEditTemplate__c = sObjectDescribe.urls.uiEditTemplate,
                    URI_uiDetailTemplate__c = sObjectDescribe.urls.uiDetailTemplate,
                    URI_uiNewRecord__c = sObjectDescribe.urls.uiNewRecord,
                    custom__c = sObjectDescribe.custom,
                    keyPrefix__c = sObjectDescribe.keyPrefix,
                    searchable__c = sObjectDescribe.searchable,
                    activateable__c = sObjectDescribe.activateable,
                    layoutable__c = sObjectDescribe.layoutable,
                    labelPlural__c = sObjectDescribe.labelPlural,
                    queryable__c = sObjectDescribe.queryable,
                    createable__c = sObjectDescribe.createable,
                    deletable__c = sObjectDescribe.deletable,
                    updateable__c = sObjectDescribe.updateable
                );
                if(sObjectDescribe.fields != null){
                    sObjectCollection.sObjectFields = new Map<String,sObjectField__c>();
                    for(WS_SFDC_Datatypes.sObjectFieldDescribe sObjectField : sObjectDescribe.fields){
                        sObjectCollection.sObjectFields.put(
                            sObjectField.name,
                            new sObjectField__c(
                                autoNumber__c = sObjectField.autoNumber,
                                byteLength__c = sObjectField.byteLength,
                                calculated__c = sObjectField.calculated,
                                calculatedFormula__c = sObjectField.calculatedFormula,
                                cascadeDelete__c = sObjectField.cascadeDelete,
                                caseSensitive__c = sObjectField.caseSensitive,
                                controllerName__c = sObjectField.controllerName,
                                createable__c = sObjectField.createable,
                                custom__c = sObjectField.custom,
                                defaultValue__c = sObjectField.defaultValue,
                                defaultValueFormula__c = sObjectField.defaultValueFormula,
                                defaultedOnCreate__c = sObjectField.defaultedOnCreate,
                                dependentPicklist__c = sObjectField.dependentPicklist,
                                deprecatedAndHidden__c = sObjectField.deprecatedAndHidden,
                                digits__c = sObjectField.digits,
                                displayLocationInDecimal__c = sObjectField.displayLocationInDecimal,
                                externalId__c = sObjectField.externalId,
                                filterable__c = sObjectField.filterable,
                                groupable__c = sObjectField.groupable,
                                htmlFormatted__c = sObjectField.htmlFormatted,
                                idLookup__c = sObjectField.idLookup,
                                inlineHelpText__c = sObjectField.inlineHelpText,
                                label__c = sObjectField.label,
                                length__c = sObjectField.length,
                                name__c = sObjectField.name,
                                Name = sObjectField.name,
                                nameField__c = sObjectField.nameField,
                                namePointing__c = sObjectField.namePointing,
                                nillable__c = sObjectField.nillable,
                                permissionable__c = sObjectField.permissionable,
                                //picklistValues__c = sObjectField.picklistValues,
                                precision__c = sObjectField.precision,
                                //referenceTo__c = sObjectField.referenceTo,
                                relationshipName__c = sObjectField.relationshipName,
                                relationshipOrder__c = sObjectField.relationshipOrder,
                                restrictedDelete__c = sObjectField.restrictedDelete,
                                restrictedPicklist__c = sObjectField.restrictedPicklist,
                                scale__c = sObjectField.scale,
                                soapType__c = sObjectField.soapType,
                                sortable__c = sObjectField.sortable,
                                type__c = sObjectField.type,
                                unique__c = sObjectField.unique,
                                updateable__c = sObjectField.updateable,
                                writeRequiresMasterRead__c = sObjectField.writeRequiresMasterRead
                            )
                        );
                    }
                    //system.debug(sObjectCollection.sObjectFields);
                }
            return sObjectCollection;
        }else{
            return null;
        }
        //return null;
    }
    
    public static sObject__c sObjectDescribe(String SessionID, String sObjectName){     
        HttpRequest Request = new HttpRequest();
        Request.setEndpoint('https://' + URL.getSalesforceBaseUrl().getHost() + '/services/data/v28.0/sobjects/' + sObjectName + '/describe');
        Request.setMethod('GET');
        Request.setHeader('Authorization','Bearer ' + SessionID);
        HttpResponse Response = new http().send(Request);
        if(Response.getStatusCode() == 200){
            //system.debug(Response.getBody());
            WS_SFDC_Datatypes.sObjectDescribe sObjectDescribe = (WS_SFDC_Datatypes.sObjectDescribe)JSON.deserialize(Response.getBody().replace('"sobject"','"sobject_x"'),WS_SFDC_Datatypes.sObjectDescribe.class);
            system.debug(sObjectDescribe);
            sObject__c sObjectRecord =
                new sObject__c(
                    Name = sObjectDescribe.name,
                    name__c = sObjectDescribe.name,
                    label__c = sObjectDescribe.label,
                    customSetting__c = sObjectDescribe.customSetting,
                    undeletable__c = sObjectDescribe.undeletable,
                    mergeable__c = sObjectDescribe.mergeable,
                    replicateable__c = sObjectDescribe.replicateable,
                    triggerable__c = sObjectDescribe.triggerable,
                    feedEnabled__c = sObjectDescribe.feedEnabled,
                    retrieveable__c = sObjectDescribe.retrieveable,
                    deprecatedAndHidden__c = sObjectDescribe.deprecatedAndHidden,
                    URI_describe__c = sObjectDescribe.urls.describe,
                    URI_layouts__c = sObjectDescribe.urls.layouts,                                      
                    URI_rowTemplate__c = sObjectDescribe.urls.rowTemplate,
                    URI_sObject__c = sObjectDescribe.urls.sobject_x,
                    URI_uiEditTemplate__c = sObjectDescribe.urls.uiEditTemplate,
                    URI_uiDetailTemplate__c = sObjectDescribe.urls.uiDetailTemplate,
                    URI_uiNewRecord__c = sObjectDescribe.urls.uiNewRecord,
                    custom__c = sObjectDescribe.custom,
                    keyPrefix__c = sObjectDescribe.keyPrefix,
                    searchable__c = sObjectDescribe.searchable,
                    activateable__c = sObjectDescribe.activateable,
                    layoutable__c = sObjectDescribe.layoutable,
                    labelPlural__c = sObjectDescribe.labelPlural,
                    queryable__c = sObjectDescribe.queryable,
                    createable__c = sObjectDescribe.createable,
                    deletable__c = sObjectDescribe.deletable,
                    updateable__c = sObjectDescribe.updateable
                );
            return sObjectRecord;
        }else{
            return null;
        }               
    }
    
    public static void sObjects(){
        HttpRequest Request = new HttpRequest();
        Request.setEndpoint('https://' + URL.getSalesforceBaseUrl().getHost() + '/services/data/v28.0/sobjects/Account/describe');
        Request.setMethod('GET');
        Request.setHeader('Authorization','Bearer ' + UserInfo.getSessionId());
        HttpResponse Response = new http().send(Request);
        system.debug(Response.getBody());
    }
}