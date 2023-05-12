@isTest(seeAllData = true)
private class OrderTriggerTest {
       
    static testMethod void Create_New_Order() {

        // Initialize setup variables
        String objectName = 'Order';  // modify as needed
        String query = 'SELECT';
        Map<String, Schema.SObjectField> objectFields = Schema.getGlobalDescribe().get(objectName).getDescribe().fields.getMap();
        
        // Grab the fields from the describe method and append them to the queryString one by one.
        for(String s : objectFields.keySet()) {
           query += ' ' + s + ', ';
        }
        
        // Strip off the last comma if it exists.
        if (query.subString(query.Length()-2,query.Length()) == ', ') {
            query = query.subString(0,query.Length()-2);
        }
        
        // Add FROM statement
        query += ' FROM ' + objectName;
        
        // Add on a WHERE/ORDER/LIMIT statement as needed
        query += ' WHERE OpportunityId != NULL AND Opportunity.RecordTypeId = \''+ Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Memo Read only').getRecordTypeId() +'\' ORDER BY createddate DESC LIMIT 1';
         
        List<Order> orders = new List<Order>();
        try {
                orders = database.query(query);
        } catch (QueryException e){
                //perform exception handling
        }
        
        if(orders != null && orders.size() > 0) {

            Order testOrder = orders[0];
            testOrder.Id = null;
            insert testOrder;
            
            testOrder.PoDate = System.Today();
            update testOrder;
                        
            delete testOrder;
        }
    }
}