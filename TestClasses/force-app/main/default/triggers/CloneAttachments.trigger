//Can do batch of 50-75 max

trigger CloneAttachments on dsftrDocusign_Status__c (before update)
{

    Map<Id, String> ftrdocSignStatusMap = new Map<Id, String>();
    Map<String, Id> dssIDMap = new Map<String, Id>();

    // Get FTR docu sign status env id values
    for (dsftrDocusign_Status__c record  : (List<dsftrDocusign_Status__c>) trigger.newMap.values()) {
       ftrdocSignStatusMap.put(record.ID, record.dsftrDocusign_Envelope_ID__c);
       record.Is_Attachment_Transferred__c = true;
    }
    
    // Extract Docu Sign Status Records with Envelope ID = FTR doc sign status record envelopID.   
    List<dsfs__DocuSign_Status__c> dsstatusList = [Select ID, dsfs__DocuSign_Envelope_ID__c from dsfs__DocuSign_Status__c where dsfs__DocuSign_Envelope_ID__c in :ftrdocSignStatusMap.values()];
    for (dsfs__DocuSign_Status__c dss : dsstatusList)
        dssIDMap.put(dss.dsfs__DocuSign_Envelope_ID__c, dss.ID);

    // Get Attachments from Docu Sign Status records
    Attachment[] attList = [select id, name, body, ParentId from Attachment where ParentId in :dssIDMap.values()];
    Attachment[] insertAttList = new Attachment[]{};
    
    for (dsftrDocusign_Status__c rec  : (List<dsftrDocusign_Status__c>) trigger.newMap.values())
    {
        for(Attachment a: attList)
        {
          //Based on FTRDSS.envid get DSS.ID from the map and compare.
          if (a.parentid.equals(dssIDMap.get(rec.dsftrDocusign_Envelope_ID__c)))  
          {
             Attachment att = new Attachment(name = a.name, body = a.body, parentid = rec.ID); 
             insertAttList.add(att);
          }
        }    
    }

    if(insertAttList.size() > 0) {
        insert insertAttList;
/*        List<dsftrDocusign_Status__c> ftrList = [Select id, Is_Attachment_Transferred__c from dsftrDocusign_Status__c where id in :trigger.newMap.keySet()];
        for (dsftrDocusign_Status__c record  : ftrList)
           
        update ftrList;   
*/   }
        
}