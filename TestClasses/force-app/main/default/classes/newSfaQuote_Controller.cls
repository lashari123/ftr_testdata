public class newSfaQuote_Controller {
    @AuraEnabled
    public static String getRecordType(String recordTypeId){
        return [SELECT Id, name FROM RecordType WHERE SobjectType = 'SterlingQuote__c' AND Id = :recordTypeId LIMIT 1].name;
    }
    
    @AuraEnabled
    public static Void createSfaQuote(QuoteWrapper quoteData) {
        SterlingQuote__c newQuote = new SterlingQuote__c();
        newQuote.Name = quoteData.name;
        newQuote.OpportunityId__c = quoteData.opportunityId;
        newQuote.IsSyncing__c = false;
        try {
            String[] expDateArray = quoteData.expirationDate.split('-');
            Integer year = Integer.valueOf(expDateArray[0]);
            Integer month = Integer.valueOf(expDateArray[1]);
            Integer day = Integer.valueOf(expDateArray[2]);
            newQuote.ExpirationDate__c = Date.newInstance(year, month, day);
        } catch(Exception ex) {
            newQuote.ExpirationDate__c = Date.today();
        }

        insert newQuote;
        
        List<SterlingQuoteItem__c> newQuoteItems = new List<SterlingQuoteItem__c>();
        for (ftrProductWrapper product : quoteData.products) {
            product.addressCategory = quoteData.addressCategory;
            product.addressStreet = quoteData.street;
            product.addressCity = quoteData.city;
            product.addressState = quoteData.state;
            product.addressPostalCode = quoteData.postalCode;
			newQuoteItems.add(product.toSterlingQuoteItem(newQuote.Id));
        }
        insert newQuoteItems;
        //SterlingQuoteUtility.syncQuote(newQuote);
    }
    
    public class QuoteWrapper {
        @AuraEnabled public List<ftrProductWrapper> products { get; set; }
        @AuraEnabled public String addressCategory { get; set; }
        @AuraEnabled public String street { get; set; }
        @AuraEnabled public String city { get; set; }
        @AuraEnabled public String state { get; set; }
        @AuraEnabled public String postalCode { get; set; }
        @AuraEnabled public String name { get; set; }
        @AuraEnabled public String expirationDate { get; set; }
        @AuraEnabled public String opportunityId { get; set; }
    }
}