({
    fetchData: function (cmp, numRecords, pageNumber, filter) {
		var action = cmp.get("c.getProducts");
        action.setParams({
            'numRecords' : numRecords,
            'pageNumber' : pageNumber,
            'filter'	 : filter
        });
        
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                var res = response.getReturnValue();
                cmp.set("v.products", res.currentProducts);
                cmp.set("v.numPages", Math.floor(res.totalProducts / numRecords));
            }
            cmp.set('v.selected', ["01tE0000008EGSaIAO"]);
        });
        
     	$A.enqueueAction(action);
    },

    setSelected: function(currentlySelected) {
        // let selectedIds;
        // if (currentlySelected) {
        //     selectedIds = currentlySelected.map(p => p.Id);
        // }
        // if (selectedIds) {
        //     let selector = cmp.find('selector');
        //     selector.set('v.selectedRows', currentlySelected);
        // }
}
});