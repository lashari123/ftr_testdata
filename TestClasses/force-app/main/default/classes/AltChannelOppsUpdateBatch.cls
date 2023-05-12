global class AltChannelOppsUpdateBatch implements 
    Database.Batchable<sObject>, Database.Stateful {

    global List<Opportunity> start(Database.BatchableContext bc) {
        return [select id, isOwnerAltChannel__c, stagename, RPON_Order__c, Other_Reason_Lost_Details__c  from Opportunity where Owner.UserRole.Name LIKE 'B2B -%' and isOwnerAltChannel__c=false limit 50000];
    }

    global void execute(Database.BatchableContext bc, List<Opportunity> records){
        for (Opportunity opp : records) {
            if (opp.RPON_Order__c == null && opp.stagename =='Closed/Won')
                opp.RPON_Order__c = 'Autofilled';
            if (opp.Other_Reason_Lost_Details__c == null && opp.stagename == 'Closed/Lost')
                opp.Other_Reason_Lost_Details__c = 'Autofilled';
            opp.isOwnerAltChannel__c = true;
        }
        Database.SaveResult[] srList = Database.update(records, false);
        // Iterate through each returned result
        for (Database.SaveResult sr : srList) {
            if (!sr.isSuccess()) {
                // Operation failed, so get all errors                
                for(Database.Error err : sr.getErrors()) {
                    System.debug('The following error has occurred.');                    
                    System.debug(err.getStatusCode() + ': ' + err.getMessage());
                    System.debug('Fields that affected this error: ' + err.getFields());
                }
            }
        }
    }

    global void finish(Database.BatchableContext bc){
        system.debug('done!');
    }
}