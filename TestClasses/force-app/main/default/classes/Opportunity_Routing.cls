public class Opportunity_Routing {
    private final Opportunity opp;
    private final Id oppId;
    
    public Opportunity_Routing(ApexPages.StandardController SC) {
        this.opp = (Opportunity)SC.getRecord();
        this.oppId = SC.getId();
    }
    
    public PageReference RouteOpportunity() {
    //    if(UserInfo.getProfileId() == '00eE000000122JHIAY' || UserInfo.getProfileId() == '00eE000000127lxIAA'){
    //        return new PageReference('/apex/Opportunity_FrontierSecure?id=' + Opp.Id);
    //    }else{
            return new PageReference('/apex/Opportunity?id=' + Opp.Id);
    //    }
    }
}