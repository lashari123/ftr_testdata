global class OneTime_OpportunityRecordTypeUpdate implements 
    Database.Batchable<object>, Database.Stateful {

    global Integer recordsProcessed = 0;

    public class wrapper  {
        string recordType;
        Opportunity opp;
    }

    global List<object> start(Database.BatchableContext bc) {
        List<wrapper> oppMapList = new List<wrapper>();
        List<Id> vlocityOppIds = new List<Id>();
        String lightningRecordType = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Opportunity Lightning').getRecordTypeId();
        String memoRecordType = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Memo Read only').getRecordTypeId();
        // get vlocity opp ids
        for (Quote q : [select id, name, opportunityid, createddate from quote where opportunity.recordtype.name='closedopp recordtype' AND vlocity_cmt__PriceListId__c != null ]) {
            vlocityOppIds.add(q.opportunityid);
        }
        // get vlocity opps
        List<Opportunity> vlocityOpps = [select id, recordtypeid, Service_Address__c,Description__c from Opportunity where id IN :vlocityOppIds];
        for (Opportunity o : vlocityOpps) {
            wrapper oppty = new wrapper();
            oppty.recordType = lightningRecordType;
            oppty.opp = o;
            oppMapList.add(oppty);
        }
        // get the rest of the opps
        List<Opportunity> remainingOpps = [select id, recordtypeid,Service_Address__c,Description__c from Opportunity where recordtype.name='closedopp recordtype' and Id NOT IN :vlocityOppIds];
        for (Opportunity o : remainingOpps) {
            wrapper oppty = new wrapper();
            oppty.recordType = memoRecordType;
            oppty.opp = o;
            oppMapList.add(oppty);
        }
        return oppMapList;
    }

    global void execute(Database.BatchableContext bc, List<object> lst){
        // process them
        List<Opportunity> oppsToUpdate = new List<Opportunity>();
        for (object obj : lst) {
            wrapper oppWrapper = (wrapper) obj; 
            oppWrapper.opp.RecordTypeId = oppWrapper.recordType;
            if (String.isBlank(oppWrapper.opp.Service_Address__c)) {
                oppWrapper.opp.Service_Address__c = ' x ';
            }
            if (String.isBlank(oppWrapper.opp.Description__c)) {
                oppWrapper.opp.Description__c = ' x ';
            }
            oppsToUpdate.add(oppWrapper.opp);
        }
        Database.update(oppsToUpdate,false);
    }

    global void finish(Database.BatchableContext bc){
        System.debug(recordsProcessed + ' records updated!');
    }
}