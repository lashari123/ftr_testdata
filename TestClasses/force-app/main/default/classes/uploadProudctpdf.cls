public class uploadProudctpdf {
    public Opportunity opp{get;set;} //Opportunity object
    
    //constructor
    public uploadProudctpdf(ApexPages.StandardController standardPageController) {
        opp = (Opportunity)standardPageController.getRecord(); //instantiate the Opportunity object for the current record
    }
    
    public PageReference attachPDF() {
        Opportunity currentOpp = new Opportunity();
        PageReference pg;
        currentOpp = [select id,Types_of_Product__c from Opportunity where id =: opp.id];
        if(currentOpp.Types_of_Product__c == 'Frontier Anyware'){
            //generate and attach the PDF document
            PageReference pdfPage = Page.UCaaSpdf; //create a page reference to our Pdf2 Visualforce page
            pdfPage.getParameters().put('Id', opp.Id);
             Blob pdfBlob; //create a blob for the PDF content
            if (!Test.isRunningTest()){
              
                pdfBlob = pdfPage.getContent();
                
            }
            else{
             pdfBlob = Blob.valueOf('Some Text for a boring PDF file...');
        }
            Attachment attach = new Attachment();
            attach.parentId = opp.Id;
            attach.Name = 'Quote' + system.now()+'.pdf'; 
            attach.body = pdfBlob; //create the attachment object
            attach.contentType = 'application/pdf';
            insert attach;
            
            pg = pdfPage;
        }
        else if(currentOpp.Types_of_Product__c == 'Smart Voice'){
            PageReference pdfPage = Page.SmartVoiceQuote; //create a page reference to our Pdf2 Visualforce page
            pdfPage.getParameters().put('Id', opp.Id);
            Blob pdfBlob; //create a blob for the PDF content
            if (!Test.isRunningTest()){
                pdfBlob = pdfPage.getContent();
            }
               else{
             pdfBlob = Blob.valueOf('Some Text for a boring PDF file...');
        }
            Attachment attach = new Attachment(parentId = opp.Id, Name = 'Quote' + system.now()+'.pdf', body = pdfBlob); //create the attachment object
            attach.contentType = 'application/pdf';
            insert attach;
            
            pg = pdfPage;
        }
        return pg;
    }
    
    
    
    //method called from the Visualforce's action attribute
    /*public PageReference attachPDF() {

//generate and attach the PDF document
PageReference pdfPage = Page.NewProductpdf; //create a page reference to our Pdf2 Visualforce page
pdfPage.getParameters().put('Id', opp.Id);
Blob pdfBlob; //create a blob for the PDF content
if (!Test.isRunningTest()) { //if we are not in testing context
pdfBlob = pdfPage.getContent(); //generate the pdf blob
} else { //otherwise, we are in testing context and getContent() gets funky so create the blob manually
pdfBlob = Blob.valueOf('Some Text for a boring PDF file...');
}
List<Attachment> attachlist  = new List<Attachment>();
List<Attachment> attachlst  = new List<Attachment>();
List<Attachment> upattachlst  = new List<Attachment>();
Boolean check = true;
attachlist = [select id,Name,parentId from Attachment where parentId =: opp.Id];
if(attachlist != null && !attachlist.isEmpty()){
for(Attachment atch : attachlist) {
if(atch.Name == 'Quote') {
atch.Body = pdfBlob;
atch.contentType = 'application/pdf';
upattachlst.add(atch);
check = false;
}
}

if(check == true){
Attachment attach = new Attachment(parentId = opp.Id, Name = 'Quote  ' + system.now(), body = pdfBlob); //create the attachment object
attach.contentType = 'application/pdf';
attachlst.add(attach);
}
insert attachlst;
update upattachlst;

}
else{
Attachment attach = new Attachment(parentId = opp.Id, Name = 'Quote  '+ system.now(), body = pdfBlob); //create the attachment object
attach.contentType = 'application/pdf';
insert attach; //insert the attachment 
}
//redirect the user
//PageReference pageWhereWeWantToGo = new ApexPages.StandardController(opp).view(); //we want to redirect the User back to the Opportunity detail page
//pageWhereWeWantToGo.setRedirect(true); //indicate that the redirect should be performed on the client side
return pdfPage; //send the User on their way
}*/
    
}