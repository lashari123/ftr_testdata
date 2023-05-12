@isTest
global class WS_ESB_ManageColMockWebSerTest implements WebServiceMock {
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
          
           WS_ESB_ManageCollection.ResponseContainer_GetAccountsReceivable res = new WS_ESB_ManageCollection.ResponseContainer_GetAccountsReceivable();
           res.Response = new WS_ESB_ManageCollection.Response_GetAccountsReceivable();
           
           //---------------classes instantiated------------------
        WS_ESB_BusinessObjects.NorthAmericanTelephoneNumber norTelNum= new WS_ESB_BusinessObjects.NorthAmericanTelephoneNumber();
        norTelNum.NPA = 'sdf';
        norTelNum.NXX = 'sdf';
        norTelNum.Station = 'dfs';
        
        WS_ESB_BusinessObjects.DataSourceEnvironment dsEnv = new WS_ESB_BusinessObjects.DataSourceEnvironment();
        dsEnv.BillingSystem = 'Free';
        dsEnv.DataRegion = 'LF';
        dsEnv.DataRegionCode = 2;
        dsEnv.DataSource = 'dpi';
        dsEnv.DataEnvironment='dsf';
        
        WS_ESB_BusinessObjects.TelephoneNumber telNum = new WS_ESB_BusinessObjects.TelephoneNumber() ;
        telNum.Number_x = '7157543333';
        telNum.Extension = '234' ;
        
        WS_ESB_BusinessObjects.PhoneNumberAsId phNumId = new WS_ESB_BusinessObjects.PhoneNumberAsId() ;
        phNumId.TelephoneNumber = telNum;   
        phNumId.SequenceNumber = 2; 
        
        WS_ESB_BusinessObjects.RequestAccountId reqAccId = new WS_ESB_BusinessObjects.RequestAccountId();
        reqAccId.PhoneNumberAsId = phNumId;
        reqAccId.UniversalServiceId = 'asdffdsdfs';
        reqAccId.AccountNumber = '7157543333';
        reqAccId.DataSourceEnvironment = dsEnv; 
        
        WS_ESB_ManageCollection.RequestCriteria_GetAccountsReceivable reqGetAccRec = new WS_ESB_ManageCollection.RequestCriteria_GetAccountsReceivable();
        reqGetAccRec.AccountId = reqAccId;
        reqGetAccRec.IncludeBTNSummariesFlag = true;
        res.Response.RequestCriteria = reqGetAccRec;
        
        WS_ESB_ExecutionContext.ExecutionStatusMessage exStMes = new WS_ESB_ExecutionContext.ExecutionStatusMessage();
        exStMes.ExecutionStatusSeverity = 'asdf';
        exStMes.ExecutionStatusSource = 'asdf';
        exStMes.ExecutionStatusSourceOperation = 'asdf' ;
        exStMes.ExecutionStatusCode ='asdf' ;
        exStMes.ExecutionStatusDescription = 'asdf';
        exStMes.ExecutionStatusText = 'asdf';
        exStMes.ExecutionStatusTarget ='asdf' ;
        exStMes.ExecutionStatusMessage = new WS_ESB_ExecutionContext.ExecutionStatusMessage[]{};
        exStMes.ExecutionStatusMessage.add(exStMes);  
        
        
        WS_ESB_ExecutionContext.ExecutionStatus exSt = new WS_ESB_ExecutionContext.ExecutionStatus();
        exSt.ExecutionStatusSuccessFlag = true; 
        exSt.ExecutionStatusAction = 'sdf';
        exSt.ExecutionStatusMessage = new WS_ESB_ExecutionContext.ExecutionStatusMessage[]{};
        exSt.ExecutionStatusMessage.add(exStMes);
        
        
        WS_ESB_ExecutionContext.ProviderInfo prInfo = new WS_ESB_ExecutionContext.ProviderInfo();
        prInfo.ID = 'asdf';
        prInfo.Name='asdf';
        prInfo.ProviderType='asdf';
        prInfo.VersionID='asdf';
        prInfo.VersionDateTime= DateTime.now();
        prInfo.Description='asdf';
        prInfo.Location='asdf';
        prInfo.TransactionID='asdf';
        
        
        WS_ESB_ExecutionContext.ConsumerInfo conInfo = new WS_ESB_ExecutionContext.ConsumerInfo();
        conInfo.TrackingID = 'asd';
        conInfo.ApplicationID = 'asd';
        conInfo.EmployeeID ='asd';
        conInfo.UserID ='asd';
        conInfo.TransactionID ='asd';
        
        WS_ESB_ExecutionContext.TraceResult trRes = new WS_ESB_ExecutionContext.TraceResult();
        trRes.HostName = 'asd';
        trRes.Component = 'asd';
        trRes.DateTime_x = DateTime.now();
        trRes.Message = 'asd';
        
        WS_ESB_ExecutionContext.TraceSettings trSet = new WS_ESB_ExecutionContext.TraceSettings();
        trSet.TraceEnabled = true;
        trSet.Component = 'asdf';
        trSet.TraceLevel ='as';
        
        WS_ESB_BusinessObjects.Quantity  qt = new WS_ESB_BusinessObjects.Quantity();
        qt.Amount = '122.32';
        qt.Units ='23';
        
        WS_ESB_BusinessObjects.AccountId accId = new WS_ESB_BusinessObjects.AccountId();
        accId.PhoneNumberAsId = phNumId;
        accId.UniversalServiceId = 'asdfkjjj';
        accId.AccountNumber = '7157543333';
        accId.DataSourceEnvironment = dsEnv;
        
        WS_ESB_BusinessObjects.CitizensPostalAddress ctPosAdd= new WS_ESB_BusinessObjects.CitizensPostalAddress();
        ctPosAdd.StateOrProvince = 'asdf';
        ctPosAdd.Country = 'asdf';
        ctPosAdd.County = 'asdf';
        ctPosAdd.Locality = 'asdf';
        ctPosAdd.Postcode = 'asdf';
        
        WS_ESB_BusinessObjects.TimePeriod tmPrd = new WS_ESB_BusinessObjects.TimePeriod();
        tmPrd.StartDateTime = DateTime.now();
        tmPrd.EndDateTime = DateTime.now();
        tmPrd.StartDateTimeString = 'asdf';
        tmPrd.EndDateTimeString  = 'asdf';
        
        WS_ESB_BusinessObjects.IndividualName indName = new WS_ESB_BusinessObjects.IndividualName();
        indName.ValidFor =  tmPrd;
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
        eml.EmailAddress = 'asdf@dd.com';
        eml.EmailDisplayName = indName;
        
        WS_ESB_BusinessObjects.Bank bnk = new WS_ESB_BusinessObjects.Bank();
        bnk.Name = 'asdf';
        bnk.DepositId = 'asdf';
        bnk.RoutingNumber = 'asdf';
        
        WS_ESB_BusinessObjects.BankPaymentSource bkPmSrc = new WS_ESB_BusinessObjects.BankPaymentSource();
        bkPmSrc.PaymentSourceCode = 'dfa';
        bkPmSrc.PaymentSourceDescription = 'dfa';
        bkPmSrc.AccountId = 'dfa';
        bkPmSrc.AccountHolderName = 'dfa';
        bkPmSrc.AccountHolderAddress = ctPosAdd;
        bkPmSrc.NotificationEmailAddress = eml;
        bkPmSrc.Bank = bnk;
        bkPmSrc.BankAccountType = 'dfa';
        
        WS_ESB_BusinessObjects.CreditCardPaymentSource  ccPmSrc = new WS_ESB_BusinessObjects.CreditCardPaymentSource();
        ccPmSrc.PaymentSourceCode = 'asdf';
        ccPmSrc.PaymentSourceDescription = 'asdf';
        ccPmSrc.AccountId = 'asdf';
        ccPmSrc.AccountHolderName = 'asdf';
        ccPmSrc.AccountHolderAddress = ctPosAdd;
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
        dcPmSrc.AccountHolderAddress = ctPosAdd;
        dcPmSrc.NotificationEmailAddress = eml;
       
        
        WS_ESB_BusinessObjects.Payment pmt = new  WS_ESB_BusinessObjects.Payment();
        pmt.TransactionDate = Date.Today();
        pmt.TransactionAmount = qt;
        pmt.ReferenceNumber = 'asdf';
        pmt.BatchId = 'asdf';
        pmt.BatchSequenceNumber = '1';
        pmt.PostDateTime = DateTime.now();
        pmt.PostedBy  = 'asdf';
        pmt.NeverOnBillFlag = true;
        pmt.PaymentReason = 'asdf';
        pmt.PaymentMethod  = 'asdf';
        pmt.BankPaymentSource = bkPmSrc;
        pmt.CreditCardPaymentSource = ccPmSrc;
        pmt.DebitCardPaymentSource = dcPmSrc;
        pmt.BillingAccountId = accId;
        pmt.BillingAccountName = 'asdf';
        
        WS_ESB_BusinessObjects.CurrentBillAmounts curBillAmt = new WS_ESB_BusinessObjects.CurrentBillAmounts();
        curBillAmt.NonProRatedChargesAmount = qt;
        curBillAmt.ProRatedChargesAndCurrentAdjustmentsAmount = qt;
        curBillAmt.TollAmount = qt;
        curBillAmt.TaxAmount = qt;
        
        WS_ESB_BusinessObjects.CodeDescriptionPair cDesPr= new WS_ESB_BusinessObjects.CodeDescriptionPair();
        cDesPr.Code = 'asdf';
        cDesPr.Description = 'asdf';
        
        WS_ESB_BusinessObjects.ApplicableTax aplTax= new WS_ESB_BusinessObjects.ApplicableTax();
        aplTax.TaxCode = 'asdf';
        aplTax.TaxAmount = 'asdf';
        aplTax.ProratedTaxAmount = 'asdf';
        
        WS_ESB_BusinessObjects.GLAccountingEntity glAccEnt = new WS_ESB_BusinessObjects.GLAccountingEntity();
        glAccEnt.GLAccountingEntityId = 'adsf';
        glAccEnt.Description = 'adsf';
        
        WS_ESB_BusinessObjects.GLAccountingCategory glAccCat = new WS_ESB_BusinessObjects.GLAccountingCategory();
        glAccCat.GLAccountingCategoryId = 'asdf';
        glAccCat.Description = 'sdf';
        
        WS_ESB_BusinessObjects.GLAccount glAcc = new WS_ESB_BusinessObjects.GLAccount();
        glAcc.GLAccountId = 'asdf';
        glAcc.GLAccountName = 'asdf';
        glAcc.GLAccountingEntity = glAccEnt;
        glAcc.GLAccountingCategory = glAccCat;
        glAcc.GLAccountingPresentationEntity = glAccEnt;
        
        WS_ESB_BusinessObjects.Adjustment adj  = new WS_ESB_BusinessObjects.Adjustment();
        adj.TransactionDate = Date.Today();
        adj.TransactionAmount = qt;
        adj.ReferenceNumber = '2144442233';
        adj.BatchId = 'asdf';
        adj.BatchSequenceNumber = '2';
        adj.PostDateTime = DateTime.now();
        adj.PostedBy = 'asdf';
        adj.NeverOnBillFlag = true;
        adj.AdjustmentType = 'asdf';
        adj.Reason = cDesPr;
        adj.Description = 'asdf';
        adj.BankName = 'asdf';
        adj.GLAccount = glAcc;
        adj.ChargeCode = 'ads';
        adj.ChargeCodeDescription ='adsf';
        adj.TaxAmount = qt;
        adj.ApplicableTax = new WS_ESB_BusinessObjects.ApplicableTax[]{};
        adj.ApplicableTax.add(aplTax);
        adj.BillingAccountId = accId;
        adj.ParentCaseId ='adsf';
        adj.ChildCaseId ='adsf';
        adj.PostingStatus ='adsf';
        adj.ChangeBalanceUponPosting ='adsf';
        
        WS_ESB_BusinessObjects.AccountsReceivableDetail accRecDet = new WS_ESB_BusinessObjects.AccountsReceivableDetail();
        accRecDet.TransactionDate ='';
        accRecDet.PostDateTime ='';
        accRecDet.Amount = '12.22';
        accRecDet.RemainingAmount = '3.33';
        accRecDet.Tax = new WS_ESB_BusinessObjects.Tax();
        accRecDet.GLAccount = glAcc;
        accRecDet.Payment = new WS_ESB_BusinessObjects.Payment[]{};
        accRecDet.Payment.add(pmt);
        accRecDet.Adjustment = new WS_ESB_BusinessObjects.Adjustment[]{};
        accRecDet.Adjustment.add(adj);
        
        WS_ESB_BusinessObjects.AccountsReceivable accRec = new WS_ESB_BusinessObjects.AccountsReceivable();
        accRec.BillDate = '';
        accRec.BillCycle = '2days';
        accRec.BillingAccountId = accId;
        accRec.PriorBillAmount = qt;
        accRec.PriorBillAdjustmentAmount = qt;
        accRec.TotalPaymentAmount = qt;
        accRec.LastPaymentDate = '';
        accRec.CurrentBillAmounts = curBillAmt;
        accRec.OriginalAmount = qt;
        accRec.AccountsReceivableDetail = new WS_ESB_BusinessObjects.AccountsReceivableDetail[]{};
        accRec.AccountsReceivableDetail.add(accRecDet);
        
        WS_ESB_ExecutionContext.ESBHeader esHdr = new WS_ESB_ExecutionContext.ESBHeader();
        esHdr.ConsumerInfo = conInfo;
        esHdr.ProviderInfo = new WS_ESB_ExecutionContext.ProviderInfo[]{};
        esHdr.ProviderInfo.add(prInfo);
        esHdr.Heartbeat = true;
        esHdr.TrackingID = 'up';
        esHdr.TraceResults = new WS_ESB_ExecutionContext.TraceResults();
        esHdr.TraceResults.TraceResult = new WS_ESB_ExecutionContext.TraceResult[]{};
        esHdr.TraceResults.TraceResult.add(trRes);
        esHdr.TraceSettings  = trSet;
        
        WS_ESB_BusinessObjects.PendingAccountsReceivable penAccRec = new WS_ESB_BusinessObjects.PendingAccountsReceivable();
        penAccRec.UnPostedPaymentAmount = qt;
        penAccRec.PostedCurrentAdjustment = qt;
        penAccRec.UnPostedPriorAdjustment = qt;
        penAccRec.UnPostedCurrentAdjustment = qt;
        
        WS_ESB_ExecutionContext.ExecutionContext exCtxt = new WS_ESB_ExecutionContext.ExecutionContext();
        exCtxt.ExecutionStatus = exSt;
        exCtxt.ESBHeader = esHdr;
        
        WS_ESB_ManageCollection.RequestCriteria_GetAccountsReceivable rqCrt = new WS_ESB_ManageCollection.RequestCriteria_GetAccountsReceivable();
        rqCrt.AccountId = reqAccId;
        rqCrt.IncludeBTNSummariesFlag = true;
    
           //-------------end of initialized classes
           
           
        res.Response.ExecutionContext = exCtxt;
        res.Response.RequestCriteria = rqCrt;                                               
        res.Response.AccountId = accId;
        res.Response.AccountsReceivable = new WS_ESB_BusinessObjects.AccountsReceivable[]{};
        res.Response.AccountsReceivable.add(accRec);
        res.Response.PendingAccountsReceivable = penAccRec;
             
       response.put('response_x', res);
   }
}