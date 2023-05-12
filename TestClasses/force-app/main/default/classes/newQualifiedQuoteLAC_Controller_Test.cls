@IsTest
public class newQualifiedQuoteLAC_Controller_Test {
    @IsTest
    private static Void newQualifiedQuoteLAC_Controller_Test(){
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
            insert opp;
        
        NewQualifiedQuoteLAC_Controller.quoteEdit_SterlingCPQ(opp.Id);
        NewQualifiedQuoteLAC_Controller.reDirectToSterling(opp.Id,'Billing Address');
        NewQualifiedQuoteLAC_Controller.reDirectToSterling(opp.Id,'Legal Address');
        NewQualifiedQuoteLAC_Controller.reDirectToSterling(opp.Id,'Service Address');
        NewQualifiedQuoteLAC_Controller.reDirectToSterling(opp.Id,'None');
    } 
}