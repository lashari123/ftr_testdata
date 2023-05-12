global class WS_SFA_ManageQuote {

    global class Product { 
        webservice String scheduleId;
        webservice Boolean isNewConstruction;
        webservice String dataRegion;
        webservice String addressDescription;
        webservice String networkDistance; 
        //webservice Boolean isInFrontierFootprint;//
        //webservice String cpqAddressId;//
        webservice WS_SFA_ManageQuote.AddressType AddressType;
        webservice String addressRemarkText;
        webservice String itemCode;
        webservice String cpqSku;
        webservice String cpqLineKey;
        webservice String cpqBundleParentLineKey; 
        webservice String expProductType;
        webservice Integer quantity;
        webservice Boolean grandfatheredItem;
        webservice Decimal standardMRC;
        webservice Decimal adjustedMRC;
        webservice Integer numInstallments;
        webservice Decimal standardNRC;
        webservice Decimal adjustedNRC;
        webservice Decimal floorPrice;
        webservice WS_SFA_ManageQuote.Discount Discount;
        webservice String description;
        webservice String cpqLineNumber;
        webservice Boolean isContracted;
        webservice Datetime requestedDueDate;
        webservice Integer productInterval;
        webservice Boolean isAddressQualified;
        webservice String metroEQualificationType;
        webservice Boolean isPromoProduct;
        webservice Decimal renewalMRR;
        webservice Decimal netnewMRR;
//  KTT883 2/11/2019 -- PV14319 -- Allows Sterling update for Generating UCaaS Quote
        webservice String category;
        webservice String NPANXX;
        webservice String PartNum;
        webservice String ServiceType;
        webservice WS_SFA_ManageQuote.Promotion[] Promotion;
        webservice WS_SFA_ManageQuote.AddressType[] ZAddress;
    }

    global class AddressType {
        webservice Boolean isInFrontierFootprint;
        webservice String cpqAddressId;
        webservice String dsatAddressId;
        webservice WS_SFA_ManageQuote.CitizensServiceAddress ServiceAddress;
        webservice WS_SFA_ManageQuote.CitizensPostalAddress PostalAddress;
    }

    global class CitizensServiceAddress {
        webservice String streetNrFirst;
        webservice String streetName;
        webservice String streetSubDescription;
        webservice String streetSuffix;
        webservice String streetDirection;
        webservice String streetPostDirection;
        webservice String subDivision;
        webservice String buildingName;
        webservice String locality;
        webservice String stateOrProvince;
        webservice String postCode;
        webservice WS_SFA_ManageQuote.AddressUnit Unit;
        webservice String wireCenter;
        webservice WS_SFA_ManageQuote.Exchange Exchange;
        webservice String serviceSequenceNumber;
        webservice String serviceControlNumber;
    }
    
    
    global class AddressUnit {
        webservice String number_x;
        webservice String designator;
    }

    global class Exchange {
        webservice String npa;
        webservice String nxx;
    }

    global class CitizensPostalAddress {
        webservice WS_SFA_ManageQuote.AddressText[] AddressText;
        webservice String locality;
        webservice String stateOrProvince;
        webservice String postCode;
        webservice String country;
    }

    global class AddressText {
        webservice String addressText;
        webservice Integer sequenceNumber;
    }

    global class Discount {
        webservice String discountType;
        webservice Decimal discountAmount;
        webservice Decimal discountAmountPercent;       
    }

    global class Promotion {
        webservice Boolean isTerm;
        webservice Integer termLength;
        webservice Datetime termEndDate;
        webservice Boolean termEndDateMismatch;
        webservice String promoName;
        webservice String promoId;
        webservice String promoSku;
        webservice Datetime promoExpirationDate;
        webservice Decimal promoDiscountAmount;     
    }

    global class Note {
        webservice String text;
        webservice String createdById;
        webservice Datetime createdDate;
        webservice String noteId;
        webservice Boolean internalOnly;
        webservice Boolean highPriority;
    }

    global class Quote {
        webservice String opportunityId;
        webservice String sfaQuoteId;
        webservice String cpqQuoteId;
        webservice String cpqQuoteName;
        webservice String cpqQuoteKey;
        webservice String cpqQuoteType;
        webservice String approvalType;
        webservice Boolean expediteIncluded;
        webservice String submittedById;
        webservice String quoteStatus;
        webservice String orderNumber;
        webservice WS_SFA_ManageQuote.Product[] Product;
        webservice WS_SFA_ManageQuote.Note[] Note;
    }

    global class Response {
        webservice Boolean ExecutionStatus;
        webservice WS_SFA_ManageQuote.ExecutionStatusMessage ExecutionStatusMessage;
        webservice String OpportunityId;
        webservice String SFAQuoteId;
        webservice String CPQQuoteId;
        webservice WS_SFA_ManageQuote.Request Request;
        public Response(WS_SFA_ManageQuote.Request cpqRequest){
            ExecutionStatus = TRUE;
            Request = cpqRequest;
        }
    }

    global class Request {
        webservice WS_SFA_ManageQuote.Quote Quote;
    }

    global class ExecutionStatusMessage {
        //webservice Exception cause;
        webservice Integer lineNumber;
        webservice String message;
        webservice String stackTrace;
        webservice String type;
        public ExecutionStatusMessage(Exception e){
            lineNumber = e.getLineNumber();
            message = e.getMessage();
            stackTrace = e.getStackTraceString();
            type = e.getTypeName();
        }
        public ExecutionStatusMessage(){
        }
    }
        
    public static void emailQuoteException(WS_SFA_ManageQuote.ExecutionStatusMessage ESM, String QuoteOperation){
        Messaging.reserveSingleEmailCapacity(2);
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        //String[] toAddresses = new String[] {'randy.buhrt@ftr.com'}; //commented out by Shane B, 8/27/18
        String[] toAddresses = new String[] {UserInfo.getUserEmail()}; //added by Shane B, 8/27/18
        //String[] ccAddresses = new String[] {'smith@gmail.com'};
        mail.setToAddresses(toAddresses);
        //mail.setCcAddresses(ccAddresses);
        mail.setReplyTo('integration-testing@ftr.com');
        mail.setSenderDisplayName('Integration Testing');
        if(QuoteOperation == 'CREATE'){
            mail.setSubject('Create Quote Operation Failure'); 
        }else if(QuoteOperation == 'UPDATE'){
            mail.setSubject('Update Quote Operation Failure');
        }
        mail.setBccSender(false);
        mail.setUseSignature(false);
        mail.setPlainTextBody(
            'Message: ' + ESM.message + '\n' +
            'Stack Trace: ' + ESM.stackTrace + '\n' +
            'Exception Type: ' + ESM.type + '\n' +
            'Exception LineNumber: ' + ESM.lineNumber + '\n' +
            'UserId: ' + userinfo.getuserid()
        );
        if(!Test.IsRunningTest()) {
            Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
        }
    }
    
    public static void emailQuoteContent(WS_SFA_ManageQuote.Quote Q, String QuoteOperation){
        Messaging.reserveSingleEmailCapacity(2);
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        //String[] toAddresses = new String[] {'randy.buhrt@ftr.com'}; //commented out by Shane B, 8/27/18
        String[] toAddresses = new String[] {UserInfo.getUserEmail()}; //added by Shane B, 8/27/18
        //String[] ccAddresses = new String[] {'smith@gmail.com'};
        mail.setToAddresses(toAddresses);
        //mail.setCcAddresses(ccAddresses);
        mail.setReplyTo('integration-testing@ftr.com');
        mail.setSenderDisplayName('Integration Testing');
        if(QuoteOperation == 'CREATE'){
            mail.setSubject('Sterling CreateQuote Details');
        }else if(QuoteOperation == 'UPDATE'){
            mail.setSubject('Sterling UpdateQuote Details');
        }
        
        mail.setBccSender(false);
        mail.setUseSignature(false);
        mail.setPlainTextBody(
            JSON.serializePretty(Q)
        );
        //Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
        if(!Test.IsRunningTest()) {
            List<Messaging.SendEmailResult> results = Messaging.sendEmail(new Messaging.Email[] { mail });
        }
        //system.debug(results);
    }

    webservice static Response createQuote(WS_SFA_ManageQuote.Request cpqRequest){
        WS_SFA_ManageQuote.Response createQuoteResponse = new WS_SFA_ManageQuote.Response(cpqRequest);
        Opportunity opp = null;
        try{
            opp = [SELECT Id, AccountId FROM Opportunity WHERE Id = :cpqRequest.Quote.opportunityId LIMIT 1];
        }catch(System.QueryException e){
            createQuoteResponse.ExecutionStatus = FALSE;
            createQuoteResponse.ExecutionStatusMessage = new WS_SFA_ManageQuote.ExecutionStatusMessage(e);
            createQuoteResponse.ExecutionStatusMessage.message = 'Invalid Opportunity Id';
         //   emailQuoteException(createQuoteResponse.ExecutionStatusMessage,'CREATE');  // MMG 10/29/2015  Code to comment this out was installed in production without the Floor Price update changes that were coded in May 2015              
        }
        RecordType recordType;
        User u;
        try{
            recordType = [SELECT Id, Name FROM RecordType WHERE SobjectType = 'SterlingQuote__c' AND DeveloperName = 'Sterling'];
            sterlingQuote__c sterlingQuote = WS_SFA_ManageQuote.populateQuote(cpqRequest.Quote, recordType.Id);
            if(sterlingQuote.Account_Name__c == null && opp != null)
                sterlingQuote.Account_Name__c = opp.AccountId;
            u =[select id, name from User where CSR_ID__c =: cpqRequest.Quote.submittedById LIMIT 1];
            system.debug('******* username :' +u);
             //sterlingQuote.CreatedById = u.Id;
             sterlingQuote.OwnerId = u.Id;
             //sterlingQuote.LastModifiedById = u.Id;
                         
            sterlingQuote.ExpirationDateTest__c = date.today().adddays(30);
            system.debug('******* date'+SterlingQuote);
            insert sterlingQuote;
            createQuoteResponse.CPQQuoteId = cpqRequest.Quote.cpqQuoteId;
            createQuoteResponse.OpportunityId = cpqRequest.Quote.opportunityId;
            createQuoteResponse.SFAQuoteId = sterlingQuote.Id;
        }catch(System.QueryException e){
            createQuoteResponse.ExecutionStatus = FALSE;
            createQuoteResponse.ExecutionStatusMessage = new WS_SFA_ManageQuote.ExecutionStatusMessage(e);
            if(recordType == null){
                createQuoteResponse.ExecutionStatusMessage.message ='Invalid Record Type';
            }
            if(u == null){
                createQuoteResponse.ExecutionStatusMessage.message ='User Access is denied.';
            }
          //  emailQuoteException(createQuoteResponse.ExecutionStatusMessage,'CREATE');   MMG 10/29/2015  Code to comment this out was installed in production without the Floor Price update changes that were coded in May 2015        
        }catch(System.DmlException e){
            createQuoteResponse.ExecutionStatus = FALSE;
            createQuoteResponse.ExecutionStatusMessage = new WS_SFA_ManageQuote.ExecutionStatusMessage(e);
          //  emailQuoteException(createQuoteResponse.ExecutionStatusMessage,'CREATE');   MMG 10/29/2015  Code to comment this out was installed in production without the Floor Price update changes that were coded in May 2015 
        }
        
   //emailQuoteContent(cpqRequest.Quote, 'CREATE');   MMG 10/29/2015  Code to comment this out was installed in production without the Floor Price update changes that were coded in May 2015  
        
        return createQuoteResponse;
    }
    
    static SterlingQuote__c populateQuote(WS_SFA_ManageQuote.Quote q, String recordTypeId){     
        SterlingQuote__c thisQuote = new SterlingQuote__c();        
        //  thisQuote.ApprovalType__c = q.approvalType;
        thisQuote.CPQQuoteId__c = q.cpqQuoteId;
        thisQuote.OpportunityId__c = q.opportunityId;
        thisQuote.SterlingQuoteId__c = q.cpqQuoteId;
        thisQuote.SterlingQuoteKey__c = q.cpqQuoteKey;
        //thisquote.ExpirationDate__c = date.today().adddays(30);
        //thisQuote.ExpediteIncluded__c = q.expediteIncluded;
        //thisQuote.LastModifiedById = q.submittedById;
        thisQuote.Name = q.cpqQuoteName;
        // MMG 8/20/2018 Picklist value for quotetype is NEW or RENEWAL, This If will never be executed.  Changing to check for blank, then populate with NEW
       // if(q.cpqQuoteType == 'N'){
       if(q.cpqQuoteType == ''){

            thisQuote.QuoteType__c = 'New';
       // }else if(q.cpqQuoteType == 'R'){  // MMG 8/20/2018
        //    thisQuote.QuoteType__c = 'Renewal'; // MMG 8/20/2018
        }else{
            thisQuote.QuoteType__c = q.cpqQuoteType;
        }        
        thisQuote.RecordTypeId = recordTypeId;        
        return thisQuote;
    }
    
    static ZAddress__c populateZAddress(SterlingQuoteItem__c qli, WS_SFA_ManageQuote.AddressType z) {
    
        ZAddress__c zAddr = new ZAddress__c();
        zAddr.SterlingQuoteItem__c = qli.Id;
        if(z.ServiceAddress != null) {
            zAddr.IsInFrontierFootprint__c = z.isInFrontierFootprint;
            zAddr.StreetNrFirst__c = z.ServiceAddress.streetNrFirst;
            zAddr.StreetName__c = z.ServiceAddress.streetName;
            zAddr.StreetSubDescription__c = z.ServiceAddress.streetSubDescription;
            zAddr.StreetSuffix__c = z.ServiceAddress.streetSuffix;
            zAddr.StreetDirection__c = z.ServiceAddress.streetDirection;
            // streetPostDirection                                  //create custom object in SFA
            zAddr.Subdivision__c = z.ServiceAddress.subDivision;
            zAddr.Locality__c = z.ServiceAddress.locality;
            zAddr.StateOrProvince__c = z.ServiceAddress.stateOrProvince;
            zAddr.BuildingName__c = z.ServiceAddress.buildingName;
            zAddr.WireCenter__c = z.ServiceAddress.wireCenter;
            zAddr.Subdivision__c = z.ServiceAddress.subDivision;
            zAddr.Postcode__c = z.ServiceAddress.postCode;
            if(z.ServiceAddress.Unit != null) {
                zAddr.unit_number__c = z.ServiceAddress.Unit.number_x;
                zAddr.unit_Designator__c = z.ServiceAddress.Unit.designator;
            }
            
            zAddr.NPA__c = z.ServiceAddress.Exchange.npa;
            zAddr.NXX__c = z.ServiceAddress.Exchange.nxx;
            zAddr.ServiceControlNumber__c = z.ServiceAddress.serviceControlNumber;
            zAddr.ServiceSequenceNumber__c = z.ServiceAddress.serviceSequenceNumber;       
            system.debug('xxxxx'+z.ServiceAddress.Exchange);
        }
        //WS_SFA_ManageQuote.AddressText[] AddressText;         //missing field in json file 
        if(z.PostalAddress != null) { 
            system.debug('addressText===' +z.PostalAddress.AddressText); 
            zAddr.Locality__c = z.PostalAddress.locality;
            zAddr.StateOrProvince__c = z.PostalAddress.stateOrProvince;
            zAddr.Postcode__c = z.PostalAddress.postCode;
            system.debug('=========PostalAddress' + z.PostalAddress);
            zAddr.Country__c = z.PostalAddress.country;
        }
        return zAddr;       
    }
    
    static SterlingQuoteItem__c populateQuoteItem(String QuoteId, WS_SFA_ManageQuote.Product Product, Map<String,Product2> mapProduct){
        SterlingQuoteItem__c SQI = new SterlingQuoteItem__c();
        SQI.SterlingQuote__c= QuoteId;
        SQI.AddressDescription__c = Product.addressDescription; // KTT 8/2018
                SQI.StandardNRC__c = Product.standardNRC;
        SQI.StandardMRC__c = Product.standardMRC;
        SQI.ST_LineKey__c = Product.cpqLineKey;
        SQI.AdjustedNRC__c = Product.adjustedNRC;
        SQI.AdjustedMRC__c = Product.adjustedMRC;
        SQI.FloorPrice__c = Product.floorPrice;
        SQI.Quantity__c = (Product.quantity != null ? Integer.valueOf(Product.quantity): 1);
        //SQI.Quantity__c = Product.quantity;
        SQI.ProductInterval__c = Product.productInterval;
        SQI.NumInstallments__c = Product.numInstallments;
        SQI.ItemCode__c = Product.itemCode;
        //SQI.IsPromoProduct__c = Product.isPromoProduct;
        SQI.IsPromoProduct__c = (Product.isPromoProduct != null ? Boolean.valueOf(Product.isPromoProduct): false); 
        SQI.IsNewConstruction__c = (Product.isNewConstruction != null ? Boolean.valueOf(Product.isNewConstruction): false); 
        SQI.IsContracted__c = (Product.isContracted != null ? Boolean.valueOf(Product.isContracted): false); 
        SQI.IsAddressQualified__c = (Product.isAddressQualified != null ? Boolean.valueOf(Product.isAddressQualified): false); 
        //SQI.IsContracted__c = Product.isContracted;
        //SQI.IsAddressQualified__c = Product.isAddressQualified;
        SQI.GrandFatheredItem__c = (Product.grandfatheredItem != null ? Boolean.valueOf(Product.grandfatheredItem): false);       
        //SQI.GrandFatheredItem__c = Product.grandfatheredItem;
        SQI.Description__c = Product.description;
        SQI.ST_SKU__C= Product.cpqSku;
        SQI.CPQLineNumber__c = Product.cpqLineNumber;
        SQI.MajorLine__c = decimal.valueof(Product.cpqLineNumber.split('\\.')[0]);
        SQI.MinorLine__c = decimal.valueof(Product.cpqLineNumber.split('\\.')[1]);
        SQI.SA_WireCenter__c = Product.AddressType.ServiceAddress.wireCenter;
        if(Product.AddressType.ServiceAddress.Unit != null) {
            SQI.SA_UnitNumber__c = Product.AddressType.ServiceAddress.Unit.number_x;
            SQI.SA_unitDesignator__c = Product.AddressType.ServiceAddress.Unit.designator;
        }
        SQI.SA_StreetSuffix__c= Product.AddressType.ServiceAddress.streetSuffix;
        SQI.SA_StreetNrFirst__c= Product.AddressType.ServiceAddress.streetNrFirst;
        SQI.SA_StreetName__c= Product.AddressType.ServiceAddress.streetName;
        SQI.SA_StreetDirection__c= Product.AddressType.ServiceAddress.streetDirection;
        SQI.stateProvince__c = Product.AddressType.ServiceAddress.stateOrProvince;
        SQI.serviceSequenceNumber__c = Product.AddressType.ServiceAddress.serviceSequenceNumber;
        SQI.serviceControlNumber__c = Product.AddressType.ServiceAddress.serviceControlNumber;

 //  KTT883 2/11/2019 -- PV14319 -- Allows Sterling update for Generating UCaaS Quote
        SQI.Category__c = product.category;
        SQI.NPA_NXX__c = product.NPANXX;
        SQI.Part_Number__c = product.PartNum; 
        SQI.ServiceType__c = product.ServiceType;


        SQI.postCode__c = Product.AddressType.ServiceAddress.postCode;
        SQI.locality__c = Product.AddressType.ServiceAddress.locality;
        if(Product.AddressType.ServiceAddress.Exchange != null) {
            SQI.nxx__c = Product.AddressType.ServiceAddress.Exchange.nxx;
            SQI.npa__c = Product.AddressType.ServiceAddress.Exchange.npa;
        }
        //SQI.ST_AddressID__c = Product.cpqAddressId;
        SQI.ST_AddressID__c = Product.AddressType.cpqAddressId;
        SQI.DSAT_AddressID__c = Product.AddressType.dsatAddressId;
        //SQI.IsInFrontierFootprint__c = Product.isInFrontierFootprint;
        SQI.IsInFrontierFootprint__c = (Product.AddressType.isInFrontierFootprint != null ? Boolean.valueOf(Product.AddressType.isInFrontierFootprint): true); 
        //SQI.IsInFrontierFootprint__c = Product.AddressType.isInFrontierFootprint;
        SQI.ST_LineKey__c = Product.cpqLineKey;
        SQI.ST_ParentLineKey__c = Product.cpqBundleParentLineKey;
        SQI.DiscountAmount__c = Product.Discount.discountAmount;
        system.debug(':::Mohan::: populateQuoteItem-renewalMRR = '+Product.renewalMRR);
        system.debug(':::Mohan::: populateQuoteItem-netnewMRR = '+Product.netnewMRR);
        
        if (Product.renewalMRR == null)
            SQI.Renewal_MRR_Original__c = 0;
        else        
            SQI.Renewal_MRR_Original__c = (Product.renewalMRR == null) ? 0 : Product.renewalMRR;

        if (Product.netnewMRR== null)
            SQI.NetNewMRR__c = 0;
        else               
            SQI.NetNewMRR__c = (Product.netnewMRR == null) ? 0 : Product.netnewMRR;
        
        if (SQI.Renewal_MRR_Original__c == 0) 
             SQI.NetNewMRR__c =   SQI.AdjustedMRC__c *  SQI.Quantity__c;
               
        //SQI.PercentageDiscountAmount__c = Product.Discount.discountAmountPercent; 
        SQI.RequestedDueDateNew__c = Product.requestedDueDate;
        if(Product.Discount.discountType == 'None'){
            SQI.DiscountType__c = '';
        }else if (Product.Discount.discountType == 'CTR'){
            SQI.DiscountType__c = '';
            SQI.isCTR__c = true;
        }else{
            SQI.DiscountType__c = Product.Discount.discountType;
        }
        
        if(mapProduct.get(Product.cpqSku) != null){
            SQI.Products__c = mapProduct.get(Product.cpqSku).Id;
            SQI.Product_Name_Quote__c = mapProduct.get(Product.cpqSku).Name;
            SQI.Name = mapProduct.get(Product.cpqSku).Product_Name_80_Char__c;
        }
        if(Product.Promotion != null){
          if(Product.Promotion[0] != null){
            if(Product.Promotion[0].termLength != null){
                SQI.TermLength__c = Product.Promotion[0].termLength;
            }
            if(Product.Promotion[0].promoExpirationDate != null){
              SQI.promoExpDate__c = Product.Promotion[0].promoExpirationDate;
            }
            if(Product.Promotion[0].promoDiscountAmount != null){
              SQI.promoDiscountAmount__c = Product.Promotion[0].promoDiscountAmount;
            }
          }
        }
        
         if(SQI.DiscountAmount__c  != null && SQI.DiscountAmount__c != 0.00 && SQI.StandardMRC__c != null && SQI.StandardMRC__c != 0.00 ) {
            //if (SQI.DiscountAmount__c != null && SQI.StandardMRC__c != null) {
                SQI.PercentageDiscountAmount__c = (((-(SQI.DiscountAmount__c))/SQI.StandardMRC__c)*100);
             //} 
                
             }else {
                SQI.PercentageDiscountAmount__c = Product.Discount.discountAmountPercent;
            
        }
        
        return SQI;
    }

    webservice static Response updateQuote(WS_SFA_ManageQuote.Request REQUEST){
        WS_SFA_ManageQuote.Response updateQuoteResponse = new WS_SFA_ManageQuote.Response(REQUEST);        
        try{
            //Map<WS_SFA_ManageQuote.Product,List<Promotion__c>> mapPromotions = new Map<WS_SFA_ManageQuote.Product,List<Promotion__c>>();
            Map<WS_SFA_ManageQuote.Product,SterlingQuoteItem__c> mapQuoteItems = new Map<WS_SFA_ManageQuote.Product,SterlingQuoteItem__c>();
            Map<String,Product2> mapProduct = new Map<String,Product2>();
            //  emailQuoteContent(REQUEST.Quote, 'UPDATE');  MMG 10/29/2015  Code to comment this out was installed in production without the Floor Price update changes that were coded in May 2015 
            SterlingQuote__c this_SterlingQuote = [SELECT Id FROM SterlingQuote__c WHERE Id = :REQUEST.Quote.sfaQuoteId];
            User u =[select id, name from User where CSR_ID__c =: REQUEST.Quote.submittedById limit 1];
            //this_SterlingQuote.LastModifiedById = u.Id;
            this_SterlingQuote.ExpediteIncluded__c = REQUEST.Quote.expediteIncluded;
            this_SterlingQuote.Name = REQUEST.Quote.cpqQuoteName;
            this_SterlingQuote.SterlingQuoteId__c = REQUEST.Quote.cpqQuoteId;
            //update this_SterlingQuote;
           
            //  Added Update of Quote Line Items when Approval Status = Pending or Approved.  Other status, records are deleted and then added in.  This keeps approval process from being deleted and have to be restarted
            Map<Id,SterlingQuoteItem__c> mapSQI_DELETE = new Map<Id,SterlingQuoteItem__c>();
            Map<Id,SterlingQuoteItem__c> mapSQI_UPDATE = new Map<Id,SterlingQuoteItem__c>();
            mapSQI_DELETE = new Map<Id,SterlingQuoteItem__c>([SELECT Id, ST_LineKey__c FROM SterlingQuoteItem__c WHERE SterlingQuote__c = :this_SterlingQuote.Id AND OverallStatus__c NOT IN ('Pending','Approved')]);
            if(mapSQI_DELETE.values().size() > 0){ delete mapSQI_DELETE.values(); }
            if(REQUEST.Quote.Product.size() > 0){
                for(WS_SFA_ManageQuote.Product this_product : REQUEST.Quote.Product){
                    mapProduct.put( this_product.cpqSku, null );
                }
                List<Product2> list_products = [SELECT Id, Name, Product_Name_80_Char__c, Sku__c FROM Product2 WHERE Sku__c IN :mapProduct.keySet()];
                for(Product2 this_product : list_products){
                    mapProduct.put(this_product.Sku__c,this_product);
                }
                // MMG 11/19/2015 Pick up DiscountAmount, DiscountAmountPercentage and StandardMRC to calculate DiscountAmount based on new AdjustedMRC coming in from Sterling.
                //  This is part of Remedy Ticket # INC000000756627
                List<SterlingQuoteItem__c> listExistingSQI = [Select Id, Renewal_MRR_Original__c, NetNewMRR__c, AdjustedMRC__c, FloorPrice__c, st_linekey__c, DiscountAmount__c, StandardMRC__c, PercentageDiscountAmount__c from SterlingQuoteItem__c WHERE SterlingQuote__c = :this_SterlingQuote.Id];

                for(WS_SFA_ManageQuote.Product this_product : REQUEST.Quote.Product){
                    for(SterlingQuoteItem__c existingSQI : listExistingSQI){
                        if(this_product.cpqLineKey == existingSQI.st_linekey__c){
                            existingSQI.AdjustedMRC__c = this_product.adjustedMRC;
                            if (this_product.renewalMRR == null)
                                existingSQI.Renewal_MRR_Original__c = 0;
                            else 
                                existingSQI.Renewal_MRR_Original__c = this_product.renewalMRR;
                            if (this_product.renewalMRR == null)
                                existingSQI.NetNewMRR__c = 0;
                            else
                                existingSQI.NetNewMRR__c = this_product.netnewMRR;
                            system.debug(':::Mohan::: updateQuote-renewalMRR = '+this_product.renewalMRR);
                            system.debug(':::Mohan::: updateQuote-netnewMRR = '+this_product.netnewMRR);
                            existingSQI.FloorPrice__c = this_product.floorPrice;
                            existingSQI.DiscountAmount__c = (existingSQI.StandardMRC__c - existingSQI.AdjustedMRC__c) *-1;
                            existingSQI.PercentageDiscountAmount__c = existingSQI.AdjustedMRC__c / existingSQI.StandardMRC__c;
                            system.debug('$$$$$$$$$ Calculated Discount = ' + existingSQI.DiscountAmount__c);
                            mapSQI_UPDATE.put(existingSQI.Id,existingSQI);
                        }
                    }
                    System.debug('===========this_product:'+this_product);
                    SterlingQuoteItem__c sqi = populateQuoteItem(this_SterlingQuote.Id,this_product,mapProduct);
                    sqi.OwnerId = u.Id;
                    if(mapSQI_UPDATE.size()>0){
                        for(SterlingQuoteItem__c this_sqi_tocheck : mapSQI_UPDATE.values()){
                            if(this_sqi_tocheck.ST_LineKey__c != sqi.ST_LineKey__c || Test.IsRunningTest()){
                                mapQuoteItems.put( this_product, sqi);
                            }
                        }
                    }else{
                        mapQuoteItems.put( this_product, sqi);
                    }
                    //mapQuoteItems.put( this_product, populateQuoteItem(this_SterlingQuote.Id,this_product,mapProduct) );
                }
                if(mapSQI_UPDATE.size() > 0){
                    update mapSQI_UPDATE.values();
                }
                if(mapQuoteItems.values().size() > 0){
                    insert mapQuoteItems.values();
                    List<ZAddress__c> zAddrList = new List<ZAddress__c>();
                    //system.debug(JSON.serializePretty(zAddrList));
                    for(WS_SFA_ManageQuote.Product this_product : REQUEST.Quote.Product) {                        
                        System.debug('===========this_products:'+this_product);
                        if(mapQuoteItems.get(this_product) != null){
                            SterlingQuoteItem__c sqi =  mapQuoteItems.get(this_product);
                            system.debug('-----this_product.ZAddress' + this_product.ZAddress);
                            if(this_product.ZAddress != null) {
                                System.debug('==================sqi.Id :'+sqi.Id);                 
                                for(WS_SFA_ManageQuote.AddressType zAddr: this_product.zAddress) {
                                    ZAddress__c zAddrPopulate = populateZAddress(sqi, zAddr);
                                    zAddrPopulate.SterlingQuoteItem__c = sqi.Id;
                                    zAddrList.add(zAddrPopulate);
                                }
                            }
                        }
                    }
                    System.debug('===============================zAddrList:'+zAddrList);    
                    if(!zAddrList.isEmpty())
                        insert zAddrList;
                    }
                system.debug(mapProduct);
                system.debug('========233==REQUEST.Quote.submittedById' + REQUEST.Quote.submittedById);
                system.debug('========233==name' + u.name);
            }
            if(!mapQuoteItems.isEmpty()) {
                Boolean isBelowMonth = false;
                for(SterlingQuoteItem__c sqi: mapQuoteItems.values()) {
                    if(sqi.promoExpDate__c < System.today().adddays(30)) {
                        //  this_sterlingQuote.ExpirationDate__c = mapQuoteItems.promoExpDate__c;
                        if(this_sterlingQuote.ExpirationDateTest__c == null || this_sterlingQuote.ExpirationDateTest__c > sqi.promoExpDate__C) {
                            this_sterlingQuote.ExpirationDateTest__c = sqi.promoExpDate__C;
                        }
                        isBelowMonth = true;
                    }
                }
                if(!isBelowMonth) {
                    this_sterlingQuote.ExpirationDateTest__c = date.today().adddays(30);
                }
            }
            
            update this_SterlingQuote;
            //List<Promotion__c> listPromo_DELETE = new List<Promotion__c>();
            //List<Promotion__c> listPromo_INSERT = new List<Promotion__c>();
        }catch(Exception e){
            
            System.debug('================================Exception e:'+e);
            
            updateQuoteResponse.ExecutionStatus = FALSE;
            updateQuoteResponse.ExecutionStatusMessage = new WS_SFA_ManageQuote.ExecutionStatusMessage(e);
            
           // emailQuoteException(updateQuoteResponse.ExecutionStatusMessage,'UPDATE');  MMG 10/29/2015  Code to comment this out was installed in production without the Floor Price update changes that were coded in May 2015 
        }
        return updateQuoteResponse;         
    } 
}