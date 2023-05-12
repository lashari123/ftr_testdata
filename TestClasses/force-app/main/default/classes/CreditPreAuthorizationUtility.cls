public with sharing class CreditPreAuthorizationUtility {  
  
    public static void updateManager(List<Credit_PreAuthorization__c> cpList){
        User me = [select managerid from user where id = :Userinfo.getUserId()];
        for (Credit_PreAuthorization__c cp : cpList){
            cp.Creators_Manager__c = me.managerid;
        }
    }
 
}