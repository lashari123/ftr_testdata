({
    sendHelper: function(component, getEmail,attach,name,subject,ownerName,year,emailbody) {
        debugger
        // call the server side controller method 	
        var recordId = component.get("v.recordId");
        var action = component.get("c.sendMailMethod");
        // set the 3 params to sendMailMethod method   
        action.setParams({
            'mMail': getEmail,
            //'mSubject': getSubject,
            // 'mbody': getbody,
            'mAttach': attach,
            'recordId':recordId,
            'name' : name,
            'subject' : subject,
            'ownerName' : ownerName,
            'year' : year,
            'emailbody' : emailbody
        });
        action.setCallback(this, function(response) {
            debugger
            var state = response.getState();
            if (state === "SUCCESS") {
                var storeResponse = response.getReturnValue();
                // if state of server response is comes "SUCCESS",
                // display the success message box by set mailStatus attribute to true
                component.set("v.mailStatus", true);
               
            }
            
        });
        $A.enqueueAction(action);
    },
})