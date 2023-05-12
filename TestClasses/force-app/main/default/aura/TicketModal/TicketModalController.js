({
    doInit: function(component, event, helper) {
        var tkt = component.get("v.ticketInfo");
        
        if(tkt.Status__c == 'Closed' || tkt.Status__c == 'Cancelled'){
            component.set('v.showNotesTab',true);
            component.set("v.disableNoteDescription", true);
            component.set("v.noteDescriptionRequired", false);
            component.set("v.disableNoteDescriptionButton", true);
        }
        
        component.set("v.showPreferredMethod", (component.get('v.ticketInfo').Send_update__c == 'Yes'));
        
        var action = component.get("c.getDPITicketStatus");
        if (!component.get("v.ticketInfo").Customer_Ticket_Number__c.includes("OP")) {
            // alert(component.get('v.ticketInfo').Customer_Ticket_Number__c)
            action.setParams({
                recId: component.get("v.ticketInfo").Id
            });
            action.setCallback(this, function(response) {
                if (response.getState() === "SUCCESS") {
                    // alert(response.getReturnValue())
                    if (response.getReturnValue() == 0) {
                        component.set("v.selectedStage", "0");
                    }
                    if (
                        response.getReturnValue() == "CC" ||
                        response.getReturnValue() == "DIS" ||
                        response.getReturnValue() == "IXC" ||
                        response.getReturnValue() == "NOA" ||
                        response.getReturnValue() == "TC" ||
                        response.getReturnValue() == "UAS"
                    ) {
                        component.set("v.selectedStage", "1");
                    }
                    if (
                        response.getReturnValue() == "CAN" ||
                        response.getReturnValue() == "Y"
                    ) {
                        component.set("v.selectedStage", "3");
                        component.set("v.editDone", true);
                    }
                    if (
                        response.getReturnValue() == "END" ||
                        response.getReturnValue() == "COM"
                    ) {
                        component.set("v.selectedStage", "2");
                    }
                    component.set("v.steps", [
                        { label: "Open", value: "0" },
                        { label: "Assigned", value: "1" },
                        { label: "Resolved", value: "2" },
                        { label: "Cancelled", value: "3" }
                    ]);
                }
            });
            $A.enqueueAction(action);
        } else {
            component.set("v.editDone", ((tkt.Status__c && tkt.Status__c == 'Closed') ||(tkt.Status__c && tkt.Status__c == 'Cancelled')));
        }
        if (
            component.get("v.ticketInfo").Escalate_Time_Stamp__c != null &&
            component.get("v.ticketInfo").Escalate_Time_Stamp__c != "" &&
            component.get("v.ticketInfo").Escalate_Time_Stamp__c != "undefined"
        ) {
            component.set("v.label", "Escalated");
            component.set("v.showButton", true);
        }
        
        var time = [{value:'12:00 AM', label:'12:00 AM'},{value:'12:15 AM', label:'12:15 AM'},{value:'12:30 AM', label:'12:30 AM'},{value:'12:45 AM', label:'12:45 AM'},
                    {value:'01:00 AM', label:'01:00 AM'},{value:'01:15 AM', label:'01:15 AM'},{value:'01:30 AM', label:'01:30 AM'},{value:'01:45 AM', label:'01:45 AM'},
                    {value:'02:00 AM', label:'02:00 AM'},{value:'02:15 AM', label:'02:15 AM'},{value:'02:30 AM', label:'02:30 AM'},{value:'02:45 AM', label:'02:45 AM'},
                    {value:'03:00 AM', label:'03:00 AM'},{value:'03:15 AM', label:'03:15 AM'},{value:'03:30 AM', label:'03:30 AM'},{value:'03:45 AM', label:'03:45 AM'},
                    {value:'04:00 AM', label:'04:00 AM'},{value:'04:15 AM', label:'04:15 AM'},{value:'04:30 AM', label:'04:30 AM'},{value:'04:45 AM', label:'04:45 AM'},
                    {value:'05:00 AM', label:'05:00 AM'},{value:'05:15 AM', label:'05:15 AM'},{value:'05:30 AM', label:'05:30 AM'},{value:'05:45 AM', label:'05:45 AM'},
                    {value:'06:00 AM', label:'06:00 AM'},{value:'06:15 AM', label:'06:15 AM'},{value:'06:30 AM', label:'06:30 AM'},{value:'06:45 AM', label:'06:45 AM'},
                    {value:'07:00 AM', label:'07:00 AM'},{value:'07:15 AM', label:'07:15 AM'},{value:'07:30 AM', label:'07:30 AM'},{value:'07:45 AM', label:'07:45 AM'},
                    {value:'08:00 AM', label:'08:00 AM'},{value:'08:15 AM', label:'08:15 AM'},{value:'08:30 AM', label:'08:30 AM'},{value:'08:45 AM', label:'08:45 AM'},
                    {value:'09:00 AM', label:'09:00 AM'},{value:'09:15 AM', label:'09:15 AM'},{value:'09:30 AM', label:'09:30 AM'},{value:'09:45 AM', label:'09:45 AM'},
                    {value:'10:00 AM', label:'10:00 AM'},{value:'10:15 AM', label:'10:15 AM'},{value:'10:30 AM', label:'10:30 AM'},{value:'10:45 AM', label:'10:45 AM'},
                    {value:'11:00 AM', label:'11:00 AM'},{value:'11:15 AM', label:'11:15 AM'},{value:'11:30 AM', label:'11:30 AM'},{value:'11:45 AM', label:'11:45 AM'},
                    {value:'12:00 PM', label:'12:00 PM'},{value:'12:15 PM', label:'12:15 PM'},{value:'12:30 PM', label:'12:30 PM'},{value:'12:45 PM', label:'12:45 PM'},
                    {value:'01:00 PM', label:'01:00 PM'},{value:'01:15 PM', label:'01:15 PM'},{value:'01:30 PM', label:'01:30 PM'},{value:'01:45 PM', label:'01:45 PM'},
                    {value:'02:00 PM', label:'02:00 PM'},{value:'02:15 PM', label:'02:15 PM'},{value:'02:30 PM', label:'02:30 PM'},{value:'02:45 PM', label:'02:45 PM'},
                    {value:'03:00 PM', label:'03:00 PM'},{value:'03:15 PM', label:'03:15 PM'},{value:'03:30 PM', label:'03:30 PM'},{value:'03:45 PM', label:'03:45 PM'},
                    {value:'04:00 PM', label:'04:00 PM'},{value:'04:15 PM', label:'04:15 PM'},{value:'04:30 PM', label:'04:30 PM'},{value:'04:45 PM', label:'04:45 PM'},
                    {value:'05:00 PM', label:'05:00 PM'},{value:'05:15 PM', label:'05:15 PM'},{value:'05:30 PM', label:'05:30 PM'},{value:'05:45 PM', label:'05:45 PM'},
                    {value:'06:00 PM', label:'06:00 PM'},{value:'06:15 PM', label:'06:15 PM'},{value:'06:30 PM', label:'06:30 PM'},{value:'06:45 PM', label:'06:45 PM'},
                    {value:'07:00 PM', label:'07:00 PM'},{value:'07:15 PM', label:'07:15 PM'},{value:'07:30 PM', label:'07:30 PM'},{value:'07:45 PM', label:'07:45 PM'},
                    {value:'08:00 PM', label:'08:00 PM'},{value:'08:15 PM', label:'08:15 PM'},{value:'08:30 PM', label:'08:30 PM'},{value:'08:45 PM', label:'08:45 PM'},
                    {value:'09:00 PM', label:'09:00 PM'},{value:'09:15 PM', label:'09:15 PM'},{value:'09:30 PM', label:'09:30 PM'},{value:'09:45 PM', label:'09:45 PM'},
                    {value:'10:00 PM', label:'10:00 PM'},{value:'10:15 PM', label:'10:15 PM'},{value:'10:30 PM', label:'10:30 PM'},{value:'10:45 PM', label:'10:45 PM'},
                    {value:'11:00 PM', label:'11:00 PM'},{value:'11:15 PM', label:'11:15 PM'},{value:'11:30 PM', label:'11:30 PM'},{value:'11:45 PM', label:'11:45 PM'}
                   ];
        component.set('v.preferredStartTimeLst', time);
        component.set('v.preferredEndTimeLst', time);
        component.set('v.alternateStartTimeLst', time);
        component.set('v.alternateEndTimeLst', time);
        
        var action1 = component.get("c.getAccessHours");
        action1.setParams({
            recId: component.get("v.ticketInfo").Id
        });
        action1.setCallback(this, function(result) {
            let returnValue = result.getReturnValue();
           
            let is24x7 = (returnValue.Access_Hours__c == '7 by 24');
            component.set("v.is24x7", is24x7);
            component.set("v.dis", true);
            component.set("v.accessHours",returnValue.Access_Hours__c);
            /*
            var sendUpdateValue = cmp.find("Send_update__c").get("v.value");
            if (sendUpdateValue == 'Yes'){
            	component.set("v.showPreferredMethod", true);
            }else{
                component.set("v.showPreferredMethod", false);
            }
            
            if(!is24x7) {
                let vals = returnValue.Access_Hours__c.split("\n");
                for(let i=0; i<vals.length; i++) {
                    if(vals[i].indexOf("Preferred Start Time") > -1) {
                        let v = vals[i].split(": ");
                        component.set("v.preferredStartTime", v[1]);
                    }
                    if(vals[i].indexOf("Preferred End Time") > -1) {
                        let v = vals[i].split(": ");
                        component.set("v.preferredEndTime", v[1]);
                    }
                    if(vals[i].indexOf("Preferred Days") > -1) {
                        let v = vals[i].split(": ");
                        component.set("v.preSun", v[1].indexOf("Sunday") > -1);
                        component.set("v.preMon", v[1].indexOf("Monday") > -1);
                        component.set("v.preTue", v[1].indexOf("Tuesday") > -1);
                        component.set("v.preWed", v[1].indexOf("Wednesday") > -1);
                        component.set("v.preThr", v[1].indexOf("Thursday") > -1);
                        component.set("v.preFri", v[1].indexOf("Friday") > -1);
                        component.set("v.preSat", v[1].indexOf("Saturday") > -1);
                    }
                        
                    if(vals[i].indexOf("Alternate Start Time") > -1) {
                        let v = vals[i].split(": ");
                        component.set("v.alternateStartTime", v[1]);
                    }
                    if(vals[i].indexOf("Alternate End Time") > -1) {
                        let v = vals[i].split(": ");
                        component.set("v.alternateEndTime", v[1]);  
                    }
                    if(vals[i].indexOf("Alternate Days") > -1) {
                        let v = vals[i].split(": ");
                        component.set("v.altSun", v[1].indexOf("Sunday") > -1);
                        component.set("v.altMon", v[1].indexOf("Monday") > -1);
                        component.set("v.altTue", v[1].indexOf("Tuesday") > -1);
                        component.set("v.altWed", v[1].indexOf("Wednesday") > -1);
                        component.set("v.altThr", v[1].indexOf("Thursday") > -1);
                        component.set("v.altFri", v[1].indexOf("Friday") > -1);
                        component.set("v.altSat", v[1].indexOf("Saturday") > -1);
                    }
                }
            }
            */
        });
        $A.enqueueAction(action1);   
        
        
        // var hours = moment().diff(moment((component.get('v.ticketInfo').Escalate_Time_Stamp__c)), 'hours');
        // alert(JSON.stringify(component.get('v.ticketInfo')))
        //  var rec= component.get('v.ticketInfo');
        // alert(dt-rec.Escalate_Time_Stamp__c)
        // alert(hours)
        // component.set("v.activeSections",[]);
    },
    openModel: function(component, event, helper) {
        // Set isModalOpen attribute to true
        component.set("v.isModalOpen", true);
        component.set("v.escalated", false);
        alert("open");
    },
    
    toggleEditMode: function(component, event, helper) {
        
        helper.toggleEditMode(component, event, helper, false);
         var action = component.get('c.setcontactmethod');
        $A.enqueueAction(action);
        
    },
    
    onSendUpdateChange: function(component, event, helper) {
        let val = component.find("Send_update__c").get("v.value");
        component.set("v.showPreferredMethod", (val == "Yes"));
        if(val == 'Yes')
        {
           // component.find("Preferred_Contact_method__c").set("v.value", "");
               var emailUpdate=  component.find("Local_Contact_Email2__c").get("v.value");
            if(emailUpdate == null || emailUpdate == '' || emailUpdate == undefined){
                component.set("v.makeLCEmailRq",true);
               var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    title: "Error!",
                    message: "Please Enter Local Contact Email",
                    type: "error",
                    duration: 5000
                });
                toastEvent.fire();
                return;
            }
        }else{
            component.set("v.makeLCEmailRq",false);
        }
    },
    
     handleKeyup:function(component, event, helper){
    	
        var escReason = component.get('v.reasons');
         var noteDesc = component.get('v.description');
        component.set('v.descSpecialChar',false);
         component.set('v.noteSpecialChar',false);
        var filter = /[^a-zA-Z0-9_\.\,\ \-]/;
        if (filter.test(escReason) ) {
            component.set('v.descSpecialChar',true);    
        }
         if(filter.test(noteDesc)){
            component.set ('v.noteSpecialChar', true);
         }
	},
    
    sendRpbyEmailUpdate:function(component, event, helper){
        var rpbySendUpdate = component.find("Reported_By_Send_Update__c").get("v.value");
        if(rpbySendUpdate == "Yes"){
           var rpyEmailUpdate =  component.find("Reported_By_Email__c").get("v.value");
             if(rpyEmailUpdate == null || rpyEmailUpdate == '' || rpyEmailUpdate == undefined){
                 component.set("v.makeRptByEmailRq",true);
               var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    title: "Error!",
                    message: "Please Enter Reported By Email",
                    type: "error",
                    duration: 5000
                });
                toastEvent.fire();
                return;
            }
        }else{
            component.set("v.makeRptByEmailRq",false);
        }
    },
    
    closeModel: function(component, event, helper) {
        // Set isModalOpen attribute to false
        // alert(event.getSource().get("v.label"));
        var butnLabel = event.getSource().get("v.label");
        
        if (butnLabel == "Submit Notes") {
        /*   try{
            var allValid = component
            .find("field")
            .reduce(function(validSoFar, inputCmp) {
                inputCmp.reportValidity();
                return validSoFar && inputCmp.checkValidity();
            }, true);
            }
            catch(err) { 
                console.log('$$'+err.message);
            }*/
             var desc3 = component.get("v.description");
         //   var allValid =
            if (desc3 != null && desc3!='') {
               // var sub = component.get("v.sub");
                var desc = component.get("v.description");
                var ticketRec = component.get("v.ticketInfo");
                var action = component.get("c.createNotes");
                action.setParams({
                   // sub: sub,
                    description: desc,
                    recId: ticketRec.Id
                });
                action.setCallback(this, function(result) {
                    var returnValue = result.getReturnValue();
                    var Cflag = component.get('v.updateChild');
                    component.set('v.updateChild',!Cflag);
                    var toastEvent = $A.get("e.force:showToast");
                    toastEvent.setParams({
                        title: "Success!",
                        type: "Success",
                        message: "Notes Created Successfully"
                    });
                    toastEvent.fire();
                   // component.set("v.sub",'');
                    component.set("v.description",'');
                    
                    // component.set("v.isModalOpen", false);
                    //component.set('v.openTicketModel', false);
                });
                $A.enqueueAction(action);
            }
            else{
                 var toastEvent = $A.get("e.force:showToast");
                    toastEvent.setParams({
                        title: "Error!",
                        type: "Error",
                        message: "Required Fields are Missing"
                    });
                    toastEvent.fire();
            }
        } else if (butnLabel == "Save Contacts") {
            component.set("v.errorPhoneFields", "");
            component.set("v.errorNameFields", "");
            var ticketRec = component.get("v.ticketInfo");
            console.info(ticketRec);
            let isError = false;
            let isEmailError = false;
            let isPhoneError = false;
            let errorFields = [];
            let nameFields = [];
            for (var i = 1; i <= 8; i++) {
                if (
                    (((ticketRec["Additional_Contact_Name_" + i + "__c"] != "" || ticketRec["Additional_Contact_Name_Text_" + i + "__c"] != "") &&
                      (ticketRec["Additional_Contact_Name_" + i + "__c"] != undefined || ticketRec["Additional_Contact_Name_Text_" + i + "__c"] != undefined)) ||
                     //(ticketRec["Additional_Contact_Email_" + i + "__c"] != "" && ticketRec["Additional_Contact_Email_" + i + "__c"] != undefined) ||
                     (ticketRec["Additional_Contact_Phone_" + i + "__c"] != "" && ticketRec["Additional_Contact_Phone_" + i + "__c"] != undefined) || 
                     (ticketRec["Send_update_" + i + "__c"] != "" && ticketRec["Send_update_" + i + "__c"] != undefined)  
                     
                    ) &&
                    (((ticketRec["Additional_Contact_Name_" + i + "__c"] == "" && ticketRec["Additional_Contact_Name_Text_" + i + "__c"] == "") ||
                      (ticketRec["Additional_Contact_Name_" + i + "__c"] == undefined && ticketRec["Additional_Contact_Name_Text_" + i + "__c"] == undefined)) ||
                     //(ticketRec["Additional_Contact_Email_" + i + "__c"] == "" || ticketRec["Additional_Contact_Email_" + i + "__c"] == undefined) ||
                     (ticketRec["Send_update_" + i + "__c"] == "Yes" && (ticketRec["Additional_Contact_Phone_" + i + "__c"] == "" || ticketRec["Additional_Contact_Phone_" + i + "__c"] == undefined)) || 
                     (ticketRec["Send_update_" + i + "__c"] == "" || ticketRec["Send_update_" + i + "__c"] == undefined))               
                ) {
                    isError = true;
                    if(ticketRec["Send_update_" + i + "__c"] == "Yes" && (ticketRec["Additional_Contact_Phone_" + i + "__c"] == "" || ticketRec["Additional_Contact_Phone_" + i + "__c"] == undefined)) {
                        errorFields.push("phone"+i);
                    }
                    if(((ticketRec["Additional_Contact_Name_" + i + "__c"] == "" && ticketRec["Additional_Contact_Name_Text_" + i + "__c"] == "") ||
                      (ticketRec["Additional_Contact_Name_" + i + "__c"] == undefined && ticketRec["Additional_Contact_Name_Text_" + i + "__c"] == undefined))
                     ) {
                        nameFields.push("name"+i);
                    }
                }
                
                if(!isEmailError && (ticketRec["Additional_Contact_Email_" + i + "__c"] != "" &&
                      ticketRec["Additional_Contact_Email_" + i + "__c"] != undefined)) {
                    const re = /\S+@\S+\.\S+/;
                    isEmailError = !re.test(ticketRec["Additional_Contact_Email_" + i + "__c"]);
                }
                
                if(!isPhoneError && (ticketRec["Additional_Contact_Phone_" + i + "__c"] != "" &&
                      ticketRec["Additional_Contact_Phone_" + i + "__c"] != undefined)) {
                    const re = /^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/;
                    isPhoneError = !re.test(ticketRec["Additional_Contact_Phone_" + i + "__c"]);
                }
                
            }
            
            component.set("v.errorPhoneFields", errorFields.join(","));
            component.set("v.errorNameFields", nameFields.join(","));
            
            if (isError || isEmailError || isPhoneError) {
                let msg = '';
                if(isError) msg += "Please provide all details.";
                if(isEmailError) msg += "Please verify email address is correct.";
                if(isPhoneError) msg += "Please verify phone number is correct.";
                var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    title: "Error!",
                    message: msg,
                    type: "error",
                    duration: 5000
                });
                toastEvent.fire();
                return;
            }
            var action = component.get("c.updateRemedyTicket");
            action.setParams({
                rt: ticketRec
            });
            action.setCallback(this, function(response) {
                if (response.getState() === "SUCCESS") {
                    var res = JSON.parse(response.getReturnValue());
                    if (!res.hasError) {
                        component.set("v.reasons", "");
                        var toastEvent = $A.get("e.force:showToast");
                        toastEvent.setParams({
                            title: "Success!",
                            message: "Contacts Saved Successfully",
                            type: "success"
                        });
                        toastEvent.fire();
                        window.setTimeout(
                            $A.getCallback(function() {
                                //component.set("v.isModalOpen", false);
            					//component.set("v.openTicketModel", false);
                            }), 3000
                        );
                        
                        //window.location.reload();
                    } else {
                        var toastEvent = $A.get("e.force:showToast");
                        toastEvent.setParams({
                            title: "Error!",
                            message: res.errorMessage || 'Unable to save at this moment!',
                            type: "error"
                        });
                        toastEvent.fire();
                    }
                }
            });
            $A.enqueueAction(action);
            
        } else {
            component.set("v.isModalOpen", false);
            component.set("v.openTicketModel", false);
        }
    },
    senUpdateChange : function(component, event, helper){
        if(component.get('v.ticketInfo.Send_update__c') == 'Yes'){
            component.set('v.showPreferredMethod', true);
        }else {
            component.set('v.showPreferredMethod', false);
        }
    },
    onSubmit: function(cmp, event, helper) {
        event.preventDefault();
        event.stopPropagation();
        var email = cmp.get("v.ticketInfo.Local_Contact_Email2__c");
        var sendUpdateValue = cmp.get("v.ticketInfo.Send_update__c");
        var phone = cmp.get("v.ticketInfo.Local_Contact_Phone2__c");
        var lcTextNum = cmp.get("v.ticketInfo.LocalContactText__c");
        var lcTextSendUpdate = cmp.get("v.ticketInfo.Local_Text_Send_Updates__c");
        var rpbyEmail =  cmp.get("v.ticketInfo.Reported_By_Email__c");
        var rpByEmailSendUpdate= cmp.get("v.ticketInfo.Reported_By_Send_Update__c");
        var rpByTextNum = cmp.get("v.ticketInfo.Reported_By_Text_Number__c");
        var rpByTextSendUpdate= cmp.get("v.ticketInfo.Reported_By_Text_Send_Updates__c");
        var preferenceMethod =  cmp.find("Preferred_Contact_method__c").get("v.value") ;
        var isEmailError = false;
        var isPhoneError = false;
        var isReportedEmail = false;
        var preferredMethodError = false;
        let verifyEmail = false;
        let verifyText = false;
        let verifyEmailandText = false;
        let verifyEmailandPhone = false;
        let verifyPhone = false;
        var msg = '';
        if(email != ""){
            const re = /\S+@\S+\.\S+/;
        	isEmailError = !re.test(email);
        }
        
        if(phone != ""){
            const reP = /^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/;
       		 isPhoneError = !reP.test(phone);
        }
        
        if(rpbyEmail != ""){
             const reportedEmail = /\S+@\S+\.\S+/;
       		 isReportedEmail = !reportedEmail.test(email);
        }
               
                
        //var preferenceMethod = sendUpdateValue == 'Yes'? cmp.find("Preferred_Contact_method__c").get("v.value") : '';
       
        if(preferenceMethod == null || preferenceMethod == '') {
            preferredMethodError = true;
            $A.util.addClass(cmp.find("Preferred_Contact_method__c"), 'slds-has-error');
        }
       /* if((preferenceMethod == 'Email') || (preferenceMethod == 'Email and Phone') || (preferenceMethod == 'Email and Text')) {
            if((rpbyEmail == null || rpbyEmail == '' || rpbyEmail == undefined)&& (email == null || email == '' || email == undefined) ){
                isEmailError = true;
            }
        }*/
        
        if(preferenceMethod == "Email"){
            if((email == "" || email == undefined) && (rpbyEmail == "" || rpbyEmail == undefined)){
               verifyEmail = true;
                msg = "Please Enter Atleast One Email ID."
            }
            if((email != "" && email != undefined) || (rpbyEmail !="" && rpbyEmail != undefined)){
                if(rpByEmailSendUpdate == "No" && sendUpdateValue == "No"){
                    verifyEmail = true;
                    msg = "Please Select Atleast One Send Email Updates as Yes."
                }
            }
            
        }
        if(preferenceMethod == "Text"){
            
             if((lcTextNum != "" && lcTextNum != undefined  ) ||(rpByTextNum != "" && rpByTextNum != undefined  ) ){
                 if(lcTextSendUpdate == "No" && rpByTextSendUpdate == "No"){
                     verifyText = true;
                     msg = "Please Select Atleast One Send Text Updates as Yes."
                 }   
            }
            if((lcTextNum == "" || lcTextNum == undefined) && (rpByTextNum == "" || rpByTextNum == undefined) ){
                verifyText = true;
                msg = "Please Enter Atleast One Text Number."
            }
             if(((lcTextNum != "" && lcTextNum != undefined) && (rpByTextSendUpdate == "Yes")) && (rpByTextNum == "" || rpByTextNum == undefined) ){
               cmp.set("v.makeRptByTextRq",true);
                 verifyText = true;
                     msg = "Please Enter Reported By Text Number."
             }else if(((lcTextNum == "" || lcTextNum == undefined) && (lcTextSendUpdate == "Yes")) && (rpByTextNum != "" && rpByTextNum != undefined)){
                 cmp.set("v.makeLCTextRq",true);
                 verifyText = true;
                     msg = "Please Enter Local Contact Text Number."
             }
        }
        if(preferenceMethod == "Email and Text"){
            
          if((((email == "" || email == undefined) && (rpbyEmail == "" || rpbyEmail == undefined)) && 
                ((lcTextNum == "" || lcTextNum == undefined) && (rpByTextNum == "" || rpByTextNum == undefined) ) )){
                verifyEmailandText = true;
                msg ="Please Enter Atleast One Email ID and Text Number";
            }
              else if (((email != "" && email != undefined) || (rpbyEmail != "" && rpbyEmail != undefined)) &&
                       (((lcTextNum == "" || lcTextNum == undefined) && (rpByTextNum == "" || rpByTextNum == undefined)  ))){
                  verifyEmailandText = true;
                  msg ="Please Enter Atleast One Text Number";
              }
             else if  (((email == "" || email == undefined) && (rpbyEmail == "" || rpbyEmail == undefined)) &&
                      (((lcTextNum != "" && lcTextNum != undefined) || (rpByTextNum != "" && rpByTextNum != undefined)  ))){
                 verifyEmailandText = true;
                 msg ="Please Enter Atleast One Email ID";
             }
             if((lcTextNum != "" && lcTextNum != undefined  ) ||(rpByTextNum != "" && rpByTextNum != undefined  ) &&
                ((email != "" && email != undefined) || (rpbyEmail != "" && rpbyEmail != undefined))){
                 if((lcTextSendUpdate == "No" && rpByTextSendUpdate == "No") && (sendUpdateValue =="No" && rpByEmailSendUpdate == "No")){
                     verifyEmailandText = true;
                     msg = "Please Select Atleast One Send Email and One Text Updates as Yes."
                 }else if((lcTextSendUpdate == "Yes" || rpByTextSendUpdate == "Yes") && (sendUpdateValue =="No" && rpByEmailSendUpdate == "No")){
                     verifyEmailandText = true;
                     msg = "Please Select Atleast One Send Email Updates as Yes."
                 } else if((lcTextSendUpdate == "No" && rpByTextSendUpdate == "No") && (sendUpdateValue =="Yes" || rpByEmailSendUpdate == "Yes")){
                     verifyEmailandText = true;
                     msg = "Please Select Atleast One Send Text Updates as Yes."
                 }    
                 
            }
             if(((lcTextNum != "" && lcTextNum != undefined) && ( rpByTextSendUpdate == "Yes")) && (rpByTextNum == "" || rpByTextNum == undefined) ){
               cmp.set("v.makeRptByTextRq",true);
                 verifyEmailandText = true;
                     msg = "Please Enter Atleast One Reported By Text Number."
             }else if(((lcTextNum == "" || lcTextNum == undefined) && (lcTextSendUpdate == "Yes")) && (rpByTextNum != "" && rpByTextNum != undefined)){
                 cmp.set("v.makeLCTextRq",true);
                 verifyEmailandText = true;
                     msg = "Please Enter Atleast One Local Contact Text Number."
             }
        }
        if(preferenceMethod == "Email and Phone"){
            if(((email == "" || email == undefined) && (rpbyEmail == "" || rpbyEmail == undefined)) &&
              (phone == "" || phone == undefined)){
                 verifyEmailandPhone = true;
                 msg ="Please Enter Atleast One Email ID and Local Phone Number";
            }else if(((email == "" || email == undefined) && (rpbyEmail == "" || rpbyEmail == undefined)) &&
              ((phone != "" && phone != undefined))){
                  verifyEmailandPhone = true;
                  msg ="Please Enter Atleast One Email ID ";
             }
             if((email != "" && email != undefined) || (rpbyEmail != "" && rpbyEmail != undefined)){
                if(sendUpdateValue =="No" && rpByEmailSendUpdate == "No"){
                    verifyEmailandPhone = true;
                    msg = "Please Select Atleast One Send Email Updates as Yes."
                }
               
            }
        }
        if(preferenceMethod == "Phone"){
            if(phone == "" || phone == undefined ){
                 verifyPhone = true;
            }
        }
        if(isEmailError || isPhoneError || preferredMethodError || verifyEmail || verifyText || verifyEmailandText || verifyEmailandPhone || verifyPhone) {
            
            if(isEmailError) msg += 'Please Verify Local Contact Email id is correct.';
            if(isReportedEmail) msg += 'Please verify Reported By Email id is correct.';
            if(isPhoneError) msg += 'Please verify phone number is correct.';
            if(preferredMethodError) msg += 'Please provide preffered contact method.';     
           if(verifyEmail) msg ;
           if(verifyText) msg ;
           if(verifyEmailandText) msg;
           if(verifyEmailandPhone) msg ;
           if(verifyPhone) msg += "Please Enter Any Phone Number.";
            var toastEvent = $A.get("e.force:showToast");
            toastEvent.setParams({
                title: "Error!",
                message: msg,
                type: "error"
            });
            toastEvent.fire();
            return;
        }
        
        var isIntrusiveTestValue = cmp.find("Is_Intrusive_Testing_Allowed__c").get("v.value");
        if(isIntrusiveTestValue == null || isIntrusiveTestValue == ''){
            var toastEvent =$A.get("e.force:showToast");
            toastEvent.setParams({
                title: "Error!",
                message: "Please select a value for Is Intrusive Testing Allowed",
                type: "error"
            });
            toastEvent.fire();
            return;
        }
        
        let txt = '';
        /*if(cmp.get('v.dis') == false){
            txt = 'Preferred Start Time: '+cmp.get('v.preferredStartTime')+"\n"+'Preferred End Time: '+cmp.get('v.preferredEndTime')+"\n"+'Preferred Days: ';
            //ticket["Preferred_Alternate_End_time__c"] = 'Preferred:'+cmp.get('v.preferredEndTime')+','+'Alternate:'+cmp.get('v.alternateEndTime');   
            // alert(cmp.get('v.preSun'))
            if(cmp.get('v.preSun') == true){
                txt = txt+'Sunday'
            }
            if(cmp.get('v.preMon') == true){
                txt = txt+', '+'Monday'
            }
            if(cmp.get('v.preTue') == true){
                txt = txt+', '+'Tuesday'
            }
            if(cmp.get('v.preWed') == true){
                txt = txt+', '+'Wednesday'
            }
            if(cmp.get('v.preThr') == true){
                txt = txt+', '+'Thursday'
            }
            if(cmp.get('v.preFri') == true){
                txt = txt+', '+'Friday'
            }
            if(cmp.get('v.preSat') == true){
                txt = txt+', '+'Saturday'
            }
            
            txt = txt+ "\n"+ "\n"+'Alternate Start Time: '+cmp.get('v.alternateStartTime')+ "\n"+'Alternate End Time: '+cmp.get('v.alternateEndTime')+"\n"+'Alternate Days: ';
            if(cmp.get('v.altSun') == true){
                txt = txt+'Sunday'
            }
            if(cmp.get('v.altMon') == true){
                txt = txt+', '+'Monday'
            }
            if(cmp.get('v.altTue') == true){
                txt = txt+', '+'Tuesday'
            }
            if(cmp.get('v.altWed') == true){
                txt = txt+', '+'Wednesday'
            }
            if(cmp.get('v.altThr') == true){
                txt = txt+', '+'Thursday'
            }
            if(cmp.get('v.altFri') == true){
                txt = txt+', '+'Friday'
            }
            if(cmp.get('v.altSat') == true){
                txt = txt+', '+'Saturday'
            }
        } else{
            txt = '7 by 24';
            cmp.set('v.preSun', false);
            cmp.set('v.preMon', false);
            cmp.set('v.preTue', false);
            cmp.set('v.preWed', false);
            cmp.set('v.preThr', false);
            cmp.set('v.preFri', false);
            cmp.set('v.preSat', false);
            
            cmp.set('v.altSun', false);
            cmp.set('v.altMon', false);
            cmp.set('v.altTue', false);
            cmp.set('v.altWed', false);
            cmp.set('v.altThr', false);
            cmp.set('v.altFri', false);
            cmp.set('v.altSat', false);
            
            cmp.set('v.preferredStartTime', false);   
            cmp.set('v.preferredEndTime', false);
            cmp.set('v.alternateStartTime', false);
            cmp.set('v.alternateEndTime', false);
        }*/
        
        let accessHours = cmp.get("v.accessHours");
        if(accessHours == 'Error' || accessHours == 'Input Error' || accessHours == ''){
            let msg = '';
            if(accessHours == 'Error') msg += "Please provide start and end times properly.";
            if(accessHours == 'Input Error') msg += "Start time should be less than end time.";
            if(accessHours == '') msg += "Please provide access hours for at least a day.";
            
            var toastEvent =$A.get("e.force:showToast");
            toastEvent.setParams({
                title: "Error!",
                message: msg,
                type: "error"
            });
            toastEvent.fire();
            return;
        }
        
        var action1 = cmp.get("c.setAccessHours");
        action1.setParams({
            recId: cmp.get("v.ticketInfo").Id,
            accessHours: accessHours,
            preferredMethod : preferenceMethod,
            reportedBy : null
        });
        action1.setCallback(this, function(result) {
            let returnValue = result.getReturnValue();
            
        });
        $A.enqueueAction(action1); 
        cmp.find("editForm").submit();
        //cmp.set("v.isEditMode", !component.get("v.isEditMode"));
    },
    /* submitDetails: function(component, event, helper) {
      // Set isModalOpen attribute to false
      //Add your code to call apex method or do some processing
      component.set("v.isModalOpen", false);
   },*/
    openEscalateWindow: function(component, event, helper) {
        component.set("v.openReasonWindow", true);
        var modal = component.find("modalId");
        $A.util.toggleClass(modal, "slds-fade-in-open");
    },
    closeWindow: function(component, event, helper) {
        component.set("v.openReasonWindow", false);
        component.set("v.isModalOpen", false);
        component.set("v.openTicketModel", false);
        var modal = component.find("modalId");
        $A.util.toggleClass(modal, "slds-fade-in-close");
    },
    submitDetails: function(component, event, helper) {
        var reasons = component.get("v.reasons");
        var id = component.get("v.ticketInfo.Id");
        console.log(id);
        console.log(reasons);
        var action = component.get("c.updateTicket");
        action.setParams({
            recId: id,
            reasons: reasons
        });
        action.setCallback(this, function(response) {
            if (response.getState() === "SUCCESS") {
                if (response.getReturnValue() == "Record updated successfully") {
                    component.set("v.reasons", "");
                    var toastEvent = $A.get("e.force:showToast");
                    toastEvent.setParams({
                        title: "Success!",
                        message: "Ticket Escalated Successfully",
                        type: "success"
                    });
                    toastEvent.fire();
                    component.set("v.openReasonWindow", false);
                    component.set("v.escalated", true);
                    component.set("v.isModalOpen", false);
                    window.location.reload();
                } else {
                    var toastEvent = $A.get("e.force:showToast");
                    toastEvent.setParams({
                        title: "Error!",
                        message: response.getreturnValue(),
                        type: "error"
                    });
                    toastEvent.fire();
                }
            }
        });
        $A.enqueueAction(action);
    },
    showDetails: function(component, event, helper) {
        component.set("v.show", false);
    },
    goBack: function(component, event, helper) {
        component.set("v.show", true);
    },
    handleStatusTab: function(component, event, helper) {
        component.set("v.buttonText", "Ok");
        component.set("v.tabChanged", false);
        component.set("v.showAccessHours", true);
        helper.toggleEditMode(component, event, helper, true);
    },
    handleNotesTab: function(component, event, helper) {
        component.set("v.buttonText", "Ok");
        component.set("v.tabChanged", true);
        component.set("v.showAccessHours", false);
        component.set("v.columns", [
            { label: "Subject", fieldName: "Subject__c", type: "text" },
            
            {
                label: "Description",
                fieldName: "Description__c",
                type: "text",
                initialWidth: 700
            }
        ]);
        component.set("v.Cancel", "Submit Notes");
        helper.toggleEditMode(component, event, helper, true);
    },
    handleContactsTab: function(cmp, event, helper) {
        cmp.set("v.buttonText", "Save Contacts");
        cmp.set("v.tabChanged", true);
        cmp.set("v.showAccessHours", false);    
        helper.toggleEditMode(cmp, event, helper, true);
    },
    disabledFields : function(component, event, helper){
        if(event.getParam("checked") == true){
            component.set('v.dis', true);
        }else {
            
            component.set('v.dis', false);
        }
    },  
    
    setcontactmethod: function(component, event, helper){
         var contactMethod =  component.find("Preferred_Contact_method__c").get("v.value") ;
        if(contactMethod == undefined || contactMethod == ""){
             contactMethod=  component.get('v.ticketInfo.Preferred_Contact_method__c');
        }
        component.set('v.hideText',false);
        component.set('v.hideEmail',false);
		 component.set('v.hideAddContacts',true);
        if (contactMethod.indexOf('Email') > -1){
            component.set('v.hideEmail',true);
        }
        if (contactMethod.indexOf('Text') > -1){
            component.set('v.hideText',true);
        }
        if(contactMethod == 'Phone'){
            component.set('v.hideAddContacts',false);
        }
    },
    
});