@isTest(seeAllData = true)
public class OrderUtilityTest {
    public static testMethod void testOrderUtility() {

test.starttest();
        
        List<ObjectTerritory2Association> accountTerritories = [SELECT id, IsDeleted, Territory2Id, objectId, territory2.POD_Assignment__c 
                                                                FROM ObjectTerritory2Association 
                                                                WHERE IsDeleted = false
                                                                AND object.type = 'Account'
                                                                LIMIT 50];
                                                                
        List<Order> orderList = [SELECT id, ownerid, Order_Stage__c, CreatedDate, Is_this_an_E_Reach_Off_Net_Ethernet__c, createdbyid, ContractId, Product__c, Broadband_Queue_Assignment__c, AccountId, Description, CPE_DCS__c, Hot_Cut__c, VoIP_Translations__c, CPE_COE__c, Broadband_COE__c 
                                        FROM Order
                                        WHERE Order_Stage__c != 'Complete' AND Is_this_an_E_Reach_Off_Net_Ethernet__c = '' AND (CPE_DCS__c != null OR Hot_Cut__c != null OR VoIP_Translations__c != null OR CPE_COE__c != null OR Broadband_COE__c != null) 
                                        ORDER BY CreatedDate DESC NULLS LAST 
                                        LIMIT 1];
        
        List<Order> ordersToUpdate = new List<Order>();
        Integer counter = 0;
        for(Order ord : orderList) {
            Order ordTemp = ord;
            ordTemp.description = System.Now() + '';
            //ordTemp.CPE_DCS__c = ordTemp.ownerid;
            ordTemp.CPE_DCS__c = UserInfo.getUserId();
            //ordTemp.Hot_Cut__c = ordTemp.ownerid;
            ordTemp.Hot_Cut__c = UserInfo.getUserId();
            //ordTemp.VoIP_Translations__c = ordTemp.ownerid;
            ordTemp.VoIP_Translations__c = UserInfo.getUserId();
            //ordTemp.CPE_COE__c = ordTemp.ownerid;
            ordTemp.CPE_COE__c = UserInfo.getUserId();
            //ordTemp.Broadband_COE__c = ordTemp.ownerid;
            ordTemp.Broadband_COE__c = UserInfo.getUserId();
            ordTemp.ContractId = null;
            ordTemp.OwnerId = UserInfo.getUserId();
            if(accountTerritories != null && accountTerritories.size() > 0) {                
                ordTemp.AccountId = accountTerritories[counter].objectId;
                
                counter++;
                if(counter >= accountTerritories.size()) {
                    counter = accountTerritories.size() - 1;
                }
            }
            
            ordersToUpdate.add(ordTemp);
        }
        
        if(ordersToUpdate != null && ordersToUpdate.size() > 0) {
            update ordersToUpdate;
        }
        
        List<Order> ordersToUpdate2 = new List<Order>();
        for(Order ord : ordersToUpdate) {
            if(accountTerritories != null && accountTerritories.size() > 0) {
                Order ordTemp = ord;
                ordTemp.CPE_DCS__c = ordTemp.createdbyid;
                ordTemp.Hot_Cut__c = ordTemp.createdbyid;
                ordTemp.VoIP_Translations__c = ordTemp.createdbyid;
                ordTemp.CPE_COE__c = ordTemp.createdbyid;
                ordTemp.Broadband_COE__c = ordTemp.createdbyid;
                                
                ordersToUpdate2.add(ordTemp);
            }
        }
        
        if(ordersToUpdate2 != null && ordersToUpdate2.size() > 0) {
            update ordersToUpdate2;
        }
        
        List<Order> modifiedOrders = new List<Order>();
        
        String SobjectApiName = 'Order';
        Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
        Map<String, Schema.SObjectField> fieldMap = schemaMap.get(SobjectApiName).getDescribe().fields.getMap();
        String commaSepratedFields = '';
        for(String fieldName : fieldMap.keyset()){
            if(commaSepratedFields == null || commaSepratedFields == ''){
                commaSepratedFields = fieldName;
            }else{
                commaSepratedFields = commaSepratedFields + ', ' + fieldName;
            }
        }
 
        String query = 'select ' + commaSepratedFields + ' from ' + SobjectApiName + ' ORDER BY LastModifiedDate DESC Limit 1';
        modifiedOrders = Database.query(query); 
        
        List<Order> ordersToInsert = new List<Order>();
        for(Order ord : modifiedOrders) {
            ord.Id = null;
            ordersToInsert.add(ord);
        }
        
        if(ordersToInsert != null && ordersToInsert.size() > 0) {
            insert ordersToInsert;
        } 
test.stoptest();
    }
}