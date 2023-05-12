global with sharing class ftr_ProcessItemList implements vlocity_cmt.VlocityOpenInterface {
    global Boolean invokeMethod(String methodName, Map<String, Object> inputMap, Map<String, Object> outputMap, Map<String, Object> options) {
       
        List < Object > locationList = new List < Object > ();
        Map < String,Object > locationMap = new Map<String,Object> ();
        
        if (methodName == 'getBlockDetails') {
            
            system.debug('InputMap'+inputMap);
            
            
            String pbeId = (String)inputMap.get('PBEId');
            
            if(inputMap.get('location') instanceOf List<object>){
            locationList = (List<Object>)inputMap.get('location');
            } else{
                
               locationMap = (Map<String,Object>)inputMap.get('location');
            }
            
            
            Integer i = 1;
            List<Object> itemList = new List<Object>();
            
            if(locationList.size() > 0){
            
            for(Object loc : locationList) {
                system.debug('loc..'+loc);
                Map<String,Object> locMap = (Map<String,Object>)loc;

                Map<String,Object> fieldToUpdateMap = new Map<String,Object>{
                    'vlocity_cmt__ItemName__c' =>  'A-' + (String)locMap.get('LocationName'), //'A-' + (String)locMap.get('LocationName'), // 'UNI 1', //String.valueOf(i),
                    'vlocity_cmt__ServiceAccountId__c' => (String)locMap.get('Access_ServiceAccountId'),
                    'Quantity' => 1
                };
                
                Map<String,Object> itemMap = new Map<String,Object>{
                    'fieldsToUpdate' => fieldToUpdateMap,
                    'itemId' => pbeId 
                };
                
                itemList.add((Object)itemMap);
                i += 1;
                
            }
            }
            else{
                
                Map<String,Object> fieldToUpdateMap = new Map<String,Object>{
                    'vlocity_cmt__ItemName__c' =>  'A-' + (String)locationMap.get('LocationName'), // 'UNI 1', //String.valueOf(i),
                    'vlocity_cmt__ServiceAccountId__c' => (String)locationMap.get('Access_ServiceAccountId'),
                    'Quantity' => 1
                };
                    
                Map<String,Object> itemMap = new Map<String,Object>{
                    'fieldsToUpdate' => fieldToUpdateMap,
                    'itemId' => pbeId 
                };
                    
                     itemList.add((Object)itemMap);
                
            }
            
            outputMap.put('itemList',itemList);
            System.debug('outputMap..'+ outputMap);
            
            return true;
        }
        return true;
            
    }
            
}