global class DS_Attachment_Scheduler implements Schedulable{
    
    integer iterationCount = 0;
    List<Contract> conList = new List<Contract>();
    Contract contrt = null;
    
    //List<zOBJ__c> conList = new List<zOBJ__c>();
    //zOBJ__c contrt = null;
    
    global DS_Attachment_Scheduler(){
       System.debug('First record processed');
       conList = [SELECT DS_ENV_ENVELOPEID_C__c,Name, id FROM Contract WHERE RecordTypeId = '0120L000000NMgcQAG'];
       //conList = [SELECT DS_ENV_ENVELOPEID_C__c,Name, id FROM zOBJ__c];
       System.debug('List size == '+conList.size());
       contrt = conList[0];
    }
    
    global DS_Attachment_Scheduler (List<Contract> cList, integer i){
       this.iterationCount = i;
       this.conList = cList;
       System.debug('In Iteration - List size == '+cList.size());
       System.debug(i+'th First record processed');
       if (i < conList.size())
          contrt = conList[i];
       else
       {
          contrt = null;
          System.debug('Contract value NULL');
       }
    }
    
    
    global void execute(SchedulableContext SC) {  
        
        System.debug('this.iterationCount ::'+this.iterationCount);
        System.debug('Contract: '+contrt.DS_ENV_ENVELOPEID_C__c);
        
        if(this.iterationCount == conList.size() ){
           List<CronTrigger> ctList = [SELECT Id, CronJobDetail.Name, NextFireTime, PreviousFireTime, State from CronTrigger where CronJobDetail.Name like 'Job-Contract%' and State != 'DELETED' limit 1];
           system.debug(':::::: System Abort ::::::');
           system.abortJob(ctList[0].id);
        }
        else {
            
            this.iterationCount++;
            
            DateTime dt1 = system.now();        
            DateTime dt = dt1.addSeconds(60);
            String day = string.valueOf(dt.day());
            String month = string.valueOf(dt.month());
            String hour = string.valueOf(dt.hour());
            String minute = string.valueOf(dt.minute());
            String second = string.valueOf(dt.second());
            String year = string.valueOf(dt.year());
            String strJobName = 'JobContract-' + second + '_' + minute + '_' + hour + '_' + day + '_' + month + '_' + year;
            String strSchedule = '0 ' + minute + ' ' + hour + ' ' + day + ' ' + month + ' ?' + ' ' + year;
    
            if(contrt != null){                
                DS_Attachment.getAndInsertAttachment(contrt.DS_ENV_ENVELOPEID_C__c, contrt.id);
                System.debug('RECORD PROCESSED... SCHEDULING TO PROCESS THE NEXT ONE NOW.... HOLD ON');
                System.schedule(strJobName, strSchedule, new DS_Attachment_Scheduler(conList, this.iterationCount));
            }
        }

    }
}