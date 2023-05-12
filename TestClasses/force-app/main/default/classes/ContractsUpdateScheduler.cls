global class ContractsUpdateScheduler implements Schedulable{
    global void execute(SchedulableContext sc) {
        String expiredDocumentsQry = 'SELECT Id,dsfs__Voided_Date_Time__c,dsfs__Contract__c,dsfs__Envelope_Status__c FROM dsfs__DocuSign_Status__c WHERE dsfs__Envelope_Status__c=\'Voided\' AND dsfs__Voided_Reason__c LIKE \'%Envelope has expired%\' AND dsfs__Voided_Date_Time__c = TODAY';
        System.debug('Dinesh123 '+ expiredDocumentsQry);
        ContractObjectupdateJob jobExec = new ContractObjectupdateJob(expiredDocumentsQry);
        String scheduleTimings = '0 0 4 * * ?';
        //system.schedule('Schedule Job 4AM', scheduleTimings, updateContractObjectJob);
       Database.executeBatch(jobExec,200);
    }
}