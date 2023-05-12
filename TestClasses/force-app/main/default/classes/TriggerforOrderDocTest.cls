@isTest
public class TriggerforOrderDocTest {
  @isTest
    public static void TriggerforOrderDocTestMethod(){
       
        Contact con= new contact();
        con.LastName = 'Test';
        con.MobilePhone = '9898561236';
        con.Email = 'Test@gmail.com';
       insert con;
        Id oppRecrdType = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Memo Read only').getRecordTypeId();
        Opportunity opp=new Opportunity();
        opp.RecordtypeId=oppRecrdType;
        opp.name='TestOpp';
        opp.Contact__c= con.id;
        opp.Contract_Term_Years__c=1;
        opp.CloseDate=System.today();
        opp.StageName='New';
   
        //opp.Reason_Won_Lost__c=' Defining '; 
        opp.Company_size__c=5;
        insert opp;
        
        
        
    }
}