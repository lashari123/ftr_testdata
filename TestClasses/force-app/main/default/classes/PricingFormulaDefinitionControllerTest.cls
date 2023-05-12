/**
 * @description       : This test class covers the following Apex classes:
 *      TBD_CLASS1
 *      TBD_CLASS2
 *      TBD_CLASS3
 * @author            : TBD
 * @version           : 2
**/
@isTest
private class PricingFormulaDefinitionControllerTest {
    @isTest
    static void testProperties(){
        PricingFormulaDefinitionController ctrl = new PricingFormulaDefinitionController();
        System.assertEquals(false, ctrl.groupHasError);
        System.assertNotEquals(null, ctrl.PricingVarKeyPrefix);
        System.assertNotEquals(null, ctrl.PricingMultiplierKeyPrefix);
        System.assertNotEquals(null, ctrl.PricingLoadingRateKeyPrefix);
        ctrl.clearABPCache();
    }

    @isTest
    static void testMajorMethods(){

        PricingFormulaDefinitionController ctrl = new PricingFormulaDefinitionController();
        
        String varMapJSON = '[{"PICKLIST_REF__C":null,"FIELD_API_NAME__C":"Decimal_1__c","DATA_TYPE__C":"Decimal","NAME":"FiberCostPerFoot"},{"PICKLIST_REF__C":null,"FIELD_API_NAME__C":"Decimal_4__c","DATA_TYPE__C":"Decimal","NAME":"OtherOperatingCost"},{"PICKLIST_REF__C":null,"FIELD_API_NAME__C":"Decimal_2__c","DATA_TYPE__C":"Decimal","NAME":"LoadingRate"},{"PICKLIST_REF__C":null,"FIELD_API_NAME__C":"Integer_3__c","DATA_TYPE__C":"Integer","NAME":"CopperDistance"},{"PICKLIST_REF__C":null,"FIELD_API_NAME__C":"Decimal_3__c","DATA_TYPE__C":"Decimal","NAME":"Multiplier"},{"PICKLIST_REF__C":"VPL.PKL_Term","FIELD_API_NAME__C":"Integer_0__c","DATA_TYPE__C":"Integer","NAME":"Term"},{"PICKLIST_REF__C":null,"FIELD_API_NAME__C":"Boolean_0__c","DATA_TYPE__C":"Boolean","NAME":"LitBuilding"},{"PICKLIST_REF__C":null,"FIELD_API_NAME__C":"Integer_4__c","DATA_TYPE__C":"Integer","NAME":"FiberDistance"},{"PICKLIST_REF__C":null,"FIELD_API_NAME__C":"Decimal_5__c","DATA_TYPE__C":"Decimal","NAME":"CompetitorGroupPrice"},{"PICKLIST_REF__C":"VPL.PKL_ACCESS_SPEED","FIELD_API_NAME__C":"Integer_1__c","DATA_TYPE__C":"Integer","NAME":"Speed"},{"PICKLIST_REF__C":"VPL.PKL_WC_SPEED","FIELD_API_NAME__C":"Integer_2__c","DATA_TYPE__C":"Integer","NAME":"WCMaxSpeed"},{"PICKLIST_REF__C":null,"FIELD_API_NAME__C":"Decimal_0__c","DATA_TYPE__C":"Decimal","NAME":"ClassOfService"},{"PICKLIST_REF__C":"State","FIELD_API_NAME__C":"String_0__c","DATA_TYPE__C":"String","NAME":"State"},{"PICKLIST_REF__C":"ProductCode","FIELD_API_NAME__C":"String_1__c","DATA_TYPE__C":"String","NAME":"ProductCode"}]';
        Pricing_Formula_Var__c[] pvars = (Pricing_Formula_Var__c[])JSON.deserialize(varMapJSON, Pricing_Formula_Var__c[].class);
        insert pvars;

        ctrl.init();

        Map<String, String> mappings = new Map<String, String> {
            'Boolean_1__c' => 'LitBuilding',
            'String_0__c' => 'State',
            'String_1__c' => 'ProductCode',
            'Integer_0__c' => 'Term',
            'Integer_1__c' => 'Speed',
            'Integer_2__c' => 'WCMaxSpeed',
            'Integer_3__c' => 'CopperDistance',
            'Integer_4__c' => 'FiberDistance',
            'Decimal_0__c' => 'ClassOfService',
            'Decimal_1__c' => 'FiberCostPerFoot',
            'Decimal_2__c' => 'LoadingRate',
            'Decimal_3__c' => 'Multiplier',
            'Decimal_4__c' => 'OtherOperatingCost',
            'Decimal_5__c' => 'CompetitorGroupPrice'
        };

        ctrl.currentFormulaGroup = 'Formula_0';
        ctrl.selectFormula();

        ctrl.save();

        ctrl.test();
        ctrl.close();
        ctrl.run();

        ctrl.currentFormulaGroup = '';
        ctrl.selectFormula();
    }
    
    @isTest
    static void testAuraMethods(){
		String formulaName = 'Formula_0__c';
        String productCode = 'ENT_ETH_EIA_0002';
        String serviceTerm = '12 Months';
        String speed = '100 Mbps';
        Map<String, Object> pricingAttrVals = new Map<String, Object>{
            'ATTR_CONTRACT_TERM' => serviceTerm,
            'ATTR_BANDWIDTH' => speed
        };

        QuoteLineItem[] lineItems = ftr_TestDataFactory.getQLI(1, 1);
        insert lineItems;

        Account masterAcc = new Account(Name='Master Acc');
        insert masterAcc;
        
        Account serviceAccount = [SELECT Id, ParentId FROM Account WHERE Name != 'Master Acc' LIMIT 1];
        serviceAccount.ParentId = masterAcc.Id;
        update serviceAccount;

        Product2[] products = [SELECT Id, Name, ProductCode, vlocity_cmt__JSONAttribute__c FROM Product2 WHERE ProductCode=:productCode];
        for (Product2 p : products)
            p.vlocity_cmt__JSONAttribute__c = lineItems[0].vlocity_cmt__JSONAttribute__c;
        update products;

        Test.startTest();
        PricingFormulaDefinitionController.clearCache();
        PricingFormulaDefinitionController.getCalculatedFormula(formulaName);
        PricingFormulaDefinitionController.getConfigurablePricingAttributes(productCode);
        PricingFormulaDefinitionController.testPricingFormula(formulaName, serviceAccount.Id, productCode, serviceTerm, pricingAttrVals);
        Test.stopTest();
    }
}