({
	getContact: function(component, event, value, fields){
        if(value != "" && !component.get("v.isLoading")) {
            component.set("v.isLoading", true);
            var action = component.get("c.getContactById");
            action.setParams({ contactId : value});
            action.setCallback(this, function(response) {
                
                var contact = response.getReturnValue();
                var ticketInfo = component.get("v.ticketInfo");
                
                if(ticketInfo[fields[0]] == undefined || ticketInfo[fields[0]] == "") ticketInfo[fields[0]] = contact.Email;
                if(ticketInfo[fields[1]] == undefined || ticketInfo[fields[1]] == "") ticketInfo[fields[1]] = contact.Phone;
                //ticketInfo[fields[2]] = value;
                component.set("v.ticketInfo", ticketInfo);
				component.set("v.isLoading", false);
                
                
            });
        
        	$A.enqueueAction(action); 
        }
    },
})