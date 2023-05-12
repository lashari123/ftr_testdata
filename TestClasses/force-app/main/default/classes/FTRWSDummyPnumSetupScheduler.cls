global class FTRWSDummyPnumSetupScheduler implements Schedulable {
    global void execute(SchedulableContext sc) {
        
FTRWSDummyPnumSetup.createDummyPnumsForWholsaleACNA();
    }
}