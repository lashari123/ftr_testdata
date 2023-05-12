@isTest
public class TestLeadSicTrigger {
    static testMethod void testCreateSicData() {
    
        for(Integer count = 1; count <= 5; count++) {
            Lead testLead = new Lead();
            testLead.firstname = 'temp' + count;
            testLead.lastname = 'temp' + count;
            testLead.company = 'temp' + count;
            testLead.Lead_Stage__c = 'Prospect';
            insert testLead;
        }
    
        Lead[] lds = [Select Sic__c, Sic_description__c, Id from Lead limit 5];
        lds[0].Sic__c = '3823'; // 103 char descr
        lds[1].Sic__c = '46'; // pipelines
        lds[2].Sic__c = '112'; // rice
        lds[3].Sic__c = '94';
        lds[4].Sic__c = '8661';
        //lds[9].Sic__c = 'a';
        update lds;
    }
}