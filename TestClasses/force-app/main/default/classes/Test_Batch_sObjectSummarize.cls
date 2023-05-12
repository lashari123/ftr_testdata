@isTest
private class Test_Batch_sObjectSummarize {
    static testmethod void test1() { 
    
        List<sObjectField__c> sObjFlds = new List<sObjectField__c>();
        String qry = 'sObject__c';
        
        sObject__c sobj = new sObject__c(name__c='sObject__c', name='sObject__c');
        insert sobj;        
        sObject__c sObj1 = [Select id from sObject__c where name__c='sObject__c' and name='sObject__c'];
        
        
        sObjFlds.add(new sObjectField__c(name ='Test1', name__c ='name', upsertId__c='asdf1', recordsPopulated__c=1, sObject__c = sObj1.id));
        sObjFlds.add(new sObjectField__c(name ='Test2', name__c ='name__c', upsertId__c='asdf2', recordsPopulated__c=1, sObject__c = sObj1.id));
               
       
        try{
            insert sObjFlds;
        }catch(Exception ex){}
        
        Test.startTest();
        Batch_sObjectSummarize b = new Batch_sObjectSummarize(qry);
        System.debug(b);
        Database.executeBatch(b);
        Test.stopTest();
        
        }

}