@isTest(seeAllData = true)
public class UtilitiesTest{
        @IsTest
    public static void isNumericOrDecimal_Test() {
        System.assert(Utilities.isNumericOrDecimal('1.1'), 'WHEN passed 1.1 THEN isNumericOrDecimal should return true but returned false.');
        System.assert(Utilities.isNumericOrDecimal('1'), 'WHEN passed 1 THEN isNumericOrDecimal should return true but returned false.');
        System.assert(!Utilities.isNumericOrDecimal('1.1.1'), 'WHEN passed 1.1.1 THEN isNumericOrDecimal should return false but returned true.');
        System.assert(!Utilities.isNumericOrDecimal('one'), 'WHEN passed one THEN isNumericOrDecimal should return false but returned true.');
    }
    public static testMethod void testUtilitys(){
        
        List<String> test1 = Utilities.getFieldList('History__c');
         List<String> tes31 = Utilities.getFieldList('Opportunity');
        List<String> test2 = Utilities.getFieldList(null);
        Account a1 = new Account(Name = 'Test name for Account',phone = '585-777-777',memo__c ='inserted');
        insert a1;
        
        Opportunity o2 = new Opportunity(AccountId=a1.id, Name='Test Opp',StageName='Prospecting', CloseDate=Date.today(),memo__c ='inserted');
        insert o2;
        
       Opportunity o3 = o2;
       ApexPages.Standardcontroller stdcon12 = new ApexPages.Standardcontroller(o2);       
       OpportunityOverride  qObj = new OpportunityOverride(stdcon12);
        qObj.getSavedMemoList();
        qObj.selectedSavedMemo = 'Sample Text';
        qObj.getSelectedMemoList();
        
        o2.StageName='ClosedWon';
       // o2.memo__c = 'update Text';
        o2.Reason_Won_Lost__c = 'Dont know';
        update o2;  
        Utilities.getHistoryList(o3,o2,'Opportunity');
        
         // List<History__c> listObjs3 =  Utilities.getHistoryList(s3,s4,'contact');
        List<History__c> myHistoryObjs =  Utilities.getMyHistory('001c00000060LKvAAM','TestNotes2');
        List<History__c> myHistoryObjs2 =  Utilities.getMyHistory('001c00000060LKvAAM','TestNotes2');
        List<History__c> myHistoryObjs3 =  Utilities.getMyHistory('006c0000002uUO7AAM','TestNotes2');
        
        SterlingQuoteItem__c sqiTest = [SELECT id, name, SterlingQuote__c, ShanePoke__c FROM SterlingQuoteItem__c ORDER BY createddate DESC LIMIT 1];
        sqiTest.name = sqiTest.name + 'test';
    sqiTest.ShanePoke__c = ''+System.Now();
        update sqiTest;

        Utilities.setOpportunityLineItem(null, sqiTest, false, o2.Id, null, 'test');
        
        Utilities.delLineItem(sqiTest.Id+'', sqiTest.SterlingQuote__c+'');
        
       //End of Test Calls for all Methods in Utilities Class
    }
}