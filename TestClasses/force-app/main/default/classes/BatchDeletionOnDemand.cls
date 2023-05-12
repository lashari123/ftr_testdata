public class BatchDeletionOnDemand {

    public String massDeletionObj {get; set;}
    public String deletionField {get; set;}
    public String deletionValue {get; set;}
    public String followUpObject {get; set;}
    public String followUpField {get; set;}
    public String followUpValue {get; set;}

    //Constructor
    public BatchDeletionOnDemand() {
        massDeletionObj = ApexPages.currentPage().getParameters().get('massDeletionObj');
        deletionField = ApexPages.currentPage().getParameters().get('deletionField');
        deletionValue = ApexPages.currentPage().getParameters().get('deletionValue');
        followUpObject = ApexPages.currentPage().getParameters().get('followUpObject');
        followUpField = ApexPages.currentPage().getParameters().get('followUpField');
        followUpValue = ApexPages.currentPage().getParameters().get('followUpValue');
    }

    public PageReference executeBatchDeletion() {
        //Kick off the batch
        BatchDeletion bd = new BatchDeletion(massDeletionObj, deletionField, deletionValue, followUpObject, followUpField, followUpValue);
        //The Id is grabbed but not currently used. Might be useful later for debugging or presented for end user in some fashion.
        Id batchprocessid = Database.executeBatch(bd);

        Schema.SObjectType t = Schema.getGlobalDescribe().get(massDeletionObj);
        Schema.DescribeSObjectResult r = t.getDescribe();
        Schema.DescribeFieldResult f = r.fields.getMap().get(deletionField).getDescribe();
        Schema.DisplayType ft = f.getType();
        String fieldType = ft+'';
        
        PageReference pageRef = new PageReference('/home/home.jsp');
        
        if(fieldType == 'ID' || fieldType == 'REFERENCE') {
            pageRef = new PageReference('/'+deletionValue);
        }
        
        pageRef.setRedirect(true);
        
        return pageRef;
    }
}