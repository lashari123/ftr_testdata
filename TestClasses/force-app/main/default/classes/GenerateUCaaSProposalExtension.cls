public class GenerateUCaaSProposalExtension {
    public String oppId {get;set;}
    public List<SterlingQuoteItem__c> strQuotes {get;set;}
    public List<SteringQuoteItemExtension> strQuoteItemsExtensions {get;set;}
    public Account act {get;set;}
    public Contact con {get;set;}
    public User currentUser {get;set;}
    public List<SterlingQuote__c> lSyncedQuote {get;set;}
    public Opportunity opp {get;set;}
    public String currentDate {get;set;}
    public String quoteRepresent {get;set;}
    public String quoteName {get;set;}
    public String quoteNumber {get; set;}
    public String proposalFuture {get;set;}
    public String proposalCompany {get;set;}
    public String qNameStr {get; set;}
    
    public List<SteringQuoteItemExtension> strQuoteItemsExtensions1 {get;set;}
    public List<SteringQuoteItemExtension> strQuoteItemsExtensions2 {get;set;}
    public List<SteringQuoteItemExtension> strQuoteItemsExtensions3 {get;set;}
    public List<SteringQuoteItemExtension> strQuoteItemsExtensions4 {get;set;}
    public List<SteringQuoteItemExtension> strQuoteItemsExtensions5 {get;set;}
    public Integer NumSQIs1{get; set;}
    public Integer NumSQIs2{get; set;}
    public Integer NumSQIs3{get; set;}
    public Integer NumSQIs4{get; set;}
    public Integer NumSQIs5{get; set;}
    public decimal totalNRCValue1{get; set;}
    public decimal totalMRCValue1{get; set;}
    public decimal totalNRCValue2{get; set;}
    public decimal totalNRCValue3{get; set;}
    public decimal totalMRCValue3{get; set;}
    public decimal totalUnitPriceNRCValue4{get; set;}
    public decimal totalNRCValue4{get; set;}
    public decimal totalNRCValue5{get; set;}
    public decimal totalMRCValue5{get; set;}
    public decimal totalUpfrontCostHardware{get; set;}
    public decimal monthlyRecurringHardware{get; set;}
    public decimal totalMonthlyRecurringCharge{get; set;}
    public decimal monthlyFinancePayment{get; set;}
    public decimal totalMonthlyFinancePayment{get; set;}
    public Boolean showCashPayment{get; set;}
    public Boolean showFinancing{get; set;}
    
    public void assignToAppropriateStrQuoteItemsExtension(SteringQuoteItemExtension sqie) {
        //String category = (Math.mod((Integer)(Math.random() * 100), 4))+'';//THIS IS A TEMPORARY PLACEHOLDER FOR THE CATEGORY. RANDOMLY ASSIGNS A VALUE OF 0-3 to the section variable.
        String category = sqie.Category;
        
        if(category == 'Services') {
            NumSQIs1++;
            totalNRCValue1 += sqie.NRC;
            totalMRCValue1 += sqie.TotalCharge;
            strQuoteItemsExtensions1.add(sqie);
            
        } else if(category == 'Installation') {
            NumSQIs2++;
            totalNRCValue2 += sqie.NRC;
            strQuoteItemsExtensions2.add(sqie);
            
        } else if(category == 'Hardware/Matls') {
            NumSQIs3++;
            totalNRCValue3 += sqie.NRC;
            totalMRCValue3 += sqie.TotalCharge;
            strQuoteItemsExtensions3.add(sqie);
            
        } else if(category == 'Phone Power') {
            NumSQIs4++;
            totalUnitPriceNRCValue4 += sqie.AdjustedNRC;
            totalNRCValue4 += sqie.NRC;
            strQuoteItemsExtensions4.add(sqie);
            
        } else if(category == 'Write-In Parts') {
            NumSQIs5++;
            totalNRCValue5 += sqie.NRC;
            totalMRCValue5 += sqie.TotalCharge;
            strQuoteItemsExtensions5.add(sqie);
        }
    }
    
    public GenerateUCaaSProposalExtension() {
        con = null;
        strQuoteItemsExtensions = new List<SteringQuoteItemExtension>();
        strQuoteItemsExtensions1 = new List<SteringQuoteItemExtension>();
        strQuoteItemsExtensions2 = new List<SteringQuoteItemExtension>();
        strQuoteItemsExtensions3 = new List<SteringQuoteItemExtension>();
        strQuoteItemsExtensions4 = new List<SteringQuoteItemExtension>();
        strQuoteItemsExtensions5 = new List<SteringQuoteItemExtension>();
        strQuotes = new List<SterlingQuoteItem__c>();
        
        NumSQIs1 = 0;
        totalNRCValue1 = 0;
        totalMRCValue1 = 0;
        NumSQIs2 = 0;
        totalNRCValue2 = 0;
        NumSQIs3 = 0;
        totalNRCValue3 = 0;
        totalMRCValue3 = 0;
        NumSQIs4 = 0;
        totalUnitPriceNRCValue4 = 0;
        totalNRCValue4 = 0;
        NumSQIs5 = 0;
        totalNRCValue5 = 0;
        totalMRCValue5 = 0;
        totalUpfrontCostHardware = 0;
        totalMonthlyRecurringCharge = 0;
        monthlyFinancePayment = 0;
        totalMonthlyFinancePayment = 0;
        monthlyRecurringHardware = 0;
        
        String paymentMethod = ApexPages.currentPage().getParameters().get('paymentMethod');
        
        showCashPayment = (paymentMethod == 'UCaaS_Cash_Payment');
        showFinancing = (paymentMethod == 'UCaaS_Frontier_Financing');
        
        currentDate = (Datetime.now()).format('MMMM dd, yyyy');
        oppId = ApexPages.currentPage().getParameters().get('oppId');
        proposalFuture = ApexPages.currentPage().getParameters().get('proposalFuture');
        proposalCompany = ApexPages.currentPage().getParameters().get('proposalCompany');
        
        opp = [SELECT Id, AccountId FROM Opportunity WHERE id =: oppId];            
        currentUser = [SELECT Id, Phone,Title, MobilePhone, Email, Name FROM User WHERE id =: UserInfo.getUserId()];
        lSyncedQuote = [SELECT Id,Name, RecordTypeId,RecordType.Name, Quote_Number__c, OpportunityId__c FROM SterlingQuote__c WHERE OpportunityId__c =: oppId AND IsSyncing__c=true];         
        act = [SELECT id, Name FROM Account WHERE id =: opp.AccountId];
        System.debug('check 1');
        
        List<Id> associatedOppIds = new List<Id>();
        Map<Id, Id> sqIdToOppId = new Map<Id, Id>();
        List<String> truncatedSqIds = new List<String>();
        for(SterlingQuote__c sq : lSyncedQuote) {
            associatedOppIds.add(sq.OpportunityId__c);
            sqIdToOppId.put(sq.Id, sq.OpportunityId__c);
            String temp = sq.Id+'';
            truncatedSqIds.add(temp.left(temp.length() - 3));
        }
        
        list<OpportunityLineItem> lstOppLineItem = [
            SELECT 
            	Id, 
            	Renewal_MRR__c, 
            	UnitPrice, 
            	CPE_Gross_Margin__c, 
            	CPE_NRC_Price__c, 
            	NRC_Price__c,
            	Product2.name, 
            	AdjustedMRC__c, 
            	QuoteId__c, 
            	Service_Address__c, 
            	ZAddress__c, 
            	Opportunityid 
            FROM 
            	OpportunityLineItem 
            WHERE Opportunityid IN :associatedOppIds 
            AND (QuoteId__c IN :sqIdToOppId.keySet() 
                 OR QuoteId__c IN :truncatedSqIds)];
        
        Map<Id, OpportunityLineItem> oppIdToOppLineItem = new Map<Id, OpportunityLineItem>();
        Map<String, OpportunityLineItem> productNameToOppLineItem = new Map<String, OpportunityLineItem>();
        for(OpportunityLineItem oli : lstOppLineItem) {
            oppIdToOppLineItem.put(oli.Opportunityid, oli);
            productNameToOppLineItem.put(oli.Product2Id, oli);
        }
        
        try{
            con = [SELECT AccountId, name FROM Contact where AccountId=: act.id];
        }catch(Exception ex){}
        
        integer count = 0;
        System.debug('check 2');
        if(lSyncedQuote != null && lSyncedQuote.size() > 0){             
            for(SterlingQuote__c temp : lSyncedQuote){
                qNameStr = 'Quote Number: ';
                quoteNumber = temp.Quote_Number__c;
                
                for(SterlingQuoteItem__c var : [SELECT 
                                                    Id, 
                                                    Name, 
                                                    Status__c,
                                                    OverallStatus__c, 
                                                    DiscountType__c, 
                                                    Products__c,
                                                    StandardMRC__c,
                                                    Quantity__c, 
                                                    TermLength__c, 
                                                    CPE_NRC_Price__c, 
                                                    AdjustedNRC__c, 
                                                    StandardNRC__c, 
                                                    AdjustedMRC__c, 
                                                    Renewal_MRR_Original__c, 
                                                    Category__c, 
                                                    SterlingQuote__c, 
                                                    Part_Number__c, 
                                                    Description__c 
                                                FROM SterlingQuoteItem__c 
                                                WHERE ((SterlingQuote__c = :temp.Id)  
                                                AND (AdjustedNRC__c != 0.00 OR AdjustedMRC__c != 0.00))]) 
                {

                    if(var.DiscountType__c == '' || var.DiscountType__c == null || var.OverallStatus__c != null && var.OverallStatus__c == 'Approved'){
                        if(!(var.name).contains('Surcharge') && !(var.name).contains('Tax') && !(var.name).contains('Installation') && !(var.name).contains('Credit') && !(var.name).contains('Charge')){
                            try{
                                PricebookEntry pbEntry = [SELECT Id, Product2Id, Product2.Id, Product2.MajorProduct__c, Product2.Name FROM PriceBookEntry WHERE PriceBook2.isStandard=true AND Product2Id =: var.Products__c]; // RB - Defect 1476 
                                SteringQuoteItemExtension tempSE = new SteringQuoteItemExtension();                                
                                tempSE.ProductId = var.Products__c;
                                tempSE.Quantity = var.Quantity__c == null ? 0 : var.Quantity__c;
                                tempSE.Id = var.Id;
                                tempSE.CPE_NRC_Price = var.CPE_NRC_Price__c == null ? 0 : var.CPE_NRC_Price__c;
                                tempSE.Category = var.Category__c;
                                OpportunityLineItem OLI = productNameToOppLineItem.get(var.Products__c);
                                tempSE.TermLength = var.TermLength__c == null ? 0 : Integer.valueof(var.TermLength__c);
                                tempSE.Category = var.Category__c;
                                tempSE.AdjustedNRC = (var.AdjustedNRC__c == null) ? 0.00 : var.AdjustedNRC__c.setScale(2);
                                tempSE.TotalMRC = (var.AdjustedMRC__c == null) ? 0.00 : var.AdjustedMRC__c.setScale(2);
                                tempSE.NRC = (OLI.NRC_Price__c == null) ? 0.00 : OLI.NRC_Price__c.setScale(2);
                                tempSE.TotalCharge = tempSE.Quantity * tempSE.TotalMRC;
                                tempSE.partNumber = var.Part_Number__c;
                                tempSE.ProductName = pbEntry.Product2.Name;
                                
                                if ((tempSE.ProductName).contains('(Challenger)')) {
                                    tempSE.ProductName = (tempSE.ProductName).replace('(Challenger)','');
                                } else if ((tempSE.ProductName).contains('(Leader)')) {
                                    tempSE.ProductName = (tempSE.ProductName).replace('(Leader)','');
                                } else if ((tempSE.ProductName).contains('Leader')) {
                                    tempSE.ProductName = (tempSE.ProductName).replace('- Leader','');
                                } else if ((tempSE.ProductName).contains('Challenger')) {
                                    tempSE.ProductName = (tempSE.ProductName).replace('- Challenger','');
                                }
                                
                                System.debug('check 2');
                                tempSE.MRC = var.Quantity__c*(var.AdjustedMRC__c);//value getting displayed(MRC)
                                tempSE.MRC = (tempSE.MRC == null) ? 0 : tempSE.MRC.setScale(2);
                                System.debug(tempSE.MRC);
                                System.debug(tempSE);
                                strQuoteItemsExtensions.add(tempSE);
                                assignToAppropriateStrQuoteItemsExtension(tempSE);
                                system.debug('Temp SE after add = ' + tempSE);
                                system.debug('strQuoteItemsExtensions = ' + strQuoteItemsExtensions);
                                system.debug('######Size'+strQuoteItemsExtensions.size());
                            }catch(exception e){
                                system.debug('########'+e);
                            }
                        }
                        // MGG319 1/25/2019 End of Status validation to include on Proposal        
                    }  
                }
            }
            
            totalUpfrontCostHardware += totalNRCValue1;
            totalUpfrontCostHardware += totalNRCValue2;
            totalUpfrontCostHardware += totalNRCValue3;
            totalUpfrontCostHardware += totalNRCValue4;
            totalUpfrontCostHardware += totalNRCValue5;
            totalMonthlyRecurringCharge += totalMRCValue1;
            totalMonthlyRecurringCharge += totalMRCValue3;
            totalMonthlyRecurringCharge += totalMRCValue5;
            monthlyRecurringHardware += totalMRCValue3;
            monthlyRecurringHardware += totalMRCValue5;
            
            monthlyFinancePayment = (totalUpfrontCostHardware / 36).setScale(2);
            totalMonthlyFinancePayment = monthlyFinancePayment + totalMonthlyRecurringCharge;
            
            System.debug(strQuoteItemsExtensions.size());
            if(lSyncedQuote.size() == 2) {
                //qNameStr = 'Quote Numbers: ';
                for(SterlingQuote__c temp : lSyncedQuote) {
                    if(temp.RecordType.Name != 'SFA') {
                        quoteName = temp.Name;
                    }
                }
            }else if(lSyncedQuote.Size() == 1){
                // qNameStr = 'Quote Number: ';
                for(SterlingQuote__c temp : lSyncedQuote){
                    //if(temp.RecordType.Name == 'SFA'){
                    quoteName = temp.Name;
                    // }
                }
            }
        }
        
        
        quoteRepresent = ' ';
        
        
        Map<String,SteringQuoteItemExtension> mapSQIE = new Map<String,SteringQuoteItemExtension>();
        //strQuoteItemsExtensions.clear();
        List<SteringQuoteItemExtension> TempStore = new List<SteringQuoteItemExtension>();
        for(SteringQuoteItemExtension SQIE : strQuoteItemsExtensions){
            SQIE.ProductName = SQIE.ProductName.replace('(Challenger)','');
            SQIE.ProductName = SQIE.ProductName.replace('(Leader)','');
            if(SQIE.ProductName != 'Inter Lata Change Credit' && SQIE.ProductName != 'Inter Lata Change Charge' && SQIE.ProductName != 'Intra Lata Change Credit' && SQIE.ProductName !='Intra Lata Change Charge' && SQIE.ProductName != 'Broadband Full Installation  Term Credit' && SQIE.ProductName != 'Broadband Full Installation') {
                TempStore.add(SQIE);
            } else {
                mapSQIE.put(SQIE.ProductName, SQIE);
            }
            system.debug('mapSQIE = ' + mapSQIE);
        }
        system.debug('BEFORE SIZE: ' + mapSQIE.size());
        if(mapSQIE.containsKey('Inter Lata Change Credit')){
            mapSQIE.remove('Inter Lata Change Charge');
            mapSQIE.remove('Inter Lata Change Credit');
        }
        if(mapSQIE.containsKey('Intra Lata Change Credit')){
            mapSQIE.remove('Intra Lata Change Charge');
            mapSQIE.remove('Intra Lata Change Credit');
        }
        system.debug('mapSQIE.keySet(): ' + mapSQIE.keySet());
        if(mapSQIE.containsKey('Broadband Full Installation  Term Credit')){
            mapSQIE.remove('Broadband Full Installation');
            mapSQIE.remove('Broadband Full Installation  Term Credit');
        }               
        system.debug('AFTER SIZE: ' + mapSQIE.size());
        strQuoteItemsExtensions.clear();
        strQuoteItemsExtensions.addall(mapSQIE.values());
        strQuoteItemsExtensions.addall(TempStore);
    }
    
    public class SteringQuoteItemExtension {
        public String Id {get;set;}
        public String ProductId {get;set;}
        public decimal Quantity {get;set;}
        public decimal TermLength {get;set;}
        public decimal CPE_NRC_Price {get;set;}
        public decimal StandardNRC {get;set;}
        public String ProductName {get;set;}
        public Decimal standardMRC{get;set;}
        public Decimal NRC{get;set;}
        public Decimal MRC{get;set;}
        
        public String Category{get;set;}
        public Decimal AdjustedNRC {get;set;}
        public Decimal TotalMRC {get;set;}
        public Decimal TotalCharge {get;set;}
        public String partNumber {get;set;}
    }
}