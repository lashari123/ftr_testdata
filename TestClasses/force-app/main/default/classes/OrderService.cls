/**
* @author: Stepan Ruzicka
* @email: stepan.ruzicka@cz.ibm.com
* @date: 04/11/2019
* @descriptin: Class implements methods related to OrderItem sObject which can be used from anywhere - trigger, batch, webservice etc.
* @name OrderService.cls
*/
public class OrderService{
    public List<Object> getOrderAttributesGroupedByLocationList(Id orderId){
        return getOrderAttributesGroupedByLocationList(orderId, null, null);
    }

    public List<Object> filterOrderAttributesNotContaining(List<Object> orderAttributesGroupedByLocationList, String filterString){
        Boolean mapContainsKey;
        Integer i = 0;
        List<Integer> indexList = new List<Integer>();
        for(Object orderAttributesItem: orderAttributesGroupedByLocationList){
            mapContainsKey = false;
            Map<String, String> orderAttributesMap = (Map<String, String>)orderAttributesItem;
            for(String key: orderAttributesMap.keySet()){
                List<String> filterKeywordList = filterString.split(':');
                for(String filterKeyword: filterKeywordList){
                    if(key.contains(filterKeyword)){
                        mapContainsKey = true;
                        break;
                    }
                }
                if(mapContainsKey) break;
            }
            if(!mapContainsKey){
                indexList.add(i);
            }
            i = i + 1;
        }

        Integer difference = 0;
        for(Integer index: indexList){
            orderAttributesGroupedByLocationList.remove(index - difference);
            difference = difference + 1;
        }
        return orderAttributesGroupedByLocationList;
    }

    public List<Object> getOrderAttributesGroupedByLocationList(Id orderId, String attributeTypeFilter, String suffix){
        Map<String, Object> attributesByLocationMap;
        Map<String, String> attribute;
        List<Object> resultList;
        String location, attributeType;

        List<OrderItem> orderItemList =
                                [SELECT
                                    Id,
                                    vlocity_cmt__ItemName__c,
                                    vlocity_cmt__Product2Id__r.ProductCode,
                                    Premise_Detail__c,
                                    vlocity_cmt__AssetReferenceId__c,
                                    vlocity_cmt__ServiceAccountId__r.Name,
                                    vlocity_cmt__JSONAttribute__c,
                                    vlocity_cmt__ReliesOnItemId__c
                                 FROM OrderItem
                                 WHERE OrderId =: orderId];

        attributesByLocationMap = new Map<String, Object>();
        for(OrderItem orderItem: orderItemList){
            attribute = transformOrderItemToAttribute(orderItem, suffix);
            if(attribute != null){
                location = attribute.get('location');
                attribute.remove('location');
                attributeType = attribute.get('attributeType');
                attribute.remove('attributeType');
                if(attributeTypeFilter == null){
                    if(!attributesByLocationMap.containsKey(location)){
                        attributesByLocationMap.put(location, attribute);
                    }else{
                        ((Map<String, Object>) attributesByLocationMap.get(location)).putAll((Map<String,String>)attribute);
                    }
                }else if(attributeTypeFilter.contains(attributeType)){
                    if(!attributesByLocationMap.containsKey(location)){
                        attributesByLocationMap.put(location, attribute);
                    }else{
                        ((Map<String, Object>) attributesByLocationMap.get(location)).putAll((Map<String,String>)attribute);
                    }
                }else{
                    // ignore
                }
            }            
        }

        resultList = new List<Object>();
        for(String key: attributesByLocationMap.keySet()){
            resultList.add(attributesByLocationMap.get(key));
        }
        return resultList;
    }


    public List<Object> getOrderAttributes(Id orderId){
        return getOrderAttributes(orderId, null, null);
    }

    public List<Object> getOrderAttributes(Id orderId, String attributeTypeFilter, String suffix){
        List<Object> aggregatedAttributeListTemp = new List<Object>();
        Map<String, Object> attributesByAttributeTypeMap;

        // get original structure
        Map<String, Object> attributesByAttributeTypeAndLocationMap = getOrderAttributesByTypeAndLocationMap(orderId, suffix);
        // order attributes by type and location, key is the location
        for(String key: attributesByAttributeTypeAndLocationMap.keySet()){
            // order attributes by type, key2 is the attribute type
            attributesByAttributeTypeMap = (Map<String,Object>)attributesByAttributeTypeAndLocationMap.get(key);
            for(String key2: attributesByAttributeTypeMap.keySet()){
                System.debug(key2);
                if(attributeTypeFilter == null){
                    aggregatedAttributeListTemp.addAll((List<Object>)attributesByAttributeTypeMap.get(key2));
                }else if(attributeTypeFilter.contains(key2)){
                    aggregatedAttributeListTemp.addAll((List<Object>)attributesByAttributeTypeMap.get(key2));
                }else{
                    // method was called with filter but the key didn't match the value => don't add anything
                }
            }
        }
        return aggregatedAttributeListTemp;
    }

    public Map<String, Object> getOrderAttributesByLocationMap(Id orderId){
        return getOrderAttributesByLocationMap(orderId, null, null);
    }
    /**
    * Temporary method used to flatten the structure in order to be able to use the standard vlocity template.
    * It should be deprecated after new template is ready and is able to handle the structure (which is more convenient).
    * @param orderId    Id of order to which the attributes are related to.
    * @return           Map of lists of value-pair attributes
    */
    public Map<String, Object> getOrderAttributesByLocationMap(Id orderId, String attributeTypeFilter, String suffix){
        Map<String, Object> attributesByAttributeLocationMap = new Map<String, Object>();
        List<Object> aggregatedAttributeListTemp = new List<Object>();
        Map<String, Object> attributesByAttributeTypeMap;

        // get original structure
        Map<String, Object> attributesByAttributeTypeAndLocationMap = getOrderAttributesByTypeAndLocationMap(orderId, suffix);
        // order attributes by type and location, key is the location
        for(String key: attributesByAttributeTypeAndLocationMap.keySet()){
            // order attributes by type, key2 is the attribute type
            attributesByAttributeTypeMap = (Map<String,Object>)attributesByAttributeTypeAndLocationMap.get(key);
            for(String key2: attributesByAttributeTypeMap.keySet()){
                System.debug(key2);
                if(attributeTypeFilter == null){
                    aggregatedAttributeListTemp.addAll((List<Object>)attributesByAttributeTypeMap.get(key2));
                }else if(attributeTypeFilter.contains(key2)){
                    aggregatedAttributeListTemp.addAll((List<Object>)attributesByAttributeTypeMap.get(key2));
                }else{
                    // method was called with filter but the key didn't match the value => don't add anything
                }
            }
            if(aggregatedAttributeListTemp.size() > 0){
                attributesByAttributeLocationMap.put(key, aggregatedAttributeListTemp);
            }
            aggregatedAttributeListTemp = new List<Object>();
        }
        return attributesByAttributeLocationMap;
    }

    /**
    * Method gets a map structure which is supposed to be converted to json and used by Vlocity OmniScript (OrderEnrichment)
    * @param orderId    Id of order to which the attributes are related to.
    * @return           Map of lists of value-pair attributes
    */
    public Map<String, Object> getOrderAttributesByTypeAndLocationMap(Id orderId, String suffix){
        Map<String, Object> attributesByAttributeTypeAndLocationMap;
        Map<String, Object> attributesByAttributeTypeMap;
        Map<String, String> attribute;
        String location, attributeType;

        List<OrderItem> orderItemList =
                                [SELECT
                                    Id,
                                    vlocity_cmt__ItemName__c,
                                    vlocity_cmt__Product2Id__r.ProductCode,
                                    Premise_Detail__c,
                                    vlocity_cmt__AssetReferenceId__c,
                                    vlocity_cmt__ServiceAccountId__r.Name,
                                    vlocity_cmt__JSONAttribute__c,
                                    vlocity_cmt__ReliesOnItemId__c
                                 FROM OrderItem
                                 WHERE OrderId =: orderId];

        attributesByAttributeTypeAndLocationMap = new Map<String, Object>();
        for(OrderItem orderItem: orderItemList){
            attribute = transformOrderItemToAttribute(orderItem, suffix);
            if(attribute != null){
                location = attribute.get('location');
                attribute.remove('location');
                attributeType = attribute.get('attributeType');
                attribute.remove('attributeType');
                if(!attributesByAttributeTypeAndLocationMap.containsKey(location)){
                    attributesByAttributeTypeMap = new Map<String, Object>();
                    attributesByAttributeTypeAndLocationMap.put(location, (Object) attributesByAttributeTypeMap);
                }else{
                    attributesByAttributeTypeMap = (Map<String, Object>) attributesByAttributeTypeAndLocationMap.get(location);
                }

                if(attributesByAttributeTypeMap.containsKey(attributeType)){
                    ((List<Object>)attributesByAttributeTypeMap.get(attributeType)).add((Object)attribute);
                }else{
                    attributesByAttributeTypeMap.put(attributeType, new List<Object>{attribute});
                }
            }            
        }

        if(attributesByAttributeTypeAndLocationMap.keySet().size() == 0){
            attributesByAttributeTypeAndLocationMap = null;
        }
        return attributesByAttributeTypeAndLocationMap;
    }

    private Map<String, String> transformOrderItemToAttribute(OrderItem orderItem, String suffix){
        Map<String, String> resultMap;
        String attributeType;
        final Map<String, String> translationMap = new Map<String, String>{
                                                    'ENT_ETH_UNI_0001' => 'UNI',
                                                    'ENT_ETH_EVC_0001' => 'EVC',
                                                    'ENT_ETH_ACCESS_0001' => 'ACCESS',
                                                    'ENT_ETH_IP_0001' => 'IP'
                                             };

        if(suffix == null){
            suffix = '';
        }

        if(translationMap.containsKey(orderItem.vlocity_cmt__Product2Id__r.ProductCode)){
            attributeType = translationMap.get(orderItem.vlocity_cmt__Product2Id__r.ProductCode);

            resultMap = new Map<String, String>{
                'location' => orderItem.Premise_Detail__c,
                'attributeType' => attributeType,
                attributeType + '_Location' + suffix => orderItem.Premise_Detail__c,
                attributeType + '_AttributeType' + suffix => attributeType,
                attributeType + '_OrderItemId' + suffix => orderItem.Id,
                attributeType + '_ReferenceId' + suffix => orderItem.vlocity_cmt__AssetReferenceId__c,
                attributeType + '_ServiceAccountName' + suffix => orderItem.vlocity_cmt__ServiceAccountId__r.Name,
                attributeType + '_ReliesOn' + suffix => orderItem.vlocity_cmt__ReliesOnItemId__c,
                attributeType + '_Name' + suffix => orderItem.vlocity_cmt__ItemName__c
            };

            // attributes
            Map<String, Object> attributesMap = (Map<String, Object>) JSON.deserializeUntyped(orderItem.vlocity_cmt__JSONAttribute__c);
            List<Object> attributeList;
            String attributeName, attributeValue;
            Map<String, Object> attributeMap;
            for(String key: attributesMap.keySet()){
                attributeList = (List<Object> ) attributesMap.get(key);
                for(Object attribute: attributeList){
                    //attributeName = (String)((Map<String, Object>) attribute).get('attributeuniquecode__c');
                    //attributeValue = (String)((Map<String, Object>) attribute).get('value__c');
                    attributeName = (String) getMapValue((Map<String, Object>) attribute, 'attributeuniquecode__c');
                    attributeValue = (String) getMapValue((Map<String, Object>) attribute, 'value__c');
                    
                    if(attributeValue == null){
                        attributeMap = (Map<String, Object> ) getMapValue((Map<String, Object>) attribute, 'attributeRunTimeInfo');
                        attributeValue = (String) String.valueOf(getMapValue((Map<String, Object>) attributeMap, 'value'));
                        /*
                        if((String) getMapValue((Map<String, Object>) attributeMap, 'dataType') == 'Text'){
                            attributeValue = (String) getMapValue((Map<String, Object>) attributeMap, 'value');
                        }else if((String) getMapValue((Map<String, Object>) attributeMap, 'dataType') == 'Checkbox'){
                            attributeValue = (String) String.valueOf(getMapValue((Map<String, Object>) attributeMap, 'value'));
                        }
                        */
                    }
                    resultMap.put(attributeType + '_' + attributeName, attributeValue);
                }
            }
        }
        return resultMap;
    }


    public Object getMapValue(Map<String, Object> jsonMap, String attributeName){
        Object attributeValue;
        if(jsonMap.containsKey(attributeName)){
            attributeValue = jsonMap.get(attributeName);
        }
        return attributeValue;
    }
}