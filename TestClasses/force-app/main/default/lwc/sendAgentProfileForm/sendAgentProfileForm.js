/* eslint-disable no-alert */
import { LightningElement,api, track, wire } from 'lwc';
import { getRecord,getFieldValue } from 'lightning/uiRecordApi';
import ACCOUNTSIGN_FIELD from '@salesforce/schema/Account.SignerID__c';
import ACCOUNTID_FIELD from '@salesforce/schema/Account.Id';
 
const fields = [ACCOUNTID_FIELD,ACCOUNTSIGN_FIELD];
export default class sendAgentProfileForm extends LightningElement {
    @track disabled = false;
    @track error;
    
    @api recordId;

    @wire(getRecord, { recordId: '$recordId', fields })
    account;
    get accountsign() {
        return getFieldValue(this.account.data, ACCOUNTSIGN_FIELD);
    }
    get acctid() {
        return getFieldValue(this.account.data, ACCOUNTID_FIELD);
    }

    
    sendAgentProfileForm() {

        if(this.accountsign === ''){ 
            alert("Please populate the Recipient field and try again"); 
            } else { 
            window.open (`https://na65.salesforce.com/_ui/core/email/author/EmailAuthor?rtype=003&p3_lkid=${this.acctid}&retURL=%2F${this.acctid}&p2_lkid=${this.accountsign}&template_id=00XE000000167NpMAI&p5=`) 
            }
        }
    }