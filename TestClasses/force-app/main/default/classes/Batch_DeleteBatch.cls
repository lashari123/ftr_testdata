global class Batch_DeleteBatch implements Schedulable {
   global void execute(SchedulableContext sc) {
      String query = 'SELECT Id FROM Products__c ORDER BY Id DESC LIMIT 1000000'; // Please add your query here.
        Database.executeBatch( new  Delete_Batch( query ) );
      String query2 = 'SELECT Id FROM Products__c ORDER BY Id ASC LIMIT 1000000'; // Please add your query here.
        Database.executeBatch(new Delete_Batch( query2 ) );
   }
}