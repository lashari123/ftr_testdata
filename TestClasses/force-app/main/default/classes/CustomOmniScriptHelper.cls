global without sharing class CustomOmniScriptHelper implements vlocity_cmt.VlocityOpenInterface {
	global Boolean invokeMethod(String methodName, Map<String, Object> input, Map<String, Object> output, Map<String, Object> options) {
		try {
			system.debug('Enter CustomOmniScriptHelper.' + methodName);
			if (methodName == 'updateAccountStatus') {
				updateAccountStatus(input, output, options);
			} else if (methodName == 'getFilteredList') {
				getFilteredList(input, output, options);
			} else if (methodName == 'getUniqueBTNDetails') {
				getUniqueBTNDetailsByEnv(input, output, options);
			} else if (methodName == 'sendMSAEmail') {
				sendMSAEmail(input, output, options);
			} else if (methodName == 'updateOrderStage') {
				updateOrderStage(input, output, options);
			} else if (methodName == 'associateUNIs') {
				associateUNIs(input, output, options);
			} else if (methodName == 'shareServiceAccRecords') {
				shareServiceAccRecords(input, output, options);
			} else if (methodName == 'getOptionalChildProductsToAdd') {
				getOptionalChildProductsToAdd(input, output, options);
			} else if (methodName == 'search') {
				search(input, output, options);
			} else if (methodName == 'deleteRecord') {
				deleteRecord(input, output, options);
			} else if (methodName == 'addUNI') {
				addUNI(input, output, options);
			} else if (methodName == 'getRecordTypeId') {
				getRecordTypeId(input, output, options);
			} else if (methodName == 'transformGoogleAddressComponents') {
				transformGoogleAddressComponents(input, output, options);
			}

			system.debug('Exit CustomOmniScriptHelper.' + methodName);
			return true;
		} catch (Exception ex) {
			System.debug(LoggingLevel.ERROR, ex);
			System.debug(LoggingLevel.ERROR, ex.getStackTraceString());
			throw ex;
		}
	}

	private void search(Map<String, Object> input, Map<String, Object> output, Map<String, Object> options) {
		String objectName = (String) input.get('objectName');
		String searchFields = (String) input.get('searchFields');
		String returnFields = (String) input.get('returnFields');
		String searchTerm = (String) input.get('searchTerm');
		String filter = (String) input.get('filter');
		List<sObject> result = ftr_CustomLookupController.search(objectName, searchFields, returnFields, searchTerm, filter);
		output.put('result', result);
	}

	private void getRecordTypeId(Map<String, Object> input, Map<String, Object> output, Map<String, Object> options) {
		String objectName = (String) input.get('objectName');
		String recordTypeName = (String) input.get('recordTypeName');
		String recTypeId = [SELECT Id FROM RecordType WHERE SobjectType = :objectName AND Name = :recordTypeName LIMIT 1].Id;
		output.put('recordTypeId', recTypeId);
	}

	private void transformGoogleAddressComponents(Map<String, Object> input, Map<String, Object> output, Map<String, Object> options) {
		if (input.get('address_components') == null) {
			output.put('error', 'No address found.');
			return;
		}

		List<Object> addressComponents = (List<Object>) input.get('address_components');
		Map<String, String> addressMap = new Map<String, String>();
		for (Object component : addressComponents) {
			Map<String, Object> addrComponent = (Map<String, Object>) component;
			List<Object> types = (List<Object>) addrComponent.get('types');
			addressMap.put((String) types.get(0), (String) addrComponent.get('short_name'));
		}

		String address;
		if (addressMap.get('street_number') != null) {
			address = addressMap.get('street_number');
		}
		if (addressMap.get('route') != null) {
			address += ' ' + addressMap.get('route');
		}
		if (addressMap.get('subpremise') != null) {
			address += ', ' + addressMap.get('subpremise');
		}

		String city;
		if (addressMap.get('locality') != null) {
			city = addressMap.get('locality');
		} else if (addressMap.get('sublocality') != null) {
			city = addressMap.get('sublocality');
		} else if (addressMap.get('sublocality_level_1') != null) {
			city = addressMap.get('sublocality_level_1');
		} else if (addressMap.get('sublocality_level_2') != null) {
			city = addressMap.get('sublocality_level_2');
		}

		String state = addressMap.get('administrative_area_level_1');

		String zip = addressMap.get('postal_code');
		if (addressMap.get('postal_code_suffix') != null) {
			zip += addressMap.get('postal_code_suffix');
		}

		output.put('AddressLine', address);
		output.put('City', city);
		output.put('State', state);
		output.put('Zip', zip);
	}

	private void deleteRecord(Map<String, Object> input, Map<String, Object> output, Map<String, Object> options) {
		Id recordId = (Id) input.get('recordId');
		String objectName = recordId.getSobjectType().getDescribe().getName();
		sObject record = Schema.getGlobalDescribe().get(objectName).newSObject();
		record.Id = recordId;
		delete record;
	}

	private void updateAccountStatus(Map<String, Object> input, Map<String, Object> output, Map<String, Object> options) {
		String accountId = (String) input.get('AccountId');
		update new Account(Id = accountId, vlocity_cmt__Status__c = 'Active');
	}

	/**
	 * @description: returns a list of unique BTN records for a customer
	 * @params: input = { CustomerNumber: String }
	 */
	public void getUniqueBTNDetailsByEnv(Map<String, Object> input, Map<String, Object> output, Map<String, Object> options) {
		String customerNumber = (String) input.get('CustomerNumber');
		List<String> fields;
		if (input.get('fields') != null) {
			fields = ((String) input.get('fields')).split(',');
		} else {
			fields = new List<String>{
				'Id',
				'BillingCycle__c',
				'BillingTelephoneNumber__c',
				'GlobalAccountNumber__c',
				'MasterSummaryNumber__c',
				'Env__c'
			};
		}

		String query = String.format(
			'SELECT {0} FROM ftr_DPIBillingDetails__c WHERE Customer_Number__c =:customerNumber LIMIT 45000',
			new List<String>{ String.join(new List<String>(fields), ', ') }
		);

		List<SObject> records = Database.Query(query);

		input.put('records', records);
		input.put('fieldName', 'BillingTelephoneNumber__c');
		getFilteredList(input, output, options);
		Map<String, List<ftr_DPIBillingDetails__c>> result = new Map<String, List<ftr_DPIBillingDetails__c>>();
		for (Object rec : (List<Object>) output.get('filteredRecords')) {
			ftr_DPIBillingDetails__c record = (ftr_DPIBillingDetails__c) rec;
			if (result.containsKey(record.Env__c)) {
				result.get(record.Env__c).add(record);
			} else {
				result.put(record.Env__c, new List<ftr_DPIBillingDetails__c>{ record });
			}
		}
		output.put('filteredRecords', result);
	}

	/**
	 * @description: returns unique list of SObjects.
	 * @params: input = { fieldName: String, records: List<SObject> }
	 */
	public void getFilteredList(Map<String, Object> input, Map<String, Object> output, Map<String, Object> options) {
		Map<String, Object> uniqueValues = new Map<String, Object>();
		String propertyToFilter = (String) input.get('fieldName');
		List<SObject> records;
		try {
			records = (List<SObject>) input.get('records');
		} catch (Exception ex) {
			records = new List<SObject>{ (SObject) input.get('records') };
		}
		for (SObject record : records) {
			if (!uniqueValues.containsKey(String.valueOf(record.get(propertyToFilter)))) {
				uniqueValues.put(String.valueOf(record.get(propertyToFilter)), record);
			}
		}
		output.put('filteredRecords', uniqueValues.values());
	}
	private void updateOrderStage(Map<String, Object> input, Map<String, Object> output, Map<String, Object> options) {
		String orderId = (String) input.get('OrderId');
		String orderStage = (String) input.get('OrderStage');
		update new Order(Id = orderId, Order_Stage__c = orderStage);
	}

	/**
    @description: send email to MSA team when MSA Review has initiated
 */
	private void sendMSAEmail(Map<String, Object> input, Map<String, Object> output, Map<String, Object> options) {
		Group q = [SELECT Id, Email FROM Group WHERE DeveloperName = 'Managed_Services_Architect' AND Type = 'Queue'];
		if (q == null || q.Email == null)
			return;

		Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
		message.toAddresses = q.Email.split(';');
		message.setSenderDisplayName('Salesforce Ordering Notification');
		message.subject = 'SF Order ' + String.valueOf(input.get('OrderNumber')) + ' - Pending MSA Review';
		message.plaintextbody =
			'Salesforce Order ' +
			String.valueOf(input.get('OrderNumber')) +
			' is pending an MSA Review. \n\n ' +
			URL.getSalesforceBaseUrl().toExternalForm() +
			'/lightning/r/Order/' +
			String.valueOf(input.get('ContextId')) +
			'/view \n\n';
		Messaging.SingleEmailMessage[] messages = new List<Messaging.SingleEmailMessage>{ message };

		try {
			Messaging.SendEmailResult[] results = Messaging.sendEmail(messages);
			if (!results[0].success) {
				output.put('Error', results[0].errors[0].message);
			} else {
				System.debug('Email sent successfully.');
			}
		} catch (Exception e) {
			System.debug('Exception occured. Email was not sent.');
			System.debug(e.getMessage());
		}
	}

	private void associateUNIs(Map<String, Object> input, Map<String, Object> output, Map<String, Object> options) {
		if (input.get('OrderId') == null)
			return;

		String orderId = (String) input.get('OrderId');
		Map<string, OrderItem> servAccMapUNI = new Map<String, OrderItem>();
		Map<string, OrderItem> servAccMapDIA = new Map<String, OrderItem>();

		OrderItem[] oLIs = [
			SELECT Id, vlocity_cmt__ServiceAccountId__c, UNI_Host__c, ftr_PromoCode__c, Product2.ProductCode
			FROM OrderItem
			WHERE OrderId = :orderId
		];
		// this assumes 1 UNI + EIA per service location
		for (OrderItem oLI : oLIs) {
			if (oLI.Product2.ProductCode == 'ENT_ETH_UNI_0001') {
				servAccMapUNI.put(oLI.vlocity_cmt__ServiceAccountId__c, oLI);
			} else if (oLI.Product2.ProductCode == ftr_CpqService.ProductCode_EIA) {
				servAccMapDIA.put(oLI.vlocity_cmt__ServiceAccountId__c, oLI);
			}
		}
		for (String servAcc : servAccMapDIA.keySet()) {
			if (servAccMapUNI.get(servAcc) != null) {
				servAccMapDIA.get(servAcc).UNI_Host__c = servAccMapUNI.get(servAcc).Id;
			}
			if (servAccMapDIA.get(servAcc) != null) {
				servAccMapUNI.get(servAcc).ftr_PromoCode__c = servAccMapDIA.get(servAcc).ftr_PromoCode__c;
			}
		}

		update servAccMapDIA.values();
		update servAccMapUNI.values();
		update new Order(Order_Stage__c = 'AE Review', Id = orderId);
	}

	private void shareServiceAccRecords(Map<String, Object> input, Map<String, Object> output, Map<String, Object> options) {
		List<AccountShare> sharesToCreate = new List<AccountShare>();
		List<Object> lineItems;
		try {
			lineItems = (List<Object>) input.get('OrderItem');
		} catch (Exception ex) {
			lineItems = new List<Object>{ input.get('OrderItem') };
		}
		try {
			AccountShare shareObj;
			for (Object obj : lineItems) {
				Map<String, Object> tempMap = (Map<String, Object>) obj;
				if (tempMap.get('ServiceAccountId') != null) {
					shareObj = new AccountShare();
					shareObj.AccountId = (String) tempMap.get('ServiceAccountId');
					shareObj.UserOrGroupId = UserInfo.getUserId();
					shareObj.AccountAccessLevel = 'edit';
					shareObj.OpportunityAccessLevel = 'read';
					shareObj.RowCause = 'Manual';
					sharesToCreate.add(shareObj);
				}
			}
			if (!sharesToCreate.isEmpty()) {
				insert sharesToCreate;
			}
		} catch (Exception e) {
			System.debug('Exception thrown while trying to Share Service Acc Records');
			System.debug(e.getMessage());
		}
	}

	/**
	 * @description: will return a optional product from a bundle to be added
	 * @params:
	 *  input: {
	 *      ProductCode:        String - root item product code
	 *      ServiceAccountId:   String - service account id of the root item
	 *      ProductCodeToAdd:   String - product code of child needing to be added,
	 *      ContextId:          String - Quote Id
	 *  }
	 */
	private void getOptionalChildProductsToAdd(Map<String, Object> input, Map<String, Object> output, Map<String, Object> options) {
		try {
			String rootProductCode = (String) input.get('ProductCode');
			String productCodeToAdd = (String) input.get('ProductCodeToAdd');
			String rootServAccId = (String) input.get('ServiceAccountId');
			String contextId = (String) input.get('ContextId');
			String[] keysToDelete = new List<String>{
				'Attachments',
				'actions',
				'messages',
				'childProducts',
				'lineItems',
				'attributeCategories',
				'childRecords'
			};
			String sMethodName = 'getCartsItems';
			// find the parent's child products
			Map<String, Object> childProducts;
			Map<String, Object> parent = new Map<String, Object>();
			Map<String, Object> outputMap = new Map<String, Object>();
			List<Object> records;
			Map<String, Object> inputMap = new Map<String, Object>{
				'cartId' => contextId,
				'price' => false,
				'validate' => false,
				'methodName' => sMethodName
			};

			String result = String.valueOf(ftr_CpqService.invokeCpqAppHandlerMethod(sMethodName, inputMap, outputMap, options));
			if (!Test.isRunningTest()) {
				outputMap = (Map<String, Object>) JSON.deserializeUntyped(result);
			} else {
				outputMap = (Map<String, Object>) JSON.deserializeUntyped(String.valueOf(ftr_TestDataFactory.getCartsItemsOutput()));
			}

			// System.debug('outputMap: '+JSON.serialize(outputMap));

			try {
				records = (List<Object>) outputMap.get('records');
			} catch (TypeException ex) {
				records = new List<Object>{ outputMap.get('records') };
			}
			outputMap = null;
			for (Object recObj : records) {
				Map<String, Object> rec = (Map<String, Object>) recObj;

				if ((String) rec.get('ProductCode') == rootProductCode) {
					String servAccId = (String) ((Map<String, Object>) rec.get('vlocity_cmt__ServiceAccountId__r')).get('Id');
					if (servAccId == rootServAccId) {
						childProducts = (Map<String, Object>) rec.get('childProducts');

						// remove unneeded nodes
						for (String key : keysToDelete) {
							rec.remove(key);
						}
						parent.put('records', new List<Object>{ rec });
						break;
					}
				}
			}
			records = null;

			if (childProducts == null) {
				output.put('error', 'child items not found for: ' + rootProductCode);
				return;
			}
			// find the child's parameters for adding
			Map<String, Object> params;
			for (Object recObj : (List<Object>) childProducts.get('records')) {
				Map<String, Object> rec = (Map<String, Object>) recObj;

				if ((String) ((Map<String, Object>) rec.get('ProductCode')).get('value') == productCodeToAdd) {
					params = (Map<String, Object>) ((Map<String, Object>) ((Map<String, Object>) ((Map<String, Object>) (Map<String, Object>) rec.get(
									'actions'
								))
								.get('addtocart'))
							.get('remote'))
						.get('params');
				}
			}

			// add the parent item to the payload
			if (params != null) {
				((Map<String, Object>) ((List<Object>) params.get('items'))[0]).put('parentRecord', parent);
			}

			System.debug('input: ' + JSON.serialize(params));
			// add the product to the cart
			output.put('result', params);
			// vlocity_cmt.CpqAppHandler service = new vlocity_cmt.CpqAppHandler();
			// service.invokeMethod((String) params.get('methodName'), params, output, options);
		} catch (Exception e) {
			System.debug('Exception thrown while trying to add child products');
			output.put('error', e.getMessage());
			System.debug(e.getLineNumber() + ': ' + e.getMessage());
			System.debug(e.getStackTraceString());
		}
	}

	private void addUNI(Map<String, Object> input, Map<String, Object> output, Map<String, Object> options) {
		if (input.get('cartId') == null)
			return;
		String quoteId = (String) input.get('cartId');

		Map<string, QuoteLineItem> servAccMapUNI = new Map<String, QuoteLineItem>();

		Quote quoteObj = [SELECT Id, OmniscriptData__c FROM Quote WHERE Id = :quoteId];
		if (String.isBlank(quoteObj.OmniscriptData__c) || !quoteObj.OmniscriptData__c.contains('ATTR_PHY_MEDIUM')) {
			return;
		}

		String physicalMedium;
		try {
			List<Object> osData = (List<Object>) JSON.deserializeUntyped(quoteObj.OmniscriptData__c);
			Map<String, Object> osDataMap = (Map<String, Object>) osData.get(0);

			physicalMedium = (String) osDataMap.get('ATTR_PHY_MEDIUM');
		} catch (Exception e) {
			system.debug(e.getMessage());
			return;
		}
		QuoteLineItem qLI = [
			SELECT Id, vlocity_cmt__ServiceAccountId__c, Speed_Mbps__c, Speed__c, Term__c
			FROM QuoteLineItem
			WHERE QuoteId = :quoteId AND Product2.ProductCode = :ftr_CpqService.ProductCode_EIA
			LIMIT 1
		];
		try {
			QuoteLineItem uni = [
				SELECT Id
				FROM QuoteLineItem
				WHERE QuoteId = :quoteId AND Product2.ProductCode = :ftr_CpqService.ProductCode_UNI
				LIMIT 1
			];
			if (uni != null) {
				return;
			}
		} catch (Exception ex) {
			system.debug('UNI Does not exist yet: ' + ex.getMessage());
		}

		String portSpeed = '1G';
		if (qLI.Speed_Mbps__c > 1000 && qLI.Speed_Mbps__c <= 10000) {
			portSpeed = '10 GBPS';
		}

		PricebookEntry pbe = [SELECT Id FROM PricebookEntry WHERE Product2.ProductCode = :ftr_CpqService.ProductCode_UNI LIMIT 1];
		Id uniPBEId = pbe.Id;

		Map<string, Object> cpqHandlerInput = new Map<String, Object>();

		List<Map<String, Object>> items = new List<Map<String, Object>>();

		Map<String, Object> itemMap = new Map<String, Object>();

		itemMap.put('itemId', uniPBEId);
		itemMap.put('ProductCode', ftr_CpqService.ProductCode_UNI);

		Map<String, Object> fieldsToUpdate = new Map<String, Object>();
		fieldsToUpdate.put('vlocity_cmt__ServiceAccountId__c', qLI.vlocity_cmt__ServiceAccountId__c);
		fieldsToUpdate.put('Quantity', 1);
		fieldsToUpdate.put('Speed__c', qLI.Speed__c);
		itemMap.put('fieldsToUpdate', fieldsToUpdate);

		Map<String, Object> attributesToUpdate = new Map<String, Object>();

		attributesToUpdate.put('ATTR_PHY_MEDIUM', physicalMedium);
		attributesToUpdate.put('ATTR_CONTRACT_TERM', qLI.Term__c);
		attributesToUpdate.put('ATTR_PORT_SPEED', portSpeed);
		attributesToUpdate.put('ATTR_BANDWIDTH', qLI.Speed__c);

		itemMap.put('attributesToUpdate', attributesToUpdate);
		items.add(itemMap);

		system.debug('!!!!' + json.serialize(items));

		String methodName = 'postCartsItems';
		cpqHandlerInput.put('methodName', methodName);
		cpqHandlerInput.put('cartId', quoteId);
		cpqHandlerInput.put('items', items);
		cpqHandlerInput.put('price', false);
		cpqHandlerInput.put('validate', false);

		ftr_CpqService cpqHand = new ftr_CpqService();
		cpqHand.invokeMethod('invokeCpqAppHandlerMethod', cpqHandlerInput, output, options);
	}
}