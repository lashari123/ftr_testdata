public with sharing class AOExtPreOptimizeController {

    public Id accId {get;set;}
    public Account acc {get;set;}

    public ao2__Optimized_Account__c optAcc {get;set;}

    public AOExtPreOptimizeController(ApexPages.StandardController stdc) {
        this.accId = stdc.getId();
        this.accId = String.isNotBlank(this.accId) ? this.accId : ApexPages.currentPage().getParameters().get('id');
    }

    public PageReference doInit() {
        PageReference resultPage = null;
        
        Account[] accs = this.accId != null ? [select Id, Name from Account where Id = :this.accId LIMIT 1] : null;
        this.acc = accs != null && !accs.isEmpty() ? accs[0] : null;
        if (this.accId != null && this.acc != null) {
            ao2__Optimized_Account__c[] optAccs = loadOptimizedAccounts(new Set<Id> { this.accId });
            this.optAcc = !optAccs.isEmpty() ? optAccs[0] : null;

            if (this.optAcc == null) {
                this.optAcc = buildOptimizedAccount(this.acc);
            } else {
                // if optAccount already exists - page init will immediately redirect to AODBMain page
                resultPage = doContinue();
            }
        }

        return resultPage;
    }
    
    public PageReference doCreateAndContinue() {
        Boolean isSuccess = upsertOptimizedAccount(this.optAcc);
        return isSuccess ? doContinue() : null;
    }

    public PageReference doContinue() {
        return redirectTo(Page.ao2__AODBMain, accId);
    }

    /* ============================ */
    /* ============================ */
    private static ao2__Optimized_Account__c[] loadOptimizedAccounts(Set<Id> accIds) {
        ao2__Optimized_Account__c[] result = null;
        if (accIds != null && !accIds.isEmpty()) {
            result = [select Id, Name, ao2__Account__c from ao2__Optimized_Account__c where ao2__Account__c in :accIds limit 100];
        }
        return result != null ? result : new ao2__Optimized_Account__c[] {};
    }

    @TestVisible
    private static ao2__Optimized_Account__c buildOptimizedAccount(Account acc) {
        ao2__Optimized_Account__c result = null;
        if (acc != null && acc.Id != null) {
            result = new ao2__Optimized_Account__c(
                 ao2__Account__c = acc.Id
                ,Name = String.isNotBlank(acc.Name) ? acc.Name.trim() : ''
            );
            result.Name = result.Name.length() > 80 ? result.name.substring(0, 80) : result.Name;
        }
        return result;
    }

    @TestVisible
    private static Boolean upsertOptimizedAccount(ao2__Optimized_Account__c optAcc) {
        return upsertRecords(optAcc != null ? new ao2__Optimized_Account__c[] {optAcc} : null);
    }

    private static Boolean upsertRecords(SObject[] recs) {
        Boolean isSuccess = false;
        if (recs != null && !recs.isEmpty()) {
            try {
                upsert recs;
                isSuccess = true;
            } catch (Exception e) {
                System.debug(LoggingLevel.ERROR, '[upsertRecords] error upserting recs: ' + recs + ', error: ' + e.getMessage() + ', stackTrace:\n' + e.getStackTraceString());
                ApexPages.addMessages(e);
            }
        }
        return isSuccess;
    }

    @TestVisible
    private static PageReference redirectTo(PageReference page, Id recId) {
        return redirectTo(page, recId != null ? new Map<String, String> { 'id' => recId } : null);
    }

    @TestVisible
    private static PageReference redirectTo(PageReference page, Map<String, String> pageParams) {
        PageReference result = page;
        if (result != null) {
            result = page;
            result.setRedirect(true);
            if (pageParams != null) {
                result.getParameters().putAll(pageParams);
            }
        }
        return result;
    }
}