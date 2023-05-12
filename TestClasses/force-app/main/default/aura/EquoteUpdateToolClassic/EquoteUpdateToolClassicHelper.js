({
    completed :  function(component, event, helper) {
        debugger
        //  component.set("v.isShow",true);
        var selVal4 = component.get("v.poe");
        var productList2 = component.get("v.productList2");
        var productListAddOn2 = component.get("v.productListAddOn2");
        var productListTelecomm2 = component.get("v.productListTelecomm2");
        var productListIpPhones2 = component.get("v.productListIpPhones2");
        var productListIPPhonePower2 = component.get("v.productListIPPhonePower2");
        var swithesAndPOElist2 = component.get("v.swithesAndPOElist2");
        var recordId = component.get("v.recordId");
        // var numberOfSites = component.get("v.page");
        var addProductList2 = component.get("v.addProductList2");
        
        
        var action11 = component.get("c.deleteCustomProd");
        action11.setParams({
            prod : addProductList2,
            recordId : component.get("v.recordId"),
            siteNumber : component.get("v.siteNumber")
        });
        action11.setCallback(this,function(response){
            var state = response.getState();
            if(state == "SUCCESS"){
                var action9 = component.get("c.saveCustomProduct");
                action9.setParams({
                    prod : addProductList2,
                    recordId : component.get("v.recordId"),
                    numberOfSites : component.get("v.siteNumber")
                });
                action9.setCallback(this,function(response){
                    var state = response.getState();
                    if(state == "SUCCESS"){
                        
                    }
                });
                $A.enqueueAction(action9);
            }
        });
        $A.enqueueAction(action11);
        
        
        
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
        var ucaasList = [];
        var items = [];
        for(var i = 0; i < productList2.length ; i++){
            ucaasList.push(productList2[i]);
            var item = {
                "Name": productList2[i].product.Name,
                "Quantity__c" : productList2[i].product.Quantity__c,
                "Amount__c": productList2[i].pricebookEntry.UnitPrice
            };
            items.push(item);
            
        }
        component.set("v.allProductList",items);
        component.set("v.allUcaasProductList",ucaasList);
        for(var i = 0; i < productListAddOn2.length ; i++){
            ucaasList.push(productListAddOn2[i]);
            var item = {
                "Name": productListAddOn2[i].product.Name,
                "Quantity__c" : productListAddOn2[i].product.Quantity__c,
                "Amount__c": productListAddOn2[i].pricebookEntry.UnitPrice
            };
            items.push(item);
        }
        component.set("v.allProductList",items);
        component.set("v.allUcaasProductList",ucaasList);
        for(var i = 0; i < productListTelecomm2.length ; i++){
            ucaasList.push(productListTelecomm2[i]);
            var item = {
                "Name": productListTelecomm2[i].product.Name,
                "Quantity__c" : productListTelecomm2[i].product.Quantity__c,
                "Amount__c": productListTelecomm2[i].pricebookEntry.UnitPrice
            };
            items.push(item);
        }
        component.set("v.allProductList",items);
        component.set("v.allUcaasProductList",ucaasList);
        for(var i = 0; i < productListIpPhones2.length ; i++){
            ucaasList.push(productListIpPhones2[i]);
            var item = {
                "Name": productListIpPhones2[i].product.Name,
                "Quantity__c" : productListIpPhones2[i].product.Quantity__c,
                "Amount__c": productListIpPhones2[i].pricebookEntry.UnitPrice
            };
            items.push(item);
        }
        component.set("v.allProductList",items);
        component.set("v.allUcaasProductList",ucaasList);
        for(var i = 0; i < productListIPPhonePower2.length ; i++){
            ucaasList.push(productListIPPhonePower2[i]);
            var item = {
                "Name": productListIPPhonePower2[i].product.Name,
                "Quantity__c" : productListIPPhonePower2[i].product.Quantity__c,
                "Amount__c": productListIPPhonePower2[i].pricebookEntry.UnitPrice
            };
            items.push(item);
        }
        component.set("v.allProductList",items);
        component.set("v.allUcaasProductList",ucaasList);
        for(var i = 0; i < swithesAndPOElist2.length ; i++){
            ucaasList.push(swithesAndPOElist2[i]);
            var item = {
                "Name": swithesAndPOElist2[i].product.Name,
                "Quantity__c" : swithesAndPOElist2[i].product.Quantity__c,
                "Amount__c": swithesAndPOElist2[i].pricebookEntry.UnitPrice
            };
            items.push(item);
        }
        component.set("v.allProductList",items);
        component.set("v.allUcaasProductList",ucaasList);
        var allUcaasProductList = component.get("v.allUcaasProductList");
        var action10 = component.get("c.deleteProd");
        action10.setParams({
            allProductList : allUcaasProductList,
            recordId : component.get("v.recordId"),
            siteNumber : component.get("v.siteNumber")
        });
        action10.setCallback(this,function(response){
            var state = response.getState();
            if(state == "SUCCESS"){
                
            }
        });
        $A.enqueueAction(action10);
        
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
            var selVal4 = component.get("v.poe");
            var recordId = component.get("v.recordId");
            var selVal4 = component.get("v.poe");
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
                numberOfSites : component.get("v.siteNumber"),
                siteId : siteId
            });
            action11.setCallback(this,function(response){
                var state = response.getState();
                if(state == "SUCCESS"){
                    component.set("v.isPreviewPage",false);
                    component.set("v.isCongratsPage",true);
                    component.set("v.progress10",true);
                    component.set("v.step",'step-10');
                    
                }
            });
            $A.enqueueAction(action11);  
            
        });
        $A.enqueueAction(action21);
        
        
        
        // var recordId = component.get("v.recordId");
        /* var action2 = component.get("c.getProduct");
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
                component.set("v.page",page + 1);
                component.set("v.isSite",false);
                component.set("v.city",'');
                component.set("v.primary",'');
                component.set("v.country",'');
                component.set("v.street",'');
                component.set("v.postalCode",'');
                component.set("v.province",'');
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
                component.set("v.swithesAndPOElist2",list);*/
        
        
        
    },
    
})