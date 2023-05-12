@isTest
private class ContactTriggerTest {
    @testSetup static void setup(){
        List<Contact> lstCon = new List<Contact>();
        
        contact con1 = new Contact();
        con1.LastName = 'test1';
        con1.Phone_Number_with_Extension__c = '(786) 234-2345 ext. 1234';
        
        contact con2 = new Contact();
        con2.LastName = 'test1';
        con2.Phone_Number_with_Extension__c = '(541) 754-3010 $ 7788';
        lstCon.add(con1);
        lstCon.add(con2);
        
        insert lstCon;
    }
    @isTest static void testContactTrigger() {
        system.assertEquals('1234', [select Extension__c from contact where Phone = '(786) 234-2345' limit 1].Extension__c);
        system.assertEquals('7788', [select Extension__c from contact where Phone = '(541) 754-3010' limit 1].Extension__c);
    }
}