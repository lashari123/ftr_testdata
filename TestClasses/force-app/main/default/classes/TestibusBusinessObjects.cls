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
private class TestibusBusinessObjects {

    static testMethod void myUnitTest() {
        
        ibusCzncorpComEsbBusinessobjects1 testm=new ibusCzncorpComEsbBusinessobjects1();
        ibusCzncorpComEsbBusinessobjects1.AccountsReceivableDetail arv=new  ibusCzncorpComEsbBusinessobjects1.AccountsReceivableDetail();
        ibusCzncorpComEsbBusinessobjects1.ApplicableTax aptx=new ibusCzncorpComEsbBusinessobjects1.ApplicableTax();
        ibusCzncorpComEsbBusinessobjects1.CreditCardPaymentSource crdeit=new ibusCzncorpComEsbBusinessobjects1.CreditCardPaymentSource();
        ibusCzncorpComEsbBusinessobjects1.Payment ptm=new ibusCzncorpComEsbBusinessobjects1.Payment();
        ibusCzncorpComEsbBusinessobjects1.CodeDescriptionPair cdpr=new ibusCzncorpComEsbBusinessobjects1.CodeDescriptionPair();
        ibusCzncorpComEsbBusinessobjects1.DebitCardPaymentSource dbcrds=new ibusCzncorpComEsbBusinessobjects1.DebitCardPaymentSource();
        ibusCzncorpComEsbBusinessobjects1.CurrentBillAmounts crdpd=new ibusCzncorpComEsbBusinessobjects1.CurrentBillAmounts();
        ibusCzncorpComEsbBusinessobjects1.PhoneNumberAsId phdetails=new ibusCzncorpComEsbBusinessobjects1.PhoneNumberAsId();
        ibusCzncorpComEsbBusinessobjects1.PendingAccountsReceivable pddds=new ibusCzncorpComEsbBusinessobjects1.PendingAccountsReceivable();
        ibusCzncorpComEsbBusinessobjects1.TelephoneNumber tphs=new ibusCzncorpComEsbBusinessobjects1.TelephoneNumber();
        ibusCzncorpComEsbBusinessobjects1.DataSourceEnvironment dtsenc=new ibusCzncorpComEsbBusinessobjects1.DataSourceEnvironment ();
        ibusCzncorpComEsbBusinessobjects1.Adjustment adj=new ibusCzncorpComEsbBusinessobjects1.Adjustment();
        ibusCzncorpComEsbBusinessobjects1.PaymentSource pymsc=new ibusCzncorpComEsbBusinessobjects1.PaymentSource();
        ibusCzncorpComEsbBusinessobjects1.AccountsReceivable accsreciv=new ibusCzncorpComEsbBusinessobjects1.AccountsReceivable();
        ibusCzncorpComEsbBusinessobjects1.RequestAccountId rqId=new ibusCzncorpComEsbBusinessobjects1.RequestAccountId();
        ibusCzncorpComEsbBusinessobjects1.Quantity qr=new ibusCzncorpComEsbBusinessobjects1.Quantity();
        ibusCzncorpComEsbBusinessobjects1.CharacteristicValue crvla=new ibusCzncorpComEsbBusinessobjects1.CharacteristicValue();
        ibusCzncorpComEsbBusinessobjects1.BankPaymentSource bk=new ibusCzncorpComEsbBusinessobjects1.BankPaymentSource();
        ibusCzncorpComEsbBusinessobjects1.Bank bkn=new  ibusCzncorpComEsbBusinessobjects1.Bank();
        ibusCzncorpComEsbBusinessobjects1.GLAccountingEntity gln=new ibusCzncorpComEsbBusinessobjects1.GLAccountingEntity();
        ibusCzncorpComEsbBusinessobjects1.TimePeriod tm=new ibusCzncorpComEsbBusinessobjects1.TimePeriod();
        ibusCzncorpComEsbBusinessobjects1.GLAccount glacc=new ibusCzncorpComEsbBusinessobjects1.GLAccount();
        ibusCzncorpComEsbBusinessobjects1.PaymentArrangment paym=new ibusCzncorpComEsbBusinessobjects1.PaymentArrangment ();
        ibusCzncorpComEsbBusinessobjects1.Tax Tx=new ibusCzncorpComEsbBusinessobjects1.tax();
        ibusCzncorpComEsbBusinessobjects1.Notes nt=new ibusCzncorpComEsbBusinessobjects1.notes();
        ibusCzncorpComEsbBusinessobjects1.GLAccountingCategory gac=new ibusCzncorpComEsbBusinessobjects1.GLAccountingCategory();
        //ibusCzncorpComEsbBusinessobjects1.AccountId As=new ibusCzncorpComEsbBusinessobjects1.Accoundid();
        ibusCzncorpComEsbBusinessobjects1.Email email=new ibusCzncorpComEsbBusinessobjects1.email();
        ibusCzncorpComEsbBusinessobjects1.AddressText At=new ibusCzncorpComEsbBusinessobjects1.Addresstext();
        ibusCzncorpComEsbBusinessobjects1.IndividualName I=new ibusCzncorpComEsbBusinessobjects1.Individualname();
        ibusCzncorpComEsbBusinessobjects1.CitizensPostalAddress cps=new ibusCzncorpComEsbBusinessobjects1.CitizensPostalAddress();
        ibusCzncorpComEsbBusinessobjects1.NorthAmericanTelephoneNumber nmtn=new ibusCzncorpComEsbBusinessobjects1.NorthAmericanTelephoneNumber();
        
    }
    
    static testMethod void myunitTest2(){
        ibusCzncorpComEsbExecutioncontext1 ctx=new ibusCzncorpComEsbExecutioncontext1();
        ibusCzncorpComEsbExecutioncontext1.ConsumerInfo cf=new ibusCzncorpComEsbExecutioncontext1.ConsumerInfo();
        ibusCzncorpComEsbExecutioncontext1.ESBHeader hd=new ibusCzncorpComEsbExecutioncontext1.ESBHeader();
        ibusCzncorpComEsbExecutioncontext1.ProviderInfo PI=new ibusCzncorpComEsbExecutioncontext1.ProviderInfo();
        ibusCzncorpComEsbExecutioncontext1.TraceResults TR=new ibusCzncorpComEsbExecutioncontext1.TraceResults();
        ibusCzncorpComEsbExecutioncontext1.ExecutionContext ec=new ibusCzncorpComEsbExecutioncontext1.ExecutionContext();
        ibusCzncorpComEsbExecutioncontext1.ExecutionStatusMessage esm=new ibusCzncorpComEsbExecutioncontext1.Executionstatusmessage();
        ibusCzncorpComEsbExecutioncontext1.TraceResult Trr=new ibusCzncorpComEsbExecutioncontext1.TraceResult();
        ibusCzncorpComEsbExecutioncontext1.Tracesettings Ts=new ibusCzncorpComEsbExecutioncontext1.TraceSettings();
        ibusCzncorpComEsbExecutioncontext1.ExecutionStatus Es=new ibusCzncorpComEsbExecutioncontext1.Executionstatus();
    }
    
    static testMethod void myunitTest3(){
        ibusCzncorpComEsbManagecollection1 ibz=new ibusCzncorpComEsbManagecollection1();
        ibusCzncorpComEsbManagecollection1.ManageCollectionGetAccountsReceivableResponse mrs=new ibusCzncorpComEsbManagecollection1.ManageCollectionGetAccountsReceivableResponse();
        ibusCzncorpComEsbManagecollection1.GetAccountsReceivableRequestCriteria gets=new ibusCzncorpComEsbManagecollection1.GetAccountsReceivableRequestCriteria();
        ibusCzncorpComEsbManagecollection1.ManageCollectionGetAccountsReceivableRequest ixz=new ibusCzncorpComEsbManagecollection1.ManageCollectionGetAccountsReceivableRequest();
    }
}