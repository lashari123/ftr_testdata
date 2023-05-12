/* eslint-disable no-shadow */
/* eslint-disable no-console */
/* eslint-disable no-unused-vars */
/* eslint-disable no-alert */
import { LightningElement,api, track, wire } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { getRecord,} from 'lightning/uiRecordApi';
import { updateRecord } from 'lightning/uiRecordApi';
import { refreshApex } from '@salesforce/apex';
import getDetails from '@salesforce/apex/GetDetails.getChannelDetails';
import ID_FIELD from '@salesforce/schema/Contract.Id';
import LEGALEMAIL_FIELD from '@salesforce/schema/Contract.Legal_Notice_Email_1__c';
const fields = [
    'Contract.Id',
    'Contract.Spring_Contract_Folder_Name__c',
    'Contract.Account_Channel__c',
    'Contract.Spring_Folder_Name__c',
    'Contract.Channel_Affiliation__c',
    'Contract.CustomerSignedId'];
export default class sendNDA extends LightningElement {
   
    @track error;

    @api recordId;
    @track searchKey = '';
    @track channel;
    @track idval
    @track nameval;
    @track Approvername;
    @track Approvertitle;
    @track Approveremail;

    @wire(getRecord, { recordId: '$recordId', fields })
    contract;
    get id() {
        return this.contract.data.fields.Id.value;
    }
    get springcontrfldrname() {
        return this.contract.data.fields.Spring_Contract_Folder_Name__c.value;
    }
    get springfoldername() {
        return this.contract.data.fields.Spring_Folder_Name__c.value;
    }
    get custsigned() {
        return this.contract.data.fields.CustomerSignedId.value;
    }
    get accountchannel() {
        return this.contract.data.fields.Account_Channel__c.value;
    }
    get channelaffiliation() {
        return this.contract.data.fields.Channel_Affiliation__c.value;
    }

    sendNDA() {

        this.searchKey = this.channelaffiliation;
					getDetails({ searchKey: this.searchKey }).then(result=>{
                                this.idval=result[0].Id;
                                this.nameval=result[0].Name;
                                this.Approvername=result[0].Approver__r.Name;
                                this.Approvertitle=result[0].Approver__r.Title;
                                this.Approveremail=result[0].Approver__r.Email;
           this.updateRec();
           this.reDirect();

        })
        .catch(error => {
            alert('No Valid record present in Contract_Channel_Affiliation__c');
            this.error=error;
            console.log("Error is:--->  ",error);
        })

    }      
 
    updateRec() {

            const record = {
                fields: {
                    [ID_FIELD.fieldApiName]: this.id,
                    [LEGALEMAIL_FIELD.fieldApiName]: this.Approveremail,
                }
            };
   

            updateRecord(record)
                .then(() => {
                    this.dispatchEvent(
                        new ShowToastEvent({
                            title: 'Success',
                            message: 'Case updated',
                            variant: 'success',
                        }),
                    ); 
                    return refreshApex(this.contract);
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
    reDirect() {

                let domain = document.location.hostname; 
                let isProd = true; //domain.indexOf('na39') !== -1; 
                let springCmUrl = isProd ? 'na11' : 'uatna11'; 
                let springCmAid = isProd ? '17662' : '7904' 
                
                if(this.custsigned === ''){ 
                 alert("Please populate the 'Customer Signed By' field and try again"); 
                 }else{ 
                 window.open(`https://${springCmUrl}.springcm.com/atlas/doclauncher/eos/Alt Channel NDA?aid=${springCmAid}&eos[0].Id=${this.id}&eos[0].System=Salesforce&eos[0].Type=Contract&eos[0].Name=${this.springcontrfldrname}&eos[0].ScmPath=/Accounts/${this.accountchannel}/${this.springfoldername}`); 
                 }
    }

}