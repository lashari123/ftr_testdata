public class AgentTools{
    public Boolean showBatchProcessMessage {get;set;}
    Public String SelectedCriteria {get;set;}
    public AgentTools_AddressValidation.LeadObject singleAddressLookup {get;set;}
    public List<AgentTools_AddressValidation.LeadObject> multipleAddressLookup {get;set;}
    public Blob multipleAddressFile {get;set;}
    List<List<String>> allFields {get;set;}
    public List<AgentTools_AddressValidation.HughesRequest> multipleHughesResponse {get;set;}
    public AgentTools_AddressValidation AddressValidation {get;set;}
    public AgentTools_DueDateCalculator DueDateCalculation {get;set;}
    public AgentTools_ProvisioningStatus ProvisioningStatus {get;set;}

    public List<SelectOption> getSearchCriteria() {
        List<SelectOption> SearchCriteria = new List<SelectOption>();
        SearchCriteria.add(new selectOption('Address', 'Address')); 
        SearchCriteria.add(new selectOption('Telephone', 'Telephone'));
        return SearchCriteria;
    }

   
    public void ReadMultiFile(){
        showBatchProcessMessage = FALSE;
        String fileContent = '';
        
        try {
          fileContent = multipleAddressFile.toString();
        }catch (StringException ex) {
          HttpRequest tmp = new HttpRequest();
          tmp.setBodyAsBlob(multipleAddressFile);
          fileContent = tmp.getBody();
        }
        
        Boolean skipHeaders = true;
        
        allFields = new List<List<String>>();
        multipleHughesResponse = new List<AgentTools_AddressValidation.HughesRequest>();
        List<String> lines = new List<String>();
        try{
            lines = fileContent.split('\n');
        }catch (System.ListException e){
            System.debug('Limits exceeded?' + e.getMessage());
        }
        for(String line : lines) {
            if (line.replaceAll(',','').trim().length() == 0){
                break;
            }
            List<String> fields = line.split(',');
            System.debug('fields value '+line+' row values:'+fields);
            AgentTools_AddressValidation.HughesRequest hughesItem = new AgentTools_AddressValidation.HughesRequest();
            hughesItem.siteId = fields[0];
            hughesItem.customerId = fields[1];
            hughesItem.servicePhone = fields[2].replace('(','').replace(')','').replace('-','');
            hughesItem.serviceAddress1 = fields[3];
            hughesItem.serviceAddress2 = fields[4];
            hughesItem.city = fields[5];
            hughesItem.state = fields[6];
            hughesItem.zip = fields[7].trim();
            
            multipleHughesResponse.add(hughesItem);             
        }
        
        if(skipHeaders){
            multipleHughesResponse.remove(0);
        }
        database.executebatch(new WS_BATCH_HughesAddressValidation(multipleHughesResponse),5);
        showBatchProcessMessage = TRUE;
    }
    
    public AgentTools(){
        SelectedCriteria = 'Address';
        singleAddressLookup = new AgentTools_AddressValidation.LeadObject();
        DueDateCalculation = new AgentTools_DueDateCalculator();
        ProvisioningStatus = new AgentTools_ProvisioningStatus();
    }
    
    public void AddressValidation_Submit(){
        system.debug(logginglevel.info,singleAddressLookup);
        if(SelectedCriteria == 'Address'){
            if(
                (singleAddressLookup.Street == null || singleAddressLookup.Street == '') ||
                (singleAddressLookup.City == null || singleAddressLookup.City == '') ||
                //(singleAddressLookup.StateCode == null || singleAddressLookup.StateCode == '') ||
                (singleAddressLookup.State == null || singleAddressLookup.State == '') ||
                (singleAddressLookup.PostalCode == null || singleAddressLookup.PostalCode == '')
                ){
                    if(singleAddressLookup.Street == null || singleAddressLookup.Street == ''){
                        ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.WARNING, 'Street is required.'));         
                    }
                    if(singleAddressLookup.City == null || singleAddressLookup.City == ''){
                        ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.WARNING, 'City is required.'));           
                    }
                    //if(singleAddressLookup.StateCode == null || singleAddressLookup.StateCode == ''){
                    if(singleAddressLookup.State == null || singleAddressLookup.State == ''){
                        ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.WARNING, 'State/Province is required.'));         
                    }               
                    if(singleAddressLookup.PostalCode == null || singleAddressLookup.PostalCode == ''){
                        ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.WARNING, 'Zip/Postal Code is required.'));            
                    }
                }else{
                    AddressValidation = new AgentTools_AddressValidation(singleAddressLookup);
                    AddressValidation.SelectedCriteria = SelectedCriteria;
                    AddressValidation.RetrieveAddressRecords();
                }
        }else{
            AddressValidation = new AgentTools_AddressValidation(singleAddressLookup);
            AddressValidation.SelectedCriteria = SelectedCriteria;
            AddressValidation.RetrieveAddressRecords();
        }
    }
    
    public void AddressValidation_Reset(){
        singleAddressLookup = new AgentTools_AddressValidation.LeadObject();
        if(!AddressValidation.ServiceAddresses.isEmpty()){
            AddressValidation.ServiceAddresses.clear();
        }
    }
    
    public Boolean getBusinessTechnologyRender(){
        if(AddressValidation != null && AddressValidation.SelectedRecord != null){
            if(AddressValidation.SelectedRecord.Business_Technologies.size() > 0){
                return true;
            }else{
                return false;
            }
        }else{
            return false;
        }
    }
    
    public Boolean getResidentialTechnologyRender(){
        if(AddressValidation != null && AddressValidation.SelectedRecord != null){
            if(AddressValidation.SelectedRecord.Residential_Technologies.size() > 0){
                return true;
            }else{
                return false;
            }
        }else{
            return false;
        }
    }
    
}