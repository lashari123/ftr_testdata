public class DeduplicationConfigOnDemand {

    public Deduplication_Config__c dedupeConfig {get; set;}

    //Constructor
    public DeduplicationConfigOnDemand(ApexPages.StandardController controller) {
        dedupeConfig =  (Deduplication_Config__c) controller.getRecord();
    }

    //This class is the controller for the DeduplicationConfigOnDemandVF Visualforce page, and this method is called when the page instantiates. It kicks off the deduplication
    //process for a specific scenario (i.e. a specific scan as defined by the values of a single Deduplication_Config__c record), then redirects back to the
    //Deduplication_Config__c record's detail page.
    public PageReference executeDeduplicationScan() {
        //Kick off the batch
        BatchDeduplication bd = new BatchDeduplication(dedupeConfig);
        //The Id is grabbed but not currently used. Might be useful later for debugging or presented for end user in some fashion.
        Id batchprocessid = Database.executeBatch(bd);
        
        dedupeConfig.Last_Execution__c = System.Now();//Set the last execution time to now.
        //update dedupeConfig;

        PageReference pageRef = new PageReference('/'+dedupeConfig.Id);
        pageRef.setRedirect(true);
        
        //Because of the redirect, this message isn't likely to be seen (unless the end user's Internet is running real slow) but it'll be good to have in case it does ever
        //get presented in the future.
        ApexPages.addMessage(new ApexPages.message(ApexPages.Severity.INFO, dedupeConfig.name + ' Deduplication Process Initiated. Please wait 5 to 30 minutes for it to complete.'));
        
        return pageRef;
    }
}