/* eslint-disable no-console */
/* eslint-disable no-alert */
import { LightningElement,api, track, wire } from 'lwc';
import { getRecord,getFieldValue } from 'lightning/uiRecordApi';
import ACCOUNT_FIELD from '@salesforce/schema/Opportunity.LBI__LatticeAccountName__c';
import OPPORTUNITYID_FIELD from '@salesforce/schema/Opportunity.Id';
import ACCOUNTID_FIELD from '@salesforce/schema/Opportunity.AccountId';
import STAGENAME_FIELD from '@salesforce/schema/Opportunity.StageName';
import NAME_FIELD from '@salesforce/schema/Opportunity.Name';
const fields = [ACCOUNT_FIELD,OPPORTUNITYID_FIELD,ACCOUNTID_FIELD,NAME_FIELD,STAGENAME_FIELD];
export default class newContract extends LightningElement {
    @track disabled = false;
    @track error;
    
    @api recordId;

    @wire(getRecord, { recordId: '$recordId', fields })
    oppportunity;
    get account() {
        return getFieldValue(this.oppportunity.data, ACCOUNT_FIELD);
    }
    get opportunityid() {
        return getFieldValue(this.oppportunity.data, OPPORTUNITYID_FIELD);
    }
    get accountid() {
        return getFieldValue(this.oppportunity.data, ACCOUNTID_FIELD);
    }
    get name() {
        return getFieldValue(this.oppportunity.data, NAME_FIELD);
    }
    get stagename() {
        return getFieldValue(this.oppportunity.data, STAGENAME_FIELD);
    }

    
    newContract() {
       
       if(this.stagename ===  'Decision'){ 
        parent.window.location =`/800/e?RecordType=0120h000000pAtT&ctrc7=${this.account}&ctrc7_lkid=${this.accountid}&CF00N40000002b6US=${this.name}&CF00N40000002b6US_lkid=${this.opportunityid}&retURL=%2F${this.opportunityid}`; 
       }else{ 
            alert('Opportunity needs to be in "Decision" in order to create a new Contract');     
            }
       }
            }