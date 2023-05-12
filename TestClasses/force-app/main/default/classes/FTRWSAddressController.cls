public with sharing class FTRWSAddressController {
    
    @AuraEnabled
    public static string getSuggestions(String input) {
        return GooglePlacesController.getSuggestions(input);
    }
    
    @AuraEnabled
    public static string getPlaceDetails(String placeId) {
        return GooglePlacesController.getPlaceDetails(placeId);
    }
    
    @AuraEnabled
    public static FTRWSAddress__c getPlaceDetailsWithLatLng(String oppId, String lat, String lng) {
        String response = GooglePlacesController.getPlaceDetailsWithLatLong(lat, lng);
        //Map<String, Object> googleAddrMap = (Map<String, Object>) JSON.deserializeUntyped(response);
        FTRWSAddress__c address;
        if(!Test.isRunningTest()) {
	        address = GoogleLatLangResponse.parseAndSaveGoogleAddress(response, oppId, lat, lng);
        	System.debug('Saving google address returned via lat and lng:' + address);
			insert address;
        }

        return address;
    }
    
    
	@AuraEnabled
    public static FTRWSAddress__c get_SaveAddress(String gAddressStr) {
        FTRWSAddress__c address = null;
        
        FTRWSGoogleAddress gAddress = (FTRWSGoogleAddress)JSON.deserialize(gAddressStr, FTRWSGoogleAddress.class);
        
        System.debug('Calling '+ gAddress.actionStr + 'on FTRWSAddress with addressId :"' + gAddress.addressId + '"' + 
                     ' and Opportunity Id: ' + gAddress.opportunityId); 
        System.debug('streetNo: ' + gAddress.streetNo + 'streetName: ' + gAddress.streetName + 'city: ' + gAddress.city + 
                     ' state: ' + gAddress.state + ' zipcode: ' + gAddress.zipcode + ' opportunityId' + gAddress.opportunityId +
                     ' gLat: ' + gAddress.gLat +  ' gLng: ' + gAddress.gLng); 
    	warpper wrap = new warpper();
        if(gAddress.opportunityId != null) {
            try {
                address = new FTRWSAddress__c();
                address.Street_Name__c = gAddress.streetName;
                address.Street_Number__c = gAddress.streetNo;
                address.City__c = gAddress.city;
                address.State__c = gAddress.state;
                address.Zip_Code__c = gAddress.zipcode;
                address.Opportunity_ID__c = gAddress.opportunityId;
                address.G_Latitude__c = gAddress.gLat;
                address.G_Longitude__c = gAddress.gLng;
                address.DPI_Validated__c = false;
                address.DSAT_Validated__c = false;
                
                address.DPI_Qualified__c = false;
                address.DSAT_Qualified__c = false;
                
                //Start street fix introduced in bulk address validation.
                String street = '';
                if(String.isNotBlank(gAddress.streetNo)) {
                    street = gAddress.streetNo+ ' ';
                }
                
                if(String.isNotBlank(gAddress.streetName)) {
                    street = street + gAddress.streetName;
                }
                
                if(String.isNotBlank(street)) {
                    address.Street__c = street;
                }
                //End street fix introduced in bulk address validation.
                
                address.Address__c = ''+gAddress.streetNo+ ' ' + gAddress.streetName + ' ' + gAddress.city + ' ' + gAddress.state + ' ' + gAddress.zipcode;
                
                if(gAddress.actionStr == 'UPDATE') {
                    address.Id = gAddress.addressId;
                    setDPIData(address, new FTRWSDPIAddressResponse());
                    setDSATData(address, new FTRWSDSATAddressResponse());
                    update address;
                } else {
                	insert address;    
                }
                
                //addressId = address.Id;
                wrap.isSuccess = true;
            } catch(Exception e){
                wrap.isSuccess = false;
                wrap.errormessage = e.getMessage().substringAfter(',');
    			system.debug('Exception**'+e.getLinenumber());
    		}
        }
    	return address;
    }
    

     @AuraEnabled
    //returns address id for the updated record FTRWSAddress table
    public static FTRWSAddress__c get_UpdateAddress(ID addressId, String actionStr, 
                                     FTRWSDPIAddressResponse dpiData, FTRWSDSATAddressResponse dsatData) {
		FTRWSAddress__c address= null;
		System.debug('Calling update on FTRWSAddress with action:addressId ' + actionStr + ':' + addressId);                                         
        if(addressId != null) {
            address = new FTRWSAddress__c();
            address.Id = addressId;
            if(actionStr == 'UPDATE_DPI') {
                setDPIData(address, dpiData);
            } else if (actionStr == 'UPDATE_DSAT') {
                setDSATData(address, dsatData);
            }
            warpper wrap = new warpper();
            try {
                update address;
                wrap.isSuccess = true;
            } catch(Exception e) {
                wrap.isSuccess = false;
                wrap.errormessage = e.getMessage().substringAfter(',');
    			system.debug('Exception**'+e.getLinenumber());
    		}
        }
                                         
		return address;                                         
    }
    
    private static void setDPIData(FTRWSAddress__c address, FTRWSDPIAddressResponse dpiData) {
		String street = '';
        
        String streetNo = dpiData.streetNumber;
        if(streetNo != null && streetNo != '') {
        	address.Street_Number__c = streetNo;
            street = streetNo + ' ';
        }
        
        if(dpiData.streetName != null && dpiData.streetName != '') {
        	address.Street_Name__c = dpiData.streetName;
            street = street + dpiData.streetName;
        }
        if(dpiData.unit != null && dpiData.unit != '') {
        	address.Unit_Number__c = dpiData.unit;    
        }
        
        if(dpiData.cityName != null && dpiData.cityName != '') {
        	address.City__c = dpiData.cityName;    
        }
        
        if(dpiData.state != null && dpiData.state != '') {
        	address.State__c = dpiData.state;    
        }
        
        if(dpiData.zipCode != null && dpiData.zipCode != '') {
        	address.Zip_Code__c = dpiData.zipCode;    
        }
        
        address.CLLI_Code__c = dpiData.clliCode;
        address.Service_Control_Number__c = dpiData.svcControlNo;
        address.Wire_Center__c = dpiData.wirecenter;
        if(dpiData.latitude!=null && dpiData.latitude !='')
        address.Latitude__c = dpiData.latitude;
        if(dpiData.longitude!=null && dpiData.longitude!='')
        address.Longitude__c = dpiData.longitude;
        
         System.debug('address.Latitude__c : '+address.Latitude__c);
        System.debug('address.Longitude__c : '+address.Longitude__c);
        
        if(dpiData.status != null && dpiData.status != '') {
        	address.DPI_Validated__c = true;
        }
        
        if(dpiData.status == 'SUCCESS') {
            address.DPI_Qualified__c = true;
            address.Comments__c = '';
        }
        
        //Start street fix introduced in bulk address validation.
        if(String.isNotBlank(street)) {
            address.street__c = street;
        }
        //End street fix introduced in bulk address validation.
        
        if(dpiData.streetNumber != null && dpiData.streetNumber != '' && dpiData.streetName != null && dpiData.streetName != '' &&
          dpiData.cityName != null && dpiData.cityName != '' && dpiData.state != null && dpiData.state != '' &&
          dpiData.zipCode != null && dpiData.zipCode != '') {
        	
              address.Address__c = ''+dpiData.streetNumber+ ' ' + dpiData.streetName + ' ' + dpiData.cityName + ' ' + dpiData.state + ' ' + dpiData.zipCode;
        }
        
    }
    
    private static void setDSATData(FTRWSAddress__c address, FTRWSDSATAddressResponse dsatData) {

        System.debug('dsat data saved is: ' + dsatData);
        address.Business_Name__c = dsatData.businessName!=null?dsatData.businessName:'';
        address.Id__c = dsatData.dsatId!=null?dsatData.dsatId:'';
        address.VFO_Record_Id__c = dsatData.vfoRecordId!=null?dsatData.vfoRecordId:'';
        address.M6_Order_Number__c = dsatData.m6OrderNumber!=null?dsatData.m6OrderNumber:'';
        address.Created_By__c = dsatData.createdBy!=null?dsatData.createdBy:'';
        address.Creator_Email__c = dsatData.creatorEmail!=null?dsatData.creatorEmail:'';
        address.Created_By_Id__c = dsatData.createdById!=null?dsatData.createdById:'';
        address.Opened__c = dsatData.opened!=null?dsatData.opened:'';
        address.In_Footprint__c = dsatData.inFootprint;    
        address.Market_Id__c = dsatData.market!=null?dsatData.market:'';
        address.Level_Id__c = dsatData.level!=null?dsatData.level:'';
        address.DSAT_Services__c = dsatData.products!=null?dsatData.products:'';
        address.DSAT_Max_Speed__c = dsatData.wireCenterSpeed!=null?dsatData.wireCenterSpeed:'';
        address.DSAT_Technology__c = 'ETHERNET';
        
        address.WireCenter_CLLI__c = dsatData.wireCenterCLLI!=null?dsatData.wireCenterCLLI:'';
        address.Site_Name__c = dsatData.siteName!=null?dsatData.siteName:'';
        address.Max_Qos__c = dsatData.wireCenterQoS!=null?dsatData.wireCenterQoS:'';
        address.WireCenter_Speed__c = dsatData.wireCenterSpeed!=null?dsatData.wireCenterSpeed:'';
        address.HBE_Legacy__c = dsatData.HBE_Legacy!=null?dsatData.HBE_Legacy:'';  // change line to hbe
        //address.tst__c = dsatData.wireCenterQoSes; // change line to hbe
        address.Lit_Building__c = dsatData.litBuilding;    
       
        address.Fiber_Distance__c = dsatData.fiberDistance!=null?dsatData.fiberDistance:'';
        address.Fiber_Qualification__c = dsatData.fiberQualification!=null?dsatData.fiberQualification:'';
        address.Fiber_Tier__c = dsatData.fiberTier!=null?dsatData.fiberTier:'';
        
        address.Copper_Distance__c= dsatData.copperDistance!=null?dsatData.copperDistance:'';
        address.Copper_Tier__c = dsatData.copperTier!=null?dsatData.copperTier:'';   
        address.Copper_Qualification__c = dsatData.copperQualification!=null?dsatData.copperQualification:'';  
        
        address.Latitude__c = dsatData.latitude!=null?dsatData.latitude:'';  
        address.Longitude__c = dsatData.longitude!=null?dsatData.longitude:'';  
          
        
        address.DSAT_Validated__c = true;
        address.DSAT_Qualified__c = true;
        
        if(address.Copper_Qualification__c == 'BDT' && address.Fiber_Qualification__c == 'BDT') {
        	address.DSAT_Qualified__c = false;
            if(address.Comments__c  != null && address.Comments__c != '') {
            	address.Comments__c = address.Comments__c  + ' ' + 'Invalid DSAT Address;';    
            } else {
                address.Comments__c = 'Invalid DSAT Address;';    
            }
            
        } else {
        	address.Comments__c = '';    
        }
        
    }
    
    @AuraEnabled
    public static List<FTRWSDPIAddressResponse> getDPIValResultWithAddressId(ID addressId) {
        System.debug('Entering  getDPIValResultWithAddressId in FTRWSAddressController with parames: ' + addressId);
        
        FTRWSAddress__c address = [Select Street_Number__c, Street__c,Street_Name__c, City__c, State__c, Zip_Code__c from FTRWSAddress__c where Id=: addressId];

        return getDPIValResults(address);
    }
    
    private static List<FTRWSDPIAddressResponse> getDPIValResults(FTRWSAddress__c address) {
        
        ftr_addressBean addressBean = new ftr_addressBean();
        if(String.isNotBlank(address.Street__c))
        {
            addressBean.addressLine1 = address.Street__c;
        system.debug('Street__c ' + addressBean.addressLine1);
        }
           else{
        addressBean.addressLine1=address.Street_Number__c + ' ' + address.Street_Name__c;
           }
        addressBean.cityName=address.City__c;
        addressBean.state=address.State__c;
        addressBean.zipCode=address.Zip_Code__c;
        address.DPI_Validated__c = true;
        
        List<FTRWSDPIAddressResponse> dpiResponseResults = FTRWSDPIAddressController.retreiveCustomerFacility(addressBean);
        if(dpiResponseResults != null && dpiResponseResults.size() > 0) {
            
            if(dpiResponseResults.size() == 1) {
                FTRWSDPIAddressResponse dpiResp = dpiResponseResults.get(0);
                if(dpiResp.status == 'FAILURE') {
                    address.Comments__c = 'Invalid DPI Address;';
                    
                }
            }
        }
        
        update address;
        return dpiResponseResults;
    }
    
    //TODO: for Vyshnavi: This call needs to integrate with the DSAT Address controller later
    //FTRWSDSATAddressResponse
   /*     @AuraEnabled
    public static FTRWSDSATAddressResponse getDSATValidationResults(String street,String city,String state,String zip,String longitudeInp,String latitudeInp) {
       ftr_addressBeanDSAT quAdr= new ftr_addressBeanDSAT();
 
            quAdr.Address = street;
            quAdr.City = city;
            quAdr.State = state;
            quAdr.ZipCode = zip;
            quAdr.Longitude = longitudeInp;
            quAdr.Latitude = latitudeInp;
            
		return getDSATDummyResponse(quAdr);
    }*/
    
            @AuraEnabled
    public static FTRWSDSATAddressResponse getDSATValResultWithAddressId(ID addressId) {
        System.debug('Entering  getDSATValResultWithAddressId in FTRWSAddressController with parames: ' + addressId);
      /* FTRWSDSATAddressResponse dsatResponse = getDSATDummyData();
        get_UpdateAddress(addressId, 'UPDATE_DSAT',null, dsatResponse);
        return dsatResponse;*/
        //pavani: un-comment the below code later
        FTRWSAddress__c address = [Select Street_Number__c, Street_Name__c, City__c, State__c, Zip_Code__c,G_Latitude__c,Latitude__c,G_Longitude__c	,Longitude__c from FTRWSAddress__c where Id=: addressId];
        ftr_addressBeanDSAT addressBean = new ftr_addressBeanDSAT();
        addressBean.Address =address.Street_Number__c!=null?address.Street_Number__c + ' ' + address.Street_Name__c:address.Street_Name__c;
        addressBean.city=address.City__c;
        addressBean.state=address.State__c;
        addressBean.zipCode=address.Zip_Code__c;
        
        //SDDD-2423 fix - check for DSAT conflict with SFA for DSAT qualification
        if(String.isNotBlank(address.Latitude__c) && isLatLangValid(address.Latitude__c)){
            addressBean.Latitude = address.Latitude__c;
        }
        else{addressBean.Latitude = address.G_Latitude__c;}
        
        //SDDD-2423 fix - check for DSAT conflict with SFA for DSAT qualification
        if(String.isNotBlank(address.Longitude__c) && isLatLangValid(address.Longitude__c)) {
            addressBean.Longitude = address.Longitude__c;
        }
        else{addressBean.Longitude = address.G_Longitude__c;}   
        FTRWSDSATAddressResponse dsatResponse = FTRWSDSATAddressController.getDSATAddress(addressBean);
       
        if(dsatResponse != null) {
      		address.DSAT_Validated__c = true;
            address.HBE_Legacy__c = dsatResponse.HBE_Legacy;
            address.Nearby_HBE_SWC_CLLI__c = dsatResponse.Nearby_HBE_SWC_CLLI;
       		update address;      
        }
		get_UpdateAddress(addressId, 'UPDATE_DSAT',null, dsatResponse);
      //HBE_Legacy__c 
       return dsatResponse;
    }

    //SDDD-2423 fix - start DSAT conflict with SFA for DSAT qualification
    public static boolean isLatLangValid(String value) {
        boolean valid = false;
        if(String.isNotBlank(value) && value.indexOf('.') > -1) {
            String latVal = value.subString(value.indexOf('.') + 1, value.length());
            System.debug('Substringed latVal--' + latVal);	
            Integer decimalValue = Integer.valueOf(latVal);
            System.debug('decimalValue: --' + decimalValue); 
            if(decimalValue > 0) {
                valid = true;
            }
        }
        return valid;
    }
    //SDDD-2423 fix - end DSAT conflict with SFA for DSAT qualification
    
    //New method implemented to club DPI and DSAT validation results in one UI transaction
    @AuraEnabled
    public static FTRWSAddressResponse getAddressValidationResults(ID addressId) {
        System.debug('Entering  getAddressValidationResults in FTRWSAddressController with addressId: ' + addressId);
        
        FTRWSAddressResponse response = new FTRWSAddressResponse();
        
        FTRWSAddress__c address = [Select Street_Number__c, Street__c,Street_Name__c, City__c, State__c, Zip_Code__c from FTRWSAddress__c where Id=: addressId];

        List<FTRWSDPIAddressResponse> dpiAddressValResults = getDPIValResults(address);
        response.dpiResponseList = dpiAddressValResults;
       
        if(dpiAddressValResults != null && dpiAddressValResults.size() > 0) {
            response.dpiSuccess = true;
            Integer size = dpiAddressValResults.size(); 
            if(size == 1) {
                response.multipleDPIResults = false;
                FTRWSDPIAddressResponse dpiResp = dpiAddressValResults.get(0);
                if(dpiResp.status == 'FAILURE') {
                    response.dpiSuccess = false;
                    return response;
                }
            } else {
                response.multipleDPIResults = true;
                return response;
            }
        }
 
        if(response.dpiSuccess == true && response.multipleDPIResults == false) {
            FTRWSDPIAddressResponse dpiResponse = response.dpiResponseList.get(0);
           /* FTRWSDSATAddressResponse dsatResponse = getDSATValResultWithAddressId(addressId);
            if(dsatResponse == null) {
                response.dsatSuccess = false;
            } else {
            	response.dsatResponse = dsatResponse;
                response.dsatSuccess = true;
            }*/
            get_UpdateAddress(addressId, 'UPDATE_DPI',dpiResponse, null);
        }
        return response;
    }
    
    public class warpper{
        @AuraEnabled
        public boolean isSuccess{get;set;}
        
        @AuraEnabled
        public String errormessage{get;set;}
   }
    
 /*      private static FTRWSDSATAddressResponse getDSATDummyData() {
        
		FTRWSDSATAddressResponse dsatResponse = new FTRWSDSATAddressResponse();
        
        dsatResponse.businessName = '';
        
        dsatResponse.copperDistance = '9996';
        dsatResponse.copperQualification = 'BDT';//'Qualified (up to 50MB)';
        dsatResponse.copperTier = '2';
        
        dsatResponse.fiberDistance = '393';
        dsatResponse.fiberQualification = 'BDT';//'Qualified (max WC speed)';
        dsatResponse.fiberTier = '1';
        
        dsatResponse.createdBy = 'Hemantha Gujjar';
        dsatResponse.createdById = 'hgg395';
        dsatResponse.creatorEmail = 'hgg395@ftr.com';
        
        dsatResponse.inFootprint = true;
        dsatResponse.dsatId = '1655092';
        dsatResponse.market = 'D';
        dsatResponse.level = 'b';
        dsatResponse.litBuilding = true;
        dsatResponse.opened = '2021-05-17T13:56:16.6292161-04:00';
        dsatResponse.products = 'EIA, EVPL, ELAN, IPVPN, Jumbo Frames, EPL, Connect Cloud, EPath, EReach';
        
        dsatResponse.siteName = '';
        dsatResponse.latitude = '34.220407916631316';
        dsatResponse.longitude = '-119.14580691804325';
        
        dsatResponse.m6OrderNumber = '';
        dsatResponse.vfoRecordId = '';
        
        dsatResponse.wireCenterCLLI = 'ELRICAXF';
        dsatResponse.wireCenterQoS = 'Platinum';
        dsatResponse.wireCenterSpeed = '1000MB';
        return dsatResponse;
    } */
    

}