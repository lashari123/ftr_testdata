@isTest
global class WS_ESB_ManageColMockWSGPMTTest implements WebServiceMock {
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
            
           WS_ESB_ManageCollection.ResponseContainer_GetPayment gtPmtResponse = new WS_ESB_ManageCollection.ResponseContainer_GetPayment();
           gtPmtResponse.Response = new WS_ESB_ManageCollection.Response_GetPayment();
           
           //-------------------------------------------------------------------------------------------------------------------------------
           WS_ESB_ExecutionContext.ExecutionStatusMessage exStMes = new WS_ESB_ExecutionContext.ExecutionStatusMessage();
           exStMes.ExecutionStatusSeverity = 'asdf';
           exStMes.ExecutionStatusSource = 'asdf';
           exStMes.ExecutionStatusSourceOperation = 'asdf';
           exStMes.ExecutionStatusCode = 'asdf';
           exStMes.ExecutionStatusDescription = 'asdf';
           exStMes.ExecutionStatusText = 'asdf';
           exStMes.ExecutionStatusTarget = 'asdf';
           exStMes.ExecutionStatusMessage = new WS_ESB_ExecutionContext.ExecutionStatusMessage[]{};
           exStMes.ExecutionStatusMessage.add(exStMes);
           
           
           WS_ESB_ExecutionContext.ExecutionStatus exSts = new WS_ESB_ExecutionContext.ExecutionStatus();
           exSts.ExecutionStatusSuccessFlag = true;
           exSts.ExecutionStatusAction = 'adsf';
           exSts.ExecutionStatusMessage = new WS_ESB_ExecutionContext.ExecutionStatusMessage[]{};
           exSts.ExecutionStatusMessage.add(exStMes);
           
           
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
           trRlts.TraceResult = new  WS_ESB_ExecutionContext.TraceResult[]{};
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
           //-------------------------------------------------------------------------------------------------------------------------------
           
           //-------------------------------------------------------------------------------------------------------------------------------
           WS_ESB_BusinessObjects.NorthAmericanTelephoneNumber nrtAmrNum = new WS_ESB_BusinessObjects.NorthAmericanTelephoneNumber();
           nrtAmrNum.NPA = '2145554444';
           nrtAmrNum.NXX = '2145554444';
           nrtAmrNum.Station = '2145554444';
           
           WS_ESB_BusinessObjects.TelephoneNumber telNum = new WS_ESB_BusinessObjects.TelephoneNumber();
           telNum.Number_x = '7157543333';
           telNum.Extension = '321';
           
           WS_ESB_BusinessObjects.PhoneNumberAsId phNumId = new WS_ESB_BusinessObjects.PhoneNumberAsId();
           phNumId.TelephoneNumber = telNum; 
           phNumId.SequenceNumber = 1;
           
           WS_ESB_BusinessObjects.DataSourceEnvironment dsEnv = new WS_ESB_BusinessObjects.DataSourceEnvironment();
           dsEnv.BillingSystem = 'asdf';
           dsEnv.DataRegion = 'asdf';
           dsEnv.DataRegionCode = 1;
           dsEnv.DataSource = 'asdf';
           dsEnv.DataEnvironment = 'asdf';
           
           WS_ESB_BusinessObjects.RequestAccountId reqAccId = new WS_ESB_BusinessObjects.RequestAccountId();
           reqAccId.PhoneNumberAsId = phNumId;
           reqAccId.UniversalServiceId = '12345654';
           reqAccId.AccountNumber = '7157543333';
           reqAccId.DataSourceEnvironment = dsEnv;
           
           WS_ESB_ManageCollection.RequestCriteria_GetPayment rqCtr = new WS_ESB_ManageCollection.RequestCriteria_GetPayment();
           rqCtr.AccountId = reqAccId;
           rqCtr.IncludeOnlyPostedPaymentsNeverOnBillFlag = true;
           //-------------------------------------------------------------------------------------------------------------------------------
          
           //-------------------------------------------------------------------------------------------------------------------------------
           WS_ESB_BusinessObjects.Quantity qt = new WS_ESB_BusinessObjects.Quantity();
           qt.Amount = '50.24';
           qt.Units = '75';
           
          
          /* WS_ESB_BusinessObjects.AddressText adrTxt = new WS_ESB_BusinessObjects.AddressText();
           adrTxt.AddressText = 'asddf';
           adrTxt.SequenceNumber = 2;*/
        
           WS_ESB_BusinessObjects.CitizensPostalAddress accHolAdd = new WS_ESB_BusinessObjects.CitizensPostalAddress();
           accHolAdd.StateOrProvince = 'amer';
           accHolAdd.Country = 'amer';
           accHolAdd.County = 'amer';
           //accHolAdd.AddressText.add(adrTxt);
           accHolAdd.Locality = 'amer';
           accHolAdd.Postcode = 'amer';
           
           WS_ESB_BusinessObjects.TimePeriod tmPrd= new WS_ESB_BusinessObjects.TimePeriod();
           tmPrd.StartDateTime = DateTime.now();
           tmPrd.EndDateTime = DateTime.now();
           tmPrd.StartDateTimeString = 'gkjhj';
           tmPrd.EndDateTimeString = 'gkjhj';
                
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
           eml.EmailAddress = 'asdff';
           eml.EmailDisplayName = indName;
           
           WS_ESB_BusinessObjects.Bank bnk = new WS_ESB_BusinessObjects.Bank();
           bnk.Name = 'dsf';
           bnk.DepositId = 'dsf';
           bnk.RoutingNumber = 'dsf';
           
           WS_ESB_BusinessObjects.BankPaymentSource bnkPmSrc = new WS_ESB_BusinessObjects.BankPaymentSource();
           bnkPmSrc.PaymentSourceCode = 'asdff';
           bnkPmSrc.PaymentSourceDescription = 'asdff';
           bnkPmSrc.AccountId = 'asdff';
           bnkPmSrc.AccountHolderName = 'asdff';
           bnkPmSrc.AccountHolderAddress = accHolAdd;
           bnkPmSrc.NotificationEmailAddress = eml;
           bnkPmSrc.Bank = bnk;
           bnkPmSrc.BankAccountType = 'asdff';
            
           WS_ESB_BusinessObjects.CreditCardPaymentSource ccPmSrc = new WS_ESB_BusinessObjects.CreditCardPaymentSource();
           ccPmSrc.PaymentSourceCode = 'asdf';
           ccPmSrc.PaymentSourceDescription = 'asdf';
           ccPmSrc.AccountId = 'asdf';
           ccPmSrc.AccountHolderName = 'asdf';
           ccPmSrc.AccountHolderAddress = accHolAdd;
           ccPmSrc.NotificationEmailAddress = eml;
           ccPmSrc.CreditVerificationValue = 'asdf';
           ccPmSrc.ExpirationMonth = 'asdf';
           ccPmSrc.ExpirationYear = 'asdf';
           ccPmSrc.CreditCardType = 'asdf';
            WS_ESB_BusinessObjects.DebitCardPaymentSource dcPmSrc = new WS_ESB_BusinessObjects.DebitCardPaymentSource();
           dcPmSrc.PaymentSourceCode = 'asdf';
           dcPmSrc.PaymentSourceDescription = 'asdf';
           dcPmSrc.AccountId = 'asdf';
           dcPmSrc.AccountHolderName = 'asdf';
           dcPmSrc.AccountHolderAddress = accHolAdd;
           dcPmSrc.NotificationEmailAddress = eml;
           
           WS_ESB_BusinessObjects.AccountId accId = new WS_ESB_BusinessObjects.AccountId();
           accId.PhoneNumberAsId = phNumId;
           accId.UniversalServiceId = '12345654';
           accId.AccountNumber = '7157543333';
           accId.DataSourceEnvironment = dsEnv;
           
           WS_ESB_BusinessObjects.Payment pmt = new WS_ESB_BusinessObjects.Payment();
           pmt.TransactionDate = Date.Today();
           pmt.TransactionAmount = qt; 
           pmt.ReferenceNumber = 'asdf';
           pmt.BatchId = 'asdf';
           pmt.BatchSequenceNumber = 'aa';
           pmt.PostDateTime = DateTime.now();
           pmt.PostedBy = 'asdf';
           pmt.NeverOnBillFlag = true;
           pmt.PaymentReason = 'asdf';
           pmt.PaymentMethod = 'asdf';
           pmt.BankPaymentSource = bnkPmSrc; 
           pmt.CreditCardPaymentSource = ccPmSrc;
           pmt.DebitCardPaymentSource = dcPmSrc;
           pmt.BillingAccountId = accId; 
           pmt.BillingAccountName = 'asd';
           pmt.BillingAddress = accHolAdd; 
           
           WS_ESB_BusinessObjects.CustomerPayment pmDtl = new WS_ESB_BusinessObjects.CustomerPayment();
           pmDtl.AccountId = accId; 
           pmDtl.Payment = new WS_ESB_BusinessObjects.Payment[]{};
           pmDtl.Payment.add(pmt); 
           //-------------------------------------------------------------------------------------------------------------------------------
           
           gtPmtResponse.Response.ExecutionContext = exCntxt;
           gtPmtResponse.Response.RequestCriteria = rqCtr;
           gtPmtResponse.Response.PaymentDetail = pmDtl;
           
           response.put('response_x', gtPmtResponse);
           }
  }