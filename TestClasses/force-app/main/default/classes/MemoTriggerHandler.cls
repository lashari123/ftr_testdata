public class MemoTriggerHandler {
    public void InsertMemoId(List<Memo__c> memoList){
        
        List<String> userIdString = new List<String>();
        List<User> usrList;     
        Map<String, String> memoIdMap = new Map<String, String>();
        
        for(Memo__c memo:memoList){
          userIdString.add(memo.User_ID__c);  
        }// end of for loop
        usrList = [SELECT Id,DPIID__C,CSR_ID__c,Display_Name__c FROM User WHERE DPIID__C in : userIdString or  CSR_ID__c in : userIdString];
        for(User u:usrList){
            if(u.DPIID__C != null){
               memoIdMap.put(  u.DPIID__C,u.Display_Name__C);
            } else {
                 memoIdMap.put(  u.CSR_ID__c,u.Display_Name__C);
            }
           /* if(!memoIdMap.containsKey(u.DPIID__C)){
                memoIdMap.put(  u.CSR_ID__c,u.Display_Name__C);
            }*/
         }// end of for loop
        for(Memo__c memo1:memoList){
            if(memoIdMap.containsKey(memo1.User_Id__c)){
                memo1.User_Id__c = memoIdMap.get(memo1.User_Id__c);
            }//end of if(memoIdMap.containsKey(memo1.User_Id__c))
            else {
                memo1.URL_Field__c = 'http://cfapps.ftr.com/EmpLookup/login.cfm?lanid='+memo1.User_Id__c;
                system.debug('memo1---'+memo1.EmployeeLookup__c);
                
            }
        }  //for(Memo__c memo1:lstMemo)
     }

}