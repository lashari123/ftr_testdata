/********************************************************************************************
Name : BillingDetailUtility
Created By : Mohan Talluri (mohan.talluri@ftr.com)
Created Date : June 13, 2016
Description :  Utility to support BillingDetail Trigger Handler.
********************************************************************************************/


public with sharing class BillingDetailUtility {
  
      public static void deleteBd(List<Billing_Detail_2__c> bilDtList){
      
            List<Billing_Detail_2__c> BD2_TO_DELETE = new List<Billing_Detail_2__c>();
            Set<String> BD2_ACCOUNTIDS = new Set<String>();
            String EmailBody='';
            Integer TotalCount=0;    
            
            for(Billing_Detail_2__c bd2 : bilDtList)
                BD2_ACCOUNTIDS.add(bd2.Account_Id__c);
            
            List<AggregateResult> BD2_AGGREGATERESULT = [SELECT Account_Id__c AccountId, MAX(S_E_To_Date__c) StatementEndDate FROM Billing_Detail_2__c WHERE Account_Id__c IN :BD2_ACCOUNTIDS GROUP BY Account_Id__c LIMIT 20000];
            
            for(Billing_Detail_2__c bd2 : [SELECT Account_Id__c, S_E_To_Date__c FROM Billing_Detail_2__c WHERE Account_Id__c IN :BD2_ACCOUNTIDS LIMIT 30000]){
                for(AggregateResult AR : BD2_AGGREGATERESULT){  
                    if((string)AR.get('AccountId') == bd2.Account_Id__c)
                        if((date)AR.get('StatementEndDate') != bd2.S_E_To_Date__c)
                           BD2_TO_DELETE.add(bd2);
                }
            }
            
            if(BD2_TO_DELETE.size() > 0)
                delete BD2_TO_DELETE;            
            
      }
      
}