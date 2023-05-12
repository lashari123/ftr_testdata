/**
* @description Utility class 
*/  
global without sharing class ftr_CpqHelper {

    /*
     * @description return the configuration setting value from CPQ Configuration Setup
     */
    public static String getCpqConfigurationSetupValue(String setupName)
    {
        vlocity_cmt__CpqConfigurationSetup__c cpqSetup = vlocity_cmt__CpqConfigurationSetup__c.getInstance(setupName);
        String retval = null;
        if (cpqSetup != null
            //expected condition: there is a Custom Setting
            && cpqSetup.vlocity_cmt__SetupValue__c != null
            && cpqSetup.vlocity_cmt__SetupValue__c.length() > 0)
        {
            retval = cpqSetup.vlocity_cmt__SetupValue__c;
        }
        return retval;
    }


    /*
     * @description utiliy method to read the attribute value from JSONAttribute field
     */
    public static Map<String, Object> getJSONAttributeValues(String jsonAttribute) {
        vlocity_cmt.JSONAttributeSupport jsonSupport = new vlocity_cmt.JSONAttributeSupport();
        // Read the old speed
        Map<String, object> inputMap = new Map<String, object>{
            'UseDisplayTextForValues' => false,
            'JSONString' => jsonAttribute
        }; 
        Map<String, object> outputMap = new Map<String, object>(); 
        Map<String, object> optionsMap = new Map<String, object>();

        jsonSupport.invokeMethod('getAttributeValuesFromJSON', inputMap, outputMap, optionsMap); 
        Map<String, Object> attrVals = (Map<String, Object>)outputMap.get('attributeCodeToValue');
        return attrVals;
        // return attrVals.get(attribCode);
    }    

    /*
     * @description utiliy method to read the attribute value from JSONAttribute field
     */
    public static Object getJSONAttributeValue(String jsonAttribute, String attribCode) {
        return getJSONAttributeValues(jsonAttribute).get(attribCode);
        // vlocity_cmt.JSONAttributeSupport jsonSupport = new vlocity_cmt.JSONAttributeSupport();
        // // Read the old speed
        // Map<String, object> inputMap = new Map<String, object>{
        //     'UseDisplayTextForValues' => false,
        //     'JSONString' => jsonAttribute
        // }; 
        // Map<String, object> outputMap = new Map<String, object>(); 
        // Map<String, object> optionsMap = new Map<String, object>();

        // jsonSupport.invokeMethod('getAttributeValuesFromJSON', inputMap, outputMap, optionsMap); 
        // Map<String, Object> attrVals = (Map<String, Object>)outputMap.get('attributeCodeToValue');
        // return attrVals.get(attribCode);
    } 

    public static String setJSONAttribute(String runtimeJSON, String originalJSON, String code, Object val) {
        Map<String, Object> attrVals = new Map<String, Object> {
            code => val
        };
        return setJSONAttributes(runtimeJSON, originalJSON, attrVals);
    }
    public static String setJSONAttributes(String runtimeJSON, String originalJSON, Map<String, Object> attrVals) {
        List<vlocity_cmt.JSONAttributeSupport.JSONAttributeActionRequest> actionRequestsList = new List<vlocity_cmt.JSONAttributeSupport.JSONAttributeActionRequest>();
        for (String attrCode : attrVals.keySet()) {
            Object attrVal = attrVals.get(attrCode);

            actionRequestsList.add(new vlocity_cmt.JSONAttributeSupport.JSONAttributeActionRequest(
                attrCode, 
                vlocity_cmt.JSONAttributeSupport.ActionType.ASSIGN, 
                attrVal)
            );
        }

        vlocity_cmt.JSONAttributeSupport jsonSupport = new vlocity_cmt.JSONAttributeSupport();
        Map<String, Object> myInputMap = new Map<String, Object> {
            'objectSO' => null,
            'runTimeAttributesJSON' => runtimeJSON,
            'originalAttributesJSON' => originalJSON,
            'JSONAttributeActionRequestList' => actionRequestsList
        };
        Map<String, Object> myOutputMap = new Map<String, Object>();
        Map<String, Object> myOptionsMap = new Map<String, Object>();

        jsonSupport.invokeMethod('applyAttributeActions', myInputMap, myOutputMap, myOptionsMap);
        String modifiedJSON = (String)myOutputMap.get('modifiedJSON');

        return modifiedJSON;
    }    
    /*
     * @description utiliy method to set the value of attribute in JSONAttribute field of QuoteLineItem
     */
    public static List<QuoteLineItem> setQLIsAttribute(String attVal, List<QuoteLineItem> qLIs, String attCode) {
        vlocity_cmt.JSONAttributeSupport jsonSupport = new vlocity_cmt.JSONAttributeSupport();
            
        for (QuoteLineItem qLI : qLIs) {
            if(qLI.vlocity_cmt__JSONAttribute__c != null) {
                Map<String, Object> input = new Map<String, Object> {
                    'objectSO' => null,
                        'runTimeAttributesJSON' => qLI.vlocity_cmt__JSONAttribute__c,
                        'originalAttributesJSON' => '{}',
                        'JSONAttributeActionRequestList' => new List<vlocity_cmt.JSONAttributeSupport.JSONAttributeActionRequest> {
                            new vlocity_cmt.JSONAttributeSupport.JSONAttributeActionRequest(attCode, vlocity_cmt.JSONAttributeSupport.ActionType.ASSIGN, attVal)
                        }
                };
                    Map<String, Object> output = new Map<String, Object>();
                Map<String, Object> myoptions = new Map<String, Object>();
                jsonSupport.invokeMethod('applyAttributeActions', input, output, myoptions);
                qLI.vlocity_cmt__JSONAttribute__c = (String)output.get('modifiedJSON');
            }
        }
        
        return qLIs;
    }

     /*
     * @description utiliy method to set the value of attribute in JSONAttribute field of OrderItem
     */

    public static  Boolean   setOLIsAttribute(String attVal, List<OrderItem> oLIs, String attCode) {
        vlocity_cmt.JSONAttributeSupport jsonSupport = new vlocity_cmt.JSONAttributeSupport();
        Boolean isAttributeUpdated=false;
        ftr_Logger.writeInfo('Enter ftr_CpqHelper.setOLIsAttribute');
        try {
        for (OrderItem oLI : oLIs) {
            if(oLI.vlocity_cmt__JSONAttribute__c != null) {
                Map<String, Object> input = new Map<String, Object> {
                    'objectSO' => null,
                        'runTimeAttributesJSON' => oLI.vlocity_cmt__JSONAttribute__c,
                        'originalAttributesJSON' => '{}',
                        'JSONAttributeActionRequestList' => new List<vlocity_cmt.JSONAttributeSupport.JSONAttributeActionRequest> {
                            new vlocity_cmt.JSONAttributeSupport.JSONAttributeActionRequest(attCode, vlocity_cmt.JSONAttributeSupport.ActionType.ASSIGN, attVal)
                        }
                };
                    Map<String, Object> output = new Map<String, Object>();
                Map<String, Object> myoptions = new Map<String, Object>();
                jsonSupport.invokeMethod('applyAttributeActions', input, output, myoptions);
                oLI.vlocity_cmt__JSONAttribute__c = (String)output.get('modifiedJSON');
            }
        }
        update oLIs;
        isAttributeUpdated=true;
    }
    catch (Exception ex) {
        ftr_Logger.write(ex);
    } finally {
        ftr_Logger.writeInfo('Exit ftr_CpqHelper.setOLIsAttribute');
    }
    return isAttributeUpdated ;
    }

    /**
     * @description convert the Bandwidth to speed in MB
     */
    public static Integer convertToSpeed(String bandWidth) {
        if (bandWidth == null) return 0;

        if (bandWidth.endsWith('Mbps')) {
            return Integer.valueOf(bandWidth.left(bandWidth.length() - 4).trim());
        } else if (bandWidth.endsWith('MB')) {
            return Integer.valueOf(bandWidth.left(bandWidth.length() - 2).trim());
        } else if (bandWidth.endsWith('Gbps')) {
            return Integer.valueOf(bandWidth.left(bandWidth.length() - 4).trim()) * 1000;
        } else if (bandWidth.endsWith('GB')) {
            return Integer.valueOf(bandWidth.left(bandWidth.length() - 2).trim()) * 1000;
        } else if (bandWidth.endsWith('G')) {               // Added for HBE project by avv335
            return Integer.valueOf(bandWidth.left(bandWidth.length() - 1).trim()) * 1000;
        } else if (bandWidth.endsWith('GBPS')) {
            return Integer.valueOf(bandWidth.left(bandWidth.length() - 4).trim()) * 1000;
        } else if (bandWidth.endsWith('M')) {
            return Integer.valueOf(bandWidth.left(bandWidth.length() - 1).trim());
        } else{
            return 0;
        }
    }

    private static List<CustomCart_Data__mdt> bandWidthList = null;
    public static String convertToBandWidth(Integer speed) {
        if (bandWidthList == null) {
            bandWidthList = new List<CustomCart_Data__mdt>();
            bandWidthList = [SELECT MasterLabel, Bandwidth_Number__c, Copper_Enabled__c, Fiber_Enabled__c 
                             FROM CustomCart_Data__mdt
                             ORDER BY Bandwidth_Number__c];
        }

        String bandWidth;
        for (customCart_Data__mdt mdBandWidth : bandWidthList){
            if(speed <= mdBandWidth.Bandwidth_Number__c){
                bandWidth = mdBandWidth.MasterLabel;
                Break;
            }
        }
        return bandWidth;
    }
    
    
    @future
    public static void checkoutAsync(Id quoteId) {
        Map<String, Object> input = new Map<String, Object>();
        Map<String, Object> output = new Map<String, Object>();
        Map<String, Object> options = new Map<String, Object>();
        String methodName = 'checkout';
        input.put('cartId', quoteId);
        input.put('ContextId', quoteId);// Replace with Quote Id
        input.put('methodName', 'checkout');
        input.put('validate', true);
        input.put('price', true);
        input.put('classMethodName', methodName);
        vlocity_cmt.VOIInvoker invoker = vlocity_cmt.VOIInvoker.getInstance();
        Object invokeResult = true;
        if (!Test.isRunningTest()){
            invokeResult = invoker.invoke('CpqAppHandler', 'invokeClass', input, output, options);      
        }
    }

}