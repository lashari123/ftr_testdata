({
    init: function (cmp, event, helper) {
        cmp.set('v.columns', [
            {label: 'Type', fieldName: 'category', type: 'text'},
            {label: 'Address', fieldName: 'formatted', type: 'text'}
        ]);
    },
    
    loadAddresses: function(cmp, event) {
        let params = event.getParam('arguments');
        let opportunityId = params.opportunityId;
		var action = cmp.get("c.getAddresses");
        
        action.setParams({
            'oppId' : opportunityId,
        });
        
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                var res = response.getReturnValue();
                cmp.set("v.addresses", res);
            }
        });
        
     	$A.enqueueAction(action);
    },

    updateSelectedAddress: function (cmp, event) {
        var selectedRows = event.getParam("selectedRows");
        cmp.set("v.selected", selectedRows);
    },
    
    getSelectedAddress: function(cmp, event, helper){
        return cmp.get('v.selected');
    }
})