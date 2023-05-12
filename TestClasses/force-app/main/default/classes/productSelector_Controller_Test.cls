@IsTest(seeAllData = true)
public class productSelector_Controller_Test {
    @IsTest
    private static Void productSelector_Controller_Test(){
        String  p1 = [SELECT Id, Name, Description, Family, ProductCode, UnitPrice__c 
            FROM Product2 WHERE isActive = true  and ProductCode != null limit 1].Description;
        
        productSelector_Controller.getProducts(10,10,p1);
        productSelector_Controller.getProducts(10,10,null);
    } 
}