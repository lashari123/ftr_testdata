@isTest
public class TestWebServiceInitializerClass{

    static testmethod void testWebServiceInitialzer(){
        String accountId = 'Testclass';
        String cnum = '';
        WebServiceInitializer wsi = new WebServiceInitializer();
        Account ac = new Account();
        ac.Name='test';
        ac.Legal_Zip__c='1234567890';
        ac.Legal_State__c='teststate';
        ac.Legal_Street__c='legalstree';
        ac.Phone='12345';
        insert ac;
        
        accountId = ac.id;
       cnum =  WebServiceInitializer.getResponseFromWS(accountId);
        

        }
        
}