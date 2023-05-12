public class OrderRedirectController {
    public ApexPages.StandardController stdController;
    public string selectedRecordType {get; set;}
    public string selectedProductType {get; set;}
    public order ord {get; set;}
    
    public OrderRedirectController() {
    }
    
    public OrderRedirectController(ApexPages.StandardController stdController) {
        ord = new Order();
        List<Schema.RecordTypeInfo> recTypes = Schema.SObjectType.Order.getRecordTypeInfos();
        ord.recordTypeId = recTypes[0].getRecordTypeId();
    }
    
    public list<SelectOption> getRecordTypes() {
        list<SelectOption> options = new list<SelectOption>();
    
        for(Schema.RecordTypeInfo sRecordType : Schema.SObjectType.Order.getRecordTypeInfos())
        {
            // Select options are added with key,value pairing
            options.add(new SelectOption(sRecordType.getRecordTypeId(), sRecordType.getName()));
        }
        return options;
    }
    public list<recordtype> getRecordTypeDescription() {
        List<recordType> recTypeList = [Select Name, Description from RecordType WHERE sObjectType ='Order'];
        return recTypeList; 
    }
    public list<selectOption> getProductTypes() {
        list<SelectOption> options = new list<SelectOption>();
        Schema.DescribeFieldResult fieldResult = order.Product_Type__c.getDescribe();
           List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
                
           for( Schema.PicklistEntry f : ple)
           {
              options.add(new SelectOption(f.getLabel(), f.getValue()));
           }       
           return options;
    }
    public PageReference Next() {
    
        if(ord.recordTypeId == null || ord.Product_Type__c == null) {
            ApexPages.Message msg = new Apexpages.Message(ApexPages.Severity.Warning, 'Please enter the Record Type and Product Type.');
            ApexPages.addMessage(msg);
            return null;
        }
        
        PageReference orderPage = Page.OrderDetailPage;
        orderPage.setRedirect(true);
        orderPage.getParameters().put('context','Create');
        if(ApexPages.currentPage().getParameters().get('oid') != null) {
                orderPage.getParameters().put('opportunityid',Id.valueOf(ApexPages.currentPage().getParameters().get('oid')));
        }
        orderPage.getParameters().put('recordtype',ord.recordTypeId);
        orderPage.getParameters().put('producttype',ord.Product_Type__c);
        return orderPage;
    }
}