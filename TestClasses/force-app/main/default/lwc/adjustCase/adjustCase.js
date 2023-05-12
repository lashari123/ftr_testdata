/* eslint-disable no-console */
/* eslint-disable no-unused-vars */
/* eslint-disable no-alert */
import { LightningElement,api, track, wire } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { getRecord,generateRecordInputForUpdate,getFieldValue,} from 'lightning/uiRecordApi';
import { updateRecord } from 'lightning/uiRecordApi';
import { refreshApex } from '@salesforce/apex';
import ID_FIELD from '@salesforce/schema/Case.Id';
import STATE_FIELD from '@salesforce/schema/Case.Status';
const fields = [
    'Case.Id',
    'Case.Status'];
export default class cancelOrder extends LightningElement {
   
    @track error;

    @api recordId;
    @track case11 = 'Adjusted';

    @wire(getRecord, { recordId: '$recordId', fields })
    cases;
    get id() {
        return this.cases.data.fields.Id.value;
    }
    get state() {
        return this.cases.data.fields.Status.value;
    }
    adjustCase() {

            const record = {
                fields: {
                    [ID_FIELD.fieldApiName]: this.id,
                    [STATE_FIELD.fieldApiName]: this.case11,
                }
            };     

            updateRecord(record)
                .then(() => {
                    this.dispatchEvent(
                        new ShowToastEvent({
                            title: 'Success',
                            message: 'Case Status updated to Adjusted',
                            variant: 'success',
                        }),
                    );
                    // Display fresh data in the form
                    return refreshApex(this.cases);
                })
                .catch(error => {
                    this.dispatchEvent(
                        new ShowToastEvent({
                            title: 'Error creating record',
                            message: error.body.message,
                            variant: 'error',
                        }),
                    );
                    console.log("Error:--->  ",error);
                });
            }
        
    }