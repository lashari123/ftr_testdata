global class ContractObjectupdateJob implements Database.Batchable<sObject>{

    global final String Query;
    global ContractObjectupdateJob(String q){
        Query=q;
    }
    global Database.QueryLocator start(Database.BatchableContext BC){
        return Database.getQueryLocator(query);
    }

    global void execute(Database.BatchableContext BC,List<sObject> scope){
        List<Contract> contracts = new List<Contract>();
        List<String> expiredContracts = new List<String>();
        final String promoStatusMessage = 'Expired';
        for(Sobject eachRec : scope){
            dsfs__DocuSign_Status__c expiredDocument = (dsfs__DocuSign_Status__c)eachRec;
            expiredContracts.add(expiredDocument.dsfs__Contract__c);
        }
        System.Debug('No Of Documents Voided');
         System.Debug(expiredContracts.size());
        if(expiredContracts.size() > 0){            
            List<Contract> contractsExpiredList = [SELECT Id,Promotional_Contract__c,Promo_Contract_Status__c FROM Contract WHERE Id In :expiredContracts];                              
            for(Contract c: contractsExpiredList){                           
                c.Promo_Contract_Status__c = promoStatusMessage;                
                if(c.Promotional_Contract__c == 'Promo'){                
                    contracts.add(c);        
                    system.debug('dinesh 12 '+c);       
                }                           
            }
        }
         System.Debug('No Of Contracts Updated');
         System.Debug(contracts.size());
        if( contracts.size() > 0 ){
            update contracts;
        }

    }

    global void finish(Database.BatchableContext BC){
        //Send an email to the User after your batch completes
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] toAddresses = new String[] {'dinesh.wadhwani@ftr.com'};
        mail.setToAddresses(toAddresses);
        mail.setSubject('Contract Objects Fields set to Expired for Expired Documents');
        mail.setPlainTextBody('Apex Job Process Completed');
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
    }

}