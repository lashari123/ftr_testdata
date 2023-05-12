public class VMUtility {
    public static boolean isVMDisabled(){
        return SFDC_API_SETTINGS__c.getOrgDefaults().isVMPasscodeDisabled__c;
    }
    
    public static boolean checkSkuKey(string key){
        return (SFDC_API_SETTINGS__c.getOrgDefaults().VM_Sku_Key__c == key);
    }
    
    public static string resetVoiceMailPasscode(string tnNumber){
        string message = 'VM Passcode Reset was unsuccessful.';
        esbFrontierComResourcemanagement.UpdateCustomerVoiceMailDetailsResponse_element re = new esbFrontierComResourcemanagement.UpdateCustomerVoiceMailDetailsResponse_element();
        esbFrontierComResourcemanagement.ResourceManagement_ResourceManagementHttpPort co = new esbFrontierComResourcemanagement.ResourceManagement_ResourceManagementHttpPort();
        esbFrontierComResourcemanagement.msg_UpdateCustomerVoiceMailDetailsRequest req = new esbFrontierComResourcemanagement.msg_UpdateCustomerVoiceMailDetailsRequest();
        req.telephoneNumber = tnNumber; 
        System.debug('VM Request ---'+req);
        
        try{
            if(!Test.isRunningTest()){
               re.UpdateCustomerVoiceMailDetailsOutput = co.UpdateCustomerVoiceMailDetails(req);
               System.debug('vm callres ---------------------iii123  '+re.UpdateCustomerVoiceMailDetailsOutput);
            } else
               re = webserviceUtil.invokeVM();
                
            if(re.UpdateCustomerVoiceMailDetailsOutput != null)
               message = getMessage(re.UpdateCustomerVoiceMailDetailsOutput);  
        }Catch(Exception ex){
            System.debug('Error Message--------------------'+ex+message);
        }  
        return message;
    }
    
    public static string getMessage(esbFrontierComResourcemanagement.msg_UpdateCustomerVoiceMailDetailsResponse vmRes){
        string  message = 'VM passcode Reset was unsuccessful.';  
        if( vmRes.voiceMailPin != null && vmRes.header != null && vmRes.header.operationStatus.equalsIgnoreCase('TRUE')){
                message = 'VM passcode Reset was successful.  ';
                message += 'New Passcode is '+ vmRes.voiceMailPin;
        }/*else if(vmRes.header != null && vmRes.header.operationStatus.equalsIgnoreCase('FALSE')){
                if(vmRes.header.ExecutionStatusMessage != null && vmRes.header.ExecutionStatusMessage.ExecutionStatusMessage.size()>0 && 
                   vmRes.header.ExecutionStatusMessage.ExecutionStatusMessage[0].operationStatusDescription != null )
                    message = vmRes.header.ExecutionStatusMessage.ExecutionStatusMessage[0].operationStatusDescription;
        }*/
        
        System.debug(message+'   -----------         '+message);
        return message;
    }
}