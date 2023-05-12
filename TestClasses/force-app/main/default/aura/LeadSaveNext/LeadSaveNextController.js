({
    myInit: function(component, event, helper){
        var currentLeadId = component.get("v.recordId");
        component.set("v.LeadId",currentLeadId);
        var action = component.get("c.getLeads");
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var IdList = response.getReturnValue();
                console.log(' Lead List before:'+IdList);
                console.log('Id List Length before:'+IdList.length);
                if(IdList.length > 0){
                    IdList.splice(IdList.indexOf(currentLeadId),1);
                    console.log(' Lead List before:'+IdList);
                }
                console.log('Id List Length after:'+IdList.length);
                if(IdList.length > 0){
                    component.set("v.LeadList", IdList);
                    component.set("v.formMode", "edit");
                }
            }
            else {
                console.log("Failed with state: " + state);
            }
        });
        $A.enqueueAction(action);
        
    },
    
    
    
     handleSuccess: function (component, event, helper) {
        component.find('notifLib').showToast({
            "title": "Record updated!",
            "message": "The record "+ event.getParam("id") + " has been updated successfully.",
            "variant": "success"
        });
         helper.hSuccess(component, event, helper);
         component.set("v.LeadId",component.get("v.NextLeadId"));
         component.set('v.formMode', 'view');
    },
    
    callChildMethod : function(component, event, helper) {
         //component.set("v.LeadId",component.get("v.NextLeadId"));
        component.find('myEditForm').submit();
         
    },
    
    closeModal : function(component, event, helper) {
        var closeModalEvt = $A.get("e.force:closeQuickAction");
        if(closeModalEvt){
            closeModalEvt.fire();
        } else{
            alert("force:closeQuickAction is not supported in this lightning context");
        }
    },
    
    handleError: function (component, event, helper) {
        /* event.preventDefault();
         var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "title": "Error!!!",
                    "message": "Please Enter the reason for no action being taken in Notes Field",
                    "type": "error"
                });
                toastEvent.fire();*/
     /*   component.find('notifLib').showToast({
            "title": "Something has gone wrong! Notes Filed",
            "message": event.getParam("message"),
            "variant": "error"
        });       */
     },

    
     loadHandler : function(component, event, helper) {
        if(component.get('v.skipFirstLoad')) {
            component.set('v.skipFirstLoad', false);
            return;
        }
         component.set('v.formMode', component.get('v.formMode') === 'view' ? 'edit' : 'view');
    },
    
    
    
})