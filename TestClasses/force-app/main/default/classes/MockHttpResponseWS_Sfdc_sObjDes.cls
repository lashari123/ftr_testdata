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
global class MockHttpResponseWS_Sfdc_sObjDes implements HttpCalloutMock {
	String inString = '{\n'+
						'"name": "abc",\n'+
						'"label" :"abc",\n'+
						'"customSetting" :true,\n'+
						'"undeletable" :true,\n'+
						'"mergeable" :true,\n'+
						'"replicateable" :true,\n'+
						'"triggerable" :true,\n'+
						'"feedEnabled" :true,\n'+
						'"retrieveable" :true,\n'+
						'"deprecatedAndHidden" :true,\n'+
						'"urls" :{"describe":"aaa", "layouts":"aaa", "rowTemplate":"aaa", "sobject_x":"aaa", "uiEditTemplate":"aaa", "uiDetailTemplate":"aaa", "uiNewRecord":"aaa"},\n'+
						'"fields" :[{"autoNumber":false, "byteLength":2}],\n'+
						'"custom" :true,\n'+
						'"keyPrefix" :"abc",\n'+
						'"searchable" :true,\n'+
						'"activateable" :true,\n'+
						'"layoutable" :true,\n'+
						'"labelPlural" :"abc",\n'+
						'"queryable":true,\n'+
						'"createable" :true,\n'+
						'"deletable" :true,\n'+
						'"updateable" :true\n'+
					'}';
    global HTTPResponse respond(HTTPRequest req) {
        System.assertEquals('https://' + URL.getSalesforceBaseUrl().getHost() + '/services/data/v28.0/sobjects/Account/describe', req.getEndpoint());
		System.assertEquals('GET', req.getMethod());
		HttpResponse res = new HttpResponse();
        res.setHeader('Authorization','Bearer ' + UserInfo.getSessionId());
        res.setBody(inString);
        res.setStatusCode(200);
        return res;
    }
}