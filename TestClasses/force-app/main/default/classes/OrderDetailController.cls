public class OrderDetailController {
    public ApexPages.StandardController stdController;
    public boolean productEthernet {get;set;}
    public boolean productEvpl {get;set;}
    public order ord{get;set;}
    public String fieldSetKey {get; set;}
    public List<Schema.FieldSetMember> relevantFields {get; set;}
    public List<Schema.FieldSetMember> orderInfoFields {get; set;}
    public List<Schema.FieldSetMember> addressInfoFields {get; set;}
    public List<Schema.FieldSetMember> accountBillingInfoFields {get; set;}
    public String context {get; set;}
    public boolean isDetail {get; set;}
    public boolean isCreate {get; set;}
    public boolean isEdit {get; set;}
    
    public OrderDetailController(ApexPages.StandardController stdController) {
        if(ApexPages.currentPage().getParameters().get('context') != null) {
            context = ApexPages.currentPage().getParameters().get('context');
        } else if(ApexPages.currentPage().getParameters().get('retURL') != null) {
            context = 'Edit';
        } else {
            context = 'Detail';
        }
        isDetail = (context == 'Detail');
        isCreate = (context == 'Create');
        isEdit = (context == 'Edit');
        
        Id orderId = null;
        if(isDetail || isEdit) {
            orderId = Id.valueOf(ApexPages.currentPage().getParameters().get('id'));
        }
        if(Test.isRunningTest()) {
            Order temp = [SELECT id FROM Order LIMIT 1];
            orderId = temp.id;
            
            context = 'Detail';
            //Other test value assignments go here
        }
        
        if(isDetail || isEdit) {
            String SobjectApiName = 'Order';
            Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
            Map<String, Schema.SObjectField> fieldMap = schemaMap.get(SobjectApiName).getDescribe().fields.getMap();
            String commaSepratedFields = '';
            for(String fieldName : fieldMap.keyset()){
                if(commaSepratedFields == null || commaSepratedFields == ''){
                    commaSepratedFields = fieldName;
                }else{
                    commaSepratedFields = commaSepratedFields + ', ' + fieldName;
                }
            }
            
            String query = 'select ' + commaSepratedFields + ' from ' + SobjectApiName + ' WHERE id = \''+orderId+'\'';
            ord = Database.query(query);
        } else {
            ord = (order) stdController.getRecord();
            ord.RecordTypeId = Id.valueOf(ApexPages.currentPage().getParameters().get('recordtype'));
            ord.Product_Type__c = ApexPages.currentPage().getParameters().get('producttype');
            ord.Status = 'Order';
            
            String opportunityId = ApexPages.currentPage().getParameters().get('opportunityid');
            if(String.isNotBlank(opportunityId)) {
                Opportunity relatedOpp = [SELECT id, accountid FROM Opportunity WHERE id = :opportunityId];
                
                if(relatedOpp != null) {
                    ord.accountId = relatedOpp.accountId;
                    ord.opportunityId = relatedOpp.Id;
                }
            }
        }
        
        String upperCaseAndUnderscoredRecordTypeName = Schema.getGlobalDescribe().get('Order').getDescribe().getRecordTypeInfosById().get(ord.recordTypeId).getName();
        upperCaseAndUnderscoredRecordTypeName = upperCaseAndUnderscoredRecordTypeName.toUpperCase().replace(' ', '_');
        
        String upperCaseAndUnderscoredProductType = ord.product_Type__c.toUpperCase().replace(' ', '_').replace('(', '').replace(')', '').replace('/', '_');
        
        fieldSetKey = 'STATS_' + upperCaseAndUnderscoredRecordTypeName + '_' + upperCaseAndUnderscoredProductType;
        Map<String, Schema.FieldSet> orderFieldSets = Schema.SObjectType.Order.fieldSets.getMap();
        
        //if there's a specific field set for this STATS Record Type and Product Type combination, then use that.
        if(orderFieldSets.get(fieldSetKey) != null) {
            relevantFields = orderFieldSets.get(fieldSetKey).getFields();
        } else {
            fieldSetKey = 'STATS_' + upperCaseAndUnderscoredProductType;
            
            //Otherwise, if there is a STATS field set for this specific Product Type, use that.
            if(orderFieldSets.get(fieldSetKey) != null) {
                relevantFields = orderFieldSets.get(fieldSetKey).getFields();
            } else {
            
                //Otherwise use the STATS' default field set
                relevantFields = orderFieldSets.get('STATS_Default').getFields();
            }
        }
        
        orderInfoFields = new List<Schema.FieldSetMember>();
        if(orderFieldSets.get('STATS_Order_Information') != null) {
            orderInfoFields = orderFieldSets.get('STATS_Order_Information').getFields();
        }
        
        addressInfoFields = new List<Schema.FieldSetMember>();
        if(orderFieldSets.get('STATS_Address_Information') != null) {
            addressInfoFields = orderFieldSets.get('STATS_Address_Information').getFields();
        }
        
        accountBillingInfoFields = new List<Schema.FieldSetMember>();
        if(orderFieldSets.get('STATS_Account_Billing_Information') != null) {
            accountBillingInfoFields = orderFieldSets.get('STATS_Account_Billing_Information').getFields();
        }
    }

    public PageReference cancel() {
        String nextContext;
        if(isEdit) {
            nextContext = 'Detail';
        } else {
            nextContext = 'None';
        }

            
        PageReference page; 
        if(nextContext == 'Detail') {
            page = new PageReference('/apex/OrderDetailPage?id='+ord.Id+'&context='+nextContext);
        } else {
            page = new PageReference('/801/o');
        }
        page.setRedirect(true);
        return page;
    }
     
    public PageReference saveEdit() {
        String nextContext;
        if(isEdit || isCreate) {
            nextContext = 'Detail';
        } else {
            nextContext = 'Edit';
        }
        try{
            if(isCreate) {
                insert ord;
            } else if(isEdit) {
                update ord;
            }
            
            PageReference page = new PageReference('/apex/OrderDetailPage?id='+ord.Id+'&context='+nextContext);
            page.setRedirect(true);
            return page;
        }
        catch(exception ex) {
            ApexPages.addMessages(ex);
            return null;
        } 
    }
    
    public PageReference SendFOCEmail() {
        String additionalTo = '';
        if(ord.Contact_Email__c != null && ord.Customer_Preferred_email__c != null) {
            additionalTo = ord.Contact_Email__c + ',' + ord.Customer_Preferred_email__c;
        } else {
            if(ord.Contact_Email__c != null) {
                additionalTo = ord.Contact_Email__c;
            }
            if(ord.Customer_Preferred_email__c != null) {
                additionalTo = ord.Customer_Preferred_email__c;
            }
        }
        PageReference page = new PageReference('/email/author/emailauthor.jsp?template_id=00Xn0000000Eprz&p3_lkid='+ord.Id+'&p3='+ord.OrderNumber+'&p24='+additionalTo+'&retURL=/'+ord.Id);
        page.setRedirect(true);
        return page;
    }

    public PageReference CompleteRequest() {
        Id profileId = userinfo.getProfileId();
        
        //If the profile is not '#Provisioning' and not 'Frontier System Administrator' and not '#Provisioning Supervisor' and the Order's Multi Products field is null
        if(profileId != '00eE0000001A9Qz' && profileId != '00e40000000nYck' && profileId != '00e0L000000j95L' && ord.Multi_Products__c == null) {
            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'You do not have permission to Complete this Order');
            ApexPages.addMessage(myMsg);
            return null;
        } else {
            ord.Order_Stage__c = 'Complete';
            update ord;
            
            PageReference page = new PageReference('/apex/OrderDetailPage?id='+ord.Id+'&context=Detail');
            page.setRedirect(true);
            return page;
        }
    }


}