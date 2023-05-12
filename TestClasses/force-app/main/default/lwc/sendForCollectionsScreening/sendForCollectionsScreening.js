/* eslint-disable no-alert */
import { LightningElement,api, track, wire } from 'lwc';
import { getRecord,getFieldValue } from 'lightning/uiRecordApi';
import ACCOUNTTXID_FIELD from '@salesforce/schema/Account.Tax_ID_Number__c';
import ACCOUNTID_FIELD from '@salesforce/schema/Account.Id';
 
const fields = [ACCOUNTID_FIELD,ACCOUNTTXID_FIELD];
export default class sendForCollectionsScreening extends LightningElement {
    @track disabled = false;
    @track error;
    
    @api recordId;

    @wire(getRecord, { recordId: '$recordId', fields })
    account;
    get accounttaxid() {
        return getFieldValue(this.account.data, ACCOUNTTXID_FIELD);
    }
    get acctid() {
        return getFieldValue(this.account.data, ACCOUNTID_FIELD);
    }

    
    sendForCollectionsScreening() {

        if(this.accounttaxid === ''){ 
            alert("Please ensure you have sent the Agent Profile Form and try again"); 
            } else { 
            window.open (`https://na39.salesforce.com/_ui/core/email/author/EmailAuthor?rtype=003&p3_lkid=${this.acctid}&retURL=%2F${this.acctid}&&template_id=00XE000000169JPMAY&p5=&p24=Kimberly.Sheridan@ftr.com`) 
            }
        }
    }