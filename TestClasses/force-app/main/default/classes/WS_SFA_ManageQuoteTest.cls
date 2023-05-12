@isTest (SeeAllData=true)

public class WS_SFA_ManageQuoteTest {
    
    public static testMethod void manageQuote(){
        WS_SFA_ManageQuote wsm = new WS_SFA_ManageQuote();
        Account objAcc = new Account();
        objAcc.Name ='testing Name';
        objAcc.Legal_Street__c='test';
        objAcc.Legal_City__c='test';
        objAcc.Legal_State__c='test';
        objAcc.ShippingStreet='test';
        objAcc.ShippingCity='NY';
        objAcc.ShippingState='New York';
        objAcc.BillingStreet='test';
        objAcc.BillingCity='NY';
        objAcc.BillingState='New York';
            
        insert objAcc;
        
        Opportunity objOpp = new Opportunity();
        objOpp.Name ='Testing Name';
        objOpp.AccountId= objAcc.Id;
        objOpp.CloseDate = date.today();
        objOpp.StageName ='Verbal Commit';
        objOpp.Expected_Billed_Date__c = date.today();
        insert objOpp;
        
        list<RecordType> recordtypeid = [SELECT BusinessProcessId,DeveloperName,Id,Name,SobjectType FROM RecordType WHERE DeveloperName = 'SFA' AND SobjectType = 'SterlingQuote__c'];        
        SterlingQuote__c objquote = new SterlingQuote__c();
       
        objquote.Name='Testing Name';
        objquote.ExpirationDate__c=date.today();
        objquote.OpportunityId__c=objOpp.id;
        objquote.Account_Name__c= objAcc.Id;
        objquote.RecordTypeId = recordtypeid[0].Id; 
        objquote.quotetype__c = 'New'; // MGG319 8/17/2018
        //objquote.MinorLine__c = 0;
        insert objquote;
        
        ZAddress__c objzad = new ZAddress__c();
            objzad.Addressdescription__c='test';
            objzad.BuildingName__c='test';
            objzad.BuildingNumber__c='232';
            objzad.BuildingSubNumber__c='12';
            objzad.Circuit_Price_QuoteId__c='2132';
            objzad.Country__c='usa';
            objzad.Locality__c='tx';
            objzad.Networkdistance__c='10';
            objzad.NXX__c='839';
            objzad.NPA__c='972';
            objzad.Postcode__c='1234';
            objzad.ServiceControlNumber__c='123';
 // MGG319 Added following lines 8/17/2018
            objzad.isinfrontierfootprint__c = true;
            objzad.StreetNrFirst__c = '1625';
            objzad.StreetName__c = 'Any';
            objzad.StreetSubDescription__c = ' ';
            objzad.StreetSuffix__c = 'Dr';
            objzad.StreetDirection__c = 'N';
            objzad.Subdivision__c = 'None';
            objzad.stateorprovince__c='tx';
            objzad.wirecenter__c = 'XXXXXXXXXX';
            objzad.unit_number__c = '1222';
            objzad.unit_designator__c = 'Builbing 1';

   // end insert 8/17/2018
                    insert objzad;
                    system.debug('******* Zaddress :' +objzad);

        // MMG added email to select for error sending 8/17/2018
        User u = [Select Id, Name, CSR_ID__c, Email from User where Id =: UserInfo.getUserId()];
        u.CSR_ID__c = u.Id;
        update u;
        
        WS_SFA_ManageQuote.AddressUnit au = new WS_SFA_ManageQuote.AddressUnit();
        WS_SFA_ManageQuote.Exchange exc = new WS_SFA_ManageQuote.Exchange();
        
        WS_SFA_ManageQuote.CitizensServiceAddress csa = new WS_SFA_ManageQuote.CitizensServiceAddress();
        csa.Exchange = exc;//added by Shane B, 8/22/18
         
        WS_SFA_ManageQuote.CitizensPostalAddress cpa = new WS_SFA_ManageQuote.CitizensPostalAddress();
        cpa.AddressText = new List<WS_SFA_ManageQuote.AddressText>();
        
        WS_SFA_ManageQuote.AddressText adr = new WS_SFA_ManageQuote.AddressText();
        adr.addressText = '';
        adr.sequenceNumber = 34;
                
        
        WS_SFA_ManageQuote.AddressType addType = new WS_SFA_ManageQuote.AddressType();
        
        ZAddress__c zAddr = new ZAddress__c();
        SterlingQuoteItem__c qli = new SterlingQuoteItem__c();
        qli.Quantity__c = 1;
        qli.StandardMRC__c = 20;
        qli.AdjustedMRC__c = 10;//added by Shane B, 8/22/18
        qli.sterlingquote__c = objquote.Id;
        // MGG319 added  fields 8/17/2018
        qli.DiscountType__c = ' ';
        qli.isCTR__c = true;
        qli.renewal_MRR_Original__c = 20;
        qli.NetNewMRR__c = 20;
        qli.sa_unitnumber__c = ' ';
        qli.sa_unitdesignator__c = ' ';
        qli.OverallStatus__c = 'Approved';
        qli.npa__c = '972';
        qli.nxx__c = '839';
        qli.RequestedDueDateNew__c = date.today();
        qli.products__c = null;
        qli.promoexpdate__c = date.today();
        qli.promodiscountamount__c = 10;
        qli.percentagediscountamount__c = 5;
        qli.ST_addressid__c = objacc.id;
        qli.dsat_addressid__c = 'abcdefghi';
        qli.st_linekey__c = 'testValue';
        
        // End Insert 8/17/2018

        //qli.TotalPrice__c = 20;
        insert qli;
        
        zAddr.SterlingQuoteItem__c = qli.Id;
        
        WS_SFA_ManageQuote.Discount dis = new WS_SFA_ManageQuote.Discount(); 
        WS_SFA_ManageQuote.Promotion prom = new WS_SFA_ManageQuote.Promotion();
        
        WS_SFA_ManageQuote.Product prod = new WS_SFA_ManageQuote.Product();
        prod.AddressType = addType;
        addType.ServiceAddress = csa;
        addType.PostalAddress = cpa;
        prod.Discount = dis;
        prod.RequestedDueDate = date.today(); // MMG 8/21/2018

        //csa.Exchange = exc;
        prod.cpqLineNumber = '1.0';
        prod.cpqLineKey = 'testValue';
        prod.Promotion = new List<WS_SFA_ManageQuote.Promotion>();
        prod.Promotion.add(prom);
        prod.adjustedMRC = 10;//added by Shane B, 8/22/18
        
        prod.ZAddress = new List<WS_SFA_ManageQuote.AddressType>();
        prod.ZAddress.add(addType);
        
        
        WS_SFA_ManageQuote.Note noe = new WS_SFA_ManageQuote.Note();
        WS_SFA_ManageQuote.Quote quo = new WS_SFA_ManageQuote.Quote();
        WS_SFA_ManageQuote.AddressType add = new WS_SFA_ManageQuote.AddressType();
        quo.OpportunityId = objOpp.Id;
        quo.sfaQuoteId = objquote.Id;
        quo.cpqQuoteId = objquote.Id; //'';
        quo.cpqQuoteName = 'Test Quote';
        quo.cpqQuoteKey = '1234';
        quo.cpqQuoteType = 'NEW';
        quo.approvalType = '';
        quo.expediteIncluded = true;
        quo.submittedById = u.Id;
        quo.quoteStatus = '';
        quo.orderNumber = '1234';
        quo.Product = new List<WS_SFA_ManageQuote.Product>();
        quo.Product.add(prod);
        quo.Note = new List<WS_SFA_ManageQuote.Note>();
        quo.Note.add(noe);
                
        WS_SFA_ManageQuote.Request req = new WS_SFA_ManageQuote.Request();
        req.Quote = quo;
        
        //List<Promotion__c> listPromo_DELETE = new List<Promotion__c>();
            //List<Promotion__c> listPromo_INSERT = new List<Promotion__c>();
        
        
        //webservice WS_SFA_ManageQuote.Product[] Product;
        //webservice WS_SFA_ManageQuote.Note[] Note
        WS_SFA_ManageQuote.createQuote(req);
        
        WS_SFA_ManageQuote.updateQuote(req);
  
        //WS_SFA_ManageQuote.updateQuote(req);
        
        WS_SFA_ManageQuote.ExecutionStatusMessage esm = new WS_SFA_ManageQuote.ExecutionStatusMessage();
        esm.lineNumber = 20;
        esm.stackTrace = 'Example Stack Trace';
        esm.type = 'Example Exception Type';
        WS_SFA_ManageQuote.emailQuoteException(esm, 'CREATE');
        WS_SFA_ManageQuote.emailQuoteException(esm, 'UPDATE');
        
        WS_SFA_ManageQuote.emailQuoteContent(quo, 'CREATE');
        WS_SFA_ManageQuote.emailQuoteContent(quo, 'UPDATE');
       
    }
    
    
}