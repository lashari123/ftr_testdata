public with sharing class HistoryMigration {

/*
     public void ProcessOpportunityObjectHistory() {

        List<Shane_NW_Rows__c> snrsToProcess = [SELECT FtrOpportunityId__c, NWId__c, RowType__c, Status__c 
                                                FROM Shane_NW_Rows__c 
                                                WHERE RowType__c = 'Opportunity' 
                                                AND Status__c = null LIMIT 500];
                                                
        if(snrsToProcess != null && snrsToProcess.size() > 0) {

            List<Shane_NW_Rows__c> snrsToUpdate = new List<Shane_NW_Rows__c>();
            
            List<Id> oppIds = new List<Id>();
            
            for(Shane_NW_Rows__c snr : snrsToProcess) {
                snr.Status__c = 'OppHistory1';
                snrsToUpdate.add(snr);
                oppIds.add(snr.FtrOpportunityId__c);
            }
            update snrsToUpdate;
            
            List<OpportunityHistory> relatedOppHistory = [SELECT Amount,CloseDate,CreatedById,CreatedDate,ExpectedRevenue,ForecastCategory,Id,IsDeleted,OpportunityId,Probability,StageName, CreatedBy.name 
                                                            FROM OpportunityHistory 
                                                            WHERE OpportunityId IN :oppIds];
            
            List<Shane_NW_Opportunity_History__c> snohToInsert = new List<Shane_NW_Opportunity_History__c>();
            
            for(OpportunityHistory oppHis : relatedOppHistory) {
                Shane_NW_Opportunity_History__c temp = new Shane_NW_Opportunity_History__c();
                
                temp.Amount__c = oppHis.amount;
                temp.Close_Date__c = oppHis.closeDate;
                temp.Expected_Revenue__c = oppHis.ExpectedRevenue;
                temp.Forecast_Category__c = oppHis.ForecastCategory;
                temp.FrontierRowId__c = oppHis.Id;
                temp.HistoryCreateByName__c = oppHis.createdBy.name;
                temp.HistoryCreatedById__c = oppHis.createdById;
                temp.HistoryCreatedDate__c = oppHis.createdDate;
                temp.HistoryType__c = 'ObjectHistory';
                temp.OpportunityId__c = oppHis.OpportunityId;
                temp.Probability__c = oppHis.probability;
                temp.StageName__c = oppHis.stageName;
                
                snohToInsert.add(temp);
            }
            
            if(snohToInsert != null && snohToInsert.size() > 0) {
                insert snohToInsert;
            }
        }//end of if(snrsToProcess != null && snrsToProcess.size() > 0)
     }
     
     public void ProcessOpportunityFieldHistory() {

        List<Shane_NW_Rows__c> snrsToProcess = [SELECT FtrOpportunityId__c, NWId__c, RowType__c, Status__c 
                                                FROM Shane_NW_Rows__c 
                                                WHERE RowType__c = 'Opportunity' 
                                                AND Status__c = 'OppHistory1' LIMIT 500];
                                                
        if(snrsToProcess != null && snrsToProcess.size() > 0) {

            List<Shane_NW_Rows__c> snrsToUpdate = new List<Shane_NW_Rows__c>();
            
            List<Id> oppIds = new List<Id>();
            
            for(Shane_NW_Rows__c snr : snrsToProcess) {
                snr.Status__c = 'OppHistory2';
                snrsToUpdate.add(snr);
                oppIds.add(snr.FtrOpportunityId__c);
            }
            update snrsToUpdate;
            
            List<OpportunityFieldHistory> relatedOppHistory = [SELECT CreatedById,CreatedDate,Field,Id,IsDeleted,NewValue,OldValue,OpportunityId,CreatedBy.name 
                                                            FROM OpportunityFieldHistory
                                                            WHERE OpportunityId IN :oppIds];
            
            List<Shane_NW_Opportunity_History__c> snohToInsert = new List<Shane_NW_Opportunity_History__c>();
            
            for(OpportunityFieldHistory oppHis : relatedOppHistory) {
                Shane_NW_Opportunity_History__c temp = new Shane_NW_Opportunity_History__c();
                
                temp.FrontierRowId__c = oppHis.Id;
                temp.HistoryCreateByName__c = oppHis.createdBy.name;
                temp.HistoryCreatedById__c = oppHis.createdById;
                temp.HistoryCreatedDate__c = oppHis.createdDate;
                temp.HistoryType__c = 'FieldHistory';
                temp.OpportunityId__c = oppHis.OpportunityId;
                temp.Changed_Field__c = oppHis.Field;
                String newValue = oppHis.NewValue+'';
                String oldValue = oppHis.OldValue+'';
                temp.New_Value__c = newValue.abbreviate(255);
                temp.Old_Value__c = oldValue.abbreviate(255);
                
                snohToInsert.add(temp);
            }
            
            if(snohToInsert != null && snohToInsert.size() > 0) {
                insert snohToInsert;
            }
        }//end of if(snrsToProcess != null && snrsToProcess.size() > 0)
     }
*/
     
     public void ProcessAccountFieldHistory() {

        List<Shane_NW_Rows__c> snrsToProcess = [SELECT FtrAccountId__c, NWId__c, RowType__c, Status__c 
                                                FROM Shane_NW_Rows__c 
                                                WHERE RowType__c = 'Account' 
                                                AND Status__c = NULL LIMIT 500];
                                                
        if(snrsToProcess != null && snrsToProcess.size() > 0) {

            List<Shane_NW_Rows__c> snrsToUpdate = new List<Shane_NW_Rows__c>();
            
            List<Id> accIds = new List<Id>();
            
            for(Shane_NW_Rows__c snr : snrsToProcess) {
                snr.Status__c = 'AccHistory1';
                snrsToUpdate.add(snr);
                accIds.add(snr.FtrAccountId__c);
            }
            update snrsToUpdate;
            
            List<AccountHistory> relatedAccHistory = [SELECT CreatedById,CreatedDate,Field,Id,IsDeleted,NewValue,OldValue,AccountId,CreatedBy.name 
                                                            FROM AccountHistory
                                                            WHERE AccountId IN :accIds];
            
            List<Shane_NW_Account_History__c> snahToInsert = new List<Shane_NW_Account_History__c>();
            
            for(AccountHistory accHis : relatedAccHistory) {
                Shane_NW_Account_History__c temp = new Shane_NW_Account_History__c();
                
                temp.FrontierRowId__c = accHis.Id;
                temp.HistoryCreateByName__c = accHis.createdBy.name;
                temp.HistoryCreatedById__c = accHis.createdById;
                temp.HistoryCreatedDate__c = accHis.createdDate;
                temp.AccountId__c = accHis.AccountId;
                temp.Changed_Field__c = accHis.Field;
                String newValue = accHis.NewValue+'';
                String oldValue = accHis.OldValue+'';
                temp.New_Value__c = newValue.abbreviate(255);
                temp.Old_Value__c = oldValue.abbreviate(255);
                
                snahToInsert.add(temp);
            }
            
            if(snahToInsert != null && snahToInsert.size() > 0) {
                insert snahToInsert;
            }
        }
     }
}