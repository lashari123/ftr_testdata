({
    openModel: function(component, event, helper) {
        component.set("v.isOpen", true);
        var flow = component.find("quickQuoteProposalFlow");
        flow.startFlow("Create_Quick_Quote_or_Proposal", [{ name : "oid", type : "String", value: component.get("v.recordId") }]);
    },
    
    closeModel: function(component, event, helper) {
        component.set("v.isOpen", false);
    },
    
    handleStatusChange : function (component, event) {
        if(event.getParam("status") === "FINISHED") {
            component.set("v.isOpen", false);
			$A.get('e.force:refreshView').fire();        }
    }  
})