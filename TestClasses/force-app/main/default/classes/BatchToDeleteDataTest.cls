@isTest
private class BatchToDeleteDataTest {

    static testMethod void myUnitTest() {
        AccountIDUnique__c objAccI = new AccountIDUnique__c();
        objAccI.Name = 'test';
        insert objAccI;
        
        Billing_Detail_2__c objBill = new Billing_Detail_2__c();
        objBill.name='test';
        insert objBill;
        
        //BatchToDeleteDataStart reassign = new BatchToDeleteDataStart();
		//reassign.query = 'SELECT Id, Name FROM AccountIDUnique__c ';
		//ID batchprocessid = Database.executeBatch(reassign);
		
		Database.QueryLocator QL;
        Database.BatchableContext BC;
        List<AccountIDUnique__c> AcctList = new List<AccountIDUnique__c>();
        BatchToDeleteDataStart AU = new BatchToDeleteDataStart();
        QL = AU.start(bc);
        
        //Database.QueryLocatorIterator QIT =  QL.iterator();
        //while (QIT.hasNext())
        for(Integer i=0;i<=10;i++)
        {
            //AccountIDUnique__c Acc = (AccountIDUnique__c)QIT.next();            
            AccountIDUnique__c Acc = new AccountIDUnique__c();
            Acc.name='test';
            System.debug(Acc);
            AcctList.add(Acc);
        }        
        
        //AcctList = ['SELECT Id, Name FROM AccountIDUnique__c '];
        AU.execute(BC, AcctList);
        AU.finish(BC); 
        
    }
}