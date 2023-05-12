@IsTest(seeAllData = true)
private class GetDetails_Test
{
	private static testMethod void testRun1() 
	{	
			String Profilenm = GetDetails.getProfileName();
        	system.debug('Profilenm' +Profilenm);
        	System.assertEquals('Frontier System Administrator',Profilenm);

	}
    	private static testMethod void testRun2() 
	{
			String ProfileID = GetDetails.getProfileID();
        	system.debug('ProfileID' +ProfileID);
	}
        	private static testMethod void testRun3() 
	{
			String Sessionid = String.ValueOf(GetDetails.getSessionID());
        	system.debug('Sessionid' +Sessionid);
	}
            	private static testMethod void testRun4() 
	{
        	String nm =[SELECT Id, Name FROM Contract_Channel_Affiliation__c limit 1].Name ;
			list<Contract_Channel_Affiliation__c> channeldetails = GetDetails.getChannelDetails(nm);
	}

}