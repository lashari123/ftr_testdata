/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 07-28-2021
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 * Modifications Log 
 * Ver   Date         Author                               Modification
 * 1.0   07-28-2021   ChangeMeIn@UserSettingsUnder.SFDoc   Initial Version
**/
public class ftr_QuoteLineItemTriggerHandler extends ftr_TriggerHandler {

    public static Boolean isFirstBeforeUpdate = true;
    public static Boolean isFirstBeforeInsert = true;

    public override void beforeInsert() {
        ftr_Logger.writeInfo('ftr_QuoteLineItemTriggerHandler.beforeInsert');
        System.debug('Trigger.new: '+ JSON.serialize(Trigger.new));
        ftr_QuoteService quoteSvs = new ftr_QuoteService();
        QuoteLineItem[] qLIs = new List<QuoteLineItem>();
        for (QuoteLineItem qLI : (List<QuoteLineItem>)Trigger.new) { // UCF Products have seperate Terms... exclude from this logic
            if (qLI.vlocity_cmt__JSONAttribute__c != null) {
                // The QLI is added by vlocity CPQ API
                qLIs.add(qLI);
            }
        }
        if (qLIs.size() > 0) {
            Quote parentQuote = [SELECT Id, Service_Term__c FROM Quote WHERE Id=:qLIs[0].QuoteId];
            quoteSvs.setTermForQLIs(parentQuote.Service_Term__c, qLIs);
        }

        // check messages
        if (ftr_CpqCartCtx.peekMessage('setChildServiceAccountField') != null) {
            Map<String, Object> message = ftr_CpqCartCtx.getMessage('setChildServiceAccountField');
            quoteSvs.setChildFieldOrAttributeFromParent(message, (List<QuoteLineItem>) Trigger.new, null);
        }
        if (ftr_CpqCartCtx.peekMessage('setChildTermField') != null) {
            Map<String, Object> message = ftr_CpqCartCtx.getMessage('setChildTermField');
            quoteSvs.setChildFieldOrAttributeFromParent(message, (List<QuoteLineItem>) Trigger.new, null);
        }
        if (ftr_CpqCartCtx.peekMessage('setChildTermAttribute') != null) {	
            Map<String, Object> message = ftr_CpqCartCtx.getMessage('setChildTermAttribute');	
            quoteSvs.setChildFieldOrAttributeFromParent(message, (List<QuoteLineItem>) Trigger.new, null);	
        }
        if (ftr_CpqCartCtx.peekMessage('setXLIAttributes') != null) {
            Map<String, Object> message = ftr_CpqCartCtx.getMessage('setXLIAttributes');
            quoteSvs.setXLIAttributes(message, (List<QuoteLineItem>) Trigger.new);
        }
        if (ftr_CpqCartCtx.peekMessage('prepareDSATAttrSync') != null) {
            System.debug('preparingDSATAttrSync');
            Map<String, Object> cpqMessage = ftr_CpqCartCtx.getMessage('prepareDSATAttrSync');
            QuoteLineItem newQLI = (QuoteLineItem)Trigger.new[0];
                //Changes for Fiber Tier/Copper Tier Missing -Start
                Account serviceAccount = [SELECT vlocity_cmt__PremisesId__c, vlocity_cmt__PremisesId__r.InFootPrint__c, vlocity_cmt__PremisesId__r.WC_CLLI__c, vlocity_cmt__PremisesId__r.Lit__c,  vlocity_cmt__PremisesId__r.DSAT_Ticket__c, vlocity_cmt__PremisesId__r.WC_Speed__c, vlocity_cmt__PremisesId__r.WC_QOS__c, vlocity_cmt__PremisesId__r.Copper_Tier__c, vlocity_cmt__PremisesId__r.Fiber_Tier__c, vlocity_cmt__PremisesId__r.Market__c, vlocity_cmt__PremisesId__r.Level__c 
                FROM Account
                WHERE Id = :newQLI.vlocity_cmt__ServiceAccountId__c];

            String modifiedJSON = '';

            if (serviceAccount != null && serviceAccount.vlocity_cmt__PremisesId__c != null) {
                vlocity_cmt__Premises__c premise = serviceAccount.vlocity_cmt__PremisesId__r;
                Map<String, Object> attrVals = new Map<String, Object> {
                    'ATTR_ELIGBL_WCSPEED' => premise.WC_Speed__c == null ? '' : premise.WC_Speed__c,
                    'ATTR_ELIGBL_QOS' => premise.WC_QOS__c == null ? '' : premise.WC_QOS__c,
                    'ATTR_TIER1' => premise.Copper_Tier__c == null ? '' : premise.Copper_Tier__c,
                    'ATTR_TIER2' => premise.Fiber_Tier__c == null ? '' : premise.Fiber_Tier__c,
                    'ATTR_MARKET' => premise.Market__c == null ? '' : premise.Market__c,
                    'ATTR_LEVEL' => premise.Level__c == null ? '' : premise.Level__c,
                        'ATTR_DSAT_ID' => premise.DSAT_Ticket__c == null ? '' : premise.DSAT_Ticket__c,
                            'ATTR_ELIGBL_LIT' => premise.Lit__c == null ? '' : premise.Lit__c,
                                'ATTR_ELIGBL_CLLI' => premise.WC_CLLI__c == null ? '' : premise.WC_CLLI__c,
                                    'ATTR_ELIGBL_FOOT_PRNT' => premise.InFootPrint__c == true ? 'Yes' : 'No'
                };
                modifiedJSON = ftr_CpqHelper.setJSONAttributes(newQLI.vlocity_cmt__JSONAttribute__c, '{}', attrVals);
                newQLI.vlocity_cmt__JSONAttribute__c=modifiedJSON;
                //Hemantha - adding premise reference Id
                //newQLI.vlocity_cmt__PremisesId__c = premise.Id;
            }
        }
        if (isFirstBeforeInsert) {
            isFirstBeforeInsert = false;
            QuoteLineItemService.updateDsatStandardInterval(Trigger.New);
        }

    }

    public override void afterInsert() {
        ftr_Logger.writeInfo('ftr_QuoteLineItemTriggerHandler.afterInsert');
        ftr_Logger.writeVar('Trigger.new', Trigger.new);
        
        if ((Boolean)Trigger.new[0].get('IsSyncing__c')) {
            QuoteSyncService.addInsertedQLIsForSync(Trigger.new);
            QuoteSyncService.sync(false);
        }
    }

    public override void beforeUpdate() {
        ftr_Logger.writeInfo('ftr_QuoteLineItemTriggerHandler.beforeUpdate');
        ftr_Logger.writeVar('Trigger.new', Trigger.new);

        if ((Boolean)Trigger.new[0].get('ftr_isApplyDiscount__c') && (Trigger.new[0].get('Quantity') != Trigger.old[0].get('Quantity'))) {
            Trigger.new[0].addError('This item is part of a Bundle. You cannot change the Quantity.');
        }

        System.debug('Enter into ftr_QuoteLineItemTriggerHandler.beforeUpdate ' +  ftr_CpqAppHandlerHookImpl.debugLimits());

        ftr_CpqService service = new ftr_CpqService();
        ftr_QuoteService quoteSvs = new ftr_QuoteService();
        
        // Process prepareDSATAttrSync message published by ftr_CpqService.putCartsItems.PreInvoke method
        if (ftr_CpqCartCtx.peekMessage('prepareDSATAttrSync') != null) {
            Map<String, Object> cpqMessage = ftr_CpqCartCtx.getMessage('prepareDSATAttrSync');
            Id itemId = (Id)cpqMessage.get('itemId');

            if (Trigger.newMap.keySet().contains(itemId)) {
                QuoteLineItem oldQLI = (QuoteLineItem)Trigger.oldMap.get(itemId);
                QuoteLineItem newQLI = (QuoteLineItem)Trigger.newMap.get(itemId);
                    //Changes for Fiber Tier/Copper Tier Missing -Start
                    Account serviceAccount = [SELECT vlocity_cmt__PremisesId__c, vlocity_cmt__PremisesId__r.InFootPrint__c, vlocity_cmt__PremisesId__r.WC_CLLI__c, vlocity_cmt__PremisesId__r.Lit__c,  vlocity_cmt__PremisesId__r.DSAT_Ticket__c, vlocity_cmt__PremisesId__r.WC_Speed__c, vlocity_cmt__PremisesId__r.WC_QOS__c, vlocity_cmt__PremisesId__r.Copper_Tier__c, vlocity_cmt__PremisesId__r.Fiber_Tier__c, vlocity_cmt__PremisesId__r.Market__c, vlocity_cmt__PremisesId__r.Level__c 
                    FROM Account
                    WHERE Id = :newQLI.vlocity_cmt__ServiceAccountId__c];

                String modifiedJSON = '';

                if (serviceAccount != null && serviceAccount.vlocity_cmt__PremisesId__c != null) {
                        vlocity_cmt__Premises__c premise = serviceAccount.vlocity_cmt__PremisesId__r;
                        Map<String, Object> attrVals = new Map<String, Object> {
                            'ATTR_ELIGBL_WCSPEED' => premise.WC_Speed__c == null ? '' : premise.WC_Speed__c,
                            'ATTR_ELIGBL_QOS' => premise.WC_QOS__c == null ? '' : premise.WC_QOS__c,
                            'ATTR_TIER1' => premise.Copper_Tier__c == null ? '' : premise.Copper_Tier__c,
                            'ATTR_TIER2' => premise.Fiber_Tier__c == null ? '' : premise.Fiber_Tier__c,
                            'ATTR_MARKET' => premise.Market__c == null ? '' : premise.Market__c,
                            'ATTR_LEVEL' => premise.Level__c == null ? '' : premise.Level__c,
                                'ATTR_DSAT_ID' => premise.DSAT_Ticket__c == null ? '' : premise.DSAT_Ticket__c,
                                    'ATTR_ELIGBL_LIT' => premise.Lit__c == null ? '' : premise.Lit__c,
                                        'ATTR_ELIGBL_CLLI' => premise.WC_CLLI__c == null ? '' : premise.WC_CLLI__c,
                                        'ATTR_ELIGBL_FOOT_PRNT' => premise.InFootPrint__c == true ? 'Yes' : 'No'
                        };
                        modifiedJSON = ftr_CpqHelper.setJSONAttributes(newQLI.vlocity_cmt__JSONAttribute__c, '{}', attrVals);
                        newQLI.vlocity_cmt__JSONAttribute__c=modifiedJSON;
                      	//Hemantha - adding premise reference Id
                		//newQLI.vlocity_cmt__PremisesId__c = premise.Id;
                        }
                        //Changes for Fiber Tier/Copper Tier Missing -Start

               // }
            }
        }

        // Process prepareSpeedRollup message published by ftr_CpqService.putCartsItems.PreInvoke method
        if (ftr_CpqCartCtx.peekMessage('prepareSpeedRollup') != null) {
            Map<String, Object> cpqMessage = ftr_CpqCartCtx.getMessage('prepareSpeedRollup');

            Id itemId = (Id)cpqMessage.get('itemId');

            if (Trigger.newMap.keySet().contains(itemId)) {
                QuoteLineItem oldQLI = (QuoteLineItem)Trigger.oldMap.get(itemId);
                QuoteLineItem newQLI = (QuoteLineItem)Trigger.newMap.get(itemId);
                Id parentItemId = (Id)cpqMessage.get('parentItemId');
                Id parentServiceAccountId = (Id)cpqMessage.get('parentServiceAccountId');
                Id quoteId = (Id)cpqMessage.get('quoteId'); 
                String productCode = (String)cpqMessage.get('itemProductCode');
    
                Map<String, List<Id>> rollupIdsMap = quoteSvs.getSpeedRollupQLIsOnQLIBeforeUpdate(oldQLI, newQLI, parentItemId, parentServiceAccountId, productCode);
                List<Id> evplIds = rollupIdsMap.get('EvplIds');
                //List<Id> accessIds = rollupIdsMap.get('AccessIds');
    
                if (evplIds.size() > 0 || Test.isRunningTest()) {
                    // Publish CPQ message for executing speed rollup for EVPLs
                    ftr_CpqCartCtx.addMessage('calculateEvplSpeedRollup', new Map<String, Object> {
                        'cpqMethod' => 'putCartsItems.PreInvoke',
                        'quoteId' => quoteId,
                        'itemIds' => evplIds
                    });
                }
                /*if (accessIds.size() > 0 || Test.isRunningTest()) {
                    // Publish CPQ message for executing speed rollup for Network Accesses
                    ftr_CpqCartCtx.addMessage('calculateAccessSpeedRollup', new Map<String, Object> {
                        'cpqMethod' => 'putCartsItems.PreInvoke',
                        'quoteId' => quoteId,
                        'itemIds' => accessIds
                    });
                }*/
            }
        }
        QuoteLineItemService.UpdateQuote((List<QuoteLineItem>) Trigger.new);

        System.debug('Exit into ftr_QuoteLineItemTriggerHandler.beforeUpdate ' +  ftr_CpqAppHandlerHookImpl.debugLimits());
        if (isFirstBeforeUpdate) {
            isFirstBeforeUpdate = false;
            QuoteLineItemService.updateDsatStandardInterval(Trigger.New);
        }

        // effective quantity needs to be set as the quantity because the bundle is not truley a bundle.. DID Number Included
        for (QuoteLineItem qLI : (List<QuoteLineItem>) Trigger.new) {
            if (qLI.Product_Family__c == 'SIP') {
                qLI.vlocity_cmt__EffectiveQuantity__c = qLI.Quantity;
            }
        }
    }

    public override void afterUpdate() {
        ftr_Logger.writeInfo('ftr_QuoteLineItemTriggerHandler.afterUpdate');
        ftr_Logger.writeVar('Trigger.new', Trigger.new);

        if ((Boolean)Trigger.new[0].get('IsSyncing__c')) {
            QuoteLineItem[] syncQLIs = new List<QuoteLineItem>();
            for (Integer i = 0; i < Trigger.new.size(); i++) {
                QuoteLineItem oldQLI = (QuoteLineItem)Trigger.old[i];
                QuoteLineItem newQLI = (QuoteLineItem)Trigger.new[i];
                if (QuoteSyncService.checkQLIForSync(oldQLI, newQLI)) {
                    syncQLIs.add(newQLI);
                }
            }
            if (syncQLIs.size() > 0) {
                QuoteSyncService.addUpdatedQLIsForSync(syncQLIs);
            }
            QuoteSyncService.sync(false);
        }
    }

    public override void beforeDelete() {
        if ((Boolean)Trigger.old[0].get('ftr_isApplyDiscount__c')) {
            Trigger.old[0].addError('This item is part of a bundled promotion and cannot be deleted.');
        }
        if ((Boolean)Trigger.old[0].get('IsSyncing__c')) {
            QuoteSyncService.addDeletedQLIsForSync(Trigger.old);
        }
        QuoteSyncService.sync(false);
    }

    public override void afterDelete() {
        ftr_Logger.writeInfo('ftr_QuoteLineItemTriggerHandler.afterDelete');
        ftr_Logger.writeVar('Trigger.old', Trigger.old);
        // QuoteSyncService.sync(false);
    }

}