@isTest(seeAllData = true)
private class AgentToolsTest {

    static testMethod void myUnitTest() {
        AgentTools agnTools = new AgentTools();
        AgentTools_AddressValidation.LeadObject newLead = new AgentTools_AddressValidation.LeadObject();
        agnTools.showBatchProcessMessage = true;
        agnTools.multipleAddressLookup = new List<AgentTools_AddressValidation.LeadObject>();
        agnTools.multipleAddressLookup.add(newLead);
        
        List<string> str = new List<string>{'asdf'};
        List<List<String>> strList = new List<List<String>>();
        strList.add(str);
        agnTools.multipleAddressFile = blob.valueof('1225 Storyglen St., Apt. No. 345, (469)-623-7789,' +'PO, Box, 4567,'+ ', Tx, 75062, 654 \n'+
                                                    '1525 Storyglen St., Apt. No. 345, (469)-623-7789, dallas' +'PO, Box, 4567,'+ ', Tx, 75062, 654 \n');
        agnTools.ReadMultiFile();
        agnTools.AddressValidation_Submit();
        boolean ren = agnTools.getBusinessTechnologyRender();
        agnTools.getResidentialTechnologyRender();
        List<SelectOption> selOpt = agnTools.getSearchCriteria();
        agnTools.ReadMultiFile();
        agnTools.AddressValidation = new AgentTools_AddressValidation(newLead);
        //agnTools.AddressValidation_Reset();
    }
}