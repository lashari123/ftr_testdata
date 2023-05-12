/**
* @description       : This test class covers the following Apex classes:
*      FTRWSDummyPnumSetup
*      TBD_CLASS2
*      TBD_CLASS3
* @author            : TBD
* @version           : 4 
**/
@isTest
public class FTRWSDummyPnumSetupTest {
    
    @testSetup static void makeData() {
        
        Account acc = new Account();
        acc.Name='testAccount';
        insert acc;
        
        FTRWSAcna__c acna = new FTRWSAcna__c();
        acna.Name = 'GIM';
        acna.Company__c = acc.id;
        insert acna;
        
        FTRWSAcna__c acna2 = new FTRWSAcna__c();
        acna2.Name = 'ATX';
        acna2.Company__c = acc.id;
        insert acna2;
        
        FTRWSPnum__c pnumObj1 = new FTRWSPnum__c();
        pnumObj1.PNum__c = 'EDGECOLOBASICICB';
        pnumObj1.Name = 'EDGECOLOBASICICB';
        pnumObj1.Wholesale_ACNA__c = acna.Id;
        insert pnumObj1;
        
        FTRWSPnum__c pnumObj2 = new FTRWSPnum__c();
        pnumObj2.PNum__c = 'DKFIBERBASICICB';
        pnumObj2.Name = 'DKFIBERBASICICB';
        pnumObj2.Wholesale_ACNA__c = acna.Id;
        insert pnumObj2;        
        
    }
    
    @isTest
    public static void codeCoverage() {
        Test.startTest();
        FTRWSDummyPnumSetup.createDummyPnumsForWholsaleACNA();
        Test.stopTest();
    }
    
      public static testmethod void getPnumsTest1(){
        String acna = 'GIM';
        Test.startTest();
        FTRWSDummyPnumSetupScheduler btch = new FTRWSDummyPnumSetupScheduler();
        String sch = '0 0 23 * * ?'; 
        system.schedule('FTRWSDummyPnumSetupScheduler', sch, btch);
        Test.stopTest();
        
    }
    
}