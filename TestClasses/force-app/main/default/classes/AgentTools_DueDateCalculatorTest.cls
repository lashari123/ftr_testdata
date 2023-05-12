@isTest
private class AgentTools_DueDateCalculatorTest {

    static testMethod void myUnitTest() {
        AgentTools_DueDateCalculator agnTlCalculator = new AgentTools_DueDateCalculator();
        agnTlCalculator.SelectedProduct = '50, 60';
        agnTlCalculator.SelectedFacilityStatus = 'Facilities Available';
	    agnTlCalculator.DueDateAdmin = true;
        PageReference pr = agnTlCalculator.EditDueDateMatrix();
        List<selectOption>  so = agnTlCalculator.getFacilityStatus();
        List<selectOption> so1 = agnTlCalculator.getProducts();
        agnTlCalculator.CalculateDate();
        Integer i = agnTlCalculator.execSatSun(5);
    }
}