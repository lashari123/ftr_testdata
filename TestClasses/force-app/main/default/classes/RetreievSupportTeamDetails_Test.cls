@isTest
private class RetreievSupportTeamDetails_Test{
private static testMethod void getEmailMethod(){

Account acc = new Account();
acc.name = 'Test';
acc.phone = '(425) 263-4053';

insert acc;

Id RecordTypeId = schema.sobjectType.opportunity.getRecordtypeinfosbyname().get('Memo Read only').getRecordtypeId();

Opportunity opp = new Opportunity();
opp.name = 'TestOpp';
opp.RecordTypeid = RecordTypeId;
opp.StageName= 'Investigating';
opp.closeDate = date.today().addDays(30);
opp.Opportunity_Type__c = 'New';
opp.ForecastCategoryName = 'pipeline';
opp.CPE_Product__c = 'No';
opp.New_Logo__c = 'No';
opp.Local_Area_Market__c = 'Ca North';
opp.MDU_Property__c = 'No';
opp.AccountId = acc.id;

insert opp;

contract cntrct = new contract();
cntrct.accountId = acc.id;
cntrct.status = 'draft';
cntrct.StartDate = date.today();
cntrct.ContractTerm = 36;
cntrct.OwnerExpirationNotice = '90';

insert cntrct;


order order = new order();
order.AccountId = acc.id;
order.opportunityId = opp.id;
order.Contract_Schedule__c = cntrct.id;
order.Technical_Contact_Number__c = '969';
order.Technical_Contact_Name__c = 'Sree';
order.Order_Stage__c = 'complete';
order.EffectiveDate = date.today().addDays(2);
order.Customer_Requested_Date__c = date.today();
order.Status = 'Draft';
insert order;



order order1 = new order();
order1.AccountId = acc.id;
order1.Status = 'Draft';
order1.opportunityId = opp.id;
order1.Contract_Schedule__c = cntrct.id;
order1.Technical_Contact_Number__c = '969';
order1.Technical_Contact_Name__c = 'Sree';
order1.Order_Stage__c = 'pending billing';
order1.EffectiveDate = date.today().addDays(2);
order1.Customer_Requested_Date__c = date.today();
insert order1;


//SELECT id,Account__c,Account__r.name,Team_Member__c,Team_Member__r.email FROM Support_Team_Member__c 

Support_Team_Member__c  supmemebr = new Support_Team_Member__c();
supmemebr.Account__c = acc.id;
supmemebr.Team_Member__c = userInfo.getUserId();
supmemebr.Support_Role__c = 'Enterprise CSA';

insert supmemebr;



List<order> orderList = new List<order>();

orderList.add(order);

map<id,order> oldOrderMap = new map<id,order>();
oldOrderMap.put(order.id,order1);

RetreievSupportTeamDetails.getEmails(orderList,oldOrderMap);

}

}