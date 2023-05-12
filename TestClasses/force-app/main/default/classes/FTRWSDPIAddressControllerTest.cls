/**
 * @description       : This test class covers the following Apex classes:
 *      TBD_CLASS1
 *      TBD_CLASS2
 *      TBD_CLASS3
 * @author            : TBD
 * @version           : 3
**/
@isTest
public class FTRWSDPIAddressControllerTest {
    
    @isTest
    public static void testRetreiveCustomerFacility() {
        Test.setMock(WebServiceMock.class, new FTRWSDPIAddressValResultMock());
        ftr_addressBean addressBean1 = new ftr_addressBean();
        FTRWSDPIAddressController.retreiveCustomerFacility(addressBean1); 
        
        Test.setMock(WebServiceMock.class, new FTRWSDPIAddressValResultMock());
        ftr_addressBean addressBean = new ftr_addressBean();
        addressBean.addressLine1 = '2001 SOLAR DR';
        addressBean.cityName = 'OXNARD';
        addressBean.state = 'CA';
        addressBean.zipCode = '93036';
        String unitNumber = '275 STE';    
        FTRWSDPIAddressController.retreiveMatchingCustomerFacility(addressBean, unitNumber);        
    }
    
}