@isTest(seeAllData = true)
private class ContractRepositoryTest {
       
        static testmethod void unitTest(){
            Account acc = new Account(name='testAccount');
            insert acc;
            acc = [select id from Account where name = 'testAccount'];
            
            Opportunity opp = new Opportunity(name='TestOpp',AccountId= acc.id, CloseDate= Date.Today(), StageName='Validating');
            insert opp;
            opp = [select id from Opportunity where AccountId =: acc.id limit 1]; 
            /*
            Product2 p = new Product2(name = 'TestProduct', IsActive = true);
            insert p;
            p= [select id from Product2 where name = 'TestProduct'];
            
            Pricebook2 pb1 = [select Id from Pricebook2 where isStandard=true];
            
            PricebookEntry pbe = new PricebookEntry(Pricebook2Id = pb1.id, Product2Id= p.id, UnitPrice = 10, UseStandardPrice = false, isActive = true);*/
            
            PriceBookEntry pbe = [SELECT Id, Product2Id, Product2.Id, Product2.Name FROM PriceBookEntry WHERE PriceBook2.isStandard=true and isActive = true LIMIT 1];
                        
            OpportunityLineItem oli = new OpportunityLineItem(UnitPrice = 3, OpportunityId=opp.id, Quantity=10, PricebookEntryId=pbe.id);
            insert oli;
            
            Contract_Repository__c cr = new Contract_Repository__c(Name__c = 'TestContract', Account_Name__c=acc.id, Opportunity__c=opp.id,
                                                                    CustomerSignedDate__c = Date.Today(), CompanySigneddate__c = Date.Today());
            insert cr;
            cr = [select id from Contract_Repository__c limit 1]; 
            
            update cr;
            delete cr;
            undelete cr;          
        }
}