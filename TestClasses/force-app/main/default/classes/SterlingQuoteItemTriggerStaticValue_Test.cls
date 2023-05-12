@isTest
public class SterlingQuoteItemTriggerStaticValue_Test {
    @isTest
    private static void StaticValuesFirstTime_Test() {
        System.assert(SterlingQuoteItemTriggerStaticValues.isFirstBeforeInsert == true);
        SterlingQuoteItemTriggerStaticValues.isFirstBeforeInsert = false;
        System.assert(SterlingQuoteItemTriggerStaticValues.isFirstBeforeInsert == false);
        
        System.assert(SterlingQuoteItemTriggerStaticValues.isFirstAfterInsert == true);
        SterlingQuoteItemTriggerStaticValues.isFirstAfterInsert = false;
        System.assert(SterlingQuoteItemTriggerStaticValues.isFirstAfterInsert == false);

        System.assert(SterlingQuoteItemTriggerStaticValues.isFirstBeforeUpdate == true);
        SterlingQuoteItemTriggerStaticValues.isFirstBeforeUpdate = false;
        System.assert(SterlingQuoteItemTriggerStaticValues.isFirstBeforeUpdate == false);
        
        System.assert(SterlingQuoteItemTriggerStaticValues.isFirstAfterUpdate == true);
        SterlingQuoteItemTriggerStaticValues.isFirstAfterUpdate = false;
        System.assert(SterlingQuoteItemTriggerStaticValues.isFirstAfterUpdate == false);

        System.assert(SterlingQuoteItemTriggerStaticValues.isFirstBeforeDelete == true);
        SterlingQuoteItemTriggerStaticValues.isFirstBeforeDelete = false;
        System.assert(SterlingQuoteItemTriggerStaticValues.isFirstBeforeDelete == false);
        
        System.assert(SterlingQuoteItemTriggerStaticValues.isFirstAfterDelete == true);
        SterlingQuoteItemTriggerStaticValues.isFirstAfterDelete = false;
        System.assert(SterlingQuoteItemTriggerStaticValues.isFirstAfterDelete == false);

        System.assert(SterlingQuoteItemTriggerStaticValues.isFirstBeforeUndelete == true);
        SterlingQuoteItemTriggerStaticValues.isFirstBeforeUndelete = false;
        System.assert(SterlingQuoteItemTriggerStaticValues.isFirstBeforeUndelete == false);
        
        System.assert(SterlingQuoteItemTriggerStaticValues.isFirstAfterUndelete == true);
        SterlingQuoteItemTriggerStaticValues.isFirstAfterUndelete = false;
        System.assert(SterlingQuoteItemTriggerStaticValues.isFirstAfterUndelete == false);
    }
    
}