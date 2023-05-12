@RestResource(urlMapping='/ManageProductCatalog/*')
global class WS_SFA_ManageProductCatalog {
 //global String xml = '<?xml version="1.0" encoding="UTF-8" ?> <ItemList><Item ItemID="0919"> <PrimaryInformation ShortDescription="FiOS - Public TV of Armenia" UnitCost="0.00"/></Item></ItemList>';
 //global String xml; 
 /*WS_SFA_ManageProductCatalog(Item strXML){
    xml=String.valueof(strXML);
 }*/  
/*  
 //@HttpPost
    global static Item echoMyType(Item ic) {
    system.debug('*****IC   '+ic);
    return ic;
    }
 */
 /*webService static ResponseClass XMLP(Item IC){
     system.debug('*****IC   '+IC);
     return null;
 }*/
    webService static ResponseClass parseXML(String xml){
    system.debug('#################################### xml:'+xml);
        if(!test.isRunningTest()){
            xml = (System.Encodingutil.base64Decode(xml)).toString(); }
    system.debug('#################################### xml:'+xml);
     list<Item> lstItem = new list<Item>();
     map<String, String> mapDupItem = new map<String,String>();
     List<String> lstDupItem = new List<String>();
 	   try{      
       XmlStreamReader xsr = new XmlStreamReader(xml);  
       system.debug('*****xsr'+xsr);
       while(xsr.hasNext()){
            if(xsr.getEventType() == XmlTag.START_ELEMENT){
                if(xsr.getLocalName()=='Item'){
                     Item oItem = parseItem(xsr);
                     system.debug('****oitem'+oitem);
                     if(oItem != null){ 
                         PrimaryInformation objP = oItem.PrimaryInformation;
                         System.debug('*** objP ' + objP);
                         System.debug('*** objP.ShortDescription ' + objP.ShortDescription);
                         String strDE = objP.ShortDescription;
                         strDE = strDE.replace(' ', '');
                         if(strDE!=null && strDE!='')
                               lstItem.add(oItem);
                                //checking for duplicates
                         
                          if(mapDupItem.get(oItem.ItemId)==null)
			                mapDupItem.put(oItem.ItemId,oItem.ItemId);
			            else
			                lstDupItem.add(oItem.ItemId);
			                
                         system.debug('****+lstItem'+oItem);
                    }    
                 }        
            }else if(xsr.getEventType() == XmlTag.END_ELEMENT){
                if(xsr.getLocalName()=='ItemList'){
                    break;
                }
            }
        xsr.next();
      
            }
      //Add the additional to the lsit
   //   lstlstItem.add(lstItem);
 	   }
	  catch(Exception ex){
	  	
	  }
               
	  ResponseClass objRes = new ResponseClass();
        if(lstDupItem.size()>0){
            objRes.isSuccessFailure='Failure';
            objRes.Message = lstDupItem;
        }
        else{
            objRes.isSuccessFailure='Success';
	  }
      System.debug('########### -->lstItem:'+lstItem);
        BatchforProductCatalog batchJob = new BatchforProductCatalog(lstItem);
        Database.executeBatch(batchJob,1500);
     // ItemBatch batchJob = new ItemBatch(lstlstItem);
     // Database.executeBatch(batchJob,1); 
      
   //    system.debug('batchjob'+batchjob);
        		return objRes;
        
 }
 
 public static Item parseItem(XmlStreamReader xsr){
    //Item oItem = null;
    Item oItem = new Item();
    while(xsr.hasNext()){
        if(xsr.getEventType() == XmlTag.START_ELEMENT){
            //oItem = new Item();
            System.debug('########### -->xsr.getLocalName():'+xsr.getLocalName() );
            if (xsr.getLocalName()=='Item'){
                //oItem = new Item();
                oItem.ItemID = xsr.getAttributeValue(null, 'ItemID') ;
            }
            else if (xsr.getLocalName()=='PrimaryInformation'){
                //oItem = new Item();
                //PrimaryInformation objP = oItem.PrimaryInformation;
                System.debug('########### -->in primary ):'+xsr.getAttributeValue(null, 'ShortDescription' ) + oItem);
                //objP.ShortDescription = xsr.getAttributeValue(null, 'ShortDescription');
             
                oItem.PrimaryInformation.ShortDescription = xsr.getAttributeValue(null, 'ShortDescription');  
                if(OItem.PrimaryInformation.ShortDescription==null)
                return null;           
                oItem.PrimaryInformation.UnitCost = xsr.getAttributeValue(null, 'UnitCost');
            }
        }
        else if(xsr.getEventType() == XmlTag.END_ELEMENT){
                if(xsr.getLocalName()=='Item'){
                    break;
                }
        }
    xsr.next();
  }
  
  return oItem;
 }
global class Item{
    webservice String ItemID{get;set;}
    webservice PrimaryInformation PrimaryInformation;
 global Item(){
    this.ItemID = '';
    this.PrimaryInformation = new PrimaryInformation();
 }
}
global class PrimaryInformation{
     global String ShortDescription{get;set;}
     global String UnitCost{get;set;}
     
 global PrimaryInformation(){
	 ShortDescription = '';
	 UnitCost = '';
	 }
}
global class ResponseClass {
     webservice String isSuccessFailure;
     webservice List<String> Message;
    }

@HttpPost     
global static void Testing(String source_xml){
    String decoded_xml;
    if(!test.isRunningTest()){
    decoded_xml = System.Encodingutil.base64Decode(source_xml).toString();}
	Messaging.SingleEmailMessage msg = new Messaging.SingleEmailMessage();		
	msg.setToAddresses(new String[] {userinfo.getUserEmail()});
	msg.setReplyTo('randy.buhrt@ftr.com');
	msg.setSenderDisplayName('Randy Buhrt');
	msg.setSubject('XML Result');
	msg.setPlainTextBody('Attached is the result file');

	Messaging.EmailFileAttachment msg_attachment = new Messaging.EmailFileAttachment();
  msg_attachment.setFileName('results_' + system.now() + '.xml');
    if(!test.isRunningTest()){  
        msg_attachment.setBody(Blob.valueOf(decoded_xml));
  msg.setFileAttachments(new Messaging.EmailFileAttachment[] {msg_attachment});
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] {msg});	}
	//Dom.Document doc = new Dom.Document();
  //doc.load(decoded_xml);
        //system.debug(doc);

}
}