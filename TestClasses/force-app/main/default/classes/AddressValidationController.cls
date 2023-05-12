public class AddressValidationController{

 //Variables used to capture/set VF Elements
 public String stateListDef {get;set;}
 public String selectCriteriaDef {get;set;}
 public List<SelectOption> statesList {get;set;}
 public List<SelectOption> searchCritLst {get;set;}
 public String selectedStrtNumber {get;set;}
 public String selectedCity {get;set;}
 public String selectedCriteria {get;set;}
 public String selectedStrtName {get;set;}
 public String selectedZipCode {get;set;}
 public String selectedStrtSubtitle {get;set;}
 public String selectedStrtSubDescription {get;set;}
 public String selectedTelNum {get;set;}
 public Lead lead {get;set;} 
 public String ERROR_MSG {get;set;}
 
 //Following Variables will be used in WebService Calls
 public static String selectedStrtNumberStr {get;set;}
 public static String selectedCityStr {get;set;}
 public static String selectedStateStr {get;set;}
 public static String selectedStrtNameStr {get;set;}
 public static String selectedZipCodeStr {get;set;}
 public static String selectedStrtSubtitleStr {get;set;}
 public static String selectedStrtSubDescriptionStr {get;set;}
 public static String selectedTelNumStr {get;set;}
 public static String recordId {get;set;} 
 public static AddressRecord currentSelectedRecForPopup {get;set;}
 
 //Set Address Search Table in VF
 public List<AddressRecord> allAddressRecords {get;set;}

 //Popup Display Flag
 public boolean displayPopup {get; set;} 
 
 //CONSTANTS
 public static final String ADDRESS_CONST = 'Address';
 public static final String TELEPHONE_NUMBER_CONST = 'WTN';
 public static final String LINE_CARD_STATUS ='LineCardStatus';
 public static final String YES = 'Yes';
 public static final String NO = 'No';
 public static final String NA = 'N/A';
public static final String headerSecurity = 'sfacom' + ':' + 'frontier123';//'AggTest3' + ':' + 'FISagg8!'; 
 public static final String endpoint = 'https://esbdprprd.frontiercorp.com/ManageAddress';//'https://esbdpruat.frontiercorp.com/uat01/ManageAddress';
 
     public AddressValidationController(ApexPages.StandardController leadController){
        ERROR_MSG = '';
        statesList = new List<selectOption>(); 
        statesList.add(new selectOption('NONE','Select from dropdown list... '));
        statesList.add(new selectOption('AL','AL - ALABAMA'));
        statesList.add(new selectOption('AK','AK - ALASKA'));
        statesList.add(new selectOption('AS','AS - AMERICAN SAMOA'));
        statesList.add(new selectOption('AZ','AZ - ARIZONA'));
        statesList.add(new selectOption('AR','AR - ARKANSAS'));
        statesList.add(new selectOption('CA','CA - CALIFORNIA'));
        statesList.add(new selectOption('CO','CO - COLORADO'));
        statesList.add(new selectOption('CT','CT - CONNECTICUT'));
        statesList.add(new selectOption('DE','DE - DELAWARE'));
        statesList.add(new selectOption('DC','DC - DISTRICT OF COLUMBIA'));
        statesList.add(new selectOption('FM','FM - FEDERATED STATES OF MICRONESIA'));
        statesList.add(new selectOption('FL','FL - FLORIDA'));
        statesList.add(new selectOption('GA','GA - GEORGIA'));
        statesList.add(new selectOption('GU','GU - GUAM'));
        statesList.add(new selectOption('HI','HI - HAWAII'));
        statesList.add(new selectOption('ID','ID - IDAHO'));
        statesList.add(new selectOption('IL','IL - ILLINOIS'));
        statesList.add(new selectOption('IN','IN - INDIANA'));
        statesList.add(new selectOption('IA','IA - IOWA'));
        statesList.add(new selectOption('KS','KS - KANSAS'));
        statesList.add(new selectOption('KY','KY - KENTUCKY'));
        statesList.add(new selectOption('LA','LA - LOUISIANA'));
        statesList.add(new selectOption('ME','ME - MAINE'));
        statesList.add(new selectOption('MH','MH - MARSHALL ISLANDS'));
        statesList.add(new selectOption('MD','MD - MARYLAND'));
        statesList.add(new selectOption('MA','MA - MASSACHUSETTS'));
        statesList.add(new selectOption('MI','MI - MICHIGAN'));
        statesList.add(new selectOption('MN','MN - MINNESOTA'));
        statesList.add(new selectOption('MS','MS - MISSISSIPPI'));
        statesList.add(new selectOption('MO','MO - MISSOURI'));
        statesList.add(new selectOption('MT','MT - MONTANA'));
        statesList.add(new selectOption('NE','NE - NEBRASKA'));
        statesList.add(new selectOption('NV','NV - NEVADA'));
        statesList.add(new selectOption('NH','NH - NEW HAMPSHIRE'));
        statesList.add(new selectOption('NJ','NJ - NEW JERSEY'));
        statesList.add(new selectOption('NM','NM - NEW MEXICO'));
        statesList.add(new selectOption('NY','NY - NEW YORK'));
        statesList.add(new selectOption('NC','NC - NORTH CAROLINA'));
        statesList.add(new selectOption('ND','ND - NORTH DAKOTA'));
        statesList.add(new selectOption('MP','MP - NORTHERN MARIANA ISLANDS'));
        statesList.add(new selectOption('OH','OH - OHIO'));
        statesList.add(new selectOption('OK','OK - OKLAHOMA'));
        statesList.add(new selectOption('OR','OR - OREGON'));
        statesList.add(new selectOption('PW','PW - PALAU'));
        statesList.add(new selectOption('PA','PA - PENNSYLVANIA'));
        statesList.add(new selectOption('PR','PR - PUERTO RICO'));
        statesList.add(new selectOption('RI','RI - RHODE ISLAND'));
        statesList.add(new selectOption('SC','SC - SOUTH CAROLINA'));
        statesList.add(new selectOption('SD','SD - SOUTH DAKOTA'));
        statesList.add(new selectOption('TN','TN - TENNESSEE'));
        statesList.add(new selectOption('TX','TX - TEXAS'));
        statesList.add(new selectOption('UT','UT - UTAH'));
        statesList.add(new selectOption('VT','VT - VERMONT'));
        statesList.add(new selectOption('VI','VI - VIRGIN ISLANDS'));
        statesList.add(new selectOption('VA','VA - VIRGINIA'));
        statesList.add(new selectOption('WA','WA - WASHINGTON'));
        statesList.add(new selectOption('WV','WV - WEST VIRGINIA'));
        statesList.add(new selectOption('WI','WI - WISCONSIN'));
        statesList.add(new selectOption('WY','WY - WYOMING'));   
        
        searchCritLst = new List<selectOption>(); 
        searchCritLst.add(new selectOption(ADDRESS_CONST, 'Address')); 
        searchCritLst.add(new selectOption(TELEPHONE_NUMBER_CONST, 'WTN')); 
        //default value for State
        stateListDef = 'NONE';
        //default value for Search Criteria
        selectCriteriaDef = ADDRESS_CONST;
        
        //Pull Default values from Lead Object
        if( !Test.isRunningTest() ){
            leadController.addFields(new String[]{
                'City__c',
                'State_Value__c',
                'Street_Name__c',
                'street_Number__c',
                'Zip_Code__c',
                'Street_Subtitle__c',
                'Street_Subtitle_Ln_Ave_etc__c'
            });
            this.lead=(Lead)leadController.getRecord(); 
            selectedStrtNumber = lead.street_Number__c;
            selectedCity = lead.City__c; 
            if( lead.State_Value__c != null || lead.State_Value__c != '' ){
                stateListDef = lead.State_Value__c;
            } 
            selectedStrtName = lead.Street_Name__c; 
            selectedZipCode = lead.Zip_Code__c;
            selectedStrtSubtitle = lead.Street_Subtitle__c; 
            selectedStrtSubDescription = lead.Street_Subtitle_Ln_Ave_etc__c;
        }
        //temporary initialization for testing
       /* selectedStrtName = 'Prairie Rose'; 
        selectedZipCode = '51008';
        selectedStrtNumber = '335';
        selectedCity = 'Brunsville';
        stateListDef = 'IA';    
        selectedStrtSubtitle = 'Ln'; 
        selectedStrtSubDescription = ''; */
     }
     
     public boolean checkMandatoryFields(){
        if( selectCriteriaDef == ADDRESS_CONST ){
            //Check if Street Name,City,State,ZipCode are empty
            if( selectedStrtName == '' || selectedCity == '' || stateListDef == 'NONE' || selectedZipCode == '' ){
                ERROR_MSG = 'Please Enter values in mandatory fields';
                ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.WARNING, ERROR_MSG));
                return true;
            }
        }else if( selectCriteriaDef == TELEPHONE_NUMBER_CONST ){
            if( selectedTelNum == '' ){
                ERROR_MSG = 'Please Enter a value for Telephone Number';
                ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.WARNING, ERROR_MSG));
                return true;
            }
        }
        return false;
     }
     
     public PageReference validatePhysicalAddress(){
        if( !(checkMandatoryFields()) ){
            //Invoke DP WebService to retrieve address details
            if( selectCriteriaDef == ADDRESS_CONST ){
                selectedStrtNumberStr = selectedStrtNumber;
                selectedCityStr = selectedCity;
                selectedStateStr = stateListDef;
                selectedStrtNameStr = selectedStrtName;
                selectedZipCodeStr = selectedZipCode;
                selectedStrtSubtitleStr = selectedStrtSubtitle;
                selectedStrtSubDescriptionStr = selectedStrtSubDescription;
                allAddressRecords = new List<AddressRecord>();
                allAddressRecords = invokeManageAddressService(ADDRESS_CONST);          
            }
            else if( selectCriteriaDef == TELEPHONE_NUMBER_CONST ){
                selectedTelNumStr = selectedTelNum;
                allAddressRecords = invokeManageAddressService(TELEPHONE_NUMBER_CONST);
            }
        }    
        return null;
     }
   
    public static List<AddressRecord> invokeManageAddressService(String serviceType){
        //Return List
        List<AddressRecord> allAddressRecords = new List<AddressRecord>();        
        //Main Service Invocation Object
        manageaddresslibraryManageaddressinterAV.WSExport_ManageAddressHttpPort manageAddressWebServiceObj =  webserviceCon(); 
        
        //Response Object
        ibusCzncorpComEsbManageaddressAv.ManageAddressGetAddressResponse manageAddressGetAddressResponseObj = new ibusCzncorpComEsbManageaddressAv.ManageAddressGetAddressResponse();        
        
        //Webservice Request Input Objects
        ibusCzncorpComEsbExecutioncontextAV.ExecutionContext executionContextObj = new ibusCzncorpComEsbExecutioncontextAV.ExecutionContext();
        ibusCzncorpComEsbManageaddressAv.GetAddressRequestCriteria getAddressRequestCriteriaObj = new ibusCzncorpComEsbManageaddressAv.GetAddressRequestCriteria();
        
        //Setting Values for ExecutionContext
        ibusCzncorpComEsbExecutioncontextAV.ExecutionStatus executionStatusObj = new ibusCzncorpComEsbExecutioncontextAV.ExecutionStatus(); //out of scope for now
            //Set ESB Header Values
        ibusCzncorpComEsbExecutioncontextAV.ESBHeader eSBHeaderObj = new ibusCzncorpComEsbExecutioncontextAV.ESBHeader();
        ibusCzncorpComEsbExecutioncontextAV.ConsumerInfo consumerInfoObj = new ibusCzncorpComEsbExecutioncontextAV.ConsumerInfo();
        ibusCzncorpComEsbExecutioncontextAV.ProviderInfo[] providerInfoObj = new List<ibusCzncorpComEsbExecutioncontextAV.ProviderInfo>(); //out of scope for now
            //Set ConsumerInfo Values
                consumerInfoObj.ApplicationID = 'SFDC'; // ??
                consumerInfoObj.EmployeeID = '123456'; // ??
                consumerInfoObj.UserID = 'ESB_REG'; // ??
        eSBHeaderObj.ConsumerInfo = consumerInfoObj;
            
        executionContextObj.ESBHeader = eSBHeaderObj;   
        
        //Setting Values for RequestCriteria
        ibusCzncorpComEsbBusinessobjectsAV.AddressType addressObj = new ibusCzncorpComEsbBusinessobjectsAV.AddressType();
        ibusCzncorpComEsbBusinessobjectsAV.TelephoneNumber telephoneNumberObj = new ibusCzncorpComEsbBusinessobjectsAV.TelephoneNumber(); // not used for "Address" Search
        getAddressRequestCriteriaObj.Action = 'RetrievePostalAndServiceAddress';        
        
        if( serviceType == ADDRESS_CONST ){
            //Set Address Values
            ibusCzncorpComEsbBusinessobjectsAV.CitizensServiceAddress serviceAddressObj = new ibusCzncorpComEsbBusinessobjectsAV.CitizensServiceAddress();
            ibusCzncorpComEsbBusinessobjectsAV.CitizensPostalAddress postalAddressObj = new ibusCzncorpComEsbBusinessobjectsAV.CitizensPostalAddress(); //out of scope for now
                //Set Service Address
                serviceAddressObj.StreetNrFirst = selectedStrtNumberStr;
                serviceAddressObj.StreetName = selectedStrtNameStr;
                serviceAddressObj.Locality = selectedCityStr;
                serviceAddressObj.StateOrProvince = selectedStateStr;
                serviceAddressObj.Postcode = selectedZipCodeStr;
                serviceAddressObj.StreetSuffix = selectedStrtSubtitleStr;
                serviceAddressObj.StreetSubDescription = selectedStrtSubDescriptionStr;
            addressObj.ServiceAddress = serviceAddressObj;              
            getAddressRequestCriteriaObj.Address = addressObj;

        }
        if( serviceType == TELEPHONE_NUMBER_CONST ){
            telephoneNumberObj.Number_x = selectedTelNumStr;
            getAddressRequestCriteriaObj.TelephoneNumber = telephoneNumberObj;
            getAddressRequestCriteriaObj.ResultFilterIndicator = 'ReturnFullAddress';
        }
        
        //Invoke WebService Now
        manageAddressGetAddressResponseObj = manageAddressWebServiceObj.GetAddress(executionContextObj, getAddressRequestCriteriaObj);

        System.Debug('WEBSERVICE INVOKED');
        
        //Retrieve Addresses Array from RESPONSE NOW : It may have Service Address/Postal Address
        //Initialize AddressesListObj
        ibusCzncorpComEsbBusinessobjectsAV.AddressType[] addressesListObj = new List<ibusCzncorpComEsbBusinessobjectsAV.AddressType>();
        addressesListObj = manageAddressGetAddressResponseObj.Address;    
        
        if( addressesListObj != null && addressesListObj.size() > 0 ){
            //Retrieve ServiceAddress/PostalAddress from each Address Object
            ibusCzncorpComEsbBusinessobjectsAV.CitizensServiceAddress serviceAddressRec;
            ibusCzncorpComEsbBusinessobjectsAV.CitizensPostalAddress postalAddressRec;       
                           
            Integer idIndx = 0;
            for(ibusCzncorpComEsbBusinessobjectsAV.AddressType eachAddress: addressesListObj){
                serviceAddressRec = eachAddress.ServiceAddress;
                postalAddressRec = eachAddress.PostalAddress;
                AddressRecord eachRecordObj;
                
                if( serviceAddressRec != null ){
                    eachRecordObj = new AddressRecord();
                    eachRecordObj.idVal = 'ID' + String.valueOf(idIndx);
                    eachRecordObj.ServiceSequenceNumber = String.valueOf(serviceAddressRec.ServiceSequenceNumber) ;
                    eachRecordObj.StreetNrFirst = serviceAddressRec.StreetNrFirst ;
                    eachRecordObj.StreetDirection = serviceAddressRec.StreetDirection ;
                    eachRecordObj.StreetName = serviceAddressRec.StreetName ;
                    eachRecordObj.StreetSuffix = serviceAddressRec.StreetSuffix ;
                    eachRecordObj.StreetSubDescription = serviceAddressRec.StreetSubDescription ;
                    eachRecordObj.Locality = serviceAddressRec.Locality ;                   
                    eachRecordObj.StateOrProvince = serviceAddressRec.StateOrProvince ;
                    eachRecordObj.Postcode = serviceAddressRec.Postcode ;
                    
                    /*Setting other Variables */
                    if( serviceAddressRec.BuildingNumber != null && serviceAddressRec.BuildingNumber != '' ){
                        eachRecordObj.BuildingNumber = serviceAddressRec.BuildingNumber ;
                    }
                    if( serviceAddressRec.BuildingName != null && serviceAddressRec.BuildingName != '' ){
                        eachRecordObj.BuildingName = serviceAddressRec.BuildingName ;
                    }
                    
                    if( serviceAddressRec.BuildingSubNumber != null && serviceAddressRec.BuildingSubNumber != '' ){
                        eachRecordObj.BuildingSubNumber = serviceAddressRec.BuildingSubNumber ;
                    }
                    if( serviceAddressRec.StreetPostDirection != null && serviceAddressRec.StreetPostDirection != '' ){
                        eachRecordObj.StreetPostDirection = serviceAddressRec.StreetPostDirection ;
                    }
                    
                    if( serviceAddressRec.Subdivision != null && serviceAddressRec.Subdivision != '' ){
                        eachRecordObj.Subdivision = serviceAddressRec.Subdivision ;
                    }
                    
                    if( serviceAddressRec.LocalityID != null && serviceAddressRec.LocalityID != '' ){
                        eachRecordObj.LocalityID = serviceAddressRec.LocalityID ;
                    }
                    if( serviceAddressRec.TaxingDistrict != null ){
                        ibusCzncorpComEsbBusinessobjectsAV.CodeDescriptionPair taxingDistrict = serviceAddressRec.TaxingDistrict ;
                        if( taxingDistrict.Code != null ){
                            eachRecordObj.TaxingDistrict = taxingDistrict.Code ;
                        }                   
                    }
                    
                    if( serviceAddressRec.WireCenter != null && serviceAddressRec.WireCenter != '' ){
                        eachRecordObj.WireCenter = serviceAddressRec.WireCenter ;
                    }                   
                    if( serviceAddressRec.Exchange != null ){
                        ibusCzncorpComEsbBusinessobjectsAV.Exchange exchange= serviceAddressRec.Exchange;
                        if( exchange.NPA != null ){
                            eachRecordObj.Exchange = exchange.NPA ;
                        }
                        if( exchange.NXX != null ){
                            if( eachRecordObj.Exchange != '' ){
                                eachRecordObj.Exchange = eachRecordObj.Exchange + ',' + exchange.NXX ;
                            }else{
                                eachRecordObj.Exchange = exchange.NXX ;
                            }                           
                        }                       
                    }
                    
                    if( serviceAddressRec.HSICapableFlag != null && serviceAddressRec.HSICapableFlag ){
                        eachRecordObj.HSICapableFlag = YES ;
                    }else if( serviceAddressRec.HSICapableFlag != null && !serviceAddressRec.HSICapableFlag ){
                        eachRecordObj.HSICapableFlag = NO ;
                    }else{
                        eachRecordObj.HSICapableFlag = NA ;
                    }                                                       
                    if( serviceAddressRec.FiberProductCapableFlag != null && serviceAddressRec.FiberProductCapableFlag ){
                        eachRecordObj.FiberProductCapableFlag = YES ;
                    }else if( serviceAddressRec.FiberProductCapableFlag != null && !serviceAddressRec.FiberProductCapableFlag ){
                        eachRecordObj.FiberProductCapableFlag = NO ;
                    }else{
                        eachRecordObj.FiberProductCapableFlag = NA ;
                    }
                    
                    //Set HSI Max Speed,Fiber Speed,Premium Speed from InternetInfo
                    ibusCzncorpComEsbBusinessobjectsAV.InternetInfoType internetInfo;

                    if( serviceAddressRec.InternetInfo != null ){
                        internetInfo = serviceAddressRec.InternetInfo ;
                    }                   
                    if( internetInfo != null && internetInfo.AvailableMaxProductSpeed != null && internetInfo.AvailableMaxProductSpeed != '' ){
                        eachRecordObj.HSIMaxSpeed = internetInfo.AvailableMaxProductSpeed ;
                    }
                    if( internetInfo != null && internetInfo.AccountSpeed != null && internetInfo.AccountSpeed != '' ){
                        eachRecordObj.FiberSpeed = internetInfo.AccountSpeed ;
                    }
                    
                    if( internetInfo != null && internetInfo.HighestAvailableSpeed != null && internetInfo.HighestAvailableSpeed != '' ){
                        eachRecordObj.HSIPremiumSpeed = internetInfo.HighestAvailableSpeed ;
                    }
                    //Set Transport Medium,DroppedStatus & DropperFlag from Line Object
                    List<ibusCzncorpComEsbBusinessobjectsAV.Line> lineArr;
                    if( serviceAddressRec.Line != null ){
                        lineArr = serviceAddressRec.Line ;
                    }
                    if( lineArr != null && lineArr.size() > 0 ){
                        for(ibusCzncorpComEsbBusinessobjectsAV.Line eachLine: lineArr){
                            if( eachLine.TransportMedium != null && eachLine.TransportMedium != '' ){
                                eachRecordObj.TransportMedium = eachLine.TransportMedium;
                            }
                            if( eachLine.DropType != null && eachLine.DropType != '' ){
                                eachRecordObj.FiberDropType = eachLine.DropType;
                            }
                            if( eachLine.DroppedFlag != null && eachLine.DroppedFlag ){
                                eachRecordObj.DroppedFlag = YES;
                            }else if( eachLine.DroppedFlag != null && !eachLine.DroppedFlag ){
                                eachRecordObj.DroppedFlag = NO;
                            }else{
                                eachRecordObj.DroppedFlag = NA;
                            }
                        }
                    }
                    
                    //Set LineCard Status from AdditionalAddressInfo Object
                    List<ibusCzncorpComEsbBusinessobjectsAV.AdditionalAddressInfo> additionalAddressInfoArr;
                    if( serviceAddressRec.AdditionalAddressInfo != null ){
                        additionalAddressInfoArr = serviceAddressRec.AdditionalAddressInfo;
                        if( additionalAddressInfoArr.size() > 0 ){
                            for(ibusCzncorpComEsbBusinessobjectsAV.AdditionalAddressInfo eachAddressInfo: additionalAddressInfoArr){
                                ibusCzncorpComEsbBusinessobjectsAV.CharacteristicValue characteristicValue = eachAddressInfo.CharacteristicValue;
                                if( characteristicValue != null && characteristicValue.Characteristic == LINE_CARD_STATUS ){
                                    if( characteristicValue.Value != null ){
                                        eachRecordObj.LineCardStatus = characteristicValue.Value ;
                                    }   
                                }
                            }
                        }                       
                    }
                    //Set Billing System & Data Region via DataSourceEnvironment
                    ibusCzncorpComEsbBusinessobjectsAV.DataSourceEnvironment dataSourceEnvironment;
                    if( serviceAddressRec.DataSourceEnvironment != null ){
                        dataSourceEnvironment = serviceAddressRec.DataSourceEnvironment;
                        if( dataSourceEnvironment.DataRegion != null && dataSourceEnvironment.DataRegion != '' ){
                            eachRecordObj.DataRegion = dataSourceEnvironment.DataRegion;
                        }                       
                    }
                    
                    if( serviceAddressRec.PricingSegmentIndicator != null && serviceAddressRec.PricingSegmentIndicator != '' ){
                        eachRecordObj.PricingSegmentIndicator = serviceAddressRec.PricingSegmentIndicator ;
                    }
                    if( serviceAddressRec.HomeOwnerAssociationFlag != null && serviceAddressRec.HomeOwnerAssociationFlag ){
                        eachRecordObj.HomeOwnerAssociationFlag = YES ;
                    }else if( serviceAddressRec.HomeOwnerAssociationFlag != null && !serviceAddressRec.HomeOwnerAssociationFlag ){
                        eachRecordObj.HomeOwnerAssociationFlag = NO ;
                    }else{
                        eachRecordObj.HomeOwnerAssociationFlag = NA;
                    }
                    
                    if( serviceAddressRec.LocalFranchiseAgreementFlag != null && serviceAddressRec.LocalFranchiseAgreementFlag ){
                        eachRecordObj.LocalFranchiseAgreementFlag = YES ;
                    }else if( serviceAddressRec.LocalFranchiseAgreementFlag != null && !serviceAddressRec.LocalFranchiseAgreementFlag ){
                        eachRecordObj.LocalFranchiseAgreementFlag = NO ;
                    }else{
                        eachRecordObj.LocalFranchiseAgreementFlag = NA ;
                    }
                    //Set UnitSequenceNumber,Number & Desingator via AddressUnit Object 
                    List<ibusCzncorpComEsbBusinessobjectsAV.AddressUnit> unit;
                    if( serviceAddressRec.Unit != null ){
                        unit = serviceAddressRec.Unit;
                        if( unit.size() > 0 ){
                            for(ibusCzncorpComEsbBusinessobjectsAV.AddressUnit eachUnit: unit){
                                if( eachUnit.SequenceNumber != null ){
                                    eachRecordObj.UnitSeqNumber = String.valueOf(eachUnit.SequenceNumber) ;
                                }
                                if( eachUnit.Designator != null ){
                                    eachRecordObj.UnitDesignator = eachUnit.Designator ;
                                }
                                if( eachUnit.Number_x != null ){
                                    eachRecordObj.UnitNumber = eachUnit.Number_x ;
                                }
                            }
                        }                       
                    }
                    
                    if( serviceAddressRec.ConnectedLineCardsFoundFlag != null && serviceAddressRec.ConnectedLineCardsFoundFlag ){
                        eachRecordObj.ConnectedLineCardsFoundFlag = YES ;
                    }else if( serviceAddressRec.ConnectedLineCardsFoundFlag != null && !serviceAddressRec.ConnectedLineCardsFoundFlag ){
                        eachRecordObj.ConnectedLineCardsFoundFlag = NO ;
                    }else{
                        eachRecordObj.ConnectedLineCardsFoundFlag = NA ;
                    }
                    if( serviceAddressRec.FiberVideoAvailableFlag != null && serviceAddressRec.FiberVideoAvailableFlag ){
                        eachRecordObj.FiberVideoAvailableFlag = YES ;
                    }else if( serviceAddressRec.FiberVideoAvailableFlag != null && !serviceAddressRec.FiberVideoAvailableFlag ){
                        eachRecordObj.FiberVideoAvailableFlag = NO ;
                    }else{
                        eachRecordObj.FiberVideoAvailableFlag = NA ;
                    }
                    
                    //Set PairCount From&To via LineCard Object
                    ibusCzncorpComEsbBusinessobjectsAV.LineCard lineCardInfo;
                    if( serviceAddressRec.LineCardInfo != null ){
                        lineCardInfo = serviceAddressRec.LineCardInfo;
                        if( lineCardInfo.PairCountFrom != null && lineCardInfo.PairCountFrom != '' ){
                            eachRecordObj.PairCountFrom = lineCardInfo.PairCountFrom ;
                        }
                        if( lineCardInfo.PairCountTo != null && lineCardInfo.PairCountTo != '' ){
                            eachRecordObj.PairCountTo = lineCardInfo.PairCountTo ;
                        }
                        
                    }

                    //FOLLOWING FIELDS ARE NOT AVAILABLE IN THE XML OR IN THE SCHEMA - PLEASE GET THE CLARIFICATIONS FOR THE FOLLOWING
                    //FIELDS   FiberDropStatus,FiberDropType,DedicatedPair
                    /*if( serviceAddressRec.FiberDropStatus != null && serviceAddressRec.FiberDropStatus != '' ){
                        eachRecordObj.FiberDropStatus = serviceAddressRec.FiberDropStatus ;
                    }
                    if( serviceAddressRec.FiberDropType != null && serviceAddressRec.FiberDropType!= '' ){
                        eachRecordObj.FiberDropType = serviceAddressRec.FiberDropType ;
                    }
                    if( serviceAddressRec.DedicatedPair != null && serviceAddressRec.DedicatedPair != '' ){
                        eachRecordObj.DedicatedPair = serviceAddressRec.DedicatedPair ;
                    }*/
                    
                    
                    if( internetInfo != null && internetInfo.PlantType != null && internetInfo.PlantType != '' ){
                        eachRecordObj.PlantType = internetInfo.PlantType ;
                    }
                    //Set CentralOffice CCLI from Connection Object via InternetInfo Object
                    ibusCzncorpComEsbBusinessobjectsAV.ConnectionListType connections;
                    ibusCzncorpComEsbBusinessobjectsAV.TechnologyListType technologies;
                    if( internetInfo != null && internetInfo.Connections != null ){
                        connections = internetInfo.Connections;                     
                        List<ibusCzncorpComEsbBusinessobjectsAV.ConnectionType> connectionsArr;
                        if( connections.Connection != null ){
                            connectionsArr = connections.Connection;
                            for(ibusCzncorpComEsbBusinessobjectsAV.ConnectionType eachConnectionType: connectionsArr){
                                if( eachConnectionType.CentralOffice != null && eachConnectionType.CentralOffice != '' ){
                                    eachRecordObj.CentralOffice = eachConnectionType.CentralOffice ;
                                }
                                if( eachConnectionType.Technologies != null ){                                                                      
                                    technologies = eachConnectionType.Technologies;
                                }                               
                            }
                        }
                    }
                    
                    //Set Technology Table
                    if( technologies != null && technologies.Technology != null){
                        List<ibusCzncorpComEsbBusinessobjectsAV.TechnologyType> technologyArr = technologies.Technology;
                        if( technologyArr.size() > 0 ){
                            List<TechnologyType> techGroupTableRows = new List<TechnologyType>();
                            for(ibusCzncorpComEsbBusinessobjectsAV.TechnologyType eachTechRow:technologyArr){
                                TechnologyType customRow = new TechnologyType();
                                customRow.Technology = eachTechRow.Technology;
                                customRow.TechnologyGroup = eachTechRow.TechnologyGroup;
                                customRow.AvailableSpeed = eachTechRow.AvailableSpeed;
                                customRow.MaxDslamSpeed = eachTechRow.MaxDslamSpeed;
                                customRow.DefaultModem = eachTechRow.DefaultModem;
                                techGroupTableRows.add(customRow);
                            }
                            if( techGroupTableRows.size() > 0 ){
                                eachRecordObj.TechGroupTableRows = techGroupTableRows ;
                            }                           
                        }                       
                    }         
 
                    allAddressRecords.add(eachRecordObj);
                    idIndx = idIndx + 1;
                }
                if( postalAddressRec != null ){                                     
                    //Sequence Number is found in another Object AddressText
                    List<ibusCzncorpComEsbBusinessobjectsAV.AddressText> addressTextList = postalAddressRec.AddressText;
                    
                    if( addressTextList != null && addressTextList.size() > 0 ){                        
                        for(ibusCzncorpComEsbBusinessobjectsAV.AddressText eachAddressSeq: addressTextList){
                            eachRecordObj = new AddressRecord();            
                            eachRecordObj.idVal = 'ID' + String.valueOf(idIndx);
                            eachRecordObj.Locality = postalAddressRec.Locality ;
                            eachRecordObj.StateOrProvince = postalAddressRec.StateOrProvince ;
                            eachRecordObj.Postcode = postalAddressRec.Postcode ;
                            eachRecordObj.ServiceSequenceNumber = String.valueOf(eachAddressSeq.SequenceNumber) ;
                            allAddressRecords.add(eachRecordObj);
                            idIndx = idIndx + 1;
                        }                                               
                    }                         
                }
            }       
        }
        return allAddressRecords;
    }    
       public PageReference searchPhysicalAddress(){
        if( !(checkMandatoryFields()) ){
            if( selectCriteriaDef == ADDRESS_CONST ){
                //Invoke DP WebService to retrieve address details
                selectedStrtNumberStr = selectedStrtNumber;
                selectedCityStr = selectedCity;
                selectedStateStr = stateListDef;			 
                selectedStrtNameStr = selectedStrtName;
                selectedZipCodeStr = selectedZipCode;
                selectedStrtSubtitleStr = selectedStrtSubtitle;
                selectedStrtSubDescriptionStr = selectedStrtSubDescription;
                allAddressRecords = new List<AddressRecord>();
                allAddressRecords = searchUSPSService(ADDRESS_CONST);          
            }
            else if( selectCriteriaDef == TELEPHONE_NUMBER_CONST ){
                selectedTelNumStr = selectedTelNum;
                allAddressRecords = searchUSPSService(TELEPHONE_NUMBER_CONST);
            }
        }    
        return null;
     }
     
     public void resetFields(){
        if( selectCriteriaDef == ADDRESS_CONST ){
            selectedStrtNumber = '';
            selectedCity = '';
            selectedCriteria = '';
            selectedStrtName = '';
            selectedZipCode = '';
            selectedStrtSubtitle = '';
            selectedStrtSubDescription = '';
            stateListDef = 'Select from dropdown list... ';
        }else{
            selectedTelNum = '';
        } 
        allAddressRecords = new List<AddressRecord>();
     }
     
     public void reLoadAddressValidation(){
        System.Debug('ON CHANGE SELECT CRITERIA');
        System.Debug(selectCriteriaDef);
     }
     
    public PageReference closePopup() {
        displayPopup = false;
        return null;
    }
 
    public PageReference showPopup() {
        //recordId holds the record to be shown on Popup
        for(AddressRecord eachAddRecord:allAddressRecords){
            if( eachAddRecord.idVal == recordId ){
                currentSelectedRecForPopup = eachAddRecord;
                break;
            }
        }
        displayPopup = true;
        return null;
    } 
    
    public class AddressRecord{
        public String idVal {get;set;}
        public String StateOrProvince {get;set;}
        public String Country {get;set;}
        public String County {get;set;}
        public String StreetNrFirst {get;set;}
        public String StreetNrFirstSuffix {get;set;}
        public String StreetName {get;set;}
        public String StreetType {get;set;}
        public String StreetSuffix {get;set;}
        public String StreetNrLast {get;set;}
        public String StreetNrLastSuffix {get;set;}
        public String Locality {get;set;}
        public String Postcode {get;set;}
        public String StreetNrFirstPrefix {get;set;}
        public String StreetNrLastPrefix {get;set;}
        public String StreetNamePrefix {get;set;}
        public String StreetNameSuffix {get;set;}
        public String Subdivision {get;set;}
        public String StreetSubDescription {get;set;}
        public String StreetDirection {get;set;}
        public String StreetPostDirection {get;set;}
        public String BuildingName {get;set;}
        public String BuildingNumber {get;set;}
        public String BuildingSubNumber {get;set;}
        public String HSICapableFlag {get;set;}
        public String PricingSegmentIndicator {get;set;}
        public String ReadyForServiceFlag {get;set;}
        public String ServiceSequenceNumber {get;set;}
        public String ServiceControlNumber {get;set;}
        public String HomeOwnerAssociationFlag {get;set;}
        public String LocalFranchiseAgreementFlag {get;set;}
        public String FiberProductCapableFlag {get;set;}
        public String FiberVideoAvailableFlag {get;set;}
        public String Ethernet {get;set;}
        public String IncorporatedFlag {get;set;}
        public String HSIMaxSpeed {get;set;}
        public String HSIPremiumSpeed {get;set;}
        public String FiberSpeed {get;set;}
        
        public String LocalityID {get;set;}
        public String TaxingDistrict {get;set;}
        public String WireCenter {get;set;}
        public String Exchange {get;set;}
        public String LineCardStatus {get;set;}
        public String DataRegion {get;set;}
        public String ConnectedLineCardsFoundFlag {get;set;}
        public String PairCountFrom {get;set;}
        public String PairCountTo {get;set;}
        public String PlantType {get;set;}
        public String CentralOffice {get;set;}
        public String UnitSeqNumber {get;set;}
        public String UnitNumber {get;set;}
        public String UnitDesignator {get;set;}
        public String TransportMedium {get;set;}
        public String FiberDropStatus {get;set;}
        public String FiberDropType {get;set;}
        public String DroppedFlag {get;set;}
        public String DedicatedPair {get;set;}
        public List<TechnologyType> TechGroupTableRows {get;set;}
        
    }
    
    public class TechnologyType {
        public String Technology {get;set;}
        public String TechnologyGroup {get;set;}
        public String TechnologyItem {get;set;}
        public String AvailableSpeed {get;set;}
        public String AdditionalSpeedInfo {get;set;}
        public String MaxDslamSpeed {get;set;}
        public String DefaultModem {get;set;}
        public String MarketOffering {get;set;}
        public String CustomerType {get;set;}
    }
    
    public static manageaddresslibraryManageaddressinterAV.WSExport_ManageAddressHttpPort webserviceCon () {
    	manageaddresslibraryManageaddressinterAV.WSExport_ManageAddressHttpPort manageAddressWebServiceObj = new manageaddresslibraryManageaddressinterAV.WSExport_ManageAddressHttpPort();
    	Map<String,String> inita=new Map<String,String>();    
    	
		//Setting Creds for Webservice Authorization.        
		Blob headerValue = Blob.valueOf(headerSecurity);
        String authorizationHeader = 'Basic ' + EncodingUtil.base64Encode(headerValue);
        inita.put('Authorization', authorizationHeader );
        manageAddressWebServiceObj.inputHttpHeaders_x = inita;
        manageAddressWebServiceObj.endpoint_x =endpoint;// 'https://esbdpruat.frontiercorp.com/ManageAddress';
    	return manageAddressWebServiceObj; 
    }
    
    public static List<AddressRecord> searchUSPSService(String serviceType){
        //Return List
        List<AddressRecord> allAddressRecords = new List<AddressRecord>();  
              
        //Main Service Invocation Object
        manageaddresslibraryManageaddressinterAV.WSExport_ManageAddressHttpPort manageAddressWebServiceObj = new manageaddresslibraryManageaddressinterAV.WSExport_ManageAddressHttpPort();       
        manageAddressWebServiceObj = webserviceCon(); 
        
        //Response Object
        ibusCzncorpComEsbManageaddressAv.ManageAddressSearchAddressResponse manageAddressSearchAddressResponseObj = new ibusCzncorpComEsbManageaddressAv.ManageAddressSearchAddressResponse();
        
        //Webservice Request Input Objects
        ibusCzncorpComEsbExecutioncontextAV.ExecutionContext executionContextObj = new ibusCzncorpComEsbExecutioncontextAV.ExecutionContext();
        ibusCzncorpComEsbManageaddressAv.SearchAddressRequestCriteria  searchAddressRequestCriteriaObj = new ibusCzncorpComEsbManageaddressAv.SearchAddressRequestCriteria();
        
        //Setting Values for ExecutionContext
        ibusCzncorpComEsbExecutioncontextAV.ExecutionStatus executionStatusObj = new ibusCzncorpComEsbExecutioncontextAV.ExecutionStatus(); //out of scope for now
        //Set ESB Header Values
        ibusCzncorpComEsbExecutioncontextAV.ESBHeader eSBHeaderObj = new ibusCzncorpComEsbExecutioncontextAV.ESBHeader();
        ibusCzncorpComEsbExecutioncontextAV.ConsumerInfo consumerInfoObj = new ibusCzncorpComEsbExecutioncontextAV.ConsumerInfo();
        ibusCzncorpComEsbExecutioncontextAV.ProviderInfo[] providerInfoObj = new List<ibusCzncorpComEsbExecutioncontextAV.ProviderInfo>(); //out of scope for now
        //Set ConsumerInfo Values
                consumerInfoObj.ApplicationID = 'SFDC'; // ??
                consumerInfoObj.EmployeeID = '123456'; // ??
                consumerInfoObj.UserID = 'ESB_REG'; // ??
        eSBHeaderObj.ConsumerInfo = consumerInfoObj;            
        executionContextObj.ESBHeader = eSBHeaderObj;   
        
        //Setting Values for RequestCriteria
        ibusCzncorpComEsbBusinessobjectsAV.AddressType addressObj = new ibusCzncorpComEsbBusinessobjectsAV.AddressType();
        ibusCzncorpComEsbBusinessobjectsAV.TelephoneNumber telephoneNumberObj = new ibusCzncorpComEsbBusinessobjectsAV.TelephoneNumber(); // not used for "Address" Search
        //getAddressRequestCriteriaObj.Action = 'RetrievePostalAndServiceAddress';        
        searchAddressRequestCriteriaObj.Action='RetrieveServiceAddress';
         
        if( serviceType == ADDRESS_CONST ){
            //Set Address Values
            ibusCzncorpComEsbBusinessobjectsAV.CitizensServiceAddress serviceAddressObj = new ibusCzncorpComEsbBusinessobjectsAV.CitizensServiceAddress();
            ibusCzncorpComEsbBusinessobjectsAV.CitizensPostalAddress postalAddressObj = new ibusCzncorpComEsbBusinessobjectsAV.CitizensPostalAddress(); //out of scope for now
                //Set Service Address
                serviceAddressObj.StreetNrFirst = selectedStrtNumberStr;
                serviceAddressObj.StreetName = selectedStrtNameStr;
                serviceAddressObj.Locality = selectedCityStr;
                serviceAddressObj.StateOrProvince = selectedStateStr;
                serviceAddressObj.Postcode = selectedZipCodeStr;
                serviceAddressObj.StreetSuffix = selectedStrtSubtitleStr;
                serviceAddressObj.StreetSubDescription = selectedStrtSubDescriptionStr;
            addressObj.ServiceAddress = serviceAddressObj;              
            searchAddressRequestCriteriaObj.Address=addressObj;
        }
        if( serviceType == TELEPHONE_NUMBER_CONST ){
            telephoneNumberObj.Number_x = selectedTelNumStr;
            searchAddressRequestCriteriaObj.TelephoneNumber = telephoneNumberObj;
        }
        
        //Invoke WebService Now
        //manageAddressSearchAddressResponseObj = manageAddressWebServiceObj.SearchAddress(executionContextObj, searchAddressRequestCriteriaObj);
        try	{
        	//manageAddressWebServiceObj.timeout_x=60000;
        	manageAddressSearchAddressResponseObj = manageAddressWebServiceObj.SearchAddress(executionContextObj, searchAddressRequestCriteriaObj);
        } catch (System.Calloutexception e) {
                ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.WARNING, 'The connection to USPS and/or DPI is too busy right now. Please try again in a few seconds.'));        	
        }      
        System.Debug('WEBSERVICE INVOKED');
        
        //Retrieve Addresses Array from RESPONSE NOW : It may have Service Address/Postal Address
        //Initialize AddressesListObj

        ibusCzncorpComEsbBusinessobjectsAV.AddressType[] addressesListObjSearch = new List<ibusCzncorpComEsbBusinessobjectsAV.AddressType>();
        
        addressesListObjSearch=    manageAddressSearchAddressResponseObj.Address;
        
        if( addressesListObjSearch != null && addressesListObjSearch.size() > 0 ){
            //Retrieve ServiceAddress/PostalAddress from each Address Object
            ibusCzncorpComEsbBusinessobjectsAV.CitizensServiceAddress serviceAddressRec;
            ibusCzncorpComEsbBusinessobjectsAV.CitizensPostalAddress postalAddressRec;       
                           
            Integer idIndx = 0;

            for(ibusCzncorpComEsbBusinessobjectsAV.AddressType eachAddress: addressesListObjSearch){
                serviceAddressRec = eachAddress.ServiceAddress;
                postalAddressRec = eachAddress.PostalAddress;
                AddressRecord eachRecordObj;
                
                if( serviceAddressRec != null ){
                    eachRecordObj = new AddressRecord();
                    eachRecordObj.idVal = 'ID' + String.valueOf(idIndx);
                    eachRecordObj.ServiceSequenceNumber = String.valueOf(serviceAddressRec.ServiceSequenceNumber) ;
                    eachRecordObj.StreetNrFirst = serviceAddressRec.StreetNrFirst ;
                    eachRecordObj.StreetDirection = serviceAddressRec.StreetDirection ;
                    eachRecordObj.StreetName = serviceAddressRec.StreetName ;
                    eachRecordObj.StreetSuffix = serviceAddressRec.StreetSuffix ;
                    eachRecordObj.StreetSubDescription = serviceAddressRec.StreetSubDescription ;
                    eachRecordObj.Locality = serviceAddressRec.Locality ;                   
                    eachRecordObj.StateOrProvince = serviceAddressRec.StateOrProvince ;
                    eachRecordObj.Postcode = serviceAddressRec.Postcode ;
                    
                    /*Setting other Variables */
                    if( serviceAddressRec.BuildingNumber != null && serviceAddressRec.BuildingNumber != '' ){
                        eachRecordObj.BuildingNumber = serviceAddressRec.BuildingNumber ;
                    }
                    if( serviceAddressRec.BuildingName != null && serviceAddressRec.BuildingName != '' ){
                        eachRecordObj.BuildingName = serviceAddressRec.BuildingName ;
                    }
                    
                    if( serviceAddressRec.BuildingSubNumber != null && serviceAddressRec.BuildingSubNumber != '' ){
                        eachRecordObj.BuildingSubNumber = serviceAddressRec.BuildingSubNumber ;
                    }
                    if( serviceAddressRec.StreetPostDirection != null && serviceAddressRec.StreetPostDirection != '' ){
                        eachRecordObj.StreetPostDirection = serviceAddressRec.StreetPostDirection ;
                    }
                    
                    if( serviceAddressRec.Subdivision != null && serviceAddressRec.Subdivision != '' ){
                        eachRecordObj.Subdivision = serviceAddressRec.Subdivision ;
                    }
                    
                    if( serviceAddressRec.LocalityID != null && serviceAddressRec.LocalityID != '' ){
                        eachRecordObj.LocalityID = serviceAddressRec.LocalityID ;
                    }
                    if( serviceAddressRec.TaxingDistrict != null ){
                        ibusCzncorpComEsbBusinessobjectsAV.CodeDescriptionPair taxingDistrict = serviceAddressRec.TaxingDistrict ;
                        if( taxingDistrict.Code != null ){
                            eachRecordObj.TaxingDistrict = taxingDistrict.Code ;
                        }                   
                    }                    
                    
                    if( serviceAddressRec.WireCenter != null && serviceAddressRec.WireCenter != '' ){
                        eachRecordObj.WireCenter = serviceAddressRec.WireCenter ;
                    }                   
                    if( serviceAddressRec.Exchange != null ){
                        ibusCzncorpComEsbBusinessobjectsAV.Exchange exchange= serviceAddressRec.Exchange;
                        if( exchange.NPA != null ){
                            eachRecordObj.Exchange = exchange.NPA ;
                        }
                        if( exchange.NXX != null ){
                            if( eachRecordObj.Exchange != '' ){
                                eachRecordObj.Exchange = eachRecordObj.Exchange + ',' + exchange.NXX ;
                            }else{
                                eachRecordObj.Exchange = exchange.NXX ;
                            }                           
                        }                       
                    }
                    
                    allAddressRecords.add(eachRecordObj);
                    idIndx = idIndx + 1;
                }
                if( postalAddressRec != null ){                                     
                    //Sequence Number is found in another Object AddressText
                    List<ibusCzncorpComEsbBusinessobjectsAV.AddressText> addressTextList = postalAddressRec.AddressText;
                    
                    if( addressTextList != null && addressTextList.size() > 0 ){                        
                        for(ibusCzncorpComEsbBusinessobjectsAV.AddressText eachAddressSeq: addressTextList){
                            eachRecordObj = new AddressRecord();            
                            eachRecordObj.idVal = 'ID' + String.valueOf(idIndx);
                            eachRecordObj.Locality = postalAddressRec.Locality ;
                            eachRecordObj.StateOrProvince = postalAddressRec.StateOrProvince ;
                            eachRecordObj.Postcode = postalAddressRec.Postcode ;
                            eachRecordObj.ServiceSequenceNumber = String.valueOf(eachAddressSeq.SequenceNumber) ;
                            allAddressRecords.add(eachRecordObj);
                            idIndx = idIndx + 1;
                        }                                               
                    }                                   
                }
            }       
        }
        return allAddressRecords;
    }    
    
}