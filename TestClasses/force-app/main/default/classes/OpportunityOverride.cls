public with sharing class OpportunityOverride {

public Opportunity o {get;set;} 
    List<Opportunity> opps {get;set;}
    
    public List<History__c> myHistoryList = new List<History__c>();
    public String thisMemo {get;set;}    
    public String selectedSavedMemo {get;set;}
    /*constructor*/   
    public OpportunityOverride(ApexPages.StandardController stdcontroller){ 
        o = (Opportunity)stdController.getRecord(); 
        o = [SELECT ID,AccountID from Opportunity where ID =:o.id ];                                                                    
    }
  /*   
  //This method creates a log entery in sObject Acces_Log when a Patient contact record is viewed in Salesforce     
  public pagereference createLog(){  
    if (thisMemo =='' || thisMemo == null){
        ApexPages.addMessage(new ApexPages.message(ApexPages.severity.INFO,'Please enter a memo and click [Add & Proceed] button to View record.'));
        return null;
    }
                    
     History__c h = new History__c(
     Entity__c = 'Opportunity',
     EntityID__c =o.id,
     Memo__c = thisMemo,
     Operation__c = 'VIEW',
     //RelAccount__c = o.AccountId
     Opportunity__C = o.id,
     user__c = userinfo.getUserId() 
     );
     insert h;
                    
     PageReference pageRef = new PageReference('/'+o.id+'?nooverride=1');
     return pageRef;     
  }
  
   public pagereference createLogDelete(){                   
    if (thisMemo =='' || thisMemo == null){
        ApexPages.addMessage(new ApexPages.message(ApexPages.severity.INFO,'Please enter a memo and click [Add & Proceed] button to Delete record.'));
        return null;
    }
      History__c h = new History__c(
     Entity__c = 'Opportunity',
     EntityID__c =o.id,
     Memo__c = thisMemo,
     Operation__c = 'VIEW',
     //RelAccount__c = o.AccountId
     Opportunity__C = o.id,
     user__c = userinfo.getUserId() 
     );
     insert h;
         
     delete o;              
     PageReference pageRef = new PageReference('/006/o');
     return pageRef;
     
  }      
  */
  public List<SelectOption> getSavedMemoList(){
    List<SelectOption> options = new List<SelectOption>();
    options.add(new SelectOption('', '--select saved memo--'));
    Set<String> uniqueMemos = new Set<String>();
    myHistoryList = utilities.getMyHistory(o.id,'');
    
    //if (myHistoryList.Size()>0)
        //selectedSavedMemo = myHistoryList[0].Memo__c ;
        
    for(History__c h:myHistoryList)
            uniqueMemos.add(h.memo__c);
    
    for(String s :uniqueMemos)
        options.add(new SelectOption(s,s));
            
    return  options;    
  }
  
  public List<History__c> getSelectedMemoList(){    
    List<History__c> returnList = new List<History__c>();
    returnList = utilities.getMyHistory(o.id,selectedSavedMemo);    
    return  returnList;     
  }
  
}