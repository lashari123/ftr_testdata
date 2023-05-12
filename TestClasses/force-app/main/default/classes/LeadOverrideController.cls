public with sharing class LeadOverrideController {
    public Boolean isNew = true;
    public Lead lead {get;set;}    
    public Id id;
    public string RecTypeId;
    public Id campaignId;
    public string clonePgVar;
    public string retURL;
    public String leadId;
    public String Items='';
    public Boolean display {get;set;}    
    public boolean displayPopup=true;
    public String searchInput {get; set;}
    private static string REDIRECT='/00Q/e?retURL=%2F00Q%2Fo'; 
    public boolean useAssignRule {get; set;}
    public List<AssignmentRule> assignRuleList;
    public CampaignMember tCampgnMem = new CampaignMember();
    public String eMsg = '';
    public List<SelectOption> statesList {get;set;}
    
    public LeadOverrideController (){
        Items = 'Contains';
        check = 'Contains';
    }
    
    
    public LeadOverrideController(ApexPages.StandardController controller) {
        statesList = new List<selectOption>(); 
        statesList.add(new selectOption('','Select from dropdown list... '));
        statesList.add(new selectOption('AL','AL - ALABAMA'));
        statesList.add(new selectOption('AK','AK - ALASKA'));
        statesList.add(new selectOption('AS','AS - AMERICAN SAMOA'));
        statesList.add(new selectOption('AZ','AZ - ARIZONA'));
        statesList.add(new selectOption('AR','AR - ARKANSAS'));
        statesList.add(new selectOption('CA','CA - CALIFORNIA'));
        statesList.add(new selectOption('CO','CO - COLORADO'));
        statesList.add(new selectOption('CT','CT - CONNECTICUT'));
        statesList.add(new selectOption('DE','DE - DELAWARE'));
        statesList.add(new selectOption('DC','DC - DISTRICT OF COLUMBIA'));
        statesList.add(new selectOption('FM','FM - FEDERATED STATES OF MICRONESIA'));
        statesList.add(new selectOption('FL','FL - FLORIDA'));
        statesList.add(new selectOption('GA','GA - GEORGIA'));
        statesList.add(new selectOption('GU','GU - GUAM'));
        statesList.add(new selectOption('HI','HI - HAWAII'));
        statesList.add(new selectOption('ID','ID - IDAHO'));
        statesList.add(new selectOption('IL','IL - ILLINOIS'));
        statesList.add(new selectOption('IN','IN - INDIANA'));
        statesList.add(new selectOption('IA','IA - IOWA'));
        statesList.add(new selectOption('KS','KS - KANSAS'));
        statesList.add(new selectOption('KY','KY - KENTUCKY'));
        statesList.add(new selectOption('LA','LA - LOUISIANA'));
        statesList.add(new selectOption('ME','ME - MAINE'));
        statesList.add(new selectOption('MH','MH - MARSHALL ISLANDS'));
        statesList.add(new selectOption('MD','MD - MARYLAND'));
        statesList.add(new selectOption('MA','MA - MASSACHUSETTS'));
        statesList.add(new selectOption('MI','MI - MICHIGAN'));
        statesList.add(new selectOption('MN','MN - MINNESOTA'));
        statesList.add(new selectOption('MS','MS - MISSISSIPPI'));
        statesList.add(new selectOption('MO','MO - MISSOURI'));
        statesList.add(new selectOption('MT','MT - MONTANA'));
        statesList.add(new selectOption('NE','NE - NEBRASKA'));
        statesList.add(new selectOption('NV','NV - NEVADA'));
        statesList.add(new selectOption('NH','NH - NEW HAMPSHIRE'));
        statesList.add(new selectOption('NJ','NJ - NEW JERSEY'));
        statesList.add(new selectOption('NM','NM - NEW MEXICO'));
        statesList.add(new selectOption('NY','NY - NEW YORK'));
        statesList.add(new selectOption('NC','NC - NORTH CAROLINA'));
        statesList.add(new selectOption('ND','ND - NORTH DAKOTA'));
        statesList.add(new selectOption('MP','MP - NORTHERN MARIANA ISLANDS'));
        statesList.add(new selectOption('OH','OH - OHIO'));
        statesList.add(new selectOption('OK','OK - OKLAHOMA'));
        statesList.add(new selectOption('OR','OR - OREGON'));
        statesList.add(new selectOption('PW','PW - PALAU'));
        statesList.add(new selectOption('PA','PA - PENNSYLVANIA'));
        statesList.add(new selectOption('PR','PR - PUERTO RICO'));
        statesList.add(new selectOption('RI','RI - RHODE ISLAND'));
        statesList.add(new selectOption('SC','SC - SOUTH CAROLINA'));
        statesList.add(new selectOption('SD','SD - SOUTH DAKOTA'));
        statesList.add(new selectOption('TN','TN - TENNESSEE'));
        statesList.add(new selectOption('TX','TX - TEXAS'));
        statesList.add(new selectOption('UT','UT - UTAH'));
        statesList.add(new selectOption('VT','VT - VERMONT'));
        statesList.add(new selectOption('VI','VI - VIRGIN ISLANDS'));
        statesList.add(new selectOption('VA','VA - VIRGINIA'));
        statesList.add(new selectOption('WA','WA - WASHINGTON'));
        statesList.add(new selectOption('WV','WV - WEST VIRGINIA'));
        statesList.add(new selectOption('WI','WI - WISCONSIN'));
        statesList.add(new selectOption('WY','WY - WYOMING'));
        id = ApexPages.currentPage().getParameters().get('id'); 
        retURL = ApexPages.currentPage().getParameters().get('retURL');
        clonePgVar =  ApexPages.currentPage().getParameters().get('clone');
        this.lead=(Lead)controller.getRecord(); 
        System.debug('Inside param constructor...' + id ); 
        //Kamran: 4/30/10 Query record type and route to respective VF page if record type is different than default
        // TTL = ' 01240000000Ht5w' CustRef = '01240000000HtBf'
        if( id !=null ){  // 'Edit' scenario
            isNew = false;
            RecTypeId = [Select l.RecordTypeId From Lead l where l.Id = :id ].RecordTypeId; 
            if(RecTypeId != null)   RecTypeId = RecTypeId.substring (0,15);
            else RecTypeId = '01240000000Ht61'; //Default - for already existing leads with NO record type
        }else{ // 'New' Scenario
            isNew = true;
            RecTypeId = ApexPages.currentPage().getParameters().get('RecordType');
        }

        Items = 'Contains';
        check = 'Contains';              
    }  
    
    public PageReference reDirect() {  // Basen on RecordType, route to appropraite VF page for Edit/New
        System.debug('Inside reDirect' + RecTypeId); 
        if(RecTypeId == '01240000000Ht5w' && isNew == false) {// TTL record type 01240000000Ht5w
           PageReference pageRef = new PageReference('/apex/LeadEditTTL?id='+id); 
           pageRef.setRedirect(true);
           return pageRef;
        }else if(RecTypeId == '01240000000Ht5w' && isNew == true) {// TTL record type 01240000000Ht5w & New record
            PageReference pageRef = new PageReference('/apex/LeadNewTTL?RecordType='+RecTypeId+'&ent=Lead&retURL='+retURL);
            pageRef.setRedirect(true);
            return pageRef;  
        }else if(RecTypeId == '01240000000HtBf'&& isNew == false) {// Customer Refferal record type
            PageReference pageRef = new PageReference('/apex/LeadCustRef?id='+id ); 
            pageRef.setRedirect(true);
            return pageRef;
        }else if(RecTypeId == '01240000000HtBf'&& isNew == true) {// Customer Refferal record type & New record
            PageReference pageRef = new PageReference('/apex/LeadCustRef?RefRecordType='+RecTypeId+'&ent=Lead&retURL=/00Q/o'); 
            pageRef.setRedirect(true);
            return pageRef;
        }else   
            return null;
    }   
        
    public PageReference save1(){
    
        // Implement the "Assign using active Assignment rule checkbox"   
        if(useAssignRule){
            assignRuleList = [Select a.Active, a.Id, a.Name, a.SobjectType from AssignmentRule a];
            
            for(AssignmentRule currAssignRule : assignRuleList ){
                if(currAssignRule.SobjectType == 'Lead'){
                    if(currAssignRule.Active){
                        Database.DMLOptions dmo = new Database.DMLOptions();
                        dmo.assignmentRuleHeader.assignmentRuleId= currAssignRule.Id;
                        lead.setOptions(dmo);
                     }
                 }                               
              }      
        }        
       try{
        if(id!=null && clonePgVar!= '1'){       
            update lead;
        }else{
           lead = lead.clone(false,true);
           insert lead;
        
            //Associate lead as a campaignmember to the selected campaign
            try{
            if(lead.Campaign__c != null){ 
                tCampgnMem.LeadId = lead.Id;
                tCampgnMem.CampaignId = lead.Campaign__c;
                insert tCampgnMem;
            }
            }catch (Exception camperr){
            eMsg = '\nInsert to Campaign member failed: \nCampaign record details:' + tCampgnMem + '\n'+ '\nSystem Error Msg:' + camperr;
            sendMsg(eMsg);
            }
        }
        }catch(Exception e){
        
        eMsg = '\nUpsert to Lead failed: \nLead record details:' + lead + '\n'+ '\nSystem Error Msg:' + e;
        sendMsg(eMsg);

        }
        
                
        PageReference detailPage = new PageReference('/'+lead.Id);
        detailPage.setRedirect(true);   
        return detailPage; 
    } 
    
     public PageReference saveAndnew(){
     
     // Implement the "Assign using active Assignment rule checkbox"
      if(useAssignRule){
            assignRuleList = [Select a.Active, a.Id, a.Name, a.SobjectType from AssignmentRule a];
            
            for(AssignmentRule currAssignRule : assignRuleList ){
                if(currAssignRule.SobjectType == 'Lead'){
                    if(currAssignRule.Active){
                        
                        Database.DMLOptions dmo = new Database.DMLOptions();
                        dmo.assignmentRuleHeader.assignmentRuleId= currAssignRule.Id;
                        lead.setOptions(dmo);
                     }
                 }                               
              }      
        }    
       
        try{
        if(id!=null && clonePgVar!= '1'){       
            update lead;
        }else{
           lead = lead.clone(false,true);
           insert lead;
        
            //Associate lead as a campaignmember to the selected campaign
            try{
            if(lead.Campaign__c != null){ 
                tCampgnMem.LeadId = lead.Id;
                tCampgnMem.CampaignId = lead.Campaign__c;
                insert tCampgnMem;
            }
            }catch (Exception camperr){
            eMsg = '\nInsert to Campaign member failed: \nCampaign record details:' + tCampgnMem + '\n'+ '\nSystem Error Msg:' + camperr;
            sendMsg(eMsg);
            }
        }
        }catch(Exception e){
        
        eMsg = '\nUpsert to Lead failed: \nLead record details:' + lead + '\n'+ '\nSystem Error Msg:' + e;
        sendMsg(eMsg);

        } 
               
        PageReference detailPage = new PageReference(REDIRECT);
        detailPage.setRedirect(true);   
        return detailPage; 
    }     
    

    
    List<SIC_Code__c> searchobjList;
    List<SIC_Code__c> tempSearchobjList=new List<SIC_Code__c>();
    String check = '';
    public void showPopup(){
        Items = 'Contains';
        displayPopup = true;
    }
    public Boolean getDisplayPopup(){
        return displayPopup;
    }
    
    public void Search(){
        String st= getCheckValue();
        if(st == 'Contains'){
            display=false;
            String queryName = '%' + searchInput  + '%';
            searchobjList=[Select d.SystemModstamp,d.Description__c, d.Short_Description__c, d.SIC__c, d.Id From SIC_Code__c d where d.Description__c like :queryName+'%' or d.SIC__c like :queryName+'%' ORDER BY d.SIC__c Limit 1000];
            if(searchobjList.size()==0)
                display=true;
            }
        if(st == 'Starts with'){
            display=false;
            String queryName = searchInput + '%';
            searchobjList=[Select d.SystemModstamp, d.Description__c,d.Short_Description__c, d.SIC__c, d.Id From SIC_Code__c d where d.Description__c like :queryName+'%' or d.SIC__c like :queryName+'%' ORDER BY d.SIC__c Limit 1000];
            if(searchobjList.size()==0)
                display=true;            
        }
        
        // To escape the single quotes present in the description field
        for(SIC_Code__c tList : searchobjList){
        // To replace special character(single quote)
        if(tList.Description__c.contains('\''))
           tList.Description__c= tList.Description__c.replace('\'','');
        }
        
    }
    
    public List<SIC_Code__c> getobjList(){
        return searchobjList;
    }
   
    public List<SelectOption> getItems(){
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('Contains','Contains'));
        options.add(new SelectOption('Starts with','Starts with'));       
        return options;
    }
        
    public String getCheckValue(){
        return check;
    }
                    
    public void setCheckValue(String check){
        this.check = check;
    }
    public string getclonePgVar(){
        return clonePgVar;
    }
    
     public void sendMsg(String err) {
        Messaging.SingleEmailMessage mail=new Messaging.SingleEmailMessage();
        String[] toAddresses = new String[] {'Scott.VanAtta@frontiercorp.com'};
        mail.setToAddresses(toAddresses);
        mail.setSenderDisplayName('Apex error');
        mail.setSubject('LeadOverride Page Error from Org : ' + UserInfo.getOrganizationName());
        mail.setPlainTextBody('Error Message: ' + err +
                          '\nUser:'+ UserInfo.getName()+
                          '\nOrg:' + UserInfo.getOrganizationId()+
                          '\nUserName:' + UserInfo.getUserName()+
                          '\nUserId:' + UserInfo.getUserId());
                          
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
    }       

}