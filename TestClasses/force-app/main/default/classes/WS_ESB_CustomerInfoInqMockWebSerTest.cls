@isTest
global class WS_ESB_CustomerInfoInqMockWebSerTest implements WebServiceMock {
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
           WS_ESB_CustomerInfoInquiry.retrieveCustomerServiceConfigurationResponse_element rcscResEle = new WS_ESB_CustomerInfoInquiry.retrieveCustomerServiceConfigurationResponse_element();
         
         //----------------------create one instance of clas that are used multiple times
         
        WS_BPM_BusinessObjects.CharacteristicSpecification chsp = new WS_BPM_BusinessObjects.CharacteristicSpecification();
   		chsp.name = '1nice';
   		chsp.valueType ='1pretty' ;
   		chsp.description = '1greatattributes';
   		chsp.Value = new WS_BPM_BusinessObjects.CharacteristicValue();
   		chsp.Value.value = '1perfect10';
   		
   		WS_BPM_BusinessObjects.CharacteristicSpecification[] lstChsp = new WS_BPM_BusinessObjects.CharacteristicSpecification[]{};
   		lstChsp.add(chsp);
   		
   		WS_BPM_BusinessObjects.ExecutionStatusMessage esm1 = new WS_BPM_BusinessObjects.ExecutionStatusMessage();
   		esm1.ExecutionStatusSeverity = '1alert';
   		esm1.ExecutionStatusSource = '1player';
   		esm1.ExecutionStatusSourceOperation = '1delta';
   		esm1.ExecutionStatusCode = '1code red';
   		esm1.ExecutionStatusText = '1Done';
   		WS_BPM_BusinessObjects.ExecutionStatusMessage[] lstEsm = new WS_BPM_BusinessObjects.ExecutionStatusMessage[]{};
        lstEsm.add(esm1);
   		
   		WS_BPM_BusinessObjects.ExecutionStatusMessage esm = new WS_BPM_BusinessObjects.ExecutionStatusMessage();
   		esm.ExecutionStatusSeverity = 'alert5';
   		esm.ExecutionStatusSource = 'player';
   		esm.ExecutionStatusSourceOperation = 'delta';
   		esm.ExecutionStatusCode = 'code red';
   		esm.ExecutionStatusText = 'Done';
        esm.ExecutionStatusMessage = lstEsm;   			
        
        WS_BPM_BusinessObjects.HeaderExtension hdExt = new WS_BPM_BusinessObjects.HeaderExtension();
        hdExt.ExecutionStatusMessage = esm;
        
        WS_BPM_BusinessObjects.Header hdr = new WS_BPM_BusinessObjects.Header();
        hdr.CorrelationId_T = 'conf';
        hdr.ActivityName_T = 'secret';
        hdr.MsgType_T = 'confidential';
        hdr.Priority_T = 'favorite';
        hdr.Source = 'friend';
        hdr.ActivityStatusEnum_T = 'movieorcoffee';
        hdr.MessageId = 'email';
        hdr.MessageProp_T = lstChsp;		
        hdr.Security_T = lstChsp;
        hdr.Timestamp = DateTime.now() ;
        hdr.FailureReplytoURI_T = 'baduri' ;
        hdr.ConsumerInfo = lstChsp;           			
        hdr.ProviderInfo = lstChsp; 
        hdr.HeaderExtension = hdExt;
        
        WS_BPM_BusinessObjects.IBMTelecomRootObject rtOt = new WS_BPM_BusinessObjects.IBMTelecomRootObject();
   		rtOt.ID = 'asdf';
	    rtOt.name = 'ssss';
	    rtOt.type_x = 'loyal';
	    rtOt.description = 'greatsenseofhumour' ;
	   
		WS_BPM_BusinessObjects.Member mb =  new WS_BPM_BusinessObjects.Member();
		mb.phoneNumber = 'asdfdfasf';
		mb.groupSequenceNumber = 3;
		
	    
	    WS_BPM_BusinessObjects.HuntGroup hg = new WS_BPM_BusinessObjects.HuntGroup();
	    hg.GroupID = rtOt;
	    hg.Member = new WS_BPM_BusinessObjects.Member[]{};
	    hg.Member.add(mb);
	    hg.pilotPhoneNumber = 'asdff';
	    hg.count = 3;
	    
	    WS_BPM_BusinessObjects.GlobalPosition glPos = new WS_BPM_BusinessObjects.GlobalPosition();
   		glPos.longitude = 'as';
   		glPos.latitude = 'as';
   		glPos.geoCode = 'as';
	       
	    WS_BPM_BusinessObjects.NetworkLocation nkln = new WS_BPM_BusinessObjects.NetworkLocation();
   		nkln.DistanceFromWireCenter = new WS_BPM_BusinessObjects.Quantity();
   		nkln.DistanceFromWireCenter.amount = 4;
   		nkln.DistanceFromWireCenter.units = 'jh' ;
   		nkln.GlobalPosition = glPos;
   		
   		WS_BPM_BusinessObjects.Technology tech = new WS_BPM_BusinessObjects.Technology();
   		tech.additionalSpeedInfo = 'sdf';
   		tech.availableSpeed = 'sdf';
   		tech.businessOrResidential = 'sdf';
   		tech.defaultModem = 'sdf';
   		tech.marketOffering = 'sdf';
   		tech.maxDslamSpeed = 'sdf';
   		tech.technologyGroup = 'sdf';
   		tech.technologyItem = 'sdf';
   		tech.technologyName = 'sdf';
   		tech.prepaidBroadBandCapable = true;   
   		
   		WS_BPM_BusinessObjects.Connection cn = new WS_BPM_BusinessObjects.Connection();
   		cn.centralOffice = 'asdf';
   		cn.centralOfficeClliCode = 'asdf';
   		cn.origination = 'asdf';
   		cn.remoteOfficeClliCode = 'asdf';
   		cn.terminalId = 'asdf';
   		cn.terminalSpeed = 'asdf';
   		cn.Technology = new WS_BPM_BusinessObjects.Technology[]{};
	   	cn.Technology.add(tech);
         
        WS_BPM_BusinessObjects.GaugeSegment gs = new WS_BPM_BusinessObjects.GaugeSegment();
   		gs.Distance = new WS_BPM_BusinessObjects.QuantityDecimal();
   		gs.Distance.amount = 23.4;
   		gs.Distance.units = 'sdd';
   		gs.code = 'dss'; 
   		
   		WS_BPM_BusinessObjects.Cable cbl = new WS_BPM_BusinessObjects.Cable();
   		cbl.id = 'asdf';
   		cbl.pair = 'sdf';
   		
   		WS_BPM_BusinessObjects.AddressText adtxt = new WS_BPM_BusinessObjects.AddressText();
   		adtxt.sequenceNumber = 2;
   		adtxt.addressText = 'no';
   		
   		WS_BPM_BusinessObjects.GeographicAddressExtension geoAddExt = new WS_BPM_BusinessObjects.GeographicAddressExtension();
   		geoAddExt.isInFootprint = true;
   		geoAddExt.addressDescription = 'asf';
   		geoAddExt.addressType = 'ads';
   		geoAddExt.AddressText = new WS_BPM_BusinessObjects.AddressText[]{};
   		geoAddExt.AddressText.add(adtxt);
   		geoAddExt.addressRemark = new String[]{'asdf'};
   		
   		WS_BPM_BusinessObjects.Quantity  qn = new WS_BPM_BusinessObjects.Quantity();	
   		qn.amount = 4;
   		qn.units = 'many';
   		
   		WS_BPM_BusinessObjects.PhysicalResourceExtension phResExt =new WS_BPM_BusinessObjects.PhysicalResourceExtension();
   		phResExt.type_x = 'prEx';	
   		phResExt.commonLanguageLocationIdentifier = 'prEx';	
   		phResExt.officeId = 'prEx';	
   		phResExt.manufacturer = 'prEx';	
   		phResExt.model = 'prEx';	
   		phResExt.plantType = 'prEx';	
   		phResExt.Quantity = qn;
   		
   		WS_BPM_BusinessObjects.UrbanPropertyAddressExtension  AddExt =  new WS_BPM_BusinessObjects.UrbanPropertyAddressExtension();
		AddExt.subDivision = 'aa';
		AddExt.streetPrefix = 'asd';
		AddExt.localityId = 'asd';
		
		WS_BPM_BusinessObjects.UrbanPropertySubAddress urSubAdd = new WS_BPM_BusinessObjects.UrbanPropertySubAddress();
		urSubAdd.subUnitType = 'llll';
		urSubAdd.subUnitNr= 'llll';
		urSubAdd.levelType= 'llll';
		urSubAdd.levelNr= 'llll';
		urSubAdd.buildingName= 'llll';
		urSubAdd.UrbanPropertySubAddress = new WS_BPM_BusinessObjects.UrbanPropertySubAddressExtension();
		
		WS_BPM_BusinessObjects.UrbanPropertyAddress uprAdd = new WS_BPM_BusinessObjects.UrbanPropertyAddress();
   		uprAdd.streetNrFirst = 'asf';
   		uprAdd.streetNrFirstSuffix = 'ok';
   		uprAdd.streetNrLast = 'ok';
   		uprAdd.streetNrLastSuffix = 'ok';
   		uprAdd.streetName = 'ok';
   		uprAdd.streetType = 'ok';
   		uprAdd.streetSuffix = 'ok';
   		uprAdd.locality = 'ok';
   		uprAdd.postcode = 'ok';
   		uprAdd.UrbanPropertySubAddress = urSubAdd;
   		uprAdd.UrbanPropertyAddressExtension = addExt;
   		
   		WS_BPM_BusinessObjects.GeographicAddress  geoAdd = new WS_BPM_BusinessObjects.GeographicAddress();
   		geoAdd.UrbanPropertyAddress = uprAdd;
   		geoAdd.stateOrProvince = 'TX';
   		geoAdd.country = 'NP';
   		geoAdd.CharacteristicSpecification = lstChsp;
   		geoAdd.GeographicAddressExtension = geoAddExt;
		
   		
   		WS_BPM_BusinessObjects.PhysicalPort phPrt = new WS_BPM_BusinessObjects.PhysicalPort();
   		phPrt.customerInterfaceNumber = 'pp';
   		phPrt.status = 'pp';
   		phPrt.hasCarrierDetect = true;
   		phPrt.hasDataLink = true;
   		phPrt.isInterfaceEnabled = true;
   		phPrt.vendorInterfaceNumber = 'pp';
   		phPrt.protocol = 'pp';
   		phPrt.ifType = 'pp';
   		phPrt.portNumber = 'pp';
   		phPrt.typeOfPort = 'pp';
   		phPrt.duplexMode = 2;
   		phPrt.cardMaxBandwidth = 'pp';
   		phPrt.chassisType = 'pp';
   		phPrt.rackHeight = 'pp';
   		phPrt.typeOfRack = 'pp';
   		phPrt.vendorPortName = 'pp';
   		phPrt.circuitID = 'pp';
   		phPrt.PhysicalPortExtension = new WS_BPM_BusinessObjects.PhysicalPortExtension();
	   		
   		WS_BPM_BusinessObjects.Network netwk = new WS_BPM_BusinessObjects.Network();
   		netwk.networkAdministrativeState = 'nt';
   		netwk.isNetworkOperational = true;
   		netwk.layerRates = 'nt';
   		netwk.PhysicalPort = phPrt;
	   		
	   		
		WS_BPM_BusinessObjects.PhysicalResource pRes = new WS_BPM_BusinessObjects.PhysicalResource();
   		pRes.ID = 'qq';
   		pRes.name = 'qq';
   		pRes.manufactureDate = DateTime.now();
   		pRes.otherIdentifier = 'qq';
   		pRes.serialNumber = 'qq';
   		pRes.versionNumber = 'qq';
   		pRes.Network = netwk;
   		pRes.PhysicalResourceCharacteristicValues = lstChsp;
   		pRes.PhysicalResourceExtension = phResExt;	   		
   		
		WS_BPM_BusinessObjects.NorthAmericanPhoneNumber nrAmrPhNum = new WS_BPM_BusinessObjects.NorthAmericanPhoneNumber();
		nrAmrPhNum.npa = 'aa';
		nrAmrPhNum.nxx = 'aa';
		nrAmrPhNum.station = 'aa';
		
		WS_BPM_BusinessObjects.PhoneNumber phNum = new WS_BPM_BusinessObjects.PhoneNumber();
		phNum.telephoneNumber = '7157543333';
		phNum.reassignmentNumber = 2;
		phNum.NorthAmericanPhoneNumber = nrAmrPhNum;
		
		WS_BPM_BusinessObjects.BridgeTap bTp = new WS_BPM_BusinessObjects.BridgeTap();
		bTp.GaugeSegment = new WS_BPM_BusinessObjects.GaugeSegment[]{};
		bTp.GaugeSegment.add(gs);
		bTp.NetworkLocation = nkln;
		
		WS_BPM_BusinessObjects.DistributionPoint dp = new WS_BPM_BusinessObjects.DistributionPoint();
		dp.id = 'asdff';
		dp.route = 'dsas';
		
		WS_BPM_BusinessObjects.LoadCoil lc = new WS_BPM_BusinessObjects.LoadCoil();
		lc.type_x = 'aaa';
		lc.NetworkLocation = nkln;
		
		WS_BPM_BusinessObjects.LocalLoopSegmentLocation llsloc = new WS_BPM_BusinessObjects.LocalLoopSegmentLocation();
		llsloc.type_x = 'sdf';
		llsloc.NetworkLocation = nkln;
		
		WS_BPM_BusinessObjects.LocalLoopSegment lls = new WS_BPM_BusinessObjects.LocalLoopSegment();
		lls.id = 'aaa';
		lls.Cable = new WS_BPM_BusinessObjects.Cable[]{};
		lls.Cable.add(cbl);
		lls.Location = llsloc;
		lls.LoadCoil = new WS_BPM_BusinessObjects.LoadCoil[]{};
		lls.LoadCoil.add(lc);
		lls.GaugeSegment = new WS_BPM_BusinessObjects.GaugeSegment[]{};
		lls.GaugeSegment.add(gs);
		
		WS_BPM_BusinessObjects.LocalLoop  llp = new WS_BPM_BusinessObjects.LocalLoop();
		llp.wireCenter = 'adf';
		llp.VoiceInsertionLoss = qn;
		llp.BridgeTap = new WS_BPM_BusinessObjects.BridgeTap[]{};
		llp.BridgeTap.add(bTp);
		llp.DistributionPoint = dp;
		llp.LocalLoopSegment = new WS_BPM_BusinessObjects.LocalLoopSegment[]{};	
		llp.LocalLoopSegment.add(lls);
		
		WS_BPM_BusinessObjects.LogicalResourceExtension lgReExt = new WS_BPM_BusinessObjects.LogicalResourceExtension();	
		lgReExt.PhoneNumber =  phNum;
		lgReExt.accountSpeed = '120' ;
		lgReExt.availableMaxProductSpeed ='321';
		lgReExt.orderedSpeed = '54';
		lgReExt.adslCapableReason ='dsf' ;
		lgReExt.adslCapableFlag = true;
		lgReExt.sdslCapableFlag = true;
		lgReExt.sdslCapableReason = 'no';
		lgReExt.LocalLoop = llp;
		lgReExt.availableSpeed = '200';
		
		WS_BPM_BusinessObjects.LogicalResource lres1 = new WS_BPM_BusinessObjects.LogicalResource();
		lres1.status = 'ad';
		lres1.serviceState = 'ad';
		lres1.isOperational = true;
		lres1.networkVCI = 'ad';
		lres1.networkVPI = 'ad';
		lres1.subscriberVPI = 'ad';
		lres1.subscriberVCI = 'ad';
		lres1.managementIP = 'ad';
		lres1.managementIPV6 = 'ad';
		lres1.terminationPoint = 'ad';
		lres1.LogicalResourceCharacteristicValues = lstChsp;
		lres1.PhysicalResources = new WS_BPM_BusinessObjects.PhysicalResource[]{};
		lres1.PhysicalResources.add(pRes);
		lres1.LogicalResourceExtension = lgReExt;
		lres1.ID = rtOt;
		
		WS_BPM_BusinessObjects.LogicalResource lres = new WS_BPM_BusinessObjects.LogicalResource();
		lres.status = 'ad';
		lres.serviceState = 'ad';
		lres.isOperational = true;
		lres.networkVCI = 'ad';
		lres.networkVPI = 'ad';
		lres.subscriberVPI = 'ad';
		lres.subscriberVCI = 'ad';
		lres.managementIP = 'ad';
		lres.managementIPV6 = 'ad';
		lres.terminationPoint = 'ad';
		lres.LogicalResourceCharacteristicValues = lstChsp;
		lres.PhysicalResources = new WS_BPM_BusinessObjects.PhysicalResource[]{};
		lres.PhysicalResources.add(pRes);
		lres.LogicalResourceExtension = lgReExt;
		lres.ID = rtOt;
		lres.LogicalResources = new WS_BPM_BusinessObjects.LogicalResource[]{};
		lres.LogicalResources.add(lres1);
		
		WS_BPM_BusinessObjects.EmailAccount emAcc = new WS_BPM_BusinessObjects.EmailAccount();
		emAcc.ID = rtOt;
		emAcc.localPart = 'dasf';
		emAcc.domain = 'asdfds';
		emAcc.status = 'ddfsdfdf';
		emAcc.Characteristics = lstChsp;
		
		WS_BPM_BusinessObjects.ResourceFacingServiceExtension resSerExt = new WS_BPM_BusinessObjects.ResourceFacingServiceExtension();
		resSerExt.Connection = new WS_BPM_BusinessObjects.Connection[]{};
		resSerExt.Connection.add(cn);
		resSerExt.techDeliveryAvailable = true;
		resSerExt.tnPoolType = 'asdf';
		resSerExt.HuntGroup = new WS_BPM_BusinessObjects.HuntGroup[]{};
		resSerExt.HuntGroup.add(hg);
		resSerExt.serviceNPANXX = 'asdfdfs';
		resSerExt.wireCenterClliCode = ' asdf';
		resSerExt.wireCenter = 'asdf';
		resSerExt.EmailAccount = emAcc;
		
		WS_BPM_BusinessObjects.ResourceFacingService rfs = new WS_BPM_BusinessObjects.ResourceFacingService();
		rfs.logicalResource = new WS_BPM_BusinessObjects.LogicalResource[]{};
		rfs.logicalResource.add(lres);
		rfs.physicalResource = new WS_BPM_BusinessObjects.PhysicalResource[]{} ;
		rfs.physicalResource.add(pRes);	
		rfs.ResourceFacingServiceId = rtOt;           			
		rfs.CharacteristicSpecification = new WS_BPM_BusinessObjects.CharacteristicSpecification[]{};
		rfs.CharacteristicSpecification = lstChsp;
		rfs.ResourceFacingServiceExtension = resSerExt;
		
		WS_BPM_BusinessObjects.Service ser1 = new WS_BPM_BusinessObjects.Service();
		ser1.ServiceIdentification = rtOt;
		ser1.ServiceDescribedBy = lstChsp;
		ser1.hasStarted = true;
		ser1.ServiceLocation = new WS_BPM_BusinessObjects.Place();
		ser1.ServiceLocation.ID = 'asdfdfs';
		ser1.ServiceLocation.GeographicAddress = geoAdd;
		ser1.ResourceFacingServices = new WS_BPM_BusinessObjects.ResourceFacingService[]{};
		ser1.ResourceFacingServices.add(rfs);	
		ser1.ServiceExtension = new WS_BPM_BusinessObjects.ServiceExtension();
		ser1.ServiceExtension.serviceItemCode = 'asdfdfs';
		//---------------------end-----------------------------------------------------
		
		rcscResEle.retrieveCustomerServiceConfigurationOutput = new WS_BPM_BusinessObjects.msg_Service();
		rcscResEle.retrieveCustomerServiceConfigurationOutput.Header = hdr;
       	// end of header and start of payload
       	
        rcscResEle.retrieveCustomerServiceConfigurationOutput.Payload = new WS_BPM_BusinessObjects.Service[]{};
		rcscResEle.retrieveCustomerServiceConfigurationOutput.Payload.add(ser1);
           	
   		response.put('response_x', rcscResEle);
       }
    
  }