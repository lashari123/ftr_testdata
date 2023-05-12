({
	closeModal : function(component, event, helper) {
        var closeModalEvt = $A.get("e.force:closeQuickAction");
        if(closeModalEvt){
            closeModalEvt.fire();
        } else{
            alert("force:closeQuickAction is not supported in this lightning context");
        }
    },
    hSuccess: function (component, event, helper) {       
        
        var leads = component.get("v.LeadList");
        console.log('Lead List'+leads);
        if(leads.length >0){
            component.set("v.NextLeadId", leads[0]);
            console.log('leadid'+component.get("v.NextLeadId"));
        }
        else{
            helper.closeModal(component, event, helper);
        }
        console.log('Lead size before shift'+leads.length);
        leads.shift();  
        console.log('Lead size after shift'+leads.length);
        component.set("v.LeadList", leads);
        /*var childComp = component.find('childComp');
        childComp.callChild();*/
    },
})