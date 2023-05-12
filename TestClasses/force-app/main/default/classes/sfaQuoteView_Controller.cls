public with sharing class sfaQuoteView_Controller {
    public class QuoteWrapper {
        @AuraEnabled public String id { get; set; }
        @AuraEnabled public List<ftrProductWrapper> products { get; set; }
        @AuraEnabled public String addressCategory { get; set; }
        @AuraEnabled public String street { get; set; }
        @AuraEnabled public String city { get; set; }
        @AuraEnabled public String state { get; set; }
        @AuraEnabled public String postalCode { get; set; }
        @AuraEnabled public String name { get; set; }
        @AuraEnabled public date expirationDate { get; set; }
        @AuraEnabled public String opportunityId { get; set; }
    }

    @AuraEnabled
    public static List<ftrProductWrapper> getQuoteItems(Id quoteId){
        List<SterlingQuoteItem__c> quoteItems = [SELECT
                                                    Id,
        	                                        Products__c,
                                                    Pricebook_Entry_Id__c,
                                                    name,
                                                    SterlingQuote__c,
                                                    DiscountType__c,
                                                    Quantity__c,
                                                    TermLength__c,
                                                    CPE_NRC_Price__c,
                                                    CPE_Gross_Margin__c,
                                                    NetNewMRR__c,
                                                    AdjustedNRC__C,
                                                    renewal_mrr_original__c,
                                                    Products__r.Family,
                                                    Products__r.ProductCode,
                                                    Products__r.UnitPrice__c
                                                FROM SterlingQuoteItem__c
                                                WHERE SterlingQuote__c = :quoteId];
        List<ftrProductWrapper> res = new List<ftrProductWrapper>();
        for (SterlingQuoteItem__c quoteItem : quoteItems) {
            res.add(new ftrProductWrapper(quoteItem));
        }
        return res;
    }

    @AuraEnabled
    public static Void updateSfaQuote(QuoteWrapper quoteData) {
        SterlingQuote__c quoteToUpdate = [SELECT Id, Name, IsSyncing__c, ExpirationDate__c FROM SterlingQuote__c WHERE Id = :quoteData.Id LIMIT 1];
        quoteToUpdate.Name = quoteData.name;
        quoteToUpdate.IsSyncing__c = false;
        quoteToUpdate.ExpirationDate__c = quoteData.expirationDate;
        update quoteToUpdate;
        
        List<SterlingQuoteItem__c> quoteItemsToUpdate = [SELECT Id, name, Products__c, Pricebook_Entry_Id__c, SterlingQuote__c, DiscountType__c, 
                                                                Quantity__c, TermLength__c, CPE_NRC_Price__c, CPE_Gross_Margin__c, NetNewMRR__c,
                                                                AdjustedNRC__C, renewal_mrr_original__c, AdjustedMRC__c, TotalPrice__c
                                                            FROM SterlingQuoteItem__c
                                                            WHERE SterlingQuote__c = :quoteData.Id];
        
        Map<Id, SterlingQuoteItem__c> existingProductIdQuoteItemsMap = new Map<Id, SterlingQuoteItem__c>();
        for (SterlingQuoteItem__c item : quoteItemsToUpdate) {
            existingProductIdQuoteItemsMap.put(item.Products__c, item);
        }
        
        Map<Id, SterlingQuoteItem__c> productIdToSQI = new Map<Id, SterlingQuoteItem__c>();

        for (ftrProductWrapper product : quoteData.products) {
            SterlingQuoteItem__c quoteItem = existingProductIdQuoteItemsMap.get(product.Id);
            if (quoteItem != null) {
                quoteItem.DiscountType__c			= product.discountType;
                quoteItem.Quantity__c				= product.quantity;
                quoteItem.TermLength__c				= product.term;
                quoteItem.CPE_NRC_Price__c			= product.cpe;
                quoteItem.CPE_Gross_Margin__c		= product.cpeGrossMargin;
                quoteItem.NetNewMRR__c				= product.netNewMrr;
                quoteItem.AdjustedNRC__C			= product.nrc;
                quoteItem.renewal_mrr_original__c	= product.renewalMrr;
                quoteItem.AdjustedMRC__c			= product.renewalMrr + product.netNewMrr;
                quoteItem.TotalPrice__c				= (product.quantity * product.term * (product.renewalMrr + product.netNewMrr)) + product.nrc + product.cpe;
            } else {
                //existingProductIdQuoteItemsMap.put(product.Id, product.toSterlingQuoteItem(quoteData.Id));
                productIdToSQI.put(product.Id, product.toSterlingQuoteItem(quoteData.Id));
            }
        }
        
        if(productIdToSQI.size() > 0) {
            insert productIdToSQI.values();
            existingProductIdQuoteItemsMap.putAll(productIdToSQI);
        }
        
        update existingProductIdQuoteItemsMap.values();
        //SterlingQuoteUtility.syncQuote(newQuote);
    }

}