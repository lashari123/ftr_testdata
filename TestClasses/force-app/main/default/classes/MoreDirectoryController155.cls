/*Description: this class is called from OneView-SummaryPage-Directory Listing
 	when there are more than 20 directories and the user clicks the 'more' link.
 	Logic->
 	 
	Query the Hierarchy for accountid where WTN = uservariable
	UNION ALL --will be unique anyway
	Query the Hierarchy for accountid where phonenumber=uservariable and WTN != uservariable 
	
	Query directory where accountid = result above
	
	Sort result above in apex by telephone number, sequence, line no
	
	Display. if resultset> 1000 break it up by 1000. moreDirectory1000 page then exports to excel.
	(SFDC limitations- viewstate max size, list max size) 
	*/ 
//	date - modified by - modifications
//

public with sharing class MoreDirectoryController155  {

    public transient List<Directory__c> lstDirectory            {get;set;}
    public transient List<Directory__c> lstDirectoryAllWTNValues            {get;set;}
    public transient List<Directory__c> lstDirectoryVFDisplay           {get;set;}
    public transient String strFilterDirectoryListingTelephone {get;set;}
    public transient String strBTNNumber    {get;set;}
    
    public transient List<Directory__c> secondDirectory            {get;set;}
    public transient List<Directory__c> thirdDirectory            {get;set;}
    public transient List<Directory__c> secondDirectoryVFDisplay           {get;set;}
    public transient List<Directory__c> thirdDirectoryVFDisplay           {get;set;}
    public transient List<Directory__c> fourthDirectory            {get;set;}
    public transient List<Directory__c> fifthDirectory            {get;set;}
    public transient List<Directory__c> fourthDirectoryVFDisplay           {get;set;}
    public transient List<Directory__c> fifthDirectoryVFDisplay           {get;set;}
    public transient List<Directory__c> sixthDirectory            {get;set;}
    public transient List<Directory__c> sixthDirectoryVFDisplay           {get;set;}
       
    public MoreDirectoryController155 (){
    	
    	
        lstDirectory = new List<Directory__c>();
        lstDirectoryVFDisplay = new List<Directory__c>();
        lstDirectoryAllWTNValues = new List<Directory__c>();
        
        
		secondDirectory = new List<Directory__c>();
        secondDirectoryVFDisplay = new List<Directory__c>();
        thirdDirectory = new List<Directory__c>();
        thirdDirectoryVFDisplay = new List<Directory__c>();
        fourthDirectory = new List<Directory__c>();
        fourthDirectoryVFDisplay = new List<Directory__c>();
        fifthDirectory = new List<Directory__c>();
        fifthDirectoryVFDisplay = new List<Directory__c>();
        sixthDirectory = new List<Directory__c>();
        sixthDirectoryVFDisplay = new List<Directory__c>();
        
    }
    
    //@Future
    public void calFullData(){
        pullDirectoryData();
    }
    //The following method will get the Directory Data
        public PageReference pullDirectoryData(){
               
               //String strBTNNumber; 
               
                if(lstDirectoryVFDisplay.size()>0)
                        return null;
                
                
                //Get the Account ID from Hirarchy
                if(strBTNNumber==null)
                        strBTNNumber = Apexpages.currentPage().getParameters().get('btnNum');
         
                System.debug('**** strBTNNumber for Directory ' + strBTNNumber);
                List<hierarchy__c> lstHirDirect=[SELECT Account_id__c, billing_id__c,WTN_ID__c, Company_name__c from hierarchy__c where WTN__c=:strBTNNumber];
        		
                if(lstHirDirect.size()==0)
                return null;
                
                integer numberofRecords=0;
                
                lstDirectory = [SELECT Account_Id__c,concatinate__c,Description_Line__c,Description__c,Directory_Code_1__c,Directory_Code_2__c,Directory_Code_3__c,Directory_Code_4__c,Directory_Code_5__c,Directory_Listing_Code__c,Directory_Mailing_Address__c,external_id__c,lastupdatetym__c,Last_Sequence_Number__c,Library_id__c,Line_number__c,Listing_Sequence__c,List_With_Phone_Number__c,Name,Phone_Number__c,Reference_Number__c,Sequence_Number__c 
				                FROM Directory__c 
				                where Account_Id__c=:lstHirDirect[0].Account_Id__c
				                ORDER BY Listing_Sequence__c,Line_number__c ASC NULLS LAST];
                
                if(lstDirectory.size()>0) {
                                lstDirectoryAllWTNValues.addall(lstDirectory);
                                numberofRecords=lstDirectory.size();
                }
                        //lstDirectoryVFDisplay.addall(lstDirectory);
                
                
                //Get the WTN VAlues
                transient List<String> lstAccountID = new  List<String>();      
                          
                
                List<hierarchy__c> lstHirDirectWTNValues=[SELECT Account_id__c, WTN__c, billing_id__c,WTN_ID__c, Company_name__c 
                										FROM hierarchy__c where BTN_Phone__c=:strBTNNumber AND WTN__c!=:strBTNNumber ORDER BY WTN__c ASC NULLS LAST ];  //limit 190
                
                if(lstHirDirectWTNValues.size()>0){
	                   //Map <id,id> accountMap=new Map <id,id>();
	                   transient List<String> temp=new List<String> ();
	                   for (hierarchy__c a:lstHirDirectWTNValues ){
	                   		//accountMap.put(a.Account_id__c,null);
	                   		temp.add(a.Account_id__c);
	                   }
	
	                   transient Map<String, Directory__c> ListToSort=new Map<String, Directory__c>();
	                   
	                   lstDirectory = [SELECT Account_Id__c,concatinate__c,Description_Line__c,Description__c,Directory_Code_1__c,Directory_Code_2__c,Directory_Code_3__c,Directory_Code_4__c,Directory_Code_5__c,Directory_Listing_Code__c,Directory_Mailing_Address__c,external_id__c,lastupdatetym__c,Last_Sequence_Number__c,Library_id__c,Line_number__c,Listing_Sequence__c,List_With_Phone_Number__c,Name,Phone_Number__c,Reference_Number__c,Sequence_Number__c 
													FROM Directory__c 
													where Account_Id__c in :temp  
													ORDER BY Listing_Sequence__c,Line_number__c ASC NULLS LAST];   
						 
						string singledigit;
						
						//SORT HERE
						
						transient integer counter=0;
						for (Directory__c a : lstDirectory) {
							
							if (a.Line_number__c==null) a.Line_number__c=0+counter;
							if (a.Listing_Sequence__c==null) a.Listing_Sequence__c='0'+counter;
							if  (String.valueof(a.Line_number__c).length()==1 ){		//prefix single digit with 0 so that it sorts properly so that 11 (for example) won't come before 2 
								singledigit='0' + a.Line_number__c;
							} else {								
								singledigit=String.valueof(a.Line_number__c);
							}
							ListToSort.put(a.Account_Id__c + ' ' +a.Listing_Sequence__c + ' ' + singledigit, a);
							counter++;
						}
						system.debug('444444444444444444444   ___  ' +  ListToSort.size());
						transient list <string> sortedKeys=new list <string> ();
						sortedKeys.addAll(ListToSort.keySet());
						sortedKeys.sort();

						lstDirectory.clear();
						
						counter=0;
						for (string a : sortedKeys) {
							if (counter<1000 - numberofRecords) 
								lstDirectory.add( ListToSort.get(a) );

							if (( counter>1000 - numberofRecords) &&  ( counter<2000 - numberofRecords) )
								secondDirectory.add( ListToSort.get(a) );

							if (( counter>2000 - numberofRecords) &&  ( counter<3000 - numberofRecords) )
								thirdDirectory.add( ListToSort.get(a) );
							if (( counter>3000 - numberofRecords) &&  ( counter<4000 - numberofRecords) )
								fourthDirectory.add( ListToSort.get(a) );	
							if (( counter>4000 - numberofRecords) &&  ( counter<5000 - numberofRecords) )
								fifthDirectory.add( ListToSort.get(a) );	
							if (( counter>5000 - numberofRecords) &&  ( counter<6000 - numberofRecords) )
								sixthDirectory.add( ListToSort.get(a) );	
								
								
							counter++;
						}		
						temp=null;				
	                }

	                if(lstDirectory.size()>0) lstDirectoryAllWTNValues.addall(lstDirectory);
 	                
	                if(lstDirectoryAllWTNValues.size()>0)	                
	                        lstDirectoryVFDisplay.addall(lstDirectoryAllWTNValues);  
	                
	                if(secondDirectory.size()>0)	                
	                        secondDirectoryVFDisplay.addall(secondDirectory);
	                
	                if(thirdDirectory.size()>0)	                
	                        thirdDirectoryVFDisplay.addall(thirdDirectory);
	                        
	                if(fourthDirectory.size()>0)	                
	                        fourthDirectoryVFDisplay.addall(fourthDirectory);        
	                
	                if(fifthDirectory.size()>0)	                
	                        fifthDirectoryVFDisplay.addall(fifthDirectory);
	                if(sixthDirectory.size()>0)	                
	                        sixthDirectoryVFDisplay.addall(sixthDirectory);	                                        
	                return null;
        }
            //The following method will get the filtered data
            
          
            
    public PageReference filterDirectoryListing(){

        //If Search provided then proceed here
        if(strFilterDirectoryListingTelephone!=null){     //If User click on Descritopn then execute this section.
            lstDirectoryVFDisplay.clear(); //Empty the existing records
            System.debug('******** lstDirectoryVFDisplay ' + lstDirectoryVFDisplay.size() + '    ' + lstDirectoryVFDisplay);
            for(Directory__c objDirectory: lstDirectoryAllWTNValues ){
                    String strTele = objDirectory.Phone_Number__c;
                    if(strTele.contains(strFilterDirectoryListingTelephone))
                            lstDirectoryVFDisplay.add(objDirectory);
            }
        }
        //If no search provided and click on Filter, show all records
        if((strFilterDirectoryListingTelephone==null || strFilterDirectoryListingTelephone=='')){
                lstDirectoryVFDisplay.addall(lstDirectoryAllWTNValues);
        }
        
        System.debug('******** lstDirectoryVFDisplay ' + lstDirectoryVFDisplay.size());
        
        return null;
    }
}