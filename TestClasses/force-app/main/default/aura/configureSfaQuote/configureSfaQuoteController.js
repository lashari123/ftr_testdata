({
    init: function (cmp, event, helper) {
        const actions = [
            {label: 'None', name: 'none'},
            {label: 'BDT', name: 'BDT'},
            {label: 'CTR', name: 'CTR'},
            {label: 'ICB', name: 'ICB'},
            {label: 'None', name: 'none'},
        ];
            
        cmp.set('v.columns', [
            {label: 'Product Name', fieldName: 'name', type: 'text'},
            {label: 'Quantity', fieldName: 'quantity', type: 'number', editable: true, cellAttributes: { alignment: 'left' }},
            {label: 'Term (Months)', fieldName: 'term', type: 'number', editable: true, cellAttributes: { alignment: 'left' }},
            {label: 'Net New MRR', fieldName: 'netNewMrr', type: 'currency', editable: true, cellAttributes: { alignment: 'left' }},
            {label: 'Renewal MRR', fieldName: 'renewalMrr', type: 'currency', editable: true, cellAttributes: { alignment: 'left' }},
            {label: 'NRC', fieldName: 'nrc', type: 'currency', editable: true, cellAttributes: { alignment: 'left' }},
            {label: 'CPE', fieldName: 'cpe', type: 'currency', editable: true, cellAttributes: { alignment: 'left' }},
            {label: 'CPE Gross Margin %', fieldName: 'cpeGrossMargin', type: 'percent', editable: true, cellAttributes: { alignment: 'left' }},
            {label: 'Discount Type', fieldName: 'discountType', type: 'text', fixedWidth: 130 },
            {type: 'action', typeAttributes: { rowActions: actions }}
        ]);
    },
    
    handleSave: function (cmp, event, helper) {
        let draftValues = event.getParam('draftValues');
        let products = cmp.get('v.products');
        draftValues.forEach(function(draftValue){
            products.forEach(function(product){
                if (draftValue.Id === product.Id) {
                    let draftKeys = Object.keys(draftValue);
                    draftKeys.forEach(function(draftKey) {
                        if (draftKey != 'Id') {
                            product[draftKey] = draftValue[draftKey];
                        }
                    });
                }
            });
        });
        cmp.set('v.products', products);
        console.log(products);
    },
    
    handleRowAction: function (cmp, event, helper) {
        let actionName = event.getParam('action').name;
        let row = event.getParam('row');
        let products = cmp.get('v.products');
        let rowIndex = products.indexOf(row);
        products[rowIndex].discountType = actionName;
        cmp.set('v.products', products);
    }
})