public class SterpageExt {
    public SterlingQuoteItem__c SterlingQuoteItem {get;set;}
        public List<ProcessInstanceWorkitem> lstProIns    {get;set;}
        // added by Maxg 5/2/2014 to support start INA process button 
        public List<Zaddress__c> Zaddress {get;set;}
    public Apexpages.Standardcontroller controller {get;set;}
      public String strPopMsg    {get;set;}
   
    public String statusColour {get; set;} 
    public String lastname {get {return lastname;}         
        set;
    } 


    
    public String firstname {get {return firstname;}         
        set;
    } 
  
    public String userselected {get {return userselected;} 
        set ;
    }
    
    private SterlingQuoteItem__c ICB;
    public boolean isDiscountTypeEmpty {get;set;}
    public boolean isICB {get;set;}
    public boolean isRecalled {get;set;}
    public boolean isEmptyStatus {get;set;}
    public boolean isApproved {get;set;}
    public boolean isNotPendingQuote {get;set;}
  
  
  
 
        public String strOverride {get;set;} //VJ
  
        public PageReference SaveOver() {
              upsert objSQi;
              strOverride = objSQi.Id;
              system.debug('*****objsqi '+strOverride );
  
        return new Pagereference('/apex/QuoteLineItem?id='+strOverride);

    }

    public SterlingQuote__c sterlingQuote       {get;set;}
    public SterlingQuoteItem__c objSQi    {get;set;}
    public SterpageExt(ApexPages.StandardController controller) {
      //  objSQi = [SELECT AddressDescription__c,Jeopardy__c, Quote_Name__c, SterlingQuote__r.Name, SalesEngineer__c,Service_Area__c, Postal_Area__c, Postal_Address__c, Service_Address__c, PA_AddressLine1__c,PA_AddressLine2__c, SIFT_Required__c, PriorStatus__c, SIFT_InquiryId__c,  cpe_gross_margin__c,CircuitPriceQuoteId__c,CPE_NRC_Price__c, Schedule__c,  State__c , OverallStatus__c, Final_Approval_Date__c,    ApprovalRegion__c,ApprovalRouting__c , Zipcode__c,AdjustedMRC__c,AdjustedNRC__c,SA_BuildingName__c,BuildingNumber__c,CreatedById,CreatedDate,Description__c,DiscountAmount__c,DiscountType__c,GrandFatheredItem__c,ApprovalPriority__c,SterlingQuote__c,ApprovalTerritory__c,Id,IsContracted__c,IsDeleted,IsNewConstruction__c,IsPromoProduct__c,promoExpdate__c,IsTerm__c,IsZAddressRequired__c,IsInFrontierFootprint__c,ItemCode__c,LastModifiedById,LastModifiedDate,Locality__c,MetroEQualificationType__c,Name,NetworkDistance__c,NPA__c,NumInstallments__c,NXX__c,PercentageDiscountAmount__c,Postcode__c,Products__c,ProductInterval__c,Quantity__c,RequestedDueDateNew__c,Requested_Due_Date1__c, ServiceControlNumber__c,ServiceSequenceNumber__c,ST_SKU__C,StandardMRC__c,StandardNRC__c,StateProvince__c,Status_Date__c,Status__c,SA_StreetDirection__c,SA_StreetName__c,SA_StreetNrFirst__c,SA_StreetSubDescription__c,SA_StreetSuffix__c,SA_Subdivision__c,SystemModstamp,TermLength__c,TotalPrice__c,UnitPrice__c,SA_unitDesignator__c,SA_UnitNumber__c,SA_WireCenter__c,ICB_Comments__c FROM SterlingQuoteItem__c where id=:apexpages.currentpage().getparameters().get('id') ];  10/16 Raj
        objSQi = [SELECT SIFT_Number__c, ICB_Request__c,DSAT_AddressID__c,AddressDescription__c,Jeopardy__c, SterlingQuote__r.Name, SalesEngineer__c,Service_Area__c, Postal_Area__c, Postal_Address__c, Service_Address__c, PA_AddressLine1__c,PA_AddressLine2__c, SIFT_Required__c, PriorStatus__c, SIFT_InquiryId__c,CircuitPriceQuoteId__c,CPE_NRC_Price__c, Schedule__c, OverallStatus__c, Final_Approval_Date__c,    ApprovalRegion__c,ApprovalRouting__c , Zipcode__c,AdjustedMRC__c,AdjustedNRC__c,FloorPrice__c,SA_BuildingName__c, Renewal_MRR_Original__c,BuildingNumber__c,CreatedById,CreatedDate,Description__c,DiscountAmount__c,DiscountType__c,GrandFatheredItem__c,ApprovalPriority__c,SterlingQuote__c,ApprovalTerritory__c,Id,IsContracted__c,IsDeleted,IsNewConstruction__c,IsPromoProduct__c,promoExpdate__c,IsInFrontierFootprint__c,ItemCode__c,LastModifiedById,LastModifiedDate,Locality__c,MetroEQualificationType__c,Name,NPA__c,NumInstallments__c,NXX__c,PercentageDiscountAmount__c,Postcode__c,Products__c,ProductInterval__c,Quantity__c,RequestedDueDateNew__c,Requested_Due_Date1__c, ServiceControlNumber__c,ServiceSequenceNumber__c,ST_SKU__C,StandardMRC__c,StandardNRC__c,StateProvince__c,Status_Date__c,Status__c,SA_StreetDirection__c,SA_StreetName__c,SA_StreetNrFirst__c,SA_StreetSubDescription__c,SA_StreetSuffix__c,SA_Subdivision__c,SystemModstamp,TermLength__c,TotalPrice__c,SA_unitDesignator__c,SA_UnitNumber__c,SA_WireCenter__c,ICB_Comments__c,CPE_Gross_Margin__c,CurrentStatus__c, Link_to_Opportunity__c FROM SterlingQuoteItem__c where id=:apexpages.currentpage().getparameters().get('id') ];
        
        //objSQi = [SELECT AddressDescription__c,AdjustedMRC__c,AdjustedNRC__c,ApprovalPriority__c,ApprovalRegion__c,ApprovalRouting__c,ApprovalTerritory__c,BuildingNumber__c,CircuitPriceQuoteId__c,ConnectionReceivedId,ConnectionSentId,CPE_Gross_Margin__c,CPE_NRC_Price__c,CPQLineNumber__c,CreatedById,CreatedDate,CurrentStatus__c,Description__c,DiscountAmount__c,DiscountType__c,Final_Approval_Date__c,FloorPrice__c,GrandFatheredItem__c,ICB_Comments__c,Id,IsAddressQualified__c,IsContracted__c,IsDeleted,IsInFrontierFootprint__c,IsNewConstruction__c,IsPromoProduct__c,ItemCode__c,ItemOwner__c,Jeopardy__c,LastModifiedById,LastModifiedDate,Locality__c,MajorLine__c,Major_Product__c,MetroEQualificationType__c,MinorLine__c,Name,NPA__c,NumInstallments__c,NXX__c,OpportunityLineItemId__c,OverallStatus__c,OwnerId,PA_AddressLine1__c,PA_AddressLine2__c,PA_AddressLine3__c,PercentageDiscountAmount__c,Postal_Address__c,Postal_Area__c,Postcode__c,PriorStatus__c,ProductInterval__c,Products__c,promoDiscountAmount__c,promoExpDate__c,Quantity__c,Quote_Name__c,RecordTypeId,Renewal_MRR_Original__c,RequestedDueDateNew__c,Requested_Due_Date1__c,SalesEngineer__c,SA_BuildingName__c,SA_StreetDirection__c,SA_StreetName__c,SA_StreetNrFirst__c,SA_StreetPostDirection__c,SA_StreetSubDescription__c,SA_StreetSuffix__c,SA_SubDivision__c,SA_unitDesignator__c,SA_UnitNumber__c,SA_WireCenter__c,Schedule__c,ServiceControlNumber__c,ServiceSequenceNumber__c,Service_Address__c,Service_Area__c,SetNextApprover__c,SIFT_InquiryId__c,SIFT_Required__c,StandardMRC__c,StandardNRC__c,StateProvince__c,Status_Date__c,Status__c,SterlingQuote__c,ST_AddressID__c,ST_LineKey__c,ST_ParentLineKey__c,ST_SKU__c,SystemModstamp,TermLength__c,TotalPrice__c,Total_Price__c,Zipcode__c FROM SterlingQuoteItem__c  where id=:apexpages.currentpage().getparameters().get('id') ];
        
        sterlingQuote = [Select id, RecordTypeid, RecordType.Name,IsSyncing__c,QuoteType__c,OpportunityId__c from SterlingQuote__c where id=:objSQi.SterlingQuote__c]; //VJ
        //SterlingQuoteItem = new SterlingQuoteItem__c();
        //SterlingQuoteItem = objSQi;
                //     SterlingQuoteItem = [SELECT AddressDescription__c,Line_Items__c,Jeopardy__c,URL__c,locality__c, State__c , Country__c, Zipcode__c,CPE_NRC_Price__c,Renewal_MRR_Original__c,CPE_Gross_Margin__c , AddressText__c,AddressType__c,AdjustedMRC__c,AdjustedNRC__c,BuildingName__c,BuildingNumber__c,BuildingSubNumber__c,CreatedById,CreatedBy__c,CreatedDate,Description__c,DiscountAmount__c,DiscountType__c,GrandFatheredItem__c,ICBApprovalRouting__c,ICBOriginatorPhone__c,ICBOriginator__c,ApprovalPriority__c,ICBProductLine__c,ICBProjectName__c,ICBSalesManager__c,ICBSalesRepresentative__c,ICBRegion__c,SterlingQuote__c,ICBCustomerName__c,ApprovalTerritory__c,Id,IsAddressQualified__c,IsContracted__c,IsDeleted,IsNewConstruction__c,IsPromoProduct__c,IsTerm__c,IsZAddressRequired__c,ItemCode__c,LastModifiedById,LastModifiedBy__c,LastModifiedDate,LineNumber__c,ListPrice__c,Locality__c,MetroEQualificationType__c,Name,NetworkDistance__c,NPA__c,NumInstallments__c,NXX__c,PercentageDiscountAmount__c,Postcode__c,Product2__c,ProductCode__c,ProductInterval__c,PromoDiscountAmount__c,PromoExpirationDate__c,PromoName__c,PromotionId__c,PSKU__c,Quantity__c,RequestedDueDateNew__c,ServiceControlNumber__c,ServiceDate__c,ServiceSequenceNumber__c,SKU__c,StandardMRC__c,StandardNRC__c,StateProvince__c,Status_Date__c,Status__c,StreetDirection__c,StreetName__c,SA_StreetNrFirst__c,StreetSubDescription__c,SA_StreetSuffix__c,Subdivision__c,Subtotal__c,SystemModstamp,TermEndDateMismatch__c,TermEndDate__c,TermLength__c,TotalPrice__c,UnitPrice__c,SA_unitDesignator__c,SA_UnitNumber__c,SA_WireCenter__c FROM SterlingQuoteItem__c where id=:apexpages.currentpage().getparameters().get('id') ];
        lstProIns = new List<ProcessInstanceWorkitem>();
        lstProIns.addAll([SELECT Id FROM ProcessInstanceWorkitem WHERE ProcessInstance.TargetObjectId = :objSQi.id AND ProcessInstance.Status = 'Pending']);
        isDiscountTypeEmpty = false;
        isICB = false;
        if(objSQi.DiscountType__c != null && objSQi.DiscountType__c.length() > 0 && objSQi.DiscountType__c != 'None') {
           if(objSQi.DiscountType__c == 'ICB') {
            isICB = true;
           } 
        }else{
           isDiscountTypeEmpty = true;   
          }

        if(objSQi.OverallStatus__c == 'Approved') {
          isApproved = true;
          statusColour = 'green';
        }
        else if(objSQi.OverallStatus__c == 'Recalled') {
          isRecalled = true;
          statusColour = 'red';
        }
        else if(objSQi.OverallStatus__c == 'Pending') {          
          statusColour = 'blue';
        }
        
        if(objSQi.OverallStatus__c == '' || objSQi.OverallStatus__c == null){
          isEmptyStatus = true;
        }
               System.Debug('*****lstProIns *****'+lstProIns);
  // added by Maxg 5/2/2014 to support start INA process button
         Zaddress = new List<Zaddress__c>();
        system.debug('Zaddress = ' + Zaddress); 
        Zaddress = [SELECT Id FROM Zaddress__c WHERE SterlingQuoteItem__c =:objSQi.id AND Circuit_Price_Quoteid__c =: null and IsInFrontierFootprint__c =false];
        system.debug('SQi Id = ' + objSQi.id);
        system.debug('Zaddress = ' + Zaddress);
        
        if(objSQi.StateProvince__c=='AL') objSQi.ApprovalTerritory__c='Alabama';
        if(objSQi.StateProvince__c=='CA') objSQi.ApprovalTerritory__c='California';
        if(objSQi.StateProvince__c=='AK') objSQi.ApprovalTerritory__c='Alaska';
     if(objSQi.StateProvince__c=='AZ')    objSQi.ApprovalTerritory__c='Arizona';
     if(objSQi.StateProvince__c=='AR')    objSQi.ApprovalTerritory__c='Arkansas';
     if(objSQi.StateProvince__c=='CO')    objSQi.ApprovalTerritory__c='Colorado';
     if(objSQi.StateProvince__c=='CT')    objSQi.ApprovalTerritory__c='Connecticut';
     if(objSQi.StateProvince__c=='DE')    objSQi.ApprovalTerritory__c='Delaware';
     if(objSQi.StateProvince__c=='FL')    objSQi.ApprovalTerritory__c='Florida';
     if(objSQi.StateProvince__c=='GA')    objSQi.ApprovalTerritory__c='Georgia';
     if(objSQi.StateProvince__c=='HI')    objSQi.ApprovalTerritory__c='Hawaii';
     if(objSQi.StateProvince__c=='ID')    objSQi.ApprovalTerritory__c='Idaho';
     if(objSQi.StateProvince__c=='IL')    objSQi.ApprovalTerritory__c='Illinois';
     if(objSQi.StateProvince__c=='IN')    objSQi.ApprovalTerritory__c='Indiana';
     if(objSQi.StateProvince__c=='IA')    objSQi.ApprovalTerritory__c='Iowa';
     if(objSQi.StateProvince__c=='KS')    objSQi.ApprovalTerritory__c='Kansas';
     if(objSQi.StateProvince__c=='KY')    objSQi.ApprovalTerritory__c='Kentucky';
     if(objSQi.StateProvince__c=='LA')    objSQi.ApprovalTerritory__c='Louisiana';
     if(objSQi.StateProvince__c=='ME')    objSQi.ApprovalTerritory__c='Maine';
     if(objSQi.StateProvince__c=='MD')    objSQi.ApprovalTerritory__c='Maryland';
     if(objSQi.StateProvince__c=='MA')    objSQi.ApprovalTerritory__c='Massachusetts';
     if(objSQi.StateProvince__c=='MI')    objSQi.ApprovalTerritory__c='Michigan';
     if(objSQi.StateProvince__c=='MN')    objSQi.ApprovalTerritory__c='Minnesota';
    if(objSQi.StateProvince__c=='MS')     objSQi.ApprovalTerritory__c='Mississippi';
    if(objSQi.StateProvince__c=='MO')     objSQi.ApprovalTerritory__c='Missouri';
    if(objSQi.StateProvince__c=='MT')     objSQi.ApprovalTerritory__c='Montana'; 
     if(objSQi.StateProvince__c=='NE')    objSQi.ApprovalTerritory__c='Nebraska'; 
       if(objSQi.StateProvince__c=='NV')  objSQi.ApprovalTerritory__c='Nevada'; 
          if(objSQi.StateProvince__c=='NH')               objSQi.ApprovalTerritory__c='New Hampshire';
       if(objSQi.StateProvince__c=='NJ')              objSQi.ApprovalTerritory__c='New Jersey';
        if(objSQi.StateProvince__c=='NM')               objSQi.ApprovalTerritory__c='New Mexico';    
        if(objSQi.StateProvince__c=='NY')               objSQi.ApprovalTerritory__c='New York';  
           if(objSQi.StateProvince__c=='NC')               objSQi.ApprovalTerritory__c='North Carolina';     
       if(objSQi.StateProvince__c=='ND')               objSQi.ApprovalTerritory__c='North Dakota';   
               if(objSQi.StateProvince__c=='OH')               objSQi.ApprovalTerritory__c='Ohio';
               if(objSQi.StateProvince__c=='OK')               objSQi.ApprovalTerritory__c='Oklahoma'; 
               if(objSQi.StateProvince__c=='OR')               objSQi.ApprovalTerritory__c='Oregon'; 
               if(objSQi.StateProvince__c=='PA')               objSQi.ApprovalTerritory__c='Pennsylvania'; 
               if(objSQi.StateProvince__c=='RI')               objSQi.ApprovalTerritory__c='Rhode Island'; 
               if(objSQi.StateProvince__c=='SC')               objSQi.ApprovalTerritory__c='South Carolina';              
               if(objSQi.StateProvince__c=='SD')               objSQi.ApprovalTerritory__c='South Dakota';
               if(objSQi.StateProvince__c=='TN')               objSQi.ApprovalTerritory__c='Tennessee';
            if(objSQi.StateProvince__c=='TX')               objSQi.ApprovalTerritory__c='Texas';
               if(objSQi.StateProvince__c=='UT')               objSQi.ApprovalTerritory__c='Utah';   
                  if(objSQi.StateProvince__c=='VT')               objSQi.ApprovalTerritory__c='Vermont';  
               if(objSQi.StateProvince__c=='VA')               objSQi.ApprovalTerritory__c='Virginia'; 
            
               if(objSQi.StateProvince__c=='WA')               objSQi.ApprovalTerritory__c='Washington';  
               if(objSQi.StateProvince__c=='WV')               objSQi.ApprovalTerritory__c='West Virginia';  
               if(objSQi.StateProvince__c=='WI')               objSQi.ApprovalTerritory__c='Wisconsin'; 
                  if(objSQi.StateProvince__c=='WY')               objSQi.ApprovalTerritory__c='Wyoming'; 
                 


   
     }
       void getuserinfo(string ICB) {
           list<user> lookupuser=new list<user>();
           lookupuser=[select lastname,firstname from user where id=:ICB] ;
             
           if (lookupuser.size()>0) {
                lastname=lookupuser[0].lastname;   
                firstname=lookupuser[0].firstname;                         
           }
    }
    
              
     public PageReference SaveOverrideButton()     {       
                
        try {
                update  this.objSQi; 
                System.debug('Important '+this.objSQi);   
        }
        catch (Exception e) {
                system.debug ('bbbbbbbbb' + e );        
        } 
        Approval.ProcessSubmitRequest req1 = new Approval.ProcessSubmitRequest();  
        req1.setComments('Submitted for Approval');
        req1.setObjectId(this.objSQi.id);
        Approval.ProcessResult result = Approval.process(req1); 
        PageReference pageRef = new PageReference('/apex/QuoteLineItem');
        pageRef.getParameters().put('id',apexpages.currentpage().getparameters().get('id'));
        pageRef.setRedirect(true);
        return pageRef;
    } 
    
    
  /*  public PageReference SaveOverrideButton()     {       
        try {
                update  ICB;    
        }
        catch (Exception e) {
                system.debug ('bbbbbbbbb' + e );        
        } 
        Approval.ProcessSubmitRequest req1 = new Approval.ProcessSubmitRequest();  
        req1.setComments('Submitted for Approval');
        req1.setObjectId(apexpages.currentpage().getparameters().get('id'));
        Approval.ProcessResult result = Approval.process(req1); 
        PageReference pageRef = new PageReference('/apex/sterlingpageoverride');
        pageRef.getParameters().put('id',apexpages.currentpage().getparameters().get('id'));
        pageRef.setRedirect(true);
        return pageRef;
   
    } 
    */
    
    public PageReference Edit() {
      //  strOverride=null;
        
        //https://cs8.salesforce.com/a1fL00000003MCt/e?retURL=https%3A%2F%2Fc.cs8.visual.force.com%2Fapex%2FQuoteLineItem%3Fid%3Da1fL00000003MCt%26sfdc.override%3D1%26core.apexpages.devmode.url%3D1
        PageReference ref = null;
        SterlingQuoteItem__c sterlingQuoteItemTemp = [SELECT Name, Id, SterlingQuote__c,ApprovalRegion__c,ApprovalRouting__c , SterlingQuote__r.OpportunityId__r.accountid, SterlingQuote__r.OpportunityId__c, SterlingQuote__r.OpportunityId__r.Name, SterlingQuote__r.CPQQuoteId__c, SterlingQuote__r.Id, SterlingQuote__r.RecordType.Name FROM SterlingQuoteItem__c WHERE id =: Apexpages.currentpage().getparameters().get('id')];
        //SterlingQuote__c sterlingQuoteTemp = [SELECT Id, Name, OpportunityId__c, RecordType.Name FROM SterlingQuote__c WHERE id =: sterlingQuoteItemTemp.StelingQuoteItem__c];
        if(sterlingQuote.recordtype.name == 'SFA'){
              ref= new PageReference('/'+sterlingQuoteItemTemp.id+'/e?retURL=https%3A%2F%2F'+System.URL.getSalesforceBaseURL().getHost()+'%2Fapex%2FQuoteLineItem%3Fid%3D'+sterlingQuoteItemTemp.id+'%26sfdc.override%3D1%26core.apexpages.devmode.url%3D1');
           //     ref = new PageReference ('/'+strOverride +'/e?retURL='{$currentPage.Url}  );   
        } else  if(sterlingQuote.recordtype.name == 'Sterling'){
            //  ref= new PageReference('/apex/NewQuote_SterlingCPQ?uiFlag=OPPORTUNITY&accountId=' + sterlingQuoteItemTemp.SterlingQuote__r.OpportunityId__r.accountid+'&opportunityId='+sterlingQuoteItemTemp.SterlingQuote__r.OpportunityId__c+'&CPQ_QuoteId=' + sterlingQuoteItemTemp.SterlingQuote__r.CPQQuoteId__c+ '&Salesforce_Unique_ID='+sterlingQuoteItemTemp.SterlingQuote__r.Id + '&Record_Type='+sterlingQuoteItemTemp.SterlingQuote__r.RecordType.Name+'&Opportunity_Name='+sterlingQuoteItemTemp.SterlingQuote__r.OpportunityId__r.Name+'&edit=true&quote_item_id=' +sterlingQuoteItemTemp.Id);
            user finance_user = [select FinanceUser__c from user where Id = :Userinfo.getuserid()];
            if(finance_user.financeuser__c){
                ref= new PageReference('/apex/SterlingQuote?AccountId='+sterlingQuoteItemTemp.SterlingQuote__r.OpportunityId__r.accountid+'&OpportunityId='+sterlingQuoteItemTemp.SterlingQuote__r.OpportunityId__c+'&OptionType=EQ&QuoteId='+sterlingQuoteItemTemp.SterlingQuote__r.Id +'&FinanceUser='+finance_user.financeUser__c+'&SfaStatus=icbApproved');
            }else{
                ref= new PageReference('/apex/SterlingQuote?AccountId='+sterlingQuoteItemTemp.SterlingQuote__r.OpportunityId__r.accountid+'&OpportunityId='+sterlingQuoteItemTemp.SterlingQuote__r.OpportunityId__c+'&OptionType=EQ&QuoteId='+sterlingQuoteItemTemp.SterlingQuote__r.Id);
            }
         }
        return ref;
     }
    
        
    public PageReference BackCustom() {
        return new PageReference('/apex/Quote?id='+objSQi.SterlingQuote__c+'&sfdc.override=1');
    }
     
     public boolean displayPopup {get; set;}     
     public boolean displayPop {get; set;}     
    
    public pagereference closePopup() {        
        displayPopup = false;   
        System.debug('**** strq ' + SterlingQuoteItem );
                //update  SterlingQuoteItem; 
                update objSQi;
        //PUt the approval process code ehre. a
        // Create an approval request for the account
        Approval.ProcessSubmitRequest req1 = new Approval.ProcessSubmitRequest();  
        req1.setComments('Submitted for Approval');
        //Create a attachment
        List<StaticResource> sr = [Select body,name from StaticResource where Name = 'ICBWorkBook']; 
        List<Attachment> attachList = [SELECT Id,name FROM Attachment WHERE parentId =: objSQi.id AND Name = 'ICBWorkBook.xls'];
          if(sr.size() > 0 && (attachList == null || attachList.size() == 0)) {
              Attachment att = new Attachment();
              att.isPrivate = false;
              att.ParentId = objSQi.id;
              att.Name = 'ICBWorkBook.xls';
              att.body = sr.get(0).Body;
              insert att;
        }
      //End


        req1.setObjectId(objSQi.id);
        Approval.ProcessResult result = Approval.process(req1); 
        
        PageReference pageRef = new PageReference('/apex/QuoteLineItem');
        pageRef.getParameters().put('id',apexpages.currentpage().getparameters().get('id'));
        pageRef.setRedirect(true);
        return pageRef;
       // return null;
   
    }     
    public void showPopup() {        
        displayPopUp = true; 
        
           
           
    }
    public void cancelpopup(){
     displayPopup = false;      
     displaypop = false;
    }
    public pagereference delmethod(){
    delete[select id from SterlingQuoteItem__c where id =:strOverride];    
    return new PageReference('/apex/Quote?id='+objSQi.SterlingQuote__c+'&sfdc.override=1');
    }
    // added by Maxg 5/2/2014 to support start INA process button
    public PageReference LaunchINA() {
        system.debug('Calling StartINAProcess page' +objSQi.Id);
        return new PageReference('/apex/StartINAProcess?qli='+objSQi.Id+'&sfdc.override=1');
    } 
     public PageReference SIFT() {
        displayPop = true;
        sterlingquoteitem__c objSQItem =[select id,SIFT_Required__c from sterlingquoteitem__c where id =: ObjSQi.id];
        objSQItem.SIFT_Required__c = true;
        objSQi.overallstatus__c = 'Pending SIFT Status-ON HOLD';
        
        update objSQItem;
        return null;
   
}
// sift cancel button... 
    public PageReference Submitsift(){
    displaypop = false;
    system.debug('**********'+displaypop);
     objSQi.SIFT_InquiryId__c = strPopMsg;
     objSQi.overallstatus__c = 'Pending SIFT Status';
     upsert objSQi;
     PageReference pg = new PageReference('/apex/QuoteLineItem');
     pg.getParameters().put('id',apexpages.currentpage().getparameters().get('id'));
     pg.setRedirect(true);
    return pg; 
    }
    
    
    }