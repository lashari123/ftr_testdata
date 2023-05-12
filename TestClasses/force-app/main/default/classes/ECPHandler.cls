global class ECPHandler {
    
    public GAN ganAcc;
    public SMA smaAcc;
    public BTN btnAcc;
    global String level;
    private static boolean circuitHitLimitException = false;
    
    global class Error 
    {
        global string FaultCode;
        global string FaultDescription;     
        global Error(){ }       
        global Error(string fcode, String des){
            FaultCode = fcode;
            FaultDescription = des;
        }       
    }

    global class Success 
    {
        global string Status;
        global string Description;     
        global Success(){ }       
        global Success(String des){
            Status = 'SUCCESS';
            Description = des;
        }       
    }

    global class Entitlements {
        public String contactGUID;
        public String accountNumber;
        public String accountType;
        public String role;
        public String permissionSet;
        
        public Entitlements(){ }
        global Entitlements(String cGuid, String aNum, String aType, String rol, string pSet){ 
               contactGUID = cGuid;
               accountNumber = aNum;
               accountType = aType;
               role = rol;
               permissionSet = pSet;               
        }
    }
    
    global class OpportunityList {
        public String OpportunityID;
        public OpportunityDetailObject OpportunityDetails;
        
        public OpportunityList() {
           opportunityDetails = new OpportunityDetailObject();
        }
    }
    
    global class OpportunityDetailObject {
        public String Name; 
        public String OwnerName;
        public String RecordTypeName; 
        public String LDRAssigned; 
        public String AccountName;
        public String BillingAddress;
        public String ShippingAddress; 
        public String OpportunityType; 
        public String Probability; 
        public String NextStep; 
        public String StageName; 
        public String CloseDate; 
        public String OpportunityDisposition; 
        public String OtherReasonLostDetails; 
        public String ReasonWonLost; 
        public String LeadSource; 
        public String IntegratedSale; 
        public String CPEProduct; 
        public String MasterAgent; 
        public String ExpectedBilledDate; 
        public String SubAgentName;
        public String NewLogo; 
        public String RPONOrder; 
        public String VerNoForRedline; 
        public String SystemTheOrderEnteredIn; 
        public String LocalAreaMarket; 
        public String CampaignName; 
        public String WinbackCompetitor; 
        public String Region; 
        public String CarrierRegion;
    }
    
    global class ValidateResponse 
    {
        global string CircuitID;
        global string GanID;
        global string Match_Detail;     
        global ValidateResponse(){ }       
        global ValidateResponse(string ckt, String gan, String mdetail){
            CircuitID = ckt;
            GanID = gan;
            Match_Detail = mdetail;
        }       
    }
    
    global class AssetList
    {
        global string GanID;
        global List<String> AssetList;
        global AssetList(string gan, List<String> assets){
            GanID = gan;
            AssetList = assets;
        }
    }
    
//ktt883   private class GAN 
    public class GAN 
    {
         private string AccountNumber;
         private string AccountType;
         private string isComplete;
         private string GlobysAccountType;
         private List<SMA> SMAList;
         private List<BTN> BTNList;
         
         public GAN(string aNumber, string aType){
             AccountNumber = aNumber;
             AccountType = aType;
             isComplete = 'TRUE';
             GlobysAccountType = '';
             SMAList = new List<SMA>();
             BTNList = new List<BTN>();
         }
   }

//ktt883   private class SMA 
   public class SMA 

   {
         private string AccountNumber;
         private string AccountType;
         private List<BTN> BTNList;
         private string GlobysAccountType;
         
         public SMA (string aNumber, string aType, List<BTN> bList, String gAccType){
             AccountNumber = aNumber;
             AccountType = aType;
             BTNList = bList;
             
             if(String.isEmpty(gAccType))
                GlobysAccountType = '';
             else 
                GlobysAccountType = gAccType;    
         }
         
         public SMA (string aNumber, string aType, String gAccType){
             AccountNumber = aNumber;
             AccountType = aType;   
             BTNList = new List<BTN>();  
             if(String.isEmpty(gAccType))
                GlobysAccountType = '';
             else 
                GlobysAccountType = gAccType;       
         }
   }
  
//ktt883   private class BTN 
   public  class BTN
   {
         private string AccountNumber;
         private string AccountType;
         private string GlobysAccountType;
         
         public BTN (string aNumber, string aType, string gAccType){
             AccountNumber = aNumber;
             AccountType = aType;
             
             if(String.isEmpty(gAccType))
                GlobysAccountType = '';
             else 
                GlobysAccountType = gAccType;   
         }
   }    

//ktt883   private class GANCT 
   public class GANCT
   {
         private string AccountNumber;
         private string AccountType;
         private string isComplete;
         private List<SMACT> SMAList;
         private List<BTNCT> BTNList;
         private List<String> CircuitIDList;
         
         public GANCT(string aNumber, string aType){
             AccountNumber = aNumber;
             AccountType = aType;
             isComplete = 'TRUE';
             SMAList = new List<SMACT>();
             BTNList = new List<BTNCT>();
             CircuitIDList = new List<String>();
         }
         /*
        public GANCT(string aNumber, string aType, List<String> cList){
         AccountNumber = aNumber;
         AccountType = aType;
         SMAList = new List<SMACT>();
         BTNList = new List<BTNCT>();
         CircuitIDList = cList;
     }
     public void setCircuitIDList(List<String> cList){
         CircuitIDList = cList;
    }*/        
   }

//ktt883   private class SMACT 
   public class SMACT
   {
         private string AccountNumber;
         private string AccountType;
         private List<BTNCT> BTNList;
         private List<String> CircuitIDList;
         /*
         public SMACT (string aNumber, string aType, List<BTNCT> bList){
             AccountNumber = aNumber;
             AccountType = aType;
             BTNList = bList;
             CircuitIDList = new List<String>();
         }*/
         
         public SMACT (string aNumber, string aType){
             AccountNumber = aNumber;
             AccountType = aType;   
             BTNList = new List<BTNCT>(); 
             CircuitIDList = new List<String>();     
         }
         /*
         public SMACT (string aNumber, string aType, List<string> cList){
             AccountNumber = aNumber;
             AccountType = aType;   
             BTNList = new List<BTNCT>(); 
             CircuitIDList = cList;     
         }
         */         
         public void setCircuitIDList(List<String> cList){
             CircuitIDList = cList;
         }
   }
  
//ktt883   private class BTNCT 
   public class BTNCT
   {
         private string AccountNumber;
         private string AccountType;
         private List<String> CircuitIDList;
         
         public BTNCT (string aNumber, string aType){
             AccountNumber = aNumber;
             AccountType = aType;
             CircuitIDList = new List<String>();
         }
         
         public BTNCT (string aNumber, string aType, List<String> cList){
             AccountNumber = aNumber;
             AccountType = aType;
             CircuitIDList = cList;
         }
   }    
  
   private static Map<String, String> accountTypeMatch = new Map<String, String>{'GAN' => 'GAN', 'SUMMARY' => 'SMA', 'BILLING' => 'BTN'};
   
   /*    
   private static List<Account> searchBillingNodesInHierarchyMap(Map<ID, Account> accounts, String accNum)
   {
       List<Account> recordsFetched = new List<Account>();
       
       for (Account a : accounts.values())
       {
             if ( (!string.isEmpty(a.ParentSequenceId__c)) && ((a.ParentSequenceId__c).equals(accNum)) && (!string.isEmpty(a.Hierarchy_Level__c)) && ((a.Hierarchy_Level__c).equals('BILLING')) )
                recordsFetched.add(a);
       }
       
       return recordsFetched;   
   }


   private static List<Account> searchSummaryNodesInHierarchyMap(Map<ID, Account> accounts, String accNum)
   {
       List<Account> recordsFetched = new List<Account>();
       for (Account a : accounts.values())
       {
             if ( (!string.isEmpty(a.ParentSequenceId__c)) && ((a.ParentSequenceId__c).equals(accNum)) && (!string.isEmpty(a.Hierarchy_Level__c)) && ((a.Hierarchy_Level__c).equals('SUMMARY')) )
                recordsFetched.add(a);
       }
       
       return recordsFetched;   
   }
   
   private static Account searchGANInHierarchyMap(Map<ID, Account> accounts)
   {
       for (Account a : accounts.values())
       {
             if ((a.Hierarchy_Level__c).equals('GAN'))
                return a;
       }
       return null;     
   }
   
   private static Account searchSMAInHierarchyMap(Map<ID, Account> accounts)
   {
       for (Account a : accounts.values())
       {
             if ((a.Hierarchy_Level__c).equals('SUMMARY'))
                return a;
       }
       return null;     
   }
   
   private static Account searchBillingInHierarchyMap(Map<ID, Account> accounts)
   {
       for (Account a : accounts.values())
       {
             if ((a.Hierarchy_Level__c).equals('BILLING'))
                return a;
       }
       return null;     
   }   
   
   private static string getHierarcy(string accNum, boolean accInventoryFlag)
   {
        GAN ganAcc = null;
        SMA smaAcc = null;
        BTN btnAcc = null;
        
        GANCT ganAct = null;
        SMACT smaAct = null;
        BTNCT btnAct = null;
        
        Map<ID, Account> allAccounts = getFullHierarcy(accNum.trim());
        System.debug('Mohan :' + allAccounts);
        
        if (!allAccounts.isEmpty())
        {
            Account ganRecord = searchGANInHierarchyMap(allAccounts);  
            
            if(ganRecord != null)
            {   
                if(accInventoryFlag)
                    ganAct = new GANCT(ganRecord.TNSequenceId__c, 'GAN', getCirIdList(ganRecord.id));
                else
                    ganAcc = new GAN(ganRecord.TNSequenceId__c, 'GAN');
                
                List<Account> smaRecords = searchSummaryNodesInHierarchyMap(allAccounts, ganRecord.TNSequenceId__c);
                if(!smaRecords.isEmpty())
                {
                    List<Account> bTNList;
                    System.debug('Mohan 2 :' + smaRecords);
                    for(Account newSma: smaRecords)
                    {    
                        bTNList = searchBillingNodesInHierarchyMap(allAccounts, newSma.TNSequenceId__c);
                        
                        if(!bTNList.isEmpty()){   
                            if(accInventoryFlag){                
                                ganAct.SMAList.add(new SMACT(newSma.TNSequenceId__c, 'SMA', getBtnCtList(bTNList)));
                                ganAct.setCircuitIDList(getCirIdList(newSma.Id));
                            } 
                            else
                                ganAcc.SMAList.add(new SMA(newSma.TNSequenceId__c, 'SMA', getBtnList(bTNList)));     
                        }
                        else
                        {
                            System.debug('Mohan 3 :' + smaRecords);
                            if(accInventoryFlag)
                                ganAct.SMAList.add(new SMACT(newSma.TNSequenceId__c, 'SMA', getCirIdList(newSma.id)));
                            else
                                ganAcc.SMAList.add(new SMA(newSma.TNSequenceId__c, 'SMA'));
                        }
                    }
                }
                List<Account> btnRecords = searchBillingNodesInHierarchyMap(allAccounts, ganRecord.TNSequenceId__c);
                if(!btnRecords.isEmpty())
                {
                    if (accInventoryFlag)
                       ganAct.BTNList = getBtnCtList(btnRecords);
                    else
                       ganAcc.BTNList = getBtnList(btnRecords);
                } 
                    
            }
            else 
            {
                System.debug('Hierarchy about to build - NO GAN - STARTING WITH SUMMARY');
                Account smaRecord = searchSMAInHierarchyMap(allAccounts);
                System.debug('1');
                if(smaRecord != null)
                {
                    List<Account> btnRecords = searchBillingNodesInHierarchyMap(allAccounts, smaRecord.TNSequenceId__c);
                    System.debug('2'+btnRecords);
                    
                    if(!btnRecords.isEmpty())
                    {
                        System.debug('3');
                        if(accInventoryFlag)
                        {
                            smaAct = new SMACT(smaRecord.TNSequenceID__c, 'SMA', getBtnCtList(btnRecords));
                            smaAct.setCircuitIDList(getCirIdList(smaRecord.Id));
                        }   
                        else                            
                            smaAcc = new SMA(smaRecord.TNSequenceID__c, 'SMA', getBtnList(btnRecords)); 
                    }else{
                         System.debug('4');
                         if(accInventoryFlag)
                                 smaAct = new SMACT(smaRecord.TNSequenceID__c, 'SMA', getCirIdList(smaRecord.Id));   
                         else
                                smaAcc = new SMA(smaRecord.TNSequenceID__c, 'SMA');
                    }          
                }
                else
                {  
                    Account btnRecord = searchBillingInHierarchyMap(allAccounts);
                    
                    if(btnRecord != null)
                    {
                        if(accInventoryFlag)
                            btnAct = new BTNCT(btnRecord.TNSequenceID__c, 'BTN', getCirIdList(btnRecord.id)); 
                        else
                            btnAcc = new BTN(btnRecord.TNSequenceID__c, 'BTN');
                    } 
                }
            }           
            
        }
        
       if(ganAcc != null)
            return json.serializePretty(ganAcc);
       else if(smaAcc != null)
            return json.serializePretty(smaAcc);
       else if(btnAcc != null)   
            return json.serializePretty(btnAcc);
       else if(ganAct != null)
            return json.serializePretty(ganAct);
       else if(smaAct != null)
            return json.serializePretty(smaAct);
       else if(btnAct != null)   
            return json.serializePretty(btnAct);
       else
            return json.serializePretty(new Error('1010', 'No account found with the provided account number: '+accNum));        
            
   }  
   */
//   private static List<BTN> getBtnList(List<Account> accList) {
   public static List<BTN> getBtnList(List<Account> accList) {

        List<BTN> btnLst = new List<BTN>();
        
        if(!accList.isEmpty()) {
            for(Account btnAcc: accList)                
                btnLst.add(new BTN(btnAcc.TNSequenceId__c, 'BTN', btnAcc.Account_Type__c));   
        }   
        
       return btnLst;
   }
   /*
   private static List<BTNCT> getBtnCtList(List<Account> accList) {
    
        List<BTNCT> btnCtLst = new List<BTNCT>();
        
        if(!accList.isEmpty()){
            for(Account btnCtAcc: accList){ 
                List<String> cirList = getCirIdList(btnCtAcc.id);            
                btnCtLst.add(new BTNCT(btnCtAcc.TNSequenceId__c, 'BTN', cirList));   
            }
        }   
        
        return btnCtLst;
   } 
   */ 
   public static List<string> getCircuitIdList(String cirString, String TNSeq)
//   private static List<string> getCircuitIdList(String cirString, String TNSeq)
   {
        List<String> cirIdList = new List<String>();
        
        try{
            List<Asset__C> assetList = [select circuitId__c, account__c from Asset__c where account__c =: cirString];
            System.debug('Mohan:: Based on ID extracting Circuits.  Circuit Inventory for  :'+TNSeq+' is of size : '+assetList.size());
            System.debug('Mohan:: Circuits = '+assetList);
            for(Asset__c ast:assetList){
                cirIdList.add(ast.circuitId__c);
            }
        }Catch(Exception ex){
            System.debug(ex);
        }
        return cirIdList;   
   }
   
//   private static string addEntitlements(List<Entitlements> EntitlementList) 
   public static string addEntitlements(List<Entitlements> EntitlementList) 

   {
        List<Entitlement__c> addEntitlementList = new List<Entitlement__c>();
        List<Entitlement__c> updateEntitlementList = new List<Entitlement__c>();
        
        Entitlement__c entitlement;
        
        Entitlements errEntitle = null;
        
        Map<string, ID> aIDs = new Map<string, ID>();
        Map<ID, string> aHIDs = new Map<ID, string>();
        List<String> accIds = new List<String>();
        List<String> accGANIds = new List<String>();
        List<Account> alist = new List<Account>();
        
        List<Entitlement__c> searchEntitle = new List<Entitlement__c>();
        Map<ID, Account> aHierarchy = new Map<ID, Account>();
        
        boolean isException = false;
        boolean isUpdate = false;
        boolean isAccListEmpty = false;
        boolean isAccountLevelDifferent = false;
        integer updateCount = 0;
        boolean areAllEntitlementsNOTInsertOrUpdate = false; 
        
        for (Entitlements e : EntitlementList)
        {
            if (e.accountType.equals('GAN'))
               accGANIds.add(e.accountNumber);
            else
               accIds.add(e.accountNumber);
        }
        
        try{
                alist = [select TNSequenceId__c, id, Hierarchy_Level__c from Account where TNSequenceId__c in : accIds];
                if (!alist.isEmpty())
                    for (Account a : alist)
                    {
                        aIDs.put(a.TNSequenceId__c, a.ID);
                        aHIDs.put(a.ID, a.Hierarchy_Level__c);
                    }
                else
                {
                    if (accGANIds.size() == 0)
                        isAccListEmpty = true;
                }

                System.debug('alist Result : '+alist);   
        }catch(Exception ex){
                System.debug(Ex);
                isException = true;
        }
         
        System.debug('aIDs Result : '+aIDs);  
                 
        if (!alist.isEmpty())
        {
            // This loop is to check if provided accountnumber and its type matches to what we have it in Account. If not, we should throw an error even before we either insert or update a single record. 
            for (Entitlements entitle : EntitlementList)
            {
                if (! (entitle.accountType).equals(accountTypeMatch.get(aHIDs.get(aIDs.get(entitle.accountNumber)))) )
                {
                    isAccountLevelDifferent = true;
                    errEntitle = new Entitlements(entitle.contactGUID, entitle.accountNumber, entitle.accountType, entitle.role, entitle.permissionSet);
                    break;
                }
            }

            // Check if all entitlements are either update or insert. As both can't be performed at the same time. 
            for (Entitlements entitle : EntitlementList)
            {
                    searchEntitle = [Select id,ContactID__c,AccountId__c,AccountTN__c,AccountType__c,Role__c,PermissionSet__c  from Entitlement__c where ContactID__c =: entitle.contactGUID and AccountId__c =: aIDs.get(entitle.accountNumber) and AccountType__c =: accountTypeMatch.get(aHIDs.get(aIDs.get(entitle.accountNumber)))];
                    System.debug('First: searchEntitle Result : '+searchEntitle);
                    if (!searchEntitle.isEmpty())
                        updateCount += 1;
            }
            
            if ( !((updateCount == 0) || (updateCount == EntitlementList.size())) )
                    areAllEntitlementsNOTInsertOrUpdate = true;
            
            // Now loop over to insert / update rows.            
            if (!areAllEntitlementsNOTInsertOrUpdate)
            {
                
                for (Entitlements entitle : EntitlementList)
                {
                        searchEntitle = [Select id,ContactID__c,AccountId__c,AccountTN__c,AccountType__c,Role__c,PermissionSet__c  from Entitlement__c where ContactID__c =: entitle.contactGUID and AccountId__c =: aIDs.get(entitle.accountNumber) and AccountType__c =: accountTypeMatch.get(aHIDs.get(aIDs.get(entitle.accountNumber)))];
                        System.debug('Second: searchEntitle Result : '+searchEntitle);
                        System.debug('Second: searchEntitle Result : contguid :: '+entitle.contactGUID);
                        System.debug('Second: searchEntitle Result : accountnumber :: '+aIDs.get(entitle.accountNumber));
                        System.debug('Second: searchEntitle Result : accountype : '+aHIDs.get(aIDs.get(entitle.accountNumber)));
                        // Need to insert/update the whole hierarchy with the same permission set for that particular contact.
                        //aHierarchy = getLowerLevelHierarchy(entitle.accountNumber);
                        
                        Account acc1= [Select id, TNSequenceId__c, ParentSequenceId__c, Hierarchy_Level__c from Account where TNSequenceId__c =: entitle.accountNumber limit 1];
                        System.debug(acc1);
                        System.debug('Second: Hierarchy : '+aHierarchy);
                        // Search if update
                        if (!searchEntitle.isEmpty())
                        {
                            isUpdate = true;
                            List<ID> uRowIDs = new List<ID>();
                            if (entitle.accountType != 'BTN')
                            {
                                //for(Account target : aHierarchy.values())Sunil
                                   uRowIDs.add(acc1.id);                       //sunil (target.ID);
                                searchEntitle = [Select id,ContactID__c,AccountTN__c,AccountId__c,AccountType__c,Role__c,PermissionSet__c  from Entitlement__c where ContactID__c =: entitle.contactGUID and AccountId__c in :uRowIDs];
                            }
                            for (Entitlement__c uRow : searchEntitle)
                            {
                               // for(Account target : aHierarchy.values())
                                //{
                                    System.debug('Second: uRow : '+uRow.AccountId__c+ ' target id :: '+acc1.ID+' are they equal ::'+( (uRow.AccountId__c).equals(acc1.ID) ));
                                    if ( (uRow.AccountId__c).equals(acc1.ID) )
                                    {
                                        // role or permissionset is what will change..
                                        uRow.ContactID__c = entitle.contactGUID;
                                        uRow.AccountId__c = acc1.ID;
                                        uRow.AccountTN__c = entitle.accountNumber;
                                        uRow.AccountType__c = accountTypeMatch.get(acc1.Hierarchy_Level__c);             //target.Hierarchy_Level__c);
                                        uRow.Role__c = entitle.role;
                                        uRow.PermissionSet__c= entitle.permissionSet;
                                        updateEntitlementList.add(uRow);
                                    }
                               // }
                            }
                        }
                        else // it's insert
                        {
                            //for(Account target : aHierarchy.values())
                            //{
                                entitlement = new Entitlement__c();
                                entitlement.ContactID__c = entitle.contactGUID;
                                entitlement.AccountId__c = acc1.Id;      //target.ID; 
                                entitlement.AccountType__c = accountTypeMatch.get(acc1.Hierarchy_Level__c);         //target.Hierarchy_Level__c);
                                entitlement.AccountTN__c = entitle.accountNumber;
                                entitlement.Role__c = entitle.role;
                                entitlement.PermissionSet__c = entitle.permissionSet;
                                addEntitlementList.add(entitlement);
                           // }
                        }
                }
            }
        } 
        
        //Handle GAN account level Entitlements
        if (accGANIds.size() > 0)
        {
            searchEntitle = new List<Entitlement__c>();
            Map<String, Entitlement__c> searchEntitlements = new Map<String, Entitlement__c>();
            
            // Check if all entitlements are either update or insert. As both can't be performed at the same time. 
            for (Entitlements entitle : EntitlementList)
            {
                    searchEntitle = [Select id,ContactID__c,AccountId__c,AccountTN__c,AccountType__c,Role__c,PermissionSet__c  from Entitlement__c where ContactID__c =: entitle.contactGUID and AccountTN__c =: entitle.accountNumber];                    
                    System.debug('First: searchEntitle Result : '+searchEntitle);
                    if (!searchEntitle.isEmpty())
                    {
                        searchEntitlements.put(entitle.accountNumber, searchEntitle[0]);
                        updateCount += 1;
                    }
            }
            
            if ( !((updateCount == 0) || (updateCount == EntitlementList.size())) )
                    areAllEntitlementsNOTInsertOrUpdate = true;

            // Now loop over to insert / update rows.            
            if (!areAllEntitlementsNOTInsertOrUpdate)
            {
                for (Entitlements entitle : EntitlementList)
                {
                       if (updateCount == 0)    
                       {
                                entitlement = new Entitlement__c();
                                entitlement.ContactID__c = entitle.contactGUID;
                                entitlement.AccountType__c = entitle.accountType;
                                entitlement.AccountTN__c = entitle.accountNumber;
                                entitlement.Role__c = entitle.role;
                                entitlement.PermissionSet__c = entitle.permissionSet;
                                addEntitlementList.add(entitlement);                        
                       }
                       else
                       {
                                entitlement = searchEntitlements.get(entitle.accountNumber);
                                entitlement.ContactID__c = entitle.contactGUID;
                                entitlement.AccountType__c = entitle.accountType;
                                entitlement.AccountTN__c = entitle.accountNumber;
                                entitlement.Role__c = entitle.role;
                                entitlement.PermissionSet__c = entitle.permissionSet;
                                updateEntitlementList.add(entitlement);                     
                       }            
                }   
            }                           
        }
        
        if (isAccountLevelDifferent)
            return JSON.serializePretty(new Error('1005','Error: No match found for Account : '+errEntitle.accountNumber+' with AccountType : '+errEntitle.accountType+' in Salesforce.'));
            
        if (areAllEntitlementsNOTInsertOrUpdate)
            return JSON.serializePretty(new Error('1006','Error: Have '+updateCount+' / '+EntitlementList.size()+'records for update. All records should either be insert or Update. Not both operations can be performed at the same time.'));
            
        if (isException)
            return JSON.serializePretty(new Error('1007','Error: No match found for the Contact and Account in Salesforce.'));
        
        if (isAccListEmpty)
            return JSON.serializePretty(new Error('1008','Error: No match found for the accountnumber provided.'));
            
        if (!updateEntitlementList.isEmpty()) {
            update updateEntitlementList;
            Success succMessage = new Success(EntitlementList.size()+ ' Entitlement records were successfully updated.');
            return JSON.serializePretty(succMessage);
        } else if (!addEntitlementList.isEmpty()) {
            insert addEntitlementList;
            Success succMessage = new Success(EntitlementList.size()+ ' Entitlement records were successfully added.');
            return JSON.serializePretty(succMessage);
        }
        else
            return JSON.serializePretty(new Error('1009','Salesforce Internal Exception: Couldnt add/update Entitlements.'));
   }      

//ktt883   private static string delEntitlement(string cGUID, string accNum)
   public static string delEntitlement(string cGUID, string accNum)

   {
       List<Entitlement__c> delEntitlements = new List<Entitlement__c>();
       
       //Map<ID, Account> aHierarchy = new Map<ID, Account>();
       
       Success succMessage = null;
       boolean conAccNoEntFlag = false;
       boolean cGuidAccNumNoEntlFlag = false;
       boolean conNoAccNoEntFlag = false;
       
       if ( (!(String.isEmpty(accNum))) && (!(String.isEmpty(cGUID))) ) 
       {
           try{
                  delEntitlements = [Select id from Entitlement__c where ContactID__c =: cGUID and AccountTN__c =: accNum];
                  if (delEntitlements.isEmpty()){ 
                       conAccNoEntFlag = true;
                  }      
           } catch(Exception ex){
                     System.debug(ex);
                     conAccNoEntFlag = true;
           }
       }
       else if(!(String.isEmpty(cGUID)))
       { // delete all entitlements of this ContactGUID
             try {
                 delEntitlements = [Select id from Entitlement__c where ContactID__c =: cGUID];
                 if (delEntitlements.isEmpty()){ 
                     conNoAccNoEntFlag = true;
                 }  
             } catch(Exception ex){
                    System.debug(ex);
                    conNoAccNoEntFlag = true;
             }
       }

       //if(noAccount)
        //return JSON.serializePretty(new Error('1004','No Account found for the corresponding accountNumber: '+accNum));
       
       if(conAccNoEntFlag)
        return JSON.serializePretty(new Error('1005','No Entitlements found for the corresponding accountNumber: '+accNum+' and contactguid: '+cGUID+' repectively.'));
       
       if(conNoAccNoEntFlag){
        return JSON.serializePretty(new Error('1006','No Entitlements found for the contactguid: '+cGUID));
       } else {
             try{
                integer noOfEntlRecs = delEntitlements.size();
                delete delEntitlements;
                succMessage = new Success(noOfEntlRecs+ ' Entitlement records were successfully deleted.');
             }Catch(Exception ex){
                    return JSON.serializePretty(new Error('1007','The entitlements pertaining to the cGuid: '+cGUID+' could not be deleted.'));
             }
       }
       
       if(succMessage != null)
        return JSON.serializePretty(succMessage);
       else
            return JSON.serializePretty(new Error('1008','Salesforce Internal Exception: Couldnt add/update Entitlements.'));   
   }
   
  /*
   public static string getAccountHierarcy(string inputId){
        return getHierarcy(inputId, false);
   }
  
   public static string getCustomerInventory(string inputId){
        return getHierarcy(inputId, true);
   }
   */  
   public static string getAccountEntitlements(string accNum)
   {
        List<Entitlement__c> entitlements = new List<Entitlement__c>();
        Error err =  null;
        
        try {
             // entitlements = [Select ContactID__c, AccountId__r.TNSequenceID__c, AccountId__r.ParentSequenceId__c, AccountType__c, Role__c, PermissionSet__c from Entitlement__c where AccountId__c in: getLowerLevelHierarchyList(accNum)];
              entitlements = [Select ContactID__c, AccountTN__c, AccountType__c, Role__c, PermissionSet__c from Entitlement__c where AccountTN__c =: accNum];
        }catch(Exception ex) {
           System.debug(ex);
           err = new Error('1003', 'No entitlements found with the Account Number: '+accNum);
        }
        
        if(entitlements.isEmpty() && err == null){
            err = new Error('1004', 'No entitlements found with the Account Number: '+accNum);  
        }
        
        if( err!= null)
            return JSON.SerializePretty(err);  
        else
            return getEntitlements(entitlements);
   }
   
   public static string getContactEntitlements(string cGUID)
   {
        List<Entitlement__c> entitlements = new List<Entitlement__c>();
        Error err = null;
        
        try {
                if(!string.isEmpty(cGUID))
                    entitlements = [Select ContactID__c, AccountTN__c, AccountType__c, Role__c, PermissionSet__c from Entitlement__c where ContactID__c =: cGUID];
        } catch(Exception ex) {
                err = new Error('1002', 'There are no entitlements with the GUID: '+ cGUID);
        }
        
        if(entitlements.isEmpty() && err == null){
            err = new Error('1003', 'There are no entitlements with the GUID: '+ cGUID);
        }
        
        if(err != null)
            return JSON.SerializePretty(err);
        else
            return getEntitlements(entitlements);
   }
   /*
   private static List<ID> getLowerLevelHierarchyList(String accNum)
   {
       List<ID> listIDs = new List<ID>();
       
       for(Account a : getLowerLevelHierarchy(accNum).values())
            listIDs.add(a.ID);
       
       return listIDs;
   }
   
   private static Map<ID, Account> getLowerLevelHierarchy(String accNum)
   {
        Map<ID, Account> aHierarchy = new Map<ID, Account>();
        
        List<Account> laccount = [Select id, TNSequenceId__c, ParentSequenceId__c, Hierarchy_Level__c from Account where TNSequenceId__c =: accNum limit 1];
        
        if(!laccount.isEmpty())
        {
            if ((laccount[0].Hierarchy_Level__c).equals('BILLING'))
               aHierarchy.put(laccount[0].ID, laccount[0]);  
            else if ((laccount[0].Hierarchy_Level__c).equals('SUMMARY'))
            {
                aHierarchy = new Map<ID, Account>([Select id, TNSequenceId__c, ParentSequenceId__c, Hierarchy_Level__c from Account where ParentSequenceId__c =: laccount[0].TNSequenceId__c]);
                aHierarchy.put(laccount[0].ID, laccount[0]);
            } else if ((laccount[0].Hierarchy_Level__c).equals('GAN')) {
                aHierarchy = getFullHierarcy(accNum);
            }
        }
           
        return aHierarchy;
   }
   
   private static List<ID> getFullHierarcyList(String accNum)
   {
       List<ID> listIDs = new List<ID>();
       
       for(Account a : getFullHierarcy(accNum).values())
            listIDs.add(a.ID);
       
       return listIDs;
   }
   
   private static Map<ID, Account> getFullHierarcy(String accNum)
   {
        Map<ID, Account> masterHierarchy = new Map<ID, Account>();
        List<String> listTNs = new List<String>();
        System.debug('Mohan: input string : '+ accNum);
        List<Account> laccount = [Select id, TNSequenceId__c, ParentSequenceId__c, Hierarchy_Level__c from Account where TNSequenceId__c =: accNum limit 1];
        System.debug('Mohan: laccount : '+ laccount);
        List<Account> baccount = new List<Account>();
        List<Account> saccount = new List<Account>();
        List<Account> gaccount = new List<Account>();
        List<Account> accounts = new List<Account>();
        
        if(!laccount.isEmpty())
        {
            
            if ((laccount[0].Hierarchy_Level__c).equals('BILLING'))
            {
               saccount = [Select id, TNSequenceId__c, ParentSequenceId__c, Hierarchy_Level__c from Account where TNSequenceId__c =: laccount[0].ParentSequenceId__c limit 1];
               System.debug('Mohan: Its Billing account : smaacount is '+ saccount);
               if (saccount.isEmpty())
                  masterHierarchy.put(laccount[0].ID, laccount[0]); // Adding BILLING
               else
               {
                    if (!(String.isEmpty(saccount[0].ParentSequenceId__c)))
                        gaccount = [Select id, TNSequenceId__c, ParentSequenceId__c, Hierarchy_Level__c from Account where TNSequenceId__c =: saccount[0].ParentSequenceId__c limit 1];
                    
                    if (!gaccount.isEmpty())
                    {
                        masterHierarchy.put(gaccount[0].ID, gaccount[0]); // Adding GAN
                        System.debug('111');
                        saccount = [Select id, TNSequenceId__c, ParentSequenceId__c, Hierarchy_Level__c from Account where ParentSequenceId__c =: laccount[0].TNSequenceId__c];
                        System.debug('222');
                        if (!saccount.isEmpty())
                        {
                            for (Account a : saccount) {
                                listTNs.add(a.TNSequenceId__c);
                                masterHierarchy.put(a.ID, a);  // Adding SUMMARY
                            }
                            baccount = [Select id, TNSequenceId__c, ParentSequenceId__c, Hierarchy_Level__c from Account where ParentSequenceId__c in : listTNs];
                            if (!baccount.isEmpty())
                            {
                                for (Account a : baccount)
                                    masterHierarchy.put(a.ID, a); // Adding BILLING
                            }                   
                        }                   
                    } else {  // NO GAN - So need to look for only BILLING (BTN's)
                        System.debug('Mohan: 333');
                        masterHierarchy.put(saccount[0].ID, saccount[0]); // Adding SUMMARY
                        baccount = [Select id, TNSequenceId__c, ParentSequenceId__c, Hierarchy_Level__c from Account where ParentSequenceId__c =: saccount[0].TNSequenceId__c];
                        if (!baccount.isEmpty())
                        {
                            for (Account a : baccount)
                                masterHierarchy.put(a.ID, a); // Adding BILLING
                        }                   
                    }                
               } 
            }
            else if ((laccount[0].Hierarchy_Level__c).equals('SUMMARY'))
            {
                System.debug('Mohan - In Summary');
                if (!(String.isEmpty(laccount[0].ParentSequenceId__c)))
                    gaccount = [Select id, TNSequenceId__c, ParentSequenceId__c, Hierarchy_Level__c from Account where TNSequenceId__c =: laccount[0].ParentSequenceId__c limit 1];
                    
                if (!gaccount.isEmpty())
                {
                    System.debug('Mohan - In Summary'+gaccount);
                    masterHierarchy.put(gaccount[0].ID, gaccount[0]); // Adding GAN
                    saccount = [Select id, TNSequenceId__c, ParentSequenceId__c, Hierarchy_Level__c from Account where ParentSequenceId__c =: gaccount[0].TNSequenceId__c and Hierarchy_Level__c = 'SUMMARY'];
                    if (!saccount.isEmpty())
                    {
                        for (Account a : saccount) {
                            listTNs.add(a.TNSequenceId__c);
                            masterHierarchy.put(a.ID, a);  // Adding SUMMARY
                        }
                        baccount = [Select id, TNSequenceId__c, ParentSequenceId__c, Hierarchy_Level__c from Account where ParentSequenceId__c in : listTNs];
                        if (!baccount.isEmpty())
                        {
                            for (Account a : baccount)
                                masterHierarchy.put(a.ID, a); // Adding BILLING
                        }                   
                    }                   
                } else {  // NO GAN - So need to look for only BILLING (BTN's)
                    System.debug('NO GAN - STARTING WITH SUMMARY' + laccount[0]);
                    masterHierarchy.put(laccount[0].ID, laccount[0]); // Adding SUMMARY
                    baccount = [Select id, TNSequenceId__c, ParentSequenceId__c, Hierarchy_Level__c from Account where ParentSequenceId__c =: laccount[0].TNSequenceId__c];
                    if (!baccount.isEmpty())
                    {
                        for (Account a : baccount)
                            masterHierarchy.put(a.ID, a); // Adding BILLING
                    }                   
                }
                
            } else if ((laccount[0].Hierarchy_Level__c).equals('GAN')) {
                masterHierarchy.put(laccount[0].ID, laccount[0]);
                saccount = [Select id, TNSequenceId__c, ParentSequenceId__c, Hierarchy_Level__c from Account where ParentSequenceId__c =: laccount[0].TNSequenceId__c];
                System.debug('Mohan: It IS GAN account : SACCount '+ saccount);
                if (!saccount.isEmpty())
                {
                    for (Account a : saccount) {
                        listTNs.add(a.TNSequenceId__c);
                        masterHierarchy.put(a.ID, a);
                    }
                    
                    baccount = [Select id, TNSequenceId__c, ParentSequenceId__c, Hierarchy_Level__c from Account where ParentSequenceId__c in : listTNs];
                    System.debug('Mohan: It IS GAN account : bACCount '+ baccount);
                    if (!baccount.isEmpty())
                    {
                        for (Account a : baccount)
                            masterHierarchy.put(a.ID, a);
                    }                   
                }
            }
        }   
           
        return masterHierarchy;
   }
   */
//ktt883   private static String getEntitlements(List<Entitlement__c> eList){
   public static String getEntitlements(List<Entitlement__c> eList){
        List<Entitlements> etlList = new List<Entitlements>();
        System.debug('Mohan :: entitlements list :: '+eList);
        for(Entitlement__c ent : eList){
            System.debug('Mohan :: entitlements :: entitle.account :: '+ent.AccountTN__c);
            if(!string.isEmpty(ent.AccountTN__c))
                etlList.add(new Entitlements(ent.ContactID__c, ent.AccountTN__c, ent.AccountType__c, ent.Role__c, ent.PermissionSet__c));
        }
            
        return JSON.SerializePretty(etlList);
   }
   
   public static string addAccountEntitlements(List<Entitlements> EntitlementList)
   {
        return addEntitlements(EntitlementList); 
   }
   
   public static string deleteEntitlement(string cGUID, string accNum){
        return delEntitlement(cGUID, accNum);   
   }
   
   
   public String getAccountHierarcy(String accNum){
    
    ganAcc = null;
    smaAcc = null;
    btnAcc = null;
    boolean ganFlag = false;
    boolean smaFlag = false;
    Account acc = null;    
    Account acc1= null;
    Account acc2 = null;
    String queryTn = null;
    Map<String, List<Account>> btnSMAMap = new Map<String, List<Account>>();
    List<Account> accListBTN = new List<Account>();
    List<Account> accSubSetListBTN = new List<Account>();

    
    try{
        acc = [Select TNSequenceId__c, ParentSequenceId__c, id, Hierarchy_Level__c, DPI_GANId__c, Account_Type__c from Account where TNSequenceId__c <> null and TNSequenceId__c =: accNum];        
    }catch(Exception ex){ System.debug(ex); }
    
    try{
        acc2 = [Select TNSequenceId__c, ParentSequenceId__c, id, Hierarchy_Level__c, DPI_GANId__c, Account_Type__c from Account where TNSequenceId__c <> null and ParentSequenceId__c =: accNum limit 1];
    }catch(Exception ex){ System.debug(ex); }
    
    if(acc != null){
        System.debug('Variable acc NOT NULL ::'+acc);
        if((acc.ParentSequenceId__c == null || acc.ParentSequenceId__c == acc.TNSequenceId__c) && acc.Hierarchy_Level__c == 'Billing'){         
            if(string.isEmpty(acc.DPI_GANId__c)){
                btnAcc = new BTN(accNum, 'BTN', acc.Account_Type__c);
                level = 'BTN';
            }else{    
                level = 'GAN';          
                ganAcc = new GAN(acc.DPI_GANId__c, 'GAN');
                ganAcc.BTNList.add(new BTN(accNum, 'BTN', acc.Account_Type__c));
            }           
        }else if(acc.Hierarchy_Level__c == 'Billing' && acc.ParentSequenceId__c != null){           
            try{
                 acc1 = [Select TNSequenceId__c, ParentSequenceId__c, id, Hierarchy_Level__c from Account where TNSequenceId__c <> null and TNSequenceId__c =: acc.ParentSequenceId__c];
             }catch(Exception ex){      }
             
             if(acc1 == null){
                 ganFlag = true;
                 queryTn = acc.ParentSequenceId__c;                 
             }else if(acc1 != null && acc1.ParentSequenceId__c != null){                
                     ganFlag = true;
                     queryTn = acc1.ParentSequenceId__c;             
             }else{                 
                 smaFlag = true;
                 queryTn = acc1.TNSequenceId__c;                
             }        
        }else if(acc.Hierarchy_Level__c == 'SUMMARY'){
             if((acc.ParentSequenceId__c != null) && (acc.ParentSequenceId__c != acc.TNSequenceId__c)){
                 ganFlag = true;
                 queryTn = acc.ParentSequenceId__c;
             }else{
                 smaFlag = true;
                 queryTn = acc.TNSequenceId__c;
             }
        }
       }else{//if acc = null
            if(acc2 != null){
                ganFlag = true;                 
                queryTn = acc2.ParentSequenceId__c;
            }else{
                List<Account> accLst1 = [select TNSequenceId__c, ParentSequenceId__c, id, Hierarchy_Level__c, DPI_GANID__c, Account_Type__c from Account where (not TNSequenceId__c  like '208%') and (not TNSequenceId__c  like '503%')  and (not TNSequenceId__c  like '541%') and (not TNSequenceId__c  like '206%') and (not TNSequenceId__c  like '253%') and (not TNSequenceId__c  like '360%') and (not TNSequenceId__c  like '425%')and (not TNSequenceId__c  like '509%') and (not TNSequenceId__c  like '406%') and TNSequenceId__c <> null and DPI_GANID__c =: accNum];
                if(accLst1 != null && (accLst1.size()>0)){                  
                    ganAcc = new GAN(accNum, 'GAN');
                    ganAcc.BTNList.add(new BTN(accLst1[0].TNSequenceId__c, 'BTN', accLst1[0].Account_Type__c));   
                    level = 'GAN';              
                }
            }
       }
       System.debug('smaFlag'+smaFlag);
       System.debug('ganFlag'+ganFlag);
       if(smaFlag){
              level = 'SMA';    
              Account sAcc = [select TNSequenceId__c, ParentSequenceId__c, id, Hierarchy_Level__c, Account_Type__c from Account where TNSequenceId__c <> null and TNSequenceId__c =: queryTn];
              accListBTN = [select TNSequenceId__c, ParentSequenceId__c, id, Hierarchy_Level__c, Account_Type__c from Account where TNSequenceId__c <> null and ParentSequenceId__c =: queryTn];
              if(!accListBTN.isEmpty()){
                 btnSMAMap = getMapHier(accListBTN);
                 System.debug('btnSMAMap'+btnSMAMap);
                 smaAcc = new SMA(sAcc.TNSequenceId__c, 'SMA', getBtnList(btnSMAMap.get(queryTn)), sAcc.Account_Type__c);
              }else{
                 smaAcc = new SMA(queryTn, 'SMA', sAcc.Account_Type__c);
              }
        }
    system.debug(queryTn);
           
    if(ganFlag){
        level = 'GAN';
        System.debug('It is GAN Account. Processing the hierarchy ..');
        if(String.isEmpty(queryTn))
           queryTn = accNum;                 
          System.debug('queryTn----'+queryTn);  
          List<Account> accListSMA = new List<Account>();
          List<Account> accListBTNG = new List<Account>();
          Map<string, List<Account>> smaGANMap = new Map<string, List<Account>>();
          Map<string, List<Account>> btnGANMap = new Map<string, List<Account>>();
          Set<String> smaIds = new Set<String>();
          Set<String> smaSubSetIds = new Set<String>();
          
          accListSMA = [select TNSequenceId__c, ParentSequenceId__c, id, Hierarchy_Level__c, Account_Type__c from Account where (not TNSequenceId__c  like '208%') and (not TNSequenceId__c  like '503%')  and (not TNSequenceId__c  like '541%') and (not TNSequenceId__c  like '206%') and (not TNSequenceId__c  like '253%') and (not TNSequenceId__c  like '360%') and (not TNSequenceId__c  like '425%')and (not TNSequenceId__c  like '509%') and (not TNSequenceId__c  like '406%') and TNSequenceId__c <> null and ParentSequenceId__c =: queryTn  and Hierarchy_Level__c = 'SUMMARY'];
          System.debug('GAN SMAList size =  '+accListSMA.size());
          System.debug('GAN SMAList actual list = '+accListSMA);
          accListBTNG = [select TNSequenceId__c, ParentSequenceId__c, id, Hierarchy_Level__c, Account_Type__c from Account where (not TNSequenceId__c  like '208%') and (not TNSequenceId__c  like '503%')  and (not TNSequenceId__c  like '541%') and (not TNSequenceId__c  like '206%') and (not TNSequenceId__c  like '253%') and (not TNSequenceId__c  like '360%') and (not TNSequenceId__c  like '425%')and (not TNSequenceId__c  like '509%') and (not TNSequenceId__c  like '406%') and TNSequenceId__c <> null and ParentSequenceId__c =: queryTn  and Hierarchy_Level__c = 'BILLING'];
          System.debug('GAN BTNList size =  '+accListBTNG.size());
          System.debug('GAN BTNList actual list =  '+accListBTNG);
          if(!accListSMA.isEmpty()){
            smaGANMap = getMapHier(accListSMA);
            for(Account ac: accListSMA){
                smaIds.add(ac.TNSequenceId__c);
            }
          } 
          
          system.debug('SMAGAN-Map :: ' +smaGANMap);
          
          if(!accListBTNG.isEmpty())    
            btnGANMap = getMapHier(accListBTNG);    
                    
          system.debug('BTNGAN-Map :: ' +btnGANMap);
                  
          system.debug('smaIds.size() :: ' +smaIds.size()); 
          
          Integer rowsToBeFetched = Limits.getLimitDmlRows();
          boolean hitLimitException = false;
          if (smaIds.size() > 50)  // select query has limit exception if the results are above 50k, so to overcome it, we iterate using subsets.
          {
             List<String> smaIdList = new list<string>(smaIds);
             accListBTN.clear();
             Integer count = 0;
             for(Integer s = 50; s < smaIdList.size(); s+=50)
             {
               accSubSetListBTN.clear();
               smaSubSetIds.clear();
               system.debug('count :: ' +count);
               
               for(Integer a = count; a < s ; a++)
                  smaSubSetIds.add(smaIdList.get(a)); 
                  
               system.debug('Looping thru subset :: ' +smaSubSetIds.size());
               accSubSetListBTN = [select TNSequenceId__c, ParentSequenceId__c, id, Hierarchy_Level__c, Account_Type__c from Account where TNSequenceId__c <> null and ParentSequenceId__c IN: smaSubSetIds and DPI_GANID__c =: queryTn and Hierarchy_Level__c = 'BILLING' limit 50000];
               rowsToBeFetched -= accSubSetListBTN.size();
               accListBTN.addAll(accSubSetListBTN);
               count = s;
               if ((rowsToBeFetched < 5000) || (count >= 200)) {
                  count = smaIdList.size();
                  hitLimitException = true;
                  break;  
               }
             }
             
             if (count < smaIdList.size())
             {
                   accSubSetListBTN.clear();
                   smaSubSetIds.clear();
                   for(Integer a = count; a < smaIdList.size() ; a++)
                      smaSubSetIds.add(smaIdList.get(a)); 
                      
                   system.debug('Final Loop :: ' +smaSubSetIds.size());                      
                   accSubSetListBTN = [select TNSequenceId__c, ParentSequenceId__c, id, Hierarchy_Level__c, Account_Type__c from Account where TNSequenceId__c <> null and ParentSequenceId__c IN: smaSubSetIds and DPI_GANID__c =: queryTn and Hierarchy_Level__c = 'BILLING' limit 50000];
                   accListBTN.addAll(accSubSetListBTN);
              }  
          }
          else
          {   
             accListBTN = [select TNSequenceId__c, ParentSequenceId__c, id, Hierarchy_Level__c, Account_Type__c from Account where (not TNSequenceId__c  like '208%') and (not TNSequenceId__c  like '503%')  and (not TNSequenceId__c  like '541%') and (not TNSequenceId__c  like '206%') and (not TNSequenceId__c  like '253%') and (not TNSequenceId__c  like '360%') and (not TNSequenceId__c  like '425%')and (not TNSequenceId__c  like '509%') and (not TNSequenceId__c  like '406%') and TNSequenceId__c <> null and ParentSequenceId__c IN: smaIds and DPI_GANID__c =: queryTn and Hierarchy_Level__c = 'BILLING'];
          }
          
          btnSMAMap = getMapHier(accListBTN);  
          
          system.debug('BTNSMA-Map :: ' +btnSMAMap);
          
          if(!accListSMA.isEmpty() || !accListBTNG.isEmpty()){
              ganAcc = new GAN(queryTn, 'GAN');

              if (hitLimitException)
                 ganAcc.isComplete = 'FALSE';
              
              if(!accListSMA.isEmpty())
                ganAcc.SMAList = getSMAList(accListSMA, btnSMAMap);
              if(!btnGanMap.isEmpty() && btnGanMap.containsKey(queryTn))
                ganAcc.BTNList = getBtnList(btnGanMap.get(queryTn));     
          }
        } 
    if(ganAcc != null)
            return JSON.SerializePretty(ganAcc);        
    else if(smaAcc != null)   
            return JSON.SerializePretty(smaAcc);        
    else if(btnAcc != null)
        return JSON.SerializePretty(btnAcc);        
    else
        return JSON.SerializePretty(new Error('1010', 'No account found with the provided account number: '+accNum));    
   }
   
   
//ktt883   private static  Map<string, List<Account>> getMapHier(List<Account> acList){
   public static  Map<string, List<Account>> getMapHier(List<Account> acList){
    Map<string, List<Account>> pChildMap = new Map<String, List<Account>>();
    List<Account> accValList = new List<Account>();
    
    for(Account acc: acList){
         if(pChildMap.isEmpty() || !pChildMap.containsKey(acc.ParentSequenceId__c)){
            pChildMap.put(acc.ParentSequenceId__c, new List<Account>{acc});
         }else{
            accValList = pChildMap.get(acc.ParentSequenceId__c); 
            accValList.add(acc);           
            pChildMap.put(acc.ParentSequenceId__c, accValList);
         }
     }    
    return pChildMap;
   }
   
//ktt883   private static List<SMA> getSMAList(List<account> aList, Map<String, List<Account>> aMap){
   public static List<SMA> getSMAList(List<account> aList, Map<String, List<Account>> aMap){

    List<SMA> sList = new List<SMA>();
    
    for(Account acc: aList){
        if(aMap.containsKey(acc.TNSequenceId__c)){
            sList.add(new SMA(acc.TNSequenceId__c, 'SMA', getBtnList(aMap.get(acc.TNSequenceId__c)), acc.Account_Type__c));
        }else{
            sList.add(new SMA(acc.TNSequenceId__c, 'SMA', acc.Account_Type__c));
        }        
     }
    return sList;
    }
    
//ktt883    private static List<BTNCT> getBTNWithCircuits(List<BTN> sBtn){
    public static List<BTNCT> getBTNWithCircuits(List<BTN> sBtn){

        System.debug('Mohan::: getBTNWithCircuits Processing ...  :::');
        System.debug('Mohan:: Extracting Circuits for BTN size = '+sBtn.size()+' BTNs are = '+sBtn);
        
        List<BTNCT> sbtnCt = null;
        List<Account> acclist = null;
        List<String> accNums = new List<String>();
        
        for(BTN bn: sBtn)
            accNums.add(bn.AccountNumber);
        
        try{
            acclist = [Select id, TNSequenceID__c from Account where TNSequenceId__c <> null and TNSequenceID__c in :accNums limit 50000];
        }Catch(Exception ex){System.debug(ex); }
        
        if(acclist != null) {
            System.debug('Mohan::: Extracted BTN Account records  ::: size = '+acclist.size());
            System.debug('Mohan:: Extracting Circuits ::');
            sbtnCt = BTNCTWithCircuitList(acclist); //new BTNCT(sBtn.AccountNumber, sBtn.AccountType, getCirIdList(acc.id));       
        }
        System.debug('::: getBTNWithCircuits Processed with returning value BTNCT list  ...  :::' +sbtnCt);
        return sbtnCt;      
    }
    
//ktt883    private static BTNCT getBTNWithCir(BTN sBtn){
    public static BTNCT getBTNWithCir(BTN sBtn){

        BTNCT sbtnCt = null;
        Account acc = null;
        try{
            acc = [Select id, TNSequenceID__c from Account where TNSequenceId__c <> null and TNSequenceID__c =: sBtn.AccountNumber];
        }Catch(Exception ex){System.debug(ex); }
        if(acc != null){
            sbtnCt = BTNCTWithCircuitIds(acc);//new BTNCT(sBtn.AccountNumber, sBtn.AccountType, getCirIdList(acc.id));       
        }
        
        return sbtnCt;      
    }
    
//ktt883    private static List<SMACT> getSMAWithCircuits(List<SMA> sStn){
    public static List<SMACT> getSMAWithCircuits(List<SMA> sStn){
        System.debug('Mohan::: getSMAWithCircuits Processing ...  :::');
        List<SMACT> sTlist = new List<SMACT>();
        SMACT st = null;
        List<Account> acclist = new List<Account>();
        List<String> accNums = new List<String>();
        Map<string, ID> smaIDs = new Map<string, ID>();
        
        for(SMA bn: sStn)
            accNums.add(bn.AccountNumber);
            
        try{
            acclist = [Select id, TNSequenceID__c from Account where TNSequenceId__c <> null and TNSequenceID__c in :accNums];
        }Catch(Exception ex){System.debug(ex);}
        
        System.debug('Mohan::: getSMAWithCircuits acclist ...  :::  '+acclist);
        for (Account ac : acclist)
           smaIDs.put(ac.TNSequenceID__c, ac.ID);
           
        for(SMA sma: sStn)
        {
            st = new SMACT(sma.AccountNumber, sma.AccountType);
            st.setCircuitIDList(getCircuitIdList(smaIDs.get(sma.AccountNumber), sma.AccountNumber));
            st.BTNList = getBTNWithCircuits(sma.BTNList);
            sTlist.add(st);
        }
        System.debug('Mohan:: limit size .. '+Limits.getDMLStatements());        
        System.debug('::: getSMAWithCircuits Processed  and the return value ...  :::' +sTlist);
        return sTlist;
    }
    
//    private static SMACT getSMAWithCir(SMA sStn){
    public static SMACT getSMAWithCir(SMA sStn){

        SMACT sT = null;
        Account acc = null;
        try{
            acc = [Select id, TNSequenceId__c from Account where TNSequenceId__c <> null and TNSequenceID__c =: sStn.AccountNumber];
        }Catch(Exception ex){System.debug(ex);}
        st = new SMACT(sStn.AccountNumber, sStn.AccountType);
        if(acc != null){
            st.setCircuitIDList(getCircuitIdList(acc.id, acc.TNSequenceId__c));
        }
        for(BTN bn: sStn.BTNList){
            st.BTNList.add(getBTNWithCir(bn));
        }
        return st;
    }
    
//ktt883    private static GANCT getGANWithCircuits(GAN sGan){
    public static GANCT getGANWithCircuits(GAN sGan){
        GANCT sGanCt = null;
        Account acc = null;
        sGanCt = new GANCT(sGan.AccountNumber, sGan.AccountType);
        
        System.debug('Mohan::Processing getGANWithCir with GAN ::'+sGan+' for SMAs');
        sGanCt.SMAList = getSMAWithCircuits(sGan.SMAList);
        System.debug('Mohan::Now processing BTN list ... ');
        sGanCt.BTNList = getBTNWithCircuits(sGan.BTNList);
        if (circuitHitLimitException)
          sGanCt.isComplete = 'FALSE';
        return sGanCt;
    }
    
//ktt883    private static GANCT getGANWithCir(GAN sGan){
    public static GANCT getGANWithCir(GAN sGan){

        GANCT sGanCt = null;
        Account acc = null;
        sGanCt = new GANCT(sGan.AccountNumber, sGan.AccountType);
        
        System.debug('Processing getGANWithCir with GAN ::'+sGan);
        
        for(SMA ssn: sGan.SMAList){
            sGanCt.SMAList.add(getSMAWithCir(ssn));
        }
        for(BTN bn: sGan.BTNList){
            sGanCt.BTNList.add(getBTNWithCir(bn));
        }
        return sGanCt;
    }
    
    public static string getHierLevel(String accNum){
        Account acc = null;
        Account acc1 = null;
        Account acc2 = null;
        try{
            acc = [select TNSequenceId__c, ParentSequenceId__c, id, Hierarchy_Level__c from Account where TNSequenceId__c <> null and TNSequenceId__c =: accNum AND (Hierarchy_Level__c = 'SUMMARY' OR Hierarchy_Level__c = 'BILLING')];
        }Catch(Exception ex){System.debug(ex); }
        
        if(acc == null){
            
            try{
                acc1 = [select TNSequenceId__c, ParentSequenceId__c, id, Hierarchy_Level__c from Account where TNSequenceId__c <> null and ParentSequenceId__c =: accNum AND (Hierarchy_Level__c = 'SUMMARY' OR Hierarchy_Level__c = 'BILLING') limit 1];
            }Catch(Exception ex){System.debug(ex); }
        }
        
        try{
            acc2 = [select TNSequenceId__c, DPI_GANID__c from Account where DPI_GANID__c =: accNum limit 1];
        }Catch(Exception ex){System.debug(ex);}
        
        if((acc == null && acc1 != null) || acc2 != null)
            return 'GAN';
        else if(acc != null)
            return acc.Hierarchy_Level__c;
        else 
            return JSON.SerializePretty(new Error('1010', 'No account found with the provided account number: '+accNum));
        
    }
    
//ktt883   private static Map<string, List<string>> getCircuitsFromSet(Map<string, Set<String>> cirMap)
   public static Map<string, List<string>> getCircuitsFromSet(Map<string, Set<String>> cirMap)

   {
        Map<String, List<String>> circuitsMap = new Map<String, List<String>>();
        
        List<String> cirIdList = new List<String>();
        List<Asset__C> assetList = new List<Asset__C>();
        
        System.debug('Mohan:: cirMap Size :'+cirMap.size());
        
        set<String> accs = new set<String>();
        for (String acc : cirMap.keyset())
            accs.addAll(cirMap.get(acc));

        System.debug('Mohan:: Circuit search based of accounts size '+accs.size());
        
        try{
                assetList = [select circuitId__c, account__c, account__r.ParentSequenceId__c, TNSequenceId__C from Asset__c where account__c in: accs];
                System.debug('Mohan:: AssetList Size :'+assetList.size());
        }Catch(Exception ex){
                System.debug(ex);
        }
        
        for(Asset__c ast : assetList)
          System.debug('Mohan:: TN = '+ast.TNSequenceId__C+' with Parent ID = '+ast.account__r.ParentSequenceId__c+' has Circuit ='+ast.circuitId__c);
        
        integer count = 0;
        integer cirCount = 0;
        
        //Looping on every BTN (which includes its WTN association list) to assign Circuits.
        for (String acc : cirMap.keyset())
        {
            //System.debug('Mohan:: acc value :'+acc);
            
            cirIdList = new List<String>();
            for(Asset__c ast : assetList)
            {
                if ( (acc.equals(ast.account__r.ParentSequenceId__c)) || (acc.equals(ast.TNSequenceId__C)) ) {
                //if (acc.equals(ast.account__r.ParentSequenceId__c)) 
                    //System.debug('asset parent sequenceID :'+ast.account__r.ParentSequenceId__c);
                    //System.debug('asset :'+ast.circuitId__c);
                    cirIdList.add(ast.circuitId__c);
                    //break;
                }
                
             /* if ((Limits.getLimitCpuTime()-Limits.getCpuTime()) < 200) {  // CPU Limit exception.
                    circuitHitLimitException = true;
                    break;
                }  */
            }
            
            circuitsMap.put(acc, cirIdList);
            
            
            if(cirIdList.size() > 0) {
                count++;
                System.debug('Mohan:: CircuitInventory added to acc:'+acc+' with cir count ::'+cirIdList.size());
                System.debug('Mohan##??##%%%%%%%%%%%%%%%%%%%% circuitmap ='+circuitsMap.get(acc));
                cirCount = cirCount + cirIdList.size();
            }
            
        }
        
        System.debug('##Mohan########################################  ???   Circuit Count added :'+cirCount);
        integer cCount = 0;
        for (String tn : circuitsMap.keyset()) {
           //System.debug('##Mohan########################################  TN FROM CIRCUITSMAP == '+tn);
           if (circuitsMap.get(tn).size() > 0)
           {
               System.debug('##Mohan########################################  TN: '+tn+' Circuit Count :: '+circuitsMap.get(tn));   
               cCount = cCount + circuitsMap.get(tn).size();
           } 
        }
        
        System.debug('##Mohan########################################  ????   Circuit Count = '+cCount);
                
        return circuitsMap;   
   }    
    
//ktt883   private static List<string> getCircuitIdsFromSet(set<String> cirString)
   public static List<string> getCircuitIdsFromSet(set<String> cirString)
   {
        List<String> cirIdList = new List<String>();
        
        try{
            List<Asset__C> assetList = [select circuitId__c, account__c from Asset__c where account__c in: cirString];
            System.debug('6 :'+assetList);
            for(Asset__c ast : assetList)
                cirIdList.add(ast.circuitId__c);
        }Catch(Exception ex){
            System.debug(ex);
        }
        return cirIdList;   
   }
    
//ktt883   private static Map<String, List<Account>> getChildAccountList(List<Account> acclist){
   public static Map<String, List<Account>> getChildAccountList(List<Account> acclist){

        System.debug('Mohan:: Fetching WTNs associated with every BTN');
        List<Account> accChildList = new List<Account>();
        Map<String, List<Account>> accLists = new Map<String, List<Account>>();
        Set<String> tnSetIds = new Set<String>();
        
        for (Account a : acclist) {
           accLists.put(a.TNSequenceId__c, new List<Account>());
           tnSetIds.add(a.TNSequenceId__c);
        }


        accChildList = [select TNSequenceId__c, ParentSequenceId__c, id, Hierarchy_Level__c from Account where TNSequenceId__c <> null and ParentSequenceId__c in : tnSetIds limit 50000];
        System.debug('Mohan:: Total WTNs Fetched are :: '+accChildList.size());
        
        for (Account acc : accChildList)
        {
                 if (accLists.get(acc.ParentSequenceId__c) != null)
                    accLists.get(acc.ParentSequenceId__c).add(acc);
        }
             
        //Integer rowsToBeFetched = Limits.getLimitDmlRows();
        //Set<String> tnSubSetIds = new Set<String>();
        //Integer count = 0;

        /*
        for(Integer s = 50; s < tnSetIds.size(); s+=50) // select query has limit exception if the results are above 50k, so to overcome it, we iterate using subsets.
        {
             tnSubSetIds.clear();
             accChildList.clear();
             
             for(Integer a = count; a < s ; a++)
                  tnSubSetIds.add((new list<string>(tnSetIds) )[a]);  
             
             try{
                accChildList = [select TNSequenceId__c, ParentSequenceId__c, id, Hierarchy_Level__c from Account where TNSequenceId__c <> null and ParentSequenceId__c in : tnSubSetIds limit 50000];
             }Catch(Exception ex){System.debug(ex);}
             
             rowsToBeFetched -= accChildList.size();
             
             for (Account acc : accChildList)
             {
                 if (accLists.get(acc.ParentSequenceId__c) != null)
                    accLists.get(acc.ParentSequenceId__c).add(acc);
             }
             
             count = s;
             if ((rowsToBeFetched < 5000) || (count >= 200)) {
                  count = tnSetIds.size();
                  circuitHitLimitException = true;
                  break;  
             }
        }
           
        if (count < tnSetIds.size())
        {
             tnSubSetIds.clear();
             accChildList.clear();
             for(Integer a = count; a < tnSetIds.size() ; a++)
                 tnSubSetIds.add(new list<string>(tnSetIds)[a]); 
                      
             system.debug('Final Loop :: ' +tnSubSetIds.size());                      
             accChildList = [select TNSequenceId__c, ParentSequenceId__c, id, Hierarchy_Level__c from Account where TNSequenceId__c <> null and ParentSequenceId__c in : tnSubSetIds limit 50000];
             for (Account acc : accChildList)
             {
                 if (accLists.get(acc.ParentSequenceId__c) != null)
                    accLists.get(acc.ParentSequenceId__c).add(acc);
             }
        } 
        */
                                 
        return accLists;
   }

        
//ktt883    private static List<Account> getChildAccList(Account acc){
    public static List<Account> getChildAccList(Account acc){
        List<Account> accChildList = new List<Account>();
        
        if(acc != null){
            try{
                accChildList = [select TNSequenceId__c, ParentSequenceId__c, id, Hierarchy_Level__c from Account where TNSequenceId__c <> null and ParentSequenceId__c =: acc.TNSequenceId__c];
            }Catch(Exception ex){System.debug(ex);}
        }
        return accChildList;
    }
    
//ktt883    private static Account getAccount(String accNum){
    public static Account getAccount(String accNum){
        Account acc = null;
        try{
            acc = [select TNSequenceId__c, ParentSequenceId__c, id, Hierarchy_Level__c from Account where TNSequenceId__c <> null and TNSequenceId__c =: accNum];
        }catch(Exception ex){System.debug(ex);}
        return acc;
    }
    
//ktt883    private static set<String> getIdSet(List<Account> accList){
    public static set<String> getIdSet(List<Account> accList){

        set<String> idSet = new set<String>();
        
        for(Account acc: accList)
            idSet.add(acc.id);
        
        return idSet;
    }
    
    
//ktt883   private static List<BTNCT> BTNCTWithCircuitList(List<Account> acc) {
   public static List<BTNCT> BTNCTWithCircuitList(List<Account> acc) {   
        System.debug('Mohan:: BTN Circuit extraction process started ...');
        List<BTNCT> bnlist = new List<BTNCT>();
        List<Account> childList = new List<Account>();
        Map<String, Set<String>> inputAccounts = new Map<string, Set<String>>(); // BTN and its WTN list combined will be stored as set<account>
        Map<String, List<String>> cirList = new Map<string, List<String>>();
        
        Map<String, List<Account>> childAccounts = getChildAccountList(acc);
        
        for (Account a : acc)
        {
            childList = childAccounts.get(a.TNSequenceId__c);
            childList.add(a); // adding BTN to all WTN's
            inputAccounts.put(a.TNSequenceId__c, getIdSet(childList));
            //System.debug('Mohan:: BTN Summary :: BTN ='+a.TNSequenceId__c+' Child Size = '+childList.size());
        }
        
        cirList = getCircuitsFromSet(inputAccounts);
        integer cirCount = 0;
        
        System.debug('##Mohan########################################  Accounts size'+acc.size());
        
        for (Account a : acc) {
           if (cirList.get(a.TNSequenceId__c).size() > 0)
           {
               System.debug('##Mohan########################################  TN: '+a.TNSequenceId__c+' Circuit Count :: '+cirList.get(a.TNSequenceId__c).size());   
               cirCount = cirCount + cirList.get(a.TNSequenceId__c).size();
           } 
        }
        System.debug('##Mohan######################################## Circuit COUNT == '+cirCount);
        
        for (Account a : acc){    
            if(cirList.get(a.TNSequenceId__c).size()==0)
                bnlist.add(new BTNCT(a.TNSequenceId__c, 'BTN'));
            else { //DO DEBUG HERE                       
                bnlist.add(new BTNCT(a.TNSequenceId__c, 'BTN', cirList.get(a.TNSequenceId__c)));
                //System.debug('TN = '+a.TNSequenceId__c+' CircuitCount = '+cirList.get(a.TNSequenceId__c).size());
                
            }
        }
        System.debug('Mohan:: BTN Circuit extraction processed ...'+cirCount);
        
        return bnlist;
   }
     
//ktt883   private static BTNCT BTNCTWithCircuitIds(Account acc){
   public static BTNCT BTNCTWithCircuitIds(Account acc){               
           
        BTNCT bn = null;
        List<Account> accList = new List<Account>();
        List<String> cirIdList = new List<String>();
        accList = getChildAccList(acc);
        accList.add(acc);
        if(accList.size()>0){
            cirIdList = getCircuitIdsFromSet(getIdSet(accList));    
        }
        if(cirIdList.size()==0){
            bn = new BTNCT(acc.TNSequenceId__c, 'BTN');
        }else{                      
            bn = new BTNCT(acc.TNSequenceId__c, 'BTN', cirIdList);
        }
        
        return bn;
    }
    
    
    // New Code written to fetch Circuits based on GAN field we introduced in Asset__C Object
    
//ktt883    private static Map<String, List<String>> getTNAssets(Map<String, Set<String>> inputAccounts, Map<String, List<string>> cirInv) 
    public static Map<String, List<String>> getTNAssets(Map<String, Set<String>> inputAccounts, Map<String, List<string>> cirInv) 
    
    {
        Map<String, List<String>> cirInvList = new Map<String, List<String>>();
        Set <String> btnSet = new Set<String>();
        Set <String> cirSet = new Set<String>();
        List <String> circuits;
        
        cirSet = inputAccounts.keySet();
        
        for (String s : cirSet) {
            circuits = new List <String>();
            btnSet = inputAccounts.get(s);
            for (String tn : btnSet) {
                circuits.addAll(cirInv.get(tn));
            }
            cirInvList.put(s, circuits);
        }
        
        return cirInvList;
    }
    
//ktt883    private static Map<String, List<string>> getAssetLists(String gan)
    public static Map<String, List<string>> getAssetLists(String gan)

    {
        Map<String, List<string>> cirList = new Map<String, List<string>>();
        List<String> clist = new List<String>();
        
        try{
            List<Asset__C> assetList = [select TNSequenceID__c, circuitId__c from Asset__c where GanID__c =: gan];
            String tn;
            for(Asset__c ast : assetList) {
               tn =  ast.TNSequenceID__c;
               for(Asset__c ast1 : assetList) {
                   if (tn.equals(ast1.TNSequenceID__c))
                      clist.add(ast1.circuitId__c);                            
               }
               cirList.put(tn, clist);
               tn = null;
            }
        }catch(Exception ex){
            System.debug(ex);
        }
        return cirList;   
    }
    
//    private static List<SMACT> getSMAAssets(List<SMA> sStn, Map<String, List<string>> cirInv){
    public static List<SMACT> getSMAAssets(List<SMA> sStn, Map<String, List<string>> cirInv){


        List<SMACT> sTlist = new List<SMACT>();
        SMACT st = null;

        for(SMA sma: sStn)
        {
            st = new SMACT(sma.AccountNumber, sma.AccountType);
            st.setCircuitIDList(cirInv.get(sma.AccountNumber));
            st.BTNList = getBTNAssets(sma.BTNList, cirInv);
            sTlist.add(st);
        }

        return sTlist;
    }

//ktt883    private static List<BTNCT> getBTNAssets(List<BTN> sBtn, Map<String, List<string>> cirInv){
    public static List<BTNCT> getBTNAssets(List<BTN> sBtn, Map<String, List<string>> cirInv){

        
        List<BTNCT> sbtnCt = null;
        List<String> btns = new List<String>();
        Map<String, List<String>> btnRecords = new Map<String, List<String>>();
        Map<String, Set<String>> inputAccounts = new Map<string, Set<String>>(); // BTN and its WTN list combined will be stored as set<account>
        List<String> childList = new List<String>();
        
        for(BTN bn: sBtn) {
            btns.add(bn.AccountNumber);
            btnRecords.put(bn.AccountNumber, new List<String>());
        }

        List<Account> accChildList = [select TNSequenceId__c, ParentSequenceId__c, id, Hierarchy_Level__c from Account where TNSequenceId__c <> null and ParentSequenceId__c in : btns limit 50000];
        
        for (Account acc : accChildList)
        {
            if (btnRecords.get(acc.ParentSequenceId__c) != null)
                btnRecords.get(acc.ParentSequenceId__c).add(acc.TNSequenceId__c);
        }
        
        for (String tn : btns)
        {
            childList = btnRecords.get(tn);
            childList.add(tn); // adding BTN to all WTN's
            inputAccounts.put(tn, new Set<String>(childList));
        }
        
        Map<String, List<String>> cirList = getTNAssets(inputAccounts, cirInv);
         
        for (String tn : btns){    
            if(cirList.get(tn).size()==0)
                sbtnCt.add(new BTNCT(tn, 'BTN'));
            else { //DO DEBUG HERE                       
                sbtnCt.add(new BTNCT(tn, 'BTN', cirList.get(tn)));
            }
        }

        return sbtnCt;      
    }
    
//ktt883    private static GANCT getGANAssets(GAN sGan) {
    public static GANCT getGANAssets(GAN sGan) {
        
        Account acc = null;
        Map<String, List<string>> cirInv = getAssetLists(sGan.AccountNumber);
        
        GANCT sGanCt = new GANCT(sGan.AccountNumber, sGan.AccountType);
        
        // Get SMA Level Assets
        sGanCt.SMAList = getSMAAssets(sGan.SMAList, cirInv);
        
        // Get BTN Level Assets
        sGanCt.BTNList = getBTNAssets(sGan.BTNList, cirInv);
        
        sGanCt.CircuitIDList = cirInv.get(sGan.AccountNumber);

        if (circuitHitLimitException)
          sGanCt.isComplete = 'FALSE';
        
        return sGanCt;      
    }    
    
    // New Code ends here.
    
    
    public string getCustomerInventory(String accNum){
        List<Account> accList = new List<Account>();
        Set<String> tnSet = new Set<String>();
        Account acc = null;
        
        String accHier = getHierLevel(accNum);
        
        if(accHier.equals('GAN')){
            System.debug('Mohan::1. It is GAN');  
            string tmp =  getAccountHierarcy(accNum); 
                    
            System.debug('Mohan::2. Account Hierarchy Success !!!, Processing Circuits ... ');
            return JSON.SerializePretty(getGANAssets(ganAcc));  //******************** Change this to getGANWithCircuits(ganAcc)
        }else if(accHier.equals('SUMMARY')){
            acc = getAccount(accNum);
            SMACT st = new SMACT(accNum, 'SMA');
            st.setCircuitIDList(getCircuitIdList(acc.Id, acc.TNSequenceId__c));
            accList = getChildAccList(acc);
            for(Account act: accList )
                st.BTNList.add(BTNCTWithCircuitIds(act));
            
            return JSON.SerializePretty(st);
        }else if(accHier.equals('BILLING')){
            acc = getAccount(accNum);
            return JSON.SerializePretty(BTNCTWithCircuitIds(acc));           
        }else       
            return JSON.SerializePretty(new Error('1010', 'No account found with the provided account number: '+accNum));
        
    }
    
    public String getAssets(String gan) {
        List<String> clist = new List<String>();
        try{
            List<Asset__C> assetList = [select TNSequenceID__c, circuitId__c from Asset__c where GanID__c =: gan];
            for(Asset__c ast : assetList) 
                clist.add(ast.circuitId__c);                               
        }catch(Exception ex){
            System.debug(ex);
        }
        return JSON.SerializePretty(new AssetList(gan, clist));
    }
   
//    private Map<String, String> excludeSpecialCharacters(List<String> cktids) {
    public Map<String, String> excludeSpecialCharacters(List<String> cktids) {
    
         Map<String, String> cktlist = new Map<String, String>();
         for (String cktid : cktids) {
            cktlist.put(cktid.replaceAll('[^a-zA-Z0-9]', '').toLowerCase(), cktid);
         }
         return cktlist;    
    }
    
//ktt883    private List<String> getCircuitInventory(String ganid) {
    public List<String> getCircuitInventory(String ganid) {

        List<Asset__C> assetList = [select circuitId__c from Asset__c where GanID__c =: ganid];
        List<String> circuitList = new List<String>();
        for (Asset__C asset : assetList) {
            circuitList.add((asset.circuitId__c));
        }
        return circuitList;
    }
    
    
    public String extractOpportunities(String bilg, String shpg, String lead)
    {
        boolean isBillingEmpty = String.isEmpty(bilg);
        boolean validBillingAddress = false;
        boolean isShippingEmpty = String.isEmpty(shpg);
        boolean validShippingAddress = false;
        String billingString = null;
        String shippingString = null;        
        
        if (!isBillingEmpty && bilg.length() > 10) {
            validBillingAddress = true;
            billingString = '%' + String.escapeSingleQuotes(bilg.left(10).trim()) + '%';
        }

        if (!isShippingEmpty && shpg.length() > 10) {
            validShippingAddress = true;
            shippingString = shpg.left(10)+'%';
        }
        
        List<Opportunity> OpList = null;
        
        if (validBillingAddress && validShippingAddress)                
                OpList = [SELECT ID, Name, Owner.name, RecordType.name, LDR_Assigned__c, Account.Name,Account.BillingStreet,Account.BillingCity,Account.BillingState,Account.BillingStateCode,Account.BillingCountry,Account.BillingPostalCode,Account.ShippingStreet,Account.ShippingCity,Account.ShippingState,Account.ShippingStateCode,Account.ShippingCountry,Account.ShippingPostalCode, Opportunity_Type__c, Probability, NextStep, StageName, CloseDate, Opportunity_Disposition__c, Other_Reason_Lost_Details__c, Reason_Won_Lost__c, LeadSource, Integrated_Sale__c, CPE_Product__c, Master_Agent__c, Expected_Billed_Date__c, Sub_Agent_Name__c, New_Logo__c, RPON_Order__c, Ver_no_for_redline__c, System_the_Order_Entered_In__c, Local_Area_Market__c, Campaign.name, Winback_Competitor__c, Region__c, Carrier_Region__c FROM Opportunity where Account.BillingStreet Like :billingString and Account.ShippingStreet Like :shippingString and LeadSource = :lead];
        else  if (validBillingAddress && !validShippingAddress)
                OpList = [SELECT ID, Name, Owner.name, RecordType.name, LDR_Assigned__c, Account.Name,Account.BillingStreet,Account.BillingCity,Account.BillingState,Account.BillingStateCode,Account.BillingCountry,Account.BillingPostalCode,Account.ShippingStreet,Account.ShippingCity,Account.ShippingState,Account.ShippingStateCode,Account.ShippingCountry,Account.ShippingPostalCode, Opportunity_Type__c, Probability, NextStep, StageName, CloseDate, Opportunity_Disposition__c, Other_Reason_Lost_Details__c, Reason_Won_Lost__c, LeadSource, Integrated_Sale__c, CPE_Product__c, Master_Agent__c, Expected_Billed_Date__c, Sub_Agent_Name__c, New_Logo__c, RPON_Order__c, Ver_no_for_redline__c, System_the_Order_Entered_In__c, Local_Area_Market__c, Campaign.name, Winback_Competitor__c, Region__c, Carrier_Region__c FROM Opportunity where Account.BillingStreet Like :billingString and LeadSource = :lead];
        else  if (!validBillingAddress && validShippingAddress)
                OpList = [SELECT ID, Name, Owner.name, RecordType.name, LDR_Assigned__c, Account.Name,Account.BillingStreet,Account.BillingCity,Account.BillingState,Account.BillingStateCode,Account.BillingCountry,Account.BillingPostalCode,Account.ShippingStreet,Account.ShippingCity,Account.ShippingState,Account.ShippingStateCode,Account.ShippingCountry,Account.ShippingPostalCode, Opportunity_Type__c, Probability, NextStep, StageName, CloseDate, Opportunity_Disposition__c, Other_Reason_Lost_Details__c, Reason_Won_Lost__c, LeadSource, Integrated_Sale__c, CPE_Product__c, Master_Agent__c, Expected_Billed_Date__c, Sub_Agent_Name__c, New_Logo__c, RPON_Order__c, Ver_no_for_redline__c, System_the_Order_Entered_In__c, Local_Area_Market__c, Campaign.name, Winback_Competitor__c, Region__c, Carrier_Region__c FROM Opportunity where Account.ShippingStreet Like :shippingString and LeadSource = :lead];
        
        List<OpportunityList> olist = new List<OpportunityList>();

        if (!OpList.isEmpty())
        {
            OpportunityList ods = null;
            for (Opportunity op : OpList) {
                ods = new OpportunityList();
                ods.OpportunityID = op.ID;
                ods.OpportunityDetails.Name = op.Name; 
                ods.OpportunityDetails.OwnerName = op.Owner.name;
                ods.OpportunityDetails.RecordTypeName = op.RecordType.name; 
                ods.OpportunityDetails.LDRAssigned = op.LDR_Assigned__c; 
                ods.OpportunityDetails.AccountName = op.Account.Name;
                ods.OpportunityDetails.BillingAddress = ((op.Account.BillingStreet != null) ? op.Account.BillingStreet: '')+' '+((op.Account.BillingCity != null) ? op.Account.BillingCity: '')+' '+((op.Account.BillingState != null) ? op.Account.BillingState: '')+' '+((op.Account.BillingCountry != null) ? op.Account.BillingCountry: '')+' '+((op.Account.BillingPostalCode != null) ? op.Account.BillingPostalCode: '');
                ods.OpportunityDetails.BillingAddress = (ods.OpportunityDetails.BillingAddress != null) ? ods.OpportunityDetails.BillingAddress.trim() : null;
                ods.OpportunityDetails.ShippingAddress = ((op.Account.ShippingStreet != null) ? op.Account.ShippingStreet: '')+' '+((op.Account.ShippingCity != null) ? op.Account.ShippingCity: '')+' '+((op.Account.ShippingState != null) ? op.Account.ShippingState: '')+' '+((op.Account.ShippingCountry != null) ? op.Account.ShippingCountry: '')+' '+((op.Account.ShippingPostalCode != null) ? op.Account.ShippingPostalCode: '');
                ods.OpportunityDetails.ShippingAddress = (ods.OpportunityDetails.ShippingAddress != null) ? ods.OpportunityDetails.ShippingAddress.trim() : null;
                ods.OpportunityDetails.OpportunityType = op.Opportunity_Type__c; 
                ods.OpportunityDetails.Probability = op.Probability.toPlainString(); 
                ods.OpportunityDetails.NextStep = op.NextStep; 
                ods.OpportunityDetails.StageName = op.StageName; 
                ods.OpportunityDetails.CloseDate = String.valueOf(op.CloseDate); 
                ods.OpportunityDetails.OpportunityDisposition = op.Opportunity_Disposition__c; 
                ods.OpportunityDetails.OtherReasonLostDetails = op.Other_Reason_Lost_Details__c; 
                ods.OpportunityDetails.ReasonWonLost = op.Reason_Won_Lost__c; 
                ods.OpportunityDetails.LeadSource = op.LeadSource; 
                ods.OpportunityDetails.IntegratedSale = op.Integrated_Sale__c; 
                ods.OpportunityDetails.CPEProduct = op.CPE_Product__c; 
                ods.OpportunityDetails.MasterAgent = op.Master_Agent__c; 
                ods.OpportunityDetails.ExpectedBilledDate = String.valueOf(op.Expected_Billed_Date__c); 
                ods.OpportunityDetails.SubAgentName = op.Sub_Agent_Name__c;
                ods.OpportunityDetails.NewLogo = op.New_Logo__c; 
                ods.OpportunityDetails.RPONOrder = op.RPON_Order__c; 
                ods.OpportunityDetails.VerNoForRedline = op.Ver_no_for_redline__c.toPlainString(); 
                ods.OpportunityDetails.SystemTheOrderEnteredIn = op.System_the_Order_Entered_In__c; 
                ods.OpportunityDetails.LocalAreaMarket = op.Local_Area_Market__c; 
                ods.OpportunityDetails.CampaignName = op.Campaign.name; 
                ods.OpportunityDetails.WinbackCompetitor = op.Winback_Competitor__c; 
                ods.OpportunityDetails.Region = op.Region__c; 
                ods.OpportunityDetails.CarrierRegion = op.Carrier_Region__c;
                olist.add(ods);
            }
        }
        
        if (!olist.isEmpty())
            return JSON.SerializePretty(olist);           
        else       
            return JSON.SerializePretty(new Error('1010', 'No opportunities found with provided lead source : '+lead+' and given Billing Address '+billingString+' and Shipping Address '+shippingString));
    }
    
    
    public ValidateResponse validateCircuit(String cktid, String ganid) {
        Set<String> assetSet = new Set<String>();
        List<String> inventory = getCircuitInventory(ganid);
        
        Map<String, String> circuitsMap = excludeSpecialCharacters(inventory);
        
        assetSet = circuitsMap.keySet();
        
        System.debug('ValidateCircuit: Input Circuit entered value :: '+cktid);
        
        String inputCircuit = (cktid.replaceAll('[^a-zA-Z0-9]', '')).toLowerCase();
        
        System.debug('ValidateCircuit: Input Circuit excluding additional characters :: '+inputCircuit);
        
        if (assetSet.contains(inputCircuit))
           return new ValidateResponse(circuitsMap.get(inputCircuit), ganid, 'Match Found');
        else 
           return new ValidateResponse(cktid, ganid, 'No Match Found');
    }
   
}