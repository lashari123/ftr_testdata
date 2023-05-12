@isTest
global class WS_ESB_ManageAccountMockWebSerTest implements WebServiceMock {
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
            
           WS_ESB_ManageAccount.ManageAccountGetAccountResponse manAccResp = new WS_ESB_ManageAccount.ManageAccountGetAccountResponse();    
           
           
           //---------------------------------------------------------------------------------------------------------------------------
           WS_ESB_ExecutionContext.ExecutionStatusMessage exStMes = new WS_ESB_ExecutionContext.ExecutionStatusMessage();
           exStMes.ExecutionStatusSeverity = 'asdf';
           exStMes.ExecutionStatusSource = 'asdf';
           exStMes.ExecutionStatusSourceOperation = 'asdf';
           exStMes.ExecutionStatusCode = 'asdf';
           exStMes.ExecutionStatusDescription = 'asdf';
           exStMes.ExecutionStatusText = 'asdf';
           exStMes.ExecutionStatusTarget = 'asdf';
           //exStMes.ExecutionStatusMessage = new WS_ESB_ExecutionContext.ExecutionStatusMessage[]{};
           //exStMes.ExecutionStatusMessage.add(exStMes);
           
           
           WS_ESB_ExecutionContext.ExecutionStatus exSts = new WS_ESB_ExecutionContext.ExecutionStatus();
           exSts.ExecutionStatusSuccessFlag = true;
           exSts.ExecutionStatusAction = 'adsf';
           //exSts.ExecutionStatusMessage = new WS_ESB_ExecutionContext.ExecutionStatusMessage[]{};
           //exSts.ExecutionStatusMessage.add(exStMes);
           
           
           WS_ESB_ExecutionContext.ConsumerInfo  conInfo= new  WS_ESB_ExecutionContext.ConsumerInfo();
           conInfo.TrackingID = 'asdfa';
           conInfo.ApplicationID = 'asdfa';
           conInfo.EmployeeID = 'asdfa';
           conInfo.UserID = 'asdfa';
           conInfo.TransactionID = 'asdfa';
           
           WS_ESB_ExecutionContext.ProviderInfo prInfo= new WS_ESB_ExecutionContext.ProviderInfo();
           prInfo.ID = 'asdf';
           prInfo.Name = 'asdf';
           prInfo.ProviderType = 'asdf';
           prInfo.VersionID = 'asdf';
           prInfo.VersionDateTime = DateTime.now();
           prInfo.Description = 'asdf';
           prInfo.Location = 'asdf';
           prInfo.TransactionID = 'asdf';
           
           WS_ESB_ExecutionContext.TraceResult trRst = new WS_ESB_ExecutionContext.TraceResult();
           trRst.HostName = 'asdf';
           trRst.Component = 'asdf';
           trRst.DateTime_x = DateTime.now();
           trRst.Message = 'asdf';
           
           WS_ESB_ExecutionContext.TraceResults trRlts = new WS_ESB_ExecutionContext.TraceResults();
           trRlts.TraceResult.add(new  WS_ESB_ExecutionContext.TraceResult());
           trRlts.TraceResult.add(trRst); 
           
           WS_ESB_ExecutionContext.TraceSettings trSet = new WS_ESB_ExecutionContext.TraceSettings();
           trSet.TraceEnabled = true;
           trSet.Component = 'asdf';
           trSet.TraceLevel = 'asdf';
                      
           WS_ESB_ExecutionContext.ESBHeader esbHdr = new WS_ESB_ExecutionContext.ESBHeader();
           esbHdr.ConsumerInfo = conInfo;
           esbHdr.ProviderInfo = new WS_ESB_ExecutionContext.ProviderInfo[]{};
           esbHdr.ProviderInfo.add(prInfo);
           esbHdr.Heartbeat = true;
           esbHdr.TrackingID = 'asdf';
           esbHdr.TraceResults = trRlts; 
           esbHdr.TraceSettings = trSet;
           
           WS_ESB_ExecutionContext.ExecutionContext exCntxt = new WS_ESB_ExecutionContext.ExecutionContext();
           exCntxt.ExecutionStatus = exSts; 
           exCntxt.ESBHeader = esbHdr; 
           //---------------------------------------------------------------------------------------------------------------------------
           WS_ESB_BusinessObjects.Quantity qt = new WS_ESB_BusinessObjects.Quantity();
           qt.Amount = '50';
           qt.Units = '45';
           
           WS_ESB_BusinessObjects.TimePeriod tmPrd = new WS_ESB_BusinessObjects.TimePeriod();
           tmPrd.StartDateTime = DateTime.now();
           tmPrd.EndDateTime = DateTime.now();
           tmPrd.StartDateTimeString = 'asdf';
           tmPrd.EndDateTimeString = 'asdf';
           
           
           WS_ESB_BusinessObjects.DataSourceEnvironment dsEnv = new WS_ESB_BusinessObjects.DataSourceEnvironment();
           dsEnv.BillingSystem = 'asdf';
           dsEnv.DataRegion = 'asdf';
           dsEnv.DataRegionCode = 1;
           dsEnv.DataSource = 'asdf';
           dsEnv.DataEnvironment = 'asdf';
           
           WS_ESB_BusinessObjects.NorthAmericanTelephoneNumber norTelNum= new WS_ESB_BusinessObjects.NorthAmericanTelephoneNumber();
           norTelNum.NPA = 'sdf';
           norTelNum.NXX = 'sdf';
           norTelNum.Station = 'dfs';
           
           WS_ESB_BusinessObjects.TelephoneNumber telNum = new WS_ESB_BusinessObjects.TelephoneNumber() ;
           telNum.Number_x = '7157543333';
           telNum.Extension = '234' ;
           
           WS_ESB_BusinessObjects.PhoneNumberAsId phNumId = new WS_ESB_BusinessObjects.PhoneNumberAsId();
           phNumId.TelephoneNumber = telNum; 
           phNumId.SequenceNumber = 0;
           
           WS_ESB_BusinessObjects.RequestAccountId reqAccId = new WS_ESB_BusinessObjects.RequestAccountId();
           reqAccId.PhoneNumberAsId = phNumId;
           reqAccId.UniversalServiceId = 'sadf';
           reqAccId.AccountNumber = 'asdf';
           reqAccId.DataSourceEnvironment = dsEnv;
           
           WS_ESB_ManageAccount.GetAccountRequestCriteria reqCtr = new WS_ESB_ManageAccount.GetAccountRequestCriteria();
           reqCtr.AccountId = reqAccId; 
           //---------------------------------------------------------------------------------------------------------------------------
           WS_ESB_BusinessObjects.AccountId accId = new WS_ESB_BusinessObjects.AccountId();
           accId.PhoneNumberAsId = phNumId;
           accId.UniversalServiceId = 'sadf';
           accId.AccountNumber = 'asdf';
           accId.DataSourceEnvironment = dsEnv;
           //---------------------------------------------------------------------------------------------------------------------------
           
           WS_ESB_BusinessObjects.ServiceType srvTp = new WS_ESB_BusinessObjects.ServiceType();
           srvTp.Name = 'asdf';
           srvTp.Description = 'asdf';
           srvTp.LongDescription = 'asdf';
        
           WS_ESB_BusinessObjects.UpsellDisqualificationReason usDqRs= new WS_ESB_BusinessObjects.UpsellDisqualificationReason();
           usDqRs.Id = 'asdf';
           usDqRs.Description = 'asdf';
           
           WS_ESB_BusinessObjects.AvailableSpeed avlSpd = new WS_ESB_BusinessObjects.AvailableSpeed();
           avlSpd.Value = 'adsf';
           avlSpd.VerifiedFlag = true;
           
           WS_ESB_BusinessObjects.CommonLanguageLocationId cmLanLocId = new WS_ESB_BusinessObjects.CommonLanguageLocationId();
           cmLanLocId.GeographicalCode = 'adsf';
           cmLanLocId.GeopoliticalCode = 'adsf';
           cmLanLocId.NetworkSiteCode = 'adsf';
           cmLanLocId.NetworkEntityCode = 'adsf';
           
           
           
           WS_ESB_BusinessObjects.ConnectionType cnTyp = new WS_ESB_BusinessObjects.ConnectionType();
            WS_ESB_BusinessObjects.TechnologyType TTyp = new WS_ESB_BusinessObjects.TechnologyType();
           cnTyp.CentralOffice = 'asdf';
           cnTyp.CentralOfficeClliCode = cmLanLocId;
           cnTyp.Origination = 'asdf';
           cnTyp.RemoteOfficeClliCode = cmLanLocId;
           cnTyp.TerminalId = 'asdf';
           cnTyp.TerminalSpeed = 'asdf';
           
           TTyp.Technology =  'BONDED';
           TTyp.TechnologyGroup =  '3-BONDED';
           TTyp.TechnologyItem =  'ADSL+';
           TTyp.AvailableSpeed =  '20.0M/1.0M';
           TTyp.AdditionalSpeedInfo =  'HSI Capable';
           TTyp.MaxDslamSpeed =  '40.0M/10.0M';
           TTyp.DefaultModem =  'fhrst';
           TTyp.MarketOffering =  'fghszdfh';   
           TTyp.CustomerType =  'Business';
           TTyp.PrePaidBroadBandCapableFlag = false;
           
           WS_ESB_BusinessObjects.ConnectionListType cnLstTyp= new WS_ESB_BusinessObjects.ConnectionListType();
           cnLstTyp.Connection  = new WS_ESB_BusinessObjects.ConnectionType[]{};
           cnLstTyp.Connection.add(cnTyp);
           
           WS_ESB_BusinessObjects.TechnologyListType techLstType = new WS_ESB_BusinessObjects.TechnologyListType();
           techLstType.Technology = new WS_ESB_BusinessObjects.TechnologyType[]{};
           techLstType.Technology.add(TTyp);
           cnTyp.Technologies = techLstType;
           
           WS_ESB_BusinessObjects.TerminalKey trmKey = new WS_ESB_BusinessObjects.TerminalKey();
           trmKey.ModelNumber = 'asdf';
           trmKey.SerialNumber = 'asdf';
           trmKey.VendorId = 'asdf';
           
           WS_ESB_BusinessObjects.Port prt = new WS_ESB_BusinessObjects.Port();
           prt.CustomersCarrierNameAbbreviation = 'asdf';
           prt.CommonLanguageLocationId = cmLanLocId;
           prt.Data = 'asdf';
           prt.PortId = 2;
           prt.SequenceNumber = 3;
           prt.Type_x = 'asdf';
           prt.OpticalNetworkTerminalKey = trmKey;
           prt.VoiceSourceId = 'asdf';
           prt.VoiceDestinationId = 'asdf';
           prt.DataSourceId = 'asdf';
           prt.DataDestinationId = 'asdf';
           prt.DataVirtualPathVirtualCircuit = 'asdf';
           prt.ProvisioningSpeed = 'asdf';
           prt.PacketDestinationId = 'asdf';
           
           WS_ESB_BusinessObjects.DigitalSubscriberLineAccessMultiplexer digSubLnMul = new  WS_ESB_BusinessObjects.DigitalSubscriberLineAccessMultiplexer();
           digSubLnMul.OfficeId = 'asdf';
           digSubLnMul.CommonLanguageLocationId = cmLanLocId;
           digSubLnMul.ManagementIp = 'asdf';
           digSubLnMul.CentralOfficeEquipmentLineEquipmentNumber = 'asdf';
           digSubLnMul.DataLinkConnectionID = 'asdf';
           digSubLnMul.EquipmentCardType = 'asdf';
           digSubLnMul.EquipmentDescription = 'asdf';
           digSubLnMul.NetworkVirtualCircuitIdentifier = 'asdf';
           digSubLnMul.NetworkVirtualPathIdentifier = 'asdf';
           digSubLnMul.Port = prt;
           digSubLnMul.ProvisioningSpeed = 'asdf';
           digSubLnMul.ServiceIndicator = 'asdf';
           digSubLnMul.SubscriberVirtualCircuitIdentifier = 'asdf';
           digSubLnMul.SubscriberVirtualPathIdentifier = 'asdf';
           digSubLnMul.NetworkToNetworkCircuit = 'asdf';
           digSubLnMul.InfoSpeedVirtualCircuitIdentifier = 'asdf';
           digSubLnMul.InfoSpeedVirtualPathIdentifier = 'asdf';
           digSubLnMul.Device = 'asdf';
           digSubLnMul.ManagementIpV6 = 'asdf';
           
           WS_ESB_BusinessObjects.InternetInfoType interType = new WS_ESB_BusinessObjects.InternetInfoType();
           interType.ADSLCapableFlag = true;
           interType.ADSLCapableReason = 'asdf';
           interType.SDSLCapableFlag = true;
           interType.SDSLCapableReason = 'asdf';
           interType.HSIAvailableFlag = true;
           interType.HSIAvailabilityDescription = 'asdf';
           interType.FiberProductCapableFlag = true;
           interType.ModemOwnership = 'asdf';
           interType.Connections = cnLstTyp;
           interType.AccountSpeed = 'asdf';
           interType.FictitiousId = 'asdf';
           interType.LineCardType = 'asdf';
           interType.OrderedSpeed = 'asdf';
           interType.PlantType = 'asdf';
           interType.HSIPort = 'asdf';
           interType.PortStatus = 'asdf';
           interType.TerminalInformation = 'asdf';
           interType.AvailableMaxProductSpeed = 'asdf';
           interType.HighestAvailableSpeed = 'asdf';
           interType.InServiceHSIConnectionId = 'asdf';
           interType.PrimaryCircuit = 'asdf';
           interType.DslamInfo =digSubLnMul;
           interType.IsModemTechDeliverable = true;
        
           WS_ESB_BusinessObjects.CustomerBill cusBill = new WS_ESB_BusinessObjects.CustomerBill();
           cusBill.BillDate = Date.Today();
           cusBill.BillingDayOfMonth = 1;
           cusBill.BillNo = 'asdf';
           cusBill.BillAmount = 50.51;
           cusBill.LastBillThrough = Date.Today();
           cusBill.AdjustmentAmount = 50.51;
           cusBill.LastBillAmount = 50.51;
           cusBill.LastNoticeDate = Date.Today();
           cusBill.LastPaymentReceivedDate = Date.Today();
           cusBill.CurrencyType = 'dsf';
           cusBill.Amount31To60 = 50.51;
           cusBill.Amount61To90 = 50.51;
           cusBill.AmountOver90 = 50.51;
           cusBill.Amount0To30 = 50.51;
           cusBill.PaymentDueDate = Date.Today();
           cusBill.QuantityOfBills = 23;
           cusBill.BillingMethod = 'dsf';
           cusBill.HandlingCode = 'dsf';
           cusBill.BillingDetailLevel = 'dsf';
           cusBill.DirectoryListingAllowance = 1;
           cusBill.DiscountId = 'dsf';
           cusBill.INPRemoteNumber = 'dsf';
           cusBill.BillingSummaryAccountId = accId;
           cusBill.OnDeferredPaymentArrangementFlag = true;
           cusBill.ExistingPaymentExtension = 1;
           cusBill.LastDisconnectForNonPaymentDate = Date.Today();
           cusBill.AtRiskToChurnScore = 1;
           cusBill.PropensityToPayScore = 1;
           cusBill.PastDueAmount = 50.51;
           cusBill.Over60DaysPastDueAmount = 50.51;
           cusBill.LastStatementIssueDate = Date.Today();
           cusBill.LastStatementAmount = 50.51;
           cusBill.LastStatementDueDate = Date.Today();
           cusBill.LastAdjustmentAmount = 50.51;
           cusBill.LastPaymentDate = Date.Today();
           cusBill.LastPaymentAmount = 50.51;
           cusBill.CurrentBalance = 50.51;
           cusBill.AutoPayDisabledFlag = true;
           cusBill.BillPrintEnabledFlag = true;
           cusBill.LastPromotionDemotionDate = Date.Today();
           cusBill.SecondNoticesPriorToLastPromotionDemotion = 1;
           cusBill.ReturnedChecksPriorToLastPromotionDemotion = 1;
           cusBill.DisconnectsPriorToLastPromotionDemotion = 4;
           cusBill.TollAmountSinceLastBill = 50.51;
           cusBill.LastBillPeriod = 1;
           cusBill.LastBillCycle = 1;
           cusBill.BilledThroughDate = Date.Today();
           cusBill.LastBillMethod = 'dsf';
           cusBill.PriorCreditRating = 'dsf';
           cusBill.ServiceOrderActivitySinceLastBillFlag = true;
           cusBill.BilledSeperatelyLastPeriodFlag = true;
           cusBill.ConsolidationFlag = true;
           cusBill.ConsolidationDate = Date.Today();
           
           WS_ESB_BusinessObjects.Price prc = new WS_ESB_BusinessObjects.Price();
           prc.Name = 'asdf';
           prc.Description = 'asdf';
           prc.Quantity = qt;
           prc.CurrencyType = 'asdf';
           prc.PriceType = 'asdf';
           prc.ValidFor = tmPrd;
        
           WS_ESB_BusinessObjects.ProductCatalogInformation proCatInfo = new WS_ESB_BusinessObjects.ProductCatalogInformation();
           proCatInfo.Name = 'asdf';
           proCatInfo.GroupingName = 'asdf';
           proCatInfo.LongDescription = 'asdf';
           proCatInfo.Sku = 'asdf';
           proCatInfo.GenericSku = 'asdf';
           proCatInfo.UseGenericSkuFlag = true;
           proCatInfo.Priority = 23;
           proCatInfo.Price = prc;
           
           WS_ESB_BusinessObjects.VerificationEmailDates vfnEmlDat  = new WS_ESB_BusinessObjects.VerificationEmailDates();
           vfnEmlDat.VerificationEmailDateTime = DateTime.now();
           vfnEmlDat.SequenceNumber = 2;
           
           WS_ESB_BusinessObjects.IndividualName indName = new WS_ESB_BusinessObjects.IndividualName();
           indName.ValidFor = tmPrd;
           indName.FormattedName = 'asdf';
           indName.LegalName = 'asdf';
           indName.AristocraticTitle = 'asdf';
           indName.FormOfAddress = 'asdf';
           indName.Generation = 'asdf';
           indName.GivenNames = 'asdf';
           indName.PreferredGivenName = 'asdf';
           indName.MiddleNames = 'asdf';
           indName.FamilyNamePrefix = 'asdf';
           indName.FamilyNames = 'asdf';
           indName.FamilyGeneration = 'asdf';
           indName.Qualifications = 'asdf';
        
           WS_ESB_BusinessObjects.Email eml = new WS_ESB_BusinessObjects.Email();
           eml.EmailAddress = 'asdf@df';
           eml.EmailDisplayName = indName;
           
           WS_ESB_BusinessObjects.Verification vrfn = new WS_ESB_BusinessObjects.Verification();
           vrfn.VerificationDateTime = DateTime.now();
           vrfn.VerificationResponseStatus = true;
           vrfn.VerificationConfirmationNumber = 'asdf';
           vrfn.VerificationPin = 2;
           vrfn.VerificationEmailDates = new WS_ESB_BusinessObjects.VerificationEmailDates[]{};
           vrfn.VerificationEmailDates.add(vfnEmlDat);
           vrfn.VerificationEmailAddress = eml;
           vrfn.VerificationUserId = 'asdf';
           
           WS_ESB_BusinessObjects.DiscountedItem dsItm = new WS_ESB_BusinessObjects.DiscountedItem();
           dsItm.ItemCode = 'itmCd';
           dsItm.Description = 'asdf';
           
           WS_ESB_BusinessObjects.OrderReference odrRef= new WS_ESB_BusinessObjects.OrderReference();
           odrRef.OrderId = 'asdf';
           odrRef.OrderedItemCode = 'asdf';
           odrRef.OrderedItemId = 'asdf';
           odrRef.OrderStartDate = DateTime.now();
           odrRef.OrderCompleteDate = DateTime.now();
           odrRef.OrderPostDate = DateTime.now();
           odrRef.OrderActionType = 'asdf';
        
           WS_ESB_BusinessObjects.Promotion promo = new WS_ESB_BusinessObjects.Promotion();
           promo.PromotionKey = 'asdf';
           promo.PromotionId = 'asdf';
           promo.PromotionName = 'asdf';
           promo.Description = 'asdf';
           promo.SequenceNumber = 1;
           promo.GlobalPromotionFlag = true;
           promo.DisabledFlag = true;
           promo.PromotionStatus = 'asdf';
           promo.ContractStatus = 'asdf';
           promo.ContractStartDate = Date.Today();
           promo.ContractEndDate = Date.Today();
           promo.CreditStartDate = Date.Today();
           promo.CreditEndDate = Date.Today();
           promo.CreditDisqualificationDate = Date.Today();
           promo.CreditAmount = 25.99;
           promo.PercentageDiscountAmount = 25.99;
           promo.CreditFrequency = 1;
           promo.GracePeriodDaysOfDuration = 1;
           promo.AutoRenewStatus = 'asdf';
           promo.OverrideCode = 'sdf';
           promo.OverridingUser = 'asdf';
           promo.OverrideDate = Date.Today();
           promo.PenaltyAmount = 25.99;
           promo.ConfiguredPenaltyAmount = 25.99;
           promo.PenaltyAmountProratedFlag = true;
           promo.DisqualifyingReason = 'asdf';
           promo.PromotionTelephoneNumber = telNum;
           promo.ProductCatalogInformation = proCatInfo;
           promo.PromotionVerification = vrfn;
           promo.DiscountedItem = dsItm;
           promo.OrderReference = odrRef;
           promo.CommitmentMonths = 1;
           
           WS_ESB_BusinessObjects.DriversLicenseIdentification drLisIdn = new WS_ESB_BusinessObjects.DriversLicenseIdentification();
           drLisIdn.IssueDate = Date.Today();
           drLisIdn.Picture = 'adsf';
           drLisIdn.ValidFor = tmPrd;
           drLisIdn.StateOrProvince = 'asdf';
           drLisIdn.ID = 'asdffd';
        
           WS_ESB_BusinessObjects.SocialSecurityNrIdentification ssnIdn = new WS_ESB_BusinessObjects.SocialSecurityNrIdentification();
           ssnIdn.IssueDate = Date.Today();
           ssnIdn.Picture = 'asdf';
           ssnIdn.ValidFor = tmPrd;
           ssnIdn.SocialSecurityNr = 'asdf';
           
           WS_ESB_BusinessObjects.Individual ind = new WS_ESB_BusinessObjects.Individual();
           ind.PartyType = 'asdf';
           ind.ValidFor = tmPrd;
           ind.IndividualName = indName;
           ind.Gender = 'asdf';
           ind.PlaceOfBirth = 'asdf';
           ind.Nationality = 'asdf';
           ind.MaritalStatus = 'asdf';
           ind.Skills = 'asdf';
           ind.Disabilities = 'asdf';
           ind.DriversLicenseIdentification = drLisIdn;
           ind.SocialSecurityNrIdentification = ssnIdn;
           ind.AliveDuring = tmPrd;
           ind.Age = 34;
           
           WS_ESB_BusinessObjects.OrganizationName orgName = new WS_ESB_BusinessObjects.OrganizationName();
           orgName.IssueDate = Date.Today();
           orgName.Picture = 'asdf';
           orgName.ValidFor = tmPrd;
           orgName.TradingName = 'asdf';
           orgName.NameType = 'asdf';
           orgName.Description = 'asdf';
           
           WS_ESB_BusinessObjects.Organization org = new WS_ESB_BusinessObjects.Organization();
           org.PartyType = 'asdf';
           org.ValidFor = tmPrd;
           org.OrganizationName = orgName;
           org.IsLegalEntityFlag = true;
           org.ExistsDuring = tmPrd;
           org.Region = 'asdf';
           
           WS_ESB_BusinessObjects.AddressText addTxt = new WS_ESB_BusinessObjects.AddressText();
           addTxt.AddressText ='asdf';
           addTxt.SequenceNumber = 2; 
           
           WS_ESB_BusinessObjects.CitizensPostalAddress ctzPosAdd = new WS_ESB_BusinessObjects.CitizensPostalAddress();
           ctzPosAdd.StateOrProvince = 'asdf';
           ctzPosAdd.Country = 'asdf';
           ctzPosAdd.County = 'asdf';
           ctzPosAdd.AddressText = new  WS_ESB_BusinessObjects.AddressText[]{};
           ctzPosAdd.AddressText.add(addTxt);
           ctzPosAdd.Locality = 'asdf';
           ctzPosAdd.Postcode = 'sdf';
           
           WS_ESB_BusinessObjects.AuthorizedCustomerProxy  authProxy= new WS_ESB_BusinessObjects.AuthorizedCustomerProxy();
           authProxy.Individual = ind;
           authProxy.Organization = org;
           authProxy.TelephoneNumber = new WS_ESB_BusinessObjects.TelephoneNumber[]{};
           authProxy.TelephoneNumber.add(telNum);
           authProxy.CitizensPostalAddress = new WS_ESB_BusinessObjects.CitizensPostalAddress[]{};
           authProxy.CitizensPostalAddress.add(ctzPosAdd);
           authProxy.ValidFor = tmPrd;
           authProxy.NameOfContact = 'asdf';
           
           WS_ESB_BusinessObjects.Employee emp = new WS_ESB_BusinessObjects.Employee();
           emp.EmploymentStatus  = 'asdf';
           emp.EmployeeID = 'asdf';
           emp.SSOLoginId = 'asdf';
           emp.Email = eml;
                   
           WS_ESB_BusinessObjects.CodeDescriptionPair cdDesPair = new WS_ESB_BusinessObjects.CodeDescriptionPair();
           cdDesPair.Code ='sdf';
           cdDesPair.Description ='asdf';
           
           WS_ESB_BusinessObjects.RedFlagMessageType rdMsgTp = new WS_ESB_BusinessObjects.RedFlagMessageType();
           rdMsgTp.OrderID = 'asdf';
           rdMsgTp.ReasonCode = cdDesPair;
           rdMsgTp.DispositionCode = cdDesPair;
           rdMsgTp.CreatedBy = emp;
           rdMsgTp.ClosedBy = emp;
           rdMsgTp.ValidFor = tmPrd;
           rdMsgTp.MessageCode = cdDesPair;
           
           WS_ESB_BusinessObjects.DriversLicenseIdentification drLcnIdn = new WS_ESB_BusinessObjects.DriversLicenseIdentification();
           drLcnIdn.IssueDate = Date.Today();
           drLcnIdn.Picture = 'asdf';
           drLcnIdn.ValidFor = tmPrd;
           drLcnIdn.StateOrProvince = 'asdf';
           drLcnIdn.ID = 'asdf';
           
           WS_ESB_BusinessObjects.ThirdPartyNotification thdPrtNfn = new WS_ESB_BusinessObjects.ThirdPartyNotification();
           thdPrtNfn.Name = 'asdf';
           thdPrtNfn.ZipcodeExtension = 'asdf';
           thdPrtNfn.TelephoneNumber = telNum;
           
           WS_ESB_BusinessObjects.IndividualContact indCon = new WS_ESB_BusinessObjects.IndividualContact();
           indCon.SequenceNumber = 2;
           indCon.Name = 'asdf';
           indCon.TelephoneNumber = telNum;
           indCon.CitizensPostalAddress = ctzPosAdd;
           
           WS_ESB_BusinessObjects.NearestRelative nrRel = new WS_ESB_BusinessObjects.NearestRelative();
           nrRel.Name = 'adsf';
           nrRel.TelephoneNumber = telNum;
           nrRel.Address = 'adsf';
           nrRel.RelationshipToSubscriber = 'adsf';
           
           WS_ESB_BusinessObjects.Employer emlr = new WS_ESB_BusinessObjects.Employer();
           emlr.Name = 'adsf';
           emlr.TelephoneNumber = telNum;
           emlr.CitizensPostalAddress = ctzPosAdd;
           emlr.Manager = indCon;

           WS_ESB_BusinessObjects.Spouse sps = new  WS_ESB_BusinessObjects.Spouse(); 
           sps.IndividualName = indName;
           sps.Employer = emlr;
           sps.SocialSecurityNrIdentification = ssnIdn;
           
           WS_ESB_BusinessObjects.LandLord lnLrd = new WS_ESB_BusinessObjects.LandLord();
           lnLrd.Name = 'adsf';
           lnLrd.TelephoneNumber  = telNum;
           lnLrd.CitizensPostalAddress = ctzPosAdd;
           
           WS_ESB_BusinessObjects.AccountInDisputeInfo accDisInf = new WS_ESB_BusinessObjects.AccountInDisputeInfo();
           accDisInf.InDisputeFlag = true;
           accDisInf.LastUpdatedDate = Date.Today();
           accDisInf.LastUpdatedBy = 'asdf';
           
           WS_ESB_BusinessObjects.CustomerBankAccount cbAcc = new WS_ESB_BusinessObjects.CustomerBankAccount();
           cbAcc.BankName = 'asdf';
           cbAcc.BankNumber = 'asdf';
           cbAcc.BankAccountNumber = 'asdf';
           cbAcc.BankAccountType = 'asdf';
           cbAcc.BankContact = indCon;
           
           WS_ESB_BusinessObjects.BusinessEntityPartner busIntPar = new WS_ESB_BusinessObjects.BusinessEntityPartner();
           busIntPar.SequenceNumber = 1;
           busIntPar.Name = 'asdf';
           busIntPar.TelephoneNumber = telNum;
           busIntPar.CitizensPostalAddress = ctzPosAdd;
           busIntPar.FirstName = 'asdf';
           busIntPar.LastName = 'asdf';
           busIntPar.SocialSecurityNumber = 5;
           busIntPar.DateOfBirth = DateTime.now();
           
           WS_ESB_BusinessObjects.SpecialRemarks spRmrk = new WS_ESB_BusinessObjects.SpecialRemarks();
           spRmrk.SequenceNumber = 1;
           spRmrk.Text = 'asdf';
           
           WS_ESB_BusinessObjects.AdditionalBusinessCreditInformation adnBusInf = new WS_ESB_BusinessObjects.AdditionalBusinessCreditInformation();
           adnBusInf.BankInformation = new  WS_ESB_BusinessObjects.CustomerBankAccount[]{};
           adnBusInf.BankInformation.add(cbAcc);
           adnBusInf.BusinessEntityPartner = new WS_ESB_BusinessObjects.BusinessEntityPartner[]{};
           adnBusInf.BusinessEntityPartner.add(busIntPar);
           adnBusInf.CreditCheckScoreNumber = 3;
           adnBusInf.DunsNumber = 89;
           adnBusInf.FederalTaxId= 89;
           adnBusInf.NumberOfEmployees = 'asdf';
           adnBusInf.PersonalGuaranteeFormRequired = true;
           adnBusInf.RefusedSSN = true;
           adnBusInf.SpecialRemarks = new WS_ESB_BusinessObjects.SpecialRemarks[]{};
           adnBusInf.SpecialRemarks.add(spRmrk);
           adnBusInf.TechnicalContact = indCon;
           adnBusInf.YearsInBusiness = 'asdf';
         
           WS_ESB_BusinessObjects.CustomerCreditProfile cusCrPrf = new WS_ESB_BusinessObjects.CustomerCreditProfile();
           cusCrPrf.AuthorizationId = 'asdf';
           cusCrPrf.InternalCreditRating = 'asdf';
           cusCrPrf.CreditScore = 'asdf';
           cusCrPrf.RedFlagMessage = new WS_ESB_BusinessObjects.RedFlagMessageType[]{};
           cusCrPrf.RedFlagMessage.add(rdMsgTp);
           cusCrPrf.LastCreditVerificationDate = Date.Today();
           cusCrPrf.BankruptcyFlag = true;
           cusCrPrf.SocialSecurityNumber = 'asdf';
           cusCrPrf.DriversLicenseIdentification = drLcnIdn;
           cusCrPrf.NumberOfDisconnects = 4;
           cusCrPrf.LastUpdatedDate = Date.Today();
           cusCrPrf.UpdatedBy = 'asdf';
           cusCrPrf.InternalCreditRatingExplanation = 'asdf';
           cusCrPrf.ReminderNotice = 'asdf';
           cusCrPrf.InsufficientFunds = 'asdf';
           cusCrPrf.AdvancePayment = 'asdf';
           cusCrPrf.CBRNumber = 'asdf';
           cusCrPrf.ThirdPartyNotificationCode = 'asdf';
           cusCrPrf.ThirdPartyNotification = thdPrtNfn;
           cusCrPrf.Guarantor = indCon;
           cusCrPrf.NearestRelative = nrRel;
           cusCrPrf.MiscellaneousInformation1 = 'asdf';
           cusCrPrf.MiscellaneousInformation2 = 'asdf';
           cusCrPrf.Password = 'asdf';
           cusCrPrf.Remarks = 'asdf';
           cusCrPrf.Spouse = sps;
           cusCrPrf.Employer = emlr;
           cusCrPrf.HireDate = Date.Today();
           cusCrPrf.HousingStatus = 'asdf';
           cusCrPrf.LandLord = lnLrd;
           cusCrPrf.AdultRoomMates = new String[]{'asdf'};
           cusCrPrf.ContactTelephoneNumber = telNum;
           cusCrPrf.PreviousTelephoneNumber = telNum;
           cusCrPrf.ValidFor = tmPrd;
           cusCrPrf.PositiveIDRequiredFlag = true;
           cusCrPrf.NonPayDisconnectLast12MonthsFlag = true;
           cusCrPrf.SubscriberUnpaidFinalBillAmount = 45.99;
           cusCrPrf.SpouseUnpaidFinalBillAmount = 45.99;
           cusCrPrf.PhysicalAddressUnpaidFinalBillAmount = 45.99;
           cusCrPrf.RecommendedDepositAmount = 45.99;
           cusCrPrf.CreditInfoCollectionAllowedFlag = true;
           cusCrPrf.AccountInDisputeInfo = accDisInf;
           cusCrPrf.BusinessType = 'asdf';
           cusCrPrf.BusinessOwner = new  WS_ESB_BusinessObjects.IndividualContact[]{};
           cusCrPrf.BusinessOwner.add(indCon);
           cusCrPrf.Manager = indCon;
           cusCrPrf.BillingContact = indCon;
           cusCrPrf.AccountRepresentative = indCon;
           cusCrPrf.MiscellaneousInformation3 = 'asdf';
           cusCrPrf.LastInsufficientFundDate = Date.Today();
           cusCrPrf.DepositAmount = 45.99;
           cusCrPrf.EarlyTerminationFeeFlag = true;
           cusCrPrf.AdditionalBusinessCreditInformation = adnBusInf;
           
           
           WS_ESB_BusinessObjects.AddressUnit AdrUnt = new WS_ESB_BusinessObjects.AddressUnit();
           AdrUnt.SequenceNumber = 1;
           AdrUnt.Designator = 'asdf';
           AdrUnt.Number_x ='asdf';
           
           WS_ESB_BusinessObjects.Exchange exg = new WS_ESB_BusinessObjects.Exchange();
           exg.NPA = 'asdf'; 
           exg.NXX = 'asdf';
           
           WS_ESB_BusinessObjects.GlobalPosition glPos = new WS_ESB_BusinessObjects.GlobalPosition();
           glPos.Latitude ='asdf';
           glPos.Longitude ='asdf';
           glPos.GeoCode ='sdf';
           
           WS_ESB_BusinessObjects.CharacteristicValue chrVl = new WS_ESB_BusinessObjects.CharacteristicValue();
           chrVl.Characteristic = 'asdff';
           chrVl.Value = 'asdf';
           chrVl.TimePeriod = tmPrd;
           chrVl.CharacteristicValue = new WS_ESB_BusinessObjects.CharacteristicValue[]{};
           chrVl.CharacteristicValue.add(chrVl);
        
           
           WS_ESB_BusinessObjects.AdditionalAddressInfo adnAddInf = new WS_ESB_BusinessObjects.AdditionalAddressInfo();
           adnAddInf.CharacteristicValue = chrVl;
           
           WS_ESB_BusinessObjects.LineCardHistory lnCrdHst = new WS_ESB_BusinessObjects.LineCardHistory();
           lnCrdHst.ConnectDate = Date.Today();
           lnCrdHst.DisconnectDate = Date.Today();
           lnCrdHst.PairStatus ='sdff';
           lnCrdHst.DisconnectReason ='sdff';
           lnCrdHst.CustomerName ='sdff';
           lnCrdHst.TelephoneNumber = telNum;
           
           WS_ESB_BusinessObjects.LineTreatment lnTrmt= new WS_ESB_BusinessObjects.LineTreatment();
           lnTrmt.LineTreatmentId = 'asdf';
           lnTrmt.LocationNumber = 'asdf';
           lnTrmt.SequenceNumber = 4;
           
           WS_ESB_BusinessObjects.Terminal tml = new WS_ESB_BusinessObjects.Terminal();
           tml.TerminalId ='asdf';
           tml.Key = trmKey;
           tml.OfficeId ='asdf';
           tml.Location ='asdf';
           
           WS_ESB_BusinessObjects.Frog frg = new WS_ESB_BusinessObjects.Frog();
           frg.FrogRemark ='asdf';
           frg.FrogType ='asdf';
           frg.FroggedOnCable ='asdf';
           frg.FroggedOnCableOfficeCode ='sdf';
           frg.FroggedOnPair ='asdf';
           frg.FromTerminal = tml;
           frg.SequenceNumber = 1;
           frg.ToTerminal = tml;
           
           WS_ESB_BusinessObjects.Cable cbl = new WS_ESB_BusinessObjects.Cable();
           cbl.CableId = 'asdf';
           cbl.OfficeCode = 'sdf';
           cbl.Frog = new WS_ESB_BusinessObjects.Frog[]{};
           cbl.Frog.add(frg);
           cbl.FrogCountPerCablePair = 'asdf';
           cbl.FromBindingPost = 'asdf';
           cbl.Pair = 'asdf';
           cbl.RouteLeadForCableTerminal = 'asdf';
           cbl.SequenceNumber = 1;
           cbl.FromTerminal = tml;
           cbl.ToBindingPost = 'asdf';
           cbl.Exchange = 'asdf';
        
           WS_ESB_BusinessObjects.LineCard  lnCrd = new WS_ESB_BusinessObjects.LineCard();
           lnCrd.AdvisedCustomerOfChargesFlag = true;
           lnCrd.Cable = new WS_ESB_BusinessObjects.Cable[]{};
           lnCrd.Cable.add(cbl);
           lnCrd.CardStationRemarks = 'asdf';
           lnCrd.CarrierCableOfficeCode  = 'asdf';
           lnCrd.CarrierPair = 'asdf';
           lnCrd.CentralOfficeCardOption = 'asdf';
           lnCrd.CentralOfficeEquipmentType = 'asdf';
           lnCrd.ClassOfService = 'asdf';
           lnCrd.ConnectDate = Date.Today();
           lnCrd.CustomerName = 'asdf';
           lnCrd.DigitalSwitchPort = prt;
           lnCrd.DisconnectDate = Date.Today();
           lnCrd.DisconnectReason = 'asdf';
           lnCrd.FacilityRemarks = 'asdf';
           lnCrd.InstallationRemarks = 'asdf';
           lnCrd.LineCardId = 'asdf';
           lnCrd.LineEquipmentNumber = 'asdf';
           lnCrd.OfficeId = 'asdf';
           lnCrd.OtherCarrierNumber = 'asdf';
           lnCrd.Port = prt;
           lnCrd.PremiseRemarks = 'asdf';
           lnCrd.RingCode = 'adf';
           lnCrd.SecondCircuit = 'asdf';
           lnCrd.SheathPair = 'asdf';
           lnCrd.SpecialCircuit = 'asdf';
           lnCrd.Splitter = prt;
           lnCrd.TelephoneNumber = telNum;
           lnCrd.TelephoneNumberPortingStatus = 'asdf';
           lnCrd.FromTerminalCount = 'asdf';
           lnCrd.ToTerminalCount = 'asdf';
           lnCrd.ThirdCircuit = 'asdf';
           lnCrd.LineTreatment =new WS_ESB_BusinessObjects.LineTreatment[]{};
           lnCrd.LineTreatment.add(lnTrmt);
           lnCrd.DigitalSubscriberLineAccessMultiplexer = new  WS_ESB_BusinessObjects.DigitalSubscriberLineAccessMultiplexer[]{};
           lnCrd.DigitalSubscriberLineAccessMultiplexer.add(digSubLnMul);
           lnCrd.FiberPort = new WS_ESB_BusinessObjects.Port[]{};
           lnCrd.FiberPort.add(prt);
           lnCrd.PairCountFrom = 'asdf';
           lnCrd.PairCountTo = 'asdf';
           
           WS_ESB_BusinessObjects.Line ln = new WS_ESB_BusinessObjects.Line();
           ln.TransportMedium = 'asdf';
           ln.DropType = 'asdf';
           ln.DroppedFlag = true;
                   
           WS_ESB_BusinessObjects.CitizensServiceAddress ctzSerAdd = new WS_ESB_BusinessObjects.CitizensServiceAddress();
           ctzSerAdd.StateOrProvince = 'asdf';
           ctzSerAdd.Country = 'asdf';
           ctzSerAdd.County = 'asdf';
           ctzSerAdd.StreetNrFirst = 'asdf';
           ctzSerAdd.StreetNrFirstSuffix = 'asdf';
           ctzSerAdd.StreetName = 'asdf';
           ctzSerAdd.StreetType = 'asdf';
           ctzSerAdd.StreetSuffix = 'asdf';
           ctzSerAdd.StreetNrLast = 'asdf';
           ctzSerAdd.StreetNrLastSuffix = 'asdf';
           ctzSerAdd.Locality = 'asdf';
           ctzSerAdd.Postcode = 'sdf';
           ctzSerAdd.StreetNrFirstPrefix = 'asdf';
           ctzSerAdd.StreetNrLastPrefix = 'asdf';
           ctzSerAdd.StreetNamePrefix = 'asdf';
           ctzSerAdd.StreetNameSuffix = 'asdf';
           ctzSerAdd.Subdivision = 'asdf';
           ctzSerAdd.StreetSubDescription = 'asdf';
           ctzSerAdd.StreetDirection = 'asdf';
           ctzSerAdd.StreetPostDirection = 'asdf';
           ctzSerAdd.BuildingName = 'asdf';
           ctzSerAdd.BuildingNumber = 'asdf';
           ctzSerAdd.BuildingSubNumber = 'asdf';
           ctzSerAdd.Unit = new WS_ESB_BusinessObjects.AddressUnit[]{};
           ctzSerAdd.Unit.add(AdrUnt);
           ctzSerAdd.SubLocation = 'asdf';
           ctzSerAdd.Community = 'asdf';
           ctzSerAdd.AddressID = 'asdf';
           ctzSerAdd.LocalityID = 'asdf';
           ctzSerAdd.WireCenter = 'asdf';
           ctzSerAdd.Exchange = exg;
           ctzSerAdd.CommonLanguageLocationId = cmLanLocId;
           ctzSerAdd.TaxingDistrict = cdDesPair;
           ctzSerAdd.PhysicalMapPageNumber = 'asdf';
           ctzSerAdd.PhysicalMapSector = 'asdf';
           ctzSerAdd.MileageZone = 'asdf';
           ctzSerAdd.ServiceOverrideFlag = true;
           ctzSerAdd.GlobalPosition = glPos;
           ctzSerAdd.HSICapableFlag = true;
           ctzSerAdd.PricingSegmentIndicator = 'asdf';
           ctzSerAdd.ReadyForServiceFlag = true;
           ctzSerAdd.ServiceSequenceNumber = 1;
           ctzSerAdd.ServiceControlNumber =2;
           ctzSerAdd.AdditionalAddressInfo = new WS_ESB_BusinessObjects.AdditionalAddressInfo[]{};
           ctzSerAdd.AdditionalAddressInfo.add(adnAddInf);
           ctzSerAdd.LineCardHistory = new WS_ESB_BusinessObjects.LineCardHistory[]{};
           ctzSerAdd.LineCardHistory.add(lnCrdHst);
           ctzSerAdd.DataSourceEnvironment = dsEnv;
           ctzSerAdd.HomeOwnerAssociationFlag = true;
           ctzSerAdd.LocalFranchiseAgreementFlag = true;
           ctzSerAdd.FiberProductCapableFlag = true;
           ctzSerAdd.Line = new WS_ESB_BusinessObjects.Line[]{};
           ctzSerAdd.Line.add(ln);
           ctzSerAdd.CentralOfficeCLLI = cmLanLocId;
           ctzSerAdd.InternetInfo = interType;
           ctzSerAdd.ConnectedLineCardsFoundFlag = true;
           ctzSerAdd.LineCardInfo = lnCrd;
           ctzSerAdd.FiberVideoAvailableFlag = true;
           ctzSerAdd.Ethernet = 'asdf';
           ctzSerAdd.IncorporatedIndicator = 'asdf';
           ctzSerAdd.PoolType = 'asdf';
           
           WS_ESB_BusinessObjects.OverrideDirectoryRecipient ovrDirRec = new WS_ESB_BusinessObjects.OverrideDirectoryRecipient();
           ovrDirRec.Individual = ind;
           ovrDirRec.Organization = org;
           ovrDirRec.TelephoneNumber = new WS_ESB_BusinessObjects.TelephoneNumber[]{};
           ovrDirRec.TelephoneNumber.add(telNum);
           ovrDirRec.CitizensPostalAddress = new WS_ESB_BusinessObjects.CitizensPostalAddress[]{};
           ovrDirRec.CitizensPostalAddress.add(ctzPosAdd);
           ovrDirRec.ValidFor = tmPrd;
           ovrDirRec.NameFormatFlag = true;
        
           WS_ESB_BusinessObjects.DirectoryDeliveryInfo dirDelInfo = new WS_ESB_BusinessObjects.DirectoryDeliveryInfo();
           dirDelInfo.DirectoryLabelQuantity = 1;
           dirDelInfo.MidiDirectoryLabelQuantity = 1;
           dirDelInfo.MailingAddressSource = 'asdf';
           dirDelInfo.OverrideDirectoryRecipient = ovrDirRec;
           
           WS_ESB_BusinessObjects.DirectoryCode dirCd = new WS_ESB_BusinessObjects.DirectoryCode();
           dirCd.CodeNumber = 2;
           dirCd.DirectoryCode = 'adf';
           
           WS_ESB_BusinessObjects.DirectoryListingInfo  dirLstInf = new WS_ESB_BusinessObjects.DirectoryListingInfo();
           //dirLstInf.DirectoryCode = dirCd;
           dirLstInf.LineNumber = 1;
           dirLstInf.DirectoryTextLine ='asdf';
           
           WS_ESB_BusinessObjects.DirectoryListing dirLst = new WS_ESB_BusinessObjects.DirectoryListing();
           dirLst.ListingSequence = 1;
           dirLst.DirectoryListingInfo = new WS_ESB_BusinessObjects.DirectoryListingInfo[]{};
           dirLst.DirectoryListingInfo.add(dirLstInf);
           
           WS_ESB_BusinessObjects.DirectoryListingError dirLstErr = new WS_ESB_BusinessObjects.DirectoryListingError();
           dirLstErr.OrderId = 'asdf';
           dirLstErr.OrderDate = DateTime.now();
           dirLstErr.Description = new String[]{'asdf'};
           
           WS_ESB_BusinessObjects.RemarkText rmkTxt = new WS_ESB_BusinessObjects.RemarkText();
           rmkTxt.RemarkText = 'asdf';
           
           WS_ESB_BusinessObjects.Item itm = new WS_ESB_BusinessObjects.Item();
           itm.OrderLineNumber = 1;
           if (itm != null)
            itm.Price[0] = prc;
           itm.Quantity = 1;
           itm.ProratedPrice = prc;
           itm.MonthlyRecurringCharge = prc;
           itm.NonRecurringCharge = prc;
           itm.ItemCode = 'adf';
           itm.ItemId = 'asdf';
           itm.Name = 'asdf';
           itm.Description = 'asdf';
           itm.ItemType = 'asdf';
           itm.ChargeCode = 'adf';
           itm.ChargeType = 'asdf';
           itm.ProrateCode = 'sdf';
           itm.Action = 'asdf';
           itm.ActionReason = 'asdf';
           itm.ProcessingDirection = 'asdf';
           itm.TaxableCode = 'sdf';
           itm.OverrideReason = 'asdf';
           itm.OverrideAllowable = 'asdf';
           itm.RemarkText = new WS_ESB_BusinessObjects.RemarkText[]{};
           itm.RemarkText.add(rmkTxt);
           itm.CharacteristicValue = new WS_ESB_BusinessObjects.CharacteristicValue[]{};
           itm.CharacteristicValue.add(chrVl);
           itm.ValidFor = tmPrd;
           itm.ProductCatalogInformation = proCatInfo;
           itm.Item = new WS_ESB_BusinessObjects.Item[]{};
           itm.Item.add(itm);
           itm.InstallOrderId = 'asdf';
           itm.RemovalOrderId = 'asdf';
           itm.ItemActionType = 'asdf';
           itm.DisconnectReasonCode = 'adf';
           
           WS_ESB_BusinessObjects.TermPriceDifference trmPrcDif = new WS_ESB_BusinessObjects.TermPriceDifference();
           trmPrcDif.TermLength = 'asdf';
           trmPrcDif.DifferenceAmount = 23.55;
           
           WS_ESB_BusinessObjects.Product pdr = new WS_ESB_BusinessObjects.Product();
           pdr.ProductName = 'adsf';
           pdr.Description = 'adsf';
           pdr.ProductId = 1;
           pdr.ProductCode = 'asf';
           pdr.ProductGroupId = 'adsf';
           pdr.HighValueFlag = true;
           pdr.ProductLine = new String[]{'asdf'};
           pdr.AdditionalInformationText = 'adsf';
           pdr.TermPriceDifference = new WS_ESB_BusinessObjects.TermPriceDifference[]{};
           pdr.TermPriceDifference.add(trmPrcDif);
           pdr.Price = prc;
           pdr.CharacteristicValue = new WS_ESB_BusinessObjects.CharacteristicValue[]{};
           pdr.CharacteristicValue.add(chrVl);
           pdr.ValidFor = tmPrd;
           pdr.Item = new WS_ESB_BusinessObjects.Item[]{};
           pdr.Item.add(itm);
           pdr.Product = new WS_ESB_BusinessObjects.Product[]{};
           pdr.Product.add(pdr);
           pdr.ProductItem = itm;
           
           WS_ESB_BusinessObjects.ProductGroup pdrGrp = new WS_ESB_BusinessObjects.ProductGroup();
           pdrGrp.ProductGroupId = 'asdf';
           pdrGrp.ProductGroupSequence = 2;
           pdrGrp.ShowIfEmptyFlag = true;
           
           WS_ESB_BusinessObjects.Package_x pkg = new WS_ESB_BusinessObjects.Package_x();
           pkg.PackageName ='asdf';
           pkg.Description ='asdf';
           pkg.PackageId ='asdf';
           pkg.Price = prc;
           pkg.CharacteristicValue = new WS_ESB_BusinessObjects.CharacteristicValue[]{};
           pkg.CharacteristicValue.add(chrVl);
           pkg.ValidFor = tmPrd;
           pkg.Item = new WS_ESB_BusinessObjects.Item[]{};
           pkg.Item.add(itm);
           pkg.PackageItem = itm;
           
           WS_ESB_BusinessObjects.CustomerAccountDepositDetail cusAccDpDtl = new WS_ESB_BusinessObjects.CustomerAccountDepositDetail();
           cusAccDpDtl.DepositRefundAmount = 23.50;
           cusAccDpDtl.DepositRefundChargeCode = 'dsf';
           cusAccDpDtl.DepositRefundCheckDescription = 'adsf';
           cusAccDpDtl.DepositRefundGeneralLedgerAccountNumber = 'adsf';
           cusAccDpDtl.InterestRefundAmount = 23.50;
           cusAccDpDtl.InterestRefundChargeCode = 'dsf';
           cusAccDpDtl.InterestRefundCheckDescription = 'adsf';
           cusAccDpDtl.InterestRefundGeneralLedgerAccountNumber = 'adsf';
           
        
           WS_ESB_BusinessObjects.CustomerAccountDeposit cusAccDpst = new WS_ESB_BusinessObjects.CustomerAccountDeposit();
           cusAccDpst.Description = 'adsf';
           cusAccDpst.DepositDate = Date.Today();
           cusAccDpst.DepositAmount = 23.00;
           cusAccDpst.DepositCode = 'sdf';
           cusAccDpst.InterestAmount = 23.00;
           cusAccDpst.InterestMethod = 'adsf';
           cusAccDpst.InterestToDate = 25.99;
           cusAccDpst.InterestToDateThru = Date.Today();
           cusAccDpst.InterestAmountThru = 'adsf';
           cusAccDpst.RefundsToDate = 23.00;
           cusAccDpst.DepositRefundedDate = Date.Today();
           cusAccDpst.InterestRefundedDate = Date.Today();
           cusAccDpst.CustomerAccountDepositDetail = cusAccDpDtl;
           
           WS_ESB_BusinessObjects.CustomerBankAccount cusBnkAcc = new WS_ESB_BusinessObjects.CustomerBankAccount();
           cusBnkAcc.BankName = 'asdf';
           cusBnkAcc.BankNumber = 'asdf';
           cusBnkAcc.BankAccountNumber = 'asdf';
           cusBnkAcc.BankAccountType = 'asdf';
           cusBnkAcc.BankContact = indCon;
           cusBnkAcc.SequenceNumber = 1;
           
           WS_ESB_BusinessObjects.LATA lta = new WS_ESB_BusinessObjects.LATA();
           lta.LATAType = 'asdf';
           lta.Type = 'asdf';
           lta.SequenceNumber = 2;
           lta.RegulatoryRegistrationCode = 'sdf';
           lta.RegulatoryRegistrationNumber = 'asdf';
           lta.OperatingCompanyNumber = 'asdf';
           lta.EffectiveDate = Date.Today();
           lta.EffectiveTime = 'asdf';
           lta.StateCode = 'sdf';
           lta.OrderId = 'asdf';
           lta.SourceCode = 'asdf';
           lta.AcceptThirdPartyCallsFlag = true;
           lta.AcceptCollectCallsFlag = true;
           lta.PreviousAcceptThirdPartyCallsFlag = true;
           lta.PreviousAcceptCollectCallsFlag = true;
           lta.ThirdPartyVerificationNumber = 'asdf';
           
           WS_ESB_BusinessObjects.OrderType oderTyp = new WS_ESB_BusinessObjects.OrderType();
           oderTyp.Name = 'asdf';
           oderTyp.Description = 'asdf';
           
           WS_ESB_BusinessObjects.Stage stg = new WS_ESB_BusinessObjects.Stage();
           stg.Code = 'sdf';
           stg.Description = 'asdf';
           
           WS_ESB_BusinessObjects.OrderInfo odrInf = new WS_ESB_BusinessObjects.OrderInfo();
           odrInf.OrderNumber = 'asdf';
           odrInf.Environment = 'asdf';
           
           WS_ESB_BusinessObjects.RelatedOrder rldOdr = new WS_ESB_BusinessObjects.RelatedOrder();
           rldOdr.LeadOrder = odrInf;
           rldOdr.MemberOrder = odrInf;
           rldOdr.OrderType = oderTyp;
           rldOdr.MemberOrderType = 'asdf';
           rldOdr.MemberOrderServiceType = 'asdf';
           rldOdr.GroupOrderDescription = 'asdf';
           rldOdr.GroupOrderDescriptionType = 'asdf';
           rldOdr.GroupOrderSequenceNumber = 2;
           rldOdr.OrderStage = stg;
           rldOdr.UniversalServiceId = 'asdf';
           
          
           WS_ESB_BusinessObjects.OpenServiceOrder opnSerOdr = new WS_ESB_BusinessObjects.OpenServiceOrder();
           opnSerOdr.OrderId = 'asdf';
           opnSerOdr.DueDate = Date.Today();
           opnSerOdr.OrderType = oderTyp;
           opnSerOdr.LeadOrder = odrInf;
           opnSerOdr.MemberOrder = odrInf;
           opnSerOdr.MemberOrderType = 'asdf';
           opnSerOdr.MemberOrderServiceType = 'asdf';
           opnSerOdr.GroupOrderDescription = 'asdf';
           opnSerOdr.GroupOrderDescriptionType = 'asdf';
           opnSerOdr.GroupOrderSequenceNumber = 3;
           opnSerOdr.OrderStage = stg;
           opnSerOdr.UniversalServiceId = 'asdf';
           opnSerOdr.MaintenanceStatusInCRM = 'asdf';
        
           WS_ESB_BusinessObjects.Tariff trf = new WS_ESB_BusinessObjects.Tariff();
           trf.Code = 'sdf';
           trf.Description = 'asdf';
           
           WS_ESB_BusinessObjects.TaxExemption txExm = new WS_ESB_BusinessObjects.TaxExemption();
           txExm.TaxExemptionType = 'asdf';
           txExm.IssuingJurisdiction = 'asdf';
           txExm.TaxExemptCode = 'adf';
           txExm.TaxExemptValidFor = tmPrd;
           
           WS_ESB_BusinessObjects.TaxCertificate txCer = new  WS_ESB_BusinessObjects.TaxCertificate();
           txCer.CustomerName = 'asdf';
           txCer.ContactEmail = eml;
           txCer.TaxCertificateNumber = 'asdf';
           txCer.TaxCertificateStatus = 'asdf';
           txCer.UpdatingOrderID = 'asdf';
           txCer.TaxCertificateAddress = ctzPosAdd;
           txCer.TaxCertificateCustomerType = 'asdf';
           txCer.TaxExemption = new WS_ESB_BusinessObjects.TaxExemption[]{};
           txCer.TaxExemption.add(txExm);
        
           
           
           WS_ESB_BusinessObjects.OtherTaxCode othTxCde = new WS_ESB_BusinessObjects.OtherTaxCode();
           othTxCde.TaxCode = 'sdf';
           othTxCde.Description = 'asdf';     
           
           WS_ESB_BusinessObjects.CustomerAccountReference cusAccRef = new WS_ESB_BusinessObjects.CustomerAccountReference();
           cusAccRef.RelatedTelephoneNumber = telNum;      
           
           WS_ESB_BusinessObjects.CustomerAccountRelationship cusAccRel = new WS_ESB_BusinessObjects.CustomerAccountRelationship();
           cusAccRel.RelationshipType = 'asdf'; 
           cusAccRel.CustomerAccountReference = cusAccRef;             
           
           WS_ESB_BusinessObjects.CustomerCallingCard cusCalCd = new WS_ESB_BusinessObjects.CustomerCallingCard();
           cusCalCd.SequenceNumber = 2;
           cusCalCd.Status = 'asdf';
           cusCalCd.EffectiveDate = Date.Today();
           cusCalCd.PersonalIdentificationNumber = 'asdf';
           cusCalCd.PersonalIdentificationNumberAction = 'asdf';
           cusCalCd.CardQuantity = 2;
           cusCalCd.CardType = 'asdf';
           cusCalCd.OrderCode = 'sdf';
           cusCalCd.OrderId = 'asdf';
           cusCalCd.ServiceClass = 'asdf';
           
           WS_ESB_BusinessObjects.LoyaltyPointsProgram ftrRwrdPrg = new WS_ESB_BusinessObjects.LoyaltyPointsProgram();
           ftrRwrdPrg.RewardsProgramType = 'asdf';
           ftrRwrdPrg.SentDate = Date.Today();
           ftrRwrdPrg.BillDate = Date.Today();
           ftrRwrdPrg.ThisMonthPoints = 2;
           ftrRwrdPrg.LastMonthPoints = 3;
           
           WS_ESB_BusinessObjects.SecurityInfo srInf = new WS_ESB_BusinessObjects.SecurityInfo();
           srInf.SecurityQuestion = 'asdf';
           srInf.SecurityAnswer = 'asdf';
           
           WS_ESB_BusinessObjects.OnlineBillPayProfile onlBlPyPrf = new WS_ESB_BusinessObjects.OnlineBillPayProfile();
           onlBlPyPrf.OnlineBillPayCustomerFlag = true;
           onlBlPyPrf.BlockOnlineBillPayFlag = true;
           onlBlPyPrf.OnlineBillPayEnrollmentStatus = 'asdf';
//         public UserInfo UserInfo; ////////////////////////////////////////////////////
           onlBlPyPrf.SecurityInfo = new WS_ESB_BusinessObjects.SecurityInfo[]{};
           onlBlPyPrf.SecurityInfo.add(srInf);
           
           WS_ESB_BusinessObjects.OnlineBillPayProfileHistory onlBlPyHst = new WS_ESB_BusinessObjects.OnlineBillPayProfileHistory();
           onlBlPyHst.LastUpdateDate = Date.Today();
           onlBlPyHst.LastActionCode = 'asdf';
           onlBlPyHst.PrintFlag = true;
           onlBlPyHst.AutoPayFlag = true;
           onlBlPyHst.ErrorFlag = true;
           
           
           WS_ESB_BusinessObjects.VideoServiceAccount vdSerAcc = new WS_ESB_BusinessObjects.VideoServiceAccount();
           vdSerAcc.VideoServiceType = 'asdf';
           vdSerAcc.ActiveFlag = true;
           vdSerAcc.VideoServiceAccountNumber = 'asdf';
           vdSerAcc.LastUpdatedDateTime = DateTime.now();
           
           WS_ESB_BusinessObjects.CustomerVideoServiceTransaction cusVdSerTran = new WS_ESB_BusinessObjects.CustomerVideoServiceTransaction();
           cusVdSerTran.VideoServiceType = 'asdf';
           cusVdSerTran.VideoServiceAccountNumber = 'asdf';
           cusVdSerTran.ItemCode = 'sdf';
           cusVdSerTran.Action = 'asdf';
           cusVdSerTran.Activity = 'asdf';
           cusVdSerTran.TransactionDateTime = DateTime.now();
           cusVdSerTran.OldVideoServiceAccountNumber = 'asdf';
           cusVdSerTran.OrderId = 'asdf';
           cusVdSerTran.UpdatedBy = 'asdf';
           
           WS_ESB_BusinessObjects.FrontierVideoServiceTransaction ftrVdSerTran = new WS_ESB_BusinessObjects.FrontierVideoServiceTransaction();
           ftrVdSerTran.VideoServiceType = 'asdf';
           ftrVdSerTran.VideoServiceAccountNumber = 'asdf';
           ftrVdSerTran.ItemCode = 'sdf';
           ftrVdSerTran.Action = 'asdf';
           ftrVdSerTran.Activity = 'asdf';
           ftrVdSerTran.TransactionDateTime = DateTime.now();
           ftrVdSerTran.CustomerName = 'asdf';
           
           WS_ESB_BusinessObjects.AccountReceivableAging accRecAg = new WS_ESB_BusinessObjects.AccountReceivableAging();
           accRecAg.Receivable1To30DaysPastDueAmount = 5;
           accRecAg.Receivable31To60DaysPastDueAmount = 40;
           accRecAg.Receivable61To90DaysPastDueAmount = 77;
           accRecAg.ReceivableOver90DaysPastDueAmount = 99;
           
           WS_ESB_BusinessObjects.CreditCardPaymentSource ccPmtSrc = new  WS_ESB_BusinessObjects.CreditCardPaymentSource();
           ccPmtSrc.PaymentSourceCode = 'sdf';
           ccPmtSrc.PaymentSourceDescription = 'asdf';
           ccPmtSrc.AccountId = 'asdf';
           ccPmtSrc.AccountHolderName = 'asdf';
           ccPmtSrc.AccountHolderAddress = ctzPosAdd;
           ccPmtSrc.NotificationEmailAddress = eml;
           ccPmtSrc.CreditVerificationValue = 'asdf';
           ccPmtSrc.ExpirationMonth = 'asdf';
           ccPmtSrc.ExpirationYear = 'asdf';
           ccPmtSrc.CreditCardType = 'asdf';
           
           WS_ESB_BusinessObjects.PaymentProfile pmtPrf = new WS_ESB_BusinessObjects.PaymentProfile();
           pmtPrf.Id = 'asdf';
           pmtPrf.ActivatedFlag = true;
           pmtPrf.LastUpdatedDateTime = DateTime.now();
           pmtPrf.LastUpdatedByUserId = 'asdf';
           pmtPrf.CreditCardPaymentSource = ccPmtSrc;
           
           
           WS_ESB_BusinessObjects.TemporaryAccountStatus tmpAccSts = new WS_ESB_BusinessObjects.TemporaryAccountStatus();
           tmpAccSts.Reason = 'asdf';
           tmpAccSts.ActiveFlag = true;
           tmpAccSts.ActiveDuring = tmPrd;
           
           WS_ESB_BusinessObjects.WirelessServiceAccount wrSerAcc = new WS_ESB_BusinessObjects.WirelessServiceAccount();
           wrSerAcc.AccountNumber = accId;
           wrSerAcc.KeyName = 'asdf';
           wrSerAcc.DataValue = 'asdf';
           wrSerAcc.OrderNumber = 'asdf';
           
           WS_ESB_BusinessObjects.SatelliteAccountInfo satAccInf = new WS_ESB_BusinessObjects.SatelliteAccountInfo();
           satAccInf.PartnerId = 'asdf';
           satAccInf.ReassignmentNumber = 3;
           satAccInf.SatelliteAccountNumber = 'asdf';
           satAccInf.Satellite = 'asdf';
           
           WS_ESB_BusinessObjects.TaxInfo txInfo = new WS_ESB_BusinessObjects.TaxInfo();
           txInfo.GlobalPosition = glPos;
           txInfo.IncorporatedIndicator = 'asdf';
           txInfo.PostalAddress = ctzPosAdd;   
           
           
           WS_ESB_BusinessObjects.SalesWorthyEnum swEnm = new WS_ESB_BusinessObjects.SalesWorthyEnum();
           swEnm.SalesWorthy = 'asdf';
           swEnm.AmountOver60 = 'asdf';
           swEnm.DPATreatment = 'asdf';
           swEnm.ReturnedCheck = 'asdf';
           swEnm.TemporaryDisconnectNonPay = 'asdf';
           swEnm.CreditClass_5_E_L_G = 'asdf';
           swEnm.TollRestrictedNonPay = 'asdf';
           swEnm.NoPayments = 'asdf';
           swEnm.NSALE = 'asdf';
           
           WS_ESB_BusinessObjects.CustomerCreditProfileInterpretation ccPInt = new WS_ESB_BusinessObjects.CustomerCreditProfileInterpretation();
           ccPInt.Reason = 'asdf';
           ccPInt.SalesWorthyCode = swEnm;
           
           WS_ESB_BusinessObjects.Customer cus = new WS_ESB_BusinessObjects.Customer();
           cus.Individual = ind;
           cus.Organization = org;
           cus.TelephoneNumber = telNum;
           cus.CitizensPostalAddress = ctzPosAdd;
           cus.ValidFor = tmPrd;
           cus.CustomerID = 'asdf';
           cus.NameFormatFlag = true;
           cus.CustomerCreditProfile = cusCrPrf;
           cus.CustomerCreditProfileInterpretation = ccPInt;
           cus.CustomerCategory = 'asdf';
           cus.Email = eml;        
           
           WS_ESB_BusinessObjects.CustomerAccount cusAcc = new WS_ESB_BusinessObjects.CustomerAccount();
           cusAcc.AccountID = 'asdf';
           cusAcc.CustomerAccountId = accId;
           cusAcc.AccountType = 'asdf';
           cusAcc.CustomerType = 'asdf';
           cusAcc.ServiceType = srvTp;
           cusAcc.Status = 'asdf';
           cusAcc.AllowCustomerContactCollectionFlag = true;
           cusAcc.UpsellEligibilityFlag = true;
           cusAcc.UpsellDisqualificationReason = new WS_ESB_BusinessObjects.UpsellDisqualificationReason[]{};
           cusAcc.UpsellDisqualificationReason.add(usDqRs);
           cusAcc.HighValueCustomerFlag = true;
           cusAcc.ActiveBankDraftFlag = true;
           cusAcc.ExchangeCarrierLockFlag = true;
           cusAcc.InterExchangeCarrierLockInfo = 'asdf';
           cusAcc.ADSLCapableFlag = true;
           cusAcc.ADSLCapableReason = 'asdf';
           cusAcc.SDSLCapableFlag = true;
           cusAcc.SDSLCapableReason = 'asdf';
           cusAcc.HSIAvailabilityDescription = 'asdf';
           cusAcc.AvailableSpeed = avlSpd;
           cusAcc.FiberFlag = true;
           cusAcc.InternetInfo =interType;
           cusAcc.FictitiousFlag = true;
           cusAcc.PrimaryServiceFlag = true;
           cusAcc.OrderCreationEligibilityFlag = true;
           cusAcc.ConnectDate = Date.Today();
           cusAcc.DisconnectDate = Date.Today();
           cusAcc.PrivateLineType = 'asdf';
           cusAcc.PersonalIdentificationNumber = 'asdf';
           cusAcc.TollLimitCode = 'adf';
           cusAcc.BillingAccountId = accId;
           cusAcc.CustomerBill = cusBill;
           cusAcc.CustomerAccountPromotion = new WS_ESB_BusinessObjects.Promotion[]{};
           cusAcc.CustomerAccountPromotion.add(promo);
           cusAcc.AuthorizedCustomerProxy = authProxy;
           cusAcc.Customer = cus;
           cusAcc.ServiceAddressString = 'asdf';
           cusAcc.ServiceAddress = ctzSerAdd;
           cusAcc.DirectoryListingType  = 'asdf';
           cusAcc.DirectoryDeliveryInfo = new WS_ESB_BusinessObjects.DirectoryDeliveryInfo[]{};
           cusAcc.DirectoryDeliveryInfo.add(dirDelInfo);
           cusAcc.DirectoryListing = new WS_ESB_BusinessObjects.DirectoryListing[]{};
           cusAcc.DirectoryListing.add(dirLst);
           cusAcc.DirectoryListingError = new WS_ESB_BusinessObjects.DirectoryListingError[]{} ;
           cusAcc.DirectoryListingError.add(dirLstErr);
           cusAcc.Item = new WS_ESB_BusinessObjects.Item[]{};
           cusAcc.Item.add(itm);
           cusAcc.Product = new WS_ESB_BusinessObjects.Product[]{};
           cusAcc.Product.add(pdr);
           cusAcc.AvailableHighValueProduct = new WS_ESB_BusinessObjects.Product[]{};
           cusAcc.AvailableHighValueProduct.add(pdr);
           cusAcc.ProductGroup = new WS_ESB_BusinessObjects.ProductGroup[]{};
           cusAcc.ProductGroup.add(pdrGrp);
           cusAcc.Package_x = new WS_ESB_BusinessObjects.Package_x[]{};
           cusAcc.Package_x.add(pkg);
           cusAcc.CustomerAccountDeposit = new WS_ESB_BusinessObjects.CustomerAccountDeposit[]{};
           cusAcc.CustomerAccountDeposit.add(cusAccDpst);
           cusAcc.CustomerBankAccount = new WS_ESB_BusinessObjects.CustomerBankAccount[]{};
           cusAcc.CustomerBankAccount.add(cusBnkAcc);
           cusAcc.InterLATA = new WS_ESB_BusinessObjects.LATA[]{};
           cusAcc.InterLATA.add(lta);
           cusAcc.IntraLATA = new WS_ESB_BusinessObjects.LATA[]{};
           cusAcc.IntraLATA.add(lta);
           cusAcc.OpenServiceOrder = new WS_ESB_BusinessObjects.OpenServiceOrder[]{};
           cusAcc.OpenServiceOrder.add(opnSerOdr);
           cusAcc.ProvisioningData = new WS_ESB_BusinessObjects.CharacteristicValue[]{};
           cusAcc.ProvisioningData.add(chrVl);
           cusAcc.FederalTaxExemptFlag = true;
           cusAcc.StateTaxCode = 'cal';
           cusAcc.TaxingDistrict = 'asdf';
           cusAcc.TaxingDistrictDescription = 'asdf';
           cusAcc.Tariff = trf;
           cusAcc.TaxCertificate = new  WS_ESB_BusinessObjects.TaxCertificate[]{};
           cusAcc.TaxCertificate.add(txCer);
           cusAcc.SchoolCode = 'asdf';
           cusAcc.CountyCode = 'asdf';
           cusAcc.CountyName  = 'asdf';
           cusAcc.OtherTaxCode = new WS_ESB_BusinessObjects.OtherTaxCode[]{};
           cusAcc.OtherTaxCode.add(othTxCde);
           cusAcc.CustomerAccountRelationship = new WS_ESB_BusinessObjects.CustomerAccountRelationship[]{};
           cusAcc.CustomerAccountRelationship.add(cusAccRel);
           cusAcc.CustomerCallingCard = new WS_ESB_BusinessObjects.CustomerCallingCard[]{};
           cusAcc.CustomerCallingCard.add(cusCalCd);
           cusAcc.FrontierRewardsProgram = new WS_ESB_BusinessObjects.LoyaltyPointsProgram[]{};
           cusAcc.FrontierRewardsProgram.add(ftrRwrdPrg);
           cusAcc.OnlineBillPayProfile = onlBlPyPrf;
           cusAcc.OnlineBillPayProfileHistory = new WS_ESB_BusinessObjects.OnlineBillPayProfileHistory[]{};
           cusAcc.OnlineBillPayProfileHistory.add(onlBlPyHst);
           cusAcc.VideoServiceAccount = new WS_ESB_BusinessObjects.VideoServiceAccount[]{};
           cusAcc.VideoServiceAccount.add(vdSerAcc);
           cusAcc.CustomerVideoServiceTransaction = new WS_ESB_BusinessObjects.CustomerVideoServiceTransaction[]{};
           cusAcc.CustomerVideoServiceTransaction.add(cusVdSerTran);
           cusAcc.FrontierVideoServiceTransaction = new WS_ESB_BusinessObjects.FrontierVideoServiceTransaction[]{};
           cusAcc.FrontierVideoServiceTransaction.add(ftrVdSerTran);
           cusAcc.LastUpdatedDateTime = DateTime.now();
           cusAcc.BillPrintVendorSourceCode = 'ass';
           cusAcc.AccountReceivableAging = accRecAg;
           cusAcc.LockboxNumber =2;
           cusAcc.CurrentTreatmentStatus  = 'asdf';
           cusAcc.WrittenOffDate = Date.Today();
           cusAcc.PaymentProfile = pmtPrf;
           cusAcc.PaymentTypeBlocked  = 'asdf';
           cusAcc.TemporaryAccountStatus = new WS_ESB_BusinessObjects.TemporaryAccountStatus[]{};
           cusAcc.TemporaryAccountStatus.add(tmpAccSts);
           cusAcc.PricingSegmentIndicator = 'asdf';
           cusAcc.CustomerPricingSegmentIndicator = 'asdf';
           cusAcc.GlobalAccountId = accId;
           cusAcc.WirelessServiceAccount = new WS_ESB_BusinessObjects.WirelessServiceAccount[]{};
           cusAcc.WirelessServiceAccount.add(wrSerAcc);
           cusAcc.CircuitID = 'asdf';
           cusAcc.SatelliteInfo = satAccInf;
           cusAcc.BillingAddressTaxInfo = txInfo;
           
          
           //---------------------------------------------------------------------------------------------------------------------------
           //---------------------------------------------------------------------------------------------------------------------------
           
           manAccResp.ExecutionContext = exCntxt;
           manAccResp.RequestCriteria = reqCtr;
           manAccResp.AccountId = accId;
           manAccResp.CustomerAccount = new WS_ESB_BusinessObjects.CustomerAccount[]{} ;
           manAccResp.CustomerAccount.add(cusAcc);
           
        response.put('response_x', manAccResp);
      }
      
   

 }