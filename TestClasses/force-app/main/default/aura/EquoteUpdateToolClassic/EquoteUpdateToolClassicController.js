({
    doInit : function(component, event, helper) {
        debugger
        var recordId = component.get("v.recordId");
        var action = component.get("c.getProductType");
        
        action.setParams({
            recordId :recordId
        });
        action.setCallback(this,function(response){
            debugger
            var state = response.getState();
            if(state == "SUCCESS"){
                debugger
                var res = response.getReturnValue();
                component.set("v.quoteType",res);
                if(res != null){
                    if(res == 'Frontier Anyware'){
                        component.set("v.isUcaasLogo",true);
                    }
                    else if(res == 'Smart Voice'){
                        component.set("v.isSmartLogo",true);
                    }
                }
            }
        });
        $A.enqueueAction(action);
        
        var action1 = component.get("c.getSiteNumber");
        action1.setParams({
            recordId :recordId
        });
        action1.setCallback(this,function(response){
            var state = response.getState();
            if(state == "SUCCESS"){
                var res = response.getReturnValue();
                if(res != null){
                    component.set("v.SiteNumberlst",res);
                    component.set("v.outOfSite",res.length);
                }
            }
        });
        $A.enqueueAction(action1);
        
        
        var action3 = component.get("c.prodType");
        action3.setParams({
            recordId :recordId
        });
        action3.setCallback(this,function(response){
            var state = response.getState();
            if(state == "SUCCESS"){
                var res = response.getReturnValue();
                if(res != null){
                    component.set("v.prodType",res);
                }
            }
        });
        $A.enqueueAction(action3);
        component.set("v.progress1",true);
        component.set("v.step",'step-1');
        
        /*   var RowItemList2 = component.get("v.smartOtherProdList");
        RowItemList2.push({
            'sobjectType': 'Custom_Product__c',
            'ProductName__c': '',
            'Type_of_billing__c': '',
            'MrcPrice__c': '',
            'Quantity__c': '',
            'Total__c': '',
            'Opportunity__c' : ''
        });
        // set the updated list to attribute (contactList) again    
        component.set("v.smartOtherProdList2", RowItemList2);
       */
    },
    showSpinner: function(component, event, helper) {
        // make Spinner attribute true for display loading spinner 
        component.set("v.Spinner", true); 
    },
    
    // this function automatic call by aura:doneWaiting event 
    hideSpinner : function(component,event,helper){
        // make Spinner attribute to false for hide loading spinner    
        component.set("v.Spinner", false);
    },
    selectSite : function(component, event, helper) {
        debugger
        component.set("v.isSiteError", false);
        component.set("v.siteError", ''); 
        
        var isBackToSite = component.get("v.isBackToSite");
        if(isBackToSite == true){
            var check = event.getSource().get("v.checked");
            var value = event.getSource().get("v.label");
            // var check = event.target.checked;
            // var value = event.target.value;
            component.set("v.siteCheck",check);
            component.set("v.page",value);
            component.set("v.siteNumber",value);
            component.set("v.isAgainServerCall",true);
            component.set("v.isAgainServerCall2",true);
            component.set("v.isAgainServerCall3",true);
            component.set("v.isAgainServerCall4",true);
            component.set("v.isAgainServerCall5",true);
            component.set("v.isAgainServerCall6",true);
        }else{
            var check = event.getSource().get("v.checked");
            var value = event.getSource().get("v.label");
            //var check = event.target.checked;
            //var value = event.target.value;
            component.set("v.siteCheck",check);
            component.set("v.page",value);
            component.set("v.siteNumber",value);
        }
        var action2 = component.get("c.typeOfPoe");
        action2.setParams({
            recordId : component.get("v.recordId"),
            site : component.get("v.siteNumber")
        });
        action2.setCallback(this,function(response){
            var state = response.getState();
            if(state == "SUCCESS"){
                var res = response.getReturnValue();
                if(res != null){
                    component.set("v.poe",res);
                }
            }
        });
        $A.enqueueAction(action2);
        var action4 = component.get("c.getCustomProdList");
        action4.setParams({
            recordId : component.get("v.recordId"),
            siteNumber :  component.get("v.siteNumber")
        });
        action4.setCallback(this,function(response){
            var state = response.getState();
            if(state == "SUCCESS"){
                var res = response.getReturnValue();
                if(res.length != 0){
                    component.set("v.addProductList",res);
                    component.set("v.smartOtherProdList",res);
                }
                else{
                    var RowItemList = component.get("v.addProductList");
                    if(RowItemList.length == 0){
                        RowItemList.push({
                            'sobjectType': 'Custom_Product__c',
                            'ProductName__c': '',
                            'Type_of_billing__c': '',
                            'MrcPrice__c': '',
                            'Quantity__c': '',
                            'Total__c': '',
                            'Opportunity__c' : '',
                            'Id': '',
                            'NumberOfSites__c': '',
                        });
                        component.set("v.addProductList", RowItemList);
                        var RowItemList2 = component.get("v.smartOtherProdList");
                        RowItemList2.push({
                            'sobjectType': 'Custom_Product__c',
                            'ProductName__c': '',
                            'Type_of_billing__c': '',
                            'MrcPrice__c': '',
                            'Quantity__c': '',
                            'Total__c': '',
                            'Opportunity__c' : '',
                            'Id': '',
                            'NumberOfSites__c': '',
                        });
                        // set the updated list to attribute (contactList) again    
                        component.set("v.smartOtherProdList", RowItemList2);
                    }
                    else{
                        
                    }
                }
            }
        });
        $A.enqueueAction(action4);
        
    },
    backToOpportunity : function(component, event, helper) {
          debugger
        var recordId = component.get("v.recordId");
        //window.parent.location = 'https://ftr--ucaastest.cs45.my.salesforce.com' + '/' + recordId;
        var action = component.get("c.fetchit");
        action.setCallback(this, function(response) {
            debugger
            var state = response.getState();
            if (state === "SUCCESS") {
                debugger
                var res = response.getReturnValue();
                if(res != null){
                      window.location.href = res + '/'+ recordId;
                }
            }
        });
        
        $A.enqueueAction(action);
    },
    close : function(component, event, helper) {
        debugger
        var dismissActionPanel = $A.get("e.force:closeQuickAction");
        dismissActionPanel.fire();
    },
    
    backToPage1 : function(component, event, helper) {
        debugger
        var quoteType = component.get("v.prodType");
        if(quoteType == "Frontier Anyware"){
            component.set("v.isLicPage",false);
            component.set("v.isPage1",true);
            component.set("v.progress1",true);
            component.set("v.step",'step-1');
            component.set("v.stopServerCall",false);
            component.set("v.isBackToSite",true);
        }else if(quoteType == "Smart Voice"){
            component.set("v.isSmartLicensePage",false);
            component.set("v.isPage1",true);
            component.set("v.progress1",true);
            component.set("v.step",'step-1');
            component.set("v.stopServerCall",false);
            component.set("v.isBackToSite",true);
             component.set("v.isPremiumRule",false);
        }
    },
    backToPage2 :  function(component, event, helper) {
        debugger
        component.set("v.isChecked",false);   
        var quoteType = component.get("v.prodType");
        if(quoteType == "Frontier Anyware"){
            component.set("v.isIpPhonePage",false);   
            component.set("v.isLicPage",true);
            component.set("v.progress2",true);
            component.set("v.step",'step-2');
            component.set("v.stopServerCall2",false);
        }else if(quoteType == "Smart Voice"){
            component.set("v.isSmartIpPhonePage",false);
            component.set("v.isSmartLicensePage",true);
            component.set("v.progress2",true);
            component.set("v.step",'step-2');
            component.set("v.stopServerCall2",false);
             component.set("v.isIpPhoneRule",false);
             component.set("v.isIpPhoneRule2",false);
            
        }
    },
    backToPage3 :  function(component, event, helper) {
        debugger
        var quoteType = component.get("v.prodType");
        if(quoteType == "Frontier Anyware"){
            component.set("v.isAddOnPage",false);   
            component.set("v.isIpPhonePage",true);
            component.set("v.progress3",true);
            component.set("v.step",'step-3');
            component.set("v.stopServerCall3",false);
        }else if(quoteType == "Smart Voice"){
            component.set("v.isSmartAddOnPage",false);
            component.set("v.isSmartIpPhonePage",true);
            component.set("v.progress3",true);
            component.set("v.step",'step-3');
            component.set("v.stopServerCall3",false);
            component.set("v.isChecked",false);
        }
    },
    backToPage4 : function(component, event, helper) {
        debugger
        var quoteType = component.get("v.prodType");
        if(quoteType == "Frontier Anyware"){
            component.set("v.isTelecommPage",false);
            component.set("v.isAddOnPage",true);
            component.set("v.progress4",true);
            component.set("v.step",'step-4');
            component.set("v.stopServerCall4",false);
            component.set("v.isTelecommRule",false);
            component.set("v.errorRuleTelecomm",'');
            
        }else if(quoteType == "Smart Voice"){
            component.set("v.isSmartTelecommPage",false);
            component.set("v.isSmartAddOnPage",true);
            component.set("v.progress4",true);
            component.set("v.step",'step-4');
            component.set("v.stopServerCall4",false);
            component.set("v.isTelecommRule",false);
        }
    },
    backToPage5 : function(component, event, helper) {
        debugger
        var quoteType = component.get("v.prodType");
        if(quoteType == "Frontier Anyware"){
            component.set("v.isSwitchPage",false);
            component.set("v.isSwitchPage",true);
            component.set("v.progress5",true);
            component.set("v.step",'step-5');
            component.set("v.stopServerCall5",false);
        }else if(quoteType == "Smart Voice"){
            component.set("v.isSmartSwitchesPage",false);
            component.set("v.isSmartTelecommPage",true);
            component.set("v.progress5",true);
            component.set("v.step",'step-5');
            component.set("v.stopServerCall5",false);
        }
    },
    backToPage6 : function(component, event, helper) {
        debugger
        var quoteType = component.get("v.prodType");
        if(quoteType == "Frontier Anyware"){
            component.set("v.isAccessoriesPage",false);
            component.set("v.isSwitchPage",true);
            component.set("v.progress6",true);
            component.set("v.step",'step-6');
            component.set("v.stopServerCall6",false);
        }else if(quoteType == "Smart Voice"){
            component.set("v.isPageSmartVoiceEquipment",false);
            component.set("v.isSmartSwitchesPage",true);
            component.set("v.progress6",true);
            component.set("v.step",'step-6');
            component.set("v.stopServerCall6",false);
        }
    },
    backToPage7 : function(component, event, helper) {
        debugger
        var quoteType = component.get("v.prodType");
        if(quoteType == "Frontier Anyware"){
            component.set("v.isCustomPage",false);
            component.set("v.isAccessoriesPage",true);
            component.set("v.progress7",true);
            component.set("v.step",'step-7');
            component.set("v.stopServerCall7",false);
        }else if(quoteType == "Smart Voice"){
            component.set("v.isSmartRepairPage",false);
            component.set("v.isPageSmartVoiceEquipment",true);
            component.set("v.progress7",true);
            component.set("v.step",'step-7');
            component.set("v.stopServerCall7",false);
        }
        
    },
    backToPage8 : function(component, event, helper) {
        debugger
        var quoteType = component.get("v.prodType");
        if(quoteType == "Frontier Anyware"){
            component.set("v.isPreviewPage",false);
            component.set("v.isCustomPage",true);
            component.set("v.progress8",true);
            component.set("v.step",'step-8');
            component.set("v.stopServerCall8",false);
            var RowItemList = component.get("v.addProductList");
            if(RowItemList.length == 0){
                RowItemList.push({
                    'sobjectType': 'Custom_Product__c',
                    'ProductName__c': '',
                    'Type_of_billing__c': '',
                    'MrcPrice__c': '',
                    'Quantity__c': '',
                    'Total__c': '',
                    'Opportunity__c' : '',
                    'Id': '',
                    'NumberOfSites__c': '',
                });
                component.set("v.addProductList", RowItemList);
            }
        }else if(quoteType == "Smart Voice"){
            component.set("v.isPageSmartVoiceBroadband",false);
            component.set("v.isSmartRepairPage",true);
            component.set("v.progress8",true);
            component.set("v.step",'step-8');
            component.set("v.stopServerCall8",false);
        }
    },
    backToPage9 : function(component, event, helper) {
        debugger
        component.set("v.isPageSmartVoiceFIOS",false);
        component.set("v.isPageSmartVoiceBroadband",true);
        component.set("v.progress9",true);
        component.set("v.step",'step-9');
        component.set("v.stopServerCall9",false);
    },
    backToPage10 : function(component, event, helper) {
        debugger
        component.set("v.isPageSmartVoiceFiber",false);
        component.set("v.isPageSmartVoiceFIOS",true);
        component.set("v.progress10",true);
        component.set("v.step",'step-10');
        component.set("v.stopServerCall10",false);
    },
    backToPage11 : function(component, event, helper) {
        debugger
        component.set("v.isPageSmartVoiceBHSI",false);
        component.set("v.isPageSmartVoiceFiber",true);
        component.set("v.progress11",true);
        component.set("v.step",'step-11');
        component.set("v.stopServerCall11",false);
    },
    backToPage12 : function(component, event, helper) {
        debugger
        component.set("v.isSmartOtherPage",false);
        component.set("v.isPageSmartVoiceBHSI",true);
        component.set("v.progress12",true);
        component.set("v.step",'step-12');
        component.set("v.stopServerCall12",false);
    },
    backToPage13 : function(component, event, helper) {
        debugger
        
        component.set("v.isSmartPreviewPage",false);
        component.set("v.isSmartOtherPage",true);
        component.set("v.progress12",true);
        component.set("v.step",'step-12');
        component.set("v.stopServerCall12",false);
        component.set("v.isChecked",false);
        component.set("v.isPremiumRule",false);
        component.set("v.isTelecommRule",false);
         component.set("v.isSmartTelecommRule",false);
        component.set("v.errorRuleTelecomm",'');
        component.set("v.isIpPhoneRule",false);
        component.set("v.isIpPhoneRule2",false);
        
        var RowItemList2 = component.get("v.smartOtherProdList");
        if(RowItemList2.length == 0){
            RowItemList2.push({
                'sobjectType': 'Custom_Product__c',
                'ProductName__c': '',
                'Type_of_billing__c': '',
                'MrcPrice__c': '',
                'Quantity__c': '',
                'Total__c': '',
                'Opportunity__c' : '',
                'Id': '',
                'NumberOfSites__c': '',
            });
            // set the updated list to attribute (contactList) again
            component.set("v.smartOtherProdList", RowItemList2);
        }
        
    },
    /* backToPage7 :  function(component, event, helper) {
        debugger
        var quoteType = component.get("v.prodType");
        if(quoteType == "Frontier Anyware"){
            component.set("v.isCustomPage",false);   
            component.set("v.isAccessoriesPage",true);
            component.set("v.progress7",true);
            component.set("v.step",'step-7');
            component.set("v.stopServerCall7",false);
        }else if(quoteType == "Smart Voice"){
            component.set("v.isSmartPreviewPage",false);
            component.set("v.isSmartOtherPage",true);
            component.set("v.progress7",true);
            component.set("v.step",'step-7');
            component.set("v.stopServerCall7",false);
            var RowItemList2 = component.get("v.smartOtherProdList");
            if(RowItemList2.length == 0){
                RowItemList2.push({
                    'sobjectType': 'Custom_Product__c',
                    'ProductName__c': '',
                    'Type_of_billing__c': '',
                    'MrcPrice__c': '',
                    'Quantity__c': '',
                    'Total__c': '',
                    'Opportunity__c' : '',
                    'Id': '',
                    'NumberOfSites__c': '',
                });
                // set the updated list to attribute (contactList) again    
                component.set("v.smartOtherProdList", RowItemList2);
            }
            
        }
            
    },*/
    
    onCheckLicense : function(component, event, helper) {
        debugger
        var id = event.target.value;
        var check = event.target.checked;
        debugger
        if(check == false){
            var productList = component.get("v.productList");
            for(var i = 0 ; i < productList.length ; i++){
                if(productList[i].product.Id == id){
                    productList[i].product.Quantity__c = '';
                }
            }
            component.set("v.productList",productList);
            component.set("v.isErrorLicense",false);
        }
        else{
            var productList = component.get("v.productList");
            for(var i = 0 ; i < productList.length ; i++){
                if(productList[i].product.Id == id){
                    productList[i].boolval = true;
                    component.set("v.productList",productList);
                }
            }
        }
        
    },
    onCheckIpPhone :  function(component, event, helper) {
        debugger
        var id = event.getSource().get("v.value");
        var check = event.getSource().get("v.checked");
        if(check == false){
            var productListIpPhones = component.get("v.productListIpPhones");
            for(var i = 0 ; i < productListIpPhones.length ; i++){
                if(productListIpPhones[i].product.Id == id){
                    productListIpPhones[i].product.Quantity__c = '';
                }
            }
            component.set("v.productListIpPhones",productListIpPhones);
            component.set("v.isErrorLicense",false);
        }
        else{
            var productListIpPhones = component.get("v.productListIpPhones");
            for(var i = 0 ; i < productListIpPhones.length ; i++){
                if(productListIpPhones[i].product.Id == id){
                    productListIpPhones[i].boolval = true;
                    component.set("v.productListIpPhones",productListIpPhones);
                }
            }
            
        }
        
    },
    onCheckAddOn :  function(component, event, helper) {
        debugger
        var id = event.getSource().get("v.value");
        var check = event.getSource().get("v.checked");
        if(check == false){
            var productListAddOn = component.get("v.productListAddOn");
            for(var i = 0 ; i < productListAddOn.length ; i++){
                if(productListAddOn[i].product.Id == id){
                    productListAddOn[i].product.Quantity__c = '';
                }
            }
            component.set("v.productListAddOn",productListAddOn);
            component.set("v.isErrorLicense",false);
        }
        else{
            var productListAddOn = component.get("v.productListAddOn");
            for(var i = 0 ; i < productListAddOn.length ; i++){
                if(productListAddOn[i].product.Id == id){
                    if(productListAddOn[i].product.Name.includes('Business Analytics Report')){
                        productListAddOn[i].product.Quantity__c = component.get("v.prodQty");
                        productListAddOn[i].boolval = true ;
                        component.set("v.productListAddOn",productListAddOn);
                    }
                }
            }
        }
    },
    onCheckTelecomm : function(component, event, helper) {
        debugger
        var id = event.getSource().get("v.value");
        var check = event.getSource().get("v.checked");
        if(check == false){
            var productListTelecomm = component.get("v.productListTelecomm");
            for(var i = 0 ; i < productListTelecomm.length ; i++){
                if(productListTelecomm[i].product.Id == id){
                    productListTelecomm[i].product.Quantity__c = '';
                }
            }
            component.set("v.productListTelecomm",productListTelecomm);
            component.set("v.isErrorLicense",false);
        }
        else{
            var productListTelecomm = component.get("v.productListTelecomm");
            for(var i = 0 ; i < productListTelecomm.length ; i++){
                if(productListTelecomm[i].product.Id == id){
                    productListTelecomm[i].boolval = true;
                    component.set("v.productListTelecomm",productListTelecomm);
                }
            }
        }
    },
    onCheckSwitchAndPOE :  function(component, event, helper) {
        debugger
        var id = event.getSource().get("v.value");
        var check = event.getSource().get("v.checked");
        if(check == false){
            var swithesAndPOElist = component.get("v.swithesAndPOElist");
            for(var i = 0 ; i < swithesAndPOElist.length ; i++){
                if(swithesAndPOElist[i].product.Id == id){
                    swithesAndPOElist[i].product.Quantity__c = '';
                }
            }
            component.set("v.swithesAndPOElist",swithesAndPOElist);
            component.set("v.isErrorLicense",false);
        }
        else{
            var swithesAndPOElist = component.get("v.swithesAndPOElist");
            for(var i = 0 ; i < swithesAndPOElist.length ; i++){
                if(swithesAndPOElist[i].product.Id == id){
                    swithesAndPOElist[i].boolval = true;
                    component.set("v.swithesAndPOElist",swithesAndPOElist);
                }
            }
            
        }
        
    },
    onCheckAccessories :  function(component, event, helper) {
        debugger
        var id = event.getSource().get("v.value");
        var check = event.getSource().get("v.checked");
        if(check == false){
            var productListIPPhonePower = component.get("v.productListIPPhonePower");
            for(var i = 0 ; i < productListIPPhonePower.length ; i++){
                if(productListIPPhonePower[i].product.Id == id){
                    productListIPPhonePower[i].product.Quantity__c = '';
                }
            }
            component.set("v.productListIPPhonePower",productListIPPhonePower);
            component.set("v.isErrorLicense",false);
        }
        else{
            var productListIPPhonePower = component.get("v.productListIPPhonePower");
            for(var i = 0 ; i < productListIPPhonePower.length ; i++){
                if(productListIPPhonePower[i].product.Id == id){
                    productListIPPhonePower[i].boolval = true;
                    component.set("v.productListIPPhonePower",productListIPPhonePower);
                }
            }
            
        }
        
    },
    cancelPage :  function(component, event, helper) {
        debugger
        component.set("v.siteCheck",false);
        
    },
    cancelPage2 :  function(component, event, helper) {
        debugger
        var action = component.get("c.getLicenseprodList");
        action.setParams({
            recordId : component.get("v.recordId"),
            siteNumber : component.get("v.siteNumber")
        });
        action.setCallback(this,function(response){
            var state = response.getState();
            if(state == "SUCCESS"){
                var res = response.getReturnValue();
                if(res != null){
                    component.set("v.productList",res);
                }
            }
        });
        $A.enqueueAction(action);
        component.set("v.isErrorLicense",false);
        
    },
    cancelSmartPage2 :  function(component, event, helper) {
        debugger
        var action3 = component.get("c.getLicenseSmartProdList");
        action3.setParams({
            recordId : component.get("v.recordId"),
            siteNumber : component.get("v.siteNumber")
        });
        action3.setCallback(this,function(response){
            var state = response.getState();
            if(state == "SUCCESS"){
                var res = response.getReturnValue();
                if(res != null){
                    component.set("v.smartLicensesList",res);
                }}
        });
        $A.enqueueAction(action3);
        component.set("v.isErrorLicense",false);   
    },
    cancelPage3 :  function(component, event, helper) {
        debugger
        var action = component.get("c.getLicenseprodList");
        action.setParams({
            recordId : component.get("v.recordId"),
            siteNumber : component.get("v.siteNumber")
        });
        action.setCallback(this,function(response){
            var state = response.getState();
            if(state == "SUCCESS"){
                var res = response.getReturnValue();
                if(res != null){
                    component.set("v.productListIpPhones",res);
                }
            }
        });
        $A.enqueueAction(action);
        component.set("v.isErrorLicense",false);   
        component.set("v.isChecked",false);  
    },
    cancelSmartPage4 : function(component, event, helper) {
        debugger
        var action2 = component.get("c.smartVoiceAdOnProd");
        action2.setParams({
            recordId : component.get("v.recordId"),
            siteNumber : component.get("v.siteNumber")
        });
        action2.setCallback(this,function(response){
            var state = response.getState();
            if(state == "SUCCESS"){
                var res = response.getReturnValue();
                if(res != null){
                    component.set("v.smartAdOnList",res);
                }}
        });
        $A.enqueueAction(action2);   
        component.set("v.isErrorLicense",false); 
    },
    cancelPage4 :  function(component, event, helper) {
        debugger
        var action = component.get("c.getAddOnProdList");
        var recordId = component.get("v.recordId");
        action.setParams({
            recordId : component.get("v.recordId"),
            siteNumber : component.get("v.siteNumber")
        });
        action.setCallback(this,function(response){
            var state = response.getState();
            if(state == "SUCCESS"){
                var res = response.getReturnValue();
                if(res != null){
                    component.set("v.productListAddOn",res);
                }}
        });
        $A.enqueueAction(action);
        component.set("v.isErrorLicense",false);   
        component.set("v.isChecked",false);
    },
    cancelSmartPage3 : function(component, event, helper) {
        debugger
        var action2 = component.get("c.getIpPhoneSmartProdList");
        action2.setParams({
            recordId : component.get("v.recordId"),
            siteNumber : component.get("v.siteNumber")
        });
        action2.setCallback(this,function(response){
            var state = response.getState();
            if(state == "SUCCESS"){
                var res = response.getReturnValue();
                if(res != null){
                    component.set("v.smartIpPhoneList",res);
                }}
        });
        $A.enqueueAction(action2);   
        component.set("v.isErrorLicense",false);         
    },
    cancelSmartPage5 : function(component, event, helper) {
        debugger
        var action2 = component.get("c.getSwitchesSmartProdList");
        action2.setParams({
            recordId : component.get("v.recordId"),
            siteNumber : component.get("v.siteNumber")
        });
        action2.setCallback(this,function(response){
            var state = response.getState();
            if(state == "SUCCESS"){
                var res = response.getReturnValue();
                if(res != null){
                    component.set("v.smartSwitchPoeList",res);
                }}
        });
        $A.enqueueAction(action2);   
        component.set("v.isErrorLicense",false);         
    },
    cancelSmartTelecomm : function(component, event, helper) {
        debugger
        var action2 = component.get("c.smartVoiceTelecommProd");
        action2.setParams({
            recordId : component.get("v.recordId"),
            siteNumber : component.get("v.siteNumber")
        });
        action2.setCallback(this,function(response){
            var state = response.getState();
            if(state == "SUCCESS"){
                var res = response.getReturnValue();
                if(res != null){
                    component.set("v.smartTelecommList",res);
                }}
        });
        $A.enqueueAction(action2);   
        component.set("v.isErrorLicense",false);         
    },
    cancelSmartPage6 : function(component, event, helper) {
        debugger
        var action2 = component.get("c.smartVoiceEquipmentProd");
        action2.setParams({
            recordId : component.get("v.recordId"),
            siteNumber : component.get("v.siteNumber")
        });
        action2.setCallback(this,function(response){
            var state = response.getState();
            if(state == "SUCCESS"){
                var res = response.getReturnValue();
                if(res != null){
                    component.set("v.smartEquipmentList",res);
                }}
        });
        $A.enqueueAction(action2);   
        component.set("v.isErrorLicense",false);         
    },
    cancelSmartPage7 : function(component, event, helper) {
        debugger
        var action2 = component.get("c.getRepairSmartProdList");
        action2.setParams({
            recordId : component.get("v.recordId"),
            siteNumber : component.get("v.siteNumber")
        });
        action2.setCallback(this,function(response){
            var state = response.getState();
            if(state == "SUCCESS"){
                var res = response.getReturnValue();
                if(res != null){
                    component.set("v.smartRepairList",res);
                }}
        });
        $A.enqueueAction(action2);   
        component.set("v.isErrorLicense",false);         
    },
    cancelSmartPage8 : function(component, event, helper) {
        debugger
        var action2 = component.get("c.smartVoiceBroadbandProd");
        action2.setParams({
            recordId : component.get("v.recordId"),
            siteNumber : component.get("v.siteNumber")
        });
        action2.setCallback(this,function(response){
            var state = response.getState();
            if(state == "SUCCESS"){
                var res = response.getReturnValue();
                if(res != null){
                    component.set("v.smartBroadbandList",res);
                }}
        });
        $A.enqueueAction(action2);   
        component.set("v.isErrorLicense",false);         
    },
    cancelSmartPage9 : function(component, event, helper) {
        debugger
        var action2 = component.get("c.smartVoiceFIOSProd");
        action2.setParams({
            recordId : component.get("v.recordId"),
            siteNumber : component.get("v.siteNumber")
        });
        action2.setCallback(this,function(response){
            var state = response.getState();
            if(state == "SUCCESS"){
                var res = response.getReturnValue();
                if(res != null){
                    component.set("v.smartFIOSList",res);
                }}
        });
        $A.enqueueAction(action2);   
        component.set("v.isErrorLicense",false);         
    },
    cancelSmartPage10 : function(component, event, helper) {
        debugger
        var action2 = component.get("c.smartVoiceFiberProd");
        action2.setParams({
            recordId : component.get("v.recordId"),
            siteNumber : component.get("v.siteNumber")
        });
        action2.setCallback(this,function(response){
            var state = response.getState();
            if(state == "SUCCESS"){
                var res = response.getReturnValue();
                if(res != null){
                    component.set("v.smartFiberList",res);
                }}
        });
        $A.enqueueAction(action2);   
        component.set("v.isErrorLicense",false);         
    },
    cancelSmartPage11 : function(component, event, helper) {
        debugger
        var action2 = component.get("c.smartVoiceBHSIProd");
        action2.setParams({
            recordId : component.get("v.recordId"),
            siteNumber : component.get("v.siteNumber")
        });
        action2.setCallback(this,function(response){
            var state = response.getState();
            if(state == "SUCCESS"){
                var res = response.getReturnValue();
                if(res != null){
                    component.set("v.smartBHSIList",res);
                }}
        });
        $A.enqueueAction(action2);   
        component.set("v.isErrorLicense",false);         
    },
    cancelSmartPage12 : function(component, event, helper) {
        debugger
        var action2 = component.get("c.smartVoiceAsymetricFiberProd");
        action2.setParams({
            recordId : component.get("v.recordId"),
            siteNumber : component.get("v.siteNumber")
        });
        action2.setCallback(this,function(response){
            var state = response.getState();
            if(state == "SUCCESS"){
                var res = response.getReturnValue();
                if(res != null){
                    component.set("v.smartAsymetricFiberList",res);
                }}
        });
        $A.enqueueAction(action2);   
        component.set("v.isErrorLicense",false);         
    },
    
    cancelSmartPage13 : function(component, event, helper) {
        debugger
        var list = [];
        component.set("v.smartOtherProdList",list);
        var RowItemList = component.get("v.smartOtherProdList");
        RowItemList.push({
            'sobjectType': 'Custom_Product__c',
            'ProductName__c': '',
            'Type_of_billing__c': '',
            'MrcPrice__c': '',
            'Quantity__c': '',
            'Total__c': '',
            'Opportunity__c' : ''
        });
        // set the updated list to attribute (contactList) again    
        component.set("v.smartOtherProdList", RowItemList);
        
    },
    cancelSmartPage14 : function(component, event, helper) {
        debugger
        var list = [];
        component.set("v.smartLicensesList2",list);
        component.set("v.smartAdOnList2",list);
        component.set("v.smartIpPhoneList2",list);
        component.set("v.smartSwitchPoeList2",list);
        component.set("v.smartActivationFeesList2",list);
        component.set("v.smartRepairList2",list);
        component.set("v.smartOtherProdList2",list);
        component.set("v.cancelPreview",false);
    },
    cancelPage5 :  function(component, event, helper) {
        debugger
        var recordId = component.get("v.recordId");
        var action2 = component.get("c.prodTelecomm");
        action2.setParams({
            recordId : component.get("v.recordId"),
            siteNumber : component.get("v.siteNumber")
        });
        action2.setCallback(this,function(response2){
            var state2 = response2.getState();
            if(state2 == "SUCCESS"){
                var res2 = response2.getReturnValue();
                if(res2 != null){
                    component.set("v.productListTelecomm",res2);
                }
            }
        });
        $A.enqueueAction(action2);
        component.set("v.isErrorLicense",false);   
        
    },
    cancelPage6 : function(component, event, helper) {
        debugger
        var action = component.get("c.prodSwitchesAndPOE");
        var recordId = component.get("v.recordId");
        action.setParams({
            recordId : component.get("v.recordId"),
            siteNumber : component.get("v.siteNumber")
        });
        action.setCallback(this,function(response){
            var state = response.getState();
            if(state == "SUCCESS"){
                var res = response.getReturnValue();
                if(res != null){
                    component.set("v.swithesAndPOElist",res);
                }}
        });
        $A.enqueueAction(action);         
        component.set("v.isErrorLicense",false);   
        component.set("v.isChecked",false);   
        
    },
    cancelPage7 : function(component, event, helper) {
        debugger
        var action = component.get("c.getAccessoriesProdList");
        var recordId = component.get("v.recordId");
        action.setParams({
            recordId : component.get("v.recordId"),
            siteNumber : component.get("v.siteNumber")
        });
        action.setCallback(this,function(response){
            var state = response.getState();
            if(state == "SUCCESS"){
                var res = response.getReturnValue();
                if(res != null){
                    component.set("v.productListIPPhonePower",res);
                }}
        });
        $A.enqueueAction(action);         
        component.set("v.isErrorLicense",false);   
        component.set("v.isChecked",false);   
        
    },
    cancelPage8 : function(component, event, helper) {
        debugger
        var list = [];
        component.set("v.addProductList",list);
        var RowItemList = component.get("v.addProductList");
        RowItemList.push({
            'sobjectType': 'Custom_Product__c',
            'ProductName__c': '',
            'Type_of_billing__c': '',
            'MrcPrice__c': '',
            'Quantity__c': '',
            'Total__c': '',
            'Opportunity__c' : '',
            'Id': '',
            'NumberOfSites__c': '',
        });
        // set the updated list to attribute (contactList) again    
        component.set("v.addProductList", RowItemList);
        
    },
    nextToLicPage : function(component, event, helper) {
        debugger
        var siteNumber = component.get("v.siteNumber");
        if(siteNumber == undefined || siteNumber == ""){
            component.set("v.isSiteError", true);
            component.set("v.siteError", 'Please select any one'); 
        }
        else{
            component.set("v.isSiteError", false);
            component.set("v.siteError", ''); 
            var stopServerCall = component.get("v.stopServerCall");
            if(stopServerCall == true){
                var quoteType = component.get("v.quoteType");
                if(quoteType == "Frontier Anyware"){
                    var action = component.get("c.getLicenseprodList");
                    action.setParams({
                        recordId : component.get("v.recordId"),
                        siteNumber : component.get("v.siteNumber")
                    });
                    action.setCallback(this,function(response){
                        var state = response.getState();
                        if(state == "SUCCESS"){
                            var res = response.getReturnValue();
                            if(res != null){
                                component.set("v.productList",res);
                            }
                        }
                    });
                    $A.enqueueAction(action);
                    component.set("v.isPage1",false);
                    component.set("v.isLicPage",true);
                    component.set("v.progress2",true);
                    component.set("v.step",'step-2');
                }
                else if(quoteType == "Smart Voice"){
                    var action3 = component.get("c.getLicenseSmartProdList");
                    action3.setParams({
                        recordId : component.get("v.recordId"),
                        siteNumber : component.get("v.siteNumber")
                    });
                    action3.setCallback(this,function(response){
                        var state = response.getState();
                        if(state == "SUCCESS"){
                            var res = response.getReturnValue();
                            if(res != null){
                                component.set("v.smartLicensesList",res);
                            }}
                    });
                    $A.enqueueAction(action3);
                    component.set("v.isPage1",false);
                    component.set("v.isSmartLicensePage",true);
                    component.set("v.progress2",true);
                    component.set("v.step",'step-2');
                }
            }
            else{
                var quoteType = component.get("v.quoteType");
                if(quoteType == "Frontier Anyware"){
                    var isAgainServerCall = component.get("v.isAgainServerCall");
                    if(isAgainServerCall == true){
                        var action = component.get("c.getLicenseprodList");
                        action.setParams({
                            recordId : component.get("v.recordId"),
                            siteNumber : component.get("v.siteNumber")
                        });
                        action.setCallback(this,function(response){
                            var state = response.getState();
                            if(state == "SUCCESS"){
                                var res = response.getReturnValue();
                                if(res != null){
                                    component.set("v.productList",res);
                                }
                            }
                        });
                        $A.enqueueAction(action);
                        component.set("v.isAgainServerCall",false);
                    }
                    component.set("v.isPage1",false);
                    component.set("v.isLicPage",true);
                    component.set("v.progress2",true);
                    component.set("v.step",'step-2');
                }
                else if(quoteType == "Smart Voice"){
                    var isAgainServerCall = component.get("v.isAgainServerCall");
                    if(isAgainServerCall == true){
                        var action3 = component.get("c.getLicenseSmartProdList");
                        action3.setParams({
                            recordId : component.get("v.recordId"),
                            siteNumber : component.get("v.siteNumber")
                        });
                        action3.setCallback(this,function(response){
                            var state = response.getState();
                            if(state == "SUCCESS"){
                                var res = response.getReturnValue();
                                if(res != null){
                                    component.set("v.smartLicensesList",res);
                                }}
                        });
                        $A.enqueueAction(action3);
                        component.set("v.isAgainServerCall",false);
                    }
                    component.set("v.isPage1",false);
                    component.set("v.isSmartLicensePage",true);
                    component.set("v.progress2",true);
                    component.set("v.step",'step-2');
                }
            }
        }
    },
    nextToIpPhonePage : function(component, event, helper) {
        debugger
        var productList = component.get("v.productList");
        for(var i = 0 ; i < productList.length ; i++){
            if(productList[i].boolval == true){
                if((productList[i].product.Quantity__c != undefined) && (productList[i].product.Quantity__c != "")){
                    component.set("v.isCondition",true);
                }
                else{
                    component.set("v.isCondition",false);
                    component.set("v.isLicPage",true);
                    component.set("v.isIpPhonePage",false);
                    component.set("v.isErrorLicense",true);
                    component.set("v.errorLicense",'You checked but did not add a quantity');
                    break;
                }
            }
            else{
                component.set("v.isCondition",true);
            }
        }
        var isCondition = component.get("v.isCondition");
        if(isCondition == true){
            component.set("v.isErrorLicense",false);
            component.set("v.errorLicense",'');
            component.set("v.isLicPage",false);
            component.set("v.isIpPhonePage",true);
            component.set("v.progress3",true);
            component.set("v.step",'step-3');
            var stopServerCall2 = component.get("v.stopServerCall2");
            var recordId = component.get("v.recordId");
            if(stopServerCall2 == true){
                var quoteType = component.get("v.prodType");
                if(quoteType == "Frontier Anyware"){
                    var action = component.get("c.getIpPhoneProdList");
                    action.setParams({
                        recordId : component.get("v.recordId"),
                        siteNumber : component.get("v.siteNumber")
                    });
                    action.setCallback(this,function(response){
                        var state = response.getState();
                        if(state == "SUCCESS"){
                            var res = response.getReturnValue();
                            if(res != null){
                                var  selVal4 = component.get("v.poe");
                                if((selVal4 == 'Customer Provided') || (selVal4 == 'Switch')){
                                    for(var i = 0; i < res.length ; i++){
                                        if(res[i].product.IpPhone__c == true){
                                            res[i].boolval3 = true;
                                            component.set("v.productListIpPhones",res);
                                        }
                                        else{
                                            res[i].boolval3 = false;
                                            component.set("v.productListIpPhones",res);
                                        }
                                    }
                                }
                                else{
                                    for(var i = 0; i < res.length ; i++){
                                        if(res[i].product.POE__c == true){
                                            res[i].boolval3 = true;
                                            component.set("v.productListIpPhones",res);
                                        }
                                        else{
                                            res[i].boolval3 = false;
                                            component.set("v.productListIpPhones",res);
                                        }
                                    }
                                    
                                }
                            }
                        }
                        
                    });
                    $A.enqueueAction(action);
                    
                }
                else if(quoteType == "smart voice"){
                    var action3 = component.get("c.SmartVoiceIpPhonesProd");
                    action3.setParams({
                        ids : recordId
                    });
                    action3.setCallback(this,function(response){
                        var state = response.getState();
                        if(state == "SUCCESS"){
                            var res = response.getReturnValue();
                            if(res != null){
                                component.set("v.productListIpPhones",res);
                            }}
                    });
                    $A.enqueueAction(action3);
                }                             
            }
            else{
                var quoteType = component.get("v.prodType");
                if(quoteType == "Frontier Anyware"){
                    var isAgainServerCall2 = component.get("v.isAgainServerCall2");
                    if(isAgainServerCall2 == true){
                        var action = component.get("c.getIpPhoneProdList");
                        action.setParams({
                            recordId : component.get("v.recordId"),
                            siteNumber : component.get("v.siteNumber")
                        });
                        action.setCallback(this,function(response){
                            var state = response.getState();
                            if(state == "SUCCESS"){
                                var res = response.getReturnValue();
                                if(res != null){
                                    var  selVal4 = component.get("v.poe");
                                    if((selVal4 == 'Customer Provided') || (selVal4 == 'Switch')){
                                        for(var i = 0; i < res.length ; i++){
                                            if(res[i].product.IpPhone__c == true){
                                                res[i].boolval3 = true;
                                                component.set("v.productListIpPhones",res);
                                            }
                                            else{
                                                res[i].boolval3 = false;
                                                component.set("v.productListIpPhones",res);
                                            }
                                        }
                                    }
                                    else{
                                        for(var i = 0; i < res.length ; i++){
                                            if(res[i].product.POE__c == true){
                                                res[i].boolval3 = true;
                                                component.set("v.productListIpPhones",res);
                                            }
                                            else{
                                                res[i].boolval3 = false;
                                                component.set("v.productListIpPhones",res);
                                            }
                                        }
                                        
                                    }
                                }
                            }
                            
                        });
                        $A.enqueueAction(action);
                        component.set("v.isAgainServerCall2",false);
                    }
                }
                else if(quoteType == "smart voice"){
                    var isAgainServerCall2 = component.get("v.isAgainServerCall2");
                    if(isAgainServerCall2 == true){
                        var action3 = component.get("c.SmartVoiceIpPhonesProd");
                        action3.setParams({
                            ids : recordId
                        });
                        action3.setCallback(this,function(response){
                            var state = response.getState();
                            if(state == "SUCCESS"){
                                var res = response.getReturnValue();
                                if(res != null){
                                    component.set("v.productListIpPhones",res);
                                }}
                        });
                        $A.enqueueAction(action3);
                        component.set("v.isAgainServerCall2",false);
                    }                             
                }
            }
            
        }
    },
    nextToAddOnPage : function(component, event, helper) {
        debugger
        var productListIpPhones = component.get("v.productListIpPhones");
        console.log('hgchhh'+productListIpPhones.map(a => a.pricebookEntry.UnitPrice));
        for(var i = 0 ; i < productListIpPhones.length ; i++){
            if(productListIpPhones[i].boolval == true){
                if((productListIpPhones[i].product.Quantity__c != undefined) && (productListIpPhones[i].product.Quantity__c != "")){
                    component.set("v.isCondition",true);
                }
                else{
                    component.set("v.isCondition",false);
                    component.set("v.isIpPhonePage",true);
                    component.set("v.isAddOnPage",false);
                    component.set("v.isErrorLicense",true);
                    component.set("v.errorLicense",'You checked but did not add a quantity');
                    break;
                }
            }
            else{
                component.set("v.isCondition",true);
            }
        }
        var isCondition = component.get("v.isCondition");
        if(isCondition == true){
            var qty = 0; 
            var productList = component.get("v.productList");
            for(var i = 0 ; i < productList.length ; i++){
                if(productList[i].boolval == true){
                    qty = qty + parseInt(productList[i].product.Quantity__c);
                }
            }
            var prodQty =  qty.toString();
            component.set("v.prodQty",prodQty);
            var productList = component.get("v.productList");
            var productListIpPhones = component.get("v.productListIpPhones");
            var action2 = component.get("c.rule2");
            action2.setParams({
                licenselist : productList,
                phonelist : productListIpPhones
            });
            action2.setCallback(this,function(response){
                var state = response.getState();
                if(state == "SUCCESS"){
                    var res = response.getReturnValue();
                    if(res == 'false'){
                        component.set("v.isChecked",false);
                        component.set("v.isErrorLicense",false);
                        component.set("v.errorLicense",'');
                        component.set("v.isIpPhonePage",false);
                        component.set("v.isAddOnPage",true);
                        component.set("v.progress4",true);
                        // component.set("v.progress9",true);
                        component.set("v.step",'step-4');
                        var stopServerCall3 = component.get("v.stopServerCall3");
                        if(stopServerCall3 == true){
                            var action = component.get("c.getAddOnProdList");
                            var recordId = component.get("v.recordId");
                            action.setParams({
                                recordId : recordId,
                                siteNumber :  component.get("v.siteNumber")
                            });
                            action.setCallback(this,function(response){
                                var state = response.getState();
                                if(state == "SUCCESS"){
                                    var res = response.getReturnValue();
                                    if(res != null){
                                        for(var i = 0 ; i < res.length; i++){
                                            if(res[i].product.Name.includes('Business Analytics Report')){
                                                res[i].product.Quantity__c = prodQty;
                                            }
                                        }
                                        component.set("v.productListAddOn",res);
                                    }}
                            });
                            $A.enqueueAction(action);
                        }
                        else{
                            var isAgainServerCall3 = component.get("v.isAgainServerCall3");
                            if(isAgainServerCall3 == true){
                                var action = component.get("c.getAddOnProdList");
                                var recordId = component.get("v.recordId");
                                action.setParams({
                                    recordId : recordId,
                                    siteNumber :  component.get("v.siteNumber")
                                });
                                action.setCallback(this,function(response){
                                    var state = response.getState();
                                    if(state == "SUCCESS"){
                                        var res = response.getReturnValue();
                                        if(res != null){
                                            for(var i = 0 ; i < res.length; i++){
                                                if(res[i].product.Name.includes('Business Analytics Report')){
                                                    res[i].product.Quantity__c = prodQty;
                                                }
                                            }
                                            component.set("v.productListAddOn",res);
                                        }
                                    }
                                });
                                $A.enqueueAction(action);
                                component.set("v.isAgainServerCall3",false);
                            }
                            
                        }
                    }else{
                        component.set("v.error",res);
                        component.set("v.isChecked",true);
                    }
                }
            });
            $A.enqueueAction(action2);
        }
        
        
    },
    nextToTelecommPage :  function(component, event, helper) {
        debugger
        var productListAddOn = component.get("v.productListAddOn");
        for(var i = 0 ; i < productListAddOn.length ; i++){
            if(productListAddOn[i].boolval == true){
                if((productListAddOn[i].product.Quantity__c != undefined) && (productListAddOn[i].product.Quantity__c != "")){
                    component.set("v.isCondition",true);
                }
                else{
                    component.set("v.isCondition",false);
                    component.set("v.isAddOnPage",true);
                    component.set("v.isTelecommPage",false);
                    component.set("v.isErrorLicense",true);
                    component.set("v.errorLicense",'You checked but did not add a quantity');
                    break;
                }
            }
            else{
                component.set("v.isCondition",true);
            }
        }
        var isCondition = component.get("v.isCondition");
        if(isCondition == true){
            var page = component.get("v.page");            
            for(var i = 0 ; i < productListAddOn.length ; i++){
                if(productListAddOn[i].product.Name.includes('E911')){
                    if(productListAddOn[i].boolval == true){
                        component.set("v.isErrorLicense",false);
                        component.set("v.errorLicense",'');
                        component.set("v.isAddOnPage",false);
                        component.set("v.isTelecommPage",true);
                        component.set("v.progress5",true);
                        component.set("v.step",'step-5');
                        var stopServerCall4 = component.get("v.stopServerCall4");
                        if(stopServerCall4 == true){
                            var action2 = component.get("c.getTelecommProdList");
                            action2.setParams({
                                recordId : component.get("v.recordId"),
                                siteNumber : component.get("v.siteNumber")
                            });
                            action2.setCallback(this,function(response2){
                                var state2 = response2.getState();
                                if(state2 == "SUCCESS"){
                                    var res2 = response2.getReturnValue();
                                    if(res2 != null){
                                        component.set("v.productListTelecomm",res2);
                                    }
                                }
                            });
                            $A.enqueueAction(action2);
                        }
                    }
                    else{
                        if(page == 1){
                            component.set("v.isErrorLicense",false);
                            component.set("v.errorLicense",'');
                            component.set("v.isAddOnPage",false);
                            component.set("v.isTelecommPage",true);
                            component.set("v.progress5",true);
                            component.set("v.step",'step-5');
                            var stopServerCall4 = component.get("v.stopServerCall4");
                            if(stopServerCall4 == true){
                                var action2 = component.get("c.getTelecommProdList");
                                action2.setParams({
                                    recordId : component.get("v.recordId"),
                                    siteNumber : component.get("v.siteNumber")
                                });
                                action2.setCallback(this,function(response2){
                                    var state2 = response2.getState();
                                    if(state2 == "SUCCESS"){
                                        var res2 = response2.getReturnValue();
                                        if(res2 != null){
                                            component.set("v.productListTelecomm",res2);
                                        }
                                    }
                                });
                                $A.enqueueAction(action2);
                            }
                            else{
                                var isAgainServerCall4 = component.get("v.isAgainServerCall4");
                                if(isAgainServerCall4 == true){
                                    var action2 = component.get("c.getTelecommProdList");
                                    action2.setParams({
                                        recordId : component.get("v.recordId"),
                                        siteNumber : component.get("v.siteNumber")
                                    });
                                    action2.setCallback(this,function(response2){
                                        var state2 = response2.getState();
                                        if(state2 == "SUCCESS"){
                                            var res2 = response2.getReturnValue();
                                            if(res2 != null){
                                                component.set("v.productListTelecomm",res2);
                                            }
                                        }
                                    });
                                    $A.enqueueAction(action2);
                                    component.set("v.isAgainServerCall4",false);
                                }
                            }
                        }
                        else{
                            component.set("v.error",'E911 is mandatory for site > 1');
                            component.set("v.isChecked",true);
                        }
                    }
                }
            }
        }
        /* var action = component.get("c.rule1");
            var recordId = component.get("v.recordId");
            var productListAddOn = component.get("v.productListAddOn");
            action.setParams({
                wraperlist : productListAddOn,
                recordId : recordId
            });
            action.setCallback(this,function(response){
                var state = response.getState();
                if(state == "SUCCESS"){
                    var res = response.getReturnValue();
                    if(res == "false"){
                        component.set("v.isErrorLicense",false);
                        component.set("v.errorLicense",'');
                        component.set("v.isAddOnPage",false);
                        component.set("v.isTelecommPage",true);
                        component.set("v.progress5",true);
                        component.set("v.step",'step-5');
                        var stopServerCall4 = component.get("v.stopServerCall4");
                        if(stopServerCall4 == true){
                            var action2 = component.get("c.getTelecommProdList");
                            action2.setParams({
                                recordId : recordId,
                                siteNumber : component.get("v.siteNumber")
                            });
                            action2.setCallback(this,function(response2){
                                var state2 = response2.getState();
                                if(state2 == "SUCCESS"){
                                    var res2 = response2.getReturnValue();
                                    if(res2 != null){
                                        component.set("v.productListTelecomm",res2);
                                    }
                                }
                            });
                            $A.enqueueAction(action2);
                        }
                        else{
                            var isAgainServerCall4 = component.get("v.isAgainServerCall4");
                            if(isAgainServerCall4 == true){
                                var action2 = component.get("c.getTelecommProdList");
                                action2.setParams({
                                    recordId : recordId,
                                    siteNumber : component.get("v.siteNumber")
                                });
                                action2.setCallback(this,function(response2){
                                    var state2 = response2.getState();
                                    if(state2 == "SUCCESS"){
                                        var res2 = response2.getReturnValue();
                                        if(res2 != null){
                                            component.set("v.productListTelecomm",res2);
                                        }
                                    }
                                });
                                $A.enqueueAction(action2);
                                component.set("v.isAgainServerCall4",false);
                            }
                        }
                    }
                    else{
                        component.set("v.error",res);
                        component.set("v.isChecked",true);
                    }
                }
            });           
            $A.enqueueAction(action);
          
        } */ 
        
    },
    nextToSwitchPage : function(component, event, helper) {
        debugger
        var productListTelecomm = component.get("v.productListTelecomm");
        for(var i = 0 ; i < productListTelecomm.length ; i++){
            if(productListTelecomm[i].boolval == true){
                if((productListTelecomm[i].product.Quantity__c != undefined) && (productListTelecomm[i].product.Quantity__c != "")){
                    component.set("v.isCondition",true);
                }
                else{
                    component.set("v.isCondition",false);
                    component.set("v.isTelecommPage",true);
                    component.set("v.isSwitchPage",false);
                    component.set("v.isErrorLicense",true);
                    component.set("v.errorLicense",'You checked but did not add a quantity');
                    break;
                }
            }
            else{
                component.set("v.isCondition",true);
            }
        }
        var isCondition = component.get("v.isCondition");
        if(isCondition == true){
            
            var productListAddOn = component.get("v.productListAddOn");
            var productListTelecomm = component.get("v.productListTelecomm");
            var action = component.get("c.telecommRule3");
            action.setParams({
                addOnList : productListAddOn,
                telecommList : productListTelecomm
            });
            action.setCallback(this,function(response){
                var state = response.getState();
                if(state == "SUCCESS"){
                    var res = response.getReturnValue();
                    if(res == "false"){
                        component.set("v.isErrorLicense",false);
                        component.set("v.errorLicense",'');
                        component.set("v.isTelecommPage",false);
                        component.set("v.isSwitchPage",true);
                        component.set("v.progress6",true);
                        //component.set("v.progress11",true);
                        component.set("v.step",'step-6');
                        component.set("v.isTelecommRule",false);
                        var stopServerCall5 = component.get("v.stopServerCall5");
                        if(stopServerCall5 == true){
                            var quoteType = component.get("v.quoteType");
                            var recordId = component.get("v.recordId");
                            if(quoteType == "Frontier Anyware"){
                                var action4 = component.get("c.getSwitchProdList");
                                action4.setParams({
                                    recordId : recordId,
                                    siteNumber : component.get("v.siteNumber")
                                });
                                action4.setCallback(this,function(response){
                                    var state = response.getState();
                                    if(state == "SUCCESS"){
                                        var res = response.getReturnValue();
                                        if(res != null){
                                            component.set("v.swithesAndPOElist",res);
                                        }}
                                });
                                $A.enqueueAction(action4);
                            }
                            else if(quoteType == "smart voice"){
                                var recordId = component.get("v.recordId");
                                var action3 = component.get("c.smartVoiceSwitchesAndPOEProd");
                                action3.setParams({
                                    ids : recordId
                                });
                                action3.setCallback(this,function(response){
                                    var state = response.getState();
                                    if(state == "SUCCESS"){
                                        var res = response.getReturnValue();
                                        if(res != null){
                                            component.set("v.swithesAndPOElist",res);
                                        }}
                                });
                                $A.enqueueAction(action3);
                            }
                        }
                        else{
                            var isAgainServerCall5 = component.get("v.isAgainServerCall5");
                            if(isAgainServerCall5 == true){
                                var quoteType = component.get("v.quoteType");
                                var recordId = component.get("v.recordId");
                                if(quoteType == "Frontier Anyware"){
                                    var action4 = component.get("c.getSwitchProdList");
                                    action4.setParams({
                                        recordId : recordId,
                                        siteNumber : component.get("v.siteNumber")
                                    });
                                    action4.setCallback(this,function(response){
                                        var state = response.getState();
                                        if(state == "SUCCESS"){
                                            var res = response.getReturnValue();
                                            if(res != null){
                                                component.set("v.swithesAndPOElist",res);
                                            }}
                                    });
                                    $A.enqueueAction(action4);
                                    component.set("v.isAgainServerCall5",false);
                                }
                                else if(quoteType == "smart voice"){
                                    var recordId = component.get("v.recordId");
                                    var action3 = component.get("c.smartVoiceSwitchesAndPOEProd");
                                    action3.setParams({
                                        ids : recordId
                                    });
                                    action3.setCallback(this,function(response){
                                        var state = response.getState();
                                        if(state == "SUCCESS"){
                                            var res = response.getReturnValue();
                                            if(res != null){
                                                component.set("v.swithesAndPOElist",res);
                                            }}
                                    });
                                    $A.enqueueAction(action3);
                                    component.set("v.isAgainServerCall5",false);
                                }
                            }
                            
                        }
                    }
                    else{
                        component.set("v.isTelecommRule",true);
                        component.set("v.errorRuleTelecomm",res);
                    }
                }
            });           
            $A.enqueueAction(action);
            
        }
    },
    nextToAccessoriesPage :  function(component, event, helper) {
        debugger
        var swithesAndPOElist = component.get("v.swithesAndPOElist");
        for(var i = 0 ; i < swithesAndPOElist.length ; i++){
            if(swithesAndPOElist[i].boolval == true){
                if((swithesAndPOElist[i].product.Quantity__c != undefined) && (swithesAndPOElist[i].product.Quantity__c != "")){
                    component.set("v.isCondition",true);
                }
                else{
                    component.set("v.isCondition",false);
                    component.set("v.isSwitchPage",true);
                    //component.set("v.isPage12",false);
                    component.set("v.isAccessoriesPage",false);
                    component.set("v.isErrorLicense",true);
                    component.set("v.errorLicense",'You checked but did not add a quantity');
                    break;
                }
            }
            else{
                component.set("v.isCondition",true);
            }
        }
        var isCondition = component.get("v.isCondition");
        if(isCondition == true){
            var recordId =  component.get("v.recordId");
            var poe = component.get("v.poe");
            var swithesAndPOElist = component.get("v.swithesAndPOElist");
            var action2 = component.get("c.poeSwitch");
            action2.setParams({
                swithesAndPOElist : swithesAndPOElist,
                poe : poe
            });
            action2.setCallback(this,function(response){
                var state = response.getState();
                if(state == "SUCCESS"){
                    var res = response.getReturnValue();
                    if(res == "false"){
                        component.set("v.isErrorSwitchRule",false);
                        component.set("v.errorSwitches",'');
                        component.set("v.isErrorLicense",false);
                        component.set("v.errorLicense",'');
                        component.set("v.isSwitchPage",false);
                        component.set("v.cancelPreview",true);
                        // component.set("v.isPage12",true);
                        component.set("v.isAccessoriesPage",true);
                        component.set("v.progress7",true);
                        // component.set("v.progress12",true);
                        component.set("v.step",'step-7');
                        var stopServerCall6 = component.get("v.stopServerCall6");
                        if(stopServerCall6 == true){
                            var quoteType = component.get("v.quoteType");  
                            var action = component.get("c.getAccessoriesProdList");
                            var recordId = component.get("v.recordId");
                            action.setParams({
                                recordId : recordId,
                                siteNumber : component.get("v.siteNumber")
                            });
                            action.setCallback(this,function(response){
                                var state = response.getState();
                                if(state == "SUCCESS"){
                                    var res = response.getReturnValue();
                                    if(res != null){
                                        component.set("v.productListIPPhonePower",res);
                                    }}
                            });
                            $A.enqueueAction(action);
                        }
                        else{
                            var isAgainServerCall6 = component.get("v.isAgainServerCall6");
                            if(isAgainServerCall6 == true){
                                var quoteType = component.get("v.quoteType");  
                                var action = component.get("c.getAccessoriesProdList");
                                var recordId = component.get("v.recordId");
                                action.setParams({
                                    recordId : recordId,
                                    siteNumber : component.get("v.siteNumber")
                                });
                                action.setCallback(this,function(response){
                                    var state = response.getState();
                                    if(state == "SUCCESS"){
                                        var res = response.getReturnValue();
                                        if(res != null){
                                            component.set("v.productListIPPhonePower",res);
                                        }}
                                });
                                $A.enqueueAction(action);
                                component.set("v.isAgainServerCall6",false);
                            }
                            
                        }
                    }
                    else{
                        component.set("v.isErrorSwitchRule",true);
                        component.set("v.errorSwitches",res);
                    }
                }
                
            });
            $A.enqueueAction(action2);
        } 
        
    },
    nextToCustomPage : function(component, event, helper) {
        debugger
        debugger
        var productListIPPhonePower = component.get("v.productListIPPhonePower");
        for(var i = 0 ; i < productListIPPhonePower.length ; i++){
            if(productListIPPhonePower[i].boolval == true){
                if((productListIPPhonePower[i].product.Quantity__c != undefined) && (productListIPPhonePower[i].product.Quantity__c != "")){
                    component.set("v.isCondition",true);
                }
                else{
                    component.set("v.isCondition",false);
                    component.set("v.isAccessoriesPage",true);
                    //component.set("v.isPage12",false);
                    component.set("v.isCustomPage",false);
                    component.set("v.isErrorLicense",true);
                    component.set("v.errorLicense",'You checked but did not add a quantity');
                    break;
                }
            }
            else{
                component.set("v.isCondition",true);
            }
        }
        var isCondition = component.get("v.isCondition");
        if(isCondition == true){
            var recordId =  component.get("v.recordId");
            component.set("v.isErrorLicense",false);
            component.set("v.errorLicense",'');
            component.set("v.isAccessoriesPage",false);
            // component.set("v.isPreviewPage",true);
            // component.set("v.isPage12",true);
            component.set("v.isCustomPage",true);
            component.set("v.progress8",true);
            //    component.set("v.progress13",true);
            component.set("v.step",'step-8');
            
            var productList = component.get("v.productList");
            var productListAddOn = component.get("v.productListAddOn");
            var productListTelecomm = component.get("v.productListTelecomm");
            var productListIpPhones = component.get("v.productListIpPhones");
            var productListIPPhonePower = component.get("v.productListIPPhonePower");
            var swithesAndPOElist = component.get("v.swithesAndPOElist");
            var list = [];
            var list2 = [];
            var list3 = [];
            var list4 = [];
            var list5 = [];
            var list6 = [];
            for(var i = 0; i < productList.length ; i++){
                if(productList[i].boolval == true){
                    list.push(productList[i]);
                }
            }
            for(var i = 0; i < productListAddOn.length ; i++){
                if(productListAddOn[i].boolval == true){
                    list2.push(productListAddOn[i]);
                }
            }
            for(var i = 0; i < productListTelecomm.length ; i++){
                if(productListTelecomm[i].boolval == true){
                    list3.push(productListTelecomm[i]);
                }
            }
            for(var i = 0; i < productListIpPhones.length ; i++){
                if(productListIpPhones[i].boolval == true){
                    list4.push(productListIpPhones[i]);
                }
            }
            for(var i = 0; i < productListIPPhonePower.length ; i++){
                if(productListIPPhonePower[i].boolval == true){
                    list5.push(productListIPPhonePower[i]);
                }
            }
            for(var i = 0; i < swithesAndPOElist.length ; i++){
                if(swithesAndPOElist[i].boolval == true){
                    list6.push(swithesAndPOElist[i]);
                }
            }
            component.set("v.productList2",list);
            component.set("v.productListAddOn2",list2);
            component.set("v.productListTelecomm2",list3);
            component.set("v.productListIpPhones2",list4);
            component.set("v.productListIPPhonePower2",list5);
            component.set("v.swithesAndPOElist2",list6);
            
        }     
        
    },
    nextToPreviewPage :function(component, event, helper) {
        debugger
        component.set("v.isCustomPage",false);
        component.set("v.isPreviewPage",true);
        component.set("v.progress9",true);
        //component.set("v.progress14",true);
        component.set("v.step",'step-9');
        
        var list = [];
        var list2 = [];
        var addProductList = component.get("v.addProductList");
        for(var i = 0 ; i < addProductList.length ; i++){
            if((addProductList[i].ProductName__c == '' || addProductList[i].ProductName__c == undefined) || (addProductList[i].Type_of_billing__c == '' ||  addProductList[i].Type_of_billing__c == undefined ) || (addProductList[i].Quantity__c == '' || addProductList[i].Quantity__c == undefined) || (addProductList[i].MrcPrice__c == '' || addProductList[i].MrcPrice__c == undefined )) {
                list.pop(addProductList[i]);
            }
            else{
                list2.push(addProductList[i]);
            }
        }
        component.set("v.addProductList",list);
        component.set("v.addProductList",list2);
        component.set("v.addProductList2",list);
        component.set("v.addProductList2",list2);
        
    },
    complete :function(component, event, helper) {
        debugger
        var productList2 = component.get("v.productList2");
        if(productList2.length > 0){
            for(var i = 0 ; i < productList2.length ; i++){
                if(productList2[i].boolval == true){
                    if((productList2[i].product.Quantity__c != undefined) && (productList2[i].product.Quantity__c != "")){
                        component.set("v.isCondition",true);
                    }
                    else{
                        component.set("v.isCondition",false);
                        component.set("v.isPreviewPage",true);
                        component.set("v.isCongratsPage",false);
                        component.set("v.isErrorLicense",true);
                        component.set("v.errorLicense",'You checked but did not add a quantity');
                        break;
                    }
                }
                else{
                    component.set("v.isCondition",true);
                }
            }  
        }
        else{
            component.set("v.isCondition",true); 
        }
        
        
        var productListAddOn2 = component.get("v.productListAddOn2");
        if(productListAddOn2.length > 0){
            for(var i = 0 ; i < productListAddOn2.length ; i++){
                if(productListAddOn2[i].boolval == true){
                    if((productListAddOn2[i].product.Quantity__c != undefined) && (productListAddOn2[i].product.Quantity__c != "")){
                        component.set("v.isCondition2",true);
                    }
                    else{
                        component.set("v.isCondition2",false);
                        component.set("v.isPreviewPage",true);
                        component.set("v.isCongratsPage",false);
                        component.set("v.isErrorLicense",true);
                        component.set("v.errorLicense",'You checked but did not add a quantity');
                        break;
                    }
                }
                else{
                    component.set("v.isCondition2",true);
                }
            }
        }
        else{
            component.set("v.isCondition2",true);
        }
        var productListTelecomm2 = component.get("v.productListTelecomm2");
        if(productListTelecomm2.length > 0){
            for(var i = 0 ; i < productListTelecomm2.length ; i++){
                if(productListTelecomm2[i].boolval == true){
                    if((productListTelecomm2[i].product.Quantity__c != undefined) && (productListTelecomm2[i].product.Quantity__c != "")){
                        component.set("v.isCondition3",true);
                    }
                    else{
                        component.set("v.isCondition3",false);
                        component.set("v.isPreviewPage",true);
                        component.set("v.isCongratsPage",false);
                        component.set("v.isErrorLicense",true);
                        component.set("v.errorLicense",'You checked but did not add a quantity');
                        break;
                    }
                }
                else{
                    component.set("v.isCondition3",true);
                }
            } 
        }
        else{
            component.set("v.isCondition3",true);
        }
        var productListIpPhones2 = component.get("v.productListIpPhones2");
        if(productListIpPhones2.length > 0){
            for(var i = 0 ; i < productListIpPhones2.length ; i++){
                if(productListIpPhones2[i].boolval == true){
                    if((productListIpPhones2[i].product.Quantity__c != undefined) && (productListIpPhones2[i].product.Quantity__c != "")){
                        component.set("v.isCondition4",true);
                    }
                    else{
                        component.set("v.isCondition4",false);
                        component.set("v.isPreviewPage",true);
                        component.set("v.isCongratsPage",false);
                        component.set("v.isErrorLicense",true);
                        component.set("v.errorLicense",'You checked but did not add a quantity');
                        break;
                    }
                }
                else{
                    component.set("v.isCondition4",true);
                }
            } 
        }
        else{
            component.set("v.isCondition4",true);
        }
        var productListIPPhonePower2 = component.get("v.productListIPPhonePower2");
        if(productListIPPhonePower2.length > 0){
            for(var i = 0 ; i < productListIPPhonePower2.length ; i++){
                if(productListIPPhonePower2[i].boolval == true){
                    if((productListIPPhonePower2[i].product.Quantity__c != undefined) && (productListIPPhonePower2[i].product.Quantity__c != "")){
                        component.set("v.isCondition5",true);
                    }
                    else{
                        component.set("v.isCondition5",false);
                        component.set("v.isPreviewPage",true);
                        component.set("v.isCongratsPage",false);
                        component.set("v.isErrorLicense",true);
                        component.set("v.errorLicense",'You checked but did not add a quantity');
                        break;
                    }
                }
                else{
                    component.set("v.isCondition5",true);
                }
            }
        }
        else{
            component.set("v.isCondition5",true);
        }
        var swithesAndPOElist2 = component.get("v.swithesAndPOElist2");
        if(swithesAndPOElist2.length > 0){
            for(var i = 0 ; i < swithesAndPOElist2.length ; i++){
                if(swithesAndPOElist2[i].boolval == true){
                    if((swithesAndPOElist2[i].product.Quantity__c != undefined) && (swithesAndPOElist2[i].product.Quantity__c != "")){
                        component.set("v.isCondition6",true);
                    }
                    else{
                        component.set("v.isCondition6",false);
                        component.set("v.isPreviewPage",true);
                        component.set("v.isCongratsPage",false);
                        component.set("v.isErrorLicense",true);
                        component.set("v.errorLicense",'You checked but did not add a quantity');
                        break;
                    }
                }
                else{
                    component.set("v.isCondition6",true);
                }
            }
        }
        else{
            component.set("v.isCondition6",true);
        }
        var isCondition = component.get("v.isCondition");
        var isCondition2 = component.get("v.isCondition2");
        var isCondition3 = component.get("v.isCondition3");
        var isCondition4 = component.get("v.isCondition4");
        var isCondition5 = component.get("v.isCondition5");  
        var isCondition6 = component.get("v.isCondition6");
        
        if((isCondition == true) && (isCondition2 == true) && (isCondition3 == true) && (isCondition4 == true) && (isCondition5 == true) && (isCondition6 == true)){
            var recordId = component.get("v.recordId");
            var action5 = component.get("c.telecommRule3");
            action5.setParams({
                addOnList : component.get("v.productListAddOn2"),
                telecommList : component.get("v.productListTelecomm2")
            });
            action5.setCallback(this,function(response){
                var state = response.getState();
                if(state == "SUCCESS"){
                    var res = response.getReturnValue();
                    if(res == "false"){
                        var productList2 = component.get("v.productList2");
                        var productListIpPhones2 = component.get("v.productListIpPhones2");
                        var action6 = component.get("c.rule2");
                        action6.setParams({
                            licenselist : productList2,
                            phonelist : productListIpPhones2
                        });
                        action6.setCallback(this,function(response){
                            var state = response.getState();
                            if(state == "SUCCESS"){
                                var res = response.getReturnValue();
                                if(res == 'false'){
                                    helper.completed(component,event,helper); 
                                }
                                else{
                                    component.set("v.error",res);
                                    component.set("v.isChecked",true);
                                } 
                            }
                        });
                        $A.enqueueAction(action6); 
                    }
                    else{
                        component.set("v.isTelecommRule",true);
                        component.set("v.errorRuleTelecomm",res);
                    }
                }
            });      
            $A.enqueueAction(action5);  
        }
    },
    selectBilling : function(component, event, helper) {
        debugger
        var val = event.getSource().get("v.value");
    },
    
    onCheckLicense : function(component, event, helper) {
        debugger
        var id = event.target.value;
        var check = event.target.checked;
        debugger
        if(check == false){
            var productList = component.get("v.productList");
            for(var i = 0 ; i < productList.length ; i++){
                if(productList[i].product.Id == id){
                    productList[i].product.Quantity__c = '';
                }
            }
            component.set("v.productList",productList);
            component.set("v.isErrorLicense",false);
        }
        else{
            var productList = component.get("v.productList");
            for(var i = 0 ; i < productList.length ; i++){
                if(productList[i].product.Id == id){
                    productList[i].boolval = true;
                    component.set("v.productList",productList);
                }
            }
        }
        
    },
    onQuantityLicense : function(component, event, helper) {
        debugger
        var patt1 = /[0-9]/g;
        component.set("v.isErrorLicense",false);
        var id = event.getSource().get("v.title");
        var productList = component.get("v.productList");
        for(var i = 0 ; i < productList.length ; i++){
            if(id == productList[i].product.Id){
                var value = productList[i].product.Quantity__c;
                var result = value.match(patt1);     
                if(result != null){
                    productList[i].product.Quantity__c =   result.join('')
                    component.set('v.productList',productList);
                }
                else{
                    productList[i].product.Quantity__c = '';
                    component.set('v.productList',productList);
                }
            }
        }
    },
    onQuantityLicense2 : function(component, event, helper) {
        debugger
        var patt1 = /[0-9]/g;
        component.set("v.isErrorLicense",false);
        var id = event.getSource().get("v.title");
        var productList2 = component.get("v.productList2");
        for(var i = 0 ; i < productList2.length ; i++){
            if(id == productList2[i].product.Id){
                var value = productList2[i].product.Quantity__c;
                var result = value.match(patt1);     
                if(result != null){
                    productList2[i].product.Quantity__c =   result.join('')
                    component.set('v.productList2',productList2);
                }
                else{
                    productList2[i].product.Quantity__c = '';
                    component.set('v.productList2',productList2);
                }
            }
        }
    },
    addOnQuantity : function(component, event, helper) {
        debugger
        var patt1 = /[0-9]/g;
        component.set("v.isChecked",false);
        component.set("v.isErrorLicense",false);
        var id = event.getSource().get("v.title");
        var productListAddOn = component.get("v.productListAddOn");
        for(var i = 0 ; i < productListAddOn.length ; i++){
            if(id == productListAddOn[i].product.Id){
                var value = productListAddOn[i].product.Quantity__c;
                var result = value.match(patt1);     
                if(result != null){
                    productListAddOn[i].product.Quantity__c =   result.join('')
                    component.set('v.productListAddOn',productListAddOn);
                }
                else{
                    productListAddOn[i].product.Quantity__c = '';
                    component.set('v.productListAddOn',productListAddOn);
                }
            }
        }
    },
    addOnQuantity2 : function(component, event, helper) {
        debugger
        var patt1 = /[0-9]/g;
        component.set("v.isChecked",false);
        component.set("v.isErrorLicense",false);
        var id = event.getSource().get("v.title");
        var productListAddOn2 = component.get("v.productListAddOn2");
        for(var i = 0 ; i < productListAddOn2.length ; i++){
            if(id == productListAddOn2[i].product.Id){
                var value = productListAddOn2[i].product.Quantity__c;
                var result = value.match(patt1);     
                if(result != null){
                    productListAddOn2[i].product.Quantity__c =   result.join('')
                    component.set('v.productListAddOn2',productListAddOn2);
                }
                else{
                    productListAddOn2[i].product.Quantity__c = '';
                    component.set('v.productListAddOn2',productListAddOn2);
                }
            }
        }
    },
    onQuantityTelecomm :  function(component, event, helper) {
        debugger
        var patt1 = /[0-9]/g;
        component.set("v.isErrorLicense",false);
        var id = event.getSource().get("v.title");
        var productListTelecomm = component.get("v.productListTelecomm");
        for(var i = 0 ; i < productListTelecomm.length ; i++){
            if(id == productListTelecomm[i].product.Id){
                var value = productListTelecomm[i].product.Quantity__c;
                var result = value.match(patt1);     
                if(result != null){
                    productListTelecomm[i].product.Quantity__c =   result.join('')
                    component.set('v.productListTelecomm',productListTelecomm);
                }
                else{
                    productListTelecomm[i].product.Quantity__c = '';
                    component.set('v.productListTelecomm',productListTelecomm);
                }
            }
        }
    },
    onQuantityTelecomm2 :  function(component, event, helper) {
        debugger
        var patt1 = /[0-9]/g;
        component.set("v.isErrorLicense",false);
        var id = event.getSource().get("v.title");
        var productListTelecomm2 = component.get("v.productListTelecomm2");
        for(var i = 0 ; i < productListTelecomm2.length ; i++){
            if(id == productListTelecomm2[i].product.Id){
                var value = productListTelecomm2[i].product.Quantity__c;
                var result = value.match(patt1);     
                if(result != null){
                    productListTelecomm2[i].product.Quantity__c =   result.join('')
                    component.set('v.productListTelecomm2',productListTelecomm2);
                }
                else{
                    productListTelecomm2[i].product.Quantity__c = '';
                    component.set('v.productListTelecomm2',productListTelecomm2);
                }
            }
        }
    },
    onQuantityIpPhones : function(component, event, helper) {
        debugger
        var patt1 = /[0-9]/g;
        component.set("v.isChecked",false);
        component.set("v.isErrorLicense",false);
        var id = event.getSource().get("v.title");
        var productListIpPhones = component.get("v.productListIpPhones");
        for(var i = 0 ; i < productListIpPhones.length ; i++){
            if(id == productListIpPhones[i].product.Id){
                var value = productListIpPhones[i].product.Quantity__c;
                var result = value.match(patt1);     
                if(result != null){
                    productListIpPhones[i].product.Quantity__c =   result.join('')
                    component.set('v.productListIpPhones',productListIpPhones);
                }
                else{
                    productListIpPhones[i].product.Quantity__c = '';
                    component.set('v.productListIpPhones',productListIpPhones);
                }
            }
        }
    },
    onQuantityIpPhones2 : function(component, event, helper) {
        debugger
        var patt1 = /[0-9]/g;
        component.set("v.isChecked",false);
        component.set("v.isErrorLicense",false);
        var id = event.getSource().get("v.title");
        var productListIpPhones2 = component.get("v.productListIpPhones2");
        for(var i = 0 ; i < productListIpPhones2.length ; i++){
            if(id == productListIpPhones2[i].product.Id){
                var value = productListIpPhones2[i].product.Quantity__c;
                var result = value.match(patt1);     
                if(result != null){
                    productListIpPhones2[i].product.Quantity__c =   result.join('')
                    component.set('v.productListIpPhones2',productListIpPhones2);
                }
                else{
                    productListIpPhones2[i].product.Quantity__c = '';
                    component.set('v.productListIpPhones2',productListIpPhones2);
                }
            }
        }
    },
    onQuantityIpPhonesPower :  function(component, event, helper) {
        debugger
        var patt1 = /[0-9]/g;
        component.set("v.isChecked",false);
        component.set("v.isErrorLicense",false);
        var id = event.getSource().get("v.title");
        var productListIPPhonePower = component.get("v.productListIPPhonePower");
        for(var i = 0 ; i < productListIPPhonePower.length ; i++){
            if(id == productListIPPhonePower[i].product.Id){
                var value = productListIPPhonePower[i].product.Quantity__c;
                var result = value.match(patt1);     
                if(result != null){
                    productListIPPhonePower[i].product.Quantity__c =   result.join('')
                    component.set('v.productListIPPhonePower',productListIPPhonePower);
                }
                else{
                    productListIPPhonePower[i].product.Quantity__c = '';
                    component.set('v.productListIPPhonePower',productListIPPhonePower);
                }
            }
        }
    },
    onQuantityIpPhonesPower2 :  function(component, event, helper) {
        debugger
        var patt1 = /[0-9]/g;
        component.set("v.isChecked",false);
        component.set("v.isErrorLicense",false);
        var id = event.getSource().get("v.title");
        var productListIPPhonePower2 = component.get("v.productListIPPhonePower2");
        for(var i = 0 ; i < productListIPPhonePower2.length ; i++){
            if(id == productListIPPhonePower2[i].product.Id){
                var value = productListIPPhonePower2[i].product.Quantity__c;
                var result = value.match(patt1);     
                if(result != null){
                    productListIPPhonePower2[i].product.Quantity__c =   result.join('')
                    component.set('v.productListIPPhonePower2',productListIPPhonePower2);
                }
                else{
                    productListIPPhonePower2[i].product.Quantity__c = '';
                    component.set('v.productListIPPhonePower2',productListIPPhonePower2);
                }
            }
        }
    },
    onQuantityAccessories :  function(component, event, helper) {
        debugger
        var patt1 = /[0-9]/g;
        component.set("v.isErrorSwitchRule",false);
        component.set("v.isChecked",false);
        component.set("v.isErrorLicense",false);
        var id = event.getSource().get("v.title");
        var swithesAndPOElist = component.get("v.swithesAndPOElist");
        for(var i = 0 ; i < swithesAndPOElist.length ; i++){
            if(id == swithesAndPOElist[i].product.Id){
                var value = swithesAndPOElist[i].product.Quantity__c;
                var result = value.match(patt1);     
                if(result != null){
                    swithesAndPOElist[i].product.Quantity__c =   result.join('')
                    component.set('v.swithesAndPOElist',swithesAndPOElist);
                }
                else{
                    swithesAndPOElist[i].product.Quantity__c = '';
                    component.set('v.swithesAndPOElist',swithesAndPOElist);
                }
            }
        }
    },
    onQuantityAccessories2 :  function(component, event, helper) {
        debugger
        var patt1 = /[0-9]/g;
        component.set("v.isChecked",false);
        component.set("v.isErrorLicense",false);
        var id = event.getSource().get("v.title");
        var swithesAndPOElist2 = component.get("v.swithesAndPOElist2");
        for(var i = 0 ; i < swithesAndPOElist2.length ; i++){
            if(id == swithesAndPOElist2[i].product.Id){
                var value = swithesAndPOElist2[i].product.Quantity__c;
                var result = value.match(patt1);     
                if(result != null){
                    swithesAndPOElist2[i].product.Quantity__c =   result.join('')
                    component.set('v.swithesAndPOElist2',swithesAndPOElist2);
                }
                else{
                    swithesAndPOElist2[i].product.Quantity__c = '';
                    component.set('v.swithesAndPOElist2',swithesAndPOElist2);
                }
            }
        }
    },
    onSmartQuantityLicense2 : function(component, event, helper) {
        debugger
        var patt1 = /[0-9]/g;
        component.set("v.isChecked",false);
        component.set("v.isErrorLicense",false);
        var id = event.getSource().get("v.title");
        var smartLicensesList2 = component.get("v.smartLicensesList2");
        for(var i = 0 ; i < smartLicensesList2.length ; i++){
            if(id == smartLicensesList2[i].product.Id){
                var value = smartLicensesList2[i].product.Quantity__c;
                var result = value.match(patt1);     
                if(result != null){
                    smartLicensesList2[i].product.Quantity__c =   result.join('')
                    component.set('v.smartLicensesList2',smartLicensesList2);
                }
                else{
                    smartLicensesList2[i].product.Quantity__c = '';
                    component.set('v.smartLicensesList2',smartLicensesList2);
                }
            }
        }
        
    },
    onSmartQuantityAdOn2 : function(component, event, helper) {
        debugger
        var patt1 = /[0-9]/g;
        component.set("v.isChecked",false);
        component.set("v.isErrorLicense",false);
        var id = event.getSource().get("v.title");
        var smartAdOnList2 = component.get("v.smartAdOnList2");
        for(var i = 0 ; i < smartAdOnList2.length ; i++){
            if(id == smartAdOnList2[i].product.Id){
                var value = smartAdOnList2[i].product.Quantity__c;
                var result = value.match(patt1);     
                if(result != null){
                    smartAdOnList2[i].product.Quantity__c =   result.join('')
                    component.set('v.smartAdOnList2',smartAdOnList2);
                }
                else{
                    smartAdOnList2[i].product.Quantity__c = '';
                    component.set('v.smartAdOnList2',smartAdOnList2);
                }
            }
        }
    },
      onSmartQuantityTelecomm2 : function(component, event, helper) {
        debugger
        var patt1 = /[0-9]/g;
        component.set("v.isChecked",false);
        component.set("v.isErrorLicense",false);
        var id = event.getSource().get("v.title");
        var smartTelecommList2 = component.get("v.smartTelecommList2");
        for(var i = 0 ; i < smartTelecommList2.length ; i++){
            if(id == smartTelecommList2[i].product.Id){
                var value = smartTelecommList2[i].product.Quantity__c;
                var result = value.match(patt1);     
                if(result != null){
                    smartTelecommList2[i].product.Quantity__c =   result.join('')
                    component.set('v.smartTelecommList2',smartTelecommList2);
                }
                else{
                    smartTelecommList2[i].product.Quantity__c = '';
                    component.set('v.smartTelecommList2',smartTelecommList2);
                }
            }
        }
    },
    onSmartQuantityIpPhones2 : function(component, event, helper) {
        debugger
        var patt1 = /[0-9]/g;
        component.set("v.isChecked",false);
        component.set("v.isErrorLicense",false);
         component.set("v.isIpPhoneRule",false);
         component.set("v.isIpPhoneRule2",false);
        var id = event.getSource().get("v.title");
        var smartIpPhoneList2 = component.get("v.smartIpPhoneList2");
        for(var i = 0 ; i < smartIpPhoneList2.length ; i++){
            if(id == smartIpPhoneList2[i].product.Id){
                var value = smartIpPhoneList2[i].product.Quantity__c;
                var result = value.match(patt1);     
                if(result != null){
                    smartIpPhoneList2[i].product.Quantity__c =   result.join('')
                    component.set('v.smartIpPhoneList2',smartIpPhoneList2);
                }
                else{
                    smartIpPhoneList2[i].product.Quantity__c = '';
                    component.set('v.smartIpPhoneList2',smartIpPhoneList2);
                }
            }
        }
    },
    onSmartQuantitySwitchPoe2 :  function(component, event, helper) {
        debugger
        var patt1 = /[0-9]/g;
        component.set("v.isChecked",false);
        component.set("v.isErrorLicense",false);
        var id = event.getSource().get("v.title");
        var smartSwitchPoeList2 = component.get("v.smartSwitchPoeList2");
        for(var i = 0 ; i < smartSwitchPoeList2.length ; i++){
            if(id == smartSwitchPoeList2[i].product.Id){
                var value = smartSwitchPoeList2[i].product.Quantity__c;
                var result = value.match(patt1);     
                if(result != null){
                    smartSwitchPoeList2[i].product.Quantity__c =   result.join('')
                    component.set('v.smartSwitchPoeList2',smartSwitchPoeList2);
                }
                else{
                    smartSwitchPoeList2[i].product.Quantity__c = '';
                    component.set('v.smartSwitchPoeList2',smartSwitchPoeList2);
                }
            }
        }
    },
     onSmartQuantityEquipment2 :  function(component, event, helper) {
        debugger
        var patt1 = /[0-9]/g;
        component.set("v.isChecked",false);
        component.set("v.isErrorLicense",false);
        var id = event.getSource().get("v.title");
        var smartEquipmentList2 = component.get("v.smartEquipmentList2");
        for(var i = 0 ; i < smartEquipmentList2.length ; i++){
            if(id == smartEquipmentList2[i].product.Id){
                var value = smartEquipmentList2[i].product.Quantity__c;
                var result = value.match(patt1);     
                if(result != null){
                    smartEquipmentList2[i].product.Quantity__c =   result.join('')
                    component.set('v.smartEquipmentList2',smartEquipmentList2);
                }
                else{
                    smartEquipmentList2[i].product.Quantity__c = '';
                    component.set('v.smartEquipmentList2',smartEquipmentList2);
                }
            }
        }
    },
    onSmartQuantityRepair2 :  function(component, event, helper) {
        debugger
        var patt1 = /[0-9]/g;
        component.set("v.isChecked",false);
        component.set("v.isErrorLicense",false);
        var id = event.getSource().get("v.title");
        var smartRepairList2 = component.get("v.smartRepairList2");
        for(var i = 0 ; i < smartRepairList2.length ; i++){
            if(id == smartRepairList2[i].product.Id){
                var value = smartRepairList2[i].product.Quantity__c;
                var result = value.match(patt1);     
                if(result != null){
                    smartRepairList2[i].product.Quantity__c =   result.join('')
                    component.set('v.smartRepairList2',smartRepairList2);
                }
                else{
                    smartRepairList2[i].product.Quantity__c = '';
                    component.set('v.smartRepairList2',smartRepairList2);
                }
            }
        }
    },
     onSmartQuantityBroadband2 :  function(component, event, helper) {
        debugger
        var patt1 = /[0-9]/g;
        component.set("v.isChecked",false);
        component.set("v.isErrorLicense",false);
        var id = event.getSource().get("v.title");
        var smartBroadbandList2 = component.get("v.smartBroadbandList2");
        for(var i = 0 ; i < smartBroadbandList2.length ; i++){
            if(id == smartBroadbandList2[i].product.Id){
                var value = smartBroadbandList2[i].product.Quantity__c;
                var result = value.match(patt1);     
                if(result != null){
                    smartBroadbandList2[i].product.Quantity__c =   result.join('')
                    component.set('v.smartBroadbandList2',smartBroadbandList2);
                }
                else{
                    smartBroadbandList2[i].product.Quantity__c = '';
                    component.set('v.smartBroadbandList2',smartBroadbandList2);
                }
            }
        }
    },
    onSmartQuantityFIOS2 :  function(component, event, helper) {
        debugger
        var patt1 = /[0-9]/g;
        component.set("v.isChecked",false);
        component.set("v.isErrorLicense",false);
        var id = event.getSource().get("v.title");
        var smartFIOSList2 = component.get("v.smartFIOSList2");
        for(var i = 0 ; i < smartFIOSList2.length ; i++){
            if(id == smartFIOSList2[i].product.Id){
                var value = smartFIOSList2[i].product.Quantity__c;
                var result = value.match(patt1);     
                if(result != null){
                    smartFIOSList2[i].product.Quantity__c =   result.join('')
                    component.set('v.smartFIOSList2',smartFIOSList2);
                }
                else{
                    smartFIOSList2[i].product.Quantity__c = '';
                    component.set('v.smartFIOSList2',smartFIOSList2);
                }
            }
        }
    },
    onSmartQuantityFiber2 :  function(component, event, helper) {
        debugger
        var patt1 = /[0-9]/g;
        component.set("v.isChecked",false);
        component.set("v.isErrorLicense",false);
        var id = event.getSource().get("v.title");
        var smartFiberList2 = component.get("v.smartFiberList2");
        for(var i = 0 ; i < smartFiberList2.length ; i++){
            if(id == smartFiberList2[i].product.Id){
                var value = smartFiberList2[i].product.Quantity__c;
                var result = value.match(patt1);     
                if(result != null){
                    smartFiberList2[i].product.Quantity__c =   result.join('')
                    component.set('v.smartFiberList2',smartFiberList2);
                }
                else{
                    smartFiberList2[i].product.Quantity__c = '';
                    component.set('v.smartFiberList2',smartFiberList2);
                }
            }
        }
    },
    onSmartQuantityBHSI2 :  function(component, event, helper) {
        debugger
        var patt1 = /[0-9]/g;
        component.set("v.isChecked",false);
        component.set("v.isErrorLicense",false);
        var id = event.getSource().get("v.title");
        var smartBHSIList2 = component.get("v.smartBHSIList2");
        for(var i = 0 ; i < smartBHSIList2.length ; i++){
            if(id == smartBHSIList2[i].product.Id){
                var value = smartBHSIList2[i].product.Quantity__c;
                var result = value.match(patt1);     
                if(result != null){
                    smartBHSIList2[i].product.Quantity__c =   result.join('')
                    component.set('v.smartBHSIList2',smartBHSIList2);
                }
                else{
                    smartBHSIList2[i].product.Quantity__c = '';
                    component.set('v.smartBHSIList2',smartBHSIList2);
                }
            }
        }
    },
    onSmartQuantityAsymetricFiber2 :  function(component, event, helper) {
        debugger
        var patt1 = /[0-9]/g;
        component.set("v.isChecked",false);
        component.set("v.isErrorLicense",false);
        var id = event.getSource().get("v.title");
        var smartAsymetricFiberList2 = component.get("v.smartAsymetricFiberList2");
        for(var i = 0 ; i < smartAsymetricFiberList2.length ; i++){
            if(id == smartAsymetricFiberList2[i].product.Id){
                var value = smartAsymetricFiberList2[i].product.Quantity__c;
                var result = value.match(patt1);     
                if(result != null){
                    smartAsymetricFiberList2[i].product.Quantity__c =   result.join('')
                    component.set('v.smartAsymetricFiberList2',smartAsymetricFiberList2);
                }
                else{
                    smartAsymetricFiberList2[i].product.Quantity__c = '';
                    component.set('v.smartAsymetricFiberList2',smartAsymetricFiberList2);
                }
            }
        }
    },
    
    onCheckSmartLicense :  function(component, event, helper) {
        debugger
        var id = event.getSource().get("v.value");
        var check = event.getSource().get("v.checked");
        component.set("v.isPremiumRule",false);
        if(check == false){
            var smartLicensesList = component.get("v.smartLicensesList");
            for(var i = 0 ; i < smartLicensesList.length ; i++){
                if(smartLicensesList[i].product.Id == id){
                    smartLicensesList[i].product.Quantity__c = '';
                }
            }
            component.set("v.smartLicensesList",smartLicensesList);
            component.set("v.isErrorLicense",false);
        }
        else{
            var smartLicensesList = component.get("v.smartLicensesList");
            for(var i = 0 ; i < smartLicensesList.length ; i++){
                if(smartLicensesList[i].product.Id == id){
                    smartLicensesList[i].boolval = true ;
                    component.set("v.smartLicensesList",smartLicensesList);
                }
            }
        }
    }, 
    onCheckSmartAdOn :  function(component, event, helper) {
        debugger
        var id = event.getSource().get("v.value");
        var check = event.getSource().get("v.checked");
        if(check == false){
            var smartAdOnList = component.get("v.smartAdOnList");
            for(var i = 0 ; i < smartAdOnList.length ; i++){
                if(smartAdOnList[i].product.Id == id){
                    smartAdOnList[i].product.Quantity__c = '';
                }
            }
            component.set("v.smartAdOnList",smartAdOnList);
            component.set("v.isErrorLicense",false);
        }
        else{
            var smartAdOnList = component.get("v.smartAdOnList");
            for(var i = 0 ; i < smartAdOnList.length ; i++){
                if(smartAdOnList[i].product.Id == id){
                    smartAdOnList[i].boolval = true ;
                    component.set("v.smartAdOnList",smartAdOnList);
                }
            }
        }
    }, 
     onCheckSmartTelecomm :  function(component, event, helper) {
        debugger
        var id = event.getSource().get("v.value");
        var check = event.getSource().get("v.checked");
        if(check == false){
            var smartTelecommList = component.get("v.smartTelecommList");
            for(var i = 0 ; i < smartTelecommList.length ; i++){
                if(smartTelecommList[i].product.Id == id){
                    smartTelecommList[i].product.Quantity__c = '';
                }
            }
            component.set("v.smartTelecommList",smartTelecommList);
            component.set("v.isErrorLicense",false);
        }
        else{
            var smartTelecommList = component.get("v.smartTelecommList");
            for(var i = 0 ; i < smartTelecommList.length ; i++){
                if(smartTelecommList[i].product.Id == id){
                    smartTelecommList[i].boolval = true ;
                    component.set("v.smartTelecommList",smartTelecommList);
                }
            }
        }
    }, 
    onCheckSmartIpPhone :  function(component, event, helper) {
        debugger
         component.set("v.isIpPhoneRule",false);
         component.set("v.isIpPhoneRule2",false);
        var id = event.getSource().get("v.value");
        var check = event.getSource().get("v.checked");
        if(check == false){
            var smartIpPhoneList = component.get("v.smartIpPhoneList");
            for(var i = 0 ; i < smartIpPhoneList.length ; i++){
                if(smartIpPhoneList[i].product.Id == id){
                    smartIpPhoneList[i].product.Quantity__c = '';
                }
            }
            component.set("v.smartIpPhoneList",smartIpPhoneList);
            component.set("v.isErrorLicense",false);
        }
        else{
            var smartIpPhoneList = component.get("v.smartIpPhoneList");
            for(var i = 0 ; i < smartIpPhoneList.length ; i++){
                if(smartIpPhoneList[i].product.Id == id){
                    smartIpPhoneList[i].boolval = true ;
                    component.set("v.smartIpPhoneList",smartIpPhoneList);
                }
            }
        }
    }, 
    onCheckSmartSwitchPoe :  function(component, event, helper) {
        debugger
        var id = event.getSource().get("v.value");
        var check = event.getSource().get("v.checked");
        component.set("v.isTelecommRule",false);
        if(check == false){
            var smartSwitchPoeList = component.get("v.smartSwitchPoeList");
            for(var i = 0 ; i < smartSwitchPoeList.length ; i++){
                if(smartSwitchPoeList[i].product.Id == id){
                    smartSwitchPoeList[i].product.Quantity__c = '';
                }
            }
            component.set("v.smartSwitchPoeList",smartSwitchPoeList);
            component.set("v.isErrorLicense",false);
        }
        else{
            var smartSwitchPoeList = component.get("v.smartSwitchPoeList");
            for(var i = 0 ; i < smartSwitchPoeList.length ; i++){
                if(smartSwitchPoeList[i].product.Id == id){
                    smartSwitchPoeList[i].boolval = true ;
                    component.set("v.smartSwitchPoeList",smartSwitchPoeList);
                }
            }
        }
    }, 
    onCheckSmartEquipment :  function(component, event, helper) {
        debugger
        var id = event.getSource().get("v.value");
        var check = event.getSource().get("v.checked");
        if(check == false){
            var smartEquipmentList = component.get("v.smartEquipmentList");
            for(var i = 0 ; i < smartEquipmentList.length ; i++){
                if(smartEquipmentList[i].product.Id == id){
                    smartEquipmentList[i].product.Quantity__c = '';
                }
            }
            component.set("v.smartEquipmentList",smartEquipmentList);
            component.set("v.isErrorLicense",false);
        }
        else{
            var smartEquipmentList = component.get("v.smartEquipmentList");
            for(var i = 0 ; i < smartEquipmentList.length ; i++){
                if(smartEquipmentList[i].product.Id == id){
                    smartEquipmentList[i].boolval = true ;
                    component.set("v.smartEquipmentList",smartEquipmentList);
                }
            }
        }
    }, 
    onCheckSmartActivationFees :  function(component, event, helper) {
        debugger
        var id = event.getSource().get("v.value");
        var check = event.getSource().get("v.checked");
        if(check == false){
            var smartActivationFeesList = component.get("v.smartActivationFeesList");
            for(var i = 0 ; i < smartActivationFeesList.length ; i++){
                if(smartActivationFeesList[i].product.Id == id){
                    smartActivationFeesList[i].product.Quantity__c = '';
                }
            }
            component.set("v.smartActivationFeesList",smartActivationFeesList);
            component.set("v.isErrorLicense",false);
        }
        else{
            var smartActivationFeesList = component.get("v.smartActivationFeesList");
            for(var i = 0 ; i < smartActivationFeesList.length ; i++){
                if(smartActivationFeesList[i].product.Id == id){
                    smartActivationFeesList[i].boolval = true ;
                    component.set("v.smartActivationFeesList",smartActivationFeesList);
                }
            }
        }
    }, 
    onCheckSmartRepair :  function(component, event, helper) {
        debugger
        var id = event.getSource().get("v.value");
        var check = event.getSource().get("v.checked");
        if(check == false){
            var smartRepairList = component.get("v.smartRepairList");
            for(var i = 0 ; i < smartRepairList.length ; i++){
                if(smartRepairList[i].product.Id == id){
                    smartRepairList[i].product.Quantity__c = '';
                }
            }
            component.set("v.smartRepairList",smartRepairList);
            component.set("v.isErrorLicense",false);
        }
        else{
            var smartRepairList = component.get("v.smartRepairList");
            for(var i = 0 ; i < smartRepairList.length ; i++){
                if(smartRepairList[i].product.Id == id){
                    smartRepairList[i].boolval = true ;
                    component.set("v.smartRepairList",smartRepairList);
                }
            }
        }
    },
    onCheckSmartBroadband :  function(component, event, helper) {
        debugger
        var id = event.getSource().get("v.value");
        var check = event.getSource().get("v.checked");
        if(check == false){
            var smartBroadbandList = component.get("v.smartBroadbandList");
            for(var i = 0 ; i < smartBroadbandList.length ; i++){
                if(smartBroadbandList[i].product.Id == id){
                    smartBroadbandList[i].product.Quantity__c = '';
                }
            }
            component.set("v.smartBroadbandList",smartBroadbandList);
            component.set("v.isErrorLicense",false);
        }
        else{
            var smartBroadbandList = component.get("v.smartBroadbandList");
            for(var i = 0 ; i < smartBroadbandList.length ; i++){
                if(smartBroadbandList[i].product.Id == id){
                    smartBroadbandList[i].boolval = true ;
                    component.set("v.smartBroadbandList",smartBroadbandList);
                }
            }
        }
    },
    onCheckSmartFIOS :  function(component, event, helper) {
        debugger
        var id = event.getSource().get("v.value");
        var check = event.getSource().get("v.checked");
        if(check == false){
            var smartVoiceFIOSProd = component.get("v.smartVoiceFIOSProd");
            for(var i = 0 ; i < smartVoiceFIOSProd.length ; i++){
                if(smartVoiceFIOSProd[i].product.Id == id){
                    smartVoiceFIOSProd[i].product.Quantity__c = '';
                }
            }
            component.set("v.smartVoiceFIOSProd",smartVoiceFIOSProd);
            component.set("v.isErrorLicense",false);
        }
        else{
            var smartVoiceFIOSProd = component.get("v.smartVoiceFIOSProd");
            for(var i = 0 ; i < smartVoiceFIOSProd.length ; i++){
                if(smartVoiceFIOSProd[i].product.Id == id){
                    smartVoiceFIOSProd[i].boolval = true ;
                    component.set("v.smartVoiceFIOSProd",smartVoiceFIOSProd);
                }
            }
        }
    },
    onCheckSmartFiber :  function(component, event, helper) {
        debugger
        var id = event.getSource().get("v.value");
        var check = event.getSource().get("v.checked");
        if(check == false){
            var smartFiberList = component.get("v.smartFiberList");
            for(var i = 0 ; i < smartFiberList.length ; i++){
                if(smartFiberList[i].product.Id == id){
                    smartFiberList[i].product.Quantity__c = '';
                }
            }
            component.set("v.smartFiberList",smartFiberList);
            component.set("v.isErrorLicense",false);
        }
        else{
            var smartFiberList = component.get("v.smartFiberList");
            for(var i = 0 ; i < smartFiberList.length ; i++){
                if(smartFiberList[i].product.Id == id){
                    smartFiberList[i].boolval = true ;
                    component.set("v.smartFiberList",smartFiberList);
                }
            }
        }
    },
    onCheckSmartBHSI : function(component, event, helper) {
        debugger
        var id = event.getSource().get("v.value");
        var check = event.getSource().get("v.checked");
        if(check == false){
            var smartBHSIList = component.get("v.smartBHSIList");
            for(var i = 0 ; i < smartBHSIList.length ; i++){
                if(smartBHSIList[i].product.Id == id){
                    smartBHSIList[i].product.Quantity__c = '';
                }
            }
            component.set("v.smartBHSIList",smartBHSIList);
            component.set("v.isErrorLicense",false);
        }
        else{
            var smartBHSIList = component.get("v.smartBHSIList");
            for(var i = 0 ; i < smartBHSIList.length ; i++){
                if(smartBHSIList[i].product.Id == id){
                    smartBHSIList[i].boolval = true ;
                    component.set("v.smartBHSIList",smartBHSIList);
                }
            }
        }
    },
    
    onCheckSmartAsymetricFiber : function(component, event, helper) {
        debugger
        var id = event.getSource().get("v.value");
        var check = event.getSource().get("v.checked");
        if(check == false){
            var smartAsymetricFiberList = component.get("v.smartAsymetricFiberList");
            for(var i = 0 ; i < smartAsymetricFiberList.length ; i++){
                if(smartAsymetricFiberList[i].product.Id == id){
                    smartAsymetricFiberList[i].product.Quantity__c = '';
                }
            }
            component.set("v.smartAsymetricFiberList",smartAsymetricFiberList);
            component.set("v.isErrorLicense",false);
        }
        else{
            var smartAsymetricFiberList = component.get("v.smartAsymetricFiberList");
            for(var i = 0 ; i < smartAsymetricFiberList.length ; i++){
                if(smartAsymetricFiberList[i].product.Id == id){
                    smartAsymetricFiberList[i].boolval = true ;
                    component.set("v.smartAsymetricFiberList",smartAsymetricFiberList);
                }
            }
        }
    },
    
    addOnQuantity :  function(component, event, helper) {
        debugger
        var patt1 = /[0-9]/g;
        component.set("v.isChecked",false);
        component.set("v.isErrorLicense",false);
        var id = event.getSource().get("v.title");
        var productListAddOn = component.get("v.productListAddOn");
        for(var i = 0 ; i < productListAddOn.length ; i++){
            if(id == productListAddOn[i].product.Id){
                var value = productListAddOn[i].product.Quantity__c;
                var result = value.match(patt1);     
                if(result != null){
                    productListAddOn[i].product.Quantity__c =   result.join('')
                    component.set('v.productListAddOn',productListAddOn);
                }
                else{
                    productListAddOn[i].product.Quantity__c = '';
                    component.set('v.productListAddOn',productListAddOn);
                }
            }
        }        
    },
    addOnQuantity2 : function(component, event, helper) {
        debugger
        var patt1 = /[0-9]/g;
        component.set("v.isChecked",false);
        component.set("v.isErrorLicense",false);
        var id = event.getSource().get("v.title");
        var productListAddOn2 = component.get("v.productListAddOn2");
        for(var i = 0 ; i < productListAddOn2.length ; i++){
            if(id == productListAddOn2[i].product.Id){
                var value = productListAddOn2[i].product.Quantity__c;
                var result = value.match(patt1);     
                if(result != null){
                    productListAddOn2[i].product.Quantity__c =   result.join('')
                    component.set('v.productListAddOn2',productListAddOn2);
                }
                else{
                    productListAddOn2[i].product.Quantity__c = '';
                    component.set('v.productListAddOn2',productListAddOn2);
                }
            }
        }
    },
    
    onQuantityTelecomm :  function(component, event, helper) {
        debugger
        var patt1 = /[0-9]/g;
        component.set("v.isErrorLicense",false);
        var id = event.getSource().get("v.title");
        var productListTelecomm = component.get("v.productListTelecomm");
        for(var i = 0 ; i < productListTelecomm.length ; i++){
            if(id == productListTelecomm[i].product.Id){
                var value = productListTelecomm[i].product.Quantity__c;
                var result = value.match(patt1);     
                if(result != null){
                    productListTelecomm[i].product.Quantity__c =   result.join('')
                    component.set('v.productListTelecomm',productListTelecomm);
                }
                else{
                    productListTelecomm[i].product.Quantity__c = '';
                    component.set('v.productListTelecomm',productListTelecomm);
                }
            }
        }
    },
    onQuantityTelecomm2 :  function(component, event, helper) {
        debugger
        var patt1 = /[0-9]/g;
        component.set("v.isErrorLicense",false);
        var id = event.getSource().get("v.title");
        var productListTelecomm2 = component.get("v.productListTelecomm2");
        for(var i = 0 ; i < productListTelecomm2.length ; i++){
            if(id == productListTelecomm2[i].product.Id){
                var value = productListTelecomm2[i].product.Quantity__c;
                var result = value.match(patt1);     
                if(result != null){
                    productListTelecomm2[i].product.Quantity__c =   result.join('')
                    component.set('v.productListTelecomm2',productListTelecomm2);
                }
                else{
                    productListTelecomm2[i].product.Quantity__c = '';
                    component.set('v.productListTelecomm2',productListTelecomm2);
                }
            }
        }
    },
    
    onQuantityAccessories :  function(component, event, helper) {
        debugger
        var patt1 = /[0-9]/g;
        component.set("v.isErrorSwitchRule",false);
        component.set("v.isChecked",false);
        component.set("v.isErrorLicense",false);
        var id = event.getSource().get("v.title");
        var swithesAndPOElist = component.get("v.swithesAndPOElist");
        for(var i = 0 ; i < swithesAndPOElist.length ; i++){
            if(id == swithesAndPOElist[i].product.Id){
                var value = swithesAndPOElist[i].product.Quantity__c;
                var result = value.match(patt1);     
                if(result != null){
                    swithesAndPOElist[i].product.Quantity__c =   result.join('')
                    component.set('v.swithesAndPOElist',swithesAndPOElist);
                }
                else{
                    swithesAndPOElist[i].product.Quantity__c = '';
                    component.set('v.swithesAndPOElist',swithesAndPOElist);
                }
            }
        }
    },
    onQuantityAccessories2 :  function(component, event, helper) {
        debugger
        var patt1 = /[0-9]/g;
        component.set("v.isChecked",false);
        component.set("v.isErrorLicense",false);
        var id = event.getSource().get("v.title");
        var swithesAndPOElist2 = component.get("v.swithesAndPOElist2");
        for(var i = 0 ; i < swithesAndPOElist2.length ; i++){
            if(id == swithesAndPOElist2[i].product.Id){
                var value = swithesAndPOElist2[i].product.Quantity__c;
                var result = value.match(patt1);     
                if(result != null){
                    swithesAndPOElist2[i].product.Quantity__c =   result.join('')
                    component.set('v.swithesAndPOElist2',swithesAndPOElist2);
                }
                else{
                    swithesAndPOElist2[i].product.Quantity__c = '';
                    component.set('v.swithesAndPOElist2',swithesAndPOElist2);
                }
            }
        }
    },
    
    onQuantityIpPhonesPower :  function(component, event, helper) {
        debugger
        var patt1 = /[0-9]/g;
        component.set("v.isChecked",false);
        component.set("v.isErrorLicense",false);
        var id = event.getSource().get("v.title");
        var productListIPPhonePower = component.get("v.productListIPPhonePower");
        for(var i = 0 ; i < productListIPPhonePower.length ; i++){
            if(id == productListIPPhonePower[i].product.Id){
                var value = productListIPPhonePower[i].product.Quantity__c;
                var result = value.match(patt1);     
                if(result != null){
                    productListIPPhonePower[i].product.Quantity__c =   result.join('')
                    component.set('v.productListIPPhonePower',productListIPPhonePower);
                }
                else{
                    productListIPPhonePower[i].product.Quantity__c = '';
                    component.set('v.productListIPPhonePower',productListIPPhonePower);
                }
            }
        }
    },
    onQuantityIpPhonesPower2 :  function(component, event, helper) {
        debugger
        var patt1 = /[0-9]/g;
        component.set("v.isChecked",false);
        component.set("v.isErrorLicense",false);
        var id = event.getSource().get("v.title");
        var productListIPPhonePower2 = component.get("v.productListIPPhonePower2");
        for(var i = 0 ; i < productListIPPhonePower2.length ; i++){
            if(id == productListIPPhonePower2[i].product.Id){
                var value = productListIPPhonePower2[i].product.Quantity__c;
                var result = value.match(patt1);     
                if(result != null){
                    productListIPPhonePower2[i].product.Quantity__c =   result.join('')
                    component.set('v.productListIPPhonePower2',productListIPPhonePower2);
                }
                else{
                    productListIPPhonePower2[i].product.Quantity__c = '';
                    component.set('v.productListIPPhonePower2',productListIPPhonePower2);
                }
            }
        }
    },
    onSmartQuantityLicense : function(component, event, helper) {
        debugger
        var patt1 = /[0-9]/g;
        component.set("v.isChecked",false);
        component.set("v.isErrorLicense",false);
        var id = event.getSource().get("v.title");
        var smartLicensesList = component.get("v.smartLicensesList");
        for(var i = 0 ; i < smartLicensesList.length ; i++){
            if(id == smartLicensesList[i].product.Id){
                var value = smartLicensesList[i].product.Quantity__c;
                var result = value.match(patt1);     
                if(result != null){
                    smartLicensesList[i].product.Quantity__c =   result.join('')
                    component.set('v.smartLicensesList',smartLicensesList);
                }
                else{
                    smartLicensesList[i].product.Quantity__c = '';
                    component.set('v.smartLicensesList',smartLicensesList);
                }
            }
        }
    },
    onSmartQuantityAdOn : function(component, event, helper) {
        debugger
        var patt1 = /[0-9]/g;
        component.set("v.isChecked",false);
        component.set("v.isErrorLicense",false);
        var id = event.getSource().get("v.title");
        var smartAdOnList = component.get("v.smartAdOnList");
        for(var i = 0 ; i < smartAdOnList.length ; i++){
            if(id == smartAdOnList[i].product.Id){
                var value = smartAdOnList[i].product.Quantity__c;
                var result = value.match(patt1);     
                if(result != null){
                    smartAdOnList[i].product.Quantity__c =   result.join('')
                    component.set('v.smartAdOnList',smartAdOnList);
                }
                else{
                    smartAdOnList[i].product.Quantity__c = '';
                    component.set('v.smartAdOnList',smartAdOnList);
                }
            }
        }
    },
     onSmartQuantityTelecomm : function(component, event, helper) {
        debugger
        var patt1 = /[0-9]/g;
        component.set("v.isChecked",false);
        component.set("v.isErrorLicense",false);
        var id = event.getSource().get("v.title");
        var smartTelecommList = component.get("v.smartTelecommList");
        for(var i = 0 ; i < smartTelecommList.length ; i++){
            if(id == smartTelecommList[i].product.Id){
                var value = smartTelecommList[i].product.Quantity__c;
                var result = value.match(patt1);     
                if(result != null){
                    smartTelecommList[i].product.Quantity__c =   result.join('')
                    component.set('v.smartTelecommList',smartTelecommList);
                }
                else{
                    smartTelecommList[i].product.Quantity__c = '';
                    component.set('v.smartTelecommList',smartTelecommList);
                }
            }
        }
    },
    onSmartQuantityIpPhone : function(component, event, helper) {
        debugger
        var patt1 = /[0-9]/g;
        component.set("v.isChecked",false);
        component.set("v.isErrorLicense",false);
        component.set("v.isIpPhoneRule",false);
        component.set("v.isIpPhoneRule2",false);
        var id = event.getSource().get("v.title");
        var smartIpPhoneList = component.get("v.smartIpPhoneList");
        for(var i = 0 ; i < smartIpPhoneList.length ; i++){
            if(id == smartIpPhoneList[i].product.Id){
                var value = smartIpPhoneList[i].product.Quantity__c;
                var result = value.match(patt1);     
                if(result != null){
                    smartIpPhoneList[i].product.Quantity__c =   result.join('')
                    component.set('v.smartIpPhoneList',smartIpPhoneList);
                }
                else{
                    smartIpPhoneList[i].product.Quantity__c = '';
                    component.set('v.smartIpPhoneList',smartIpPhoneList);
                }
            }
        }
    },
    onSmartQuantitySwitchPoe : function(component, event, helper) {
        debugger
        var patt1 = /[0-9]/g;
        component.set("v.isChecked",false);
        component.set("v.isErrorLicense",false);
        var id = event.getSource().get("v.title");
        var smartSwitchPoeList = component.get("v.smartSwitchPoeList");
        for(var i = 0 ; i < smartSwitchPoeList.length ; i++){
            if(id == smartSwitchPoeList[i].product.Id){
                var value = smartSwitchPoeList[i].product.Quantity__c;
                var result = value.match(patt1);     
                if(result != null){
                    smartSwitchPoeList[i].product.Quantity__c =   result.join('')
                    component.set('v.smartSwitchPoeList',smartSwitchPoeList);
                }
                else{
                    smartSwitchPoeList[i].product.Quantity__c = '';
                    component.set('v.smartSwitchPoeList',smartSwitchPoeList);
                }
            }
        }
    },
    onSmartQuantityEquipment : function(component, event, helper) {
        debugger
        var patt1 = /[0-9]/g;
        component.set("v.isChecked",false);
        component.set("v.isErrorLicense",false);
        var id = event.getSource().get("v.title");
        var smartEquipmentList = component.get("v.smartEquipmentList");
        for(var i = 0 ; i < smartEquipmentList.length ; i++){
            if(id == smartEquipmentList[i].product.Id){
                var value = smartEquipmentList[i].product.Quantity__c;
                var result = value.match(patt1);     
                if(result != null){
                    smartEquipmentList[i].product.Quantity__c =   result.join('')
                    component.set('v.smartEquipmentList',smartEquipmentList);
                }
                else{
                    smartEquipmentList[i].product.Quantity__c = '';
                    component.set('v.smartEquipmentList',smartEquipmentList);
                }
            }
        }
    },
    onSmartQuantityActivationFees : function(component, event, helper) {
        debugger
        var patt1 = /[0-9]/g;
        component.set("v.isChecked",false);
        component.set("v.isErrorLicense",false);
        var id = event.getSource().get("v.title");
        var smartActivationFeesList = component.get("v.smartActivationFeesList");
        for(var i = 0 ; i < smartActivationFeesList.length ; i++){
            if(id == smartActivationFeesList[i].product.Id){
                var value = smartActivationFeesList[i].product.Quantity__c;
                var result = value.match(patt1);     
                if(result != null){
                    smartActivationFeesList[i].product.Quantity__c =   result.join('')
                    component.set('v.smartActivationFeesList',smartActivationFeesList);
                }
                else{
                    smartActivationFeesList[i].product.Quantity__c = '';
                    component.set('v.smartActivationFeesList',smartActivationFeesList);
                }
            }
        }
    },
    onSmartQuantityRepair : function(component, event, helper) {
        debugger
        var patt1 = /[0-9]/g;
        component.set("v.isChecked",false);
        component.set("v.isErrorLicense",false);
        var id = event.getSource().get("v.title");
        var smartRepairList = component.get("v.smartRepairList");
        for(var i = 0 ; i < smartRepairList.length ; i++){
            if(id == smartRepairList[i].product.Id){
                var value = smartRepairList[i].product.Quantity__c;
                var result = value.match(patt1);     
                if(result != null){
                    smartRepairList[i].product.Quantity__c =   result.join('')
                    component.set('v.smartRepairList',smartRepairList);
                }
                else{
                    smartRepairList[i].product.Quantity__c = '';
                    component.set('v.smartRepairList',smartRepairList);
                }
            }
        }
    },
    
    onSmartQuantityBroadband : function(component, event, helper) {
        debugger
        var patt1 = /[0-9]/g;
        component.set("v.isChecked",false);
        component.set("v.isErrorLicense",false);
        var id = event.getSource().get("v.title");
        var smartBroadbandList = component.get("v.smartBroadbandList");
        for(var i = 0 ; i < smartBroadbandList.length ; i++){
            if(id == smartBroadbandList[i].product.Id){
                var value = smartBroadbandList[i].product.Quantity__c;
                var result = value.match(patt1);     
                if(result != null){
                    smartBroadbandList[i].product.Quantity__c =   result.join('')
                    component.set('v.smartBroadbandList',smartBroadbandList);
                }
                else{
                    smartBroadbandList[i].product.Quantity__c = '';
                    component.set('v.smartRepairList',smartBroadbandList);
                }
            }
        }
    },
    onSmartQuantityFIOS : function(component, event, helper) {
        debugger
        var patt1 = /[0-9]/g;
        component.set("v.isChecked",false);
        component.set("v.isErrorLicense",false);
        var id = event.getSource().get("v.title");
        var smartFIOSList = component.get("v.smartFIOSList");
        for(var i = 0 ; i < smartFIOSList.length ; i++){
            if(id == smartFIOSList[i].product.Id){
                var value = smartFIOSList[i].product.Quantity__c;
                var result = value.match(patt1);     
                if(result != null){
                    smartFIOSList[i].product.Quantity__c =   result.join('')
                    component.set('v.smartFIOSList',smartFIOSList);
                }
                else{
                    smartFIOSList[i].product.Quantity__c = '';
                    component.set('v.smartFIOSList',smartFIOSList);
                }
            }
        }
    },
    
    onSmartQuantityFiber : function(component, event, helper) {
        debugger
        var patt1 = /[0-9]/g;
        component.set("v.isChecked",false);
        component.set("v.isErrorLicense",false);
        var id = event.getSource().get("v.title");
        var smartFiberList = component.get("v.smartFiberList");
        for(var i = 0 ; i < smartFiberList.length ; i++){
            if(id == smartFiberList[i].product.Id){
                var value = smartFiberList[i].product.Quantity__c;
                var result = value.match(patt1);     
                if(result != null){
                    smartFiberList[i].product.Quantity__c =   result.join('')
                    component.set('v.smartFiberList',smartFiberList);
                }
                else{
                    smartFiberList[i].product.Quantity__c = '';
                    component.set('v.smartFiberList',smartFiberList);
                }
            }
        }
    },
    onSmartQuantityBHSI : function(component, event, helper) {
        debugger
        var patt1 = /[0-9]/g;
        component.set("v.isChecked",false);
        component.set("v.isErrorLicense",false);
        var id = event.getSource().get("v.title");
        var smartBHSIList = component.get("v.smartBHSIList");
        for(var i = 0 ; i < smartBHSIList.length ; i++){
            if(id == smartBHSIList[i].product.Id){
                var value = smartBHSIList[i].product.Quantity__c;
                var result = value.match(patt1);     
                if(result != null){
                    smartBHSIList[i].product.Quantity__c =   result.join('')
                    component.set('v.smartBHSIList',smartBHSIList);
                }
                else{
                    smartBHSIList[i].product.Quantity__c = '';
                    component.set('v.smartBHSIList',smartBHSIList);
                }
            }
        }
    },
    onSmartQuantityAsymetricFiber : function(component, event, helper) {
        debugger
        var patt1 = /[0-9]/g;
        component.set("v.isChecked",false);
        component.set("v.isErrorLicense",false);
        var id = event.getSource().get("v.title");
        var smartAsymetricFiberList = component.get("v.smartAsymetricFiberList");
        for(var i = 0 ; i < smartAsymetricFiberList.length ; i++){
            if(id == smartAsymetricFiberList[i].product.Id){
                var value = smartAsymetricFiberList[i].product.Quantity__c;
                var result = value.match(patt1);     
                if(result != null){
                    smartAsymetricFiberList[i].product.Quantity__c =   result.join('')
                    component.set('v.smartAsymetricFiberList',smartAsymetricFiberList);
                }
                else{
                    smartAsymetricFiberList[i].product.Quantity__c = '';
                    component.set('v.smartAsymetricFiberList',smartAsymetricFiberList);
                }
            }
        }
    },
    customProdPrice : function(component, event, helper) {
        debugger
        var patt1 = /[0-9,.]/g;
        var priceIndex = event.getSource().get("v.title");
        var quantityIndex = event.getSource().get("v.name");
        var addProductList = component.get("v.addProductList");
        for(var i = 0 ; i < addProductList.length ; i++){
            if(priceIndex == quantityIndex){
                var value = addProductList[i].MrcPrice__c.toString();
                var result = value.match(patt1);     
                if(result != null){
                    addProductList[i].MrcPrice__c =  result.join('')
                    if(addProductList[i].MrcPrice__c.includes('.')){
                    }
                    else{
                        addProductList[i].MrcPrice__c = addProductList[i].MrcPrice__c + '.00';
                    }
                    component.set('v.addProductList',addProductList);
                }
                else{
                    addProductList[i].MrcPrice__c = '';
                    component.set('v.addProductList',addProductList);
                }
            }
        }
        
        /* var patt1 = /[0-9]/g;
        var priceIndex = event.getSource().get("v.title");
        var quantityIndex = event.getSource().get("v.name");
        var addProductList = component.get("v.addProductList");
        for(var i = 0 ; i < addProductList.length ; i++){
            if(priceIndex == quantityIndex){
                var value = addProductList[i].MrcPrice__c;
                var result = value.match(patt1);     
                if(result != null){
                    addProductList[i].MrcPrice__c =   result.join('')
                    component.set('v.addProductList',addProductList);
                }
                else{
                    addProductList[i].MrcPrice__c = '';
                    component.set('v.addProductList',addProductList);
                }
            }
        }*/
        
    },
    customSmartProdPrice : function(component, event, helper) {
        debugger
        var patt1 = /[0-9,.]/g;
        var priceIndex = event.getSource().get("v.title");
        var quantityIndex = event.getSource().get("v.name");
        var smartOtherProdList = component.get("v.smartOtherProdList");
        for(var i = 0 ; i < smartOtherProdList.length ; i++){
            if(priceIndex == quantityIndex){
                var value = smartOtherProdList[i].MrcPrice__c;
                var result = value.match(patt1);     
                if(result != null){
                    smartOtherProdList[i].MrcPrice__c =  result.join('')
                    if(smartOtherProdList[i].MrcPrice__c.includes('.')){
                    }
                    else{
                        smartOtherProdList[i].MrcPrice__c = smartOtherProdList[i].MrcPrice__c + '.00';
                    }
                    component.set('v.smartOtherProdList',smartOtherProdList);
                }
                else{
                    smartOtherProdList[i].MrcPrice__c = '';
                    component.set('v.smartOtherProdList',smartOtherProdList);
                }
            }
        }
        
    },
    
    customPricePreview : function(component, event, helper) {
        debugger
        var patt1 = /[0-9,.]/g;
        var priceIndex = event.getSource().get("v.title");
        var quantityIndex = event.getSource().get("v.label");
        var addProductList2 = component.get("v.addProductList2");
        for(var i = 0 ; i < addProductList2.length ; i++){
            if(priceIndex == quantityIndex){
                var value = addProductList2[i].MrcPrice__c.toString();
                var result = value.match(patt1);     
                if(result != null){
                    addProductList2[i].MrcPrice__c =  result.join('')
                    if(addProductList2[i].MrcPrice__c.includes('.')){
                    }
                    else{
                        addProductList2[i].MrcPrice__c = addProductList2[i].MrcPrice__c + '.00';
                    }
                    component.set('v.addProductList2',addProductList2);
                }
                else{
                    addProductList2[i].MrcPrice__c = '';
                    component.set('v.addProductList2',addProductList2);
                }
            }
        }        
    },
    customSmartPricePreview : function(component, event, helper) {
        debugger
        var patt1 = /[0-9,.]/g;
        var priceIndex = event.getSource().get("v.title");
        var quantityIndex = event.getSource().get("v.label");
        var smartOtherProdList2 = component.get("v.smartOtherProdList2");
        for(var i = 0 ; i < smartOtherProdList2.length ; i++){
            if(priceIndex == quantityIndex){
                var value = smartOtherProdList2[i].MrcPrice__c;
                var result = value.match(patt1);     
                if(result != null){
                    smartOtherProdList2[i].MrcPrice__c =  result.join('')
                    if(smartOtherProdList2[i].MrcPrice__c.includes('.')){
                    }
                    else{
                        smartOtherProdList2[i].MrcPrice__c = smartOtherProdList2[i].MrcPrice__c + '.00';
                    }
                    component.set('v.smartOtherProdList2',smartOtherProdList2);
                }
                else{
                    smartOtherProdList2[i].MrcPrice__c = '';
                    component.set('v.smartOtherProdList2',smartOtherProdList2);
                }
            }
        } 
        
    },
    
    customQuantityPreview : function(component, event, helper) {
        debugger
        var patt1 = /[0-9]/g;
        var priceIndex = event.getSource().get("v.title");
        var quantityIndex = event.getSource().get("v.label");
        var addProductList2 = component.get("v.addProductList2");
        for(var i = 0 ; i < addProductList2.length ; i++){
            if(priceIndex == quantityIndex){
                var value = addProductList2[i].Quantity__c;
                var result = value.match(patt1);     
                if(result != null){
                    addProductList2[i].Quantity__c =   result.join('')
                    component.set('v.addProductList2',addProductList2);
                }
                else{
                    addProductList2[i].Quantity__c = '';
                    component.set('v.addProductList2',addProductList2);
                }
            }
        }
    },
    customSmartQuantityPreview :  function(component, event, helper) {
        debugger
        var patt1 = /[0-9]/g;
        var priceIndex = event.getSource().get("v.title");
        var quantityIndex = event.getSource().get("v.label");
        var smartOtherProdList2 = component.get("v.smartOtherProdList2");
        for(var i = 0 ; i < smartOtherProdList2.length ; i++){
            if(priceIndex == quantityIndex){
                var value = smartOtherProdList2[i].Quantity__c;
                var result = value.match(patt1);     
                if(result != null){
                    smartOtherProdList2[i].Quantity__c =   result.join('')
                    component.set('v.smartOtherProdList2',smartOtherProdList2);
                }
                else{
                    smartOtherProdList2[i].Quantity__c = '';
                    component.set('v.smartOtherProdList2',smartOtherProdList2);
                }
            }
        }
    },
    
    customProdQuantity :  function(component, event, helper) {
        debugger
        var patt1 = /[0-9]/g;
        var priceIndex = event.getSource().get("v.title");
        var quantityIndex = event.getSource().get("v.name");
        var addProductList = component.get("v.addProductList");
        var addProductList = component.get("v.addProductList");
        for(var i = 0 ; i < addProductList.length ; i++){
            if(priceIndex == quantityIndex){
                var value = addProductList[i].Quantity__c;
                var result = value.match(patt1);     
                if(result != null){
                    addProductList[i].Quantity__c =   result.join('')
                    component.set('v.addProductList',addProductList);
                }
                else{
                    addProductList[i].Quantity__c = '';
                    component.set('v.addProductList',addProductList);
                }
            }
        }
    },
    customSmartProdQuantity : function(component, event, helper) {
        debugger
        var patt1 = /[0-9]/g;
        var priceIndex = event.getSource().get("v.title");
        var quantityIndex = event.getSource().get("v.name");
        var smartOtherProdList = component.get("v.smartOtherProdList");
        for(var i = 0 ; i < smartOtherProdList.length ; i++){
            if(priceIndex == quantityIndex){
                var value = smartOtherProdList[i].Quantity__c;
                var result = value.match(patt1);     
                if(result != null){
                    smartOtherProdList[i].Quantity__c =   result.join('');
                    component.set('v.smartOtherProdList',smartOtherProdList);
                }
                else{
                    smartOtherProdList[i].Quantity__c = '';
                    component.set('v.smartOtherProdList',smartOtherProdList);
                }
            }
        }
    },
    
    AddNewRow :  function(component, event, helper) {
        debugger
        component.set("v.disable",false);
        var RowItemList = component.get("v.addProductList");
        RowItemList.push({
            'sobjectType': 'Custom_Product__c',
            'ProductName__c': '',
            'Type_of_billing__c': '',
            'MrcPrice__c': '',
            'Quantity__c': '',
            'Total__c': '',
            'Opportunity__c' : '',
            'Id': '',
            'NumberOfSites__c': '',
        });
        component.set("v.addProductList", RowItemList);
    },
    removeRow :  function(component, event, helper) {
        debugger
        var indexvar = event.getSource().get("v.title");
        // get the all List (contactList attribute) and remove the Object Element Using splice method    
        var AllRowsList = component.get("v.addProductList");
        AllRowsList.splice(indexvar, 1);
        // set the contactList after remove selected row element  
        component.set("v.addProductList", AllRowsList);
        var AllRowsList2 = component.get("v.addProductList2");
        AllRowsList2.splice(indexvar, 1);
        // set the contactList after remove selected row element  
        component.set("v.addProductList2", AllRowsList2);
    },
    AddSmartNewRow :  function(component, event, helper) {
        debugger
        //   component.set("v.disable",false);
        var RowItemList = component.get("v.smartOtherProdList");
        RowItemList.push({
            'sobjectType': 'Custom_Product__c',
            'ProductName__c': '',
            'Type_of_billing__c' : '',
            'MrcPrice__c': '',
            'Quantity__c': '',
            'Total__c': '',
            'Opportunity__c' : ''
        });
        component.set("v.smartOtherProdList", RowItemList);
    },
    SmartremoveRow :  function(component, event, helper) {
        debugger
        var indexvar = event.getSource().get("v.title");
        // get the all List (contactList attribute) and remove the Object Element Using splice method    
        var AllRowsList = component.get("v.smartOtherProdList");
        AllRowsList.splice(indexvar, 1);
        // set the contactList after remove selected row element  
        component.set("v.smartOtherProdList", AllRowsList);
        var AllRowsList2 = component.get("v.smartOtherProdList2");
        AllRowsList2.splice(indexvar, 1);
        // set the contactList after remove selected row element  
        component.set("v.smartOtherProdList2", AllRowsList2);
    },
    
    editLicense : function(component, event, helper) {
        debugger
        var id = event.getSource().get("v.value");
        var productList2 = component.get("v.productList2");
        for(var i = 0 ; i < productList2.length ; i++){
            if(productList2[i].product.Id == id){
                productList2[i].boolval2  = false;
            }
        }
        component.set('v.productList2 ',productList2);
    },
    deleteLicense : function(component, event, helper) {
        debugger 
        var id = event.getSource().get("v.value");
        var productList2 = component.get("v.productList2");
        for(var i = 0 ; i < productList2.length ; i++){
            if(productList2[i].product != undefined){
                if(productList2[i].product.Id == id){
                    if (i > -1) {
                        console.log('i'+i);
                        productList2.splice(i, 1);
                        component.set('v.productList2 ',productList2);
                    }
                }
            }
        }
        var productList = component.get("v.productList");
        for(var i = 0 ; i < productList.length ; i++){
            if(productList[i].product != undefined){
                if(productList[i].product.Id == id){
                    productList[i].boolval  = false;
                    productList[i].product.Quantity__c = '';
                    component.set('v.productList ',productList);
                }
            }
        }
        
    },
    editAddOn : function(component, event, helper) {
        debugger
        var id = event.getSource().get("v.value");
        var productListAddOn2 = component.get("v.productListAddOn2");
        for(var i = 0 ; i < productListAddOn2.length ; i++){
            if(productListAddOn2[i].product.Id == id){
                productListAddOn2[i].boolval2  = false;
            }
        }
        component.set('v.productListAddOn2 ',productListAddOn2);
    },
    deleteAddOn : function(component, event, helper) {
        debugger 
        var page = component.get("v.page");            
        var id = event.getSource().get("v.value");
        var productListAddOn2 = component.get("v.productListAddOn2");
        for(var i = 0 ; i < productListAddOn2.length ; i++){
            if(productListAddOn2[i].product != undefined){
                if(productListAddOn2[i].product.Id == id){
                    if(productListAddOn2[i].product.Name.includes('E911')){
                        if(page == 1){
                            if (i > -1) {
                                console.log('i'+i);
                                productListAddOn2.splice(i, 1);
                                component.set('v.productListAddOn2 ',productListAddOn2);
                            }
                        }
                        else{
                            component.set("v.error",'E911 is mandatory for site > 1');
                            component.set("v.isChecked",true);
                        }
                    }    
                    else{
                        if (i > -1) {
                            console.log('i'+i);
                            productListAddOn2.splice(i, 1);
                            component.set('v.productListAddOn2 ',productListAddOn2);
                        }
                    }                
                    
                }
            }
        }
        var productListAddOn = component.get("v.productListAddOn");
        for(var i = 0 ; i < productListAddOn.length ; i++){
            if(productListAddOn[i].product != undefined){
                if(productListAddOn[i].product.Id == id){
                    if(productListAddOn[i].product.Name.includes('E911')){
                        if(page == 1){
                            productListAddOn[i].boolval  = false;
                            productListAddOn[i].product.Quantity__c = '';
                            component.set('v.productListAddOn ',productListAddOn);
                        }
                        else{
                            component.set("v.error",'E911 is mandatory for site > 1');
                            component.set("v.isChecked",true);
                        }
                    }    
                    else{
                        productListAddOn[i].boolval  = false;
                        productListAddOn[i].product.Quantity__c = '';
                        component.set('v.productListAddOn ',productListAddOn);
                    }
                }                
            }
        }
    },
    editTelecomm : function(component, event, helper) {
        debugger
        var id = event.getSource().get("v.value");
        var productListTelecomm2 = component.get("v.productListTelecomm2");
        for(var i = 0 ; i < productListTelecomm2.length ; i++){
            if(productListTelecomm2[i].product.Id == id){
                productListTelecomm2[i].boolval2  = false;
            }
        }
        component.set('v.productListTelecomm2 ',productListTelecomm2);
    },
    deleteTelecomm : function(component, event, helper) {
        debugger 
        var id = event.getSource().get("v.value");
        var productListTelecomm2 = component.get("v.productListTelecomm2");
        for(var i = 0 ; i < productListTelecomm2.length ; i++){
            if(productListTelecomm2[i].product != undefined){
                if(productListTelecomm2[i].product.Id == id){
                    if (i > -1) {
                        console.log('i'+i);
                        productListTelecomm2.splice(i, 1);
                        component.set('v.productListTelecomm2 ',productListTelecomm2);
                    }
                }
            }
        }
        var productListTelecomm = component.get("v.productListTelecomm");
        for(var i = 0 ; i < productListTelecomm.length ; i++){
            if(productListTelecomm[i].product != undefined){
                if(productListTelecomm[i].product.Id == id){
                    productListTelecomm[i].boolval  = false;
                    productListTelecomm[i].product.Quantity__c = '';
                    component.set('v.productListTelecomm ',productListTelecomm);
                }
            }
        }
        component.set("v.isTelecommRule",false);
    },
    editIpPhone : function(component, event, helper) {
        debugger
        var id = event.getSource().get("v.value");
        var productListIpPhones2 = component.get("v.productListIpPhones2");
        for(var i = 0 ; i < productListIpPhones2.length ; i++){
            if(productListIpPhones2[i].product.Id == id){
                productListIpPhones2[i].boolval2  = false;
            }
        }
        component.set('v.productListIpPhones2 ',productListIpPhones2);
    },
    deleteIpPhone : function(component, event, helper) {   
        debugger 
        var list = [];
        var list2 = [];
        var id = event.getSource().get("v.value");
        var productListIpPhones2 = component.get("v.productListIpPhones2");
        for(var i = 0 ; i < productListIpPhones2.length ; i++){
            if(productListIpPhones2[i].product != undefined){
                if(productListIpPhones2[i].product.Id == id){
                    if (i > -1) {
                        console.log('i'+i);
                        productListIpPhones2.splice(i, 1);
                        component.set('v.productListIpPhones2 ',productListIpPhones2);
                    }
                }
            }
        }
        var productListIpPhones = component.get("v.productListIpPhones");
        for(var i = 0 ; i < productListIpPhones.length ; i++){
            if(productListIpPhones[i].product != undefined){
                if(productListIpPhones[i].product.Id == id){
                    productListIpPhones[i].boolval  = false;
                    productListIpPhones[i].product.Quantity__c = '';
                    component.set('v.productListIpPhones ',productListIpPhones);
                }
            }
        }
    },
    editCPE :  function(component, event, helper) {
        debugger
        var id = event.getSource().get("v.value");
        var productListIPPhonePower2 = component.get("v.productListIPPhonePower2");
        for(var i = 0 ; i < productListIPPhonePower2.length ; i++){
            if(productListIPPhonePower2[i].product.Id == id){
                productListIPPhonePower2[i].boolval2  = false;
            }
        }
        component.set('v.productListIPPhonePower2 ',productListIPPhonePower2);
    },
    deleteCPE : function(component, event, helper) {
        debugger 
        var list = [];
        var list2 = [];
        var id = event.getSource().get("v.value");
        var productListIPPhonePower2 = component.get("v.productListIPPhonePower2");
        for(var i = 0 ; i < productListIPPhonePower2.length ; i++){
            if(productListIPPhonePower2[i].product != undefined){
                if(productListIPPhonePower2[i].product.Id == id){
                    if (i > -1) {
                        console.log('i'+i);
                        productListIPPhonePower2.splice(i, 1);
                        component.set('v.productListIPPhonePower2 ',productListIPPhonePower2);
                    }
                }
            }
        }
        var productListIPPhonePower = component.get("v.productListIPPhonePower");
        for(var i = 0 ; i < productListIPPhonePower.length ; i++){
            if(productListIPPhonePower[i].product != undefined){
                if(productListIPPhonePower[i].product.Id == id){
                    productListIPPhonePower[i].boolval  = false;
                    productListIPPhonePower[i].product.Quantity__c = '';
                    component.set('v.productListIPPhonePower ',productListIPPhonePower);
                }
            }
        }
    },
    editSwitchNdPoe :  function(component, event, helper) {
        debugger
        var id = event.getSource().get("v.value");
        var swithesAndPOElist2 = component.get("v.swithesAndPOElist2");
        for(var i = 0 ; i < swithesAndPOElist2.length ; i++){
            if(swithesAndPOElist2[i].product.Id == id){
                swithesAndPOElist2[i].boolval2  = false;
            }
        }
        component.set('v.swithesAndPOElist2 ',swithesAndPOElist2);
    },
    deleteSwitchNdPoe  : function(component, event, helper) {
        debugger 
        var list = [];
        var list2 = [];
        var id = event.getSource().get("v.value");
        var swithesAndPOElist2 = component.get("v.swithesAndPOElist2");
        for(var i = 0 ; i < swithesAndPOElist2.length ; i++){
            if(swithesAndPOElist2[i].product != undefined){
                if(swithesAndPOElist2[i].product.Id == id){
                    if (i > -1) {
                        console.log('i'+i);
                        swithesAndPOElist2.splice(i, 1);
                        component.set('v.swithesAndPOElist2 ',swithesAndPOElist2);
                    }
                }
            }
        }
        var swithesAndPOElist2 = component.get("v.swithesAndPOElist2");
        for(var i = 0 ; i < swithesAndPOElist2.length ; i++){
            if(swithesAndPOElist2[i].product != undefined){
                if(swithesAndPOElist2[i].product.Id == id){
                    swithesAndPOElist2[i].boolval  = false;
                    swithesAndPOElist2[i].product.Quantity__c = '';
                    component.set('v.swithesAndPOElist2 ',swithesAndPOElist2);
                }
            }
        }
    },
    editSmartLicense : function(component, event, helper) {
        debugger
        var id = event.getSource().get("v.value");
        var smartLicensesList2 = component.get("v.smartLicensesList2");
        for(var i = 0 ; i < smartLicensesList2.length ; i++){
            if(smartLicensesList2[i].product.Id == id){
                smartLicensesList2[i].boolval2  = false;
            }
        }
        component.set('v.smartLicensesList2 ',smartLicensesList2);
    },
    deleteSmartLicense : function(component, event, helper) {
        debugger 
        var list = [];
        var list2 = [];
        var id = event.getSource().get("v.value");
        component.set("v.isPremiumRule",false);
        var smartLicensesList2 = component.get("v.smartLicensesList2");
        for(var i = 0 ; i < smartLicensesList2.length ; i++){
            if(smartLicensesList2[i].product != undefined){
                if(smartLicensesList2[i].product.Id == id){
                    smartLicensesList2[i]  = '';
                    list.pop(smartLicensesList2[i]);
                    component.set('v.smartLicensesList2 ',list);
                }
                else{
                    list2.push(smartLicensesList2[i])
                    component.set('v.smartLicensesList2 ',list2);
                }
            }
        }
        var smartLicensesList = component.get("v.smartLicensesList");
        for(var i = 0 ; i < smartLicensesList.length ; i++){
            if(smartLicensesList[i].product != undefined){
                if(smartLicensesList[i].product.Id == id){
                    smartLicensesList[i].boolval  = false;
                    smartLicensesList[i].product.Quantity__c = '';
                    component.set('v.smartLicensesList ',smartLicensesList);
                }
            }
        }
        
    },
    editSmartAddOn : function(component, event, helper) {
        debugger
        var id = event.getSource().get("v.value");
        var smartAdOnList2 = component.get("v.smartAdOnList2");
        for(var i = 0 ; i < smartAdOnList2.length ; i++){
            if(smartAdOnList2[i].product.Id == id){
                smartAdOnList2[i].boolval2  = false;
            }
        }
        component.set('v.smartAdOnList2 ',smartAdOnList2);
    },
     editSmartTelecomm : function(component, event, helper) {
        debugger
        var id = event.getSource().get("v.value");
        var smartTelecommList2 = component.get("v.smartTelecommList2");
        for(var i = 0 ; i < smartTelecommList2.length ; i++){
            if(smartTelecommList2[i].product.Id == id){
                smartTelecommList2[i].boolval2  = false;
            }
        }
        component.set('v.smartTelecommList2 ',smartTelecommList2);
    },
     deleteSmartTelecomm : function(component, event, helper) {
        debugger 
        var list = [];
        var list2 = [];
        var id = event.getSource().get("v.value");
        var smartTelecommList2 = component.get("v.smartTelecommList2");
        for(var i = 0 ; i < smartTelecommList2.length ; i++){
            if(smartTelecommList2[i].product != undefined){
                if(smartTelecommList2[i].product.Id == id){
                    smartTelecommList2[i]  = '';
                    list.pop(smartTelecommList2[i]);
                    component.set('v.smartTelecommList2 ',list);
                }
                else{
                    list2.push(smartTelecommList2[i])
                    component.set('v.smartTelecommList2 ',list2);
                }
            }
        }
        var smartTelecommList2 = component.get("v.smartTelecommList2");
        for(var i = 0 ; i < smartTelecommList2.length ; i++){
            if(smartTelecommList2[i].product != undefined){
                if(smartTelecommList2[i].product.Id == id){
                    smartTelecommList2[i].boolval  = false;
                    smartTelecommList2[i].product.Quantity__c = '';
                    component.set('v.smartTelecommList2 ',smartTelecommList2);
                }
            }
        }
    },
     deleteSmartAddOn : function(component, event, helper) {
        debugger 
        var page = component.get("v.page");            
        var id = event.getSource().get("v.value");
        var smartAdOnList2 = component.get("v.smartAdOnList2");
        for(var i = 0 ; i < smartAdOnList2.length ; i++){
            if(smartAdOnList2[i].product != undefined){
                if(smartAdOnList2[i].product.Id == id){
                    if(smartAdOnList2[i].product.Name.includes('E911')){
                        if(page == 1){
                            if (i > -1) {
                                console.log('i'+i);
                                smartAdOnList2.splice(i, 1);
                                component.set('v.smartAdOnList2 ',smartAdOnList2);
                            }
                        }
                        else{
                            component.set("v.error",'E911 is mandatory for site > 1');
                            component.set("v.isChecked",true);
                        }
                    }    
                    else{
                        if (i > -1) {
                            console.log('i'+i);
                            smartAdOnList2.splice(i, 1);
                            component.set('v.smartAdOnList2 ',smartAdOnList2);
                        }
                    }                
                    
                }
            }
        }
        var smartAdOnList = component.get("v.smartAdOnList");
        for(var i = 0 ; i < smartAdOnList.length ; i++){
            if(smartAdOnList[i].product != undefined){
                if(smartAdOnList[i].product.Id == id){
                    if(smartAdOnList[i].product.Name.includes('E911')){
                        if(page == 1){
                            smartAdOnList[i].boolval  = false;
                            smartAdOnList[i].product.Quantity__c = '';
                            component.set('v.smartAdOnList ',smartAdOnList);
                        }
                        else{
                            component.set("v.error",'E911 is mandatory for site > 1');
                            component.set("v.isChecked",true);
                        }
                    }    
                    else{
                        smartAdOnList[i].boolval  = false;
                        smartAdOnList[i].product.Quantity__c = '';
                        component.set('v.smartAdOnList ',smartAdOnList);
                    }
                }                
            }
        }
    },
    editSmartIpPhone : function(component, event, helper) {
        debugger
        var id = event.getSource().get("v.value");
        var smartIpPhoneList2 = component.get("v.smartIpPhoneList2");
        for(var i = 0 ; i < smartIpPhoneList2.length ; i++){
            if(smartIpPhoneList2[i].product.Id == id){
                smartIpPhoneList2[i].boolval2  = false;
            }
        }
        component.set('v.smartIpPhoneList2 ',smartIpPhoneList2);
    },
    deleteSmartIpPhone : function(component, event, helper) {
        debugger 
        var list = [];
        var list2 = [];
        var id = event.getSource().get("v.value");
        var smartIpPhoneList2 = component.get("v.smartIpPhoneList2");
        for(var i = 0 ; i < smartIpPhoneList2.length ; i++){
            if(smartIpPhoneList2[i].product != undefined){
                if(smartIpPhoneList2[i].product.Id == id){
                    smartIpPhoneList2[i]  = '';
                    list.pop(smartIpPhoneList2[i]);
                    component.set('v.smartIpPhoneList2 ',list);
                }
                else{
                    list2.push(smartIpPhoneList2[i])
                    component.set('v.smartIpPhoneList2 ',list2);
                }
            }
        }
        var smartIpPhoneList = component.get("v.smartIpPhoneList");
        for(var i = 0 ; i < smartIpPhoneList.length ; i++){
            if(smartIpPhoneList[i].product != undefined){
                if(smartIpPhoneList[i].product.Id == id){
                    smartIpPhoneList[i].boolval  = false;
                    smartIpPhoneList[i].product.Quantity__c = '';
                    component.set('v.smartIpPhoneList ',smartIpPhoneList);
                }
            }
        }
    },
    editSmartSwitchPoe : function(component, event, helper) {
        debugger
        var id = event.getSource().get("v.value");
        var smartSwitchPoeList2 = component.get("v.smartSwitchPoeList2");
        for(var i = 0 ; i < smartSwitchPoeList2.length ; i++){
            if(smartSwitchPoeList2[i].product.Id == id){
                smartSwitchPoeList2[i].boolval2  = false;
            }
        }
        component.set('v.smartSwitchPoeList2 ',smartSwitchPoeList2);
    },
    deleteSmartSwitchPoe : function(component, event, helper) {
        debugger 
        var list = [];
        var list2 = [];
         component.set("v.isTelecommRule",false);
        var id = event.getSource().get("v.value");
        var smartSwitchPoeList2 = component.get("v.smartSwitchPoeList2");
        for(var i = 0 ; i < smartSwitchPoeList2.length ; i++){
            if(smartSwitchPoeList2[i].product != undefined){
                if(smartSwitchPoeList2[i].product.Id == id){
                    smartSwitchPoeList2[i]  = '';
                    list.pop(smartSwitchPoeList2[i]);
                    component.set('v.smartSwitchPoeList2 ',list);
                }
                else{
                    list2.push(smartSwitchPoeList2[i])
                    component.set('v.smartSwitchPoeList2 ',list2);
                }
            }
        }
        var smartSwitchPoeList = component.get("v.smartSwitchPoeList");
        for(var i = 0 ; i < smartSwitchPoeList.length ; i++){
            if(smartSwitchPoeList[i].product != undefined){
                if(smartSwitchPoeList[i].product.Id == id){
                    smartSwitchPoeList[i].boolval  = false;
                    smartSwitchPoeList[i].product.Quantity__c = '';
                    component.set('v.smartSwitchPoeList ',smartSwitchPoeList);
                }
            }
        }
    },
    editSmartActivationFees : function(component, event, helper) {
        debugger
        var id = event.getSource().get("v.value");
        var smartActivationFeesList2 = component.get("v.smartActivationFeesList2");
        for(var i = 0 ; i < smartActivationFeesList2.length ; i++){
            if(smartActivationFeesList2[i].product.Id == id){
                smartActivationFeesList2[i].boolval2  = false;
            }
        }
        component.set('v.smartActivationFeesList2 ',smartActivationFeesList2);
    },
    deleteSmartActivationFees : function(component, event, helper) {
        debugger 
        var list = [];
        var list2 = [];
        var id = event.getSource().get("v.value");
        var smartActivationFeesList2 = component.get("v.smartActivationFeesList2");
        for(var i = 0 ; i < smartActivationFeesList2.length ; i++){
            if(smartActivationFeesList2[i].product != undefined){
                if(smartActivationFeesList2[i].product.Id == id){
                    smartActivationFeesList2[i]  = '';
                    list.pop(smartActivationFeesList2[i]);
                    component.set('v.smartActivationFeesList2 ',list);
                }
                else{
                    list2.push(smartActivationFeesList2[i])
                    component.set('v.smartActivationFeesList2 ',list2);
                }
            }
        }
        var smartActivationFeesList = component.get("v.smartActivationFeesList");
        for(var i = 0 ; i < smartActivationFeesList.length ; i++){
            if(smartActivationFeesList[i].product != undefined){
                if(smartActivationFeesList[i].product.Id == id){
                    smartActivationFeesList[i].boolval  = false;
                    smartActivationFeesList[i].product.Quantity__c = '';
                    component.set('v.smartActivationFeesList ',smartActivationFeesList);
                }
            }
        }
    },
    editSmartRepair : function(component, event, helper) {
        debugger
        var id = event.getSource().get("v.value");
        var smartRepairList2 = component.get("v.smartRepairList2");
        for(var i = 0 ; i < smartRepairList2.length ; i++){
            if(smartRepairList2[i].product.Id == id){
                smartRepairList2[i].boolval2  = false;
            }
        }
        component.set('v.smartRepairList2 ',smartRepairList2);
    },
    deleteSmartRepair : function(component, event, helper) {
        debugger 
        var list = [];
        var list2 = [];
        var id = event.getSource().get("v.value");
        var smartRepairList2 = component.get("v.smartRepairList2");
        for(var i = 0 ; i < smartRepairList2.length ; i++){
            if(smartRepairList2[i].product != undefined){
                if(smartRepairList2[i].product.Id == id){
                    smartRepairList2[i]  = '';
                    list.pop(smartRepairList2[i]);
                    component.set('v.smartRepairList2 ',list);
                }
                else{
                    list2.push(smartRepairList2[i])
                    component.set('v.smartRepairList2 ',list2);
                }
            }
        }
        var smartRepairList = component.get("v.smartRepairList");
        for(var i = 0 ; i < smartRepairList.length ; i++){
            if(smartRepairList[i].product != undefined){
                if(smartRepairList[i].product.Id == id){
                    smartRepairList[i].boolval  = false;
                    smartRepairList[i].product.Quantity__c = '';
                    component.set('v.smartRepairList ',smartRepairList);
                }
            }
        }
    },
       editSmartEquipment : function(component, event, helper) {
        debugger
        var id = event.getSource().get("v.value");
        var smartEquipmentList2 = component.get("v.smartEquipmentList2");
        for(var i = 0 ; i < smartEquipmentList2.length ; i++){
            if(smartEquipmentList2[i].product.Id == id){
                smartEquipmentList2[i].boolval2  = false;
            }
        }
        component.set('v.smartEquipmentList2 ',smartEquipmentList2);
    },
    deleteSmartEquipment : function(component, event, helper) {
        debugger 
        var list = [];
        var list2 = [];
        var id = event.getSource().get("v.value");
        var smartEquipmentList2 = component.get("v.smartEquipmentList2");
        for(var i = 0 ; i < smartEquipmentList2.length ; i++){
            if(smartEquipmentList2[i].product != undefined){
                if(smartEquipmentList2[i].product.Id == id){
                    if (i > -1) {
                        console.log('i'+i);
                        smartEquipmentList2.splice(i, 1);
                        component.set('v.smartEquipmentList2 ',smartEquipmentList2);
                    }
                }
            }
        }
        var smartEquipmentList = component.get("v.smartEquipmentList");
        for(var i = 0 ; i < smartEquipmentList.length ; i++){
            if(smartEquipmentList[i].product != undefined){
                if(smartEquipmentList[i].product.Id == id){
                    smartEquipmentList[i].boolval  = false;
                    smartEquipmentList[i].product.Quantity__c = '';
                    component.set('v.smartEquipmentList ',smartEquipmentList);
                }
            }
        }
    },
    editSmartBroadband : function(component, event, helper) {
        debugger
        var id = event.getSource().get("v.value");
        var smartBroadbandList2 = component.get("v.smartBroadbandList2");
        for(var i = 0 ; i < smartBroadbandList2.length ; i++){
            if(smartBroadbandList2[i].product.Id == id){
                smartBroadbandList2[i].boolval2  = false;
            }
        }
        component.set('v.smartBroadbandList2 ',smartBroadbandList2);
    },
    deleteSmartBroadband : function(component, event, helper) {
        debugger 
        var list = [];
        var list2 = [];
        var id = event.getSource().get("v.value");
        var smartBroadbandList2 = component.get("v.smartBroadbandList2");
        for(var i = 0 ; i < smartBroadbandList2.length ; i++){
            if(smartBroadbandList2[i].product != undefined){
                if(smartBroadbandList2[i].product.Id == id){
                    if (i > -1) {
                        console.log('i'+i);
                        smartBroadbandList2.splice(i, 1);
                        component.set('v.smartBroadbandList2 ',smartBroadbandList2);
                    }
                }
            }
        }
        var smartBroadbandList = component.get("v.smartBroadbandList");
        for(var i = 0 ; i < smartBroadbandList.length ; i++){
            if(smartBroadbandList[i].product != undefined){
                if(smartBroadbandList[i].product.Id == id){
                    smartBroadbandList[i].boolval  = false;
                    smartBroadbandList[i].product.Quantity__c = '';
                    component.set('v.smartBroadbandList ',smartBroadbandList);
                }
            }
        }
    },
    editSmartFIOS : function(component, event, helper) {
        debugger
        var id = event.getSource().get("v.value");
        var smartFIOSList2 = component.get("v.smartFIOSList2");
        for(var i = 0 ; i < smartFIOSList2.length ; i++){
            if(smartFIOSList2[i].product.Id == id){
                smartFIOSList2[i].boolval2  = false;
            }
        }
        component.set('v.smartFIOSList2 ',smartFIOSList2);
    },
    deleteSmartFIOS : function(component, event, helper) {
        debugger 
        var list = [];
        var list2 = [];
        var id = event.getSource().get("v.value");
        var smartFIOSList2 = component.get("v.smartFIOSList2");
        for(var i = 0 ; i < smartFIOSList2.length ; i++){
            if(smartFIOSList2[i].product != undefined){
                if(smartFIOSList2[i].product.Id == id){
                    if (i > -1) {
                        console.log('i'+i);
                        smartFIOSList2.splice(i, 1);
                        component.set('v.smartFIOSList2 ',smartFIOSList2);
                    }
                }
            }
        }
        var smartFIOSList = component.get("v.smartFIOSList");
        for(var i = 0 ; i < smartFIOSList.length ; i++){
            if(smartFIOSList[i].product != undefined){
                if(smartFIOSList[i].product.Id == id){
                    smartFIOSList[i].boolval  = false;
                    smartFIOSList[i].product.Quantity__c = '';
                    component.set('v.smartFIOSList ',smartFIOSList);
                }
            }
        }
    },
    editSmartFiber : function(component, event, helper) {
        debugger
        var id = event.getSource().get("v.value");
        var smartFiberList2 = component.get("v.smartFiberList2");
        for(var i = 0 ; i < smartFiberList2.length ; i++){
            if(smartFiberList2[i].product.Id == id){
                smartFiberList2[i].boolval2  = false;
            }
        }
        component.set('v.smartFiberList2 ',smartFiberList2);
    },
    deleteSmartFiber : function(component, event, helper) {
        debugger 
        var list = [];
        var list2 = [];
        var id = event.getSource().get("v.value");
        var smartFiberList2 = component.get("v.smartFiberList2");
        for(var i = 0 ; i < smartFiberList2.length ; i++){
            if(smartFiberList2[i].product != undefined){
                if(smartFiberList2[i].product.Id == id){
                    if (i > -1) {
                        console.log('i'+i);
                        smartFiberList2.splice(i, 1);
                        component.set('v.smartFiberList2 ',smartFiberList2);
                    }
                }
            }
        }
        var smartFiberList = component.get("v.smartFiberList");
        for(var i = 0 ; i < smartFiberList.length ; i++){
            if(smartFiberList[i].product != undefined){
                if(smartFiberList[i].product.Id == id){
                    smartFiberList[i].boolval  = false;
                    smartFiberList[i].product.Quantity__c = '';
                    component.set('v.smartFiberList ',smartFiberList);
                }
            }
        }
    },
    editSmartBHSI : function(component, event, helper) {
        debugger
        var id = event.getSource().get("v.value");
        var smartBHSIList2 = component.get("v.smartBHSIList2");
        for(var i = 0 ; i < smartBHSIList2.length ; i++){
            if(smartBHSIList2[i].product.Id == id){
                smartBHSIList2[i].boolval2  = false;
            }
        }
        component.set('v.smartBHSIList2 ',smartBHSIList2);
    },
    deleteSmartBHSI : function(component, event, helper) {
        debugger 
        var list = [];
        var list2 = [];
        var id = event.getSource().get("v.value");
        var smartBHSIList2 = component.get("v.smartBHSIList2");
        for(var i = 0 ; i < smartBHSIList2.length ; i++){
            if(smartBHSIList2[i].product != undefined){
                if(smartBHSIList2[i].product.Id == id){
                    if (i > -1) {
                        console.log('i'+i);
                        smartBHSIList2.splice(i, 1);
                        component.set('v.smartBHSIList2 ',smartBHSIList2);
                    }
                }
            }
        }
        var smartBHSIList = component.get("v.smartBHSIList");
        for(var i = 0 ; i < smartBHSIList.length ; i++){
            if(smartBHSIList[i].product != undefined){
                if(smartBHSIList[i].product.Id == id){
                    smartBHSIList[i].boolval  = false;
                    smartBHSIList[i].product.Quantity__c = '';
                    component.set('v.smartBHSIList ',smartBHSIList);
                }
            }
        }
    },
    editSmartAsymetricFiber : function(component, event, helper) {
        debugger
        var id = event.getSource().get("v.value");
        var smartAsymetricFiberList2 = component.get("v.smartAsymetricFiberList2");
        for(var i = 0 ; i < smartAsymetricFiberList2.length ; i++){
            if(smartAsymetricFiberList2[i].product.Id == id){
                smartAsymetricFiberList2[i].boolval2  = false;
            }
        }
        component.set('v.smartAsymetricFiberList2 ',smartAsymetricFiberList2);
    },
    deleteSmartAsymetricFiber : function(component, event, helper) {
        debugger 
        var list = [];
        var list2 = [];
        var id = event.getSource().get("v.value");
        var smartAsymetricFiberList2 = component.get("v.smartAsymetricFiberList2");
        for(var i = 0 ; i < smartAsymetricFiberList2.length ; i++){
            if(smartAsymetricFiberList2[i].product != undefined){
                if(smartAsymetricFiberList2[i].product.Id == id){
                    if (i > -1) {
                        console.log('i'+i);
                        smartAsymetricFiberList2.splice(i, 1);
                        component.set('v.smartAsymetricFiberList2 ',smartAsymetricFiberList2);
                    }
                }
            }
        }
        var smartAsymetricFiberList = component.get("v.smartAsymetricFiberList");
        for(var i = 0 ; i < smartAsymetricFiberList.length ; i++){
            if(smartAsymetricFiberList[i].product != undefined){
                if(smartAsymetricFiberList[i].product.Id == id){
                    smartAsymetricFiberList[i].boolval  = false;
                    smartAsymetricFiberList[i].product.Quantity__c = '';
                    component.set('v.smartAsymetricFiberList ',smartAsymetricFiberList);
                }
            }
        }
    },
    
    editSmartOtherProd : function(component, event, helper) {
        debugger
        component.set("v.disable2",false);
    },
    
    nextToSmartIpPhonePage  :  function(component, event, helper) {
        debugger 
        var smartLicensesList = component.get("v.smartLicensesList");
        for(var i = 0 ; i < smartLicensesList.length ; i++){
            if(smartLicensesList[i].boolval == true){
                if((smartLicensesList[i].product.Quantity__c != undefined) && (smartLicensesList[i].product.Quantity__c != "")){
                    component.set("v.isCondition",true);
                }
                else{
                    component.set("v.isCondition",false);
                    component.set("v.isPageSmartVoiceLicenses",true);
                    component.set("v.isSmartIpPhonePage",false);
                    component.set("v.isErrorLicense",true);
                    component.set("v.errorLicense",'You checked but did not add a quantity');
                    break;
                }
            }
            else{
                component.set("v.isCondition",true);
            }
        }
        
          var isCondition = component.get("v.isCondition");
        if(isCondition == true){
            var check = false;
            for(var i = 0 ; i < smartLicensesList.length ; i++){
                if(smartLicensesList[i].boolval == true){
                    if(smartLicensesList[i].product.PremiumRule__c == true ){
                        check = true ;
                    }
                }
            }
            if(check){
                for(var i = 0 ; i < smartLicensesList.length ; i++){
                    if(smartLicensesList[i].boolval == true){
                        if(smartLicensesList[i].product.PremiumPlusRule__c == true ){
                            component.set("v.isPremiumRule",false);
                            break;
                        }
                        else{
                            component.set("v.isPremiumRule",true);
                            component.set("v.premiumError",'Premium Plus is required for premium');
                        }
                    }
                    
                }
            }
            
            var isPremiumRule =  component.get("v.isPremiumRule");
            if(isPremiumRule == true){
                
            }
            else{
              component.set("v.isErrorLicense",false);
            component.set("v.errorLicense",'');
            component.set("v.isSmartLicensePage",false);
            component.set("v.isSmartIpPhonePage",true);
            component.set("v.progress3",true);
            component.set("v.step",'step-3');
             var stopServerCall2 = component.get("v.stopServerCall2");
                if(stopServerCall2 == true){
                     var recordId = component.get("v.recordId");
                var action = component.get("c.getIpPhoneSmartProdList");
                action.setParams({
                    recordId : component.get("v.recordId"),
                    siteNumber : component.get("v.siteNumber")
                });
                action.setCallback(this,function(response){
                    var state = response.getState();
                    if(state == "SUCCESS"){
                        var res = response.getReturnValue();
                        if(res != null){
                            component.set("v.smartIpPhoneList",res);
                        }}
                });
                $A.enqueueAction(action);
                }
                 else{
                var isAgainServerCall2 = component.get("v.isAgainServerCall2");
                if(isAgainServerCall2 == true){
                    var action = component.get("c.getIpPhoneSmartProdList");
                    var recordId = component.get("v.recordId");
                    action.setParams({
                        recordId : recordId,
                        siteNumber :  component.get("v.siteNumber")
                    });
                    action.setCallback(this,function(response){
                        var state = response.getState();
                        if(state == "SUCCESS"){
                            var res = response.getReturnValue();
                            if(res != null){
                                component.set("v.smartIpPhoneList",res);
                            }}
                    });
                    $A.enqueueAction(action);
                    component.set("v.isAgainServerCall2",false);
                }
            }
        }
        }
        
       /* 
        var isCondition = component.get("v.isCondition");
        if(isCondition == true){
            component.set("v.isErrorLicense",false);
            component.set("v.errorLicense",'');
            component.set("v.isSmartLicensePage",false);
            component.set("v.isSmartIpPhonePage",true);
            component.set("v.progress3",true);
            component.set("v.step",'step-3');
            var stopServerCall2 = component.get("v.stopServerCall2");
            if(stopServerCall2 == true){
                var recordId = component.get("v.recordId");
                var action = component.get("c.getIpPhoneSmartProdList");
                action.setParams({
                    recordId : component.get("v.recordId"),
                    siteNumber : component.get("v.siteNumber")
                });
                action.setCallback(this,function(response){
                    var state = response.getState();
                    if(state == "SUCCESS"){
                        var res = response.getReturnValue();
                        if(res != null){
                            component.set("v.smartIpPhoneList",res);
                        }}
                });
                $A.enqueueAction(action);
            }
            else{
                var isAgainServerCall2 = component.get("v.isAgainServerCall2");
                if(isAgainServerCall2 == true){
                    var action = component.get("c.getIpPhoneSmartProdList");
                    var recordId = component.get("v.recordId");
                    action.setParams({
                        recordId : recordId,
                        siteNumber :  component.get("v.siteNumber")
                    });
                    action.setCallback(this,function(response){
                        var state = response.getState();
                        if(state == "SUCCESS"){
                            var res = response.getReturnValue();
                            if(res != null){
                                component.set("v.smartIpPhoneList",res);
                            }}
                    });
                    $A.enqueueAction(action);
                    component.set("v.isAgainServerCall3",false);
                }
            }
        }
        */
    },
    nextToSmartAddOnPage : function(component, event, helper) {
        debugger
        var smartIpPhoneList = component.get("v.smartIpPhoneList");
        for(var i = 0 ; i < smartIpPhoneList.length ; i++){
            if(smartIpPhoneList[i].boolval == true){
                if((smartIpPhoneList[i].product.Quantity__c != undefined) && (smartIpPhoneList[i].product.Quantity__c != "")){
                    component.set("v.isCondition",true);
                }
                else{
                    component.set("v.isCondition",false);
                    component.set("v.isSmartIpPhonePage",true);
                    component.set("v.isSmartAddOnPage",false);
                    component.set("v.isErrorLicense",true);
                    component.set("v.errorLicense",'You checked but did not add a quantity');
                    break;
                }
            }
            else{
                component.set("v.isCondition",true);
            }
        }
        var isCondition = component.get("v.isCondition");
        if(isCondition == true){
            
              var licenselist = component.get("v.smartLicensesList");
            var phonelist = component.get("v.smartIpPhoneList");
            var action2 = component.get("c.smartVoiceIpPhoneRule");
            action2.setParams({
                licenselist : licenselist,
                phonelist : phonelist
            });
            action2.setCallback(this,function(response){
                var state = response.getState();
                if(state == "SUCCESS"){
                    var res = response.getReturnValue();
                    if(res == 'false'){
                        
                         var action3 = component.get("c.smartVoiceIpSoundStationRule");
                        action3.setParams({
                            licenselist : licenselist,
                            phonelist : phonelist
                        });
                        action3.setCallback(this,function(response){
                            var state = response.getState();
                            if(state == "SUCCESS"){
                                var res = response.getReturnValue();
                                if(res == 'false'){
                           
          
            component.set("v.isErrorLicense",false);
            component.set("v.errorLicense",'');
            component.set("v.isSmartIpPhonePage",false);
            component.set("v.isSmartAddOnPage",true);
            component.set("v.progress4",true);
            component.set("v.step",'step-4');
            var stopServerCall3 = component.get("v.stopServerCall3");
            if(stopServerCall3 == true){
                var recordId = component.get("v.recordId");
                var action = component.get("c.getAddOnSmartProdList");
                action.setParams({
                    recordId : component.get("v.recordId"),
                    siteNumber : component.get("v.siteNumber")
                });
                action.setCallback(this,function(response){
                    var state = response.getState();
                    if(state == "SUCCESS"){
                        var res = response.getReturnValue();
                        if(res != null){
                            component.set("v.smartAdOnList",res);
                        }}
                });
                $A.enqueueAction(action);
            }
            else{
                var isAgainServerCall3 = component.get("v.isAgainServerCall3");
                if(isAgainServerCall3 == true){
                    var recordId = component.get("v.recordId");
                    var action = component.get("c.getAddOnSmartProdList");
                    action.setParams({
                        recordId : component.get("v.recordId"),
                        siteNumber : component.get("v.siteNumber")
                    });
                    action.setCallback(this,function(response){
                        var state = response.getState();
                        if(state == "SUCCESS"){
                            var res = response.getReturnValue();
                            if(res != null){
                                component.set("v.smartAdOnList",res);
                            }}
                    });
                    $A.enqueueAction(action);
                    component.set("v.isAgainServerCall3",false);
                }
                
            }
                                     }
                                else{
                                    component.set("v.isIpPhoneRule2",true);
                                    component.set("v.ipPhoneRuleError2",res);
                                }
                            }
                        });
                        $A.enqueueAction(action3);
                        
                    }
                    else{
                        component.set("v.isIpPhoneRule",true);
                        component.set("v.ipPhoneRuleError",res);
                    }
                }
            });
            $A.enqueueAction(action2);
                        
        }
    },
    
    nextToSmartTelecommPage : function(component, event, helper) {
        debugger
        var smartAdOnList = component.get("v.smartAdOnList");
        for(var i = 0 ; i < smartAdOnList.length ; i++){
            if(smartAdOnList[i].boolval == true){
                if((smartAdOnList[i].product.Quantity__c != undefined) && (smartAdOnList[i].product.Quantity__c != "")){
                    component.set("v.isCondition",true);
                }
                else{
                    component.set("v.isCondition",false);
                    component.set("v.isSmartAddOnPage",true);
                    component.set("v.isSmartTelecommPage",false);
                    component.set("v.isErrorLicense",true);
                    component.set("v.errorLicense",'You checked but did not add a quantity');
                    break;
                }
            }
            else{
                component.set("v.isCondition",true);
            }
        }
        var isCondition = component.get("v.isCondition");
        if(isCondition == true){
            var page = component.get("v.page");
            for(var i = 0 ; i < smartAdOnList.length ; i++){
                if(smartAdOnList[i].product.Name.includes('E911')){
                    if(smartAdOnList[i].boolval == true){
                        
                        component.set("v.isErrorLicense",false);
                        component.set("v.errorLicense",'');
                        component.set("v.isSmartAddOnPage",false);
                        component.set("v.isSmartTelecommPage",true);
                        component.set("v.progress5",true);
                        component.set("v.step",'step-5');
                        var stopServerCall4 = component.get("v.stopServerCall4");
                        if(stopServerCall4 == true){
                            var recordId = component.get("v.recordId");
                            var action = component.get("c.smartVoiceTelecommProd");
                            action.setParams({
                                recordId : component.get("v.recordId"),
                                siteNumber : component.get("v.siteNumber")
                            });
                            action.setCallback(this,function(response){
                                var state = response.getState();
                                if(state == "SUCCESS"){
                                    var res = response.getReturnValue();
                                    if(res != null){
                                        component.set("v.smartTelecommList",res);
                                    }}
                            });
                            $A.enqueueAction(action);
                        }
                        
                        else{
                            var isAgainServerCall4 = component.get("v.isAgainServerCall4");
                            if(isAgainServerCall4 == true){
                                var recordId = component.get("v.recordId");
                                var action = component.get("c.smartVoiceTelecommProd");
                                action.setParams({
                                    recordId : component.get("v.recordId"),
                                    siteNumber : component.get("v.siteNumber")
                                });
                                action.setCallback(this,function(response){
                                    var state = response.getState();
                                    if(state == "SUCCESS"){
                                        var res = response.getReturnValue();
                                        if(res != null){
                                            component.set("v.smartTelecommList",res);
                                        }}
                                });
                                $A.enqueueAction(action);
                                component.set("v.isAgainServerCall4",false);
                            }
                        }
                    }
                    else{
                        if(page == 1){
                            component.set("v.isErrorLicense",false);
                            component.set("v.errorLicense",'');
                            component.set("v.isSmartAddOnPage",false);
                            component.set("v.isSmartTelecommPage",true);
                            component.set("v.progress5",true);
                            component.set("v.step",'step-5');
                            var stopServerCall4 = component.get("v.stopServerCall4");
                            if(stopServerCall4 == true){
                                var recordId = component.get("v.recordId");
                                var action = component.get("c.smartVoiceTelecommProd");
                                action.setParams({
                                    recordId : component.get("v.recordId"),
                                    siteNumber : component.get("v.siteNumber")
                                });
                                action.setCallback(this,function(response){
                                    var state = response.getState();
                                    if(state == "SUCCESS"){
                                        var res = response.getReturnValue();
                                        if(res != null){
                                            component.set("v.smartTelecommList",res);
                                        }}
                                });
                                $A.enqueueAction(action);
                            }
                            else{
                                var isAgainServerCall4 = component.get("v.isAgainServerCall4");
                                if(isAgainServerCall4 == true){
                                    var recordId = component.get("v.recordId");
                                    var action = component.get("c.smartVoiceTelecommProd");
                                    action.setParams({
                                        recordId : component.get("v.recordId"),
                                        siteNumber : component.get("v.siteNumber")
                                    });
                                    action.setCallback(this,function(response){
                                        var state = response.getState();
                                        if(state == "SUCCESS"){
                                            var res = response.getReturnValue();
                                            if(res != null){
                                                component.set("v.smartTelecommList",res);
                                            }}
                                    });
                                    $A.enqueueAction(action);
                                    component.set("v.isAgainServerCall4",false);
                                }
                            }
                            
                        }
                        else{
                            component.set("v.error",'E911 is mandatory for site > 1');
                            component.set("v.isChecked",true);
                        }
                    }
                }
            }
            
        }
    },
    
    
    nextToSmartSwitchesPage : function(component, event, helper) {
        debugger
        var smartTelecommList = component.get("v.smartTelecommList");
        for(var i = 0 ; i < smartTelecommList.length ; i++){
            if(smartTelecommList[i].boolval == true){
                if((smartTelecommList[i].product.Quantity__c != undefined) && (smartTelecommList[i].product.Quantity__c != "")){
                    component.set("v.isCondition",true);
                }
                else{
                    component.set("v.isCondition",false);
                    component.set("v.isSmartTelecommPage",true);
                    component.set("v.isSmartSwitchesPage",false);
                    component.set("v.isErrorLicense",true);
                    component.set("v.errorLicense",'You checked but did not add a quantity');
                    break;
                }
            }
            else{
                component.set("v.isCondition",true);
            }
        }
        var isCondition = component.get("v.isCondition");
        if(isCondition == true){
            var smartAdOnList = component.get("v.smartAdOnList");
            var smartTelecommList = component.get("v.smartTelecommList");
            var action = component.get("c.telecommRule3");
            action.setParams({
                addOnList : smartAdOnList,
                telecommList : smartTelecommList
            });
            action.setCallback(this,function(response){
                var state = response.getState();
                if(state == "SUCCESS"){
                    var res = response.getReturnValue();
                    if(res == "false"){
                        component.set("v.isErrorLicense",false);
                        component.set("v.errorLicense",'');
                        component.set("v.isSmartTelecommPage",false);
                        component.set("v.isSmartSwitchesPage",true);
                        component.set("v.progress6",true);
                        component.set("v.step",'step-6');
                        var stopServerCall5 = component.get("v.stopServerCall5");
                        if(stopServerCall5 == true){
                            var recordId = component.get("v.recordId");
                            var action = component.get("c.getSwitchesSmartProdList");
                            action.setParams({
                                recordId : component.get("v.recordId"),
                                siteNumber : component.get("v.siteNumber")
                            });
                            action.setCallback(this,function(response){
                                var state = response.getState();
                                if(state == "SUCCESS"){
                                    var res = response.getReturnValue();
                                    if(res != null){
                                        component.set("v.smartSwitchPoeList",res);
                                    }}
                            });
                            $A.enqueueAction(action);
                        }
                        else{
                            var isAgainServerCall5 = component.get("v.isAgainServerCall5");
                            if(isAgainServerCall5 == true){
                                var recordId = component.get("v.recordId");
                                var action = component.get("c.getSwitchesSmartProdList");
                                action.setParams({
                                    recordId : component.get("v.recordId"),
                                    siteNumber : component.get("v.siteNumber")
                                });
                                action.setCallback(this,function(response){
                                    var state = response.getState();
                                    if(state == "SUCCESS"){
                                        var res = response.getReturnValue();
                                        if(res != null){
                                            component.set("v.smartSwitchPoeList",res);
                                        }}
                                });
                                $A.enqueueAction(action);
                                component.set("v.isAgainServerCall5",false);
                            }
                        }
                    }
                    else{
                        component.set("v.isTelecommRule",true);
                        component.set("v.errorRuleTelecomm",res);
                    }
                }
            });
            $A.enqueueAction(action);
        }
        },
 
   nextToSmartEquipmentPage :  function(component, event, helper) {
        debugger
        var smartSwitchPoeList = component.get("v.smartSwitchPoeList");
        for(var i = 0 ; i < smartSwitchPoeList.length ; i++){
            if(smartSwitchPoeList[i].boolval == true){
                if((smartSwitchPoeList[i].product.Quantity__c != undefined) && (smartSwitchPoeList[i].product.Quantity__c != "")){
                    component.set("v.isCondition",true);
                }
                else{
                    component.set("v.isCondition",false);
                    component.set("v.isSmartSwitchesPage",true);
                    component.set("v.isPageSmartVoiceEquipment",false);
                    component.set("v.isErrorLicense",true);
                    component.set("v.errorLicense",'You checked but did not add a quantity');
                    break;
                }
            }
            else{
                component.set("v.isCondition",true);
            }
        }
        
           var isCondition = component.get("v.isCondition");
        if(isCondition == true){
            
            var smartLicensesList = component.get("v.smartLicensesList");
            var smartSwitchPoeList = component.get("v.smartSwitchPoeList");
            var action = component.get("c.analogATArule");
            action.setParams({
                licenseList : smartLicensesList,
                switchPoeList : smartSwitchPoeList
            });
            action.setCallback(this,function(response){
                var state = response.getState();
                if(state == "SUCCESS"){
                    var res = response.getReturnValue();
                    if(res == "false"){
                        component.set("v.isErrorLicense",false);
                        component.set("v.errorLicense",'');
                        component.set("v.isSmartSwitchesPage",false);
                        component.set("v.isPageSmartVoiceEquipment",true);
                        component.set("v.progress7",true);
                        component.set("v.step",'step-7');
                        var stopServerCall6 = component.get("v.stopServerCall6");
                         if(stopServerCall6 == true){
                var recordId = component.get("v.recordId");
                var action = component.get("c.smartVoiceEquipmentProd");
                action.setParams({
                    recordId : component.get("v.recordId"),
                    siteNumber : component.get("v.siteNumber")
                });
                action.setCallback(this,function(response){
                    var state = response.getState();
                    if(state == "SUCCESS"){
                        var res = response.getReturnValue();
                        if(res != null){
                            component.set("v.smartEquipmentList",res);
                        }}
                });
                $A.enqueueAction(action);
            }
            else{
                var isAgainServerCall6 = component.get("v.isAgainServerCall6");
                if(isAgainServerCall6 == true){
                    var recordId = component.get("v.recordId");
                    var action = component.get("c.smartVoiceEquipmentProd");
                    action.setParams({
                        recordId : component.get("v.recordId"),
                        siteNumber : component.get("v.siteNumber")
                    });
                    action.setCallback(this,function(response){
                        var state = response.getState();
                        if(state == "SUCCESS"){
                            var res = response.getReturnValue();
                            if(res != null){
                                component.set("v.smartEquipmentList",res);
                            }}
                    });
                    $A.enqueueAction(action);
                    component.set("v.isAgainServerCall6",false);   
                }
            }                    }
                    else{
                        component.set("v.isTelecommRule",true);
                        component.set("v.errorRuleTelecomm",res);
                    }
                }
            });           
            $A.enqueueAction(action);
            
        }
        
        
        
        
        
        
       /* 
        
        var isCondition = component.get("v.isCondition");
        if(isCondition == true){
            component.set("v.isErrorLicense",false);
            component.set("v.errorLicense",'');
            component.set("v.isSmartSwitchesPage",false);
            component.set("v.isPageSmartVoiceEquipment",true);
            component.set("v.progress6",true);
            component.set("v.step",'step-6');
            var stopServerCall5 = component.get("v.stopServerCall5");
            if(stopServerCall5 == true){
                var recordId = component.get("v.recordId");
                var action = component.get("c.smartVoiceEquipmentProd");
                action.setParams({
                    recordId : component.get("v.recordId"),
                    siteNumber : component.get("v.siteNumber")
                });
                action.setCallback(this,function(response){
                    var state = response.getState();
                    if(state == "SUCCESS"){
                        var res = response.getReturnValue();
                        if(res != null){
                            component.set("v.smartEquipmentList",res);
                        }}
                });
                $A.enqueueAction(action);
            }
            else{
                var isAgainServerCall5 = component.get("v.isAgainServerCall5");
                if(isAgainServerCall5 == true){
                    var recordId = component.get("v.recordId");
                    var action = component.get("c.smartVoiceEquipmentProd");
                    action.setParams({
                        recordId : component.get("v.recordId"),
                        siteNumber : component.get("v.siteNumber")
                    });
                    action.setCallback(this,function(response){
                        var state = response.getState();
                        if(state == "SUCCESS"){
                            var res = response.getReturnValue();
                            if(res != null){
                                component.set("v.smartEquipmentList",res);
                            }}
                    });
                    $A.enqueueAction(action);
                    component.set("v.isAgainServerCall5",false);   
                }
            }
        }*/
    },
    
    nextToSmartRepairPage :  function(component, event, helper) {
        debugger
        var smartEquipmentList = component.get("v.smartEquipmentList");
        for(var i = 0 ; i < smartEquipmentList.length ; i++){
            if(smartEquipmentList[i].boolval == true){
                if((smartEquipmentList[i].product.Quantity__c != undefined) && (smartEquipmentList[i].product.Quantity__c != "")){
                    component.set("v.isCondition",true);
                }
                else{
                    component.set("v.isCondition",false);
                    component.set("v.isPageSmartVoiceEquipment",true);
                    component.set("v.isSmartRepairPage",false);
                    component.set("v.isErrorLicense",true);
                    component.set("v.errorLicense",'You checked but did not add a quantity');
                    break;
                }
            }
            else{
                component.set("v.isCondition",true);
            }
        }
        var isCondition = component.get("v.isCondition");
        if(isCondition == true){
            component.set("v.isErrorLicense",false);
            component.set("v.errorLicense",'');
            component.set("v.isPageSmartVoiceEquipment",false);
            component.set("v.isSmartRepairPage",true);
            component.set("v.progress8",true);
            component.set("v.step",'step-8');
            var stopServerCall7 = component.get("v.stopServerCall7");
            if(stopServerCall7 == true){
                var recordId = component.get("v.recordId");
                var action = component.get("c.smartVoiceRepairProd");
                action.setParams({
                    recordId : component.get("v.recordId"),
                    siteNumber : component.get("v.siteNumber")
                });
                action.setCallback(this,function(response){
                    var state = response.getState();
                    if(state == "SUCCESS"){
                        var res = response.getReturnValue();
                        if(res != null){
                            component.set("v.smartRepairList",res);
                        }}
                });
                $A.enqueueAction(action);
            }
            else{
                var isAgainServerCall7 = component.get("v.isAgainServerCall7");
                if(isAgainServerCall7 == true){
                    var recordId = component.get("v.recordId");
                    var action = component.get("c.smartVoiceRepairProd");
                    action.setParams({
                        recordId : component.get("v.recordId"),
                        siteNumber : component.get("v.siteNumber")
                    });
                    action.setCallback(this,function(response){
                        var state = response.getState();
                        if(state == "SUCCESS"){
                            var res = response.getReturnValue();
                            if(res != null){
                                component.set("v.smartRepairList",res);
                            }}
                    });
                    $A.enqueueAction(action);
                    component.set("v.isAgainServerCall7",false);   
                }
            }
        }
    },
    
    nextToSmartBroadbandPage :  function(component, event, helper) {
        debugger
        var smartRepairList = component.get("v.smartRepairList");
        for(var i = 0 ; i < smartRepairList.length ; i++){
            if(smartRepairList[i].boolval == true){
                if((smartRepairList[i].product.Quantity__c != undefined) && (smartRepairList[i].product.Quantity__c != "")){
                    component.set("v.isCondition",true);
                }
                else{
                    component.set("v.isCondition",false);
                    component.set("v.isSmartRepairPage",true);
                    component.set("v.isPageSmartVoiceBroadband",false);
                    component.set("v.isErrorLicense",true);
                    component.set("v.errorLicense",'You checked but did not add a quantity');
                    break;
                }
            }
            else{
                component.set("v.isCondition",true);
            }
        }
        var isCondition = component.get("v.isCondition");
        if(isCondition == true){
            component.set("v.isErrorLicense",false);
            component.set("v.errorLicense",'');
            component.set("v.isSmartRepairPage",false);
            component.set("v.isPageSmartVoiceBroadband",true);
            component.set("v.progress9",true);
            component.set("v.step",'step-9');
            var stopServerCall8 = component.get("v.stopServerCall8");
            if(stopServerCall8 == true){
                var recordId = component.get("v.recordId");
                var action = component.get("c.smartVoiceBroadbandProd");
                action.setParams({
                    recordId : component.get("v.recordId"),
                    siteNumber : component.get("v.siteNumber")
                });
                action.setCallback(this,function(response){
                    var state = response.getState();
                    if(state == "SUCCESS"){
                        var res = response.getReturnValue();
                        if(res != null){
                            component.set("v.smartBroadbandList",res);
                        }}
                });
                $A.enqueueAction(action);
            }
            else{
                var isAgainServerCall8 = component.get("v.isAgainServerCall8");
                if(isAgainServerCall8 == true){
                    var recordId = component.get("v.recordId");
                    var action = component.get("c.smartVoiceBroadbandProd");
                    action.setParams({
                        recordId : component.get("v.recordId"),
                        siteNumber : component.get("v.siteNumber")
                    });
                    action.setCallback(this,function(response){
                        var state = response.getState();
                        if(state == "SUCCESS"){
                            var res = response.getReturnValue();
                            if(res != null){
                                component.set("v.smartBroadbandList",res);
                            }}
                    });
                    $A.enqueueAction(action);
                    component.set("v.isAgainServerCall8",false);   
                }
            }
        }
    },
    
    nextToSmartFIOSPage :  function(component, event, helper) {
        debugger
        var smartBroadbandList = component.get("v.smartBroadbandList");
        for(var i = 0 ; i < smartBroadbandList.length ; i++){
            if(smartBroadbandList[i].boolval == true){
                if((smartBroadbandList[i].product.Quantity__c != undefined) && (smartBroadbandList[i].product.Quantity__c != "")){
                    component.set("v.isCondition",true);
                }
                else{
                    component.set("v.isCondition",false);
                    component.set("v.isPageSmartVoiceBroadband",true);
                    component.set("v.isPageSmartVoiceFIOS",false);
                    component.set("v.isErrorLicense",true);
                    component.set("v.errorLicense",'You checked but did not add a quantity');
                    break;
                }
            }
            else{
                component.set("v.isCondition",true);
            }
        }
        var isCondition = component.get("v.isCondition");
        if(isCondition == true){
            component.set("v.isErrorLicense",false);
            component.set("v.errorLicense",'');
            component.set("v.isPageSmartVoiceBroadband",false);
            component.set("v.isPageSmartVoiceFIOS",true);
            component.set("v.progress10",true);
            component.set("v.step",'step-10');
            var stopServerCall9 = component.get("v.stopServerCall9");
            if(stopServerCall9 == true){
                var recordId = component.get("v.recordId");
                var action = component.get("c.smartVoiceFIOSProd");
                action.setParams({
                    recordId : component.get("v.recordId"),
                    siteNumber : component.get("v.siteNumber")
                });
                action.setCallback(this,function(response){
                    var state = response.getState();
                    if(state == "SUCCESS"){
                        var res = response.getReturnValue();
                        if(res != null){
                            component.set("v.smartFIOSList",res);
                        }}
                });
                $A.enqueueAction(action);
            }
            else{
                var isAgainServerCall9 = component.get("v.isAgainServerCall9");
                if(isAgainServerCall9 == true){
                    var recordId = component.get("v.recordId");
                    var action = component.get("c.smartVoiceFIOSProd");
                    action.setParams({
                        recordId : component.get("v.recordId"),
                        siteNumber : component.get("v.siteNumber")
                    });
                    action.setCallback(this,function(response){
                        var state = response.getState();
                        if(state == "SUCCESS"){
                            var res = response.getReturnValue();
                            if(res != null){
                                component.set("v.smartFIOSList",res);
                            }}
                    });
                    $A.enqueueAction(action);
                    component.set("v.isAgainServerCall9",false);   
                }
            }
        }
    },
    
    nextToSmartFiberPage :  function(component, event, helper) {
        debugger
        var smartFIOSList = component.get("v.smartFIOSList");
        for(var i = 0 ; i < smartFIOSList.length ; i++){
            if(smartFIOSList[i].boolval == true){
                if((smartFIOSList[i].product.Quantity__c != undefined) && (smartFIOSList[i].product.Quantity__c != "")){
                    component.set("v.isCondition",true);
                }
                else{
                    component.set("v.isCondition",false);
                    component.set("v.isPageSmartVoiceFIOS",true);
                    component.set("v.isPageSmartVoiceFiber",false);
                    component.set("v.isErrorLicense",true);
                    component.set("v.errorLicense",'You checked but did not add a quantity');
                    break;
                }
            }
            else{
                component.set("v.isCondition",true);
            }
        }
        var isCondition = component.get("v.isCondition");
        if(isCondition == true){
            component.set("v.isErrorLicense",false);
            component.set("v.errorLicense",'');
            component.set("v.isPageSmartVoiceFIOS",false);
            component.set("v.isPageSmartVoiceFiber",true);
            component.set("v.progress11",true);
            component.set("v.step",'step-11');
            var stopServerCall10 = component.get("v.stopServerCall10");
            if(stopServerCall10 == true){
                var recordId = component.get("v.recordId");
                var action = component.get("c.smartVoiceFiberProd");
                action.setParams({
                    recordId : component.get("v.recordId"),
                    siteNumber : component.get("v.siteNumber")
                });
                action.setCallback(this,function(response){
                    var state = response.getState();
                    if(state == "SUCCESS"){
                        var res = response.getReturnValue();
                        if(res != null){
                            component.set("v.smartFiberList",res);
                        }}
                });
                $A.enqueueAction(action);
            }
            else{
                var isAgainServerCall10 = component.get("v.isAgainServerCall10");
                if(isAgainServerCall10 == true){
                    var recordId = component.get("v.recordId");
                    var action = component.get("c.smartVoiceFiberProd");
                    action.setParams({
                        recordId : component.get("v.recordId"),
                        siteNumber : component.get("v.siteNumber")
                    });
                    action.setCallback(this,function(response){
                        var state = response.getState();
                        if(state == "SUCCESS"){
                            var res = response.getReturnValue();
                            if(res != null){
                                component.set("v.smartFiberList",res);
                            }}
                    });
                    $A.enqueueAction(action);
                    component.set("v.isAgainServerCall10",false);   
                }
            }
        }
    },
    
    nextToSmartBHSIPage :  function(component, event, helper) {
        debugger
        var smartFiberList = component.get("v.smartFiberList");
        for(var i = 0 ; i < smartFiberList.length ; i++){
            if(smartFiberList[i].boolval == true){
                if((smartFiberList[i].product.Quantity__c != undefined) && (smartFiberList[i].product.Quantity__c != "")){
                    component.set("v.isCondition",true);
                }
                else{
                    component.set("v.isCondition",false);
                    component.set("v.isPageSmartVoiceFiber",true);
                    component.set("v.isPageSmartVoiceBHSI",false);
                    component.set("v.isErrorLicense",true);
                    component.set("v.errorLicense",'You checked but did not add a quantity');
                    break;
                }
            }
            else{
                component.set("v.isCondition",true);
            }
        }
        var isCondition = component.get("v.isCondition");
        if(isCondition == true){
            component.set("v.isErrorLicense",false);
            component.set("v.errorLicense",'');
            component.set("v.isPageSmartVoiceFiber",false);
            component.set("v.isPageSmartVoiceBHSI",true);
            component.set("v.progress12",true);
            component.set("v.step",'step-12');
            var stopServerCall11 = component.get("v.stopServerCall11");
            if(stopServerCall11 == true){
                var recordId = component.get("v.recordId");
                var action = component.get("c.smartVoiceBHSIProd");
                action.setParams({
                    recordId : component.get("v.recordId"),
                    siteNumber : component.get("v.siteNumber")
                });
                action.setCallback(this,function(response){
                    var state = response.getState();
                    if(state == "SUCCESS"){
                        var res = response.getReturnValue();
                        if(res != null){
                            component.set("v.smartBHSIList",res);
                        }}
                });
                $A.enqueueAction(action);
            }
            else{
                var isAgainServerCall11 = component.get("v.isAgainServerCall11");
                if(isAgainServerCall11 == true){
                    var recordId = component.get("v.recordId");
                    var action = component.get("c.smartVoiceBHSIProd");
                    action.setParams({
                        recordId : component.get("v.recordId"),
                        siteNumber : component.get("v.siteNumber")
                    });
                    action.setCallback(this,function(response){
                        var state = response.getState();
                        if(state == "SUCCESS"){
                            var res = response.getReturnValue();
                            if(res != null){
                                component.set("v.smartBHSIList",res);
                            }}
                    });
                    $A.enqueueAction(action);
                    component.set("v.isAgainServerCall11",false);   
                }
            }
        }
    },
    
    nextToSmartOtherPage : function(component, event, helper) {
        debugger
        var smartBHSIList = component.get("v.smartBHSIList");
        for(var i = 0 ; i < smartBHSIList.length ; i++){
            if(smartBHSIList[i].boolval == true){
                if((smartBHSIList[i].product.Quantity__c != undefined) && (smartBHSIList[i].product.Quantity__c != "")){
                    component.set("v.isCondition",true);
                }
                else{
                    component.set("v.isCondition",false);
                    component.set("v.isPageSmartVoiceBHSI",true);
                    component.set("v.isSmartOtherPage",false);
                    component.set("v.isErrorLicense",true);
                    component.set("v.errorLicense",'You checked but did not add a quantity');
                    break;
                }
            }
            else{
                component.set("v.isCondition",true);
            }
        }
        var isCondition = component.get("v.isCondition");
        if(isCondition == true){
            component.set("v.isErrorLicense",false);
            component.set("v.errorLicense",'');
            component.set("v.isPageSmartVoiceBHSI",false);
            component.set("v.isSmartOtherPage",true);
            component.set("v.progress13",true);
            component.set("v.step",'step-13');
            var stopServerCall12 = component.get("v.stopServerCall12");
            if(stopServerCall12 == true){
                
            }
        }
    },
    nextToSmartPreviewPage : function(component, event, helper) {
        debugger
        component.set("v.isSmartOtherPage",false);
        component.set("v.isSmartPreviewPage",true);
        component.set("v.cancelPreview",true);
        component.set("v.step",'step-14');
        var list = [];
        var list2 = [];
        var smartOtherProdList = component.get("v.smartOtherProdList");
        for(var i = 0 ; i < smartOtherProdList.length ; i++){
            if((smartOtherProdList[i].ProductName__c == '' || smartOtherProdList[i].ProductName__c == undefined)&& (smartOtherProdList[i].Type_of_billing__c == '' || smartOtherProdList[i].Type_of_billing__c == undefined) && (smartOtherProdList[i].Quantity__c == '' || smartOtherProdList[i].Quantity__c == undefined) && (smartOtherProdList[i].MrcPrice__c == '' || smartOtherProdList[i].MrcPrice__c == undefined )) {
                list.pop(smartOtherProdList[i]);
            }
            else{
                list2.push(smartOtherProdList[i]);
            }
        }
        component.set("v.smartOtherProdList",list);
        component.set("v.smartOtherProdList",list2);
        component.set("v.smartOtherProdList2",list);
        component.set("v.smartOtherProdList2",list2);
        var smartLicensesList = component.get("v.smartLicensesList");
        var smartAdOnList = component.get("v.smartAdOnList");
        var smartIpPhoneList = component.get("v.smartIpPhoneList");
         var smartTelecommList = component.get("v.smartTelecommList");
        var smartSwitchPoeList = component.get("v.smartSwitchPoeList");
        var smartEquipmentList = component.get("v.smartEquipmentList");
        var smartRepairList = component.get("v.smartRepairList");
        var smartBroadbandList = component.get("v.smartBroadbandList");
        var smartFIOSList = component.get("v.smartFIOSList");
        var smartFiberList = component.get("v.smartFiberList");
        var smartBHSIList = component.get("v.smartBHSIList");
        
        var licenseList = [];
        var ipPhoneList = [];
        var adOnList = [];
        var telecommList = [];
        var switchPoeList = [];
        var repairList = [];
        var equipmentList = [];
        var broadbandList = [];
        var FIOSlist = [];
        var fiberList = [];
        var BHSIlist = [];
        
        for(var i = 0; i < smartLicensesList.length ; i++){
            if(smartLicensesList[i].boolval == true){
                licenseList.push(smartLicensesList[i]);
            }
        }
        for(var i = 0; i < smartIpPhoneList.length ; i++){
            if(smartIpPhoneList[i].boolval == true){
                ipPhoneList.push(smartIpPhoneList[i]);
            }
        }
        for(var i = 0; i < smartAdOnList.length ; i++){
            if(smartAdOnList[i].boolval == true){
                adOnList.push(smartAdOnList[i]);
            }
        }
         for(var i = 0; i < smartTelecommList.length ; i++){
            if(smartTelecommList[i].boolval == true){
                telecommList.push(smartTelecommList[i]);
            }
        }
        for(var i = 0; i < smartSwitchPoeList.length ; i++){
            if(smartSwitchPoeList[i].boolval == true){
                switchPoeList.push(smartSwitchPoeList[i]);
            }
        }
        for(var i = 0; i < smartRepairList.length ; i++){
            if(smartRepairList[i].boolval == true){
                repairList.push(smartRepairList[i]);
            }
        }
        for(var i = 0; i < smartEquipmentList.length ; i++){
            if(smartEquipmentList[i].boolval == true){
                equipmentList.push(smartEquipmentList[i]);
            }
        }
        for(var i = 0; i < smartBroadbandList.length ; i++){
            if(smartBroadbandList[i].boolval == true){
                broadbandList.push(smartBroadbandList[i]);
            }
        }
        for(var i = 0; i < smartFIOSList.length ; i++){
            if(smartFIOSList[i].boolval == true){
                FIOSlist.push(smartFIOSList[i]);
            }
        }
        for(var i = 0; i < smartFiberList.length ; i++){
            if(smartFiberList[i].boolval == true){
                fiberList.push(smartFiberList[i]);
            }
        }
        for(var i = 0; i < smartBHSIList.length ; i++){
            if(smartBHSIList[i].boolval == true){
                BHSIlist.push(smartBHSIList[i]);
            }
        }
      
        component.set("v.smartLicensesList2",licenseList);
        component.set("v.smartIpPhoneList2",ipPhoneList);
        component.set("v.smartAdOnList2",adOnList);
         component.set("v.smartTelecommList2",telecommList);
        component.set("v.smartSwitchPoeList2",switchPoeList);
        component.set("v.smartEquipmentList2",equipmentList);
        component.set("v.smartRepairList2",repairList);
        component.set("v.smartBroadbandList2",broadbandList);
        component.set("v.smartFIOSList2",FIOSlist);
        component.set("v.smartFiberList2",fiberList);
        component.set("v.smartBHSIList2",BHSIlist);
        
        
    },
    smartComplete : function(component, event, helper) {
        debugger
        component.set("v.isChecked",false);
        var smartLicensesList2 = component.get("v.smartLicensesList2");
        var smartAdOnList2 = component.get("v.smartAdOnList2");
        var smartIpPhoneList2 = component.get("v.smartIpPhoneList2");
         var smartTelecommList2 = component.get("v.smartTelecommList2");
        var smartSwitchPoeList2 = component.get("v.smartSwitchPoeList2");
        var smartEquipmentList2 = component.get("v.smartEquipmentList2");
        var smartRepairList2 = component.get("v.smartRepairList2");
        var smartBroadbandList2 = component.get("v.smartBroadbandList2");
        var smartFIOSList2 = component.get("v.smartFIOSList2");
        var smartFiberList2 = component.get("v.smartFiberList2");
        var smartBHSIList2 = component.get("v.smartBHSIList2");
        if(smartLicensesList2.length > 0){
            for(var i = 0 ; i < smartLicensesList2.length ; i++){
                if(smartLicensesList2[i].boolval == true){
                    if((smartLicensesList2[i].product.Quantity__c != undefined) && (smartLicensesList2[i].product.Quantity__c != "")){
                        component.set("v.isCondition",true);
                    }
                    else{
                        component.set("v.isCondition",false);
                        component.set("v.isPageSmartPreview",true);
                        component.set("v.isPage17",false);
                        component.set("v.isErrorLicense",true);
                        component.set("v.errorLicense",'You checked but did not add a quantity');
                        break;
                    }
                }
                else{
                    component.set("v.isCondition",true);
                }
            }  
        }
        else{
            component.set("v.isCondition",true); 
        }
        
        
        var smartAdOnList2 = component.get("v.smartAdOnList2");
        if(smartAdOnList2.length > 0){
            for(var i = 0 ; i < smartAdOnList2.length ; i++){
                if(smartAdOnList2[i].boolval == true){
                    if((smartAdOnList2[i].product.Quantity__c != undefined) && (smartAdOnList2[i].product.Quantity__c != "")){
                        component.set("v.isCondition2",true);
                    }
                    else{
                        component.set("v.isCondition2",false);
                        component.set("v.isPageSmartPreview",true);
                        component.set("v.isPage17",false);
                        component.set("v.isErrorLicense",true);
                        component.set("v.errorLicense",'You checked but did not add a quantity');
                        break;
                    }
                }
                else{
                    component.set("v.isCondition2",true);
                }
            }
        }
        else{
            component.set("v.isCondition2",true);
        }
        var smartIpPhoneList2 = component.get("v.smartIpPhoneList2");
        if(smartIpPhoneList2.length > 0){
            for(var i = 0 ; i < smartIpPhoneList2.length ; i++){
                if(smartIpPhoneList2[i].boolval == true){
                    if((smartIpPhoneList2[i].product.Quantity__c != undefined) && (smartIpPhoneList2[i].product.Quantity__c != "")){
                        component.set("v.isCondition3",true);
                    }
                    else{
                        component.set("v.isCondition3",false);
                        component.set("v.isPageSmartPreview",true);
                        component.set("v.isPage17",false);
                        component.set("v.isErrorLicense",true);
                        component.set("v.errorLicense",'You checked but did not add a quantity');
                        break;
                    }
                }
                else{
                    component.set("v.isCondition3",true);
                }
            } 
        }
        else{
            component.set("v.isCondition3",true);
        }
         var smartTelecommList2 = component.get("v.smartTelecommList2");
        if(smartTelecommList2.length > 0){
            for(var i = 0 ; i < smartTelecommList2.length ; i++){
                if(smartTelecommList2[i].boolval == true){
                    if((smartTelecommList2[i].product.Quantity__c != undefined) && (smartTelecommList2[i].product.Quantity__c != "")){
                        component.set("v.isCondition11",true);
                    }
                    else{
                        component.set("v.isCondition11",false);
                        component.set("v.isPageSmartPreview",true);
                        component.set("v.isPage17",false);
                        component.set("v.isErrorLicense",true);
                        component.set("v.errorLicense",'You checked but did not add a quantity');
                        break;
                    }
                }
                else{
                    component.set("v.isCondition11",true);
                }
            } 
        }
        else{
            component.set("v.isCondition11",true);
        }
        var smartSwitchPoeList2 = component.get("v.smartSwitchPoeList2");
        if(smartSwitchPoeList2.length > 0){
            for(var i = 0 ; i < smartSwitchPoeList2.length ; i++){
                if(smartSwitchPoeList2[i].boolval == true){
                    if((smartSwitchPoeList2[i].product.Quantity__c != undefined) && (smartSwitchPoeList2[i].product.Quantity__c != "")){
                        component.set("v.isCondition4",true);
                    }
                    else{
                        component.set("v.isCondition4",false);
                        component.set("v.isPageSmartPreview",true);
                        component.set("v.isPage17",false);
                        component.set("v.isErrorLicense",true);
                        component.set("v.errorLicense",'You checked but did not add a quantity');
                        break;
                    }
                }
                else{
                    component.set("v.isCondition4",true);
                }
            } 
        }
        else{
            component.set("v.isCondition4",true);
        }
        var smartEquipmentList2 = component.get("v.smartEquipmentList2");
        if(smartEquipmentList2.length > 0){
            for(var i = 0 ; i < smartEquipmentList2.length ; i++){
                if(smartEquipmentList2[i].boolval == true){
                    if((smartEquipmentList2[i].product.Quantity__c != undefined) && (smartEquipmentList2[i].product.Quantity__c != "")){
                        component.set("v.isCondition5",true);
                    }
                    else{
                        component.set("v.isCondition5",false);
                        component.set("v.isPageSmartPreview",true);
                        component.set("v.isPage17",false);
                        component.set("v.isErrorLicense",true);
                        component.set("v.errorLicense",'You checked but not put the quantity');
                        break;
                    }
                }
                else{
                    component.set("v.isCondition5",true);
                }
            }
        }
        else{
            component.set("v.isCondition5",true);
        }
        var smartRepairList2 = component.get("v.smartRepairList2");
        if(smartRepairList2.length > 0){
            for(var i = 0 ; i < smartRepairList2.length ; i++){
                if(smartRepairList2[i].boolval == true){
                    if((smartRepairList2[i].product.Quantity__c != undefined) && (smartRepairList2[i].product.Quantity__c != "")){
                        component.set("v.isCondition6",true);
                    }
                    else{
                        component.set("v.isCondition6",false);
                        component.set("v.isPageSmartPreview",true);
                        component.set("v.isPage17",false);
                        component.set("v.isErrorLicense",true);
                        component.set("v.errorLicense",'You checked but did not add a quantity');
                        break;
                    }
                }
                else{
                    component.set("v.isCondition6",true);
                }
            }
        }
        else{
            component.set("v.isCondition6",true);
        }
        var smartBroadbandList2 = component.get("v.smartBroadbandList2");
        if(smartBroadbandList2.length > 0){
            for(var i = 0 ; i < smartBroadbandList2.length ; i++){
                if(smartBroadbandList2[i].boolval == true){
                    if((smartBroadbandList2[i].product.Quantity__c != undefined) && (smartBroadbandList2[i].product.Quantity__c != "")){
                        component.set("v.isCondition7",true);
                    }
                    else{
                        component.set("v.isCondition7",false);
                        component.set("v.isPageSmartPreview",true);
                        component.set("v.isPage17",false);
                        component.set("v.isErrorLicense",true);
                        component.set("v.errorLicense",'You checked but did not add a quantity');
                        break;
                    }
                }
                else{
                    component.set("v.isCondition7",true);
                }
            }
        }
        else{
            component.set("v.isCondition7",true);
        }
        var smartFIOSList2 = component.get("v.smartFIOSList2");
        if(smartFIOSList2.length > 0){
            for(var i = 0 ; i < smartFIOSList2.length ; i++){
                if(smartFIOSList2[i].boolval == true){
                    if((smartFIOSList2[i].product.Quantity__c != undefined) && (smartFIOSList2[i].product.Quantity__c != "")){
                        component.set("v.isCondition8",true);
                    }
                    else{
                        component.set("v.isCondition8",false);
                        component.set("v.isPageSmartPreview",true);
                        component.set("v.isPage17",false);
                        component.set("v.isErrorLicense",true);
                        component.set("v.errorLicense",'You checked but did not add a quantity');
                        break;
                    }
                }
                else{
                    component.set("v.isCondition8",true);
                }
            }
        }
        else{
            component.set("v.isCondition8",true);
        }
        var smartFiberList2 = component.get("v.smartFiberList2");
        if(smartFiberList2.length > 0){
            for(var i = 0 ; i < smartFiberList2.length ; i++){
                if(smartFiberList2[i].boolval == true){
                    if((smartFiberList2[i].product.Quantity__c != undefined) && (smartFiberList2[i].product.Quantity__c != "")){
                        component.set("v.isCondition9",true);
                    }
                    else{
                        component.set("v.isCondition9",false);
                        component.set("v.isPageSmartPreview",true);
                        component.set("v.isPage17",false);
                        component.set("v.isErrorLicense",true);
                        component.set("v.errorLicense",'You checked but did not add a quantity');
                        break;
                    }
                }
                else{
                    component.set("v.isCondition9",true);
                }
            }
        }
        else{
            component.set("v.isCondition9",true);
        }
        var smartBHSIList2 = component.get("v.smartBHSIList2");
        if(smartBHSIList2.length > 0){
            for(var i = 0 ; i < smartBHSIList2.length ; i++){
                if(smartBHSIList2[i].boolval == true){
                    if((smartBHSIList2[i].product.Quantity__c != undefined) && (smartBHSIList2[i].product.Quantity__c != "")){
                        component.set("v.isCondition10",true);
                    }
                    else{
                        component.set("v.isCondition10",false);
                        component.set("v.isPageSmartPreview",true);
                        component.set("v.isPage17",false);
                        component.set("v.isErrorLicense",true);
                        component.set("v.errorLicense",'You checked but did not add a quantity');
                        break;
                    }
                }
                else{
                    component.set("v.isCondition10",true);
                }
            }
        }
        else{
            component.set("v.isCondition10",true);
        }
        
        var isCondition = component.get("v.isCondition");
        var isCondition2 = component.get("v.isCondition2");
        var isCondition3 = component.get("v.isCondition3");
        var isCondition4 = component.get("v.isCondition4");
        var isCondition5 = component.get("v.isCondition5");  
        var isCondition6 = component.get("v.isCondition6");
        var isCondition7 = component.get("v.isCondition7");
        var isCondition8 = component.get("v.isCondition8");
        var isCondition9 = component.get("v.isCondition9");
        var isCondition10 = component.get("v.isCondition10");
        var isCondition11 = component.get("v.isCondition11");
        
        if((isCondition == true) && (isCondition2 == true) && (isCondition3 == true) && (isCondition4 == true) && (isCondition5 == true) && (isCondition6 == true) && (isCondition7 == true) && (isCondition8 == true) && (isCondition9 == true) && (isCondition10 == true) && (isCondition11 == true)){
            var recordId = component.get("v.recordId");
            var smartLicensesList2 = component.get("v.smartLicensesList2");
            var smartSwitchPoeList2 = component.get("v.smartSwitchPoeList2");
            var action = component.get("c.analogATArule");
            action.setParams({
                licenseList : smartLicensesList2,
                switchPoeList : smartSwitchPoeList2
            });
            action.setCallback(this,function(response){
                var state = response.getState();
                if(state == "SUCCESS"){
                    var res = response.getReturnValue();
                    if(res == "false"){
                        
                        var smartVoiceIpPhoneRuleAction = component.get("c.smartVoiceIpPhoneRule");
                        smartVoiceIpPhoneRuleAction.setParams({
                            licenselist :  smartLicensesList2,
                            phonelist : smartIpPhoneList2
                        });
                        smartVoiceIpPhoneRuleAction.setCallback(this,function(response){
                            var state = response.getState();
                            if(state == "SUCCESS"){
                                var res = response.getReturnValue();
                                if(res == "false"){
                                    
                                    var smartVoiceIpSoundStationRuleAction = component.get("c.smartVoiceIpSoundStationRule");
                                    smartVoiceIpSoundStationRuleAction.setParams({
                                        licenselist :  smartLicensesList2,
                                        phonelist : smartIpPhoneList2
                                    });
                                    smartVoiceIpSoundStationRuleAction.setCallback(this,function(response){
                                        var state = response.getState();
                                        if(state == "SUCCESS"){
                                            var res = response.getReturnValue();
                                            if(res == "false"){
                            var smartAdOnList2 = component.get("v.smartAdOnList2");
                                                var smartTelecommList2 = component.get("v.smartTelecommList2");
                                                var telecommRule3Action = component.get("c.telecommRule3");
                                                telecommRule3Action.setParams({
                                                    addOnList : smartAdOnList2,
                                                    telecommList : smartTelecommList2
                                                });
                                                telecommRule3Action.setCallback(this,function(response){
                                                    var state = response.getState();
                                                    if(state == "SUCCESS"){
                                                        var res = response.getReturnValue();
                                                        if(res == "false"){ 
       
                                                            
                        var smartLicensesList2 = component.get("v.smartLicensesList2");
                        var check = false;
                        for(var i = 0 ; i < smartLicensesList2.length ; i++){
                            if(smartLicensesList2[i].boolval == true){
                                if(smartLicensesList2[i].product.PremiumRule__c == true){
                                    check = true;
                                }
                            }
                        }
                        if(check){
                            for(var i = 0 ; i < smartLicensesList2.length ; i++){
                                if(smartLicensesList2[i].boolval == true){
                                    if(smartLicensesList2[i].product.PremiumPlusRule__c == true ){
                                        component.set("v.isPremiumRule",false);
                                        break;
                                    }
                                    else{
                                        component.set("v.isPremiumRule",true);
                                        component.set("v.premiumError",'Premium Plus is required for premium');
                                    }
                                }
                                
                            }
                        }
                        
                        var isPremiumRule =  component.get("v.isPremiumRule");
                        if(isPremiumRule == false){
                            
                            
                            var selVal4 = component.get("v.selVal4");
                            component.set("v.isShow",true);
                            var smartLicensesList2 = component.get("v.smartLicensesList2");
                            var smartAdOnList2 = component.get("v.smartAdOnList2");
                            var smartIpPhoneList2 = component.get("v.smartIpPhoneList2");
                             var smartTelecommList2 = component.get("v.smartTelecommList2");
                            var smartSwitchPoeList2 = component.get("v.smartSwitchPoeList2");
                            var smartEquipmentList2 = component.get("v.smartEquipmentList2");
                            var smartRepairList2 = component.get("v.smartRepairList2");
                            var smartBroadbandList2 = component.get("v.smartBroadbandList2");
                            var smartFIOSList2 = component.get("v.smartFIOSList2");
                            var smartFiberList2 = component.get("v.smartFiberList2");
                            var smartBHSIList2 = component.get("v.smartBHSIList2");
                            var numberOfSites = component.get("v.page");
                            var smartOtherProdList2 = component.get("v.smartOtherProdList2");
                            var action9 = component.get("c.saveCustomProduct");
                            action9.setParams({
                                prod : smartOtherProdList2,
                                recordId : component.get("v.recordId"),
                                numberOfSites : component.get("v.siteNumber")
                            });
                            action9.setCallback(this,function(response){
                                var state = response.getState();
                                if(state == "SUCCESS"){
                                    
                                }
                            });
                            $A.enqueueAction(action9);
                            
                            var items = [];
                            for(var i = 0; i < smartLicensesList2.length ; i++){
                                var item = {
                                    "Id" : smartLicensesList2[i].product.Id,
                                    "Name": smartLicensesList2[i].product.Name,
                                    "Quantity__c" : smartLicensesList2[i].product.Quantity__c,
                                    "Amount__c": smartLicensesList2[i].pricebookEntry.UnitPrice
                                };
                                items.push(item);
                            }
                            component.set("v.allSmartProductList",items);
                            for(var i = 0; i < smartAdOnList2.length ; i++){
                                var item = {
                                     "Id" : smartAdOnList2[i].product.Id,
                                    "Name": smartAdOnList2[i].product.Name,
                                    "Quantity__c" : smartAdOnList2[i].product.Quantity__c,
                                    "Amount__c": smartAdOnList2[i].pricebookEntry.UnitPrice
                                };
                                items.push(item);
                            }
                            component.set("v.allSmartProductList",items);
                            for(var i = 0; i < smartIpPhoneList2.length ; i++){
                                var item = {
                                     "Id" : smartIpPhoneList2[i].product.Id,
                                    "Name": smartIpPhoneList2[i].product.Name,
                                    "Quantity__c" : smartIpPhoneList2[i].product.Quantity__c,
                                    "Amount__c": smartIpPhoneList2[i].pricebookEntry.UnitPrice
                                };
                                items.push(item);
                            }
                            component.set("v.allSmartProductList",items);
                              for(var i = 0; i < smartTelecommList2.length ; i++){
                                var item = {
                                     "Id" : smartTelecommList2[i].product.Id,
                                    "Name": smartTelecommList2[i].product.Name,
                                    "Quantity__c" : smartTelecommList2[i].product.Quantity__c,
                                    "Amount__c": smartTelecommList2[i].pricebookEntry.UnitPrice
                                };
                                items.push(item);
                            }
                            component.set("v.allSmartProductList",items);
                   
                            for(var i = 0; i < smartSwitchPoeList2.length ; i++){
                                var item = {
                                     "Id" : smartSwitchPoeList2[i].product.Id,
                                    "Name": smartSwitchPoeList2[i].product.Name,
                                    "Quantity__c" : smartSwitchPoeList2[i].product.Quantity__c,
                                    "Amount__c": smartSwitchPoeList2[i].pricebookEntry.UnitPrice
                                };
                                items.push(item);
                            }
                            component.set("v.allSmartProductList",items);
                            for(var i = 0; i < smartEquipmentList2.length ; i++){
                                var item = {
                                     "Id" : smartEquipmentList2[i].product.Id,
                                    "Name": smartEquipmentList2[i].product.Name,
                                    "Quantity__c" : smartEquipmentList2[i].product.Quantity__c,
                                    "Amount__c": smartEquipmentList2[i].pricebookEntry.UnitPrice
                                };
                                items.push(item);
                            }
                            component.set("v.allSmartProductList",items);
                            for(var i = 0; i < smartRepairList2.length ; i++){
                                var item = {
                                     "Id" : smartRepairList2[i].product.Id,
                                    "Name": smartRepairList2[i].product.Name,
                                    "Quantity__c" : smartRepairList2[i].product.Quantity__c,
                                    "Amount__c": smartRepairList2[i].pricebookEntry.UnitPrice
                                };
                                items.push(item);
                            }
                            component.set("v.allSmartProductList",items);
                            for(var i = 0; i < smartBroadbandList2.length ; i++){
                                var item = {
                                     "Id" : smartBroadbandList2[i].product.Id,
                                    "Name": smartBroadbandList2[i].product.Name,
                                    "Quantity__c" : smartBroadbandList2[i].product.Quantity__c,
                                    "Amount__c": smartBroadbandList2[i].pricebookEntry.UnitPrice
                                };
                                items.push(item);
                            }
                            component.set("v.allSmartProductList",items);
                            for(var i = 0; i < smartFIOSList2.length ; i++){
                                var item = {
                                     "Id" : smartFIOSList2[i].product.Id,
                                    "Name": smartFIOSList2[i].product.Name,
                                    "Quantity__c" : smartFIOSList2[i].product.Quantity__c,
                                    "Amount__c": smartFIOSList2[i].pricebookEntry.UnitPrice
                                };
                                items.push(item);
                            }
                            component.set("v.allSmartProductList",items);
                            for(var i = 0; i < smartFiberList2.length ; i++){
                                var item = {
                                     "Id" : smartFiberList2[i].product.Id,
                                    "Name": smartFiberList2[i].product.Name,
                                    "Quantity__c" : smartFiberList2[i].product.Quantity__c,
                                    "Amount__c": smartFiberList2[i].pricebookEntry.UnitPrice
                                };
                                items.push(item);
                            }
                            component.set("v.allSmartProductList",items);
                            for(var i = 0; i < smartBHSIList2.length ; i++){
                                var item = {
                                     "Id" : smartBHSIList2[i].product.Id,
                                    "Name": smartBHSIList2[i].product.Name,
                                    "Quantity__c" : smartBHSIList2[i].product.Quantity__c,
                                    "Amount__c": smartBHSIList2[i].pricebookEntry.UnitPrice
                                };
                                items.push(item);
                            }
                            component.set("v.allSmartProductList",items);
                             var deleteProdAction = component.get("c.deleteProd");
                                deleteProdAction.setParams({
                                    allProductList :  component.get("v.allSmartProductList"),
                                    recordId : component.get("v.recordId"),
                                    siteNumber :  component.get("v.siteNumber")
                                });
                                deleteProdAction.setCallback(this,function(response){
                                    var state = response.getState();
                                    if(state == "SUCCESS"){
                                    }
                                });
                              $A.enqueueAction(deleteProdAction); 
                                        
                            var action21 = component.get("c.getSiteId");
                            action21.setParams({
                                recordId : recordId,
                                siteNumber : component.get("v.siteNumber")
                            });
                            action21.setCallback(this,function(response){
                                var state = response.getState();
                                if(state == "SUCCESS"){
                                    var res = response.getReturnValue();
                                    if(res != null){
                                        component.set("v.siteId",res);
                                    }}
                                
                               
                                        
                                var recordId = component.get("v.recordId");
                                var selVal4 = component.get("v.poe");
                                var siteId = component.get("v.siteId");
                                var action11 = component.get("c.saveSmartRecord");
                                action11.setParams({
                                    recordId : recordId,
                                    productList : smartLicensesList2,
                                    productListAddOn : smartAdOnList2,
                                    productListIpPhones : smartIpPhoneList2,
                                    swithesAndPOElist : smartSwitchPoeList2,
                                    productListRepair : smartRepairList2,
                                    productListBroadband : smartBroadbandList2,
                                    productListFIOS : smartFIOSList2,
                                    productListFiber : smartFiberList2,
                                    productListBHSI : smartBHSIList2,
                                    productListEquipment : smartEquipmentList2,
                                    productListTeleCom : smartTelecommList2,
                                    selVal4 : selVal4,
                                    numberOfSites : numberOfSites,
                                    siteId : siteId
                                    
                                });
                                action11.setCallback(this,function(response){
                                    var state = response.getState();
                                    if(state == "SUCCESS"){
                                        component.set("v.isSmartPreviewPage",false);
                                        component.set("v.isCongratsPage",true);
                                        component.set("v.progress14",true);
                                        component.set("v.step",'step-14');
                                        
                                    }
                                });
                                $A.enqueueAction(action11);  
                                
                            });
                            $A.enqueueAction(action21);
                        }
                        else{
                            
                        }
                                                        }
                                                         else{
                                                component.set("v.isSmartTelecommRule",true);
                                                component.set("v.telecommRuleError",res);
                                            }
                                        }
                                    });
                                    $A.enqueueAction(telecommRule3Action);
                                            }
                                            
                                             else{
                                                component.set("v.isIpPhoneRule2",true);
                                                component.set("v.ipPhoneRuleError2",res);
                                            }
                                        }
                                    });
                                    $A.enqueueAction(smartVoiceIpSoundStationRuleAction);
                                }
                                else{
                                    component.set("v.isIpPhoneRule",true);
                                    component.set("v.ipPhoneRuleError",res);
                                }
                            }
                        });
                        $A.enqueueAction(smartVoiceIpPhoneRuleAction);
                        
                    }
                    else{
                        component.set("v.isTelecommRule",true);
                        component.set("v.errorRuleTelecomm",res);
                    }
                }
            });           
            $A.enqueueAction(action);
                                            
                  
        }
    }
    
})