global without sharing class ftr_DPIStageGroupLeadOrderMember extends ftr_DPIBaseBillingSystemInterface{
    
    public ftr_DPIStageGroupLeadOrderMember() {

    }

    global override String getOrchestrationTaskName() {
        System.debug('Task Name returned-->'+TaskName_UpdateDIDLeadGroupOrder);
        return TaskName_UpdateDIDLeadGroupOrder;
    }

/**
     * This method is called from executeItem to create DPI RequestType 
     *
     * @param  url  base URL for the batch
     * @param  path path for the batch
     * @param  input payload to be used to construct 
     * @return DPI RequestType object to be sent
     */
    global override Object createDPIRequestType(String url, String path, Map<String, Object> input) {
       
        System.debug('Stage order request type '+input);
            return (input);
}

}