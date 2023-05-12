@isTest
public class FTRWSDiscountResponseTest {

          @isTest
    public static void TestFTRWSDiscountResponse() {
        Test.startTest();
        FTRWSDiscountResponse res = new FTRWSDiscountResponse();
        res.actualAmt = 1000.00;
        res.adjustedAmt = 900.00;
        res.discAmt = 100.00;
        res.discAppliedBy = 'TESTER';
        res.displayAmt = '$1000.00';
		res.notes = 'TEST NOTES';
        res.recurringType = 'MRC';

        Test.stopTest();
    }
}