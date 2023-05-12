global class AddressValidationMockWebService2 implements WebServiceMock {
   global void doInvoke(
           Object stub,
           Object request,
           Map<String, Object> response,
           String endpoint,
           String soapAction,
           String requestName,
           String responseNS, 
           String responseName,
           String responseType) {
           
        //Response Object
        ibusCzncorpComEsbManageaddressAv.ManageAddressSearchAddressResponse manageAddressSearchAddressResponseObj = new ibusCzncorpComEsbManageaddressAv.ManageAddressSearchAddressResponse();
        
        //Citizen and Postal Address
        ibusCzncorpComEsbBusinessobjectsAV.CitizensServiceAddress serviceAddressRec = new ibusCzncorpComEsbBusinessobjectsAV.CitizensServiceAddress();
        ibusCzncorpComEsbBusinessobjectsAV.CitizensPostalAddress postalAddressRec = new ibusCzncorpComEsbBusinessobjectsAV.CitizensPostalAddress(); 
        
        //Addresses superClass
        ibusCzncorpComEsbBusinessobjectsAV.AddressType[] addressesListObj = new List<ibusCzncorpComEsbBusinessobjectsAV.AddressType>();
        
        ibusCzncorpComEsbBusinessobjectsAV.AddressType eachAddressTypeObj = new ibusCzncorpComEsbBusinessobjectsAV.AddressType();
        
        //Set Service Address
        serviceAddressRec.ServiceSequenceNumber = 657987 ;
        serviceAddressRec.StreetNrFirst = 'Test' ;
        serviceAddressRec.StreetDirection = 'Feet' ;
        serviceAddressRec.StreetName = 'TEST1234' ;
        serviceAddressRec.StreetSuffix = 'SF' ;
        serviceAddressRec.StreetSubDescription = 'DFG' ;
        serviceAddressRec.Locality = 'NY' ;                   
        serviceAddressRec.StateOrProvince = 'CND' ;
        serviceAddressRec.Postcode = '9874' ;
        serviceAddressRec.BuildingNumber = '4878' ;     
        serviceAddressRec.BuildingName = 'SNY' ;     
        serviceAddressRec.BuildingSubNumber = '484' ;     
        serviceAddressRec.StreetPostDirection = 'FWD' ;     
        serviceAddressRec.Subdivision = 'SKDH' ;     
        serviceAddressRec.LocalityID = '87987' ;     
        ibusCzncorpComEsbBusinessobjectsAV.CodeDescriptionPair taxingDistrict = new ibusCzncorpComEsbBusinessobjectsAV.CodeDescriptionPair();
        taxingDistrict.Code = 'AKLJD';
        serviceAddressRec.TaxingDistrict = taxingDistrict;
        serviceAddressRec.WireCenter = 'OUU';
        ibusCzncorpComEsbBusinessobjectsAV.Exchange exchange = new ibusCzncorpComEsbBusinessobjectsAV.Exchange();
        exchange.NPA = '45';
        exchange.NXX = '78';
        serviceAddressRec.Exchange = exchange;
        serviceAddressRec.HSICapableFlag = false;
        serviceAddressRec.FiberProductCapableFlag = true;
        //Set Internet Info Object
        ibusCzncorpComEsbBusinessobjectsAV.InternetInfoType internetInfo = new ibusCzncorpComEsbBusinessobjectsAV.InternetInfoType();
        internetInfo.AvailableMaxProductSpeed = '465 M/S';
        internetInfo.AccountSpeed = '789 M/S';
        internetInfo.HighestAvailableSpeed = '124 M/S';
        internetInfo.PlantType = 'TESTSD';
            //set connections
            ibusCzncorpComEsbBusinessobjectsAV.ConnectionListType connections = new ibusCzncorpComEsbBusinessobjectsAV.ConnectionListType();
            ibusCzncorpComEsbBusinessobjectsAV.TechnologyListType technologies = new ibusCzncorpComEsbBusinessobjectsAV.TechnologyListType();
            List<ibusCzncorpComEsbBusinessobjectsAV.ConnectionType> connectionsArr = new List<ibusCzncorpComEsbBusinessobjectsAV.ConnectionType>();
            ibusCzncorpComEsbBusinessobjectsAV.ConnectionType eachConnectionType = new ibusCzncorpComEsbBusinessobjectsAV.ConnectionType();
            eachConnectionType.CentralOffice = 'CSDS';
            List<ibusCzncorpComEsbBusinessobjectsAV.TechnologyType> technologyArr = new List<ibusCzncorpComEsbBusinessobjectsAV.TechnologyType>();
            ibusCzncorpComEsbBusinessobjectsAV.TechnologyType technology1 = new ibusCzncorpComEsbBusinessobjectsAV.TechnologyType();
            technology1.Technology = 'SFDC';
            technology1.TechnologyGroup = 'Platform';
            technology1.AvailableSpeed = '45 D/S';
            technology1.MaxDslamSpeed = '101 D/s';
            technology1.DefaultModem = 'ERER';
            technologyArr.add(technology1);
            ibusCzncorpComEsbBusinessobjectsAV.TechnologyType technology2 = new ibusCzncorpComEsbBusinessobjectsAV.TechnologyType();
            technology2.Technology = 'SFDC';
            technology2.TechnologyGroup = 'Platform';
            technology2.AvailableSpeed = '45 D/S';
            technology2.MaxDslamSpeed = '101 D/s';
            technology2.DefaultModem = 'ERER';
            technologyArr.add(technology2);
            technologies.Technology = technologyArr;
            eachConnectionType.Technologies = technologies;
            
            connectionsArr.add(eachConnectionType);
            connections.Connection = connectionsArr;
        internetInfo.Connections = connections;
        serviceAddressRec.InternetInfo = internetInfo;
        //Set LineArr
        List<ibusCzncorpComEsbBusinessobjectsAV.Line> lineArr = new List<ibusCzncorpComEsbBusinessobjectsAV.Line>();
         ibusCzncorpComEsbBusinessobjectsAV.Line eachLine = new ibusCzncorpComEsbBusinessobjectsAV.Line();
         eachLine.TransportMedium = 'RES';
         eachLine.DropType = 'RES';
         eachLine.DroppedFlag = true;       
         lineArr.add(eachLine);      
        serviceAddressRec.Line = lineArr;
        
        //Set LineCard Status from AdditionalAddressInfo Object
        List<ibusCzncorpComEsbBusinessobjectsAV.AdditionalAddressInfo> additionalAddressInfoArr = new List<ibusCzncorpComEsbBusinessobjectsAV.AdditionalAddressInfo>();
        ibusCzncorpComEsbBusinessobjectsAV.AdditionalAddressInfo eachAdditionalInfoObj =  new ibusCzncorpComEsbBusinessobjectsAV.AdditionalAddressInfo();
        ibusCzncorpComEsbBusinessobjectsAV.CharacteristicValue characteristicValue = new ibusCzncorpComEsbBusinessobjectsAV.CharacteristicValue();
        characteristicValue.Characteristic = 'LineCardStatus';
        characteristicValue.Value = '235';
        eachAdditionalInfoObj.CharacteristicValue = characteristicValue;
        additionalAddressInfoArr.add(eachAdditionalInfoObj);
        serviceAddressRec.AdditionalAddressInfo = additionalAddressInfoArr;
        
        
        ibusCzncorpComEsbBusinessobjectsAV.DataSourceEnvironment dataSourceEnvironment = new ibusCzncorpComEsbBusinessobjectsAV.DataSourceEnvironment();        
            dataSourceEnvironment.DataRegion = 'TER';       
        serviceAddressRec.DataSourceEnvironment = dataSourceEnvironment;
        
        serviceAddressRec.PricingSegmentIndicator = 'HIGH';
        serviceAddressRec.HomeOwnerAssociationFlag = false;
        serviceAddressRec.LocalFranchiseAgreementFlag = true;
        
        
        //Set AddressUnits
        List<ibusCzncorpComEsbBusinessobjectsAV.AddressUnit> unit = new List<ibusCzncorpComEsbBusinessobjectsAV.AddressUnit>();
        ibusCzncorpComEsbBusinessobjectsAV.AddressUnit eachAddressUnit = new ibusCzncorpComEsbBusinessobjectsAV.AddressUnit();
        eachAddressUnit.SequenceNumber = 8979;
        eachAddressUnit.Designator = 'SDSD';
        eachAddressUnit.Number_x = '79874';
        unit.add(eachAddressUnit);
        serviceAddressRec.Unit = unit;
        serviceAddressRec.ConnectedLineCardsFoundFlag = false;
        serviceAddressRec.FiberVideoAvailableFlag = true;
        
        //Set PairCount From&To via LineCard Object
        ibusCzncorpComEsbBusinessobjectsAV.LineCard lineCardInfo = new ibusCzncorpComEsbBusinessobjectsAV.LineCard();
        lineCardInfo.PairCountFrom = '45';
        lineCardInfo.PairCountTo = '785';
        serviceAddressRec.LineCardInfo = lineCardInfo;
        
        
        //Set Postal Address
        List<ibusCzncorpComEsbBusinessobjectsAV.AddressText> addressTextList = new List<ibusCzncorpComEsbBusinessobjectsAV.AddressText>();
        ibusCzncorpComEsbBusinessobjectsAV.AddressText eachAddressText1 = new ibusCzncorpComEsbBusinessobjectsAV.AddressText();
        eachAddressText1.SequenceNumber = 1;
        addressTextList.add(eachAddressText1);
        ibusCzncorpComEsbBusinessobjectsAV.AddressText eachAddressText2 = new ibusCzncorpComEsbBusinessobjectsAV.AddressText();
        eachAddressText2.SequenceNumber = 1;
        addressTextList.add(eachAddressText2);
        postalAddressRec.AddressText = addressTextList;
        postalAddressRec.Locality = 'SDSD';
        postalAddressRec.StateOrProvince = 'OA';
        postalAddressRec.Postcode = '987987';
        

        
        eachAddressTypeObj.ServiceAddress = serviceAddressRec;
        eachAddressTypeObj.PostalAddress = postalAddressRec;
        addressesListObj.add(eachAddressTypeObj);
        manageAddressSearchAddressResponseObj.Address = addressesListObj;
        
        response.put('response_x', manageAddressSearchAddressResponseObj); 
   }
}