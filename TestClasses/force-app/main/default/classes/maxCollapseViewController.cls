public with sharing class maxCollapseViewController  {

    //Calcualte Collapse View Section Filter Data
    public PageReference prepareCollapseViewFilterData(){

        //If data available then calcualte CollapseView
        //lstAccoutnInventCollapseViewDisplayList = new List<Products__c>(); 
        //Products__c objProdHiRec;
        lstLatestProdValOutputValue.clear();
        System.debug('*** lstLatestProdVal ' + lstLatestProdVal);
        if(strColumnValue==null || strColumnValue==''){
            lstLatestProdValOutputValue.addall(lstLatestProdVal);
            //lstAccoutnInventCollapseViewDisplayList = lstAccoutnInventCollapseView;
            return null;
        }
            
        
        String strPhoneVal;
       for(ProductsCollapseFullView__c objProd: lstLatestProdVal){
            System.debug('********* objProd ' + objProd.Phone_Number_1__c + '  strColumnValue  ' + strColumnValue);
            strPhoneVal = objProd.Phone_Number_1__c;
            if(strPhoneVal.contains(strColumnValue))
                lstLatestProdValOutputValue.add(objProd);
            
        }
       System.debug('********* lstLatestProdValOutputValuefilter ' + lstLatestProdValOutputValue.size());
        
        return null;
    }

    //---------------- Radha , Vijay and Srikanth code----------
    public list<ProductsCollapseFullView__c> objListCollViewFull    {get;set;} 
    public list<ProductsCollapseFullView__c> lstListCollViewInsert;
    public  List<ProductsCollapseFullView__c> lstLatestProdVal {get;set;}
    public  List<ProductsCollapseFullView__c> lstLatestProdValOutputValue {get;set;}
    public String strColumnValue    {get;set;}
    public String strHirQuery='SELECT Account_id__c,billing_id__c,BTN_chk__c,BTN_Name__c,BTN_Phone__c,Circuit_Id__c,City__c,CLLI__c,Company_ID__c,Company_name__c,CreatedById,CreatedDate,Customer_Number__c,GAN_Name__c,GAN__c,Id,IsDeleted,LastModifiedById,LastModifiedDate,lastupdatetym__c,Level__c,Library_Id__c,Location_Id__c,Name,Name__c,OwnerId,Region__c,Service_Control_Number__c,Service_Location__c,Service_Street_Address__c,State__c,Summary_Id__c,Summary_master_phone__c,SystemModstamp,WTN_ID__c,WTN_Name__c,WTN__c FROM hierarchy__c';
    
    public maxCollapseViewController(){
        //calFullData();
    }
    public void calFullData(){
        objListCollViewFull =  new list<ProductsCollapseFullView__c>();
        lstListCollViewInsert =  new list<ProductsCollapseFullView__c>();
        
        //Get the results from Query
        String strBTNNumber = Apexpages.currentPage().getParameters().get('btnNumCV');
        List<hierarchy__c> lstHierarchyAccountInven = Database.query(strHirQuery + ' WHERE BTN_Phone__c =\'' + strBTNNumber + '\'');
        

        //Collect all the WTN's into one List
        List<String> lstWTNVal = new List<String>();
        set<String> setWTNVal = new set<String>();
        
        //Add all the WTN's to String value
        setWTNVal.add(lstHierarchyAccountInven[0].billing_id__c);
        for(hierarchy__c objHir: lstHierarchyAccountInven){
            if(objHir.WTN_ID__c!=null){
                setWTNVal.add(objHir.WTN_ID__c);
            }
        }
        lstWTNVal = new List<String>(setWTNVal);  //Convert Set into List
        
        System.debug('**** lstWTNVal ' + lstWTNVal.size() + '   lstWTNVal ' + lstWTNVal);

        //Delete the existing data
        delete [select id from ProductsCollapseFullView__c];
        

            //Get the Products DAta
            Products__c[] lstProductsTemp = [SELECT USOC_Code_1__c,USOC_Code_2__c,Phone_Number_1__c, Account_Id__c,Active_Flag_A_1__c,Active_Flag_A_2__c,Bundle_Name_1__c,Bundle_Name_2__c,Charge_Code_1__c,Charge_Code_2__c,Charge_Rate_1__c,Charge_Rate_2__c,Circuit_Id__c,CONCATENATE__c,Connect_Date_1__c,Connect_Date_2__c,CreatedById,CreatedDate,Cust_Owned_Maint_Equ_1__c,Cust_Owned_Maint_Equ_2__c,DC_1__c,DC_2__c,Description_1__c,Description_2__c,Disconnect_Date_1__c,Disconnect_Date_2__c,Generic_SKU_1__c,Generic_SKU_2__c,Grouping_Name_1__c,Grouping_Name_2__c,ICB_Code_Flag_1__c,ICB_Code_Flag_2__c,Id,InDATE_1__c,InDATE_2__c,IN_Service_Order_1__c,IN_Service_Order_2__c,IsDeleted,Item_Number_1__c,Item_Number_2__c,Item_Sequence_Number_1__c,Item_Sequence_Number_2__c,I_HSI_WIFI_1__c,I_HSI_WIFI_2__c,LastModifiedById,LastModifiedDate,lastupdatetym__c,Library_id__c,MRC_NRC_FLag_1__c,MRC_NRC_FLag_2__c,Name,Non_Reaccuring_Charges_1__c,Non_Reaccuring_Charges_2__c,NO_Flag_Tax_T_1__c,NO_Flag_Tax_T_2__c,Out_Date_1__c,Out_Date_2__c,OUT_Service_Order_1__c,OUT_Service_Order_2__c,OwnerId,Package_Code_1__c,Package_Code_2__c,Package_Description_1__c,Package_Description_2__c,Package_Name_1__c,Package_Name_2__c,Prefix_P_1__c,Prefix_P_2__c,ProductGroupingSequence_1__c,ProductGroupingSequence_2__c,Product_GroupId_1__c,Product_GroupId_2__c,Product_Group_1__c,Product_Group_2__c,Product_Rate_1__c,Product_Rate_2__c,Quantity_1__c,Quantity_2__c,Reacuuring_Charges_1__c,Reacuuring_Charges_2__c,Service_Location_1__c,Service_Location_2__c,Service_Type_1__c,Service_Type_2__c,Service_Type_ST_1__c,Service_Type_ST_2__c,Status_S_1__c,Status_S_2__c,SystemModstamp,S_E_1__c,S_E_2__c,S_E_Type_Flag_1__c,S_E_Type_Flag_2__c,Vacation_Reac_Date_1__c,Vacation_Reac_Date_2__c FROM Products__c WHERE Account_Id__c IN: lstWTNVal];
                    
            //convert one Row into Two Rows
           try{
                for(Products__c objProduct:lstProductsTemp){
                        System.debug('** in adding products');

                        ProductsCollapseFullView__c objPro1 = new ProductsCollapseFullView__c();
                        ProductsCollapseFullView__c objPro2 = new ProductsCollapseFullView__c();

                        objPro1.Active_Flag_A_1__c = objProduct.Active_Flag_A_1__c;
                        objPro2.Active_Flag_A_1__c = objProduct.Active_Flag_A_2__c;
                        objPro1.Bundle_Name_1__c = objProduct.Bundle_Name_1__c;
                        objPro2.Bundle_Name_1__c = objProduct.Bundle_Name_2__c;
                        objPro1.Account_Id__c = objProduct.Account_Id__c;
                        objPro2.Account_Id__c = objProduct.Account_Id__c;
                        objPro1.Item_Number_1__c = objProduct.Item_Number_1__c;
                        objPro2.Item_Number_1__c = objProduct.Item_Number_2__c;
                        objPro1.Quantity_1__c = objProduct.Quantity_1__c;
                        objPro2.Quantity_1__c = objProduct.Quantity_2__c;
                        objPro1.Phone_Number_1__c = objProduct.Phone_Number_1__c;
                        objPro2.Phone_Number_1__c = objProduct.Phone_Number_1__c;//objProduct.Phone_Number__c;
                        objPro1.S_E_1__c = objProduct.S_E_1__c;
                        objPro2.S_E_1__c = objProduct.S_E_2__c;
                        objPro1.Description_1__c = objProduct.Description_1__c;
                        objPro2.Description_1__c = objProduct.Description_2__c;
                        
                        objPro1.Prefix_P_1__c = objProduct.Prefix_P_1__c;
                        objPro2.Prefix_P_1__c = objProduct.Prefix_P_2__c;
                        if(objProduct.Prefix_P_1__c!=null)
                            objPro1.Product_Rate_1__c = objProduct.Charge_Rate_1__c;
                        else
                            objPro1.Product_Rate_1__c = objProduct.Product_Rate_1__c;
                            
                        if(objProduct.Prefix_P_2__c!=null)
                            objPro2.Product_Rate_1__c = objProduct.Charge_Rate_2__c;
                        else
                            objPro2.Product_Rate_1__c = objProduct.Product_Rate_2__c;
                            
                        objPro1.NO_Flag_Tax_T_1__c = objProduct.NO_Flag_Tax_T_1__c;
                        objPro2.NO_Flag_Tax_T_1__c = objProduct.NO_Flag_Tax_T_2__c;
                        objPro1.Active_Flag_A_1__c = objProduct.Active_Flag_A_1__c;
                        objPro2.Active_Flag_A_1__c = objProduct.Active_Flag_A_2__c;
                        objPro1.InDATE_1__c = objProduct.InDATE_1__c;
                        objPro2.InDATE_1__c = objProduct.InDATE_2__c;
                        objPro1.IN_Service_Order_1__c = objProduct.IN_Service_Order_1__c;
                        objPro2.IN_Service_Order_1__c = objProduct.IN_Service_Order_2__c;
                        objPro1.Out_Date_1__c = objProduct.Out_Date_1__c;
                        objPro2.Out_Date_1__c = objProduct.Out_Date_2__c;
                        objPro1.OUT_Service_Order_1__c = objProduct.OUT_Service_Order_1__c;
                        objPro2.OUT_Service_Order_1__c = objProduct.OUT_Service_Order_2__c;
                        objPro1.DC_1__c = objProduct.DC_1__c;
                        objPro2.DC_1__c = objProduct.DC_2__c;

                        objPro1.Circuit_Id__c = objProduct.Circuit_Id__c;
                        objPro2.Circuit_Id__c = objProduct.Circuit_Id__c;
                        objPro1.Account_Id__c = objProduct.Account_Id__c;
                        objPro2.Account_Id__c = objProduct.Account_Id__c;
                        objPro1.ICB_Code_Flag_1__c = objProduct.ICB_Code_Flag_1__c;
                        objPro2.ICB_Code_Flag_1__c = objProduct.ICB_Code_Flag_2__c;
                        objPro1.Service_Location_1__c = objProduct.Service_Location_1__c;
                        objPro2.Service_Location_1__c = objProduct.Service_Location_2__c;
                        objPro1.Connect_Date_1__c = objProduct.Connect_Date_1__c;
                        objPro2.Connect_Date_1__c = objProduct.Connect_Date_2__c;
                        objPro1.Service_Type_ST_1__c = objProduct.Service_Type_ST_1__c;
                        objPro2.Service_Type_ST_1__c = objProduct.Service_Type_ST_2__c;
                        objPro1.Status_S_1__c = objProduct.Status_S_1__c;
                        objPro2.Status_S_1__c = objProduct.Status_S_2__c;
                        objPro1.Disconnect_Date_1__c = objProduct.Disconnect_Date_1__c;
                        objPro2.Disconnect_Date_1__c = objProduct.Disconnect_Date_2__c;
                        objPro1.I_HSI_WIFI_1__c = objProduct.I_HSI_WIFI_1__c;
                        objPro2.I_HSI_WIFI_1__c = objProduct.I_HSI_WIFI_2__c;

                        objPro1.Reacuuring_Charges_1__c= objProduct.Reacuuring_Charges_1__c;
                        objPro2.Reacuuring_Charges_1__c= objProduct.Reacuuring_Charges_2__c;
                        objPro1.Non_Reaccuring_Charges_1__c= objProduct.Non_Reaccuring_Charges_1__c;
                        objPro2.Non_Reaccuring_Charges_1__c= objProduct.Non_Reaccuring_Charges_2__c;
                        
                        
                        //Add to Temp table
                        if(lstListCollViewInsert.size()>995){
                             insert lstListCollViewInsert;
                             lstListCollViewInsert.clear();
                        }
                        
                        lstListCollViewInsert.add(objPro1);
                        lstListCollViewInsert.add(objPro2);

                    }
                
                }catch(Exception ae){
                    System.debug('Exceptino occured in pullAccountInventoryData method ' + ae);
                }
                
                System.debug('**** lstProductsSingleRow ' + lstListCollViewInsert.size() + '    lstProTemp ' + lstListCollViewInsert.size());
                if(lstListCollViewInsert.size()>0){
                    insert lstListCollViewInsert;
                }
                
                //Get all the values and find the Highest rate values
                String strOldPhoneNumber;
                ProductsCollapseFullView__c[] lstProductsTemp1 = [SELECT Phone_Number__c, USOC_Code_1__c,USOC_Code_2__c,Phone_Number_1__c, Account_Id__c,Active_Flag_A_1__c,Active_Flag_A_2__c,Bundle_Name_1__c,Bundle_Name_2__c,Charge_Code_1__c,Charge_Code_2__c,Charge_Rate_1__c,Charge_Rate_2__c,Circuit_Id__c,CONCATENATE__c,Connect_Date_1__c,Connect_Date_2__c,CreatedById,CreatedDate,Cust_Owned_Maint_Equ_1__c,Cust_Owned_Maint_Equ_2__c,DC_1__c,DC_2__c,Description_1__c,Description_2__c,Disconnect_Date_1__c,Disconnect_Date_2__c,Generic_SKU_1__c,Generic_SKU_2__c,Grouping_Name_1__c,Grouping_Name_2__c,ICB_Code_Flag_1__c,ICB_Code_Flag_2__c,Id,InDATE_1__c,InDATE_2__c,IN_Service_Order_1__c,IN_Service_Order_2__c,IsDeleted,Item_Number_1__c,Item_Number_2__c,Item_Sequence_Number_1__c,Item_Sequence_Number_2__c,I_HSI_WIFI_1__c,I_HSI_WIFI_2__c,LastModifiedById,LastModifiedDate,lastupdatetym__c,Library_id__c,MRC_NRC_FLag_1__c,MRC_NRC_FLag_2__c,Name,Non_Reaccuring_Charges_1__c,Non_Reaccuring_Charges_2__c,NO_Flag_Tax_T_1__c,NO_Flag_Tax_T_2__c,Out_Date_1__c,Out_Date_2__c,OUT_Service_Order_1__c,OUT_Service_Order_2__c,OwnerId,Package_Code_1__c,Package_Code_2__c,Package_Description_1__c,Package_Description_2__c,Package_Name_1__c,Package_Name_2__c,Prefix_P_1__c,Prefix_P_2__c,ProductGroupingSequence_1__c,ProductGroupingSequence_2__c,Product_GroupId_1__c,Product_GroupId_2__c,Product_Group_1__c,Product_Group_2__c,Product_Rate_1__c,Product_Rate_2__c,Quantity_1__c,Quantity_2__c,Reacuuring_Charges_1__c,Reacuuring_Charges_2__c,Service_Location_1__c,Service_Location_2__c,Service_Type_1__c,Service_Type_2__c,Service_Type_ST_1__c,Service_Type_ST_2__c,Status_S_1__c,Status_S_2__c,SystemModstamp,S_E_1__c,S_E_2__c,S_E_Type_Flag_1__c,S_E_Type_Flag_2__c,Vacation_Reac_Date_1__c,Vacation_Reac_Date_2__c FROM ProductsCollapseFullView__c where Phone_Number_1__c!=null ORDER BY Phone_Number_1__c ASC NULLS LAST];
                //strOldPhoneNumber='123';
                //strNewPhoneNumber='1234';
                String strWIFI='N';
                String strSEValues;
                Double decHighestVal=0.00;
                //List<ProductsCollapseFullView__c> lstLatestProdVal= new List<ProductsCollapseFullView__c>();
                lstLatestProdVal= new List<ProductsCollapseFullView__c>();
                lstLatestProdValOutputValue = new List<ProductsCollapseFullView__c>();
                
                
                ProductsCollapseFullView__c objProdHiRec =  new ProductsCollapseFullView__c();
                for(ProductsCollapseFullView__c objProd:lstProductsTemp1){
                    if(strOldPhoneNumber==null) strOldPhoneNumber=objProd.Phone_Number_1__c;
                    //if(strNewPhoneNumber==null) strNewPhoneNumber=objProd.Phone_Number__c;
                    System.debug('**** strOldPhoneNumber ' + strOldPhoneNumber + '  objProd.Phone_Number__c ' + objProd.Phone_Number_1__c);
                    
                    
                    if(objProd.Phone_Number_1__c!=strOldPhoneNumber){
                        System.debug('**** In not matching number');
                        //If any record found, then only add to list
                        if(objProdHiRec!=null){
                            decHighestVal=0.00;
                            objProdHiRec.Active_Flag_A_1__c = 'true';
                            objProdHiRec.I_HSI_WIFI_1__c=strWIFI;
                            lstLatestProdVal.add(objProdHiRec);
                        }
                    }
                    
                    strOldPhoneNumber=objProd.Phone_Number_1__c;
                    
                    
                    //Check for HSI/WIFI
                    strSEValues = objProd.S_E_1__c;
                    if(strSEValues!=null){
                            if(strSEValues.left(2)=='HS' || strSEValues.left(4)=='WIFI')
                                    strWIFI = 'Y';
                    }
                     System.debug('**** objProd.Product_Rate_1__c before ' + objProd.Product_Rate_1__c + '  decHighestVal ' + decHighestVal);
                    if(objProd.Product_Rate_1__c>=decHighestVal){
                        System.debug('**** objProd.Produ in object adding...');
                            objProdHiRec = objProd;
                            
                        decHighestVal = objProd.Product_Rate_1__c;  //To compare with next value
                    }
                    System.debug('**** objProd.Product_Rate_1__c ' + objProd.Product_Rate_1__c + '  decHighestVal ' + decHighestVal);
                }
                if(objProdHiRec!=null)
                    lstLatestProdVal.add(objProdHiRec);
                
                lstLatestProdValOutputValue.addall(lstLatestProdVal);
                    
                System.debug('*****  Unique Values List lstLatestProdVal ' + lstLatestProdVal.size() );
                
    }
}