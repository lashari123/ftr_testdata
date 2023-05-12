({
	getAddresses : function(component, event, helper) {
        var addTypes = [];
        addTypes.push("None");
		var action = component.get("c.quoteEdit_SterlingCPQ");
        var oppId = location.search.match(/lkid%3D(.*?)%26/)[1];
        action.setParams({
            opportunityId : oppId
        });	
        action.setCallback(this, function(response){
            var state = response.getState();
            var rows = response.getReturnValue();
            if(state==="SUCCESS" && response.getReturnValue() != null){
				component.set("v.addresses", response.getReturnValue());
                rows.forEach(function(row) {
                  addTypes.push(row.strColumnOne);
                });
                component.set("v.addressTypes",  addTypes);
                component.set("v.isModalOpen", true);
            }
        })
        $A.enqueueAction(action);
    },
    
	reDirectToSterling : function(component, event, helper) {
        var action = component.get("c.reDirectToSterling");
        var oppId = location.search.match(/lkid%3D(.*?)%26/)[1];
        var recId = component.get("v.oppId");
        action.setParams({
            opportunityId : oppId	,
            selectedAddress : component.find("mySelect").get("v.value")
        });	
        action.setCallback(this, function(response){
            var state = response.getState();
            var sterlingURL = response.getReturnValue();
            if(state === "SUCCESS" && component.isValid()){
                component.set("v.isModalOpen", false);
                component.find("navService").navigate({    
                    "type": "standard__webPage",
                    "attributes": {
                        "url": sterlingURL
                    }
                })
            }
            
        })
        $A.enqueueAction(action);
    },
})