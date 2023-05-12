@isTest
public class opportunityLogReadAccessTest{
    public static testMethod void testopportunityLogReadAccessTrigger(){
        
      
        Account a1 = new Account(Name = 'Test name for Account',phone = '585-777-777',memo__c ='inserted');
        insert a1;
        
        Opportunity o2 = new Opportunity(AccountId=a1.id, Name='Test Opp',StageName='Prospecting', CloseDate=Date.today(),memo__c ='inserted');
        insert o2;
        
       ApexPages.Standardcontroller stdcon12 = new ApexPages.Standardcontroller(o2);       
       OpportunityOverride  qObj = new OpportunityOverride(stdcon12);
        qObj.getSavedMemoList();
        qObj.selectedSavedMemo = 'Sample Text';
        qObj.getSelectedMemoList(); 
        o2.StageName='ClosedWon';
        o2.Reason_Won_Lost__c = 'Dont know';
        //opportunityLogReadAccess Trigger is invoked upon execution of following code
        update o2;  
       //End of Test Calls for trigger "opportunityLogReadAccess"
    }
}