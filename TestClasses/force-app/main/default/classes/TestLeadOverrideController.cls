public class TestLeadOverrideController {
   
   
   static testMethod void testOverrideController() {

        Campaign tCampaign = new Campaign();

        System.currentPageReference().getParameters().put('RecordType', '01240000000HtBf');
        ApexPages.StandardController controller = new ApexPages.StandardController(new Lead());
        
        LeadOverrideController leadOvr = new LeadOverrideController(controller);

        leadOvr.Lead = [Select id,name,Status,Company,LastName from Lead Limit 1];
        
        leadOvr.Lead = leadOvr.Lead.clone(false,true);
        
        leadOvr.reDirect();

        leadOvr.Lead.Status ='Open';
        leadOvr.Lead.Company = 'Test';
        leadOvr.Lead.LastName = 'TestComp';
        
        leadOvr.showPopup();
        Boolean d = leadOvr.getDisplayPopup();
        leadOvr.searchInput ='23';
        leadOvr.Search();
        leadOvr.setCheckValue('Starts With');
        leadOvr.searchInput ='32';
        leadOvr.Search();
        List<SIC_Code__c> e = leadOvr.getobjList();
        List<SelectOption> f = leadOvr.getItems();
        
        leadOvr.Lead.SIC__c = e[0].SIC__c;
        leadOvr.Lead.SIC_Description__c = e[0].Description__c;
        leadOvr.clonePgVar = '0';
        tCampaign = [Select Id from Campaign limit 1];
        leadOvr.Lead.Campaign__c = tCampaign.Id;
        
        insert leadOvr.Lead;
        
        leadOvr.useAssignRule = true;
        leadOvr.assignRuleList = [Select a.Active, a.Id, a.Name, a.SobjectType from AssignmentRule a];
        
        
        leadOvr.save1();
        leadOvr.saveAndnew();        
        String clonePageVar = leadOvr.getclonePgVar();
        leadOvr.sendMsg('Test email');
       
        
    }

}