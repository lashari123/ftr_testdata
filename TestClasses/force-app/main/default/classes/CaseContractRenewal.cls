public class CaseContractRenewal{
   // Additional myOuterClass code here
   public case objCase{get;set;}
   public boolean boolShowScheduleID{get;set;}

   public string strScheduleId{get;set;}
   public CaseContractRenewal(ApexPages.StandardController stdController) {
       objCase = new case();
       objCase.Schedule_ID_auto__c = 'S-'; 
       string idd = ApexPages.currentPage().getParameters().get('id');
       objCase = [select id, RecordTypeId,Account.Id,ContactId,Origin,Case__c,Status,Priority,Subject,Resolution__c,Description,Renewed_Reason__c,Schedule_ID_auto__c
                   from Case where id =: idd];
       if(objCase.Schedule_ID_auto__c == null){
           strScheduleId = 'S-';
           boolShowScheduleID = false;
       }    
       else{
           strScheduleId = objCase.Schedule_ID_auto__c;
           boolShowScheduleID = true;
       }
       //this.objCase= (case)stdController.getRecord();
    }
    public PageReference save() {
        // Add the account to the database.
          
        if(objCase.Resolution__c == 'Lost' || objCase.Resolution__c == 'None') {
            objCase.Schedule_ID_auto__c = '';
        }else        
            objCase.Schedule_ID_auto__c = strScheduleId ;
            
        if(objCase.Schedule_ID_auto__c.length() > 12){ 
             ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'Error: The Permitted length of Schedule ID is only 10 digits.');
            ApexPages.addMessage(myMsg);
            return null;
        }      
        update objCase ;
        // Send the user to the detail page for the new account.
        PageReference acctPage = new PageReference('/'+ApexPages.currentPage().getParameters().get('id'));
        acctPage.setRedirect(true);
        return acctPage;
    }
    public PageReference cancelCase() {
        // Add the account to the database. 
        //update objCase ;
        // Send the user to the detail page for the new account.
        PageReference acctPage = new PageReference('/'+ApexPages.currentPage().getParameters().get('id'));
        acctPage.setRedirect(true);
        return acctPage;
    }
    //
    public PageReference saveAndClose() {
        // Add the account to the database. 
        if(objCase.Resolution__c == 'Lost' || objCase.Resolution__c == 'None') {
            objCase.Schedule_ID_auto__c = '';
        }else        
            objCase.Schedule_ID_auto__c = strScheduleId ;

        if(objCase.Schedule_ID_auto__c.length() > 12){ 
             ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'Error: The Permitted length of Schedule ID is only 10 digits.');
            ApexPages.addMessage(myMsg);
            return null;
        }
        update objCase ;
        // Send the user to the detail page for the new account.
        PageReference acctPage = new PageReference('/'+ApexPages.currentPage().getParameters().get('id'));
        acctPage.setRedirect(true);
        return acctPage;
    }
}