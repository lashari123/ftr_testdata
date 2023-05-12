@isTest(seeAllData = true)
public class OrderRedirectAndDetailControllerTest {

    public static testMethod void TestOrderRedirectController() {
        Order ord = new Order();
        
        ApexPages.StandardController std = new ApexPages.StandardController(ord);
        OrderRedirectController orc = new OrderRedirectController(std);
        
        list<SelectOption> recTypes = orc.getRecordTypes();
        list<selectOption> prodTypes = orc.getProductTypes();
        orc.getRecordTypeDescription();
        orc.Next();
        
        orc.ord.recordTypeId = Id.valueOf(recTypes[0].getValue());
        orc.ord.Product_Type__c = prodTypes[0].getValue();
        orc.Next();
    }
    
    public static testMethod void TestOrderDetailControllerDetail() {
        Order ord = [SELECT id FROM Order LIMIT 1];
        
        ApexPages.StandardController std = new ApexPages.StandardController(ord);
        OrderRedirectController orc = new OrderRedirectController(std);
        
        list<SelectOption> recTypes = orc.getRecordTypes();
        list<selectOption> prodTypes = orc.getProductTypes();
        
        ApexPages.currentPage().getParameters().put('recordtype', Id.valueOf(recTypes[0].getValue()));
        ApexPages.currentPage().getParameters().put('producttype', prodTypes[0].getValue());
        ApexPages.currentPage().getParameters().put('id', ord.Id);
        ApexPages.currentPage().getParameters().put('context','Detail');
    
        std = new ApexPages.StandardController(ord);
        OrderDetailController odc = new OrderDetailController(std);
        
        odc.cancel();
        odc.saveEdit();
        odc.SendFOCEmail();
        odc.CompleteRequest();
    }
    
    public static testMethod void TestOrderDetailControllerCreate() {
        Order ord = new Order();
        Opportunity opp = [SELECT id FROM Opportunity LIMIT 1];
        
        ApexPages.StandardController std = new ApexPages.StandardController(ord);
        OrderRedirectController orc = new OrderRedirectController(std);
        
        list<SelectOption> recTypes = orc.getRecordTypes();
        list<selectOption> prodTypes = orc.getProductTypes();
        
        ApexPages.currentPage().getParameters().put('recordtype', Id.valueOf(recTypes[0].getValue()));
        ApexPages.currentPage().getParameters().put('producttype', prodTypes[0].getValue());
        ApexPages.currentPage().getParameters().put('opportunityid', opp.Id);
        ApexPages.currentPage().getParameters().put('context','Create');
    
        std = new ApexPages.StandardController(ord);
        OrderDetailController odc = new OrderDetailController(std);
    }
}