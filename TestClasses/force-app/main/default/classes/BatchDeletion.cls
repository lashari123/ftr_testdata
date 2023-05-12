public class BatchDeletion implements Database.Batchable<sObject>
{
    public final String Query;
    public String massDeletionObj;
    public String deletionField;
    public String deletionValue;
    public String followUpObject;
    public String followUpField;
    public String followUpValue;

    //Constructor
    public BatchDeletion(String massDeletionObject, String deletionIdentificationField, String deletionIdentificationValue, String followUpDeletionObject, String followUpDeletionField, String followUpDeletionValue)
    {
        //Populate the member variables
        massDeletionObj = massDeletionObject;
        deletionField = deletionIdentificationField;
        deletionValue = deletionIdentificationValue;
        followUpObject = followUpDeletionObject;
        followUpField = followUpDeletionField;
        followUpValue = followUpDeletionValue;
        
        String testLimit = '';
        //If we're executing this code as part of a test class, limit the results to just 10 records to streamline things.
        if(Test.isRunningTest()) {
            testLimit = 'LIMIT 10';
        }
        
        Query = 'SELECT Id FROM ' + massDeletionObj + ' WHERE ' + deletionField + ' = :deletionValue Order By createdDate DESC ' + testLimit;
    }

    //Kicks off the batches of queries to process the deletion query
    public Database.QueryLocator start(Database.BatchableContext BC) 
    {   
        return Database.getQueryLocator(Query);
    }

    //For each batch in sequence, perform the following computations
    public void execute(Database.BatchableContext BC, List<Sobject> results) 
    {
        Database.Delete(results);    
    }

    public void finish(Database.BatchableContext BC) {
        if(followUpObject != null && followUpField != null && followUpValue != null) {
            sObject followUpRecord = Database.query('SELECT Id FROM ' + followUpObject + ' WHERE ' + followUpField + ' = :followUpValue');
            Database.Delete(followUpRecord);
        }
    }    
}