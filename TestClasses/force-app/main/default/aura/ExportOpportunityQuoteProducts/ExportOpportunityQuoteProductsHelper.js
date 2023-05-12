({
    getData : function(component, event, helper) {
        
       
        var action = component.get("c.getSterlingQuoteItemExport");
        var oppId = component.get("v.recordId");       
         console.log('oppId'+oppId);
        action.setParams({"OppId" : oppId});        	
        action.setCallback(this, function(response) {
            console.log('Get State ::'+response.getState());
            if(response.getState() === "SUCCESS"){
                var records = response.getReturnValue();
                console.log('response.getReturnValue ::'+ response.getReturnValue());
                
                //console.log('@@ProductList'+ records);
                //console.log('newItems-> ' + JSON.stringify(newItems));
                var newItems=[];
                for (var i=0; i< records.length; i++)
                {
                    var record = JSON.parse(records[i]);
                    
                    console.log('@@address @1 ::'+record.SnECode);
                    var Item = {
                        Street:record.ftrwsstreet,
                        unit:record.ftrwsUnit,
                        city:record.ftrwsCity,
                        StateOrProvince :record.ftrwsState,
                        postalCode :record.ftrwsZipcode,
                        Latitude:record.ftrwsLat,
                        Longitude :record.ftrwsLong,
                        ACNA:record.ftrwsAcna,
                        PNUM:record.CVD_Pnum,
                        Product:record.Product_Name,
                        Configuration:record.circuitType,
                        EVC_Bandwidth:record.EVC_Bandwidth,
                        Level_of_Service:record.ftrwsLevelofservice,
                        Term_Aggrement:record.Term_Aggrement,
                        In_Quote : '',
                        Comments:record.ftrwsComments,
                        DPI_Qualified:record.ftrwsDPIQualified,
                        DSAT_Qualified:record.ftrwsDSATQualified,
                        In_Footprint:record.ftrwsInFootprint,
                        WireCenter_CLLI:record.ftrwsWireCenterCLLI,
                        Max_Qos:record.ftrwsMaxQos,
                        DSAT_Max_Speed:record.ftrwsDSATMaxSpeed,
                        Copper_Qualification:record.ftrwsCopperQualification,
                        Copper_Tier:record.ftrwsCopperTier,
                        Fiber_Qualification:record.ftrwsFiberQualification,
                        Fiber_Tier:record.ftrwsFiberTier,
                        MRC : record.TotalMRC,
                        NRC: record.NRC,
                        Address_Id: record.Address_Id,
                        Product_Id: record.Product_Id,
                        SQI_Id : record.quoteitemid,
                        Notes : record.ftrwsNotes,
                        CVD_rate_Source : record.cvdratesource,
                        CVD_rate_Tier : record.Cvdratetier
                    }
                    
                    console.log('Item-> ' + JSON.stringify(Item));
                    
                    newItems.push(Item);
                    //console.log('newItems-> ' + JSON.stringify(newItems));
                }
                component.set("v.ProductList",newItems);
                console.log('@ProductList 11 ::'+JSON.stringify(component.get("v.ProductList")));
                console.log('@ProductList Length'+component.get("v.ProductList").length);
                this.download(component, event, helper);
            }
        });
        $A.enqueueAction(action);
    },
    
    download : function(component, event, helper) {
        //get the Records list 
        var ProductList = component.get("v.ProductList");
        console.log('@@download Data'+ ProductList);
        // call the helper function which "return" the CSV data as a String   
        var csv = this.convertArrayOfObjectsToCSV(component,ProductList);   
        console.log('CSV'+csv);
        if (csv == null){
            $A.get("e.force:closeQuickAction").fire();
            return;} 
        // ####--code for create a temp. <a> html tag [link tag] for download the CSV file--####     
        var hiddenElement = document.createElement('a');
        hiddenElement.href = 'data:text/csv;charset=utf-8,' + encodeURI(csv);
        hiddenElement.target = '_self'; // 
        hiddenElement.download = 'ProductExport.csv';  // CSV file Name* you can change it.[only name not .csv] 
        document.body.appendChild(hiddenElement); // Required for FireFox browser
        hiddenElement.click(); // using click() js function to download csv file
        
        $A.get("e.force:closeQuickAction").fire();
    } ,
    
    convertArrayOfObjectsToCSV : function(component,objectRecords){
        
        
        // declare variables
        var csvStringResult, counter, keys, columnDivider, lineDivider;
        
        // check if "objectRecords" parameter is null, then return from function
        if (objectRecords == null || !objectRecords.length) {
            console.log('objectRecords :: '+objectRecords);
            return null;
        }
        // store ,[comma] in columnDivider variabel for sparate CSV values and 
        // for start next line use '\n' [new line] in lineDivider varaible  
        columnDivider = ',';
        lineDivider =  '\n';
        
        // in the keys valirable store fields API Names as a key 
        // this labels use in CSV file header  
        // keys = ['STATUS','PRODUCT','SPEED','NUMBER_OF_BUSINESS_DAY','SE_CODE','SE_MRC', 'PROMO','QTY','TERM','RENEWAL_MR','NET_NEW_MRR','CPE_GROSS_MARGIN','CPE_NRC','NRC','SERVICE_ADDRESS','Z_ADDRESS'];
        keys = ['Street','unit','city','StateOrProvince','postalCode','Latitude','Longitude','ACNA','PNUM','Product','Configuration','EVC_Bandwidth','Level_of_Service','Term_Aggrement','Comments','DPI_Qualified','DSAT_Qualified','In_Footprint','WireCenter_CLLI','Max_Qos','DSAT_Max_Speed','Copper_Qualification','Copper_Tier','Fiber_Qualification','Fiber_Tier','MRC','NRC','Notes','CVD_rate_Source','CVD_rate_Tier'];
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
                var Column;
                if(objectRecords[i][skey] == undefined || objectRecords[i][skey] == "undefined"){
                    Column='';
                }
                else{
                    Column = objectRecords[i][skey];
                }
                csvStringResult += '"'+ Column+'"'; 
                
                counter++;
                
            } // inner for loop close 
            csvStringResult += lineDivider;
        }// outer main for loop close 
        
        // return the CSV formate String 
        return csvStringResult;
        System.debug('csvStringResult :: '+csvStringResult);
        
    }
})