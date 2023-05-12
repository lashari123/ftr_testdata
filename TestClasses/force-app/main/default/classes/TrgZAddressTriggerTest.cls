@isTest (seealldata = true)
public class TrgZAddressTriggerTest {
    
    public static testMethod void testTrigger() {
        
        Account objAccount = new Account(Name='acc');
        insert objAccount;
        opportunity objopportunity= new opportunity(AccountId=objAccount.Id);
        objopportunity.Name ='testing opp';
        objopportunity.StageName='verbal commit';
        objopportunity.CloseDate= date.today();
        objopportunity.Expected_Billed_Date__c = date.today();
        insert objopportunity;
        
        SterlingQuote__c objSQ = new SterlingQuote__c();
        objSQ.Name='Testing Name';
        objSQ.ExpirationDate__c = date.today();
        objSQ.OpportunityId__c = objopportunity.Id;
        objSQ.Account_Name__c = objAccount.id;            
        insert objSQ;

        SterlingQuoteItem__c objLineItem = new SterlingQuoteItem__c();
        objLineItem.Quantity__c=10;
        objLineItem.TermLength__c=24;
        objLineItem.StandardMRC__c = 10;
        objLineItem.StandardNRC__c = 10;
        objLineItem.AdjustedMRC__c = 10;
        objLineItem.AdjustedNRC__c = 10;
        objLineItem.Locality__c = 'Indiana';
        objLineItem.StateProvince__c ='IN';
        objLineItem.ItemCode__c ='123'; 
        objLineItem.ApprovalTerritory__c ='Indiana';
        objLineItem.ApprovalRegion__c='central';
        objLineItem.NPA__c ='10';
        objLineItem.NXX__c = '10'; 
        objLineItem.IsInFrontierFootprint__c = false;
        objLineItem.SterlingQuote__c = objSQ.id;
        insert objLineItem;
        
        ZAddress__c objzad = new ZAddress__c();
        objzad.Addressdescription__c='test';
        objzad.BuildingName__c='test';
        objzad.BuildingNumber__c='232';
        objzad.BuildingSubNumber__c='12';
        objzad.Circuit_Price_QuoteId__c='2132';
        objzad.Country__c='usa';
        objzad.Locality__c='tx';
        objzad.Networkdistance__c='10';
        objzad.NXX__c='10';
        objzad.NPA__c='10';
        objzad.Postcode__c='1234';
        objzad.ServiceControlNumber__c='123';
        objzad.SterlingQuoteItem__c = objLineItem.Id;
        insert objzad;
        
        delete objzad;
   }
}