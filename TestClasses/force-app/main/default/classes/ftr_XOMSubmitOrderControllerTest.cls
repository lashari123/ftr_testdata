/**
 * @description       : This test class covers the following Apex classes:
 *      TBD_CLASS1
 *      TBD_CLASS2
 *      TBD_CLASS3
 * @author            : TBD
 * @version           : 2
**/
@isTest
public class ftr_XOMSubmitOrderControllerTest {
    
    @TestSetup
    static void makeData(){
        User u = ftr_TestDataFactory.getUsers(new List<String> {'#Project Manager'})[0];
        insert u;
        try {
            insert new Group(
                Email='test@test.com',
                Type='Queue',
                Name='PM_Assignment'
            );
        } catch (Exception e) {
            System.debug(e.getMessage());
        }
    }
    
     static testMethod void XOMSCTest() {    
        //Premises
        vlocity_cmt__Premises__c Prms = new vlocity_cmt__Premises__c();
        Prms.WC_CLLI__c = 'MSTNWIXA';
        insert Prms;        
        //Custom Object Details
        ftr_PSRExchangeDetail__c Ex = new ftr_PSRExchangeDetail__c();
        Ex.WC_CLLI__c = 'MSTNWIXA';
        Ex.Company_Indicator_Code__c = 203;
        Ex.NPANXX__c = '608297';
        insert Ex;
        //Test Account Insert
        Id globalRecId = [select id,name,developername from recordtype where sobjecttype='account' and developername='global' LIMIT 1]?.Id;	
        Account globalAcc1 = new Account();	
        globalAcc1.Name = 'GLOBAL ACCOUNT';	
        globalAcc1.RecordTypeId = globalRecId;	
        //globalAcc.RecordTypeId = '012E0000000fDc3IAE';	
        insert globalAcc1;

        Account a = new Account();
        a.Name = 'Test Account';
        a.ParentId = globalAcc1.Id;
        insert a;
        Account serviceAccount = new Account();
        serviceAccount.Name = 'Service Account';
        serviceAccount.ShippingStreet = '1480 North Valley Parkway';
        serviceAccount.ShippingCity = 'Lewisville';     
        serviceAccount.ShippingState = 'Texas';
        serviceAccount.ShippingPostalCode = '75077';
        serviceAccount.vlocity_cmt__PremisesId__c= Prms.Id;
        insert serviceAccount;
        //Test Account 2
        Account a1 = new Account();
        a1.Name = 'Test Account 1';
        insert a1;
        Account serviceAccount1 = new Account();
        serviceAccount1.Name = 'Service Account 1';
        serviceAccount1.ShippingStreet = '1565 West Main Street';
        serviceAccount1.ShippingCity = 'Lewisville';        
        serviceAccount1.ShippingState = 'Texas';
        serviceAccount1.ShippingPostalCode = '75067';
        serviceAccount1.vlocity_cmt__PremisesId__c= Prms.Id;
        insert serviceAccount1;
        //Product-1
        Product2 p = new Product2();
        p.Name = ' Test EIA ';
        p.Description='Test EIA (Ethernet Internet Access)';
        p.productCode = 'ENT_ETH_EIA_0002';
        p.isActive = true;
        insert p;
        //Product-2
        Product2 p2 = new Product2();
        p2.Name = ' Test EVPL EVC ';
        p2.Description='Test EVPL EVC';
        p2.productCode = 'ENT_ETH_EVPL_0010';
        p2.isActive = true;
        insert p2;
        //Product-3
        Product2 p3 = new Product2();
        p3.Name = ' Test UNI ';
        p3.Description='Test UNI';
        p3.productCode = 'ENT_ETH_UNI_0001';
        p3.isActive = true;
        insert p3;
        //PriceBooks
        Id pricebookId = Test.getStandardPricebookId();
        PricebookEntry standardPrice1 = new PricebookEntry();
        standardPrice1.Pricebook2Id = pricebookId;
        standardPrice1.Product2Id = p.Id;
        standardPrice1.UnitPrice = 1;
        standardPrice1.IsActive = true;
        standardPrice1.UseStandardPrice = false;
        insert standardPrice1 ;
        Pricebook2 standardPb = new Pricebook2(Name = 'vlocitytest', Description = 'Price Book vlocity Products', IsActive = true);
        insert standardPb;
        PricebookEntry standardPrice = new PricebookEntry();
        standardPrice.Pricebook2Id = standardPb.Id;
        standardPrice.Product2Id = p.Id;
        standardPrice.UnitPrice = 1;
        standardPrice.IsActive = true;
        standardPrice.UseStandardPrice = false;
        insert standardPrice ;
        //Test Order Insert
        Order o = new Order();
        o.Name = 'Test Order 04.10.2020 KE';
        o.Status = 'Draft';
        o.EffectiveDate = system.today();
        o.EndDate = system.today() + 10;
        o.AccountId = a.id;
        o.Pricebook2Id =  standardPb.Id ;
        o.Products__c = 'SIP;EIA';
        o.Order_Stage__c = 'MSA Review';
        insert o;
        OrderItem i = new OrderItem();
        i.OrderId = o.id;
        i.Quantity = 24;
        i.UnitPrice = 240;
        i.Product2id = p.id;
        i.PricebookEntryId=standardPrice.id;
        i.vlocity_cmt__ServiceAccountId__c = serviceAccount.Id;
        i.vlocity_cmt__Product2Id__c = p.Id;
        //i.Total_Price__c = i.Quantity * i.UnitPrice;
        insert i;
        //Test OrderItem on second insert
        OrderItem i2 = new OrderItem();
        i2.OrderId = o.id;
        i2.Quantity = 10;
        i2.UnitPrice = 20;
        i2.PricebookEntryId=standardPrice.id;
        i2.vlocity_cmt__ServiceAccountId__c = serviceAccount1.Id;
        i2.vlocity_cmt__Product2Id__c = p.Id;
        //i2.Total_Price__c = i.Quantity * i.UnitPrice;
        insert i2;
        Map<String, Object> inputMap = new Map<String,Object>();
        Map<String, Object> outputMap = new Map<String,Object>();
        Map<String, Object> optionsMap = new Map<String,Object>();
        ApexPages.StandardController sc = new ApexPages.StandardController(o);
        ftr_XOMSubmitOrderController XOMSC = new ftr_XOMSubmitOrderController(sc); 
        try {
            XOMSC.submitOrder(); 
           // XOMSC.codeCoverageNeedToFixLater();
        }catch(Exception e){
            
        }
        //XOMSC.submitAsyncOrder();
        inputMap.put('contextId', o.id);
        ftr_XOMSubmitOrderController XOMSubOrder = new ftr_XOMSubmitOrderController();
        
        o.put('Network_Project_Specialist__c', [SELECT Id FROM User WHERE Email='Cpt.Awesome0@awesomesauce.com' AND Profile.Name = '#Project Manager'].Id);
        update o;
        XOMSubOrder.invokeMethod('submitOrder', inputMap, outputMap, optionsMap);
        inputMap.put('orderId', o.id);
        inputMap.put('contextId', o.id);
        ftr_XOMSubmitOrderController XOMServ = new ftr_XOMSubmitOrderController();
        XOMServ.invokeMethod('requestSEReview', inputMap, outputMap, optionsMap);
        XOMServ.invokeMethod('rejectOrder', inputMap, outputMap, optionsMap);
        XOMServ.invokeMethod('submitToMSA', inputMap, outputMap, optionsMap);
        XOMServ.invokeMethod('confirmProgressUCFOrder', inputMap, outputMap, optionsMap);
        
        inputMap.put('contextId', i.id);
        ftr_XOMSubmitOrderController XOMServ1 = new ftr_XOMSubmitOrderController();
        XOMServ1.invokeMethod('requestSEReview', inputMap, outputMap, optionsMap); 
        
       // o.Order_Stage__c = 'Solutions Engineering';
     //   update o;
       // XOMServ.invokeMethod('rejectOrder', inputMap, outputMap, optionsMap);
        
    }
     
    static testMethod void testSubmitOrder() {
        
        List<Order> oList = ftr_TestDataFactory.getOrders(1);
        oList[0].Products__c = 'EIA';
        insert oList;
        
        Test.startTest();
        
        ftr_XOMSubmitOrderController obj = new ftr_XOMSubmitOrderController();
        
        obj.invokeMethod('submitOrder', new Map<string,object>{'contextId'=>oList[0].Id}, new Map<string,object>(), new Map<string,object>());
        Test.stopTest();
        
    }
    
    static testMethod void testRequestSEReview() {
        
        List<Order> oList = ftr_TestDataFactory.getOrders(1);
        insert oList;
        
        Test.startTest();
        
        ftr_XOMSubmitOrderController obj = new ftr_XOMSubmitOrderController();
        obj.invokeMethod('requestSEReview', new Map<string,object>{'contextId'=>oList[0].Id}, new Map<string,object>(), new Map<string,object>());
        
        Test.stopTest();
        
    }
    
    static testMethod void testRejectMngdSvc() {
        
        List<Order> oList = ftr_TestDataFactory.getOrders(1);
        insert oList;
        
        Test.startTest();
        
        ftr_XOMSubmitOrderController obj = new ftr_XOMSubmitOrderController();
        obj.invokeMethod('rejectMngdSvc', new Map<string,object>{'contextId'=>oList[0].Id}, new Map<string,object>(), new Map<string,object>());
        
        Test.stopTest();
        
    }
    
    static testMethod void testSubmitForSEApproval() {
        
        List<Quote> oList = ftr_TestDataFactory.getQuotes(1);
        insert oList;
        
        Test.startTest();
        
        ftr_XOMSubmitOrderController obj = new ftr_XOMSubmitOrderController();
        obj.invokeMethod('submitForSEApproval', new Map<string,object>{'contextId'=>oList[0].Id}, new Map<string,object>(), new Map<string,object>());
        
        Test.stopTest();
        
    }
    
    static testMethod void testRequestSEReview2() {
        
        List<Order> oList = ftr_TestDataFactory.getOrders(1);
        oList[0].vlocity_cmt__QuoteId__c = oList[0].QuoteId;
        insert oList;
        
        Quote q = [select id, vlocity_cmt__ValidationStatus__c from quote where id=:oList[0].QuoteId];
        q.vlocity_cmt__ValidationStatus__c = 'Failed';
        update q;
        
        Test.startTest();
        
        ftr_XOMSubmitOrderController obj = new ftr_XOMSubmitOrderController();
        obj.invokeMethod('requestSEReview', new Map<string,object>{'contextId'=>oList[0].Id}, new Map<string,object>(), new Map<string,object>());
        obj.invokeMethod('confirmSubmitOrder', new Map<string,object>{'contextId'=>oList[0].Id}, new Map<string,object>(), new Map<string,object>());
        
        Test.stopTest();
        
    }
    
    static testMethod void testRejectOrder() {
        
        List<Order> oList = ftr_TestDataFactory.getOrders(1);
        insert oList;
        
        Test.startTest();
        
        ftr_XOMSubmitOrderController obj = new ftr_XOMSubmitOrderController();
        obj.invokeMethod('rejectOrder', new Map<string,object>{'contextId'=>oList[0].Id}, new Map<string,object>(), new Map<string,object>());
        Test.stopTest();
        
    }
    static testMethod void testSubmitforapproval() {
        
        List<Order> oList = ftr_TestDataFactory.getOrders(1);
        insert oList;
        List<Quote> Qst = ftr_TestDataFactory.getQuotes(1);
        insert Qst;
        
        Test.startTest();
        
        ftr_XOMSubmitOrderController obj = new ftr_XOMSubmitOrderController();
        obj.invokeMethod('submitForApproval', new Map<string,object>{'contextId'=>oList[0].Id}, new Map<string,object>(), new Map<string,object>());
        obj.accountHasFSA( new Map<string,object>{'contextId'=>Qst[0].Id}, new Map<string,object>(), new Map<string,object>());
        Test.stopTest();
        
    }
    
    static testMethod void testConfirmSubmitOrder() {
        
        List<Order> oList = ftr_TestDataFactory.getOrders(1);
        insert oList;
        
        Test.startTest();
        
        ftr_XOMSubmitOrderController obj = new ftr_XOMSubmitOrderController();
        obj.invokeMethod('confirmSubmitOrder', new Map<string,object>{'contextId'=>oList[0].Id}, new Map<string,object>(), new Map<string,object>());
        Test.stopTest();
        
    }
    
    static testMethod void testConfirmCompleteOrder() {
        
        List<Order> oList = ftr_TestDataFactory.getOrders(1);
        insert oList;
        
        Test.startTest();
        
        ftr_XOMSubmitOrderController obj = new ftr_XOMSubmitOrderController();
        obj.invokeMethod('confirmCompleteOrder', new Map<string,object>{'contextId'=>oList[0].Id}, new Map<string,object>(), new Map<string,object>());
        Test.stopTest();
        
    }
    
    static testMethod void testCancelOrder() {
        
        List<Order> oList = ftr_TestDataFactory.getOrders(1);
        insert oList;
        
        Test.startTest();
        
        ftr_XOMSubmitOrderController obj = new ftr_XOMSubmitOrderController();
        obj.invokeMethod('cancelOrder', new Map<string,object>{'contextId'=>oList[0].Id}, new Map<string,object>(), new Map<string,object>());
        obj.invokeMethod('confirmCancelOrder', new Map<string,object>{'contextId'=>oList[0].Id}, new Map<string,object>(), new Map<string,object>());
        Test.stopTest();
        
    }
    
    static testMethod void testPSAssignment() {
        
        List<Order> oList = ftr_TestDataFactory.getOrders(1);
        oList[0].Products__c = 'EIA';
        insert oList;
        
        Test.startTest();
        try {
            ftr_XOMSubmitOrderController obj = new ftr_XOMSubmitOrderController();
            obj.checkForProjectSpecialist(new Map<string,object>{'contextId'=>oList[0].Id}, new Map<string,object>(), new Map<string,object>());
        } catch (EXception e) {
            System.debug(e.getMessage());
        }
        Test.stopTest();
        
    }
    
    static testMethod void testSubmitOrderAsync() {
        
        List<Order> oList = ftr_TestDataFactory.getOrders(1);
        insert oList;
        String orderId = oList[0].Id;
        Test.startTest();
        try {
            System.enqueueJob(new ftr_XOMSubmitOrderController.DecomposeOrderAsync(orderId));
            System.enqueueJob(new ftr_XOMSubmitOrderController.CreatePlanAsync(orderId));
            
        } catch (EXception e) {
            System.debug(e.getMessage());
        }
        Test.stopTest();
        
    }
    
    static testMethod void testSubmitOrderSC() {
        
        List<Order> oList = ftr_TestDataFactory.getOrders(1);
        insert oList;
        
        Test.startTest();
        try {
            ApexPages.StandardController sc = new ApexPages.StandardController(oList[0]);
            ftr_XOMSubmitOrderController XOMSC = new ftr_XOMSubmitOrderController(sc);
            XOMSC.submitOrder(); 
        } catch (EXception e) {
            System.debug(e.getMessage());
        }
        Test.stopTest();
        
    }
    
    static testMethod void testSendOrderDetails() {
        
        List<Order> oList = ftr_TestDataFactory.getOrders(1);
        insert oList;
        
        Test.startTest();
        try {
            Order currentOrder = [SELECT Id, Network_Project_Specialist__c,Order_Stage__c,OwnerId, OrderNumber, vlocity_cmt__OrderStatus__c, AccountId FROM Order WHERE Id = :oList[0].Id];
            ftr_XOMSubmitOrderController serv = new ftr_XOMSubmitOrderController();
            serv.sendOrderDetails(currentOrder, new List<String>{'test@mail.com'}); 
        } catch (EXception e) {
            System.debug(e.getMessage());
        }
        Test.stopTest();
        
    }

    static testMethod void testSubmitToDealDesk() {
        
        List<Quote> oList = ftr_TestDataFactory.getQuotes(1);
        insert oList;
        
        Test.startTest();
        
        ftr_XOMSubmitOrderController obj = new ftr_XOMSubmitOrderController();
        obj.invokeMethod('submitForDealDeskApproval', new Map<string,object>{'contextId'=>oList[0].Id}, new Map<string,object>(), new Map<string,object>());
        
        Test.stopTest();
        
    }
    
    static testMethod void testStageOrder() {
        Order o = ftr_TestDataFactory.getOrders(1)[0];
        o.Order_Stage__c = 'CNP Quality Assurance';
        o.Products__c = 'SIP;EIA';
        insert o;
        
        Test.startTest();
        ftr_XOMSubmitOrderController obj = new ftr_XOMSubmitOrderController();
        obj.invokeMethod('stageOrder', new Map<string,object>{'contextId'=>o.Id}, new Map<string,object>(), new Map<string,object>());
        o.put('Order_Stage__c', 'Solutions Engineering');
        update o;
        obj.invokeMethod('stageOrder', new Map<string,object>{'contextId'=>o.Id}, new Map<string,object>(), new Map<string,object>());
        Test.stopTest();
    }
    
    static testMethod void testFloorPriceValidation() {
        
        List<QuoteLineItem> oList = ftr_TestDataFactory.getQLI(1, 1);
        insert oList;
        Quote q = [SELECT Id FROM QUOTE LIMIT 1];
        Test.startTest();
        ftr_XOMSubmitOrderController obj = new ftr_XOMSubmitOrderController();
        obj.invokeMethod('checkQLI', new Map<string,object>{'contextId'=>q.Id}, new Map<string,object>(), new Map<string,object>());
        QuoteLineItem qli = [SELECT vlocity_cmt__CpqCardinalityMessage__c FROM QuoteLineItem WHERE QuoteId = :q.Id];
        qli.vlocity_cmt__CpqCardinalityMessage__c = 'cannot be test';
        qli.vlocity_cmt__CpqCardinalityMessage__c = 'cannot be test';
        update qli;
        obj.invokeMethod('checkQLI', new Map<string,object>{'contextId'=>q.Id}, new Map<string,object>(), new Map<string,object>());
        obj.invokeMethod('checkQLIAndFSA', new Map<string,object>{'contextId'=>q.Id}, new Map<string,object>(), new Map<string,object>());
        obj.accountHasFSA(new Map<string,object>{'contextId'=>q.Id}, new Map<string,object>(), new Map<string,object>());
        Test.stopTest();
    }
    
    Static testMethod void teststageMFWOrder(){
        Account Acc = new Account();
        Acc.name='Test Account';
        insert Acc;
        
        group ObjGrp = new group();
        ObjGrp.name = 'test group';
        insert ObjGrp;
        
        Pricebook2 standardPb = new Pricebook2(Name = 'vlocitytest', Description = 'Price Book vlocity Products', IsActive = true);
        insert standardPb;
        
        List<Order> lstOrder = new List<Order>();
        Order ObjOrder = new Order();
        ObjOrder.EffectiveDate = system.today();
        ObjOrder.EndDate = system.today() + 40;
        ObjOrder.Pricebook2Id =  standardPb.Id ;
        ObjOrder.Products__c = 'SIP;EIA';
        ObjOrder.Name = 'Test order';
        ObjOrder.Status = 'Draft';
        ObjOrder.order_stage__c ='In Progress';
        ObjOrder.OwnerId = ObjGrp.Id;
        ObjOrder.AccountId = Acc.Id;
        lstOrder.add(ObjOrder);
        
        Order ObjOrder2 = new Order();
        ObjOrder2.EffectiveDate = system.today();
        ObjOrder2.EndDate = system.today() + 40;
        ObjOrder2.Pricebook2Id =  standardPb.Id ;
        ObjOrder2.Products__c = 'SIP;EIA';
        ObjOrder2.Name = 'Test order';
        ObjOrder2.Status = 'Draft';
        ObjOrder2.order_stage__c ='Customer Network Provisioning';
        ObjOrder2.OwnerId = ObjGrp.Id;
        ObjOrder2.AccountId = Acc.Id;
        
        lstOrder.add(ObjOrder2);
        Insert lstOrder;
        
        ftr_XOMSubmitOrderController objCont = new ftr_XOMSubmitOrderController();
        objCont.stageMFWOrder(lstOrder[0].Id);
        objCont.stageMFWOrder(lstOrder[1].Id);
        
    }
    Static testMethod void teststageUCFOrderCNF(){
        Account Acc = new Account();
        Acc.name='Test Account';
        insert Acc;
        
        group ObjGrp = new group();
        ObjGrp.name = 'test group';
        insert ObjGrp;
        
        Pricebook2 standardPb = new Pricebook2(Name = 'vlocitytest', Description = 'Price Book vlocity Products', IsActive = true);
        insert standardPb;
        
        List<Order> lstOrder = new List<Order>();
        Order ObjOrder = new Order();
        ObjOrder.EffectiveDate = system.today();
        ObjOrder.EndDate = system.today() + 40;
        ObjOrder.Pricebook2Id =  standardPb.Id ;
        ObjOrder.Products__c = 'UCF';
        ObjOrder.Name = 'Test UCF order';
        ObjOrder.Status = 'Draft';
        ObjOrder.order_stage__c ='Customer Network Provisioning';
        ObjOrder.OwnerId = ObjGrp.Id;
        ObjOrder.AccountId = Acc.Id;
        lstOrder.add(ObjOrder);
        Insert lstOrder;
        
        ftr_XOMSubmitOrderController objCont = new ftr_XOMSubmitOrderController();
        objCont.stageUCFOrder(lstOrder[0].Id);
        
    }
    
    Static testMethod void teststageUCFOrderQA(){
        Account Acc = new Account();
        Acc.name='Test Account';
        insert Acc;
        
        group ObjGrp = new group();
        ObjGrp.name = 'test group';
        insert ObjGrp;
        
        Pricebook2 standardPb = new Pricebook2(Name = 'vlocitytest', Description = 'Price Book vlocity Products', IsActive = true);
        insert standardPb;
        
        List<Order> lstOrder = new List<Order>();
        Order ObjOrder = new Order();
        ObjOrder.EffectiveDate = system.today();
        ObjOrder.EndDate = system.today() + 40;
        ObjOrder.Pricebook2Id =  standardPb.Id ;
        ObjOrder.Products__c = 'SIP;EIA';
        ObjOrder.Name = 'Test UCF QA order';
        ObjOrder.Status = 'Draft';
        ObjOrder.order_stage__c ='QA Review';
        ObjOrder.OwnerId = ObjGrp.Id;
        ObjOrder.AccountId = Acc.Id;
        lstOrder.add(ObjOrder);
        Insert lstOrder;
        
        ftr_XOMSubmitOrderController objCont = new ftr_XOMSubmitOrderController();
        objCont.stageUCFOrder(lstOrder[0].Id);
        
    }
    
    Static testMethod void teststageUCFOrderInP(){
        Account Acc = new Account();
        Acc.name='Test Account';
        insert Acc;
        
        group ObjGrp = new group();
        ObjGrp.name = 'test group';
        insert ObjGrp;
        
        Pricebook2 standardPb = new Pricebook2(Name = 'vlocitytest', Description = 'Price Book vlocity Products', IsActive = true);
        insert standardPb;
        
        List<Order> lstOrder = new List<Order>();
        Order ObjOrder = new Order();
        ObjOrder.EffectiveDate = system.today();
        ObjOrder.EndDate = system.today() + 40;
        ObjOrder.Pricebook2Id =  standardPb.Id ;
        ObjOrder.Products__c = 'SIP;EIA';
        ObjOrder.Name = 'Test UCF In Progress order';
        ObjOrder.Status = 'Draft';
        ObjOrder.order_stage__c ='In Progress';
        ObjOrder.OwnerId = ObjGrp.Id;
        ObjOrder.AccountId = Acc.Id;
        lstOrder.add(ObjOrder);
        Insert lstOrder;
        
        ftr_XOMSubmitOrderController objCont = new ftr_XOMSubmitOrderController();
        objCont.stageUCFOrder(lstOrder[0].Id);
        
    }
    Static TestMethod void TestQueueable(){
        Account Acc = new Account();
        Acc.name='Test Account';
        insert Acc;
        
        group ObjGrp = new group();
        ObjGrp.name = 'test group';
        insert ObjGrp;
        
        Pricebook2 standardPb = new Pricebook2(Name = 'vlocitytest', Description = 'Price Book vlocity Products', IsActive = true);
        insert standardPb;
        
        
        vlocity_cmt__FulfilmentRequestLine__c vlocityFulfill = new vlocity_cmt__FulfilmentRequestLine__c();
        vlocityFulfill.CreatedDate = date.today();
        insert vlocityFulfill;
        vlocity_cmt__OrchestrationItem__c vlocityOrchest = new vlocity_cmt__OrchestrationItem__c();
        vlocityOrchest.name = 'Wait To Start';
        vlocityOrchest.vlocity_cmt__FulfilmentRequestLineId__c =vlocityFulfill.Id;
        vlocityOrchest.CreatedDate = date.today();
        
        
        List<Order> lstOrder = new List<Order>();
        Order ObjOrder = new Order();
        ObjOrder.EffectiveDate = system.today();
        ObjOrder.EndDate = system.today() + 40;
        ObjOrder.Pricebook2Id =  standardPb.Id ;
        ObjOrder.Products__c = 'SIP;EIA';
        ObjOrder.Name = 'Test queueable order';
        ObjOrder.Status = 'Draft';
        ObjOrder.order_stage__c ='In Progress';
        ObjOrder.OwnerId = ObjGrp.Id;
        ObjOrder.AccountId = Acc.Id;
        //ObjOrder.Network_Project_Specialist__c=UserInfo.getUserId();
        lstOrder.add(ObjOrder);
        Insert lstOrder;

        //insert vlocityOrchest;
        ftr_XOMSubmitOrderController objCont = new ftr_XOMSubmitOrderController();
        System.enqueueJob(new ftr_XOMSubmitOrderController.StartPlanAsync(lstOrder[0].Id));
        
    }
    
    Static TestMethod void TestQueueableNew(){
        Account Acc = new Account();
        Acc.name='Test Account';
        insert Acc;
        vlocity_cmt__Premises__c Prms = new vlocity_cmt__Premises__c();
        Prms.WC_CLLI__c = 'MSTNWIXA';
        insert Prms;
        group ObjGrp = new group();
        ObjGrp.name = 'test group';
        insert ObjGrp;
        Account a = new Account();
        a.Name = 'Test Account';
        insert a;
        Account serviceAccount = new Account();
        serviceAccount.Name = 'Service Account';
        serviceAccount.ShippingStreet = '1480 North Valley Parkway';
        serviceAccount.ShippingCity = 'Lewisville';     
        serviceAccount.ShippingState = 'Texas';
        serviceAccount.ShippingPostalCode = '75077';
        serviceAccount.vlocity_cmt__PremisesId__c= Prms.Id;
        insert serviceAccount;
        //Test Account 2
        
        
        Product2 p = new Product2();
        p.Name = ' Test EIA ';
        p.Description='Test EIA (Ethernet Internet Access)';
        p.productCode ='ENT_ETH_UNI_PSR_001';
        p.isActive = true;
        insert p;
        
        Id pricebookId = Test.getStandardPricebookId();
        PricebookEntry standardPrice1 = new PricebookEntry();
        standardPrice1.Pricebook2Id = pricebookId;
        standardPrice1.Product2Id = p.Id;
        standardPrice1.UnitPrice = 1;
        standardPrice1.IsActive = true;
        standardPrice1.UseStandardPrice = false;
        insert standardPrice1 ;
        Pricebook2 standardPb = new Pricebook2(Name = 'vlocitytest', Description = 'Price Book vlocity Products', IsActive = true);
        insert standardPb;
        PricebookEntry standardPrice = new PricebookEntry();
        standardPrice.Pricebook2Id = standardPb.Id;
        standardPrice.Product2Id = p.Id;
        standardPrice.UnitPrice = 1;
        standardPrice.IsActive = true;
        standardPrice.UseStandardPrice = false;
        insert standardPrice ;
        
        Order o = new Order();
        o.Name = 'Test Order 04.10.2020 KE';
        o.Status = 'Draft';
        o.EffectiveDate = system.today();
        o.EndDate = system.today() + 10;
        o.AccountId = a.id;
        o.Pricebook2Id =  standardPb.Id ;
        o.Products__c = 'SIP;EIA';
        insert o;
        OrderItem i = new OrderItem();
        i.OrderId = o.id;
        i.Quantity = 24;
        i.UnitPrice = 240;
        i.Product2id = p.id;
        i.PricebookEntryId=standardPrice.id;
        //i.Total_Price__c = i.Quantity * i.UnitPrice;
        insert i;
        //Test OrderItem on second insert
        OrderItem i2 = new OrderItem();
        i2.OrderId = o.id;
        i2.Quantity = 10;
        i2.UnitPrice = 20;
        i2.PricebookEntryId=standardPrice.id;
        i2.vlocity_cmt__ServiceAccountId__c = serviceAccount.Id;
        i2.vlocity_cmt__Product2Id__c = p.Id;
        //i2.Total_Price__c = i.Quantity * i.UnitPrice;
        insert i2;
        
        
        vlocity_cmt__OrchestrationPlan__c vlocityOrchidPlan = new vlocity_cmt__OrchestrationPlan__c();
        vlocityOrchidPlan.vlocity_cmt__OrderId__c = o.Id;
        insert vlocityOrchidPlan;
        vlocity_cmt__FulfilmentRequestLine__c vlocityFulfill = new vlocity_cmt__FulfilmentRequestLine__c();
        vlocityFulfill.vlocity_cmt__Product2Id__c =p.Id;
        vlocityFulfill.CreatedDate = date.today();
        insert vlocityFulfill;
        vlocity_cmt__OrchestrationPlanDefinition__c vlocityplanDefine = new vlocity_cmt__OrchestrationPlanDefinition__c();
        vlocityplanDefine.Name = 'Test';
        insert vlocityplanDefine;
        vlocity_cmt__OrchestrationItemDefinition__c vlocityOrchidItem = new vlocity_cmt__OrchestrationItemDefinition__c();
        vlocityOrchidItem.Name = 'Wait To Start';
        vlocityOrchidItem.vlocity_cmt__OrchestrationPlanDefinitionId__c = vlocityplanDefine.Id;
        insert vlocityOrchidItem;
        vlocity_cmt__OrchestrationItem__c vlocityOrchest = new vlocity_cmt__OrchestrationItem__c();
        vlocityOrchest.name = 'Wait To Start';
        vlocityOrchest.vlocity_cmt__FulfilmentRequestLineId__c =vlocityFulfill.Id;
        vlocityOrchest.vlocity_cmt__OrchestrationItemDefinitionId__c = vlocityOrchidItem.Id;
        vlocityOrchest.vlocity_cmt__State__c = 'Pending';
        vlocityOrchest.CreatedDate = date.today();
        vlocityOrchest.vlocity_cmt__OrchestrationPlanId__c = vlocityOrchidPlan.Id;
        insert vlocityOrchest;
        
        
        List<Order> lstOrder = new List<Order>();
        Order ObjOrder = new Order();
        ObjOrder.EffectiveDate = system.today();
        ObjOrder.EndDate = system.today() + 40;
        ObjOrder.Pricebook2Id =  standardPb.Id ;
        ObjOrder.Products__c = 'SIP;EIA';
        ObjOrder.Name = 'Test queueable order';
        ObjOrder.Status = 'Draft';
        ObjOrder.order_stage__c ='In Progress';
        ObjOrder.OwnerId = ObjGrp.Id;
        ObjOrder.AccountId = Acc.Id;
        //ObjOrder.Network_Project_Specialist__c=UserInfo.getUserId();
        lstOrder.add(ObjOrder);
        
        ftr_XOMSubmitOrderController objCont = new ftr_XOMSubmitOrderController();
        System.enqueueJob(new ftr_XOMSubmitOrderController.StartPlanAsync(o.Id));
        
    }
    static testMethod void testcreateMFWTaskOnMFWOrder(){
        Map<String, Object> outputMap =new Map<String, Object>();
        Map<String, Object> inputMap =new Map<String, Object>();
        Map<String, Object> options =new Map<String, Object>();
        Account Acc = new Account();
        Acc.name='Test Account';
        insert Acc;
        
        group ObjGrp = new group();
        ObjGrp.name = 'test group';
        insert ObjGrp;
        
        Pricebook2 standardPb = new Pricebook2(Name = 'vlocitytest', Description = 'Price Book vlocity Products', IsActive = true);
        insert standardPb;
        
        List<Order> lstOrder = new List<Order>();
        Order ObjOrder = new Order();
        ObjOrder.EffectiveDate = system.today();
        ObjOrder.EndDate = system.today() + 40;
        ObjOrder.Pricebook2Id =  standardPb.Id ;
        ObjOrder.Products__c = 'SIP;EIA';
        ObjOrder.Name = 'Test UCF In Progress order';
        ObjOrder.Status = 'Draft';
        ObjOrder.order_stage__c ='In Progress';
        ObjOrder.OwnerId = ObjGrp.Id;
        ObjOrder.AccountId = Acc.Id;
        ObjOrder.vlocity_cmt__OrderStatus__c= 'In Progress';
        //ObjOrder.Network_Project_Specialist__c=UserInfo.getUserId();
        lstOrder.add(ObjOrder);
        insert lstOrder;
        inputMap.put('orderId',lstOrder[0].Id);
        
        ApexPages.StandardController sc = new ApexPages.StandardController(ObjOrder);
        
        ftr_XOMSubmitOrderController objCont = new ftr_XOMSubmitOrderController(sc);
        objCont.createMFWTaskOnMFWOrder(inputMap,outputMap,options);   
    }
}