({
	checkSubmitStatus: function(component, event, helper) {
        if(component.get("v.rating") == "" || 
           component.get("v.feedbackType") == "" || 
           component.get("v.comments") == "" || 
           component.get("v.easyToUse") == "" || 
           component.get("v.lookingFor") == "") {
            component.set("v.disableSubmit", true);
        } else {
            component.set("v.disableSubmit", false);
        }
    },
    
    submitFeedback: function(component, event, helper) {
        //component.set("v.isModalOpen", false);
       	var action = component.get("c.submitFeedback");
        action.setParams({
            "feedback": JSON.stringify({
                "Rating__c": component.get("v.rating"),
                "Feedback_Category__c": component.get("v.feedbackType"),
                "Comments__c": component.get("v.comments"),
                "Easy_To_Use__c": component.get("v.easyToUse"),
                "Found_looking_item__c": component.get("v.lookingFor"),
                "Page_Name__c": component.get("v.pageName")
            })
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            component.set("v.serverCallDone", true);
            if (state === "SUCCESS") {
                var result = response.getReturnValue();
                if(result) {
                    component.set("v.showClose", true);
                    component.set("v.messageClass", "success");
                    component.set("v.messageText", "Thank you! Your comments have been successfully captured.");
                } else {
                    component.set("v.messageClass", "error");
                	component.set("v.messageText", "Something went wrong. Please try again.");
                }
            }
            else if (state === "INCOMPLETE") {
                component.set("v.messageClass", "error");
                component.set("v.messageText", "We're Sorry! There seems some problem while saving your response. Please try again.");
            }
            else if (state === "ERROR") {
                component.set("v.messageClass", "error");
                component.set("v.messageText", "We're Sorry! There seems some problem while saving your response. Please try again.");
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