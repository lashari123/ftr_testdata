public class GenerateCloudManagedITProposalExtension {
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
    
    public GenerateCloudManagedITProposalExtension() {
            //SteringQuoteItemExtension tempSE = new SteringQuoteItemExtension();
            con = null;
            strQuoteItemsExtensions = new List<SteringQuoteItemExtension>();
            strQuotes = new List<SterlingQuoteItem__c>();
            
            currentDate = (Datetime.now()).format('MMMM dd, yyyy');
            oppId = ApexPages.currentPage().getParameters().get('oppId');
            proposalFuture = ApexPages.currentPage().getParameters().get('proposalFuture');
            proposalCompany = ApexPages.currentPage().getParameters().get('proposalCompany');
            
            opp = [SELECT Id, AccountId FROM Opportunity WHERE id =: oppId];            
            currentUser = [SELECT Id, Phone,Title, MobilePhone, Email, Name FROM User WHERE id =: UserInfo.getUserId()];
            lSyncedQuote = [SELECT Id,Name, RecordTypeId,RecordType.Name, Quote_Number__c FROM SterlingQuote__c WHERE OpportunityId__c =: oppId AND IsSyncing__c=true];         
            act = [SELECT id, Name FROM Account WHERE id =: opp.AccountId];
            System.debug('check 1');
            
            try{
            con = [SELECT AccountId, name FROM Contact where AccountId=: act.id];
            }catch(Exception ex){}
            
            integer count = 0;
            System.debug('check 2');
            if(lSyncedQuote != null && lSyncedQuote.size() > 0){             
                for(SterlingQuote__c temp : lSyncedQuote){
                        qNameStr = 'Quote Number: ';
                        quoteNumber = temp.Quote_Number__c;
                       /*if(count == 0){
                            quoteNumber = temp.Quote_Number__c;
                            count++;
                        }
                        else{
                            quoteNumber += ' & '+ temp.Quote_Number__c;
                        }
                        System.debug('check 3');*/
                    for(SterlingQuoteItem__c var : [SELECT Id, Name, Status__c,OverallStatus__c, DiscountType__c, Products__c,StandardMRC__c,Quantity__c, TermLength__c, CPE_NRC_Price__c, AdjustedNRC__c, StandardNRC__c, AdjustedMRC__c, Renewal_MRR_Original__c FROM SterlingQuoteItem__c WHERE ((SterlingQuote__c=: temp.Id)  AND(AdjustedNRC__c!= 0.00 OR AdjustedMRC__c!= 0.00))]){
                        system.debug('Selected Sterling Quote Items = ' + var.name);
                     //   System.debug(var.DiscountType__c +'  var.DiscountType__c:  '+ var.DiscountType__c  +'  var.OverallStatus__c:  '+ var.OverallStatus__c  +' '+ var.OverallStatus__c );
                     // MGG319 1/25/2019 Don't put Pending Items on Proposal
                        if(var.DiscountType__c == '' || var.DiscountType__c == null || var.OverallStatus__c != null && var.OverallStatus__c == 'Approved'){
                          //if(!(var.name).contains('Surcharge') && !(var.name).contains('Tax') && !(var.name).contains('Installation') && !(var.name).contains('Credit') && !(var.name).contains('Charge')){
                          if(!(var.name).contains('Surcharge') && !(var.name).contains('Tax') && !(var.name).contains('Credit') && !(var.name).contains('Charge')){
                            try{
                                
                                PricebookEntry pbEntry = [SELECT Id, Product2Id, Product2.Id, Product2.MajorProduct__c, Product2.Name FROM PriceBookEntry WHERE PriceBook2.isStandard=true AND Product2Id =: var.Products__c]; // RB - Defect 1476 
                                
                                SteringQuoteItemExtension tempSE = new SteringQuoteItemExtension();                                
                                tempSE.ProductId = var.Products__c;
                                tempSE.Quantity = var.Quantity__c;
                                tempSE.Id = var.Id;
                                tempSE.TermLength = var.TermLength__c;
                                tempSE.CPE_NRC_Price = var.CPE_NRC_Price__c;
                                
                               /* tempSE.StandardNRC = var.AdjustedNRC__c;
                                if(var.AdjustedNRC__c == 0){
                                    tempSE.StandardNRC = var.StandardNRC__c;
                                }
                                tempSE.NRC =  tempSE.StandardNRC +  var.CPE_NRC_Price__c; //value getting displayed(NRC)
                                System.debug('tempSE.StandardNRC: '+ tempSE.StandardNRC+ 'var.CPE_NRC_Price__c: '+var.CPE_NRC_Price__c);
                                */
                                System.debug('check 1');
                                System.debug('var.AdjustedNRC__c: '+var.AdjustedNRC__c+' var.CPE_NRC_Price__c  '+var.CPE_NRC_Price__c);
                                tempSE.NRC =  var.AdjustedNRC__c; //value getting displayed(NRC)
                                
                                if(var.CPE_NRC_Price__c != null){
                                 tempSE.NRC =  var.AdjustedNRC__c+   var.CPE_NRC_Price__c; //value getting displayed(NRC)
                                }
                                
                                tempSE.ProductName = pbEntry.Product2.Name;
                                
                                if((tempSE.ProductName).contains('(Challenger)')){
                                    tempSE.ProductName = (tempSE.ProductName).replace('(Challenger)','');
                                }else if((tempSE.ProductName).contains('(Leader)')){
                                    tempSE.ProductName = (tempSE.ProductName).replace('(Leader)','');
                                 }else if((tempSE.ProductName).contains('Leader')){
                                    tempSE.ProductName = (tempSE.ProductName).replace('- Leader','');
                                }else if((tempSE.ProductName).contains('Challenger')){
                                    tempSE.ProductName = (tempSE.ProductName).replace('- Challenger','');
                                }
                                
                                
                                
                                /*tempSE.standardMRC = var.AdjustedMRC__c;  
                                
                                if(var.AdjustedMRC__c == 0){
                                    tempSE.standardMRC = var.StandardMRC__c;
                                }
                                tempSE.MRC = var.Quantity__c*(tempSE.standardMRC + var.Renewal_MRR_Original__c);//value getting displayed(MRC)
                                */
                                System.debug('check 2');
                                //tempSE.MRC = var.Quantity__c*(var.AdjustedMRC__c + var.Renewal_MRR_Original__c);//value getting displayed(MRC)
                                tempSE.MRC = var.Quantity__c*(var.AdjustedMRC__c);//value getting displayed(MRC)
                                System.debug('tempSE.StandardMRC: '+ var.AdjustedMRC__c + 'var.Renewal_MRR_Original__c: '+var.Renewal_MRR_Original__c);
                                tempSE.MRC = (tempSE.MRC == null) ? 0 : tempSE.MRC.setScale(2);
                                System.debug(tempSE.MRC);
                                System.debug(tempSE);
                                strQuoteItemsExtensions.add(tempSE);
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
                //Commented out by Shane Baumgartner on 3/15/19 to consolidate the results to a single, consolidated row, per Devona
                //strQuoteItemsExtensions.addall(mapSQIE.values());
                //strQuoteItemsExtensions.addall(TempStore);
                
                Decimal maxTermLength = 0;
                SteringQuoteItemExtension consolidatedStQuoteItem = new SteringQuoteItemExtension();
                consolidatedStQuoteItem.ProductName = 'Cloud Managed Solutions';
                consolidatedStQuoteItem.NRC = 0;
                consolidatedStQuoteItem.MRC = 0;
                for(SteringQuoteItemExtension stQuoteItem : mapSQIE.values()) {
                    if(stQuoteItem.TermLength > maxTermLength) {
                        maxTermLength = stQuoteItem.TermLength;
                    }
                    consolidatedStQuoteItem.NRC += stQuoteItem.NRC.setScale(2);
                    consolidatedStQuoteItem.MRC += stQuoteItem.MRC.setScale(2);
                }
                for(SteringQuoteItemExtension stQuoteItem : TempStore) {
                    if(stQuoteItem.TermLength > maxTermLength) {
                        maxTermLength = stQuoteItem.TermLength;
                    }
                    consolidatedStQuoteItem.NRC += stQuoteItem.NRC.setScale(2);
                    consolidatedStQuoteItem.MRC += stQuoteItem.MRC.setScale(2);
                }
                consolidatedStQuoteItem.TermLength = maxTermLength;
                strQuoteItemsExtensions.add(consolidatedStQuoteItem);
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
    }
}