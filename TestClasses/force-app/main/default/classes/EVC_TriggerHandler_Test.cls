@isTest
public class EVC_TriggerHandler_Test {
// just insert an evc, upsert the same evc, delete it, undelete it
    public static TestMethod Void doDMLOperations() {
        DGF_Test_Fixture_Factory.Test_Items testItems = DGF_Test_Fixture_Factory.createTestItems();
        testItems.EVCs[0].Name = 'blah';
        upsert testItems.EVCs[0];
        delete testItems.EVCs[1];
        undelete testItems.EVCs[1];
    }
}