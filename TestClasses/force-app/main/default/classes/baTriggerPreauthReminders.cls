// sva 6/19/2012
// Set switch for emails to be processed with pre-auth Sales emails
global class baTriggerPreauthReminders implements Database.Batchable<sObject>, Database.Stateful
{
    global Integer numRead=0;
    global Integer numChanged = 0;
    global String bName = 'baTriggerPreauthReminders';
    global String msg='';
    global Integer months = 24;
    global integer numTN = 0;
    global Integer numAdmin = 0;
    global String preauthPrefix;
    global Map<String, integer> emails = new Map<String, integer>();
    
    
    global baTriggerPreauthReminders()
    {
        
    }
    global baTriggerPreauthReminders(Integer i)
    {
        months = i;
    }
    global Database.QueryLocator start (Database.BatchableContext BC)
    {
        loadPreauthPrefix();
        return Database.getQueryLocator(getQuery());
    }
    global void execute(Database.BatchableContext BC, List<sObject> scope)
    {
        Map<id, processinstanceworkitem> pws = new Map<id, processinstanceworkitem>();
        processinstanceworkitem pw;
        String sid;
        for (SObject s : scope)
        {
            pw = (processinstanceworkitem) s;
            String tPrefix = pw.ProcessInstance.TargetObjectId;   
            if (tPrefix.subString(0,3) == preauthPrefix)
                pws.put(pw.ProcessInstance.TargetObjectId, pw);
        }
        
        List<Credit_PreAuthorization__c> ups = [select id, reminder__c, reminder_email__c from Credit_PreAuthorization__c where id in :pws.keySet()];
        
        Integer cnt; 
        for (Credit_PreAuthorization__c p : ups)
        {
            p.reminder__c = true;
            pw = pws.get(p.id);
            p.reminder_email__c = pw.actor.email;
            if (emails.containsKey(pw.actor.email))
            {
                cnt = emails.get(pw.actor.email);
                cnt++;
                emails.put(pw.actor.email, cnt);
            }
            else {
                emails.put(pw.actor.email, 1);
            }
        }
        numRead += scope.size();
        numChanged += ups.size();
        update ups;
    }       
                
    global void addMsg(String x)
    {
        msg += '\n' + x + ' ';
        if (msg.length() > 32000)
            sendEmail(false);
    }
    global void finish(database.BatchableContext BC)
    {
        for (String s : emails.keySet())
        {
            Integer cnt = emails.get(s);
            addMsg('\n' + s + ' ' + cnt);
        }
        sendEmail(true);
    }
    global void sendEmail(boolean bFinal)
    { 
        FrontierUtil.sendMsg(bName + ' Read ' + numRead + ' Set reminder for ' + numChanged,
            msg,
            'scott.vanatta@ftr.com');
        msg = '';
    }
    public String getQuery()
    {
        DateTime dtm = DateTime.now();
        dtm = dtm.AddDays(-1);
        String query = 'Select actor.email, ProcessInstance.TargetObjectId from processinstanceworkitem ' +
            'where processinstance.status = \'Pending\'' +
            ' and systemmodstamp < ' + FrontierUtil.ConvertDateTimeToSoql(dtm);
        return query;
    }
    


public void loadPreauthPrefix ()
{   
    Map<String,Schema.SObjectType> gd; 
    gd = Schema.getGlobalDescribe();   
    for(String sObj : gd.keySet())   
    {   
        Schema.DescribeSObjectResult r =  gd.get(sObj).getDescribe();
        if (r.getName() == 'Credit_PreAuthorization__c')
        {
            preauthPrefix = r.getKeyPrefix();
            break;
        }
    }   
}   
       

public static testMethod void testBaCustomerLoad()
{
    Database.BatchableContext bc;
    baTriggerPreauthReminders ttc = new baTriggerPreauthReminders();
    String query = ttc.getQuery() + ' limit 10';
    List<processinstanceworkitem> accs  = database.query(query);
     ttc.execute(bc, accs);
     ttc.finish(bc);
}
    

    
}