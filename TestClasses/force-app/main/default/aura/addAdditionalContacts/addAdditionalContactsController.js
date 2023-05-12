({
    init: function(cmp, event, helper) {
        let numberOfContactsActive = 1;
        let ticket = cmp.get("v.ticketInfo");
        let activeContacts = {
            "r1": true, "r2": false, "r3": false, "r4": false, "r5": false, "r6": false, "r7": false, "r8": false
        }
        for(let i=2; i<=8; i++) {
            if((ticket["Additional_Contact_Name_"+i+"__c"] && ticket["Additional_Contact_Name_"+i+"__c"] != "") ||
               (ticket["Additional_Contact_Name_Text_"+i+"__c"] && ticket["Additional_Contact_Name_Text_"+i+"__c"] != "")
              ){
                numberOfContactsActive++;
                activeContacts['r'+i+''] = true;
            }
        }
        cmp.set("v.numberOfContactsActive",numberOfContactsActive);
        if(!ticket["Send_update_1__c"]) {
            ticket["Send_update_1__c"] = 'No';
            cmp.set("v.ticketInfo", ticket);
        }
 
        cmp.set("v.displayRows", activeContacts);
    },
    getPhoneNum : function(component, event, helper){
        if(isNaN(component.get('v.ticketInfo.Local_Contact_Phone2__c'))){
            component.set('v.ticketInfo.Local_Contact_Phone2__c', '');
        }
    },
    handlePhoneError: function(component, event, helper) {
        let errorFields = component.get("v.errorPhoneFields");
       	component.set("v.phone1", errorFields.indexOf("phone1") > -1? true : false);
        component.set("v.phone2", errorFields.indexOf("phone2") > -1? true : false);
        component.set("v.phone3", errorFields.indexOf("phone3") > -1? true : false);
        component.set("v.phone4", errorFields.indexOf("phone4") > -1? true : false);
        component.set("v.phone5", errorFields.indexOf("phone5") > -1? true : false);
        component.set("v.phone6", errorFields.indexOf("phone6") > -1? true : false);
        component.set("v.phone7", errorFields.indexOf("phone7") > -1? true : false);
        component.set("v.phone8", errorFields.indexOf("phone8") > -1? true : false);
    },
    
    handleNameError: function(component, event, helper) {
        let errorFields = component.get("v.errorNameFields");
       	component.set("v.name1", errorFields.indexOf("name1") > -1? true : false);
        component.set("v.name2", errorFields.indexOf("name2") > -1? true : false);
        component.set("v.name3", errorFields.indexOf("name3") > -1? true : false);
        component.set("v.name4", errorFields.indexOf("name4") > -1? true : false);
        component.set("v.name5", errorFields.indexOf("name5") > -1? true : false);
        component.set("v.name6", errorFields.indexOf("name6") > -1? true : false);
        component.set("v.name7", errorFields.indexOf("name7") > -1? true : false);
        component.set("v.name8", errorFields.indexOf("name8") > -1? true : false);
    },
    
    handleContact1 : function(component, event, helper){
        if(component.get("v.ticketInfo.Additional_Contact_Name_1__c") != null) {
            let fields = ["Additional_Contact_Email_1__c","Additional_Contact_Phone_1__c"];
            helper.getContact(component, event, component.get("v.ticketInfo.Additional_Contact_Name_1__c"), fields);
        }
    },
    handleContact2 : function(component, event, helper){
        if(component.get("v.ticketInfo.Additional_Contact_Name_2__c") != null) {
            let fields = ["Additional_Contact_Email_2__c","Additional_Contact_Phone_2__c"];
            helper.getContact(component, event, component.get("v.ticketInfo.Additional_Contact_Name_2__c"), fields);
        }
    },
    handleContact3 : function(component, event, helper){
        if(component.get("v.ticketInfo.Additional_Contact_Name_3__c") != null) {
            let fields = ["Additional_Contact_Email_3__c","Additional_Contact_Phone_3__c"];
            helper.getContact(component, event, component.get("v.ticketInfo.Additional_Contact_Name_3__c"), fields);
        }
    },
    handleContact4 : function(component, event, helper){
        if(component.get("v.ticketInfo.Additional_Contact_Name_4__c") != null) {
            let fields = ["Additional_Contact_Email_4__c","Additional_Contact_Phone_4__c"];
            helper.getContact(component, event, component.get("v.ticketInfo.Additional_Contact_Name_4__c"), fields);
        }
    },
    handleContact5 : function(component, event, helper){
        if(component.get("v.ticketInfo.Additional_Contact_Name_5__c") != null) {
            let fields = ["Additional_Contact_Email_5__c","Additional_Contact_Phone_5__c"];
            helper.getContact(component, event, component.get("v.ticketInfo.Additional_Contact_Name_5__c"), fields);
        }
    },
    handleContact6 : function(component, event, helper){
        if(component.get("v.ticketInfo.Additional_Contact_Name_6__c") != null) {
            let fields = ["Additional_Contact_Email_6__c","Additional_Contact_Phone_6__c"];
            helper.getContact(component, event, component.get("v.ticketInfo.Additional_Contact_Name_6__c"), fields);
        }
    },
    handleContact7 : function(component, event, helper){
        if(component.get("v.ticketInfo.Additional_Contact_Name_7__c") != null) {
            let fields = ["Additional_Contact_Email_7__c","Additional_Contact_Phone_7__c"];
            helper.getContact(component, event, component.get("v.ticketInfo.Additional_Contact_Name_7__c"), fields);
        }
    },
    handleContact8 : function(component, event, helper){
        if(component.get("v.ticketInfo.Additional_Contact_Name_8__c") != null) {
            let fields = ["Additional_Contact_Email_8__c","Additional_Contact_Phone_8__c"];
            helper.getContact(component, event, component.get("v.ticketInfo.Additional_Contact_Name_8__c"), fields);
        }
    },
    handleAddMore: function(cmp, event, helper) {
        let index = cmp.get("v.numberOfContactsActive");
        cmp.set("v.numberOfContactsActive", index + 1);
        let activeContacts = cmp.get("v.displayRows");
        activeContacts["r"+index] = true;
        let ticket = cmp.get('v.ticketInfo');
        ticket["Send_update_" + (index+1) + "__c"] = "No";
        cmp.set('v.ticketInfo', ticket);
        cmp.set("v.displayRows", activeContacts);
    },
    clearContact: function(cmp, event, helper) {
        let numberOfContactsActive = cmp.get("v.numberOfContactsActive");
        cmp.set("v.numberOfContactsActive", numberOfContactsActive - 1);
        var index = parseInt(event.getSource().get("v.name"));
        if(index < 8) {
            let ticket = cmp.get('v.ticketInfo');
            for(let i=index; i<=numberOfContactsActive; i++) {
                ticket['Additional_Contact_Phone_' + i + '__c'] = ticket['Additional_Contact_Phone_' + (i+1) + '__c'] != undefined? ticket['Additional_Contact_Phone_' + (i+1) + '__c'] : '';
                ticket['Additional_Contact_Email_' + i + '__c'] = ticket['Additional_Contact_Email_' + (i+1) + '__c'] != undefined? ticket['Additional_Contact_Email_' + (i+1) + '__c'] : '';
                ticket['Additional_Contact_Name_' + i + '__c'] = ticket['Additional_Contact_Name_' + (i+1) + '__c'] != undefined? ticket['Additional_Contact_Name_' + (i+1) + '__c'] : '';
            	ticket['Additional_Contact_Name_Text_' + i + '__c'] = ticket['Additional_Contact_Name_Text_' + (i+1) + '__c'] != undefined? ticket['Additional_Contact_Name_Text_' + (i+1) + '__c'] : '';
            	ticket["Send_update_" + i + "__c"] = ticket["Send_update_" + (i+1) + "__c"] != undefined? ticket["Send_update_" + (i+1) + "__c"] : '';
            }
            cmp.set('v.ticketInfo', ticket);
            
            let activeContacts = cmp.get("v.displayRows");
        	activeContacts["r"+index] = false;
            cmp.set("v.displayRows", activeContacts);
        }
        
    }
})