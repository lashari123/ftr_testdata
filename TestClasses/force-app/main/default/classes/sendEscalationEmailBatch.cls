global class sendEscalationEmailBatch implements Database.Batchable<sObject>
{
    private Map<String,String> taskTypesAndTeamNames = new Map<String,String>{
        'DPI_Plant_Tables_Queue_Status__c' => 'Order_UCaaS_SIP_OOF_DPI_Plant_Tables',
        'DPI_Tables_Queue_Status__c' => 'Order_UCaaS_SIP_OOF_DPI_Tables',
        'EDW_Queue_Status__c' => 'Order_UCaaS_SIP_OOF_EDW',
        'Initiator_Queue_Status__c' => 'Order_UCaaS_OOF_Intake', // must manually replace with Order_SIP_OOF_Intake when producttype is SIP
        'Order_Writer_Queue_Status__c' => 'Order_UCaaS_SIP_OOF_Intake',
        'Taxation_Queue_Status__c' => 'Order_UCaaS_SIP_OOF_Taxation',
        'X911_Queue_1_Status__c' => 'Order_UCaaS_SIP_911',
        'X911_Queue_2_Status__c' => 'Order_UCaaS_SIP_911'
    };

    global Database.QueryLocator start(Database.BatchableContext BC)
    {
        RecordType rt = [SELECT Id FROM RecordType WHERE Name = 'Out of Franchise' LIMIT 1];
        Set<String> teams = new Set<String> {
            'DPI_Tables_Queue',
                'EDW_Queue',
                'Initiator_Queue',
                'Order_Writer_Queue',
                'X911_Queue_1',
                'X911_Queue_2',
                'Taxation_Queue'
                };
                    
        // Querying for Tasks that are not completed, Jeopardy and Due date is in paste. Also need product_type
        String strQuery = 'SELECT Id,Order_Product_Type__c,DPI_Plant_Tables_Queue_Status__c,DPI_Tables_Queue_Status__c,EDW_Queue_Status__c,Initiator_Queue_Status__c,Order_Writer_Queue_Status__c,X911_Queue_1_Status__c,X911_Queue_2_Status__c,Taxation_Queue_Status__c FROM Case';
        strQuery += ' WHERE RecordTypeId = \'' + rt.Id + '\'';
        // DPI Plant Tables is not included in the array because it needs an AND statment and parenth - all others will be done with OR
        strQuery += ' AND ((DPI_Plant_Tables_Queue_Status__c IN (\'NEW\',\'IN PROGRESS\') AND DPI_Plant_Tables_Queue_Due_Date__c <= TODAY)';    
        for (String t : teams){
            strQuery += ' OR (' + t + '_Status__c IN (\'NEW\',\'IN PROGRESS\') AND ' + t + '_Due_Date__c <= TODAY)';    
        }
        strQuery += ')';
        return Database.getQueryLocator(strQuery);
    }
    
    global void execute(Database.BatchableContext BC, List<Case> scope)
    {
        EmailTemplate objEmailTemplate = [SELECT Id, Subject, Body, HtmlValue FROM EmailTemplate WHERE DeveloperName = 'OOF_Case_In_Jeopardy' LIMIT 1];
        List<Messaging.SingleEmailMessage> listobjSingleEmailMessage = new List<Messaging.SingleEmailMessage>();
        List<Case> orderTasks = new List<Case>();

        for (Case objTask : scope){
            for (String jeopardy : getJeopardies(objTask)){
                switch on jeopardy {
                    when 'DPI_Plant_Tables_Queue_Status__c' {
                        objTask.DPI_Plant_Tables_Queue_Status__c = 'JEOPARDY';
                    }
                    when 'DPI_Tables_Queue_Status__c' {
                        objTask.DPI_Tables_Queue_Status__c = 'JEOPARDY';
                    }
                    when 'EDW_Queue_Status__c' {
                        objTask.EDW_Queue_Status__c = 'JEOPARDY';
                    }
                    when 'Taxation_Queue_Status__c' {
                        objTask.Taxation_Queue_Status__c = 'JEOPARDY';
                    }
                    when 'Initiator_Queue_Status__c' {
                        objTask.Initiator_Queue_Status__c = 'JEOPARDY';
                    }
                    when 'Order_Writer_Queue_Status__c' {
                        objTask.Order_Writer_Queue_Status__c = 'JEOPARDY';
                    }
                    when 'X911_Queue_1_Status__c' {
                        objTask.X911_Queue_1_Status__c = 'JEOPARDY';
                    }
                    when 'X911_Queue_2_Status__c' {
                        objTask.X911_Queue_2_Status__c = 'JEOPARDY';
                    }
                }
                
                List<string> toAddress = new List<string>();
                for (String email : getEmails(jeopardy, objTask.Order_Product_Type__c)) {
                    toAddress.add(email);
                }
                
                String htmlBody = objEmailTemplate.HtmlValue;
                htmlBody = htmlBody.replace('{!LinkToCase}',URL.getSalesforceBaseUrl().getHost() + '/' + objTask.Id);

                String plainBody = objEmailTemplate.Body;
                plainBody = plainBody.replace('{!LinkToCase}',objTask.Id);
                
                Messaging.SingleEmailMessage objSingleEmailMessage = new Messaging.SingleEmailMessage();
                objSingleEmailMessage.setTemplateId(objEmailTemplate.Id);
                objSingleEmailMessage.setToAddresses(toAddress);
                objSingleEmailMessage.setSubject(objEmailTemplate.Subject);
                objSingleEmailMessage.setHTMLBody(htmlBody);
                objSingleEmailMessage.setPlainTextBody(plainBody);
                objSingleEmailMessage.setWhatId(objTask.Id);
                objSingleEmailMessage.setSaveAsActivity(false);
                objSingleEmailMessage.setUseSignature(false);
                
                listobjSingleEmailMessage.add(objSingleEmailMessage);
            }
            orderTasks.add(objTask);
        }
        system.debug('orderTasks: ' + orderTasks);
        update orderTasks;
        
        Messaging.sendEmail(listobjSingleEmailMessage, false);
    }  
    
    global void finish(Database.BatchableContext BC)
    {
        
    }
    
    private Set<String> getEmails(String taskType, String productType) {
        String teamName = this.taskTypesAndTeamNames.get(taskType);
        if (teamName == 'Order_UCaaS_OOF_Intake' && productType == 'SIP') {
            teamName = 'Order_SIP_OOF_Intake';
        }
        Set<String> emails = new Set<String>();
        List<User> users = [SELECT Email FROM USER WHERE Id IN (SELECT UserOrGroupId FROM GroupMember WHERE Group.DeveloperName = :teamName)];
        for (User u : users) {
            emails.add(u.Email);
        }
        return emails;
    }
    
    private static boolean hasSObjectField(SObject so, String fieldName){
        String s = JSON.serialize(so);
        Map<String,Object> obj = (Map<String,Object>) JSON.deserializeUntyped(s);
        Set<String> fieldsPresent = obj.keyset().clone();
        return fieldsPresent.contains(fieldName);
    }
    
    private Set<String> getJeopardies (Case thisCase) {
        Set<String> jeopardies = new Set<String>();
        Set<String> activeValues = new Set<String>{'NEW','IN PROGRESS'};
        SObject soCase = (SObject)thisCase;
        for (String key : this.taskTypesAndTeamNames.keySet()) {
            if (hasSObjectField(thisCase, key)){
                String val = (String)soCase.get(key);
                if (activeValues.contains(val)) {
                    jeopardies.Add(key);
                }       
            }
        }
        return jeopardies;
    }
}