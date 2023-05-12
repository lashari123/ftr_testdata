({
    init : function(component, event, helper) {  
        helper.getStates(component, event);
        var opt = [{value:'CBC',label:'Can\'t Be Called'},{value:'CBH',label:'Can\'t Be Heard'},
                   {value:'CCF',label:'Customer Calling Feature'},{value:'CCO',label:'Can\'t Call Out'},
                   {value:'DDC',label:'Disconnected During Conversation'},
                   {value:'LDC',label:'Can\'t Call Long Distance'},{value:'NDT',label:'No Dial Tone'},
                   {value:'NSY',label:'Noise or Static On The Line'},{value:'OOL',label:'Others On Line'}];
        component.set('v.troubleTicketOptions',opt);
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
        console.log(component.get('v.troubleTicketOptions'))
        //event.getParam("openSections")
        helper.allAssets(component);
        var assetId = helper.getUrlParameter('assetId');
        if (assetId != '' && assetId != null && assetId != 'undefined'){
        	component.set('v.select', assetId); 
        	helper.getAsset(component, event, assetId);
        	var assetJSON = component.get('v.assetJSON');
        	if (assetJSON){
        		helper.getStates(component,event);
        		helper.getCities(component,event,assetJSON.dpi_STATE__c);
        		helper.getAssets(component,event,assetJSON.dpi_STATE__c,assetJSON.dpi_CITY__c);
        	}
        }
        helper.getAssetById(component,event);
        helper.getUser(component,event);
            
       //cmp.set('v.hideEmail',true);
        
    },
    // This function will create ticket on Remedy OR DPI based on selected Circuit ID OR WTN Number
    newTicket : function(component, event, helper){
        var ticketRec = component.get("v.ticketInfo");
            console.info(ticketRec);
        let isError = false;
        let isEmailError = false;
        let isPhoneError = false;
        let isPhoneError1 = false;
        let verifyEmail = false;
        let verifyText = false;
        let verifyEmailandText = false;
        let verifyEmailandPhone = false;
        let verifyPhone = false;
        let errorFields = [];
        let nameFields = [];
        let addAddEmail = [];
        let addAddPhone = [];
        var lcEmail = component.get("v.ticketInfo.Local_Contact_Email2__c");
        var rpByEmail = component.get("v.ticketInfo.Reported_By_Email__c");
        var lcTextNum = component.get("v.ticketInfo.LocalContactText__c");
        var rpByTextNum = component.get("v.ticketInfo.Reported_By_Text_Number__c");
        var lcPhone = component.get("v.ticketInfo.Local_Contact_Phone2__c");
        var rpByPhone = component.get("v.ticketInfo.Reported_By_Phone__c");
        var lcTextSendUpdate= component.get("v.ticketInfo.Local_Text_Send_Updates__c");
        var rpByTextSendUpdate= component.get("v.ticketInfo.Reported_By_Text_Send_Updates__c");
        var lcEmailSendUpdate= component.get("v.ticketInfo.Send_update__c");
        var rpByEmailSendUpdate= component.get("v.ticketInfo.Reported_By_Send_Update__c");
        let msg = '';
            for (var i = 1; i <= 8; i++) {
                /*if (
                    (((ticketRec["Additional_Contact_Name_" + i + "__c"] != "" || ticketRec["Additional_Contact_Name_Text_" + i + "__c"] != "") &&
                      (ticketRec["Additional_Contact_Name_" + i + "__c"] != undefined || ticketRec["Additional_Contact_Name_Text_" + i + "__c"] != undefined)) ||
                     (ticketRec["Additional_Contact_Email_" + i + "__c"] != "" &&
                      ticketRec["Additional_Contact_Email_" + i + "__c"] != undefined) ||
                     (ticketRec["Additional_Contact_Phone_" + i + "__c"] != "" &&
                      ticketRec["Additional_Contact_Phone_" + i + "__c"] != undefined) || 
                     (ticketRec["Send_update_" + i + "__c"] != "" && ticketRec["Send_update_" + i + "__c"] != undefined)
                    ) &&
                    (((ticketRec["Additional_Contact_Name_" + i + "__c"] == "" && ticketRec["Additional_Contact_Name_Text_" + i + "__c"] == "") ||
                      (ticketRec["Additional_Contact_Name_" + i + "__c"] == undefined && ticketRec["Additional_Contact_Name_Text_" + i + "__c"] == undefined)) ||
                     //(ticketRec["Additional_Contact_Email_" + i + "__c"] == "" || ticketRec["Additional_Contact_Email_" + i + "__c"] == undefined) ||
                     (ticketRec["Additional_Contact_Phone_" + i + "__c"] == "" ||
                      ticketRec["Additional_Contact_Phone_" + i + "__c"] == undefined) || 
                     (ticketRec["Send_update_" + i + "__c"] == "" || ticketRec["Send_update_" + i + "__c"] == undefined))
                ) {*/
                if(
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
                    if(!isEmailError){
                        addAddEmail.push(isEmailError);
                    }
                    
                }
                
                if(!isPhoneError && (ticketRec["Additional_Contact_Phone_" + i + "__c"] != "" &&
                      ticketRec["Additional_Contact_Phone_" + i + "__c"] != undefined)) {
                    const re = /^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/;
                    isPhoneError = !re.test(ticketRec["Additional_Contact_Phone_" + i + "__c"]);
                    if(!isPhoneError){
                    		addAddPhone.push(isPhoneError);
                    }
                     
                }
                
            }
        var contactMethod = component.get("v.ticketInfo.Preferred_Contact_method__c");
        if(contactMethod == "Email"){
            /*if((lcEmail == "" || lcEmail == undefined) && (rpByEmail == "" || rpByEmail == undefined) && (addAddEmail.length == 0)){
               verifyEmail = true;
            }*/
            if((lcEmail != "" && lcEmail != undefined) || (rpByEmail != "" && rpByEmail != undefined)){
                if(lcEmailSendUpdate =="No" && rpByEmailSendUpdate == "No"){
                    verifyEmail = true;
                    msg = "Please Select Atleast One Send Email Updates as Yes."
                }
               
            }
        }     
         if(contactMethod == "Text"){
            if((lcTextNum == "" || lcTextNum == undefined) && (rpByTextNum == "" || rpByTextNum == undefined) ){
                verifyText = true;
                msg = "Please Enter Atleast One Text Number."
            }
             
             if((lcTextNum != "" && lcTextNum != undefined  ) ||(rpByTextNum != "" && rpByTextNum != undefined  ) ){
                 if(lcTextSendUpdate == "No" && rpByTextSendUpdate == "No"){
                     verifyText = true;
                     msg = "Please Select Atleast One Send Text Updates as Yes."
                 }   
            }
             if(((lcTextNum != "" && lcTextNum != undefined) && (rpByTextSendUpdate == "Yes")) && (rpByTextNum == "" || rpByTextNum == undefined) ){
               component.set("v.makeRptByTextRq",true);
                 verifyText = true;
                     msg = "Please Enter Reported By Text Number."
             }else if(((lcTextNum == "" || lcTextNum == undefined) && (lcTextSendUpdate == "Yes")) && (rpByTextNum != "" && rpByTextNum != undefined)){
                 component.set("v.makeLCTextRq",true);
                 verifyText = true;
                     msg = "Please Enter Local Contact Text Number."
             }
        }  
         if(contactMethod == "Email and Text"){
            if((((lcEmail == "" || lcEmail == undefined) && (rpByEmail == "" || rpByEmail == undefined)&& (addAddEmail.length == 0)) && 
                ((lcTextNum == "" || lcTextNum == undefined) && (rpByTextNum == "" || rpByTextNum == undefined) && (addAddPhone.length == 0) ) )){
                verifyEmailandText = true;
                msg ="Please Enter Atleast One Email ID and Text Number";
            }
              else if (((lcEmail != "" && lcEmail != undefined) || (rpByEmail != "" && rpByEmail != undefined)|| (addAddEmail.length > 0)) &&
                       (((lcTextNum == "" || lcTextNum == undefined) && (rpByTextNum == "" || rpByTextNum == undefined) && (addAddPhone.length == 0) ))){
                  verifyEmailandText = true;
                  msg ="Please Enter Atleast One Text Number";
              }
             else if  (((lcEmail == "" || lcEmail == undefined) && (rpByEmail == "" || rpByEmail == undefined)&& (addAddEmail.length == 0)) &&
                      (((lcTextNum != "" && lcTextNum != undefined) || (rpByTextNum != "" && rpByTextNum != undefined) || (addAddPhone.length > 0) ))){
                 verifyEmailandText = true;
                 msg ="Please Enter Atleast One Email ID";
             }
             if((lcTextNum != "" && lcTextNum != undefined  ) ||(rpByTextNum != "" && rpByTextNum != undefined  ) &&
                ((lcEmail != "" && lcEmail != undefined) || (rpByEmail != "" && rpByEmail != undefined))){
                 if((lcTextSendUpdate == "No" && rpByTextSendUpdate == "No") && (lcEmailSendUpdate =="No" && rpByEmailSendUpdate == "No")){
                     verifyEmailandText = true;
                     msg = "Please Select Atleast One Send Email and One Text Updates as Yes."
                 } else if((lcTextSendUpdate == "Yes" || rpByTextSendUpdate == "Yes") && (lcEmailSendUpdate =="No" && rpByEmailSendUpdate == "No")){
                     verifyEmailandText = true;
                     msg = "Please Select Atleast One Send Email Updates as Yes."
                 } else if((lcTextSendUpdate == "No" && rpByTextSendUpdate == "No") && (lcEmailSendUpdate =="Yes" || rpByEmailSendUpdate == "Yes")){
                     verifyEmailandText = true;
                     msg = "Please Select Atleast One Send Text Updates as Yes."
                 }     
                 
            }
             if(((lcTextNum != "" && lcTextNum != undefined) && ( rpByTextSendUpdate == "Yes")) && (rpByTextNum == "" || rpByTextNum == undefined) ){
               component.set("v.makeRptByTextRq",true);
                 verifyText = true;
                     msg = "Please Enter Atleast One Reported By Text Number."
             }else if(((lcTextNum == "" || lcTextNum == undefined) && (lcTextSendUpdate == "Yes")) && (rpByTextNum != "" && rpByTextNum != undefined)){
                 component.set("v.makeLCTextRq",true);
                 verifyText = true;
                     msg = "Please Enter Atleast One Local Contact Text Number."
             }
            
        }  
         if(contactMethod == "Email and Phone"){
            if((((lcEmail == "" || lcEmail == undefined) && (rpByEmail == "" || rpByEmail == undefined)) &&
              ((lcPhone == "" || lcPhone == undefined) && (rpByPhone == "" || rpByPhone == undefined))  && (addAddEmail.length == 0))){
                 verifyEmailandPhone = true;
                 msg ="Please Enter Atleast One Email ID and Phone Number";
            }else if(((lcEmail == "" || lcEmail == undefined) && (rpByEmail == "" || rpByEmail == undefined)&& (addAddEmail.length == 0)) &&
              ((lcPhone != "" && lcPhone != undefined) || (rpByPhone != "" && rpByPhone != undefined))){
                  verifyEmailandPhone = true;
                  msg ="Please Enter Atleast One Email ID ";
             }
             if((lcEmail != "" && lcEmail != undefined) || (rpByEmail != "" && rpByEmail != undefined)){
                if(lcEmailSendUpdate =="No" && rpByEmailSendUpdate == "No"){
                    verifyEmail = true;
                    msg = "Please Select Atleast One Send Email Updates as Yes."
                }
               
            }
        }  
         if(contactMethod == "Phone"){
            
            if((lcPhone == "" || lcPhone == undefined) && (rpByPhone == "" || rpByPhone == undefined) ){
                 verifyPhone = true;
            }
        }
        
        	const re = /^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/;
            //isPhoneError1 = !re.test(ticketRec["Reported_By_Phone__c"]);
            
            component.set("v.errorPhoneFields", errorFields.join(","));
            component.set("v.errorNameFields", nameFields.join(","));
                
            if (isError || isEmailError || isPhoneError || isPhoneError1 || verifyEmail || verifyText || verifyEmailandText || verifyEmailandPhone || verifyPhone) {
                
                if(isError) msg += "Please provide Additional Contact details.";
                if(isEmailError) msg += "Please verify email address is correct.";
                if(isPhoneError || isPhoneError1) msg += "Please verify phone number is correct.";
                if(verifyEmail) msg ;
                  if(verifyText) msg ;
                  if(verifyEmailandText) msg;
                  if(verifyEmailandPhone) msg ;
                  if(verifyPhone) msg += "Please Enter Any Phone Number.";
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
        
        var id = component.get('v.id');
        if(id == 'Circuit'){
            helper.newTicket(component, event);
        } else {
            helper.createDPITicket(component, event, helper);
        }
    },
    
    getCities : function(component, event, helper){
        console.log(event.getParam("openSections")[0]);
        component.set("v.selectedState", event.getParam("openSections")[0]);
        helper.getCities(component,event, component.get("v.selectedState"));
    },
    
    getAssets : function(component, event, helper){
        component.set("v.selectedCity", event.getParam("openSections")[0]);
        helper.getAssets(component, event,component.get("v.selectedState"), event.getParam("openSections")[0]);
    },
    
    setTicket : function(component, event, helper) {
        // console.log('label===='+event.getSource().get('v.label'))
        // console.log('title==='+event.getSource().get('v.title'))
        component.set('v.showLayout', true);
        if(event.getSource().get('v.title') == 'WTN'){
            component.set('v.disFields', false);
            component.set('v.id', event.getSource().get('v.title'));
        } else {
            component.set('v.disFields', true);
            component.set('v.id', event.getSource().get('v.title'));
        }
        var col = component.find('changeColor');
        let ticket = component.get("v.ticketInfo");
        if(component.get('v.singleAsset') == false){
            
            var asset = component.get("v.assetsMap")[event.getSource().get('v.name')];
            
            if(event.getSource().get('v.title') != 'WTN'){
                ticket["Service_Address_State__c"] = component.get("v.selectedState");
                ticket["Customer_Address_City__c"] = component.get("v.selectedCity");
                ticket["Customer_Civic_Address__c"] = asset.DPI_SERVICEADDRESS__c;
                ticket["Customer_Address_Zip__c"] = asset.DPI_POSTALCODE__c;
                ticket["Circuit_Id__c"] = asset.CircuitId__c;
                ticket["Company_Name__c"] = asset.Account__c;
                ticket["Service_Product_disc__c"] = asset.CircuitId__c;
                $A.util.addClass(col, 'colorblue');
            } else{
                ticket["Service_Address_State__c"] = component.get("v.selectedState");
                ticket["Customer_Address_City__c"] = component.get("v.selectedCity");
                ticket["Customer_Civic_Address__c"] = asset.DPI_SERVICEADDRESS__c;
                ticket["Customer_Address_Zip__c"] = asset.DPI_POSTALCODE__c;
                ticket["Circuit_Id__c"] = asset.dpi_WTN__c;
                ticket["Company_Name__c"] = asset.Account__c;
                ticket["Service_Product_disc__c"] = asset.dpi_WTN__c;
                // ticket["Access_Hours__c"] ='';
                //Account__c
                $A.util.addClass(col, 'colorblue');
            }
            component.set("v.ticketInfo", ticket);
            // alert("Fill the remaining information and click the submit new ticket button")
        } else {
            var asset = component.get('v.asset');
            ticket["Service_Address_State__c"] = asset.dpi_STATE__c;
            ticket["Customer_Address_City__c"] =asset.dpi_CITY__c;
            ticket["Customer_Civic_Address__c"] = asset.DPI_SERVICEADDRESS__c;
            ticket["Customer_Address_Zip__c"] = asset.DPI_POSTALCODE__c;
            ticket["Circuit_Id__c"] = asset.dpi_WTN__c;
            ticket["Company_Name__c"] = asset.Account__c;
            ticket["Service_Product_disc__c"] = asset.PRODUCT_DESCRIPTION_c__c;
            component.set("v.ticketInfo", ticket);
        }
        
    },
    
    handleContact : function(component, event, helper){
        if(component.get("v.selectedContactId") != null)
        {
            helper.getContact(component, event);
        }    
    },
    
    handleAddMore : function(component, event, helper){
    	component.set("v.showMoreContacts", true);
    },
    
    setStreet : function(component, event, helper){
        
        component.set("v.selectedAstId", event.getParam("openSections")[0])
    },
    setCategory : function(component,event,helper){
        
    },
    setProduct : function(component,event,helper){
        
    },
    
    getcircuit : function(component,event,helper){
        
    },
    
    filter: function(component, event, helper) {
        
        console.log('hi')
        console.log(event.keyCode)
        if(event.keyCode === 13){
            console.log('inside if ')
            var term = component.get("v.filter");
            var phoneNumber,circuitId;
            console.log(term)
            if(term.includes('/')){
                circuitId = term;
                phoneNumber = '';
            } else {
                phoneNumber = term;
                circuitId = '';
            }
            var action = component.get('c.getAssetByPhone');
            action.setParams({
                phoneNumber : phoneNumber ,
                circuitId : circuitId
            });
            action.setCallback(this,function(response){
                console.log(response.getState())
                if(response.getState() === 'SUCCESS'){
                    console.log('inside success')
                    if(response.getReturnValue() != '' && response.getReturnValue() != null &&  JSON.stringify(response.getReturnValue()) != '{}'){
                        component.set('v.asset', response.getReturnValue());
                        component.set('v.showAssetLst', false);
                        component.set('v.singleAsset', true);
                    } else {
                        //alert('please enter valid phone number')
                        var toastEvent = $A.get("e.force:showToast");
                        toastEvent.setParams({
                            "title": "Alert!",
                            "message": "Please enter valid phone number",
                            "type":"warning"
                        });
                        toastEvent.fire();
                        // component.set('v.filter', 'Please enter valid phone number   ');
                    }
                } 
            });
            $A.enqueueAction(action);
        }
        // comment the code  from line no 110 to 159 end (phoneno chanege"---
        // place  onkeyup="{! c.filter }" this line  in cmp at line number 70 inside div  onchange="{!c.showLst}"
        /*    var data = component.get("v.assets"),
            term = component.get("v.filter"),
            count =0,
            results = data, regex;
        var assertLst = component.get('v.streetLst');
       // console.log(JSON.stringify(assertLst))
        var cities = component.get('v.assetCities');
        var street = component.get('v.streetLst');
       // console.log(term)
        var lst = [], streetLst=[];
        for(var i in cities){
            if(cities[i].Name.toUpperCase() == term.toUpperCase()){
               lst.push(cities[i]);
                count++;
               // console.log(term.toUpperCase())
               // console.log(lst.length)
            }
        }
        console.log(term)
        if(count == 0 && term != null && term != ''){
            for(var i in assertLst){
                console.log('outsideIf===='+assertLst[i])
                if(assertLst[i].toUpperCase().includes(term.toUpperCase())){
                    streetLst.push(assertLst[i]);
                    console.log('insideIf===='+assertLst[i])
                }
            }
        }
        if(lst.length > 0){
            component.set("v.dummyAssetCities", lst);
        } else {
            component.set('v.dummyAssetCities',cities);
        }
        if(streetLst.length > 0){
            component.set('v.streetLstDummy', streetLst);
        } else {
            component.set('v.streetLstDummy', street);
        }
            if(term){
                regex = new RegExp(term, "i");
                
                results = data.filter(row=>regex.test(row.Name) || regex.test(row.dpi_SERVICE_TYPE__c) || 
                                      regex.test(row.DPI_SERVICEADDRESS__c) || regex.test(row.Location) ||
                                      regex.test(row.Description__c) || regex.test(row.Local_Contact_Phone__c));
            }
            else{
                component.set("v.filterdData", data);
            }
        
        component.set("v.filterdData", results); */
    },
    
    
    getCategory : function(component, event, helper){
        
        console.log('street=='+event.getParam("openSections")[0])
        component.set('v.selectedStreet', event.getParam("openSections")[0]); // storing selected street
        helper.getCategoryAssets(component, event,component.get("v.selectedState"), component.get('v.selectedCity'), component.get('v.selectedStreet'));
    },
    getProduct : function(component, event, helper){
        component.set("v.selectedCat", event.getParam("openSections")[0]); 
        helper.getProductAssets(component, event,component.get("v.selectedState"), component.get('v.selectedCity'),
                                component.get("v.selectedCat"), component.get('v.selectedStreet'));
    },
    getcircuit : function(component,event,helper){
        console.log("======"+event.getParam("openSections")[0])
        console.log("===open==="+event.getParam("openSections"))
        component.set('v.selectedProdDesc', event.getParam("openSections")[0]);
        helper.getcircuitassets(component,event,component.get("v.selectedCat"),component.get('v.selectedCity'),component.get("v.selectedState"), component.get("v.selectedStreet"), component.get('v.selectedProdDesc'));
    },
    showLst : function(component, event, helper){
        console.log('onchange')
        console.log(component.get('v.filter'))
        if(component.get('v.filter') == ''){
            component.set('v.showAssetLst', true);
            component.set('v.disFields', true);
            component.set('v.singleAsset', false);
        }
    },
    /* checkWTNCircuit : function(component, event, helper){
        
        if(component.get("v.id") == ''){
            component.set('v.ticketInfo.Description__c', '');
        }
    }*/
    disabledFields : function(component, event, helper){
        if(event.getParam("checked") == true){
            component.set('v.dis', true);
        }else {
            
            component.set('v.dis', false);
        }
    },
    sendLCEmailUpdate : function(component, event, helper){
          
        var sendValue = component.get("v.ticketInfo.Send_update__c");
        if(sendValue == "Yes"){
           // input.focus();
          var emailUpdate=  component.get("v.ticketInfo.Local_Contact_Email2__c");
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
    
    sendLCTextUpdate:function(component, event, helper){
        var lcSendUpdate = component.get("v.ticketInfo.Local_Text_Send_Updates__c");
        if(lcSendUpdate == "Yes"){
            var lcUpdate = component.get("v.ticketInfo.LocalContactText__c");
             if(lcUpdate == null || lcUpdate == '' || lcUpdate == undefined){
                 component.set("v.makeLCTextRq",true);
               var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    title: "Error!",
                    message: "Please Enter Local Contact Text Number",
                    type: "error",
                    duration: 5000
                });
                toastEvent.fire();
                return;
            }
        }else{
             component.set("v.makeLCTextRq",false);
        }
    },
    
    sendRpbyEmailUpdate:function(component, event, helper){
        var rpbySendUpdate = component.get("v.ticketInfo.Reported_By_Send_Update__c");
        if(rpbySendUpdate == "Yes"){
           var rpyEmailUpdate =  component.get("v.ticketInfo.Reported_By_Email__c");
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
            component.set("v.isLCEmailRq",true);
        }else{
            component.set("v.makeRptByEmailRq",false);
        }
    },
    
    sendRpbyTextUpdate:function(component, event, helper){
        var rpbySendUpdate = component.get("v.ticketInfo.Reported_By_Text_Send_Updates__c");
        if(rpbySendUpdate == "Yes"){
           var rpbyTextUpdate =  component.get("v.ticketInfo.Reported_By_Text_Number__c");
              if(rpbyTextUpdate == null || rpbyTextUpdate == '' || rpbyTextUpdate == undefined){
               component.set("v.makeRptByTextRq",true);
               var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    title: "Error!",
                    message: "Please Enter Reported By Text Number",
                    type: "error",
                    duration: 5000
                });
                toastEvent.fire();
                
            }
            component.set("v.isLCEmailRq",true);
        }else{
            component.set("v.makeRptByTextRq",false);
        }
    },
   
    getPhoneNum : function(component, event, helper){
        if(isNaN(component.get('v.ticketInfo.Local_Contact_Phone2__c'))){
            //alert("Please enter numbers only")
            component.set('v.ticketInfo.Local_Contact_Phone2__c', '');
        }
         
    },
    
    getReportTextNumber:function(component, event, helper){
        if(isNaN(component.get('v.ticketInfo.Reported_By_Text_Number__c'))){
            //alert("Please enter numbers only")
            component.set('v.ticketInfo.Reported_By_Text_Number__c', '');
        }
    },
    enbaleLayout : function(component, event, helper){
        
    },
    onChange : function(component, event, helper){
        // alert(component.find('select').get('v.value'))
        console.log('component selection'+component.find('select').get('v.value'));
        var assetId = component.find('select').get('v.value');
        //component.set('v.assetId', assetId);
        //helper.getAssetById(component,event,assetId);
        // 
        if(component.find('select').get('v.value') == '--Select One--' && component.get('v.optionsPhone').length > 0){
            component.set('v.disabledPhone', false);
        }else{
           // var circutId = component.find('select').get('v.label');
            //alert(circutId)
            component.set('v.disabledPhone', true);
            component.set('v.disFields', true);
            component.set('v.id', 'Circuit');
            component.set('v.showCirPhone', true);
            component.set('v.showInfo', false);
            component.set('v.descriptionLen','500');
            let ticket = component.get("v.ticketInfo");
            var asset = component.get("v.assetsMap")[assetId];
            console.log('asset======='+JSON.stringify(asset));
            ticket["Service_Address_State__c"] = asset.dpi_STATE__c;
            ticket["Customer_Address_City__c"] = asset.dpi_CITY__c;
            ticket["Customer_Civic_Address__c"] = asset.DPI_SERVICEADDRESS__c;
            ticket["Customer_Address_Zip__c"] = asset.DPI_POSTALCODE__c;
            ticket["Circuit_Id__c"] = asset.CircuitId__c;
            ticket["Company_Name__c"] = asset.Account__c;
            ticket["Service_Product_disc__c"] = asset.CircuitId__c;
            component.set("v.ticketInfo", ticket);
            console.log('circuit id'+asset.CircuitId__c);
            console.log('component selection'+component.find('select'));
            console.log('ticketInfo'+ticket);
            
        }
    },
    onChange1 : function(component, event, helper){
        //  alert(component.find('select1').get('v.value'))
        var assetId = component.find('select').get('v.value');
        component.set('v.assetId', assetId);
        helper.getAssetById(component,event,assetId);
        if(component.find('select1').get('v.value') == '--Select One--' && component.get('v.optionsCircuit').length > 0){
            component.set('v.disabledCircuit', false);
        }else{
            component.set('v.disabledCircuit', true);
            component.set('v.disFields', false);
            component.set('v.id', 'WTN');
            component.set('v.showCirPhone', true);
            component.set('v.showInfo', false);
            component.set('v.descriptionLen','255');
            let ticket = component.get("v.ticketInfo");
             var asset = component.get("v.assetsMap")[assetId];
            ticket["Service_Address_State__c"] = asset.dpi_STATE__c;
            ticket["Customer_Address_City__c"] = asset.dpi_CITY__c;
            ticket["Customer_Civic_Address__c"] = asset.DPI_SERVICEADDRESS__c;
            ticket["Customer_Address_Zip__c"] = asset.DPI_POSTALCODE__c;
            ticket["Circuit_Id__c"] = asset.dpi_WTN__c;
            ticket["Company_Name__c"] = asset.Account__c;
            ticket["Service_Product_disc__c"] = asset.dpi_WTN__c;
            component.set("v.ticketInfo", ticket);
        }
    },
    //Added to disable the submit tkt button until all fields are valid
    disbaleSubmit:function(component, event, helper){
        helper.submitTktdisable(component, event, helper);
    },
    
    handleKeyup:function(component, event, helper){
    	var element = event.getSource().get('v.value');
    	var maxlength = component.get('v.descriptionLen');
     	var remainingChar = maxlength - element.length;
        var desc = component.get('v.ticketInfo.Description__c');
        component.set('v.descSpecialChar',false);
        var filter = /[^a-zA-Z0-9_\.\,\ \-]/;
        if (filter.test(desc)) {
            component.set('v.descSpecialChar',true);    
        }else{
    		component.set('v.charsRemaining',remainingChar);    
        }
	},
    
    
   handleSelect: function (cmp, event, helper) {
        event.preventDefault();
       	var name = event.getParam('name');
        cmp.set('v.selected', name);
       	var pName = name.split(':');      
       	if (pName.length > 2){
            var state = pName[0];
            var city = pName[1];
            var street = pName[2];
       		helper.getCategoryAssets(cmp,event,state,city,street);
       	}
    },
    
    setcontactmethod: function(cmp, event, helper){
        var contactMethod = cmp.get('v.ticketInfo.Preferred_Contact_method__c');
        cmp.set('v.hideText',false);
        cmp.set('v.hideEmail',false);
        cmp.set('v.hideAddContact',false);
        if (contactMethod.indexOf('Email') > -1){
           
            cmp.set('v.hideEmail',true);
        }
        
        if (contactMethod.indexOf('Text') > -1){
            
            cmp.set('v.hideText',true);
        }
        if(contactMethod == 'Phone'){
            cmp.set('v.hideAddContact',true);
           }
        
    }

})