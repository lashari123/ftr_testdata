public class WSProductCatalogController {
    
    @AuraEnabled
    public static FTRWSCVDProductResponse getProductList(Id addressId, Id quoteId){
        
        //List<Product2> productList = [SELECT Id, name, description, RecordTypeId from PRODUCT2 LIMIT 10];
        //System.debug('Hemantha1:' + productList );
        //RETURN buildProductTreeGrid(productList);
        SterlingQuote__c quote = [SELECT Id, OpportunityId__c from SterlingQuote__c where Id=:quoteId];
        Opportunity opp = [SELECT Id, Wholesale_Pnum__c FROM Opportunity where Id=:quote.OpportunityId__c];
        FTRWSPnum__c pnum = [SELECT Id,PNum__c from FTRWSPnum__c where Id=:opp.Wholesale_Pnum__c];
        System.debug('addressId:' + addressId);
        System.debug('pnum:'+ pnum.PNum__c);
        // modifed by Siva on 09/22/2021 begin
          List<WSCatalogItems> nonCVDProducts = new List<WSCatalogItems>();
          FTRWSCVDProductResponse response = new FTRWSCVDProductResponse();
        If ( String.isNotBlank(pnum.PNum__c) && (pnum.PNum__c.startsWithIgnoreCase('EIA')  || pnum.PNum__c.startsWithIgnoreCase('EPA')) ){
          response = FTRWSCVDController.getWSProductsAndRates(addressId,pnum.PNum__c);
        }
        else{
            nonCVDProducts = FTRWSCVDController.getNonCVDProductCatalogItems(pnum.PNum__c);
          response.items = nonCVDProducts;
        }
        // modifed by Siva on 09/22/2021 end
        System.debug('response:' + response);
        return response;
    }
    
    @AuraEnabled
    public static void addToQuote(Id quoteId, Id addressId, String productName, String circuitType, String term, String mrc, String nrc, String mrcUsoc, String nrcUsoc, String cvdSource, String qos, String cvdPriceTier, String cvdPNum, string cvdratesid){
        
        Set<String> cvdProductList = new Set<String> ();
        cvdProductList.add('EPATH');
        cvdProductList.add('EIA');
        
        if(circuitType != null && (circuitType.contains('YR') || circuitType.contains('MTM'))) {
            System.debug('This is not a CVD Product, so ignore the product type for product : '+ circuitType);
            circuitType = '';
        }
        String searchProduct = '%' + productName + '%';
        Product2 product = [SELECT Id, Family, evcspeed__c FROM Product2 where Name LIKE :searchProduct and isActive = TRUE and recordType.Name = 'Carrier Service' LIMIT 1];
        FTRWSAddress__c address = [SELECT Id, Street_Number__c, Street_Name__c, Unit_Number__c, Zip_Code__c, 
                                   City__c,State__c, Id__c, Max_Qos__c, Copper_Tier__c, Fiber_Tier__c, DSAT_Max_Speed__c,
                                   DPI_Qualified__c, DSAT_Validated__c, DSAT_Qualified__c
                                   FROM FTRWSAddress__c WHERE Id =:addressId];
        
        if(product.Family != null && product.Family != '') {
            String prodFamily = product.Family;
            if(!cvdProductList.contains(prodFamily)) {
                cvdSource = '';
                circuitType = '';
                cvdPriceTier = '';
            }
            
        }
        
        SterlingQuoteItem__c quoteItem = new SterlingQuoteItem__c();
        quoteItem.Name = productName;
        quoteItem.Description__c = productName;
        quoteItem.circuitType__c = circuitType;
        
        quoteItem.SterlingQuote__c = quoteId;
        quoteItem.Products__c = product.Id;
        quoteItem.Quantity__c = 1;
        quoteItem.PNum__c = cvdPNum;
        
        if(mrc != null && mrc != '') {
            quoteItem.StandardMRC__c = decimal.valueOf(mrc);    
            quoteItem.NetNewMRR__c = decimal.valueOf(mrc);
            quoteItem.AdjustedMRC__c = decimal.valueOf(mrc);
            
        }
        
        if(nrc != null && nrc != '') {
            quoteItem.StandardNRC__c = decimal.valueOf(nrc);
            quoteItem.AdjustedNRC__c = decimal.valueOf(nrc);
        }
        
        
        quoteItem.ItemCode__c = mrcUsoc;
        quoteItem.NRC_Item_Code__c = nrcUsoc;
        quoteItem.Cvdrates_Id__c = cvdratesid;
        Integer termLength = getTermLength(term);        
        if(termLength != null && termLength != 0) {
            quoteItem.TermLength__c = termLength;    
        }
        
        
        quoteItem.SA_StreetNrFirst__c = address.Street_Number__c;
        quoteItem.SA_StreetName__c = address.Street_Name__c;
        quoteItem.SA_UnitNumber__c = address.Unit_Number__c;
        quoteItem.Zipcode__c = address.Zip_Code__c;
        quoteItem.Locality__c = address.City__c;
        quoteItem.StateProvince__c = address.State__c;
        quoteItem.DSAT_AddressID__c = address.Id__c;
        quoteItem.ST_AddressID__c = address.Id;
        
        quoteItem.cvdratesource__c = cvdSource;
        quoteItem.qos__c = qos;
        quoteItem.cvdPriceTier__c = cvdPriceTier;
        quoteItem.Max_QOS__c = address.Max_Qos__c;
        quoteItem.DSAT_Max_Speed__c = address.DSAT_Max_Speed__c;
        quoteItem.DSAT_Copper_Tier__c = address.Copper_Tier__c;
        quoteItem.DSAT_Fiber_Tier__c = address.Fiber_Tier__c;
        
        if(quoteItem.circuitType__c == 'EVC') {
            String evcSpeed = product.evcspeed__c;
            String dsatMaxSpeed = quoteItem.DSAT_Max_Speed__c;
            
            
            
            if(isBDTRequired(evcSpeed, dsatMaxSpeed, address,qos)) {
                quoteItem.BDT_Required__c = 'YES';
            } else {
                quoteItem.BDT_Required__c = 'NO';
            }
        }
        
        INSERT quoteItem;
        
    }
    
    public static Integer getTermLength(String term) {
        if(term == null || term == '') {
            return 0;
        }
        if (term.contains('1')){
            return 12;
        }else if(term.contains('2')){
            return 24;
        }else if(term.contains('3')){
            return 36;
        }else if(term.contains('4')){
            return 48;
        }else if(term.contains('5')){
            return 60;
        } else if(term.contains('MTM')) {
            return 0;
        }
        return 0;
    }
    
    @TestVisible
    private static boolean isBDTRequired(String evcSpeed, String dsatSpeed, FTRWSAddress__c address,String Qos) {
        Integer intEvcSpeed = 0;
        Integer intDsatSpeed = 0;
        
        Boolean dpiQualified = address.DPI_Qualified__c;
        Boolean dsatValidated = address.DSAT_Validated__c;
        Boolean dsatQualified = address.DSAT_Qualified__c;
        
        //If an address is DPI qualified but not dsat qualified, mark the quote item as BDT required
        if(dpiQualified && dsatValidated && !dsatQualified) {
            System.debug('Marking address as BDT required as address is not DSAT qualified');
            return true;
        }
        
        if(evcSpeed != null && evcSpeed != '') {
            if(evcSpeed.contains('M')) {
                evcSpeed = evcSpeed.substring(0,evcSpeed.indexOf('M'));
            } else if(evcSpeed.contains('G')) {
                evcSpeed = evcSpeed.substring(0,evcSpeed.indexOf('G'));
            }
            
            intEvcSpeed = Integer.valueOf(evcSpeed);
        }
        
        if(dsatSpeed != null && dsatSpeed != '') {
            String formattedDSATSpeed = getFormattedDsatSpeed(dsatSpeed);
            if(formattedDSATSpeed.contains('M')) {
                formattedDSATSpeed = formattedDSATSpeed.substring(0,formattedDSATSpeed.indexOf('M'));
            }
            
            intDsatSpeed = Integer.valueOf(formattedDSATSpeed);
        }
        
        //EVC speed chosen greater than the DSAT speed - BDT required is set to true
        if(intEvcSpeed > intDsatSpeed) {
            return true;    
        }
        if(address.Max_Qos__c=='Silver' && address.Max_Qos__c!=qos){
            return true;
        }
        if(address.Max_Qos__c=='Gold' && address.Max_Qos__c!=qos){
            return true;
        }
        return false;
    }
    
    @TestVisible
    private static String getFormattedDsatSpeed(String dsatSpeed) {
        
        String returnVal = '';
        if(dsatSpeed != null && dsatSpeed != '') {
            String tempStr = '';
            if(dsatSpeed.contains('G')) {
                tempStr = dsatSpeed.substring(0, dsatSpeed.indexOf('G'));
                Integer speedInt = Integer.valueOf(tempStr);
                speedInt = speedInt * 1000;
                returnVal = String.valueOf(speedInt);
            } else if(dsatSpeed.contains('g')) {
                tempStr = dsatSpeed.substring(0, dsatSpeed.indexOf('g'));
                Integer speedInt = Integer.valueOf(tempStr);
                speedInt = speedInt * 1000;
                returnVal = String.valueOf(speedInt);
            } else if(dsatSpeed.contains('M')) {
                returnVal = dsatSpeed.substring(0, dsatSpeed.indexOf('M'));
            } else if(dsatSpeed.contains('m')) {
                returnVal = dsatSpeed.substring(0, dsatSpeed.indexOf('m'));
            }
        }
        
        return returnVal;
    }    
    
}