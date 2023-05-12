({
    fetchNotes : function(component, event, helper) {
       
        var actions = [
           // { label: 'Edit', name: 'edit' },
           { label: 'View', name: 'view' } 
        ]; 
        component.set('v.mycolumns', [
           
           
            {label: 'Created Date', fieldName: 'CreatedDate', initialWidth: 200,type: 'date',typeAttributes: {  
                                                                            day: 'numeric',  
                                                                            month: 'short',  
                                                                            year: 'numeric',  
                                                                            hour: '2-digit',  
                                                                            minute: '2-digit',  
                                                                            hour12: true}},
             {label: 'CreatedBy', fieldName: 'Entered_By__c' , type: 'text'
                ,wrapText: true,initialWidth:200},
                {label: 'Note', fieldName: 'Description__c', type: 'text'
                ,wrapText: true,initialWidth: 720},
            
            
           
            
         //  { type: 'action', typeAttributes: { rowActions: actions } } 
        ] );
         var tId =  component.get('v.ticketNo');
        var action = component.get("c.getNotesList");
        action.setParams({
            "ticketId":tId
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.acctList", response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    },
   handleRowAction: function ( cmp, event, helper ) {
       
        var action = event.getParam( 'action' );
       var row = event.getParam( 'row' );
        var recId = row.Id;
         cmp.set('v.noteId',recId);
         cmp.set('v.showModel',true);  
         
     /*   switch ( action.name ) {
           // case 'edit':
              //  var editRecordEvent = $A.get("e.force:editRecord");
              //  editRecordEvent.setParams({
                //   "recordId": recId
               // }); 
               // editRecordEvent.fire();
              // break;
            case 'view':
                var navEvt = $A.get("e.force:navigateToSObject");
    navEvt.setParams({
      "recordId": recId,
      "slideDevName": "related"
    });
    navEvt.fire();
                break;
        }*/
    }
   
})