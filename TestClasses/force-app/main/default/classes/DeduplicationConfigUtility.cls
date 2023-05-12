public with sharing class DeduplicationConfigUtility {

    /* This method has been rendered unnecessary by the DeduplicationValidationUtility class and has been commented out.
    public static void checkDedupConfigCorrectness(List<Deduplication_Config__c> newDedupConfigList) {
        
        String query = null;
        for(Deduplication_Config__c dedupeConfig : newDedupConfigList) {
            query = 'SELECT Id, createddate, lastmodifieddate, ' + dedupeConfig.Comparison_Fields__c 
                    + ' FROM ' + dedupeConfig.Object_API_Name__c 
                    + ' Order By ' + dedupeConfig.Comparison_Fields__c + ' ASC'
                    + ' LIMIT 1';

            try {                    
                List<sObject> sobjList = Database.query(query);
            } catch (Exception e) {
                dedupeConfig.addError('Something is wrong with the Object API Name and/or Comparison Fields. Please examine the following error and correct: '+e.getMessage());
            }
            
            //We don't want loop SQL calls so break from this loop after only a single execution.
            break;
        }
    }
    */
    
    public static void ensureNameUniqueness(List<Deduplication_Config__c> newDedupConfigList) {
        
        List<String> newDedupeNames = new List<String>();
        
        for(Deduplication_Config__c dedupeConfig : newDedupConfigList) {
            newDedupeNames.add(dedupeConfig.name);
        }
        
        if(newDedupeNames.size() > 0) {
            List<Deduplication_Config__c> likeNamedDedupeConfigs = [SELECT id, name FROM Deduplication_Config__c WHERE name IN :newDedupeNames];
            
            Map<String, Id> dedupeConfigNameToId = new Map<String, Id>();
            for(Deduplication_Config__c dc : likeNamedDedupeConfigs) {
                dedupeConfigNameToId.put(dc.name, dc.id);
            }
            
            for(Deduplication_Config__c dedupeConfig : newDedupConfigList) {
                if(dedupeConfigNameToId.get(dedupeConfig.name) != dedupeConfig.Id) {
                    dedupeConfig.addError('The Name must be unique. Please change the name to ensure uniqueness.');
                }
            }
        }
    }

}