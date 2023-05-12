@isTest
public class test_CaseTrigger {
   
   static testMethod void Create_Directory_Listing_Case(){
     
    User user1 = new User(alias = 'ceo', email='admin@testorg.com',
        emailencodingkey='UTF-8', lastname='Testing', languagelocalekey='en_US',
        localesidkey='en_US',
        timezonesidkey='America/Los_Angeles', username='adminTas@ftr.testorg.com', profileid = '00e40000000nTsD');
        insert user1;
        
    User user2 = new User(alias = 'ceo2', email='admin2@testorg.com',
        emailencodingkey='UTF-8', lastname='Testing', languagelocalekey='en_US',
        localesidkey='en_US',
        timezonesidkey='America/Los_Angeles', username='admin2@ftr.testorg.com', profileid = '00e40000000nTsD');
        insert user2;        
       
                     
        Case c = new Case(Telephone_Number__c='9725424200',Requested_Name__c='City of McKinney',Street_Address__c='222 E. Tennessee Avenue',City__c='McKinney',CAP_State__c='TX',Status='New',Listed_Name__c='City of McKinney',Office_Name__c='Bridgeport, WV',LOC__c='Dallas, McKinney, Allen',Listing_Type__c='Government',Problem_Category__c='Telephone Number Incorrect',Description='The Number is really 972-547-7550');
        insert c;
        
        Id recordTypeIdOrderManagement = Schema.SObjectType.Case.getRecordTypeInfosByName().get('Order Management').getRecordTypeId();
        c.RecordtypeID = recordTypeIdOrderManagement ;
        c.Assigned_To__c=User2.id;
        c.OrderManagement_Type__c='Contract Renewal';
        c.Contract_Expiration_Date__c =date.today().addyears(1);

        update c; 
        c.status='Closed';
        update c;
        
        ApexPages.StandardController sc = new ApexPages.StandardController(c);        
        //apexpages.currentPage.getParameters().put('id', String.valueOf(c.Id));
         ApexPages.currentPage().getParameters().put('id',c.id);
        CaseContractRenewal testAccPlan = new CaseContractRenewal(sc);
        testAccPlan.save();
        testAccPlan.cancelCase();
        testAccPlan.saveAndClose();
        ApexPages.currentPage().getParameters().put('id',c.id);
        redirectController redirct = new redirectController(sc);
        redirct.redirectPage();
        
        Id recordTypeIdOrderManagement1 = Schema.SObjectType.Case.getRecordTypeInfosByName().get('Contract Renewal').getRecordTypeId();
        c.RecordtypeID = recordTypeIdOrderManagement1 ;
        c.Assigned_To__c=User2.id;
        c.OrderManagement_Type__c='Contract Renewal';
        //update c; 
        redirectController redirct1 = new redirectController(sc);
        redirct1.redirectPage();

        //c.status='Closed';
        //update c;

                        
    }
}