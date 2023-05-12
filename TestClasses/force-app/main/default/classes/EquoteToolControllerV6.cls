public class EquoteToolControllerV6 {
    
    @AuraEnabled
    public static String fetchit(){
        string urler = URL.getSalesforceBaseUrl().toExternalForm();
        
        return (urler);
    } 
    // get type of product 
     @auraEnabled 
    public static string getTypeOfProd(string recordId){
        string typeOfProd = '';
        Opportunity opp = new Opportunity();
        if(recordId != null){
        opp = [select id,Types_of_Product__c from Opportunity where id =: recordId limit 1];
        }
        if(opp != null){
            typeOfProd = opp.Types_of_Product__c;
        }
        
        return typeOfProd ;
    }
   
    // Update contract term year in opporunity
    @auraEnabled 
    public static void updateOpportunity(string recordId,string value){
        Decimal contract = decimal.valueOf(value);
        list<Opportunity> listOfOpp = new list<Opportunity>();
        if(recordId != null){ 
        listOfOpp = [select id,Contract_Term_Years__c from Opportunity where id =: recordId];
        }
        if(listOfOpp != null && !listOfOpp.isEmpty()){
            for(Opportunity opp : listOfOpp){
                opp.Contract_Term_Years__c = contract;
            }
        }
        update listOfOpp;
    }
    
    // Get Address from Account
    @auraEnabled 
    public static Account getSiteAddress(string recordId){
        Opportunity opp = new Opportunity();
        if(recordId != null){
        opp = [select id,AccountId from Opportunity where id =: recordId limit 1];
        }
        Account acc = new Account();
        if(opp.AccountId != null){
        acc = [Select id,ShippingStreet,ShippingCity,ShippingState,ShippingPostalCode,ShippingCountry FROM Account where id=:opp.AccountId limit 1];
        }
        return acc;
    }
    // Get Contact Info
    @auraEnabled 
    public static Contact getContactInfo(string recordId){
        Opportunity opp = new Opportunity();
        if(recordId != null){
        opp = [Select id,Contact__c from Opportunity where id =: recordId];
        }
        Contact con = new Contact();
        if(opp.Contact__c != null){
            con = [Select id,LastName,Phone,Email from Contact where id=: opp.Contact__c limit 1];
        }
        /* if(con != null && con.Phone != null){
String cntPhone = con.Phone;
String PhoneDigits = '';
if(cntPhone.length() >= 10){
PhoneDigits = cntPhone.substring(0,0) + '(' ;
PhoneDigits = PhoneDigits + cntPhone.substring(0,3) + ') ';
PhoneDigits = PhoneDigits + cntPhone.substring(3,6) + '-';
PhoneDigits = PhoneDigits + cntPhone.substring(6,10);
con.Phone = PhoneDigits; 
}
}*/
        return con;       
    }
    // contact insert or update
    @auraEnabled 
    public static void updateContact(string recordId,string name,string email,string phone){
        
        Opportunity opp = new Opportunity();
        if(recordId != null){
        opp = [Select id,Contact__c from Opportunity where id =: recordId];
        }
        Contact con = new Contact();
        Contact con1 = new Contact();
        if(opp.Contact__c != null ){
            con1 = [Select id,LastName,Email,Phone,MobilePhone from Contact where id = : opp.Contact__c limit 1];
            con1.LastName = name;
            con1.Email = email;
            con1.Phone = phone ; 
            if(con1.MobilePhone != null){
            }else{
                con1.MobilePhone = phone;
            }
            //con1.id = opp.Contact__c;
            update con1;
        }
        else{ 
            if(name != null){
                con.LastName = name;
                con.Email = email;
                con.Phone = phone ; 
                insert con;
                if(con.id != null){
                    opp.Contact__c = con.id;
                    update opp;
                }
            }
        }
    }
    // Address verification API
    /*
@auraEnabled
public static string resolveaddress(string street,string city,string state) {
// String statuscode = '';
string street1 = street.replace(' ', '%20');
string city1 = city.replace(' ', '%20');
string state1 = state.replace(' ', '%20');
//  string zipcode1 = zipcode.replace(' ', '%20');
HttpRequest http = new HttpRequest();
http.setEndpoint('https://us-street.api.smartystreets.com/street-address?auth-id=cdd9126e-4a8f-3fc7-d827-9525a84c5897&auth-token=c7i5Bf5aSXIHJbkJ5kiL&street='+street1+'&city='+city1+'&state='+state1);
http.setMethod('POST');
http.setHeader('content-type', 'application/json');
http.setHeader('charset', 'utf-8');
//http.setBody(body);
Http con = new Http();
HttpResponse hs = new HttpResponse();
hs = con.send(http);
System.debug('==============='+hs.getBody());
string statuscode = string.valueOf(hs.getStatusCode());
//map<string,Object> resultMap =  (map<string,Object>)JSON.deserializeUntyped(hs.getBody());
List<Object> resultMap = (List<Object>)JSON.deserializeUntyped(hs.getBody());
if(statuscode == '200' && resultMap != null && !resultMap.isEmpty()){
statuscode = '200';
}
else{
statuscode = 'fail';

}
return statuscode;
}
*/
    
    // Update Types of Product in Opportunity
    @auraEnabled
    public static void typeofproduct(string recordId,string type){
        Opportunity opp = new Opportunity();
        if(recordId != null){
        opp = [select id,Contract_Term_Years__c,Types_of_Product__c from Opportunity where id =: recordId limit 1];
        }
        if(opp != null){
            opp.Types_of_Product__c = type;
        }
        update opp;
    }
    
    // Save Other Products (Custom Product)
    @auraEnabled  
    public static void saveCustomProduct(List<Custom_Product__c> prod,string recordId,integer numberOfSites){
        
        List<Custom_Product__c> ucaasProd = new List<Custom_Product__c>();
        if(prod != null && !prod.isEmpty()){
            for(Custom_Product__c u : prod){
                if(u.ProductName__c != null && u.Quantity__c != null && u.MrcPrice__c != null){
                    u.Total__c  = u.MrcPrice__c * u.Quantity__c;
                    u.Opportunity__c = recordId;
                    u.NumberOfSites__c = numberOfSites;
                    u.MrcPrice__c = u.MrcPrice__c;
                    ucaasProd.add(u); 
                }
            }
        }
        insert ucaasProd;
    }
    
    //  get picklist value of State
    @AuraEnabled
    public static List<String> getPicklistStateValue(){
        List<String> options = new List<String>();
        Schema.DescribeFieldResult fieldResult = Site__c.State__c.getDescribe();
        List<Schema.PicklistEntry> pList = fieldResult.getPicklistValues();
        for (Schema.PicklistEntry p: pList) {
            options.add(p.getLabel());
        }
        return options;
    }
    
    
    // This method is for create site 
    @AuraEnabled
    public static string createSites(string selVal4, string recordId, string city, string country, string street , string postalCode , string province , boolean primary,integer siteNum,string siteName){
        system.debug('=====siteNum====='+selVal4);
         system.debug('=====recordId====='+recordId);
         system.debug('=====city====='+city);
         system.debug('=====country====='+country);
         system.debug('=====siteNum====='+siteNum);
         system.debug('=====siteName====='+siteName);
         Site__c site = new Site__c();
        site.PoE_option__c = selVal4;
        site.Site_city__c = city;
        site.Site_Country__c = country;
        site.Site_Street__c = street;
        site.State__c = province;
        site.Site_zipcode__c = postalCode;
        site.Primary__c = primary;
        site.Opportunity__c = recordId;
        site.Site_Number__c = siteNum;
        site.Site_Name__c = siteName;
        insert site;
        return site.id;
        
        
    }
    
    
    
    // Update CompanySize in Opportunity
    @auraEnabled 
    public static void CompanySize(string companySize, string recordId){
        Integer comSize = 0;
        if(companySize != null) {
            comSize = Integer.valueOf(companySize);
        }
        Opportunity opp = new Opportunity();
        if(recordId != null){
        opp = [select id,Company_size__c from Opportunity where id =: recordId limit 1];
        }
        if(opp != null){
            opp.Company_size__c = comSize;
        }
        update opp;
    }
    
    
    
    // This rule is for E911
    @auraEnabled 
    public static String rule1(List<WrapperClass> wraperlist,string recordId){
        String error = 'false';
        Rule1__c rule = new Rule1__c();
        rule = [select id,Product_Name__c,Condition__c from Rule1__c limit 1];
        Opportunity opp = new Opportunity();
        if(recordId != null){
        opp = [select id,Company_size__c from Opportunity where id =: recordId limit 1];
        }
        if(opp != null && rule != null){
            if(wraperlist != null && !wraperlist.isEmpty()){
                for(WrapperClass wrap : wraperlist){
                    if(wrap.boolval == true){
                        if((wrap.product.Name).contains(rule.Product_Name__c)){
                            if('>=' == rule.Condition__c){
                                Integer quanity = Integer.valueOf(wrap.product.Quantity__c);
                                if(quanity >= opp.Company_size__c){
                                    error = 'Please enter qunatity less than company site on ' +rule.Product_Name__c+ ' product';
                                    break;
                                }
                            }
                            else if('<=' == rule.Condition__c){
                                Integer quanity = Integer.valueOf(wrap.product.Quantity__c);
                                if(quanity <= opp.Company_size__c){
                                    error = 'Please enter qunatity less than company site on ' +rule.Product_Name__c+ ' product';
                                    break;
                                }
                            }
                            else if('==' == rule.Condition__c){
                                Integer quanity = Integer.valueOf(wrap.product.Quantity__c);
                                if(quanity == opp.Company_size__c){
                                    error = 'Please enter qunatity less than company site on ' +rule.Product_Name__c+ ' product';
                                    break;
                                }
                            }
                            else if('>' == rule.Condition__c){
                                Integer quanity = Integer.valueOf(wrap.product.Quantity__c);
                                if(quanity > opp.Company_size__c){
                                    error = 'Please enter qunatity less than company site on ' +rule.Product_Name__c+ ' product';
                                    break;
                                }
                            }
                            else if('<' == rule.Condition__c){
                                Integer quanity = Integer.valueOf(wrap.product.Quantity__c);
                                if(quanity < opp.Company_size__c){
                                    error = 'Please enter qunatity less than company site on ' +rule.Product_Name__c+ ' product';
                                    break;
                                }
                            }
                        } 
                    }
                }
            }
        }
        return error;
    }
    
    // This rule is for smart Voice IP Phone  Quantity
    @auraEnabled 
    public static String smartVoiceIpPhoneRule(List<WrapperClass> licenselist,List<WrapperClass> phonelist){
        string error = 'false';
        integer licenseQty = 0;
        integer phoneQty = 0;
        
        if(licenselist != null && !licenselist.isEmpty()){
            for(WrapperClass lic : licenselist){
                if(lic.boolval == true && lic.product.PremiumPlusRule__c == true){
                    integer qty = integer.valueOf(lic.product.Quantity__c);
                    licenseQty =  licenseQty + qty;
                }
            }
        }
        
        if(phonelist != null && !phonelist.isEmpty()){
            for(WrapperClass phone : phonelist){
                if(phone.boolval == true && phone.product.isSmartIpPhoneRule__c == true){
                    integer qty = integer.valueOf(phone.product.Quantity__c);
                    phoneQty =  phoneQty + qty;
                }
            }
        }
        if(phoneQty != null && licenseQty != null){
            if(phoneQty <= licenseQty){
                error = 'false';
            }
            else{
                error = 'Total of Licenses Premium Plus >= Total of Iphones VVX 311 + VVX 501 + VVX 601';
            }
        }
        if(phoneQty < 1){
            error = 'false';
        }
        
        return error;
    }
    
     // This rule is for smart Voice IP Soundstation  Quantity
     @auraEnabled 
    public static String smartVoiceIpSoundStationRule(List<WrapperClass> licenselist,List<WrapperClass> phonelist){
        string error = 'false';
        integer licenseQty = 0;
        integer phoneQty = 0;
        
        if(licenselist != null && !licenselist.isEmpty()){
            for(WrapperClass lic : licenselist){
                if(lic.boolval == true && lic.product.isConferenceRumSeatRule__c == true){
                    integer qty = integer.valueOf(lic.product.Quantity__c);
                    licenseQty =  licenseQty + qty;
                }
            }
        }
        
        if(phonelist != null && !phonelist.isEmpty()){
            for(WrapperClass phone : phonelist){
                if(phone.boolval == true && phone.product.isIpSoundStationRule__c == true){
                    integer qty = integer.valueOf(phone.product.Quantity__c);
                    phoneQty =  phoneQty + qty;
                }
            }
        }
        if(phoneQty != null && licenseQty != null){
            if(phoneQty <= licenseQty){
                error = 'false';
            }
            else{
                error = 'Total of Licenses Conference Room Seat >= Total of IP Soundstation 5000  + IP Soundstation 6000  + IP Soundstation 7000 ';
            }
        }
        if(phoneQty < 1){
            error = 'false';
        }
        
        return error;
    }
   
    // This rule is for ucaas IP Phone  Quantity
    @auraEnabled 
    public static String rule2(List<WrapperClass> licenselist,List<WrapperClass> phonelist){
        String error = 'false';
        Integer licenseQunatity = 0;
        Integer phoneQunatity = 0;
        Integer licenseQunatity2 = 0;
        Integer phoneQunatity2 = 0;
        if(licenselist != null && !licenselist.isEmpty()){
            for(WrapperClass lin : licenselist){
                if(lin.boolval == true && lin.product.IpPhoneRule1__c == true){
                    Integer quanity = Integer.valueOf(lin.product.Quantity__c);
                    licenseQunatity = licenseQunatity + quanity;
                }
                if(lin.boolval == true && lin.product.IpPhoneRule2__c == true){
                    Integer quanity = Integer.valueOf(lin.product.Quantity__c);
                    licenseQunatity2 = licenseQunatity2 + quanity;
                }
            }
        }
        if(phonelist != null && !phonelist.isEmpty()){
            for(WrapperClass phone : phonelist){
                if(phone.boolval == true && phone.product.IpPhoneRule1__c == true){
                    Integer quanity = Integer.valueOf(phone.product.Quantity__c);
                    phoneQunatity = phoneQunatity + quanity;
                }
                if(phone.boolval == true && phone.product.IpPhoneRule2__c == true){
                    Integer quanity = Integer.valueOf(phone.product.Quantity__c);
                    phoneQunatity2 = phoneQunatity2 + quanity;
                }
            }
            
        }
        if(phoneQunatity > licenseQunatity){
            error = 'Total of Licenses Essential + Premier + Elite >= Total of Iphones 6920 + 6930 + 6940';
        }
        if(phoneQunatity2 > licenseQunatity2){
            error = 'Licenses Outboud >= Total of Analog + Paging Adapter';
        }
        return error;
    }
    
    //This rule for Toll Free Bundle Minutes
    @auraEnabled 
    public static String telecommRule3(List<WrapperClass> addOnList,List<WrapperClass> telecommList){
        string error = 'One Toll free number is required from Add on for the Toll free bundle minutes';
        Boolean checkTollMin = false;
        if(telecommList != null && !telecommList.isEmpty()){
            for(WrapperClass tel : telecommList){
                if(tel.boolval == true){
                    checkTollMin = true;
                    
                }
                else{
                    error = 'false';
                }
            }
        }
        else{
            error = 'false';
        }
        
        if(checkTollMin){
            if(addOnList != null && !addOnList.isEmpty()){
                for(WrapperClass add : addOnList){
                    if(add.boolval == true){
                        if(add.product.TollFreeRule__c == true){
                            if(add.product.Quantity__c != null){
                                error = 'false';
                                break;
                            }
                            else{
                                error = 'One Toll free number is required from Add on for the Toll free bundle minutes';
                                break;
                                System.debug('=====testelse===');
                            }
                        }else{
                            error = 'One Toll free number is required from Add on for the Toll free bundle minutes';
                        }
                    }
                    else{
                        error = 'One Toll free number is required from Add on for the Toll free bundle minutes';
                    }
                }
            }
        }
        
        return error;
    }
    
      //This rule for analog ATA
      @auraEnabled 
    public static String analogATArule(List<WrapperClass> licenseList,List<WrapperClass> switchPoeList){
        string error = 'false';
        Boolean check = false;
        if(switchPoeList != null && !switchPoeList.isEmpty()){
            for(WrapperClass lic : switchPoeList){
                if(lic.boolval == true && lic.product.isATArule__c == true){
  					check = true;
    
                }
                else{
                    error = 'false';
                }
            }
        }
        else{
             error = 'false';
        }
        if(check){
            if(licenseList != null && !licenseList.isEmpty()){
                for(WrapperClass lic : licenseList){
                    if(lic.boolval == true && lic.product.isAnalogRule__c == true){
                        error = 'false';
                        break;
                    }
                    else{
                       error = 'analog product is required for ATA'; 
                    }
                }
            }
        }
        return error;
    }
     /*   //This rule for analog ATA
        @auraEnabled 
        public static String analogATArule(List<WrapperClass> licenseList,List<WrapperClass> switchPoeList){
        string error = 'ATA is required for analog product';
        Boolean checkTollMin = false;
        if(licenseList != null && !licenseList.isEmpty()){
            for(WrapperClass lic : licenseList){
                if(lic.boolval == true && lic.product.isAnalogRule__c == true){
                    checkTollMin = true;
                    system.debug('====checkTollMin1======'+ checkTollMin);
                }
                else{
                    error = 'false';
                     system.debug('====checkTollMin2======'+ checkTollMin);
                }
            }
        }
        else{
            error = 'false';
             system.debug('====checkTollMin3======'+ checkTollMin);
        }
        
        if(checkTollMin){
            if(switchPoeList != null && !switchPoeList.isEmpty()){
                for(WrapperClass SwitchPoe : switchPoeList){
                    if(SwitchPoe.boolval == true){
                        if(SwitchPoe.product.isATArule__c == true){
                            if(SwitchPoe.product.Quantity__c != null){
                                error = 'false';
                                break;
                                system.debug('====checbjkdfhewlgfhwrlwrlwrckTollMin3======');
                            }
                            else{
                                error = 'ATA is required for analog product';
                                break;
                                System.debug('=====testelse===');
                            }
                        }else{
                            error = 'ATA is required for analog product';
                        }
                    }
                    else{
                        error = 'ATA is required for analog product';
                    }
                }
            }
            else{
                error = 'ATA is required for analog product';
            }
        }
        
        return error;
    } 
    */
    // This rule for POE Switch 
    @auraEnabled 
    public static String poeSwitch(List<WrapperClass> swithesAndPOElist,string selVal4){
        
        String errormessage = 'false';  
        Boolean check = false;
        if(selVal4 == 'Switch'){
            if(swithesAndPOElist != null && !swithesAndPOElist.isEmpty()){
                for(WrapperClass switches : swithesAndPOElist){
                    if(switches.boolval == true ){
                        if(switches.product.POE_Switch_Rule__c == true && switches.product.Quantity__c != null){
                            check = true;
                        } 
                    }
                }
            }
        }
        else if(selVal4 == 'Customer Provided' || selVal4 == 'Not PoE' ){
            check = true;
        }
        if(check){
            errormessage = 'false';
        }else{
            errormessage = 'Please select at least one PoE';
        }
        return errormessage; 
    }
    
    
    
    // This method is for insert products in OpportunityLineItem
    @auraEnabled 
    public static void saveRecord(string recordId,list<WrapperClass> productList,list<WrapperClass> productListAddOn,list<WrapperClass> productListTelecomm,list<WrapperClass> productListIpPhones,list<WrapperClass> productListIPPhonePower,list<WrapperClass> swithesAndPOElist,string selVal4,Integer numberOfSites,string siteId){
        
        List<WrapperClass> productList1 = new List<WrapperClass> ();
        if(productList != null && !productList.isEmpty()){
            for(WrapperClass wrap : productList) {
                WrapperClass w = new WrapperClass(wrap.product,wrap.boolval,wrap.boolval2,wrap.boolval3,wrap.pricebookEntry,wrap.Total,wrap.NRCTotal);
                productList1.add(w);
            }
        }
        
        Opportunity opp = new Opportunity();
        List<OpportunityLineItem> opplistItem = new List<OpportunityLineItem>();
        opp = [select id,Contract_Term_Years__c,Pricebook2Id from Opportunity where id =: recordId limit 1];
        Integer sizeProd = 0;
        if(productList1 != null && !productList1.isEmpty() && opp != null){
            // Integer count1 = 0;
            for(WrapperClass prod : productList1){
                if(prod.boolval == true){
                    //count1++;
                    OpportunityLineItem oppLineProd = new OpportunityLineItem();
                    oppLineProd.Product2Id = prod.product.Id;
                    oppLineProd.Product_Name__c = prod.product.Name;
                    oppLineProd.Category__c = prod.product.Family;
                    oppLineProd.Sub_Category__c = prod.product.Product_Subcategory__c;
                    oppLineProd.Type_of_Billing__c = prod.pricebookEntry.Type_of_Billing__c;
                    oppLineProd.Product_Type__c = prod.product.Product_Type__c;
                    oppLineProd.OpportunityId   = opp.Id;
                    oppLineProd.Equote_ext_ID__c = opp.Id+''+numberOfSites+''+System.Now();
                    oppLineProd.Site__c = siteId;
                    oppLineProd.Equipment__c = prod.product.Equipment__c;
                    oppLineProd.Site_Number__c = numberOfSites;
                    oppLineProd.PriceBook2Id__c = prod.pricebookEntry.Pricebook2Id;
                    oppLineProd.PricebookEntryId     = prod.pricebookEntry.id;
                    oppLineProd.Index__c = prod.product.License_Order__c;
                    oppLineProd.Quantity = decimal.valueOf(prod.product.Quantity__c);
                    oppLineProd.Term__c = prod.product.Term__c;
                    oppLineProd.Part_Number__c = prod.product.Part_Number_of_Product__c;
                    oppLineProd.PoE__c = selVal4;
                    oppLineProd.Filter_Product__c = 'Parent';
                    oppLineProd.Show_in_PDF__c = prod.product.Show_in_PDF__c;
                    oppLineProd.VENDOR_PRICE_LIST_TO_OFFER__c = prod.pricebookEntry.VENDORPRICELISTTOFTR__c;
                    oppLineProd.UNITCOST__c = prod.pricebookEntry.UNITCOST__c;
                    oppLineProd.GPM__c = prod.pricebookEntry.GPM__c;
                    oppLineProd.DISCOUNT__c = prod.pricebookEntry.DISCOUNT_Price__c;
                    oppLineProd.isE911__c = prod.product.isE911__c;
                    oppLineProd.isElite__c = prod.product.isElite__c;
                    oppLineProd.isEssential__c = prod.product.isEssential__c;
                    oppLineProd.isOutbound__c = prod.product.isOutbound__c;
                    oppLineProd.isPremier__c = prod.product.isPremier__c;
                    oppLineProd.isTollFreeNum__c = prod.product.isTollFreeNum__c;
                    oppLineProd.isWebFax__c = prod.product.isWebFax__c;
                    if(prod.pricebookEntry.Type_of_Billing__c == 'MRC'){
                        if(prod.pricebookEntry.UnitPrice != null) {
                            oppLineProd.Unit_Price__c = prod.pricebookEntry.UnitPrice;
                            oppLineProd.TotalPrice = oppLineProd.Quantity * prod.pricebookEntry.UnitPrice;    
                        }   
                    }
                    else{
                        if(prod.pricebookEntry.UnitPrice != null) {
                            oppLineProd.NRC__c = prod.pricebookEntry.UnitPrice;
                            oppLineProd.TotalPrice = prod.pricebookEntry.UnitPrice * oppLineProd.Quantity;   
                        } 
                    }
                    sizeProd += Integer.valueOf(prod.product.Quantity__c);
                    opplistItem.add(oppLineProd);
                    
                    
                }
            }
        }
        
        List<WrapperClass> productListAddOn1 = new List<WrapperClass> ();
        if(productListAddOn != null && !productListAddOn.isEmpty()){
            for(WrapperClass wrap : productListAddOn) {
                WrapperClass w = new WrapperClass(wrap.product,wrap.boolval,wrap.boolval2,wrap.boolval3,wrap.pricebookEntry,wrap.Total,wrap.NRCTotal);
                productListAddOn1.add(w);
                
            }
        }
        
        Opportunity opp1 = new Opportunity();
        opp1 = [select id,Contract_Term_Years__c from Opportunity where id =: recordId limit 1];
        if(productListAddOn1 != null && !productListAddOn1.isEmpty() && opp1 != null){
            // Integer count2 = 0;
            for(WrapperClass prod : productListAddOn1){
                
                if(prod.boolval == true){
                    //count2++;
                    OpportunityLineItem oppLineProd1 = new OpportunityLineItem();
                    oppLineProd1.Product2Id = prod.product.Id;
                    oppLineProd1.Product_Name__c = prod.product.Name;
                    oppLineProd1.Category__c    = prod.product.Family;
                    oppLineProd1.Sub_Category__c = prod.product.Product_Subcategory__c;
                    oppLineProd1.Type_of_Billing__c = prod.pricebookEntry.Type_of_Billing__c;
                    oppLineProd1.Product_Type__c = prod.product.Product_Type__c;
                    oppLineProd1.OpportunityId  = opp1.Id;
                    oppLineProd1.Equote_ext_ID__c = opp1.Id+''+numberOfSites+''+System.Now();
                    oppLineProd1.Site__c = siteId;
                    oppLineProd1.Equipment__c = prod.product.Equipment__c;
                    oppLineProd1.Term__c = prod.product.Term__c;
                    oppLineProd1.Site_Number__c = numberOfSites;
                    oppLineProd1.Index__c = prod.product.License_Order__c;
                    oppLineProd1.PriceBook2Id__c = prod.pricebookEntry.Pricebook2Id;
                    oppLineProd1.PricebookEntryId    = prod.pricebookEntry.id;
                    oppLineProd1.Quantity    = decimal.valueOf(prod.product.Quantity__c);
                    oppLineProd1.Part_Number__c = prod.product.Part_Number_of_Product__c;
                    oppLineProd1.PoE__c = selVal4;
                    oppLineProd1.Show_in_PDF__c = prod.product.Show_in_PDF__c;
                    oppLineProd1.Filter_Product__c = 'Parent';
                    oppLineProd1.VENDOR_PRICE_LIST_TO_OFFER__c = prod.pricebookEntry.VENDORPRICELISTTOFTR__c;
                    oppLineProd1.DISCOUNT__c = prod.pricebookEntry.DISCOUNT_Price__c;
                    oppLineProd1.GPM__c = prod.pricebookEntry.GPM__c;
                    oppLineProd1.UNITCOST__c = prod.pricebookEntry.UNITCOST__c;
                    oppLineProd1.isE911__c = prod.product.isE911__c;
                    oppLineProd1.isElite__c = prod.product.isElite__c;
                    oppLineProd1.isEssential__c = prod.product.isEssential__c;
                    oppLineProd1.isOutbound__c = prod.product.isOutbound__c;
                    oppLineProd1.isPremier__c = prod.product.isPremier__c;
                    oppLineProd1.isTollFreeNum__c = prod.product.isTollFreeNum__c;
                    oppLineProd1.isWebFax__c = prod.product.isWebFax__c;
                    oppLineProd1.isAdditionalDID__c = prod.product.isAdditionalDID__c;
                    oppLineProd1.isCallerId__c = prod.product.isCallerId__c;
                    oppLineProd1.isAdditionalDirectory__c = prod.product.isAdditionalDirectory__c;
                    oppLineProd1.isExtendedMarket__c = prod.product.isExtendedMarket__c;
                    oppLineProd1.isAdditionalManaged__c = prod.product.isAdditionalManaged__c;
                    oppLineProd1.isBusinessAnalytic__c = prod.product.isBusinessAnalytic__c;
                    if(prod.pricebookEntry.Type_of_Billing__c == 'MRC'){
                        if(prod.pricebookEntry.UnitPrice != null) {
                            oppLineProd1.Unit_Price__c = prod.pricebookEntry.UnitPrice;
                            oppLineProd1.TotalPrice = prod.pricebookEntry.UnitPrice * oppLineProd1.Quantity;
                        }
                    }else{
                        if(prod.pricebookEntry.UnitPrice != null) {
                            oppLineProd1.NRC__c = prod.pricebookEntry.UnitPrice;
                            oppLineProd1.TotalPrice = prod.pricebookEntry.UnitPrice * oppLineProd1.Quantity;   
                        } 
                    }
                    opplistItem.add(oppLineProd1);
                    
                }
            }
        }
        List<WrapperClass> productListTelecomm1 = new List<WrapperClass> ();
        if(productListTelecomm != null && !productListTelecomm.isEmpty()){ 
            for(WrapperClass wrap : productListTelecomm) {
                WrapperClass w = new WrapperClass(wrap.product,wrap.boolval,wrap.boolval2,wrap.boolval3,wrap.pricebookEntry,wrap.Total,wrap.NRCTotal);
                productListTelecomm1.add(w);
                
            }
        }
        
        Opportunity opp2 = new Opportunity();
        opp2 = [select id,Contract_Term_Years__c from Opportunity where id =: recordId limit 1];
        if(productListTelecomm1 != null && !productListTelecomm1.isEmpty() && opp2 != null){
            // Integer count3 = 0;
            for(WrapperClass prod : productListTelecomm1){
                
                if(prod.boolval == true){
                    // count3++;
                    OpportunityLineItem oppLineProd2 = new OpportunityLineItem();
                    oppLineProd2.Product2Id = prod.product.Id;
                    oppLineProd2.Product_Name__c = prod.product.Name;
                    oppLineProd2.Category__c    = prod.product.Family;
                    oppLineProd2.Sub_Category__c = prod.product.Product_Subcategory__c;
                    oppLineProd2.Type_of_Billing__c = prod.pricebookEntry.Type_of_Billing__c;
                    oppLineProd2.Product_Type__c = prod.product.Product_Type__c;
                    oppLineProd2.OpportunityId  = opp2.Id;
                    oppLineProd2.Equote_ext_ID__c = opp2.Id+''+numberOfSites+''+System.Now();
                    oppLineProd2.Site__c = siteId;
                    oppLineProd2.Equipment__c = prod.product.Equipment__c;
                    oppLineProd2.Term__c = prod.product.Term__c;
                    oppLineProd2.Index__c = prod.product.License_Order__c;
                    oppLineProd2.Site_Number__c = numberOfSites;
                    oppLineProd2.PriceBook2Id__c = prod.pricebookEntry.Pricebook2Id;
                    oppLineProd2.PricebookEntryId     = prod.pricebookEntry.id;
                    oppLineProd2.Part_Number__c = prod.product.Part_Number_of_Product__c;
                    oppLineProd2.PoE__c = selVal4;
                    oppLineProd2.Show_in_PDF__c = prod.product.Show_in_PDF__c;
                    oppLineProd2.Filter_Product__c = 'Parent';
                    oppLineProd2.VENDOR_PRICE_LIST_TO_OFFER__c = prod.pricebookEntry.VENDORPRICELISTTOFTR__c;
                    oppLineProd2.UNITCOST__c = prod.pricebookEntry.UNITCOST__c;
                    oppLineProd2.GPM__c = prod.pricebookEntry.GPM__c;
                    oppLineProd2.DISCOUNT__c = prod.pricebookEntry.DISCOUNT_Price__c;
                    oppLineProd2.Quantity    = decimal.valueOf(prod.product.Quantity__c);
                    if(prod.pricebookEntry.Type_of_Billing__c == 'MRC'){
                        if(prod.pricebookEntry.UnitPrice != null) {
                            oppLineProd2.Unit_Price__c = prod.pricebookEntry.UnitPrice;
                            oppLineProd2.TotalPrice = prod.pricebookEntry.UnitPrice * oppLineProd2.Quantity;
                        }
                    }else{
                        if(prod.pricebookEntry.UnitPrice != null) {
                            oppLineProd2.NRC__c = prod.pricebookEntry.UnitPrice;
                            oppLineProd2.TotalPrice = prod.pricebookEntry.UnitPrice * oppLineProd2.Quantity;   
                        } 
                    }
                    opplistItem.add(oppLineProd2);
                    
                }
            }
        }
        List<WrapperClass> productListIpPhones1 = new List<WrapperClass> ();
        if(productListIpPhones != null && !productListIpPhones.isEmpty()){
            for(WrapperClass wrap : productListIpPhones) {
                WrapperClass w = new WrapperClass(wrap.product,wrap.boolval,wrap.boolval2,wrap.boolval3,wrap.pricebookEntry,wrap.Total,wrap.NRCTotal);
                productListIpPhones1.add(w);
                
            }
        }
        
        Opportunity opp3 = new Opportunity();
        opp3 = [select id,Contract_Term_Years__c from Opportunity where id =: recordId limit 1];
        if(productListIpPhones1 != null && !productListIpPhones1.isEmpty() && opp3 != null){
            // Integer count4 = 0;
            for(WrapperClass prod : productListIpPhones1){
                
                if(prod.boolval == true){
                    //   count4++;
                    OpportunityLineItem oppLineProd3 = new OpportunityLineItem();
                    oppLineProd3.Product2Id = prod.product.Id;
                    oppLineProd3.Product_Name__c = prod.product.Name;
                    oppLineProd3.Category__c    = prod.product.Family;
                    oppLineProd3.Sub_Category__c = prod.product.Product_Subcategory__c;
                    oppLineProd3.Type_of_Billing__c = prod.pricebookEntry.Type_of_Billing__c;
                    oppLineProd3.Product_Type__c = prod.product.Product_Type__c;
                    oppLineProd3.OpportunityId  = opp3.Id;
                    oppLineProd3.Equote_ext_ID__c = opp3.Id+''+numberOfSites+''+System.Now();
                    oppLineProd3.Site__c = siteId;
                    oppLineProd3.Equipment__c = prod.product.Equipment__c;
                    oppLineProd3.Term__c = prod.product.Term__c;
                    oppLineProd3.Index__c = prod.product.License_Order__c;
                    oppLineProd3.Site_Number__c = numberOfSites;
                    oppLineProd3.PriceBook2Id__c = prod.pricebookEntry.Pricebook2Id;
                    oppLineProd3.PricebookEntryId    = prod.pricebookEntry.id;
                    oppLineProd3.Part_Number__c = prod.product.Part_Number_of_Product__c;
                    oppLineProd3.Quantity    = decimal.valueOf(prod.product.Quantity__c);
                    oppLineProd3.PoE__c = selVal4;
                    oppLineProd3.Filter_Product__c = 'Parent';
                    oppLineProd3.VENDOR_PRICE_LIST_TO_OFFER__c = prod.pricebookEntry.VENDORPRICELISTTOFTR__c;
                    oppLineProd3.GPM__c = prod.pricebookEntry.GPM__c;
                    oppLineProd3.DISCOUNT__c = prod.pricebookEntry.DISCOUNT_Price__c;
                    oppLineProd3.UNITCOST__c = prod.pricebookEntry.UNITCOST__c;
                    oppLineProd3.Show_in_PDF__c = prod.product.Show_in_PDF__c;
                    if(prod.pricebookEntry.Type_of_Billing__c == 'MRC'){
                        if(prod.pricebookEntry.UnitPrice != null) {
                            oppLineProd3.Unit_Price__c = prod.pricebookEntry.UnitPrice;
                            oppLineProd3.TotalPrice =prod.pricebookEntry.UnitPrice * oppLineProd3.Quantity; 
                        }
                    }else{
                        if(prod.pricebookEntry.UnitPrice != null) {
                            oppLineProd3.NRC__c = prod.pricebookEntry.UnitPrice;
                            oppLineProd3.TotalPrice = prod.pricebookEntry.UnitPrice * oppLineProd3.Quantity;     
                        } 
                    }
                    opplistItem.add(oppLineProd3);
                    
                }
            }
        }
        
        //Rule for Adapter station level(IP Phones)
        // ****Start ****
        /*   if(productListIpPhones1 != null && !productListIpPhones1.isEmpty() && opp3 != null){
Boolean Adapter = false;
decimal qty = 0;
for(WrapperClass prod : productListIpPhones1){
if(prod.boolval == true){
if(prod.product.Accessories1__c == true){
Adapter = true;
qty = decimal.valueOf(prod.product.Quantity__c);
}
}
}
if(Adapter){
Opportunity oppRecord = new Opportunity();
List<Product2> prodlst = new List<Product2>();
List<PricebookEntry> priceEntry = new List<PricebookEntry>();
Set<Id> productId = new Set<Id>();
oppRecord = [select id,Contract_Term_Years__c,Pricebook2Id from Opportunity where id =: recordId limit 1];
prodlst = [select id,Family,Name,IpPhoneRule1__c,IpPhoneRule2__c,Equipment__c,Product_Subcategory__c,Year__c,Product_Type__c,is_show_on_ux__c,Part_Number__c,Term__c,Part_Number_of_Product__c,Description,ProductCode,IsActive,License_Order__c,SetUp_Order__c,Child__c,Parent__c,Show_in_PDF__c,Accessories__c,Accessories1__c from Product2 where IsActive =: true AND (Product_Subcategory__c =:'IP Phones' AND Family =: 'FAW') AND (Product_Type__c =: 'FAW UCaaS' AND Accessories__c =: true) ORDER BY License_Order__c ] ;
if(prodlst != null && !prodlst.isEmpty()){
for(Product2 prod : prodlst){
productId.add(prod.id);
}
}
priceEntry = [Select id,UnitPrice,NRC_Unit_Price__c,Pricebook2Id,Product2Id,Type_of_Billing__c,VENDORPRICELISTTOFTR__c,UNITCOST__c,GPM__c,DISCOUNT_Price__c,IsActive from PricebookEntry where Product2Id =: productId and Pricebook2Id =: oppRecord.Pricebook2Id and IsActive =: true];
if(prodlst != null && !prodlst.isEmpty()){
if(priceEntry != null && !priceEntry.isEmpty()){
// Integer count5 = 0;
for(Product2 prod : prodlst){
for(PricebookEntry entry : priceEntry){
if(prod.id == entry.Product2Id){
//   count5++;
OpportunityLineItem oppLineP3 = new OpportunityLineItem();
oppLineP3.Product2Id = prod.Id;
oppLineP3.Product_Name__c = prod.Name;
oppLineP3.Category__c    = prod.Family;
oppLineP3.Sub_Category__c = prod.Product_Subcategory__c;
oppLineP3.Type_of_Billing__c = entry.Type_of_Billing__c;
oppLineP3.Product_Type__c = prod.Product_Type__c;
oppLineP3.OpportunityId  = oppRecord.Id;
oppLineP3.Equote_ext_ID__c = oppRecord.Id+''+numberOfSites+''+System.Now();
oppLineP3.Site__c = siteId;
oppLineP3.Equipment__c = prod.Equipment__c;
oppLineP3.Term__c = prod.Term__c;
oppLineP3.Index__c = prod.License_Order__c;
oppLineP3.Site_Number__c = numberOfSites;
oppLineP3.PriceBook2Id__c = entry.Pricebook2Id;
oppLineP3.PricebookEntryId    = entry.id;
oppLineP3.Part_Number__c = prod.Part_Number_of_Product__c;
oppLineP3.Quantity    = qty;
oppLineP3.PoE__c = selVal4;
oppLineP3.Filter_Product__c = 'Parent';
oppLineP3.VENDOR_PRICE_LIST_TO_OFFER__c = entry.VENDORPRICELISTTOFTR__c;
oppLineP3.GPM__c = entry.GPM__c;
oppLineP3.DISCOUNT__c = entry.DISCOUNT_Price__c;
oppLineP3.UNITCOST__c = entry.UNITCOST__c;
oppLineP3.Show_in_PDF__c = prod.Show_in_PDF__c;
if(entry.UnitPrice != null) {
oppLineP3.NRC__c = entry.UnitPrice;
oppLineP3.TotalPrice = entry.UnitPrice * oppLineP3.Quantity;     
} 

opplistItem.add(oppLineP3);
}
}
}
}
}
}
} */
        // *** End ***
        
        List<WrapperClass> productListIPPhonePower1 = new List<WrapperClass> ();
        for(WrapperClass wrap : productListIPPhonePower) {
            WrapperClass w = new WrapperClass(wrap.product,wrap.boolval,wrap.boolval2,wrap.boolval3,wrap.pricebookEntry,wrap.Total,wrap.NRCTotal);
            productListIPPhonePower1.add(w);
            
        }
        
        Opportunity opp4 = new Opportunity();
        opp4 = [select id,Contract_Term_Years__c from Opportunity where id =: recordId limit 1];
        // Integer count6 = 0;
        for(WrapperClass prod : productListIPPhonePower1){
            
            if(prod.boolval == true){
                //   count6++;
                OpportunityLineItem oppLineProd4 = new OpportunityLineItem();
                oppLineProd4.Product2Id = prod.product.Id;
                oppLineProd4.Product_Name__c = prod.product.Name;
                oppLineProd4.Category__c    = prod.product.Family;
                oppLineProd4.Sub_Category__c = prod.product.Product_Subcategory__c;
                oppLineProd4.Type_of_Billing__c = prod.pricebookEntry.Type_of_Billing__c;
                oppLineProd4.Product_Type__c = prod.product.Product_Type__c;
                oppLineProd4.OpportunityId  = opp4.Id;
                oppLineProd4.Equote_ext_ID__c = opp4.Id+''+numberOfSites+''+System.Now();
                oppLineProd4.Site__c = siteId;
                oppLineProd4.Equipment__c = prod.product.Equipment__c;
                oppLineProd4.Term__c = prod.product.Term__c;
                oppLineProd4.Index__c = prod.product.License_Order__c;
                oppLineProd4.Site_Number__c = numberOfSites;
                oppLineProd4.PriceBook2Id__c = prod.pricebookEntry.Pricebook2Id;
                oppLineProd4.PricebookEntryId    = prod.pricebookEntry.id;
                oppLineProd4.Part_Number__c = prod.product.Part_Number_of_Product__c;
                oppLineProd4.PoE__c = selVal4;
                oppLineProd4.Show_in_PDF__c = prod.product.Show_in_PDF__c;
                oppLineProd4.Filter_Product__c = 'Parent';
                oppLineProd4.VENDOR_PRICE_LIST_TO_OFFER__c = prod.pricebookEntry.VENDORPRICELISTTOFTR__c;
                oppLineProd4.DISCOUNT__c = prod.pricebookEntry.DISCOUNT_Price__c;
                oppLineProd4.GPM__c = prod.pricebookEntry.GPM__c;
                oppLineProd4.UNITCOST__c = prod.pricebookEntry.UNITCOST__c;
                oppLineProd4.Quantity    = decimal.valueOf(prod.product.Quantity__c);
                if(prod.pricebookEntry.Type_of_Billing__c == 'MRC'){
                    if(prod.pricebookEntry.UnitPrice != null) {
                        oppLineProd4.Unit_Price__c = prod.pricebookEntry.UnitPrice;
                        oppLineProd4.Sub_Total__c    = decimal.valueOf(prod.product.Quantity__c) * prod.pricebookEntry.UnitPrice;
                        oppLineProd4.TotalPrice = prod.pricebookEntry.UnitPrice * oppLineProd4.Quantity;  
                    }
                }else{
                    if(prod.pricebookEntry.UnitPrice != null) {
                        
                        oppLineProd4.NRC__c = prod.pricebookEntry.UnitPrice;
                        oppLineProd4.TotalPrice = prod.pricebookEntry.UnitPrice * oppLineProd4.Quantity;     
                    } 
                }
                opplistItem.add(oppLineProd4);
                
            }
        }
        
        
        
        List<WrapperClass> swithesAndPOElist1 = new List<WrapperClass> ();
        if(swithesAndPOElist != null && !swithesAndPOElist.isEmpty()){
            for(WrapperClass wrap : swithesAndPOElist) {
                WrapperClass w = new WrapperClass(wrap.product,wrap.boolval,wrap.boolval2,wrap.boolval3,wrap.pricebookEntry,wrap.Total,wrap.NRCTotal);
                swithesAndPOElist1.add(w);
                
            }
        }
        if(swithesAndPOElist1 != null && !swithesAndPOElist1.isEmpty()){
            //  Integer count7 = 0;
            for(WrapperClass prod : swithesAndPOElist1){
                if(prod.boolval == true){
                    // count7++;
                    OpportunityLineItem oppLineProd4 = new OpportunityLineItem();
                    oppLineProd4.Product2Id = prod.product.Id;
                    oppLineProd4.Product_Name__c = prod.product.Name;
                    oppLineProd4.Category__c    = prod.product.Family;
                    oppLineProd4.Sub_Category__c = prod.product.Product_Subcategory__c;
                    oppLineProd4.Type_of_Billing__c = prod.pricebookEntry.Type_of_Billing__c;
                    oppLineProd4.Product_Type__c = prod.product.Product_Type__c;
                    oppLineProd4.OpportunityId  = opp4.Id;
                    oppLineProd4.Equote_ext_ID__c = opp4.Id+''+numberOfSites+''+System.Now();
                    oppLineProd4.Site__c = siteId;
                    oppLineProd4.Equipment__c = prod.product.Equipment__c;
                    oppLineProd4.Term__c = prod.product.Term__c;
                    oppLineProd4.Index__c = prod.product.License_Order__c;
                    oppLineProd4.Site_Number__c = numberOfSites;
                    oppLineProd4.PriceBook2Id__c = prod.pricebookEntry.Pricebook2Id;
                    oppLineProd4.PricebookEntryId    = prod.pricebookEntry.id;
                    oppLineProd4.Part_Number__c = prod.product.Part_Number_of_Product__c;
                    oppLineProd4.PoE__c = selVal4;
                    oppLineProd4.Show_in_PDF__c = prod.product.Show_in_PDF__c;
                    oppLineProd4.Filter_Product__c = 'Parent';
                    oppLineProd4.VENDOR_PRICE_LIST_TO_OFFER__c = prod.pricebookEntry.VENDORPRICELISTTOFTR__c;
                    oppLineProd4.DISCOUNT__c = prod.pricebookEntry.DISCOUNT_Price__c;
                    oppLineProd4.GPM__c = prod.pricebookEntry.GPM__c;
                    oppLineProd4.UNITCOST__c = prod.pricebookEntry.UNITCOST__c;
                    oppLineProd4.Quantity    = decimal.valueOf(prod.product.Quantity__c);
                    if(prod.pricebookEntry.Type_of_Billing__c == 'MRC'){
                        if(prod.pricebookEntry.UnitPrice != null) {
                            oppLineProd4.Unit_Price__c = prod.pricebookEntry.UnitPrice;
                            oppLineProd4.Sub_Total__c    = decimal.valueOf(prod.product.Quantity__c) * prod.pricebookEntry.UnitPrice;
                            oppLineProd4.TotalPrice = prod.pricebookEntry.UnitPrice * oppLineProd4.Quantity;     
                        }
                    }else{
                        if(prod.pricebookEntry.UnitPrice != null) {
                            oppLineProd4.NRC__c = prod.pricebookEntry.UnitPrice;
                            oppLineProd4.TotalPrice = prod.pricebookEntry.UnitPrice * oppLineProd4.Quantity;     
                        }  
                    }
                    opplistItem.add(oppLineProd4);
                    
                }
            }
        }
        insert opplistItem;
    }
    @auraEnabled 
    public static void savePDFOpportunity(string recordId){
        
    }
    
    // Get License Product of FAW UCaaS
    @auraEnabled 
    public static List<WrapperClass> getProduct(string ids){
        List<Product2> pro = new List<Product2>();
        PriceBookId__c pricebook = new PriceBookId__c();
        List<PricebookEntry> priceEntry = new List<PricebookEntry>();
        Set<Id> productId = new Set<Id>();
        Opportunity opp = new Opportunity();
        
        
        opp = [select id,Pricebook2Id,Contract_Term_Years__c from Opportunity where id =: ids limit 1];
        
        String year = String.valueOf(opp.Contract_Term_Years__c);
        pro = [select id,isEssential__c,isElite__c,isPremier__c,isOutbound__c,isTollFreeNum__c,isE911__c,isWebFax__c,Family,Name,Equipment__c,Product_Subcategory__c,IpPhoneRule1__c,IpPhoneRule2__c,Year__c,Product_Type__c,is_show_on_ux__c,Term__c,Description,ProductCode,IsActive,License_Order__c,Part_Number__c,Part_Number_of_Product__c,SetUp_Order__c,Child__c,Parent__c,Show_in_PDF__c from Product2 where IsActive =: true AND (Product_Subcategory__c =:'Licenses' AND Family =: 'FAW')AND (Product_Type__c =: 'FAW UCaaS'  AND is_show_on_ux__c =: true AND Parent__c =:true) and (Year__c =: year OR Year__c =: 'All') ORDER BY License_Order__c ];
        
        
        if(pro != null && !pro.isEmpty()){
            for(Product2 p : pro){
                productId.add(p.id);
            }
        }
        priceEntry = [Select id,UnitPrice,NRC_Unit_Price__c,Pricebook2Id,Product2Id,Type_of_Billing__c,VENDORPRICELISTTOFTR__c,UNITCOST__c,GPM__c,DISCOUNT_Price__c,IsActive from PricebookEntry where Product2Id =: productId and Pricebook2Id =: opp.Pricebook2Id and IsActive =: true];
        
        list<WrapperClass> wrapList = new list<WrapperClass>();
        if(pro != null && !pro.isEmpty()){
            if(priceEntry != null && !priceEntry.isEmpty()) {
                for(Product2 p : pro){
                    for(PricebookEntry prcEntry : priceEntry){
                        if(p.id == prcEntry.Product2Id){
                            WrapperClass wrap = new WrapperClass(p,false,true,false,prcEntry,0,0);
                            wrapList.add(wrap);
                        }
                    }
                }
            }
            
        }
        return wrapList;
    }
    @auraEnabled 
    public static List<WrapperClass> prod(string ids){
        List<Product2> pro = new List<Product2>();
        PriceBookId__c pricebook = new PriceBookId__c();
        List<PricebookEntry> priceEntry = new List<PricebookEntry>();
        Set<Id> productId = new Set<Id>();
        Opportunity opp = new Opportunity();
        List<Product2> productTolllist = new List<Product2>();
        
        opp = [select id,Pricebook2Id,Contract_Term_Years__c from Opportunity where id =: ids limit 1];
        
        String year = String.valueOf(opp.Contract_Term_Years__c);
        
        pro = [select id,isEssential__c,isElite__c,isAdditionalDID__c,isCallerId__c,isAdditionalDirectory__c,isExtendedMarket__c,isAdditionalManaged__c,isBusinessAnalytic__c,isPremier__c,isOutbound__c,isTollFreeNum__c,isE911__c,isWebFax__c,Family,Name,Product_Subcategory__c,Equipment__c,TollFreeRule__c,Year__c,Product_Type__c,is_show_on_ux__c,Term__c,Part_Number__c,Part_Number_of_Product__c,Description,ProductCode,IsActive,License_Order__c,SetUp_Order__c,Child__c,Parent__c,Show_in_PDF__c from Product2 where IsActive =: true AND (Product_Subcategory__c =:'Add-On' AND Family =: 'FAW') AND (Product_Type__c =: 'FAW UCaaS' AND is_show_on_ux__c =: true AND Parent__c =:true) AND (Year__c =: year OR Year__c =: 'All') ORDER BY License_Order__c ] ;
        
        if(pro != null && !pro.isEmpty()){
            for(Product2 p : pro){
                productId.add(p.id);
            }
        }
        
        priceEntry = [Select id,UnitPrice,Pricebook2Id,Product2Id,NRC_Unit_Price__c,Type_of_Billing__c,VENDORPRICELISTTOFTR__c,UNITCOST__c,GPM__c,DISCOUNT_Price__c,IsActive from PricebookEntry where Product2Id =: productId and Pricebook2Id =: opp.Pricebook2Id and IsActive =: true];
        
        list<WrapperClass> wrapList = new list<WrapperClass>();
        if(pro != null && !pro.isEmpty()){
            if(priceEntry != null && !priceEntry.isEmpty()) {
                for(Product2 p : pro){
                    for(PricebookEntry prcEntry : priceEntry){
                        if(p.id == prcEntry.Product2Id){
                            WrapperClass wrap = new WrapperClass(p,false,true,false,prcEntry,0,0);
                            wrapList.add(wrap);
                        }
                    }
                }
            }
        }
        return wrapList;
    }
    @auraEnabled 
    public static List<WrapperClass> prodTelecomm(string ids){
        List<Product2> pro = new List<Product2>();
        PriceBookId__c pricebook = new PriceBookId__c();
        List<PricebookEntry> priceEntry = new List<PricebookEntry>();
        Set<Id> productId = new Set<Id>();
        Opportunity opp = new Opportunity();
        map<integer,string> prodNameList = new map<integer,string>();
        
        opp = [select id,Pricebook2Id,Contract_Term_Years__c from Opportunity where id =: ids limit 1];
        
        String year = String.valueOf(opp.Contract_Term_Years__c);
        
        pro = [select id,Family,Name,Product_Subcategory__c,Equipment__c,TollFreeRule__c,Year__c,Product_Type__c,is_show_on_ux__c,Term__c,Part_Number__c,Part_Number_of_Product__c,Description,ProductCode,IsActive,License_Order__c,SetUp_Order__c,Child__c,Parent__c,Show_in_PDF__c from Product2 where IsActive =: true AND (Product_Subcategory__c =:'Toll Free Bundle Minutes' AND Family =: 'FAW') AND (Product_Type__c =: 'FAW UCaaS' AND is_show_on_ux__c =: true AND Parent__c =:true) AND (Year__c =: year OR Year__c =: 'All') ORDER BY License_Order__c];
        
        
        if(pro != null && !pro.isEmpty()){
            for(Product2 p : pro){
                productId.add(p.id);
            }
        }
        
        priceEntry = [Select id,UnitPrice,NRC_Unit_Price__c,Pricebook2Id,Product2Id,Type_of_Billing__c,VENDORPRICELISTTOFTR__c,UNITCOST__c,GPM__c,DISCOUNT_Price__c,IsActive from PricebookEntry where Product2Id =: productId and Pricebook2Id =: opp.Pricebook2Id and IsActive =: true ];
        
        list<WrapperClass> wrapList = new list<WrapperClass>();
        if(pro != null && !pro.isEmpty()){
            if(priceEntry != null && !priceEntry.isEmpty()) {
                for(Product2 p : pro){
                    for(PricebookEntry prcEntry : priceEntry){
                        if(p.id == prcEntry.Product2Id){
                            WrapperClass wrap = new WrapperClass(p,false,true,false,prcEntry,0,0);
                            wrapList.add(wrap);
                        }
                    }
                }
            }
        }
        return wrapList;
    }
    @auraEnabled 
    public static List<WrapperClass> prodIpPhones(string ids){
        List<Product2> pro = new List<Product2>();
        PriceBookId__c pricebook = new PriceBookId__c();
        List<PricebookEntry> priceEntry = new List<PricebookEntry>();
        Set<Id> productId = new Set<Id>(); 
        Opportunity opp = new Opportunity();
        
        opp = [select id,Pricebook2Id,Contract_Term_Years__c from Opportunity where id =: ids limit 1];
        
        String year = String.valueOf(opp.Contract_Term_Years__c);
        pro = [select id,Family,Name,IpPhone__c,POE__c,IpPhoneRule1__c,IpPhoneRule2__c,Equipment__c,Product_Subcategory__c,Year__c,Product_Type__c,is_show_on_ux__c,Part_Number__c,Term__c,Part_Number_of_Product__c,Description,ProductCode,IsActive,License_Order__c,SetUp_Order__c,Child__c,Parent__c,Show_in_PDF__c from Product2 where IsActive =: true AND (Product_Subcategory__c =:'IP Phones' AND Family =: 'FAW') AND (Product_Type__c =: 'FAW UCaaS' AND is_show_on_ux__c =: true AND Parent__c =:true) AND (Year__c =: year OR Year__c =: 'All') ORDER BY License_Order__c ] ;
        
        if(pro != null && !pro.isEmpty()){
            for(Product2 p : pro){
                productId.add(p.id);
            }
        }
        
        priceEntry = [Select id,UnitPrice,NRC_Unit_Price__c,Pricebook2Id,Product2Id,Type_of_Billing__c,VENDORPRICELISTTOFTR__c,UNITCOST__c,GPM__c,DISCOUNT_Price__c,IsActive from PricebookEntry where Product2Id =: productId and Pricebook2Id =: opp.Pricebook2Id and IsActive =: true];
        
        list<WrapperClass> wrapList = new list<WrapperClass>();
        if(pro != null && !pro.isEmpty()){
            if(priceEntry != null && !priceEntry.isEmpty()) {
                for(Product2 p : pro){
                    for(PricebookEntry prcEntry : priceEntry){
                        
                        if(p.id == prcEntry.Product2Id){
                            WrapperClass wrap = new WrapperClass(p,false,true,false,prcEntry,0,0);
                            wrapList.add(wrap);
                        }
                    }
                }
            }
        }
        
        return wrapList;
    }
    @auraEnabled 
    public static List<WrapperClass> prodAccessories(string ids){
        List<Product2> pro = new List<Product2>();
        PriceBookId__c pricebook = new PriceBookId__c();
        List<PricebookEntry> priceEntry = new List<PricebookEntry>();
        Set<Id> productId = new Set<Id>(); 
        Set<Id>IpphpneId = new Set<Id>();
        Opportunity opp = new Opportunity();
        
        opp = [select id,Pricebook2Id,Contract_Term_Years__c from Opportunity where id =: ids limit 1];
        String year = String.valueOf(opp.Contract_Term_Years__c);
        
        pro = [select id,Family,Name,Product_Subcategory__c,Year__c,Equipment__c,Product_Type__c,is_show_on_ux__c,Part_Number__c,Term__c,Part_Number_of_Product__c,Description,ProductCode,IsActive,License_Order__c,SetUp_Order__c,Child__c,Parent__c,Show_in_PDF__c from Product2 where IsActive =: true AND Family =: 'FAW' AND (Product_Subcategory__c =: 'Accessories' OR Product_Subcategory__c =: 'Miscelaneous Materials') AND (Product_Type__c =: 'FAW UCaaS' AND is_show_on_ux__c =: true AND Parent__c =:true) AND (Year__c =: year OR Year__c =: 'All') ORDER BY License_Order__c ];
        if(pro != null && !pro.isEmpty()){
            for(Product2 p : pro){
                productId.add(p.id);
                
            }
        }
        
        priceEntry = [Select id,UnitPrice,NRC_Unit_Price__c,Pricebook2Id,Product2Id,Type_of_Billing__c,VENDORPRICELISTTOFTR__c,UNITCOST__c,GPM__c,DISCOUNT_Price__c,IsActive from PricebookEntry where Product2Id =: productId and Pricebook2Id =: opp.Pricebook2Id and IsActive =: true];
        list<WrapperClass> wrapList = new list<WrapperClass>();
        if(pro != null && !pro.isEmpty()){
            if(priceEntry != null && !priceEntry.isEmpty()) {
                for(Product2 p : pro){
                    for(PricebookEntry prcEntry : priceEntry){
                        
                        if(p.id == prcEntry.Product2Id){
                            WrapperClass wrap = new WrapperClass(p,false,true,false,prcEntry,0,0);
                            wrapList.add(wrap);
                        }
                    }
                }
            }
        }
        
        return wrapList;
    }
    
    @auraEnabled 
    public static List<WrapperClass> prodSwitchesAndPOE(string ids){
        List<Product2> pro = new List<Product2>();
        PriceBookId__c pricebook = new PriceBookId__c();
        List<PricebookEntry> priceEntry = new List<PricebookEntry>();
        Set<Id> productId = new Set<Id>(); 
        Opportunity opp = new Opportunity();
        
        opp = [select id,Pricebook2Id,Contract_Term_Years__c from Opportunity where id =: ids limit 1];
        
        String year = String.valueOf(opp.Contract_Term_Years__c);
        
        pro = [select id,Family,Name,Product_Subcategory__c,Year__c,Equipment__c,Product_Type__c,Term__c,is_show_on_ux__c,Part_Number__c,Description,Part_Number_of_Product__c,ProductCode,IsActive,License_Order__c,SetUp_Order__c,Child__c,Parent__c,Show_in_PDF__c,POE_Switch_Rule__c from Product2 where IsActive =: true AND (Product_Subcategory__c =:'Switches and PoE' AND Family =: 'FAW') AND (Product_Type__c =: 'FAW UCaaS' AND is_show_on_ux__c =: true AND Parent__c =:true) AND (Year__c =: year OR Year__c =: 'All') ORDER BY License_Order__c ];
        
        if(pro != null && !pro.isEmpty()){
            for(Product2 p : pro){
                productId.add(p.id);
                
            }
        }
        
        priceEntry = [Select id,UnitPrice,NRC_Unit_Price__c,Pricebook2Id,Product2Id,Type_of_Billing__c,VENDORPRICELISTTOFTR__c,UNITCOST__c,GPM__c,DISCOUNT_Price__c,IsActive from PricebookEntry where Product2Id =: productId and Pricebook2Id =: opp.Pricebook2Id and IsActive =: true];
        list<WrapperClass> wrapList = new list<WrapperClass>();
        if(pro != null && !pro.isEmpty()){
            if(priceEntry != null && !priceEntry.isEmpty()) {
                for(Product2 p : pro){
                    for(PricebookEntry prcEntry : priceEntry){
                        
                        if(p.id == prcEntry.Product2Id){
                            WrapperClass wrap = new WrapperClass(p,false,true,false,prcEntry,0,0);
                            wrapList.add(wrap);
                        }
                    }
                }
            }
        }
        
        return wrapList;
    }
    
    @auraEnabled 
    public static void QuoteType(String type,string recordId){
        
        Pricebook2 prcbook = new Pricebook2();
        Opportunity opp = new Opportunity();
        if(recordId != null){
        opp = [Select id,Pricebook2Id from Opportunity where id =: recordId limit 1];
        }
        if(type != null){
        prcbook = [Select id,Account_Type__c,Name from Pricebook2 where Account_Type__c =: type limit 1];
        }
        opp.Pricebook2Id = prcbook.Id;
        update opp;
    }
    // smart Voice Products
    
    @auraEnabled 
    public static List<WrapperClass> smartVoiceLicenseProd(string ids){
        List<Product2> pro = new List<Product2>();
        PriceBookId__c pricebook = new PriceBookId__c();
        List<PricebookEntry> priceEntry = new List<PricebookEntry>();
        Set<Id> productId = new Set<Id>();
        Opportunity opp = new Opportunity();
        
        opp = [select id,Pricebook2Id,Contract_Term_Years__c from Opportunity where id =: ids limit 1];
        
        String year = String.valueOf(opp.Contract_Term_Years__c);
        pro = [select id,Family,Name,isConferenceRumSeatRule__c,PremiumRule__c,PremiumPlusRule__c,isAnalogRule__c,Equipment__c,Product_Subcategory__c,Year__c,Product_Type__c,is_show_on_ux__c,Description,ProductCode,IsActive,License_Order__c,Part_Number_of_Product__c,Child__c,Parent__c,Show_in_PDF__c,Item_Code__c,S_E_LOOP__c,S_E_PORT__c from Product2 where IsActive =: true AND (Product_Subcategory__c =:'Licenses' AND Family =: 'Smart Voice')AND (Product_Type__c =: 'Smart Voice'  AND is_show_on_ux__c =: true AND Parent__c =:true) and (Year__c =: year OR Year__c =: 'All') ORDER BY License_Order__c ];
        
        if(pro != null && !pro.isEmpty()){
            for(Product2 p : pro){
                productId.add(p.id);
            }
        }
        priceEntry = [Select id,UnitPrice,NRC_Unit_Price__c,Pricebook2Id,Product2Id,Type_of_Billing__c,VENDORPRICELISTTOFTR__c,UNITCOST__c,GPM__c,DISCOUNT_Price__c from PricebookEntry where Product2Id =: productId and Pricebook2Id =: opp.Pricebook2Id];
        
        list<WrapperClass> wrapList = new list<WrapperClass>();
        if(pro != null && !pro.isEmpty()){
            if(priceEntry != null && !priceEntry.isEmpty()) {
                for(Product2 p : pro){
                    for(PricebookEntry prcEntry : priceEntry){
                        
                        if(p.id == prcEntry.Product2Id){
                            WrapperClass wrap = new WrapperClass(p,false,true,false,prcEntry,0,0);
                            wrapList.add(wrap);
                        }
                    }
                }
            }
            
        }
        
        return wrapList;
    }
    @auraEnabled 
    public static List<WrapperClass> smartVoiceAdOnProd(string ids){
        List<Product2> pro = new List<Product2>();
        PriceBookId__c pricebook = new PriceBookId__c();
        List<PricebookEntry> priceEntry = new List<PricebookEntry>();
        Set<Id> productId = new Set<Id>();
        Opportunity opp = new Opportunity();
        List<Product2> productTolllist = new List<Product2>();
        
        opp = [select id,Pricebook2Id,Contract_Term_Years__c from Opportunity where id =: ids limit 1];
        
        String year = String.valueOf(opp.Contract_Term_Years__c);
        
        pro = [select id,Family,Name,TollFreeRule__c,isSmartAdditionalDID__c,isSmartAdditionalManagedAutoAttendant__c,isSmartDirectoryListing__c,isSmartE911__c,isSmartExtendedNum__c,isSmartMonthlyAdminCharge__c,isSmartMultiLineHunt__c,isSmartPremiumAttendant__c,isSmartTollFreeDomestic__c,isSmartTollFreeDomesticUS__c,isSmartTollFreeNum__c,Equipment__c,Product_Subcategory__c,Year__c,Product_Type__c,is_show_on_ux__c,Description,ProductCode,IsActive,License_Order__c,Part_Number_of_Product__c,Child__c,Parent__c,Show_in_PDF__c,Item_Code__c,S_E_LOOP__c,S_E_PORT__c from Product2 where IsActive =: true AND (Product_Subcategory__c =:'Add-On' AND Family =: 'Smart Voice')AND (Product_Type__c =: 'Smart Voice'  AND is_show_on_ux__c =: true AND Parent__c =:true) and (Year__c =: year OR Year__c =: 'All') ORDER BY License_Order__c ];
        
        if(pro != null && !pro.isEmpty()){
            for(Product2 p : pro){
                productId.add(p.id);
            }
        }
        //pricebook = [Select id,PriceBookId__c from PriceBookId__c limit 1];
        priceEntry = [Select id,UnitPrice,Pricebook2Id,Product2Id,NRC_Unit_Price__c,Type_of_Billing__c,VENDORPRICELISTTOFTR__c,UNITCOST__c,GPM__c,DISCOUNT_Price__c from PricebookEntry where Product2Id =: productId and Pricebook2Id =: opp.Pricebook2Id];
        
        list<WrapperClass> wrapList = new list<WrapperClass>();
        if(pro != null && !pro.isEmpty()){
            if(priceEntry != null && !priceEntry.isEmpty()) {
                for(Product2 p : pro){
                    for(PricebookEntry prcEntry : priceEntry){
                        
                        if(p.id == prcEntry.Product2Id){
                            WrapperClass wrap = new WrapperClass(p,false,true,false,prcEntry,0,0);
                            wrapList.add(wrap);
                        }
                    }
                }
            }
        }
        
        return wrapList;
    }
    @auraEnabled 
    public static List<WrapperClass> SmartVoiceIpPhonesProd(string ids){
        List<Product2> pro = new List<Product2>();
        PriceBookId__c pricebook = new PriceBookId__c();
        List<PricebookEntry> priceEntry = new List<PricebookEntry>();
        Set<Id> productId = new Set<Id>(); 
        Opportunity opp = new Opportunity();
        
        opp = [select id,Pricebook2Id,Contract_Term_Years__c from Opportunity where id =: ids limit 1];
        
        String year = String.valueOf(opp.Contract_Term_Years__c);
        pro = [select id,Family,Name,isVVX311__c,isVVX501__c,isVVX601__c,isSoundStationIp5000__c,isSoundStationIp6000__c,isSoundStationIp7000__c,isSmartIpPhoneRule__c,isIpSoundStationRule__c,Equipment__c,Product_Subcategory__c,Year__c,Product_Type__c,is_show_on_ux__c,Description,ProductCode,IsActive,License_Order__c,Part_Number_of_Product__c,Child__c,Parent__c,Show_in_PDF__c,Item_Code__c,S_E_LOOP__c,S_E_PORT__c from Product2 where IsActive =: true AND (Product_Subcategory__c =:'IP Phones' AND Family =: 'Smart Voice')AND (Product_Type__c =: 'Smart Voice'  AND is_show_on_ux__c =: true AND Parent__c =:true) and (Year__c =: year OR Year__c =: 'All') ORDER BY License_Order__c ];
        
        if(pro != null && !pro.isEmpty()){
            for(Product2 p : pro){
                productId.add(p.id);
            }
        }
        //pricebook = [Select id,PriceBookId__c from PriceBookId__c limit 1];
        priceEntry = [Select id,UnitPrice,NRC_Unit_Price__c,Pricebook2Id,Product2Id,Type_of_Billing__c,VENDORPRICELISTTOFTR__c,UNITCOST__c,GPM__c,DISCOUNT_Price__c from PricebookEntry where Product2Id =: productId and Pricebook2Id =: opp.Pricebook2Id];
        
        
        list<WrapperClass> wrapList = new list<WrapperClass>();
        if(pro != null && !pro.isEmpty()){
            if(priceEntry != null && !priceEntry.isEmpty()) {
                for(Product2 p : pro){
                    for(PricebookEntry prcEntry : priceEntry){
                        if(p.id == prcEntry.Product2Id){
                            WrapperClass wrap = new WrapperClass(p,false,true,false,prcEntry,0,0);
                            wrapList.add(wrap);
                        }
                    }
                }
            }
        }
        
        return wrapList;
    }
    
      @auraEnabled 
    public static List<WrapperClass> smartVoiceTelecommProd(string ids){
        List<Product2> pro = new List<Product2>();
        PriceBookId__c pricebook = new PriceBookId__c();
        List<PricebookEntry> priceEntry = new List<PricebookEntry>();
        Set<Id> productId = new Set<Id>();
        Opportunity opp = new Opportunity();
        List<Product2> productTolllist = new List<Product2>();
        
        opp = [select id,Pricebook2Id,Contract_Term_Years__c from Opportunity where id =: ids limit 1];
        
        String year = String.valueOf(opp.Contract_Term_Years__c);
        
        pro = [select id,Family,Name,isSmartAdditionalDID__c,isSmartAdditionalManagedAutoAttendant__c,isSmartDirectoryListing__c,isSmartE911__c,isSmartExtendedNum__c,isSmartMonthlyAdminCharge__c,isSmartMultiLineHunt__c,isSmartPremiumAttendant__c,isSmartTollFreeDomestic__c,isSmartTollFreeDomesticUS__c,isSmartTollFreeNum__c,Equipment__c,Product_Subcategory__c,Year__c,Product_Type__c,is_show_on_ux__c,Description,ProductCode,IsActive,License_Order__c,Part_Number_of_Product__c,Child__c,Parent__c,Show_in_PDF__c,Item_Code__c,S_E_LOOP__c,S_E_PORT__c from Product2 where IsActive =: true AND (Product_Subcategory__c =:'Toll Free Bundle Minutes' AND Family =: 'Smart Voice')AND (Product_Type__c =: 'Smart Voice'  AND is_show_on_ux__c =: true AND Parent__c =:true) and (Year__c =: year OR Year__c =: 'All') ORDER BY License_Order__c ];
        
        if(pro != null && !pro.isEmpty()){
            for(Product2 p : pro){
                productId.add(p.id);
            }
        }
        //pricebook = [Select id,PriceBookId__c from PriceBookId__c limit 1];
        priceEntry = [Select id,UnitPrice,Pricebook2Id,Product2Id,NRC_Unit_Price__c,Type_of_Billing__c,VENDORPRICELISTTOFTR__c,UNITCOST__c,GPM__c,DISCOUNT_Price__c from PricebookEntry where Product2Id =: productId and Pricebook2Id =: opp.Pricebook2Id];
        
        list<WrapperClass> wrapList = new list<WrapperClass>();
        if(pro != null && !pro.isEmpty()){
            if(priceEntry != null && !priceEntry.isEmpty()) {
                for(Product2 p : pro){
                    for(PricebookEntry prcEntry : priceEntry){
                        
                        if(p.id == prcEntry.Product2Id){
                            WrapperClass wrap = new WrapperClass(p,false,true,false,prcEntry,0,0);
                            wrapList.add(wrap);
                        }
                    }
                }
            }
        }
        
        return wrapList;
    }
    
    @auraEnabled 
    public static List<WrapperClass> smartVoiceSwitchesAndPOEProd(string ids){
        List<Product2> pro = new List<Product2>();
        PriceBookId__c pricebook = new PriceBookId__c();
        List<PricebookEntry> priceEntry = new List<PricebookEntry>();
        Set<Id> productId = new Set<Id>(); 
        Opportunity opp = new Opportunity();
        
        opp = [select id,Pricebook2Id,Contract_Term_Years__c from Opportunity where id =: ids limit 1];
        
        String year = String.valueOf(opp.Contract_Term_Years__c);
        
        pro = [select id,isPolycomATA__c,Family,Name,isNETGEAR__c,Equipment__c,isATArule__c,Product_Subcategory__c,Year__c,Product_Type__c,is_show_on_ux__c,Description,ProductCode,IsActive,License_Order__c,Part_Number_of_Product__c,Child__c,Parent__c,Show_in_PDF__c,Item_Code__c,S_E_LOOP__c,S_E_PORT__c from Product2 where IsActive =: true AND (Product_Subcategory__c =:'Switches and PoE' AND Family =: 'Smart Voice')AND (Product_Type__c =: 'Smart Voice'  AND is_show_on_ux__c =: true AND Parent__c =:true) and (Year__c =: year OR Year__c =: 'All') ORDER BY License_Order__c ];
        
        if(pro != null && !pro.isEmpty()){
            for(Product2 p : pro){
                productId.add(p.id);
                
            }
        }
        
        priceEntry = [Select id,UnitPrice,NRC_Unit_Price__c,Pricebook2Id,Product2Id,Type_of_Billing__c,VENDORPRICELISTTOFTR__c,UNITCOST__c,GPM__c,DISCOUNT_Price__c from PricebookEntry where Product2Id =: productId and Pricebook2Id =: opp.Pricebook2Id];
        
        
        list<WrapperClass> wrapList = new list<WrapperClass>();
        if(pro != null && !pro.isEmpty()){
            if(priceEntry != null && !priceEntry.isEmpty()) {
                for(Product2 p : pro){
                    for(PricebookEntry prcEntry : priceEntry){
                        
                        if(p.id == prcEntry.Product2Id){
                            WrapperClass wrap = new WrapperClass(p,false,true,false,prcEntry,0,0);
                            wrapList.add(wrap);
                        }
                    }
                }
            }
        }
        
        return wrapList;
    }
    @auraEnabled 
    public static List<WrapperClass> smartVoiceBroadbandProd(string ids){
        List<Product2> pro = new List<Product2>();
        PriceBookId__c pricebook = new PriceBookId__c();
        List<PricebookEntry> priceEntry = new List<PricebookEntry>();
        Set<Id> productId = new Set<Id>(); 
        Opportunity opp = new Opportunity();
        
        opp = [select id,Pricebook2Id,Contract_Term_Years__c from Opportunity where id =: ids limit 1];
        
        String year = String.valueOf(opp.Contract_Term_Years__c);
        
        pro = [select id,Family,Name,BroadbandIpOptionEach__c,BroadbandIpOption5Ips__c,BroadbandIpOption13Ips__c,Equipment__c,Product_Subcategory__c,Year__c,Product_Type__c,is_show_on_ux__c,Description,ProductCode,IsActive,License_Order__c,Part_Number_of_Product__c,Child__c,Parent__c,Show_in_PDF__c,Item_Code__c,S_E_LOOP__c,S_E_PORT__c from Product2 where (IsActive =: true AND is_show_on_ux__c =: true) AND (Product_Subcategory__c =:'Broadband' AND Family =: 'Smart Voice') AND Product_Type__c =: 'Smart Voice' AND (Year__c =: year OR Year__c =: 'All')];
        
        if(pro != null && !pro.isEmpty()){
            for(Product2 p : pro){
                productId.add(p.id);
                
            }
        }
        
        priceEntry = [Select id,UnitPrice,NRC_Unit_Price__c,Pricebook2Id,Product2Id,Type_of_Billing__c,VENDORPRICELISTTOFTR__c,UNITCOST__c,GPM__c,DISCOUNT_Price__c from PricebookEntry where Product2Id =: productId and Pricebook2Id =: opp.Pricebook2Id];
        
        
        list<WrapperClass> wrapList = new list<WrapperClass>();
        if(pro != null && !pro.isEmpty()){
            if(priceEntry != null && !priceEntry.isEmpty()) {
                for(Product2 p : pro){
                    for(PricebookEntry prcEntry : priceEntry){
                        
                        if(p.id == prcEntry.Product2Id){
                            WrapperClass wrap = new WrapperClass(p,false,true,false,prcEntry,0,0);
                            wrapList.add(wrap);
                        }
                    }
                }
            }
        }
        
        return wrapList;
    }
    @auraEnabled 
    public static List<WrapperClass> smartVoiceRepairProd(string ids){
        List<Product2> pro = new List<Product2>();
        PriceBookId__c pricebook = new PriceBookId__c();
        List<PricebookEntry> priceEntry = new List<PricebookEntry>();
        Set<Id> productId = new Set<Id>(); 
        Opportunity opp = new Opportunity();
        
        opp = [select id,Pricebook2Id,Contract_Term_Years__c from Opportunity where id =: ids limit 1];
        System.debug('==ids=='+ids);
        String year = String.valueOf(opp.Contract_Term_Years__c);
        
        pro = [select id,Family,Name,Equipment__c,Product_Subcategory__c,Year__c,Product_Type__c,is_show_on_ux__c,Description,ProductCode,IsActive,License_Order__c,Part_Number_of_Product__c,Child__c,Parent__c,Show_in_PDF__c,Item_Code__c,S_E_LOOP__c,S_E_PORT__c from Product2 where IsActive =: true AND (Product_Subcategory__c =:'Repair' AND Family =: 'Smart Voice')AND (Product_Type__c =: 'Smart Voice'  AND is_show_on_ux__c =: true AND Parent__c =:true) and (Year__c =: year OR Year__c =: 'All') ORDER BY License_Order__c ];
        
        if(pro != null && !pro.isEmpty()){
            for(Product2 p : pro){
                productId.add(p.id);
                
            }
        }
        
        priceEntry = [Select id,UnitPrice,NRC_Unit_Price__c,Pricebook2Id,Product2Id,Type_of_Billing__c,VENDORPRICELISTTOFTR__c,UNITCOST__c,GPM__c,DISCOUNT_Price__c from PricebookEntry where Product2Id =: productId and Pricebook2Id =: opp.Pricebook2Id];
        
        list<WrapperClass> wrapList = new list<WrapperClass>();
        if(pro != null && !pro.isEmpty()){
            if(priceEntry != null && !priceEntry.isEmpty()) {
                for(Product2 p : pro){
                    for(PricebookEntry prcEntry : priceEntry){
                        
                        if(p.id == prcEntry.Product2Id){
                            WrapperClass wrap = new WrapperClass(p,false,true,false,prcEntry,0,0);
                            wrapList.add(wrap);
                        }
                    }
                }
            }
        }
        
        return wrapList;
    }
    
    @auraEnabled 
    public static List<WrapperClass> smartVoiceFIOSProd(string ids){
        List<Product2> pro = new List<Product2>();
        PriceBookId__c pricebook = new PriceBookId__c();
        List<PricebookEntry> priceEntry = new List<PricebookEntry>();
        Set<Id> productId = new Set<Id>(); 
        Opportunity opp = new Opportunity();
        
        opp = [select id,Pricebook2Id,Contract_Term_Years__c from Opportunity where id =: ids limit 1];
        System.debug('==ids=='+ids);
        String year = String.valueOf(opp.Contract_Term_Years__c);
        
        pro = [select id,Family,Name,SmartVoice_FiOS_100_100_Broadband__c,SmartVoice_FiOS_500_500_Broadband__c,SmartVoice_FiOS_1G_1G_Broadband__c,Equipment__c,Product_Subcategory__c,Year__c,Product_Type__c,is_show_on_ux__c,Description,ProductCode,IsActive,License_Order__c,Part_Number_of_Product__c,Child__c,Parent__c,Show_in_PDF__c,Item_Code__c,S_E_LOOP__c,S_E_PORT__c from Product2 where IsActive =: true AND (Product_Subcategory__c =:'FIOS' AND Family =: 'Smart Voice')AND (Product_Type__c =: 'Smart Voice'  AND is_show_on_ux__c =: true AND Parent__c =:true) and (Year__c =: year OR Year__c =: 'All') ORDER BY License_Order__c ];
        if(pro != null && !pro.isEmpty()){
            for(Product2 p : pro){
                productId.add(p.id);
                
            }
        }
        priceEntry = [Select id,UnitPrice,NRC_Unit_Price__c,Pricebook2Id,Product2Id,Type_of_Billing__c,VENDORPRICELISTTOFTR__c,UNITCOST__c,GPM__c,DISCOUNT_Price__c,IsActive from PricebookEntry where Product2Id =: productId and Pricebook2Id =: opp.Pricebook2Id and IsActive =: true];
        list<WrapperClass> wrapList = new list<WrapperClass>();
        if(pro != null && !pro.isEmpty()){
            if(priceEntry != null && !priceEntry.isEmpty()) {
                for(Product2 p : pro){
                    for(PricebookEntry prcEntry : priceEntry){
                        
                        if(p.id == prcEntry.Product2Id){
                            WrapperClass wrap = new WrapperClass(p,false,true,false,prcEntry,0,0);
                            wrapList.add(wrap);
                        }
                    }
                }
            }
        }
        
        return wrapList;
    }
    
    @auraEnabled 
    public static List<WrapperClass> smartVoiceFiberProd(string ids){
        List<Product2> pro = new List<Product2>();
        PriceBookId__c pricebook = new PriceBookId__c();
        List<PricebookEntry> priceEntry = new List<PricebookEntry>();
        Set<Id> productId = new Set<Id>(); 
        Opportunity opp = new Opportunity();
        
        opp = [select id,Pricebook2Id,Contract_Term_Years__c from Opportunity where id =: ids limit 1];
        System.debug('==ids=='+ids);
        String year = String.valueOf(opp.Contract_Term_Years__c);
        
        pro = [select id,Family,Name,SmartVoice_Fiber_100_100_Broadband__c,SmartVoice_Fiber_500_500_Broadband__c,SmartVoice_Fiber_1G_1G_Broadband__c,Equipment__c,Product_Subcategory__c,Year__c,Product_Type__c,is_show_on_ux__c,Description,ProductCode,IsActive,License_Order__c,Part_Number_of_Product__c,Child__c,Parent__c,Show_in_PDF__c,Item_Code__c,S_E_LOOP__c,S_E_PORT__c from Product2 where IsActive =: true AND (Product_Subcategory__c =:'Fiber' AND Family =: 'Smart Voice')AND (Product_Type__c =: 'Smart Voice'  AND is_show_on_ux__c =: true AND Parent__c =:true) and (Year__c =: year OR Year__c =: 'All') ORDER BY License_Order__c ];
        if(pro != null && !pro.isEmpty()){
            for(Product2 p : pro){
                productId.add(p.id);
                
            }
        }
        priceEntry = [Select id,UnitPrice,NRC_Unit_Price__c,Pricebook2Id,Product2Id,Type_of_Billing__c,VENDORPRICELISTTOFTR__c,UNITCOST__c,GPM__c,DISCOUNT_Price__c,IsActive from PricebookEntry where Product2Id =: productId and Pricebook2Id =: opp.Pricebook2Id and IsActive =: true];
        list<WrapperClass> wrapList = new list<WrapperClass>();
        if(pro != null && !pro.isEmpty()){
            if(priceEntry != null && !priceEntry.isEmpty()) {
                for(Product2 p : pro){
                    for(PricebookEntry prcEntry : priceEntry){
                        
                        if(p.id == prcEntry.Product2Id){
                            WrapperClass wrap = new WrapperClass(p,false,true,false,prcEntry,0,0);
                            wrapList.add(wrap);
                        }
                    }
                }
            }
        }
        
        return wrapList;
    }
    
    @auraEnabled 
    public static List<WrapperClass> smartVoiceBHSIProd(string ids){
        List<Product2> pro = new List<Product2>();
        PriceBookId__c pricebook = new PriceBookId__c();
        List<PricebookEntry> priceEntry = new List<PricebookEntry>();
        Set<Id> productId = new Set<Id>(); 
        Opportunity opp = new Opportunity();
        
        opp = [select id,Pricebook2Id,Contract_Term_Years__c from Opportunity where id =: ids limit 1];
        System.debug('==ids=='+ids);
        String year = String.valueOf(opp.Contract_Term_Years__c);
        
        pro = [select id,Family,Name,SmartVoice_Broadband_12__c,SmartVoice_Broadband_18__c,SmartVoice_Broadband_25__c,SmartVoice_Broadband_35__c,SmartVoice_Broadband_45__c,SmartVoice_Broadband_70__c,SmartVoice_Broadband_90__c,SmartVoice_Broadband_115__c,Equipment__c,Product_Subcategory__c,Year__c,Product_Type__c,is_show_on_ux__c,Description,ProductCode,IsActive,License_Order__c,Part_Number_of_Product__c,Child__c,Parent__c,Show_in_PDF__c,Item_Code__c,S_E_LOOP__c,S_E_PORT__c from Product2 where IsActive =: true AND (Product_Subcategory__c =:'BHSI' AND Family =: 'Smart Voice')AND (Product_Type__c =: 'Smart Voice'  AND is_show_on_ux__c =: true AND Parent__c =:true) and (Year__c =: year OR Year__c =: 'All') ORDER BY License_Order__c ];
        if(pro != null && !pro.isEmpty()){
            for(Product2 p : pro){
                productId.add(p.id);
                
            }
        }
        priceEntry = [Select id,UnitPrice,NRC_Unit_Price__c,Pricebook2Id,Product2Id,Type_of_Billing__c,VENDORPRICELISTTOFTR__c,UNITCOST__c,GPM__c,DISCOUNT_Price__c from PricebookEntry where Product2Id =: productId and Pricebook2Id =: opp.Pricebook2Id];
        list<WrapperClass> wrapList = new list<WrapperClass>();
        if(pro != null && !pro.isEmpty()){
            if(priceEntry != null && !priceEntry.isEmpty()) {
                for(Product2 p : pro){
                    for(PricebookEntry prcEntry : priceEntry){
                        
                        if(p.id == prcEntry.Product2Id){
                            WrapperClass wrap = new WrapperClass(p,false,true,false,prcEntry,0,0);
                            wrapList.add(wrap);
                        }
                    }
                }
            }
        }
        
        return wrapList;
    }
    
    @auraEnabled 
    public static List<WrapperClass> smartVoiceAsymetricFiberProd(string ids){
        List<Product2> pro = new List<Product2>();
        PriceBookId__c pricebook = new PriceBookId__c();
        List<PricebookEntry> priceEntry = new List<PricebookEntry>();
        Set<Id> productId = new Set<Id>(); 
        Opportunity opp = new Opportunity();
        
        opp = [select id,Pricebook2Id,Contract_Term_Years__c from Opportunity where id =: ids limit 1];
        System.debug('==ids=='+ids);
        String year = String.valueOf(opp.Contract_Term_Years__c);
        
        pro = [select id,Family,Name,Equipment__c,Product_Subcategory__c,Year__c,Product_Type__c,is_show_on_ux__c,Description,ProductCode,IsActive,License_Order__c,Part_Number_of_Product__c,Child__c,Parent__c,Show_in_PDF__c,Item_Code__c,S_E_LOOP__c,S_E_PORT__c from Product2 where IsActive =: true AND (Product_Subcategory__c =:'Asymetric Fiber' AND Family =: 'Smart Voice')AND (Product_Type__c =: 'Smart Voice'  AND is_show_on_ux__c =: true AND Parent__c =:true) and (Year__c =: year OR Year__c =: 'All') ORDER BY License_Order__c ];
        if(pro != null && !pro.isEmpty()){
            for(Product2 p : pro){
                productId.add(p.id);
                
            }
        }
        priceEntry = [Select id,UnitPrice,NRC_Unit_Price__c,Pricebook2Id,Product2Id,Type_of_Billing__c,VENDORPRICELISTTOFTR__c,UNITCOST__c,GPM__c,DISCOUNT_Price__c from PricebookEntry where Product2Id =: productId and Pricebook2Id =: opp.Pricebook2Id];
        list<WrapperClass> wrapList = new list<WrapperClass>();
        if(pro != null && !pro.isEmpty()){
            if(priceEntry != null && !priceEntry.isEmpty()) {
                for(Product2 p : pro){
                    for(PricebookEntry prcEntry : priceEntry){
                        
                        if(p.id == prcEntry.Product2Id){
                            WrapperClass wrap = new WrapperClass(p,false,true,false,prcEntry,0,0);
                            wrapList.add(wrap);
                        }
                    }
                }
            }
        }
        
        return wrapList;
    }
    
    @auraEnabled 
    public static List<WrapperClass> smartVoiceEquipmentProd(string ids){
        List<Product2> pro = new List<Product2>();
        PriceBookId__c pricebook = new PriceBookId__c();
        List<PricebookEntry> priceEntry = new List<PricebookEntry>();
        Set<Id> productId = new Set<Id>(); 
        Opportunity opp = new Opportunity();
        
        opp = [select id,Pricebook2Id,Contract_Term_Years__c from Opportunity where id =: ids limit 1];
        System.debug('==ids=='+ids);
        String year = String.valueOf(opp.Contract_Term_Years__c);
        
        pro = [select id,Family,Name,Equipment__c,Product_Subcategory__c,Year__c,Product_Type__c,is_show_on_ux__c,Description,ProductCode,IsActive,License_Order__c,Part_Number_of_Product__c,Child__c,Parent__c,Show_in_PDF__c,Item_Code__c,S_E_LOOP__c,S_E_PORT__c from Product2 where IsActive =: true AND (Product_Subcategory__c =:'Equipment' AND Family =: 'Smart Voice')AND (Product_Type__c =: 'Smart Voice'  AND is_show_on_ux__c =: true AND Parent__c =:true) and (Year__c =: year OR Year__c =: 'All') ORDER BY License_Order__c ];
        if(pro != null && !pro.isEmpty()){
            for(Product2 p : pro){
                productId.add(p.id);
                
            }
        }
        priceEntry = [Select id,UnitPrice,NRC_Unit_Price__c,Pricebook2Id,Product2Id,Type_of_Billing__c,VENDORPRICELISTTOFTR__c,UNITCOST__c,GPM__c,DISCOUNT_Price__c from PricebookEntry where Product2Id =: productId and Pricebook2Id =: opp.Pricebook2Id];
        list<WrapperClass> wrapList = new list<WrapperClass>();
        if(pro != null && !pro.isEmpty()){
            if(priceEntry != null && !priceEntry.isEmpty()) {
                for(Product2 p : pro){
                    for(PricebookEntry prcEntry : priceEntry){
                        
                        if(p.id == prcEntry.Product2Id){
                            WrapperClass wrap = new WrapperClass(p,false,true,false,prcEntry,0,0);
                            wrapList.add(wrap);
                        }
                    }
                }
            }
        }
        
        return wrapList;
    }
    
    @auraEnabled 
    public static void saveRecordSmartProd(string recordId,list<WrapperClass> productListLicenses,list<WrapperClass> productListAddOn,list<WrapperClass> productListIpPhones,list<WrapperClass> productListSwitch,list<WrapperClass> productListEquipment,list<WrapperClass> productListRepair,list<WrapperClass> productListBroadband,list<WrapperClass> productListFIOS,list<WrapperClass> productListFiber,list<WrapperClass> productListBHSI,list<WrapperClass> productListTelecomm,string selVal4,Integer numberOfSites,string siteId){
        Opportunity opp = new Opportunity();
        if(recordId != null){
            opp = [select id,Contract_Term_Years__c from Opportunity where id =: recordId limit 1];
        }
        List<WrapperClass> productList1 = new List<WrapperClass> ();
        for(WrapperClass wrap : productListLicenses) {
            WrapperClass w = new WrapperClass(wrap.product,wrap.boolval,wrap.boolval2,wrap.boolval3,wrap.pricebookEntry,wrap.Total,wrap.NRCTotal);
            productList1.add(w);
            
        }
        
        List<OpportunityLineItem> opplistItem = new List<OpportunityLineItem>();
        if(productList1 != null && !productList1.isEmpty() && opp != null){
            for(WrapperClass prod : productList1){
                if(prod.boolval == true){
                    OpportunityLineItem oppLineProd = new OpportunityLineItem();
                    oppLineProd.Product2Id = prod.product.Id;
                    oppLineProd.Product_Name__c = prod.product.Name;
                    oppLineProd.Category__c = prod.product.Family;
                    oppLineProd.Sub_Category__c = prod.product.Product_Subcategory__c;
                    oppLineProd.Type_of_Billing__c = prod.pricebookEntry.Type_of_Billing__c;
                    oppLineProd.Product_Type__c = prod.product.Product_Type__c;
                    oppLineProd.OpportunityId   = opp.Id;
                    oppLineProd.Equote_ext_ID__c = opp.Id+''+numberOfSites+''+System.Now();
                    oppLineProd.Site__c = siteId;
                    oppLineProd.Site_Number__c = numberOfSites;
                    oppLineProd.Equipment__c = prod.product.Equipment__c;
                    oppLineProd.PriceBook2Id__c = prod.pricebookEntry.Pricebook2Id;
                    oppLineProd.PricebookEntryId     = prod.pricebookEntry.id;
                    oppLineProd.Index__c = prod.product.License_Order__c;
                    oppLineProd.Quantity = decimal.valueOf(prod.product.Quantity__c);
                    oppLineProd.Part_Number__c = prod.product.Part_Number_of_Product__c;
                    oppLineProd.PoE__c = selVal4;
                    oppLineProd.PremiumRule__c = prod.product.PremiumRule__c;
                     oppLineProd.PremiumPlusRule__c = prod.product.PremiumPlusRule__c;
                     oppLineProd.isConferenceRumSeatRule__c = prod.product.isConferenceRumSeatRule__c;
                     oppLineProd.isAnalogRule__c = prod.product.isAnalogRule__c;
                    oppLineProd.Filter_Product__c = 'Parent';
                    oppLineProd.Show_in_PDF__c = prod.product.Show_in_PDF__c;
                    oppLineProd.VENDOR_PRICE_LIST_TO_OFFER__c = prod.pricebookEntry.VENDORPRICELISTTOFTR__c;
                    oppLineProd.GPM__c = prod.pricebookEntry.GPM__c;
                    oppLineProd.UNITCOST__c = prod.pricebookEntry.UNITCOST__c;
                    oppLineProd.DISCOUNT__c = prod.pricebookEntry.DISCOUNT_Price__c;
                    if(prod.pricebookEntry.Type_of_Billing__c == 'MRC'){
                        if(prod.pricebookEntry.UnitPrice != null) {
                            oppLineProd.Unit_Price__c = prod.pricebookEntry.UnitPrice;
                            oppLineProd.TotalPrice = prod.pricebookEntry.UnitPrice * oppLineProd.Quantity;   
                        }   
                    }
                    else{
                        if(prod.pricebookEntry.UnitPrice != null) {
                            oppLineProd.NRC__c = prod.pricebookEntry.UnitPrice;
                            oppLineProd.TotalPrice = prod.pricebookEntry.UnitPrice * oppLineProd.Quantity;   
                        } 
                    }
                    opplistItem.add(oppLineProd);
                }
            }
        }
        List<WrapperClass> productListAddOn1 = new List<WrapperClass> ();
        for(WrapperClass wrap : productListAddOn) {
            WrapperClass w = new WrapperClass(wrap.product,wrap.boolval,wrap.boolval2,wrap.boolval3,wrap.pricebookEntry,wrap.Total,wrap.NRCTotal);
            productListAddOn1.add(w);
            
        }
        if(productListAddOn1 != null && !productListAddOn1.isEmpty() && opp != null){
            for(WrapperClass prod : productListAddOn1){
                if(prod.boolval == true){
                    OpportunityLineItem oppLineProd = new OpportunityLineItem();
                    oppLineProd.Product2Id = prod.product.Id;
                    oppLineProd.Product_Name__c = prod.product.Name;
                    oppLineProd.Category__c = prod.product.Family;
                    oppLineProd.Sub_Category__c = prod.product.Product_Subcategory__c;
                    oppLineProd.Type_of_Billing__c = prod.pricebookEntry.Type_of_Billing__c;
                    oppLineProd.Product_Type__c = prod.product.Product_Type__c;
                    oppLineProd.OpportunityId   = opp.Id;
                    oppLineProd.Equote_ext_ID__c = opp.Id+''+numberOfSites+''+System.Now();
                    oppLineProd.Site__c = siteId;
                    oppLineProd.Site_Number__c = numberOfSites;
                    oppLineProd.Equipment__c = prod.product.Equipment__c;
                    oppLineProd.PriceBook2Id__c = prod.pricebookEntry.Pricebook2Id;
                    oppLineProd.PricebookEntryId     = prod.pricebookEntry.id;
                    oppLineProd.Index__c = prod.product.License_Order__c;
                    oppLineProd.Quantity = decimal.valueOf(prod.product.Quantity__c);
                    oppLineProd.Part_Number__c = prod.product.Part_Number_of_Product__c;
                    oppLineProd.PoE__c = selVal4;
                    oppLineProd.isSmartAdditionalDID__c = prod.product.isSmartAdditionalDID__c;
                    oppLineProd.isSmartAdditionalManagedAutoAttendant__c = prod.product.isSmartAdditionalManagedAutoAttendant__c;
                    oppLineProd.isSmartDirectoryListing__c = prod.product.isSmartDirectoryListing__c;
                    oppLineProd.isSmartE911__c = prod.product.isSmartE911__c;
                    oppLineProd.isSmartExtendedNum__c = prod.product.isSmartExtendedNum__c;
                    oppLineProd.isSmartMonthlyAdminCharge__c = prod.product.isSmartMonthlyAdminCharge__c;
                    oppLineProd.isSmartMultiLineHunt__c = prod.product.isSmartMultiLineHunt__c;
                    oppLineProd.isSmartPremiumAttendant__c = prod.product.isSmartPremiumAttendant__c;
                    oppLineProd.isSmartTollFreeDomestic__c = prod.product.isSmartTollFreeDomestic__c;
                    oppLineProd.isSmartTollFreeDomesticUS__c = prod.product.isSmartTollFreeDomesticUS__c;
                    oppLineProd.isSmartTollFreeNum__c = prod.product.isSmartTollFreeNum__c;
                    oppLineProd.Filter_Product__c = 'Parent';
                    oppLineProd.Show_in_PDF__c = prod.product.Show_in_PDF__c;
                    oppLineProd.VENDOR_PRICE_LIST_TO_OFFER__c = prod.pricebookEntry.VENDORPRICELISTTOFTR__c;
                    oppLineProd.GPM__c = prod.pricebookEntry.GPM__c;
                    oppLineProd.UNITCOST__c = prod.pricebookEntry.UNITCOST__c;
                    oppLineProd.DISCOUNT__c = prod.pricebookEntry.DISCOUNT_Price__c;
                    if(prod.pricebookEntry.Type_of_Billing__c == 'MRC'){
                        if(prod.pricebookEntry.UnitPrice != null) {
                            oppLineProd.Unit_Price__c = prod.pricebookEntry.UnitPrice;
                            oppLineProd.TotalPrice = prod.pricebookEntry.UnitPrice * oppLineProd.Quantity;   
                        }   
                    }
                    else{
                        if(prod.pricebookEntry.UnitPrice != null) {
                            oppLineProd.NRC__c = prod.pricebookEntry.UnitPrice;
                            oppLineProd.TotalPrice = prod.pricebookEntry.UnitPrice * oppLineProd.Quantity;   
                        } 
                    }
                    opplistItem.add(oppLineProd);
                    
                }
            }
        }
        List<WrapperClass> productListIpPhones1 = new List<WrapperClass> ();
        for(WrapperClass wrap : productListIpPhones) {
            WrapperClass w = new WrapperClass(wrap.product,wrap.boolval,wrap.boolval2,wrap.boolval3,wrap.pricebookEntry,wrap.Total,wrap.NRCTotal);
            productListIpPhones1.add(w);
        }
        
        if(productListIpPhones1 != null && !productListIpPhones1.isEmpty() && opp != null){
            for(WrapperClass prod : productListIpPhones1){
                if(prod.boolval == true){
                    OpportunityLineItem oppLineProd = new OpportunityLineItem();
                    oppLineProd.Product2Id = prod.product.Id;
                    oppLineProd.Product_Name__c = prod.product.Name;
                    oppLineProd.Category__c = prod.product.Family;
                    oppLineProd.Sub_Category__c = prod.product.Product_Subcategory__c;
                    oppLineProd.Type_of_Billing__c = prod.pricebookEntry.Type_of_Billing__c;
                    oppLineProd.Product_Type__c = prod.product.Product_Type__c;
                    oppLineProd.OpportunityId   = opp.Id;
                    oppLineProd.Equote_ext_ID__c = opp.Id+''+numberOfSites+''+System.Now();
                    oppLineProd.Site__c = siteId;
                    oppLineProd.Site_Number__c = numberOfSites;
                    oppLineProd.Equipment__c = prod.product.Equipment__c;
                    oppLineProd.PriceBook2Id__c = prod.pricebookEntry.Pricebook2Id;
                    oppLineProd.PricebookEntryId     = prod.pricebookEntry.id;
                    oppLineProd.Index__c = prod.product.License_Order__c;
                    oppLineProd.Quantity = decimal.valueOf(prod.product.Quantity__c);
                    oppLineProd.Part_Number__c = prod.product.Part_Number_of_Product__c;
                    oppLineProd.PoE__c = selVal4;
                    oppLineProd.isVVX311__c = prod.product.isVVX311__c;
                    oppLineProd.isVVX501__c = prod.product.isVVX501__c;
                    oppLineProd.isVVX601__c = prod.product.isVVX601__c;
                    oppLineProd.isSoundStationIp5000__c = prod.product.isSoundStationIp5000__c;
                    oppLineProd.isSoundStationIp6000__c = prod.product.isSoundStationIp6000__c;
                    oppLineProd.isSoundStationIp7000__c = prod.product.isSoundStationIp7000__c;
                    oppLineProd.Filter_Product__c = 'Parent';
                    oppLineProd.Show_in_PDF__c = prod.product.Show_in_PDF__c;
                    oppLineProd.VENDOR_PRICE_LIST_TO_OFFER__c = prod.pricebookEntry.VENDORPRICELISTTOFTR__c;
                    oppLineProd.GPM__c = prod.pricebookEntry.GPM__c;
                    oppLineProd.UNITCOST__c = prod.pricebookEntry.UNITCOST__c;
                    oppLineProd.DISCOUNT__c = prod.pricebookEntry.DISCOUNT_Price__c;
                    if(prod.pricebookEntry.Type_of_Billing__c == 'MRC'){
                        if(prod.pricebookEntry.UnitPrice != null) {
                            oppLineProd.Unit_Price__c = prod.pricebookEntry.UnitPrice;
                            oppLineProd.TotalPrice = prod.pricebookEntry.UnitPrice * oppLineProd.Quantity;   
                        }   
                    }
                    else{
                        if(prod.pricebookEntry.UnitPrice != null) {
                            oppLineProd.NRC__c = prod.pricebookEntry.UnitPrice;
                            oppLineProd.TotalPrice = prod.pricebookEntry.UnitPrice * oppLineProd.Quantity;   
                        } 
                    }
                    opplistItem.add(oppLineProd);
                }
            }
        }
        List<WrapperClass> productListSwitch1= new List<WrapperClass> ();
        for(WrapperClass wrap : productListSwitch) {
            WrapperClass w = new WrapperClass(wrap.product,wrap.boolval,wrap.boolval2,wrap.boolval3,wrap.pricebookEntry,wrap.Total,wrap.NRCTotal);
            productListSwitch1.add(w);
            
        }
        if(productListSwitch1 != null && !productListSwitch1.isEmpty() && opp != null){
            for(WrapperClass prod : productListSwitch1){
                if(prod.boolval == true){
                    OpportunityLineItem oppLineProd = new OpportunityLineItem();
                    oppLineProd.Product2Id = prod.product.Id;
                    oppLineProd.Product_Name__c = prod.product.Name;
                    oppLineProd.Category__c = prod.product.Family;
                    oppLineProd.Sub_Category__c = prod.product.Product_Subcategory__c;
                    oppLineProd.Type_of_Billing__c = prod.pricebookEntry.Type_of_Billing__c;
                    oppLineProd.Product_Type__c = prod.product.Product_Type__c;
                    oppLineProd.OpportunityId   = opp.Id;
                    oppLineProd.Equote_ext_ID__c = opp.Id+''+numberOfSites+''+System.Now();
                    oppLineProd.Site__c = siteId;
                    oppLineProd.Site_Number__c = numberOfSites;
                    oppLineProd.Equipment__c = prod.product.Equipment__c;
                    oppLineProd.PriceBook2Id__c = prod.pricebookEntry.Pricebook2Id;
                    oppLineProd.PricebookEntryId     = prod.pricebookEntry.id;
                    oppLineProd.Index__c = prod.product.License_Order__c;
                    oppLineProd.Quantity = decimal.valueOf(prod.product.Quantity__c);
                    oppLineProd.Part_Number__c = prod.product.Part_Number_of_Product__c;
                    oppLineProd.PoE__c = selVal4;
                    oppLineProd.isNETGEAR__c = prod.product.isNETGEAR__c;
                    oppLineProd.Filter_Product__c = 'Parent';
                    oppLineProd.Show_in_PDF__c = prod.product.Show_in_PDF__c;
                    oppLineProd.VENDOR_PRICE_LIST_TO_OFFER__c = prod.pricebookEntry.VENDORPRICELISTTOFTR__c;
                    oppLineProd.GPM__c = prod.pricebookEntry.GPM__c;
                    oppLineProd.UNITCOST__c = prod.pricebookEntry.UNITCOST__c;
                    oppLineProd.DISCOUNT__c = prod.pricebookEntry.DISCOUNT_Price__c;
                    oppLineProd.isPolycomATA__c = prod.product.isPolycomATA__c;
                    if(prod.pricebookEntry.Type_of_Billing__c == 'MRC'){
                        if(prod.pricebookEntry.UnitPrice != null) {
                            oppLineProd.Unit_Price__c = prod.pricebookEntry.UnitPrice;
                            oppLineProd.TotalPrice = prod.pricebookEntry.UnitPrice * oppLineProd.Quantity;   
                        }   
                    }
                    else{
                        if(prod.pricebookEntry.UnitPrice != null) {
                            oppLineProd.NRC__c = prod.pricebookEntry.UnitPrice;
                            oppLineProd.TotalPrice = prod.pricebookEntry.UnitPrice * oppLineProd.Quantity;   
                        } 
                    }
                    opplistItem.add(oppLineProd);
                }
            }
        }
        List<WrapperClass> productListEquipment1 = new List<WrapperClass> ();
        for(WrapperClass wrap : productListEquipment) {
            WrapperClass w = new WrapperClass(wrap.product,wrap.boolval,wrap.boolval2,wrap.boolval3,wrap.pricebookEntry,wrap.Total,wrap.NRCTotal);
            productListEquipment1.add(w);
        }
        if(productListEquipment1 != null && !productListEquipment1.isEmpty() && opp != null){
            for(WrapperClass prod : productListEquipment1){
                if(prod.boolval == true){
                    OpportunityLineItem oppLineProd = new OpportunityLineItem();
                    oppLineProd.Product2Id = prod.product.Id;
                    oppLineProd.Product_Name__c = prod.product.Name;
                    oppLineProd.Category__c = prod.product.Family;
                    oppLineProd.Sub_Category__c = prod.product.Product_Subcategory__c;
                    oppLineProd.Type_of_Billing__c = prod.pricebookEntry.Type_of_Billing__c;
                    oppLineProd.Product_Type__c = prod.product.Product_Type__c;
                    oppLineProd.OpportunityId   = opp.Id;
                    oppLineProd.Equote_ext_ID__c = opp.Id+''+numberOfSites+''+System.Now();
                    oppLineProd.Site__c = siteId;
                    oppLineProd.Site_Number__c = numberOfSites;
                    oppLineProd.Equipment__c = prod.product.Equipment__c;
                    oppLineProd.PriceBook2Id__c = prod.pricebookEntry.Pricebook2Id;
                    oppLineProd.PricebookEntryId     = prod.pricebookEntry.id;
                    oppLineProd.Index__c = prod.product.License_Order__c;
                    oppLineProd.Quantity = decimal.valueOf(prod.product.Quantity__c);
                    oppLineProd.Part_Number__c = prod.product.Part_Number_of_Product__c;
                    oppLineProd.PoE__c = selVal4;
                    oppLineProd.Filter_Product__c = 'Parent';
                    oppLineProd.Show_in_PDF__c = prod.product.Show_in_PDF__c;
                    oppLineProd.VENDOR_PRICE_LIST_TO_OFFER__c = prod.pricebookEntry.VENDORPRICELISTTOFTR__c;
                    oppLineProd.GPM__c = prod.pricebookEntry.GPM__c;
                    oppLineProd.UNITCOST__c = prod.pricebookEntry.UNITCOST__c;
                    oppLineProd.DISCOUNT__c = prod.pricebookEntry.DISCOUNT_Price__c;
                    if(prod.pricebookEntry.Type_of_Billing__c == 'MRC'){
                        if(prod.pricebookEntry.UnitPrice != null) {
                            oppLineProd.Unit_Price__c = prod.pricebookEntry.UnitPrice;
                            oppLineProd.TotalPrice = prod.pricebookEntry.UnitPrice * oppLineProd.Quantity;   
                        }   
                    }
                    else{
                        if(prod.pricebookEntry.UnitPrice != null) {
                            oppLineProd.NRC__c = prod.pricebookEntry.UnitPrice;
                            oppLineProd.TotalPrice = prod.pricebookEntry.UnitPrice * oppLineProd.Quantity;   
                        } 
                    }
                    opplistItem.add(oppLineProd);
                }
            }
        }
        
        List<WrapperClass> productListRepair1= new List<WrapperClass> ();
        for(WrapperClass wrap : productListRepair) {
            WrapperClass w = new WrapperClass(wrap.product,wrap.boolval,wrap.boolval2,wrap.boolval3,wrap.pricebookEntry,wrap.Total,wrap.NRCTotal);
            productListRepair1.add(w);
            
        }
        if(productListRepair1 != null && !productListRepair1.isEmpty() && opp != null){
            for(WrapperClass prod : productListRepair1){
                if(prod.boolval == true){
                    OpportunityLineItem oppLineProd = new OpportunityLineItem();
                    oppLineProd.Product2Id = prod.product.Id;
                    oppLineProd.Product_Name__c = prod.product.Name;
                    oppLineProd.Category__c = prod.product.Family;
                    oppLineProd.Sub_Category__c = prod.product.Product_Subcategory__c;
                    oppLineProd.Type_of_Billing__c = prod.pricebookEntry.Type_of_Billing__c;
                    oppLineProd.Product_Type__c = prod.product.Product_Type__c;
                    oppLineProd.OpportunityId   = opp.Id;
                    oppLineProd.Equote_ext_ID__c = opp.Id+''+numberOfSites+''+System.Now();
                    oppLineProd.Site__c = siteId;
                    oppLineProd.Site_Number__c = numberOfSites;
                    oppLineProd.Equipment__c = prod.product.Equipment__c;
                    oppLineProd.PriceBook2Id__c = prod.pricebookEntry.Pricebook2Id;
                    oppLineProd.PricebookEntryId     = prod.pricebookEntry.id;
                    oppLineProd.Index__c = prod.product.License_Order__c;
                    oppLineProd.Quantity = decimal.valueOf(prod.product.Quantity__c);
                    oppLineProd.Part_Number__c = prod.product.Part_Number_of_Product__c;
                    oppLineProd.PoE__c = selVal4;
                    oppLineProd.Filter_Product__c = 'Parent';
                    oppLineProd.Show_in_PDF__c = prod.product.Show_in_PDF__c;
                    oppLineProd.VENDOR_PRICE_LIST_TO_OFFER__c = prod.pricebookEntry.VENDORPRICELISTTOFTR__c;
                    oppLineProd.GPM__c = prod.pricebookEntry.GPM__c;
                    oppLineProd.UNITCOST__c = prod.pricebookEntry.UNITCOST__c;
                    oppLineProd.DISCOUNT__c = prod.pricebookEntry.DISCOUNT_Price__c;
                    if(prod.pricebookEntry.Type_of_Billing__c == 'MRC'){
                        if(prod.pricebookEntry.UnitPrice != null) {
                            oppLineProd.Unit_Price__c = prod.pricebookEntry.UnitPrice;
                            oppLineProd.TotalPrice = prod.pricebookEntry.UnitPrice * oppLineProd.Quantity;   
                        }   
                    }
                    else{
                        if(prod.pricebookEntry.UnitPrice != null) {
                            oppLineProd.NRC__c = prod.pricebookEntry.UnitPrice;
                            oppLineProd.TotalPrice = prod.pricebookEntry.UnitPrice * oppLineProd.Quantity;   
                        } 
                    }
                    opplistItem.add(oppLineProd);
                }
            }
        }
        List<WrapperClass> productListBroadband1 = new List<WrapperClass> ();
        for(WrapperClass wrap : productListBroadband) {
            WrapperClass w = new WrapperClass(wrap.product,wrap.boolval,wrap.boolval2,wrap.boolval3,wrap.pricebookEntry,wrap.Total,wrap.NRCTotal);
            productListBroadband1.add(w);
        }
        if(productListBroadband1 != null && !productListBroadband1.isEmpty() && opp != null){
            for(WrapperClass prod : productListBroadband1){
                if(prod.boolval == true){
                    OpportunityLineItem oppLineProd = new OpportunityLineItem();
                    oppLineProd.Product2Id = prod.product.Id;
                    oppLineProd.Product_Name__c = prod.product.Name;
                    oppLineProd.Category__c = prod.product.Family;
                    oppLineProd.Sub_Category__c = prod.product.Product_Subcategory__c;
                    oppLineProd.Type_of_Billing__c = prod.pricebookEntry.Type_of_Billing__c;
                    oppLineProd.Product_Type__c = prod.product.Product_Type__c;
                    oppLineProd.OpportunityId   = opp.Id;
                    oppLineProd.Equote_ext_ID__c = opp.Id+''+numberOfSites+''+System.Now();
                    oppLineProd.Site__c = siteId;
                    oppLineProd.Site_Number__c = numberOfSites;
                    oppLineProd.Equipment__c = prod.product.Equipment__c;
                    oppLineProd.PriceBook2Id__c = prod.pricebookEntry.Pricebook2Id;
                    oppLineProd.PricebookEntryId     = prod.pricebookEntry.id;
                    oppLineProd.Index__c = prod.product.License_Order__c;
                    oppLineProd.Quantity = decimal.valueOf(prod.product.Quantity__c);
                    oppLineProd.Part_Number__c = prod.product.Part_Number_of_Product__c;
                    oppLineProd.PoE__c = selVal4;
                    oppLineProd.BroadbandIpOptionEach__c = prod.product.BroadbandIpOptionEach__c;
                    oppLineProd.BroadbandIpOption5Ips__c = prod.product.BroadbandIpOption5Ips__c;
                    oppLineProd.BroadbandIpOption13Ips__c = prod.product.BroadbandIpOption13Ips__c;
                    oppLineProd.Filter_Product__c = 'Parent';
                    oppLineProd.Show_in_PDF__c = prod.product.Show_in_PDF__c;
                    oppLineProd.VENDOR_PRICE_LIST_TO_OFFER__c = prod.pricebookEntry.VENDORPRICELISTTOFTR__c;
                    oppLineProd.GPM__c = prod.pricebookEntry.GPM__c;
                    oppLineProd.UNITCOST__c = prod.pricebookEntry.UNITCOST__c;
                    oppLineProd.DISCOUNT__c = prod.pricebookEntry.DISCOUNT_Price__c;
                    if(prod.pricebookEntry.Type_of_Billing__c == 'MRC'){
                        if(prod.pricebookEntry.UnitPrice != null) {
                            oppLineProd.Unit_Price__c = prod.pricebookEntry.UnitPrice;
                            oppLineProd.TotalPrice = prod.pricebookEntry.UnitPrice * oppLineProd.Quantity;   
                        }   
                    }
                    else{
                        if(prod.pricebookEntry.UnitPrice != null) {
                            oppLineProd.NRC__c = prod.pricebookEntry.UnitPrice;
                            oppLineProd.TotalPrice = prod.pricebookEntry.UnitPrice * oppLineProd.Quantity;   
                        } 
                    }
                    opplistItem.add(oppLineProd);
                }
            }
        }
        
        List<WrapperClass> productListFIOS1 = new List<WrapperClass> ();
        for(WrapperClass wrap : productListFIOS) {
            WrapperClass w = new WrapperClass(wrap.product,wrap.boolval,wrap.boolval2,wrap.boolval3,wrap.pricebookEntry,wrap.Total,wrap.NRCTotal);
            productListFIOS1.add(w);
        }
        if(productListFIOS1 != null && !productListFIOS1.isEmpty() && opp != null){
            for(WrapperClass prod : productListFIOS1){
                if(prod.boolval == true){
                    OpportunityLineItem oppLineProd = new OpportunityLineItem();
                    oppLineProd.Product2Id = prod.product.Id;
                    oppLineProd.Product_Name__c = prod.product.Name;
                    oppLineProd.Category__c = prod.product.Family;
                    oppLineProd.Sub_Category__c = prod.product.Product_Subcategory__c;
                    oppLineProd.Type_of_Billing__c = prod.pricebookEntry.Type_of_Billing__c;
                    oppLineProd.Product_Type__c = prod.product.Product_Type__c;
                    oppLineProd.OpportunityId   = opp.Id;
                    oppLineProd.Equote_ext_ID__c = opp.Id+''+numberOfSites+''+System.Now();
                    oppLineProd.Site__c = siteId;
                    oppLineProd.Site_Number__c = numberOfSites;
                    oppLineProd.Equipment__c = prod.product.Equipment__c;
                    oppLineProd.PriceBook2Id__c = prod.pricebookEntry.Pricebook2Id;
                    oppLineProd.PricebookEntryId     = prod.pricebookEntry.id;
                    oppLineProd.Index__c = prod.product.License_Order__c;
                    oppLineProd.Quantity = decimal.valueOf(prod.product.Quantity__c);
                    oppLineProd.Part_Number__c = prod.product.Part_Number_of_Product__c;
                    oppLineProd.PoE__c = selVal4;
                    oppLineProd.SmartVoice_FiOS_100_100_Broadband__c = prod.product.SmartVoice_FiOS_100_100_Broadband__c;
                     oppLineProd.SmartVoice_FiOS_500_500_Broadband__c = prod.product.SmartVoice_FiOS_500_500_Broadband__c;
                     oppLineProd.SmartVoice_FiOS_1G_1G_Broadband__c = prod.product.SmartVoice_FiOS_1G_1G_Broadband__c;
                    oppLineProd.Filter_Product__c = 'Parent';
                    oppLineProd.Show_in_PDF__c = prod.product.Show_in_PDF__c;
                    oppLineProd.VENDOR_PRICE_LIST_TO_OFFER__c = prod.pricebookEntry.VENDORPRICELISTTOFTR__c;
                    oppLineProd.GPM__c = prod.pricebookEntry.GPM__c;
                    oppLineProd.UNITCOST__c = prod.pricebookEntry.UNITCOST__c;
                    oppLineProd.DISCOUNT__c = prod.pricebookEntry.DISCOUNT_Price__c;
                    if(prod.pricebookEntry.Type_of_Billing__c == 'MRC'){
                        if(prod.pricebookEntry.UnitPrice != null) {
                            oppLineProd.Unit_Price__c = prod.pricebookEntry.UnitPrice;
                            oppLineProd.TotalPrice = prod.pricebookEntry.UnitPrice * oppLineProd.Quantity;   
                        }   
                    }
                    else{
                        if(prod.pricebookEntry.UnitPrice != null) {
                            oppLineProd.NRC__c = prod.pricebookEntry.UnitPrice;
                            oppLineProd.TotalPrice = prod.pricebookEntry.UnitPrice * oppLineProd.Quantity;   
                        } 
                    }
                    opplistItem.add(oppLineProd);
                }
            }
        }
        
        List<WrapperClass> productListFiber1 = new List<WrapperClass> ();
        for(WrapperClass wrap : productListFiber) {
            WrapperClass w = new WrapperClass(wrap.product,wrap.boolval,wrap.boolval2,wrap.boolval3,wrap.pricebookEntry,wrap.Total,wrap.NRCTotal);
            productListFiber1.add(w);
        }
        if(productListFiber1 != null && !productListFiber1.isEmpty() && opp != null){
            for(WrapperClass prod : productListFiber1){
                if(prod.boolval == true){
                    OpportunityLineItem oppLineProd = new OpportunityLineItem();
                    oppLineProd.Product2Id = prod.product.Id;
                    oppLineProd.Product_Name__c = prod.product.Name;
                    oppLineProd.Category__c = prod.product.Family;
                    oppLineProd.Sub_Category__c = prod.product.Product_Subcategory__c;
                    oppLineProd.Type_of_Billing__c = prod.pricebookEntry.Type_of_Billing__c;
                    oppLineProd.Product_Type__c = prod.product.Product_Type__c;
                    oppLineProd.OpportunityId   = opp.Id;
                    oppLineProd.Equote_ext_ID__c = opp.Id+''+numberOfSites+''+System.Now();
                    oppLineProd.Site__c = siteId;
                    oppLineProd.Site_Number__c = numberOfSites;
                    oppLineProd.Equipment__c = prod.product.Equipment__c;
                    oppLineProd.PriceBook2Id__c = prod.pricebookEntry.Pricebook2Id;
                    oppLineProd.PricebookEntryId     = prod.pricebookEntry.id;
                    oppLineProd.Index__c = prod.product.License_Order__c;
                    oppLineProd.Quantity = decimal.valueOf(prod.product.Quantity__c);
                    oppLineProd.Part_Number__c = prod.product.Part_Number_of_Product__c;
                    oppLineProd.PoE__c = selVal4;
                    oppLineProd.SmartVoice_Fiber_100_100_Broadband__c = prod.product.SmartVoice_Fiber_100_100_Broadband__c;
                    oppLineProd.SmartVoice_Fiber_500_500_Broadband__c = prod.product.SmartVoice_Fiber_500_500_Broadband__c;
                    oppLineProd.SmartVoice_Fiber_1G_1G_Broadband__c = prod.product.SmartVoice_Fiber_1G_1G_Broadband__c;
                    oppLineProd.Filter_Product__c = 'Parent';
                    oppLineProd.Show_in_PDF__c = prod.product.Show_in_PDF__c;
                    oppLineProd.VENDOR_PRICE_LIST_TO_OFFER__c = prod.pricebookEntry.VENDORPRICELISTTOFTR__c;
                    oppLineProd.GPM__c = prod.pricebookEntry.GPM__c;
                    oppLineProd.UNITCOST__c = prod.pricebookEntry.UNITCOST__c;
                    oppLineProd.DISCOUNT__c = prod.pricebookEntry.DISCOUNT_Price__c;
                    if(prod.pricebookEntry.Type_of_Billing__c == 'MRC'){
                        if(prod.pricebookEntry.UnitPrice != null) {
                            oppLineProd.Unit_Price__c = prod.pricebookEntry.UnitPrice;
                            oppLineProd.TotalPrice = prod.pricebookEntry.UnitPrice * oppLineProd.Quantity;   
                        }   
                    }
                    else{
                        if(prod.pricebookEntry.UnitPrice != null) {
                            oppLineProd.NRC__c = prod.pricebookEntry.UnitPrice;
                            oppLineProd.TotalPrice = prod.pricebookEntry.UnitPrice * oppLineProd.Quantity;   
                        } 
                    }
                    opplistItem.add(oppLineProd);
                }
            }
        }
        
        List<WrapperClass> productListBHSI1 = new List<WrapperClass> ();
        for(WrapperClass wrap : productListBHSI) {
            WrapperClass w = new WrapperClass(wrap.product,wrap.boolval,wrap.boolval2,wrap.boolval3,wrap.pricebookEntry,wrap.Total,wrap.NRCTotal);
            productListBHSI1.add(w);
        }
        if(productListBHSI1 != null && !productListBHSI1.isEmpty() && opp != null){
            for(WrapperClass prod : productListBHSI1){
                if(prod.boolval == true){
                    OpportunityLineItem oppLineProd = new OpportunityLineItem();
                    oppLineProd.Product2Id = prod.product.Id;
                    oppLineProd.Product_Name__c = prod.product.Name;
                    oppLineProd.Category__c = prod.product.Family;
                    oppLineProd.Sub_Category__c = prod.product.Product_Subcategory__c;
                    oppLineProd.Type_of_Billing__c = prod.pricebookEntry.Type_of_Billing__c;
                    oppLineProd.Product_Type__c = prod.product.Product_Type__c;
                    oppLineProd.OpportunityId   = opp.Id;
                    oppLineProd.Equote_ext_ID__c = opp.Id+''+numberOfSites+''+System.Now();
                    oppLineProd.Site__c = siteId;
                    oppLineProd.Site_Number__c = numberOfSites;
                    oppLineProd.Equipment__c = prod.product.Equipment__c;
                    oppLineProd.PriceBook2Id__c = prod.pricebookEntry.Pricebook2Id;
                    oppLineProd.PricebookEntryId     = prod.pricebookEntry.id;
                    oppLineProd.Index__c = prod.product.License_Order__c;
                    oppLineProd.Quantity = decimal.valueOf(prod.product.Quantity__c);
                    oppLineProd.Part_Number__c = prod.product.Part_Number_of_Product__c;
                    oppLineProd.PoE__c = selVal4;
                     oppLineProd.SmartVoice_Broadband_12__c = prod.product.SmartVoice_Broadband_12__c;
                    oppLineProd.SmartVoice_Broadband_18__c = prod.product.SmartVoice_Broadband_18__c;
                    oppLineProd.SmartVoice_Broadband_25__c = prod.product.SmartVoice_Broadband_25__c;
                    oppLineProd.SmartVoice_Broadband_35__c = prod.product.SmartVoice_Broadband_35__c;
                    oppLineProd.SmartVoice_Broadband_45__c = prod.product.SmartVoice_Broadband_45__c;
                    oppLineProd.SmartVoice_Broadband_70__c = prod.product.SmartVoice_Broadband_70__c;
                    oppLineProd.SmartVoice_Broadband_12__c = prod.product.SmartVoice_Broadband_12__c;
                    oppLineProd.SmartVoice_Broadband_90__c = prod.product.SmartVoice_Broadband_90__c;
                    oppLineProd.SmartVoice_Broadband_115__c = prod.product.SmartVoice_Broadband_115__c;
                    oppLineProd.Filter_Product__c = 'Parent';
                    oppLineProd.Show_in_PDF__c = prod.product.Show_in_PDF__c;
                    oppLineProd.VENDOR_PRICE_LIST_TO_OFFER__c = prod.pricebookEntry.VENDORPRICELISTTOFTR__c;
                    oppLineProd.GPM__c = prod.pricebookEntry.GPM__c;
                    oppLineProd.UNITCOST__c = prod.pricebookEntry.UNITCOST__c;
                    oppLineProd.DISCOUNT__c = prod.pricebookEntry.DISCOUNT_Price__c;
                    if(prod.pricebookEntry.Type_of_Billing__c == 'MRC'){
                        if(prod.pricebookEntry.UnitPrice != null) {
                            oppLineProd.Unit_Price__c = prod.pricebookEntry.UnitPrice;
                            oppLineProd.TotalPrice = prod.pricebookEntry.UnitPrice * oppLineProd.Quantity;   
                        }   
                    }
                    else{
                        if(prod.pricebookEntry.UnitPrice != null) {
                            oppLineProd.NRC__c = prod.pricebookEntry.UnitPrice;
                            oppLineProd.TotalPrice = prod.pricebookEntry.UnitPrice * oppLineProd.Quantity;   
                        } 
                    }
                    opplistItem.add(oppLineProd);
                }
            }
        }
        
        List<WrapperClass> productListTelecomm1 = new List<WrapperClass> ();
        for(WrapperClass wrap : productListTelecomm) {
            WrapperClass w = new WrapperClass(wrap.product,wrap.boolval,wrap.boolval2,wrap.boolval3,wrap.pricebookEntry,wrap.Total,wrap.NRCTotal);
            productListTelecomm1.add(w);
        }
        if(productListTelecomm1 != null && !productListTelecomm1.isEmpty() && opp != null){
            for(WrapperClass prod : productListTelecomm1){
                if(prod.boolval == true){
                    OpportunityLineItem oppLineProd = new OpportunityLineItem();
                    oppLineProd.Product2Id = prod.product.Id;
                    oppLineProd.Product_Name__c = prod.product.Name;
                    oppLineProd.Category__c = prod.product.Family;
                    oppLineProd.Sub_Category__c = prod.product.Product_Subcategory__c;
                    oppLineProd.Type_of_Billing__c = prod.pricebookEntry.Type_of_Billing__c;
                    oppLineProd.Product_Type__c = prod.product.Product_Type__c;
                    oppLineProd.OpportunityId   = opp.Id;
                    oppLineProd.Equote_ext_ID__c = opp.Id+''+numberOfSites+''+System.Now();
                    oppLineProd.Site__c = siteId;
                    oppLineProd.Site_Number__c = numberOfSites;
                    oppLineProd.Equipment__c = prod.product.Equipment__c;
                    oppLineProd.PriceBook2Id__c = prod.pricebookEntry.Pricebook2Id;
                    oppLineProd.PricebookEntryId     = prod.pricebookEntry.id;
                    oppLineProd.Index__c = prod.product.License_Order__c;
                    oppLineProd.Quantity = decimal.valueOf(prod.product.Quantity__c);
                    oppLineProd.Part_Number__c = prod.product.Part_Number_of_Product__c;
                    oppLineProd.PoE__c = selVal4;
                    oppLineProd.Filter_Product__c = 'Parent';
                    oppLineProd.Show_in_PDF__c = prod.product.Show_in_PDF__c;
                    oppLineProd.VENDOR_PRICE_LIST_TO_OFFER__c = prod.pricebookEntry.VENDORPRICELISTTOFTR__c;
                    oppLineProd.GPM__c = prod.pricebookEntry.GPM__c;
                    oppLineProd.UNITCOST__c = prod.pricebookEntry.UNITCOST__c;
                    oppLineProd.DISCOUNT__c = prod.pricebookEntry.DISCOUNT_Price__c;
                    if(prod.pricebookEntry.Type_of_Billing__c == 'MRC'){
                        if(prod.pricebookEntry.UnitPrice != null) {
                            oppLineProd.Unit_Price__c = prod.pricebookEntry.UnitPrice;
                            oppLineProd.TotalPrice = prod.pricebookEntry.UnitPrice * oppLineProd.Quantity;   
                        }   
                    }
                    else{
                        if(prod.pricebookEntry.UnitPrice != null) {
                            oppLineProd.NRC__c = prod.pricebookEntry.UnitPrice;
                            oppLineProd.TotalPrice = prod.pricebookEntry.UnitPrice * oppLineProd.Quantity;   
                        } 
                    }
                    opplistItem.add(oppLineProd);
                }
            }
        }
        try{
            insert opplistItem;
        }catch(Exception e){ }
    }
    
    public class WrapperClass{
        @AuraEnabled public  Product2 product {get;set;}
        @AuraEnabled public boolean boolval {get;set;}
        @AuraEnabled public boolean boolval2 {get;set;}
        @AuraEnabled public boolean boolval3 {get;set;}
        @AuraEnabled public PricebookEntry pricebookEntry {get;set;}
        @AuraEnabled public Decimal Total {get;set;}
        @AuraEnabled public Decimal NRCTotal {get;set;}
        public WrapperClass(){
        }
        
        public WrapperClass(Product2 product,boolean boolval,boolean boolval2,boolean boolval3, PricebookEntry pricebookEntry, Decimal Total,Decimal NRCTotal) {
            this.product = product;
            this.boolval = boolval;
            this.boolval2 = boolval2;
            this.boolval3 = boolval3;
            this.pricebookEntry = pricebookEntry;
            this.Total = Total;
            this.NRCTotal = NRCTotal;
        }
    }
}