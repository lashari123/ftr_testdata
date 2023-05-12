public class WSCatalogItems implements Comparable  {
    @AuraEnabled
    public String name {get;set;}
    @AuraEnabled
    public String productName {get;set;}
    @AuraEnabled
    public String parentName {get;set;}
    
    @AuraEnabled
    public String parentId {get;set;}
    
    @AuraEnabled
    public String term {get;set;}
    
    @AuraEnabled
    public String pNum {get;set;}
    
    
    @AuraEnabled
    public String mrc {get;set;}
    @AuraEnabled
    public String nrc {get;set;}    
    @AuraEnabled
    public String mrcTotal {get;set;}
    @AuraEnabled
    public String nrcTotal {get;set;}    
    @AuraEnabled
    public String linetotal {get;set;}        
    @AuraEnabled
    public String action {get;set;}
    @AuraEnabled
    public String mrcUsoc {get;set;}    
    @AuraEnabled
    public String nrcUsoc {get;set;}
    
    @AuraEnabled
    public String uniMrcUsoc {get;set;}    
    @AuraEnabled
    public String uniNrcUsoc {get;set;}
    
    
    @AuraEnabled
    public String nniMrcUsoc {get;set;}    
    @AuraEnabled
    public String nniNrcUsoc {get;set;}
    
    
    @AuraEnabled
    public String speed {get;set;} //evcspeed
    
    
    @AuraEnabled
    public String uniSpeed {get;set;}
    
    @AuraEnabled
    public String nniSpeed {get;set;}
    
    
    @AuraEnabled
    public String qos {get;set;}
    
    
    @AuraEnabled
    public boolean disableAddToQuote {get;set;}
    
    @AuraEnabled
    public List<WSCatalogItems> children {get;set;}
    
    
    public Integer compareTo(Object obj) {
        WSCatalogItems itemObject = (WSCatalogItems)(obj);
        Double objEvcSpeed = 0;
        Double evcSpeed = 0;    
        
        if(itemObject.speed != null && itemObject.speed != '')   
        {
            String str = itemObject.speed.substring(0, itemObject.speed.length()-1);
            str = str.trim();
            System.debug('Speed str:' + str);
            objEvcSpeed = Double.valueOf(str);
            
        }
        
        if(this.speed != null && this.speed != '')   
        {
            String str = '';
            if(itemObject.speed.indexOf('M') > -1) {
				str = itemObject.speed.substring(0, itemObject.speed.indexOf('M'));                
            } else if(itemObject.speed.indexOf('G') > -1) {
                str = itemObject.speed.substring(0, itemObject.speed.indexOf('G'));                
            }

            str = str.trim();
            evcSpeed = Double.valueOf(str);
            
        }    
        if (evcSpeed > objEvcSpeed) {
            return 1;
        }
        
        if (evcSpeed == objEvcSpeed) {
            return 0;
        }
        
        return -1;
    }
}