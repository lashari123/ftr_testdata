({
    doInit :  function(component, event, helper) {
        debugger
        //var ownerid = '';
        var action = component.get("c.getEmailContact");
        var recordId = component.get("v.recordId");
        action.setParams({
            recordId : recordId
        });
        action.setCallback(this,function(response){
            var state = response.getState();
            if(state === "SUCCESS"){
                var res = response.getReturnValue();
                
                if(res != null){
                    console.log('=============res========');
                    if(res[0].Contact__r == undefined){
                        component.set("v.year",res[0].Contract_Term_Years__c);
                        component.set("v.lName",'');
                        console.log(component.get("v.year"));
                    }
                    else{
                        //component.set("v.ContactBool",true);
                        //component.set("v.ContactemailBool",false);
                        component.set("v.email",res[0].Contact__r.Email); 
                        component.set("v.fName",res[0].Contact__r.FirstName); 
                        component.set("v.lName",res[0].Contact__r.LastName); 
                        component.set("v.year",res[0].Contract_Term_Years__c);
                        console.log(component.get("v.year"));
                    }
                }
                
            }
        });
        $A.enqueueAction(action);
        
        
        var action6 = component.get("c.getOwner");
        //var ownerId = ownerid
        action6.setParams({
            recordId : recordId
        });
        action6.setCallback(this,function(response){
            debugger
            var state = response.getState();
            if(state === "SUCCESS"){
                var res = response.getReturnValue();
                
                if(res != null){
                    component.set("v.ownername",res.Name);
                }
                console.log("===owner===="+component.get("v.ownername"));
            }
            
            
        });
        $A.enqueueAction(action6);
        
        
        
        var action5 = component.get("c.getContact");
        var recordId = component.get("v.recordId");
        action5.setParams({
            recordId : recordId
        });
        action5.setCallback(this,function(response){
            var state = response.getState();
            if(state === "SUCCESS"){
                var res = response.getReturnValue();
                
                if(res != null){
                    component.set("v.opportunity",res);
                }
                
            }
        });
        $A.enqueueAction(action5);
        
        
        var list = [];
        /*  var action2 = component.get("c.getAttachment");
        var recordId2 = component.get("v.recordId");
        action2.setParams({
            recordId : recordId2
        });
        action2.setCallback(this,function(response){
            var state = response.getState();
            if(state === "SUCCESS"){
                var res = response.getReturnValue();
                for(var i = 0 ; i < res.length ; i++){
                    var item = {
                        "label": res[i].Name,
                        "value": res[i].Id
                    };
                    list.push(item);
                }
                component.set("v.attachment",list);
            }
        });
        $A.enqueueAction(action2);*/
        
        var action4 = component.get("c.getContentDocumentLink");
        var recordId2 = component.get("v.recordId");
        action4.setParams({
            recordId : recordId2
        });
        action4.setCallback(this,function(response){
            var state = response.getState();
            if(state === "SUCCESS"){
                var res = response.getReturnValue();
                for(var i = 0 ; i < res.length ; i++){
                    var item = {
                        "label": res[i].ContentDocument.Title,
                        "value": res[i].Id
                    };
                    list.push(item);
                }
                component.set("v.attachment",list);
            }
        });
        $A.enqueueAction(action4);
        
        
        var action3 = component.get("c.templateSubject");
        action3.setCallback(this,function(response3){
            var state = response3.getState();
            if(state === "SUCCESS"){
                var res = response3.getReturnValue();
                component.set("v.subject",res.Subject);
                component.set("v.createDate",res.CreatedDate);
                var plainBody = res.HtmlValue;
                // plainBody = plainBody.replace('Dear {!Contact.LastName},', '');
                //var  a = plainBody.split("Dear");
                //var b =  a[1];
                plainBody = plainBody.replace('{!Contact.LastName}',component.get("v.lName"));
                plainBody = plainBody.replace('{!Opportunity.OwnerFullName}',component.get("v.ownername"));
                plainBody = plainBody.replace('XX',component.get("v.year"));
                
                var array = [];
                component.set("v.emailbody",plainBody);
                array = plainBody.split("<br/>"); 
                component.set("v.bodydata",array);
            }
            console.log('==v.bodydata=='+component.get("v.bodydata"));
        });
        $A.enqueueAction(action3);
        
    },
    handleOperation :  function(component, event, helper) {
        debugger
        var   check = event.getSource().get("v.checked");
        if(check == true){
            var list = [];
            component.set("v.isOperation",true);
            component.set("v.isOperationDisable",true);
            var action2 = component.get("c.getOperationAttachment");
            var recordId2 = component.get("v.recordId");
            action2.setParams({
                recordId : recordId2
            });
            action2.setCallback(this,function(response){
                var state = response.getState();
                if(state === "SUCCESS"){
                    var res = response.getReturnValue();
                    for(var i = 0 ; i < res.length ; i++){
                        var item = {
                            "label": res[i].Name,
                            "value": res[i].Id
                        };
                        list.push(item);
                    }
                    component.set("v.attachmentOperationList",list);
                }
            });
            $A.enqueueAction(action2);
        }
        else{
            var list = [];
            component.set("v.attachmentLegalList",list);
            component.set("v.isOperation",false);
        }
        
        
    },
    handleContract :  function(component, event, helper) {
        debugger
        var   check = event.getSource().get("v.checked");
        if(check == true){
            var list = [];
            component.set("v.isLegal",true);
            component.set("v.isLegalDisable",true);
            var action2 = component.get("c.getContractAttachment");
            var recordId2 = component.get("v.recordId");
            action2.setParams({
                recordId : recordId2
            });
            action2.setCallback(this,function(response){
                var state = response.getState();
                if(state === "SUCCESS"){
                    var res = response.getReturnValue();
                    for(var i = 0 ; i < res.length ; i++){
                        var item = {
                            "label": res[i].Name,
                            "value": res[i].Id
                        };
                        list.push(item);
                    }
                    component.set("v.attachmentLegalList",list);
                }
            });
            $A.enqueueAction(action2);
        }
        else{
            var list = [];
            component.set("v.attachmentLegalList",list);
            component.set("v.isLegal",false);
        }
        
        
    },
    handleMarketingDocument :  function(component, event, helper) {
        debugger
        var   check = event.getSource().get("v.checked");
        if(check == true){
            var list = [];
            component.set("v.isMarketDocument",true);
            component.set("v.isMarketingDisable",true);
            var action2 = component.get("c.getMarketingAttachment");
            var recordId2 = component.get("v.recordId");
            action2.setParams({
                recordId : recordId2
            });
            action2.setCallback(this,function(response){
                var state = response.getState();
                if(state === "SUCCESS"){
                    var res = response.getReturnValue();
                    for(var i = 0 ; i < res.length ; i++){
                        var item = {
                            "label": res[i].Name,
                            "value": res[i].Id
                        };
                        list.push(item);
                    }
                    component.set("v.attachmentMarketingList",list);
                }
            });
            $A.enqueueAction(action2);
        }
        else{
            var list = [];
            component.set("v.attachmentMarketingList",list);
            component.set("v.isMarketDocument",false);
        }
        
    },
    handleLegal :  function(component, event, helper) {
              debugger
        var   check = event.getSource().get("v.checked");
        if(check == true){
            var list = [];
            component.set("v.isContract",true);
            component.set("v.isContractDisable",true);
            var action2 = component.get("c.getLegalAttachment");
            var recordId2 = component.get("v.recordId");
            action2.setParams({
                recordId : recordId2
            });
            action2.setCallback(this,function(response){
                var state = response.getState();
                if(state === "SUCCESS"){
                    var res = response.getReturnValue();
                    for(var i = 0 ; i < res.length ; i++){
                        var item = {
                            "label": res[i].Name,
                            "value": res[i].Id
                        };
                        list.push(item);
                    }
                    component.set("v.attachmentContractList",list);
                }
            });
            $A.enqueueAction(action2);
        }
        else{
            var list = [];
            component.set("v.attachmentContractList",list);
            component.set("v.isContract",false);
        }
        
  
        
        
    },
      handleOrder :  function(component, event, helper) {
              debugger
        var   check = event.getSource().get("v.checked");
        if(check == true){
            var list = [];
            component.set("v.isOrder",true);
            component.set("v.isOrderDisable",true);
            var action2 = component.get("c.getOrderDocumentAttachment");
            var recordId2 = component.get("v.recordId");
            action2.setParams({
                recordId : recordId2
            });
            action2.setCallback(this,function(response){
                var state = response.getState();
                if(state === "SUCCESS"){
                    var res = response.getReturnValue();
                    for(var i = 0 ; i < res.length ; i++){
                        var item = {
                            "label": res[i].Name,
                            "value": res[i].Id
                        };
                        list.push(item);
                    }
                    component.set("v.attachmentOrderList",list);
                }
            });
            $A.enqueueAction(action2);
        }
        else{
            var list = [];
            component.set("v.attachmentOrderList",list);
            component.set("v.isOrder",false);
        }
        
  
        
        
    },
      handleLOAs :  function(component, event, helper) {
              debugger
        var   check = event.getSource().get("v.checked");
        if(check == true){
            var list = [];
            component.set("v.isLOAs",true);
            component.set("v.isLOAsDisable",true);
            var action2 = component.get("c.getLOAsAttachment");
            var recordId2 = component.get("v.recordId");
            action2.setParams({
                recordId : recordId2
            });
            action2.setCallback(this,function(response){
                var state = response.getState();
                if(state === "SUCCESS"){
                    var res = response.getReturnValue();
                    for(var i = 0 ; i < res.length ; i++){
                        var item = {
                            "label": res[i].Name,
                            "value": res[i].Id
                        };
                        list.push(item);
                    }
                    component.set("v.attachmentLOAsList",list);
                }
            });
            $A.enqueueAction(action2);
        }
        else{
            var list = [];
            component.set("v.attachmentLOAsList",list);
            component.set("v.isLOAs",false);
        }
     
    },
    
    cancel : function(component, event, helper) {
        component.set("v.open",false);
        var dismissActionPanel = $A.get("e.force:closeQuickAction");
        dismissActionPanel.fire();
        
    },
    handleClickoperation :  function(component, event, helper) {
        debugger
        var list = component.get("v.attach");
        var ids1 = component.get("v.ids1");
        var check = event.getSource().get("v.checked");
        var attachFile = event.getSource().get("v.name");
        var value = event.getSource().get("v.value");
        if(check == true){
            list.push(attachFile);
            ids1.push(value);
            
        }else{
            list.pop(attachFile);
            ids1.pop(value);
            
        }
        component.set("v.attach",list);
        component.set("v.ids1",ids1);
    },
    handleClickContract :  function(component, event, helper) {
        debugger
        var list = component.get("v.attach");
        var ids2 = component.get("v.ids2");
        var check = event.getSource().get("v.checked");
        var attachFile = event.getSource().get("v.name");
        var value = event.getSource().get("v.value");
        if(check == true){
            list.push(attachFile);
            ids2.push(value);
            
        }else{
            list.pop(attachFile);
            ids2.pop(value);
            
        }
        component.set("v.attach",list);
        component.set("v.ids2",ids2);
    },
    handleClickLegal :  function(component, event, helper) {
        debugger
        var list = component.get("v.attach");
        var ids4 = component.get("v.ids4");
        var check = event.getSource().get("v.checked");
        var attachFile = event.getSource().get("v.name");
        var value = event.getSource().get("v.value");
        if(check == true){
            list.push(attachFile);
            ids4.push(value);
            
        }else{
            list.pop(attachFile);
            ids4.pop(value);
            
        }
        component.set("v.attach",list);
        component.set("v.ids4",ids4);
    },
      handleClickOrder :  function(component, event, helper) {
        debugger
        var list = component.get("v.attach");
        var ids5 = component.get("v.ids5");
        var check = event.getSource().get("v.checked");
        var attachFile = event.getSource().get("v.name");
        var value = event.getSource().get("v.value");
        if(check == true){
            list.push(attachFile);
            ids5.push(value);
            
        }else{
            list.pop(attachFile);
            ids5.pop(value);
            
        }
        component.set("v.attach",list);
        component.set("v.ids5",ids5);
    },
      handleClickLOAs :  function(component, event, helper) {
        debugger
        var list = component.get("v.attach");
        var ids6 = component.get("v.ids6");
        var check = event.getSource().get("v.checked");
        var attachFile = event.getSource().get("v.name");
        var value = event.getSource().get("v.value");
        if(check == true){
            list.push(attachFile);
            ids6.push(value);
            
        }else{
            list.pop(attachFile);
            ids6.pop(value);
            
        }
        component.set("v.attach",list);
        component.set("v.ids6",ids6);
    },
    handleClickMarketing :  function(component, event, helper) {
        debugger
        var list = component.get("v.attach");
        var ids3 = component.get("v.ids3");
        var check = event.getSource().get("v.checked");
        var attachFile = event.getSource().get("v.name");
        var value = event.getSource().get("v.value");
        if(check == true){
            list.push(attachFile);
            ids3.push(value);
            
        }else{
            list.pop(attachFile);
            ids3.pop(value);
            
        }
        component.set("v.attach",list);
        component.set("v.ids3",ids3);
    },
    sendMail: function(component, event, helper) {
        debugger
        // when user click on Send button 
        // First we get all 3 fields values 	
        var getEmail = component.get("v.email");
        // var getSubject = component.get("v.subject");
        // var getbody = component.get("v.body");
        var list = []; 
        var ids1 = component.get("v.ids1");
        var ids2 = component.get("v.ids2");
        var ids3 = component.get("v.ids3");
         var ids4 = component.get("v.ids4");
        var ids5 = component.get("v.ids5");
        var ids6 = component.get("v.ids6");
        if(ids1.length == 0){
            
        }
        else{
            for(var i = 0 ; i < ids1.length ; i++){
                list.push(ids1[i]); 
            }
            
        }
        
        if(ids2.length == 0){
            
        }
        else{
            for(var i = 0 ; i < ids2.length ; i++){
                list.push(ids2[i]); 
            }
        }
        
        if(ids3.length == 0){
            
        }
        else{
            for(var i = 0 ; i < ids3.length ; i++){
                list.push(ids3[i]); 
            }
        }
        if(ids4.length == 0){
            
        }
        else{
            for(var i = 0 ; i < ids4.length ; i++){
                list.push(ids4[i]); 
            }
        }
          if(ids5.length == 0){
            
        }
        else{
            for(var i = 0 ; i < ids5.length ; i++){
                list.push(ids5[i]); 
            }
        }
          if(ids6.length == 0){
            
        }
        else{
            for(var i = 0 ; i < ids6.length ; i++){
                list.push(ids6[i]); 
            }
        }
        
        component.set("v.attach",list);
        var attach =  component.get("v.attach");
        var name = component.get("v.lName");
        var subject = component.get("v.subject");
        var ownerName = component.get("v.ownername");
        var year = component.get("v.year");
        var emailbody = component.get("v.emailbody");
        // check if Email field is Empty or not contains @ so display a alert message 
        // otherwise call call and pass the fields value to helper method    
        if ($A.util.isEmpty(getEmail) || !getEmail.includes("@")) {
            alert('Please Enter valid Email Address');
        } else {
            helper.sendHelper(component, getEmail,attach,name,subject,ownerName,year,emailbody);
        }
    },
    
    // when user click on the close buttton on message popup ,
    // hide the Message box by set the mailStatus attribute to false
    // and clear all values of input fields.   
    closeMessage: function(component, event, helper) {
        component.set("v.mailStatus", false);
        component.set("v.email", null);
        component.set("v.subject", null);
        component.set("v.body", null);
        component.set("v.open",false);
        var dismissActionPanel = $A.get("e.force:closeQuickAction");
        dismissActionPanel.fire();
         var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "title": "Success!",
                    "variant" : "success",
                    "message": "The email has been sent successfully."
                });
                toastEvent.fire();
        
    },
})