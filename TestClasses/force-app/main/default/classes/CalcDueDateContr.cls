public class CalcDueDateContr{
    public boolean bolSystemAdmin {get;set;}
    public String strSelectedProduct {get;set;}
    public String strSelectedFacilityStatus {get;set;}
    public Date CalculatedDate {get;set;}
    public String usrProfileName;
    public String strFacilityStatus1;
    public String strFacilityStatus2;
    public String strSelectedCalcVal;
    public List<String> lstSelectedCalcVal = new List<String>();
    public datetime myDateTime;
    
     /* code modification; ISWR33914-P: LR*/  
    public List<Users_of_Tool__c> uList;
    public Tool_Used__c tool;
    Integer cnt;
     /*code modification; ISWR33914-P: LR */   
    
    
    public CalcDueDateContr(){
        //Get the Profile name    
        usrProfileName  = Userinfo.getUserId();
         if(usrProfileName.startsWith(System.Label.DueDateAdmin))
            bolSystemAdmin =true;

        strFacilityStatus1='Facilities Available (default value)';
        strFacilityStatus2='Facilities not Available, ICB Required';
    }
    
    
    public PageReference EditDueDateMatrix() {
        PageReference objPR = new PageReference('/a0E/o');
        return objPR;
    }

    //This method is called when user click on CalculateDue Date method
    public PageReference calcualteDueDate() {
    try{
        myDateTime = datetime.newInstance(2012, 08, 28, 12, 30, 2);//testing date
     //   System.debug('******** myDateTime butt  '+myDateTime ) ;
        myDateTime = datetime.now();
      
        System.debug('******** strSelectedProduct ' + strSelectedProduct );
        System.debug('******** strSelectedFacilityStatus ' + strSelectedFacilityStatus );
        System.debug('******** now ' + System.now() + '  myDateTime ' + myDateTime.hour() + '  usrProfileName ' + usrProfileName  );

        if(strSelectedProduct==null || strSelectedFacilityStatus ==null){
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.WARNING,'Product and Facility Status are Mandatory'));
        }else{
            //Split the ouput and get the value;
            lstSelectedCalcVal = strSelectedProduct.split(',');
        
            //Get facility Value;
             if(strSelectedFacilityStatus.equals(strFacilityStatus1))  strSelectedCalcVal=lstSelectedCalcVal[0];
             if(strSelectedFacilityStatus.equals(strFacilityStatus2))  strSelectedCalcVal=lstSelectedCalcVal[1];
             
             //Check wether applicable or not
             if(strSelectedCalcVal!='N/A'){
                      date mydate = date.today();
                   // date mydate = date.newinstance(2012, 08, 28);    // for testing
                    //- If the order comes in after 3pm, the Due Date Calculation should begin on the next day. 
                    if(myDateTime.hour()>=15){
                        System.debug('******** In If Conition ' + mydate);
                        date newDate = mydate.addDays(Integer.valueOf(execSatSun(Integer.valueof(strSelectedCalcVal))));
                        CalculatedDate=newDate;
                    }else{
                        System.debug('******** In If Else Conition '+ mydate);
                    //- If the order comes in before 3pm, the Due Date Calculation should begin on the same day.
                        date newDate = mydate.addDays(Integer.valueOf(execSatSun(Integer.valueof(strSelectedCalcVal)))-1);
                        CalculatedDate=newDate;
                        System.debug('******** CalculatedDate' + CalculatedDate);
                    }
            
             
             }else{
                    //Show error msg
                    ApexPages.addmessage(new ApexPages.message(ApexPages.severity.WARNING,'Due Date Calculation is not available for this Product / Facility Status combination'));
                    CalculatedDate=null;
             }
             
            
        }//End of first if
        }catch(Exception ae){}
        
        
         /* code modification; ISWR33914-P: LR*/       
             usersNTools(); //count only when user chooses a valid values
             
        return null;
    }
    //This method will avoid Saturday and Sunday
    public Integer execSatSun(Integer intDays){

           date mydate = date.today();
  //     date mydate = date.newinstance(2012, 08, 28);    // for testing
        System.debug('***** mydate ' + mydate );
        
        Date laborDay = date.newinstance(2012, 9, 3);
        Date thanksGiving= date.newinstance(2012, 11, 22);
        Date christMas= date.newinstance(2012, 12, 25);
        
        for(Integer intLoop=1;intLoop<=intDays;intLoop++){
             
             Date newDate=null;
             
             //if(intLoop>1)
             //  newDate = mydate.addDays(intLoop-1);
            //else
            //  newDate = mydate.addDays(0);
            
             if(myDateTime.hour()>=15){
                newDate = mydate.addDays(intLoop);
             }else{
                newDate = mydate.addDays(intLoop-1);
             }
             System.debug('***** newDate.toStartOfWeek() ' + newDate.toStartOfWeek() + '   ' + newDate.toStartOfWeek().addDays(6) + '   ' + newDate);
             IF(newDate.isSameDay(newDate.toStartOfWeek()) || newDate.isSameDay(newDate.toStartOfWeek().addDays(6)) || newDate.isSameDay(laborDay) ||newDate.isSameDay(christMas) ||newDate.isSameDay(thanksGiving) ) intDays++;

             //Date newDate = mydate.addDays(intLoop);
             //System.debug('***** mydate.toStartOfWeek() ' + mydate.toStartOfWeek() + '   ' + mydate.toStartOfWeek().addDays(6) + '   ' + mydate);
             //IF(mydate.isSameDay(mydate.toStartOfWeek()) || mydate.isSameDay(mydate.toStartOfWeek().addDays(6)) || mydate.isSameDay(laborDay) ||mydate.isSameDay(christMas) ||mydate.isSameDay(thanksGiving) ) {
            //  intDays++;
           // }
             
            // mydate.addDays(intLoop);   
            // System.debug('***** mydate.toStartOfWeek()1 mydate ' + mydate);          
         }

         System.debug('***** end '+intDays);
        return intDays;
    }

    //Select Product
    public List<selectOption> getProducts() {
        
        List<selectOption> objProducts = new List<selectOption>(); //new list for holding all of the picklist options
        objProducts.add(new selectOption('', '- None -')); //add the first option of '- None -' in case the user doesn't want to select a value or in case no values are returned from query below
        
        for (ProductDetails__c objTempProduct : [SELECT ICBRequired__c,Id,Name,SIFAvailable__c FROM ProductDetails__c]) { 
            objProducts.add(new selectOption(objTempProduct.SIFAvailable__c+','+objTempProduct.ICBRequired__c, objTempProduct.Name)); //for all records found - add them to the picklist options
        }
        
        return objProducts; //return the picklist options
    }
   
   //Select Facilty Status
    public List<selectOption> getFacilityStatus() {
        System.debug('********** facility status ' + strSelectedProduct);
        List<selectOption> objFacilityStatus = new List<selectOption>(); //new list for holding all of the picklist options
        objFacilityStatus.add(new selectOption('', '- None -')); //add the first option of '- None -' in case the user doesn't want to select a value or in case no values are returned from query below
        objFacilityStatus.add(new selectOption(strFacilityStatus1, strFacilityStatus1));
        objFacilityStatus.add(new selectOption(strFacilityStatus2, strFacilityStatus2));
        
        if(strSelectedProduct!=null && strSelectedFacilityStatus==null)
            strSelectedFacilityStatus=strFacilityStatus1;
        
        return objFacilityStatus ; //return the picklist options
    }
    
    public boolean getIsCalcDueDateNull(){
        if(CalculatedDate==null)
            return true;
        else
            return false;
    }



    /******************************************************************************************
    *  Project: ISWR33914-P (Commercial End to End-SO/TT and Pre-Order Analytics)
    *  Developer: Laya Ramos
    *  Date Added: 08-30-2012
    *  Description: This method is used to capture the user info when the user is using Due
    *                Date Calculation tool
    *  Note: This is an added method to existing source code of  Due Date Calculation tool    
    *******************************************************************************************/
    public void usersNTools()
    {     
        tool = new Tool_Used__c();
        uList = new List<Users_of_Tool__c>();
        
                            //query if the current user is existing
        cnt = [SELECT COUNT() FROM Users_of_Tool__c WHERE User_Record_Id__c = :Userinfo.getUserId()];        
        tool.Tool__c = 'Due Date Calculation';          
        
        
        if(cnt == 0)    //not existing yet
        {
            ulist.add(new Users_of_Tool__c(User_Record_Id__c = Userinfo.getUserId())); 
            try{
                Database.SaveResult saveResult = Database.Insert(uList[0], false);           
    
                System.debug('************* New List_of_User__c Id: ' + saveResult.getId());
                         
                tool.Users__c = saveResult.getId();        
                insert tool; 
                           
            }catch(System.DMLException de){
                System.debug('************insert of new tools used to NEW user FAILED:'+'\n'+ de.getMessage());
            }

        }else{ 
                        //get the current user record Id
            uList = [SELECT Id, User_Record_Id__c FROM Users_of_Tool__c WHERE User_Record_Id__c = :Userinfo.getUserId()];          
            tool.Users__c = uList[0].Id;     

            try{
                insert tool;  
                update  uList[0];
                
            }catch(System.DMLException de){
                System.debug('************insert of new tools used to EXISTING user FAILED: '+'\n'+ de.getMessage());
            }    
        }
                
    System.debug('*************List_of_User__c Id: ' + uList[0].Id  );
    }
    
}