public with sharing class ftr_AttributeSIPInwardDialing {
    
    public final static String ProductCode_SIP = 'SIP_TRUNKING_0010';
    public final static String ProductCode_SIP_DIWD= 'SIP_DIRECT_INWARD_DIALING';
    public final static String ProductCode_SIP_LDBT = 'SIP_LD_BLOCK_OF_TIME_INCLUDED';
    public final static String ProductCode_SIP_ITW = 'SIP_INTL_TALK_TO_WORLD';
    public final static String ProductCode_SIP_TFN = 'SIP_TF_NUMBER';
    public final static String ProductCode_SIP_TFAB = 'SIP_TF_ADDITIONAL_BLOCKS';
    public final static String ProductCode_SIP_LDBOT= 'SIP_LD_BLOCK_OF_TIME';
    public final static String ProductCode_SIP_DIDNumber= 'SIP_DID_NUMBER_INCLUDED';
    
    public static void setAttributeSIPInwardDialing(String orderId){
        
        System.debug('::: OrderrID'+orderId);
        List<OrderItem> sipInwardDialingOrderItem = new List<OrderItem>();
        List<OrderItem> sipInwardDialingOrderItemUpdate = new List<OrderItem>();
        Map<String,Object>  ordItemValues = new Map<string,Object>();
        List<OrderItem> listOrderItem= [SELECT id,vlocity_cmt__rootitemid__c,uni_host__c,
                                        SNE_Code_MRC__c,SNE_Code_OTC__c,SNE_Code_TERM__c,vlocity_cmt__OneTimeCharge__c,Quantity,vlocity_cmt__RecurringCharge__c,vlocity_cmt__EffectiveQuantity__c,
                                        vlocity_cmt__JSONAttribute__c,vlocity_cmt__Product2Id__r.ProductCode FROM OrderItem Where OrderId=:orderID ];
        
        if(!listOrderItem.isEmpty()){
            
            for(OrderItem attributeItem : listOrderItem){
                //SIP 	LD Block of Time - Included
                if(attributeItem.vlocity_cmt__Product2Id__r.ProductCode==ProductCode_SIP_LDBT){
                    ordItemValues.put('SIP_LDBT_SNE_Code_MRC',attributeItem.SNE_Code_MRC__c);
                    ordItemValues.put('SIP_LDBT_SNE_MRC',attributeItem.vlocity_cmt__RecurringCharge__c);
                    ordItemValues.put('SIP_LDBT_Quantity',attributeItem.vlocity_cmt__EffectiveQuantity__c);
                }
                //SIP turking
                else if(attributeItem.vlocity_cmt__Product2Id__r.ProductCode==ProductCode_SIP){
                    ordItemValues.put('DIP_SIP_Code_SIPT',attributeItem.SNE_Code_MRC__c);
                    ordItemValues.put('DID_SNE_Code_OTC',attributeItem.SNE_Code_OTC__c);
                    ordItemValues.put('DID_SNE_Code_TERM',attributeItem.SNE_Code_TERM__c);
                    ordItemValues.put('DID_OneTimeTotal',attributeItem.vlocity_cmt__OneTimeCharge__c);    
                    ordItemValues.put('DPI_SIP_MRC',attributeItem.vlocity_cmt__RecurringCharge__c);   
                    ordItemValues.put('DPI_SIP_Quantity',attributeItem.vlocity_cmt__EffectiveQuantity__c);
                     
                }
                //SIP - International Talk to the World
                else if(attributeItem.vlocity_cmt__Product2Id__r.ProductCode==ProductCode_SIP_ITW){
                    ordItemValues.put('SIP_ITW_SNE_Code_MRC',attributeItem.SNE_Code_MRC__c);
                    ordItemValues.put('SIP_ITW_Quantity',attributeItem.vlocity_cmt__EffectiveQuantity__c);
                    ordItemValues.put('SIP_ITW_SNE_MRC',attributeItem.vlocity_cmt__RecurringCharge__c);
                }
                //SIP Toll Free Number
                else if(attributeItem.vlocity_cmt__Product2Id__r.ProductCode==ProductCode_SIP_TFN){
                    ordItemValues.put('SIP_TFN_SNE_Code_MRC',attributeItem.SNE_Code_MRC__c);
                    ordItemValues.put('SIP_TFN_Quantity',attributeItem.vlocity_cmt__EffectiveQuantity__c);
                    ordItemValues.put('SIP_TFN_SNE_MRC',attributeItem.vlocity_cmt__RecurringCharge__c);
                }
                //SIP TF Block of Time - Additional
                else if(attributeItem.vlocity_cmt__Product2Id__r.ProductCode==ProductCode_SIP_TFAB){
                    ordItemValues.put('SIP_TFAB_SNE_Code_MRC',attributeItem.SNE_Code_MRC__c);
                    ordItemValues.put('SIP_TFAB_Quantity',attributeItem.vlocity_cmt__EffectiveQuantity__c);
                    ordItemValues.put('SIP_TFAB_SNE_MRC',attributeItem.vlocity_cmt__RecurringCharge__c);
                }
                //SIP LD Block of Time - Additional
                else if(attributeItem.vlocity_cmt__Product2Id__r.ProductCode==ProductCode_SIP_LDBOT){
                    ordItemValues.put('SIP_LDBOT_SNE_Code_MRC',attributeItem.SNE_Code_MRC__c);
                    ordItemValues.put('SIP_LDBOT_Quantity',attributeItem.vlocity_cmt__EffectiveQuantity__c);
                    ordItemValues.put('SIP_LDBOT_SNE_MRC',attributeItem.vlocity_cmt__RecurringCharge__c);
                }
                //SIP DID Number - Included
                else if(attributeItem.vlocity_cmt__Product2Id__r.ProductCode==ProductCode_SIP_DIDNumber){
                    ordItemValues.put('DID_SNE_Code_MRC',attributeItem.SNE_Code_MRC__c);
                    ordItemValues.put('DID_SNE_Code_OTC',attributeItem.SNE_Code_OTC__c);
                    ordItemValues.put('DID_SNE_Code_TERM',attributeItem.SNE_Code_TERM__c);
                    ordItemValues.put('DID_OneTimeTotal',attributeItem.vlocity_cmt__OneTimeCharge__c);    
                    ordItemValues.put('DID_RecurringCharge',attributeItem.vlocity_cmt__RecurringCharge__c);   
                    ordItemValues.put('DID_Quantity',attributeItem.Quantity);
                    
                }
                else if(attributeItem.vlocity_cmt__Product2Id__r.ProductCode==ProductCode_SIP_DIWD){
                    sipInwardDialingOrderItem.add(attributeItem);
                }
            }
            
            if(!sipInwardDialingOrderItem.isEmpty()){
                System.debug('::: sipInwardDialingOrderItem'+sipInwardDialingOrderItem.size());
                
                for(OrderItem setSIPInward: sipInwardDialingOrderItem){
                    //SIP turking 
                    setSIPInward.SIPT_quantity__c = String.valueOf(ordItemValues.get('DPI_SIP_Quantity'));
                    setSIPInward.DPI_SIP_MRC__c = String.valueOf(ordItemValues.get('DPI_SIP_MRC'));
                    setSIPInward.SIP_Code_SIPT__c = String.valueOf(ordItemValues.get('DIP_SIP_Code_SIPT'));
                    
                    //SIP DID Number - Included
                    setSIPInward.SIP_Code_DID__c = String.valueOf(ordItemValues.get('DID_SNE_Code_MRC'));
                    setSIPInward.DID_SNE_Code_MRC__c = String.valueOf(ordItemValues.get('DID_RecurringCharge'));
                    setSIPInward.DID_Quantity__c = String.valueOf(ordItemValues.get('DID_Quantity'));
                    
                    //SIP 	LD Block of Time - Included
                    setSIPInward.SIP_Code_LDBT__c = String.valueOf(ordItemValues.get('SIP_LDBT_SNE_Code_MRC'));
                    setSIPInward.SIP_LDBT_Quantity__c = String.valueOf(ordItemValues.get('SIP_LDBT_Quantity'));
                    setSIPInward.SIP_LDBT_SNE_MRC__c = String.valueOf(ordItemValues.get('SIP_LDBT_SNE_MRC'));
                    
                    //SIP - International Talk to the World
                    setSIPInward.SIP_Code_ITW__c   = String.valueOf(ordItemValues.get('SIP_ITW_SNE_Code_MRC')); 
                    setSIPInward.SIP_ITW_SNE_Code_MRC__c   = String.valueOf(ordItemValues.get('SIP_ITW_SNE_MRC')); 
                    setSIPInward.SIP_ITW_Quantity__c   = String.valueOf(ordItemValues.get('SIP_ITW_Quantity'));
                    
                    //SIP LD Block of Time - Additional
                    setSIPInward.SIP_Code_LDBOT__c = String.valueOf(ordItemValues.get('SIP_LDBOT_SNE_Code_MRC'));
                    setSIPInward.SIP_LDBOT_SNE_Code_MRC__c = String.valueOf(ordItemValues.get('SIP_LDBOT_SNE_MRC'));
                    setSIPInward.SIP_LDBOT_Quantity__c = String.valueOf(ordItemValues.get('SIP_LDBOT_Quantity'));
                    
                    //SIP TF Block of Time - Additional
                    setSIPInward.SIP_Code_TFAB__c = String.valueOf(ordItemValues.get('SIP_TFAB_SNE_Code_MRC'));
                    setSIPInward.SIP_TFAB_Quantity__c = String.valueOf(ordItemValues.get('SIP_TFAB_Quantity'));
                    setSIPInward.SIP_TFAB_SNE_Code_MRC__c = String.valueOf(ordItemValues.get('SIP_TFAB_SNE_MRC'));
                    
                    //SIP Toll Free Number
                    setSIPInward.SIP_Code_TFN__c = String.valueOf(ordItemValues.get('SIP_TFN_SNE_Code_MRC'));
                    setSIPInward.SIP_TFN_Quantity__c = String.valueOf(ordItemValues.get('SIP_TFN_Quantity'));
                    setSIPInward.SIP_TFN_SNE_Code_MRC__c = String.valueOf(ordItemValues.get('SIP_TFN_SNE_MRC'));
                    
                    sipInwardDialingOrderItemUpdate.add(setSIPInward);
                }
                
                if(!sipInwardDialingOrderItemUpdate.isEmpty()){
                    Update sipInwardDialingOrderItemUpdate;
                }
            }
        }
    }
}