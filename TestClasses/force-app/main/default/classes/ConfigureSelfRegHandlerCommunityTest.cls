/**
 * @description       : This test class covers the following Apex classes:
 *      TBD_CLASS1
 *      TBD_CLASS2
 *      TBD_CLASS3
 * @author            : TBD
 * @version           : 1 
**/
@isTest
public class ConfigureSelfRegHandlerCommunityTest{
    
    @TestSetup
    static void testData(){
        Account testAccount = new Account();
        testAccount.Name='Test Account' ;
        insert testAccount;
    }
    
    @isTest
    static void codeCoverage(){
        Profile p = [Select Id From Profile  where name = 'Standard User' limit 1];
        Account acc = [SELECT Id, Name FROM Account LIMIT 1];
        Map<SObjectField, String> registrationAttributes = new Map<SObjectField, String>();
        registrationAttributes.put(User.LastName, 'Test');
        ConfigureSelfRegHandlerCommunity crc = new ConfigureSelfRegHandlerCommunity();
        crc.createUser(acc.Id, p.Id, registrationAttributes, '');
    }
}