/********************************************************************************************
Name : ContractRepositoryUtility
Created By : Mohan Talluri (mohan.talluri@ftr.com)
Created Date : June 13, 2016
Description :  Utility to support ContractRepository Trigger Handler.
********************************************************************************************/

public with sharing class ContractRepositoryUtility {
    
    public static void setICBFlag(List<Contract_Repository__c> itemList){
    
        Boolean flag = false;
        list <OpportunityLineItem> Oli;
        
        for (Contract_Repository__c C : itemList)
        {
            flag = false;
            Oli = new List<OpportunityLineItem>();
            if ((C.CustomerSignedDate__c <> null) && (C.CompanySigneddate__c <> null)){
                 Opportunity Opp = [SELECT id, NRC__c, MRR_Amount__c,Name, Contract_MRR__c, Pricebook2Id 
                                    FROM Opportunity where id =: C.Opportunity__c];                                                                           
                 Oli = [SELECT UnitPrice, product_price__c FROM OpportunityLineItem where OpportunityId =: Opp.Id];
                       
                 for (OpportunityLineItem O : Oli){
                      if (O.product_price__c  <> O.UnitPrice)
                        flag = true;  // This should have a break, i hope this code is tested - Mohan.
                  }      
             }  
             if (flag)
                 C.ICB_Flag__c = 'Y';
        }

    }
     
}