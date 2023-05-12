@isTest
public class ftr_DPIBaseBillingSystemInterfaceTest {
    @TestSetup
    static void makeData(){
        Integer numOfOrchItems = 1;
        Map<String,String> prodNameCodeMap = new Map<String,String>{
            'DPI DID LeadOrder Billing RFS' => 'DID_DPI_LEAD_ORDER_RFS_0010',
            'DPI DID MDN Billing RFS' => 'DID_DPI_MDN_RFS_0010'
        };
        
        List<vlocity_cmt__OrchestrationItem__c> orchItemsList = ftr_TestDataFactory.getOrchestrationItems(numOfOrchItems, prodNameCodeMap);
        System.debug('orchItemsList = ' + orchItemsList);
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
     static void submitDIDLeadGroupTest(){
        System.debug('SubmitDIDLeadGroupOrder getting the orch item');

        vlocity_cmt__OrchestrationItem__c item = [SELECT Id,Name, vlocity_cmt__fulfilmentRequestLineId__c, vlocity_cmt__RequestItemsVlocityDataRaptorBundleId__c,vlocity_cmt__ResponseAttrsVlocityDataRaptorBundleId__c, vlocity_cmt__VlocityDataRaptorBundleId__c,vlocity_cmt__ResponseVlocityDataRaptorBundleId__c, vlocity_cmt__NumberOfRetries__c FROM vlocity_cmt__OrchestrationItem__c WHERE Name = 'SubmitDIDLeadGroupOrder' LIMIT 1];
		
        System.Debug('orch item = ' + item);
		System.debug('SubmitDIDLeadGroupOrderTest Line 37');
        Test.setMock(HttpCalloutMock.class, new ftr_SubmitGroupMemberOrderMock());
        ftr_SubmitDIDLeadGroupOrderInterface l1 = new ftr_SubmitDIDLeadGroupOrderInterface();
        System.debug('Starting the test');
        Test.startTest();
        l1.startBatch('', '');
        l1.executeItem('','',item);
        l1.endBatch('', '');
        Test.stopTest();
    }

    @isTest
     static void submitMDNGroupOrderMemberTest(){
        System.debug('SubmitMDNGroupOrderMember getting the orch item');

        vlocity_cmt__OrchestrationItem__c item = [SELECT Id,Name, vlocity_cmt__fulfilmentRequestLineId__c, vlocity_cmt__RequestItemsVlocityDataRaptorBundleId__c,vlocity_cmt__ResponseAttrsVlocityDataRaptorBundleId__c, vlocity_cmt__VlocityDataRaptorBundleId__c,vlocity_cmt__ResponseVlocityDataRaptorBundleId__c, vlocity_cmt__NumberOfRetries__c FROM vlocity_cmt__OrchestrationItem__c WHERE Name = 'SubmitMDNGroupOrderMember' LIMIT 1];
		
        System.Debug('orch item = ' + item);
		System.debug('SubmitMDNGroupOrderMemberTest Line 37');
        Test.setMock(HttpCalloutMock.class, new ftr_SubmitGroupMemberOrderMock());
        ftr_DPISIPMDNSubmitGroupOrderMembInterf l1 = new ftr_DPISIPMDNSubmitGroupOrderMembInterf();
        System.debug('Starting the test');
        Test.startTest();
        l1.startBatch('', '');
        l1.executeItem('','',item);
        l1.endBatch('', '');
        Test.stopTest();
    }

    @isTest
     static void submitDIDBulkGroupOrderTest(){
        System.debug('SubmitDIDBulkGroupOrder getting the orch item');

        vlocity_cmt__OrchestrationItem__c item = [SELECT Id,Name, vlocity_cmt__fulfilmentRequestLineId__c, vlocity_cmt__RequestItemsVlocityDataRaptorBundleId__c,vlocity_cmt__ResponseAttrsVlocityDataRaptorBundleId__c, vlocity_cmt__VlocityDataRaptorBundleId__c,vlocity_cmt__ResponseVlocityDataRaptorBundleId__c, vlocity_cmt__NumberOfRetries__c FROM vlocity_cmt__OrchestrationItem__c WHERE Name = 'SubmitDIDBulkGroupOrder' LIMIT 1];
		
        System.Debug('orch item = ' + item);
		System.debug('SubmitDIDBulkGroupOrderTest Line 37');
        Test.setMock(HttpCalloutMock.class, new ftr_SubmitGroupMemberOrderMock());
        ftr_DPISIPMDNSubmitGroupOrderMembInterf l1 = new ftr_DPISIPMDNSubmitGroupOrderMembInterf();
        System.debug('Starting the test');
        Test.startTest();
        l1.startBatch('', '');
        l1.executeItem('','',item);
        l1.endBatch('', '');  
        Test.stopTest();
    }
}