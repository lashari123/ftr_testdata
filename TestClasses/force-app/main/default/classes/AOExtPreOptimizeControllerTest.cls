@isTest
private class AOExtPreOptimizeControllerTest {
    
    @isTest
    private static void test_constructor_init() {
        Account acc = new Account(Name = 'TestAcc');
        
        AOExtPreOptimizeController ctrl = null;
        PageReference pageRef = null;

        // negative case: new Account (not in db). Cannot init properly.
        ctrl = new AOExtPreOptimizeController(new ApexPages.StandardController(acc));
        // as acc is not inserted, will not read accId.
        System.assertEquals(null, ctrl.accId);
        System.assertEquals(null, ctrl.acc);

        pageRef = ctrl.doInit();
        System.assertEquals(null, pageRef);
        System.assertEquals(null, ctrl.accId);
        System.assertEquals(null, ctrl.acc);
        System.assertEquals(null, ctrl.optAcc);

        // positive case: existing Account without OptAccs
        insert acc;
        ctrl = new AOExtPreOptimizeController(new ApexPages.StandardController(acc));
        // as acc is not inserted, will not read accId.
        System.assertEquals(acc.Id, ctrl.accId);
        System.assertEquals(null, ctrl.acc);

        PageReference aodbPageRef = AOExtPreOptimizeController.redirectTo(Page.ao2__AODBMain, acc.Id);

        pageRef = ctrl.doInit();
        System.assertEquals(null, pageRef);
        System.assertEquals(acc.Id, ctrl.accId);
        System.assertNotEquals(null, ctrl.acc);
        System.assertEquals(acc.Id, ctrl.acc.Id);
        System.assertNotEquals(null, ctrl.optAcc);
        System.assertEquals(null, ctrl.optAcc.Id);
        System.assertEquals(AOExtPreOptimizeController.buildOptimizedAccount(ctrl.acc), ctrl.optAcc);

        // workflow: confirm creating OptimizedAccount. Should insert OptAcc record and will return redirectTo(AODBMain, acc.Id) pageRef
        pageRef = ctrl.doContinue();
        System.assertEquals(null, ctrl.optAcc.Id);
        System.assertNotEquals(null, pageRef);
        System.assertEquals(aodbPageRef.getUrl(), pageRef.getUrl());

        
        // workflow: confirm creating OptimizedAccount. Should insert OptAcc record and will return redirectTo(AODBMain, acc.Id) pageRef
        pageRef = ctrl.doCreateAndContinue();
        System.assertNotEquals(null, ctrl.optAcc.Id);
        System.assertNotEquals(null, pageRef);
        System.assertEquals(aodbPageRef.getUrl(), pageRef.getUrl());

        // positive case: existing Account with OptAcc available; should auto-redirect to AODBMain
        ctrl = new AOExtPreOptimizeController(new ApexPages.StandardController(acc));
        System.assertEquals(acc.Id, ctrl.accId);
        System.assertEquals(null, ctrl.acc);

        pageRef = ctrl.doInit();
        System.assertNotEquals(null, pageRef);
        System.assertEquals(aodbPageRef.getUrl(), pageRef.getUrl());
        System.assertEquals(acc.Id, ctrl.accId);
        System.assertNotEquals(null, ctrl.acc);
        System.assertEquals(acc.Id, ctrl.acc.Id);
        System.assertNotEquals(null, ctrl.optAcc);
        System.assertNotEquals(null, ctrl.optAcc.Id);
    }
}