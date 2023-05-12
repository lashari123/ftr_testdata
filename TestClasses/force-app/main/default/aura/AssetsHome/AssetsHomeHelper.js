({
    getStates : function(component,event) {
        // alert('hi')
        var action = component.get("c.getAssetStates");
        action.setCallback(this, function(response) {
            
            component.set("v.assetStates", response.getReturnValue());
        });
        $A.enqueueAction(action); 
    },
    
    newTicket : function(component,event) {
        if(!component.get("v.ticketInfo").Contact__c){
            component.get("v.ticketInfo").Local_Contact_Name2__c = component.get("v.searchText");
        }
        
        var allValid = component.find('fieldId').reduce(function (validSoFar, inputCmp) {
            inputCmp.showHelpMessageIfInvalid();
            return validSoFar && !inputCmp.get('v.validity').valueMissing;
        }, true);
        var bol = component.get('v.check');
        var lookUp = component.get('v.selectedContactId');
        var lookupText = component.get('v.searchText');
        console.log('lookupText=='+lookupText);
        
        //(allValid && lookUp == null)
        if (!allValid || (allValid && lookupText == null && lookUp == null) ) {
            //alert('All form entries look valid. Ready to submit!');
            var toastEvent = $A.get("e.force:showToast");
            toastEvent.setParams({
                "title": 'Alert!',
                "message": 'Enter All the mandatory Field values to create a New Ticket',
                "type":'warning',
                "duration":'20000',
                "mode": 'dismissible'
            });
            toastEvent.fire();
            return;
        }
        
        if(!bol){
            var toastEvent = $A.get("e.force:showToast");
            toastEvent.setParams({
                "title": "Alert!",
                "message": "Please check Advised of charges",
                "type":"warning",
                "duration":'20000',
                "mode": 'dismissible'
            });
            toastEvent.fire();
            return;            
        }
        
        var action = component.get("c.createTicket");
        var ticket = component.get('v.ticketInfo');
        var lst = [];
        ticket["Access_Hours__c"] = component.get('v.accessHours');
        let accessHours = component.get("v.accessHours");
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
        // lst.push('Preferred Start Time:'+component.get('v.preferredStartTime'));
        // lst.push('Preferred End Time:'+component.get('v.preferredEndTime'));
        // alert(lst)
        /*if(component.get('v.dis') == false){
            ticket["Access_Hours__c"] = '';
            
            var startTime = component.get('v.preferredStartTime');
            var endTime = component.get('v.preferredEndTime');
            
            startTime = this.convertTo24Hour(startTime);
            endTime = this.convertTo24Hour(endTime);
             
            if(component.get('v.preSun') == true){
                ticket["Access_Hours__c"] = this.getAccessHours('Sunday', startTime, endTime);
            }
            if(component.get('v.preMon') == true){
                ticket["Access_Hours__c"] = ticket["Access_Hours__c"] + '--end_of_line--' + this.getAccessHours('Monday', startTime, endTime);
            }
            if(component.get('v.preTue') == true){
                ticket["Access_Hours__c"] = ticket["Access_Hours__c"] + '--end_of_line--'+ this.getAccessHours('Tuesday', startTime, endTime);
            }
            if(component.get('v.preWed') == true){
                ticket["Access_Hours__c"] = ticket["Access_Hours__c"] + '--end_of_line--'+ this.getAccessHours('Wednesday', startTime, endTime);
            }
            if(component.get('v.preThr') == true){
                ticket["Access_Hours__c"] = ticket["Access_Hours__c"] + '--end_of_line--'+ this.getAccessHours('Thursday', startTime, endTime);
            }
            if(component.get('v.preFri') == true){
                ticket["Access_Hours__c"] = ticket["Access_Hours__c"] + '--end_of_line--'+ this.getAccessHours('Friday', startTime, endTime);
            }
            if(component.get('v.preSat') == true){
                ticket["Access_Hours__c"] = ticket["Access_Hours__c"] + '--end_of_line--'+ this.getAccessHours('Saturday', startTime, endTime);
            }
        } else{
            //ticket["Access_Hours__c"] = '7 by 24';
            var startTime = '00:00:00.000';
            var endTime = '23:59:00.000';
            ticket["Access_Hours__c"] = this.getAccessHours('Sunday', startTime, endTime);
            ticket["Access_Hours__c"] = ticket["Access_Hours__c"] + '--end_of_line--' + this.getAccessHours('Monday', startTime, endTime);
            ticket["Access_Hours__c"] = ticket["Access_Hours__c"] + '--end_of_line--'+ this.getAccessHours('Tuesday', startTime, endTime);
            ticket["Access_Hours__c"] = ticket["Access_Hours__c"] + '--end_of_line--'+ this.getAccessHours('Wednesday', startTime, endTime);
            ticket["Access_Hours__c"] = ticket["Access_Hours__c"] + '--end_of_line--'+ this.getAccessHours('Thursday', startTime, endTime);
            ticket["Access_Hours__c"] = ticket["Access_Hours__c"] + '--end_of_line--'+ this.getAccessHours('Friday', startTime, endTime);
            ticket["Access_Hours__c"] = ticket["Access_Hours__c"] + '--end_of_line--'+ this.getAccessHours('Saturday', startTime, endTime);
        }*/
        // ticket["Description__c"] =  ticket["Description__c"] + "\n"+"Preffered Contact Method: "+component.get('v.selectedPreferredMethod');
        component.set('v.ticketInfo', ticket);
        // alert(component.get("v.ticketInfo").Circuit_Id__c)
        action.setParams({ticket : component.get("v.ticketInfo")});
        action.setCallback(this, function(response) {
            if(response.getState() === "SUCCESS"){
                var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    //  "title": "Success!",
                    //  "message": " REDIRECTING......"
                    
                });
                toastEvent.fire();
                component.set('v.ticketCreated', true);
                var urlEvent = $A.get("e.force:navigateToURL");
                urlEvent.setParams({
                    "url" : window.location.protocol+'//'+window.location.host+'/Commercial/s/'
                    // "url": "https://ftr--cmtdev1.preview.salesforce-communities.com/Commercial/s/"
                });
                
                var delay = 15000; 
                setTimeout(function(){ 
                    urlEvent.fire();
                }, delay);
            }
        });
        $A.enqueueAction(action); 
    },
    
    getCities : function(component,event, state){     // getcitiesbystate=1
        var action = component.get("c.getCitiesByState");
        action.setParams({state : state});
        action.setCallback(this, function(response) {
            component.set("v.assetCities", response.getReturnValue());
            component.set("v.dummyAssetCities", response.getReturnValue());
        });
        $A.enqueueAction(action); 
    },
    
    // This function is used to fetch the asset records from database by using selected state & city as parameters
    getAssets : function(component,event,state,city){
        var action = component.get("c.getAssetsByStateAndCity");
        component.set('v.showStreetSpinner', true);
        
        action.setParams({ state : state,city : city});
        action.setCallback(this, function(response) {
            // component.set('v.showLayout', true);
            var assets = response.getReturnValue();
            var asset = [];
            //   var assetSet = [];
            component.set("v.assets", assets[0]);
            var assetsMap = {};
            for(var i=0;i<assets.length;i++){
                assetsMap[assets[i].Id] = assets[i];
                asset.push(assets[i].DPI_SERVICEADDRESS__c);
            }
            //console.log('asset:' + asset);
            //console.log('assetsMap:' + assetsMap);
            let uniqueValues  = [...new Set(asset)];
            component.set('v.showStreetSpinner', false);
            component.set("v.assetsMap", assetsMap);
            component.set('v.streetLst', uniqueValues);
            component.set('v.streetLstDummy', component.get('v.streetLst'));
        });
        //console.log('asset set ===='+assetSet);
        if(state && city)
            $A.enqueueAction(action); 
    }, 
    
    getContact: function(component, event){
        
        
        var action = component.get("c.getContactById");
        action.setParams({ contactId : component.get("v.selectedContactId")});
        action.setCallback(this, function(response) {
            
            var contact = response.getReturnValue();
            var ticketInfo = component.get("v.ticketInfo");
            
            ticketInfo["Contact__c"] = component.get("v.selectedContactId");
            ticketInfo["Local_Contact_Email2__c"] = contact.Email;
            ticketInfo["Local_Contact_Phone2__c"] = contact.Phone;
            ticketInfo["Local_Contact_Name2__c"] = contact.Name;
            component.set("v.ticketInfo", ticketInfo);
            
        });
        
        $A.enqueueAction(action); 
        
    },
    getUser: function(component, event){
        
        var action = component.get("c.getLoggedInUser");
        action.setCallback(this, function(response) {
            
            var user = response.getReturnValue();
            var ticketInfo = component.get("v.ticketInfo");
            
           // ticketInfo["Reported_By_name__c"] = user.Id;
            ticketInfo["Reported_By_Email__c"] = user.Email;
            ticketInfo["Reported_By_Phone__c"] = user.Phone;
            ticketInfo["Reported_By_Name_Text__c"] = user.Name;
            component.set("v.ticketInfo", ticketInfo);
            
        });
        
        $A.enqueueAction(action); 
        
    },
    changed : function(component, event, helper){
        console.log('helper');
    },
    getCategoryAssets : function(component, event,state,city, street){
        
        if(state && city){
            var action = component.get("c.getAssetsByStateCityAndStreet");
            component.set('v.showCircuitSpinner', true);
            // component.set('v.showPhone', true);
            // component.set('v.showCircuit', true);
            // 
            //Hemantha
            var assetJSON = component.get('v.assetJSON');
            var selectedCircuitId;
            var selectedPhone;
            
            if (assetJSON){
                selectedCircuitId = assetJSON.CircuitId__c;
                selectedPhone = assetJSON.dpi_WTN__c;
                component.set('v.showCirPhone', true);
                component.set('v.showInfo', false);
            }   
            
            action.setParams({ state : state,city : city, street :street});
            action.setCallback(this, function(response) {
                // alert(response.getState() )
                if(response.getState() === "SUCCESS"){
                    
                    component.set('v.showCircuitPhoneList',true);
                    component.set('v.showLayout', true);
                    var assets = response.getReturnValue().assLstOrderByCircuitId;
                    var assetsWTN = response.getReturnValue().assLstOrderByWTN;
                    var asset = [];
                    var phoneLst = [], circuitLst=[];
                    component.set("v.optionsPhone", phoneLst);
                    component.set("v.optionsCircuit", circuitLst);
                    var assetsMap = {}; 
                    for(var i=0;i<assets.length;i++){
                        assetsMap[assets[i].Id] = assets[i];
                        var cSelected = false;
                        if (assets[i].CircuitId__c == selectedCircuitId){
                            cSelected = true;
                            component.set('v.selectedCircuit',assets[i].Id)  ;
                        }
                        if(assets[i].CircuitId__c != '' && assets[i].CircuitId__c != null ){
                            circuitLst.push({value:assets[i].Id, label:assets[i].CircuitId__c +"-"+assets[i].PRODUCT_DESCRIPTION_c__c, selected:cSelected});						                      
                        }
                    }
                    for(var i=0; i<assetsWTN.length; i++){
                        
                        var cPhone = false;
                        if (assetsWTN[i].dpi_WTN__c == selectedPhone){
                            cPhone = true;
                            component.set('v.selectedPhone',assetsWTN[i].Id)  ;
                        }
                        
                        if(assetsWTN[i].CircuitId__c == '' || assetsWTN[i].CircuitId__c == null){
                            phoneLst.push({value:assetsWTN[i].Id, label:assetsWTN[i].dpi_WTN__c +"-"+assetsWTN[i].PRODUCT_DESCRIPTION_c__c, selected:cPhone});
                        }
                        
                    }
                    
                    
                    if(phoneLst.length > 0){
                        component.set("v.optionsPhone", phoneLst);
                        component.set('v.disabledPhone', false);
                    }else{
                        component.set('v.disabledPhone', true);
                    }
                    if(circuitLst.length > 0){
                        component.set("v.optionsCircuit", circuitLst);
                        component.set('v.disabledCircuit', false);
                    }else{
                        component.set('v.disabledCircuit', true);
                    }
                    
                    
                    if (assetJSON.CircuitId__c){
                        component.set('v.disabledPhone', true);
                        component.set('v.descriptionLen','500');
                    }else{
                        if (assetJSON.dpi_WTN__c){
                            component.set('v.disabledCircuit', true);
                            component.set('v.descriptionLen','255');
                        }
                    }
                    
                    // picklist code ends here
                    component.set('v.showCircuitSpinner', false);
                    component.set('v.showCircuitPhoneList', true);
                    component.set("v.assetsMap", assetsMap);
                    
                }
            });
            //console.log('asset set ===='+assetSet);
            //if(state && city)
            $A.enqueueAction(action); 
        }
    }, 
    getProductAssets : function(component, event, state, city,category, street){
        var assetsMap = component.get("v.assetsMap");
        // console.log(JSON.stringify(assetsMap));
        var productAssets = [];
        var productNames = [];
        // console.log(category)
        if(category)
            Object.keys(assetsMap).forEach(function(astId){
                
                console.log(assetsMap[astId]);
                if(assetsMap[astId].CATEGORY__c == category && assetsMap[astId].dpi_CITY__c == city.toUpperCase() &&
                   assetsMap[astId].dpi_STATE__c == state && assetsMap[astId].DPI_SERVICEADDRESS__c == street)
                {
                    
                    //  console.log('if cond');
                    if(!productNames.includes(assetsMap[astId].PRODUCT_DESCRIPTION_c__c)){
                        productNames.push(assetsMap[astId].PRODUCT_DESCRIPTION_c__c);
                        productAssets.push(assetsMap[astId]);
                    }
                }
            });
        console.log(productNames)
        console.log(productAssets)
        let uniqueValues  = [...new Set(productNames)];
        
        component.set("v.assetsProd",uniqueValues);
        component.set('v.prodAsserts',productAssets);
    },
    getcircuitassets : function(component, event, category, city, state, street, product){
        console.log(category)
        console.log('==prod=='+product)
        var assetsMap = component.get('v.assetsMap');
        var productAssets = [];
        var productNames = [];
        if(category){
            Object.keys(assetsMap).forEach(function(astId){
                console.log(assetsMap[astId].PRODUCT_DESCRIPTION_c__c +'==='+ product)
                if(assetsMap[astId].CATEGORY__c == category && assetsMap[astId].dpi_CITY__c == city.toUpperCase() 
                   && assetsMap[astId].DPI_SERVICEADDRESS__c == street && assetsMap[astId].PRODUCT_DESCRIPTION_c__c == product){
                    //  
                    console.log(assetsMap[astId].CATEGORY__c +'===='+category);
                    console.log(assetsMap[astId].dpi_CITY__c +'===='+city);
                    productAssets.push(assetsMap[astId]);
                }
            });
        }
        component.set('v.assetsCircuit',productAssets[0]);
    },
    
    // Create new ticket in DPI 
    createDPITicket : function(component, event, helper){
        var allValid = component.find('fieldId').reduce(function (validSoFar, inputCmp) {
            inputCmp.showHelpMessageIfInvalid();
            return validSoFar && !inputCmp.get('v.validity').valueMissing;
        }, true);
        var bol = component.get('v.check');
        var lookUp = component.get('v.selectedContactId'); 
        var lookupText = component.get('v.searchText');
        console.log('lookupText=='+lookupText);
        //(allValid && lookUp == null)
        if (!allValid || (allValid && lookupText == null && lookUp == null)) { 
            //alert('All form entries look valid. Ready to submit!');
            var toastEvent = $A.get("e.force:showToast");
            toastEvent.setParams({
                "title": 'Alert!',
                "message": 'Enter All the mandatory Field values to create a New Ticket',
                "type":'warning',
                "duration":'20000',
                "mode": 'dismissible'
            });
            toastEvent.fire();
            return;
        }
        if(!bol){
            var toastEvent = $A.get("e.force:showToast");
            toastEvent.setParams({
                "title": "Alert!",
                "message": "Please check Advised of charges",
                "type":"warning",
                "duration":'20000',
                "mode": 'dismissible'
            });
            toastEvent.fire();
            return;
            
        }
        if(component.get('v.id') == ''){
            var toastEvent = $A.get("e.force:showToast");
            toastEvent.setParams({
                "title": "Alert!",
                "message": "Please select phone number or circuit id",
                "type":"warning",
                "duration":'20000',
                "mode": 'dismissible'
            });
            toastEvent.fire();
            return;
        }
        let ticket = component.get("v.ticketInfo");
        ticket["Access_Hours__c"] = component.get('v.accessHours');
        let accessHours = component.get("v.accessHours");
        if(accessHours == 'Error'){
            var toastEvent =$A.get("e.force:showToast");
            toastEvent.setParams({
                title: "Error!",
                message: "Please provide start and end times properly for Access Hours.",
                type: "error"
            });
            toastEvent.fire();
            return;
        }
        component.set("v.ticketInfo", ticket);
        
        var action = component.get('c.createDPITicket');
        console.log(1,component.get("v.ticketInfo"))
        if(!component.get("v.ticketInfo").Contact__c){
            component.get("v.ticketInfo").Local_Contact_Name2__c = component.get("v.searchText");
        }
        
        action.setParams({ticket : component.get("v.ticketInfo")});
        component.set('v.ticketCreated', true);
        action.setCallback(this, function(response){
            if(response.getState() === "SUCCESS"){
                component.set('v.ticketCreated', false);
                if(response.getReturnValue() == 'Success from Provider'){
                    var toastEvent = $A.get("e.force:showToast");
                    toastEvent.setParams({
                        //  "title": "REDIRECTING",
                        //  "message": "Ticket Created",
                        // "type":"info"
                    });
                    toastEvent.fire();
                    
                    var urlEvent = $A.get("e.force:navigateToURL");
                    urlEvent.setParams({
                        "url" : window.location.protocol+'//'+window.location.host+'/Commercial/s/'
                        // "url": "https://ftr--cmtdev1.preview.salesforce-communities.com/Commercial/s/"
                    });
                    urlEvent.fire();
                    
                    window.location.reload();
                    
                } else {
                    var toastEvent = $A.get("e.force:showToast");
                    toastEvent.setParams({
                        "title": "Alert",
                        "message": response.getReturnValue(),
                        "type":"warning",
                        "duration":'20000',
                        "mode": 'dismissible'
                    });
                    toastEvent.fire();
                }
                
            } 
        });
        $A.enqueueAction(action);
    },
    
    //Disable and enable the submit tkt button
    submitTktdisable : function(component, event, helper){
        var allValid = component.find('fieldId').reduce(function (validSoFar, inputCmp) {
            inputCmp.showHelpMessageIfInvalid();
            return validSoFar && !inputCmp.get('v.validity').valueMissing;
        }, true);
        var bol = component.get('v.check');
        
        var lookUp = component.get('v.selectedContactId'); 
        
        if (!allValid || (allValid && lookUp == null) || !bol) {
            component.set('v.disableSubmitTkt',true);
        }else{
            component.set('v.disableSubmitTkt',false);
        }
        if (!allValid && lookUp != null) {
            component.set('v.disableSubmitTkt',true);
        } 
    },
    getUrlParameter : function(sParam) {
        var sPageURL = decodeURIComponent(window.location.search.substring(1)),
            sURLVariables = sPageURL.split('&'),
            sParameterName,
            i;
        
        for (i = 0; i < sURLVariables.length; i++) {
            sParameterName = sURLVariables[i].split('=');
            
            if (sParameterName[0] === sParam) {
                return sParameterName[1] === undefined ? true : sParameterName[1];
            }
        }    
    },
    
    getAsset : function(component, event, asset){
        var action = component.get("c.getAssetById");
        //component.set('v.showCircuitSpinner', true);
        // component.set('v.showPhone', true);
        // component.set('v.showCircuit', true);
        
        console.log('inside getAsset function');
        action.setParams({ assetId : asset});
        action.setCallback(this, function(response) {
            //JSON.stringify(response)
            console.log('got response');   
            console.log(JSON.stringify(response.getReturnValue()));
            
            var assetJSON = response.getReturnValue();
            component.set('v.assetJSON', assetJSON); //not sure will be able to read it soon
            
            //this.getStates(component,event);
            this.allAssets(component);
            //Hemantha - Removing below two lines since it is slow in preprod and prod
            //this.getCities(component,event,assetJSON.dpi_STATE__c);
            //this.getAssets(component,event,assetJSON.dpi_STATE__c,assetJSON.dpi_CITY__c);            
            this.getCategoryAssets(component,event,assetJSON.dpi_STATE__c,assetJSON.dpi_CITY__c,assetJSON.DPI_SERVICEADDRESS__c);
            
            
            let ticket = component.get("v.ticketInfo");
            console.log('asset======='+JSON.stringify(asset));
            ticket["Service_Address_State__c"] = assetJSON.dpi_STATE__c;
            ticket["Customer_Address_City__c"] = assetJSON.dpi_CITY__c;
            ticket["Customer_Civic_Address__c"] = assetJSON.DPI_SERVICEADDRESS__c;
            ticket["Customer_Address_Zip__c"] = assetJSON.DPI_POSTALCODE__c;
            
            ticket["Company_Name__c"] = assetJSON.Account__c;
            ticket["Service_Product_disc__c"] = assetJSON.CircuitId__c;
            
            
            
            
            if (assetJSON.CircuitId__c){
                //component.find('select').set('v.value',assetJSON.CircuitId__c);
                //component.set('v.selectedCircuit',assetJSON.CircuitId__c);
                ticket["Circuit_Id__c"] = assetJSON.CircuitId__c;
                component.set('v.id', 'Circuit');
                component.set('v.disabledPhone', true);
                component.set('v.disFields', true);
                component.set('v.showCirPhone', true);
                component.set('v.showInfo', false);
            }else{
                //component.find('select1').set('v.value',assetJSON.dpi_WTN__c);
                ticket["Circuit_Id__c"] = assetJSON.dpi_WTN__c;
                component.set('v.id', 'WTN');
                component.set('v.disabledCircuit', true);
                component.set('v.disFields', false);
                component.set('v.showCirPhone', true);
                component.set('v.showInfo', false);
            }
            component.set("v.ticketInfo", ticket);
        })
        
        $A.enqueueAction(action);
        
    },
    allAssets: function (component) {
        var action = component.get("c.getStateCityAddress");
        action.setCallback(this, function(response) {
            //console.log("All Assets:" + JSON.stringify(response.getReturnValue()));
            component.set('v.items', response.getReturnValue());
        })
        $A.enqueueAction(action);        
    },
    
    getAssetById: function (component, event){
        var action = component.get("c.getAllAssets");
        action.setCallback(this, function(response) {
            console.log('got response'); 
            component.set('v.assetsMap', response.getReturnValue());
        })
        $A.enqueueAction(action);
    },
    
    getAccessHours: function (day, startTime, endTime){
        
        var sunday = 'ALAH-Sunday=false';
        var monday = 'ALAH-Monday=false';
        var tuesday = 'ALAH-Tuesday=false';
        var wednesday = 'ALAH-Wednesday=false';
        var thursday = 'ALAH-Thursday=false';
        var friday = 'ALAH-Friday=false';
        var saturday = 'ALAH-Saturday=false';
        
        if (day == 'Sunday'){
            sunday = 'ALAH-Sunday=true';
        }else if(day == 'Monday'){
            monday = 'ALAH-Monday=true';
        }else if(day == 'Tuesday'){
            tuesday = 'ALAH-Tuesday=true';
        }else if(day == 'Wednesday'){
            wednesday = 'ALAH-Wednesday=true';
        }else if(day == 'Thursday'){
            thursday = 'ALAH-Thursday=true';
        }else if(day == 'Friday'){
            friday = 'ALAH-Friday=true';
        }else if(day == 'Saturday'){
            saturday = 'ALAH-Saturday=true';
        }
        
        return sunday + ';' + monday + ';' + tuesday + ';' + wednesday + ';' + thursday + ';' + friday  + ';' + saturday + ';' + 'ALAH-IntervalStart=' + startTime + ';' + 'ALAH-IntervalEnd=' + endTime;
        
    },
    
    convertTo24Hour: function(amPmString) {
        var d = new Date("1/1/2013 " + amPmString); 
        return d.getHours() + ':' + d.getMinutes() + ':00.000' ; 
    },
    
    
    
})