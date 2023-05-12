@isTest
public with sharing class TestAccountOverrideController {
    static testMethod void testOverrideController() {
        
        AccountOverrideController ovr = new AccountOverrideController();
        String a = ovr.getOwner();
        ovr.Account = [Select id,name from Account Limit 1][0];
        system.debug('#####' + ovr.Account);
        ovr.Account.BillingStreet = '3022  Strother Street';
        ovr.Account.BillingCity = 'Into';
        ovr.Account.BillingState = 'Alabama';
        ovr.Account.BillingPostalCode = '35222';
        
        ovr.Account.ShippingCity='Into';
        ovr.Account.ShippingPostalCode='35222';
        ovr.Account.ShippingState='Alabama';
        ovr.Account.ShippingStreet='3022  Strother Street';
        
        ovr.Account = ovr.Account.clone(false,true);
        ovr.Account.Industry_SIC_Code__c ='';
        ovr.Account.SIC_Desc__c = 'TestDescription';
        ovr.Account.memo__c='test';
        insert ovr.Account;
        
        ovr.Id = ovr.Account.Id;
        PageReference b = ovr.save1();
        PageReference c = ovr.saveAndnew();
        ovr.showPopup();
        Boolean d = ovr.getDisplayPopup();
        ovr.Search();
        ovr.setCheckValue('Starts With');
        ovr.Search();
        ovr.sendMsg('Test Msg');
        List<SIC_Code__c> e = ovr.getobjList();
        List<SelectOption> f = ovr.getItems();
    }
    
    public static testMethod void testAccountOverrideTest(){
        
        System.Test.startTest();
        
        Account acc = new Account(Name = 'Test name for Account',phone = '585-777-777',memo__c ='inserted', 
                                  BillingStreet = '3022  Strother Street',
                                  BillingCity = 'Into',
                                  BillingState = 'Alabama',
                                  BillingPostalCode = '35222'
                                 );
        insert acc;
        
        History__c h = new History__c(
            Entity__c = 'Account',
            
            EntityID__c =acc.id,
            Memo__c = 'sample text',
            Operation__c = 'Delete',
            RelAccount__c = acc.id,
            user__c = userinfo.getUserId()
        );
        insert h;
        
        system.debug('HISTORY' + h);

        
        ApexPages.Standardcontroller stdcon0 = new ApexPages.Standardcontroller(acc);       
        AccountOverrideController  qObj = new AccountOverrideController(stdcon0);
        
        
        //AccountOverrideController qObj = new AccountOverrideController();

        qObj.Account = acc;
        qObj.getSavedMemoList();
        qObj.selectedSavedMemo = 'sample text';
        qObj.getSelectedMemoList();
        qObj.createLog();
        qObj.createLogDelete();
        
        acc.phone = '585-777-888';
        acc.memo__c = 'update Text';
        update acc; 
        
        System.Test.stopTest();
        
        
    }
    
    public static testMethod void testAccountOverrideTestDelete(){
        
        System.Test.startTest();
        
        Account acc = new Account(Name = 'Test name for Account',phone = '585-777-777',memo__c ='inserted', 
                                  BillingStreet = '3022  Strother Street',
                                  BillingCity = 'Into',
                                  BillingState = 'Alabama',
                                  BillingPostalCode = '35222'
                                 );
        insert acc;
        
        History__c h = new History__c(
            Entity__c = 'Account',
            
            EntityID__c =acc.id,
            Memo__c = 'sample text',
            Operation__c = 'Delete',
            RelAccount__c = acc.id,
            user__c = userinfo.getUserId()
        );
        insert h;
        
        system.debug('HISTORY' + h);

        
        ApexPages.Standardcontroller stdcon0 = new ApexPages.Standardcontroller(acc);       
        AccountOverrideController  qObj = new AccountOverrideController(stdcon0);
        
        
        //AccountOverrideController qObj = new AccountOverrideController();
        qobj.thisMemo = 'memo test';
        qObj.Account = acc;
        qObj.getSavedMemoList();
        qObj.selectedSavedMemo = 'sample text';
        qObj.getSelectedMemoList();
        qObj.createLog();
        qObj.createLogDelete();
        
        acc.phone = '585-777-888';
        acc.memo__c = 'update Text';

        
        System.Test.stopTest();
        
        
    }
}