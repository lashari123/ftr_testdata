public class QuoteSync {
 
    public String opportunityId;
    public String qutid;
    public List<OpportunityLineItem> 	listOppLineItemInsert		= new List<OpportunityLineItem>();
    public List<SterlingQuoteItem__c> 	sterlingQuoteItem 			= new List<SterlingQuoteItem__c>();
    public List<SterlingQuote__c>    	sterlingquoteUpdate 		= new List<SterlingQuote__c>();
    public List<SterlingQuoteItem__c> 	lstSterlingQuoteItemUpdate 	= new List<SterlingQuoteItem__c>();
    public SterlingQuote__c sterlingQuote;
    public List<SterlingQuoteItem__c> 	sterlingQuoteItemDelete 	= new List<SterlingQuoteItem__c>(); 
    public List<SterlingQuoteItem__c> 	SQIUpdate               	= new List<SterlingQuoteItem__c>();
    public list<OpportunityLineItem> 	lstOppOtemDelete        	= new list<OpportunityLineItem>();
    public set<Id> setOppId                                   		= new set<Id>();   
    public set<Id> setSterlingQuoteId                         		= new set<Id>();     
    public map<Id,Boolean> mapQuotes                          		= new map<Id,Boolean>();
    public map<Id,Id> mapQuoteItemIdByOppProductId            		= new map<Id,Id>();
    public Set<Id> qIdSet                                     		= new Set<Id>();
    public Set<Id> oppIdSetDelete                             		= new Set<Id>(); 
    
    public  QuoteSync(ApexPages.StandardController sc){
            
        qutid=ApexPages.currentPage().getParameters().get('id');
        
        system.debug('qutid' +qutid);
            
        SterlingQuote__c sterlingqt = [Select id,OpportunityId__c from SterlingQuote__c where id=:qutid];
            
        opportunityId=sterlingqt.OpportunityId__c;

        Opportunity quot = [SELECT Quote_ID__c FROM Opportunity where id =:opportunityId];
        String strQuote = quot.Quote_ID__c;
        sterlingQuote = [Select id,RecordTypeid,RecordType.Name,IsSyncing__c,QuoteType__c,CPQQuoteId__c, OpportunityId__c from SterlingQuote__c where id=:qutid];
        
        if (sterlingQuote.IsSyncing__c == false)
        {
				system.debug('sterlingQuote.IsSyncing__c    :'+sterlingQuote.IsSyncing__c);  
                sterlingQuoteItem = [SELECT
                                id, Products__c, Quantity__c, CPE_NRC_Price__c, StandardNRC__c, Renewal_MRR_Original__c, TermLength__c, NumInstallments__c, Service_Address__c, Postal_Area__c,
                                AdjustedMRC__c, CPE_Gross_Margin__c,promoDiscountAmount__c, TotalPrice__c, DiscountType__c, DiscountAmount__c, StandardMRC__c, AdjustedNRC__c     //Giri 03/03/2014                             
                            FROM SterlingQuoteItem__c WHERE SterlingQuote__c = :qutid
                            AND (MinorLine__c = 0 OR MinorLine__c = null or StandardMRC__c != 0 or StandardNRC__c != 0 or DiscountAmount__c != 0 or AdjustedMRC__c != 0)
                    ];               
                system.debug('Product sync sterlingquoteitem   :'+sterlingQuoteItem);
                map<Id,Id> mapProductByPriceBookId = new map<Id,Id>(); 
                for(PriceBookEntry pb : [SELECT Id, Product2Id, Product2.Id, Product2.MajorProduct__c, Product2.Name FROM PriceBookEntry WHERE PriceBook2.isStandard = TRUE]){                  
                        mapProductByPriceBookId.put(pb.Product2Id,pb.id);
                }     
                if(sterlingQuoteItem != null && sterlingQuoteItem.size() > 0){
                        for(SterlingQuoteItem__c SQ : sterlingQuoteItem){         
                                  system.debug('******** SQ    : '+SQ);
                                system.debug('****** sq.Products__c  : ' +SQ.Products__c);
                                OpportunityLineItem oppLineIteminsert = new OpportunityLineItem(); 
                            if (SQ.StandardMRC__c == null) {
                                system.debug('******** SQ2    : '+ qutid);
                                SQ.StandardMRC__c =  0.0;
                            }
                                if(SQ.Quantity__c != null && SQ.Products__c != null && mapProductByPriceBookId.get(SQ.Products__c) != null){               
                                        oppLineIteminsert.PricebookEntryId = mapProductByPriceBookId.get(SQ.Products__c);             
                                        oppLineIteminsert.Quantity         = SQ.Quantity__c; 
                                        oppLineIteminsert.CPE_NRC_Price__c = SQ.CPE_NRC_Price__c;     
                                        oppLineIteminsert.NRC_Price__c     = SQ.StandardNRC__c;  
                                        if(SQ.AdjustedNRC__c != 0) oppLineIteminsert.NRC_Price__c = SQ.AdjustedNRC__c;     
                                        if(SQ.TermLength__c == 0.0 )
                                        oppLineIteminsert.Term_Months__c   = SQ.NumInstallments__c;
                                       oppLineIteminsert.ContractMRR2__c   = SQ.AdjustedMRC__c;
                                       If(oppLineIteminsert.ContractMRR2__c == 0) oppLineIteminsert.ContractMRR2__c= SQ.StandardMRC__c;
                                      oppLineIteminsert.CPE_Gross_Margin__c  = SQ.CPE_Gross_Margin__c;
                                        oppLineIteminsert.Opportunityid    = sterlingQuote.OpportunityId__c;
                                        oppLineIteminsert.Opportunity_Sync__c = sterlingQuote.RecordType.Name; 
                                        oppLineIteminsert.UnitPrice          = SQ.StandardMRC__c;    
                                        oppLineIteminsert.quoteitem__c       = SQ.ID;
                                        oppLineIteminsert.Service_Address__c = '';
                                        if (!String.isEmpty(SQ.Service_Address__c))
                                            oppLineIteminsert.Service_Address__c += SQ.Service_Address__c;
                                        if (!String.isEmpty(SQ.Postal_Area__c)) {
                                            if ((oppLineIteminsert.Service_Address__c).equals(''))
                                                oppLineIteminsert.Service_Address__c += SQ.Postal_Area__c;
                                            else    
                                                oppLineIteminsert.Service_Address__c += ' '+SQ.Postal_Area__c;
                                        }
                                        
                                        listOppLineItemInsert.add(oppLineIteminsert);
                                        system.debug('list of opp item to be inserted'+listOppLineItemInsert);
                                        
                                } 
                          }      
                  }
        }
         else{
           sterlingQuoteItemDelete = [Select id,
                                  Products__c,
                                  Quantity__c,
                                  promoDiscountAmount__c,
                                  CPE_NRC_Price__c,
                                  StandardNRC__c,
                                  Renewal_MRR_Original__c,
                                  TermLength__c,
                                  NumInstallments__c,
                                  AdjustedMRC__c,
                                  CPE_Gross_Margin__c,
                                  TotalPrice__c,
                                  DiscountType__c,
                                  DiscountAmount__c,
                                  StandardMRC__c,
                                  OpportunityLineItemId__c,
                                  SterlingQuote__c                                 
                                  From SterlingQuoteItem__c                                  
                                  where SterlingQuote__c=:qutid
                          ];    
    		system.debug('sterlingQuote.IsSyncing__c-2    :'+sterlingQuote.IsSyncing__c);  
                         
    for(SterlingQuoteItem__c SQI : sterlingQuoteItemDelete){
        setSterlingQuoteId.add(SQI.SterlingQuote__c);      
    	}
    for(SterlingQuote__c QT:[select Id,IsSyncing__c, OpportunityID__c from SterlingQuote__c where id in : setSterlingQuoteId]){
            setOppId.add(QT.OpportunityId__c);
            mapQuotes.put(QT.id,QT.Issyncing__c);            
    }   
    system.debug('===SetSterlingQuoteId = ' + setSterlingQuoteId);
    system.debug('===StrQuote = ' + qutid);
    system.debug('===setOppid = ' + setOppid);
    for(Opportunity Opp : [Select id,
                                  (select id,quoteitem__c, Quoteid__c
                                      From OpportunityLineItems
                                       where  
                                       opportunityid in :setOppId)
                                     From Opportunity WHERE id in :setOppId]
                                 ) {                                   
    system.debug('===OPP = ' + OPP);
          for(OpportunityLineItem oppLineItem : Opp.OpportunityLineItems)
          {
            mapQuoteItemIdByOppProductId.put(oppLineItem.quoteitem__c,oppLineItem.id);
          }       
    }   
    System.debug('================sterlingQuoteItemDelete:'+sterlingQuoteItemDelete);
    System.debug('================sterlingQuoteItemDelete:size: '+sterlingQuoteItemDelete.size());
    
    for(SterlingQuoteItem__c QLI: sterlingQuoteItemDelete){
      if(mapQuotes.get(QLI.sterlingquote__c)){ 
                if(mapQuoteItemIdByOppProductId.get(QLI.id) != null){
                    system.debug('==230====lstOppOtemDelete' + lstOppOtemDelete);
                    OpportunityLineItem  OLU = new OpportunityLineItem(id=mapQuoteItemIdByOppProductId.get(QLI.id));
                    system.debug('===OLU.Quoteid__c = ' + OLU); 
                    lstOppOtemDelete.add(OLU);
                    SQIUpdate.add(new SterlingQuoteItem__c(Id = QLI.Id, OpportunityLineItemId__c= null));
                    system.debug('======231== ' + lstOppOtemDelete);
                    if(OLU !=null)
                        system.debug('====opplineitemID' +OLU);
                        oppIdSetDelete.add(OLU.Id);
                    if(QLI.SterlingQuote__c != null)
                        qIdSet.add(QLI.SterlingQuote__c);
                }
         }
         
    }
  }
  }
  
           public  PageReference QuoteSyncmethod(){
      
            	if (sterlingQuote.IsSyncing__c == false)
          		{
           			insertlistOppLineItemInsert();
                	Syncupdatedelete();
          		}else {  
         			Unsyncupdatedelete();
          		}
                    return DoConvert();
        		}
    
            public void insertlistOppLineItemInsert(){ 
             if(listOppLineItemInsert!= null && listOppLineItemInsert.size() >0){       
                        System.Debug('***listOppLineItemInsert******'+listOppLineItemInsert);
                        insert listOppLineItemInsert;   
                        sterlingQuote.IsSyncing__c = true;
                        system.debug('sterling quote which is updated  : ' +sterlingquote);
                        update sterlingQuote;            
            	} 
          	}
          	public void Syncupdatedelete(){ 
                if(listOppLineItemInsert !=null && listOppLineItemInsert.size() > 0){  
                        set<id> setNewOppLineItemId = new set<id>();     
                        for(OpportunityLineItem oppLine :listOppLineItemInsert){
                                system.debug('====== oppLine.id : ' +oppLine.id);
                                setNewOppLineItemId.add(oppLine.id);        
                                if(oppLine.quoteitem__c != null){
                                        SterlingQuoteItem__c SQI = new SterlingQuoteItem__c(id=oppLine.quoteitem__c);
                                        SQI.OpportunityLineItemId__c = oppLine.id;
                                        system.debug('=======OpportunityLineItemId__c' + SQI.OpportunityLineItemId__c);
                                        lstSterlingQuoteItemUpdate.add(SQI);
                                }
                        }  
                        System.debug('Mohan ====== New opp LI added which are to be excluded ' + setNewOppLineItemId);
                        List<OpportunityLineItem> oppLineItemDelete = new List<OpportunityLineItem>();        
                        oppLineItemDelete = [SELECT id FROM OpportunityLineItem WHERE OpportunityId=:sterlingQuote.OpportunityId__c AND id NOT IN :setNewOppLineItemId AND Opportunity_Sync__c =:sterlingQuote.RecordType.Name];
                        System.debug('Mohan===oppLineItemDelete' + oppLineItemDelete);
                        if(oppLineItemDelete!= null && oppLineItemDelete.size() >0){          
                                delete oppLineItemDelete;
                        }        
                        List<SterlingQuote__c> lststerlingquote = [SELECT id,IsSyncing__c,QuoteType__c,OpportunityId__c FROM SterlingQuote__c WHERE id !=:qutid AND IsSyncing__c = TRUE AND RecordTypeid = :sterlingQuote.RecordTypeid AND OpportunityId__c  = :sterlingQuote.OpportunityId__c]; 
                        if(lststerlingquote != null && lststerlingquote.size() > 0){
                                for(SterlingQuote__c sterqu : lststerlingquote){             
                                        sterqu.IsSyncing__c = false;
                                        sterlingquoteUpdate.add(sterqu);
                                }
                                SterlingQuote__c lststerlingquotenew = [SELECT id FROM SterlingQuote__c WHERE id !=:qutid AND IsSyncing__c = TRUE AND RecordTypeid = :sterlingQuote.RecordTypeid AND OpportunityId__c  = :sterlingQuote.OpportunityId__c]; 
                         system.debug('======233====lststerlingquoteNEW' + lststerlingquotenew);
                                                string sqid1 = lststerlingquoteNEW.id;
                        list<SterlingQuoteItem__c> lstsqinew = [select id, opportunityLineItemId__c from SterlingQuoteItem__c where SterlingQuote__c =: sqid1];
                        
                        system.debug('======234====sqid1 = ' + sqid1);
                                for(SterlingQuoteItem__c sterqui : lstsqinew) {
                                        system.debug('======235==== sterqui' + sterqui);
                                        sterqui.OpportunityLineItemId__c = '';
                                        
                                        lstSterlingQuoteItemUpdate.add(sterqui);
                                        system.debug('======236==== sterlingquoteUpdate' + sterlingquoteUpdate);
                                }           
                                
                        }
                        if(sterlingquoteUpdate != null && sterlingquoteUpdate.size() > 0){
                                System.Debug('***sterlingquoteUpdate***'+sterlingquoteUpdate);
                                update sterlingquoteUpdate;
                        }       
                        if(lstSterlingQuoteItemUpdate != null &&  lstSterlingQuoteItemUpdate.size() > 0){
                                update lstSterlingQuoteItemUpdate;
                        }       
                }   
    }
    public void Unsyncupdatedelete(){ 
      if(lstOppOtemDelete != null &&  lstOppOtemDelete.size() > 0){
      if(!qIdSet.isEmpty()) { 
            try {
                System.debug('setOppId=='+setOppId);
                List<OpportunityLineItem> oliList1 = [Select Id, OpportunityId, QuoteId__c  from OpportunityLineItem where OpportunityId IN: setOppId];
                System.debug('oliList_New'+oliList1.size());
                if(!oliList1.isEmpty()) {
                    system.debug('====oliList1' + oliList1);
                    for(OpportunityLineItem oli: oliList1) {
                        if(!oppIdSetDelete.contains(oli.Id) && oli.id != null)
                            lstOppOtemDelete.add(oli);  
                            system.debug('=====232===New == lstOppOtemDelete'+ lstOppOtemDelete);         
                    }
                }     
            } catch(Exception e) {
            }
            }
            if(!SQIUpdate.isEmpty())
                update SQIUpdate;
            System.debug('=================SQIUpdate:' + SQIUpdate);
            System.debug('==========SQIUpdate.size'+SQIUpdate.size());
            system.debug('======before delete unsync====oli' + lstOppOtemDelete);
            system.debug('======before delete unsync size====oli' + lstOppOtemDelete.size());
            delete lstOppOtemDelete;
            
            system.debug('===233==lstOppOtemDelete' + lstOppOtemDelete);
            system.debug('===233==lstOppOtemDelete.size' + lstOppOtemDelete.size());
            sterlingQuote.IsSyncing__c = false;
            update sterlingQuote;   
        } 
    }

      public PageReference DoConvert()  {
               PageReference ref = new PageReference('/lightning/r/Opportunity/'+ opportunityId + '/view');
               ref.setRedirect(true);
               System.Debug('***URL***'+ref);
               return ref;
               }
}