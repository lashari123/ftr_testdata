public class redirectController{
   // Additional myOuterClass code here
   public case objCase{get;set;}
   public string strScheduleId{get;set;}
   string strID;
   public redirectController(ApexPages.StandardController stdController) {
       strID = ApexPages.currentPage().getParameters().get('id');
   }
   public PageReference redirectPage() {        
        // Send the user to the detail page for the new account.
        strID = ApexPages.currentPage().getParameters().get('id');
        case objCase = [select id, RecordType.Name,Account.Id,ContactId,Origin,Case__c,Status,Priority,Subject,
                        Resolution__c,Description,Schedule_ID_auto__c,
                        Renewed_Reason__c,Schedule_Id__c
                   from Case where id =: strID ];
        PageReference acctPage = null;
        if(objCase.RecordType.Name == 'Contract Renewal'){           
            acctPage = new PageReference('/apex/CaseContractRenewal?id='+strID+'&ScheduleId='+objCase.Resolution__c); //new PageReference('/'+ApexPages.currentPage().getParameters().get('id'));
            acctPage.setRedirect(true);

        }
        else{
            //acctPage = new PageReference('/' + strID +'/e');
            PageReference acctPage1 = new PageReference('/'+strID+'/e?retURL=%2F'+strID);
            acctPage1 .getParameters().put('nooverride','1');
            //new PageReference('/'+strID+'/e?retURL=%2F'+strID+'&common.udd.actions.ActionsUtilORIG_URI=%2F'+strID);
            //5002D000000cgBJ/e?retURL=%2F5002D000000cgBJ
            return acctPage1.setRedirect(true);           
        }
        return acctPage;
            }
}