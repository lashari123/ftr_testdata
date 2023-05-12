({
	
    init1 : function(component, event, helper) {
		helper.getAddresses(component, event, helper);
	},    
    
	closeModel: function(component, event, helper) {   
      component.set("v.isModalOpen", false);
	},
 
	submit: function(component, event, helper) {
       helper.reDirectToSterling(component, event, helper);
    },
})