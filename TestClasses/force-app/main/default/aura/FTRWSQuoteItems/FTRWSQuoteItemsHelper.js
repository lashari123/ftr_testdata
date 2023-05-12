({
    helperMethod: function() {},
    getQuoteItems: function(component, event, helper) {
        var action = component.get("c.getQuoteItemLines");
        var quoteId = component.get("v.recordId");
        var addressId = component.get("v.addressId");
        action.setParams({ quoteId: quoteId, addressId: addressId });
        action.setCallback(this, function(response) {
            if (response.getState() === "SUCCESS") {
                component.set("v.data", response.getReturnValue());
                console.log(response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    },
    removeItem: function(cmp, row) {
        var rows = cmp.get("v.data");
        var rowIndex = rows.indexOf(row);
        var itemRecord = rows.splice(rowIndex, 1);
        var action = cmp.get("c.removeItem");
        action.setParams({ itemId: itemRecord[0].Id });
        action.setCallback(this, function(response) {
            if (response.getState() === "SUCCESS") {
                console.log(response.getReturnValue());
                var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    type: "success",
                    message: "Item removed successfully."
                });
                toastEvent.fire();
                console.log(response.getReturnValue());
                cmp.set("v.data", rows);
            } else {
                var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    type: "error",
                    message: "Failed to remove Item."
                });
                toastEvent.fire();
            }
        });
        $A.enqueueAction(action);
        
        //cmp.set("v.data", rows);
    },
    
    navigate: function(Id) {
        var urlEvent = $A.get("e.force:navigateToURL");
        var urlStr = "/lightning/r/SterlingQuoteItem__c/" + Id + "/view";
        urlEvent.setParams({
            url: urlStr
        });
        urlEvent.fire();
    },
    
    showDiscountPopup:function(cmp, row, discType) {
        cmp.set("v.quoteItemRec", row);

        cmp.set("v.recurringType", discType); //mrc or nrc disc type
        cmp.set("v.openAdjustmentModal", true);     
    }
});