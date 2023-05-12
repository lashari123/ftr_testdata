({
	getQuoteItems : function(cmp) {
		var action = cmp.get("c.getQuoteItems");

		action.setParams({
            "quoteId" : cmp.get('v.recordId')
        });
        
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
				var res = response.getReturnValue();
				cmp.set('v.quoteItems', res);
				var productSelector = cmp.find('prodSelector');
				productSelector.setSelectedProducts();
            } else {
                console.log('error');
            }
        });
        
     	$A.enqueueAction(action);
	},

    saveQuote: function(cmp, event) {
		event.preventDefault();
        var action = cmp.get("c.updateSfaQuote");
		var products = cmp.get('v.selectedProducts');
		var quoteFields = event.fields;
        console.log('quoteFields.name'+quoteFields.name);
        var data = {
            "products" 			: products,
            "name"				: quoteFields.name,
            "expirationDate"	: quoteFields.expirationDate,
			"opportunityId"		: quoteFields.opportunityId,
			"id"				: cmp.get('v.recordId')
        }

        action.setParams({
            "quoteData" : data
        });
        
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                window.location.href = '/' + oppId;
            } else {
                console.log('error');
            }
        });
        
     	//$A.enqueueAction(action);
    }
})