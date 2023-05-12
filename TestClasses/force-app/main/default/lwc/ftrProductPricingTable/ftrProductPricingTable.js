import { track, api, LightningElement } from 'lwc';
import { log } from 'c/ftrUtils';
import tmpl from './ftrProductPricingTable.html';
import { OmniscriptBaseMixin } from 'vlocity_cmt/omniscriptBaseMixin';

const columns = [
    { label: 'Product', fieldName: 'Description', searchable: true },
    { label: 'Term', fieldName: 'Term__c', sortable: true, searchable: true },
    { label: 'Speed', fieldName: 'Speed__c', sortable: true, searchable: true },
    {
        label: 'Recurring Charge', fieldName: 'vlocity_cmt__RecurringCharge__c', type: 'currency', sortable: true, cellAttributes: {
            alignment: 'left',
        }, searchable: true
    },
    {
        label: 'One Time Charge', fieldName: 'vlocity_cmt__OneTimeCharge__c', type: 'currency', sortable: true, cellAttributes: {
            alignment: 'left',
        }, searchable: true
    }
];

const stateKey = 'ProductPricingState';
export default class FtrProductPricingTable extends OmniscriptBaseMixin(LightningElement) {
    @api productCode = 'ENT_ETH_EIA_0002';
    @api maxRowSelection = '5';
    @api keyField = 'Id';

    priceField = 'vlocity_cmt__RecurringCharge__c';

    loading = false;
    error;

    columns = columns;
    allRecords; //All records available for data table    
    showTable = false;
    canGoNext = false;
    selectedRecords;

    handleRowSelection(event) {
        const selectedItems = event.detail;
        this.selectedProducts = this.allRecords.filter((record) => selectedItems.includes(record[this.keyField]));
        // this.selectedProducts = selectedItems
        this.selectedRecords = selectedItems;
        this.canGoNext = selectedItems && selectedItems.length > 0;
    }

    render() {
        return tmpl;
    }

    connectedCallback() {
        const state = this.omniGetSaveState(stateKey);
        if (state) {
            this.allRecords = state.allRecords;
            this.showTable = state.showTable;
            this.selectedRecords = state.selectedRecords;
            this.canGoNext = state.canGoNext;
        }

        if (this.serviceAccId && this.productCode && !this.allRecords) {
            this.getPricingData();
        } else {
            console.log('service account id: ', this.serviceAccId)
            console.log('product code: ', this.productCode)
        }
    }

    disconnectedCallback() {
        let usePubSub = true;
        let productPricingState = {
            allRecords: this.allRecords,
            showTable: this.showTable,
            selectedRecords: this.selectedRecords,
            canGoNext: this.canGoNext
        }
        this.omniSaveState(productPricingState, stateKey, usePubSub);
    }

    get selectedProducts() {
        return this.omniJsonData.SelectedProducts;
    }

    set selectedProducts(products) {
        // sort by decending MRC
        products.sort((a, b) => (a[this.priceField] - b[this.priceField]))
        this.omniApplyCallResp({ SelectedProducts: products });
    }

    get serviceAccId() {
        if (this.omniJsonData.CreateServiceAccountResponse) {
            return this.omniJsonData.CreateServiceAccountResponse.ServiceAccountId
        } else {
            return null;
        }
    }

    get qualification() {
        if (this.omniJsonData.AddressQualification)
            return this.omniJsonData.AddressQualification.AddressQualificationResult;
        else
            return null;
    }

    getPricingData() {
        this.allRecords = [];
        this.error = null;
        this.loading = true;
        this.showTable = false;

        const params = {
            input: {
                productCode: this.productCode,
                serviceAccountId: this.serviceAccId
            },
            sClassName: 'PricingFormulaService',
            sMethodName: 'GetAllPricingOptions',
            options: '{}',
        };
        this.omniRemoteCall(params, true).then(response => {
            if (response.error) {
                this.error = response.error;
            } else if (response.result && response.result.Error) {
                this.error = response.result.Error;
            } else {
                let count = 1;
                let pricingData = [];;
                for (let term in response.result) {
                    if (response.result[term] instanceof Object) {
                        for (let speed in response.result[term]) {
                            response.result[term][speed].Id = count;
                            pricingData.push(response.result[term][speed]);
                            count++;
                        }
                    }
                }
                this.allRecords = pricingData;
                this.showTable = true;
            }
            this.loading = false;
            log('getPricingData response', response);
        }).catch(error => {
            this.loading = false;
            this.error = error.message ? error.message : error;
            log('getPricingData error', error);
        });
    }


}