/* eslint-disable no-console */
/* eslint-disable no-unused-vars */
/* eslint-disable no-alert */
import { LightningElement,api, track, wire } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { getRecord,} from 'lightning/uiRecordApi';
import { updateRecord } from 'lightning/uiRecordApi';
import { refreshApex } from '@salesforce/apex';
import ID_FIELD from '@salesforce/schema/Order.Id';
import STAGE_FIELD from '@salesforce/schema/Order.Order_Stage__c';
import getProfileID from '@salesforce/apex/GetDetails.getProfileID';
const fields = [
    'Order.Id',
    'Order.Order_Stage__c',
    'Order.Multi_Products__c'];
export default class completeOrder extends LightningElement {
   
    @track error;

    @api recordId;
    @track order11 = 'Completed';
    @track profileID

    @wire(getRecord, { recordId: '$recordId', fields })
    order;
    get id() {
        return this.order.data.fields.Id.value;
    }
    get ord() {
        return this.order.data.fields.Order_Stage__c.value;
    }
    get multi() {
        return this.order.data.fields.Multi_Products__c.value;
    }

    updateOrder() {

            getProfileID().then(result=>{
                this.profileID=result;
                this.newmet();
            })
            .catch(error => {
                this.error=error;
            })
        }
        newmet(){
            if(!(this.profileID==='00e40000000nYck') && ! 
            (this.profileID==='00e0L000000j95L')&& ! (this.multi !== "")) 
            
            alert('You do not have permission to Complete this Order'); 
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
                            message: 'Order Status Updated  to Complete',
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