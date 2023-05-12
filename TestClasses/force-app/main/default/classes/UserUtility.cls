/********************************************************************************************
Name : UserUtility
Created By : Mohan Talluri (mohan.talluri@ftr.com)
Created Date : April 28, 2016
Description :  Utility to support User Trigger Handler.
********************************************************************************************/

public with sharing class UserUtility {
    
  public static void beforeInsertLogic(List<User> newItems)
  {
       System.debug('Processing updateCrisID ...');
       updateCris(newItems);
       System.debug('Processing setting SVP ...');
       ManageUser.ManagerChangeSetSVP(newItems);
       System.debug('Processing updating Profile ...');
       resetProfileInsert(newItems);
       System.debug('Process Complete.');
  }

  public static void beforeUpdateLogic(List<User> newItems, List<User> oldItems)
  {
       System.debug('Processing updateCrisID ...');
       updateCris(newItems);
       System.debug('Processing setting SVP ...');
       ManageUser.ManagerChangeSetSVP(newItems);
       System.debug('Processing updating Profile ...');
       resetProfileUpdate(newItems, oldItems);
       System.debug('Process Complete.');
  }
  
  public static void afterLogic(Map<Id, User> newItems, Map<Id, User> oldItems, Set<ID> keySet) 
  {
      ManageUser.SVPChangeSetSVP(newItems.values());
      
      String XACTLY_PERMISSIONSET_ID = '0PSE0000000lUUyOAM';
      
      Map<Id,PermissionSetAssignment> mapPermissionSetAssignments = new Map<Id,PermissionSetAssignment>([SELECT Id, AssigneeId, PermissionSetId FROM PermissionSetAssignment WHERE PermissionSetId = :XACTLY_PERMISSIONSET_ID AND AssigneeId IN :keySet]);
      
      List<PermissionSetAssignment> lstCreatePermissionSetAssignments = new List<PermissionSetAssignment>();  
      List<PermissionSetAssignment> lstDeletePermissionSetAssignments = new List<PermissionSetAssignment>();
      
      for (User this_user : newItems.values()){
        if(this_user.XactlyUser__c){
          if((oldItems != null) && (oldItems.get(this_user.Id).XactlyUser__c == false)){
            lstCreatePermissionSetAssignments.add(new PermissionSetAssignment(AssigneeId=this_user.Id,PermissionSetId=XACTLY_PERMISSIONSET_ID));
          }
        }else{
          for(PermissionSetAssignment this_psa : mapPermissionSetAssignments.values()){
            if(this_psa.AssigneeId == this_user.Id){
              lstDeletePermissionSetAssignments.add(this_psa);
            }
          }
        }  
      }
      
      if(lstCreatePermissionSetAssignments.size() > 0){
        insert lstCreatePermissionSetAssignments;
      }
      
      if(lstDeletePermissionSetAssignments.size() > 0){
        delete lstDeletePermissionSetAssignments;
      }
  }
  
  private static void updateCris(List<User> newItems) {
    for(User u : newItems){
        if(u.CRIS_ID__c != null && u.CRIS_ID__c.length() == 5)
          u.CRIS_ID__c = '0' + u.CRIS_ID__c;
    }
  }
  
  private static void resetProfileInsert(List<User> newItems) {
 
        ID me = UserInfo.getProfileId();
        ID ftr = null;
        
        // Profile[] ps = [select id, name from profile where name = 'AdminNoExpire' or name = 'System Administrator'];
        Profile[] ps = [select id, name from profile where name = 'Frontier System Administrator' or name = 'System Administrator'];
        if (ps == null || ps.size() != 2 || ps[0].Id == me || ps[1].Id == me) 
        {
            system.debug('&*&*&**User is admin or no ps load');
            return; // if current user is proper admin, allow all
        }
        
        Integer index = -1;
        User prevUser = null;
        for(User nusr : newItems){
            index++;

            if (nusr.ProfileId == ps[0].Id || nusr.ProfileId == ps[1].Id)
            {
                if (ftr == null)
                {
                    Profile p = [select id, name from profile where name = 'Frontier System Administrator'];
                    if (p != null) ftr = p.Id;
                }
                if (ftr != null) {
                    system.debug('&*&*&**Nice try for non-King but setting to Frontier System Administrator');
                    nusr.ProfileId = ftr;
                }
                else system.debug('&*&*&**ftr=null! Cannot find ftr sys admin');
            }
        }
  }

  private static void resetProfileUpdate(List<User> newItems, List<User> oldItems) 
  {
        ID me = UserInfo.getProfileId();
        ID ftr = null;
        
        // Profile[] ps = [select id, name from profile where name = 'AdminNoExpire' or name = 'System Administrator'];
        Profile[] ps = [select id, name from profile where name = 'Frontier System Administrator' or name = 'System Administrator'];
        if (ps == null || ps.size() != 2 || ps[0].Id == me || ps[1].Id == me) 
        {
            system.debug('&*&*&**User is admin or no ps load');
            return; // if current user is proper admin, allow all
        }
        
        Integer index = -1;
        User prevUser = null;
        for(User nusr : newItems){
            index++;
            prevUser = (User) oldItems[index];
            
            system.debug('&*&*&**nusr profile id=' + nusr.ProfileId + ' prev=' + prevUser.ProfileId);

            if (nusr.ProfileId != prevUser.ProfileId)
            {
                if (prevUser.ProfileId == ps[0].Id || prevUser.ProfileId == ps[1].Id)
                {
                    nusr.ProfileId = prevUser.ProfileId; // reset back
                    system.debug('&*&*&**Current user is not a king so we will not let him dethrone a king');
                }
                else
                {
                    if (nusr.ProfileId == ps[0].Id || nusr.ProfileId == ps[1].Id)
                    {
                        if (ftr == null)
                        {
                            Profile p = [select id, name from profile where name = 'Frontier System Administrator'];
                            if (p != null) ftr = p.Id;
                        }
                        if (ftr != null) {
                            system.debug('&*&*&**Nice try for non-King but setting to Frontier System Administrator');
                            nusr.ProfileId = ftr;
                        }
                        else system.debug('&*&*&**ftr=null! Cannot find ftr sys admin');
                    }
                }
            }
        }
  }
}