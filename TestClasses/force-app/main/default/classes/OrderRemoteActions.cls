/**
* @author: Stepan Ruzicka
* @email: stepan.ruzicka@cz.ibm.com
* @date: 04/11/2019
* @descriptin: Class implements VlocityOpenInterface2 and contains remote actions used by OmniScripts related to Order sObject
* @name OrderRemoteActions.cls
*/

global class OrderRemoteActions implements vlocity_cmt.VlocityOpenInterface {
    private static final String ERROR_KEY = 'error';
    private static final String SUCCESS_KEY = 'success';
    private static final String ORDER_KEY = 'OrderId';
    private static final String FILTER_KEY = 'filter';
    private static final String SUFFIX_KEY = 'suffix';
    private static final String ERROR_MESSAGE_METHOD = 'Method {METHOD} doesn\'t exist!';
    private static final String ERROR_MESSAGE_INPUT = '{ORDER_KEY} is required parameter!';

    global Boolean invokeMethod(String methodName, Map<String, Object> inputMap, Map<String, Object> outputMap, Map<String, Object> options) {
        switch on methodName {
            when 'getOrderAttributesByTypeAndLocation' {
                return this.getOrderAttributesByTypeAndLocation(inputMap, outputMap);
            }
            when 'getOrderAttributesGroupedByLocationList' {
                return this.getOrderAttributesGroupedByLocationList(inputMap, outputMap, options);
            }
            when 'getOrderAttributesGroupedByLocationList2' {
                return this.getOrderAttributesGroupedByLocationList2(inputMap, outputMap, options);
            }
            when else {
                // log error
                outputMap.put(ERROR_KEY, ERROR_MESSAGE_METHOD.replace('{METHOD}', methodName));
                return false;
            }
        }
    }

    private Boolean getOrderAttributesByTypeAndLocation(Map<String, Object> inputMap, Map<String, Object> outputMap){
        String orderId;
        OrderService orderService = new OrderService();
        if(inputMap.containsKey(ORDER_KEY)){
            orderId = (Id) inputMap.get(ORDER_KEY);
            try{
                outputMap.put(SUCCESS_KEY, orderService.getOrderAttributesByLocationMap(orderId));
            }catch(Exception e){
                outputMap.put(ERROR_KEY, e.getMessage());
                return false;
            }
            return true;
        }else{
            outputMap.put(ERROR_KEY, ERROR_MESSAGE_INPUT.replace('{ORDER_KEY}', ORDER_KEY));
            return false;
        }
    }

    private Boolean getOrderAttributesGroupedByLocationList(Map<String, Object> inputMap, Map<String, Object> outputMap, Map<String, Object> options){
        String orderId;
        String filter;
        String suffix;
        OrderService orderService = new OrderService();
        if(options.containsKey(ORDER_KEY)){
            orderId = (Id) options.get(ORDER_KEY);
            if(options.containsKey(FILTER_KEY)){
                filter = (String) options.get(FILTER_KEY);
            }
            if(options.containsKey(SUFFIX_KEY)){
                suffix = (String) options.get(SUFFIX_KEY);
            }

            try{
                if(filter == null){
                    outputMap.put(SUCCESS_KEY, orderService.getOrderAttributesGroupedByLocationList(orderId));
                }else{
                    outputMap.put(SUCCESS_KEY, orderService.getOrderAttributesGroupedByLocationList(orderId, filter, suffix));
                }
            }catch(Exception e){
                outputMap.put(ERROR_KEY, e.getMessage());
                return false;
            }
            return true;
        }else{
            outputMap.put(ERROR_KEY, ERROR_MESSAGE_INPUT.replace('{ORDER_KEY}', ORDER_KEY));
            return false;
        }
    }

    private Boolean getOrderAttributesGroupedByLocationList2(Map<String, Object> inputMap, Map<String, Object> outputMap, Map<String, Object> options){
        String orderId;
        String filter;
        String suffix;
        OrderService orderService = new OrderService();
        if(options.containsKey(ORDER_KEY)){
            orderId = (Id) options.get(ORDER_KEY);
            if(options.containsKey(FILTER_KEY)){
                filter = (String) options.get(FILTER_KEY);
            }
            if(options.containsKey(SUFFIX_KEY)){
                suffix = (String) options.get(SUFFIX_KEY);
            }

            try{
                if(filter == null){
                    outputMap.put(SUCCESS_KEY, orderService.filterOrderAttributesNotContaining(orderService.getOrderAttributesGroupedByLocationList(orderId), 'EVC'));
                }else{
                    outputMap.put(SUCCESS_KEY, orderService.filterOrderAttributesNotContaining(orderService.getOrderAttributesGroupedByLocationList(orderId, filter, suffix), 'EVC'));
                }
            }catch(Exception e){
                outputMap.put(ERROR_KEY, e.getMessage());
                return false;
            }
            return true;
        }else{
            outputMap.put(ERROR_KEY, ERROR_MESSAGE_INPUT.replace('{ORDER_KEY}', ORDER_KEY));
            return false;
        }
    }
}