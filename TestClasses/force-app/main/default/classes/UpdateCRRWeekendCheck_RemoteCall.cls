global class UpdateCRRWeekendCheck_RemoteCall implements vlocity_cmt.VlocityOpenInterface2 {
    global Object invokeMethod(String methodName, Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options) 
    {
        Boolean success = true;
        String errors = 'OK';
        try 
        {
           
            if(methodName == 'checkHolidayAndFetchCRR'){
                outMap = checkHolidayAndFetchCRR(inputMap,outMap,options);
            }       
        }
        catch (Exception e) 
        {
            errors = e.getMessage();
            success = false;
        }

        return outMap;
    }

    public Map<String,Object> checkHolidayAndFetchCRR(Map<String,Object> inputMap, Map<String,Object> outputMap, Map<String,Object> options) 
    {
        String customerRequestedDate = (String)inputMap.get('customerRequestedDate');
        String modifiedCRDate = customerRequestedDate + ' 00:00:00';
        // outputMap.put('modified CRR',modifiedCRDate);
        DateTime customerReqDateTime = DateTime.valueOf(modifiedCRDate);
        // outputMap.put('customerRequestDate',customerReqDateTime);
        ftr_M6CreatePSRSystemInterface obj = new ftr_M6CreatePSRSystemInterface();
        String productCode;
        String updatedDesiredDate = obj.getDesireddueDate(productCode, customerReqDateTime);
        outputMap.put('updatedCustomerRequestDate',updatedDesiredDate);
        return outputMap;
    }
}