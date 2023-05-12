public with sharing class GetDetails {
    
    @AuraEnabled
    public static String getProfileName(){
  		Id profilesid=UserInfo.getProfileId();
   	    String profileName=[Select Name from Profile where Id =:profilesid].Name;
        return profileName;
    }
    @AuraEnabled
    public static String getProfileID(){
  		Id profilesid=UserInfo.getProfileId();
        return profilesid;
    }
    
    @AuraEnabled
    public static String getSessionID(){
  		String SessionId=userInfo.getSessionId();
        return SessionId;
    }
   	@AuraEnabled
    public static list<Contract_Channel_Affiliation__c> getChannelDetails(String searchKey){

        list<Contract_Channel_Affiliation__c> details=[SELECT Id, Name,Approver__r.Name, Approver__r.Title, Approver__r.Email FROM Contract_Channel_Affiliation__c WHERE Name = :searchKey LIMIT 1];
        return details;
    }
}