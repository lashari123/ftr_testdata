/**
 * This class contains unit tests for validating the behavior of Apex classes
 * and triggers.
 *
 * Unit tests are class methods that verify whether a particular piece
 * of code is working properly. Unit test methods take no arguments,
 * commit no data to the database, and are flagged with the testMethod
 * keyword in the method definition.
 *
 * All test methods in an organization are executed whenever Apex code is deployed
 * to a production organization to confirm correctness, ensure code
 * coverage, and prevent regressions. All Apex classes are
 * required to have at least 75% code coverage in order to be deployed
 * to a production organization. In addition, all triggers must have some code coverage.
 * 
 * The @isTest class annotation indicates this class only contains test
 * methods. Classes defined with the @isTest annotation do not count against
 * the organization size limit for all Apex scripts.
 *
 * See the Apex Language Reference for more information about Testing and Code Coverage.
 */
@isTest
private class TestibusBusinessObjectsAV {

    static testMethod void myUnitTest() {
        
        ibusCzncorpComEsbBusinessobjectsAV testm=new ibusCzncorpComEsbBusinessobjectsAV();
        ibusCzncorpComEsbBusinessobjectsAV.AvailableSpeed arv=new  ibusCzncorpComEsbBusinessobjectsAV.AvailableSpeed();
        ibusCzncorpComEsbBusinessobjectsAV.PartyName aptx=new ibusCzncorpComEsbBusinessobjectsAV.PartyName();
        ibusCzncorpComEsbBusinessobjectsAV.ConnectionListType crdeit=new ibusCzncorpComEsbBusinessobjectsAV.ConnectionListType();
        ibusCzncorpComEsbBusinessobjectsAV.SimplifiedServiceAddress ptm=new ibusCzncorpComEsbBusinessobjectsAV.SimplifiedServiceAddress();
        ibusCzncorpComEsbBusinessobjectsAV.Organization cdpr=new ibusCzncorpComEsbBusinessobjectsAV.Organization();
        ibusCzncorpComEsbBusinessobjectsAV.IndividualIdentification dbcrds=new ibusCzncorpComEsbBusinessobjectsAV.IndividualIdentification();
        ibusCzncorpComEsbBusinessobjectsAV.PhoneNumberAsId crdpd=new ibusCzncorpComEsbBusinessobjectsAV.PhoneNumberAsId();
        ibusCzncorpComEsbBusinessobjectsAV.AuthorizedCustomerProxy phdetails=new ibusCzncorpComEsbBusinessobjectsAV.AuthorizedCustomerProxy();
        ibusCzncorpComEsbBusinessobjectsAV.ProcessStatus pddds=new ibusCzncorpComEsbBusinessobjectsAV.ProcessStatus();
        ibusCzncorpComEsbBusinessobjectsAV.OpticalNetworkTerminal tphs=new ibusCzncorpComEsbBusinessobjectsAV.OpticalNetworkTerminal();
        ibusCzncorpComEsbBusinessobjectsAV.SocialSecurityNrIdentification dtsenc=new ibusCzncorpComEsbBusinessobjectsAV.SocialSecurityNrIdentification();
        ibusCzncorpComEsbBusinessobjectsAV.CommonLanguageLocationId adj=new ibusCzncorpComEsbBusinessobjectsAV.CommonLanguageLocationId();
        ibusCzncorpComEsbBusinessobjectsAV.DigitalSubscriberLineAccessMultiplexer pymsc=new ibusCzncorpComEsbBusinessobjectsAV.DigitalSubscriberLineAccessMultiplexer();
        ibusCzncorpComEsbBusinessobjectsAV.GeographicAddress accsreciv=new ibusCzncorpComEsbBusinessobjectsAV.GeographicAddress();
        ibusCzncorpComEsbBusinessobjectsAV.AdditionalAddressInfo rqId=new ibusCzncorpComEsbBusinessobjectsAV.AdditionalAddressInfo();
        ibusCzncorpComEsbBusinessobjectsAV.Party qr=new ibusCzncorpComEsbBusinessobjectsAV.Party();
        ibusCzncorpComEsbBusinessobjectsAV.OpenServiceOrder crvla=new ibusCzncorpComEsbBusinessobjectsAV.OpenServiceOrder();
        ibusCzncorpComEsbBusinessobjectsAV.DriversLicenseIdentification bk=new ibusCzncorpComEsbBusinessobjectsAV.DriversLicenseIdentification();
        ibusCzncorpComEsbBusinessobjectsAV.TimePeriod bkn=new  ibusCzncorpComEsbBusinessobjectsAV.TimePeriod();
        ibusCzncorpComEsbBusinessobjectsAV.RemarkText gln=new ibusCzncorpComEsbBusinessobjectsAV.RemarkText();
        ibusCzncorpComEsbBusinessobjectsAV.MemoSection tm=new ibusCzncorpComEsbBusinessobjectsAV.MemoSection();
        ibusCzncorpComEsbBusinessobjectsAV.OrganizationName glacc=new ibusCzncorpComEsbBusinessobjectsAV.OrganizationName();
//        ibusCzncorpComEsbBusinessobjectsAV.PaymentArrangment paym=new ibusCzncorpComEsbBusinessobjectsAV.PaymentArrangment ();
        ibusCzncorpComEsbBusinessobjectsAV.LineTreatment Tx=new ibusCzncorpComEsbBusinessobjectsAV.LineTreatment();
        ibusCzncorpComEsbBusinessobjectsAV.GlobalPosition nt=new ibusCzncorpComEsbBusinessobjectsAV.GlobalPosition();
        ibusCzncorpComEsbBusinessobjectsAV.Port gac=new ibusCzncorpComEsbBusinessobjectsAV.Port();
        //ibusCzncorpComEsbBusinessobjectsAV.AccountId As=new ibusCzncorpComEsbBusinessobjectsAV.Accoundid();
        ibusCzncorpComEsbBusinessobjectsAV.Email email=new ibusCzncorpComEsbBusinessobjectsAV.email();
        ibusCzncorpComEsbBusinessobjectsAV.AddressText At=new ibusCzncorpComEsbBusinessobjectsAV.Addresstext();
        ibusCzncorpComEsbBusinessobjectsAV.Memo I=new ibusCzncorpComEsbBusinessobjectsAV.Memo();
        ibusCzncorpComEsbBusinessobjectsAV.Price cps=new ibusCzncorpComEsbBusinessobjectsAV.Price();
        ibusCzncorpComEsbBusinessobjectsAV.SalesRep nmtn=new ibusCzncorpComEsbBusinessobjectsAV.SalesRep();
        
        ibusCzncorpComEsbBusinessobjectsAV.NorthAmericanTelephoneNumber nmtn1=new ibusCzncorpComEsbBusinessobjectsAV.NorthAmericanTelephoneNumber();
        ibusCzncorpComEsbBusinessobjectsAV.TerminalKey nmt2=new ibusCzncorpComEsbBusinessobjectsAV.TerminalKey();
        ibusCzncorpComEsbBusinessobjectsAV.ServiceProvider nmt3=new ibusCzncorpComEsbBusinessobjectsAV.ServiceProvider();
        ibusCzncorpComEsbBusinessobjectsAV.ApplicableTax nmt4=new ibusCzncorpComEsbBusinessobjectsAV.ApplicableTax();
        ibusCzncorpComEsbBusinessobjectsAV.PartyIdentification nmt5=new ibusCzncorpComEsbBusinessobjectsAV.PartyIdentification();
        ibusCzncorpComEsbBusinessobjectsAV.Frog nmt6=new ibusCzncorpComEsbBusinessobjectsAV.Frog();
        ibusCzncorpComEsbBusinessobjectsAV.Duration nmt7=new ibusCzncorpComEsbBusinessobjectsAV.Duration();
        ibusCzncorpComEsbBusinessobjectsAV.ServiceProviderEmployee nmt8=new ibusCzncorpComEsbBusinessobjectsAV.ServiceProviderEmployee();
        ibusCzncorpComEsbBusinessobjectsAV.RequestAccountId nmt9=new ibusCzncorpComEsbBusinessobjectsAV.RequestAccountId();
        
        ibusCzncorpComEsbBusinessobjectsAV.Quantity n1=new ibusCzncorpComEsbBusinessobjectsAV.Quantity();
        ibusCzncorpComEsbBusinessobjectsAV.LineCardHistory n2=new ibusCzncorpComEsbBusinessobjectsAV.LineCardHistory();
        ibusCzncorpComEsbBusinessobjectsAV.Cable n3=new ibusCzncorpComEsbBusinessobjectsAV.Cable();
        ibusCzncorpComEsbBusinessobjectsAV.RelatedOrder n4=new ibusCzncorpComEsbBusinessobjectsAV.RelatedOrder();
        ibusCzncorpComEsbBusinessobjectsAV.GroupOrderInfo n5=new ibusCzncorpComEsbBusinessobjectsAV.GroupOrderInfo();
        ibusCzncorpComEsbBusinessobjectsAV.ValueNetworkRole n6=new ibusCzncorpComEsbBusinessobjectsAV.ValueNetworkRole();
        ibusCzncorpComEsbBusinessobjectsAV.Individual n7=new ibusCzncorpComEsbBusinessobjectsAV.Individual();
        ibusCzncorpComEsbBusinessobjectsAV.Error n8=new ibusCzncorpComEsbBusinessobjectsAV.Error();
        
        
        ibusCzncorpComEsbBusinessobjectsAV.BusinessInteraction nsse1=new ibusCzncorpComEsbBusinessobjectsAV.BusinessInteraction();
        ibusCzncorpComEsbBusinessobjectsAV.AmericanPropertyAddress nsse2=new ibusCzncorpComEsbBusinessobjectsAV.AmericanPropertyAddress();
        ibusCzncorpComEsbBusinessobjectsAV.FunctionOrProcessProvider nsse3=new ibusCzncorpComEsbBusinessobjectsAV.FunctionOrProcessProvider();
        ibusCzncorpComEsbBusinessobjectsAV.PartyRole nsse4=new ibusCzncorpComEsbBusinessobjectsAV.PartyRole();
        ibusCzncorpComEsbBusinessobjectsAV.PartyRoleType nsse5=new ibusCzncorpComEsbBusinessobjectsAV.PartyRoleType();
        ibusCzncorpComEsbBusinessobjectsAV.IndividualName nsse6=new ibusCzncorpComEsbBusinessobjectsAV.IndividualName();
        ibusCzncorpComEsbBusinessobjectsAV.UpsellDisqualificationReason nsse7=new ibusCzncorpComEsbBusinessobjectsAV.UpsellDisqualificationReason();

        
    }
    
    static testMethod void myunitTest2(){
        ibusCzncorpComEsbExecutioncontextAV ctx=new ibusCzncorpComEsbExecutioncontextAV();
        ibusCzncorpComEsbExecutioncontextAV.ConsumerInfo cf=new ibusCzncorpComEsbExecutioncontextAV.ConsumerInfo();
        ibusCzncorpComEsbExecutioncontextAV.ESBHeader hd=new ibusCzncorpComEsbExecutioncontextAV.ESBHeader();
        ibusCzncorpComEsbExecutioncontextAV.ProviderInfo PI=new ibusCzncorpComEsbExecutioncontextAV.ProviderInfo();
        ibusCzncorpComEsbExecutioncontextAV.TraceResults TR=new ibusCzncorpComEsbExecutioncontextAV.TraceResults();
        ibusCzncorpComEsbExecutioncontextAV.ExecutionContext ec=new ibusCzncorpComEsbExecutioncontextAV.ExecutionContext();
        ibusCzncorpComEsbExecutioncontextAV.ExecutionStatusMessage esm=new ibusCzncorpComEsbExecutioncontextAV.Executionstatusmessage();
        ibusCzncorpComEsbExecutioncontextAV.TraceResult Trr=new ibusCzncorpComEsbExecutioncontextAV.TraceResult();
        ibusCzncorpComEsbExecutioncontextAV.Tracesettings Ts=new ibusCzncorpComEsbExecutioncontextAV.TraceSettings();
        ibusCzncorpComEsbExecutioncontextAV.ExecutionStatus Es=new ibusCzncorpComEsbExecutioncontextAV.Executionstatus();
    }
    
    static testMethod void myunitTest3(){
        ibusCzncorpComEsbManageaddressAv ibz=new ibusCzncorpComEsbManageaddressAv();
        ibusCzncorpComEsbManageaddressAv.ManageAddressSearchAddressResponse mrs=new ibusCzncorpComEsbManageaddressAv.ManageAddressSearchAddressResponse();
        ibusCzncorpComEsbManageaddressAv.ManageAddressSearchAddressRequest gets=new ibusCzncorpComEsbManageaddressAv.ManageAddressSearchAddressRequest();
        ibusCzncorpComEsbManageaddressAv.ManageAddressGetAddressRequest ixz=new ibusCzncorpComEsbManageaddressAv.ManageAddressGetAddressRequest();
        ibusCzncorpComEsbManageaddressAv.SearchAddressRequestCriteria i1=new ibusCzncorpComEsbManageaddressAv.SearchAddressRequestCriteria();
        ibusCzncorpComEsbManageaddressAv.ManageAddressGetAddressResponse i2=new ibusCzncorpComEsbManageaddressAv.ManageAddressGetAddressResponse();
        ibusCzncorpComEsbManageaddressAv.GetAddressRequestCriteria i3=new ibusCzncorpComEsbManageaddressAv.GetAddressRequestCriteria();     
        
    }
}