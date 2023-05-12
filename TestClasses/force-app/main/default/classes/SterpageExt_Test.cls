@isTest()
private class SterpageExt_Test {
    static testMethod void sterMethod() {
        
      // Setup test data
     // This code runs as the system user
    /*  Profile p = [SELECT Id FROM Profile WHERE Name='Standard User']; 
      User u = new User(Alias = 'standt', Email='standarduser@testorg.com', 
      EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US', 
      LocaleSidKey='en_US', ProfileId = p.Id, city='Plano',state ='TX',
      TimeZoneSidKey='America/Los_Angeles', UserName='standarduser@testorg.com');
         
      User u1 = new User(Alias = 'standp', Email='standarduser@testorg.com', 
      EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US', 
      LocaleSidKey='en_US', ProfileId = p.Id,Managerid=u.id, city='Plano',state ='TX',
      TimeZoneSidKey='America/Los_Angeles', UserName='standarduser1@test.com');
      System.runAs(u1) { */
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
       //SterlingQuote__c objSQ = [select id, name from SterlingQuote__c where RecordType.Name ='SFA' limit 1];
       //SterlingQuoteItem__c objst = [select id from SterlingQuoteItem__c where sterlingquote ];
      
        QueueSuffix__c objsuffix = new QueueSuffix__c();
        objsuffix.ApprovalQueueSuffix__c ='IN';
        objsuffix.ApprovalStateProvince__c='IN';
        objsuffix.Region__c='central';
        objsuffix.Name ='testing Name';
        insert objsuffix;
        QueueSobject objs = new QueueSobject();
        
       SterlingQuoteItem__c objst = new SterlingQuoteItem__c();
       objst.name='test';
       objst.SterlingQuote__c = objSQ.id;
       objst.IsInFrontierFootprint__c=false;
       objst.OverallStatus__c ='pending';
       objst.DiscountType__c ='ICB';
      
       objst.ApprovalTerritory__c ='Indiana';
       objst.ApprovalRouting__c='Customer Build';
       objst.ApprovalRegion__c='IN';
       objst.StandardMRC__c= 10.00;
       objst.StandardNRC__c=10.00;
       objst.AdjustedMRC__c=10.00;
       objst.AdjustedNRC__c=10.00;
       objst.OwnerId= userinfo.getUserId(); 
       objst.ItemOwner__c =userinfo.getUserId();
       objst.ApprovalPriority__c='Normal';
       objst.Locality__c='Indiana'; 
       objst.StateProvince__c='IN' ;
       //objst.State__c='IN';
       objst.NXX__c='10';
       objst.SetNextApprover__c= true;
       objst.OverallStatus__c='';
       objst.SIFT_Required__c=true;
       objst.SIFT_InquiryId__c='1234';
        insert objst;
        
        //SterlingQuoteItem__c objste = new SterlingQuoteItem__c();
        //objste.DiscountType__c = null;
        //insert objste;
 
        
       apexpages.currentpage().getparameters().put('id',objst.id);
       ApexPages.StandardController objCon = new ApexPages.StandardController(objst);
       SterpageExt objSE = new SterpageExt(objCon);
       

      // objSE.getuserinfo(Userinfo.getID());
       objSE.SaveOverrideButton();
       objSE.Edit();
       objSE.BackCustom();
      // objSE.closePopup();
       objSE.showPopup();
       objSE.cancelpopup();
       objSE.delmethod(); 
       objSE.LaunchINA();
       objSE.SIFT();
       objSE.Submitsift();
       objSE.SaveOver();
        
       objst.OverallStatus__c='Recalled';
       update objst;
       
       apexpages.currentpage().getparameters().put('id',objst.id);
       ApexPages.StandardController objConOne = new ApexPages.StandardController(objst);
       SterpageExt objSEOne = new SterpageExt(objConOne);
        
       objst.OverallStatus__c='Pending';
       update objst;
       
       /*apexpages.currentpage().getparameters().put('id',objst.id);
       ApexPages.StandardController objConTwo = new ApexPages.StandardController(objst);
       SterpageExt objSETwo = new SterpageExt(objConTwo);
        
       objst.OverallStatus__c='Approved';
       update objst;
       
       apexpages.currentpage().getparameters().put('id',objst.id);
       ApexPages.StandardController objConThree = new ApexPages.StandardController(objst);
       SterpageExt objSEThree = new SterpageExt(objConThree);
       */
       
       //objSEThree.getuserinfo(UserInfo.getUserId());
      //}
    }
    
    static testMethod void sterMethod2() {
        
      // Setup test data
     // This code runs as the system user
    /*  Profile p = [SELECT Id FROM Profile WHERE Name='Standard User']; 
      User u = new User(Alias = 'standt', Email='standarduser@testorg.com', 
      EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US', 
      LocaleSidKey='en_US', ProfileId = p.Id, city='Plano',state ='TX',
      TimeZoneSidKey='America/Los_Angeles', UserName='standarduser@testorg.com');
         
      User u1 = new User(Alias = 'standp', Email='standarduser@testorg.com', 
      EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US', 
      LocaleSidKey='en_US', ProfileId = p.Id,Managerid=u.id, city='Plano',state ='TX',
      TimeZoneSidKey='America/Los_Angeles', UserName='standarduser1@test.com');
      System.runAs(u1) { */
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
       //SterlingQuote__c objSQ = [select id, name from SterlingQuote__c where RecordType.Name ='SFA' limit 1];
       //SterlingQuoteItem__c objst = [select id from SterlingQuoteItem__c where sterlingquote ];
      
        QueueSuffix__c objsuffix = new QueueSuffix__c();
        objsuffix.ApprovalQueueSuffix__c ='IN';
        objsuffix.ApprovalStateProvince__c='IN';
        objsuffix.Region__c='central';
        objsuffix.Name ='testing Name';
        insert objsuffix;
        QueueSobject objs = new QueueSobject();
        
       SterlingQuoteItem__c objst = new SterlingQuoteItem__c();
       objst.name='test';
       objst.SterlingQuote__c = objSQ.id;
       objst.IsInFrontierFootprint__c=false;
       objst.OverallStatus__c ='pending';
       objst.DiscountType__c ='ICB';
      
       objst.ApprovalTerritory__c ='Indiana';
       objst.ApprovalRouting__c='Customer Build';
       objst.ApprovalRegion__c='IN';
       objst.StandardMRC__c= 10.00;
       objst.StandardNRC__c=10.00;
       objst.AdjustedMRC__c=10.00;
       objst.AdjustedNRC__c=10.00;
       objst.OwnerId= userinfo.getUserId(); 
       objst.ItemOwner__c =userinfo.getUserId();
       objst.ApprovalPriority__c='Normal';
       objst.Locality__c='Indiana'; 
       objst.StateProvince__c='IN' ;
       //objst.State__c='IN';
       objst.NXX__c='10';
       objst.SetNextApprover__c= true;
       objst.OverallStatus__c='';
       objst.SIFT_Required__c=true;
       objst.SIFT_InquiryId__c='1234';
        insert objst;
        
        //SterlingQuoteItem__c objste = new SterlingQuoteItem__c();
        //objste.DiscountType__c = null;
        //insert objste;
 
       apexpages.currentpage().getparameters().put('id',objst.id);
       ApexPages.StandardController objConTwo = new ApexPages.StandardController(objst);
       SterpageExt objSETwo = new SterpageExt(objConTwo);
        
       objst.OverallStatus__c='Approved';
       update objst;
       
       apexpages.currentpage().getparameters().put('id',objst.id);
       ApexPages.StandardController objConThree = new ApexPages.StandardController(objst);
       SterpageExt objSEThree = new SterpageExt(objConThree);
       
       //objSEThree.getuserinfo(UserInfo.getUserId());
      //}
    }
}