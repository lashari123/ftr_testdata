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
private class TestWS_ESB_BusinessObjects {

    static testMethod void myUnitTest1() {
        
        WS_ESB_BusinessObjects testm=new WS_ESB_BusinessObjects();
        WS_ESB_BusinessObjects.AvailableSpeed ass=new WS_ESB_BusinessObjects.AvailableSpeed();
        WS_ESB_BusinessObjects.PartyName pn=new WS_ESB_BusinessObjects.PartyName();
        WS_ESB_BusinessObjects.ConnectionListType clt=new WS_ESB_BusinessObjects.ConnectionListType();
        WS_ESB_BusinessObjects.SimplifiedServiceAddress ssa=new WS_ESB_BusinessObjects.SimplifiedServiceAddress();
        WS_ESB_BusinessObjects.Organization o=new WS_ESB_BusinessObjects.Organization();
        WS_ESB_BusinessObjects.IndividualIdentification ii=new WS_ESB_BusinessObjects.IndividualIdentification();
        WS_ESB_BusinessObjects.ProcessStatus ps=new WS_ESB_BusinessObjects.ProcessStatus();
        WS_ESB_BusinessObjects.OpticalNetworkTerminal ont=new WS_ESB_BusinessObjects.OpticalNetworkTerminal();
        WS_ESB_BusinessObjects.TechnologyListType tlt=new WS_ESB_BusinessObjects.TechnologyListType();
        WS_ESB_BusinessObjects.InternetInfoType iit=new WS_ESB_BusinessObjects.InternetInfoType();
        WS_ESB_BusinessObjects.SocialSecurityNrIdentification ssni=new WS_ESB_BusinessObjects.SocialSecurityNrIdentification();
        WS_ESB_BusinessObjects.GeographicAddress GA=new WS_ESB_BusinessObjects.GeographicAddress();
        WS_ESB_BusinessObjects.Terminal t=new WS_ESB_BusinessObjects.Terminal();
        WS_ESB_BusinessObjects.AdditionalAddressInfo aai=new WS_ESB_BusinessObjects.AdditionalAddressInfo();
        WS_ESB_BusinessObjects.Party p=new WS_ESB_BusinessObjects.Party();
        WS_ESB_BusinessObjects.OpenServiceOrder oso=new WS_ESB_BusinessObjects.OpenServiceOrder();
        WS_ESB_BusinessObjects.DriversLicenseIdentification dli=new WS_ESB_BusinessObjects.DriversLicenseIdentification();
        WS_ESB_BusinessObjects.LineCard lc=new WS_ESB_BusinessObjects.LineCard();
        WS_ESB_BusinessObjects.RemarkText rt=new WS_ESB_BusinessObjects.RemarkText();
        WS_ESB_BusinessObjects.MemoSection ms=new WS_ESB_BusinessObjects.MemoSection();
        WS_ESB_BusinessObjects.OrganizationName ons=new WS_ESB_BusinessObjects.OrganizationName();
        WS_ESB_BusinessObjects.TechnologyType tt=new WS_ESB_BusinessObjects.TechnologyType();
        WS_ESB_BusinessObjects.LineTreatment lt=new WS_ESB_BusinessObjects.LineTreatment();
        WS_ESB_BusinessObjects.GlobalPosition gp=new WS_ESB_BusinessObjects.GlobalPosition();
        WS_ESB_BusinessObjects.Port pp=new WS_ESB_BusinessObjects.Port();
        WS_ESB_BusinessObjects.Memo me=new WS_ESB_BusinessObjects.Memo();
        WS_ESB_BusinessObjects.Price pr=new WS_ESB_BusinessObjects.Price();
        WS_ESB_BusinessObjects.AddressUnit aui=new WS_ESB_BusinessObjects.AddressUnit();
        WS_ESB_BusinessObjects.SalesRep spp=new WS_ESB_BusinessObjects.Salesrep();
        WS_ESB_BusinessObjects.OrderInfo oi=new WS_ESB_BusinessObjects.OrderInfo();
        WS_ESB_BusinessObjects.Stage st=new WS_ESB_BusinessObjects.Stage();
        WS_ESB_BusinessObjects.TerminalKey tk=new WS_ESB_BusinessObjects.TerminalKey();
        WS_ESB_BusinessObjects.ServiceProvider spr=new WS_ESB_BusinessObjects.ServiceProvider();
        WS_ESB_BusinessObjects.CitizensServiceAddress csa=new WS_ESB_BusinessObjects.CitizensServiceAddress();
        WS_ESB_BusinessObjects.ConnectionType ct=new WS_ESB_BusinessObjects.ConnectionType();
        WS_ESB_BusinessObjects.PartyIdentification pi=new WS_ESB_BusinessObjects.PartyIdentification();
        WS_ESB_BusinessObjects.Frog fr=new WS_ESB_BusinessObjects.Frog();
        WS_ESB_BusinessObjects.Exchange exc=new WS_ESB_BusinessObjects.Exchange();
        WS_ESB_BusinessObjects.OrderType ott=new WS_ESB_BusinessObjects.OrderType();
        WS_ESB_BusinessObjects.Duration drr=new WS_ESB_BusinessObjects.Duration();
        WS_ESB_BusinessObjects.ServiceProviderEmployee spe=new WS_ESB_BusinessObjects.ServiceProviderEmployee();
        WS_ESB_BusinessObjects.LineCardHistory lch=new WS_ESB_BusinessObjects.LineCardHistory();
        WS_ESB_BusinessObjects.Cable cb=new WS_ESB_BusinessObjects.Cable();
        WS_ESB_BusinessObjects.RelatedOrder ro=new WS_ESB_BusinessObjects.RelatedOrder();
        WS_ESB_BusinessObjects.GroupOrderInfo goi=new WS_ESB_BusinessObjects.GroupOrderInfo();
        WS_ESB_BusinessObjects.ValueNetworkRole vnr=new WS_ESB_BusinessObjects.ValueNetworkRole();
        WS_ESB_BusinessObjects.Individual ind=new WS_ESB_BusinessObjects.Individual();
        WS_ESB_BusinessObjects.Error err=new WS_ESB_BusinessObjects.Error();
        WS_ESB_BusinessObjects.BusinessInteraction bi=new WS_ESB_BusinessObjects.BusinessInteraction();
        WS_ESB_BusinessObjects.AmericanPropertyAddress apa=new WS_ESB_BusinessObjects.AmericanPropertyAddress();
        WS_ESB_BusinessObjects.FunctionOrProcessProvider fopp=new WS_ESB_BusinessObjects.FunctionOrProcessProvider();
        WS_ESB_BusinessObjects.PartyRole pro=new WS_ESB_BusinessObjects.PartyRole();
        WS_ESB_BusinessObjects.PartyRoleType prt=new WS_ESB_BusinessObjects.PartyRoleType();
        WS_ESB_BusinessObjects.AddressType at=new WS_ESB_BusinessObjects.AddressType();
        WS_ESB_BusinessObjects.Line li=new WS_ESB_BusinessObjects.Line();
        WS_ESB_BusinessObjects.UpsellDisqualificationReason udr=new WS_ESB_BusinessObjects.UpsellDisqualificationReason();
        WS_ESB_BusinessObjects.AccountId ad=new WS_ESB_BusinessObjects.AccountId();
        WS_ESB_BusinessObjects.CommonLanguageLocationId cll=new WS_ESB_BusinessObjects.CommonLanguageLocationId();
        WS_ESB_BusinessObjects.DigitalSubscriberLineAccessMultiplexer dsla=new WS_ESB_BusinessObjects.DigitalSubscriberLineAccessMultiplexer();
        WS_ESB_BusinessObjects.AuthorizedCustomerProxy acp=new WS_ESB_BusinessObjects.AuthorizedCustomerProxy();
        WS_ESB_BusinessObjects.AccountsReceivableDetail arv=new  WS_ESB_BusinessObjects.AccountsReceivableDetail();
        WS_ESB_BusinessObjects.ApplicableTax aptx=new WS_ESB_BusinessObjects.ApplicableTax();
        WS_ESB_BusinessObjects.CreditCardPaymentSource crdeit=new WS_ESB_BusinessObjects.CreditCardPaymentSource();
        WS_ESB_BusinessObjects.Payment ptm=new WS_ESB_BusinessObjects.Payment();
        WS_ESB_BusinessObjects.CodeDescriptionPair cdpr=new WS_ESB_BusinessObjects.CodeDescriptionPair();
        WS_ESB_BusinessObjects.DebitCardPaymentSource dbcrds=new WS_ESB_BusinessObjects.DebitCardPaymentSource();
        WS_ESB_BusinessObjects.CurrentBillAmounts crdpd=new WS_ESB_BusinessObjects.CurrentBillAmounts();
        WS_ESB_BusinessObjects.PhoneNumberAsId phdetails=new WS_ESB_BusinessObjects.PhoneNumberAsId();
        WS_ESB_BusinessObjects.PendingAccountsReceivable pddds=new WS_ESB_BusinessObjects.PendingAccountsReceivable();
        WS_ESB_BusinessObjects.TelephoneNumber tphs=new WS_ESB_BusinessObjects.TelephoneNumber();
        WS_ESB_BusinessObjects.DataSourceEnvironment dtsenc=new WS_ESB_BusinessObjects.DataSourceEnvironment ();
        WS_ESB_BusinessObjects.Adjustment adj=new WS_ESB_BusinessObjects.Adjustment();
        WS_ESB_BusinessObjects.CustomerAccount ca=new WS_ESB_BusinessObjects.CustomerAccount();
        WS_ESB_BusinessObjects.RewardsProgram rp=new WS_ESB_BusinessObjects.RewardsProgram();
        WS_ESB_BusinessObjects.LoyaltyPointsProgram lpp=new WS_ESB_BusinessObjects.LoyaltyPointsProgram();  
        WS_ESB_BusinessObjects.OnlineBillPayProfile obp=new WS_ESB_BusinessObjects.OnlineBillPayProfile();
        WS_ESB_BusinessObjects.SecurityInfo si=new WS_ESB_BusinessObjects.SecurityInfo();
        WS_ESB_BusinessObjects.OnlineBillPayProfileHistory obpp=new WS_ESB_BusinessObjects.OnlineBillPayProfileHistory();
        WS_ESB_BusinessObjects.VideoServiceAccount vsa=new WS_ESB_BusinessObjects.VideoServiceAccount();
        WS_ESB_BusinessObjects.VideoServiceTransaction vst=new WS_ESB_BusinessObjects.VideoServiceTransaction();
        WS_ESB_BusinessObjects.CustomerVideoServiceTransaction cvst=new WS_ESB_BusinessObjects.CustomerVideoServiceTransaction();
        WS_ESB_BusinessObjects.FrontierVideoServiceTransaction fvst=new WS_ESB_BusinessObjects.FrontierVideoServiceTransaction();
        WS_ESB_BusinessObjects.AccountReceivableAging ara=new WS_ESB_BusinessObjects.AccountReceivableAging();
        WS_ESB_BusinessObjects.PaymentProfile ppp=new WS_ESB_BusinessObjects.PaymentProfile();
        WS_ESB_BusinessObjects.PaymentSource pymsc=new WS_ESB_BusinessObjects.PaymentSource();
        WS_ESB_BusinessObjects.TemporaryAccountStatus tas=new WS_ESB_BusinessObjects.TemporaryAccountStatus();
        WS_ESB_BusinessObjects.WirelessServiceAccount wsa=new WS_ESB_BusinessObjects.WirelessServiceAccount();
        WS_ESB_BusinessObjects.PartnerInfo pii=new WS_ESB_BusinessObjects.PartnerInfo();
        WS_ESB_BusinessObjects.SatelliteAccountInfo sai=new WS_ESB_BusinessObjects.SatelliteAccountInfo();
        WS_ESB_BusinessObjects.TaxInfo ti=new WS_ESB_BusinessObjects.TaxInfo();
        WS_ESB_BusinessObjects.OtherTaxCode otc=new WS_ESB_BusinessObjects.OtherTaxCode();
        WS_ESB_BusinessObjects.CustomerAccountRelationship car=new WS_ESB_BusinessObjects.CustomerAccountRelationship();
        WS_ESB_BusinessObjects.CustomerAccountReference carr=new WS_ESB_BusinessObjects.CustomerAccountReference();
        WS_ESB_BusinessObjects.CustomerCallingCard ccc=new WS_ESB_BusinessObjects.CustomerCallingCard();
        WS_ESB_BusinessObjects.DirectoryDeliveryInfo ddi=new WS_ESB_BusinessObjects.DirectoryDeliveryInfo();
        WS_ESB_BusinessObjects.OverrideDirectoryRecipient odr=new WS_ESB_BusinessObjects.OverrideDirectoryRecipient();
        WS_ESB_BusinessObjects.DirectoryListing dl=new WS_ESB_BusinessObjects.DirectoryListing();
        WS_ESB_BusinessObjects.DirectoryListingInfo dlii=new WS_ESB_BusinessObjects.DirectoryListingInfo();
        WS_ESB_BusinessObjects.DirectoryCode dc=new WS_ESB_BusinessObjects.DirectoryCode();
        WS_ESB_BusinessObjects.DirectoryListingError dle=new WS_ESB_BusinessObjects.DirectoryListingError();
        WS_ESB_BusinessObjects.TaxCertificate tc=new WS_ESB_BusinessObjects.TaxCertificate();
        WS_ESB_BusinessObjects.TaxExemption te=new WS_ESB_BusinessObjects.TaxExemption();
        WS_ESB_BusinessObjects.Product prod=new WS_ESB_BusinessObjects.Product();
        WS_ESB_BusinessObjects.TermPriceDifference tpd=new WS_ESB_BusinessObjects.TermPriceDifference();
        WS_ESB_BusinessObjects.ProductGroup pg=new WS_ESB_BusinessObjects.ProductGroup();
        WS_ESB_BusinessObjects.Package_x px=new WS_ESB_BusinessObjects.Package_x();
        WS_ESB_BusinessObjects.CustomerAccountDeposit cad=new WS_ESB_BusinessObjects.CustomerAccountDeposit();
        WS_ESB_BusinessObjects.CustomerAccountDepositDetail cadd=new WS_ESB_BusinessObjects.CustomerAccountDepositDetail();
        WS_ESB_BusinessObjects.CustomerBankAccount cba=new WS_ESB_BusinessObjects.CustomerBankAccount();
        WS_ESB_BusinessObjects.LATA lat=new WS_ESB_BusinessObjects.LATA();
        WS_ESB_BusinessObjects.Tariff tar=new WS_ESB_BusinessObjects.Tariff();
        WS_ESB_BusinessObjects.ProductCatalogInformation pci=new WS_ESB_BusinessObjects.ProductCatalogInformation();
        WS_ESB_BusinessObjects.Item it=new WS_ESB_BusinessObjects.Item();
        WS_ESB_BusinessObjects.ServiceType sty=new WS_ESB_BusinessObjects.ServiceType();
        WS_ESB_BusinessObjects.CustomerBill cbs=new WS_ESB_BusinessObjects.CustomerBill();
        WS_ESB_BusinessObjects.Promotion prom=new WS_ESB_BusinessObjects.Promotion();
        WS_ESB_BusinessObjects.DiscountedItem di=new WS_ESB_BusinessObjects.DiscountedItem();
        WS_ESB_BusinessObjects.OrderReference ord=new WS_ESB_BusinessObjects.OrderReference();
        WS_ESB_BusinessObjects.Verification ver=new WS_ESB_BusinessObjects.Verification();
        WS_ESB_BusinessObjects.VerificationEmailDates ved=new WS_ESB_BusinessObjects.VerificationEmailDates();
        WS_ESB_BusinessObjects.Customer cus=new WS_ESB_BusinessObjects.Customer();
        WS_ESB_BusinessObjects.CustomerCreditProfile ccp=new WS_ESB_BusinessObjects.CustomerCreditProfile();
        WS_ESB_BusinessObjects.AdditionalBusinessCreditInformation abci=new WS_ESB_BusinessObjects.AdditionalBusinessCreditInformation();
        WS_ESB_BusinessObjects.SpecialRemarks sr=new WS_ESB_BusinessObjects.SpecialRemarks();
        WS_ESB_BusinessObjects.BusinessEntityPartner bep=new WS_ESB_BusinessObjects.BusinessEntityPartner();
        WS_ESB_BusinessObjects.AccountInDisputeInfo aidi=new WS_ESB_BusinessObjects.AccountInDisputeInfo();
        WS_ESB_BusinessObjects.LandLord ll=new WS_ESB_BusinessObjects.LandLord();
        WS_ESB_BusinessObjects.Spouse spo=new WS_ESB_BusinessObjects.Spouse();
        WS_ESB_BusinessObjects.Employer emp=new WS_ESB_BusinessObjects.Employer();
        WS_ESB_BusinessObjects.NearestRelative nr=new WS_ESB_BusinessObjects.NearestRelative();
        WS_ESB_BusinessObjects.IndividualContact inc=new WS_ESB_BusinessObjects.IndividualContact();
        WS_ESB_BusinessObjects.ThirdPartyNotification tpn=new WS_ESB_BusinessObjects.ThirdPartyNotification();
        WS_ESB_BusinessObjects.AccountsReceivable accsreciv=new WS_ESB_BusinessObjects.AccountsReceivable();
        WS_ESB_BusinessObjects.RequestAccountId rqId=new WS_ESB_BusinessObjects.RequestAccountId();
        WS_ESB_BusinessObjects.Quantity qr=new WS_ESB_BusinessObjects.Quantity();
        WS_ESB_BusinessObjects.CharacteristicValue crvla=new WS_ESB_BusinessObjects.CharacteristicValue();
        WS_ESB_BusinessObjects.BankPaymentSource bk=new WS_ESB_BusinessObjects.BankPaymentSource();
        WS_ESB_BusinessObjects.Bank bkn=new  WS_ESB_BusinessObjects.Bank();
        WS_ESB_BusinessObjects.GLAccountingEntity gln=new WS_ESB_BusinessObjects.GLAccountingEntity();
        WS_ESB_BusinessObjects.TimePeriod tm=new WS_ESB_BusinessObjects.TimePeriod();
        WS_ESB_BusinessObjects.GLAccount glacc=new WS_ESB_BusinessObjects.GLAccount();
        WS_ESB_BusinessObjects.PaymentArrangment paym=new WS_ESB_BusinessObjects.PaymentArrangment ();
        WS_ESB_BusinessObjects.Tax Tx=new WS_ESB_BusinessObjects.tax();
        WS_ESB_BusinessObjects.Notes nt=new WS_ESB_BusinessObjects.notes();
        WS_ESB_BusinessObjects.GLAccountingCategory gac=new WS_ESB_BusinessObjects.GLAccountingCategory();
        //ibusCzncorpComEsbBusinessobjects1.AccountId As=new ibusCzncorpComEsbBusinessobjects1.Accoundid();
        WS_ESB_BusinessObjects.Email email=new WS_ESB_BusinessObjects.email();
        //WS_ESB_BusinessObjects.AddressText Ate=new WS_ESB_BusinessObjects.Addresstext();
        WS_ESB_BusinessObjects.IndividualName I=new WS_ESB_BusinessObjects.Individualname();
        WS_ESB_BusinessObjects.CitizensPostalAddress cps=new WS_ESB_BusinessObjects.CitizensPostalAddress();
        WS_ESB_BusinessObjects.NorthAmericanTelephoneNumber nmtn=new WS_ESB_BusinessObjects.NorthAmericanTelephoneNumber();
        //ESB getMEMO 
        WS_ESB_BusinessObjects.PhoneNumberAsId memoKey = new WS_ESB_BusinessObjects.PhoneNumberAsId();
        WS_ESB_BusinessObjects.MemoSection memoSec = new WS_ESB_BusinessObjects.MemoSection();
        WS_ESB_BusinessObjects.MemoFlag memoFlag =new WS_ESB_BusinessObjects.MemoFlag();
        WS_ESB_BusinessObjects.MemoAmount memoPay=new WS_ESB_BusinessObjects.MemoAmount();
        WS_ESB_BusinessObjects.MemoDate memoPayDate=new WS_ESB_BusinessObjects.MemoDate();
        WS_ESB_BusinessObjects.AccountMemo accMemo=new WS_ESB_BusinessObjects.AccountMemo();
        WS_ESB_BusinessObjects.ProspectMemo memoProspect=new WS_ESB_BusinessObjects.ProspectMemo();
        WS_ESB_BusinessObjects.BasicMemo basicMemo=new WS_ESB_BusinessObjects.BasicMemo();
        WS_ESB_BusinessObjects.CramComplaintMemo memoCram =new WS_ESB_BusinessObjects.CramComplaintMemo();
        WS_ESB_BusinessObjects.PaymentExtensionMemo memoPayExt=new WS_ESB_BusinessObjects.PaymentExtensionMemo();
        WS_ESB_BusinessObjects.RegulatoryComplaintMemo memoReg=new WS_ESB_BusinessObjects.RegulatoryComplaintMemo();
        WS_ESB_BusinessObjects.SlamComplaintMemo memoSlam=new WS_ESB_BusinessObjects.SlamComplaintMemo();
        WS_ESB_BusinessObjects.MemoField memoField=new WS_ESB_BusinessObjects.MemoField();
        WS_ESB_BusinessObjects.MemoFlagNameEnum MemoFlagNameEnum=new WS_ESB_BusinessObjects.MemoFlagNameEnum();
        WS_ESB_BusinessObjects.ProductOrder proOrder=new WS_ESB_BusinessObjects.ProductOrder();
        WS_ESB_BusinessObjects.AdjustmentDetail adjDetail=new WS_ESB_BusinessObjects.AdjustmentDetail();
        WS_ESB_BusinessObjects.CustomerPayment cusPay=new WS_ESB_BusinessObjects.CustomerPayment();
        WS_ESB_BusinessObjects.SatelliteBandwidthUsage satBand =new WS_ESB_BusinessObjects.SatelliteBandwidthUsage();
        //WS_ESB_BusinessObjects.CustomerOrder cusOrder=new WS_ESB_BusinessObjects.CustomerOrder();
        WS_ESB_BusinessObjects.AdditionalOrderInfo addInfo=new WS_ESB_BusinessObjects.AdditionalOrderInfo();
        WS_ESB_BusinessObjects.SatelliteOrderInfo satOrder=new WS_ESB_BusinessObjects.SatelliteOrderInfo();
        WS_ESB_BusinessObjects.ProjectElementSpec proEle=new WS_ESB_BusinessObjects.ProjectElementSpec();
        WS_ESB_BusinessObjects.Appointment appoint=new WS_ESB_BusinessObjects.Appointment();
        WS_ESB_BusinessObjects.AppointmentOrderId appOrder=new WS_ESB_BusinessObjects.AppointmentOrderId();
        WS_ESB_BusinessObjects.Activity_x actx=new WS_ESB_BusinessObjects.Activity_x(); 
        WS_ESB_BusinessObjects.InterceptInfo intInfo=new WS_ESB_BusinessObjects.InterceptInfo();
        WS_ESB_BusinessObjects.AppointmentContact appContatc=new WS_ESB_BusinessObjects.AppointmentContact();
        WS_ESB_BusinessObjects.ActivitySpec acts=new WS_ESB_BusinessObjects.ActivitySpec();
        WS_ESB_BusinessObjects.SpecialDirectoryRequest spcDir = new WS_ESB_BusinessObjects.SpecialDirectoryRequest();
        WS_ESB_BusinessObjects.SalesChannel salesChan = new WS_ESB_BusinessObjects.SalesChannel();
        WS_ESB_BusinessObjects.OrderInfluencer orderInf = new WS_ESB_BusinessObjects.OrderInfluencer();
        WS_ESB_BusinessObjects.AddressText addText = new WS_ESB_BusinessObjects.AddressText();
        
    }
    
    static testMethod void myunitTest2(){
        WS_ESB_ExecutionContext ctx=new WS_ESB_ExecutionContext();
        WS_ESB_ExecutionContext.ConsumerInfo cf=new WS_ESB_ExecutionContext.ConsumerInfo();
        WS_ESB_ExecutionContext.ESBHeader hd=new WS_ESB_ExecutionContext.ESBHeader();
        WS_ESB_ExecutionContext.ProviderInfo PI=new WS_ESB_ExecutionContext.ProviderInfo();
        WS_ESB_ExecutionContext.TraceResults TR=new WS_ESB_ExecutionContext.TraceResults();
        WS_ESB_ExecutionContext.ExecutionContext ec=new WS_ESB_ExecutionContext.ExecutionContext();
        WS_ESB_ExecutionContext.ExecutionStatusMessage esm=new WS_ESB_ExecutionContext.Executionstatusmessage();
        WS_ESB_ExecutionContext.TraceResult Trr=new WS_ESB_ExecutionContext.TraceResult();
        WS_ESB_ExecutionContext.Tracesettings Ts=new WS_ESB_ExecutionContext.TraceSettings();
        WS_ESB_ExecutionContext.ExecutionStatus Es=new WS_ESB_ExecutionContext.Executionstatus();
    }
    
    /*
    static testMethod void myunitTest3(){
        WS_ESB_ManageCollection ibz=new WS_ESB_ManageCollection();
        WS_ESB_ManageCollection.GetAccountsReceivable_element gar=new WS_ESB_ManageCollection.GetAccountsReceivable_element();
        WS_ESB_ManageCollection.ManageCollectionGetAccountsReceivableRequest garr=new WS_ESB_ManageCollection.ManageCollectionGetAccountsReceivableRequest();
       // WS_ESB_ManageCollection.Callout c=new WS_ESB_ManageCollection.Callout();
       WS_ESB_ManageCollection.GetAccountsReceivable_element request_x=new WS_ESB_ManageCollection.GetAccountsReceivable_element();
        WS_ESB_ManageCollection.ManageCollectionGetAccountsReceivableResponse mrs=new WS_ESB_ManageCollection.ManageCollectionGetAccountsReceivableResponse();
        WS_ESB_ManageCollection.GetAccountsReceivableRequestCriteria gets=new WS_ESB_ManageCollection.GetAccountsReceivableRequestCriteria();
        WS_ESB_ManageCollection.ManageCollectionGetAccountsReceivableRequest ixz=new WS_ESB_ManageCollection.ManageCollectionGetAccountsReceivableRequest();
    }
    */
    
    static testmethod void myunittest4(){
        WS_ESB_ManageAccount ma=new WS_ESB_ManageAccount();
        WS_ESB_ManageAccount.GetAccountRequestCriteria garc=new WS_ESB_ManageAccount.GetAccountRequestCriteria();
        WS_ESB_ManageAccount.ManageAccountGetAccountRequest mgar=new WS_ESB_ManageAccount.ManageAccountGetAccountRequest();
        WS_ESB_ManageAccount.ManageAccountGetAccountResponse mar=new WS_ESB_ManageAccount.ManageAccountGetAccountResponse();
        WS_ESB_ManageAccount.ManageAccountGetMemoRequest memoReq = new WS_ESB_ManageAccount.ManageAccountGetMemoRequest();
        WS_ESB_ManageAccount.GetMemoRequestCriteria memoReqCri = new WS_ESB_ManageAccount.GetMemoRequestCriteria();
        WS_ESB_ManageAccount.MemoCriteria memoCri = new WS_ESB_ManageAccount.MemoCriteria(); 
        WS_ESB_ManageAccount.ManageAccountGetMemoResponse memoRes =new WS_ESB_ManageAccount.ManageAccountGetMemoResponse();
        
    }
}