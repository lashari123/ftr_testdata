@isTest
public class TestWebServiceInitializer{

    
    @isTest static void testWebServiceInitialzer1() {                
            // This causes a fake response to be generated   
          
            Test.setMock(WebServiceMock.class,new WebServiceMockImpl()); 
    
              
            // Call the method that invokes a callout   
          ibusCzncorpComEsbManageprospect.ManageProspectSubmitProspectResponse objr = new ibusCzncorpComEsbManageprospect.ManageProspectSubmitProspectResponse();
             manageprospectlibraryManageprospect.ManageProspectWSExport_ManageProspectHttpPort objtest = new manageprospectlibraryManageprospect.ManageProspectWSExport_ManageProspectHttpPort();
        objtest.clientCertName_x = '';
        objtest.clientCert_x= '';
        objtest.clientCertPasswd_x= '';
        objtest.timeout_x= 0;
        //objtest.ns_map_type_info = null;
          ibusCzncorpComEsbBusinessobjects i1 = new ibusCzncorpComEsbBusinessobjects();
            ibusCzncorpComEsbBusinessobjects.SubmitProspectRequestCriteria objsibus = new ibusCzncorpComEsbBusinessobjects.SubmitProspectRequestCriteria();
            ibusCzncorpComEsbBusinessobjects.AvailableSpeed asp = new ibusCzncorpComEsbBusinessobjects.AvailableSpeed();
            asp.Value = 'asd';
            asp.VerifiedFlag = false;
            
            ibusCzncorpComEsbBusinessobjects.ConnectionListType clt = new ibusCzncorpComEsbBusinessobjects.ConnectionListType();
            ibusCzncorpComEsbBusinessobjects.SubmitProspectRequestCriteria sprc = new ibusCzncorpComEsbBusinessobjects.SubmitProspectRequestCriteria();
            sprc.Action = 'asd';
            sprc.CustomerName = 'asd';
            sprc.CustomerSegmentCode='99';
            ibusCzncorpComEsbBusinessobjects.SimplifiedServiceAddress spra = new ibusCzncorpComEsbBusinessobjects.SimplifiedServiceAddress();
            //ibusCzncorpComEsbBusinessobjects.SubmitProspectRequestCriteria sprc = new ibusCzncorpComEsbBusinessobjects.SubmitProspectRequestCriteria();
            spra.AddressName='crittenden way';
            spra.AddressLine='114';
            spra.Building='98';
            spra.Floor='2';
            spra.Room='4';
            spra.State='ny';
            spra.Zip='14623';
            spra.City='rochester';
            ibusCzncorpComEsbBusinessobjects.PhoneNumberAsId sprb = new ibusCzncorpComEsbBusinessobjects.PhoneNumberAsId();
           // ibusCzncorpComEsbBusinessobjects.SubmitProspectRequestCriteria sprc = new ibusCzncorpComEsbBusinessobjects.SubmitProspectRequestCriteria();
            //sprb.field_order_type_info='sequence number';
            ibusCzncorpComEsbBusinessobjects.UrbanPropertyAddress upAdd = new ibusCzncorpComEsbBusinessobjects.UrbanPropertyAddress();
            // ibusCzncorpComEsbBusinessobjects.SubmitProspectRequestCriteria sprc = new ibusCzncorpComEsbBusinessobjects.SubmitProspectRequestCriteria();
            upAdd.StreetName='rustic';
            upAdd.StreetType='rediential';
            upAdd.Locality='roc';
            upAdd.Postcode='14618';
            ibusCzncorpComEsbBusinessobjects.TelephoneNumber sprd = new ibusCzncorpComEsbBusinessobjects.TelephoneNumber();
           // ibusCzncorpComEsbBusinessobjects.SubmitProspectRequestCriteria sprc = new ibusCzncorpComEsbBusinessobjects.SubmitProspectRequestCriteria();
            sprd.Extension='2';
            ibusCzncorpComEsbBusinessobjects.ProcessStatus spre = new ibusCzncorpComEsbBusinessobjects.ProcessStatus();
            //ibusCzncorpComEsbBusinessobjects.SubmitProspectRequestCriteria sprc = new ibusCzncorpComEsbBusinessobjects.SubmitProspectRequestCriteria();
            spre.Code='1';
            spre.Message='hi';
            ibusCzncorpComEsbBusinessobjects.OpticalNetworkTerminal sprf = new ibusCzncorpComEsbBusinessobjects.OpticalNetworkTerminal();
            //ibusCzncorpComEsbBusinessobjects.SubmitProspectRequestCriteria sprc = new ibusCzncorpComEsbBusinessobjects.SubmitProspectRequestCriteria();
            sprf.SequenceNumber=2;
            //sprf.ManagementIpAddress=10;
            sprf.MaximumOfferingSpeed='55';
            sprf.AvailableSpeed='65';
            sprf.FiberOpticalNetworkCabinetCode='25';
            ibusCzncorpComEsbBusinessobjects.TechnologyListType sprg = new ibusCzncorpComEsbBusinessobjects.TechnologyListType();
            //ibusCzncorpComEsbBusinessobjects.SubmitProspectRequestCriteria sprc = new ibusCzncorpComEsbBusinessobjects.SubmitProspectRequestCriteria();
            //sprg.field_order_type_info='increasing';
            ibusCzncorpComEsbBusinessobjects.InternetInfoType sprh = new ibusCzncorpComEsbBusinessobjects.InternetInfoType();
            //ibusCzncorpComEsbBusinessobjects.SubmitProspectRequestCriteria sprc = new ibusCzncorpComEsbBusinessobjects.SubmitProspectRequestCriteria();
            sprh.HSIAvailableFlag= false;
            sprh.AccountSpeed='44';
            sprh.FictitiousId='abc';
            sprh.LineCardType='visa';
            sprh.OrderedSpeed='55';
            sprh.PortStatus='post';
            sprh.AvailableMaxProductSpeed='45';
            sprh.HighestAvailableSpeed='55';
            sprh.PrimaryCircuit='54';
            ibusCzncorpComEsbBusinessobjects.CommonLanguageLocationId  spri = new ibusCzncorpComEsbBusinessobjects.CommonLanguageLocationId ();
            spri.GeographicalCode='65';
            spri.GeopoliticalCode='75';
            
            ibusCzncorpComEsbBusinessobjects.DigitalSubscriberLineAccessMultiplexer sprj = new ibusCzncorpComEsbBusinessobjects.DigitalSubscriberLineAccessMultiplexer();
            sprj.ProvisioningSpeed='85';
            sprj.Device='mobile';
            ibusCzncorpComEsbBusinessobjects.GeographicAddress sprk = new ibusCzncorpComEsbBusinessobjects.GeographicAddress();
            sprk.StateOrProvince='fremont';
            sprk.Country='usa';
            ibusCzncorpComEsbBusinessobjects.CharacteristicValue sprl = new ibusCzncorpComEsbBusinessobjects.CharacteristicValue();
            sprl.Value='2';
            ibusCzncorpComEsbBusinessobjects.Terminal sprm = new ibusCzncorpComEsbBusinessobjects.Terminal();
            sprm.OfficeId='4';
            sprm.Location='michigan';
            ibusCzncorpComEsbBusinessobjects.AdditionalAddressInfo sprn = new ibusCzncorpComEsbBusinessobjects.AdditionalAddressInfo();
            ibusCzncorpComEsbBusinessobjects.OpenServiceOrder sprp = new ibusCzncorpComEsbBusinessobjects.OpenServiceOrder();
            sprp.MemberOrderType='visa';
            ibusCzncorpComEsbBusinessobjects.TimePeriod sprp1 = new ibusCzncorpComEsbBusinessobjects.TimePeriod();
            ibusCzncorpComEsbBusinessobjects.LineCard  sprp2 = new ibusCzncorpComEsbBusinessobjects.LineCard ();
            sprp2.CardStationRemarks='3';
            sprp2.CustomerName='sai';
            sprp2.LineEquipmentNumber='32';
            ibusCzncorpComEsbBusinessobjects.LineCard  sprp7 = new ibusCzncorpComEsbBusinessobjects.LineCard ();
            //sprp7.RemarkText='hi';
            ibusCzncorpComEsbBusinessobjects.MemoSection  sprp19 = new ibusCzncorpComEsbBusinessobjects.MemoSection ();
            sprp19.MemoSectionName='mounika';
            ibusCzncorpComEsbBusinessobjects.TechnologyType  sprp3 = new ibusCzncorpComEsbBusinessobjects.TechnologyType ();
            sprp3.AvailableSpeed='55';
            sprp3.CustomerType='visa';
            ibusCzncorpComEsbBusinessobjects.LineTreatment  sprp8 = new ibusCzncorpComEsbBusinessobjects.LineTreatment ();
            sprp8.LocationNumber='441';
            sprp8.SequenceNumber=2;
            ibusCzncorpComEsbBusinessobjects.GlobalPosition  sprp4 = new ibusCzncorpComEsbBusinessobjects.GlobalPosition ();
            ibusCzncorpComEsbBusinessobjects.Port   sprp5 = new ibusCzncorpComEsbBusinessobjects.Port();
            sprp5.SequenceNumber=4;
            ibusCzncorpComEsbBusinessobjects.AddressText   sprp98 = new ibusCzncorpComEsbBusinessobjects.AddressText  ();
            sprp98.SequenceNumber=4;
            ibusCzncorpComEsbBusinessobjects.Price   sprp6 = new ibusCzncorpComEsbBusinessobjects.Price  ();
            sprp6.Name='bhar';
            sprp6.CurrencyType='inr';
            ibusCzncorpComEsbBusinessobjects.Memo   sprp69= new ibusCzncorpComEsbBusinessobjects.Memo  ();
            sprp69.SequenceNumber=76;
            ibusCzncorpComEsbBusinessobjects.AddressUnit   sprp68= new ibusCzncorpComEsbBusinessobjects.AddressUnit  ();
            sprp68.SequenceNumber=98;
            ibusCzncorpComEsbBusinessobjects.OrderInfo   sprp70= new ibusCzncorpComEsbBusinessobjects.OrderInfo  ();
            ibusCzncorpComEsbBusinessobjects.NorthAmericanTelephoneNumber   sprp71= new ibusCzncorpComEsbBusinessobjects.NorthAmericanTelephoneNumber  ();
            ibusCzncorpComEsbBusinessobjects.Stage  sprp72= new ibusCzncorpComEsbBusinessobjects.Stage ();
            ibusCzncorpComEsbBusinessobjects.TerminalKey   sprp73= new ibusCzncorpComEsbBusinessobjects.TerminalKey  ();
            
            ibusCzncorpComEsbBusinessobjects.ApplicableTax   sprp74= new ibusCzncorpComEsbBusinessobjects.ApplicableTax  ();
            
            ibusCzncorpComEsbBusinessobjects.ConnectionType   sprp75= new ibusCzncorpComEsbBusinessobjects.ConnectionType  ();
            
            ibusCzncorpComEsbBusinessobjects.CitizensServiceAddress   sprp76= new ibusCzncorpComEsbBusinessobjects.CitizensServiceAddress  ();
            
            ibusCzncorpComEsbBusinessobjects.Frog   sprp77= new ibusCzncorpComEsbBusinessobjects.Frog  ();
            
            
            
            
            
            
//        objtest.SubmitProspect()
        ibusCzncorpComEsbBusinessobjects.SubmitProspectRequestCriteria objibus = new ibusCzncorpComEsbBusinessobjects.SubmitProspectRequestCriteria();
        ibusCzncorpComEsbExecutioncontext.ExecutionContext objibuxcon = new ibusCzncorpComEsbExecutioncontext.ExecutionContext();
       //objr =  objtest.SubmitProspect(objibuxcon, objibus);
         ibusCzncorpComEsbExecutioncontext i2= new ibusCzncorpComEsbExecutioncontext();
          ibusCzncorpComEsbExecutioncontext.ExecutionStatus expstat =new ibusCzncorpComEsbExecutioncontext.ExecutionStatus();
          expstat.ExecutionStatusSuccessFlag= false;
          expstat.ExecutionStatusAction='expstat';
          ibusCzncorpComEsbExecutioncontext.ESBHeader esbhead = new ibusCzncorpComEsbExecutioncontext.ESBHeader();
          esbhead.Heartbeat=false;
          esbhead.TrackingID='12345';
          ibusCzncorpComEsbExecutioncontext.ProviderInfo prinfo = new ibusCzncorpComEsbExecutioncontext.ProviderInfo();
          prinfo.ID='123';
          prinfo.Name='bhargav';
          prinfo.ProviderType='seg';
          prinfo.VersionID='1';
         // prinfo.VersionDateTime= 2/15/13;
          prinfo.Description='asdfghjk';
          prinfo.Location='US';
          prinfo.TransactionID='123';
          ibusCzncorpComEsbExecutioncontext.TraceResults trce = new ibusCzncorpComEsbExecutioncontext.TraceResults();
          ibusCzncorpComEsbExecutioncontext.ConsumerInfo cinfo = new ibusCzncorpComEsbExecutioncontext.ConsumerInfo();
          cinfo.TrackingID='1223';
          cinfo.ApplicationID='1324';
          cinfo.EmployeeID='1567';
          cinfo.UserID='123';
          cinfo.TransactionID='0987';
          ibusCzncorpComEsbExecutioncontext.ExecutionContext exec = new ibusCzncorpComEsbExecutioncontext.ExecutionContext();
          ibusCzncorpComEsbExecutioncontext.TraceResult result = new ibusCzncorpComEsbExecutioncontext.TraceResult();
           result.HostName='http';
           result.Component='hello';
           result.Message='hello';
           ibusCzncorpComEsbExecutioncontext.ExecutionStatusMessage execmsg = new ibusCzncorpComEsbExecutioncontext.ExecutionStatusMessage();
           execmsg.ExecutionStatusSeverity='high';
           execmsg.ExecutionStatusSource='db';
           execmsg.ExecutionStatusSourceOperation='update';
           execmsg.ExecutionStatusCode='99';
           execmsg.ExecutionStatusDescription='happy';
           execmsg.ExecutionStatusText='apple';
           execmsg.ExecutionStatusTarget='source';
           ibusCzncorpComEsbExecutioncontext.TraceSettings trceset= new ibusCzncorpComEsbExecutioncontext.TraceSettings();
           trceset.TraceEnabled=true;
           trceset.Component='happy';
           trceset.TraceLevel='high';
           ibusCzncorpComEsbManageprospect i3= new ibusCzncorpComEsbManageprospect();
           ibusCzncorpComEsbManageprospect.ManageProspectSubmitProspectResponse mnprs= new ibusCzncorpComEsbManageprospect.ManageProspectSubmitProspectResponse();
           mnprs.CustomerNumber='12344';
           ibusCzncorpComEsbManageprospect.ManageProspectSubmitProspectRequest mnpsrq=new ibusCzncorpComEsbManageprospect.ManageProspectSubmitProspectRequest();
           manageprospectlibraryManageprospect i4= new manageprospectlibraryManageprospect();
           manageprospectlibraryManageprospect.ManageProspectWSExport_ManageProspectHttpPort mnge = new manageprospectlibraryManageprospect.ManageProspectWSExport_ManageProspectHttpPort();
           mnge.clientCertName_x='frontier';
           mnge.clientCert_x='esb';
           mnge.clientCertPasswd_x='bhb';
           mnge.timeout_x=12;  
            // Verify that a fake result is returned   
          
           // System.assertEquals('Mock response', objr );   
        }  
        
        /*    static testmethod void testWebServiceInitialzer(){
        String accountId = 'Testclass';
        String cnum = '';
        WebServiceInitializer wsi = new WebServiceInitializer();
        Account ac = new Account();
        ac.Name='test';
        ac.Legal_Zip__c='1234567890';
        ac.Legal_State__c='teststate';
        ac.Legal_Street__c='legalstree';
        ac.Phone='12345';
        insert ac;
        
        accountId = ac.id;
       cnum =  WebServiceInitializer.getResponseFromWS(accountId);
        

        }*/
}