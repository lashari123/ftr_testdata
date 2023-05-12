public class Dynamicpicklist {
    
   // public List<productCompanyInfo>    lstAddressInfoproduct  {get;set;}
    public List<productCompanyInfo> addressinfo {get;set;}
    public String accountId {get;set;}
    public String defaultAddress {get;set;}
    public List<SelectOption> dynamicOptions {get;set;}
    public String uiFlag {get;set;}
    public List<hierarchy__c> lstH {get;set;}
    public List<Customer_Account__c> lstCustomerAccount {get;set;}
    public boolean displayAddressGrid {get;set;}
  
    public Dynamicpicklist() {
    	
        String strAddress='';
        displayAddressGrid = false;
        dynamicOptions = new List<SelectOption>();
        dynamicOptions.add(new SelectOption('None','None'));
        defaultAddress = 'None';
        //Know the invocation button source i.e Opportunity or OneView or Company
        uiFlag = ApexPages.currentPage().getParameters().get('uiFlag');
        System.Debug('uiFlag ---'+uiFlag );
        
        addressinfo = new List<productcompanyinfo>();
        
               
        if( uiFlag == 'ONEVIEW' ){
        	 
            String strServiceAdd='';
            System.Debug('uiFlag ---'+uiFlag );
            addressinfo = new List<productcompanyinfo>();
            String btnPhone = ApexPages.currentPage().getParameters().get('btnPhone');
            String wtn = ApexPages.currentPage().getParameters().get('wtnnumber');
            
            system.debug('currentpage'+ApexPages.currentPage());
            System.Debug('BTN PHONE -- '+btnPhone);
            
            //get Account Id using Hierarchy Table
            if(wtn!=btnPhone && wtn!='' && wtn!=null)
              btnPhone=wtn;
           
            lstH = [SELECT Account_id__c,Library_Id__c,Service_Control_Number__c FROM hierarchy__c where WTN__c=:btnPhone];
            if( lstH!= null && lstH.size() > 0 && lstH[0] != null ){
                lstCustomerAccount = [SELECT Address_Line_1__c,Address_Line_2__c,Address_Line_3__c,City__c,State_Abbreviation__c,Nine_D_Zip_Code__c FROM Customer_Account__c WHERE Account_Id__c=:lstH[0].Account_Id__c LIMIT 1];
            }
            
            System.Debug('Hierarchy--'+lstH);
            System.Debug('Customer Account--'+lstCustomerAccount);
            if( lstCustomerAccount != null && lstCustomerAccount.size()>0 ){
                strAddress = lstCustomerAccount[0].Address_Line_1__c + ',' + lstCustomerAccount[0].Address_Line_2__c + ',' + lstCustomerAccount[0].Address_Line_3__c +
                                ',' + lstCustomerAccount[0].City__c + ',' + lstCustomerAccount[0].State_Abbreviation__c + ',' + lstCustomerAccount[0].Nine_D_Zip_Code__c;
                                
                if( lstCustomerAccount[0].Address_Line_1__c != null || lstCustomerAccount[0].Address_Line_2__c != null ){
                        system.debug('sreekanth'+lstCustomerAccount[0].Address_Line_1__c);
                    dynamicOptions.add(new SelectOption('Bill To Address','Bill To Address'));
                }
                        
            }
            
            strAddress = strAddress.replace(',  ,',',');
            strAddress = strAddress.replace('null','');
            strAddress= strAddress.replace(',null,',',');
            strAddress= strAddress.replace(',null','');
            strAddress= strAddress.replace('null','');
            
            productCompanyInfo objAddInfo1 = new productCompanyInfo();
            objAddInfo1.strColumnOne='Bill To Address';
            objAddInfo1.strColumnTwo=strAddress;
            if( strAddress != '' && strAddress != null ){
                addressinfo.add(objAddInfo1);
            }
                        
            if( lstH != null && lstH.size()>0 ){
                List<Physical_Address__c> lstPhyAdd = [SELECT Building_Name__c,City_Abbreviation__c,State_Abbre__c,Street_Direction__c,Street_Name__c,Street_Number__c,Street_Subtitle__c,Zipcode__c FROM Physical_Address__c WHERE Library_id__c =:lstH[0].Library_Id__c AND Ser_Cntl_No__c =:lstH[0].Service_Control_Number__c];
                System.Debug('Physical Address --'+lstPhyAdd);
                if( lstPhyAdd != null && lstPhyAdd.size()>0) {
                    strServiceAdd= lstPhyAdd[0].Street_Number__c + ',' + lstPhyAdd[0].Street_Name__c + ',' + lstPhyAdd[0].Street_Direction__c + ',' 
                                    + lstPhyAdd[0].Street_Subtitle__c + ',' + lstPhyAdd[0].Building_Name__c + ',' + lstPhyAdd[0].City_Abbreviation__c
                                    + ',' + lstPhyAdd[0].State_Abbre__c + ',' + lstPhyAdd[0].Zipcode__c;
                                    
                    System.debug('strServiceAdd 1  ' + strServiceAdd);
                    strServiceAdd= strServiceAdd.replace(',null,',',');
                    strServiceAdd= strServiceAdd.replace(',null','');
                    strServiceAdd= strServiceAdd.replace('null','');
                    System.debug('strServiceAdd 2  ' + strServiceAdd);
                    if( lstPhyAdd[0].Street_Number__c != null || lstPhyAdd[0].Street_Name__c != null ){
                            system.debug('sayana'+lstPhyAdd[0].Street_Number__c);
                        dynamicOptions.add(new SelectOption('Service Address','Service Address'));
                    }

                }
                                                        
            }
            
                       
            productCompanyInfo objAddInfo2 = new productCompanyInfo();
            objAddInfo2.strColumnOne='Service Address';
            objAddInfo2.strColumnTwo=strServiceAdd;
            if( strServiceAdd != '' && strServiceAdd != null ){
                addressinfo.add(objAddInfo2);
            }
        } else if( uiFlag == 'OPPORTUNITY' || uiFlag == 'COMPANY' ){
            accountId = ApexPages.currentPage().getParameters().get('accountId');
            System.Debug('ACCOUNTID--'+ accountId);
            Account accRec = [SELECT BillingStreet,BillingCity,BillingState,BillingCountry,BillingPostalCode,Legal_Street__c,Legal_City__c,Legal_State__c,Legal_Zip__c,Legal_Country1__c,ShippingStreet,ShippingCity,ShippingState,ShippingCountry,ShippingPostalCode FROM ACCOUNT WHERE id =: accountId];
        
            if( accRec != null ){
                if( accRec.Legal_Street__c != null && accRec.Legal_City__c != null && accRec.Legal_State__c != null ){
                    dynamicOptions.add(new SelectOption('Legal Address','Legal Address'));
                    strAddress = accRec.Legal_Street__c + ',' + accRec.Legal_City__c + ',' + accRec.Legal_State__c + ',' 
                                    + accRec.Legal_Country1__c + ',' + accRec.Legal_Zip__c;
                    strAddress = strAddress.replace(',  ,',',');
                    strAddress = strAddress.replace('null','');
                    strAddress= strAddress.replace(',null,',',');
                    strAddress= strAddress.replace(',null','');
                    strAddress= strAddress.replace('null','');
                    productCompanyInfo objAddInfo1 = new productCompanyInfo();
                    objAddInfo1.strColumnOne='Legal Address';
                    objAddInfo1.strColumnTwo=strAddress;
                    System.Debug('Legal Street --'+strAddress);
                    if( strAddress != '' && strAddress != null ){
                        addressinfo.add(objAddInfo1);
                    }
                }
                if( accRec.BillingStreet != null && accRec.BillingCity != null && accRec.BillingState != null ){
                    dynamicOptions.add(new SelectOption('Billing Address','Billing Address'));
                    strAddress = accRec.BillingStreet + ',' + accRec.BillingCity + ',' + accRec.BillingState + ',' 
                                    + accRec.BillingCountry + ',' + accRec.BillingPostalCode;
                    strAddress = strAddress.replace(',  ,',',');
                    strAddress = strAddress.replace('null','');
                    strAddress= strAddress.replace(',null,',',');
                    strAddress= strAddress.replace(',null','');
                    strAddress= strAddress.replace('null','');
                    productCompanyInfo objAddInfo2 = new productCompanyInfo();
                    objAddInfo2.strColumnOne='Billing Address';
                    objAddInfo2.strColumnTwo=strAddress;
                    if( strAddress != '' && strAddress != null ){
                        addressinfo.add(objAddInfo2);
                    }
                }
                if( accRec.ShippingStreet != null && accRec.ShippingCity != null && accRec.ShippingState != null ){
                    dynamicOptions.add(new SelectOption('Service Address','Service Address'));
                    strAddress = accRec.ShippingStreet + ',' + accRec.ShippingCity + ',' + accRec.ShippingState + ',' 
                                    + accRec.ShippingCountry + ',' + accRec.ShippingPostalCode;
                    strAddress = strAddress.replace(',  ,',',');
                    strAddress = strAddress.replace('null','');
                    strAddress= strAddress.replace(',null,',',');
                    strAddress= strAddress.replace(',null','');
                    strAddress= strAddress.replace('null','');
                    productCompanyInfo objAddInfo3 = new productCompanyInfo();
                    objAddInfo3.strColumnOne='Service Address';
                    objAddInfo3.strColumnTwo=strAddress;
                    if( strAddress != '' && strAddress != null ){
                        addressinfo.add(objAddInfo3);
                    }
                }
            }
        }
        if( addressinfo.size() >= 1 ){
            displayAddressGrid = true;
        }
        
    }
    public class productCompanyInfo{
        public String strColumnOne    {get;set;}
        public String strColumnTwo  {get;set;}
    }
    /*public Dynamicpicklist() {
        String[] addresstypes = new String[]{'None','Bill to Address','Service Address' };
        this.dropdownoptions = new SelectOption[]{};
        
        for (String c: addresstypes) {
            this.dropdownoptions.add(new SelectOption(c,c));
        }
    }
    public SelectOption[] dropdownoptions { //this is where we're going to pull the list
        public get;
        private set;
    }*/
    public PageReference reDirectToSterling(){
        String catalogURL = '';
        String btnPhone = ApexPages.currentPage().getParameters().get('btnPhone');
        String wtn = ApexPages.currentPage().getParameters().get('wtnnumber');
       	
       /* List<hierarchy__c> wtnlist = [SELECT Level__c,Service_Control_Number__c,WTN__c FROM hierarchy__c WHERE WTN__c =:btnPhone AND Level__c= 'MEMBER'];
        if(wtnlist.size()>0){
        	btnPhone=wtnlist[0].WTN__c;
        	system.debug('BTNTELEPHONE'+wtnlist);
        }*/
        if( uiFlag == 'ONEVIEW' ){
            //FOR ONE VIEW SCREEN REDIRECTS
            catalogURL ='https://c.cs14.visual.force.com/apex/ProductCatalog?sfdc.tabName=01rE0000000cFfQ&uiFlag='+uiFlag+'&addressType='+defaultAddress+'&btnPhone='+btnPhone+'&wtn='+wtn;
        }else{
            //FOR COMPANY AND OPPORTUNITY RECORDS
            catalogURL ='https://c.cs14.visual.force.com/apex/ProductCatalog?sfdc.tabName=01rE0000000cFfQ&uiFlag='+uiFlag+'&addressType='+defaultAddress+'&accountId='+accountId;
        }
        
        PageReference ref = new PageReference(catalogURL);  
        System.Debug('URL REDIRECT'+catalogURL);
        ref.setRedirect(true);
        return ref;
    }
     
}