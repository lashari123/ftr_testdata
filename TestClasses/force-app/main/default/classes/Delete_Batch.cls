//by Kevin Tullos
//Last Edited: 5/22/2015
//This batch deletes all the records in a sobject.
//to run this, open developer console and execute the script below

//String query = 'SELECT Id FROM <sobject>'; // Please add your query here.
//Database.executeBatch( new  Delete_Batch( query ) );

global class Delete_Batch implements Database.Batchable<sObject>
{

    String query, value, field;
    
    global Delete_Batch(string s)
    {
        Query=s;
        //query = 'SELECT Id FROM Delete_Batch_Test__c';
    }
    
    global Database.QueryLocator start(Database.BatchableContext BC)
    {
       return Database.getQueryLocator(query); 
    }
   
    global void execute(Database.BatchableContext BC, List<sObject> scope)
    {
        Delete Scope;
    }
     
    global void finish(Database.BatchableContext BC)
    {
    }
}