/* eslint-disable no-console */
/* eslint-disable no-unused-vars */
/* eslint-disable no-alert */
import { LightningElement,api, track, wire } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { getRecord,generateRecordInputForUpdate,getFieldValue,} from 'lightning/uiRecordApi';
import { updateRecord } from 'lightning/uiRecordApi';
import { refreshApex } from '@salesforce/apex';
import ID_FIELD from '@salesforce/schema/Order.Id';
import STAGE_FIELD from '@salesforce/schema/Order.Order_Stage__c';
const fields = [
    'Order.Id',
    'Order.Order_Stage__c',
    'Order.Reject_Reason__c'];
export default class cancelOrder extends LightningElement {
   
    @track error;

    @api recordId;
    @track order11 = 'Cancelled';

    @wire(getRecord, { recordId: '$recordId', fields })
    order;
    get id() {
        return this.order.data.fields.Id.value;
    }
    get ord() {
        return this.order.data.fields.Order_Stage__c.value;
    }
    get res() {
        return this.order.data.fields.Reject_Reason__c.value;
    }

    updateOrder() {

            if ( this.ord === "Cancelled"){
                alert('Order is already cancelled'); 
            }
            else if ( this.res === "" || this.res === null ||this.res === undefined ) 
            alert('Cancel Reason field is required to cancel Order'); 

            else{ 

            const record = {
                fields: {
                    [ID_FIELD.fieldApiName]: this.id,
                    [STAGE_FIELD.fieldApiName]: this.order11,
                }
            };    

            updateRecord(record)
                .then(() => {
                    this.dispatchEvent(
                        new ShowToastEvent({
                            title: 'Success',
                            message: 'This Order Request was Cancelled',
                            variant: 'success',
                        }),
                    );
                    return refreshApex(this.order);
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
    }