trigger FTRWSSterlingQuoteTrigger on SterlingQuote__c (after update) {
    
    try {
        
        
        if( Trigger.isAfter && Trigger.isUpdate) {
            
        System.debug('FTRWSSterlingQuoteTriggerHandler.AfterUpdate');
        
      List<SterlingQuote__c> quotes = Trigger.New;
        SterlingQuote__c quote = null;
        if(quotes != null && quotes.size() > 0) {
        	quote = quotes.get(0);    
        }
        
        if(quote != null && String.isNotBlank(quote.Status__c) && (quote.Status__c.equalsIgnoreCase('Approved') || quote.Status__c.equalsIgnoreCase('Accepted'))) {
            RecordType recordtype = [SELECT DeveloperName,Id,Name,SobjectType FROM RecordType WHERE DeveloperName = 'Carrier_Service' AND SobjectType = 'SterlingQuote__c' limit 1];
            if(quote.RecordTypeId == recordtype.Id) {

            System.debug('quote id in FTRWSSterlingQuoteTrigger: ' + quote.Id);
            List<SterlingQuoteItem__c> sqis = [Select OverallStatus__c, Id from SterlingQuoteItem__c where SterlingQuote__c =:quote.Id];
            
            System.debug('quote items in FTRWSSterlingQuoteTrigger: ' + sqis);
            for(SterlingQuoteItem__c sqi : sqis) {
                if(sqi != null && String.isNotBlank(sqi.OverallStatus__c) && sqi.OverallStatus__c.equalsIgnoreCase('Pending')) {
                    sqi.OverallStatus__c = 'Approved';
                }
            }
            
            update sqis;
                
            }

        }
            
            
        }
        
    } catch (Exception ex) {
        System.debug('Exception in FTRWSSterlingQuoteTrigger: --'+ ex.getStackTraceString());
    }
}