@isTest
global class WS_ESB_ManageAccountGetHG implements WebServiceMock {
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
            
            WS_ESB_ManageAccount.ManageAccountGetHuntGroupsResponse res = new WS_ESB_ManageAccount.ManageAccountGetHuntGroupsResponse();
            
            //----------------------------------------------------------------------------------------------------------------------------
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
            //----------------------------------------------------------------------------------------------------------------------------
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
            
            WS_ESB_BusinessObjects.HuntGroupMember ghMemb = new WS_ESB_BusinessObjects.HuntGroupMember();
            ghMemb.PhoneNumber = telNum;
            ghMemb.SequenceNumber = 'asdf';
            
            WS_ESB_BusinessObjects.HuntGroupMembers hgMbs = new WS_ESB_BusinessObjects.HuntGroupMembers();
            hgMbs.HuntGroupMember = new WS_ESB_BusinessObjects.HuntGroupMember[]{};
            hgMbs.HuntGroupMember.add(ghMemb);
            
            WS_ESB_BusinessObjects.HuntGroup hgGrp = new WS_ESB_BusinessObjects.HuntGroup();
            hgGrp.Id = 1;
            hgGrp.Type = 'asdf';
            hgGrp.Count = 2;
            hgGrp.PilotPhoneNumber = telNum;
            hgGrp.HuntGroupMembers = hgMbs;
            
            WS_ESB_BusinessObjects.HuntGroups hgs = new WS_ESB_BusinessObjects.HuntGroups();
            hgs.HuntGroup = new WS_ESB_BusinessObjects.HuntGroup[]{};
            hgs.HuntGroup.add(hgGrp);
            //----------------------------------------------------------------------------------------------------------------------------
            WS_ESB_ManageAccount.GetHuntGroupsRequestCriteria  hgReqCri = new WS_ESB_ManageAccount.GetHuntGroupsRequestCriteria();
            hgReqCri.TelephoneNumber = telNum;
            hgReqCri.DataRegion = 'LF';
            //----------------------------------------------------------------------------------------------------------------------------
            res.ExecutionContext = exCntxt;
            res.HuntGroups = hgs;
            res.RequestCriteria = hgReqCri;
            
            response.put( 'response_x', res);
     }
 }