@isTest(seeAllData=true)
private class Attachment_SendEmailTest {

    static testMethod void Attachment_SendEmailTestMet() {


        Account a = new Account(Name = 'Test name for Account');
        
        //required fields
        a.phone = '585-777-777';
        insert a;
        
        Opportunity opp = new Opportunity(Name = 'Test Name for Opportunity');
        
        //required fields
        opp.AccountId = a.Id;
        opp.StageName = 'Proposal';
        opp.CloseDate = System.TODAY() + 365; 
        opp.Opportunity_Type__c = 'New';
        insert opp;
        
        
        
        Pricebook2  standardPb = [select id, name, isActive from Pricebook2 where IsStandard = true limit 1];
        
        
        Pricebook2 pB = new Pricebook2(Name = 'Test Name for Pricebook2', IsActive = True);
        insert pB;
        
        Product2 prod = new Product2(Name = 'Test Name for Product2', Item_Rate__c = 200,  isActive = true);        
        insert prod;
        
                
        PricebookEntry pBE = new PricebookEntry(Product2Id = prod.Id, Pricebook2Id = standardPb.Id, UnitPrice = 1, IsActive=true);      
        //pBE.UseStandardPrice = TRUE;
        insert pBE;
        
        OpportunityLineItem oPL = new OpportunityLineItem(PricebookEntryId = pBE.Id, OpportunityId = opp.Id, 
                            UnitPrice = 3, Quantity = 10
                            );
        insert oPL;
        
         test.startTest();       
        //CustomerSignedDate = System.TODAY(), CompanySignedDate = System.TODAY(), 
        Contract c = new Contract(Opportunity__c = opp.Id, 
                            ICB_Flag__c = 'Y', //OwnerId = '005400000012nDW',
                            Icb_for_email_for_test__c = true,
                            //required fields
                            StartDate = System.TODAY(),
                            ContractTerm = 12,
                            Status = 'Draft',
                            AccountId = a.Id
            );  
     
        insert c;
        
        System.debug('\n*********ICB_Flag__c = ' + c.ICB_Flag__c + '\n*********CustomerSignedDate = ' + c.CustomerSignedDate +
                '\n*********CompanySignedDate = ' + c.CompanySignedDate 
                );
                
        Schedule__c s = new Schedule__c(Contract__c = c.Id,
                            Schedule_Start_Date__c = System.TODAY(),
                           Schedule_End_Date__c = System.TODAY() + 365
                           );                

        insert s;
                        
        //Schedule__c s = [Select Id from Schedule__c where IsDeleted != true Limit 1];
        
        Attachment att = new Attachment(ParentId = s.Id,
        //required fields
                    Name = 'Test Name for Attachment',
                    Body = Blob.valueof('AAAAAAAAAAAAAA')
                    );
                    
                           
        insert att;
        test.stopTest();
        
    
                
    }
}