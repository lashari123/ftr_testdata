@isTest
global class ManageAddressGetSeaMockTest implements WebServiceMock {
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
            
           WS_ESB_ManageAddress.ManageAddressSearchAddressResponse resp = new WS_ESB_ManageAddress.ManageAddressSearchAddressResponse();
           
           //------------------------------------------------------------------------------------------------------------------------------------------------
           WS_ESB_ExecutionContext.ExecutionStatusMessage exStatusMes = new WS_ESB_ExecutionContext.ExecutionStatusMessage();
           exStatusMes.ExecutionStatusSeverity = 'asdf';
           exStatusMes.ExecutionStatusSource = 'asdf';
           exStatusMes.ExecutionStatusSourceOperation = 'asdf';
           exStatusMes.ExecutionStatusCode = 'asdf';
           exStatusMes.ExecutionStatusDescription = 'asdf';
           exStatusMes.ExecutionStatusText  = 'asdf';
           exStatusMes.ExecutionStatusTarget = 'asdf';
           exStatusMes.ExecutionStatusMessage = new WS_ESB_ExecutionContext.ExecutionStatusMessage[]{};
           exStatusMes.ExecutionStatusMessage.add(exStatusMes);
           
           resp.ExecutionContext = new WS_ESB_ExecutionContext.ExecutionContext();
           resp.ExecutionContext.ExecutionStatus = new WS_ESB_ExecutionContext.ExecutionStatus();
           resp.ExecutionContext.ExecutionStatus.ExecutionStatusSuccessFlag = true;
           resp.ExecutionContext.ExecutionStatus.ExecutionStatusAction = 'asdf';
           resp.ExecutionContext.ExecutionStatus.ExecutionStatusMessage = new WS_ESB_ExecutionContext.ExecutionStatusMessage[]{};
           resp.ExecutionContext.ExecutionStatus.ExecutionStatusMessage.add(exStatusMes);
           
           resp.ExecutionContext.ESBHeader = new WS_ESB_ExecutionContext.ESBHeader();
           resp.ExecutionContext.ESBHeader.ConsumerInfo = new WS_ESB_ExecutionContext.ConsumerInfo();
           resp.ExecutionContext.ESBHeader.ConsumerInfo.TrackingID = 'asdf';
           resp.ExecutionContext.ESBHeader.ConsumerInfo.ApplicationID = 'asdf';
           resp.ExecutionContext.ESBHeader.ConsumerInfo.EmployeeID = 'asdf';
           resp.ExecutionContext.ESBHeader.ConsumerInfo.UserID = 'asdf';
           resp.ExecutionContext.ESBHeader.ConsumerInfo.TransactionID = 'asdf';
           
           WS_ESB_ExecutionContext.ProviderInfo prInfo = new WS_ESB_ExecutionContext.ProviderInfo();
           prInfo.ID = 'asdf';
           prInfo.Name = 'asdf';
           prInfo.ProviderType = 'asdf';
           prInfo.VersionID = 'asdf';
           prInfo.VersionDateTime = DateTime.now();
           prInfo.Description = 'asdf';
           prInfo.Location = 'asdf';
           prInfo.TransactionID = 'asdf';
        
           resp.ExecutionContext.ESBHeader.ProviderInfo = new WS_ESB_ExecutionContext.ProviderInfo[]{};
           resp.ExecutionContext.ESBHeader.ProviderInfo.add(prInfo);
           resp.ExecutionContext.ESBHeader.Heartbeat = true;
           resp.ExecutionContext.ESBHeader.TrackingID = 'trackthis';
           
           WS_ESB_ExecutionContext.TraceResult trcRes = new WS_ESB_ExecutionContext.TraceResult();
           trcRes.HostName = 'asdf';
           trcRes.Component = 'asdf';
           trcRes.DateTime_x = DateTime.now();
           trcRes.Message = 'asdf';
           
           resp.ExecutionContext.ESBHeader.TraceResults = new WS_ESB_ExecutionContext.TraceResults();
           resp.ExecutionContext.ESBHeader.TraceResults.TraceResult = new WS_ESB_ExecutionContext.TraceResult[]{};
           resp.ExecutionContext.ESBHeader.TraceResults.TraceResult.add(trcRes);
           
           
           resp.ExecutionContext.ESBHeader.TraceSettings = new WS_ESB_ExecutionContext.TraceSettings();       
           resp.ExecutionContext.ESBHeader.TraceSettings.TraceEnabled = true;
           resp.ExecutionContext.ESBHeader.TraceSettings.Component = 'asdf';
           resp.ExecutionContext.ESBHeader.TraceSettings.TraceLevel = 'asdf';    
           //------------------------------------------------------------------------------------------------------------------------------------------------
           resp.RequestCriteria = new WS_ESB_ManageAddress.SearchAddressRequestCriteria();
           //------------------------------------------------------------------------------------------------------------------------------------------------
           WS_ESB_BusinessObjects.NorthAmericanTelephoneNumber norTelNum = new WS_ESB_BusinessObjects.NorthAmericanTelephoneNumber();
           norTelNum.NPA = 'asdf';
           norTelNum.NXX = 'asdf';
           norTelNum.Station = 'asdf';
           
           WS_ESB_BusinessObjects.TelephoneNumber telNum = new WS_ESB_BusinessObjects.TelephoneNumber();
           telNum.Number_x = '4699554545';
           telNum.Extension = '456';
           
           WS_ESB_BusinessObjects.AddressUnit addUnit = new WS_ESB_BusinessObjects.AddressUnit();
           addUnit.SequenceNumber = 2;
           addUnit.Designator = 'asdf';
           addUnit.Number_x = '4693354465';
           
           WS_ESB_BusinessObjects.Exchange exc = new WS_ESB_BusinessObjects.Exchange();
           exc.NPA = 'asdf';
           exc.NXX  = 'asdf';
           
           WS_ESB_BusinessObjects.LineTreatment lnTrmt = new WS_ESB_BusinessObjects.LineTreatment();
           lnTrmt.LineTreatmentId = 'asdf';
           lnTrmt.LocationNumber = 'asdf';
           lnTrmt.SequenceNumber = 2;
           
           WS_ESB_BusinessObjects.CommonLanguageLocationId comLanLocId = new WS_ESB_BusinessObjects.CommonLanguageLocationId();
           comLanLocId.GeographicalCode = 'asdf';
           comLanLocId.GeopoliticalCode = 'asdf';
           comLanLocId.NetworkSiteCode = 'asdf';
           comLanLocId.NetworkEntityCode = 'asdf';
           
           WS_ESB_BusinessObjects.GlobalPosition glPos = new WS_ESB_BusinessObjects.GlobalPosition();
           glPos.Latitude = 'asdf';
           glPos.Longitude = 'asdf';
           glPos.GeoCode = 'asdf';
           
           
           WS_ESB_BusinessObjects.CodeDescriptionPair codeDesPair = new WS_ESB_BusinessObjects.CodeDescriptionPair();
           codeDesPair.Code = 'asdf';
           codeDesPair.Description = 'asdf';
           
           WS_ESB_BusinessObjects.CharacteristicValue chrValue = new WS_ESB_BusinessObjects.CharacteristicValue();
           
           WS_ESB_BusinessObjects.AdditionalAddressInfo adtnAddInfo = new WS_ESB_BusinessObjects.AdditionalAddressInfo();
           adtnAddInfo.CharacteristicValue = chrValue;
           
           WS_ESB_BusinessObjects.LineCardHistory lnCrdHis = new WS_ESB_BusinessObjects.LineCardHistory();
           lnCrdHis.ConnectDate = Date.Today();
           lnCrdHis.DisconnectDate = Date.Today();
           lnCrdHis.PairStatus = 'asdf';
           lnCrdHis.DisconnectReason = 'asdf';
           lnCrdHis.CustomerName = 'asdf';
           lnCrdHis.TelephoneNumber = telNum;
           
           WS_ESB_BusinessObjects.TerminalKey trmKey = new WS_ESB_BusinessObjects.TerminalKey();
           trmKey.ModelNumber = 'asdf';
           trmKey.SerialNumber = 'asdf';
           trmKey.VendorId = 'asdf';
           
           WS_ESB_BusinessObjects.DataSourceEnvironment daSrcEnv = new WS_ESB_BusinessObjects.DataSourceEnvironment();
           daSrcEnv.BillingSystem = 'asdf';
           daSrcEnv.DataRegion = 'asdf';
           daSrcEnv.DataRegionCode = 1;
           daSrcEnv.DataSource = 'asdf';
           daSrcEnv.DataEnvironment = 'asdf';
           
           WS_ESB_BusinessObjects.Line ln = new WS_ESB_BusinessObjects.Line();
           ln.TransportMedium = 'asdf';
           ln.DropType = 'asdf';
           ln.DroppedFlag = true;   
           
           WS_ESB_BusinessObjects.Port prt = new WS_ESB_BusinessObjects.Port();
           prt.CustomersCarrierNameAbbreviation = 'asdf';
           prt.CommonLanguageLocationId = comLanLocId;
           prt.Data = 'asdf';
           prt.PortId = 1;
           prt.SequenceNumber = 2;
           prt.Type_x = 'asdf';
           prt.OpticalNetworkTerminalKey = trmKey;
           prt.VoiceSourceId = 'asdf';
           prt.VoiceDestinationId = 'asdf';
           prt.DataSourceId = 'asdf';
           prt.DataDestinationId = 'asdf';
           prt.DataVirtualPathVirtualCircuit = 'asdf';
           prt.ProvisioningSpeed = 'asdf';
           prt.PacketDestinationId = 'asdf';
           
           WS_ESB_BusinessObjects.TechnologyType techType = new WS_ESB_BusinessObjects.TechnologyType(); 
           techType.Technology = 'DATA-VDSL';
           techType.TechnologyGroup = 'IPTECH';
           techType.TechnologyItem = 'asdf';
           techType.AvailableSpeed = 'asdf';
           techType.AdditionalSpeedInfo = 'asdf';
           techType.MaxDslamSpeed = 'asdf';
           techType.DefaultModem = 'asdf';
           techType.MarketOffering = 'asdf';
           techType.CustomerType = 'Business';
           techType.PrePaidBroadBandCapableFlag = true;
           techType.TechFeature = 'asdf';
           
           WS_ESB_BusinessObjects.TechnologyType techType1 = new WS_ESB_BusinessObjects.TechnologyType(); 
           techType.Technology = 'DATA-VDSL';
           techType.TechnologyGroup = 'IPTECH';
           techType.TechnologyItem = 'asdf';
           techType.AvailableSpeed = 'asdf';
           techType.AdditionalSpeedInfo = 'asdf';
           techType.MaxDslamSpeed = 'asdf';
           techType.DefaultModem = 'asdf';
           techType.MarketOffering = 'asdf';
           techType.CustomerType = 'Residential';
           techType.PrePaidBroadBandCapableFlag = true;
           techType.TechFeature = 'asdf';
           
           WS_ESB_BusinessObjects.TechnologyListType techLstType = new WS_ESB_BusinessObjects.TechnologyListType();
           techLstType.Technology = new WS_ESB_BusinessObjects.TechnologyType[]{};
           techLstType.Technology.add(techType);
           techLstType.Technology.add(techType1);
           
           WS_ESB_BusinessObjects.ConnectionType conType = new WS_ESB_BusinessObjects.ConnectionType();
           conType.CentralOffice = 'asdf';
           conType.CentralOfficeClliCode = comLanLocId;
           conType.Origination = 'asdf';
           conType.RemoteOfficeClliCode = comLanLocId;
           conType.TerminalId = 'asdf';
           conType.TerminalSpeed = 'asdf';
           conType.Technologies = techLstType;
           
           WS_ESB_BusinessObjects.ConnectionListType conLstType = new WS_ESB_BusinessObjects.ConnectionListType();  
           conLstType.Connection = new WS_ESB_BusinessObjects.ConnectionType[]{};
           conLstType.Connection.add(conType);
           
           WS_ESB_BusinessObjects.DigitalSubscriberLineAccessMultiplexer digSubAccMul = new WS_ESB_BusinessObjects.DigitalSubscriberLineAccessMultiplexer();     
           digSubAccMul.OfficeId = 'asdf';
           digSubAccMul.CommonLanguageLocationId = comLanLocId;
           digSubAccMul.ManagementIp = 'asdf';
           digSubAccMul.CentralOfficeEquipmentLineEquipmentNumber = 'asdf';
           digSubAccMul.DataLinkConnectionID = 'asdf';
           digSubAccMul.EquipmentCardType = 'asdf';
           digSubAccMul.EquipmentDescription = 'asdf';
           digSubAccMul.NetworkVirtualCircuitIdentifier = 'asdf';
           digSubAccMul.NetworkVirtualPathIdentifier = 'asdf';
           digSubAccMul.Port = prt;
           digSubAccMul.ProvisioningSpeed = 'asdf';
           digSubAccMul.ServiceIndicator = 'asdf';
           digSubAccMul.SubscriberVirtualCircuitIdentifier = 'asdf';
           digSubAccMul.SubscriberVirtualPathIdentifier = 'asdf';
           digSubAccMul.NetworkToNetworkCircuit = 'asdf';
           digSubAccMul.InfoSpeedVirtualCircuitIdentifier = 'asdf';
           digSubAccMul.InfoSpeedVirtualPathIdentifier = 'asdf';
           digSubAccMul.Device = 'asdf';
           digSubAccMul.ManagementIpV6 = 'asdf';
           
           WS_ESB_BusinessObjects.InternetInfoType interInfo = new WS_ESB_BusinessObjects.InternetInfoType();
           interInfo.ADSLCapableFlag = true;
           interInfo.ADSLCapableReason = 'asdf';
           interInfo.SDSLCapableFlag = true;
           interInfo.SDSLCapableReason = 'asdf';
           interInfo.HSIAvailableFlag = true;
           interInfo.HSIAvailabilityDescription = 'asdf';
           interInfo.FiberProductCapableFlag = true;
           interInfo.ModemOwnership = 'asdf';
           interInfo.Connections = conLstType;
           interInfo.AccountSpeed = 'asdf';
           interInfo.FictitiousId = 'asdf';
           interInfo.LineCardType = 'asdf';
           interInfo.OrderedSpeed = 'asdf';
           interInfo.PlantType = 'asdf';
           interInfo.HSIPort = 'asdf';
           interInfo.PortStatus = 'asdf';
           interInfo.TerminalInformation = 'asdf';
           interInfo.AvailableMaxProductSpeed = 'asdf';
           interInfo.HighestAvailableSpeed = 'asdf';
           interInfo.InServiceHSIConnectionId = 'asdf';
           interInfo.PrimaryCircuit = 'asdf';
           interInfo.DslamInfo = digSubAccMul;
           interInfo.IsModemTechDeliverable = true;
           
           
           
           
           
           WS_ESB_BusinessObjects.LineCard lnc = new WS_ESB_BusinessObjects.LineCard();
           lnc.AdvisedCustomerOfChargesFlag = true;
           lnc.Cable = new WS_ESB_BusinessObjects.Cable[]{};
           lnc.CardStationRemarks = 'asdf';
           lnc.CarrierCableOfficeCode = 'asdf';
           lnc.CarrierPair = 'asdf';
           lnc.CentralOfficeCardOption = 'asdf';
           lnc.CentralOfficeEquipmentType = 'asdf';
           lnc.ClassOfService = 'asdf';
           lnc.ConnectDate = Date.Today();
           lnc.CustomerName = 'asdf';
           lnc.DigitalSwitchPort = prt;
           lnc.DisconnectDate = Date.Today();
           lnc.DisconnectReason = 'asdf';
           lnc.FacilityRemarks = 'asdf';
           lnc.InstallationRemarks  = 'asdf';
           lnc.LineCardId  = 'asdf';
           lnc.LineEquipmentNumber = 'asdf';
           lnc.OfficeId = 'asdf';
           lnc.OtherCarrierNumber = 'asdf';
           lnc.Port = prt;
           lnc.PremiseRemarks = 'asdf';
           lnc.RingCode = 'asdf';
           lnc.SecondCircuit = 'asdf';
           lnc.SheathPair = 'asdf';
           lnc.SpecialCircuit = 'asdf';
           lnc.Splitter = prt;
           lnc.TelephoneNumber = telNum;
           lnc.TelephoneNumberPortingStatus  = 'asdf';
           lnc.FromTerminalCount = 'asdf';
           lnc.ToTerminalCount = 'asdf';
           lnc.ThirdCircuit = 'asdf';
           lnc.LineTreatment = new WS_ESB_BusinessObjects.LineTreatment[]{};
           lnc.LineTreatment.add(lnTrmt);
           lnc.DigitalSubscriberLineAccessMultiplexer = new WS_ESB_BusinessObjects.DigitalSubscriberLineAccessMultiplexer[]{};
           lnc.DigitalSubscriberLineAccessMultiplexer.add(digSubAccMul);
           lnc.FiberPort = new WS_ESB_BusinessObjects.Port[]{};
           lnc.FiberPort.add(prt);
           lnc.PairCountFrom = 'asdf';
           lnc.PairCountTo = 'asdf';
           
           WS_ESB_BusinessObjects.CitizensServiceAddress citSerAdd = new WS_ESB_BusinessObjects.CitizensServiceAddress();
           citSerAdd.StateOrProvince = 'adsf';
           citSerAdd.Country = 'adsf';
           citSerAdd.County = 'adsf';
           citSerAdd.StreetNrFirst = 'adsf';
           citSerAdd.StreetNrFirstSuffix = 'adsf';
           citSerAdd.StreetName = 'adsf';
           citSerAdd.StreetType = 'adsf';
           citSerAdd.StreetSuffix = 'adsf';
           citSerAdd.StreetNrLast = 'adsf';
           citSerAdd.StreetNrLastSuffix = 'adsf';
           citSerAdd.Locality = 'adsf';
           citSerAdd.Postcode = 'adsf';
           citSerAdd.StreetNrFirstPrefix = 'adsf';
           citSerAdd.StreetNrLastPrefix = 'adsf';
           citSerAdd.StreetNamePrefix = 'adsf';
           citSerAdd.StreetNameSuffix = 'adsf';
           citSerAdd.Subdivision = 'adsf';
           citSerAdd.StreetSubDescription = 'adsf';
           citSerAdd.StreetDirection = 'adsf';
           citSerAdd.StreetPostDirection = 'adsf';
           citSerAdd.BuildingName = 'adsf';
           citSerAdd.BuildingNumber = 'adsf';
           citSerAdd.BuildingSubNumber = 'adsf';
           citSerAdd.Unit = new WS_ESB_BusinessObjects.AddressUnit[]{};
           citSerAdd.Unit.add(addUnit);
           citSerAdd.SubLocation = 'adsf';
           citSerAdd.Community = 'adsf';
           citSerAdd.AddressID = 'adsf';
           citSerAdd.LocalityID = 'adsf';
           citSerAdd.WireCenter = 'adsf';
           citSerAdd.Exchange = exc;
           citSerAdd.CommonLanguageLocationId = comLanLocId;
           citSerAdd.TaxingDistrict = codeDesPair;
           citSerAdd.PhysicalMapPageNumber = 'adsf';
           citSerAdd.PhysicalMapSector = 'adsf';
           citSerAdd.MileageZone = 'adsf';
           citSerAdd.ServiceOverrideFlag = true;
           citSerAdd.GlobalPosition = glPos;
           citSerAdd.HSICapableFlag = true;
           citSerAdd.PricingSegmentIndicator = 'asdf';
           citSerAdd.ReadyForServiceFlag = true;
           citSerAdd.ServiceSequenceNumber = 1;
           citSerAdd.ServiceControlNumber= 2;
           citSerAdd.AdditionalAddressInfo = new WS_ESB_BusinessObjects.AdditionalAddressInfo[]{};
           citSerAdd.AdditionalAddressInfo.add(adtnAddInfo);
           citSerAdd.LineCardHistory =  new WS_ESB_BusinessObjects.LineCardHistory[]{};
           citSerAdd.LineCardHistory.add(lnCrdHis);
           citSerAdd.DataSourceEnvironment = daSrcEnv;
           citSerAdd.HomeOwnerAssociationFlag = true;
           citSerAdd.LocalFranchiseAgreementFlag  = true;
           citSerAdd.FiberProductCapableFlag = true;
           citSerAdd.Line = new WS_ESB_BusinessObjects.Line[]{};
           citSerAdd.Line.add(ln);
           citSerAdd.CentralOfficeCLLI = comLanLocId;
           citSerAdd.InternetInfo = interInfo;
           citSerAdd.ConnectedLineCardsFoundFlag = true;
           citSerAdd.LineCardInfo = lnc;
           citSerAdd.FiberVideoAvailableFlag = true;
           citSerAdd.Ethernet = 'adsf';
           citSerAdd.IncorporatedIndicator = 'adsf';
           //citSerAdd.PoolType = new String[]{'asdf'};
           
           WS_ESB_BusinessObjects.AddressText addTxt = new WS_ESB_BusinessObjects.AddressText();
           addTxt.AddressText = 'adsf';
           addTxt.SequenceNumber = 1;
           
           WS_ESB_BusinessObjects.CitizensPostalAddress ctzPosAdd = new WS_ESB_BusinessObjects.CitizensPostalAddress();
           ctzPosAdd.StateOrProvince = 'adsf';
           ctzPosAdd.Country = 'adsf';
           ctzPosAdd.County = 'adsf';
           ctzPosAdd.AddressText = new WS_ESB_BusinessObjects.AddressText[]{};
           ctzPosAdd.AddressText.add(addTxt);
           ctzPosAdd.Locality = 'adsf';
           ctzPosAdd.Postcode = 'adsf';
           
           
           WS_ESB_BusinessObjects.AddressType addType = new WS_ESB_BusinessObjects.AddressType();
           addType.ServiceAddress = citSerAdd;
           addType.PostalAddress = ctzPosAdd;
           addType.CurrentAddressFlag = true;
           
           resp.Address = new WS_ESB_BusinessObjects.AddressType[]{};
           resp.Address.add(addType);
            
            
           response.put('response_x', resp);    
    }
}