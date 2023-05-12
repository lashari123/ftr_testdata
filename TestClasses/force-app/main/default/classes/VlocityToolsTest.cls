/**
* @author Sean Fife
* @date 2 Nov 2019
* @group Vlocity Component Implementations
* @description Test class for Custom functions unavailable to Vlocity Components
*/ 
@isTest
public class VlocityToolsTest {

    testmethod static void TestReplace()
    {
        Map<string, object> inputMap = new Map<string, object>();
        Map<string, object> outputMap = new Map<string, object>();
        Map<string, object> options = new Map<string, object>();


        Map<string, object> GetDSATAddressDetails = new Map<string, object>();

        List<string> products = new List<string>();
        products.add('EIA');
        products.add('EVPL');
        products.add('ELAN');
        products.add('IPVPN');
        products.add('Jumbo Frames');
        products.add('EPL');
        products.add('Connect Cloud');
        products.add('EPath');
        products.add('EReach');

        GetDSATAddressDetails.put('Products', products);
        //GetDSATAddressDetails.put('value', '["EIA","EVPL","ELAN","IPVPN","Jumbo Frames","EPL","Connect Cloud","EPath","EReach"]');
        //GetDSATAddressDetails.put('target','[,],\"');
        //GetDSATAddressDetails.put('replacement','');

        inputMap.put('GetDSATAddressDetails',GetDSATAddressDetails);

        system.debug(inputMap);


        VlocityTools.invokeMethod('reformatproducts', GetDSATAddressDetails, outputMap, options);
        
        system.debug(outputMap.get('value'));

        System.assertEquals(outputMap.get('value').toString(),'EIA,EVPL,ELAN,IPVPN,Jumbo Frames,EPL,Connect Cloud,EPath,EReach' );
    }

    testmethod static void BadMethod()
    {
        VlocityTools.invokeMethod('replace', null, null, null);
    }
}