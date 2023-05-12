public with sharing class FTRWSDSATAddressController {
    
    class FTRWSDSATAddressControllerException extends Exception {}
    
    public static String getBearer(){
        String Bearer;
        DSAT_Configuration__mdt i = DSAT_Configuration__mdt.getInstance('DSAT_Bearer');
        System.debug('ApiKey_Header__c'+i.ApiKey_Header__c);
        System.debug('Endpoint__c'+i.Endpoint__c);
        DSAT_Configuration__mdt dsatConfig =[Select id,Bearer__c,SandBox__c,Production__c from DSAT_Configuration__mdt where DeveloperName=:'DSAT_Bearer'];
        //Sanbox Bearer
        if(i.SandBox__c)
        Bearer = dsatConfig.Bearer__c;
       // Bearer = 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJDcmVhdGVkIjoiMjAxOS0xMC0zMFQxNDozMTozMS41NzQ1MDUyLTA0OjAwIiwiTmlja25hbWUiOiIsIFZGTyBBcHBsaWNhdGlvbiIsIkZpcnN0TmFtZSI6IlZGTyBBcHBsaWNhdGlvbiIsIkxhc3ROYW1lIjoiIiwiRW1haWxBZGRyZXNzIjoic3RhZ2VAc2lmdC50ZXN0IiwiTGFuSWQiOiJhcHA6IHZmbyBhcHBsaWNhdGlvbiIsIkdyb3VwSWRzIjpbMTcsMjNdLCJHcm91cE5hbWVzIjpbIkFwcGxpY2F0aW9ucyIsIlZGTyBBcHBsaWNhdGlvbiJdLCJSaWdodHMiOlszM10sIklkIjoyODM3NCwiVG9rZW5JZCI6MjQ2ODJ9.IccF4Ohx7Y67zoK7UO0izvX_Zkcrlpej6wCMR9RdA0U';
         //Production Bearer
        if(i.Production__c)
        Bearer = dsatConfig.Bearer__c;
       // Bearer = 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJDcmVhdGVkIjoiMjAxOS0xMC0zMFQxNDozMTozMS41NzQ1MDUyLTA0OjAwIiwiTmlja25hbWUiOiIsIFZGTyBBcHBsaWNhdGlvbiIsIkZpcnN0TmFtZSI6IlZGTyBBcHBsaWNhdGlvbiIsIkxhc3ROYW1lIjoiIiwiRW1haWxBZGRyZXNzIjoic3RhZ2VAc2lmdC50ZXN0IiwiTGFuSWQiOiJhcHA6IHZmbyBhcHBsaWNhdGlvbiIsIkdyb3VwSWRzIjpbMTcsMjNdLCJHcm91cE5hbWVzIjpbIkFwcGxpY2F0aW9ucyIsIlZGTyBBcHBsaWNhdGlvbiJdLCJSaWdodHMiOlszM10sIklkIjoyODM3NCwiVG9rZW5JZCI6MjQ2ODJ9.IccF4Ohx7Y67zoK7UO0izvX_Zkcrlpej6wCMR9RdA0U';
        
        HttpRequest req = new HttpRequest();
        req.setEndPoint(i.Endpoint__c);
        req.setMethod('GET');
        req.setTimeout(2 * 60 * 1000); 
        req.setHeader('Content-Type', 'application/json');
        req.setHeader('apikey', i.ApiKey_Header__c);
        req.setHeader('SIFT-Token', Bearer);
        Http httpCls = new Http();
        HttpResponse response = httpCls.send(req);
        if(response.getStatusCode() == 200){            
            String token = response.getBody().replace('"','');              
            return token;
        }
        else{
            System.debug('@failed StatusCode'+response.getStatusCode());
            System.debug('@failed StatusCode'+response.getStatus());
            return null;
        }
        
    }
    
    public static FTRWSDSATAddressResponse getDSATAddress(ftr_addressBeanDSAT quAdr){
        
        DSAT_Configuration__mdt i = DSAT_Configuration__mdt.getInstance('DSAT_Validation');
        HttpRequest req = new HttpRequest();
        req.setEndPoint(i.Endpoint__c);
        req.setMethod('POST');
        req.setTimeout(2 * 60 * 1000); 
        req.setHeader('Content-Type', 'application/json');
        req.setHeader('apikey', i.ApiKey_Header__c);
        String token = getBearer();
        req.setHeader('SIFT-Token', 'Bearer '+token); 
        //latlong only
        ftr_addressBeanDSAT latlong= new ftr_addressBeanDSAT();
        latlong.Latitude=quAdr.Latitude;
        latlong.Longitude=quAdr.Longitude;
        latlong.Address='';
        latlong.City='';
        latlong.State='';
        latlong.ZipCode='';
        String bodyLatLong= JSON.serialize(latlong);
        //lat long only
        String body= JSON.serialize(quAdr);
       // System.debug('@@@JSON Body'+body);
        req.setBody('{"QualifiedAddress":'+body+'}');
        Http httpCls = new Http();
        HttpResponse response = httpCls.send(req);
         if(response.getStatusCode() == 200){
            FTRWSDSATAddressResponse ftRespDsat= setRespData(response);
            return ftRespDsat;
        }
        else if(response.getStatusCode() == 500){
            req.setBody('{"QualifiedAddress":'+bodyLatLong+'}');
            Http httpClsLatLong = new Http();
            HttpResponse responseLatLong = httpClsLatLong.send(req);
            if(responseLatLong.getStatusCode() == 200){
                FTRWSDSATAddressResponse ftRespDsat= setRespData(responseLatLong);
                return ftRespDsat; 
            }
        else{
            System.debug('@failed StatusCode'+response.getStatusCode());
            System.debug('@failed StatusCode'+response.getStatus());
            return null;
       }
    }       
         else{
            System.debug('@failed StatusCode'+response.getStatusCode());
            System.debug('@failed StatusCode'+response.getStatus());
            return null;
        }
}
    public Static FTRWSDSATAddressResponse setRespData(HttpResponse response){
        
        system.debug('## Successfully retrieving DSAT_Addressn');
        
       // System.debug('@@Deserialised_Body'+(FTRWSDSATAddressResponseJson) System.JSON.deserialize(response.getBody(), FTRWSDSATAddressResponseJson.class));
        FTRWSDSATAddressResponseJson respoJsn = (FTRWSDSATAddressResponseJson) System.JSON.deserialize(response.getBody(), FTRWSDSATAddressResponseJson.class);
        FTRWSDSATAddressResponse ftRespDsat = new FTRWSDSATAddressResponse();
        ftRespDsat.dsatId= respoJsn.Id!=null?String.valueOf(respoJsn.Id):'';
        ftRespDsat.products = respoJsn.Products!=null?String.valueOf(respoJsn.Products):'';
        ftRespDsat.market=respoJsn.Market!=null?respoJsn.Market:'';
        ftRespDsat.level=respoJsn.Level!=null?respoJsn.Level:'';
        ftRespDsat.wireCenterQoS=respoJsn.WireCenterQoS!=null?respoJsn.WireCenterQoS:'';
        ftRespDsat.wireCenterCLLI=respoJsn.WireCenterCLLI!=null?respoJsn.WireCenterCLLI:'';
        // ftRespDsat.dastmaxspeed='';
        ftRespDsat.latitude=respoJsn.QualifiedAddress.Latitude!=null?String.valueOf(respoJsn.QualifiedAddress.Latitude):'';
        ftRespDsat.longitude=respoJsn.QualifiedAddress.Longitude!=null?String.valueOf(respoJsn.QualifiedAddress.Longitude):'';
        //ftRespDsat.dsatservice='';
        ftRespDsat.opened=respoJsn.Opened!=null?respoJsn.Opened:'';
        ftRespDsat.createdBy=respoJsn.CreatedBy!=null?respoJsn.CreatedBy:'';
        ftRespDsat.creatorEmail=respoJsn.CreatorEmail!=null?respoJsn.CreatorEmail:'';
        ftRespDsat.createdById=respoJsn.CreatedById!=null?String.valueOf(respoJsn.CreatedById):'';
        ftRespDsat.fiberQualification=respoJsn.FiberQualification!=null?respoJsn.FiberQualification:'';
        ftRespDsat.fiberDistance=respoJsn.FiberDistance!=null?respoJsn.FiberDistance:'';
        ftRespDsat.copperQualification=respoJsn.CopperQualification!=null?respoJsn.CopperQualification:'';
        ftRespDsat.copperDistance=respoJsn.CopperDistance!=null?respoJsn.CopperDistance:'';
        ftRespDsat.copperTier=respoJsn.CopperTier!=null?respoJsn.CopperTier:'';
        ftRespDsat.fiberTier=respoJsn.FiberTier!=null?respoJsn.FiberTier:'';
        ftRespDsat.vfoRecordId=respoJsn.VFORecordId!=null?String.valueOf(respoJsn.VFORecordId):'';
        ftRespDsat.m6OrderNumber=respoJsn.M6OrderNumber!=null?String.valueOf(respoJsn.M6OrderNumber):'';
        //ftRespDsat.dsatcreatedby='';
        ftRespDsat.siteName=respoJsn.SiteName!=null?respoJsn.SiteName:'';
        ftRespDsat.businessName= respoJsn.BusinessName==null ?'':respoJsn.BusinessName;
        //respoJsn.BusinessName==null ?'':respoJsn.BusinessName;
        ftRespDsat.litBuilding= respoJsn.LitBuilding==null ? False:respoJsn.LitBuilding;
        ftRespDsat.inFootprint=respoJsn.InFootprint==null ? False:respoJsn.InFootprint;
        ftRespDsat.wireCenterSpeed=respoJsn.WireCenterSpeed!=null?respoJsn.WireCenterSpeed:'' ;
        String DSATMaxSpeed = respoJsn.WireCenterSpeed!=null?respoJsn.WireCenterSpeed:'';
        /* Integer DSATMaxSpeedN= Integer.valueof(DSATMaxSpeed.removeEnd('G'));
if(DSATMaxSpeedN>2){
ftRespDsat.HBE_Legacy = 'HBE';// change to hbe  
}
else if(DSATMaxSpeedN<2){
ftRespDsat.HBE_Legacy = 'HBE Eligible';
}
else{
ftRespDsat.HBE_Legacy = 'Legacy';
} */
        
        String hbeEligible = '';
        String hbeSwcClli = '';
        String dsatClli6 = ftRespDsat.wireCenterCLLI!=null && (ftRespDsat.wireCenterCLLI).length()>6 ? ftRespDsat.wireCenterCLLI.substring(0,6):'';
        FTRHBECLLI__mdt HBEClliList = [Select HBECLLI__c FROM FTRHBECLLI__mdt WHERE developerName = 'CLLI'];
        
        if (HBEClliList.HBECLLI__c.split(',').contains(dsatClli6)) {
            hbeEligible = 'HBE';
            hbeSwcClli = respoJsn.wireCenterCLLI!=null?ftRespDsat.wireCenterCLLI:'';
        }
        else if(HBEClliList.HBECLLI__c.contains(dsatClli6)){
            hbeEligible ='HBE Eligible';
            for (String matchingClli : HBEClliList.HBECLLI__c.split(',')){
                if (matchingClli.contains(dsatClli6)){
                    hbeSwcClli = matchingClli;
                    break;
                }
            }
            //hbeSwcClli = ftRespDsat.wireCenterCLLI;
        }
        else{
            hbeEligible = 'Legacy';
        } 
        ftRespDsat.HBE_Legacy = hbeEligible;
        ftRespDsat.Nearby_HBE_SWC_CLLI = hbeSwcClli;
        
        
        return ftRespDsat;
        
    }
}