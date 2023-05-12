@isTest
public class ftr_DPIStatusUpdateSubscriberTest {
    @TestSetup
    static void makeData(){
        Integer numOfOrchitem = 1;
        Map<String,String> prodNameCodeMap = new Map<String,String>{
            'DPI DID MDN Billing RFS' => 'DID_DPI_MDN_RFS_0010',
            'DPI Circuit Billing CFS' => 'ENT_ETH_DPI_CIRCUIT_BILLING',
            'DPI CIRCUIT BILLING RESOURCE SPEC' => 'DPI_CIRCUIT_BILLING_RES_SPEC_0010',
            'SIP TRUNKING DPI BILLING RESOURCE SPEC' => 'SIP_TRUNKING_DPI_BILLING_RES_SPEC_0010',
            'DPI DID LeadOrder Billing RFS' => 'DID_DPI_LEAD_ORDER_RFS_0010',
            'DPI DID Bulk Billing RFS' => 'DPI_Bulk_Billing_RFS'
        };
        
        List<vlocity_cmt__OrchestrationItem__c> orchItemsList = ftr_TestDataFactory.getOrchestrationItems(1, prodNameCodeMap);
        System.debug('orchitemList = ' + orchItemsList);
        insert orchItemsList;
        ftr_TestDataFactory.getAttributesWithCategory();

        // insert response DR
        vlocity_cmt__DRBundle__c  dtb= new vlocity_cmt__DRBundle__c ();
        dtb.Name = 'DRM6LoadAddServiceItemL1Response';
        dtb.vlocity_cmt__DRMapName__c='DRM6LoadAddServiceItemL1Response';
        dtb.vlocity_cmt__InterfaceObject__c='json';
        insert dtb;
    }


    @isTest
    static void SIPWaitDPIOrderStatusEventTest(){
       System.debug('SIPWaitDPIOrderStatusEvent getting the orch item');

       vlocity_cmt__OrchestrationItem__c item = [SELECT Id,Name, vlocity_cmt__fulfilmentRequestLineId__c, vlocity_cmt__RequestItemsVlocityDataRaptorBundleId__c,vlocity_cmt__ResponseAttrsVlocityDataRaptorBundleId__c, vlocity_cmt__VlocityDataRaptorBundleId__c,vlocity_cmt__ResponseVlocityDataRaptorBundleId__c, vlocity_cmt__NumberOfRetries__c, vlocity_cmt__OrchestrationItem__c.vlocity_cmt__FulfilmentRequestLineId__r.vlocity_cmt__JSONAttribute__c, vlocity_cmt__FulfilmentRequestLineId__r.vlocity_cmt__Product2Id__r.vlocity_cmt__ObjectTypeId__c, vlocity_cmt__OrchestrationPlanId__c, vlocity_cmt__FulfilmentRequestLineId__r.vlocity_cmt__Product2Id__r.ProductCode FROM vlocity_cmt__OrchestrationItem__c WHERE Name = 'WaitForDIDBulkOrderStatusEvent' LIMIT 1];

       List<PublishGrpOrderStatusUpdate__e> statusUpdateEventList = new List<PublishGrpOrderStatusUpdate__e>();
        String jsonAttribute = item.vlocity_cmt__FulfilmentRequestLineId__r.vlocity_cmt__JSONAttribute__c;
        System.debug('jsonAttribute.in test.'+ jsonAttribute);
        String attrReferenceId = 'ATTR_FRLRefId';

        Map<String,Object> attrVals = new Map<String,Object>();
        attrVals.put('ATTR_IsBillingComplete', 'True');
        attrVals.put('ATTR_ErrorCode', '0');
        attrVals.put('ATTR_ErrorMessage', '1234');
        attrVals.put('ATTR_WarningCode', '1234');
        attrVals.put('ATTR_WarningMessage', 'V7');

        vlocity_cmt__FulfilmentRequestLine__c flr = [SELECT Id, vlocity_cmt__JSONAttribute__c FROM vlocity_cmt__FulfilmentRequestLine__c WHERE Id=:item.vlocity_cmt__FulfilmentRequestLineId__c];
        flr.vlocity_cmt__JSONAttribute__c = (String)ftr_CpqHelper.setJSONAttributes(flr.vlocity_cmt__JSONAttribute__c, '{}', attrVals);
        update flr;
        
        PublishGrpOrderStatusUpdate__e event = new PublishGrpOrderStatusUpdate__e();
        event.FRL_Id__c = item.vlocity_cmt__FulfilmentRequestLineId__c;
        event.FRL_Reference_Id__c = (String)ftr_CpqHelper.getJSONAttributeValue(jsonAttribute, attrReferenceId);
        event.JSONAttribute__c =  flr.vlocity_cmt__JSONAttribute__c;
        event.Object_Type__c = item.vlocity_cmt__FulfilmentRequestLineId__r.vlocity_cmt__Product2Id__r.vlocity_cmt__ObjectTypeId__c;
        event.Orchestration_Item_Id__c = item.Id;
        event.Plan_Id__c = item.vlocity_cmt__OrchestrationPlanId__c;
        event.Product_Code__c = item.vlocity_cmt__FulfilmentRequestLineId__r.vlocity_cmt__Product2Id__r.ProductCode;
        event.Status__c = 'Running'; //default
        
        statusUpdateEventList.add(event);  

        // call the subscriber
        Map<String, Object> inputMap = new Map<String, Object>{
            'events' => statusUpdateEventList
        };
        Map<String, Object> outputMap = new Map<String, Object>();
        Map<String, Object> options = new Map<String, Object>();
        ftr_DPIStatusUpdateSubscriber subscriberUNI = new ftr_DPIStatusUpdateSubscriber();
        
        test.startTest();
        //Boolean result = subscriberUNI.invokeMethod('execute', inputMap, outputMap, options);
        EventBus.publish(statusUpdateEventList);
        test.stopTest();
   }
}