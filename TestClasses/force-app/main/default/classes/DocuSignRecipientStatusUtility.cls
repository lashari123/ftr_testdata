/********************************************************************************************
Name : DocuSignRecipientStatusUtility
Created By : Mohan Talluri (mohan.talluri@ftr.com)
Created Date : June 13, 2016
Description :  Utility to support DocuSignRecipientStatus Trigger Handler.
********************************************************************************************/

public with sharing class DocuSignRecipientStatusUtility {

    public static void updateDocStatus(List<dsfs__DocuSign_Recipient_Status__c> items){
    
        Map<Id, String> updateDocStatMap = new Map<Id, String>();
        Map<Id, String> updateDocStatMap1 = new Map<Id, String>();
        List<contract> contracts = new List<contract>();
         
        for (dsfs__DocuSign_Recipient_Status__c  docRecip : items){
    
            if(docRecip.dsfs__Parent_Status_Record__c != NULL){
    
                if(docRecip.dsfs__DocuSign_Routing_Order__c == 1 && docRecip.dsfs__Recipient_Status__c == 'Declined'){
                    updateDocStatMap.put(docRecip.dsfs__Parent_Status_Record__c, 'Declined/Cancelled');
                    updateDocStatMap1.put(docRecip.dsfs__Parent_Status_Record__c, 'Declined/Cancelled');

                }else if(docRecip.dsfs__DocuSign_Routing_Order__c == 1 && docRecip.dsfs__Date_Signed__c != NULL){
                    updateDocStatMap.put(docRecip.dsfs__Parent_Status_Record__c, 'Contract Signed – Ready for Offline Action');
                    updateDocStatMap1.put(docRecip.dsfs__Parent_Status_Record__c, 'Customer Signed');
                    
                } else if(docRecip.dsfs__DocuSign_Routing_Order__c == 1 && docRecip.dsfs__Date_Delivered__c != NULL){
                    updateDocStatMap.put(docRecip.dsfs__Parent_Status_Record__c, 'Contract Has Been Opened and Pending Customer Action');
                    updateDocStatMap1.put(docRecip.dsfs__Parent_Status_Record__c, 'Sent');

                } else if(docRecip.dsfs__DocuSign_Routing_Order__c == 1 && docRecip.dsfs__Date_Sent__c != NULL){
                    updateDocStatMap.put(docRecip.dsfs__Parent_Status_Record__c, 'Contract has been Sent to the Customer');
                    updateDocStatMap1.put(docRecip.dsfs__Parent_Status_Record__c, 'Sent');
                }                       
             }     
                                            
    
            if(updateDocStatMap.size() > 0 || updateDocStatMap1.size() > 0){
                
                Map<Id, dsfs__DocuSign_Status__c > docStatMap = new Map<Id, dsfs__DocuSign_Status__c >([SELECT Id, dsfs__Contract__r.id, dsfs__Contract__r.Promotional_Contract__c, 
                                                                                                        dsfs__Contract__r.Promo_Contract_Status__c, Contract_Repository_Portal__c  
                                                                                                        FROM dsfs__DocuSign_Status__c WHERE Id In :updateDocStatMap.keyset()]);
                
                for(dsfs__DocuSign_Status__c  ds : docStatMap.values()){
                    contract cont = new Contract();          
                    if(ds.dsfs__Contract__r != NULL){
                        ds.dsfs__Contract__r.Promo_Contract_Status__c = updateDocStatMap.get(ds.Id);
                        ds.dsfs__Contract__r.Contract_Status__c = updateDocStatMap1.get(ds.Id);
                        cont.Id = ds.dsfs__Contract__r.Id;
                        
                        if(ds.dsfs__Contract__r.Promotional_Contract__c == 'Promo'){                
                            cont.Promo_Contract_Status__c = ds.dsfs__Contract__r.Promo_Contract_Status__c;
                        }            
                        cont.Contract_Status__c = ds.dsfs__Contract__r.Contract_Status__c;
                           
                        contracts.add(cont);  
                    }          
                }              
            }
        }
    
        if(contracts.size() > 0){
            update contracts;
        }
    }
    
}