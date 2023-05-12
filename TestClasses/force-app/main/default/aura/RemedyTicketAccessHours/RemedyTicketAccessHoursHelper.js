({
    handle24x7 : function(component, event, helper) {
    	component.set("v.monStart", "00:00:00.000Z");
        component.set("v.tueStart", "00:00:00.000Z");
        component.set("v.wedStart", "00:00:00.000Z");
        component.set("v.thuStart", "00:00:00.000Z");
        component.set("v.friStart", "00:00:00.000Z");
        component.set("v.satStart", "00:00:00.000Z");
        component.set("v.sunStart", "00:00:00.000Z");
        
        component.set("v.monEnd", "23:59:59.000Z");
        component.set("v.tueEnd", "23:59:59.000Z");
        component.set("v.wedEnd", "23:59:59.000Z");
        component.set("v.thuEnd", "23:59:59.000Z");
        component.set("v.friEnd", "23:59:59.000Z");
        component.set("v.satEnd", "23:59:59.000Z");
        component.set("v.sunEnd", "23:59:59.000Z");
        
        this.handleGenerate(component, event, helper);
	},
    handle8To5 : function(component, event, helper) {
    	component.set("v.monStart", "08:00:00.000Z");
        component.set("v.tueStart", "08:00:00.000Z");
        component.set("v.wedStart", "08:00:00.000Z");
        component.set("v.thuStart", "08:00:00.000Z");
        component.set("v.friStart", "08:00:00.000Z");
        component.set("v.satStart", "");
        component.set("v.sunStart", "");
        
        component.set("v.monEnd", "17:00:00.000Z");
        component.set("v.tueEnd", "17:00:00.000Z");
        component.set("v.wedEnd", "17:00:00.000Z");
        component.set("v.thuEnd", "17:00:00.000Z");
        component.set("v.friEnd", "17:00:00.000Z");
        component.set("v.satEnd", "");
        component.set("v.sunEnd", "");
        
        this.handleGenerate(component, event, helper);
	},
	clear : function(component, event, helper) {
		component.set("v.monStart", "");
        component.set("v.tueStart", "");
        component.set("v.wedStart", "");
        component.set("v.thuStart", "");
        component.set("v.friStart", "");
        component.set("v.satStart", "");
        component.set("v.sunStart", "");
        
        component.set("v.monEnd", "");
        component.set("v.tueEnd", "");
        component.set("v.wedEnd", "");
        component.set("v.thuEnd", "");
        component.set("v.friEnd", "");
        component.set("v.satEnd", "");
        component.set("v.sunEnd", "");
        
        this.handleGenerate(component, event, helper);
	},
    handleGenerate : function(component, event, helper) {
        let hasError = false;
        let hasInputError = false;
        let accessHours = '';
        let days = ["mon", "tue", "wed", "thu", "fri", "sat", "sun"];
        let fulldays = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"];
        let count = 0;
        
        for(let i=0; i<days.length; i++) {
            let day = days[i];
            var cmpTarget = component.find('' + day + '-st');
            var cmpTarget1 = component.find('' + day + '-en');
        	$A.util.removeClass(cmpTarget, "slds-has-error");
            $A.util.removeClass(cmpTarget1, "slds-has-error") ;
            let fullday = fulldays[i];
            let start = component.get("v." + day + "Start") || "";
            let end = component.get("v." + day + "End") || "";
            
            for(let j=0; j<i; j++) {
                accessHours += 'ALAH-' + fulldays[j] + '=false;';
            }
            
            if((start == "" && end != "") || (start != "" && end == "")) {
                hasError = true;
                if((start == "" && end != "")) $A.util.addClass(cmpTarget, "slds-has-error");
                if((start != "" && end == "")) $A.util.addClass(cmpTarget1, "slds-has-error");
            } else if(start == "" && end == "") {
                accessHours += 'ALAH-' + fullday + '=false;';
                count++;
            } else if(start >= end) {
                hasInputError = true;
                 $A.util.addClass(cmpTarget, "slds-has-error")
            } else if(start != "" && end != "") {
                accessHours += 'ALAH-' + fullday + '=true;';
            }
            
            //do validations
            
            for(let j=i+1; j<fulldays.length; j++) {
                accessHours += 'ALAH-' + fulldays[j] + '=false;';
            }
            
            accessHours += 'ALAH-IntervalStart='+ ((start != null)? start.replace("Z", "") : "") + 
                			';ALAH-IntervalEnd=' + ((end != null)? end.replace("Z", "") : "") + 
                			'--end_of_line--';
        }
        
        if(count > 6) {
            accessHours = '';
        }
        
        if(hasError) {
            accessHours = 'Error';
            component.set("v.accessHours", accessHours);
        } else if(hasInputError) {
            accessHours = 'Input Error';
            component.set("v.accessHours", accessHours);
        } else {
            component.set("v.accessHours", accessHours);
            console.log(accessHours);
        }
    },
    handleTicketId : function(component, event, helper) {
        if(component.get("v.recordId") == '' || component.get("v.recordId") == null) return;
        if((component.get("v.recordId") == component.get("v.prevRecordId"))) return;
        component.set("v.prevRecordId", component.get("v.recordId"));
        var action1 = component.get("c.getAccessHours");
        action1.setParams({
            recId: component.get("v.recordId")
        });
        action1.setCallback(this, function(result) {
            let accessHours = result.getReturnValue();
            let dayWiseString = (accessHours.Access_Hours__c && (accessHours.Access_Hours__c == null || accessHours.Access_Hours__c == ''))? [] : accessHours.Access_Hours__c.split('--end_of_line--');
			console.log(dayWiseString);
            let fulldays = ["mon", "tue", "wed", "thu", "fri", "sat", "sun"];
        	for(let i=0; i<dayWiseString.length; i++) {
            	let el = dayWiseString[i];
                if(el != "") {
                    let eachDay = el.split(';');
                    let intervalStart = eachDay[7].split("=")[1] || "";
                    let intervalEnd = eachDay[8].split("=")[1] || "";
                    component.set("v." + fulldays[i] + "Start", intervalStart);
            		component.set("v." + fulldays[i] + "End", intervalEnd);
                }
            }
            this.handleGenerate(component, event, helper);
        });
        $A.enqueueAction(action1);  
	},
    
})