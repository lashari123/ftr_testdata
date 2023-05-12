public class addressSelector_Controller {
	@AuraEnabled
    public static List<AddressSelectionWrapper> getAddresses(String oppId) {
        Id acctId = getOpportunityAccountId(oppId);
        Account acct = getAccountAddresses(acctId);
        List<AddressSelectionWrapper> addresses = new List<AddressSelectionWrapper>();
        addresses.add(new AddressSelectionWrapper('None','','','',''));
        if (acct.BillingStreet != null) {
            addresses.add(new AddressSelectionWrapper('Billing Address', 
                                                      acct.BillingStreet, 
                                                      acct.BillingCity, 
                                                      acct.BillingState, 
                                                      acct.BillingPostalCode));
        }
        if (acct.Legal_Street__c != null) {
            addresses.add(new AddressSelectionWrapper('Legal Address', 
                                                      acct.Legal_Street__c, 
                                                      acct.Legal_City__c, 
                                                      acct.Legal_State__c, 
                                                      acct.Legal_Zip__c));
        }
        if (acct.ShippingState != null) {
            addresses.add(new AddressSelectionWrapper('Shipping Address', 
                                                      acct.ShippingStreet, 
                                                      acct.ShippingCity, 
                                                      acct.ShippingState, 
                                                      acct.ShippingPostalCode));
        }
        return addresses;
    }
    
     private static String getFormattedAddress(String street, String City, String state, String postalCode) {
        String lineFeed = ', ';
        if (street == '') return '';
        return street + lineFeed
            + city + lineFeed
            + state + ' ' + postalCode;
    }
    
     private static Id getOpportunityAccountId(Id oppId) {
        return [SELECT AccountId FROM Opportunity WHERE Id = :oppId LIMIT 1].AccountId;
    }

     private static Account getAccountAddresses(Id accountId) {
        return [SELECT 
                BillingStreet,
                BillingCity,
                BillingState,
                BillingPostalCode,
                Legal_Street__c,
                Legal_City__c,
                Legal_State__c,
                Legal_Zip__c,
                ShippingStreet,
                ShippingCity,
                ShippingState,
                ShippingPostalCode 
                FROM ACCOUNT 
                WHERE id =: accountId];
    }
    
    public class AddressSelectionWrapper {
        @AuraEnabled public String category { get; set; }
        @AuraEnabled public String street { get; set; }
        @AuraEnabled public String city { get; set; }
        @AuraEnabled public String state { get; set; }
        @AuraEnabled public String postalCode { get; set; }
        @AuraEnabled public String formatted { get; set; }
        public AddressSelectionWrapper(String addressCategory, String addressStreet, String addressCity, String addressState, string addressPostalCode) {
            this.category = addressCategory;
            this.street = addressStreet;
            this.city = addressCity;
            this.state = addressState;
            this.postalCode = addressPostalCode;
            this.formatted = getFormattedAddress(addressStreet, addressCity, addressState, addressPostalCode);
        }
    }

}