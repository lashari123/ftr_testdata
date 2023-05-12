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
@isTest
private class NotesAndAttachControllerExtension_Test {

    static testMethod void myUnitTest() {
        
        Account objacc = new Account();
        objacc.Name='Test';
        insert objacc;
        Opportunity objOpp = new Opportunity();
        ObjOpp.Name ='Testing Name';
        ObjOpp.AccountId= objAcc.Id;
        ObjOpp.CloseDate = date.today();
        ObjOpp.StageName ='Verbal Commit';
        ObjOpp.Expected_Billed_Date__c= date.today();
        insert ObjOpp; 
        RecordType recordtypeid = [SELECT BusinessProcessId,DeveloperName,Id,Name,SobjectType FROM RecordType WHERE DeveloperName = 'SFA' AND SobjectType = 'SterlingQuote__c'];        
        SterlingQuote__c objSQ = new SterlingQuote__c();
        objSQ.Account_Name__c=objacc.Id;
        objSQ.ExpirationDate__c=date.today();
        objSQ.RecordTypeId = recordtypeid.Id;
        objSQ.OpportunityId__c= objOpp.Id;
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
       objst.StandardMRC__c= 10.00;
       objst.StandardNRC__c=10.00;
       objst.AdjustedMRC__c=10.00;
       objst.AdjustedNRC__c=10.00;
       objst.Quantity__c=10;
     //objst.Products__c=objProduct2_1.id;
       objst.OwnerId= userinfo.getUserId(); 
       objst.ItemOwner__c =userinfo.getUserId();
       objst.ApprovalPriority__c='Normal';
       objst.Locality__c='Indiana'; 
       objst.StateProvince__c='IN' ;
      // objst.State__c='IN'; 10/16 raj
       objst.NXX__c='10';
        
       objst.SetNextApprover__c= true;
       objst.OverallStatus__c='';
       objst.SIFT_Required__c=true;
       objst.SIFT_InquiryId__c='1234';
       insert objst;

            ApexPages.currentPage().getParameters().put('Id',objSt.Id);
            ApexPages.StandardController sc = new ApexPages.standardController(objSt);
            NotesAndAttachmentControllerExtension objnotes = new NotesAndAttachmentControllerExtension(sc);
            objnotes.BackCustom();
        
            // Attachment att = [SELECT Id, Name, LastModifiedDate, CreatedById, CreatedBy.Name FROM Attachment WHERE parentId =: objst.Id];
            Attachment att = new Attachment();
            att.Name='test';
            att.ParentId= objst.Id;
            Blob bodyBlob=Blob.valueOf('Unit Test Attachment Body');
            att.body=bodyBlob;
            insert att; 
        
            Note atte = new Note();
            atte.title='test';
            atte.ParentId= objst.Id;
            //Blob bodyBlob=Blob.valueOf('Unit Test Note Body');
            //atte.body=bodyBlob;
            insert atte;    
            
     
            objNotes.getAttachments();
            objNotes.redirectToNewNote();
            objNotes.redirectToNewAttachment();
        
            NotesAndAttachmentControllerExtension.innerWrapperClass innerclass = new NotesAndAttachmentControllerExtension.innerWrapperClass();
        innerclass.name='Test';
        innerclass.typeOf='test';
        innerclass.urlRedirection='test';
        
        
    }
}