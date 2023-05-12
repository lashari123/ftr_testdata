/********************************************************************************************
Name : AssetUtility
Created By : Mohan Talluri (mohan.talluri@ftr.com)
Created Date : Mar 5, 2016
Description :  Utility to support Asset Trigger Handler.
********************************************************************************************/

public with sharing class AssetUtility {

    /*public static void fetchAccountId(List<Asset__C> newItems) {
        Map<string, ID> tnAccountList = new Map<string, ID>();
        Map<string, string> tnGANList = new Map<string, ID>();      
        set<string> tnList = new set<string>();
        String TN = '';
        
        for (Asset__c assetInfo : newItems) {
           //if (assetInfo.Account__c == null)
                tnList.add(ObjectUtility.appendZeroOnTN(assetInfo.TNSequenceId__C));
        }
        
        List<Account>  accountList = [Select ID, TNSequenceID__C, DPI_GanID__c from Account where TNSequenceID__C <> null and TNSequenceID__c  in :tnList];
        
        for (Account a : accountList) {
           tnAccountList.put(a.TNSequenceID__C, a.ID);
           tnGANList.put(a.TNSequenceID__C, String.ValueOf(a.DPI_GanID__c));
           System.debug('AssetUtility:: Set ID and GAN info into Map');
        }   
        
        for (Asset__c assetInfo : newItems) {
           TN = ObjectUtility.appendZeroOnTN(assetInfo.TNSequenceId__C);
           assetInfo.TNSequenceId__C = TN;
           if (TN != null && TN.length() <= 10)
              assetInfo.GanID__c = TN;
           else if (assetInfo.Account__c == null) {
                assetInfo.Account__c = tnAccountList.get(assetInfo.TNSequenceId__C);
                assetInfo.GanID__c = String.ValueOf(tnGANList.get(assetInfo.TNSequenceId__C));
                System.debug('AssetUtility:: Set GAN Value');
           }
        }
    }*/
    
    public static void fetchAccountId(List<Asset__C> newItems) {

        Map<string, Account> tnAccountList = new Map<string, Account>();
        Account acc = null;
        String GANID = '';
        
        set<string> tnList = new set<string>();
        String TN = '';
        
        for (Asset__c assetInfo : newItems)
                tnList.add(ObjectUtility.appendZeroOnTN(assetInfo.TNSequenceId__C));
        
        List<Account>  accountList = [Select ID, TNSequenceID__C, DPI_GanID__c from Account where TNSequenceID__C <> null and TNSequenceID__c  in :tnList];
        
        for (Account a : accountList) {
           tnAccountList.put(a.TNSequenceID__C, a);
           System.debug('AssetUtility:: Set ID and ACCOUNT info into Map');
        }   
        
        for (Asset__c assetInfo : newItems) {
           
           GANID = '';
           TN = ObjectUtility.appendZeroOnTN(assetInfo.TNSequenceId__C);
           assetInfo.TNSequenceId__C = TN;
           
           if (TN != null && TN.length() <= 10)
              assetInfo.GanID__c = TN;
           else
           {
                acc = null;
                acc = tnAccountList.get(assetInfo.TNSequenceId__C);
                
                if (acc != null) {
                    assetInfo.Account__c = acc.ID;
                    System.debug('AssetUtility:: Setting GAN ID');
                    
                    try{
                      GANID = String.ValueOf(acc.DPI_GanID__c);
                    }catch(Exception e)
                    {
                       System.debug('AssetUtility:: Exception fetching GANID - getMessage:: ' + e.getMessage() + 'getStackTraceString :: '+ e.getStackTraceString());
                    }
                }
                                                    
                assetInfo.GanID__c = GANID;
                System.debug('AssetUtility:: Set GAN Value');
           }
           
        }
    }
   
}