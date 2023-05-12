public class Case_Email_Automation {

    public Database.DMLOptions opts;
    public AssignmentRule aR;
    
    public Case_Email_Automation(){
        
         opts = new Database.DMLOptions();  
         opts.EmailHeader.triggerAutoResponseEmail = true;
         opts.EmailHeader.triggerUserEmail = true;
         List<AssignmentRule> aR = [SELECT ID FROM AssignmentRule WHERE sObjectType ='case' and Active = true];
         
         if(!aR.isEmpty()){
         	opts.assignmentRuleHeader.assignmentRuleId= aR[0].id;
         }
         
         
    } 
    
    public void Case_Initialize(Case newCase){
    	
    	 newCase.RecordTypeId = null;
    	 List<RecordType> recType = [SELECT id FROM RecordType WHERE NAME = 'Salesforce Request' AND SObjectType = 'Case'];
    	 if(!recType.isEmpty()){
    		newCase.RecordTypeId = recType[0].Id;
    	 }
         newCase.Type_of_Request__c = 'Salesforce Exception';
         
         newCase.setOptions(opts);
         
    }
    
    public void Insert_Cases(List<Case> cseList){
        
        try{
            if(cseList.size() > 0){
                insert cseList;
            }
        }catch(Exception e){   System.debug('Insert Case Failed');  }
        
    }
}