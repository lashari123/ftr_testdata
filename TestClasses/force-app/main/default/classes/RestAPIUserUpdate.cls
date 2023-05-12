@RestResource(urlMapping='/UpdateUserInfo/*')

global with sharing class RestAPIUserUpdate {

  @HttpGet
  global static userRolesandProfiles getRoleAndProfiles() {

      UserRolesandProfiles userRP = new UserRolesandProfiles();   

      userRP.roles = new List<UserRole>();
      userRP.profiles = new List<Profile>();  

      userRP.roles = [SELECT Name FROM UserRole];
      userRP.profiles = [SELECT Name FROM Profile];
            
      return userRP;    
  }
  
  global class UserRolesandProfiles {
      global List<UserRole> roles;
      global List<Profile> profiles;  
  }
  
  @HttpPut
  global static String updateUser() {
    
        String corpId = RestContext.request.headers.get('corpId');
        String roleName = RestContext.request.headers.get('role');
        String profileName = RestContext.request.headers.get('profile');
        boolean isRoleUpdated = false;
        boolean isProfileUpdated = false;
        
        list<User> userLookUp = new list<User>();
        list<UserRole> userRoleLookUp = new list<UserRole>();
        list<Profile> userProfileLookUp = new list<Profile>();
        
        userLookUp = [SELECT LastName,Name, ProfileId, Username, UserRoleId FROM User where CSR_ID__c = :corpId];
        System.debug('Suny userLookUp:   '+userLookUp);
        if (userLookUp.size()>0)
        {
            if (String.isNotBlank(roleName))
            {
                //user.UserRole.Name = roleName;
                userRoleLookUp = [Select id from UserRole where Name = :roleName];
                System.debug('Suny userRoleLookUp:   '+userRoleLookUp);
                if (userRoleLookUp.size() > 0)
                {
                    userLookUp[0].UserRoleId = userRoleLookUp[0].id;
                    isRoleUpdated = true;
                }
            }
               
            if (String.isNotBlank(profileName))
            {
                //user.profile.Name = profileName;
                userProfileLookUp = [Select id from Profile where Name = :profileName];
                System.debug('Suny userProfileLookUp:   '+userProfileLookUp);
                if (userProfileLookUp.size() > 0)
                {
                    userLookUp[0].ProfileId = userProfileLookUp[0].id;
                    isProfileUpdated = true;
                }
            }
        }
        
        if(isProfileUpdated || isRoleUpdated){
        	update userLookUp[0];
        }
        
        if (isProfileUpdated && isRoleUpdated)
        {
          //update userLookUp[0];
          return 'Successful!! User Info Updated!! - InputParams = '+corpId+'/'+roleName+'/'+profileName;
        }else if(isProfileUpdated && !isRoleUpdated)
        	return 'Successful!! User Info Updated!! - InputParams = '+corpId+'/'+profileName+'. The Role: '+RoleName+' does not exist so it wasn\'t updated';
        else if(!isProfileUpdated && isRoleUpdated)	
        	return 'Successful!! User Info Updated!! - InputParams = '+corpId+'/'+RoleName+'. The profileName: '+profileName+' does not exist so it wasn\'t updated';
        else
        	return 'Unsuccessful.. User doesnt exist with the given corpId [OR] Role/Profile is Mandatory. [ - userLookUp.size(): '+userLookUp.size()+'  - InputParams = '+corpId+'/'+roleName+'/'+profileName+' userRoleLookUp.size() :'+userRoleLookUp.size()+'userProfileLookUp.size() : '+userProfileLookUp.size()+']';
  }
}