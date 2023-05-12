@isTest
private class BeforeInsertMemoTest {
    static testMethod void testInsertWithValue(){
   
    List<Memo__c> memo = new List<Memo__c>();
    
    Memo__c newMemo =new Memo__c();
    newMemo.Amount__c =  24.33;
    newMemo.Concatinate__c = 'what ever'; 
    newMemo.Created_Date_Time__c  = datetime.now();  
    newMemo.Date_x__c   = Date.Today();
    newMemo.Lastupdatetym__c = datetime.now();    
    newMemo.Library_Id__c ='LF';  
    newMemo.Memo_Key__c = '123456789';
    newMemo.MemoText__c ='blah blah blah blah blah hahahah';
    newMemo.MemoTextLineSequenceNumber__c = 5;  
    newMemo.MemoTextNote__c = 'Not another one';
    newMemo.Sequence_Number__c  =2;
    newMemo.Type__c = 'good looking';
    newMemo.URL_Field__c = 'http://www.givemeyournumber.com';    
    newMemo.User_ID__c  = 'SVORD-POST';
    
    
    
    Memo__c newMemo1 =new Memo__c();
    newMemo1.Amount__c =  124.33;
    newMemo1.Concatinate__c = '1what ever'; 
    newMemo1.Created_Date_Time__c  = datetime.now();  
    newMemo1.Date_x__c   = Date.Today();
    newMemo1.Lastupdatetym__c = datetime.now();    
    newMemo1.Library_Id__c ='LF';  
    newMemo1.Memo_Key__c = '1123456789';
    newMemo1.MemoText__c ='1blah blah blah blah blah hahahah';
    newMemo1.MemoTextLineSequenceNumber__c = 15;  
    newMemo1.MemoTextNote__c = '1Not another one';
    newMemo1.Sequence_Number__c  =12;
    newMemo1.Type__c = '1good looking';
    newMemo1.URL_Field__c = 'http://www.givemeyournumber1.com';    
    newMemo1.User_ID__c  = 'V_VNW483';
    
    
    Memo__c newMemo2 =new Memo__c();
    newMemo2.Amount__c =  2124.33;
    newMemo2.Concatinate__c = '21what ever'; 
    newMemo2.Created_Date_Time__c  = datetime.now();  
    newMemo2.Date_x__c   = Date.Today();
    newMemo2.Lastupdatetym__c = datetime.now();    
    newMemo2.Library_Id__c ='LF';  
    newMemo2.Memo_Key__c = '21123456789';
    newMemo2.MemoText__c ='21blah blah blah blah blah hahahah';
    newMemo2.MemoTextLineSequenceNumber__c = 215;  
    newMemo2.MemoTextNote__c = '21Not another one';
    newMemo2.Sequence_Number__c  =212;
    newMemo2.Type__c = '21good looking';
    newMemo2.URL_Field__c = 'http://www.givemeyournumber1.com';    
    newMemo2.User_ID__c  = 'Yep';
    
    memo.add(newMemo);
    memo.add(newMemo1);
    memo.add(newMemo2);
    insert memo;
    
    Memo__c memo1 = [SELECT id, EmployeeLookup__c from Memo__c where Amount__c = 24.33 and Concatinate__c = 'what ever'];
    Memo__c memo2 = [SELECT id, EmployeeLookup__c, User_Id__c, URL_Field__c from Memo__c where Library_Id__c ='LF' and Concatinate__c = '1what ever'];
    Memo__c memo3 = [SELECT id, URL_Field__c from Memo__c where Library_Id__c ='LF' and Concatinate__c = '21what ever'];
    
    Boolean result = memo1.EmployeeLookup__c.contains('S. Shrestha');
   // Boolean str = (memo2.URL_Field__c).equals('http://www.givemeyournumber1.com');
    Boolean str1 = memo3.URL_Field__c.contains('cfapps.ftr.com');
    
   /*  system.assertequals(result, true);
    system.assertequals(result, false);
    system.assertequals(str1, true);
	system.assertequals(str1, false);		*/
    }
     
}