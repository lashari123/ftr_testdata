@isTest
global class WS_ESB_ManageColMockWSGAdjTTest implements WebServiceMock {
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
            
           WS_ESB_ManageCollection.ResponseContainer_GetAdjustment rcGtAdj = new WS_ESB_ManageCollection.ResponseContainer_GetAdjustment(); 
           rcGtAdj.Response = new WS_ESB_ManageCollection.Response_GetAdjustment();
           
           
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
           
           rcGtAdj.Response.ExecutionContext = new WS_ESB_ExecutionContext.ExecutionContext();
           rcGtAdj.Response.ExecutionContext.ExecutionStatus = exSts; 
           rcGtAdj.Response.ExecutionContext.ESBHeader = esbHdr;
           //-------------------------------------------------------------------------------------------------------------------------------
             
           rcGtAdj.Response.RequestCriteria = new WS_ESB_ManageCollection.RequestCriteria_GetAdjustment();
           //-------------------------------------------------------------------------------------------------------------------------------
           WS_ESB_BusinessObjects.Quantity qt = new WS_ESB_BusinessObjects.Quantity();
           qt.Amount = '24.50';
           qt.Units = '50';
           
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
           phNumId.SequenceNumber = 2;
           
           WS_ESB_BusinessObjects.AccountId accId = new WS_ESB_BusinessObjects.AccountId();
           accId.PhoneNumberAsId = phNumId;
           accId.UniversalServiceId = '12345654';
           accId.AccountNumber = '7157543333';
           accId.DataSourceEnvironment = dsEnv;
           
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
           
           WS_ESB_BusinessObjects.CodeDescriptionPair cdPr = new WS_ESB_BusinessObjects.CodeDescriptionPair();
           cdPr.Code = 'asdf';
           cdPr.Description = 'asdf';
           
           WS_ESB_BusinessObjects.Adjustment adj = new WS_ESB_BusinessObjects.Adjustment();
           adj.TransactionDate = Date.Today();
           adj.TransactionAmount = qt;
           adj.ReferenceNumber = 'asdf';
           adj.BatchId = 'asdff';
           adj.BatchSequenceNumber = '3';
           adj.PostDateTime = DateTime.now();
           adj.PostedBy = 'asdf';
           adj.NeverOnBillFlag = true;
           adj.AdjustmentType = 'asd';
           adj.Reason = cdPr;
           adj.Description = 'asdf';
           adj.BankName= 'asdf';
           adj.GLAccount = glAcc;
           adj.ChargeCode= 'asf';
           adj.ChargeCodeDescription= 'asdf';
           adj.TaxAmount = qt;
           adj.ApplicableTax = new WS_ESB_BusinessObjects.ApplicableTax[]{};
           adj.ApplicableTax.add(aplTax);
           adj.BillingAccountId = accId;
           adj.ParentCaseId = 'asdf';
           adj.ChildCaseId = 'asdf';
           adj.PostingStatus = 'asdf';
           adj.ChangeBalanceUponPosting = 'asdf';
           
           
           WS_ESB_BusinessObjects.AdjustmentDetail adjDtl = new WS_ESB_BusinessObjects.AdjustmentDetail();
           adjDtl.AccountId = accId;
           adjDtl.Adjustment = new WS_ESB_BusinessObjects.Adjustment[]{};
           adjDtl.Adjustment.add(adj);
           
           
           rcGtAdj.Response.AdjustmentDetail = new WS_ESB_BusinessObjects.AdjustmentDetail[]{};
           rcGtAdj.Response.AdjustmentDetail.add(adjDtl);
           //-------------------------------------------------------------------------------------------------------------------------------
           
           
            
            
            response.put('response_x', rcGtAdj);
           }
   }