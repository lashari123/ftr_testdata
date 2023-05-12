public class territoryAccountManagement {
    
    //This method receives a parent territory Id and then finds all the manually assigned accounts associated with all of that territory Id's child territories (and all their 
    //children territories down as much as 7 generations). All the returned manually assigned accounts are then deleted; specifically, the ObjectTerritory2Association entries
    //connecting the child territories to the accounts themselves are deleted.
    public static void purgeManuallyAssignedAccountsFromChildrenTerritories(Id parentTerritoryId) {
        List<ObjectTerritory2Association> manuallyAssignedAccountsToDelete = new List<ObjectTerritory2Association>();
        
        //Find all the childrenTerritories of the parent territory.
        Map<Id, Territory2> childTerritoryIdToTerritories = new Map<Id, Territory2>([SELECT Id FROM Territory2 WHERE ParentTerritory2Id = :parentTerritoryId]);
        
        //Kick off our recursive calls to look at all of the children territories, one generation at a time, and return the combined total of their manually assigned account associations.
        manuallyAssignedAccountsToDelete = purgeManuallyAssignedAccountsFromChildrenTerritories(childTerritoryIdToTerritories.keySet(), 1);
        
        System.Debug('FIND ME purgeManuallyAssignedAccountsFromChildrenTerritories(Id parentTerritoryId) - parentTerritoryId: '+parentTerritoryId);
        System.Debug('FIND ME purgeManuallyAssignedAccountsFromChildrenTerritories(Id parentTerritoryId) - manuallyAssignedAccountsToDelete: '+manuallyAssignedAccountsToDelete);

        //Delete all of the manually assigned account associations.
        delete manuallyAssignedAccountsToDelete;
    }

    //This method is intended to recursively traverse the family tree of territories, finding all the children of the specified parent territories, then finding all of THEIR
    //children down as far as 7 generations. At each generational step, we find all the manually assigned accounts associated and add them to our growing list. Each generation's
    // list is combined and then the complete list of manually assigned accounts is returned.
    public static List<ObjectTerritory2Association> purgeManuallyAssignedAccountsFromChildrenTerritories(Set<Id> parentTerritoryIdList, Integer generation) {
        List<ObjectTerritory2Association> manuallyAssignedAccountsToDelete = new List<ObjectTerritory2Association>();
        
        //If this is the first generation, be sure to grab the manually assigned accounts associated with the children territories. They'll get overlooked if we don't since the
        //code is always looking at the next generation's data rather than it's own.
        if(generation == 1 && parentTerritoryIdList.size() > 0) {
            List<ObjectTerritory2Association> temp = new List<ObjectTerritory2Association>();
            
            temp = [SELECT Id 
                    FROM ObjectTerritory2Association 
                    WHERE AssociationCause = 'Territory2Manual' 
                    AND Territory2Id IN :parentTerritoryIdList];
                    
            manuallyAssignedAccountsToDelete.addAll(temp);
        }
    
        //Find all of the children territories related to the parent territories passed in.
        Map<Id, Territory2> childTerritoryIdToTerritories = new Map<Id, Territory2>([SELECT Id, ParentTerritory2Id FROM Territory2 WHERE ParentTerritory2Id IN :parentTerritoryIdList]);
        
        //If we haven't exceeded the 7th generation and any children territories were found...
        if(generation <= 7 && childTerritoryIdToTerritories.size() > 0) {
            List<ObjectTerritory2Association> temp = new List<ObjectTerritory2Association>();
        
            //...then find all the manually assigned accounts associated with those children territories.
            temp = [SELECT Id 
                    FROM ObjectTerritory2Association 
                    WHERE AssociationCause = 'Territory2Manual' 
                    AND Territory2Id IN :childTerritoryIdToTerritories.keySet()];
                    
            manuallyAssignedAccountsToDelete.addAll(temp);

            //Now look for the next generation's manually assigned accounts, add them to this generation's.                                                                                    
            manuallyAssignedAccountsToDelete.addAll(purgeManuallyAssignedAccountsFromChildrenTerritories(childTerritoryIdToTerritories.keySet(), generation + 1));
        }
        
        System.Debug('FIND ME purgeManuallyAssignedAccountsFromChildrenTerritories(Set<Id> parentTerritoryIdList, Integer generation) - generation: '+generation);
        System.Debug('FIND ME purgeManuallyAssignedAccountsFromChildrenTerritories(Set<Id> parentTerritoryIdList, Integer generation) - parentTerritoryIdList: '+parentTerritoryIdList);
        System.Debug('FIND ME purgeManuallyAssignedAccountsFromChildrenTerritories(Set<Id> parentTerritoryIdList, Integer generation) - manuallyAssignedAccountsToDelete: '+manuallyAssignedAccountsToDelete);
        
        //return all of the manually assigned accounts associated with this and subsequent generations of territories.
        return manuallyAssignedAccountsToDelete;
    }
    
    //This method finds all the manually assigned accounts associated with the specified territory and deletes them; specifically, the ObjectTerritory2Association entries
    //connecting the territory to the accounts themselves are deleted.
    public static void purgeManuallyAssignedAccountsFromTerritory(Id territoryId) {
        List<ObjectTerritory2Association> manuallyAssignedAccountsToDelete = new List<ObjectTerritory2Association>();
        
        manuallyAssignedAccountsToDelete = [SELECT Id FROM ObjectTerritory2Association WHERE AssociationCause = 'Territory2Manual' AND Territory2Id = :territoryId];
    
        System.Debug('FIND ME purgeManuallyAssignedAccountsFromTerritory(Id territoryId) - territoryId: '+territoryId);
        System.Debug('FIND ME purgeManuallyAssignedAccountsFromTerritory(Id territoryId) - manuallyAssignedAccountsToDelete: '+manuallyAssignedAccountsToDelete);

        delete manuallyAssignedAccountsToDelete;
    }

}