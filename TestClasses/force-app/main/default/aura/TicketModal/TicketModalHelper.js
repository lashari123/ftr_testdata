({
	toggleEditMode: function(component, event, helper, tabchange) {
        component.set("v.isEditMode", tabchange? false : !component.get("v.isEditMode"));
        if(component.get("v.isEditMode")) {
            component.set("v.dis", component.get("v.is24x7"));
        } else {
            component.set("v.dis", true);
        }
    },
    
})