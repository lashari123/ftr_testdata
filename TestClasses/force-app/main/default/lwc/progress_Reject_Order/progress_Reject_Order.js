/* eslint-disable no-alert */
import { LightningElement,api, track, wire } from 'lwc';
import { getRecord,getFieldValue } from 'lightning/uiRecordApi';
import CREATEDDATE_FIELD from '@salesforce/schema/Order.Order_Created_Date__c';
// eslint-disable-next-line no-unused-vars
import ORDERID_FIELD from '@salesforce/schema/Order.Id';
import ORDERNUMBER_FIELD from '@salesforce/schema/Order.OrderNumber';
import Id from '@salesforce/user/Id';
const fields = [CREATEDDATE_FIELD,ORDERNUMBER_FIELD,ORDERID_FIELD];
export default class Progress_Reject_Order extends LightningElement {
    userId=Id;
    @track disabled = false;
    @track error;
    
    @api recordId;

    @wire(getRecord, { recordId: '$recordId', fields })
    order;
    get createddate() {
        return getFieldValue(this.order.data, CREATEDDATE_FIELD);
    }
    get ordernum() {
        return getFieldValue(this.order.data, ORDERNUMBER_FIELD);
    }
    get orderid() {
        return getFieldValue(this.order.data, ORDERID_FIELD);
    }
    
            Progress() {
                function parseDate(datestr) { 
                    let arr = datestr.match(/(\d+)/g); 
                    let y = parseInt(arr[2],10); 
                    let m = parseInt(arr[1],10)-1; 
                    let d = parseInt(arr[0],10); 
                    return new Date(y,m,d); 
                    } 
                    let createdDate1 = new Date(this.createddate); 
                    if(createdDate1 >= parseDate('11/10/2017')) { 
                    alert('Error: See Approval History, select from Reassign|Approve/Reject to progress this Order'); 
                    } else {     
                    window.location.href = `/flow/SF_Order_Initiation?vRecordId=${this.orderid}&vUserId=${this.userId}&retURL=/${this.orderid}`; 
                    }
             }
            }