global class ManageUser{
	public static void ManagerChangeSetSVP(list<User> newUsers){
		//Make 2 maps to link user to mgr, and mgr to svp.//
		map<id, Id> repAndMGR = new map<id, Id>();
		map<id, Id> mgrAndSVP = new map<id, Id>();
	
		//loop through inserted users and map their managers.
		for(user u: newUsers){
			repAndMGR.put(u.id, u.managerId);
		}
	
		//Map inserted user's managers to user's SVP.//
		for(user u: [SELECT ID, ManagerId FROM User WHERE ID IN :repAndMGR.values()]){
			mgrAndSVP.put(u.Id, u.managerId);
		}
		
		//Loop through inserted users and set SVP to their manager's manager.//
		for(user u: newUsers){
			system.debug('User SVP: '+u.SVP__c+'- User Mgr Mgr: '+mgrAndSVP.get(u.managerId));
			u.SVP__c = mgrAndSVP.get(u.managerId);
			system.debug('User SVP: '+u.SVP__c);
		}
	}
	
	public static void SVPChangeSetSVP(list<user> newUsers){
	
		//make a map to link mgr to svp//
		map<id, Id> repAndMGR = new map<id, Id>();
	
		//loop through inserted users and map their managers.
		for(user u: newUsers){
			repAndMGR.put(u.id, u.managerId);
		}
		
  	//If user's manager's manager changes, must set SVP on user//
		//Loop through new users and ID the manager. Ensure that manager's direct reports have managers supervisor as SVP.//
		
		list<user> userToUpdate = [SELECT Id, managerID, SVP__c, Name FROM User WHERE ManagerId IN :RepAndMgr.keyset()];
		for(user u: userToUpdate){
			system.debug('user name: '+u.name+'- manager: '+u.managerid+'SVP: '+u.SVP__c);
			system.debug('SVP: '+repAndMGR.get(u.managerId));
			u.SVP__c = repAndMGR.get(u.managerId);
		}
	update userToUpdate;
  }
}