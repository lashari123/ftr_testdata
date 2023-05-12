@isTest(seealldata=true)
public class ECPHandler_Test {
        public class Entitlements {
        public String contactGUID;
        public String accountNumber;
        public String accountType;
        public String role;
        public String permissionSet;
        
        public Entitlements(){ }
    }
    
    public class btn {}

    static testMethod void myUnitTest() {
         
         List<String> my_list = new List<String>();
         my_list.add('a'); 
         ECPHandler.Success sc = new ECPHandler.Success();
         ECPHandler.Success scd = new ECPHandler.Success('a');
         ECPHandler.Error err = new ECPHandler.Error();
         ECPHandler.Error err1 = new ECPHandler.Error('a','b');
         ECPHandler.Entitlements ent = new ECPHandler.Entitlements();
         ECPHandler.Entitlements ent1 = new ECPHandler.Entitlements('E5EC0014-EED2-4082-B986-0AD6B516EF46','338803','GAN','Analyst','{\"MP\":true,\"EP\":true,\"DI\":true,\"MD\":true,\"HX\":true,\"H5\":true}');
         ECPHandler.OpportunityList opt = new ECPHandler.OpportunityList();
         ECPHandler.ValidateResponse vr = new ECPHandler.ValidateResponse('a','b','b');
         ECPHandler.ValidateResponse vr1 = new ECPHandler.ValidateResponse();
         ECPHandler.GAN vr2 = new ECPHandler.GAN('a','b');
         ECPHandler.SMA vr3 = new ECPHandler.SMA('a','n','b');
         ECPHandler.GAN vr4 = new ECPHandler.GAN('a','b');
         ECPHandler.BTN vr5 = new ECPHandler.BTN('a','b','c');
         ECPHandler.GANCT vr6 = new ECPHandler.GANCT('a','b');
         ECPHandler.SMACT vr7 = new ECPHandler.SMACT('a','b');
         ECPHandler.BTNCT vr8 = new ECPHandler.BTNCT('a','b');

         ECPHandler.AssetList vr9 = new ECPHandler.AssetList('a',my_list);
         List<Account> accList =[select id,TNSequenceId__c,Account_Type__c,ParentSequenceId__c from account where TNSequenceId__c = '8181970590.0' limit 1];
         Account acc = [select id,TNSequenceId__c,Account_Type__c,ParentSequenceId__c from account where TNSequenceId__c = '8181970590.0' limit 1][0];
         Map<String, List<Account>> aMap = new Map<String, List<Account>>();
         ECPHandler.getBtnList(acclist);
         ECPHandler.getCircuitIdList('a','b');
         List<ECPHandler.BTN> btn = new List<ECPHandler.BTN>();
         List<ECPHandler.SMA> SMA1 = new List<ECPHandler.SMA>();
         List<String> cList = new List<String>();
         ECPHandler.BTN btn1 = new  ECPHandler.BTN('a','b','c');
         ECPHandler.SMA sma2 = new  ECPHandler.SMA('a','b',btn,'c');
         ECPHandler.GAN GAN = new  ECPHandler.GAN('a' ,'c');
         ECPHandler.BTNCT btnct2 = new ECPHandler.BTNCT('a','b',cList);
        
         List<ECPHandler.Entitlements> EntitlementList = new List<ECPHandler.Entitlements>();
         String contactGUID='E5EC0014-EED2-4082-B986-0AD6B516EF46';
         String contactGUID2='4D74077A-9CBA-4719-B32E-FC7305960E3C';
         String contactGUID3='85760CFF-9C35-4146-9AE8-7219319753E8';
         String accountNumber = '9723170294.0';
         String accountNumber2 = '7172575051.1';
         String accountNumber3 = '3083384028.2';
         String accountType = 'GAN';
         String accountType2 = 'SMA';
         String accountType3 = 'BTN';
         String role = 'Analyst';
         String permissionSet = '{\"MP\":true,\"EP\":true,\"DI\":true,\"MD\":true,\"HX\":true,\"H5\":true}'; 
        Entitlement__c ext =new Entitlement__c(ContactID__c=contactGUID,AccountTN__c=accountNumber,AccountType__c=accountType,Role__c=role,PermissionSet__c=permissionSet);
        insert ext;
        Entitlement__c ext1 =new Entitlement__c(ContactID__c=contactGUID2,AccountTN__c=accountNumber2,AccountType__c=accountType2,Role__c=role,PermissionSet__c=permissionSet);
        insert ext1;
        Entitlement__c ext2 =new Entitlement__c(ContactID__c=contactGUID3,AccountTN__c=accountNumber3,AccountType__c=accountType3,Role__c=role,PermissionSet__c=permissionSet);
        insert ext2;
        ECPHandler.Entitlements entitlement = null;
        entitlement = new ECPHandler.Entitlements( contactGUID, accountNumber, accountType,role, permissionSet);
        ECPHandler.Entitlements entitlement2 = new ECPHandler.Entitlements( contactGUID2, accountNumber2, accountType2,role, permissionSet);
        ECPHandler.Entitlements entitlement3 = new ECPHandler.Entitlements( contactGUID3, accountNumber3, accountType3,role, permissionSet);
        List<Entitlement__c> elt = [Select id,ContactID__c,AccountId__c,AccountTN__c,AccountType__c,Role__c,PermissionSet__c  from Entitlement__c ];
        EntitlementList.add(entitlement);
        EntitlementList.add(entitlement2);
        //EntitlementList.add(entitlement3);
        
        //List<Entitlement__c> eltList = new List<Entitlement__c>();
        //eltList.add(ext1);
        //eltList.add(ext1);
        //eltList.add(ext1);
        
        ECPHandler.addEntitlements(EntitlementList);
        
        ECPHandler.delEntitlement('9091970888.0','4D74077A-9CBA-4719-B32E-FC7305960E3C');
        ECPHandler.getAccountEntitlements('253320' );
        ECPHandler.getAccountEntitlements('258985' );
        ECPHandler.getContactEntitlements('32370F37-943E-44BE-97E0-59521BC105FF');
        ECPHandler.getContactEntitlements('0A82A478-489A-494A-86F0-3369E586038D');
        ECPHandler.getEntitlements(elt);
        ECPHandler.addAccountEntitlements(EntitlementList);
        ECPHandler.deleteEntitlement('6D9BD328-802A-4489-AB0A-94271E9FF40B','234309');
        ECPHandler ecp = new ECPHandler();
        vr7.setCircuitIdList(cList);
        ecp.getAccountHierarcy('9724209931.0');
        ecp.getAccountHierarcy('3083384028.2');
        ecp.getAccountHierarcy('4025640940.2');
        ecp.getAccountHierarcy('3613870680.0');
        ecp.getAccountHierarcy('8641890506.0');
        ecp.getAccountHierarcy('115664');
        ecp.getAccountHierarcy('8139167261.0');
        ECPHandler.getMapHier(accList);
        ECPHandler.getSMAList(acclist,aMap);
        ECPHandler.getBTNWithCircuits(btn);
        ECPHandler.getBTNWithCir(btn1);
        ECPHandler.getSMAWithCircuits(SMA1);
        ECPHandler.getSMAWithCir(sma2);
        ECPHandler.getGANWithCircuits(GAN);
        ECPHandler.getGANWithCir(GAN);
        ECPHandler.getHierLevel('m');
        Map<string, Set<String>> cirset = new Map<string, Set<String>>();
        ECPHandler.getCircuitsFromSet(cirset);
        set<String> cirString =new set<String>();
        ECPHandler.getCircuitIdsFromSet(cirString);
        ECPHandler.getChildAccountList(acclist);
        ECPHandler.getChildAccList(acc);
        ECPHandler.getAccount('b');
        ECPHandler.getIdSet(acclist);
        ECPHandler.BTNCTWithCircuitList(acclist);
        ECPHandler.BTNCTWithCircuitIds(acc);
        Map<String, Set<String>> inputAccounts =new Map<String, Set<String>>();
        Map<String, List<string>> cirInv =new  Map<String, List<string>>();
        ECPHandler.getTnAssets(inputAccounts,cirInv);
        ECPHandler.getAssetLists('b');
        ECPHandler.getSMAAssets(SMA1,cirInv);
        ECPHandler.getBTNAssets(btn,cirInv);
        ECPHandler.getGANAssets(GAN);
        ecp.getCustomerInventory('ww');
        ecp.excludeSpecialCharacters(my_list);

    }
    
    static testMethod void myUnitTest2() {
        ECPHandler ecp = new ECPHandler();
        ecp.getAssets('ww');
        ecp.getCircuitInventory('ww');     
        ecp.extractOpportunities('','PO BOX 1965','Customer - Alt Channel');
        ecp.extractOpportunities('PO BOX 1965','PO BOX 1965','Customer - Alt Channel');
        ecp.extractOpportunities('PO BOX 1965','','Customer - Alt Channel');
        ecp.validateCircuit('ww','253320');     
    }
    
}