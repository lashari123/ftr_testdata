({
    init : function(component, event, helper) {
        
        component.set('v.columns', [
            {label: 'Customer Ticket Number', type: 'button',initialWidth: 180,
             typeAttributes: { label: { fieldName: 'Customer_Ticket_Number__c'},name: {fieldName: 'Customer_Ticket_Number__c'},variant:'base', title: 'Click to View Details'}},
            {label: 'Ticket Status', fieldName: 'Status__c', type: 'text', sortable: true,initialWidth: 120},
            {label: 'Escalated', fieldName: 'formula__c', type: 'text', initialHeight: 120,cellAttributes:{
                 class: {
                        fieldName: "showClass"
                    },
                iconName: {
                fieldName: 'EscalatedColor'
            }
            }},
            {label: 'Service', fieldName: 'Service_Product_disc__c', type: 'text'},
            {label: 'Created Date', fieldName: 'CreatedDate', type: 'date',initialWidth: 180},
            {label: 'Location', fieldName: 'Location', type: 'text'},
           
            {label: 'Description', fieldName: 'Description__c', type: 'text',initialWidth: 700}
        ]);
        
        helper.loadData(component, event);
        helper.getUserData(component, event);
    },
    viewRecord : function(component, event, helper) {

        let id = event.getParam('row').Id;
        let ticketsMap = component.get("v.ticketsMap");
        component.set("v.ticketInfo",ticketsMap[id]);
        component.set("v.isModalOpen", true);
        //if(component.get("v.isHomePage")){
        	helper.getTicketStatus(component,event);
        	//call remedy notes API
        	helper.getRemedyNotes(component,event);
        //}
        
    },
    newTicket : function(component, event, helper){
        var createRecordEvent = $A.get("e.force:createRecord");
        createRecordEvent.setParams({
            "entityApiName": "Remedy_Ticket__c"
        });
        createRecordEvent.fire();
    },
    filter: function(component, event, helper) {
        
        var data = component.get("v.data"),
            term = component.get("v.filter"),
            results = data, regex;
        try {
            if(term){
                regex = new RegExp(term, "i");
                
                results = data.filter(row=>regex.test(row.Customer_Ticket_Number__c) || regex.test(row.Status__c) || 
                                      regex.test(row.Impacted_Service__c) || regex.test(row.Location) ||
                                      regex.test(row.Description__c) || regex.test(row.Local_Contact_Phone__c));
            }
            else{
                component.set("v.filterdData", data);
            }
        } catch(e) {
            console.log(e);
        }
        component.set("v.filterdData", results);
    },
    
    handleSort : function(component,event,helper){
        //Returns the field which has to be sorted
        var sortBy = event.getParam("fieldName");
        //returns the direction of sorting like asc or desc
        var sortDirection = event.getParam("sortDirection");
        //Set the sortBy and SortDirection attributes
        component.set("v.sortBy",sortBy);
        component.set("v.sortDirection",sortDirection);
        // call sortData helper function
        helper.sortData(component,sortBy,sortDirection);
    },
    
    download : function(component, event, helper) {
    
        
    	// get the Records list  
        var remedyList = component.get("v.filterdData");
        
        // call the helper function which "return" the CSV data as a String   
        var csv = helper.convertArrayOfObjectsToCSV(component,remedyList);   
         if (csv == null){return;} 
        
        // ####--code for create a temp. <a> html tag [link tag] for download the CSV file--####     
	     var hiddenElement = document.createElement('a');
          hiddenElement.href = 'data:text/csv;charset=utf-8,' + encodeURI(csv);
          hiddenElement.target = '_self'; // 
          hiddenElement.download = 'ExportData.csv';  // CSV file Name* you can change it.[only name not .csv] 
          document.body.appendChild(hiddenElement); // Required for FireFox browser
    	  hiddenElement.click(); // using click() js function to download csv file
          
        } 

})