public with sharing class ContentDocumentLinkUtility {

    public static void updateShareType(List<ContentDocumentLink> newItems){
        String orderPrefix;
        Map<String, Schema.SObjectType> gd =  Schema.getGlobalDescribe();  
        
        for(Schema.SObjectType stype : gd.values()){
            Schema.DescribeSObjectResult r = stype.getDescribe();
            if(r.getName() == 'Order'){
              orderPrefix = r.getKeyPrefix();
              break;
            }
        }
        
        for(ContentDocumentLink cdl : newItems){
        
            String checkPrefix = '';
            if (!String.isEmpty(String.valueOf(cdl.LinkedEntityId))) 
              checkPrefix = String.valueOf(cdl.LinkedEntityId).substring(0,3);
            system.debug('orderPrefix: ' + orderPrefix);
            system.debug('checkPrefix: ' + checkPrefix);
            if(checkPrefix == orderPrefix){
              cdl.ShareType = 'I';
            }
        }
   } 
   
}