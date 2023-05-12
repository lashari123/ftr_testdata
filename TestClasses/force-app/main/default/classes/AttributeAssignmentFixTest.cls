@isTest(SeeAllData=TRUE)
public class AttributeAssignmentFixTest {
    
    @isTest
    public static void testPicklistFix() {
        Boolean refreshProdsJSONAttr = true;
        List<Id> productIds = new List<Id>();
        for (Product2 prod : [ Select Id from Product2 where vlocity_cmt__ObjectTypeId__c != null limit 1 ]) {
            productIds.add(prod.Id);
        }
        Test.startTest();
        Database.executeBatch(new FixPicklistValuesUpdateJSON(productIds, refreshProdsJSONAttr));
        Test.stopTest();
    }
}