@isTest(seeAllData = true)
public class Test_UpdateAccount {
 public static testMethod void unit1(){
     Alt_Channel_Form__c acf = new Alt_Channel_Form__c(name = 'sprncm', city__c='old city', Tax_ID_Number__c='345345', Name_of_Principal__c='asdfasfd',DUNS_Number__c='34567',Date_of_Formation__c = Date.Today());
     insert acf;
     Alt_Channel_Form__c acf1 = [select name, id, city__c from Alt_Channel_Form__c limit 1];
     acf1.city__c = 'New City';   
     try{  
         update acf1;
        }catch(Exception ex){}
 }
}