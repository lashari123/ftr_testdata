/**
* @author Sean Fife
* @date 2 Nov 2019
* @group Vlocity Component Implementations
* @description Custom functions unavailable to Vlocity Components
*/ 
global class VlocityTools implements vlocity_cmt.VlocityOpenInterface {

    global static Boolean invokeMethod(String methodName, Map<String, Object> inputMap, Map<String, Object> outputMap, Map<String, Object> options) 
    {
        if (methodName.equalsIgnoreCase('reformatproducts'))
        {
            ReformatProducts(inputMap, outputMap);
            return true;
        }
        
        return false;
    }
    
    private static void ReformatProducts(Map<String, Object> inputMap, Map<String, Object> outputMap)
    {
        system.debug(inputMap);

        List<object> objproducts = (List<object>)inputMap.get('Products');
        if(objproducts == null)
        {
            outputMap.put('value', 'None');
            return;
        }
     
        List<string> products = new List<string>();
        for(integer i = 0; i<objproducts.size(); i++)
        {
            products.add(objproducts[i].toString());
        }
        
        
        outputMap.put('value', string.join(products, ','));
    }
   
}