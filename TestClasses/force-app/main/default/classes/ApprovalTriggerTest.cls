/**
 * This class contains unit tests for validating the behavior of Apex classes
 * and triggers.
 *
 * Unit tests are class methods that verify whether a particular piece
 * of code is working properly. Unit test methods take no arguments,
 * commit no data to the database, and are flagged with the testMethod
 * keyword in the method definition.
 *
 * All test methods in an organization are executed whenever Apex code is deployed
 * to a production organization to confirm correctness, ensure code
 * coverage, and prevent regressions. All Apex classes are
 * required to have at least 75% code coverage in order to be deployed
 * to a production organization. In addition, all triggers must have some code coverage.
 * 
 * The @isTest class annotation indicates this class only contains test
 * methods. Classes defined with the @isTest annotation do not count against
 * the organization size limit for all Apex scripts.
 *
 * See the Apex Language Reference for more information about Testing and Code Coverage.
 */
@isTest (seealldata = true)
private class ApprovalTriggerTest {
    

    static testMethod void myUnitTest() {
        // TO DO: implement unit test
    Account objAcc = new Account();
        objAcc.Name ='testaccount';
        objAcc.OwnerId= userinfo.getUserId();
         objAcc.Legal_Street__c='test';
        objAcc.Legal_City__c='test';
        objAcc.Legal_State__c='test';
        objAcc.ShippingStreet='test';
        objAcc.ShippingCity='NY';
        objAcc.ShippingState='New York';
        objAcc.BillingStreet='test';
        objAcc.BillingCity='NY';
        objAcc.BillingState='New York';
        insert objAcc;
        RecordType recordtype=[SELECT BusinessProcessId,DeveloperName,SobjectType FROM RecordType WHERE DeveloperName = 'SFA' AND SobjectType = 'SterlingQuoteItem__c'];
        Opportunity objOpp = new Opportunity();
        objOpp.Name='test';
        objOpp.AccountId = objAcc.id;
        objOpp.StageName='verbal commit';
        objOpp.CloseDate=date.today();
        objOpp.Expected_Billed_Date__c= date.today();
        objOpp.OwnerId= userinfo.getUserId();
        
          insert objOpp;
        SterlingQuote__c objSQ = new SterlingQuote__c();
       objSQ.name='test';
       objSQ.OpportunityId__c=objOpp.id;
       objSQ.ExpirationDate__c= date.today();
       objSQ.OwnerId = userinfo.getUserId();
          insert objSQ;
             
       SterlingQuoteItem__c objst = new SterlingQuoteItem__c();
       objst.name='test';
       objst.SterlingQuote__c = objSQ.id;
       objst.IsInFrontierFootprint__c=false;
       objst.OverallStatus__c ='pending';
       objst.DiscountType__c ='ICB';
       objst.ApprovalTerritory__c ='Indiana';
       objst.ApprovalRouting__c='Customer Build';
       objst.ApprovalRegion__c='IN';
       objst.StandardMRC__c= 150.00;
       objst.Quantity__c = 100;
       objst.StandardNRC__c=10.00;
       objst.AdjustedMRC__c=10.00;
       objst.AdjustedNRC__c=10.00;
       objst.OwnerId= userinfo.getUserId(); 
       //objst.ItemOwner__c =userinfo.getUserId();
       objst.ApprovalPriority__c='Normal';
       objst.Locality__c='Indiana'; 
       objst.StateProvince__c='IN' ;
      // objst.State__c='IN'; 10/16 Raj
       objst.NXX__c='10';
        
       objst.SetNextApprover__c= false;
       objst.OverallStatus__c='';
       objst.SIFT_Required__c=true;
       objst.SIFT_InquiryId__c='1234';
       objst.Description__c = 'Running Test Class';
        insert objst;
        
      // Start the update process for each test in the SetNextApprover and SetSalesEngineerand ApprovalOwner Triggers  
      SterlingQuoteItem__c  tgrst = [select itemOwner__c, 
            Ownerid, 
            OverallStatus__c, 
            PriorStatus__c, 
            SalesEngineer__c, 
            CurrentStatus__c, 
            IsInFrontierFootprint__c, 
            SetNextApprover__c, 
            ApprovalRouting__c,
            StateProvince__c,
            Quantity__c,
            StandardMRC__c,
            ApprovalTerritory__c
        from SterlingQuoteItem__c where id =: objst.id];
        system.debug('Target Line Item = ' + tgrst);
        
        tgrst.SetNextApprover__c = true;
        system.debug('Set Next Approver = ' + tgrst.SetNextApprover__c);
        update tgrst;
       
        tgrst.PriorStatus__c = 'Assigned - Sales Engineer';
        tgrst.CurrentStatus__c = 'Pending - Engineering';
        system.debug('Step 2 = ' + tgrst);
        update tgrst;
        
        tgrst.IsInFrontierFootprint__c = false;
        tgrst.CurrentStatus__c = 'Pending - INA';
        system.debug('Step 3 = ' + tgrst);
        update tgrst;
        
        tgrst.PriorStatus__c = 'Approved - Engineering Wireless';
        tgrst.CurrentStatus__c = 'Pending - Engineering Wireless';
        tgrst.SalesEngineer__c = null;
        system.debug('Step 4 = ' + tgrst);
        update tgrst;
       
       tgrst.PriorStatus__c = 'Approved - Engineering';
        tgrst.CurrentStatus__c = 'Pending - INA';
        tgrst.SalesEngineer__c = null;
        tgrst.IsInFrontierFootprint__c = false;
        system.debug('Step 5 = ' + tgrst);
        update tgrst;
        
        tgrst.PriorStatus__c = 'Approved - Finance';
        tgrst.CurrentStatus__c = 'Pending - Business Decision Support';
        tgrst.SalesEngineer__c = null;
        tgrst.IsInFrontierFootprint__c = true;
        system.debug('Step 6 = ' + tgrst);
        update tgrst;
      
      tgrst.CurrentStatus__c = 'Pending - Sales Engineering Manager';
      tgrst.SetNextApprover__c = true;
        system.debug('Step SNA1 = ' + tgrst);
        update tgrst;
      
        tgrst.CurrentStatus__c = 'Pending - Egineering';
        system.debug('Step SNA2 = ' + tgrst);
        update tgrst;
        
      tgrst.CurrentStatus__c = 'Pending - Engineering';
        tgrst.ApprovalRouting__c = 'Renewal / Special Pricing';
        system.debug('Step SNA3 = ' + tgrst);
        update tgrst;
      
        tgrst.CurrentStatus__c = 'Pending - INA';
        tgrst.ApprovalRouting__c = 'Customer Build';
        system.debug('Step SNA4 = ' + tgrst);
        update tgrst;
        
        tgrst.CurrentStatus__c = 'Pending - Sales Engineering';
        system.debug('Step SNA5 = ' + tgrst);
        update tgrst;
      
        tgrst.CurrentStatus__c = 'Pending - Engineering Wireless';
        system.debug('Step SNA6 = ' + tgrst);
        update tgrst;
        
      tgrst.CurrentStatus__c = 'Pending - Site Verification';
        system.debug('Step SNA7 = ' + tgrst);
        update tgrst;
      
        tgrst.CurrentStatus__c = 'Pending - Engineering Wireless Final';
        tgrst.StandardMRC__c = 150.00;
        tgrst.quantity__c = 100;
        system.debug('Step SNA8= ' + tgrst);
        update tgrst;
        
       
       tgrst.CurrentStatus__c = 'Pending - Wireless Management';
       
       
        system.debug('Step SNA9= ' + tgrst);
        
        update tgrst;
      
        tgrst.CurrentStatus__c = 'Pending - Credit'; 
        tgrst.quantity__c = 200;
        system.debug('Step SNA10 ' + tgrst);
        update tgrst;
        
        tgrst.CurrentStatus__c = 'Pending - Wireless Management';
        system.debug('Step SNA11 ' + tgrst);
        update tgrst;
      
        tgrst.CurrentStatus__c = 'Pending - Business Decision Support';
        system.debug('Step SNA12 ' + tgrst);
        update tgrst;
        
        tgrst.CurrentStatus__c = 'Pending - Finance';
        system.debug('Step SNA13 ' + tgrst);
        update tgrst;
      
        tgrst.CurrentStatus__c = 'Pending - State VP';
        system.debug('Step SNA14 ' + tgrst);
        update tgrst;
        
      tgrst.CurrentStatus__c = 'Pending - Regional President';
        system.debug('Step SNA15 ' + tgrst);
        update tgrst;
      
        tgrst.CurrentStatus__c = 'Pending - Post Completion Audit Finance';
        system.debug('Step SNA16' + tgrst);
        update tgrst;
        
        
    }
}