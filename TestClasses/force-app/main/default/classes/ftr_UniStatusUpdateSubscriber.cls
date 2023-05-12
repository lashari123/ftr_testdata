/**
* 
* @description Subscriber class called from ftr_FRLStatusUpdateEventDispatcher
*/ 

global with sharing class ftr_UniStatusUpdateSubscriber implements vlocity_cmt.VlocityOpenInterface {
    
    //Constants
    public final static String TECH_PRODUCTCODE_EIA = 'ENT_ETH_EIA_EVC_PSR_001';
    public final static String TECH_PRODUCTCODE_EVPL = 'ENT_ETH_EVPL_EVC_PSR_001';
    public final static String TECH_PRODUCTCODE_SIP = 'SIP_EVC_PSR_RES_SPEC_0010';
    //***This Product Code add by Annie NAeem ****///
   //  public final static String TECH_PRODUCTCODE_SIP = 'SIP_EVC_PSR_RES_SPEC_0010';

    public final static String ATT_HOST_UNI_REF_ID = 'ATTR_HostUNIRefId';
    public final static String ATT_REMOTE_UNI_REF_ID = 'ATTR_RemoteUNIRefId';
    public final static String ATT_DOC_NUMBER = 'documentNumber';
    public final static String ATT_HOST_UNI_STATUS = 'ATTR_HostUNIStatus';
    public final static String ATT_REMOTE_UNI_STATUS = 'ATTR_RemoteUNIStatus';
    public final static String ATT_WAIT_SEMAPHORE = 'ATTR_WaitSemaphore';
    public final static String ATT_PAR_UNI_ORD1 = 'PAR_UNI_ORD_1';
    public final static String ATT_PAR_UNI_ORD2 = 'PAR_UNI_ORD_2';
    public final static String ATT_RUID1 = 'RUID #1';
    public final static String ATT_RUID2 = 'RUID #2';
    public final static String ATT_VALUE_FALSE = 'False';
    public final static String ATT_DEFAULT_VALUE = 'NEWAUTOCLLI';
    public final static String STATUS_COMPLETED = 'Completed';

    //Input
    public final static String INPUT_EVENT = 'events';
    public final static String INPUT_STATE_RUNNING = 'Running';
    public final static String INPUT_STATE_PENDING = 'Pending';
    public final static String INPUT_ITEM_DEFINITION = 'Wait To Start';
    ///*****///
    public final static String INPUT_ITEM_SIPDEFINITION = 'SIP M6 WaitToStart';
    public final static String EXECUTE_METHOD = 'execute';
    public final static String ATT_DOCUMENTNUMBER ='documentNumber';

    // New Work For UNI
   

    global Boolean invokeMethod(String methodName, Map<String, Object> inputMap, Map<String, Object> outputMap, Map<String, Object> options) {
        System.debug('Enter ftr_UniStatusUpdateSubscriber.' + methodName);
        try {
            if (methodName == EXECUTE_METHOD) {
                return execute(methodName, inputMap, outputMap);
            }
            return true;
        } catch (Exception ex) {
            System.debug(ex.getLineNumber() + ': ' + ex.getMessage());
            return false;
        } finally {
            System.debug('Exit ftr_UniStatusUpdateSubscriber.' + methodName);
        }
    }
        
    public Boolean execute(String methodName, Map<String, Object> inputMap, Map<String, Object> outputMap) {
        System.debug('FRLStatusUpdate:inputMap-->'+ inputMap);
        List<FRL_Status_Update__e> evs = (List<FRL_Status_Update__e>)inputMap.get(INPUT_EVENT);

        Map<Id,vlocity_cmt__FulfilmentRequestLine__c> frlsToUpdateMap = new Map<Id,vlocity_cmt__FulfilmentRequestLine__c>();
        Set<Id> orchPlanIds = new Set<Id>();
        Map<String,String> eventMap = new Map<String,String>();
        Map<String,String> flrIdMap = new Map<String,String>();
        for (FRL_Status_Update__e singleEvent : evs) {
            orchPlanIds.add(singleEvent.Plan_Id__c);
            flrIdMap.put(singleEvent.FRL_Reference_Id__c, singleEvent.Plan_Id__c);
            eventMap.put(singleEvent.FRL_Reference_Id__c,singleEvent.JSONAttribute__c);
        }
        System.debug('FRLStatusUpdate:flrIdMap-->'+ flrIdMap);

        //get all the Orchestration Item of the plan with Running state
        List <vlocity_cmt__OrchestrationItem__c> items = [SELECT Id, vlocity_cmt__FulfilmentRequestLineId__c, vlocity_cmt__FulfilmentRequestLineId__r.vlocity_cmt__JSONAttribute__c, vlocity_cmt__FulfilmentRequestLineId__r.vlocity_cmt__Product2Id__r.ProductCode, vlocity_cmt__FulfilmentRequestLineId__r.vlocity_cmt__FulfilmentRequestID__c, vlocity_cmt__FulfilmentRequestLineId__r.vlocity_cmt__Product2Id__r.vlocity_cmt__ObjectTypeId__c, vlocity_cmt__OrchestrationPlanId__c, vlocity_cmt__FulfilmentRequestLineId__r.vlocity_cmt__Product2Id__r.ftr_IsComboOrderEnabled__c
                                                          FROM vlocity_cmt__OrchestrationItem__c
                                                          WHERE (vlocity_cmt__State__c =: INPUT_STATE_RUNNING OR vlocity_cmt__State__c =: INPUT_STATE_PENDING)
                                                          AND vlocity_cmt__OrchestrationPlanId__c IN: orchPlanIds
                                                          AND (vlocity_cmt__OrchestrationItemDefinitionId__r.Name =: INPUT_ITEM_DEFINITION OR vlocity_cmt__OrchestrationItemDefinitionId__r.Name =: INPUT_ITEM_SIPDEFINITION) // TODO: to refer an externalId field which will not change
                                                          AND (vlocity_cmt__FulfilmentRequestLineId__r.vlocity_cmt__Product2Id__r.ProductCode =: TECH_PRODUCTCODE_EIA
                                                          OR vlocity_cmt__FulfilmentRequestLineId__r.vlocity_cmt__Product2Id__r.ProductCode =: TECH_PRODUCTCODE_EVPL
                                                          OR vlocity_cmt__FulfilmentRequestLineId__r.vlocity_cmt__Product2Id__r.ProductCode =: TECH_PRODUCTCODE_SIP)];

        for(vlocity_cmt__OrchestrationItem__c item : items){

            String jsonAttribute = item.vlocity_cmt__FulfilmentRequestLineId__r.vlocity_cmt__JSONAttribute__c;
            vlocity_cmt__FulfilmentRequestLine__c frl = new vlocity_cmt__FulfilmentRequestLine__c(Id = item.vlocity_cmt__FulfilmentRequestLineId__c, 
                                                                                                  vlocity_cmt__JSONAttribute__c = jsonAttribute);
            
            String hostUNIRefId = (String)ftr_CpqHelper.getJSONAttributeValue(jsonAttribute, ATT_HOST_UNI_REF_ID); //'Host UNI Reference Id'); 
            String remoteUNIRefId = (String)ftr_CpqHelper.getJSONAttributeValue(jsonAttribute, ATT_REMOTE_UNI_REF_ID); //'Remote UNI Reference Id'); 
            String prodCode = item.vlocity_cmt__FulfilmentRequestLineId__r.vlocity_cmt__Product2Id__r.ProductCode;
            String docNumUNI = '';
            
            //ATTR_FRLRefId
            String attrFRLRefId = (String)ftr_CpqHelper.getJSONAttributeValue(jsonAttribute, 'ATTR_FRLRefId'); //ATTR_FRLRefId
            System.debug('FRLStatusUpdate::attrFRLRefId-->'+ attrFRLRefId);
            System.debug('FRLStatusUpdate:hostUNIRefId..'+ hostUNIRefId + '  '+remoteUNIRefId);
            //set UNI PSR to EVC Order if it is ComboOrder
            Boolean isComboOrder = item.vlocity_cmt__FulfilmentRequestLineId__r.vlocity_cmt__Product2Id__r.ftr_IsComboOrderEnabled__c;  
            String hasSharedUNI=(String)ftr_CpqHelper.getJSONAttributeValue(jsonAttribute, 'ATTR_SHARED_UNI');
            //For EIA
            if((prodCode == TECH_PRODUCTCODE_EIA || prodCode == TECH_PRODUCTCODE_SIP) && eventMap.containsKey(hostUNIRefId)){
               // System.debug('FRLStatusUpdate:EIA JSON for Host..'+ eventMap.get(hostUNIRefId));
                System.debug('FRLStatusUpdate:Matching host UNI Exists for EIA:attrFRLRefId-->'+ attrFRLRefId);
                System.debug('FRLStatusUpdate:Matching host UNI Exists for EIA:hostUNIRefId-->'+ hostUNIRefId);
                docNumUNI = (String)ftr_CpqHelper.getJSONAttributeValue(eventMap.get(hostUNIRefId), ATT_DOC_NUMBER);
                
                               
                Map<String, Object> attrVals = new Map<String, Object>{
                    ATT_PAR_UNI_ORD1 => docNumUNI,
                    ATT_RUID1 => docNumUNI,
                    ATT_RUID2 => ATT_DEFAULT_VALUE, //default for EIA
                    ATT_WAIT_SEMAPHORE => ATT_VALUE_FALSE, //'Wait Semaphore' => 'False', 
                    ATT_HOST_UNI_STATUS => STATUS_COMPLETED, //'Host UNI Status' => 'Completed' 
                    //ATT_DOCUMENTNUMBER=>(isComboOrder&&hasSharedUNI!=null&&hasSharedUNI.length()>0&&hasSharedUNI.equalsIgnoreCase('False'))?docNumUNI:''//set UNI PSR on Combo Orders
                    ATT_DOCUMENTNUMBER=> docNumUNI
                  
                           };

                frl.vlocity_cmt__JSONAttribute__c = (String)ftr_CpqHelper.setJSONAttributes(frl.vlocity_cmt__JSONAttribute__c, '{}', attrVals);
                frlsToUpdateMap.put(frl.Id,frl);

            } else if (prodCode == TECH_PRODUCTCODE_EVPL) {

                if(eventMap.containsKey(hostUNIRefId)) {
                System.debug('FRLStatusUpdate:Matching host UNI Exists for EVPL:attrFRLRefId-->'+ attrFRLRefId);
                System.debug('FRLStatusUpdate:Matching host UNI Exists for EVPL:hostUNIRefId-->'+ hostUNIRefId);

                   // System.debug('EVPL JSON for Host..'+ eventMap.get(hostUNIRefId));
                    docNumUNI = (String)ftr_CpqHelper.getJSONAttributeValue(eventMap.get(hostUNIRefId), ATT_DOC_NUMBER);

                    Map<String, Object> attrVals = new Map<String, Object>{
                        ATT_PAR_UNI_ORD2 => docNumUNI,
                        ATT_RUID2 => docNumUNI,
                        ATT_HOST_UNI_STATUS => STATUS_COMPLETED //'Host UNI Status' => 'Completed'  
                    };

                    frl.vlocity_cmt__JSONAttribute__c = (String)ftr_CpqHelper.setJSONAttributes(frl.vlocity_cmt__JSONAttribute__c, '{}', attrVals);
                    frlsToUpdateMap.put(frl.Id,frl);

                } 
                if (eventMap.containsKey(remoteUNIRefId)) {
                //else if (eventMap.containsKey(remoteUNIRefId)) {
                    System.debug('FRLStatusUpdate:Matching Remote UNI Exists for EVPL:attrFRLRefId-->'+ attrFRLRefId);
                    System.debug('FRLStatusUpdate:Matching Remote UNI Exists for EVPL:hostUNIRefId-->'+ hostUNIRefId);
                    System.debug('EVPL JSON for Remote..'+ eventMap.get(remoteUNIRefId));
                    docNumUNI = (String)ftr_CpqHelper.getJSONAttributeValue(eventMap.get(remoteUNIRefId), ATT_DOC_NUMBER);
                    
                    Map<String, Object> attrVals = new Map<String, Object>{
                        ATT_PAR_UNI_ORD1 => docNumUNI,
                        ATT_RUID1 => docNumUNI,
                        ATT_REMOTE_UNI_STATUS => STATUS_COMPLETED, //'Remote UNI Status' => 'Completed'
                        ATT_DOCUMENTNUMBER=>(isComboOrder)?docNumUNI:''//set UNI PSR on Combo Orders
                    };

                    frl.vlocity_cmt__JSONAttribute__c = (String)ftr_CpqHelper.setJSONAttributes(frl.vlocity_cmt__JSONAttribute__c, '{}', attrVals);
                    frlsToUpdateMap.put(frl.Id,frl);

                }

                String attr_HostUNIStatus = (String)ftr_CpqHelper.getJSONAttributeValue(frl.vlocity_cmt__JSONAttribute__c, ATT_HOST_UNI_STATUS); // 'Host UNI Status');  
                String attr_RemoteUNIStatus = (String)ftr_CpqHelper.getJSONAttributeValue(frl.vlocity_cmt__JSONAttribute__c, ATT_REMOTE_UNI_STATUS); //'Remote UNI Status'); 
                System.debug('FRLStatusUpdate:Host and Remote status..'+ attr_HostUNIStatus + '**' + attr_RemoteUNIStatus);
                if(attr_HostUNIStatus == STATUS_COMPLETED && attr_RemoteUNIStatus == STATUS_COMPLETED) {
                    System.debug('FRLStatusUpdate:Both Host and Remote status complete..');
                    frl.vlocity_cmt__JSONAttribute__c = (String)ftr_CpqHelper.setJSONAttribute(frl.vlocity_cmt__JSONAttribute__c, '{}', ATT_WAIT_SEMAPHORE, ATT_VALUE_FALSE); //'Wait Semaphore', 'False');  
                    frlsToUpdateMap.put(frl.Id,frl);
                }
            }
        }
        

        if(frlsToUpdateMap.values().size()>0){
            try{
                List<Database.SaveResult> results = Database.update(frlsToUpdateMap.values(), false);
                
                for (Database.SaveResult result : results) {
                    if (!result.isSuccess()){
                        for (Database.Error err : result.getErrors()){
                        System.debug('Error in Subscriber: '+ err.getStatusCode() + ' ' + err.getMessage());
                        }
                    }
                }
            } catch(Exception e) {
                System.debug('Exception in Subscriber..'+ e.getMessage());
                return false;
            }
        }

        return true;
    }
    
    
}