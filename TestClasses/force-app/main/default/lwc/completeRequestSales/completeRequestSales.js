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
const fields = [
    'Sales_Engineering_Support_Request__c.Id',
    'Sales_Engineering_Support_Request__c.SA_Involved__c',
    'Sales_Engineering_Support_Request__c.Name_of_the_SA_involved__c',
    'Sales_Engineering_Support_Request__c.SE_Engagement__c',
    'Sales_Engineering_Support_Request__c.SE_Stop_Reason__c',
    'Sales_Engineering_Support_Request__c.Estimated_Quote_Amount__c',
    'Sales_Engineering_Support_Request__c.RecordTypeId',
    'Sales_Engineering_Support_Request__c.Rejected__c'];
export default class completeRequestSales extends LightningElement {
   
    @track error;

    @api recordId;
    @track status;

    @wire(getRecord, { recordId: '$recordId', fields })
    salesengineering;
    get id() {
        return this.salesengineering.data.fields.Id.value;
    }
    get sainvolved() {
        return this.salesengineering.data.fields.SA_Involved__c.value;
    }
    get nameofsainvolved() {
        return this.salesengineering.data.fields.Name_of_the_SA_involved__c.value;
    }
    get seengagement() {
        return this.salesengineering.data.fields.SE_Engagement__c.value;
    }
    get sestopreason() {
        return this.salesengineering.data.fields.SE_Stop_Reason__c.value;
    }
   get estimatedquote() {
   return this.salesengineering.data.fields.Estimated_Quote_Amount__c.value;
    }
    get rectypid() {
        return this.salesengineering.data.fields.RecordTypeId.value;
    }
   get rejectedval() {
         return this.salesengineering.data.fields.Rejected__c.value;
   }

    completeRequest() {
          
           if(this.sainvolved === 'Yes' && this.nameofsainvolved === ""){ 
            alert('SA Name is required'); 
            
            }else if(this.seengagement === 'Stop Engagement' && this.sestopreason === ""){ 
            alert('SE Stop Reason is required'); 
            
            }else if(this.sainvolved === "" || this.seengagement === ""){ 
            alert('Please fill out the required fields'); 
            
            }else if( this.rejectedval === true){ 
            alert('Cannot complete the request when it is Rejected'); 
            
            }else if ( this.estimatedquote === "" && this.rectypid !== '0120L000000NMYS'){ 
            alert('Please fill Estimated Quote Amount field'); 
            
            }else { 
            this.newmet();
       }      
    }
    newmet() {

        this.status='Complete';

            const record = {
                fields: {
                    [ID_FIELD.fieldApiName]: this.id,
                    [STATUS_FIELD.fieldApiName]: this.status,
                }
            };     

            updateRecord(record)
                .then(() => {
                    this.dispatchEvent(
                        new ShowToastEvent({
                            title: 'Success',
                            message: 'Sales Engineering Status updated',
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