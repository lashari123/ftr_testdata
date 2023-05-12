@isTest
global class WS_ESB_ManageAccountGtMemoMockWebSerTest implements WebServiceMock {
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
           
           WS_ESB_ManageAccount.ManageAccountGetMemoResponse manAccResp = new WS_ESB_ManageAccount.ManageAccountGetMemoResponse();
           
           //---------------------------------------------------------------------------------------------------------------------------
           WS_ESB_ExecutionContext.ExecutionStatusMessage exStMes = new WS_ESB_ExecutionContext.ExecutionStatusMessage();
           exStMes.ExecutionStatusSeverity = 'asdf';
           exStMes.ExecutionStatusSource = 'asdf';
           exStMes.ExecutionStatusSourceOperation = 'asdf';
           exStMes.ExecutionStatusCode = 'asdf';
           exStMes.ExecutionStatusDescription = 'asdf';
           exStMes.ExecutionStatusText = 'asdf';
           exStMes.ExecutionStatusTarget = 'asdf';
           
           
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
           //---------------------------------------------------------------------------------------------------------------------------
           WS_ESB_BusinessObjects.Quantity qt = new WS_ESB_BusinessObjects.Quantity();
           qt.Amount = 'asdf';
           qt.Units = 'asdf';
           
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
           
           WS_ESB_ManageAccount.MemoCriteria memCtr= new WS_ESB_ManageAccount.MemoCriteria();
           memCtr.MemoTemplateName = 'asdf';
           memCtr.SequenceNumber = 'asdf';
           memCtr.Key = phNumId;
           memCtr.MemoSectionName = 'asdf';
           memCtr.ReturnAllMemoSectionsFlag = true;
           memCtr.MaximumMemoCount = 2;
           
           WS_ESB_ManageAccount.GetMemoRequestCriteria reqCtr = new WS_ESB_ManageAccount.GetMemoRequestCriteria();
           reqCtr.AccountId = reqAccId;
           reqCtr.MemoCriteria = memCtr;
           //---------------------------------------------------------------------------------------------------------------------------
           WS_ESB_BusinessObjects.MemoSection memSec = new WS_ESB_BusinessObjects.MemoSection();
           memSec.MemoSectionName = 'asdf';
           memSec.MemoText = 'asdf';
           
           WS_ESB_BusinessObjects.MemoTextLineProperties memTxtLnProp = new WS_ESB_BusinessObjects.MemoTextLineProperties();
           memTxtLnProp.EditableFlag = true;
           memTxtLnProp.SequenceNumber = 2;
           
           WS_ESB_BusinessObjects.MemoNote memNt = new WS_ESB_BusinessObjects.MemoNote();
           memNt.MemoTextNote = 'asdf';
           memNt.MemoTextLineProperties = new WS_ESB_BusinessObjects.MemoTextLineProperties[]{};
           memNt.MemoTextLineProperties.add(memTxtLnProp);
           
           WS_ESB_BusinessObjects.MemoFlagNameEnum flgName = new WS_ESB_BusinessObjects.MemoFlagNameEnum();
           flgName.CustomerChargedForUnOrderedProduct = 'asdf';
           flgName.CreditCardSurchargeIsMoreThanQuoted = 'asdf';
           flgName.CustomerMisunderstoodTheFunctionality = 'asdf';
           flgName.CasualDialChargeIsMoreThanQuoted = 'asdf';
           flgName.EquipmentChargeIsMoreThanQuoted = 'asdf';
           flgName.TollFreeCallCharged = 'asdf';
           flgName.CustomerMisleadedByTelemarketer = 'asdf';
           flgName.CallPlanRateNotAsQuoted = 'asdf';
        
           WS_ESB_BusinessObjects.MemoFlag MemFlg = new WS_ESB_BusinessObjects.MemoFlag();
           MemFlg.EditableFlag = true;
           //MemFlg.FlagName = flgName;
           MemFlg.FlagValue = true;
           
           WS_ESB_BusinessObjects.MemoAmount memAmt = new  WS_ESB_BusinessObjects.MemoAmount();
           memAmt.EditableFlag = true;
           memAmt.Amount = 2.55;
        
           WS_ESB_BusinessObjects.MemoDate memDt = new WS_ESB_BusinessObjects.MemoDate();
           memDt.EditableFlag = true;
           memDt.Date_x = Date.Today();
           
           WS_ESB_BusinessObjects.AccountMemo accMem = new WS_ESB_BusinessObjects.AccountMemo();
           accMem.MemoTemplateName = 'asdf';
           accMem.MemoTemplateVersionId = 1;
           accMem.SequenceNumber = 2;
           accMem.MemoLockedFlag = true;
           accMem.UserID = 'asdf';
           accMem.CreateDateTime = DateTime.now();
           accMem.Key = phNumId;
           accMem.HashKey = 'asdf';
           accMem.MemoSection = new WS_ESB_BusinessObjects.MemoSection[]{};
           accMem.MemoSection.add(memSec);
           accMem.MemoType = 'asdf';
           accMem.MemoID = 'asdf';
           accMem.MemoAction = 'asdf';
           accMem.Category = 'asdf';
           accMem.SubCategory = 'asdf';
           accMem.Name = 'asdf';
           accMem.ApplicationID = 'asdf';
           accMem.EmployeeID = 'asdf';
           accMem.EmailAddress = 'asdf';
           accMem.MemoNote = memNt;
           accMem.MemoFlag = new WS_ESB_BusinessObjects.MemoFlag[]{};
           accMem.MemoFlag.add(MemFlg);
           accMem.PaymentAmount = memAmt;
           accMem.PaymentDueDate = memDt;
           //---------------------------------------------------------------------------------------------------------------------------
           WS_ESB_BusinessObjects.ProspectMemo prosMem = new WS_ESB_BusinessObjects.ProspectMemo();
           prosMem.AccountMemo = new WS_ESB_BusinessObjects.AccountMemo[]{};
           prosMem.AccountMemo.add(accMem);
           prosMem.MemoType = 'asdf';
           prosMem.MemoID = 'asdf';
           prosMem.MemoAction = 'asdf';
           prosMem.Category = 'asdf';
           prosMem.SubCategory = 'asdf';
           prosMem.Name = 'asdf';
           prosMem.ApplicationID = 'asdf';
           prosMem.EmployeeID = 'asdf';
           prosMem.EmailAddress = 'asdf';
           
           //---------------------------------------------------------------------------------------------------------------------------
           manAccResp.ExecutionContext = exCntxt;
           manAccResp.RequestCriteria = reqCtr;
           manAccResp.AccountMemo = new WS_ESB_BusinessObjects.AccountMemo[]{};
           manAccResp.AccountMemo.add(accMem);
           manAccResp.ProspectMemo = new WS_ESB_BusinessObjects.ProspectMemo[]{};
           manAccResp.ProspectMemo.add(prosMem);
           
           response.put('response_x', manAccResp);
         }
    }