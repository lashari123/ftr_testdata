({
    getRecordType: function(recordTypeId, cmp) {
        var recId = cmp.get("v.recordId");
        console.log('recId-manq'+recId);
        var action = cmp.get("c.getRecordType");

        action.setParams({
            'recordTypeId' : recordTypeId
        });
        
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                var recordTypeName = response.getReturnValue();
                cmp.set("v.recordTypeName", recordTypeName);
                    var oppId = location.search.match(/lkid%3D(.*?)%26/)[1];
                    console.log('oppId-manq'+oppId);
                    cmp.set("v.opportunityId", oppId);
                if (recordTypeName === 'SFA') {
                     cmp.set("v.currentScreen", 'Address Selector');
                     var addrCmp = cmp.find("addrSelector");
                    addrCmp.loadAddresses(oppId);
                    var today = new Date();
                    cmp.set('v.expDate', today.getFullYear() + "-" + (today.getMonth() + 1) + "-" + today.getDate());
                }
            }
        });
        
     	$A.enqueueAction(action);

    },
    
    getOpportunityId: function(cmp,event) {
        // return the value between lkid%3D and %26
        return location.search.match(/lkid%3D(.*?)%26/)[1];
    },
    
    saveQuote: function(cmp) {
        var action = cmp.get("c.createSfaQuote");
        var products = cmp.get('v.selectedProducts');
        var address = cmp.get('v.selectedAddress');
        var quoteName = cmp.get('v.quoteName');
        var expDate = cmp.get('v.expDate');
        var oppId = cmp.get('v.opportunityId');
        var data = {
            "products" 			: products,
            "street"			: address && address.street,
            "city"				: address && address.city,
            "state"				: address && address.state,
            "postalCode"		: address && address.postalCode,
            "name"				: quoteName,
            "expirationDate"	: expDate,
            "opportunityId"		: oppId
        }
        
        console.log('address && address.street :'+  address && address.street);
        action.setParams({
            "quoteData" : data
        });
        
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                window.location.href = '/' + oppId;
            } else {
                var errors = response.getError(); 
                console.log('error is :'+errors[0].message);
            }
        });
        
     	$A.enqueueAction(action);
    }
});