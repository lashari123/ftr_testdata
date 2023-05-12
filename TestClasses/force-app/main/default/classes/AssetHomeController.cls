public with sharing class AssetHomeController {   
    
    /*/  @AuraEnabled
public static string getAssetCategory(Id assId){
Asset__c ass = [select CATEGORY__c	 from Asset__c where id =: assId];
return string.valueOf(ass.CATEGORY__c);  DPI_SERVICE_TYPE__C,
} */
    
    
    // This method is used to fetch the states from state object
    @AuraEnabled
    public static List<State__c> getAssetStates(){
        System.debug([SELECT Id,Name,State_Code__c FROM State__c]);
        return [SELECT Id,Name,State_Code__c FROM State__c];
    }
    
    /*
@AuraEnabled
public static List<Asset__c> getAssetCities(){
return [SELECT Id,Name,DPI_SERVICEADDRESS__c FROM Asset__c where PORTAL_VIEW__c	= 'X'  LIMIT 2000 ];
}*/
    
    // This method is used to fetch assets records by using state and city as parameters
    @AuraEnabled
    public static List<Asset__c> getAssetsByStateAndCity(String state, String city ){
        
        List<Asset__c> assLst = new List<Asset__c>();
        Set<String> streets = new Set<String>();
        // List<AggregateResult> assLst = new List<AggregateResult>();
        Id contactId = [SELECT Id,Name,ContactId FROM User WHERE Id =: UserInfo.getUserId()].ContactId;
        if(!test.isRunningTest()){
            
            Id AccountId = [SELECT Id,AccountId FROM Contact WHERE Id =: contactId].AccountId; //currentUser.Contact.AccountId;
            for(Asset__c ast : [SELECT Id,Name,dpi_STATE__c,dpi_CITY__c,DPI_SERVICEADDRESS__c,dpi_ZIPCODE__c,
                                DPI_POSTALCODE__c,Account__c,
                                PRODUCT_DESCRIPTION_c__c,CircuitId__c,dpi_WTN__c FROM Asset__c
                                WHERE dpi_STATE__c =: state AND dpi_CITY__c =: city AND PORTAL_VIEW__c = 'X' AND Account__c =: AccountId
                                AND PRODUCT_DESCRIPTION_c__c != '' Order By dpi_STATE__c, dpi_CITY__c, DPI_SERVICEADDRESS__c ]){
                                    if(!streets.contains(ast.DPI_SERVICEADDRESS__c)){
                                        streets.add(ast.DPI_SERVICEADDRESS__c);
                                        assLst.add(ast);
                                    }
                                    
                                }
            
        }
        System.debug('Asset List:' + assLst);
        return assLst;
    }    
    
    // This method is used to create Remedy ticket
    @AuraEnabled
    public static void createTicket(Remedy_Ticket__c ticket){
        // ticket.C
        system.debug(ticket.Circuit_Id__c);
        Id contactId = ticket.Contact__c ;
        if(ticket.Contact__c == null){
            contactId = [SELECT Id,Name,ContactId FROM User WHERE Id =: UserInfo.getUserId()].ContactId;
        }
        ticket.Company_Name__c = [SELECT Id,AccountId FROM Contact WHERE Id =: contactId].AccountId; //currentUser.Contact.AccountId;
        ticket.Reported_By_name__c = UserInfo.getUserId();
        ticket.Status__c = 'Open';
        Database.insert(ticket);
    }
    
    // This method is used to fetch the cities from city object    
    @AuraEnabled
    public static List<City__c> getCitiesByState(String state){
        return [SELECT Id,Name,State__c FROM City__c WHERE State__r.State_Code__c =: state order by name asc ];
    }
    
    // This method is used to fetch the selected contact id, Email, Phone in the look up field
    @AuraEnabled
    public static Contact getContactById(Id contactId){
        return [SELECT Id,Name,Email,Phone FROM Contact WHERE Id =: contactId limit 1];
    }
    
    @AuraEnabled
    public static User getLoggedInUser(){
        //User u = [SELECT Id,Name,Email,Phone FROM User WHERE Id =: UserInfo.getUserId() limit 1];
        //return [SELECT Id,Name,Email,Phone FROM Contact WHERE Email =: u.Email limit 1];
        return [SELECT Id,Name,Email,Phone FROM User WHERE Id =: UserInfo.getUserId() limit 1];
    }
    
    
    
    @AuraEnabled  // search for circuit id and phone in search bar in ui 
    public static Asset__c getAssetByPhone(string phoneNumber, String circuitId){
        system.debug(phoneNumber);
        system.debug(circuitId);
        Asset__c ast = New Asset__c();
        try{
            if(phoneNumber != ''){
                ast = [select id, name,dpi_STATE__c,dpi_CITY__c,DPI_SERVICEADDRESS__c,DPI_SERVICE_TYPE__C,dpi_ZIPCODE__c,DPI_POSTALCODE__c,
                       CATEGORY__c,PRODUCT_DESCRIPTION_c__c,CircuitId__c,dpi_WTN__c FROM Asset__c where dpi_WTN__c=: phoneNumber  AND PORTAL_VIEW__c = 'X' limit 50];
            } else {
                ast =   [select id, name,dpi_STATE__c,dpi_CITY__c,DPI_SERVICEADDRESS__c,DPI_SERVICE_TYPE__C,dpi_ZIPCODE__c,DPI_POSTALCODE__c,
                         CATEGORY__c,PRODUCT_DESCRIPTION_c__c,CircuitId__c,dpi_WTN__c FROM Asset__c where  CircuitId__c=: circuitId  AND PORTAL_VIEW__c = 'X' limit 50];
            }
        }
        catch(queryException ex){
            string str = string.valueOf(ex.getMessage());
            
            // string str= ;
        }
        return ast;
    }
    // This method will pass paremeters to another class where the actual callout will be invoked to create DPI ticket 
    @AuraEnabled
    public static String createDPITicket(Remedy_Ticket__c ticket){
        HttpResponse resp = New HttpResponse();
        boolean bol = false;
        system.debug('===='+ticket);
        Dpi_Ticket_Creation__c dpi = Dpi_Ticket_Creation__c.getInstance();
        system.debug('dpi====='+dpi.Endpoint__c);
        string phoneType;
        responseWrapperClass wrap = New responseWrapperClass();
        String showMsg;
        String location = String.valueOf(ticket.Customer_Civic_Address__c)+','+String.valueOf(ticket.Service_Address_State__c);
        if(ticket.Trouble_Type__c == 'CBC' ||ticket.Trouble_Type__c == 'NSY'){
            phoneType = '2001';
        } else if (ticket.Trouble_Type__c == 'CBH'){
            phoneType = '2212';
        }
        else if (ticket.Trouble_Type__c == 'CCF'){
            phoneType = '2101';
        }
        else if (ticket.Trouble_Type__c == 'CCO'){
            phoneType = '2003';
        }
        else if (ticket.Trouble_Type__c == 'DDC'){
            phoneType = '2005';
        }
        else if (ticket.Trouble_Type__c == 'LDC'){
            phoneType = '2117';
        }
        else if (ticket.Trouble_Type__c == 'NDT'){
            phoneType = '2007';
        }
        else if (ticket.Trouble_Type__c == 'OOL'){
            phoneType = '2207';
        }
        if(Test.isRunningTest()) {
            resp = new HttpResponse();
            resp.setStatusCode(200);
            resp.setBody('{"status":{"severity":"ERROR","service":"Trouble","operation":"Get TroubleTickets","message":"Success from Provider","status":[{"severity":"ERROR","service":"TroubleManagement","operation":"RETRIEVETROUBLEREPORTREQUEST","message":"VV00101:Unable to determine the correct DPI environment based on the action: [RETRIEVETROUBLEREPORTREQUEST] , telephoneNumber: [8796543201] that was passed."}]}, "troubleTicket":    {"dpiTroubleTicketId": {"ticketNumber": "1168271"}, "appointment":{"endDateTime":"2020-20-20T00:00:00"}}}');
        } else {
            
            resp = Ftr_DpiTicketCreationService.Dpiticketservice(String.valueOf((ticket.Circuit_Id__c)), String.valueOf(ticket.Local_Contact_Name2__c), 
                                                                 String.valueOf(ticket.Description__c), String.valueOf(ticket.Trouble_Type__c), 
                                                                 String.valueOf(ticket.Local_Contact_Email2__c), String.valueOf(ticket.Local_Contact_Phone2__c),
                                                                 location, dpi.Endpoint__c, phoneType);
        }
        if(resp.getStatusCode() == 200){
            wrap = (responseWrapperClass)JSON.deserialize(resp.getBody(), responseWrapperClass.class);
            bol = true;
        } else {
            showMsg = 'unable to create ticket this time. Please try again later.';
        }
        if(bol){
            if(wrap.status.message == 'Success from Provider'){
                // ticket.Trouble_Type__c = ticket;
                string endDate =  wrap.troubleTicket.appointment.endDateTime;
                List<string> strLst = endDate.split('T');
                ticket.Customer_Ticket_Number__c = wrap.troubleTicket.dpiTroubleTicketId.ticketNumber;
                ticket.Environment__c = wrap.troubleTicket.dpiTroubleTicketId.environment;
                Id contactId = ticket.Contact__c ;
                if(ticket.Contact__c == null){
                    contactId = [SELECT Id,Name,ContactId FROM User WHERE Id =: UserInfo.getUserId()].ContactId;
                }
                ticket.Company_Name__c =[SELECT Id,AccountId FROM Contact WHERE Id =: contactId].AccountId;
                ticket.Reported_By_name__c = userInfo.getUserId();
                ticket.Comm__c = strLst[0];
                if(!test.isRunningTest())
                    insert ticket;
                showMsg = wrap.status.message;
                if (ticket.Circuit_Id__c != '' && ticket.Circuit_Id__c != null){
                    updateAssetObject(ticket.Circuit_Id__c, ticket.Customer_Ticket_Number__c, ticket.Id);
                }
                system.debug(ticket);
            } else {
                showMsg = wrap.status.status[0].message;
            }
        }
        
        
        return showMsg;
    }
    
    
    // Wrapper class for response of DPI callout service
    public class responseWrapperClass{
        public status status;
        public troubleTicket troubleTicket;
    }    
    public class troubleTicket{
        public dpiTroubleTicketId dpiTroubleTicketId;
        public appointment appointment;
    }
    public class status{
        public String message;
        public List<status> status;
    }
    
    public class dpiTroubleTicketId{
        public string ticketNumber;
        public string environment;
    }
    public class appointment{
        public string endDateTime;
    }
    
    // This method is used to fetch the asset records by using state, city & street as parameters for phone type picklist
    @AuraEnabled 
    public static wrapperClass getAssetsByStateCityAndStreet(String state, String city, string street ){
        List<Asset__c> assLstOrderByCircuitId = new List<Asset__c>();
        List<Asset__c> assLstOrderByWTN = new List<Asset__c>();
        Id contactId = [SELECT Id,Name,ContactId FROM User WHERE Id =: UserInfo.getUserId()].ContactId;
        if(!test.isRunningTest()){
            
            Id AccountId = [SELECT Id,AccountId FROM Contact WHERE Id =: contactId].AccountId; //currentUser.Contact.AccountId;
            
            assLstOrderByCircuitId =  [SELECT Id,Name,dpi_STATE__c,dpi_CITY__c,DPI_SERVICEADDRESS__c,dpi_ZIPCODE__c,
                                       DPI_POSTALCODE__c,Account__c,
                                       PRODUCT_DESCRIPTION_c__c,CircuitId__c,dpi_WTN__c FROM Asset__c 
                                       WHERE dpi_STATE__c =: state AND dpi_CITY__c =: city  AND PORTAL_VIEW__c	= 'X' AND Account__c =: AccountId
                                       AND PRODUCT_DESCRIPTION_c__c != '' AND DPI_SERVICEADDRESS__c =: street order by CircuitId__c ASC];
            assLstOrderByWTN =  [SELECT Id,Name,dpi_STATE__c,dpi_CITY__c,DPI_SERVICEADDRESS__c,dpi_ZIPCODE__c,
                                 DPI_POSTALCODE__c,Account__c,
                                 PRODUCT_DESCRIPTION_c__c,CircuitId__c,dpi_WTN__c FROM Asset__c 
                                 WHERE dpi_STATE__c =: state AND dpi_CITY__c =: city  AND PORTAL_VIEW__c	= 'X' AND Account__c =: AccountId
                                 AND PRODUCT_DESCRIPTION_c__c != '' AND DPI_SERVICEADDRESS__c =: street order by dpi_WTN__c ASC];
        }
        wrapperClass wrap = New wrapperClass(assLstOrderByCircuitId, assLstOrderByWTN); // wrote wrapper class because sorting two fields  in one query is not possible 'orderby'
        
        return wrap;
    }
    public class wrapperClass{
        @AuraEnabled public list<Asset__c> assLstOrderByCircuitId;
        @AuraEnabled public list<Asset__c> assLstOrderByWTN;
        
        public wrapperClass(list<Asset__c> assLstOrderByCircuitId, list<Asset__c> assLstOrderByWTN){
            this.assLstOrderByCircuitId = assLstOrderByCircuitId;
            this.assLstOrderByWTN = assLstOrderByWTN;
        }
    }
    //circuit method
    /*@AuraEnabled 
public static List<Asset__c> getAssetsByStateCityAndStreetforCircuit(String state, String city, string street ){
List<Asset__c> assLst = new List<Asset__c>();
if(!test.isRunningTest()){
Id contactId = [SELECT Id,Name,ContactId FROM User WHERE Id =: UserInfo.getUserId()].ContactId;
Id AccountId = [SELECT Id,AccountId FROM Contact WHERE Id =: contactId].AccountId; //currentUser.Contact.AccountId;

assLst =  [SELECT Id,Name,dpi_STATE__c,dpi_CITY__c,DPI_SERVICEADDRESS__c,dpi_ZIPCODE__c,
DPI_POSTALCODE__c,Account__c,
PRODUCT_DESCRIPTION_c__c,CircuitId__c,dpi_WTN__c FROM Asset__c 
WHERE dpi_STATE__c =: state AND dpi_CITY__c =: city  AND PORTAL_VIEW__c	= 'X' AND Account__c =: AccountId
AND PRODUCT_DESCRIPTION_c__c != '' AND DPI_SERVICEADDRESS__c =: street AND CircuitId__c != null];
}
return assLst;
} */
    
    //Hemantha - Added getAsset by Id
    //
    @AuraEnabled
    public static Asset__c getAssetById(Id assetId){
        
        System.debug('Asset Id:' + assetId);
        
        Asset__c asset = [SELECT Id,Name,dpi_STATE__c,dpi_CITY__c,DPI_SERVICEADDRESS__c,dpi_ZIPCODE__c,
                          DPI_POSTALCODE__c,Account__c,
                          PRODUCT_DESCRIPTION_c__c,CircuitId__c,dpi_WTN__c FROM Asset__c
                          WHERE Id =: assetId];
        System.debug('Asset Info:' + asset);
        return asset;
    }    
    
    @AuraEnabled
    public static List<AssetTreeItems> getStateCityAddress(){
        
        Id contactId = [SELECT Id,Name,ContactId FROM User WHERE Id =: UserInfo.getUserId()].ContactId;
        if(contactId != null) {
            Id AccountId = [SELECT Id,AccountId FROM Contact WHERE Id =: contactId].AccountId; //currentUser.Contact.AccountId;
            System.debug('Account Id:' + AccountId);             
            AggregateResult[] assetList = [SELECT dpi_STATE__c,dpi_CITY__c,DPI_SERVICEADDRESS__c 
                                           FROM Asset__c
                                           WHERE Account__c =: AccountId
                                           GROUP BY dpi_STATE__c,dpi_CITY__c,DPI_SERVICEADDRESS__c ];
            System.debug('assetList:' + assetList);
            return buildAddressTree(assetList);            
        }
        return null;
    }    
    
    @TestVisible
    private static List<AssetTreeItems> buildAddressTree(AggregateResult[] assetList){
        List<AssetTreeItems> assetTreeItems = new List<AssetTreeItems>();
        Map<String,AssetTreeItems> stateCityMap = new Map<String,AssetTreeItems>();
        Map<String,AssetTreeItems> cityAdressMap = new Map<String,AssetTreeItems>();
        
        //Build City and Address Map
        for (AggregateResult assetItem:assetList ){
            String state = (String) assetItem.get('dpi_STATE__c');
            String city =   (String) assetItem.get('dpi_CITY__c');
            String address =  (String) assetItem.get('DPI_SERVICEADDRESS__c'); 
            
            AssetTreeItems cityTreeItem = cityAdressMap.get(city);
            
            if (cityTreeItem == null){
                cityTreeItem = new AssetTreeItems();                
                cityTreeItem.label = city;
                cityTreeItem.name = city;
                cityTreeItem.expanded = false;
                cityTreeItem.state = state;
                cityTreeItem.city = city;
                cityAdressMap.put(city,cityTreeItem);
            }  
            
            if(true){
                AssetTreeItems addressTreeItem = new AssetTreeItems();
                addressTreeItem.label = address;
                addressTreeItem.name = (state + ':' + city + ':' + address);
                addressTreeItem.expanded = false;
                addressTreeItem.state = state;
                addressTreeItem.city = city;
                addressTreeItem.street = address;
                List<AssetTreeItems> addressList = cityTreeItem.items;
                if (addressList == null){
                    addressList = new List<AssetTreeItems>();
                    cityTreeItem.items = addressList;
                }
                addressList.add(addressTreeItem);
                
            }
        }
        
        //Build State and City Map
        List<String> cityList = new List<String>();
        for (AggregateResult assetItem:assetList ){
            String state = (String) assetItem.get('dpi_STATE__c');
            String city =   (String) assetItem.get('dpi_CITY__c');
            String address =  (String) assetItem.get('DPI_SERVICEADDRESS__c'); 
            
            AssetTreeItems stateTreeItem = stateCityMap.get(state);
            if (stateTreeItem == null){
                stateTreeItem = new AssetTreeItems();                
                stateTreeItem.label = state;
                stateTreeItem.name = state;
                stateTreeItem.expanded = false;
                stateTreeItem.state = state;
                stateCityMap.put(state,stateTreeItem);
            }    
            AssetTreeItems  cityAddressTreeItem = cityAdressMap.get(city);
            if (!cityList.contains(city)){
                cityList.add(city);
                List<AssetTreeItems> cityTreeItemList = stateTreeItem.items;
                if (cityTreeItemList == null){
                    cityTreeItemList = new List<AssetTreeItems>(); 
                    stateTreeItem.items = cityTreeItemList;                
                }
                cityTreeItemList.add(cityAddressTreeItem);
            }
        }
        return stateCityMap.values();
    }
    
    public static void updateAssetObject(string circuitId, string ticketNumber, Id ticketId){
        List<Asset__c> assets = [SELECT Id,Name,dpi_STATE__c,dpi_CITY__c,DPI_SERVICEADDRESS__c,dpi_ZIPCODE__c,
                                 DPI_POSTALCODE__c,Account__c,
                                 PRODUCT_DESCRIPTION_c__c,CircuitId__c,dpi_WTN__c FROM Asset__c
                                 WHERE dpi_WTN__c =: circuitId];
        for(Asset__c asset : assets){
            asset.Ticket_Number_Ref__c = ticketNumber;     
            asset.Ticket_Id__c = ticketId;
        }
        update assets;
    }
    
    @AuraEnabled
    public static Map<String,Asset__c> getAllAssets(){
        
        Id contactId = [SELECT Id,Name,ContactId FROM User WHERE Id =: UserInfo.getUserId()].ContactId;
        if(contactId != null) {
            Id AccountId = [SELECT Id,AccountId FROM Contact WHERE Id =: contactId].AccountId; //currentUser.Contact.AccountId;
            
            List<Asset__c> assetList = [SELECT Id,Name,dpi_STATE__c,dpi_CITY__c,DPI_SERVICEADDRESS__c,dpi_ZIPCODE__c,
                                        DPI_POSTALCODE__c,Account__c,
                                        PRODUCT_DESCRIPTION_c__c,CircuitId__c,dpi_WTN__c FROM Asset__c
                                        WHERE Account__c =: AccountId];
            Map<String,Asset__c> assetMap = new Map<String,Asset__c>();
            for(Asset__c a1: assetList){
                assetMap.put(a1.Id,a1);
            }
            
            return assetMap;                          
        }
        return null;
    }   
    
}