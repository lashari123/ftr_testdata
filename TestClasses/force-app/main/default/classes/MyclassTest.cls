@isTest
public class MyclassTest{
 public static account accRec = null;
    public static testMethod void testMyClass(){

        SIC_Code__c s1 = new SIC_Code__c(SIC__c='ABCD', Description__c='TESTDESC');
        insert s1;
        account ac1 = new Account(Name = 'Test name for Account',phone = '585-777-777',memo__c ='inserted',Industry_Sic_Code__c = 'ABCD');
        insert ac1;
        ApexPages.Standardcontroller stdctrler = new ApexPages.Standardcontroller(ac1);   
        MyClass c = new MyClass(stdctrler);
        account temp = c.getAcc();
        
        
       //End of Test Calls for all Methods in "MyClass" Class
    }
}