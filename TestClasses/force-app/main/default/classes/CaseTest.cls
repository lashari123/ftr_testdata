@isTest//(seeAllData = true)
private class CaseTest {        
        
        @testSetup static void setup() {
                CaseTeamRole ctr = new CaseTeamRole(Name='Originaotrs', AccessLevel = 'Edit');
                insert ctr;
        }
        
        static testmethod void unitTest(){
        
               id dLisId = [select id, name from RecordType where sObjectType = 'Case' and name like 'Directory Listing' limit 10].id;
               Profile p = [SELECT Id FROM Profile WHERE Name='Standard User']; 
               User u = new User(Alias = 'dt', Email='user@test.com', EmailEncodingKey='UTF-8', LastName='Test', 
                                 LanguageLocaleKey='en_US', LocaleSidKey='en_US', ProfileId = p.Id, 
                                 TimeZoneSidKey='America/Los_Angeles', UserName='er@trg.com');
               insert u;
               Account acc = new Account(name='TestAccount');
               insert acc;               
               acc = [select id from Account where name='TestAccount'];
               Contact con = new Contact(LastName='TestContact', AccountID = acc.id);
               insert con;
               con = [select id from Contact where LastName='TestContact'];
               
               List<Case> csList = new List<Case>();
               Case cs1 = new Case(ContactId = con.id, AccountId = acc.id, recordTypeId = dLisId, Assigned_To__c = u.id, 
                                  RFP_Format_Type__c = 'Request for Proposal (RFP)');
               Case cs2 = new Case(ContactId = con.id, AccountId = acc.id, recordTypeId = dLisId, Assigned_To__c = u.id, status = 'new',
                                  RFP_Format_Type__c = 'Request for Proposal (RFP)', stage__c = 'Prefield');               
               Case cs3 = new Case(ContactId = con.id, AccountId = acc.id, recordTypeId = dLisId, Assigned_To__c = u.id, 
                                  RFP_Format_Type__c = 'Request for Proposal (RFP)', stage__c = 'Discovery');
               Case cs4 = new Case(ContactId = con.id, AccountId = acc.id, recordTypeId = dLisId, Assigned_To__c = u.id, 
                                   RFP_Format_Type__c = 'Request for Proposal (RFP)', stage__c = 'Referred');
               Case cs5 = new Case(ContactId = con.id, AccountId = acc.id, recordTypeId = dLisId, Assigned_To__c = u.id, 
                                   RFP_Format_Type__c = 'Request for Proposal (RFP)', stage__c = 'Proposal');
               Case cs6 = new Case(ContactId = con.id, AccountId = acc.id, recordTypeId = dLisId, Assigned_To__c = u.id, 
                                   RFP_Format_Type__c = 'Request for Proposal (RFP)', stage__c = 'Contract');
               Case cs7 = new Case(ContactId = con.id, AccountId = acc.id, recordTypeId = dLisId, Assigned_To__c = u.id, 
                                   RFP_Format_Type__c = 'Request for Proposal (RFP)', Stage__c = 'Leaseco');
               Case cs8 = new Case(ContactId = con.id, AccountId = acc.id, recordTypeId = dLisId, Assigned_To__c = u.id, 
                                   RFP_Format_Type__c = 'Request for Proposal (RFP)', stage__c = 'Sold');
               Case cs9 = new Case(ContactId = con.id, AccountId = acc.id, recordTypeId = dLisId, Assigned_To__c = u.id, 
                                   RFP_Format_Type__c = 'Request for Proposal (RFP)', Sub_Stage__c = 'CPE CoE Contacted Client');
               Case cs10 = new Case(ContactId = con.id, AccountId = acc.id, recordTypeId = dLisId, Assigned_To__c = u.id, 
                                   RFP_Format_Type__c = 'Request for Proposal (RFP)', Sub_Stage__c = 'S/E Contacted via SERF Request if Applicable');
               Case cs11 = new Case(ContactId = con.id, AccountId = acc.id, recordTypeId = dLisId, Assigned_To__c = u.id, 
                                   RFP_Format_Type__c = 'Request for Proposal (RFP)', Sub_Stage__c = '24 hour post TTL referral Customer contact completed to valid contact Y/N');
               Case cs12 = new Case(ContactId = con.id, AccountId = acc.id, recordTypeId = dLisId, Assigned_To__c = u.id, 
                                   RFP_Format_Type__c = 'Request for Proposal (RFP)', Sub_Stage__c = '24 Hour Escalation to RSM Y/N');
               Case cs13 = new Case(ContactId = con.id, AccountId = acc.id, recordTypeId = dLisId, Assigned_To__c = u.id, 
                                   RFP_Format_Type__c = 'Request for Proposal (RFP)', Sub_Stage__c = '24 Hour Escalation to sales VP and Keith B - Y/N');
               Case cs14 = new Case(ContactId = con.id, AccountId = acc.id, recordTypeId = dLisId, Assigned_To__c = u.id, 
                                   RFP_Format_Type__c = 'Request for Proposal (RFP)', Sub_Stage__c = 'Quote Generated');
               Case cs15 = new Case(ContactId = con.id, AccountId = acc.id, recordTypeId = dLisId, Assigned_To__c = u.id, 
                                   RFP_Format_Type__c = 'Request for Proposal (RFP)', Sub_Stage__c = 'Budetary Proposal Provided to Customer');
               Case cs16 = new Case(ContactId = con.id, AccountId = acc.id, recordTypeId = dLisId, Assigned_To__c = u.id, 
                                   RFP_Format_Type__c = 'Request for Proposal (RFP)', Sub_Stage__c = 'Contract Provided to Client');
               Case cs17 = new Case(ContactId = con.id, AccountId = acc.id, recordTypeId = dLisId, Assigned_To__c = u.id, 
                                   RFP_Format_Type__c = 'Request for Proposal (RFP)', Sub_Stage__c = 'Credit Application provided to TAMCO');
               Case cs18 = new Case(ContactId = con.id, AccountId = acc.id, recordTypeId = dLisId, Assigned_To__c = u.id, 
                                   RFP_Format_Type__c = 'Request for Proposal (RFP)', Sub_Stage__c = 'TAMCO Agreement Provided');
               Case cs19 = new Case(ContactId = con.id, AccountId = acc.id, recordTypeId = dLisId, Assigned_To__c = u.id, 
                                   RFP_Format_Type__c = 'Request for Proposal (RFP)', Sub_Stage__c = 'DRN Received');
               Case cs20 = new Case(ContactId = con.id, AccountId = acc.id, recordTypeId = dLisId, Assigned_To__c = u.id, 
                                   RFP_Format_Type__c = 'Request for Proposal (RFP)', Sub_Stage__c = 'Customer returned Amendment to TAMCO');
               //-------------------------------------------------------------------------------------------------------------------------------------------                    
               Case cs21 = new Case(ContactId = con.id, AccountId = acc.id, recordTypeId = dLisId, Assigned_To__c = u.id, 
                                   RFP_Format_Type__c = 'Request for Proposal (RFP)', Sub_Stage__c = 'Contract(s) Signed');
               Case cs22 = new Case(ContactId = con.id, AccountId = acc.id, recordTypeId = dLisId, Assigned_To__c = u.id, 
                                   RFP_Format_Type__c = 'Request for Proposal (RFP)', Sub_Stage__c = 'Service Order dropped in STATS');
               Case cs23 = new Case(ContactId = con.id, AccountId = acc.id, recordTypeId = dLisId, Assigned_To__c = u.id, 
                                   RFP_Format_Type__c = 'Request for Proposal (RFP)', Sub_Stage__c = 'added to WIP');
               Case cs24 = new Case(ContactId = con.id, AccountId = acc.id, recordTypeId = dLisId, Assigned_To__c = u.id, 
                                   RFP_Format_Type__c = 'Request for Proposal (RFP)', Sub_Stage__c = 'Billed');
               Case cs25 = new Case(ContactId = con.id, AccountId = acc.id, recordTypeId = dLisId, Assigned_To__c = u.id, 
                                   RFP_Format_Type__c = 'Request for Proposal (RFP)', Sub_Stage__c = 'Tech to verify scope of work');
               Case cs26 = new Case(ContactId = con.id, AccountId = acc.id, recordTypeId = dLisId, Assigned_To__c = u.id, 
                                   RFP_Format_Type__c = 'Request for Proposal (RFP)', Sub_Stage__c = 'Signed Contract Received');
               Case cs27 = new Case(ContactId = con.id, AccountId = acc.id, recordTypeId = dLisId, Assigned_To__c = u.id, 
                                   RFP_Format_Type__c = 'Request for Proposal (RFP)', Sub_Stage__c = 'A/E');
               Case cs28 = new Case(ContactId = con.id, AccountId = acc.id, recordTypeId = dLisId, Assigned_To__c = u.id, 
                                   RFP_Format_Type__c = 'Request for Proposal (RFP)', Sub_Stage__c = 'Credit Application Approved TAMCO Agreement Provided');
               Case cs29 = new Case(ContactId = con.id, AccountId = acc.id, recordTypeId = dLisId, Assigned_To__c = u.id, 
                                   RFP_Format_Type__c = 'Request for Proposal (RFP)', Sub_Stage__c = 'Credit Application Denied');
               Case cs30 = new Case(ContactId = con.id, AccountId = acc.id, recordTypeId = dLisId, Assigned_To__c = u.id, 
                                   RFP_Format_Type__c = 'Request for Proposal (RFP)', Sub_Stage__c = 'A/E Closed Opportunity ');
               
                                    
               csList.add(cs1);
               csList.add(cs2);
               csList.add(cs3);
               csList.add(cs4);
               csList.add(cs5);
               csList.add(cs6);
               csList.add(cs7);
               csList.add(cs8);
               csList.add(cs9);
               csList.add(cs10);
               csList.add(cs11);
               csList.add(cs12);
               csList.add(cs13);
               csList.add(cs14);
               csList.add(cs15);
               csList.add(cs16);
               csList.add(cs17);
               csList.add(cs18);
               csList.add(cs19);
               csList.add(cs20);
               csList.add(cs21);
               csList.add(cs22);
               csList.add(cs23);
               csList.add(cs24);
               csList.add(cs25);
               csList.add(cs26);
               csList.add(cs27);
               csList.add(cs28);
               csList.add(cs29);
               csList.add(cs30);
               insert csList;
               
               Case  cse1= [select id, stage__c, sub_Stage__c  from Case where AccountId =: acc.id and stage__c = null limit 1];
               cse1.stage__c = 'Referred';
               cse1.sub_Stage__c = 'Credit Application Denied';
               cse1.last_Stage_Change__c = DateTime.now();
               
               Case  cse2= [select id, stage__c, sub_Stage__c  from Case where AccountId =: acc.id and stage__c = 'Discovery' limit 1];
               cse2.stage__c = 'Sold';
               cse2.sub_Stage__c = 'Credit Application Denied';
               cse2.last_Stage_Change__c = DateTime.now();
               
               Case cse3 = [select id, stage__c, sub_Stage__c  from Case where AccountId =: acc.id and stage__c = 'Prefield' limit 1];
               cse3.stage__c = 'Sold';
               cse3.sub_Stage__c = 'CPE DSC Contacted Client';
               cse3.last_Stage_Change__c = DateTime.now();
               
               Case cse4 = [select id, stage__c, sub_Stage__c  from Case where AccountId =: acc.id and stage__c = 'Referred' limit 1];
               cse4.stage__c = 'Sold';
               cse4.sub_Stage__c = 'CPE DSC Contacted Client';
               cse4.last_Stage_Change__c = DateTime.now();
               
               Case cse5 = [select id, stage__c, sub_Stage__c  from Case where AccountId =: acc.id and stage__c = 'Proposal' limit 1];
               cse5.stage__c = 'Sold';
               cse5.sub_Stage__c = 'CPE DSC Contacted Client';
               cse5.last_Stage_Change__c = DateTime.now();
               
               Case cse6 = [select id, stage__c, sub_Stage__c  from Case where AccountId =: acc.id and stage__c = 'Contract' limit 1];
               cse6.stage__c = 'Sold';
               cse6.sub_Stage__c = 'CPE DSC Contacted Client';
               cse6.last_Stage_Change__c = DateTime.now();
               
               Case cse7 = [select id, stage__c, sub_Stage__c  from Case where AccountId =: acc.id and stage__c = 'Leaseco' limit 1];
               cse7.stage__c = 'Sold';
               cse7.sub_Stage__c = 'CPE DSC Contacted Client';
               cse7.last_Stage_Change__c = DateTime.now();            
               
               Case cse8 = [select id, stage__c, sub_Stage__c, duration_Leaseco__c, duration_Sold__c, duration_CPE_CoE_Contacted_Client__c, 
                            duration_S_E_Contacted_via_SERF_Reques__c, duration_24_hour_post_TTL_referral__c, duration_24_Hour_Escalation_to_RSM__c from Case 
                            where AccountId =: acc.id and Stage__c = 'Sold' limit 1];
               cse8.stage__c = 'Leaseco';
               cse8.sub_Stage__c = 'CPE DSC Contacted Client';
               cse8.Last_Sub_Stage_Change__c = DateTime.now();
               cse8.last_Stage_Change__c = DateTime.now();
               
               Case cse9 = [select id, stage__c, sub_Stage__c, duration_Leaseco__c, duration_Sold__c, duration_CPE_CoE_Contacted_Client__c, 
                            duration_S_E_Contacted_via_SERF_Reques__c, duration_24_hour_post_TTL_referral__c, duration_24_Hour_Escalation_to_RSM__c from Case 
                            where AccountId =: acc.id and sub_Stage__c = 'CPE CoE Contacted Client' limit 1];
               cse9.stage__c = 'Sold';
               cse9.sub_Stage__c = 'CPE DSC Contacted Client';
               cse9.Last_Sub_Stage_Change__c = DateTime.now();
               cse9.last_Stage_Change__c = DateTime.now();
               
               Case cse10 = [select id, stage__c, sub_Stage__c, duration_Leaseco__c, duration_Sold__c, duration_CPE_CoE_Contacted_Client__c, 
                            duration_S_E_Contacted_via_SERF_Reques__c, duration_24_hour_post_TTL_referral__c, duration_24_Hour_Escalation_to_RSM__c from Case 
                            where AccountId =: acc.id and sub_Stage__c = 'S/E Contacted via SERF Request if Applicable' limit 1];
               cse10.stage__c = 'Sold';
               cse10.sub_Stage__c = 'CPE DSC Contacted Client';
               cse10.Last_Sub_Stage_Change__c = DateTime.now();
               cse10.last_Stage_Change__c = DateTime.now();
               
               Case cse11 = [select id, stage__c, sub_Stage__c, duration_Leaseco__c, duration_Sold__c, duration_CPE_CoE_Contacted_Client__c, 
                            duration_S_E_Contacted_via_SERF_Reques__c, duration_24_hour_post_TTL_referral__c, duration_24_Hour_Escalation_to_RSM__c from Case 
                            where AccountId =: acc.id and sub_Stage__c = '24 hour post TTL referral Customer contact completed to valid contact Y/N' limit 1];
               cse11.stage__c = 'Sold';
               cse11.sub_Stage__c = 'CPE DSC Contacted Client';
               cse11.Last_Sub_Stage_Change__c = DateTime.now();
               cse11.last_Stage_Change__c = DateTime.now();
               
               Case cse12 = [select id, stage__c, sub_Stage__c, duration_Leaseco__c, duration_Sold__c, duration_CPE_CoE_Contacted_Client__c, 
                            duration_S_E_Contacted_via_SERF_Reques__c, duration_24_hour_post_TTL_referral__c, duration_24_Hour_Escalation_to_RSM__c from Case 
                            where AccountId =: acc.id and sub_Stage__c = '24 Hour Escalation to RSM Y/N' limit 1];
               cse12.stage__c = 'Sold';
               cse12.sub_Stage__c = 'CPE DSC Contacted Client';
               cse12.Last_Sub_Stage_Change__c = DateTime.now();
               cse12.last_Stage_Change__c = DateTime.now();
               
               Case cse13 = [select id, stage__c, sub_Stage__c, duration_Leaseco__c, duration_Sold__c, duration_CPE_CoE_Contacted_Client__c, 
                            duration_S_E_Contacted_via_SERF_Reques__c, duration_24_hour_post_TTL_referral__c, duration_24_Hour_Escalation_to_RSM__c from Case 
                            where AccountId =: acc.id and sub_Stage__c = '24 Hour Escalation to sales VP and Keith B - Y/N' limit 1];
               cse13.stage__c = 'Sold';
               cse13.sub_Stage__c = 'CPE DSC Contacted Client';
               cse13.Last_Sub_Stage_Change__c = DateTime.now();
               cse13.last_Stage_Change__c = DateTime.now();
               
               Case cse14 = [select id, stage__c, sub_Stage__c, duration_Leaseco__c, duration_Sold__c, duration_CPE_CoE_Contacted_Client__c, 
                            duration_S_E_Contacted_via_SERF_Reques__c, duration_24_hour_post_TTL_referral__c, duration_24_Hour_Escalation_to_RSM__c from Case 
                            where AccountId =: acc.id and sub_Stage__c = 'Quote Generated' limit 1];
               cse14.stage__c = 'Sold';
               cse14.sub_Stage__c = 'CPE DSC Contacted Client';
               cse14.Last_Sub_Stage_Change__c = DateTime.now();
               cse14.last_Stage_Change__c = DateTime.now();
               
               Case cse15 = [select id, stage__c, sub_Stage__c, duration_Leaseco__c, duration_Sold__c, duration_CPE_CoE_Contacted_Client__c, 
                            duration_S_E_Contacted_via_SERF_Reques__c, duration_24_hour_post_TTL_referral__c, duration_24_Hour_Escalation_to_RSM__c from Case 
                            where AccountId =: acc.id and sub_Stage__c = 'Budetary Proposal Provided to Customer' limit 1];
               cse15.stage__c = 'Sold';
               cse15.sub_Stage__c = 'CPE DSC Contacted Client';
               cse15.Last_Sub_Stage_Change__c = DateTime.now();
               cse15.last_Stage_Change__c = DateTime.now();
               
               Case cse16 = [select id, stage__c, sub_Stage__c, duration_Leaseco__c, duration_Sold__c, duration_CPE_CoE_Contacted_Client__c, 
                            duration_S_E_Contacted_via_SERF_Reques__c, duration_24_hour_post_TTL_referral__c, duration_24_Hour_Escalation_to_RSM__c from Case 
                            where AccountId =: acc.id and sub_Stage__c = 'Contract Provided to Client' limit 1];
               cse16.stage__c = 'Sold';
               cse16.sub_Stage__c = 'CPE DSC Contacted Client';
               cse16.Last_Sub_Stage_Change__c = DateTime.now();
               cse16.last_Stage_Change__c = DateTime.now();
               
               Case cse17 = [select id, stage__c, sub_Stage__c, duration_Leaseco__c, duration_Sold__c, duration_CPE_CoE_Contacted_Client__c, 
                            duration_S_E_Contacted_via_SERF_Reques__c, duration_24_hour_post_TTL_referral__c, duration_24_Hour_Escalation_to_RSM__c from Case 
                            where AccountId =: acc.id and sub_Stage__c = 'Credit Application provided to TAMCO' limit 1];
               cse17.stage__c = 'Sold';
               cse17.sub_Stage__c = 'CPE DSC Contacted Client';
               cse17.Last_Sub_Stage_Change__c = DateTime.now();
               cse17.last_Stage_Change__c = DateTime.now();
               
               Case cse18 = [select id, stage__c, sub_Stage__c, duration_Leaseco__c, duration_Sold__c, duration_CPE_CoE_Contacted_Client__c, 
                            duration_S_E_Contacted_via_SERF_Reques__c, duration_24_hour_post_TTL_referral__c, duration_24_Hour_Escalation_to_RSM__c from Case 
                            where AccountId =: acc.id and sub_Stage__c = 'TAMCO Agreement Provided' limit 1];
               cse18.stage__c = 'Sold';
               cse18.sub_Stage__c = 'CPE DSC Contacted Client';
               cse18.Last_Sub_Stage_Change__c = DateTime.now();
               cse18.last_Stage_Change__c = DateTime.now();
               
               Case cse19 = [select id, stage__c, sub_Stage__c, duration_Leaseco__c, duration_Sold__c, duration_CPE_CoE_Contacted_Client__c, 
                            duration_S_E_Contacted_via_SERF_Reques__c, duration_24_hour_post_TTL_referral__c, duration_24_Hour_Escalation_to_RSM__c from Case 
                            where AccountId =: acc.id and sub_Stage__c = 'DRN Received' limit 1];
               cse19.stage__c = 'Sold';
               cse19.sub_Stage__c = 'CPE DSC Contacted Client';
               cse19.Last_Sub_Stage_Change__c = DateTime.now();
               cse19.last_Stage_Change__c = DateTime.now();
               
               Case cse20 = [select id, stage__c, sub_Stage__c, duration_Leaseco__c, duration_Sold__c, duration_CPE_CoE_Contacted_Client__c, 
                            duration_S_E_Contacted_via_SERF_Reques__c, duration_24_hour_post_TTL_referral__c, duration_24_Hour_Escalation_to_RSM__c from Case 
                            where AccountId =: acc.id and sub_Stage__c = 'Customer returned Amendment to TAMCO' limit 1];
               cse20.stage__c = 'Sold';
               cse20.sub_Stage__c = 'CPE DSC Contacted Client';
               cse20.Last_Sub_Stage_Change__c = DateTime.now();
               cse20.last_Stage_Change__c = DateTime.now();               
               
               Case cse21 = [select id, stage__c, sub_Stage__c, duration_Leaseco__c, duration_Sold__c, duration_CPE_CoE_Contacted_Client__c, 
                            duration_S_E_Contacted_via_SERF_Reques__c, duration_24_hour_post_TTL_referral__c, duration_24_Hour_Escalation_to_RSM__c from Case 
                            where AccountId =: acc.id and sub_Stage__c = 'Contract(s) Signed' limit 1];
               cse21.stage__c = 'Sold';
               cse21.sub_Stage__c = 'CPE DSC Contacted Client';
               cse21.Last_Sub_Stage_Change__c = DateTime.now();
               cse21.last_Stage_Change__c = DateTime.now();
               
               Case cse22 = [select id, stage__c, sub_Stage__c, duration_Leaseco__c, duration_Sold__c, duration_CPE_CoE_Contacted_Client__c, 
                            duration_S_E_Contacted_via_SERF_Reques__c, duration_24_hour_post_TTL_referral__c, duration_24_Hour_Escalation_to_RSM__c from Case 
                            where AccountId =: acc.id and sub_Stage__c = 'Service Order dropped in STATS' limit 1];
               cse22.stage__c = 'Sold';
               cse22.sub_Stage__c = 'CPE DSC Contacted Client';
               cse22.Last_Sub_Stage_Change__c = DateTime.now();
               cse22.last_Stage_Change__c = DateTime.now();
               
               Case cse23 = [select id, stage__c, sub_Stage__c, duration_Leaseco__c, duration_Sold__c, duration_CPE_CoE_Contacted_Client__c, 
                            duration_S_E_Contacted_via_SERF_Reques__c, duration_24_hour_post_TTL_referral__c, duration_24_Hour_Escalation_to_RSM__c from Case 
                            where AccountId =: acc.id and sub_Stage__c = 'added to WIP' limit 1];
               cse23.stage__c = 'Sold';
               cse23.sub_Stage__c = 'CPE DSC Contacted Client';
               cse23.Last_Sub_Stage_Change__c = DateTime.now();
               cse23.last_Stage_Change__c = DateTime.now();
               
               Case cse24 = [select id, stage__c, sub_Stage__c, duration_Leaseco__c, duration_Sold__c, duration_CPE_CoE_Contacted_Client__c, 
                            duration_S_E_Contacted_via_SERF_Reques__c, duration_24_hour_post_TTL_referral__c, duration_24_Hour_Escalation_to_RSM__c from Case 
                            where AccountId =: acc.id and sub_Stage__c = 'Billed' limit 1];
               cse24.stage__c = 'Sold';
               cse24.sub_Stage__c = 'CPE DSC Contacted Client';
               cse24.Last_Sub_Stage_Change__c = DateTime.now();
               cse24.last_Stage_Change__c = DateTime.now();
               
               Case cse25 = [select id, stage__c, sub_Stage__c, duration_Leaseco__c, duration_Sold__c, duration_CPE_CoE_Contacted_Client__c, 
                            duration_S_E_Contacted_via_SERF_Reques__c, duration_24_hour_post_TTL_referral__c, duration_24_Hour_Escalation_to_RSM__c from Case 
                            where AccountId =: acc.id and sub_Stage__c = 'Tech to verify scope of work' limit 1];
               cse25.stage__c = 'Sold';
               cse25.sub_Stage__c = 'CPE DSC Contacted Client';
               cse25.Last_Sub_Stage_Change__c = DateTime.now();
               cse25.last_Stage_Change__c = DateTime.now();
               
               Case cse26 = [select id, stage__c, sub_Stage__c, duration_Leaseco__c, duration_Sold__c, duration_CPE_CoE_Contacted_Client__c, 
                            duration_S_E_Contacted_via_SERF_Reques__c, duration_24_hour_post_TTL_referral__c, duration_24_Hour_Escalation_to_RSM__c from Case 
                            where AccountId =: acc.id and sub_Stage__c = 'Signed Contract Received' limit 1];
               cse26.stage__c = 'Sold';
               cse26.sub_Stage__c = 'CPE DSC Contacted Client';
               cse26.Last_Sub_Stage_Change__c = DateTime.now();
               cse26.last_Stage_Change__c = DateTime.now();
               
               Case cse27 = [select id, stage__c, sub_Stage__c, duration_Leaseco__c, duration_Sold__c, duration_CPE_CoE_Contacted_Client__c, 
                            duration_S_E_Contacted_via_SERF_Reques__c, duration_24_hour_post_TTL_referral__c, duration_24_Hour_Escalation_to_RSM__c from Case 
                            where AccountId =: acc.id and sub_Stage__c = 'A/E' limit 1];
               cse27.stage__c = 'Sold';
               cse27.sub_Stage__c = 'CPE DSC Contacted Client';
               cse27.Last_Sub_Stage_Change__c = DateTime.now();
               cse27.last_Stage_Change__c = DateTime.now();
               //------------------------------------------------------------------------------------------------------------------------------------------- 
               Case cse28 = [select id, stage__c, sub_Stage__c, duration_Leaseco__c, duration_Sold__c, duration_CPE_CoE_Contacted_Client__c, 
                            duration_S_E_Contacted_via_SERF_Reques__c, duration_24_hour_post_TTL_referral__c, duration_24_Hour_Escalation_to_RSM__c from Case 
                            where AccountId =: acc.id and sub_Stage__c = 'Credit Application Approved TAMCO Agreement Provided' limit 1];
               cse28.stage__c = 'Sold';
               cse28.sub_Stage__c = 'CPE DSC Contacted Client';
               cse28.Last_Sub_Stage_Change__c = DateTime.now();
               cse28.last_Stage_Change__c = DateTime.now();
               
               Case cse29 = [select id, stage__c, sub_Stage__c, duration_Leaseco__c, duration_Sold__c, duration_CPE_CoE_Contacted_Client__c, 
                            duration_S_E_Contacted_via_SERF_Reques__c, duration_24_hour_post_TTL_referral__c, duration_24_Hour_Escalation_to_RSM__c from Case 
                            where AccountId =: acc.id and sub_Stage__c = 'Credit Application Denied' limit 1];
               cse29.stage__c = 'Sold';
               cse29.sub_Stage__c = 'CPE DSC Contacted Client';
               cse29.Last_Sub_Stage_Change__c = DateTime.now();
               cse29.last_Stage_Change__c = DateTime.now();
               /*
               Case cse30 = [select id, stage__c, sub_Stage__c, duration_Leaseco__c, duration_Sold__c, duration_CPE_CoE_Contacted_Client__c, 
                            duration_S_E_Contacted_via_SERF_Reques__c, duration_24_hour_post_TTL_referral__c, duration_24_Hour_Escalation_to_RSM__c from Case 
                            where AccountId =: acc.id and sub_Stage__c = 'A/E Closed Opportunity ' limit 1];
               cse30.stage__c = 'Sold';
               cse30.sub_Stage__c = 'CPE DSC Contacted Client';
               cse30.Last_Sub_Stage_Change__c = DateTime.now();
               cse30.last_Stage_Change__c = DateTime.now();
               */
            	
               
               List<Case> cseList = new List<Case>();
               cseList.add(cse1);
               cseList.add(cse2);
               cseList.add(cse3);
               cseList.add(cse4);
               cseList.add(cse5);
               cseList.add(cse6);
               cseList.add(cse7);
               cseList.add(cse8);
               cseList.add(cse9);
               cseList.add(cse10);
               cseList.add(cse11);
               cseList.add(cse12);
               cseList.add(cse13);
               cseList.add(cse14);
               cseList.add(cse15);
               cseList.add(cse16);
               cseList.add(cse17);
               cseList.add(cse18);
               cseList.add(cse19);
               cseList.add(cse20);
               cseList.add(cse21);
               cseList.add(cse22);
               cseList.add(cse23);
               cseList.add(cse24);
               cseList.add(cse25);
               cseList.add(cse26);
               cseList.add(cse27);
               cseList.add(cse28);
               cseList.add(cse29);
               //cseList.add(cse30);
               
               update cseList;
        }
        
}