({
	doInit : function(component, event, helper) {
		var action = component.get("c.getPhoneNumber");
        action.setParams({ recordId : component.get("v.recordId") });
 
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var phone = response.getReturnValue() || "";
                component.set("v.phoneNo", phone);
            }
            else if (state === "INCOMPLETE") {
                
            }
            else if (state === "ERROR") {
                var errors = response.getError();
                if (errors) {
                    if (errors[0] && errors[0].message) {
                        console.log("Error message: " + errors[0].message);
                    }
                } else {
                    console.log("Unknown error");
                }
            }
        });
 
        $A.enqueueAction(action);
	},
    makeCall : function(component, event, helper) {
		var action = component.get("c.login");
        action.setParams({ phoneNo : component.get("v.phoneNo") });
 
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                
            }
            else if (state === "INCOMPLETE") {
                
            }
            else if (state === "ERROR") {
                var errors = response.getError();
                if (errors) {
                    if (errors[0] && errors[0].message) {
                        console.log("Error message: " + errors[0].message);
                    }
                } else {
                    console.log("Unknown error");
                }
            }
        });
 
        $A.enqueueAction(action);
	}
})