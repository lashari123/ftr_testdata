@isTest(seeAllData = true)
private class Account_Provisioning_ControllerTest {
    static testmethod void testinnerclass(){
        Account_Provisioning_Controller.newHunt hunt = new Account_Provisioning_Controller.newHunt();
        Account_Provisioning_Controller.HuntGroupMember huntMember = new Account_Provisioning_Controller.HuntGroupMember();
        huntMember.Type = 'asdf';
        huntMember.cnt = 2;
        huntMember.pilPhNum = 'asdf';
        huntMember.huntPhoneNumber = 'asdf';
        huntMember.huntSeqNumber = 'asdf';
        
        hunt.huntGrpMem = new Account_Provisioning_Controller.HuntGroupMember[]{};
        hunt.huntGrpMem.add(huntMember);
        
        
    }
    
    static testmethod void testOuterClass(){
        test.StartTest();
        
        try
        {
            List<Account> acc =  [SELECT Id, ParentSequenceId__c, Library_Id__c, TNSequenceId__c FROM Account WHERE Library_Id__c ='LF' and TNSequenceId__c != null LIMIT  1];
            Test.setMock(WebServiceMock.class, new WS_ESB_ManageAccountGetHG());
            PageReference pageRef = Page.Account_RedirectAccountsReceivable;
            Test.setCurrentPage(pageRef);
            ApexPages.currentPage().getParameters().put('accoutId',acc[0].id);
            Account_Provisioning_Controller apc = new Account_Provisioning_Controller();
            if(apc.getHuntGroup() != null) {
            apc.mapFinalPilotNumber = apc.getHuntGroup();
            }
        } catch(DmlException ex){   }
       test.StopTest();
  }

}