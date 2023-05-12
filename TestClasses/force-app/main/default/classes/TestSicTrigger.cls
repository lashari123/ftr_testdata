public class TestSicTrigger {
    static testMethod void testCreateSicData() {
        Account[] accs = [Select Sic, Sic_desc__c, Id from Account limit 10];
        accs[0].Industry_Sic_Code__c = '3823'; // 103 char descr
        accs[1].Industry_Sic_Code__c = '46'; // pipelines
        accs[3].Industry_Sic_Code__c = '112'; // rice
        accs[6].Industry_Sic_Code__c = '94';
        accs[8].Industry_Sic_Code__c = '8661';
        //accs[9].Industry_Sic_Code__c = 'a';
        update accs;
    }
}