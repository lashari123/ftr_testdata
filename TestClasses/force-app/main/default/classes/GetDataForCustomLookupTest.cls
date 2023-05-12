/**
 * @description       : This test class covers the following Apex classes:
 *      TBD_CLASS1
 *      TBD_CLASS2
 *      TBD_CLASS3
 * @author            : TBD
 * @version           : 1 
**/
@isTest
public class GetDataForCustomLookupTest {

    @testSetup static void CreateTestData(){
        Account acc = new Account(Name='acc1');
        insert acc;
        Contact newContact = new Contact(firstName='Test',LastName='Name',AccountId=acc.Id);        
    }
    @isTest
    public static void CheckContact(){
        List<Account> acc = [select Id from Account where Name='acc1'];
        List<Contact> contactObj = GetDataForCustomLookup.getSuggestions(acc[0].id,'abc');
        system.assertNotEquals(null,contactObj);
    }
}