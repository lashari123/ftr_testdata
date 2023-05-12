/**************************************************************************************************
Name        :  ftr_VologyOpptyPresalesEmailService
Developer   :  RajuM
Description :  This Service is a Future callout to get send the email notification to Vology on SE Assinged on oppty
****************************************************************************************************/

global with sharing class ftr_VologyOpptyPresalesEmailService {       
    
    // Future callout to get send the email notification to Vology on SE Assinged on oppty 
    @future(callout=true)
    global static void sendVologyOpptyPresalesEmail(Set<Id> newOppIds){    
        
        List<Opportunity> lstOppty = [Select id,Name,owner.Name, owner.email,AccountId,Description__c,Lead_Product_List__c,SEER_Assigned_To__c,SEER_Assigned_To__r.Name,SEER_Assigned_To__r.Id,SEER_Assigned_To__r.Email,Account.Name,Account.ShippingStreet,Account.ShippingCity,Account.ShippingState,Account.ShippingStateCode,Account.ShippingPostalCode,VologyPreSalesEmailDeliveryStatus__c from Opportunity where id IN :newOppIds];
        
        Map<string, string> headerMap = new Map<string, string>();
        Map<string, object> metaDataMap = new Map<string, object>();
        String endpoint;
        String apikey;     
        String jsonString;        
        
        // get Integration Details i.e., endpoint(NamedCredentials),header,apikey and params from Custom Metadatatype 
        metaDataMap =  ftr_WebServiceCalloutUtility.getIntegrationDetails('VologyPresalesEmailAuthorize');
        System.debug('metaDataMap ====='+metaDataMap);
        
        if(!metaDataMap.isEmpty()){
            headerMap = (Map<string, string>)(metaDataMap.get('headers'));
            endpoint = String.valueOf(metaDataMap.get('endpoint'));
            apikey = String.valueOf(metaDataMap.get('apikey'));
        }
        
        headerMap.put('apikey',apikey);       
        System.debug('headerMap======='+headerMap);
        System.debug('endpoint========'+endpoint);       
        
        jsonString = JSONRequestMethod(lstOppty);        
        System.debug('jsonString==========='+jsonString);        
        
        // get HttpResponse from WebServiceCalloutUtility class
                       
        HttpResponse httpResponse = ftr_WebServiceCalloutUtility.callPostMethodService(headerMap, jsonString, endpoint);            
        
        String resBody = httpResponse.getBody();
        System.debug('Response======'+httpResponse); 
        System.debug('Body in Response======='+resBody);        
        
        if(httpResponse.getStatusCode() == 200){ // HTTP Status Success code -200 (OK)
            
            //Map<String, Object> results = (Map<String, Object>)JSON.deserializeUntyped(resBody); here String = response and rest of the key,value pairs will store in Object      
            ftr_VologyOpptyPresalesPosRespWrapper responseVol = (ftr_VologyOpptyPresalesPosRespWrapper)JSON.deserialize(resBody, ftr_VologyOpptyPresalesPosRespWrapper.class);
            String opStatusDescf;
            String misInfof;
            if(!Test.isRunningTest()){
                opStatusDescf = responseVol.response.executionStatusMessage.operationStatusDescription;
                misInfof = responseVol.response.executionStatusMessage.miscellaneousInformation;   
            }
            List<Opportunity> lstOpptyUpdate = new List<Opportunity>();
            for(Opportunity oppty : lstOppty){
                
                if(string.isNotBlank(opStatusDescf) && string.isNotBlank(misInfof) ){ 
                    
                    oppty.VologyPreSalesEmailDeliveryStatus__c = opStatusDescf + '-' + misInfof;             
                    oppty.VologyPreSalesEmailSent__c = true;
                    System.debug('VologyPreSalesEmailDeliveryStatus__c-85========='+oppty.VologyPreSalesEmailDeliveryStatus__c);
                    System.debug('VologyPreSalesEmailSent__c-86========='+oppty.VologyPreSalesEmailSent__c);
                    
                }
                lstOpptyUpdate.add(oppty);
            }          
            
            //try{
                if(!lstOpptyUpdate.isEmpty()){
                    //ReccursionCls.runOnceVologyPreSalesEmail = false;
                    update lstOpptyUpdate;                
               }
          // }
           // Catch(Exception ex) {
            //    ftr_ErrorLogHandler.insertErrorLogs('ftr_VologyOpptyPresalesEmailService','sendVologyOpptyPresalesEmail', ex);                              
            //} 
            
        } else {            
            ftr_ErrorLogHandler.insertErrorDescriptions('ftr_VologyOpptyPresalesEmailService','sendVologyOpptyPresalesEmail', resBody); 
        }
            
            
       /* } else if(httpResponse.getStatusCode() == 404 ){ //HTTP Status/error code -404 ,request couldn't understand ,there may be Request body contains wrong data 
            
            ftr_VologyOpptyPresalesFailNFRespWrapper negativeResp = (ftr_VologyOpptyPresalesFailNFRespWrapper) System.JSON.deserialize(resBody, ftr_VologyOpptyPresalesFailNFRespWrapper.class);
            
            String opStatusDesc = negativeResp.response.executionStatusMessage.operationStatusDescription;
            String misInfo = negativeResp.response.executionStatusMessage.miscellaneousInformation;
            
            List<Opportunity> lstOpptyUpdate = new List<Opportunity>();
            for(Opportunity oppty : lstOppty){
                
                if(string.isNotBlank(opStatusDesc) && string.isNotBlank(misInfo) ){ 
                    
                    oppty.VologyPreSalesEmailDeliveryStatus__c = opStatusDesc + '-' + misInfo;             
                    //oppty.VologyPreSalesEmailSent__c = true;
                    System.debug('VologyPreSalesEmailDeliveryStatus__c-116========='+oppty.VologyPreSalesEmailDeliveryStatus__c);
                    //System.debug('VologyPreSalesEmailSent__c========='+oppty.VologyPreSalesEmailSent__c);
                    
                }
                lstOpptyUpdate.add(oppty);
            }     
            try{
                if(!lstOpptyUpdate.isEmpty()){
                    ReccursionCls.runOnceVologyPreSalesEmail = false;
                    update lstOpptyUpdate;
                    ftr_ErrorLogHandler.insertErrorDescriptions('ftr_VologyOpptyPresalesEmailService','sendVologyOpptyPresalesEmail',httpResponse.getStatusCode()+ '-' + opStatusDesc + '-' + misInfo );  
                    
                } 
            }
            Catch(Exception ex) {
                    ftr_ErrorLogHandler.insertErrorLogs('ftr_VologyOpptyPresalesEmailService','sendVologyOpptyPresalesEmail', ex);                              
                }      
                
            } else if(httpResponse.getStatusCode() == 401 ){ //HTTP Status/error code -401-UnAuthorised error 
            
            ftr_VologyOpptyPresalesFailUARespWrapper negativeResp1 = (ftr_VologyOpptyPresalesFailUARespWrapper)JSON.deserialize(resBody, ftr_VologyOpptyPresalesFailUARespWrapper.class);
            
            String exctype = negativeResp1.error.exceptionType;
            String text = negativeResp1.error.text;
            
            List<Opportunity> lstOpptyUpdate = new List<Opportunity>();
            for(Opportunity oppty : lstOppty){
                
                if(string.isNotBlank(exctype) && string.isNotBlank(text) ){ 
                    
                    oppty.VologyPreSalesEmailDeliveryStatus__c = exctype + '-' + text;             
                    //oppty.VologyPreSalesEmailSent__c = true;
                    System.debug('VologyPreSalesEmailDeliveryStatus__c-116========='+oppty.VologyPreSalesEmailDeliveryStatus__c);
                    //System.debug('VologyPreSalesEmailSent__c========='+oppty.VologyPreSalesEmailSent__c);
                    
                }
                lstOpptyUpdate.add(oppty);
            }     
            try{
                if(!lstOpptyUpdate.isEmpty()){
                    ReccursionCls.runOnceVologyPreSalesEmail = false;
                    update lstOpptyUpdate;
                    ftr_ErrorLogHandler.insertErrorDescriptions('ftr_VologyOpptyPresalesEmailService','sendVologyOpptyPresalesEmail',httpResponse.getStatusCode()+ '-' + exctype + '-' + text );  
                    
                } 
            }
            Catch(Exception ex) {
                    ftr_ErrorLogHandler.insertErrorLogs('ftr_VologyOpptyPresalesEmailService','sendVologyOpptyPresalesEmail', ex);                              
                }      
                
            }  */
        } 
    
    public static string JSONRequestMethod (List<Opportunity> lstOppRec){
        
        // prepare the request body            
        // get the EmailTo value from Custom Metadatatype: VologyEmailTo and convert to a List        
        String emailTo;
        String emailCc;
        String emailBcc;        
        List<String> emailToIds = new List<String>();
        List<String> emailCcIds = new List<String>();
        String stringJson;
        String SEemailId;
        
        if(string.isNotBlank(lstOppRec[0].SEER_Assigned_To__r.email)){
            SEemailId= lstOppRec[0].SEER_Assigned_To__r.email;
        }else{
            SEemailId ='';
        }
        
        VologyEmailTo__mdt lstEmailTo =[Select DeveloperName,EmailTo__c,EmailCc__c,EmailBcc__c from VologyEmailTo__mdt where DeveloperName = 'PresalesEmailTo' LIMIT 1];
        
        if(string.isNotBlank(lstEmailTo.EmailTo__c)){
            emailTo = lstEmailTo.EmailTo__c;
            emailToIds = emailTo.split(',');       
        }         
        System.debug('emailTo========='+emailTo);
        System.debug('emailToIds=========='+emailToIds);
        
        if(string.isNotBlank(lstEmailTo.EmailCc__c)){
            emailCc = lstEmailTo.EmailCc__c;
            emailCcIds = emailCc.split(',');            
        }
        
        if(string.isNotBlank(SEemailId)){
            emailCcIds.add(SEemailId);
        }        
        system.debug('emailCcIds========='+emailCcIds);               
        
        //try{                            
        JSONGenerator jsonGen = JSON.createGenerator(true);
        jsonGen.writeStartObject();
        
        if(!emailToIds.isEmpty() && emailToIds != null ){
            jsonGen.writeObjectField('emailTo', emailToIds);  
        }else{
            jsonGen.writeObjectField('emailTo', '');  
        }      
        
        if(!emailCcIds.isEmpty() && emailCcIds != null ){
            jsonGen.writeObjectField('emailCc', emailCcIds);  
        }else{
            jsonGen.writeObjectField('emailCc',''); 
        }       
        
        jsonGen.writeObjectField('emailBcc','');
        
        if(string.isNotBlank(lstOppRec[0].SEER_Assigned_To__r.Id) ){            
            jsonGen.writeStringField('seUserId', lstOppRec[0].SEER_Assigned_To__r.Id);
        }else{
            jsonGen.writeStringField('seUserId', '');
        }
        
        if(string.isNotBlank(lstOppRec[0].SEER_Assigned_To__r.email)){
            jsonGen.writeStringField('seEmailId', lstOppRec[0].SEER_Assigned_To__r.email);
        }else{
            jsonGen.writeStringField('seEmailId', '');
        }
        
        if(string.isNotBlank(lstOppRec[0].id))
        {   
            jsonGen.writeStringField('opportunityId', lstOppRec[0].id);
        }else{
            jsonGen.writeStringField('opportunityId', '');
        }
        
        if(string.isNotBlank(lstOppRec[0].Name)){
            jsonGen.writeStringField('opportunityName', lstOppRec[0].Name);
        }else{
            jsonGen.writeStringField('opportunityName', '');
        }
        
        jsonGen.writeStringField('customerFirstName', '');              
        
        if(string.isNotBlank(lstOppRec[0].Account.Name)){
            jsonGen.writeStringField('customerLastName', lstOppRec[0].Account.Name);
        }else{
            jsonGen.writeStringField('customerLastName', '');
        }
        jsonGen.writeFieldName('customerAddress');            
        jsonGen.writeStartObject(); 
        
        if(string.isNotBlank(lstOppRec[0].Account.ShippingStreet)){
            jsonGen.writeStringField('addressLine1', lstOppRec[0].Account.ShippingStreet);
        }else{
            jsonGen.writeStringField('addressLine1', '');
        }  
        jsonGen.writeStringField('addressLine2', '');
        
        if(string.isNotBlank(lstOppRec[0].Account.ShippingCity)){
            jsonGen.writeStringField('city', lstOppRec[0].Account.ShippingCity);
        }else{
            jsonGen.writeStringField('city', '');
        }  
        
        if(string.isNotBlank(lstOppRec[0].Account.ShippingCity)){
            jsonGen.writeStringField('city', lstOppRec[0].Account.ShippingCity);
        }else{
            jsonGen.writeStringField('city', '');
        } 
        
        if(string.isNotBlank(lstOppRec[0].Account.ShippingStateCode)){
            jsonGen.writeStringField('state', lstOppRec[0].Account.ShippingStateCode);
        }else{
            jsonGen.writeStringField('state', '');
        } 
        
        if(string.isNotBlank(lstOppRec[0].Account.ShippingPostalCode)){
            jsonGen.writeStringField('zipCode', lstOppRec[0].Account.ShippingPostalCode);
        }else{
            jsonGen.writeStringField('zipCode', '');
        }
        
        jsonGen.writeEndObject();
        
        if(string.isNotBlank(lstOppRec[0].Description__c)){
            jsonGen.writeStringField('customerNeedDescription', lstOppRec[0].Description__c);
        }else{
            jsonGen.writeStringField('customerNeedDescription', '');
        }  
        
        if(string.isNotBlank(lstOppRec[0].Lead_Product_List__c)){
            jsonGen.writeStringField('leadProductList', lstOppRec[0].Lead_Product_List__c);
        }else{
            jsonGen.writeStringField('leadProductList', '');
        }          
        
        jsonGen.writeEndObject();
        
        stringJson = jsonGen.getAsString(); 
        System.debug('stringJson========'+stringJson);
        return stringJson; 
        
        /*}
		Catch(Exception ex){
		ftr_ErrorLogHandler.insertErrorLogs('ftr_VologyOpptyPresalesEmailService','sendVologyOpptyPresalesEmail', ex);
		return null;
		} */
    }
    
}