global class sendEscalationEmailBatchSchedule implements schedulable
{
    global void execute(SchedulableContext sc)
    {
        sendEscalationEmailBatch objSendEscalationEmailBatch = new sendEscalationEmailBatch();
        Database.executeBatch(objSendEscalationEmailBatch, 200);
    }
}