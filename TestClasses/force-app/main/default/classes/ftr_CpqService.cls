/**
* @description Service methods for Quote related functionalities
*/  
global with sharing class ftr_CpqService implements vlocity_cmt.VlocityOpenInterface {
    public final static String ProductCode_EIA = 'ENT_ETH_EIA_0002';
    public final static String ProductCode_UNI = 'ENT_ETH_UNI_0001';    
    public final static String ProductCode_EVPL = 'ENT_ETH_EVPL_0002';
    public final static String ProductCode_EVPL_EVC = 'ENT_ETH_EVPL_0010';
    public final static String ProductCode_NETWORK_ACCESS = 'ENT_ETH_ACCESS_0001';
    public final static String ProductCode_IP = 'ENT_ETH_IP_0002';
    public final static String AttribCode_SPEED = 'ATTR_BANDWIDTH';      
    public final static String ProductCode_AgentLIC ='UCF_CCASS_AGENT_LIC';
    public final static String ProductCode_SUPLIC = 'UCF_CCASS_SUP_LIC';
    public final static String ProductCode_VoIP_8500 = 'UCF_POLY_8500';
    public final static String ProductCode_VoIP_8800 = 'UCF_POLY_8800';
    public final static String ProductCode_SDWAN = 'ENT_ETH_SDWAN_001';
    public final static String ProductCode_PrivateNetwork = 'ENT_ETH_EVPL_0020';
    public final static String ProductCode_DIAMR = 'ENT_ETH_MR_001';
    public final static String ProductCode_SIPTrunking = 'SIP_TRUNKING_0010';
    public final static String ProductCode_SIP_NETWORK_ACCESS = 'SIP_NETWORK_ACCESS';
    
    public final static List<String> UCF_Parent_ProductCodes_Term = new List<String>{
        'UCF_POLY_8500',
        'UCF_POLY_8800',
        'UCF_TOLL_FREE_LIC',
        'UCF_TF_MIN_BLOCKS',
        'UCF_POLY_DS230HS',
        'SIP_TRUNKING_0010'
    };
    public final static List<String> UCF_Parent_ProductCodes_ServiceAccount = new List<String>{
        'UCF_8P_POE',
        'UCF_24P_POE',
        'UCF_48P_POE',
        'UCF_POLY_8500',
        'UCF_POLY_8800',
        'UCF_TOLL_FREE_LIC',
        'UCF_TF_MIN_BLOCKS',
        'UCF_CAT6',
        'UCF_CAT5',
        'UCF_POLY_DS230HS',
        'SIP_TRUNKING_0010',
        'FIREWALL_SEC_ADDON_0002',
        'FIREWALL_PENT_001',
        'FIREWALL_AWTR_001',
        'FIREWALL_SRMG_001',
        'FIREWALL_SIRD_002',
        'FIREWALL_VULA_001',
        'FIREWALL_SIAD_001',
        'FIREWALL_SIRD_001',
        'FIREWALL_VULN_001',
        'FIREWALL_SEC_WEBAPP_0001'
    };

    
    /*
     * @description entry point of remoting method 
     */
    global Boolean invokeMethod(String methodName, Map<String, Object> inputMap, Map<String, Object> outputMap, Map<String, Object> options) {
        ftr_Logger.writeInfo('Enter ftr_CpqService.' + methodName);
        try {
            if (methodName == 'updateXLIAttributes') {                
                return updateXLIAttributes(inputMap, outputMap, options);
            } else if (methodName == 'getXLIAttributes') {
                return getXLIAttributes(inputMap, outputMap, options);
            } else if (methodName == 'invokeCpqAppHandlerMethod') {
                Object obj = invokeCpqAppHandlerMethod((String) inputMap.get('methodName'), inputMap, outputMap, options);
                outputMap.put('result', obj);
            }
            return true;
        } catch (Exception ex) { 
            // System.debug(ex.getLineNumber() + ': ' + ex.getMessage());
            ftr_Logger.write(ex);
            return false;
        } finally {
            ftr_Logger.writeInfo('Exit ftr_CpqService.' + methodName);
        }
    }

    
    /*
     * @description hook method to be triggered before PricingPlan is executed 
     */
    public Boolean PricingPlan_PreInvoke(Map<String, Object> inputMap, SObject parent, List<SObject> itemList) {
        // Process speed rollup
        if (parent.getSobjectType() == Schema.Quote.SObjectType) {
            Map<String, Object> evplRollupMessage = ftr_CpqCartCtx.getMessage('calculateEvplSpeedRollup');
           // Map<String, Object> accessRollupMessage = ftr_CpqCartCtx.getMessage('calculateAccessSpeedRollup');
            Map<String, Object> syncAttrsMessage = ftr_CpqCartCtx.getMessage('syncPricingAttrsFromDSAT');

            ftr_QuoteService quoteSvs = new ftr_QuoteService();

            if (syncAttrsMessage != null) {
                quoteSvs.syncPricingAttribsFromDSAT((Id)syncAttrsMessage.get('itemId'), (List<QuoteLineItem>)itemList);
            }

            if (evplRollupMessage != null) {
                quoteSvs.calculateEvplsSpeedRollup((List<Id>)evplRollupMessage.get('itemIds'), (List<QuoteLineItem>)itemList);
            }
            
            // // Read the  CPQ message for Updating SNE based on Pricing Attributes and process to QuoteLineItem
            // Map<String, Object> attrsBasedSNEMessage = ftr_CpqCartCtx.getMessage('attritbuteBasedSNE');
            // ftr_Logger.writeInfo('ftr_CpqService.PricingPlan_PreInvoke attrsBasedSNEMessage-->' + attrsBasedSNEMessage);
            // if (attrsBasedSNEMessage != null) {
            //     quoteSvs.updateAttritbuteBasedSNE((Id)attrsBasedSNEMessage.get('itemId'), (List<QuoteLineItem>)itemList);
            //    //If the Product Updated is EVPL EVC, then also update EVPL Parent to be in sync due to Speed roll up functionality
            //     if (attrsBasedSNEMessage.get('itemProductCode')==ProductCode_EVPL_EVC){
            //     quoteSvs.updateAttritbuteBasedSNE((Id)attrsBasedSNEMessage.get('parentItemId'), (List<QuoteLineItem>)itemList);    
            //     }
            // }

            /* if (accessRollupMessage != null) {
                quoteSvs.calculateNetworkAccessesSpeedRollup((List<Id>)accessRollupMessage.get('itemIds'), (List<QuoteLineItem>)itemList);
            }*/

            // only do these on PUT... POST is taken care of in ftr_QuoteLineItemTriggerHandler.beforeInsert
            if (ftr_CpqCartCtx.peekMessage('setChildBuyingOptionAttribute') != null && ftr_CpqCartCtx.peekMessage('setChildBuyingOptionAttribute').get('cpqMethod') == 'putCartsItems.PreInvoke') {
                Map<String, Object> setChildBuyingOptionAttribute = ftr_CpqCartCtx.getMessage('setChildBuyingOptionAttribute');
                quoteSvs.setChildFieldOrAttributeFromParent(setChildBuyingOptionAttribute, (List<QuoteLineItem>) itemList, (Quote) parent);
            }
            if (ftr_CpqCartCtx.peekMessage('setChildServiceAccountField') != null && ftr_CpqCartCtx.peekMessage('setChildServiceAccountField').get('cpqMethod') == 'putCartsItems.PreInvoke') {
                Map<String, Object> setChildServiceAccountField = ftr_CpqCartCtx.getMessage('setChildServiceAccountField');
                quoteSvs.setChildFieldOrAttributeFromParent(setChildServiceAccountField, (List<QuoteLineItem>) itemList, (Quote) parent);
            }
            if (ftr_CpqCartCtx.peekMessage('setChildTermField') != null && ftr_CpqCartCtx.peekMessage('setChildTermField').get('cpqMethod') == 'putCartsItems.PreInvoke') {
                Map<String, Object> setChildTermField = ftr_CpqCartCtx.getMessage('setChildTermField');
                quoteSvs.setChildFieldOrAttributeFromParent(setChildTermField, (List<QuoteLineItem>) itemList, (Quote) parent);
            }
            if (ftr_CpqCartCtx.peekMessage('setChildTermAttribute') != null && ftr_CpqCartCtx.peekMessage('setChildTermAttribute').get('cpqMethod') == 'putCartsItems.PreInvoke') {
                Map<String, Object> setChildTermAttribute = ftr_CpqCartCtx.getMessage('setChildTermAttribute');
                quoteSvs.setChildFieldOrAttributeFromParent(setChildTermAttribute, (List<QuoteLineItem>) itemList, (Quote) parent);
            }

            System.debug('PRICINGPLAN INPUT: '+ JSON.serialize(inputMap));

        }

        // for (QuoteLineItem qli : (List<QuoteLineItem>)itemList) {
        //     qli.quantity = 1;
        // }
        return true;
    }

    /*
     * @description hook method to be triggered by CpqAppHandler's postCartsItem.PreInvoke 
     */
    public Boolean PostCartsItems_PreInvoke(Map<String, Object> inputMap, Map<String, Object> outputMap, Map<String, Object> options) {
        // add message for updating "attributesToUpdate"
        Id cartId = (Id)inputMap.get('cartId');
        System.debug('PostCartsItems_PreInvoke inputMap: '+ JSON.serialize(inputMap));
        if (cartId.getSobjectType() == Schema.Quote.SObjectType) {
            try {
                Map<String, Object> itemToAdd = (Map<String, Object>)((List<Object>)inputMap.get('items'))[0];
                Map<String, Object> attributesToUpdate = (Map<String, Object>)itemToAdd.get('attributesToUpdate');
                Map<String, object> parent;
                Id itemId = (Id) itemToAdd.get('itemId');
                Id rootItemId = itemId;
                String productCode = (String) itemToAdd.get('ProductCode');
                // get parent from items[0].parentRecord.records
                try {
                    Map<string, object> parentRecords = (Map<string, object>) itemToAdd.get('parentRecord');
                    parent = (Map<String, Object>)((List<Object>)parentRecords.get('records'))[0];
                    rootItemId = (Id) ((Map<string, object>)parent.get('Id')).get('value');
                    productCode = (String) parent.get('ProductCode');
                } catch (exception e) {
                    ftr_Logger.writeFine(itemId + ' does not have a parentRecord node');
                }

                // add msg for update attributes
                if (attributesToUpdate != null && attributesToUpdate.size() > 0) {
                    ftr_CpqCartCtx.addMessage('setXLIAttributes', new Map<String, Object> {
                        'cpqMethod' => 'postCartsItems.PreInvoke',
                        'itemId' => itemId,
                        'attributesToUpdate' => attributesToUpdate
                    });
                }
                // add msg for updating service account on child items
                if (UCF_Parent_ProductCodes_ServiceAccount.contains(productCode) || productCode == ftr_CpqService.ProductCode_EIA){
                    ftr_CpqCartCtx.addMessage('setChildServiceAccountField', new Map<String, Object> {
                        'cpqMethod' => 'postCartsItems.PreInvoke',
                        'itemId' => itemId,
                        'isAttribute' => false,
                        'fieldOrAttribute' => 'vlocity_cmt__ServiceAccountId__c',
                        'rootItemId' => rootItemId,
                        'parentItem' => parent
                    });
                }
                // add msg for updating term__c on child items
                if (UCF_Parent_ProductCodes_Term.contains(productCode)) {
                    ftr_CpqCartCtx.addMessage('setChildTermField', new Map<String, Object> {
                        'cpqMethod' => 'postCartsItems.PreInvoke',
                        'itemId' => itemId,
                        'isAttribute' => false,
                        'fieldOrAttribute' => 'Term__c',
                        'rootItemId' => rootItemId,
                        'parentItem' => parent
                    });
                }
                if ((productCode == ftr_CpqService.ProductCode_EIA || productCode == ftr_CpqService.ProductCode_NETWORK_ACCESS || productCode == ftr_CpqService.ProductCode_EVPL || productCode == ftr_CpqService.ProductCode_EVPL_EVC)) {
                    // Publish CPQ message for executing prep step to sync DSAT to the pricing attributes, such as copper tier, fiber tier, market etc
                    ftr_CpqCartCtx.addMessage('prepareDSATAttrSync', new Map<String, Object> {
                        'cpqMethod' => 'postCartsItems.PreInvoke',
                        'quoteId' => cartId,
                        'itemId' => (Id)itemId
                    });
                    System.debug('prepareDSATAttrSync');
                }
            } catch (exception e) {
                ftr_Logger.write(e.getMessage());
            }
        }
        return true;
    }

    /*
     * @description hook method to be triggered by CpqAppHandler's postCartsItem.PreInvoke 
     */
    public Boolean PostCartsItems_PostInvoke(Map<String, Object> inputMap, Map<String, Object> outputMap, Map<String, Object> options) {
        return true;
    }

    /*
     * @description hook method to be triggered by CpqAppHandler's postCartsItem.PreInvoke 
     */
    public Boolean CloneCartsItems_PreInvoke(Map<String, Object> inputMap, Map<String, Object> outputMap, Map<String, Object> options) {
     System.debug('Testing Clone for EVPL'+ JSON.serialize(inputMap));
     Map<string, object> items0 =  (Map<String, Object>)((List<Object>)inputMap.get('items')).get(0);
     Map<string, object>  parentrecords = (Map<String, Object>)items0.get('parentRecord');
     List<Object>  record = (List<Object>)parentrecords.get('records');
     Map<string, object> parentItem =(Map<string, object>)record.get(0);
     String productCode = (String)parentItem.get('ProductCode');
     Id cartId = (Id)inputMap.get('cartId');
     Id itemId = (Id)inputMap.get('id');
     Id parentItemId = (Id)((Map<string, object>)parentItem.get('Id')).get('value');
        List<QuoteLineItem> qLIs = new  List<QuoteLineItem>(); 
        // System.debug(JSON.serialize(inputMap));
        if (cartId.getSobjectType() == Schema.Quote.SObjectType) {
            if (productCode == ftr_CpqService.ProductCode_EVPL) {
                System.debug('Product code is :'+ftr_CpqService.ProductCode_EVPL);
 
          
                if(Test.isRunningTest()){
                     StaticResource sr1 = [SELECT Id, Body FROM StaticResource WHERE Name = 'ftr_TD_Q2_LineItems' LIMIT 1];
                      qLIs = (List<QuoteLineItem>)JSON.deserialize(sr1.body.toString(), List<QuoteLineItem>.class);
                }
                else{
                         qLIs = [SELECT Id, Product2.ProductCode, vlocity_cmt__LineNumber__c, vlocity_cmt__ServiceAccountId__c
                    FROM QuoteLineItem 
                    WHERE QuoteId=:cartId];
                }
            ftr_QuoteService qSvs = new ftr_QuoteService();
            // Get Access and EVPL items which need to be re-calculated the speed attribute
            Map<String, List<Id>> rollupIdsMap = qSvs.getSpeedRollupQLIsOnDeletePrevInvoke(itemId, parentItemId, qLIs);
            List<Id> evplIds = rollupIdsMap.get('EvplIds');
            List<Id> accessIds = rollupIdsMap.get('AccessIds');

            if (evplIds.size() > 0) {
                // Publish CPQ message for executing speed rollup for EVPLs
                ftr_CpqCartCtx.addMessage('calculateEvplSpeedRollup', new Map<String, Object> {
                    'cpqMethod' => 'deleteCartsItems.PreInvoke',
                    'quoteId' => cartId,
                    'itemIds' => evplIds
                });
            }
            }
        }
        return true;
    }

    /*
     * @description hook method to be triggered by CpqAppHandler's getCartsItem.PreInvoke 
     */
    public Boolean GetCartsItems_PreInvoke(Map<String, Object> inputMap, Map<String, Object> outputMap, Map<String, Object> options) {
        return true;
    }

    /*
     * @description hook method to be triggered by CpqAppHandler's putCartsItem.PreInvoke 
     */
    public Boolean PutCartsItems_PreInvoke(Map<String, Object> inputMap, Map<String, Object> outputMap, Map<String, Object> options) {
        Id cartId = (Id)inputMap.get('cartId');
        // Set the flag to delay the DML to update the quote for performance
        QuoteLineItemService.delayQuoteUpdate = true;

        System.debug('puttcart inputMap---'+json.serialize(inputMap));
        if (cartId.getSobjectType() == Schema.Quote.SObjectType) {
            // Get JSON node for the xLI to be updated
            Map<String, Object> itemToUpdate = (Map<String, Object>)((List<Object>)((Map<String, Object>)inputMap.get('items')).get('records'))[0];
            System.debug('putcart itemToUpdate---'+json.serialize(itemToUpdate));
            Id parentItemId, parentServiceAccountId;
            if (itemToUpdate.get('lineItems') != null) {
                parentItemId = (Id)((Map<String, Object>)itemToUpdate.get('Id')).get('value');
                parentServiceAccountId = (Id)((Map<String, Object>)itemToUpdate.get('vlocity_cmt__ServiceAccountId__c')).get('value');
                // The item to be updated is underneath another item of a bundle 
                itemToUpdate = (Map<String, Object>)((List<Object>)((Map<String, Object>)itemToUpdate.get('lineItems')).get('records'))[0];
            }
            String productCode = (String)itemToUpdate.get('ProductCode');
            ftr_Logger.writeVar('productCode: ', +productCode);

            if (productCode == ftr_CpqService.ProductCode_EIA || productCode == ftr_CpqService.ProductCode_NETWORK_ACCESS || productCode == ftr_CpqService.ProductCode_EVPL || productCode == ftr_CpqService.ProductCode_EVPL_EVC) {
                // Publish CPQ message for executing prep step to sync DSAT to the pricing attributes, such as copper tier, fiber tier, market etc
                ftr_CpqCartCtx.addMessage('prepareDSATAttrSync', new Map<String, Object> {
                    'cpqMethod' => 'putCartsItems.PreInvoke',
                    'quoteId' => cartId,
                    'itemId' => (Id)((Map<String, Object>)itemToUpdate.get('Id')).get('value'),
                    'itemProductCode' => productCode,
                    'parentItemId' => parentItemId,
                    'parentServiceAccountId' => parentServiceAccountId,
                    'rootItemId' => (Id)((Map<String, Object>)itemToUpdate.get('vlocity_cmt__RootItemId__c')).get('value')
                });
             
               
            }
            
            if (productCode == ftr_CpqService.ProductCode_EIA || productCode == ftr_CpqService.ProductCode_EVPL || productCode == ftr_CpqService.ProductCode_EVPL_EVC) {
                // Publish CPQ message for executing prep step to rollup speed for the updated QLI, the prep message is processed in ftr_QuoteLineItemTrigger
                ftr_CpqCartCtx.addMessage('prepareSpeedRollup', new Map<String, Object> {
                    'cpqMethod' => 'putCartsItems.PreInvoke',
                    'quoteId' => cartId,
                    'itemId' => (Id)((Map<String, Object>)itemToUpdate.get('Id')).get('value'),
                    'itemProductCode' => productCode,
                    'parentItemId' => parentItemId,
                    'parentServiceAccountId' => parentServiceAccountId,
                    'rootItemId' => (Id)((Map<String, Object>)itemToUpdate.get('vlocity_cmt__RootItemId__c')).get('value')
                });
            }
            //  // Publish CPQ message for Updating SNE based on Pricing Attributes            
            // if (productCode == ftr_CpqService.ProductCode_EIA || productCode == ftr_CpqService.ProductCode_EVPL_EVC || productCode == ftr_CpqService.ProductCode_IP || productCode == ftr_CpqService.ProductCode_SDWAN || productCode == ftr_CpqService.ProductCode_PrivateNetwork) {
            //     ftr_Logger.writeVar('Adding Message for attritbuteBasedSNE for -->: ', +productCode);                
            //     ftr_CpqCartCtx.addMessage('attritbuteBasedSNE', new Map<String, Object> {
            //         'cpqMethod' => 'putCartsItems.PreInvoke',
            //         'quoteId' => cartId,
            //         'itemId' => (Id)((Map<String, Object>)itemToUpdate.get('Id')).get('value'),
            //         'itemProductCode' => productCode,
            //         'parentItemId' => parentItemId,
            //         'parentServiceAccountId' => parentServiceAccountId,
            //         'rootItemId' => (Id)((Map<String, Object>)itemToUpdate.get('vlocity_cmt__RootItemId__c')).get('value')
            //     });
            // }

            if (productCode == ftr_CpqService.ProductCode_EIA ||productCode == ftr_CpqService.ProductCode_DIAMR|| productCode == ftr_CpqService.ProductCode_IP || UCF_Parent_ProductCodes_ServiceAccount.contains(productCode)) {
            // set service account
                ftr_CpqCartCtx.addMessage('setChildServiceAccountField', new Map<String, Object> {
                    'cpqMethod' => 'putCartsItems.PreInvoke',
                    'itemId' => (Id)((Map<String, Object>)itemToUpdate.get('Id')).get('value'),
                    'isAttribute' => false,
                    'fieldOrAttribute' => 'vlocity_cmt__ServiceAccountId__c',
                    'rootItemId' => (Id)((Map<String, Object>)itemToUpdate.get('vlocity_cmt__RootItemId__c')).get('value')
                });
            }
            // update Term for Child products
            if (UCF_Parent_ProductCodes_Term.contains(productCode)) {
                ftr_CpqCartCtx.addMessage('setChildTermField', new Map<String, Object> {
                    'cpqMethod' => 'putCartsItems.PreInvoke',
                    'itemId' => (Id)((Map<String, Object>)itemToUpdate.get('Id')).get('value'),
                    'isAttribute' => false,
                    'fieldOrAttribute' => 'Term__c',
                    'rootItemId' => (Id)((Map<String, Object>)itemToUpdate.get('vlocity_cmt__RootItemId__c')).get('value')
                });
            }
            // update Buying Option for VoIP child products
            if (productCode == ftr_CpqService.ProductCode_VoIP_8500 || productCode == ftr_CpqService.ProductCode_VoIP_8800) {
                ftr_CpqCartCtx.addMessage('setChildBuyingOptionAttribute', new Map<String, Object> {
                    'cpqMethod' => 'putCartsItems.PreInvoke',
                    'itemId' => (Id)((Map<String, Object>)itemToUpdate.get('Id')).get('value'),
                    'isAttribute' => true,
                    'fieldOrAttribute' => 'ATTR_BUYING_OPTION',
                    'rootItemId' => (Id)((Map<String, Object>)itemToUpdate.get('vlocity_cmt__RootItemId__c')).get('value')
                });
            }
        }

        return true;
    }

    /*
     * @description hook method to be triggered by CpqAppHandler's putCartsItem.PostInvoke 
     */
    public Boolean PutCartsItems_PostInvoke(Map<String, Object> inputMap, Map<String, Object> outputMap, Map<String, Object> options) {

        QuoteLineItemService.updateQuotesDelayed();

        return true;
    }
    /*
     * @description hook method to be triggered by CpqAppHandler's putCartsItem.PreInvoke 
     */
    public Boolean DeleteCartsItems_PreInvoke(Map<String, Object> inputMap, Map<String, Object> outputMap, Map<String, Object> options) {

        return DeleteCartsItems_PreInvoke(inputMap, outputMap, options, null);
    }

    /*
     * @description hook method to be triggered by CpqAppHandler's DeleteCartsItems.PostInvoke 
     */
    public Boolean DeleteCartsItems_PostInvoke(Map<String, Object> inputMap, Map<String, Object> outputMap, Map<String, Object> options) {

        return true;
    }

    @TestVisible
    private Boolean DeleteCartsItems_PreInvoke(Map<String, Object> inputMap, Map<String, Object> outputMap, Map<String, Object> options, QuoteLineItem[] qLIs) {
        Id cartId = (Id)inputMap.get('cartId');
        inputMap.put('validate', true);
        inputMap.put('price', true);

        System.debug('Perf - inputMap' + JSON.serialize(inputMap));

        if (cartId.getSobjectType() == Schema.Quote.SObjectType) {
            Id itemId = (Id)inputMap.get('id');
            Id parentItemId = null;
            if (inputMap.get('items') != null) {
                // The item to be deleted is the child of another product
                Map<String, Object> parentItem = ((Map<String, Object>)((Object[])((Map<String, Object>)((Map<String, Object>)((Object[])inputMap.get('items'))[0]).get('parentRecord')).get('records'))[0]);
                parentItemId = (Id)((Map<String, Object>)parentItem.get('Id')).get('value');
            }
            if (qLIs == null)
                qLIs = [SELECT Id, Product2.ProductCode, vlocity_cmt__LineNumber__c, vlocity_cmt__ServiceAccountId__c
                    FROM QuoteLineItem 
                    WHERE QuoteId=:cartId];

            ftr_QuoteService qSvs = new ftr_QuoteService();
            // Get Access and EVPL items which need to be re-calculated the speed attribute
            Map<String, List<Id>> rollupIdsMap = qSvs.getSpeedRollupQLIsOnDeletePrevInvoke(itemId, parentItemId, qLIs);
            List<Id> evplIds = rollupIdsMap.get('EvplIds');
            List<Id> accessIds = rollupIdsMap.get('AccessIds');

            if (evplIds.size() > 0) {
                // Publish CPQ message for executing speed rollup for EVPLs
                ftr_CpqCartCtx.addMessage('calculateEvplSpeedRollup', new Map<String, Object> {
                    'cpqMethod' => 'deleteCartsItems.PreInvoke',
                    'quoteId' => cartId,
                    'itemIds' => evplIds
                });
            }
          /*  if (accessIds.size() > 0) {
                // Publish CPQ message for executing speed rollup for Network Accesses
                ftr_CpqCartCtx.addMessage('calculateAccessSpeedRollup', new Map<String, Object> {
                    'cpqMethod' => 'deleteCartsItems.PreInvoke',
                    'quoteId' => cartId,
                    'itemIds' => accessIds
                });
            } */
        }

        return true;
    }

    /*
     * @description update xLI's attributes in batch
     * @param inputMap: { "items": [...] } 
     */
    public Boolean updateXLIAttributes(Map<String, Object> inputMap, Map<String, Object> outputMap, Map<String, Object> options) {
        try {
            // TODO...
            // Please update the block for #361
            Map<Id, List<vlocity_cmt.JSONAttributeSupport.JSONAttributeActionRequest>> itemAttribs = new Map<Id, List<vlocity_cmt.JSONAttributeSupport.JSONAttributeActionRequest>>();
            List<Object> items = (List<Object>)inputMap.get('items');
            for (Object item : items) {
                Id itemId = (Id)((Map<String, Object>)item).get('Id');
                List<Object> attributes = (List<Object>)(((Map<String, Object>)item).get('Attributes'));
                if (attributes != null) {                
                    List<vlocity_cmt.JSONAttributeSupport.JSONAttributeActionRequest> actionRequestsList = new List<vlocity_cmt.JSONAttributeSupport.JSONAttributeActionRequest>();
                    for (Object attrObj : attributes) {
                        Map<String, Object> attr = (Map<String, Object>)attrObj;
                        String attrCode = (String)attr.get('AttributeCode');
                        Object attrVal = attr.get('Value');
                        if (attrVal != null) {
                            actionRequestsList.add(new vlocity_cmt.JSONAttributeSupport.JSONAttributeActionRequest(
                                attrCode, 
                                vlocity_cmt.JSONAttributeSupport.ActionType.ASSIGN, 
                                attrVal)
                            );
                        }
                    }
                    
                    itemAttribs.put(itemId, actionRequestsList);
                }
            }
            
            //String xLIObjectType = 'OrderItem'; // 
            String xLIObjectType = String.valueOf(options.get('options'));  
            if (Test.isRunningTest()) xLIObjectType = 'QuoteLineItem'; // TODO...

            Set<Id> xLIIds = itemAttribs.keySet();

            vlocity_cmt.JSONAttributeSupport jsonSupport = new vlocity_cmt.JSONAttributeSupport();
            String query = 'SELECT Id, vlocity_cmt__JSONAttribute__c, PricebookEntry.Product2.vlocity_cmt__JSONAttribute__c FROM ' + xLIObjectType + ' WHERE Id=:xLIIds';
            SObject[] xLIs = Database.query(query);
            for (SObject xLI : xLIs) {
                if (itemAttribs.containsKey(xLI.Id)) {
                    Map<String, Object> myInputMap = new Map<String, Object> {
                        'objectSO' => null,
                        'runTimeAttributesJSON' => (String)xLI.get('vlocity_cmt__JSONAttribute__c'),
                        'originalAttributesJSON' => '{}',
                        'JSONAttributeActionRequestList' => itemAttribs.get(xLI.Id)
                    };
                    Map<String, Object> myOutputMap = new Map<String, Object>();
                    Map<String, Object> myOptionsMap = new Map<String, Object>();
                    
                    jsonSupport.invokeMethod('applyAttributeActions', myInputMap, myOutputMap, myOptionsMap);
                    String modifiedJSON = (String)myOutputMap.get('modifiedJSON');
                    
                    
                    xLI.put('vlocity_cmt__JSONAttribute__c', modifiedJSON);
                    // OrderItem oLI = (OrderItem)xLI;
                    // oLI.vlocity_cmt__JSONAttribute__c = modifiedJSON;
                }
            }
             
            update xLIs;
            //System.debug(xLIs[0].Id);
                        
            
            outputMap.put('success', true);
            return true;
        } catch (Exception ex) {
            ftr_Logger.write(ex);
            
            outputMap.put('success', false);
            outputMap.put('errorMessage', ex.getMessage());
            return false;            
        } 
    }

    /*
     * @description return the Attributes in name & value pair for the given xLI
     * @param inputMap: { "itemId": "", "codes": "" }
     * @param outputMap: { "success": true/false, "attributes": [... ] } 
     */
    public Boolean getXLIAttributes(Map<String, Object> inputMap, Map<String, Object> outputMap, Map<String, Object> options) {
        try {
            Id itemId = (Id)inputMap.get('itemId');
            String qry = 'SELECT Id, vlocity_cmt__JSONAttribute__c FROM ' + itemId.getSobjectType().getDescribe().getName() + ' WHERE Id=:itemId';
            SObject xLI = Database.query(qry);
            String jsonAttrib = (String)xLI.get('vlocity_cmt__JSONAttribute__c');

            Map<String, Object> attrVals = ftr_CpqHelper.getJSONAttributeValues(jsonAttrib);

            if (inputMap.get('codes') != null) {
                String[] attrCodes = ((String)inputMap.get('codes')).split(',');
                for (String code : attrVals.keySet()) {
                    if (!attrCodes.contains(code)) {
                        attrVals.remove(code);
                    }
                }
            }
            outputMap.put('attributes', attrVals);       
            outputMap.put('success', true);
            return true;
        } catch (Exception ex) {
            ftr_Logger.write(ex);
            
            outputMap.put('success', false);
            outputMap.put('errorMessage', ex.getMessage());
            return false;            
        } 
    }    

      /*
     * @description Helper method to invoke method on CpqAppHandler to workaround the issue that the CpqAppHandlerHoook is NOT fired if CpqAppHandler is called in the Apex code
     */
    public static Object invokeCpqAppHandlerMethod(String methodName, Map<String, Object> input, Map<String, Object> output, Map<String, Object> options) {
        Map<String, Object> myInput = input.clone();
        myInput.put('classMethodName', methodName);
        System.debug('invokeCpqAppHandlerMethod - input: '+ JSON.serialize(myInput));
        vlocity_cmt.VOIInvoker invoker = vlocity_cmt.VOIInvoker.getInstance();
        Object invokeResult = true;
        if (!Test.isRunningTest()) {
            invokeResult = invoker.invoke('CpqAppHandler', 'invokeClass', myInput, output, options);
            System.debug(String.format('invokeCpqAppHandlerMethod.{0} - result: {1}', new Object[] { methodName, invokeResult }));
        }
        return invokeResult;
    }

}