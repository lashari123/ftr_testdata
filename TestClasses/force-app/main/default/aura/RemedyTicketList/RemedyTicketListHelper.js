({
    loadData : function(component, event) {
        
        var action = component.get("c.getTickets");
        let ticketsMap = {};
        action.setParams({isHomePage : component.get("v.isHomePage")});
        action.setCallback(this, function(response) {
            if(response.getState() === "SUCCESS"){
                let data =  response.getReturnValue();
                
                for(var i =0; i<data.length; i++){
                    if(component.get("v.isHomePage")){
                        if( data[i].Escalated__c == 'Escalated!'){
                            data[i].EscalatedColor = 'utility:priority';
                            data[i].showClass = 'changeColorToRed';
                        } 
                    } else {
                        if( data[i].Escalated__c == 'Escalated!' && data[i].Status__c != 'Closed' && data[i].Status__c != 'Cancelled'){
                            data[i].EscalatedColor = 'utility:priority';
                            data[i].showClass = 'changeColorToRed';
                        } 
                    }
                }
                data.forEach(function(item) {
                    item.CompanyName = item.Company_Name__c ? item.Company_Name__r.Name : '';
                    item.ReportedByName = item.Reported_By_name__c ? item.Reported_By_name__r.Name : '';
                    var streetAddress = item.Customer_Civic_Address__c ? item.Customer_Civic_Address__c + ' , ' :'';
                    item.Location = streetAddress+item.Service_Address_State__c;
                    ticketsMap[item.Id] = item;
                });
                component.set("v.data",data);
                component.set("v.filterdData",data);
                component.set("v.ticketsMap",ticketsMap);
            }
        });
        $A.enqueueAction(action); 
    },
    
    getUserData : function(component, event) {
        var action = component.get("c.getCurrentUserData");
        let ticketsMap = {};
        action.setCallback(this, function(response) {
            component.set("v.userInfo", response.getReturnValue());
        });
        $A.enqueueAction(action); 
    },
    
    getTicketStatus : function(component, event){
        var action = component.get("c.searchTicket");
        var ticket =component.get("v.ticketInfo").Customer_Ticket_Number__c;
        if(!component.get("v.ticketInfo").Customer_Ticket_Number__c.includes('OP')){
            component.set('v.showFields', false);
        } else{
            action.setParams({ticketNumber : ticket});
            action.setCallback(this, function(response) {
                component.set("v.ticketInfo",response.getReturnValue());
                console.log('tkt status:' + response.getReturnValue());
            });
            $A.enqueueAction(action);
            component.set('v.showFields', true);
        }
        component.set('v.openTicketModel', true);
        // component.get("v.ticketInfo").Customer_Ticket_Number__c
        
    },
    
    sortData : function(component,fieldName,sortDirection){
        var data = component.get("v.data");
        //function to return the value stored in the field
        var key = function(a) { return a[fieldName]; }
        var reverse = sortDirection == 'asc' ? 1: -1;
        
        // to handel number/currency type fields 
        if(fieldName == 'Status__c'){ 
            data.sort(function(a,b){
                var a = key(a) ? key(a) : '';
                var b = key(b) ? key(b) : '';
                return reverse * ((a>b) - (b>a));
            }); 
        }
        else{// to handel text type fields 
            data.sort(function(a,b){ 
                var a = key(a) ? key(a).toLowerCase() : '';//To handle null values , uppercase records during sorting
                var b = key(b) ? key(b).toLowerCase() : '';
                return reverse * ((a>b) - (b>a));
            });    
        }
        //set sorted data to accountData attribute
        component.set("v.filterdData",data);
    },
    
    convertArrayOfObjectsToCSV : function(component,objectRecords){
        
        
        // declare variables
        var csvStringResult, counter, keys, columnDivider, lineDivider;
       
        // check if "objectRecords" parameter is null, then return from function
        if (objectRecords == null || !objectRecords.length) {
            return null;
         }
        // store ,[comma] in columnDivider variabel for sparate CSV values and 
        // for start next line use '\n' [new line] in lineDivider varaible  
        columnDivider = ',';
        lineDivider =  '\n';
 
        // in the keys valirable store fields API Names as a key 
        // this labels use in CSV file header  
        keys = ['Customer_Ticket_Number__c','Circuit_Id__c','Customer_Civic_Address__c','Customer_Address_City__c','Service_Address_State__c','Customer_Address_Zip__c', 'Description__c','Status__c','CreatedDate' ];
        
        csvStringResult = '';
        csvStringResult += keys.join(columnDivider);
        csvStringResult += lineDivider;
 
        for(var i=0; i < objectRecords.length; i++){   
            counter = 0;
           
             for(var sTempkey in keys) {
                var skey = keys[sTempkey] ;  
 
              // add , [comma] after every String value,. [except first]
                  if(counter > 0){ 
                      csvStringResult += columnDivider; 
                   }   
               
               csvStringResult += '"'+ objectRecords[i][skey]+'"'; 
               
               counter++;
 
            } // inner for loop close 
             csvStringResult += lineDivider;
          }// outer main for loop close 
       
       // return the CSV formate String 
        return csvStringResult;        
        
    },
    //This method will call Remedy Notes Service to get note list
    getRemedyNotes : function(component, event){
        var action = component.get("c.getRemedyNotes");
        var ticket =component.get("v.ticketInfo").Customer_Ticket_Number__c;
        if(ticket.includes('OP')){
            action.setParams({ticketNumber : ticket});
            action.setCallback(this, function(response) {
                console.log(response.getReturnValue());
            });
            $A.enqueueAction(action);
        }
    },
})