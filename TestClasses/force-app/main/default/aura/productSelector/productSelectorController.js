({
    init: function (cmp, event, helper) {
        cmp.set('v.columns', [
            {label: 'Product Name', fieldName: 'name', type: 'text'},
            {label: 'Product Category', fieldName: 'family', type: 'text'}
        ]);

        helper.fetchData(cmp, cmp.get("v.numRecords"), cmp.get("v.pageNum"), null);
    },

    updateSelectedProducts: function (cmp, event) {
        var selectedRows = event.getParam("selectedRows");
        cmp.set("v.selected", selectedRows);
    },
    
    filter: function(cmp, event, helper) {
        helper.fetchData(cmp, cmp.get("v.numRecords"), cmp.get("v.pageNum"), cmp.get("v.filter"));
    },
    
    navigate: function(cmp, event, helper) {
        var page = cmp.get("v.pageNum") || 1;
        var direction = event.getSource().get("v.label");
        page = direction === "Previous Page" ? (page - 1) : (page + 1);
        helper.fetchData(cmp, cmp.get("v.numRecords"), page, cmp.get("v.filter"));
        cmp.set("v.pageNum", page);
   },
    
    getSelectedProducts: function(cmp, event, helper){
        return cmp.get('v.selected');
    },

    setSelectedProducts: function(cmp, event, helper) {
        /*let selector = cmp.find('selector');
        let initProducts = cmp.get('v.initialProducts');
        console.log(initProducts);
        let initIds = initProducts.map(p => p.Id);
        console.log(initIds);
        selector.set('v.selectedRows', initIds);*/
    }
});