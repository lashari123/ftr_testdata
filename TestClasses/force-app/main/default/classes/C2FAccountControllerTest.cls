@isTest(seeAllData = true)
public class C2FAccountControllerTest{

    public static testMethod void TestC2FAccountController() {
        Account act = [SELECT id FROM Account Order By createddate desc LIMIT 1];
        ApexPages.StandardController accountStandardCntrllr = new ApexPages.StandardController(act);
        C2FAccountController c2fAcctCntrllr = new C2FAccountController(accountStandardCntrllr);
        c2fAcctCntrllr.updateAccountWithC2FData();
    }
}