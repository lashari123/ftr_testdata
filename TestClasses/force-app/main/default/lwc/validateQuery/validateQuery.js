/* eslint-disable no-undef */
/* eslint-disable no-useless-concat */
/* eslint-disable no-console */
/* eslint-disable no-unused-vars */
/* eslint-disable no-alert */
import { LightningElement,api, track, wire } from 'lwc';
import { getRecord,} from 'lightning/uiRecordApi';
import dedupConfigValidation from '@salesforce/apex/DeduplicationValidationController.dedupConfigValidation';
const fields = [
    'Deduplication_Config__c.Id'];
export default class validateQuery extends LightningElement {
   
    @track error;

    @api recordId;

    @wire(getRecord, { recordId: '$recordId', fields })
    dedupconfig;

    get id() {
        return this.dedupconfig.data.fields.Id.value;
    }
    

    customernumber() {
                dedupConfigValidation({ dedupeConfigId: this.id }).then(result=>{
                    alert(result);
                    })
                .catch(error => {
                alert('Error is '+error);
                this.error=error;
                console.log("ErrorMan:--->  ",error);
                    })   

            }
    }