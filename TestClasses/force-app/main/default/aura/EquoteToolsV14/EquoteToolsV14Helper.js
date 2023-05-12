({
    complete :  function(component, event, helper) {
        debugger
        component.set("v.isShow",true);
        var selVal4 = component.get("v.selVal4");
        var productList2 = component.get("v.productList2");
        var productListAddOn2 = component.get("v.productListAddOn2");
        var productListTelecomm2 = component.get("v.productListTelecomm2");
        var productListIpPhones2 = component.get("v.productListIpPhones2");
        var productListIPPhonePower2 = component.get("v.productListIPPhonePower2");
        var swithesAndPOElist2 = component.get("v.swithesAndPOElist2");
        var recordId = component.get("v.recordId");
        var numberOfSites = component.get("v.page");
        var addProductList2 = component.get("v.addProductList2");
        var action9 = component.get("c.saveCustomProduct");
        action9.setParams({
            prod : addProductList2,
            recordId : recordId,
            numberOfSites : numberOfSites
        });
        action9.setCallback(this,function(response){
            var state = response.getState();
            if(state == "SUCCESS"){
                
            }
        });
        $A.enqueueAction(action9);
        
        var action19 = component.get("c.updateContact");
        action19.setParams({
            recordId : recordId,
            name : component.get("v.conPerson"),
            email : component.get("v.conEmail"),
            phone:component.get("v.conPhone")
        });
        action19.setCallback(this,function(response){
            var state = response.getState();
            if(state == "SUCCESS"){
                
            }
        });
        $A.enqueueAction(action19);
        
        var recordId =  component.get("v.recordId");
        var site = component.get("v.value");
        if(site > 0){
            for(var j = 0 ; j < site ; j++){
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
                    'Opportunity__c' : ''
                });
                // set the updated list to attribute (contactList) again    
                component.set("v.addProductList", RowItemList);
                var items = [];
                for(var i = 0; i < productList2.length ; i++){
                    var item = {
                        "Name": productList2[i].product.Name,
                        "Quantity__c" : productList2[i].product.Quantity__c,
                        "Amount__c": productList2[i].pricebookEntry.UnitPrice
                    };
                    items.push(item);
                }
                component.set("v.allProductList",items);
                for(var i = 0; i < productListAddOn2.length ; i++){
                    var item = {
                        "Name": productListAddOn2[i].product.Name,
                        "Quantity__c" : productListAddOn2[i].product.Quantity__c,
                        "Amount__c": productListAddOn2[i].pricebookEntry.UnitPrice
                    };
                    items.push(item);
                }
                component.set("v.allProductList",items);
                for(var i = 0; i < productListTelecomm2.length ; i++){
                    var item = {
                        "Name": productListTelecomm2[i].product.Name,
                        "Quantity__c" : productListTelecomm2[i].product.Quantity__c,
                        "Amount__c": productListTelecomm2[i].pricebookEntry.UnitPrice
                    };
                    items.push(item);
                }
                component.set("v.allProductList",items);
                for(var i = 0; i < productListIpPhones2.length ; i++){
                    var item = {
                        "Name": productListIpPhones2[i].product.Name,
                        "Quantity__c" : productListIpPhones2[i].product.Quantity__c,
                        "Amount__c": productListIpPhones2[i].pricebookEntry.UnitPrice
                    };
                    items.push(item);
                }
                component.set("v.allProductList",items);
                for(var i = 0; i < productListIPPhonePower2.length ; i++){
                    var item = {
                        "Name": productListIPPhonePower2[i].product.Name,
                        "Quantity__c" : productListIPPhonePower2[i].product.Quantity__c,
                        "Amount__c": productListIPPhonePower2[i].pricebookEntry.UnitPrice
                    };
                    items.push(item);
                }
                component.set("v.allProductList",items);
                for(var i = 0; i < swithesAndPOElist2.length ; i++){
                    var item = {
                        "Name": swithesAndPOElist2[i].product.Name,
                        "Quantity__c" : swithesAndPOElist2[i].product.Quantity__c,
                        "Amount__c": swithesAndPOElist2[i].pricebookEntry.UnitPrice
                    };
                    items.push(item);
                }
                component.set("v.allProductList",items);
                var siteName = component.get("v.siteName");
                var selVal4 = component.get("v.selVal4");
                var city = component.get("v.city");
                var country = component.get("v.country");
                var street = component.get("v.street");
                var postalCode = component.get("v.postalCode");
                var province = component.get("v.province");
                var primary = component.get("v.primary"); 
                var action12 = component.get("c.createSites");
                action12.setParams({
                    selVal4 : selVal4, 
                    recordId : recordId,
                    city : city,
                    country : country,
                    street : street,
                    postalCode : postalCode,
                    province : province,
                    siteNum : numberOfSites,
                    primary : primary,
                    siteName : siteName
                });
                action12.setCallback(this,function(response){
                    debugger
                    var state = response.getState();
                    if(state == "SUCCESS"){
                        var res = response.getReturnValue();
                        component.set("v.siteId",res);
                        //   var numberOfSites = component.get("v.page");
                        var recordId = component.get("v.recordId");
                        var selVal4 = component.get("v.selVal4");
                        var siteId = component.get("v.siteId");
                        var action11 = component.get("c.saveRecord");
                        
                        action11.setParams({
                            recordId : recordId,
                            productList : productList2,
                            productListAddOn : productListAddOn2,
                            productListTelecomm : productListTelecomm2,
                            productListIpPhones : productListIpPhones2,
                            productListIPPhonePower : productListIPPhonePower2,
                            swithesAndPOElist : swithesAndPOElist2,
                            selVal4 : selVal4,
                            numberOfSites : numberOfSites,
                            siteId : siteId
                        });
                        action11.setCallback(this,function(response){
                            var state = response.getState();
                        });
                        $A.enqueueAction(action11);  
                        var action13 = component.get("c.savePDFOpportunity");
                        action13.setParams({
                            recordId : recordId
                        });
                        action13.setCallback(this,function(response2){
                            var state2 = response2.getState();
                        });
                        $A.enqueueAction(action13); 
                    }
                });
                $A.enqueueAction(action12);
                
                
                var recordId = component.get("v.recordId");
                var action2 = component.get("c.getProduct");
                action2.setParams({
                    ids : recordId
                });
                action2.setCallback(this,function(response){
                    var state = response.getState();
                    if(state == "SUCCESS"){
                        var res = response.getReturnValue();
                        if(res != null){
                            component.set("v.productList",res);
                        }}
                });
                $A.enqueueAction(action2);
                var action = component.get("c.prod");
                action.setParams({ids : recordId});
                action.setCallback(this,function(response){
                    var state = response.getState();
                    if(state == "SUCCESS"){
                        var res = response.getReturnValue();
                        if(res != null){
                            component.set("v.productListAddOn",res);
                        }
                    }
                });
                $A.enqueueAction(action);
                var action3 = component.get("c.prodTelecomm");
                action3.setParams({
                    ids : recordId
                });
                action3.setCallback(this,function(response2){
                    var state2 = response2.getState();
                    if(state2 == "SUCCESS"){
                        var res2 = response2.getReturnValue();
                        if(res2 != null){
                            component.set("v.productListTelecomm",res2);
                            var productListTelecomm = component.get("v.productListTelecomm");
                            const compare = ( a, b ) => {
                                //debugger
                                const firstNameValues = a.product.Name.split(' ')
                                const secondNameValues = b.product.Name.split(' ')
                                let firstNum = parseInt(firstNameValues[firstNameValues.length - 1])
                                let secondNum = parseInt(secondNameValues[secondNameValues.length - 1])
                                if ( firstNum < secondNum ){
                                return -1;
                            }
                            if ( firstNum > secondNum ){
                                return 1;
                            }
                            return 0;
                        }
                        const AryObj = productListTelecomm.sort(compare)
                        }
                }
                                    });
                $A.enqueueAction(action3);
                var action4 = component.get("c.prodIpPhones");
                action4.setParams({
                    ids : recordId
                });
                action4.setCallback(this,function(response){
                    var state = response.getState();
                    if(state == "SUCCESS"){
                        var res = response.getReturnValue();
                        if(res != null){
                            component.set("v.productListIpPhones",res);
                            var productListIpPhones = component.get("v.productListIpPhones");
                            const compare = ( a, b ) => {
                                //  debugger
                                if (a.product.Name <  b.product.Name ){
                                return -1;
                            }
                            if (a.product.Name >  b.product.Name ){
                                return 1;
                            }
                            return 0;
                        }
                        const AryObj = productListIpPhones.sort(compare)
                        }
                }
                                    });
                $A.enqueueAction(action4);
                var action5 = component.get("c.prodAccessories");
                var recordId = component.get("v.recordId");
                action5.setParams({
                    ids : recordId
                });
                action5.setCallback(this,function(response){
                    var state = response.getState();
                    if(state == "SUCCESS"){
                        var res = response.getReturnValue();
                        if(res != null){
                            component.set("v.productListIPPhonePower",res);
                        }}
                });
                $A.enqueueAction(action5);
                var action17 = component.get("c.prodSwitchesAndPOE");
                var recordId = component.get("v.recordId");
                action17.setParams({
                    ids : recordId
                });
                action17.setCallback(this,function(response){
                    var state = response.getState();
                    if(state == "SUCCESS"){
                        var res = response.getReturnValue();
                        if(res != null){
                            component.set("v.swithesAndPOElist",res);
                        }}
                });
                $A.enqueueAction(action17);
                
                 component.set("v.stopServerCall",true);
                 component.set("v.stopServerCall2",true);
                 component.set("v.stopServerCall3",true);
                 component.set("v.stopServerCall4",true);
                 component.set("v.stopServerCall5",true);
                 component.set("v.stopServerCall6",true);
                 component.set("v.stopServerCall7",true);
                 component.set("v.stopServerCall8",true);
                var page = component.get("v.page");
                component.set("v.siteName",'');
                component.set("v.isSiteName",false);
                 component.set("v.isSiteAddress",true);
                component.set("v.page",page + 1);
                component.set("v.isSite",false);
                 component.set("v.isStateError",false);
                 component.set("v.isChecked",false);
                component.set("v.city",'');
                component.set("v.primary",'');
                component.set("v.country",'');
                component.set("v.street",'');
                component.set("v.postalCode",'');
                component.set("v.primary",false);
                component.set("v.valueOfCheck1",false);  
                component.set("v.isPage14",false);
                component.set("v.isPage6",true);
                component.set("v.value",site-1);
                component.set("v.productList2",list);
                component.set("v.productListAddOn2",list);
                component.set("v.productListTelecomm2",list);
                component.set("v.productListIpPhones2",list);
                component.set("v.productListIPPhonePower2",list);
                component.set("v.swithesAndPOElist2",list);
                
                break;
            }
            
        }
        var site2 = component.get("v.value");
        if(site2 == 0){
            component.set("v.isErrorLicense",false);
            component.set("v.errorLicense",'');
            component.set("v.isPage14",false);
            component.set("v.isPage6",false);
            component.set("v.isPage15",true);
            
        }
        
    },
    ruleStep1 :   function(component, event, helper) {
        debugger
        var action = component.get("c.rule1");
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
                    component.set("v.isPage8",false);
                    component.set("v.isPage9",true);
                    component.set("v.progress9",true);
                    component.set("v.step",'step-9');
                    var stopServerCall3 = component.get("v.stopServerCall3");
                    if(stopServerCall3 == true){
                        var action2 = component.get("c.prodTelecomm");
                        action2.setParams({
                            ids : recordId
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
                    component.set("v.error",res);
                    component.set("v.isChecked",true);
                }
            }
        });           
        $A.enqueueAction(action);
    },
    rule2 :  function(component, event, helper) {
        debugger
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
                    component.set("v.isPage10",false);
                    component.set("v.isPage11",true);
                    component.set("v.progress11",true);
                    component.set("v.step",'step-11');
                    var stopServerCall5 = component.get("v.stopServerCall5");
                    if(stopServerCall5 == true){
                        var action = component.get("c.prodIpPhonePower");
                        var recordId = component.get("v.recordId");
                        action.setParams({
                            ids : recordId
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
                }else{
                    component.set("v.error",res);
                    component.set("v.isChecked",true);
                }
            }
        });
        $A.enqueueAction(action2);
    },
    rule3 :  function(component, event, helper) {
        debugger
        var recordId =  component.get("v.recordId");
        var productListIPPhonePower = component.get("v.productListIPPhonePower");
        debugger
        /*  var action2 = component.get("c.rule3");
        action2.setParams({
            recordId : recordId,
            wraperlist : productListIPPhonePower
        });
        action2.setCallback(this,function(response){
            debugger
            var state = response.getState();
            if(state == "SUCCESS"){
                var res = response.getReturnValue();
                if(res == "false"){
                    component.set("v.isChecked",false);
                    component.set("v.isPage11",false);
                    component.set("v.isPage12",true);
                    component.set("v.progress12",true);
                    component.set("v.step",'step-12');
                    debugger
                }else{
                    component.set("v.error",res);
                    component.set("v.isChecked",true);
                }
            }
        });
        $A.enqueueAction(action2);*/
        var productList = component.get("v.productList");
        var productListAddOn = component.get("v.productListAddOn");
        var productListTelecomm = component.get("v.productListTelecomm");
        var productListIpPhones = component.get("v.productListIpPhones");
        var list = [];
        var list2 = [];
        var list3 = [];
        var list4 = [];
        var list5 = [];
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
        component.set("v.productList2",list);
        component.set("v.productListAddOn2",list2);
        component.set("v.productListTelecomm2",list3);
        component.set("v.productListIpPhones2",list4);
        component.set("v.productListIPPhonePower2",list5);
        
    }
})