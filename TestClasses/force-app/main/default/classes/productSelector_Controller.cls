public class productSelector_Controller {

    @AuraEnabled
    public static GetProductsResponse getProducts(Integer numRecords, Integer pageNumber, String filter) {
        Integer offset = (pageNumber - 1) * numRecords;
        GetProductsResponse res = new GetProductsResponse();
        res.currentProducts = filter == null 
            ? res.currentProducts = getAllProducts(numRecords, offset) 
            : getFilteredProducts(numRecords, offset, filter);
        res.totalProducts = filter == null
            ? getCountAllProducts()
            : getCountFilteredProducts(filter);
        return res;
    }
    
    private static List<ftrProductWrapper> getAllProducts(Integer numRecords, Integer offset){
        List<ftrProductWrapper> products = getProductWrappersFromProducts([SELECT Id, Name, Description, Family, ProductCode, UnitPrice__c 
                FROM Product2 
                WHERE isActive = true 
                AND ProductCode != null                                                              
                ORDER BY Name ASC 
                LIMIT :numRecords 
                OFFSET :offset]);
        return products;
    }
    
    private static Integer getCountAllProducts(){
        return [SELECT COUNT() 
                FROM Product2 
                WHERE isActive = true
                AND ProductCode != null];
    }
    
    private static List<ftrProductWrapper> getFilteredProducts(Integer numRecords, Integer offset, String filter){
        filter = '%' + filter + '%';
        return getProductWrappersFromProducts([SELECT Id, Name, Description, Family, ProductCode, UnitPrice__c 
                FROM Product2 
                WHERE isActive = true 
                AND ProductCode != null
                AND (
                    Name LIKE :filter
                    OR Description LIKE :filter
                    OR Family LIKE :filter
                )
                ORDER BY Name ASC 
                LIMIT :numRecords 
                OFFSET :offset]);
    }
    
    private static Integer getCountFilteredProducts(String filter){
        filter = '%' + filter + '%';
        return [SELECT COUNT() 
                FROM Product2 
                WHERE isActive = true 
                AND ProductCode != null
                AND (
                    Name LIKE :filter
                    OR Description LIKE :filter
                    OR Family LIKE :filter
                )];
    }
    
    private static List<ftrProductWrapper> getProductWrappersFromProducts(List<Product2> products) {
        List<ftrProductWrapper> res = new List<ftrProductWrapper>();
        for (Product2 product : products) {
            res.add(new ftrProductWrapper(product));
        }
        return res;
    }
        
    
    public class GetProductsResponse {
        @AuraEnabled public List<ftrProductWrapper> currentProducts { get; set; }
        @AuraEnabled public Integer totalProducts { get; set; }
    }

}