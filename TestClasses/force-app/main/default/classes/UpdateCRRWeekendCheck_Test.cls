@isTest
public class UpdateCRRWeekendCheck_Test {

    @isTest
    static void WeekendCheckDate(){
        String MethodName = 'checkHolidayAndFetchCRR';
        String CustomerRequestDate = '2021-12-08';
        Map<String,Object> inputMap = new Map<String,Object>{'customerRequestedDate'=>CustomerRequestDate};
        Map<String,Object> outMap = new Map<String,Object>();
        Map<String,Object> options = new Map<String,Object>();
        UpdateCRRWeekendCheck_RemoteCall remoteCall = new UpdateCRRWeekendCheck_RemoteCall();
        remoteCall.invokeMethod(MethodName,inputMap,outMap,options);
        
    }
    
    @isTest
    static void WeekendCheckDateError(){
        String MethodName = 'checkHolidayAndFetchCRR';
        String CustomerRequestDate = '2021-12-08';
        Map<String,Object> inputMap = new Map<String,Object>{'CustomerRequestedDate'=>CustomerRequestDate};
        Map<String,Object> outMap = new Map<String,Object>();
        Map<String,Object> options = new Map<String,Object>();
        UpdateCRRWeekendCheck_RemoteCall remoteCall = new UpdateCRRWeekendCheck_RemoteCall();
        remoteCall.invokeMethod(MethodName,inputMap,outMap,options);
        
    }
}