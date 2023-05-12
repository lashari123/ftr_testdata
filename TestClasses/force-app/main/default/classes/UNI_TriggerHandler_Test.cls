@isTest
public class UNI_TriggerHandler_Test {
    // just insert a uni, upsert the same uni, delete it, undelete it
    public static TestMethod Void doDMLOperations() {
        DGF_Test_Fixture_Factory.Test_Items testItems = DGF_Test_Fixture_Factory.createTestItems();
        testItems.UNIs[0].Speed__c = '1000';
        upsert testItems.UNIs[0];
        delete testItems.UNIs[1];
        undelete testItems.UNIs[1];
    }
}