public class SterlingQuoteUtility {
    public static Map<Id, SterlingQuote__c> getQuoteIdsFromOpportunity(Id oppId) {
        return new Map<Id, SterlingQuote__c>([SELECT Id FROM SterlingQuote__c WHERE OpportunityId__c = :oppId]);
    }
    
    public static Void syncQuote(SterlingQuote__c quote) {
        RecordType quoteRecordType = [SELECT Id, Name FROM RecordType WHERE Id = :quote.RecordTypeId LIMIT 1];
        Opportunity opp = [SELECT Id, Pricebook2Id FROM Opportunity WHERE Id = :quote.OpportunityId__c];
        unsyncQuoteType(opp, quoteRecordType);
        
        List<SterlingQuoteItem__c> quoteItems = [SELECT Id , Quantity__c, CPE_NRC_Price__c,
                                                     AdjustedNRC__c, StandardNRC__c, TermLength__c,
                                                     NumInstallments__c, AdjustedMRC__c, StandardMRC__c, 
                                                     CPE_Gross_Margin__c, Service_Address__c, Products__c
                                                 FROM SterlingQuoteItem__c
                                                 WHERE SterlingQuote__c = :quote.Id];
		addOpportunityLineItems(quoteItems, opp, quoteRecordType.Name);
        
        quote.IsSyncing__c = true;
        update quote;
    }
    
    public static Void unsyncQuoteType(Opportunity opp, RecordType quoteRecordType) {
        List<OpportunityLineItem> lineItems = [SELECT Id FROM OpportunityLineItem WHERE Opportunity_Sync__c = :quoteRecordType.Name AND OpportunityId = :opp.Id];
        delete lineItems;
        
        SterlingQuote__c quoteToUnsync = [SELECT Id, IsSyncing__c FROM SterlingQuote__c WHERE RecordTypeId = :quoteRecordType.Id AND OpportunityId__c = :opp.Id LIMIT 1];
        quoteToUnsync.IsSyncing__c = false;
        update quoteToUnsync;
    }
    
    private static Void addOpportunityLineItems(List<SterlingQuoteItem__c> quoteItems, Opportunity opp, String quoteType) {
        List<OpportunityLineItem> opportunityLineItems = new List<OpportunityLineItem>();
        Set<Id> productIds = getProductIds(quoteItems);
        Map<Id, Id> product2PricebookEntryMap = getProduct2PricebookIdMap(productIds, opp.Pricebook2Id);
        for (SterlingQuoteItem__c quoteItem : quoteItems) {
            opportunityLineItems.add(getOpportunityLineItem(quoteItem, opp, quoteType, product2PricebookEntryMap.get(quoteItem.Products__c)));
        }
        insert opportunityLineItems;
    }
    
    private static Set<Id> getProductIds(List<SterlingQuoteItem__c> quoteItems) {
        Set<Id> productIds = new Set<Id>();
        for (SterlingQuoteItem__c quoteItem : quoteitems) {
            productIds.add(quoteItem.Products__c);
        }
        return productIds;
    }
    
    private static OpportunityLineItem getOpportunityLineItem(SterlingQuoteItem__c quoteItem, Opportunity opp, String quoteType, String pricebookItemId) {
        return new OpportunityLineItem(
        	PricebookEntryId 	= pricebookItemId,
            Quantity			= quoteItem.Quantity__c,
            CPE_NRC_Price__c	= quoteItem.CPE_NRC_Price__c,
            NRC_Price__c		= quoteItem.AdjustedNRC__c == 0 ? quoteItem.StandardNRC__c : quoteItem.AdjustedNRC__c,
            Term_Months__c		= quoteItem.TermLength__c == 0 ? quoteItem.NumInstallments__c : quoteItem.TermLength__c,
            ContractMRR2__c		= quoteItem.AdjustedMRC__c == 0 ? quoteItem.StandardMRC__c : quoteItem.AdjustedMRC__c,
            CPE_Gross_Margin__c	= quoteItem.CPE_Gross_Margin__c,
            OpportunityId		= opp.Id,
            Opportunity_Sync__c	= quoteType,
            UnitPrice			= quoteItem.StandardMRC__c,
            quoteItem__c		= quoteItem.Id,
            Service_Address__c	= quoteItem.Service_Address__c 
        //     TotalPrice			= 0
        );
    }

    private static Map<Id,Id> getProduct2PricebookIdMap(Set<Id> productIds, Id pricebookId) {
        List<PricebookEntry> pricebookEntries = [SELECT Id, Product2Id FROM PricebookEntry WHERE Pricebook2Id = :pricebookId AND Product2Id IN :productIds];
        Map<Id, Id> product2PricebookMap = new Map<Id, Id>();
        for (PricebookEntry entry : pricebookEntries) {
			product2PricebookMap.put(entry.Product2Id, entry.Id)            ;
        }
        return product2PricebookMap;
    }
    
    public static List<SterlingQuoteItem__c> getQuoteItemsFromQuotes(Set<Id> quoteIds) {
        return [SELECT Id,
                    RecordType.Name,
                    Products__r.name, 
                    Renewal_MRR_Original__c, 
                    NetNewMRR__c, 
                    CurrentStatus__c, 
                    StandardMRC__c, 
                    AdjustedNRC__c, 
                    AdjustedMRC__c, 
                    OverallStatus__c, 
                    Quantity__c, 
                    IsPromoProduct__c, 
                    TermLength__c, 
                    NumInstallments__c, 
                    DiscountType__c, 
                    OpportunityLineItemId__c, 
                    Products__c, 
                    ApprovalRouting__c, 
                    NoICB__c, 
                    Part_Number__c, 
                    Category__c 
                FROM SterlingQuoteItem__c 
                WHERE SterlingQuote__c IN :quoteIds];        
    }

    public static List<SterlingQuoteItem__c> getQuoteItemsFromQuote(String quoteId) {
        return getQuoteItemsFromQuotes(new Set<Id> {quoteId});
    }

}