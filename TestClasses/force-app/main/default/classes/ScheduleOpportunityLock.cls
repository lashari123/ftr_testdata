/********************************************************************************************
* @Name         ScheduleOpportunityLock 
* @Author       Dileep Chinthala <dileep.chinthala@ftr.com>
* @Date         03/02/2021
* @Group        Opportunity
* @Description  This class runs OpportunityLock_LineItem_BatchClass without 'Validating' stage
***********************************************************************************************/
/* MODIFICATION LOG
* Version          Developer          Date               Description
*-------------------------------------------------------------------------------------------
*  1.0              Dileep         03/02/2021         Initial Creation                                                      
*******************************************************************************************/
global class ScheduleOpportunityLock implements Schedulable {
	global void execute(SchedulableContext sc) {
        
        List<String> stagesToConsider = new List<String>{'Closed/Won','Closed/Lost','Decision'}; 
		Database.executeBatch(new OpportunityLock_LineItem_BatchClass(stagesToConsider));
    }
}