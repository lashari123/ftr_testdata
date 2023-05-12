/* eslint-disable no-console */
/* eslint-disable no-unused-vars */
/* eslint-disable no-alert */
import { LightningElement,api, track, wire } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { getRecord} from 'lightning/uiRecordApi';
import { updateRecord } from 'lightning/uiRecordApi';
import { refreshApex } from '@salesforce/apex';
import ID_FIELD from '@salesforce/schema/Agent__c.Id';
import DEACTIVE_FIELD from '@salesforce/schema/Agent__c.Deactive__c';
const fields = [
    'Agent__c.Id',
    'Agent__c.Deactive__c'];
export default class cancelOrder extends LightningElement {
   
    @track error;

    @api recordId;

    @wire(getRecord, { recordId: '$recordId', fields })
    agent;
    get id() {
        return this.agent.data.fields.Id.value;
    }
    get deactive() {
        return this.agent.data.fields.Deactive__c.value;
    }
    deactiveagent() {

            const record = {
                fields: {
                    [ID_FIELD.fieldApiName]: this.id,
                    [DEACTIVE_FIELD.fieldApiName]: true,
                }
            };    

            updateRecord(record)
                .then(() => {
                    this.dispatchEvent(
                        new ShowToastEvent({
                            title: 'Success',
                            message: 'Agent updated',
                            variant: 'success',
                        }),
                    );
                    return refreshApex(this.agent);
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