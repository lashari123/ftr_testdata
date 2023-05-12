public class C2FAccountController {
    public ApexPages.StandardController stdController;
    public Account act {get; set;}
    public String fiberOwnership {get; set;}
    public String accessMedium {get; set;}
    public String latitude {get; set;}
    public String longitude {get; set;}
    public String fiberProductTier {get; set;}
    public String fiberDistanceFeet {get; set;}
    
    public C2FAccountController() {
    }
    
    public C2FAccountController(ApexPages.StandardController stdController) {
        act = (Account) stdController.getRecord();
        
        String SobjectApiName = 'Account';
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
        
        String query = 'select ' + commaSepratedFields + ' from ' + SobjectApiName + ' WHERE id = \''+act.Id+'\'';
        act = Database.query(query);

        if(act.shippingAddress != null) {
            String parameters = '?companyId=819&address=' + act.shippingStreet + ', ' + act.shippingState + ' ' + act.shippingPostalCode + ' ' + act.shippingCountry;
            parameters = parameters.replace(' ', '+');
        
            HttpRequest req = new HttpRequest();
            req.setEndpoint('https://api.connected2fiber.com/v1/buildings/'+parameters);
            req.setMethod('GET');
            
            req.setHeader('Ocp-Apim-Subscription-Key', 'de559e82f9a74fc799adc59d0765f987');
            
            String resBody = '';
            if(!Test.isRunningTest()) {
                Http http = new Http();
                HTTPResponse res = http.send(req);
                System.debug(res.getBody());
    
                resBody = res.getBody();
            } else {
                resBody = '{"total":1,"page":0,"results":[{"id":"323765791","buildingname":"2796 Tanger Way","street":"2796 Tanger Way","country":"United States","state":"California","city":"Barstow","postal":"92311","msaname":"PORTLAND-VANCOUVER-HILLSBORO, OR-WA","latitude":"45.543696","longitude":"-122.474854","primaryNumber":"2796","streetName":"Tanger","streetSuffix":"Way","plus4Code":"9414","buildingCategory":["Commercial Building"],"networkBuildStatus":"Connected","buildingConnectionStatus":"OnNet","cllicode":"GRHMORXBCG1","lata":"672","accessMediums":["Fiber"],"c2fbuildingnumber":"2796_TANGER_WAY&#124;BARSTOW&#124;CA","fiberOwnership":"Built","elevation":0.0,"provider":"FRONTIER","npa":"503","nxx":"465","npanxx":"503-465","buildingClli":"BRSWCAFF0DW","uniqueKey":"OZ99-819-21430f43","customField":{"litpublisheddate":"4/1/2018","fiberproducttier":"2","fiberdistancefeet":"3273.6"},"distanceBandValue":"1501+ feet"}]}';
            }
            
            if(resBody.indexOf('fiberOwnership') >= 0) {
                fiberOwnership = resBody.substring(resBody.indexOf('fiberOwnership'));
                fiberOwnership = fiberOwnership.substring(0, fiberOwnership.indexOf(','));
                fiberOwnership = fiberOwnership.split(':')[1].replace('"', '');
                System.Debug(fiberOwnership);
            }
            
            if(resBody.indexOf('latitude') >= 0) {
                latitude = resBody.substring(resBody.indexOf('latitude'));
                latitude = latitude.substring(0, latitude.indexOf(','));
                latitude = latitude.split(':')[1].replace('"', '');
                System.Debug(latitude);
            }
            
            if(resBody.indexOf('longitude') >= 0) {
                longitude = resBody.substring(resBody.indexOf('longitude'));
                longitude = longitude.substring(0, longitude.indexOf(','));
                longitude = longitude.split(':')[1].replace('"', '');
                System.Debug(longitude);
            }
            
            if(resBody.indexOf('accessMediums') >= 0) {
                accessMedium = resBody.substring(resBody.indexOf('accessMediums'));
                accessMedium = accessMedium.substring(0, accessMedium.indexOf(','));
                accessMedium = accessMedium.split(':')[1].replace('"', '').replace('[', '').replace(']', '');
                System.Debug(accessMedium);
            }

            if(resBody.indexOf('fiberproducttier') >= 0) {            
                fiberProductTier = resBody.substring(resBody.indexOf('fiberproducttier'));
                fiberProductTier = fiberProductTier.substring(0, fiberProductTier.indexOf(','));
                fiberProductTier = fiberProductTier.split(':')[1].replace('"', '').replace('}', '');
                System.Debug(fiberProductTier);
            }

            if(resBody.indexOf('fiberdistancefeet') >= 0) {            
                fiberDistanceFeet = resBody.substring(resBody.indexOf('fiberdistancefeet'));
                fiberDistanceFeet = fiberDistanceFeet.substring(0, fiberDistanceFeet.indexOf(','));
                fiberDistanceFeet = fiberDistanceFeet.split(':')[1].replace('"', '').replace('}', '');
                System.Debug(fiberDistanceFeet);
            }
        }
    }
    
    public void updateAccountWithC2FData() {
        act.Latitude__c = latitude;
        act.Longitude__c = longitude;
        act.Access_Medium__c = accessMedium;
        act.Tier__c = fiberProductTier;
        act.distancetodirectedclli__c = null;
        if(fiberDistanceFeet != null) {
            act.distancetodirectedclli__c = Decimal.valueOf(fiberDistanceFeet);
        }
        
        update act;
    }
}