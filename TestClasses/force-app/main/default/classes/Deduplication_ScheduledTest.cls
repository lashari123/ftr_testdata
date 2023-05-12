@isTest(seeAllData = true)
public class Deduplication_ScheduledTest {
    public static testMethod void testDeduplication_Scheduled() {
        Deduplication_Scheduled ds = new Deduplication_Scheduled();
        String sch = '0 0 23 * * ?'; 
        System.schedule('Test Deduplication Scheduled', sch, ds);
    }
}