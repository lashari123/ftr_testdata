@isTest(seeAllData = true)  
private class TerritoryAccountManagementTest {          

    static testmethod void unitTest1(){
            Account acc1 = new Account(RecordTypeId = '012E0000000fJrH', isDPILoad__c= 'true', Name = '2999999993.0', DPI_ConnectDate__c = System.today(),  TNSequenceId__c = '2999999993.0', 
                                                                           Hierarchy_Level__c='SUMMARY',Library_Id__c = 'CZ', SMASequenceID__c = '2999999993.0');
            Account acc2 = new Account(RecordTypeId = '012E0000000fJrH', isDPILoad__c= 'true', Name = '2999999997.0', DPI_ConnectDate__c = System.today(),  TNSequenceId__c = '2999999997.0', 
                                                                           Hierarchy_Level__c='SUMMARY',Library_Id__c = 'CZ', ParentSequenceId__c='2999999998.0', SMASequenceID__c = '2999999997.0');
            Account acc3 = new Account(RecordTypeId = '012E0000000fJrH', isDPILoad__c= 'false', Name = '2999999996.0', DPI_ConnectDate__c = System.today(),  TNSequenceId__c = '2999999996.0', 
                                                                           Hierarchy_Level__c='SUMMARY',Library_Id__c = 'CZ', ParentSequenceId__c='2999999996.0');

            insert acc1;
            insert acc2;
            insert acc3;
                                                                           
            Territory2[] territories = [SELECT Id, parentTerritory2Id FROM Territory2 WHERE parentTerritory2Id != null ORDER BY lastmodifieddate ASC LIMIT 2];
            
            ObjectTerritory2Association acc1TerritoryAssoc = new ObjectTerritory2Association(AssociationCause = 'Territory2Manual', Territory2Id = territories[0].Id, ObjectId = acc1.Id);
            ObjectTerritory2Association acc2TerritoryAssoc = new ObjectTerritory2Association(AssociationCause = 'Territory2Manual', Territory2Id = territories[1].Id, ObjectId = acc2.Id);
            ObjectTerritory2Association acc3TerritoryAssoc = new ObjectTerritory2Association(AssociationCause = 'Territory2Manual', Territory2Id = territories[1].parentTerritory2Id, ObjectId = acc3.Id);
            insert acc1TerritoryAssoc;
            insert acc2TerritoryAssoc;
            insert acc3TerritoryAssoc;
            
            territoryAccountManagement.purgeManuallyAssignedAccountsFromChildrenTerritories(territories[0].parentTerritory2Id);
            territoryAccountManagement.purgeManuallyAssignedAccountsFromChildrenTerritories(territories[1].parentTerritory2Id);
            territoryAccountManagement.purgeManuallyAssignedAccountsFromTerritory(territories[1].parentTerritory2Id);
        }
}