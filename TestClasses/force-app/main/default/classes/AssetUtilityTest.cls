@isTest
public with sharing class AssetUtilityTest {
    public static testMethod void testAssetUtilityTrigger(){
        
        List<Account> accountL = new List<Account>();
        List<Asset__C> assetL = new List<Asset__C>();

        Account acc = new Account(Name = 'AssetTriggerTest2', TNSequenceID__c = '1000000000.2', ParentSequenceId__c = '1000000000.2', RecordTypeId = '012E0000000fJrHIAU', Hierarchy_Level__c = 'MEMBER');
        accountL.add(acc);
        
        acc = new Account(Name = 'AssetTriggerTest3', TNSequenceID__c = '1000000000.3', ParentSequenceId__c = '1000000000.3', RecordTypeId = '012E0000000fJrHIAU', Hierarchy_Level__c = 'MEMBER');
        accountL.add(acc);
        
        upsert accountL TNSequenceID__c;
        
        Asset__C a = new Asset__C(TNSequenceId__c = '1000000000.3',CircuitId__c = 'Circuit3',CircuitDesignID__c = 'Circuit3');
        assetL.add(a);

        a = new Asset__C(TNSequenceId__c = '1000000000.2', CircuitId__c = 'Circuit2', CircuitDesignID__c = 'Circuit2');
        assetL.add(a);

        upsert assetL CircuitDesignID__c;
    }
}