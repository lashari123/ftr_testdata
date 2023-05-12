global class HistoryMigrationCron implements Schedulable {

    global void execute(SchedulableContext SC) {
        HistoryMigration hm = new HistoryMigration();
        //hm.ProcessOpportunityObjectHistory();
        //hm.ProcessOpportunityFieldHistory();
        hm.ProcessAccountFieldHistory();
    }
}