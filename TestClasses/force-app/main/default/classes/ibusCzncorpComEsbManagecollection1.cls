//Generated by wsdl2apex

public class ibusCzncorpComEsbManagecollection1 {
    public class ManageCollectionGetAccountsReceivableResponse {
        public ibusCzncorpComEsbExecutioncontext1.ExecutionContext ExecutionContext;
        public ibusCzncorpComEsbManagecollection1.GetAccountsReceivableRequestCriteria RequestCriteria;
        public ibusCzncorpComEsbBusinessobjects1.AccountId AccountId;
        public ibusCzncorpComEsbBusinessobjects1.AccountsReceivable[] AccountsReceivable;
        public ibusCzncorpComEsbBusinessobjects1.PendingAccountsReceivable PendingAccountsReceivable;
        private String[] ExecutionContext_type_info = new String[]{'ExecutionContext','http://ibus.czncorp.com/ESB/ExecutionContext','ExecutionContext','0','1','false'};
        private String[] RequestCriteria_type_info = new String[]{'RequestCriteria','http://ibus.czncorp.com/ESB/ManageCollection','GetAccountsReceivableRequestCriteria','1','1','false'};
        private String[] AccountId_type_info = new String[]{'AccountId','http://ibus.czncorp.com/ESB/BusinessObjects','AccountId','0','1','false'};
        private String[] AccountsReceivable_type_info = new String[]{'AccountsReceivable','http://ibus.czncorp.com/ESB/BusinessObjects','AccountsReceivable','0','-1','false'};
        private String[] PendingAccountsReceivable_type_info = new String[]{'PendingAccountsReceivable','http://ibus.czncorp.com/ESB/BusinessObjects','PendingAccountsReceivable','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/ManageCollection','false','false'};
        private String[] field_order_type_info = new String[]{'ExecutionContext','RequestCriteria','AccountId','AccountsReceivable','PendingAccountsReceivable'};
    }
    public class GetAccountsReceivableRequestCriteria {
        public ibusCzncorpComEsbBusinessobjects1.RequestAccountId AccountId;
        private String[] AccountId_type_info = new String[]{'AccountId','http://ibus.czncorp.com/ESB/BusinessObjects','RequestAccountId','1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/ManageCollection','false','false'};
        private String[] field_order_type_info = new String[]{'AccountId'};
    }
    public class ManageCollectionGetAccountsReceivableRequest {
        public ibusCzncorpComEsbExecutioncontext1.ExecutionContext ExecutionContext;
        public ibusCzncorpComEsbManagecollection1.GetAccountsReceivableRequestCriteria RequestCriteria;
        private String[] ExecutionContext_type_info = new String[]{'ExecutionContext','http://ibus.czncorp.com/ESB/ExecutionContext','ExecutionContext','1','1','false'};
        private String[] RequestCriteria_type_info = new String[]{'RequestCriteria','http://ibus.czncorp.com/ESB/ManageCollection','GetAccountsReceivableRequestCriteria','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/ManageCollection','false','false'};
        private String[] field_order_type_info = new String[]{'ExecutionContext','RequestCriteria'};
    }
}