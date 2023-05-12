@isTest
global  class WebserviceManageCollectionMock implements WebServiceMock {
    
    global void doInvoke(Object stub, Object request, Map<string,object> response, String endpoint, String soapAction, String requestName, String responseNS, String responseName, String responseType){ 
        WS_ESB_ManageCollection.ResponseContainer_GetAccountsReceivable responseContainer = new WS_ESB_ManageCollection.ResponseContainer_GetAccountsReceivable();
        WS_ESB_ManageCollection.Response_GetAccountsReceivable responseElement = new WS_ESB_ManageCollection.Response_GetAccountsReceivable();
       
        //Construct the business object
        WS_ESB_BusinessObjects.Quantity qty = new WS_ESB_BusinessObjects.Quantity();
        qty.Amount='123';
       
        WS_ESB_BusinessObjects.CurrentBillAmounts current_bill = new WS_ESB_BusinessObjects.CurrentBillAmounts();
        current_bill.NonProRatedChargesAmount = qty;
        current_bill.ProRatedChargesAndCurrentAdjustmentsAmount = qty;
        current_bill.TollAmount = qty;
        current_bill.TaxAmount = qty;
       
        WS_ESB_BusinessObjects.PendingAccountsReceivable pending_ar = new WS_ESB_BusinessObjects.PendingAccountsReceivable();
        pending_ar.PostedCurrentAdjustment = qty;
        pending_ar.UnPostedCurrentAdjustment = qty;
        pending_ar.UnPostedPaymentAmount = qty;
        pending_ar.UnPostedPriorAdjustment = qty;
       
        List<WS_ESB_BusinessObjects.AccountsReceivable> list_ar = new List<WS_ESB_BusinessObjects.AccountsReceivable>();
       
        integer i=0;
        for(i=0; i<=12; i++){
            WS_ESB_BusinessObjects.AccountsReceivable ar = new WS_ESB_BusinessObjects.AccountsReceivable();
            ar.BillDate = '';
            ar.BillCycle = '19';
            ar.PriorBillAmount = qty;
            ar.PriorBillAdjustmentAmount = qty;
            ar.TotalPaymentAmount = qty;
            ar.LastPaymentDate = '';
            ar.CurrentBillAmounts = current_bill;
            list_ar.add(ar);
        }

        responseElement.AccountsReceivable = list_ar;
        responseElement.PendingAccountsReceivable = pending_ar;
        responseContainer.Response = responseElement;
        response.put('response_x', responseContainer);   
    }
      
}