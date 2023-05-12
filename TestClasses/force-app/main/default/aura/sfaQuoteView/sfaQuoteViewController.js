({
    init: function (cmp, event, helper) {
        helper.getQuoteItems(cmp);
    },

    showProductSelector: function (cmp, event, helper) {
        cmp.set('v.productSelectorShown', true);
    },

    hideProductSelector: function (cmp, event, helper) {
        cmp.set('v.productSelectorShown', false);
    },

    addSelectedProducts: function(cmp, event, helper) {
        var quoteItems = cmp.get('v.quoteItems');
        var selected = cmp.get('v.selectedProducts');
        var numItems = quoteItems.length;
        selected.forEach(function(s) {
            var found = false;
            for (var i = 0; i < numItems; i++) {
                if (quoteItems[i].id === s.Id) {
                    found = true;
                    break;
                }
            }
            if (!found) {
                quoteItems.push(s);
            }
        });
        cmp.set('v.quoteItems', quoteItems);
        cmp.set('v.productSelectorShown', false);
    },
    
    saveQuote: function(cmp, event, helper) {
        helper.saveQuote(cmp, event);
    }

})