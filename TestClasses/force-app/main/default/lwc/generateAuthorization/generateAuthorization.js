/* eslint-disable no-console */
/* eslint-disable no-alert */
import { LightningElement,api, track, wire } from 'lwc';
import { getRecord,getFieldValue } from 'lightning/uiRecordApi';
import CUSTOMERSIGNED_FIELD from '@salesforce/schema/Authorization__c.CustomerSigned__c';
import DOCSTATUS_FIELD from '@salesforce/schema/Authorization__c.Document_Status__c';
import RECTYPENAME_FIELD from '@salesforce/schema/Authorization__c.Record_Type_Name__c';
import ID_FIELD from '@salesforce/schema/Authorization__c.Id';
import SPRINGAUTHORIZATION_FIELD from '@salesforce/schema/Authorization__c.Spring_Authorization_Folder_Name__c';
import ACCOUNTCHANNEL_FIELD from '@salesforce/schema/Authorization__c.Account_Channel__c';
import SPRINGFOLDER_FIELD from '@salesforce/schema/Authorization__c.Spring_Folder_Name__c';
import getprofilenm from '@salesforce/apex/GetDetails.getProfileName';
const fields = [DOCSTATUS_FIELD,RECTYPENAME_FIELD,CUSTOMERSIGNED_FIELD,ID_FIELD,SPRINGAUTHORIZATION_FIELD,ACCOUNTCHANNEL_FIELD,SPRINGFOLDER_FIELD];
export default class generateAuthorization extends LightningElement {
    @track disabled = false;
    @track error;
    
    @api recordId;
    @track profilenm;


    @wire(getRecord, { recordId: '$recordId', fields })
    authorization;
    get custsigned() {
        return getFieldValue(this.authorization.data, CUSTOMERSIGNED_FIELD);
    }
    get docstatus() {
        return getFieldValue(this.authorization.data, DOCSTATUS_FIELD);
    }
    get rectypename() {
        return getFieldValue(this.authorization.data, RECTYPENAME_FIELD);
    }
    get authid() {
        return getFieldValue(this.authorization.data, ID_FIELD);
    }
    get springauth() {
        return getFieldValue(this.authorization.data, SPRINGAUTHORIZATION_FIELD);
    }
    get accountchannel() {
        return getFieldValue(this.authorization.data, ACCOUNTCHANNEL_FIELD);
    }
    get springfolder() {
        return getFieldValue(this.authorization.data, SPRINGFOLDER_FIELD);
    }

    
    generateAuthorization() {

        getprofilenm().then(result=>{
            this.profilenm=result;
            this.newmet();

        })
        .catch(error => {
            this.error=error;
        })

    }

   newmet(){

       let rectypenamenew = this.rectypename.replace('+', '');
       
       if(this.custSigned === ''){ 
        alert("Please populate the 'Customer Signed By' field and try again"); 
        }else if(this.docstatus === 'Completed'){ 
        alert("This authorization has been signed. Unable to replace document."); 
        }else if(this.profilenm === '#CTF Small Business User'){ 
        window.open(`https://na11.springcm.com/atlas/doclauncher/eos/CC-${rectypenamenew}?aid=17662&eos[0].Id=${this.authid}&eos[0].System=Salesforce&eos[0].Type=Authorization__c&eos[0].Name=${this.springauth}&eos[0].ScmPath=/Accounts/${this.accountchannel}/${this.springfolder}/Authorizations`); 
        }else{ 
        window.open(`https://na11.springcm.com/atlas/doclauncher/eos/${rectypenamenew}?aid=17662&eos[0].Id=${this.authid}&eos[0].System=Salesforce&eos[0].Type=Authorization__c&eos[0].Name=${this.springauth}&eos[0].ScmPath=/Accounts/${this.accountchannel}/${this.springfolder}/Authorizations`) 
        }
    }
            }