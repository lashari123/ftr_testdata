trigger PrimarySiteAddress on Site__c (before insert , before update) {
Set<Id> contactId = new Set<Id>();
        for(Site__c  address:trigger.new){
            if(address.Primary__c == true){
                contactId.add(address.Opportunity__C);
            }
        }
   
        set<id> conIdSet =new set<id>();
       set<id> addIdSet =new set<id>();
       
        for(Site__c  ad : trigger.new){
            if(ad.Primary__c ==true){
            conIdSet.add(ad.Opportunity__C);
            addIdSet.add(ad.id);
                
            }
        }
        
      system.debug('conIdSet----'+conIdSet);
      system.debug('--addIdSet--'+addIdSet);
         List<Site__c > listAllAddress =[select id,Primary__c from Site__c  where Opportunity__C IN : conIdSet];
          List<Site__c > upd= new List<Site__c > ();
         for(Site__c  ad : listAllAddress ){
          system.debug('conIdSet----'+ad.id);
             if(!addIdSet.contains(ad.id)){
             system.debug('conIdSet----'+ad.id);
                 ad.Primary__c =false;
                 upd.add(ad);
             }
         }
         //update upd ;
    }