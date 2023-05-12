@isTest(seeAllData = true)
private class ServiceHeader_ControllerTest {
       
    
    static testmethod void unitTest1(){
        
        try{
           Account acc =  [SELECT Id, ParentSequenceId__c, Library_Id__c, TNSequenceId__c FROM Account WHERE Library_Id__c ='LF' and TNSequenceId__c = '7157543333' LIMIT  1];
           PageReference pageRef = Page.OrderPage;
           Test.setCurrentPage(pageRef);
           ApexPages.currentPage().getParameters().put('accoutId',acc.id);
        
        
       
        ServiceHeader_Controller serCon = new  ServiceHeader_Controller(); 
        
        PageReference rf1 = serCon.redirectToOrderURL();
        //PageReference rf2 = serCon.redirecttosterling();
        PageReference rf3 = serCon.launchCustomerPortal();
        PageReference rf4 = serCon.launchFrontierId();	
            
            } catch(Exception ex)
        {   }
   }
 }