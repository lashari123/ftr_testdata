public class Account_AccountsReceivable {

        public List<Adjustments> lstAdjustments {get; set;}
        public List<Adjustments> lstAdjustment {get; set;}
        public static List<PaymentInfoInternal> lstPayments  {get;set;}
        public static boolean isSummaryNumber {get;set;}
        public Boolean ClickBTN {get;set;}
        public boolean bolIsSummarySearch {get;set;}
        public boolean IncludeBTNSummariesFlag {get;set;}
        public Account acc {get;set;}
        public list<AccountsReceivableInfo> lstAccountsReceivable {get;set;}
        public Service_Type__c ServiceType {get; set;}
        public boolean dataPayments {get; set;}
        public boolean dataAdjustments {get; set;}
        public boolean dataResponseCO {get; set;}
        
        //--------------------------------------------------------------------------------------------------------------
        
        public Account_AccountsReceivable(){
                //------------------------------------------------------------------------------------------------------
                dataPayments = true;
                dataAdjustments = true;
                dataResponseCO = false;
                acc = null;
                
                //------------------------------------------------------------------------------------------------------
                Apexpages.currentPage().getHeaders().put('X-UA-Compatible', 'IE=8');
                lstPayments = new List<PaymentInfoInternal>();
                system.debug('Account Id: '+ApexPages.currentPage().getParameters().get('accoutId'));
                String AccountId = ApexPages.currentPage().getParameters().get('accoutId');
                
                if(AccountId != null){
                        try{
                            system.debug('New Debug1');
                            acc = [SELECT Id, Library_Id__c, ParentSequenceId__c, TNSequenceId__c, DPI_PIN__c, DPI_ServiceType__c, IncludeSummary__c, DPI_ConnectDate__c, Name, DPI_BillCycle__c, Hierarchy_Level__c FROM Account WHERE Id = :AccountId LIMIT 1];
                           }catch(Exception e){}
                        if(acc!=null && acc.Library_Id__c != null && acc.ParentSequenceId__c!= null ){
                            string tnvalue = '';
                            
                            if (acc.hierarchy_level__C.equalsIgnoreCase('MEMBER')) {
                                if ((acc.ParentSequenceId__c).length() > 10) {
                                    tnvalue = acc.ParentSequenceId__c.substring(0,10);
                                }
                            }
                            
                            if (tnvalue.equals(''))
                                tnvalue = acc.TNSequenceId__c.substring(0,10);
                                
                            calculatePayments(acc.Library_Id__c, tnvalue,'0');             //Calling getPayments
                            calculateAdjustmentvalues();
                        }                                                               //Calling getAdjustments
                }
                
                 if(lstPayments.size() > 0){ dataPayments = false;  } 
                 if  ((lstAdjustments != null) && (lstAdjustments.size() > 0)) { dataAdjustments = false;  }                 
                
        }
    
        public class PaymentInfoInternal implements Comparable {            //Wrapper class for sorting the payments
            public String Billing_Number {get;set;}
            public Date Payement_Rcvd_Date {get;set;}
            public Datetime Post_Pay_Date {get;set;}
            public String Posted_Pay_Type {get;set;}
            public Double Posted_Amount {get;set;}
            public String Deposit_Id {get;set;}
            public String Posted_Ref {get;set;}
            public String Posted_By {get;set;}
            public String Batch_Name {get;set;}
            public String PostDate {get; set;}
            // added
            public PaymentInfoInternal(){
            }
            public integer compareTo(Object compareTo){
                PaymentInfoInternal compareToPay = (PaymentInfoInternal)compareTo;
                if(Payement_Rcvd_Date == compareToPay.Payement_Rcvd_Date) return 0;
                if(Payement_Rcvd_Date < compareToPay.Payement_Rcvd_Date) return 1;
                return -1;
            }
            //added
        } 
        
        //Payments Pagination Start
        
        public Integer startingCounter = 0;
        
        public void prevPayments() {
                startingCounter -= PAGINATION_LIMIT;
                startingCounter = (startingCounter/20)*20;
                recordChangesPayments();
        }
        
        public void nextPayments() {
                System.debug('Inside Next Payments');
                startingCounter += PAGINATION_LIMIT;
                recordChangesPayments();
        }
        
        public boolean gethasNextPayments() {
                if(getTotalNumberOfPages() <= getCurrentNumberOfPage()) {
                        return false;
                } else {
                        return true;
                }
        }
    
        public boolean gethasPrevPayments() {
                if(getCurrentNumberOfPage() > 1) {
                        return true;
                } else {
                        return false;
                }
        }
    
        public Integer getStartingNumber() {
                return startingCounter;
        }
    
        public String getCurrentPageDescription() {
                if(actualRecordList.size() < startingCounter + PAGINATION_LIMIT)
                        return (startingCounter + 1) + '-' + (actualRecordList.size());
                else
                        return (startingCounter + 1) + '-' + (startingCounter + PAGINATION_LIMIT);
        }
    
        public Integer getActualRecordSize() {
                return actualRecordList.size();
        }
    
        public List<PaymentInfoInternal> actualRecordList {get;set;}
        public Integer PAGINATION_LIMIT = 12;
    
        private void recordChangesPayments() { 
                lstPayments = new List<PaymentInfoInternal>();
                Integer tempStartingNumber = startingCounter;
                if((startingCounter + PAGINATION_LIMIT) < actualRecordList.size()) {      
                        for(Integer counter = tempStartingNumber; counter < (tempStartingNumber + PAGINATION_LIMIT); counter++) {
                                lstPayments.add(actualRecordList.get(counter));
                        }
                } 
                else {
                        for(Integer counter = tempStartingNumber; counter < actualRecordList.size(); counter++) {
                                lstPayments.add(actualRecordList.get(counter));
                        }   
                }                 
                 
        }
    
        public Integer getTotalNumberOfPages() {
                if(actualRecordList.size() > ((actualRecordList.size()/PAGINATION_LIMIT) * PAGINATION_LIMIT))
                        return (actualRecordList.size()/PAGINATION_LIMIT)+1;
                else 
                        return (actualRecordList.size()/PAGINATION_LIMIT);
        }
    
        public Integer getCurrentNumberOfPage() {
                return (startingCounter/PAGINATION_LIMIT) + 1;
        }
        //Payments Pagination End
    
        public PageReference calculatePayments(String LibraryId, String PhoneNumber, String SequenceId){                    //ManageCollection Services - getPayments Operation is called
                system.debug('Parameters: '+LibraryId+' '+PhoneNumber+' '+SequenceId);                
                
                actualRecordList = new List<PaymentInfoInternal>();                                                         //Includes all the values in the paymentInfoMap
     
                WS_ESB_ManageCollection.Callout paymentCallOut = new WS_ESB_ManageCollection.Callout();
                WS_ESB_ManageCollection.Response_GetPayment paymentResponse;
                Map<Integer, PaymentInfoInternal> paymentInfoMap = new Map<Integer, PaymentInfoInternal>();
                paymentResponse = null;
                try{
                    paymentResponse = paymentCallOut.GetPayment(PhoneNumber, SequenceId, LibraryId);
                
                    if ((paymentResponse != null) && (paymentResponse.PaymentDetail != null)) {
                                if (paymentResponse.PaymentDetail.Payment != null && paymentResponse.PaymentDetail.Payment.size() > 0) {
                                    Integer paymentCount = 0;
                                    for (WS_ESB_BusinessObjects.Payment PI : paymentResponse.PaymentDetail.Payment) {
                                            PaymentInfoInternal tPaymentInfo = new PaymentInfoInternal();
                                            tPaymentInfo.Billing_Number = PI.BillingAccountId.PhoneNumberAsId.TelephoneNumber.Number_x;
                                            
                                            if(PI.TransactionDate != null){
                                                tPaymentInfo.Payement_Rcvd_Date = PI.TransactionDate;
                                            }
                                            
                                           // tPaymentInfo.Payement_Rcvd_Date = PI.TransactionDate;
                                            if(PI.PostDateTime != null){  
                                                tPaymentInfo.Post_Pay_Date = PI.PostDateTime;
                                            }
                                            //tPaymentInfo.Post_Pay_Date = PI.PostDateTime;
                                            tPaymentInfo.PostDate = tPaymentInfo.Post_Pay_Date.format('MM/dd/yyyy hh:mm a');            //Change the format of the PostDate - MM/DD/YYYY 
                                            
                                            tPaymentInfo.Posted_Pay_Type = PI.BankPaymentSource.PaymentSourceDescription;
                                            tPaymentInfo.Posted_Amount = Double.valueOf(PI.TransactionAmount.Amount);
                                            //Sunil 12/16/2015 check for null
                                            if(PI.BankPaymentSource != null && PI.BankPaymentSource.Bank != null && PI.BankPaymentSource.Bank.DepositId != null){
                                                tPaymentInfo.Deposit_Id = PI.BankPaymentSource.Bank.DepositId;
                                            }
                                            if( PI.ReferenceNumber != null){ tPaymentInfo.Posted_Ref = PI.ReferenceNumber; }
                                            if(PI.ReferenceNumber == '') {
                                                    tPaymentInfo.Posted_Ref = 'N/A';                                                    // Populate N/A if Reference# is empty
                                            }
                                            
                                            tPaymentInfo.Posted_By = PI.PostedBy;
                                            tPaymentInfo.Batch_Name = PI.BatchId;
                                            //system.debug('paymentInfoMap: '+paymentInfoMap.get(paymentCount));
                                            if(((tPaymentInfo.Payement_Rcvd_Date).daysBetween(System.today())) < 730) {                 //Needed only 2 years of Payment Information as per the requirement
                                                    paymentInfoMap.put(paymentCount, tPaymentInfo);
                                                    paymentCount++;
                                                    System.debug('Sunil count'+paymentCount);
                                            }
                                            
                                            System.debug('Sunil map'+paymentInfoMap);
                                    }
                                }
                        }else{
                            System.debug('Payment Response object returning null');
                            dataResponseCO = true;
                            // Send a msg to display in the page to say.. "NO DATA FETCHED, CHECK DPI."
                                                
                        }
                } catch(Exception e) {
                        System.debug('getStackTraceString===='+e.getStackTraceString());
                        System.debug('getMessage===='+e.getMessage());                    
                }
                actualRecordList.addAll(paymentInfoMap.values());
                actualRecordList.sort();                                        //Sort the list of Payments                                 
                System.debug(actualRecordList);
                recordChangesPayments();
               
                return null;
        }       
    
        public class AccountsReceivableInfo{                                    //getAccountsReceivable callout wrapper class to store the parameters
                public Boolean DST_Eligible {get;set;}
                public Date BillDate {get;set;}
                public String BillDateString {get;set;}
                public String PhoneNumber {get;set;}
                public String BillCycle {get;set;}
                public Date LastPaymentDate {get;set;}
                public string LastPayment {get; set;}
                public Decimal PriorBill {get;set;}
                public Decimal TotalPayments {get;set;}
                public Decimal TotalAdjustments {get;set;}
                public Decimal NetBill {get;set;}
                public Decimal CurrentAdjLocalSvcs {get;set;}
                public Decimal AdjLocalSvcs {get;set;}
                public Decimal CurrentPPOCC {get;set;}
                public Decimal PPOCC {get;set;}
                public Decimal TollCharges {get;set;}
                public Decimal TotalTaxes {get;set;}
                public Decimal Balance {get;set;}
                public Account acc1 {get;set;}
                public String BTN_PIN {get; set;}
                public Date ConnectDate {get; set;}
                public List<String> lstBillString {get; set;} 
        
                public AccountsReceivableInfo(){
                    
                }
        
                public AccountsReceivableInfo(String BTN, WS_ESB_BusinessObjects.AccountsReceivable AR, WS_ESB_BusinessObjects.PendingAccountsReceivable PAR) {            
                        String AccountId = ApexPages.currentPage().getParameters().get('accoutId');
                        string[] dateStr = null;
                        
                        if(AccountId != null){
                                acc1 = [SELECT Id, Library_Id__c, DPI_ServiceType__c, TNSequenceId__c, ParentSequenceId__c, DPI_PIN__c, DPI_ConnectDate__c, Hierarchy_Level__c FROM Account WHERE Id = :AccountId LIMIT 1];
                        }
                        System.debug('Sunil AccReceivable'+acc1);
                        System.debug('Sunil AccReceivable wtn'+acc1.TNSequenceId__c);
                        getParameters();   
                        if(AR.BillDate != null){   
                            dateStr = AR.BillDate.split('[-:T]');                  
                            BillDate = Date.newInstance(Integer.valueOf(dateStr[0]), Integer.valueOf(dateStr[1]), Integer.valueOf(dateStr[2])); //AR.BillDate;
                        }
                        system.debug('BillDate---'+BillDate);
                        if(BillDate == null){BillDateString='Current';}                                 //BillDate doesnt exist for the current billing period
                        if(!Test.isRunningTest()){
                            if(BillDate != null) {
                                System.debug('Sunil get Billing Info');
                                BillDateString = getBillingStatementLink(BillDate);          //AR.BillDate.split('[T]')[0];     get 6 months of AR BillDateLink
                            }
                        } else{
                            BillDateString = getBillingStatementLink(date.today());                     //for test classes
                        }
                        PhoneNumber = BTN;
                        if(AR.BillCycle != null){
                            BillCycle = AR.BillCycle;
                        }
                        System.debug('Sunil getAcc REc  '+PhoneNumber+ '  '+BillCycle);
                        ///*
                        if(AR.LastPaymentDate != null){
                            //dateStr = AR.LastPaymentDate.split('[-:T]');
                            LastPaymentDate = Date.newInstance(Integer.valueOf(dateStr[0]), Integer.valueOf(dateStr[1]), Integer.valueOf(dateStr[2]));
                            //LastPaymentDate = AR.LastPaymentDate;
                        }//*/
                        LastPayment = string.valueof(AR.LastPaymentDate);
                        if(LastPaymentDate == null){LastPayment = 'N/A';}
                        if(AR.PriorBillAmount != null && AR.PriorBillAmount.Amount != null){
                            PriorBill= decimal.valueof(AR.PriorBillAmount.Amount).setScale(2);
                            System.debug('Sunil System.debug(PriorBill);'+PriorBill);
                        }
                        if(AR.TotalPaymentAmount!= null && AR.TotalPaymentAmount.Amount != null){
                            TotalPayments = decimal.valueof(AR.TotalPaymentAmount.Amount).setScale(2);
                            System.debug('Sunil TotalPayments '+TotalPayments);
                        }
                        if(AR.PriorBillAdjustmentAmount != null && AR.PriorBillAdjustmentAmount.Amount != null){
                            TotalAdjustments = decimal.valueof(AR.PriorBillAdjustmentAmount.Amount).setScale(2);
                        }
                        if(PriorBill != null && TotalPayments != null && TotalAdjustments != null ){
                            NetBill = (PriorBill - TotalPayments + TotalAdjustments).setScale(2);
                        }
                        System.debug('Sunil list'+LastPaymentDate+'  '+PriorBill+TotalPayments+'    '+TotalAdjustments+'    '+NetBill);  
                        if(PAR.PostedCurrentAdjustment != null && PAR.PostedCurrentAdjustment.Amount != null && PAR.UnPostedCurrentAdjustment != null && PAR.UnPostedCurrentAdjustment.Amount != null){                      
                            CurrentAdjLocalSvcs = decimal.valueof(PAR.PostedCurrentAdjustment.Amount).setScale(2) + decimal.valueof(PAR.UnPostedCurrentAdjustment.Amount).setScale(2);
                        }
                        if(AR.CurrentBillAmounts != null && AR.CurrentBillAmounts.NonProRatedChargesAmount != null && AR.CurrentBillAmounts.NonProRatedChargesAmount.Amount != null){
                            AdjLocalSvcs = decimal.valueof(AR.CurrentBillAmounts.NonProRatedChargesAmount.Amount).setScale(2);
                        }
                        if(PAR.UnPostedPaymentAmount.Amount != null && PAR.UnPostedPaymentAmount.Amount != null && PAR.UnPostedPriorAdjustment != null && PAR.UnPostedPriorAdjustment.Amount != null){
                            CurrentPPOCC = decimal.valueof(PAR.UnPostedPaymentAmount.Amount) + decimal.valueof(PAR.UnPostedPriorAdjustment.Amount).setScale(2);
                        }
                        if(AR.CurrentBillAmounts != null && AR.CurrentBillAmounts.ProRatedChargesAndCurrentAdjustmentsAmount != null  && AR.CurrentBillAmounts.ProRatedChargesAndCurrentAdjustmentsAmount.Amount != null){
                            PPOCC = decimal.valueof(AR.CurrentBillAmounts.ProRatedChargesAndCurrentAdjustmentsAmount.Amount).setScale(2);
                        }
                        
                        if(AR.CurrentBillAmounts != null && AR.CurrentBillAmounts.TollAmount != null && AR.CurrentBillAmounts.TollAmount.Amount != null){
                            TollCharges = decimal.valueof(AR.CurrentBillAmounts.TollAmount.Amount).setScale(2);
                        }
                        if(AR.CurrentBillAmounts != null && AR.CurrentBillAmounts.TaxAmount != null && AR.CurrentBillAmounts.TaxAmount.Amount != null){
                            TotalTaxes = decimal.valueof(AR.CurrentBillAmounts.TaxAmount.Amount).setScale(2);
                        }
                        if(NetBill!= null && AdjLocalSvcs !=null && PPOCC != null && TollCharges != null && TotalTaxes != null){
                            Balance = (NetBill + AdjLocalSvcs + PPOCC + TollCharges + TotalTaxes).setScale(2);
                        }
                        
                }
                
                //If TN is member, get PIN & ConnectDate of the BillingRecord - Waiting for an approval from stacy to override this only for the Billing Records
                public void getParameters(){
                    try{     
                        WS_ESB_ManageAccount.Callout accountCallOut = new WS_ESB_ManageAccount.Callout();
                        WS_ESB_ManageAccount.ManageAccountGetAccountResponse getAccountResponse ;
                        System.debug('338   acc.TNSequenceId__c '+acc1.TNSequenceId__c+'  acc.Library_Id__c   '+acc1.Library_Id__c);
                        getAccountResponse = accountCallOut.GetAccount(acc1.ParentSequenceId__c.substring(0,10), acc1.Library_Id__c);
                        
                        if(getAccountResponse != null && getAccountResponse.CustomerAccount[0] != null && getAccountResponse.CustomerAccount.size()>0){
                            if(getAccountResponse.CustomerAccount[0].PersonalIdentificationNumber != null) {
                                BTN_PIN = getAccountResponse.CustomerAccount[0].PersonalIdentificationNumber;        
                            }   
                            if(getAccountResponse.CustomerAccount[0].ConnectDate != null) {
                                ConnectDate = getAccountResponse.CustomerAccount[0].ConnectDate;
                            }
                        }
                    } catch (exception e) {
                        System.debug('getStackTraceString===='+e.getStackTraceString());
                        System.debug('getMessage===='+e.getMessage());
                      }
                }   
        
                public String getBillingStatementLink(Date StatementDate) {
                    String StatementLink = '';
                    String DST_Eligible = '';
                     Service_Type__c ServiceType = null;
                    System.debug('Sunil  getBillingStatementLink(Date StatementDate) <'+acc1.DPI_ServiceType__c+'>');
                        try{
                        ServiceType = [SELECT OBP_elig__c, service_type__c FROM Service_Type__c WHERE service_type__c =: acc1.DPI_ServiceType__c LIMIT 1];   //DST Eligibility at the TN level. 
                        }catch(Exception ex){
                            System.debug('Sunil ServiceType not found'+ex);
                        }
                        if(ServiceType != null && ServiceType.OBP_elig__c != null){
                            DST_Eligible = ServiceType.OBP_elig__c;
                        }
                       
                        system.debug('DST_Eligible---'+DST_Eligible+'BillDate Difference---'+((StatementDate).daysBetween(System.today()))+'StatementDate--'+StatementDate+'System.today()---'+System.today());
                        //ConnectDate = acc.DPI_ConnectDate__c;
                        //BTN_PIN = acc.DPI_PIN__c;
                        //if(DST_Eligible == 'Y' && ((StatementDate).daysBetween(System.today())) < 180 && (acc.Hierarchy_Level__c == 'Billing' || acc.Hierarchy_Level__c == 'Summary') ) {    
                        if(DST_Eligible == 'Y' && ((StatementDate).daysBetween(System.today()) < 180 ) ) {
                                StatementLink += '<a href=';
                                StatementLink += '\"http://sfgui.czncorp.com:9080/DSTIntegration/dstServlet?anumber='+acc1.ParentSequenceId__c.substring(0,10);     //Adds BTN to Link
                                
                                System.debug('Sunil 373 Connect date'+ConnectDate);
                                if(ConnectDate != null){
                                    String ConnectMonth = string.valueof(ConnectDate.month());
                                    if(ConnectMonth.length() == 1){ ConnectMonth = '0' + ConnectMonth; }
                                    StatementLink += ConnectMonth;                                          //Split ConnectDate & AddMonth in the format MM
                                    String ConnectDay = string.valueof(ConnectDate.day());
                                    if(ConnectDay.length() == 1){ ConnectDay = '0' + ConnectDay; }          //Split ConnectDate & AddDays in the format DD
                                    StatementLink += ConnectDay; 
                                    String ConnectYear = string.valueof(ConnectDate.year()).right(2);
                                    StatementLink += ConnectYear;                                           //Split ConnectDate & AddYear in the format YY
                                }
                                String LibraryID = acc1.Library_Id__c;                                   //Region specific LibraryID Parameters
                                if(LibraryID == 'AZ'){ LibraryID = '5'; }
                                if(LibraryID == 'CA'){ LibraryID = '8'; }
                                if(LibraryID == 'EA'){ LibraryID = '4'; }
                                if(LibraryID == 'LF'){ LibraryID = '7'; }
                                if(LibraryID == 'LR'){ LibraryID = '6'; }
                                if(LibraryID == 'PA'){ LibraryID = '3'; }
                                if(LibraryID == 'US'){ LibraryID = '2'; }
                                if(LibraryID == 'MS'){ LibraryID = '5'; }
                                if(LibraryID == 'CW' || LibraryID == 'NW'){ LibraryID = '5'; }
                                StatementLink += LibraryID;
                                StatementLink += BTN_PIN;
                                StatementLink += '&action=viewStatement&stmtDate=';
                                system.debug('acc.BTNSequ----'+acc1.ParentSequenceId__c+'DPI_ConnectDate__c---'+ConnectDate+'Library_Id--'+acc1.Library_Id__c+'DPI_PIN__c---'+BTN_PIN);
                                String StatementMonth = string.valueof(StatementDate.Month());
                                if(StatementMonth.length() == 1){ StatementMonth = '0' + StatementMonth; }
                                StatementLink += StatementMonth;                                                //Split StatementDate & AddMonth in the format MM
                                String StatementDay = string.valueof(StatementDate.Day());
                                if(StatementDay.length() == 1){ StatementDay = '0' + StatementDay; }
                                StatementLink += StatementDay;                                                  //Split StatementDate & AddDate in the format DD
                                String StatementYear = string.valueof(StatementDate.Year());
                                StatementLink += StatementYear;                                                 //Split StatementDate & AddYear in the format YY
                                StatementLink += '\" target=\"_blank\">';
                                StatementLink += StatementMonth+'/'+StatementDay+'/'+StatementYear;
                                StatementLink += '</a>';
                        } else {
                                StatementLink = String.ValueOf(StatementDate);
                        }
                    
                        system.debug('StatementLink----'+StatementLink);                                //Prints StatementLink in the validformat for the PDF
                        return StatementLink; 
             }       
        }

        public List<TrendingData> getAccountsReceivableTrending() {
                List<TrendingData> lstTrendingData = new List<TrendingData>();
                for(Integer AR_Count = 0; AR_Count<12; AR_Count++) {
                        try {
                                System.debug('Sunil graph size'+lstAccountsReceivable);
                                if(lstAccountsReceivable.size()>AR_Count && lstAccountsReceivable[AR_Count].BillDate != null) {
                                    System.debug('Sunil graph lstAccountsReceivable[AR_Count].BillDate');
                                        if(lstAccountsReceivable[AR_Count].Balance != null && lstAccountsReceivable[AR_Count].NetBill != null) {
                                            System.debug('Sunil graph lstAccountsReceivable[AR_Count].BillDate');
                                                lstTrendingData.add(new TrendingData(lstAccountsReceivable[AR_Count].BillDate.Month(), lstAccountsReceivable[AR_Count].BillDate.Year(), lstAccountsReceivable[AR_Count].Balance - lstAccountsReceivable[AR_Count].NetBill));
                                        } else {
                                                lstTrendingData.add(new TrendingData(lstAccountsReceivable[AR_Count].BillDate.month(), lstAccountsReceivable[AR_Count].BillDate.year(), 0));
                                        }
                                }
                        } catch (exception e)
                         { 
                            System.debug('Sunil -----Error'+e);
                         }
                }
                return lstTrendingData;
        }
        
        public class TrendingData{
                public String Month {get;set;}
                public Decimal Charges {get;set;}
                public TrendingData(Integer intMonth, Integer intYear, Decimal decCharges){
                        Map<Integer,String> mapMonths = new Map<Integer,String>();
                        mapMonths.put(1,'Jan');
                        mapMonths.put(2,'Feb');
                        mapMonths.put(3,'Mar');
                        mapMonths.put(4,'Apr');
                        mapMonths.put(5,'May');
                        mapMonths.put(6,'Jun');
                        mapMonths.put(7,'Jul');
                        mapMonths.put(8,'Aug');
                        mapMonths.put(9,'Sep');
                        mapMonths.put(10,'Oct');
                        mapMonths.put(11,'Nov');
                        mapMonths.put(12,'Dec');
                        if(intMonth != null && intYear != null){
                                Month = mapMonths.get(intMonth) + ' \'' + string.valueof(intYear).right(2);
                        }
                        if(decCharges < 0){
                                Charges = 0.00;
                        }else{
                                Charges = decCharges;
                        }
                }
        } 
        
        public String getAccountsReceivableTrending1() {
                List<TrendingData1> lstTrendingData = new List<TrendingData1>();
                for(Integer AR_Count = 0; AR_Count<12; AR_Count++) {
                        try {
                                if(lstAccountsReceivable[AR_Count].BillDate != null) {
                                        if(lstAccountsReceivable[AR_Count].Balance != null && lstAccountsReceivable[AR_Count].NetBill != null) {
                                                lstTrendingData.add(new TrendingData1(lstAccountsReceivable[AR_Count].BillDate.Month(), lstAccountsReceivable[AR_Count].BillDate.Year(), lstAccountsReceivable[AR_Count].Balance - lstAccountsReceivable[AR_Count].NetBill));
                                        } else {
                                                lstTrendingData.add(new TrendingData1(lstAccountsReceivable[AR_Count].BillDate.month(), lstAccountsReceivable[AR_Count].BillDate.year(), 0));
                                        }
                                }
                        } catch (exception e) {}
                }
                system.debug('List of TrendingData: '+lstTrendingData);
                return JSON.serialize(lstTrendingData);
        }
        
        public class TrendingData1{
                public String Month {get;set;}
                public String Year {get;set;}
                public String Charges {get;set;}
                public TrendingData1(Integer intMonth, Integer intYear, Decimal decCharges){
                        Map<Integer,String> mapMonths = new Map<Integer,String>();
                        mapMonths.put(1,'Jan');
                        mapMonths.put(2,'Feb');
                        mapMonths.put(3,'Mar');
                        mapMonths.put(4,'Apr');
                        mapMonths.put(5,'May');
                        mapMonths.put(6,'Jun');
                        mapMonths.put(7,'Jul');
                        mapMonths.put(8,'Aug');
                        mapMonths.put(9,'Sep');
                        mapMonths.put(10,'Oct');
                        mapMonths.put(11,'Nov');
                        mapMonths.put(12,'Dec');
                        if(intMonth != null && intYear != null){
                                Month = mapMonths.get(intMonth);
                                Year = string.valueof(intYear).right(2);
                        }
                        if(decCharges < 0){
                                Charges = '0.00';
                        }else{
                                Charges = string.valueof(decCharges);
                        }
                }
        } 
    
        public List<AccountsReceivableInfo> getAccountsReceivable(){
                lstAccountsReceivable = new list<AccountsReceivableInfo>();
                WS_ESB_ManageCollection.Callout ManageCollectionCallout = new WS_ESB_ManageCollection.Callout();
                WS_ESB_ManageCollection.Response_GetAccountsReceivable AccountsReceivableResponse = null;
                System.debug('Sunil --GetAccountsReceivable debug 1');
                
                if(acc != null && acc.ParentSequenceId__c != null && acc.Library_Id__c != null ){ //added
                    try{
                            System.debug('Sunil --GetAccountsReceivable debug 1 acc.ParentSequenceId__c,  '+ acc.ParentSequenceId__c+'  '+acc.Library_Id__c +'acc.IncludeSummary__c  '+acc.IncludeSummary__c);
                           AccountsReceivableResponse = ManageCollectionCallout.GetAccountsReceivable(acc.ParentSequenceId__c.substring(0,10), acc.Library_Id__c, acc.IncludeSummary__c);
                           System.debug('Sunil --GetAccountsReceivable Response:AccountsReceivable '+ json.serializePretty(AccountsReceivableResponse.AccountsReceivable));
                        // if(acc.ParentSequenceId__c != null && acc.Library_Id__c != null ){ //added
                        //   AccountsReceivableResponse = ManageCollectionCallout.GetAccountsReceivable(acc.ParentSequenceId__c, acc.Library_Id__c, acc.IncludeSummary__c);
                           System.debug(AccountsReceivableResponse.AccountsReceivable);
                            if(AccountsReceivableResponse != null && AccountsReceivableResponse.AccountsReceivable != null && AccountsReceivableResponse.AccountsReceivable.size() > 0){
                                    Integer AR_Count = 0;                                    
                                    for(WS_ESB_BusinessObjects.AccountsReceivable AR : AccountsReceivableResponse.AccountsReceivable){
                                            if(AR_Count<12) {
                                                    system.debug('sunil lstAccountsReceivable AR_Count'+ AR_Count); 
                                                    lstAccountsReceivable.add(new AccountsReceivableInfo(acc.ParentSequenceId__c,AR,AccountsReceivableResponse.PendingAccountsReceivable));
                                            }
                                            AR_Count++;
                                    }
                            }
                            WS_ESB_BusinessObjects.PendingAccountsReceivable ListPendingAccountsReceivable = AccountsReceivableResponse.PendingAccountsReceivable;
                   //}    
                }catch(Exception ex){
                       system.debug('getStackTraceString==111=='+ex.getStackTraceString());                   
                   }
            }      
                return lstAccountsReceivable;              
        }
    
        public class AgingInformation {
                public String Interval {get;set;}
                public Decimal Amount {get;set;}
                
                public AgingInformation(String this_interval, Decimal this_amount){
                        Interval = this_interval;
                        Amount = this_amount;
                }
        }
    
        public List<AgingInformation> getAgingInformation() {
                List<AgingInformation> listAging = new List<AgingInformation>();
                Account this_account = [SELECT DPI_Aging_00_30__c, DPI_Aging_31_60__c, DPI_Aging_61_90__c, DPI_Aging_90_Plus__c FROM Account WHERE Id = :ApexPages.currentPage().getParameters().get('accoutId')];
                listAging.add(new AgingInformation('1-31',this_account.DPI_Aging_00_30__c));
                listAging.add(new AgingInformation('32-62',this_account.DPI_Aging_31_60__c));
                listAging.add(new AgingInformation('63-93',this_account.DPI_Aging_61_90__c));
                listAging.add(new AgingInformation('Over 93',this_account.DPI_Aging_90_Plus__c));
                return listAging;
        }
        
        public class Adjustments implements comparable { //added
                public String ChargeCode {get;set;}
                public String DateAdj {get;set;}
                public String AccountAdj {get;set;}
                public Decimal Amount {get;set;}
                public String BatchName {get;set;}
                public String ReferenceNumber {get;set;}
                public String Posted_By {get;set;}
                public String Type {get;set;}
                public String Description {get; set;}
                public String TransactionDate {get; set;}
                
                //added
                public Adjustments(){
                }
                
                public integer compareTo(Object compareTo){
                        Adjustments tempAdj = (Adjustments)compareTo;
                        
                        if(TransactionDate == tempAdj.TransactionDate ) return 0;
                        if(TransactionDate < tempAdj.TransactionDate) return 1;
                        return -1;
                } //added 
        }
        
        public pagereference calculateAdjustmentvalues() {
         lstAdjustment = new List<Adjustments>();
         WS_ESB_ManageCollection.Callout adjustmentCallOut = new WS_ESB_ManageCollection.Callout();
         WS_ESB_ManageCollection.Response_GetAdjustment adjustmentResponse;
         adjustmentResponse = null;
         try{
             adjustmentResponse = adjustmentCallOut.GetAdjustment(acc.ParentSequenceId__c.substring(0,10),'0',acc.Library_Id__c);
         }catch(Exception e){}
                
         Map<Integer, Adjustments> AdjustmentInfoMap = new Map<Integer, Adjustments>();
                try {
                        //adjustmentResponse = adjustmentCallOut.GetAdjustment(acc.ParentSequenceId__c.substring(0,10),'0',acc.Library_Id__c);
                        if (adjustmentResponse!= null && adjustmentResponse.AdjustmentDetail != null && adjustmentResponse.AdjustmentDetail.size() > 0) {
                                Integer Count = 0;
                                for(WS_ESB_BusinessObjects.AdjustmentDetail adjDetail: adjustmentResponse.AdjustmentDetail) {
                                    for(WS_ESB_BusinessObjects.Adjustment adj: adjDetail.Adjustment) {
                                        
                                        Adjustments adjustment = new Adjustments();
                                        adjustment.ChargeCode = adj.ChargeCode;
                                        adjustment.BatchName = adj.BatchId;
                                        adjustment.ReferenceNumber = adj.ReferenceNumber;
                                        adjustment.AccountAdj = adj.GLAccount.GLAccountId;
                                        adjustment.ReferenceNumber = adj.ReferenceNumber;                                      
                                        DateTime dT = adj.PostDateTime;
                                        adjustment.DateAdj = String.valueOf(date.newinstance(dT.year(), dT.month(), dT.day())); 
                                        adjustment.Posted_By = adj.PostedBy;
                                        adjustment.Description = adj.Description; 
                                        adjustment.Amount = Decimal.valueOf(adj.TransactionAmount.Amount);                                        
                                        Date Transaction1 = adj.TransactionDate;
                                        adjustment.TransactionDate = string.valueOf(adj.TransactionDate); 
 
 
                                        if(Count < 1000) {
                                            if((Transaction1.daysBetween(System.today())) < 730 ) {
                                                AdjustmentInfoMap.put(Count,adjustment);
                                            }
                                        }
                                        Count++;                                
                                   }
                                    lstAdjustment.addAll(AdjustmentInfoMap.values());
                                    lstAdjustment.sort(); //added
                                    
                                }                              
                            } 
               } catch(Exception e) {
                   System.debug('getStackTraceString===='+e.getStackTraceString());
                   System.debug('getMessage===='+e.getMessage());
                 } 
            recordChangesAdjustments();
            return null;
        }
        
        public Integer startingCounter1 = 0;
        
        public void prevAdjustments() {
                startingCounter1 -= PAGINATION_LIMIT;
                startingCounter1 = (startingCounter1/20)*20;
                recordChangesAdjustments();
        }
        
        public void nextAdjustments() {
                startingCounter1 += PAGINATION_LIMIT;
                recordChangesAdjustments();
        }
        
        public boolean gethasNextAdjustments() {
                if(getTotalNumberOfPages1() <= getCurrentNumberOfPage1()) {
                        return false;
                } else {
                        return true;
                }
        }
    
        public boolean gethasPrevAdjustments() {
                if(getCurrentNumberOfPage1() > 1) {
                        return true;
                } else {
                        return false;
                }
        }
    
        public Integer getStartingNumber1() {
                return startingCounter1;
        }
        
        public String getCurrentPageDescription1() {
                if(lstAdjustment.size() < startingCounter1 + PAGINATION_LIMIT)
                        return (startingCounter1 + 1) + '-' + (lstAdjustment.size());
                else
                        return (startingCounter1 + 1) + '-' + (startingCounter1 + PAGINATION_LIMIT);
        }
    
        public Integer getactualRecordSize1() {
                return lstAdjustment.size();
        }
    
        
        private void recordChangesAdjustments() { 
                lstAdjustments = new List<Adjustments>();
                Integer tempStartingNumber1 = startingCounter1;
                if((startingCounter1 + PAGINATION_LIMIT) < lstAdjustment.size()) {      
                        for(Integer counter = tempStartingNumber1; counter < (tempStartingNumber1 + PAGINATION_LIMIT); counter++) {
                                lstAdjustments.add(lstAdjustment.get(counter));
                        }
                } 
                else {
                        for(Integer counter = tempStartingNumber1; counter < lstAdjustment.size(); counter++) {
                                lstAdjustments.add(lstAdjustment.get(counter));
                        }   
                }   
        }
    
        public Integer getTotalNumberOfPages1() {
                if(lstAdjustment.size() > ((lstAdjustment.size()/PAGINATION_LIMIT) * PAGINATION_LIMIT))
                        return (lstAdjustment.size()/PAGINATION_LIMIT)+1;
                else 
                        return (lstAdjustment.size()/PAGINATION_LIMIT);
        }
    
        public Integer getCurrentNumberOfPage1() {
                return (startingCounter1/PAGINATION_LIMIT) + 1;
        } 

}