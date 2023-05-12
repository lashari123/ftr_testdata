/* eslint-disable no-alert */
import { LightningElement,api, track, wire } from 'lwc';
import { getRecord,getFieldValue } from 'lightning/uiRecordApi';
import AGREEMENT_FIELD from '@salesforce/schema/Contract.Agreement_Type__c';
import CONTRACTID_FIELD from '@salesforce/schema/Contract.Id';
import CONTRACTFOLDER_FIELD from '@salesforce/schema/Contract.Spring_Contract_Folder_Name__c';
import ACCOUNTCHANNEL_FIELD from '@salesforce/schema/Contract.Account_Channel__c';
import SPRINGFOLDER_FIELD from '@salesforce/schema/Contract.Spring_Folder_Name__c';
 
const fields = [AGREEMENT_FIELD,CONTRACTID_FIELD,CONTRACTFOLDER_FIELD,ACCOUNTCHANNEL_FIELD,SPRINGFOLDER_FIELD];
export default class previewLOA extends LightningElement {
    @track disabled = false;
    @track error;
    
    @api recordId;

    @wire(getRecord, { recordId: '$recordId', fields })
    contract;
    get agreement() {
        return getFieldValue(this.contract.data, AGREEMENT_FIELD);
    }
    get contrid() {
        return getFieldValue(this.contract.data, CONTRACTID_FIELD);
    }
    get contractfolder() {
        return getFieldValue(this.contract.data, CONTRACTFOLDER_FIELD);
    }
    get accountchannel() {
        return getFieldValue(this.contract.data, ACCOUNTCHANNEL_FIELD);
    }
    get springfolder() {
        return getFieldValue(this.contract.data, SPRINGFOLDER_FIELD);
    }
    
    previewLOA() {

            
            if(this.agreement === '' || this.agreement === null){ 
                alert("Agreement Type cannot be blank"); 
            } else {
                let agreementnew = this.agreement.replace('+', '');
                 window.open(`https://na11.springcm.com/atlas/doclauncher/eos/${agreementnew}?aid=17662&eos[0].Id=${this.contrid}&eos[0].System=Salesforce&eos[0].Type=Contract&eos[0].Name=${this.contractfolder}&eos[0].ScmPath=/Accounts/${this.accountchannel}/${this.springfolder}`); 
             }
            }
        }