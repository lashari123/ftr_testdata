@isTest
public class CalcDueDateControllerTest{
    public static testMethod void callTEst(){
        CalcDueDateContr objCalc = new CalcDueDateContr();
        objCalc.strSelectedProduct='3A,3';
        objCalc.strSelectedFacilityStatus='test';
        objCalc.EditDueDateMatrix();
        //objCalc.calcualteDueDate();
        //objCalc.execSatSun(11);
        objCalc.getProducts();
        objCalc.getFacilityStatus();
        objCalc.getIsCalcDueDateNull();
         objCalc.calcualteDueDate(); 
          objCalc.execSatSun(11);      
    }
}