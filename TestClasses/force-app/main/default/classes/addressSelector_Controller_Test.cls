@IsTest(seeAllData = true)
public class addressSelector_Controller_Test
{
	 @isTest static void testAutoRun() 
	{
        			
        	Account acc = new Account(Name = 'Test Account',BillingStreet='23100 Avenue San Luis',BillingCity= 'WoodLandHills',
						BillingState= 'California',BillingCountry ='United States',BillingPostalCode ='91364',Legal_Street__c ='23100 Avenue San Luis',
						Legal_City__c='WOODLAND HILLS',Legal_State__c='California',Legal_Zip__c ='91364',Legal_Country1__c='United States',ShippingStreet='23100 Avenue San Luis',
                        ShippingCity='WODLAND',ShippingState='California',ShippingCountry='United States',ShippingPostalCode ='91364');
            insert acc;
            
            Opportunity opp = new Opportunity();
            opp.Name = 'Test Opportunity';
            opp.StageName = 'Prospecting';
            opp.CloseDate = Date.today();
            opp.AccountId = acc.Id;
			opp.Opportunity_Type__c='New';
			opp.Pricebook2Id = Test.getStandardPricebookId();
            insert opp;
        
        	addressSelector_Controller.getAddresses(opp.Id);
        //	System.AssertEquals(addresses,Rt.name);
    }
       public class AddressSelectionWrapper {
        @AuraEnabled public String category { get; set; }
        @AuraEnabled public String street { get; set; }
        @AuraEnabled public String city { get; set; }
        @AuraEnabled public String state { get; set; }
        @AuraEnabled public String postalCode { get; set; }
        @AuraEnabled public String formatted { get; set; }
        public AddressSelectionWrapper(String addressCategory, String addressStreet, String addressCity, String addressState, string addressPostalCode) {
            this.category = addressCategory;
            this.street = addressStreet;
            this.city = addressCity;
            this.state = addressState;
            this.postalCode = addressPostalCode;
            this.formatted = addressPostalCode;
        }
    }
}