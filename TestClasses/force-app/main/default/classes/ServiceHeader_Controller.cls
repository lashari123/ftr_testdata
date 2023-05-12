public class ServiceHeader_Controller {
    public String strSelectedBtn {get;set;}
    public String strSelectedWtn {get;set;}
    public Account acc {get;set;}

    public ServiceHeader_Controller() {
        system.debug('Account Id: '+ApexPages.currentPage().getParameters().get('accoutId'));
        //Retrive AccountID Information 
        String AccountId = ApexPages.currentPage().getParameters().get('accoutId');
        if(AccountId != null){
            acc = [SELECT Id, Library_Id__c, Hierarchy_level__c, ParentSequenceId__c, TNSequenceId__c FROM Account WHERE Id = :AccountId LIMIT 1];
        }
        strSelectedBtn = (acc.Hierarchy_level__c.equalsIgnoreCase('MEMBER')) ? acc.ParentSequenceId__c : acc.TNSequenceId__c;
        if (strSelectedBtn.length() > 10)
            strSelectedBtn = strSelectedBtn.substring(0,10);
            
        strSelectedWtn = acc.TNSequenceId__c;
    }
    //ServiceConsoleHeader 'Order' Button 
    public PageReference redirectToOrderURL(){
        //String orderURL = '/apex/Order?sfdc.tabName= 01rE0000000av9P&uiFlag=ONEVIEW&btnPhone='+strSelectedBtn;
        String btnPhone = '';
        btnPhone = (acc.Hierarchy_level__c.equalsIgnoreCase('MEMBER')) ? acc.ParentSequenceId__c : acc.TNSequenceId__c;
        if ((string.isEmpty(btnPhone)) || (btnPhone.length() < 10))  
          btnPhone = acc.TNSequenceId__c;
        String orderURl = '/apex/SCOrder?btnPhone='+btnPhone+'&uiFlag=ONEVIEW';
        system.debug('orderURl-----'+orderURl);
        PageReference p = new PageReference(orderURL);
        return p;    
    }
    //ServiceConsoleHeader 'Product Catalog' Button
    /* public PageReference redirecttosterling(){
         String productcatalogURL ; 
         if (strSelectedWtn==null || strSelectedWtn=='') { 
             productcatalogURL = '/apex/DynamicPicklistpage?sfdc.tabName= 01rc00000008pKF&uiFlag=ONEVIEW&btnPhone='+strSelectedBtn;
         }
         else {

             productcatalogURL = '/apex/DynamicPicklistpage?sfdc.tabName= 01rc00000008pKF&uiFlag=ONEVIEW&btnPhone='+strSelectedBtn+'&wtnnumber='+strSelectedWtn;
             system.debug('zzzzz    '+productcatalogURL);
         }
         
        PageReference s = new PageReference(productcatalogURL);
        return s;    
    }   */
    //ServiceConsoleHeader 'Launch Force.com as Customer' Button
    public PageReference launchCustomerPortal() {
        String AccountId = ApexPages.currentPage().getParameters().get('accoutId');
        String AgentId = getAgentId();
        String Nonce = getNonce();
        String Origin = 'sfa';
        String Timestamp = string.valueOf(system.now().getTime());
        String envBtn = 'AgentAccount';
        List<Control_Call__c> query1 = [Select Id, URL_Value__c FROM Control_Call__c where URL_Name__c =:envBtn] ;
        String AgentUrl = query1[0].URL_Value__c;
        system.debug('AgentUrl  = ' + AgentURL);
        PageReference ref = new PageReference(AgentUrl);
        //------
        ref.getParameters().put('accountId',AccountId);
        ref.getParameters().put('agentId',AgentId);
        ref.getParameters().put('nonce',Nonce);
        ref.getParameters().put('origin',Origin);
        ref.getParameters().put('timestamp',Timestamp);
        String Digest = getDigest(ref.getUrl());
        ref.getParameters().put('digest',Digest);
        system.debug('\nLaunch as Customer:\n' + ref.geturl());
        return ref;
    }
    //ServiceConsoleHeader 'Manage a Frontier ID' Button
    public PageReference launchFrontierId() {
        String AccountId = ApexPages.currentPage().getParameters().get('accoutId');
        String AgentId = getAgentId();
        String Nonce = getNonce();
        String Origin = 'sfa';
        String Timestamp = string.valueOf(system.now().getTime());
        String envBtn = 'AgentPortal';
        List<Control_Call__c> query2 = [Select Id, URL_Value__c FROM Control_Call__c where URL_Name__c =:envBtn] ; 
        system.debug('Control Call = ' + query2); 
        system.debug('ENVBTN = ' + envbtn);
        String AgentUrl1 = query2[0].URL_Value__c;
        PageReference ref = new PageReference(AgentUrl1);
        //------
        ref.getParameters().put('accountId',AccountId);
        ref.getParameters().put('agentId',AgentId);
        ref.getParameters().put('nonce',Nonce);
        ref.getParameters().put('origin',Origin);
        ref.getParameters().put('timestamp',Timestamp);
        String Digest = getDigest(ref.getUrl());
        ref.getParameters().put('digest',Digest);
        system.debug('\nLaunch as Customer:\n' + ref.geturl());
        return ref;
    }
    
    public String getAgentId(){
        String AgentId;
        try{
            User this_user = [SELECT Id, CSR_ID__c FROM User WHERE Id = :UserInfo.getUserId()];
            AgentId = this_user.CSR_ID__c;
        }catch(Exception e){}
        return AgentId;
    }
    
    public String getNonce(){
            Blob blobKey = crypto.generateAesKey(128);
            String key = EncodingUtil.convertToHex(blobKey);
            String pwd = key.substring(0,8);
            return pwd;
    }
    
    public String getDigest(String url){
        url = url.replace('https://agent.ftr.com','');
        url = url.replace('http://qat01.frontier.com','');
        url = url.replace('http://qat02.frontier.com','');
        String algorithmName = 'HmacSHA256';
        String secretKeyValue = 'ZK7hKvidUeYnGmW3wvxCtx3NtOjk0XSOzCazl7FulMsHSy8otA9XVSevcA6yA1s7n0afoGyzwVFFEnofJOAuBfzcexvcDDvcq77u3SEzl+KtyJmbl+U5MCiD0YbQvewCwc6Nm3AmDq7LuKlOJMfW+U3cz1LaCt+TIxz/joY9z5o=';
        Blob hmacData = Crypto.generateMac(algorithmName, Blob.valueOf(url), Blob.valueOf(secretKeyValue));
        return EncodingUtil.convertToHex(hmacData);
    }

}