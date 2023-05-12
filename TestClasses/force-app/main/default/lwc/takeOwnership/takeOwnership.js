/* eslint-disable no-shadow */
/* eslint-disable no-console */
/* eslint-disable no-unused-vars */
/* eslint-disable no-alert */
import { LightningElement,api, track, wire } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { getRecord,} from 'lightning/uiRecordApi';
import { updateRecord } from 'lightning/uiRecordApi';
import { refreshApex } from '@salesforce/apex';
import ID_FIELD from '@salesforce/schema/Sales_Engineering_Support_Request__c.Id';
import STATUS_FIELD from '@salesforce/schema/Sales_Engineering_Support_Request__c.Status__c';
import OWNERID_FIELD from '@salesforce/schema/Sales_Engineering_Support_Request__c.OwnerId';
import Id from '@salesforce/user/Id';
const fields = [
    'Sales_Engineering_Support_Request__c.Id'];
export default class takeOwnership extends LightningElement {
    userId=Id;
   
    @track error;

    @api recordId;
    @track status;

    @wire(getRecord, { recordId: '$recordId', fields })
    salesengineering;
    get id() {
        return this.salesengineering.data.fields.Id.value;
    }

    takeOwnershipCall() {

        this.status='Assigned';

            const record = {
                fields: {
                    [ID_FIELD.fieldApiName]: this.id,
                    [STATUS_FIELD.fieldApiName]: this.status,
                    [OWNERID_FIELD.fieldApiName]: this.userId,
                }
            };
     

            updateRecord(record)
                .then(() => {
                    this.dispatchEvent(
                        new ShowToastEvent({
                            title: 'Success',
                            message: 'Sales Engineering Ownership Updated',
                            variant: 'success',
                        }),
                    );
                    return refreshApex(this.salesengineering);
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