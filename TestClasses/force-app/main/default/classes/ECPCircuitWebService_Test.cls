/**
 * This class contains unit tests for validating the behavior of Apex classes
 * and triggers.
 *
 * Unit tests are class methods that verify whether a particular piece
 * of code is working properly. Unit test methods take no arguments,
 * commit no data to the database, and are flagged with the testMethod
 * keyword in the method definition.
 *
 * All test methods in an organization are executed whenever Apex code is deployed
 * to a production organization to confirm correctness, ensure code
 * coverage, and prevent regressions. All Apex classes are
 * required to have at least 75% code coverage in order to be deployed
 * to a production organization. In addition, all triggers must have some code coverage.
 * 
 * The @isTest class annotation indicates this class only contains test
 * methods. Classes defined with the @isTest annotation do not count against
 * the organization size limit for all Apex scripts.
 *
 * See the Apex Language Reference for more information about Testing and Code Coverage.
 */
@isTest
private class ECPCircuitWebService_Test {

    static testMethod void myUnitTest() {
        RestResponse res = new RestResponse();
        RestRequest req = new RestRequest();         
        req.requestURI = '/services/apexrest/Circuits';  
        req.httpMethod = 'GET';
        req.addParameter('accountnumber', '111');
        RestContext.request = req;
        RestContext.response = res;
        
        ECPCircuitWebService.doGet();
        System.debug(res);
        
        RestRequest req1 = new RestRequest();         
        req1.requestURI = '/services/apexrest/Circuits';  
        req1.httpMethod = 'GET';
        req1.addParameter('accountnumber', '');
        RestContext.request = req1;        
        ECPCircuitWebService.doGet();
        RestContext.response = res;
        System.debug(res);
        String str = JSON.SerializePretty(ECPCircuitWebService.validateInputParams(''));
        system.assert(str.contains('1000'),'Test Failed');
    }
}