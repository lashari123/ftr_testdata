({
    myAction : function(component, event, helper) {
        
    },
    init: function (cmp, event, helper) {
        var actions = [
            { label: 'Show details', name: 'show_details' },
            { label: 'Delete', name: 'delete' }
        ],
            fetchData = {
                name : 'company.companyName',
                author: 'name.findName',
                published : 'address.state'
            };
        
		//wrapText: true,
        cmp.set('v.columns', [
            { label: 'Product Name', fieldName: 'Description__c', type: 'text', wrapText: true, initialWidth: 200},
            { label: 'Circuit Type', fieldName: 'circuitType__c', type: 'text', wrapText: true, initialWidth: 100},
            { label: 'Quantity', fieldName: 'Quantity__c', type: 'text', wrapText: true, initialWidth: 75},
            { label: 'Term', fieldName: 'Display_Term__c', type: 'text', wrapText: true, initialWidth: 75},
            //{ label: 'MRC', fieldName: 'StandardMRC__c', type:'button',  typeAttributes:{value: {fieldName: 'StandardMRC__c'},label: {fieldName: 'StandardMRC__c'},title: {fieldName: 'StandardMRC__c'},variant: 'base',name:'mrcAction', rowActions: actions}, wrapText: true, initialWidth: 100},
            { label: 'MRC', fieldName: 'Display_MRC__c', type:'button',  typeAttributes:{value: {fieldName: 'Display_MRC__c'},label: {fieldName: 'Display_MRC__c'},title: {fieldName: 'Display_MRC__c'},variant: 'base',name:'mrcAction', rowActions: actions}, wrapText: true, initialWidth: 100},
            
           { label: 'Adjusted MRC', fieldName: 'AdjustedMRC__c', type: 'currency', wrapText: true, initialWidth: 100},
            
            //{ label: 'NRC', fieldName: 'StandardNRC__c', type: 'currency', wrapText: true, initialWidth: 100},
             { label: 'NRC', fieldName: 'Display_NRC__c', type:'button',  typeAttributes:{value: {fieldName: 'Display_NRC__c'},label: {fieldName: 'Display_NRC__c'},title: {fieldName: 'Display_NRC__c'},variant: 'base',name:'nrcAction', rowActions: actions}, wrapText: true, initialWidth: 100},
            { label: 'Adjusted NRC', fieldName: 'AdjustedNRC__c', type: 'currency', wrapText: true, initialWidth: 100},
            { label: 'Max QOS', fieldName: 'Max_QOS__c', type: 'text', wrapText: true, initialWidth: 140},
            { label: 'Max Speed', fieldName: 'DSAT_Max_Speed__c', type: 'text', wrapText: true, initialWidth: 75},
            { label: 'Copper Tier', fieldName: 'DSAT_Copper_Tier__c', type: 'text', wrapText: true, initialWidth: 75},
            { label: 'Fiber Tier', fieldName: 'DSAT_Fiber_Tier__c', type: 'text', wrapText: true, initialWidth: 75},
            { label: 'BDT Required', fieldName: 'BDT_Required__c', type: 'text', wrapText: true,initialWidth: 75},
            { label: 'CVD Rate Tier', fieldName: 'cvdPriceTier__c', type: 'text', wrapText: true, initialWidth: 75},
            { label: 'CVD Pnum', fieldName: 'PNum__c', type: 'text', wrapText: true, initialWidth: 150},
            { label: 'CVD Source', fieldName: 'cvdratesource__c', type: 'text', wrapText: true, initialWidth: 125},
            { type: 'action', typeAttributes: {rowActions: actions} }
        ]);
        
        
        helper.getQuoteItems(cmp, event, helper);
    },
    
    handleRowAction: function (cmp, event, helper) {
        console.log('event action name: ' + event);
        //console.log('event row name:' + event.row.name);
        
        var action = event.getParam('action');
        var row = event.getParam('row');
        console.log('row: ' + row);
        switch (action.name) {
            case 'show_details':
                helper.navigate(row.Id);
                break;
            case 'delete':
                helper.removeItem(cmp, row);
                break;
        	case 'mrcAction':
                helper.showDiscountPopup(cmp, row, "MRC");
                break;
        	case 'nrcAction':
                helper.showDiscountPopup(cmp, row, "NRC");
                break;

        }
    },
    
    
})