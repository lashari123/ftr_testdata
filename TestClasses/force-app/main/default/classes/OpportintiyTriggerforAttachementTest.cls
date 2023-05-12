@isTest
public class OpportintiyTriggerforAttachementTest { 
    @isTest
    public static void OpportintiyTriggerforAttachementTestMethod(){
        Contact con= new contact();
        con.LastName= 'Test';
        con.MobilePhone= '9898561236';
        con.Email = 'Test@gmail.com';
           
        Opportunity opp=new Opportunity();
        opp.name='TestOpp';
        opp.Contact__c= con.id;
        opp.Contract_Term_Years__c=1;
        opp.CloseDate=System.today();
        opp.StageName='New';
        opp.Reason_Won_Lost__c=' Defining '; 
        opp.Company_size__c=5;
        
        
      
      Test.startTest();
       insert opp;
        Test.stopTest();
    }
    
    @isTest
    public static void updatePriceBook(){
            Contact con= new contact();
        con.LastName= 'Test';
        con.MobilePhone= '9898561236';
        con.Email = 'Test@gmail.com';
        insert con;      
        
        Pricebook2 customPB = new Pricebook2(Name='Custom Pricebook', isActive=true);
        insert customPB;
        
         Pricebook2 customPB2 = new Pricebook2(Name='Custom Pricebook', isActive=true);
        insert customPB2;
        
        Opportunity opp=new Opportunity();
        opp.name='TestOpp';
        opp.Contact__c= con.id;
        opp.Contract_Term_Years__c=1;
        opp.CloseDate=System.today();
        opp.StageName='New';
        opp.Reason_Won_Lost__c=' Defining '; 
        opp.Company_size__c=5;
        opp.Pricebook2Id=customPB.id;
        
        opp.Total_NRC__c=2;
        insert opp;
        
        List<Opportunity> oppL = new List<Opportunity>();
        oppL = [Select id,Name,Pricebook2Id from Opportunity where id =: opp.id];
        oppL[0].Pricebook2Id = customPB2.id;
        update oppL;
    }

}