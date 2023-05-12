@isTest
public class RestCallerApiServiceTest {
    
    @isTest static void testCoverage() {
        Account testAccount = new Account();
        testAccount.Name='Test Account' ;
        insert testAccount;
        
        Contact cont = new Contact();
        cont.FirstName='Test';
        cont.LastName='Test';
        cont.phone = '5555555555';
        cont.Accountid= testAccount.id;
        insert cont;
        
        String phoneNumber = RestCallerApiService.getPhoneNumber(cont.Id);
        RestCallerApiService.login(phoneNumber);
        
    }
    
}