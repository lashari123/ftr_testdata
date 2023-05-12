global with sharing class testDPIFormat implements vlocity_cmt.VlocityOpenInterface {
    
    Map<String, Object> getCustOrderItemMap = new  Map<String, Object> ();
    String customerOrderItemStr ='';
    String commercialContractStr = '' ;

    global Boolean invokeMethod(String methodName, Map<String, Object> inputMap, Map<String, Object> outputMap, Map<String, Object> options) {
        System.debug('Enter testDPIFormat' + methodName);
        try {
            if (methodName == 'createESBSubmitGroupOrderMappingTesting') {
                return createESBSubmitGroupOrderMappingTesting(methodName, inputMap, outputMap);
            }
            return true;
        } catch (Exception ex) {
            System.debug(ex.getLineNumber() + ': ' + ex.getMessage());
            return false;
        } finally {
            System.debug('Exit testDPIFormat' + methodName);
        }
    }
        

    public Map<String, Object> getCustomerOrderItemString( List<Object> custOrderItemString ){
        System.debug('custOrderItemString size '+custOrderItemString.size());
        System.debug('custOrderItemString: '+String.valueOf(custOrderItemString.get(0)));
        Map<String, Object> custOrderStringMap = new  Map < String, Object > ();
        String action, itemQuantity, chargeType, processingDirection, prodId,lineItemSequenceNumber;
        Map < String, Object > product = new Map < String, Object > ();
        Map<String, Object> item = new Map < String, Object > ();
        if(custOrderItemString!=null){
        for (Object orderItem : custOrderItemString) {
            System.debug('OrderItem: '+orderItem);
            if(orderItem!=null){
            item = (Map<String, Object>) orderItem;
           // if(item!=null || !item.isEmpty()){
                System.debug('Item is : '+item);
            action =(String) item.get('action');
            itemQuantity = String.valueOf(item.get('quantity'));
            chargeType = (String)item.get('chargeType');
            processingDirection = (String)item.get('processingDirection');
            product =(Map < String, Object > ) item.get('product');
      //  }   
        if(product!=null){
            prodId = (String)product.get('id');
            if(prodId.equalsIgnoreCase('ADUNI')){
                custOrderStringMap.put('ProdId', prodId);
            }
            System.debug('Prod Id is '+prodId);
            lineItemSequenceNumber =(String) product.get('lineItemSequenceNumber');
        }
            //if(prodId !=null ){
            if(ftr_OrderManagementHelper.validString(prodId) && !prodId.contains('NA')){
            if(customerOrderItemStr!=null){
                customerOrderItemStr =customerOrderItemStr+'<customerOrderItem>'+
                '<action>'+action+'</action>'+
                '<quantity>'+itemQuantity+'</quantity>'+
                '<chargeType>'+chargeType+'</chargeType>'+
                '<processingDirection>'+processingDirection+'</processingDirection>'+
                '<product>'+
                '<id>'+prodId+'</id>'+
                '<lineItemSequenceNumber>'+lineItemSequenceNumber+'</lineItemSequenceNumber>'+
                '</product>'+
                '</customerOrderItem>';
            }
            }
                custOrderStringMap.put('CustOrderItemString', customerOrderItemStr);
            }
            }
            }else{ 
                System.debug('customerOrderItemStr is null');
            }
            return custOrderStringMap;
    }
    
    public String getCommercialContractString(List<Object>  commercialContractString, String schId, String contractId){
           // Map < String, Object > contractMap = new  Map < String, Object > ();
            if(commercialContractString!=null || commercialContractString.isEmpty()){
            for (Object contract : commercialContractString) {
                Map < String, Object > contractMap = new  Map < String, Object > ();
                 String   productId, contractQuantity,recAmount, nonRecAmount;
                 if(contract!=null){
                contractMap =(Map<String, Object>) contract;
              //  contractId = (String)contractMap.get('contractId');
                productId=(String)contractMap.get('productId');
                contractQuantity = (String)contractMap.get('quantity');
                Map < String, Object > monthlyRecCharge = new Map < String, Object > ();
                Map < String, Object > nonRecCharge = new Map < String, Object > ();
                monthlyRecCharge = (Map < String, Object > )contractMap.get('monthlyRecurringChargeRate');
                nonRecCharge =    (Map < String, Object > )contractMap.get('nonRecurringChargeRate'); 
                System.debug('Product ID: '+     productId);
                System.debug('monthlyRecCharge: '+String.valueOf(monthlyRecCharge));
                if(monthlyRecCharge!=null){
                    recAmount= (String)monthlyRecCharge.get('amount');
                }
                if(nonRecCharge!=null){
                    nonRecAmount= (String)nonRecCharge.get('amount');
                }
                if(ftr_OrderManagementHelper.validString(productId)){    
                if(commercialContractStr!=null){
                if(recAmount!=null){
                commercialContractStr = commercialContractStr+ ' <commercialContract>'+
                '<scheduleId>'+schId+'</scheduleId>'+
                '<contractId>'+contractId+'</contractId>'+
                '<productId>'+productId+'</productId>'+
                '<quantity>'+contractQuantity+'</quantity>'+
                '<monthlyRecurringChargeRate>'+
                '<shar:amount>'+recAmount+'</shar:amount>'+
                '</monthlyRecurringChargeRate>'+
                '</commercialContract>';
                 }
                  if(nonRecAmount!=null){
                commercialContractStr = commercialContractStr+ ' <commercialContract>'+
                '<scheduleId>'+schId+'</scheduleId>'+
                '<productId>'+productId+'</productId>'+
                '<quantity>'+contractQuantity+'</quantity>'+
                '<nonRecurringChargeRate>'+
                '<shar:amount>'+nonRecAmount+'</shar:amount>'+
                '</nonRecurringChargeRate>'+
                '</commercialContract>';
                 }
                 System.debug('commercialContractStr is ************'+commercialContractStr);
            }
            }
            }
           }
          }
        System.debug('Final commercialContractStr is ************'+commercialContractStr);
        return commercialContractStr;
    }
    
    public Boolean createESBSubmitGroupOrderMappingTesting(String methodName, Map<String, Object> input, Map<String, Object> output){
        System.debug('Input to CreateDPIRequestType: '+JSON.serialize(input));
        Map<String, String> submitGroupOrderRequestMap =new Map<String, String> ();
        Final String SalesChannelCode_TTL = '202';
        String requesttotal,billCycle, streetAddress,serviceType,streetNumber,streetName,cityName,stateAbbreviation, streetSuffix,zipCode,addressLine1, addressLine3, country, intcityName,stateOrProvince,postalCode,tradingName; 
        String OrgLocCityName,  orgStreetAdd , orgstateAbbr, orgZipCode, origLoc,termLoc, saleschannelType, contractTerm,soldOn, salesChannelPartnerId, crisId, organizationType,businessOwner, technicalContact,billToContact, managerName,techContactNum, billingContactTelephone, businessOwnerTelephone;
        Boolean isInternationalAddress;
        //String salesChannelBlock;
        try{
        Map<String, String> submitGroupOrderResponseMap = null;
        Map < String, Object > SubmitGroupOrderMember = (Map < String, Object > ) input.get('SubmitGroupOrderMember');
        System.debug('SubmitGroupOrderMember :'+SubmitGroupOrderMember);
        Map < String, Object > SubmitGroupOrderMemberInput = (Map < String, Object > ) SubmitGroupOrderMember.get('submitGroupOrderMemberInput');
        String scheduleId = (String)SubmitGroupOrderMemberInput.get('scheduleId');
        String contractId = (String)SubmitGroupOrderMemberInput.get('ContractId');
        if(contractId!=null && contractId.length()>15){ 
            contractId=contractId.substring(0, 14);
        }
        String circuitId = (String)SubmitGroupOrderMemberInput.get('circuitId');
        if(ftr_OrderManagementHelper.validString((String)SubmitGroupOrderMemberInput.get('InternationalBillAddress'))){    
        isInternationalAddress = Boolean.valueOf(SubmitGroupOrderMemberInput.get('InternationalBillAddress'));
        }
        Boolean printCircuitOnBill = True;
        Boolean printLocationOnBill =  True;
        serviceType ='EVC';
        String poOrder = (String)SubmitGroupOrderMemberInput.get('poOrder');
        String groupOrderTransactionCount =(String)SubmitGroupOrderMemberInput.get('groupOrderTransactionCount') ;
        Map < String, Object > header =(Map < String, Object > ) SubmitGroupOrderMemberInput.get('header');
        String correlationId =(String)header.get('correlationId') ;
        Map < String, Object > customerOrder =(Map < String, Object > ) SubmitGroupOrderMemberInput.get('customerOrder');
        String customerOrderType = (String)customerOrder.get('customerOrderType');
        String installationType = (String)customerOrder.get('installationType');
        List<Object> custOrderItemString =    (List<Object>) customerOrder.get('customerOrderItem');
        if(custOrderItemString!=null){
              getCustOrderItemMap = (Map < String, Object > )getCustomerOrderItemString(custOrderItemString);
                customerOrderItemStr = (String)getCustOrderItemMap.get('CustOrderItemString');
        }
        String prodId = (String)getCustOrderItemMap.get('ProdId');
            if(prodId!=null && prodId.equalsIgnoreCase('ADUNI')){
                serviceType ='ETHERNET';
            }
      //  Map < String, Object > saleschannelTypeJson = (Map < String, Object > )customerOrder.get('saleschannelType');
        String ttlNum = (String)customerOrder.get('TtlNum');
        if((String)customerOrder.get('saleschannelType') !=null){
        saleschannelType = ((String)customerOrder.get('saleschannelType')).substringBefore(' -');
        }
        salesChannelPartnerId = (String)customerOrder.get('salesChannelPartnerId');
            Map < String, Object > contract = (Map < String, Object > )customerOrder.get('contract');
            Map < String, Object > term = new  Map < String, Object > ();
            Map < String, Object > offer = new  Map < String, Object > ();
            if(contract !=null){
            term = (Map < String, Object > )contract.get('Term'); 
            offer =(Map < String, Object > )contract.get('offer');
            }
          
   
            if(term!=null){
            contractTerm = String.valueOf(term.get('termInMonths'));
            }
            if(offer!=null){
                soldOn =  (String)offer.get('soldOn');
            }
            
            
            System.debug ('contractTerm is '+ contractTerm);
             System.debug ('contractDate is '+ soldOn);
        crisId =(String)customerOrder.get('crisId');
        if(ttlNum != null){
          saleschannelType = SalesChannelCode_TTL;
          salesChannelPartnerId = ttlNum;
        }
        System.debug('Step 1');
        
        String dueDate = (String)customerOrder.get('dueDate');
        if(dueDate!=null){
         // dueDate = convertDate(dueDate);
         dueDate = dueDate+'T00:00:00';
        }
        List<Object> commercialContractString =(List<Object> ) customerOrder.get('commercialContract');
            if(commercialContractString!=null){
        commercialContractStr = getCommercialContractString(commercialContractString, scheduleId, contractId);
                }
        Map < String, Object >  provisioningDetails = (Map < String, Object > )customerOrder.get('provisioningDetails');
        Map < String, Object > circuitProvisioning = (Map < String, Object > )provisioningDetails.get('commercialCircuitProvisioning');
            System.debug('Step 2');
            if(circuitProvisioning!=null){
        OrgLocCityName =(String) circuitProvisioning.get('OrgLocCityName');
        orgStreetAdd = (String) circuitProvisioning.get('OrgLocStreetAddress');
        orgstateAbbr = (String)circuitProvisioning.get('OrgLocStateAbbreviation');
        orgZipCode = (String)circuitProvisioning.get('OrgLocZipCode');
        origLoc =orgStreetAdd +' '+ OrgLocCityName+' '+orgstateAbbr;
               if(origLoc!=null && origLoc.length()>20){
                    origLoc=origLoc.substring(0, 19);
                }  
        origLoc = origLoc.replaceAll('null', '');
        
        }
            System.debug('Step 3');
        Map < String, Object > customerAccountJson =(Map < String, Object > ) SubmitGroupOrderMemberInput.get('customerAccount');
        System.debug('customerAccountJson :'+ customerAccountJson);
        Map < String, Object > accountIdJson = (Map < String, Object > )customerAccountJson.get('accountId');
        System.debug('accountIdJson :'+ accountIdJson);
        Map < String, Object >  accTelephoneNumberJson = (Map < String, Object > )accountIdJson.get('telephoneNumber');
        String accTelNumber = (String)accTelephoneNumberJson.get('telephoneNumber');
        String accEnv = (String)accountIdJson.get('environment');
        Map < String, Object > billingAccountIdJson = (Map < String, Object > )customerAccountJson.get('billingAccountId');
        Map < String, Object >  billingTelephoneJson = (Map < String, Object > )billingAccountIdJson.get('telephoneNumber');
        String billTelNumber =(String) billingTelephoneJson.get('telephoneNumber');
        Map < String, Object >  accountServiceTypeJson = (Map < String, Object > )customerAccountJson.get('accountServiceType');
        String code = (String)accountServiceTypeJson.get('code');
        Map < String, Object >  accountPreferencesJson =(Map < String, Object > ) customerAccountJson.get('accountPreferences');
        String billHandlingCode = (String)accountPreferencesJson.get('billHandlingCode') ;
        String tollLimitCode = (String)accountPreferencesJson.get('tollLimitCode');
        Map < String, Object >  customerBillJson =(Map < String, Object > ) customerAccountJson.get('CustomerBill');
        String billDetailLevel =(String) customerBillJson.get('billDetailLevel');
        billCycle = (String) customerBillJson.get('BillCycle');
        Map < String, Object >  taxProfileJson = (Map < String, Object > )customerAccountJson.get('taxProfile');
        String isFederalTaxExempt =(String) taxProfileJson.get('isFederalTaxExempt');
        Map < String, Object >  custAccLocationJson = (Map < String, Object > )customerAccountJson.get('location');
        Map < String, Object > serviceAddrJson = (Map < String, Object > )custAccLocationJson.get('serviceAddress');
        System.debug('custAccLocationJson : '+custAccLocationJson);
        Map < String, Object > serviceAddrMasterIdJson = (Map < String, Object > )serviceAddrJson.get('serviceAddressMaterId');
        String cityAbbr =  (String)serviceAddrJson.get('cityAbbreviation') ;    
        String controlNumber, environment,sequenceNumber;
            System.debug('serviceAddrMasterIdJson : '+serviceAddrMasterIdJson);
        if(serviceAddrMasterIdJson!=null){
            controlNumber = (String)serviceAddrMasterIdJson.get('controlNumber') ;
            sequenceNumber =(String) serviceAddrMasterIdJson.get('sequenceNumber');
        }
       Map < String, Object > addressJson = (Map < String, Object > )serviceAddrJson.get('address');
       streetAddress = (String)addressJson.get('streetAddress');
            System.debug('streetAddress : '+streetAddress);
       streetNumber= streetAddress.substringBefore(' ');
      // preDirectional='S';
       streetName= streetAddress.substringAfter(' ');
       if(streetName!=null && streetName.length()>20){
         streetName = streetName.substring(0,19);  
       }
       streetSuffix =(String)addressJson.get('streetSuffix');
       cityName=(String)addressJson.get('cityName');
       stateAbbreviation =(String)addressJson.get('stateAbbreviation');
       zipCode =(String)addressJson.get('zipCode');
       String plus4 = (String)addressJson.get('plus4');
       termLoc = streetAddress+' '+ cityName +' ' +stateAbbreviation;
       termLoc = termLoc.replaceAll('null', '');
       Map < String, Object > customerJson = (Map < String, Object > )SubmitGroupOrderMemberInput.get('customer');
       Map < String, Object > individualJson =(Map < String, Object > ) customerJson.get('individual');
       if(individualJson!=null){
            String socialSecurityNumber =(String) individualJson.get('socialSecurityNumber');
            String dateOfBirth = (String) individualJson.get('dateOfBirth');
       }
         Map < String, Object > organizationJson = (Map < String, Object > )customerJson.get('organization');
            if(organizationJson!=null){
            Map < String, Object > orgNameJson = (Map < String, Object > )organizationJson.get('organizationName');
             tradingName =(String)orgNameJson.get('tradingName');
             if (tradingname.length()>30){
                tradingName = tradingName.substring(0, 29);
            }
                tradingName = tradingName.escapeXml();
            //tradingName ='AJ Test Company 1';
            Map < String, Object > contactInfoJson = (Map < String, Object > )organizationJson.get('contactInformation');
            if(contactInfoJson!=null){
                Map < String, Object > intAddrJson = (Map < String, Object > )contactInfoJson.get('internationalAddress');
                addressLine1 = (String)intAddrJson.get('addressLine1');
                country = (String)intAddrJson.get('country');
                intcityName = (String)intAddrJson.get('cityName');
                stateOrProvince = (String)intAddrJson.get('stateOrProvince');
                postalCode =(String) intAddrJson.get('postalCode');
                if(isInternationalAddress){
                    addressLine3 = intcityName +' '+stateOrProvince;
                    addressLine3 = addressLine3.replaceAll('null', '');
                    intcityName = country +' '+postalCode;
                    intcityName = intcityName.replaceAll('null', '');
                    stateOrProvince ='';
                    postalCode = '';
                }
            }
            }
           Map < String, Object > custCreditProfileJson = (Map < String, Object > )customerJson.get('customerCreditProfile');
           Map < String, Object > custCreditProfileReferenceJson = (Map < String, Object > )custCreditProfileJson.get('creditProfileReference');
           Map < String, Object > landlordJson = (Map < String, Object > )custCreditProfileReferenceJson.get('landlord');
             String landlordName,landLordTelNum;
                if(landlordJson!=null){
                landlordName = (String)landlordJson.get('name');
                landLordTelNum =(String)landlordJson.get('telephoneNumber');
                }
           Map < String, Object > businessJson =(Map < String, Object > ) custCreditProfileReferenceJson.get('business');
            if(businessJson!=null){
             organizationType = (String)businessJson.get('organizationType');
            }
           Map < String, Object > businessOwnerJson =(Map < String, Object > ) custCreditProfileReferenceJson.get('businessOwner');
            if(businessOwnerJson!=null){
               businessOwner = (String)businessOwnerJson.get('name');
                businessOwnerTelephone = (String)businessOwnerJson.get('number');
            }
           Map < String, Object > managerJson =(Map < String, Object > ) custCreditProfileReferenceJson.get('manager');
            if(managerJson!=null){
               managerName = (String)managerJson.get('name');
            }
           Map < String, Object > techContactJson =(Map < String, Object > ) custCreditProfileReferenceJson.get('TechnicalContact');
  
           if(techContactJson!=null){
           technicalContact = (String)techContactJson.get('Name');
           techContactNum = (String)techContactJson.get('telephone');
           }
           Map < String, Object > billContactJson =(Map < String, Object > ) custCreditProfileReferenceJson.get('BillToContact');
           Map < String, Object > billingContactJson = (Map < String, Object > ) custCreditProfileReferenceJson.get('BillingContact');
           if(billContactJson!=null){
           billToContact = (String)billContactJson.get('Name');
                  System.debug('Billtocontact :'+billToContact);
                 billingContactTelephone =  (String)billContactJson.get('telephone');
           }
            
           
           Map < String, Object > creditScoreJson = (Map < String, Object > )custCreditProfileJson.get('creditScore');
           String creditRating ;
                if(creditScoreJson!=null){
                  creditRating = (String)creditScoreJson.get('creditRating');
           }
           String customerType = (String)customerJson.get('customerType');
           System.debug('commercialContractStr is ********'+commercialContractStr);
           String request1 = '<soapenv:Envelope '+'xmlns:'+'soapenv="http://schemas.xmlsoap.org/soap/envelope/" '+'xmlns:cus="http://esb.frontier.com/CustomerOrderManagement" '+'xmlns:'+'shar="'+ 'http://esb.frontier.com/sharedType" '+'xmlns:'+'xsi="xsi">'+
           '<soapenv:Header/>'+
           '<soapenv:Body>'+
           '<cus:SubmitGroupOrderMember>'+
           '<submitGroupOrderMemberInput>'+
           '<header>'+
           '<shar:correlationId>'+correlationId+'</shar:correlationId>'+
           '<shar:requestingApplication>VlocityOM</shar:requestingApplication>'+
           '<securityInfo>'+
           '<userId>ftrqacomm</userId>'+
           '<employeeId>825280</employeeId>'+
           '</securityInfo>'+
           '</header>'+
           '<groupOrderTransactionCount>'+groupOrderTransactionCount+'</groupOrderTransactionCount>'+
           '<customerOrder>'+
           '<customerOrderType>'+customerOrderType+'</customerOrderType>'+
            '<salesChannelPartnerId>'+salesChannelPartnerId+'</salesChannelPartnerId>';
            String dueDateBlock =  '<dueDate>'+dueDate+'</dueDate>';
            String cridIdBlock =  '<soldBy>'+
            '<id>'+crisId+'</id>'+
            '</soldBy>';
            String salesChannelBlock =  '<saleschannelType>'+
            '<code>' + saleschannelType + '</code>'+
            '</saleschannelType>';
        String newConstructionBlock = '<isNewConstruction>true</isNewConstruction>';
  
            String afterSalesChannelBlock = '<provisioningDetails>'+
            '<commercialCircuitProvisioning>'+
            '<printCircuitOnBill>'+printCircuitOnBill+'</printCircuitOnBill>'+
            '<serviceType>'+serviceType+'</serviceType>';
            String circuitIdBlock = '<circuitId>'+circuitId+'</circuitId>';
            String circuitOLOCBlock = '<originatingAddressString>'+origLoc+'</originatingAddressString>'+
            '<originatingLocation>CUSTOMER NID</originatingLocation>'+
            '<terminatingAddressString>'+termLoc+'</terminatingAddressString>'+                  
            '<terminatingLocation>CUSTOMER PREMISE</terminatingLocation>';
            String poOrderBlock = '<purchaseOrderNumber>'+poOrder+'</purchaseOrderNumber>';
            String afterCommCirProvBlock = '<printLocationOnBill>'+printLocationOnBill+'</printLocationOnBill>'+
            '<orderStageCode>HFB</orderStageCode>'+
            '</commercialCircuitProvisioning>'+
            '</provisioningDetails>'+
            '<marketingProgram>BUSINESS</marketingProgram>';
            String contractTermBlock =   '<contract>'+
            '<term>'+
            '<termInMonths>'+contractTerm+'</termInMonths>'+
            '</term>'+
            '<offer>'+
            '<soldOn>'+soldOn+'</soldOn>'+
            '<standardMarketingPackageId>1</standardMarketingPackageId>'+
            '</offer>'+
            '<Id>'+ contractId+'</Id>'+
            '<type>CIR</type>'+
            '<scheduleId>'+scheduleId+'</scheduleId>'+
            '<marketingPackage>BUSINESS</marketingPackage>'+
             '</contract>';
            String afterContractBlock = '</customerOrder>'+
            '<customerAccount>'+
            '<accountId>'+
            '<telephoneNumber>'+
            '<telephoneNumber>'+accTelNumber+'</telephoneNumber>'+
            '</telephoneNumber>'+
            '<environment>'+accEnv+'</environment>'+
            '</accountId>'+
            '<billingAccountId>'+
            '<telephoneNumber>'+
            '<telephoneNumber>'+billTelNumber+'</telephoneNumber>'+
            '</telephoneNumber>'+
            '</billingAccountId>'+
            '<accountServiceType>'+
             '<code>'+code+'</code>'+
             '</accountServiceType>'+
             '<accountPreferences>'+
             '<billHandlingCode>'+billHandlingCode+'</billHandlingCode>'+
             '<tollLimitCode/>'+
             '</accountPreferences>'+
             '<customerBill>'+
             '<cus:billDetailLevel>'+billDetailLevel+'</cus:billDetailLevel>';
             String billCycleBlock = '<cus:BillingCycle>'+
             '<cus:billingCycleDayOfMonth>'+billCycle+'</cus:billingCycleDayOfMonth>'+
             '</cus:BillingCycle>';
  
            String afterCustomerBillBlock = '</customerBill>'+
             '<taxProfile>'+
             '<isFederalTaxExempt>'+isFederalTaxExempt+'</isFederalTaxExempt>'+
             '</taxProfile>'+
             '<location>'+
             '<serviceAddress>'+
             '<serviceAddressMaterId>'+
             '<controlNumber>'+controlNumber+'</controlNumber>'+
             '<sequenceNumber>1</sequenceNumber>'+
             '</serviceAddressMaterId>'+
             '<cityAbbreviation>'+cityAbbr+'</cityAbbreviation>'+
             '<address>'+
             '<streetNumber>'+streetNumber+'</streetNumber>'+
             '<streetName>'+streetName+'</streetName>'+
             '<streetSuffix>'+streetSuffix+'</streetSuffix>'+
             '<cityName>'+cityName+'</cityName>'+
             '<stateAbbreviation>'+stateAbbreviation+'</stateAbbreviation>'+
             '<zipCode>'+zipCode+'</zipCode>'+
             '</address>'+
             '</serviceAddress>'+
             '</location>'+
             '<directory>'+
             '<delivery>'+
             '<directoryLabelQuantity>'+
             '<amount>0</amount>'+
             '</directoryLabelQuantity>'+
             '</delivery>'+
             '<directoryListingType>NR</directoryListingType>'+
             '<directoryListingAllowance>0</directoryListingAllowance>'+
             '</directory>'+
            '</customerAccount>'+
            '<customer>'+
            '<cus:organization>'+
            '<organizationName>'+
            '<tradingName>'+tradingName+'</tradingName>'+
            '</organizationName>'+
            '<contactInformation>'+
            '<internationalAddress>'+
            '<addressLine1>'+addressLine1+'</addressLine1>';
            String intAddrLine3Block='<addressLine3>'+addressLine3+'</addressLine3>';
            String intCityBlock =  '<cityName>'+intcityName+'</cityName>';
            String intStateOrProv = '<stateOrProvince>'+stateOrProvince+'</stateOrProvince>';
            String intPostalCode =   '<postalCode>'+postalCode+'</postalCode>';
            String beforeCreditProfileRefBlock =             '</internationalAddress>'+
            '</contactInformation>'+
            '</cus:organization>'+
            '<cus:customerCreditProfile>'+
           
            '<creditProfileReference>';
            String creditProfileBusBlock =  '<business>'+
            '<organizationType>'+organizationType + '</organizationType>'+
            '</business>';
            String busOwnerBlock =  '<businessOwner>'+
            '<name>'+businessOwner+'</name>'+
                 '<telephoneNumber>'+businessOwnerTelephone+'</telephoneNumber>'+
            '</businessOwner>';
            String creditProfileMgrBlock =  '<manager>'+
            '<name>'+managerName+'</name>'+
            '</manager>';
            String creditProfileBillToContactBlock =  '<billingContact>'+
            '<name>'+billToContact+'</name>'+
                 '<telephoneNumber>'+billingContactTelephone+'</telephoneNumber>'+
            '</billingContact>';
            String creditProfileTechContactBlock =  '<technicalContact>'+
            '<name>'+technicalContact+'</name>'+
            '<telephoneNumber>'+techContactNum+'</telephoneNumber>'+
            '</technicalContact>';
            String afterCreditProfileRefBlock =   '</creditProfileReference>'+
                 '<creditScore>'+
            '<creditRating>'+creditRating+'</creditRating>'+
            '</creditScore>'+
            '</cus:customerCreditProfile>'+
            '<cus:customerType>Business</cus:customerType>'+
            '</customer>'+
            '</submitGroupOrderMemberInput>'+
            '</cus:SubmitGroupOrderMember>'+
            '</soapenv:Body>'+
            '</soapenv:Envelope>';
  
            requesttotal = request1 + customerOrderItemStr + commercialContractStr;
            if(dueDate!=null){
              requesttotal = requesttotal+dueDateBlock;
            }
            if(crisId!=null){
               requesttotal = requesttotal + cridIdBlock ;
            }
            if (saleschannelType!=null){
               requesttotal = requesttotal +  salesChannelBlock ; 
            }
            if(String.isBlank(controlNumber) || controlNumber==null){
                requesttotal = requesttotal +  newConstructionBlock;
            }
            requesttotal = requesttotal + afterSalesChannelBlock;
            if(circuitId!=null){
                requesttotal = requesttotal + circuitIdBlock;
            }
             if(dueDate!=null){
              requesttotal = requesttotal+dueDateBlock;
            }
            requesttotal = requesttotal + circuitOLOCBlock;
            if(poOrder!=null){
             requesttotal = requesttotal +   poOrderBlock;
            }
              requesttotal = requesttotal +afterCommCirProvBlock;
          //  if(contractTerm!=null){
              requesttotal = requesttotal +    contractTermBlock;
        //    }
            requesttotal = requesttotal + afterContractBlock;
            if(billCycle!=null){
            requesttotal = requesttotal + billCycleBlock;
            }
            requesttotal = requesttotal + afterCustomerBillBlock;
            if(addressLine3!=null){
             requesttotal = requesttotal +  intAddrLine3Block;
            }
            if(intcityName!=null){
              requesttotal = requesttotal + intCityBlock;    
            }
            if(stateOrProvince!=null){
              requesttotal = requesttotal + intStateOrProv;
            }
            if(postalCode!=null){
              requesttotal = requesttotal + intPostalCode;   
            }
            requesttotal = requesttotal + beforeCreditProfileRefBlock;
            if(organizationType!=null){
            requesttotal = requesttotal +  creditProfileBusBlock; 
            } 
            if(businessOwner!=null){
            requesttotal = requesttotal + busOwnerBlock;    
            }
            if(managerName!=null){
             requesttotal = requesttotal +   creditProfileMgrBlock;
            }
            if(billToContact!=null){
              requesttotal = requesttotal +  creditProfileBillToContactBlock;
            }
            if(technicalContact!=null){
              requesttotal = requesttotal +  creditProfileTechContactBlock;
            }
             requesttotal = requesttotal + afterCreditProfileRefBlock; 
           
            requesttotal = requesttotal.replaceAll('>null<', '><');
            System.debug('New design submit order request '+requesttotal );
            submitGroupOrderRequestMap.put('DpiRequestXML', requesttotal);
            submitGroupOrderRequestMap.put('transactionCount', groupOrderTransactionCount);
            output.put('submitGroupOrderRequestMap', submitGroupOrderRequestMap);
            }
        catch(Exception e){
            System.debug(e.getMessage());
        }
           return true;
     }
    
}