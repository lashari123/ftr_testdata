({
    init: function (cmp, event, helper) {
        let recordTypeId = cmp.get("v.pageReference").state.recordTypeId;
        var recId = cmp.get("v.recordId");
		helper.getRecordType(recordTypeId, cmp);
    },
    
    goNext: function(cmp, event, helper) {
        let recordTypeName = cmp.get("v.recordTypeName");
        let currentScreen = cmp.get("v.currentScreen");
        if (recordTypeName === 'SFA'){
            switch (currentScreen) {
                case 'Address Selector':
                    let addrCmp = cmp.find("addrSelector");
                    let selectedAddress = addrCmp.getSelectedAddress();
                    console.log('man-seladdr'+ selectedAddress);
                    cmp.set('v.selectedAddress', selectedAddress);
                    document.getElementById("addressSelectorDiv").style.display = 'none';
                    document.getElementById("productSelectorDiv").style.display = 'block';
                    cmp.set("v.currentScreen", 'Product Selector');
                    break;
                case 'Product Selector':
                    let prodCmp = cmp.find("prodSelector");
                    let selectedProducts = prodCmp.getSelectedProducts();
                    cmp.set('v.selectedProducts', selectedProducts);
                     console.log('manu'+ selectedProducts);
                    document.getElementById("configureSfaQuoteDiv").style.display = 'block';
                    document.getElementById("productSelectorDiv").style.display = 'none';
                    cmp.set("v.currentScreen", 'Configure Quote');
                    break;
                case 'Configure Quote':
                    document.getElementById("configureSfaQuoteDiv").style.display = 'none';
                    document.getElementById("finalSfaQuoteDiv").style.display = 'block';
                     console.log('in confiquire quote');
                    cmp.set("v.currentScreen", 'Finalize Quote');
                    break;
                case 'Finalize Quote':
                    console.log('in finalize quote');
                    helper.saveQuote(cmp);
                    break;
            }
        } else {
            // go to sterling 9
        }
    },
    
    goPrev: function(cmp, event, helper) {
        let currentScreen = cmp.get("v.currentScreen");
        switch (currentScreen) {
            case 'Product Selector': 
                document.getElementById("addressSelectorDiv").style.display = 'block';
                document.getElementById("productSelectorDiv").style.display = 'none';
                cmp.set("v.currentScreen", 'Address Selector');
                break;
            case 'Configure Quote': 
                document.getElementById("configureSfaQuoteDiv").style.display = 'none';
                document.getElementById("productSelectorDiv").style.display = 'block';
                cmp.set("v.currentScreen", 'Product Selector');
                break;
        }
    }
});