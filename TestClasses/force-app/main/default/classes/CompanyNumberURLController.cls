public with sharing class CompanyNumberURLController {



        public String strURL            {get;set;}
        public Account ac               {get;set;}
        public List<hierarchy__c> lstHierarchyCompNum                        {get;set;}
    
    public CompanyNumberURLController(ApexPages.StandardController controller) {
         String strVal = Apexpages.currentPage().getParameters().get('id');
        ac = [SELECT Customer_Number__c FROM Account WHERE Id =: strVal ];
        
        
        String strAccNum = ac.Customer_Number__c;
        lstHierarchyCompNum = new List<hierarchy__c>();
        if(strAccNum!=null && strAccNum!=''){
            //lstHierarchyCompNum = [SELECT BTN_Name__c, BTN_Phone__c,Customer_Number__c FROM hierarchy__c where Customer_Number__c=:strAccNum ];
            lstHierarchyCompNum = [SELECT BTN_Name__c, BTN_Phone__c,Customer_Number__c FROM hierarchy__c where Customer_Number__c=:strAccNum AND BTNEQualsWTN__c='Yes'];

        }
        
    }         

}