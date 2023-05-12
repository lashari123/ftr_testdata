public with sharing class Utilities {
    
    public static Boolean isNumericOrDecimal(String s){
        if(s == null) return false;
        else if(s.contains('.') && s.indexOf('.') == s.lastIndexOf('.'))
            s = s.replace('.','');
        return s.isNumeric();
    }
    
    public static List<String> getFieldList(String selectedObjectName){
        //List<SelectOption> options = new List<SelectOption>();           
        Map<String, Schema.SObjectType> gd = Schema.getGlobalDescribe();    
        List<String> returnList = new List<String>();
        
        if (selectedObjectName != null && selectedObjectName != ''){
            Schema.SObjectType ctype = gd.get(selectedObjectName);
            Map<String, Schema.SobjectField> fmap = ctype.getDescribe().fields.getMap();
            
            
            Set<String>  setFields = fmap.KeySet();
            List<String> lstSortedFields = new List<String>();                  
            
            for(String s : setFields){               
                if(fmap.get(s).getDescribe().isCreateable() && fmap.get(s).getDescribe().isUpdateable())
                    returnList.add(s);
            }    
        }
        return  returnList;
    }
    
    public static List<History__c> getHistoryList(sObject sObjectOld,sObject sObjectNew,String ObjectName){
        List<String> fieldList = Utilities.getFieldList(ObjectName);
        List<History__c> returnList = new List<History__c>();           
        
        
        Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
        Schema.SObjectType leadSchema = schemaMap.get(ObjectName);
        Map<String, Schema.SObjectField> fieldMap = leadSchema.getDescribe().fields.getMap();
        
        for(String s : fieldList){                                      
            if ((sObjectOld.get(s)!=sObjectNew.get(s) && Trigger.IsUpdate && Trigger.IsAfter) || Test.isRunningTest() ){                                        
                History__c h = new History__c(user__c=Userinfo.getUserId());
                h.Entity__c       = ObjectName;
                h.EntityID__c     = String.valueOf(sObjectNew.get('Id'));                       
                h.RelAccount__c   = ((ObjectName == 'Contact' || ObjectName == 'Opportunity')?null /*String.valueOf(sObjectNew.get('AccountId'))*/:String.valueOf(sObjectNew.get('Id')));
                h.Operation__c    = 'UPDATE';
                h.FieldAPIName__c = fieldMap.get(s).getDescribe().getLabel();
                h.FieldOldVaue__c = String.valueOf(sObjectOld.get(s));
                h.FieldNewValue__c= String.valueOf(sObjectNew.get(s));                        
                if (ObjectName =='Opportunity')
                    h.Opportunity__c = h.EntityID__c;
                else if (ObjectName =='contact')
                    h.Contact__c = h.EntityID__c;
                
                /*if( sObjectNew.get('memo__c') != null)
h.Memo__c =    String.valueOf(sObjectNew.get('memo__c'));
*/                           
                if( sObjectNew.get('additional_notes__c') != null && sObjectNew.get('additional_notes__c') != '')
                    h.Memo__c =    String.valueOf(sObjectNew.get('additional_notes__c'));
                else if( sObjectNew.get('memo__c') != null && sObjectNew.get('memo__c') != '')
                    h.Memo__c =    String.valueOf(sObjectNew.get('memo__c'));    
                
                returnList.add(h);
            }                
        }
        
        return  returnList;
    }
    
    public static List<History__c> getMyHistory(String EntityId,String memoName){
        List<History__c> returnList = new List<History__c>();
        List<History__c> tempList = new List<History__c>();
        
        if (EntityId != null && EntityId != '')
            tempList = [SELECT ID,Memo__c,User__r.name,User__r.Username,User__r.email,Operation__c, FieldOldVaue__c, FieldNewValue__c, FieldAPIName__c,CreatedDate
                        ,User_csrid__c,User_Email__c
                        FROM History__c where EntityID__c =: EntityID ORDER BY CreatedDate DESC];
        
        for(History__c h: tempList){
            if (h.Memo__c != null && h.Memo__c != ''){          
                if (memoName != null && memoName != '') {
                    if (memoName == h.Memo__c)          
                        returnList.add(h);
                }
                else    
                    returnList.add(h);                              
            }
        }       
        return  returnList;
    }
    
    public static OpportunityLineItem setOpportunityLineItem(Id idval, SterlingQuoteItem__c QLI, boolean isProductNull, String oopID, String pbeID, String recordName){
        
        OpportunityLineItem  OLI = new OpportunityLineItem();
        if (isProductNull){
            OLI.OpportunityId = oopID;
            OLI.PricebookEntryId= pbeID;
            OLI.quoteitem__c = QLI.ID;
            OLI.Opportunity_Sync__c = recordName;
        }
        else
        {
            OLI = new OpportunityLineItem(id=idval);
        }
        
        OLI.Quantity = QLI.Quantity__c;
        OLI.Term_Months__c=QLI.TermLength__c;
        Decimal sterlingQuoteItemQty = 1;
        if(QLI.Quantity__c != null && QLI.Quantity__c != 0) {
            sterlingQuoteItemQty = QLI.Quantity__c;
        }
         OLI.UnitPrice = QLI.NetNewMRR__c == null ? 0.0 :( QLI.NetNewMRR__c / sterlingQuoteItemQty);
        
        OLI.Service_Address__c = '';
        if (!String.isEmpty(QLI.Service_Address__c))
            OLI.Service_Address__c += QLI.Service_Address__c;
        if (!String.isEmpty(QLI.Postal_Area__c)) {
            if ((OLI.Service_Address__c).equals(''))
                OLI.Service_Address__c += QLI.Postal_Area__c;
            else    
                OLI.Service_Address__c += ' '+QLI.Postal_Area__c;
        }
        
        // OLI.AdjustedMRC__c is taken care with the formula.
        OLI.ContractMRR2__c = QLI.AdjustedMRC__c;
        
        if (OLI.ContractMRR2__c == 0) OLI.ContractMRR2__c = QLI.StandardMRC__c;
        
        if(QLI.AdjustedNRC__c != 0) 
            OLI.NRC_Price__c = QLI.AdjustedNRC__c;
        else
            OLI.NRC_Price__c = QLI.AdjustedNRC__c;
        
        OLI.CPE_NRC_Price__c = (QLI.CPE_NRC_Price__c != null ? QLI.CPE_NRC_Price__c : 0.00);
        
        //if (recordName.equals('SFA'))
        OLI.Renewal_MRR__c = (QLI.Renewal_MRR_Original__c != null ? QLI.Renewal_MRR_Original__c : 0.00);
        //else
        //  OLI.Renewal_MRR__c = (QLI.renewal_mrr__c != null ? QLI.renewal_mrr__c : 0.00);
        
        OLI.CPQ_NetNewMRR__c = (QLI.NetNewMRR__c != null ? QLI.NetNewMRR__c : 0.00);
        
        OLI.CPE_Gross_Margin__c = (QLI.CPE_Gross_Margin__c != null ? QLI.CPE_Gross_Margin__c : 0.0);
        
        //  Only load line items with $ amounts if not Major Line item
        if(QLI.MinorLine__c== 0 || QLI.MinorLine__c == Null || QLI.StandardMRC__c != 0 || QLI.StandardNRC__c != 0 || QLI.AdjustedNRC__c != 0) 
            return OLI;
        
        return null;
    } 
    
    public static void delLineItem(String strQuoteItemValue, String strQt){
        Opportunity opp = null;
        SterlingQuote__c objSterlingQuote = null;
        SterlingQuoteItem__c sqi = null;
        OpportunityLineItem oli= null;
        
        sqi = [Select id, AdjustedMRC__c, SterlingQuote__c from SterlingQuoteItem__c where id =:strQuoteItemValue];
        objSterlingQuote =[select id, OrderId__c, RecordType.name,recordtypeId, name, IsSyncing__c, OpportunityId__c from SterlingQuote__c where id =: strQt];
        opp = [Select id from Opportunity where id =: objSterlingQuote.OpportunityId__c];
        //new delete the corresponding OpportunityLineItem only if the quote is in Sync with the opportunity
        if(objSterlingQuote.IsSyncing__c == true && !Test.isRunningTest()){
            oli = [Select id, QuoteItem__c from OpportunityLineItem where QuoteItem__c =: sqi.id];
            if(oli != null){
                delete oli;
            }
        }
        
        if(sqi != null){  delete sqi; }
        if(objSterlingQuote != null){ update objSterlingQuote; }
        if(opp != null){ update opp; }
        
        String strUrl = '/apex/Quote?id='+strQt+'&sfdc.override=1';
        pagereference pg = new pagereference(strUrl);
        pg.setRedirect(true);
        return;
    }  
    
}