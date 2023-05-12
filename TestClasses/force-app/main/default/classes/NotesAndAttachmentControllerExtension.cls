public with sharing class NotesAndAttachmentControllerExtension {

    public NotesAndAttachmentControllerExtension(SterpageExt controller) {

    }

    public SterlingQuoteItem__c quote{get;set;}
    public User owner {get;set;}
    public DateTime lastModifiedTime {get;set;}
    public NotesAndAttachmentControllerExtension(ApexPages.StandardController controller) {
        if(controller.getRecord() != null) {
            this.quote = (SterlingQuoteItem__c)(controller.getRecord());
        }
    }
    
    public List<innerWrapperClass> getAttachments() {
        List<Id> idList = new List<Id>();
        List<innerWrapperClass> notesAndAttachments = new List<innerWrapperClass>();
        idList.add(this.quote.Id);
        List<Attachment> attachments = [SELECT Id, Name, LastModifiedDate, CreatedById, CreatedBy.Name FROM Attachment WHERE parentId IN :idList];
        innerWrapperClass iwc;
        if(attachments.size() > 0) {
            for (Attachment att : attachments) {
                iwc = new innerWrapperClass();
                iwc.name = att.name;
                iwc.typeOf = 'Attachment';
                iwc.Id = att.Id+'';
                iwc.LastModifiedDate = att.LastModifiedDate;
                iwc.createdById = att.CreatedById+'';
                iwc.createByName = att.CreatedBy.Name;
                iwc.urlRedirection = '/apex/viewOverrideAttachment?id='+iwc.Id+'&retURL=%2F'+this.quote.Id;
                notesAndAttachments.add(iwc);
            }
        }
        List<Note> notes = [SELECT Id, title, LastModifiedDate, CreatedById, CreatedBy.Name FROM Note WHERE parentId IN :idList];
        if(notes.size() > 0) {
            for (Note att : notes) {
                iwc = new innerWrapperClass();
                iwc.name = att.title;
                iwc.typeOf = 'Note';
                iwc.Id = att.Id+'';
                iwc.LastModifiedDate = att.LastModifiedDate;
                iwc.createdById = att.CreatedById+'';
                iwc.createByName = att.CreatedBy.Name;
                iwc.urlRedirection = '/'+iwc.id;
                notesAndAttachments.add(iwc);
            }
        }
        return notesAndAttachments;       
    }
    
    public PageReference redirectToNewNote() {
        string sterlingQuoteIdString = ApexPages.currentPage().getParameters().get('id');
        PageReference newNotePage = new PageReference('/002/e?parent_id='+sterlingQuoteIdString.substring(0, 15)+'&retURL=%2F'+sterlingQuoteIdString);
        newNotePage.setRedirect(true);
        return newNotePage;
    }
    
    public PageReference redirectToNewAttachment(){
        string sterlingQuoteIdString = ApexPages.currentPage().getParameters().get('id');
        SterlingQuoteItem__c sterC = [SELECT Id,SterlingQuote__c, Name FROM SterlingQuoteItem__c WHERE id=: sterlingQuoteIdString];
    //    PageReference newAttachmentPage = new PageReference('/p/attach/NoteAttach?pid='+sterlingQuoteIdString.substring(0, 15)+'&parentname='+sterC.Name+'&retURL=%2F'+sterlingQuoteIdString);
      PageReference newAttachmentPage = new PageReference('/p/attach/NoteAttach?pid='+sterlingQuoteIdString.substring(0, 15)+'&retURL=%2F'+sterlingQuoteIdString);

        newAttachmentPage.setRedirect(true);
        return newAttachmentPage;
    }
    
    public class innerWrapperClass{
        public String name {get;set;}
        public String typeOf {get;set;}
        public String Id {get;set;}
        public dateTime LastModifiedDate{get;set;}
        public String createdById {get;set;}
        public String createByName {get;set;} 
        public String urlRedirection {get;set;}
    }
    
   
    public PageReference BackCustom() {
        return new PageReference('/apex/Quote?id='+quote.SterlingQuote__c+'&sfdc.override=1');
    }
    
    
}