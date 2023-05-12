/********************************************************************************************
Name : AccountIDUnique1Utility
Created By : Mohan Talluri (mohan.talluri@ftr.com)
Created Date : June 13, 2016
Description :  Utility to support AccountIDUnique1 Trigger Handler.
********************************************************************************************/

public with sharing class AccountIDUnique1Utility {

    public static void deleteBillDetail(List<AccountIDUnique1__c> auList){
    
        StatusOfDeleteBatch.isBatchComplete = true;         
        List<Billing_Detail_2__c> lstBilRec;
        List<Billing_Detail_2__c> lstBilRecDel;
        List<Billing_Detail_2__c> deleteList = new List<Billing_Detail_2__c>();
        Decimal intMonth, intYear;
         
        for(AccountIDUnique1__c s : auList) {
            lstBilRec = [SELECT YearNumber__c,Account_Id__c, MonthNumber__c,Month__c FROM Billing_Detail_2__c
                                                   WHERE Account_Id__c =:s.Name ORDER BY MonthNumber__c desc NULLS LAST];
            if(lstBilRec.size()>0){
                intMonth = lstBilRec[0].MonthNumber__c;
                intYear = lstBilRec[0].YearNumber__c;
                lstBilRecDel = [SELECT Account_Id__c, MonthNumber__c,Month__c FROM Billing_Detail_2__c WHERE Account_Id__c =:s.Name 
                                                          AND MonthNumber__c!=:intMonth ORDER BY MonthNumber__c desc NULLS LAST];
                if(lstBilRecDel.size()>0) 
                    deleteList.addAll(lstBilRecDel);
            }            
        }        
        
        if(deleteList.size()>0) 
            delete deleteList;
                    
        StatusOfDeleteBatch.isBatchComplete = false;
        
    }
    
}