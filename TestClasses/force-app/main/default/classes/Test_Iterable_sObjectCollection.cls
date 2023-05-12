@isTest
private class  Test_Iterable_sObjectCollection{

    static testmethod void test1() {  
        List<WS_SFDC_Datatypes.sObjectCollection> sObjList = new List<WS_SFDC_Datatypes.sObjectCollection>();  
        List<sObject__c> sObLst = new List<sObject__c>();
        for(integer i =0; i<=2; i++){            
            WS_SFDC_Datatypes.sObjectCollection sobj = new WS_SFDC_Datatypes.sObjectCollection();                     
            sobj.sObjectRecord = new sObject__c(name__c = 'Test'+i);
            sObLst.add(sobj.sObjectRecord);
            sObjList .add(sobj);
        }       
       insert sObLst; 
       Test.startTest();
       Iterable_sObjectCollection c = new Iterable_sObjectCollection ();   
       for(WS_SFDC_Datatypes.sObjectCollection sc:sObjList){
       if(c.hasNext()){
           WS_SFDC_Datatypes.sObjectCollection nxt = c.next();
        }
       }
           
       Test.stopTest();
     }
}