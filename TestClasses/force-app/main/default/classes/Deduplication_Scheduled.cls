global class Deduplication_Scheduled Implements Schedulable
{
    global void execute(SchedulableContext sc)
    {
        executeDeduplication();
    }

    public void executeDeduplication()
    {
        Datetime dt = DateTime.newInstance(Date.today(), Time.newInstance(0, 0, 0, 0));
        String dayOfWeek = dt.format('EEEE');
    
        List<Deduplication_Config__c> dedupes = new List<Deduplication_Config__c>();
        dedupes = [SELECT id, name, Object_API_Name__c, Comparison_Fields__c, Non_Comparison_Fields__c, Last_Execution__c, Ignore_Case__c, Ignore_No_Data_Comparisons__c, Automatically_Run_On__c FROM Deduplication_Config__c ORDER BY Last_Execution__c ASC];
        
        List<Deduplication_Config__c> dedupesToUpdate = new List<Deduplication_Config__c>();
        for(Deduplication_Config__c dedupe : dedupes) {
        
            if(dedupe.Automatically_Run_On__c != null && dedupe.Automatically_Run_On__c.contains(dayOfWeek)) {
                BatchDeduplication bd = new BatchDeduplication(dedupe);
                Id batchprocessid = Database.executeBatch(bd);
            
                dedupe.Last_Execution__c = System.Now();
                dedupesToUpdate.add(dedupe);
            }
        }
        
        update dedupesToUpdate;
    }
}