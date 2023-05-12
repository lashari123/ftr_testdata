trigger primarySiteTrigger on Site__c (after insert) {
    if(trigger.isAfter && trigger.isInsert){
        set<string> ids = new set<string>();
        if(trigger.new != null){
            for(Site__c site : trigger.new){
                ids.add(site.Opportunity__c);
            }
        }
        
        List<Site__c> siteList = new List<Site__c>();
        List<Site__c> siteList2 = new List<Site__c>();
        siteList = [select id, Site_city__c ,Primary__c, Site_Country__c , Site_zipcode__c ,Site_Name__c, Site_Street__c ,Site_Number__c,State__c from Site__c where Opportunity__c =: ids  ];
        
        if(siteList != null && !siteList.isEmpty()){
            for(Site__c site : siteList){
                if(site.Site_Number__c == 1){
                    site.Primary__c = true;
                    siteList2.add(site);
                }
                else{
                    if(site.Primary__c == true){
                        
                    }
                    site.Primary__c = false;
                    siteList2.add(site);
                }
            }
        }
        update  siteList2;
    }
}