@isTest(seeAllData = true)
private class Account_AccountsReceivableTest {
       
        static testmethod void unitTest0(){
            Account_AccountsReceivable.AccountsReceivableInfo ari = new Account_AccountsReceivable.AccountsReceivableInfo();
            Account_AccountsReceivable.TrendingData trData = new Account_AccountsReceivable.TrendingData(10, 2010, 60.00);
            Account_AccountsReceivable.TrendingData1 trData1 = new Account_AccountsReceivable.TrendingData1(10, 2010, 60.00);
            Account_AccountsReceivable.AgingInformation agInfo = new Account_AccountsReceivable.AgingInformation('50', 30.89);
        }
    
    static testmethod void unitTest1(){
        
        try
        {
        
        //List<Account> ac1 =  [SELECT Id, BTNSequenceID__c, Library_Id__c, DPI_ServiceType__c FROM Account WHERE BTNSequenceID__c  != null OR Library_Id__c !=null LIMIT  1];
        Account ac1 = new Account();
        ac1.Name = 'Test Account';
        ac1.ParentSequenceId__c = '1234567890.0';
        insert ac1;
        List<Service_Type__c> ser =[SELECT OBP_elig__c,service_type__c FROM Service_Type__c WHERE service_type__c != null OR OBP_elig__c != null LIMIT 1];

            
        PageReference pageRef = page.Account_AccountsReceivableInformation;  //Page.Account_RedirectAccountsReceivable;
        Test.setCurrentPage(pageRef);
        ApexPages.currentPage().getParameters().put('accoutId',ac1.id);
       
        } catch(Exception ex)
        {    }
        
        Test.setMock(WebServiceMock.class, new WS_ESB_ManageColMockWSGPMTTest());
        Account_AccountsReceivable accRec = new Account_AccountsReceivable();
        
        Test.setMock(WebServiceMock.class, new WS_ESB_ManageColMockWSGAdjTTest());
        pagereference pr = accRec.calculateAdjustmentvalues();
        
        Account_AccountsReceivable.isSummaryNumber = true;
        //accRec.strBTNNumber = '7157543333';
        accRec.ClickBTN =true;
        accRec.bolIsSummarySearch = true;
        accRec.IncludeBTNSummariesFlag = true;
        
        List<Account_AccountsReceivable.AccountsReceivableInfo> arec = accRec.getAccountsReceivable();
        
        Account_AccountsReceivable.Adjustments adj = new Account_AccountsReceivable.Adjustments();
        adj.ChargeCode = 'newcharge';
        adj.DateAdj = 'today';
        adj.AccountAdj = 'myaccount';
        adj.Amount = 25.25;
        adj.BatchName ='mybatch';
        adj.ReferenceNumber ='23';
        adj.Posted_By ='Me';
        adj.Type='pretty';
        adj.Description = 'good sense of humour outgoing funny';
        adj.TransactionDate ='today';
        
        
        
        WS_ESB_BusinessObjects.Quantity qt = new WS_ESB_BusinessObjects.Quantity();
        qt.Amount = '23.45';
        qt.Units  = '23.45';
        
        WS_ESB_BusinessObjects.CurrentBillAmounts curBillAmts = new WS_ESB_BusinessObjects.CurrentBillAmounts();
        curBillAmts.NonProRatedChargesAmount = qt;
        curBillAmts.ProRatedChargesAndCurrentAdjustmentsAmount = qt;
        curBillAmts.TollAmount = qt;
        curBillAmts.TaxAmount = qt;
        
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
        
        
        WS_ESB_BusinessObjects.Tax tx = new WS_ESB_BusinessObjects.Tax();
        tx.TaxCode = 'asdf';
        tx.TaxDescription = 'asdf';
        tx.TaxCategory = 'asdf';
        tx.TaxPercentage = 'asdf';
        tx.TaxingSequence = 'asdf';
        
        WS_ESB_BusinessObjects.GLAccountingEntity  glaEnt = new WS_ESB_BusinessObjects.GLAccountingEntity();
        glaEnt.GLAccountingEntityId = 'asdf';
        glaEnt.Description = 'asdf';
        
        WS_ESB_BusinessObjects.GLAccountingCategory glCat = new WS_ESB_BusinessObjects.GLAccountingCategory();
        glCat.GLAccountingCategoryId = 'asdf';
        glCat.Description = 'asdf';
        
        
        WS_ESB_BusinessObjects.GLAccountingEntity glPrEnt = new WS_ESB_BusinessObjects.GLAccountingEntity();
        glPrEnt.GLAccountingEntityId = 'asdf';
        glPrEnt.Description = 'asdf';
        
        WS_ESB_BusinessObjects.GLAccount glAcc = new WS_ESB_BusinessObjects.GLAccount();
        glAcc.GLAccountId = 'asdf';
        glAcc.GLAccountName ='asdf';
        glAcc.GLAccountingEntity = glaEnt;
        glAcc.GLAccountingCategory = glCat;
        glAcc.GLAccountingPresentationEntity = glPrEnt;
        
        WS_ESB_BusinessObjects.AddressText adrTxt = new WS_ESB_BusinessObjects.AddressText();
        adrTxt.AddressText ='asdf';
        adrTxt.SequenceNumber = 2;
        
        WS_ESB_BusinessObjects.CitizensPostalAddress  czPstAdd = new WS_ESB_BusinessObjects.CitizensPostalAddress();
        czPstAdd.StateOrProvince = 'asdf';
        czPstAdd.Country = 'asdf';
        czPstAdd.County = 'asdf';
        czPstAdd.AddressText = new WS_ESB_BusinessObjects.AddressText[]{};
        czPstAdd.AddressText.add(adrTxt);
        czPstAdd.Locality = 'asdf';
        czPstAdd.Postcode = 'asdf';
        
        WS_ESB_BusinessObjects.TimePeriod tmPrd = new WS_ESB_BusinessObjects.TimePeriod();
        tmPrd.StartDateTime = DateTime.now();
        tmPrd.EndDateTime = DateTime.now();
        tmPrd.StartDateTimeString = 'asdf';
        tmPrd.EndDateTimeString = 'asdf';
        
        WS_ESB_BusinessObjects.IndividualName indNm = new WS_ESB_BusinessObjects.IndividualName();
        indNm.ValidFor = tmPrd;
        indNm.FormattedName = 'asdf';
        indNm.LegalName = 'asdf';
        indNm.AristocraticTitle = 'asdf';
        indNm.FormOfAddress = 'asdf';
        indNm.Generation = 'asdf';
        indNm.GivenNames = 'asdf';
        indNm.PreferredGivenName = 'asdf';
        indNm.MiddleNames = 'asdf';
        indNm.FamilyNamePrefix = 'asdf';
        indNm.FamilyNames = 'asdf';
        indNm.FamilyGeneration = 'asdf';
        indNm.Qualifications = 'asdf';
        
        WS_ESB_BusinessObjects.Email eml = new WS_ESB_BusinessObjects.Email();
        eml.EmailAddress = 'asdf';
        eml.EmailDisplayName = indNm;
        
        WS_ESB_BusinessObjects.Bank bnk = new WS_ESB_BusinessObjects.Bank();
        bnk.Name ='adsf';
        bnk.DepositId ='adsf';
        bnk.RoutingNumber ='adsf';
        
        WS_ESB_BusinessObjects.BankPaymentSource bmSrc = new WS_ESB_BusinessObjects.BankPaymentSource();
        bmSrc.PaymentSourceCode = 'asdf';
        bmSrc.PaymentSourceDescription = 'asdf';
        bmSrc.AccountId = 'asdf';
        bmSrc.AccountHolderName = 'asdf';
        bmSrc.AccountHolderAddress = czPstAdd;
        bmSrc.NotificationEmailAddress = eml;
        bmSrc.Bank = bnk;
        bmSrc.BankAccountType = 'asdf';
    
        WS_ESB_BusinessObjects.CreditCardPaymentSource ccSrc = new WS_ESB_BusinessObjects.CreditCardPaymentSource();
        ccSrc.PaymentSourceCode = 'asdf';
        ccSrc.PaymentSourceDescription = 'asdf';
        ccSrc.AccountId = 'asdf';
        ccSrc.AccountHolderName = 'asdf';
        ccSrc.AccountHolderAddress = czPstAdd;
        ccSrc.NotificationEmailAddress = eml;
        ccSrc.CreditVerificationValue = 'asdf';
        ccSrc.ExpirationMonth = 'asdf';
        ccSrc.ExpirationYear = 'asdf';
        ccSrc.CreditCardType = 'asdf';
        
        WS_ESB_BusinessObjects.DebitCardPaymentSource dbSrc = new WS_ESB_BusinessObjects.DebitCardPaymentSource();
        dbSrc.PaymentSourceCode = 'sadf';
        dbSrc.PaymentSourceDescription = 'sadf';
        dbSrc.AccountId = 'sadf';
        dbSrc.AccountHolderName = 'sadf';
        dbSrc.AccountHolderAddress = czPstAdd;
        dbSrc.NotificationEmailAddress = eml;
        
        WS_ESB_BusinessObjects.Payment pmt = new WS_ESB_BusinessObjects.Payment();
        pmt.TransactionDate = Date.Today();
        pmt.TransactionAmount = qt; 
        pmt.ReferenceNumber = 'asdf';
        pmt.BatchId = 'asdf';
        pmt.BatchSequenceNumber = '2';
        pmt.PostDateTime = DateTime.now();
        pmt.PostedBy = 'asdf';
        pmt.NeverOnBillFlag = true;
        pmt.PaymentReason = 'asdf';
        pmt.PaymentMethod = 'asdf';
        pmt.BankPaymentSource = bmSrc;
        pmt.CreditCardPaymentSource = ccSrc;
        pmt.DebitCardPaymentSource = dbSrc;
        pmt.BillingAccountId = accId;
        pmt.BillingAccountName  = 'asdf';
        pmt.BillingAddress = czPstAdd;
        
        WS_ESB_BusinessObjects.CodeDescriptionPair cdPr = new WS_ESB_BusinessObjects.CodeDescriptionPair();
        cdPr.Code = 'sdf';
        cdPr.Description = 'asdf';
        
        WS_ESB_BusinessObjects.ApplicableTax aplTx = new WS_ESB_BusinessObjects.ApplicableTax();
        aplTx.TaxCode = 'asdf';
        aplTx.TaxAmount = '88';
        aplTx.ProratedTaxAmount = '67';
        
        WS_ESB_BusinessObjects.Adjustment adjBO = new WS_ESB_BusinessObjects.Adjustment();
        adjBO.TransactionDate = Date.Today();
        adjBO.TransactionAmount = qt; 
        adjBO.ReferenceNumber  = 'asdf';
        adjBO.BatchId  = 'asdf';
        adjBO.BatchSequenceNumber = '1';
        adjBO.PostDateTime = DateTime.now();
        adjBO.PostedBy  = 'asdf';
        adjBO.NeverOnBillFlag = true;
        adjBO.AdjustmentType  = 'asdf';
        adjBO.Reason = cdPr;
        adjBO.Description  = 'asdf';
        adjBO.BankName  = 'asdf';
        adjBO.GLAccount = glAcc;
        adjBO.ChargeCode  = 'asdf';
        adjBO.ChargeCodeDescription  = 'asdf';
        adjBO.TaxAmount = qt;
        adjBO.ApplicableTax = new WS_ESB_BusinessObjects.ApplicableTax[]{}; 
        adjBO.ApplicableTax.add(aplTx);
        adjBO.BillingAccountId = accId; 
        adjBO.ParentCaseId  = 'asdf';
        adjBO.ChildCaseId  = 'asdf';
        adjBO.PostingStatus  = 'asdf';
        adjBO.ChangeBalanceUponPosting  = 'asdf';
    
        WS_ESB_BusinessObjects.AccountsReceivableDetail accRecDtl = new  WS_ESB_BusinessObjects.AccountsReceivableDetail();
        accRecDtl.TransactionDate = '';
        accRecDtl.PostDateTime = '';
        accRecDtl.Amount = '12345654';
        accRecDtl.RemainingAmount = '12345654';
        accRecDtl.Tax =tx;
        accRecDtl.GLAccount = glAcc;
        accRecDtl.Payment = new WS_ESB_BusinessObjects.Payment[]{};
        accRecDtl.Payment.add(pmt); 
        accRecDtl.Adjustment = new WS_ESB_BusinessObjects.Adjustment[]{};
        accRecDtl.Adjustment.add(adjBO);
    
        WS_ESB_BusinessObjects.AccountsReceivable ar = new WS_ESB_BusinessObjects.AccountsReceivable();
        ar.BillDate = '';
        ar.BillCycle ='asdf';
        ar.BillingAccountId = accId;
        ar.PriorBillAmount = qt;
        ar.PriorBillAdjustmentAmount = qt;
        ar.TotalPaymentAmount = qt;
        ar.LastPaymentDate = '';
        ar.CurrentBillAmounts = curBillAmts;
        ar.OriginalAmount = qt;
        ar.AccountsReceivableDetail = new WS_ESB_BusinessObjects.AccountsReceivableDetail[]{};
        ar.AccountsReceivableDetail.add(accRecDtl);
        
    
        
        Account_AccountsReceivable.AccountsReceivableInfo  arInfo = new Account_AccountsReceivable.AccountsReceivableInfo();
        arInfo.DST_Eligible = true;
        arInfo.BillDate = Date.Today();
        arInfo.BillDateString = 'yep';
        arInfo.PhoneNumber = '12332323';
        arInfo.BillCycle = 'dont pay';
        arInfo.LastPaymentDate = Date.Today();
        arInfo.LastPayment = '24.00';
        arInfo.PriorBill = 25.00;
        arInfo.TotalPayments = 35.00;
        arInfo.TotalAdjustments = 60.00;
        arInfo.NetBill = 125.00;
        arInfo.CurrentAdjLocalSvcs =35.00;
        arInfo.AdjLocalSvcs = 26.00;
        arInfo.CurrentPPOCC = 15.00;
        arInfo.PPOCC = 12.00;
        arInfo.TollCharges = 55.00;
        arInfo.TotalTaxes = 56.00;
        arInfo.Balance = 60.00;
        arInfo.lstBillString = new String[]{'asdf'};
//      arInfo.acc = ac1;
        
        
        WS_ESB_BusinessObjects.PendingAccountsReceivable penAcRec = new WS_ESB_BusinessObjects.PendingAccountsReceivable();
        penAcRec.UnPostedPaymentAmount = qt;
        penAcRec.PostedCurrentAdjustment = qt;
        penAcRec.UnPostedPriorAdjustment = qt;
        penAcRec.UnPostedCurrentAdjustment = qt;
        
        Test.setMock(WebServiceMock.class, new WS_ESB_ManageAccountMockWebSerTest());
        System.debug(JSON.serializePretty(ar));
        system.debug(JSON.SerializePretty(penAcRec));
        //Account_AccountsReceivable.AccountsReceivableInfo accRec2 = new Account_AccountsReceivable.AccountsReceivableInfo('20318758050', ar, penAcRec);
        //System.debug(JSON.serializePretty(accRec2));
        
        List<Account_AccountsReceivable.Adjustments> lAdj = new List<Account_AccountsReceivable.Adjustments>();
        List<Account_AccountsReceivable.PaymentInfoInternal> payInfo1 = new List<Account_AccountsReceivable.PaymentInfoInternal>();
        Account_AccountsReceivable.PaymentInfoInternal payInfoInd =  new Account_AccountsReceivable.PaymentInfoInternal();
        /*payInfoInd.Post_Pay_Date = DateTime.now();
        payInfoInd.Deposit_Id= 'asdf';
        payInfoInd.Posted_Ref= 'asdf';
        payInfoInd.Posted_By= 'asdf';
        payInfoInd.Batch_Name= 'asdf';
        payInfoInd.PostDate = 'asdf';*/
        List<Account_AccountsReceivable.AccountsReceivableInfo> lstAccRec = new List<Account_AccountsReceivable.AccountsReceivableInfo>();
        List<Account_AccountsReceivable.TrendingData> lstTrd  = accRec.getAccountsReceivableTrending();
        String lstTrd1  = accRec.getAccountsReceivableTrending1();
        List<Account_AccountsReceivable.AgingInformation>  lstAgInf = accRec.getAgingInformation();
//      accRec.acc = ac1;
        
        for( integer a=0; a<=3; a++){
            Account_AccountsReceivable.Adjustments adj1 = new Account_AccountsReceivable.Adjustments();
            adj1.DateAdj= 'today';
            adj1.AccountAdj='adj'+a;
            adj1.Amount= 2.11+a;
            lAdj.add(adj1);
         } 
        accRec.lstAdjustments = lAdj; 
        accRec.lstAdjustment = lAdj;
        
        for( integer b=0; b<=3; b++){  
              account_AccountsReceivable.PaymentInfoInternal payIn1 = new Account_AccountsReceivable.PaymentInfoInternal( );
              payIn1.Post_Pay_Date = DateTime.now()-b;
              payIn1.Deposit_Id= 'asdf';
              payIn1.Posted_Ref= 'asdf'; 
              payIn1.Posted_By= 'asdf';
              payIn1.Batch_Name= 'asdf';
              payIn1.PostDate = 'asdf';   
              payIn1.Billing_Number = 'newbill'+string.valueof(b);
              payIn1.Payement_Rcvd_Date = Date.Today()-b;
              payIn1.Posted_Amount = 100+b;
              payIn1.Posted_Pay_Type = 'post'+string.valueof(b);                                                                                                                       
              payInfo1.add(payIn1);  
              if(b==3){
                payInfo1.sort();
              }                                                                                                               
         }  
         
         
         Account_AccountsReceivable.lstPayments = payInfo1;
         Account_AccountsReceivable.isSummaryNumber = true;
         accRec.ClickBTN = true;
         accRec.actualRecordList = payInfo1;
         accRec.bolIsSummarySearch = true;
         accRec.IncludeBTNSummariesFlag = true;
        
         for( integer a=0; a<=3; a++){
            Account_AccountsReceivable.AccountsReceivableInfo accRec1 = new Account_AccountsReceivable.AccountsReceivableInfo();
            accRec1.BillDate = Date.Today()+a;
            accRec1.BillDateString = 'today';
            accRec1.PhoneNumber = '715754333'+string.valueof(a);    
            lstAccRec.add(accRec1);
         }
         
         accRec.lstAccountsReceivable = lstAccRec;
         
        accRec.prevPayments();
        accRec.nextPayments();
        accRec.prevAdjustments();
        accRec.nextAdjustments();
        
        boolean b1 = accRec.gethasNextPayments();  
        boolean b3 = accRec.gethasPrevPayments();
        boolean b4 = accRec.gethasNextAdjustments();
        boolean b2 = accRec.gethasPrevAdjustments(); 
        
        integer a1 = accRec.getStartingNumber();
        integer a2 = accRec.getActualRecordSize();
        integer a3 = accRec.getTotalNumberOfPages();
        integer a4 = accRec.getCurrentNumberOfPage();
        integer a5 = accRec.getStartingNumber1();
        integer a6 = accRec.getactualRecordSize1();
        integer a7 = accRec.getTotalNumberOfPages1();
        integer a8 = accRec.getCurrentNumberOfPage1();
        
        string s1 = accRec.getCurrentPageDescription();
        String s2 = accRec.getCurrentPageDescription1();
        
        
        
        
        
        Test.setMock(WebServiceMock.class, new WS_ESB_ManageAccountMockWebSerTest());
        System.debug(JSON.serializePretty(ar));
        //accRec.acc = ac1[0];
        
        
          
         
         
         
        // accRec12.lstAccountsReceivable = lstAccRec;
         
        /* //accRec12.prevPayments();
        //accRec12.nextPayments();
        //accRec12.prevAdjustments();
        //accRec12.nextAdjustments();
        
        boolean b112 = accRec12.gethasNextPayments();  
        boolean b312 = accRec12.gethasPrevPayments();
        boolean b412 = accRec12.gethasNextAdjustments();
        boolean b212 = accRec12.gethasPrevAdjustments(); 
        
        integer a12 = accRec12.getStartingNumber();
        integer a212 = accRec12.getActualRecordSize();
        integer a312 = accRec12.getTotalNumberOfPages();
        integer a412 = accRec12.getCurrentNumberOfPage();
        integer a512 = accRec12.getStartingNumber1();
        integer a612 = accRec12.getactualRecordSize1();
        integer a712 = accRec12.getTotalNumberOfPages1();
        integer a812 = accRec12.getCurrentNumberOfPage1();
        
        string s112 = accRec12.getCurrentPageDescription();
        String s212 = accRec12.getCurrentPageDescription1(); */
   }
}