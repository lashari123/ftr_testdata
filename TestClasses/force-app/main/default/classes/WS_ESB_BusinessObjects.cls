public class WS_ESB_BusinessObjects {
    
    public class AccountMemo {
        public String MemoTemplateName;
        public Integer MemoTemplateVersionId;
        public Integer SequenceNumber;
        public Boolean MemoLockedFlag;
        public String UserID;
        public DateTime CreateDateTime;
        public WS_ESB_BusinessObjects.PhoneNumberAsId Key;
        public String HashKey;
        public WS_ESB_BusinessObjects.MemoSection[] MemoSection;
        //
        public String MemoType;
        public String MemoID;
        public String MemoAction;
        public String Category;
        public String SubCategory;
        public String Name;
        public String ApplicationID;
        public String EmployeeID;
        public String EmailAddress;
        //
        public WS_ESB_BusinessObjects.MemoNote MemoNote;
        public WS_ESB_BusinessObjects.MemoFlag[] MemoFlag;
        //
        public WS_ESB_BusinessObjects.MemoAmount PaymentAmount;
        public WS_ESB_BusinessObjects.MemoDate PaymentDueDate;
        //
        transient String[] MemoTemplateName_type_info = new String[]{'MemoTemplateName','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] MemoTemplateVersionId_type_info = new String[]{'MemoTemplateVersionId','http://www.w3.org/2001/XMLSchema','int','0','1','false'  };
        transient String[] SequenceNumber_type_info = new String[]{'SequenceNumber','http://www.w3.org/2001/XMLSchema','int','0','1','false'    };
        transient String[] MemoLockedFlag_type_info = new String[]{'MemoLockedFlag','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'    };
        transient String[] UserID_type_info = new String[]{'UserID','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] CreateDateTime_type_info = new String[]{'CreateDateTime','http://www.w3.org/2001/XMLSchema','dateTime','0','1','false'   };
        transient String[] Key_type_info = new String[]{'Key','http://ibus.czncorp.com/ESB/BusinessObjects','PhoneNumberAsId','0','1','false'   };
        transient String[] HashKey_type_info = new String[]{'HashKey','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] MemoSection_type_info = new String[]{'MemoSection','http://ibus.czncorp.com/ESB/BusinessObjects','MemoSection','0','-1','false'  };
        transient String[] MemoType_type_info = new String[]{'MemoType','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] MemoID_type_info = new String[]{'MemoID','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] MemoAction_type_info = new String[]{'MemoAction','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] Category_type_info = new String[]{'Category','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] SubCategory_type_info = new String[]{'SubCategory','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] Name_type_info = new String[]{'Name','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] ApplicationID_type_info = new String[]{'ApplicationID','http://ibus.czncorp.com/ESB/BusinessObjects','string','0','1','false'};
        transient String[] EmployeeID_type_info = new String[]{'EmployeeID','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] EmailAddress_type_info = new String[]{'EmailAddress','http://ibus.czncorp.com/ESB/BusinessObjects','string','0','1','false'};
        transient String[] MemoNote_type_info = new String[]{'MemoNote','http://ibus.czncorp.com/ESB/BusinessObjects','MemoNote','0','1','false'    };
        transient String[] MemoFlag_type_info = new String[]{'MemoFlag','http://ibus.czncorp.com/ESB/BusinessObjects','MemoFlag','0','-1','false'   };
        transient String[] PaymentAmount_type_info = new String[]{'PaymentAmount','http://ibus.czncorp.com/ESB/BusinessObjects','MemoAmount','0','1','false'    };
        transient String[] PaymentDueDate_type_info = new String[]{'PaymentDueDate','http://ibus.czncorp.com/ESB/BusinessObjects','MemoDate','0','1','false'    };
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
        transient String[] field_order_type_info = new String[]{'MemoTemplateName','MemoTemplateVersionId','SequenceNumber','MemoLockedFlag','UserID','CreateDateTime','Key','HashKey','MemoSection','MemoType','MemoID','MemoAction','Category','SubCategory','Name','ApplicationID','EmployeeID','EmailAddress','MemoNote','MemoFlag','PaymentAmount','PaymentDueDate'};
    }
    
    public class ProspectMemo {
        public WS_ESB_BusinessObjects.AccountMemo[] AccountMemo;
        public String MemoType;
        public String MemoID;
        public String MemoAction;
        public String Category;
        public String SubCategory;
        public String Name;
        public String ApplicationID;
        public String EmployeeID;
        public String EmailAddress;
        transient String[] AccountMemo_type_info = new String[]{'AccountMemo','http://ibus.czncorp.com/ESB/BusinessObjects','AccountMemo','0','-1','false'  };
        transient String[] MemoType_type_info = new String[]{'MemoType','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] MemoID_type_info = new String[]{'MemoID','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] MemoAction_type_info = new String[]{'MemoAction','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] Category_type_info = new String[]{'Category','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] SubCategory_type_info = new String[]{'SubCategory','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] Name_type_info = new String[]{'Name','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] ApplicationID_type_info = new String[]{'ApplicationID','http://ibus.czncorp.com/ESB/BusinessObjects','string','0','1','false'};
        transient String[] EmployeeID_type_info = new String[]{'EmployeeID','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] EmailAddress_type_info = new String[]{'EmailAddress','http://ibus.czncorp.com/ESB/BusinessObjects','string','0','1','false'};
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
        transient String[] field_order_type_info = new String[]{'AccountMemo','MemoType','MemoID','MemoAction','Category','SubCategory','Name','ApplicationID','EmployeeID','EmailAddress'};
    }
    
    public class BasicMemo {
        public String MemoTemplateName;
        public Integer MemoTemplateVersionId;
        public Integer SequenceNumber;
        public Boolean MemoLockedFlag;
        public String UserID;
        public DateTime CreateDateTime;
        public WS_ESB_BusinessObjects.PhoneNumberAsId Key;
        public String HashKey;
        public WS_ESB_BusinessObjects.MemoSection[] MemoSection;
        transient String[] MemoTemplateName_type_info = new String[]{'MemoTemplateName','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] MemoTemplateVersionId_type_info = new String[]{'MemoTemplateVersionId','http://www.w3.org/2001/XMLSchema','int','0','1','false'  };
        transient String[] SequenceNumber_type_info = new String[]{'SequenceNumber','http://www.w3.org/2001/XMLSchema','int','0','1','false'    };
        transient String[] MemoLockedFlag_type_info = new String[]{'MemoLockedFlag','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'    };
        transient String[] UserID_type_info = new String[]{'UserID','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] CreateDateTime_type_info = new String[]{'CreateDateTime','http://www.w3.org/2001/XMLSchema','dateTime','0','1','false'   };
        transient String[] Key_type_info = new String[]{'Key','http://ibus.czncorp.com/ESB/BusinessObjects','PhoneNumberAsId','0','1','false'   };
        transient String[] HashKey_type_info = new String[]{'HashKey','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] MemoSection_type_info = new String[]{'MemoSection','http://ibus.czncorp.com/ESB/BusinessObjects','MemoSection','0','-1','false'  };
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
        transient String[] field_order_type_info = new String[]{'MemoTemplateName','MemoTemplateVersionId','SequenceNumber','MemoLockedFlag','UserID','CreateDateTime','Key','HashKey','MemoSection'};
    }
    
    public class CramComplaintMemo {
        public String MemoTemplateName;
        public Integer MemoTemplateVersionId;
        public Integer SequenceNumber;
        public Boolean MemoLockedFlag;
        public String UserID;
        public DateTime CreateDateTime;
        public WS_ESB_BusinessObjects.PhoneNumberAsId Key;
        public String HashKey;
        public WS_ESB_BusinessObjects.MemoSection[] MemoSection;
        public WS_ESB_BusinessObjects.MemoNote MemoNote;
        public WS_ESB_BusinessObjects.MemoFlag[] MemoFlag;
        transient String[] MemoTemplateName_type_info = new String[]{'MemoTemplateName','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] MemoTemplateVersionId_type_info = new String[]{'MemoTemplateVersionId','http://www.w3.org/2001/XMLSchema','int','0','1','false'  };
        transient String[] SequenceNumber_type_info = new String[]{'SequenceNumber','http://www.w3.org/2001/XMLSchema','int','0','1','false'    };
        transient String[] MemoLockedFlag_type_info = new String[]{'MemoLockedFlag','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'    };
        transient String[] UserID_type_info = new String[]{'UserID','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] CreateDateTime_type_info = new String[]{'CreateDateTime','http://www.w3.org/2001/XMLSchema','dateTime','0','1','false'   };
        transient String[] Key_type_info = new String[]{'Key','http://ibus.czncorp.com/ESB/BusinessObjects','PhoneNumberAsId','0','1','false'   };
        transient String[] HashKey_type_info = new String[]{'HashKey','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] MemoSection_type_info = new String[]{'MemoSection','http://ibus.czncorp.com/ESB/BusinessObjects','MemoSection','0','-1','false'  };
        transient String[] AccountMemo_type_info = new String[]{'AccountMemo','http://ibus.czncorp.com/ESB/BusinessObjects','AccountMemo','0','-1','false'  };
        transient String[] MemoNote_type_info = new String[]{'MemoNote','http://ibus.czncorp.com/ESB/BusinessObjects','MemoNote','0','-1','false'   };
        transient String[] MemoFlag_type_info = new String[]{'MemoFlag','http://ibus.czncorp.com/ESB/BusinessObjects','MemoFlag','0','-1','false'   };
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
        transient String[] field_order_type_info = new String[]{'MemoTemplateName','MemoTemplateVersionId','SequenceNumber','MemoLockedFlag','UserID','CreateDateTime','Key','HashKey','MemoSection','MemoNote','MemoFlag'};
    } 
    
    public class PaymentExtensionMemo {
        public String MemoTemplateName;
        public Integer MemoTemplateVersionId;
        public Integer SequenceNumber;
        public Boolean MemoLockedFlag;
        public String UserID;
        public DateTime CreateDateTime;
        public WS_ESB_BusinessObjects.PhoneNumberAsId Key;
        public String HashKey;
        public WS_ESB_BusinessObjects.MemoSection[] MemoSection;
        public WS_ESB_BusinessObjects.MemoNote MemoNote;
        public WS_ESB_BusinessObjects.MemoAmount PaymentAmount;
        public WS_ESB_BusinessObjects.MemoDate PaymentDueDate;
        transient String[] MemoTemplateName_type_info = new String[]{'MemoTemplateName','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] MemoTemplateVersionId_type_info = new String[]{'MemoTemplateVersionId','http://www.w3.org/2001/XMLSchema','int','0','1','false'  };
        transient String[] SequenceNumber_type_info = new String[]{'SequenceNumber','http://www.w3.org/2001/XMLSchema','int','0','1','false'    };
        transient String[] MemoLockedFlag_type_info = new String[]{'MemoLockedFlag','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'    };
        transient String[] UserID_type_info = new String[]{'UserID','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] CreateDateTime_type_info = new String[]{'CreateDateTime','http://www.w3.org/2001/XMLSchema','dateTime','0','1','false'   };
        transient String[] Key_type_info = new String[]{'Key','http://ibus.czncorp.com/ESB/BusinessObjects','PhoneNumberAsId','0','1','false'   };
        transient String[] HashKey_type_info = new String[]{'HashKey','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] MemoSection_type_info = new String[]{'MemoSection','http://ibus.czncorp.com/ESB/BusinessObjects','MemoSection','0','-1','false'  };
        transient String[] MemoNote_type_info = new String[]{'MemoNote','http://ibus.czncorp.com/ESB/BusinessObjects','MemoNote','0','-1','false'   };
        transient String[] PaymentAmount_type_info = new String[]{'PaymentAmount','http://ibus.czncorp.com/ESB/BusinessObjects','MemoAmount','0','-1','false'   };
        transient String[] PaymentDueDate_type_info = new String[]{'PaymentDueDate','http://ibus.czncorp.com/ESB/BusinessObjects','MemoDate','0','-1','false'   };
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
        transient String[] field_order_type_info = new String[]{'MemoTemplateName','MemoTemplateVersionId','SequenceNumber','MemoLockedFlag','UserID','CreateDateTime','Key','HashKey','MemoSection','MemoNote','PaymentAmount','PaymentDueDate'};
    
    }
    
    public class RegulatoryComplaintMemo {
        public String MemoTemplateName;
        public Integer MemoTemplateVersionId;
        public Integer SequenceNumber;
        public Boolean MemoLockedFlag;
        public String UserID;
        public DateTime CreateDateTime;
        public WS_ESB_BusinessObjects.PhoneNumberAsId Key;
        public String HashKey;
        public WS_ESB_BusinessObjects.MemoSection[] MemoSection;
        public WS_ESB_BusinessObjects.MemoNote MemoNote;
        transient String[] MemoTemplateName_type_info = new String[]{'MemoTemplateName','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] MemoTemplateVersionId_type_info = new String[]{'MemoTemplateVersionId','http://www.w3.org/2001/XMLSchema','int','0','1','false'  };
        transient String[] SequenceNumber_type_info = new String[]{'SequenceNumber','http://www.w3.org/2001/XMLSchema','int','0','1','false'    };
        transient String[] MemoLockedFlag_type_info = new String[]{'MemoLockedFlag','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'    };
        transient String[] UserID_type_info = new String[]{'UserID','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] CreateDateTime_type_info = new String[]{'CreateDateTime','http://www.w3.org/2001/XMLSchema','dateTime','0','1','false'   };
        transient String[] Key_type_info = new String[]{'Key','http://ibus.czncorp.com/ESB/BusinessObjects','PhoneNumberAsId','0','1','false'   };
        transient String[] HashKey_type_info = new String[]{'HashKey','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] MemoSection_type_info = new String[]{'MemoSection','http://ibus.czncorp.com/ESB/BusinessObjects','MemoSection','0','-1','false'  };
        transient String[] MemoNote_type_info = new String[]{'MemoNote','http://ibus.czncorp.com/ESB/BusinessObjects','MemoNote','0','-1','false'   };
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
        transient String[] field_order_type_info = new String[]{'MemoTemplateName','MemoTemplateVersionId','SequenceNumber','MemoLockedFlag','UserID','CreateDateTime','Key','HashKey','MemoSection','MemoNote'};
    }
    
    public class SlamComplaintMemo {
        public String MemoTemplateName;
        public Integer MemoTemplateVersionId;
        public Integer SequenceNumber;
        public Boolean MemoLockedFlag;
        public String UserID;
        public DateTime CreateDateTime;
        public WS_ESB_BusinessObjects.PhoneNumberAsId Key;
        public String HashKey;
        public WS_ESB_BusinessObjects.MemoSection[] MemoSection;
        public WS_ESB_BusinessObjects.MemoNote MemoNote;
        transient String[] MemoTemplateName_type_info = new String[]{'MemoTemplateName','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] MemoTemplateVersionId_type_info = new String[]{'MemoTemplateVersionId','http://www.w3.org/2001/XMLSchema','int','0','1','false'  };
        transient String[] SequenceNumber_type_info = new String[]{'SequenceNumber','http://www.w3.org/2001/XMLSchema','int','0','1','false'    };
        transient String[] MemoLockedFlag_type_info = new String[]{'MemoLockedFlag','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'    };
        transient String[] UserID_type_info = new String[]{'UserID','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] CreateDateTime_type_info = new String[]{'CreateDateTime','http://www.w3.org/2001/XMLSchema','dateTime','0','1','false'   };
        transient String[] Key_type_info = new String[]{'Key','http://ibus.czncorp.com/ESB/BusinessObjects','PhoneNumberAsId','0','1','false'   };
        transient String[] HashKey_type_info = new String[]{'HashKey','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] MemoSection_type_info = new String[]{'MemoSection','http://ibus.czncorp.com/ESB/BusinessObjects','MemoSection','0','-1','false'  };
        transient String[] MemoNote_type_info = new String[]{'MemoNote','http://ibus.czncorp.com/ESB/BusinessObjects','MemoNote','0','-1','false'   };
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
        transient String[] field_order_type_info = new String[]{'MemoTemplateName','MemoTemplateVersionId','SequenceNumber','MemoLockedFlag','UserID','CreateDateTime','Key','HashKey','MemoSection','MemoNote'};
    }
    
    public class CreateUpdateActionEnum {
    
    }
    
    public class MemoFlag {
        public Boolean EditableFlag;
        public WS_ESB_BusinessObjects.MemoFlagNameEnum[] FlagName;
        public Boolean FlagValue;
        transient String[] EditableFlag_type_info = new String[]{'EditableFlag','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        transient String[] FlagName_type_info = new String[]{'FlagName','http://ibus.czncorp.com/ESB/BusinessObjects','MemoFlagNameEnum','0','-1','false'};
        transient String[] FlagValue_type_info = new String[]{'FlagValue','http://www.w3.org/2001/XMLSchema','FlagValue','0','1','false'};
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
        transient String[] field_order_type_info = new String[]{'EditableFlag','FlagName','FlagValue'}; 
    }
    
    public class MemoField {
        public Boolean EditableFlag;
        transient String[] EditableFlag_type_info = new String[]{'EditableFlag','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
        transient String[] field_order_type_info = new String[]{'EditableFlag'};
    }
    
    public class MemoFlagNameEnum {
        public String CustomerChargedForUnOrderedProduct;
        public String CreditCardSurchargeIsMoreThanQuoted;
        public String CustomerMisunderstoodTheFunctionality;
        public String CasualDialChargeIsMoreThanQuoted;
        public String EquipmentChargeIsMoreThanQuoted;
        public String TollFreeCallCharged;
        public String CustomerMisleadedByTelemarketer;
        public String CallPlanRateNotAsQuoted;
        transient String[] CustomerChargedForUnOrderedProduct_type_info = new String[]{'CustomerChargedForUnOrderedProduct','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] CreditCardSurchargeIsMoreThanQuoted_type_info = new String[]{'MemoTemplateName','http://www.w3.org/2001/XMLSchema','string','0','1','false'  };
        transient String[] CustomerMisunderstoodTheFunctionality_type_info = new String[]{'MemoTemplateName','http://www.w3.org/2001/XMLSchema','string','0','1','false'    };
        transient String[] CasualDialChargeIsMoreThanQuoted_type_info = new String[]{'MemoTemplateName','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] EquipmentChargeIsMoreThanQuoted_type_info = new String[]{'MemoTemplateName','http://www.w3.org/2001/XMLSchema','string','0','1','false'  };
        transient String[] TollFreeCallCharged_type_info = new String[]{'MemoTemplateName','http://www.w3.org/2001/XMLSchema','string','0','1','false'  };
        transient String[] CustomerMisleadedByTelemarketer_type_info = new String[]{'MemoTemplateName','http://www.w3.org/2001/XMLSchema','string','0','1','false'  };
        transient String[] CallPlanRateNotAsQuoted_type_info = new String[]{'MemoTemplateName','http://www.w3.org/2001/XMLSchema','string','0','1','false'  };
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
        transient String[] field_order_type_info = new String[]{'CustomerChargedForUnOrderedProduct','CreditCardSurchargeIsMoreThanQuoted','CustomerMisunderstoodTheFunctionality','CasualDialChargeIsMoreThanQuoted','EquipmentChargeIsMoreThanQuoted','TollFreeCallCharged','CustomerMisleadedByTelemarketer','CustomerMisleadedByTelemarketer','CallPlanRateNotAsQuoted'};
    }
    
    public class AdjustmentDetail {
        public WS_ESB_BusinessObjects.AccountId AccountId;
        public WS_ESB_BusinessObjects.Adjustment[] Adjustment {get;set;}
        transient String[] AccountId_type_info = new String[]{'AccountId','http://ibus.czncorp.com/ESB/BusinessObjects','WS_ESB_BusinessObjects.AccountId','0','1','false'};
        transient String[] Adjustment_type_info = new String[]{'Adjustment','http://ibus.czncorp.com/ESB/BusinessObjects','Adjustment','0','-1','false'};
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
        transient String[] field_order_type_info = new String[]{'AccountId','Adjustment'};
    }
    
    public class CustomerPayment {
        public WS_ESB_BusinessObjects.AccountId AccountId;
        public WS_ESB_BusinessObjects.Payment[] Payment;
        transient String[] AccountId_type_info = new String[]{'AccountId','http://ibus.czncorp.com/ESB/BusinessObjects','WS_ESB_BusinessObjects.AccountId','0','1','false'};
        transient String[] Payment_type_info = new String[]{'Payment','http://ibus.czncorp.com/ESB/BusinessObjects','WS_ESB_BusinessObjects.Payment','0','-1','false'};
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
        transient String[] field_order_type_info = new String[]{'AccountId','Payment'};     
    }
    
    public class ProductOrder {
        public String OrderID {get;set;}
        public OrderType OrderType {get;set;}
        public CodeDescriptionPair OrderTypeClassification;
        public OrderType OrderProcessingType;
        public String OrderStatus {get;set;}
        public Stage OrderStage {get;set;}
        public Boolean RecordsOnlyFlag;
        public Boolean LockedFlag;
        public String OrderHash;
        public RemarkText OrderRemarkText;
        public OrderInfluencer IssuedBy;
        public OrderInfluencer SoldBy;
        public OrderInfluencer AssignedTo;
        public RemarkText AddressRemarkText;
        public RemarkText CustomerRemarkText;
        public Datetime OrderDate;
        public String Description;
        public Datetime OrderCompleteDate;
        public Long AssignedPriority;
        public Date AssignedResponsibilityDate;
        public Item[] Item;
        public CustomerAccount CustomerAccount {get;set;}
        public SpecialDirectoryRequest SpecialDirectoryRequest;
        public Appointment[] Appointment;
        public Memo[] OrderMemo;
        public AdditionalOrderInfo AdditionalOrderInfo;
        public Datetime LastUpdatedDateTime;
        public SatelliteOrderInfo SatelliteOrderInfo;       
        public String Action;
        public Boolean ModifiableFlag;
        public String OrderSourceOrderId;
        public InterceptInfo InterceptInfo;
        public String WrittenAuthorityRequired;
        public Datetime CreateDateTime;
        public Boolean CustomerWillAdviseFlag;
        public ApplicableTax[] ApplicableTax;
        public String ProcessingDirection;
        public String ActionReason;
        public Boolean FutureServiceAddressFlag;
        public Datetime CustomerDesiredOrderDueDate;
        public Datetime OrderDueDate;
        public String OrderJeopardyReason;
        public String DataSource;
        public String OrderStatusDescription;
        public Datetime TransactionDate;
        public String TransactionSequence;
        public String PartnerId;
        public String PartnerType;
        public Package_x Package_x;
        public ProcessStatus ProcessStatus;
        public SatelliteBandwidthUsage SatelliteBandwidthUsage;
        public GroupOrderInfo GroupOrderInfo;
        transient String[] OrderID_type_info = new String[]{'OrderID','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] OrderType_type_info = new String[]{'OrderType','http://ibus.czncorp.com/ESB/BusinessObjects','OrderType','0','1','false'};
        transient String[] OrderTypeClassification_type_info = new String[]{'OrderTypeClassification','http://ibus.czncorp.com/ESB/BusinessObjects','CodeDescriptionPair','0','1','false'};
        transient String[] OrderProcessingType_type_info = new String[]{'OrderProcessingType','http://ibus.czncorp.com/ESB/BusinessObjects','OrderType','0','1','false'};
        transient String[] OrderStatus_type_info = new String[]{'OrderStatus','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] OrderStage_type_info = new String[]{'OrderStage','http://ibus.czncorp.com/ESB/BusinessObjects','Stage','0','1','false'};
        transient String[] RecordsOnlyFlag_type_info = new String[]{'RecordsOnlyFlag','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        transient String[] LockedFlag_type_info = new String[]{'LockedFlag','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        transient String[] OrderHash_type_info = new String[]{'OrderHash','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] OrderRemarkText_type_info = new String[]{'OrderRemarkText','http://ibus.czncorp.com/ESB/BusinessObjects','RemarkText','0','1','false'};
        transient String[] IssuedBy_type_info = new String[]{'IssuedBy','http://ibus.czncorp.com/ESB/BusinessObjects','OrderInfluencer','0','1','false'};
        transient String[] SoldBy_type_info = new String[]{'SoldBy','http://ibus.czncorp.com/ESB/BusinessObjects','OrderInfluencer','0','1','false'};
        transient String[] AssignedTo_type_info = new String[]{'AssignedTo','http://ibus.czncorp.com/ESB/BusinessObjects','OrderInfluencer','0','1','false'};
        transient String[] AddressRemarkText_type_info = new String[]{'AddressRemarkText','http://ibus.czncorp.com/ESB/BusinessObjects','RemarkText','0','1','false'};
        transient String[] CustomerRemarkText_type_info = new String[]{'CustomerRemarkText','http://ibus.czncorp.com/ESB/BusinessObjects','RemarkText','0','1','false'};
        transient String[] OrderDate_type_info = new String[]{'OrderDate','http://www.w3.org/2001/XMLSchema','datetime','0','1','false'};
        transient String[] Description_type_info = new String[]{'Description','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] OrderCompleteDate_type_info = new String[]{'OrderCompleteDate','http://www.w3.org/2001/XMLSchema','datetime','0','1','false'};
        transient String[] AssignedPriority_type_info = new String[]{'AssignedPriority','http://www.w3.org/2001/XMLSchema','long','0','1','false'};
        transient String[] AssignedResponsibilityDate_type_info = new String[]{'AssignedResponsibilityDate','http://www.w3.org/2001/XMLSchema','date','0','1','false'};
        transient String[] Item_type_info = new String[]{'Item','http://ibus.czncorp.com/ESB/BusinessObjects','Item','0','-1','false'};
        transient String[] CustomerAccount_type_info = new String[]{'CustomerAccount','http://ibus.czncorp.com/ESB/BusinessObjects','CustomerAccount','0','1','false'};
        transient String[] SpecialDirectoryRequest_type_info = new String[]{'SpecialDirectoryRequest','http://ibus.czncorp.com/ESB/BusinessObjects','SpecialDirectoryRequest','0','1','false'};
        transient String[] Appointment_type_info = new String[]{'Appointment','http://ibus.czncorp.com/ESB/BusinessObjects','Appointment','0','-1','false'};
        transient String[] OrderMemo_type_info = new String[]{'OrderMemo','http://ibus.czncorp.com/ESB/BusinessObjects','Memo','0','-1','false'};
        transient String[] AdditionalOrderInfo_type_info = new String[]{'AdditionalOrderInfo','http://ibus.czncorp.com/ESB/BusinessObjects','AdditionalOrderInfo','0','1','false'};
        transient String[] LastUpdatedDateTime_type_info = new String[]{'LastUpdatedDateTime','http://www.w3.org/2001/XMLSchema','datetime','0','1','false'};
        transient String[] SatelliteOrderInfo_type_info = new String[]{'SatelliteOrderInfo','http://ibus.czncorp.com/ESB/BusinessObjects','SatelliteOrderInfo','0','1','false'};
        transient String[] Action_type_info = new String[]{'Action','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] ModifiableFlag_type_info = new String[]{'ModifiableFlag','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        transient String[] OrderSourceOrderId_type_info = new String[]{'OrderSourceOrderId','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] InterceptInfo_type_info = new String[]{'InterceptInfo','http://ibus.czncorp.com/ESB/BusinessObjects','InterceptInfo','0','1','false'};
        transient String[] WrittenAuthorityRequired_type_info = new String[]{'WrittenAuthorityRequired','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] CreateDateTime_type_info = new String[]{'CreateDateTime','http://www.w3.org/2001/XMLSchema','datetime','0','1','false'};
        transient String[] CustomerWillAdviseFlag_type_info = new String[]{'CustomerWillAdviseFlag','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        transient String[] ApplicableTax_type_info = new String[]{'ApplicableTax','http://ibus.czncorp.com/ESB/BusinessObjects','ApplicableTax','0','-1','false'};
        transient String[] ProcessingDirection_type_info = new String[]{'ProcessingDirection','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] ActionReason_type_info = new String[]{'ActionReason','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] FutureServiceAddressFlag_type_info = new String[]{'FutureServiceAddressFlag','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        transient String[] CustomerDesiredOrderDueDate_type_info = new String[]{'CustomerDesiredOrderDueDate','http://www.w3.org/2001/XMLSchema','datetime','0','1','false'};
        transient String[] OrderDueDate_type_info = new String[]{'OrderDueDate','http://www.w3.org/2001/XMLSchema','datetime','0','1','false'};
        transient String[] OrderJeopardyReason_type_info = new String[]{'OrderJeopardyReason','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] DataSource_type_info = new String[]{'DataSource','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] OrderStatusDescription_type_info = new String[]{'OrderStatusDescription','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] TransactionDate_type_info = new String[]{'TransactionDate','http://www.w3.org/2001/XMLSchema','datetime','0','1','false'};
        transient String[] TransactionSequence_type_info = new String[]{'TransactionSequence','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] PartnerId_type_info = new String[]{'PartnerId','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] PartnerType_type_info = new String[]{'PartnerType','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] Package_x_type_info = new String[]{'Package','http://ibus.czncorp.com/ESB/BusinessObjects','Package_x','0','1','false'};
        transient String[] ProcessStatus_type_info = new String[]{'ProcessStatus','http://ibus.czncorp.com/ESB/BusinessObjects','ProcessStatus','0','1','false'};
        transient String[] SatelliteBandwidthUsage_type_info = new String[]{'SatelliteBandwidthUsage','http://ibus.czncorp.com/ESB/BusinessObjects','SatelliteBandwidthUsage','0','1','false'};
        transient String[] GroupOrderInfo_type_info = new String[]{'GroupOrderInfo','http://ibus.czncorp.com/ESB/BusinessObjects','GroupOrderInfo','0','1','false'};
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
        transient String[] field_order_type_info = new String[]{'OrderID','OrderType','OrderTypeClassification','OrderProcessingType','OrderStatus','OrderStage','RecordsOnlyFlag','LockedFlag','OrderHash','OrderRemarkText','IssuedBy','SoldBy','AssignedTo','AddressRemarkText','CustomerRemarkText','OrderDate','Description','OrderCompleteDate','AssignedPriority','AssignedResponsibilityDate','Item','CustomerAccount','SpecialDirectoryRequest','Appointment','OrderMemo','AdditionalOrderInfo','LastUpdatedDateTime','SatelliteOrderInfo','Action','ModifiableFlag','OrderSourceOrderId','InterceptInfo','WrittenAuthorityRequired','CreateDateTime','CustomerWillAdviseFlag','ApplicableTax','ProcessingDirection','ActionReason','FutureServiceAddressFlag','CustomerDesiredOrderDueDate','OrderDueDate','OrderJeopardyReason','DataSource','OrderStatusDescription','TransactionDate','TransactionSequence','PartnerId','PartnerType','Package','ProcessStatus','SatelliteBandwidthUsage','GroupOrderInfo'};               
    }
    
    public class SatelliteBandwidthUsage {
        public Integer FairAccessPolicy;
        public String AddBandwidthStatus;
        public String OrderID;
        public String Message;
        public Integer TotalAnytimeBandwidth;
        public Integer RemainingAnytimeBandwidth;
        public Integer TotalBonusBandwidth;
        public Integer RemainingBonusBandwidth;
        public Integer RemainingTokenBandwidth;
        public String BandwidthResetDayOfWeek;
        public String BandwidthResetDayOfMonth;
        public String BandwidthResetHourOfDay;
        public String AdditionalBandwidthAllowed;
        public String Satellite;
        public Item[] Item;
        transient String[] FairAccessPolicy_type_info = new String[]{'FairAccessPolicy','http://www.w3.org/2001/XMLSchema','int','0','1','false'};
        transient String[] AddBandwidthStatus_type_info = new String[]{'AddBandwidthStatus','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] OrderID_type_info = new String[]{'OrderID','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] Message_type_info = new String[]{'Message','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] TotalAnytimeBandwidth_type_info = new String[]{'TotalAnytimeBandwidth','http://www.w3.org/2001/XMLSchema','int','0','1','false'};
        transient String[] RemainingAnytimeBandwidth_type_info = new String[]{'RemainingAnytimeBandwidth','http://www.w3.org/2001/XMLSchema','int','0','1','false'};
        transient String[] TotalBonusBandwidth_type_info = new String[]{'TotalBonusBandwidth','http://www.w3.org/2001/XMLSchema','int','0','1','false'};
        transient String[] RemainingBonusBandwidth_type_info = new String[]{'RemainingBonusBandwidth','http://www.w3.org/2001/XMLSchema','int','0','1','false'};
        transient String[] RemainingTokenBandwidth_type_info = new String[]{'RemainingTokenBandwidth','http://www.w3.org/2001/XMLSchema','int','0','1','false'};
        transient String[] BandwidthResetDayOfWeek_type_info = new String[]{'BandwidthResetDayOfWeek','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] BandwidthResetDayOfMonth_type_info = new String[]{'BandwidthResetDayOfMonth','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] BandwidthResetHourOfDay_type_info = new String[]{'BandwidthResetHourOfDay','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] AdditionalBandwidthAllowed_type_info = new String[]{'AdditionalBandwidthAllowed','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] Satellite_type_info = new String[]{'Satellite','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] Item_type_info = new String[]{'Item','http://ibus.czncorp.com/ESB/BusinessObjects','Item','0','-1','false'};
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
        transient String[] field_order_type_info = new String[]{'FairAccessPolicy','AddBandwidthStatus','OrderID','Message','TotalAnytimeBandwidth','RemainingAnytimeBandwidth','TotalBonusBandwidth','RemainingBonusBandwidth','RemainingTokenBandwidth','BandwidthResetDayOfWeek','BandwidthResetDayOfMonth','BandwidthResetHourOfDay','AdditionalBandwidthAllowed','Satellite','Item'};      
    }
    
    public class InterceptInfo {
        public TelephoneNumber TelephoneNumber;
        public TimePeriod TimePeriod;
        transient String[] TelephoneNumber_type_info = new String[]{'TelephoneNumber','http://ibus.czncorp.com/ESB/BusinessObjects','TelephoneNumber','0','1','false'};
        transient String[] TimePeriod_type_info = new String[]{'TimePeriod','http://ibus.czncorp.com/ESB/BusinessObjects','TimePeriod','0','1','false'};
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
        transient String[] field_order_type_info = new String[]{'TelephoneNumber','TimePeriod'};        
    }
    
    //added by Sunil Shrestha 09/14/2015 for the changes in ManageAccount.getAccount() response
    public class PSROrderInfo {
        public string CustomerAccountNumber;
        public IndividualName OrderedByName;
        public string OrderedByTelephoneNumber;
        public string PurchaseOrderNumber;
        public string RelatedPurchaseOrderNumber;
        public string ProjectInfo;
        public string WorkingTelephoneNumber;
        public string RelatedWorkingTelephoneNumber;
        public string CommercialOrderNumber;
        public string[] OrderNotes;
    //added by Sunil Shrestha 09/14/2015 for the changes in ManageAccount.getAccount() response
        public boolean ExpediteFlag;
        public PSROrderContact[] OrderContact;
        public ServiceOrderItem ServiceOrderItem;
        
        transient String[] CustomerAccountNumber_type_info = new String[]{'CustomerAccountNumber','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] OrderedByName_type_info = new String[]{'OrderedByName','http://ibus.czncorp.com/ESB/BusinessObjects','IndividualName','0','1','false'};
        transient String[] OrderedByTelephoneNumber_type_info = new String[]{'OrderedByTelephoneNumber','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] PurchaseOrderNumber_type_info = new String[]{'PurchaseOrderNumber','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] RelatedPurchaseOrderNumber_type_info = new String[]{'RelatedPurchaseOrderNumber','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] ProjectInfo_type_info = new String[]{'ProjectInfo','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] WorkingTelephoneNumber_type_info = new String[]{'WorkingTelephoneNumber','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] RelatedWorkingTelephoneNumber_type_info = new String[]{'RelatedWorkingTelephoneNumber','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] CommercialOrderNumber_type_info = new String[]{'CommercialOrderNumber','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] OrderNotes_type_info = new String[]{'OrderNotes','http://www.w3.org/2001/XMLSchema','string','0','-1','false'};
        transient String[] ExpediteFlag_type_info = new String[]{'ExpediteFlag','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        transient String[] OrderContact_type_info = new String[]{'OrderContact','http://ibus.czncorp.com/ESB/BusinessObjects','PSROrderContact','0','-1','false'};
        transient String[] ServiceOrderItem_type_info = new String[]{'ServiceOrderItem','http://ibus.czncorp.com/ESB/BusinessObjects','ServiceOrderItem','0','1','false'};
        
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
        transient String[] field_order_type_info = new String[]{'CustomerAccountNumber', 'OrderedByName', 'OrderedByTelephoneNumber','PurchaseOrderNumber','RelatedPurchaseOrderNumber','ProjectInfo','WorkingTelephoneNumber','RelatedWorkingTelephoneNumber','CommercialOrderNumber','OrderNotes','ExpediteFlag','OrderContact','ServiceOrderItem'};
  }
  //added by Sunil Shrestha 09/14/2015 for the changes in ManageAccount.getAccount() response
  public class SpecialAccessInformation {
        public string CustomerName;
        public boolean PrintCircuitOnBill;
        public string ServiceType;
        public string CircuitId;
        public date DueDate;
        public string TelecommunicationsServicePriority;
        public string CircuitFacilityAssignment;
        public date ASRReceivedDate;
        public string OriginatingAddressString;
        public string OriginatingLocation;
        public string TerminatingAddressString;
        public string TerminatingLocation;
        public string PurchaseOrderNumber;
        public string TarriffCode;
        public boolean PrintLocationOnBill;
        public string NetworkChannelCode;
        public string NetworkChannelInterfaceCode;
        public string SecondaryNetworkChannelInterfaceCode;
        public string OrderStageCode;
        public boolean UnbundledNetworkElementFlag;
        public string TelephoneNumber;
        public string NumberofHotcutLines;
        public string NumberofDigitalLoops;
        public string NumberofAnalogLoops;
        public string TiePairs;
        public string DesiredFrameDueTime;
        public string HotcutReuse;
        public string[] ContactLineInfo;
        public string[] ReminderLineInfo;
        public date CustomerRequestedDueDate;
        public string[] AlternateIdentifier;        
        transient String[] CustomerName_type_info = new String[]{'CustomerName','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] PrintCircuitOnBill_type_info = new String[]{'PrintCircuitOnBill','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        transient String[] ServiceType_type_info = new String[]{'ServiceType','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] CircuitId_type_info = new String[]{'CircuitId','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] DueDate_type_info = new String[]{'DueDate','http://www.w3.org/2001/XMLSchema','date','0','1','false'};
        transient String[] TelecommunicationsServicePriority_type_info = new String[]{'TelecommunicationsServicePriority','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] CircuitFacilityAssignment_type_info = new String[]{'CircuitFacilityAssignment','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] ASRReceivedDate_type_info = new String[]{'ASRReceivedDate','http://www.w3.org/2001/XMLSchema','date','0','1','false'};
        transient String[] OriginatingAddressString_type_info = new String[]{'OriginatingAddressString','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] OriginatingLocation_type_info = new String[]{'OriginatingLocation','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] TerminatingAddressString_type_info = new String[]{'TerminatingAddressString','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] TerminatingLocation_type_info = new String[]{'TerminatingLocation','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] PurchaseOrderNumber_type_info = new String[]{'PurchaseOrderNumber','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] TarriffCode_type_info = new String[]{'TarriffCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] PrintLocationOnBill_type_info = new String[]{'PrintLocationOnBill','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        transient String[] NetworkChannelCode_type_info = new String[]{'NetworkChannelCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] NetworkChannelInterfaceCode_type_info = new String[]{'NetworkChannelInterfaceCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] SecondaryNetworkChannelInterfaceCode_type_info = new String[]{'SecondaryNetworkChannelInterfaceCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};       
        transient String[] OrderStageCode_type_info = new String[]{'OrderStageCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] UnbundledNetworkElementFlag_type_info = new String[]{'UnbundledNetworkElementFlag','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        transient String[] TelephoneNumber_type_info = new String[]{'TelephoneNumber','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] NumberofHotcutLines_type_info = new String[]{'NumberofHotcutLines','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] NumberofDigitalLoops_type_info = new String[]{'NumberofDigitalLoops','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] NumberofAnalogLoops_type_info = new String[]{'NumberofAnalogLoops','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] TiePairs_type_info = new String[]{'TiePairs','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] DesiredFrameDueTime_type_info = new String[]{'DesiredFrameDueTime','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] HotcutReuse_type_info = new String[]{'HotcutReuse','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] ContactLineInfo_type_info = new String[]{'ContactLineInfo','http://www.w3.org/2001/XMLSchema','string','0','-1','false'};        
        transient String[] ReminderLineInfo_type_info = new String[]{'ReminderLineInfo','http://www.w3.org/2001/XMLSchema','string','0','-1','false'};
        transient String[] CustomerRequestedDueDate_type_info = new String[]{'CustomerRequestedDueDate','http://www.w3.org/2001/XMLSchema','date','0','1','false'};
        transient String[] AlternateIdentifier_type_info = new String[]{'AlternateIdentifier','http://www.w3.org/2001/XMLSchema','string','0','-1','false'};
        
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
        transient String[] field_order_type_info = new String[]{'CustomerName','PrintCircuitOnBill', 'ServiceType','CircuitId', 'DueDate', 'TelecommunicationsServicePriority', 'CircuitFacilityAssignment', 'ASRReceivedDate', 'OriginatingAddressString', 'OriginatingLocation', 'TerminatingAddressString', 'TerminatingLocation', 'PurchaseOrderNumber', 'TarriffCode', 'PrintLocationOnBill', 'NetworkChannelCode', 'NetworkChannelInterfaceCode', 'SecondaryNetworkChannelInterfaceCode', 'OrderStageCode', 'UnbundledNetworkElementFlag', 'TelephoneNumber', 'NumberofHotcutLines', 'NumberofDigitalLoops', 'NumberofAnalogLoops', 'TiePairs', 'DesiredFrameDueTime', 'HotcutReuse', 'ContactLineInfo', 'ReminderLineInfo', 'CustomerRequestedDueDate', 'AlternateIdentifier'};
        
 }
  /*
  public class OrderResult {
        public ProductOrder Order;
        public Error[] OrderErrors;     
        public boolean AppointmentIsRequiredFlag;
        
        transient String[] Order_type_info = new String[]{'Order','http://ibus.czncorp.com/ESB/BusinessObjects','ProductOrder','0','1','false'};
        transient String[] OrderErrors_type_info = new String[]{'OrderErrors','http://ibus.czncorp.com/ESB/BusinessObjects','Error','0','-1','false'};
        transient String[] AppointmentIsRequiredFlag_type_info = new String[]{'AppointmentIsRequiredFlag','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
        transient String[] field_order_type_info = new String[]{'Order','OrderErrors', 'AppointmentIsRequiredFlag'};        
  }
  
  public class GroupOrderStatusInfo {
        public GroupResult GroupResult;
        public OrderResult[] OrderResult;
        
        transient String[] GroupResult_type_info = new String[]{'GroupResult','http://ibus.czncorp.com/ESB/BusinessObjects','GroupResult','0','1','false'};
        transient String[] OrderResult_type_info = new String[]{'OrderResult','http://ibus.czncorp.com/ESB/BusinessObjects','OrderResult','0','1','false'};
        
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
        transient String[] field_order_type_info = new String[]{'GroupResult', 'OrderResult'};      
  }
  
  public class GroupResult {
        public Error[] GroupErrors;
        public integer ReturnCode;
        
        transient String[] GroupErrors_type_info = new String[]{'GroupErrors','http://ibus.czncorp.com/ESB/BusinessObjects','Error','0','-1','false'};
        transient String[] ReturnCode_type_info = new String[]{'ReturnCode','http://www.w3.org/2001/XMLSchema','int','0','1','false'};
        
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
        transient String[] field_order_type_info = new String[]{'GroupErrors', 'ReturnCode'};
        
  }
  */
    
    //added by Sunil Shrestha 09/14/2015 for the changes in ManageAccount.getAccount() response
    public class ServiceItemSpecificationAction {
        public string SpecificationLabel;
        public string SpecificationValue;
        public string ActionCode;
        
        transient String[] SpecificationLabel_type_info = new String[]{'SpecificationLabel','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] SpecificationValue_type_info = new String[]{'SpecificationValue','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] ActionCode_type_info = new String[]{'ActionCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
        transient String[] field_order_type_info = new String[]{'SpecificationLabel','SpecificationValue','ActionCode'};
    }
    
    //added by Sunil Shrestha 09/14/2015 for the changes in ManageAccount.getAccount() response
    public class ServiceOrderItem {
        public string ItemSpecificationId;
        public string ActivityCode;
        public string ItemAlias;
        public string ParentServiceItemId;
        public string LocationId;
        public string AddressId;
        public PSRLocation PrimaryLocation;
        public PSRLocation SecondaryLocation;
        public ServiceItemSpecificationAction[] ServiceItemSpecificationAction;
        public ServiceItemAttribute[] ServiceItemAttribute;
        
        transient String[] ItemSpecificationId_type_info = new String[]{'ItemSpecificationId','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] ActivityCode_type_info = new String[]{'ActivityCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] ItemAlias_type_info = new String[]{'ItemAlias','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] ParentServiceItemId_type_info = new String[]{'ParentServiceItemId','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] LocationId_type_info = new String[]{'LocationId','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] AddressId_type_info = new String[]{'AddressId','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] PrimaryLocation_type_info = new String[]{'PrimaryLocation','http://ibus.czncorp.com/ESB/BusinessObjects','PSRLocation','0','1','false'};
        transient String[] SecondaryLocation_info = new String[]{'SecondaryLocation','http://ibus.czncorp.com/ESB/BusinessObjects','PSRLocation','0','1','false'};
        transient String[] ServiceItemSpecificationAction_type_info = new String[]{'ServiceItemSpecificationAction','http://ibus.czncorp.com/ESB/BusinessObjects','ServiceItemSpecificationAction','0','-1','false'};
        transient String[] ServiceItemAttribute_type_info = new String[]{'ServiceItemAttribute','http://ibus.czncorp.com/ESB/BusinessObjects','ServiceItemAttribute','0','-1','false'};
        
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
        transient String[] field_order_type_info = new String[]{'ItemSpecificationId', 'ActivityCode', 'ItemAlias', 'ParentServiceItemId', 'LocationId', 'AddressId', 'PrimaryLocation', 'SecondaryLocation', 'ServiceItemSpecificationAction', 'ServiceItemAttribute'};
    }
    
    //added by Sunil Shrestha 09/14/2015 for the changes in ManageAccount.getAccount() response
    public class ServiceItemAttribute {
        public string AttributeId;
        public string AttributeName;
        public string AttributeValueId;
        public string AttributeValue;
        
        transient String[] AttributeId_type_info = new String[]{'AttributeId','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] AttributeName_type_info = new String[]{'AttributeName','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] AttributeValueId_type_info = new String[]{'AttributeValueId','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] AttributeValue_type_info = new String[]{'AttributeValue','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
        transient String[] field_order_type_info = new String[]{'AttributeId','AttributeName','AttributeValueId','AttributeValue'};     
    }
    
    //added by Sunil Shrestha 09/14/2015 for the changes in ManageAccount.getAccount() response
    public class PSROrderContact {
        public String Type_x;
        public String GivenNames;
        public String FamilyNames;
        public TelephoneNumber TelephoneNumber;
        public String EmailAddress;
        
        transient String[] Type_x_type_info = new String[]{'Type_x','http://www.w3.org/2001/XMLSchema','string','0','1','false'}; 
        transient String[] GivenNames_type_info = new String[]{'GivenNames','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] FamilyNames_type_info = new String[]{'FamilyNames','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] TelephoneNumber_type_info = new String[]{'TelephoneNumber','http://ibus.czncorp.com/ESB/BusinessObjects','TelephoneNumber','0','1','false'};
        transient String[] EmailAddress_type_info = new String[]{'FamilyNames','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
        transient String[] field_order_type_info = new String[]{'Type_x','GivenNames','FamilyNames','TelephoneNumber', 'EmailAddress'};
    }
    
    /*
    public class CommercialContract {
        public string ScheduleId;
        public string ContractId;
        public string[] ProductCode;
        public string[] ItemCode;
        public decimal MonthlyRecurringChargeRate;
        public decimal NonRecurringChargeRate;
        public integer Quantity;
        
        transient String[] ScheduleId_type_info = new String[]{'ScheduleId','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] ContractId_type_info = new String[]{'ContractId','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] ProductCode_type_info = new String[]{'ProductCode','http://www.w3.org/2001/XMLSchema','string','0','-1','false'};
        transient String[] ItemCode_type_info = new String[]{'ItemCode','http://www.w3.org/2001/XMLSchema','string','0','-1','false'};
        transient String[] MonthlyRecurringChargeRate_type_info = new String[]{'MonthlyRecurringChargeRate','http://www.w3.org/2001/XMLSchema','decimal','0','1','false'};
        transient String[] NonRecurringChargeRate_type_info = new String[]{'NonRecurringChargeRate','http://www.w3.org/2001/XMLSchema','decimal','0','1','false'};
        transient String[] Quantity_type_info = new String[]{'Quantity','http://www.w3.org/2001/XMLSchema','int','0','1','false'};
        
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
        transient String[] field_order_type_info = new String[]{'ScheduleId','ContractId','ProductCode','ItemCode', 'MonthlyRecurringChargeRate', 'NonRecurringChargeRate', 'Quantity'};
    }
    */
    public class SimpleIndividualName {
        public string GivenName;
        public string FamilyName;
        
        transient String[] GivenName_type_info = new String[]{'GivenName','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] FamilyName_type_info = new String[]{'FamilyName','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
        transient String[] field_order_type_info = new String[]{'GivenName','FamilyName'};
    }
    /*
    public class ShippingAddress {
        public SimpleIndividualName IndividualName;
        public string TradingName;
        public CitizensPostalAddress Address;
        public string[] ProductType;
        
        transient String[] IndividualName_type_info = new String[]{'IndividualName','http://ibus.czncorp.com/ESB/BusinessObjects','SimpleIndividualName','0','1','false'}; 
        transient String[] TradingName_type_info = new String[]{'TradingName','http://www.w3.org/2001/XMLSchema','string','0','1','false'}; 
        transient String[] Address_type_info = new String[]{'Address','http://ibus.czncorp.com/ESB/BusinessObjects','CitizensPostalAddress','0','1','false'}; 
        transient String[] ProductType_type_info = new String[]{'ProductType','http://www.w3.org/2001/XMLSchema','string','0','-1','false'}; 
        
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
        transient String[] field_order_type_info = new String[]{'IndividualName','TradingName','Address','ProductType'};        
    }
    
    public class CustomerOrder {
        public String OrderID;
        public OrderType OrderType;
        public CodeDescriptionPair OrderTypeClassification;
        public OrderType OrderProcessingType;
        public String OrderStatus;
        public Stage OrderStage;
        public Boolean RecordsOnlyFlag;
        public Boolean LockedFlag;
        public String OrderHash;
        public RemarkText OrderRemarkText;
        public OrderInfluencer IssuedBy;
        public OrderInfluencer SoldBy;
        public OrderInfluencer AssignedTo;
        public SalesChannel SalesChannel;
        public RemarkText AddressRemarkText;
        public RemarkText CustomerRemarkText;
        public Datetime OrderDate;
        public String Description;
        public Datetime OrderCompleteDate;
        public Long AssignedPriority;
        public Date AssignedResponsibilityDate;
        public Item[] Item;
        public CustomerAccount CustomerAccount;
        public SpecialDirectoryRequest SpecialDirectoryRequest;
        public Appointment[] Appointment;
        public Memo[] OrderMemo;
        public AdditionalOrderInfo AdditionalOrderInfo;
        public Datetime LastUpdatedDateTime;
        public SatelliteOrderInfo SatelliteOrderInfo;       
        //added-----
        public ShippingAddress ShippingAddress;
        public dateTime ShipDate;
        public string TrackingNumber;
        public string ThirdPartyVerificationRecordLocatorNumber;
        public CommercialContract[] CommercialContract;
        //<!-- AdditionalPSROrderInfo is used for PSR Shell order, provides additional info to complete the order (customerDesiredDueDate is in main order) -->
        public PSROrderInfo AdditionalPSROrderInfo;
        public SpecialAccessInformation SpecialAccessInfo;  //added by Sunil Shrestha 09/14/2015 for the changes in ManageAccount.getAccount() response
        //end of added
        public WS_ESB_BusinessObjects.LifeLineInfo LifeLineInfo;
        public WS_ESB_BusinessObjects.RefundEligibility RefundEligibility;
        
        
        transient String[] OrderID_type_info = new String[]{'OrderID','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] OrderType_type_info = new String[]{'OrderType','http://ibus.czncorp.com/ESB/BusinessObjects','OrderType','0','1','false'};
        transient String[] OrderTypeClassification_type_info = new String[]{'OrderTypeClassification','http://ibus.czncorp.com/ESB/BusinessObjects','CodeDescriptionPair','0','1','false'};
        transient String[] OrderProcessingType_type_info = new String[]{'OrderProcessingType','http://ibus.czncorp.com/ESB/BusinessObjects','OrderType','0','1','false'};
        transient String[] OrderStatus_type_info = new String[]{'OrderStatus','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] OrderStage_type_info = new String[]{'OrderStage','http://ibus.czncorp.com/ESB/BusinessObjects','Stage','0','1','false'};
        transient String[] RecordsOnlyFlag_type_info = new String[]{'RecordsOnlyFlag','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        transient String[] LockedFlag_type_info = new String[]{'LockedFlag','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        transient String[] OrderHash_type_info = new String[]{'OrderHash','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] OrderRemarkText_type_info = new String[]{'OrderRemarkText','http://ibus.czncorp.com/ESB/BusinessObjects','RemarkText','0','1','false'};
        transient String[] IssuedBy_type_info = new String[]{'IssuedBy','http://ibus.czncorp.com/ESB/BusinessObjects','OrderInfluencer','0','1','false'};
        transient String[] SoldBy_type_info = new String[]{'SoldBy','http://ibus.czncorp.com/ESB/BusinessObjects','OrderInfluencer','0','1','false'};
        transient String[] AssignedTo_type_info = new String[]{'AssignedTo','http://ibus.czncorp.com/ESB/BusinessObjects','OrderInfluencer','0','1','false'};
        transient String[] SalesChannel_type_info = new String[]{'SalesChannel','http://ibus.czncorp.com/ESB/BusinessObjects','SalesChannel','0','1','false'};
                
        transient String[] AddressRemarkText_type_info = new String[]{'AddressRemarkText','http://ibus.czncorp.com/ESB/BusinessObjects','RemarkText','0','1','false'};
        transient String[] CustomerRemarkText_type_info = new String[]{'CustomerRemarkText','http://ibus.czncorp.com/ESB/BusinessObjects','RemarkText','0','1','false'};
        transient String[] OrderDate_type_info = new String[]{'OrderDate','http://www.w3.org/2001/XMLSchema','datetime','0','1','false'};
        transient String[] Description_type_info = new String[]{'Description','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] OrderCompleteDate_type_info = new String[]{'OrderCompleteDate','http://www.w3.org/2001/XMLSchema','datetime','0','1','false'};
        transient String[] AssignedPriority_type_info = new String[]{'AssignedPriority','http://www.w3.org/2001/XMLSchema','long','0','1','false'};
        transient String[] AssignedResponsibilityDate_type_info = new String[]{'AssignedResponsibilityDate','http://www.w3.org/2001/XMLSchema','date','0','1','false'};
        transient String[] Item_type_info = new String[]{'Item','http://ibus.czncorp.com/ESB/BusinessObjects','Item','0','-1','false'};
        transient String[] CustomerAccount_type_info = new String[]{'CustomerAccount','http://ibus.czncorp.com/ESB/BusinessObjects','CustomerAccount','0','1','false'};
        transient String[] SpecialDirectoryRequest_type_info = new String[]{'SpecialDirectoryRequest','http://ibus.czncorp.com/ESB/BusinessObjects','SpecialDirectoryRequest','0','1','false'};
        transient String[] Appointment_type_info = new String[]{'Appointment','http://ibus.czncorp.com/ESB/BusinessObjects','Appointment','0','-1','false'};
        transient String[] OrderMemo_type_info = new String[]{'OrderMemo','http://ibus.czncorp.com/ESB/BusinessObjects','Memo','0','-1','false'};
        transient String[] AdditionalOrderInfo_type_info = new String[]{'AdditionalOrderInfo','http://ibus.czncorp.com/ESB/BusinessObjects','AdditionalOrderInfo','0','1','false'};
        transient String[] LastUpdatedDateTime_type_info = new String[]{'LastUpdatedDateTime','http://www.w3.org/2001/XMLSchema','datetime','0','1','false'};
        transient String[] SatelliteOrderInfo_type_info = new String[]{'SatelliteOrderInfo','http://ibus.czncorp.com/ESB/BusinessObjects','SatelliteOrderInfo','0','1','false'};
        //added
        transient String[] ShippingAddress_type_info = new String[]{'ShippingAddress','http://ibus.czncorp.com/ESB/BusinessObjects','ShippingAddress','0','1','false'};
        transient String[] ShipDate_type_info = new String[]{'ShipDate','http://www.w3.org/2001/XMLSchema','datetime','0','1','false'};
        transient String[] TrackingNumber_type_info = new String[]{'TrackingNumber','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] ThirdPartyVerificationRecordLocatorNumber_type_info = new String[]{'ThirdPartyVerificationRecordLocatorNumber','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] CommercialContract_type_info = new String[]{'CommercialContract','http://ibus.czncorp.com/ESB/BusinessObjects','CommercialContract','0','-1','false'};
        transient String[] AdditionalPSROrderInfo_type_info = new String[]{'AdditionalPSROrderInfo','http://ibus.czncorp.com/ESB/BusinessObjects','PSROrderInfo','0','1','false'};
        transient String[] SpecialAccessInfo_type_info = new String[]{'SpecialAccessInfo','http://ibus.czncorp.com/ESB/BusinessObjects','SpecialAccessInformation','0','1','false'};
        transient String[] LifeLineInfo_type_info = new String[]{'LifeLineInfo','http://ibus.czncorp.com/ESB/BusinessObjects','LifeLineInfo','0','1','false'};
        transient String[] RefundEligibility_type_info = new String[]{'RefundEligibility','http://ibus.czncorp.com/ESB/BusinessObjects','RefundEligibility','0','1','false'};
        //end of added
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
        transient String[] field_order_type_info = new String[]{'OrderID','OrderType','OrderTypeClassification','OrderProcessingType','OrderStatus','OrderStage','RecordsOnlyFlag','LockedFlag','OrderHash','OrderRemarkText','IssuedBy','SoldBy','AssignedTo', 'SalesChannel','AddressRemarkText','CustomerRemarkText','OrderDate','Description','OrderCompleteDate','AssignedPriority','AssignedResponsibilityDate','Item','CustomerAccount','SpecialDirectoryRequest','Appointment','OrderMemo','AdditionalOrderInfo','LastUpdatedDateTime','SatelliteOrderInfo','ShippingAddress', 'ShipDate', 'TrackingNumber', 'ThirdPartyVerificationRecordLocatorNumber', 'CommercialContract', 'AdditionalPSROrderInfo', 'SpecialAccessInfo','LifeLineInfo','RefundEligibility'};     
        //end of added
    }
    
    public class LifeLineInfo {
        public String GivenNames; 
        public String FamilyNames;
        public Date DateOfRequest;
        public Date EffectiveDateOfRequest;
        public Date DateOfBirth;        
        public String TribalClientID;
        public String LastFourSSN;
        transient String[]  GivenNames_type_info = new String[]{'GivenNames','http://ibus.czncorp.com/ESB/BusinessObjects','string','0','1','false'};
        transient String[]  FamilyNames_type_info = new String[]{'FamilyNames','http://ibus.czncorp.com/ESB/BusinessObjects','string','0','1','false'};
        transient String[] DateOfRequest_type_info = new String[]{'DateOfRequest','http://www.w3.org/2001/XMLSchema','date','0','1','false'};
        transient String[] EffectiveDateOfRequest_type_info = new String[]{'EffectiveDateOfRequest','http://www.w3.org/2001/XMLSchema','date','0','1','false'};
        transient String[] DateOfBirth_type_info = new String[]{'DateOfBirth','http://www.w3.org/2001/XMLSchema','date','0','1','false'};
        transient String[]  TribalClientID_type_info = new String[]{'TribalClientID','http://ibus.czncorp.com/ESB/BusinessObjects','string','0','1','false'};
        transient String[]  LastFourSSN_type_info = new String[]{'LastFourSSN','http://ibus.czncorp.com/ESB/BusinessObjects','string','0','1','false'};
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};     
        transient String[] field_order_type_info = new String[]{'GivenNames','FamilyNames','DateOfRequest','EffectiveDateOfRequest','DateOfBirth','TribalClientID','LastFourSSN'};
    }
    
    public class RefundEligibility{
        public String RefundEligibilityIndicator; 
        public String OverrideUser;
        public String OverrideReason;
        transient String[]  RefundEligibilityIndicator_type_info = new String[]{'RefundEligibilityIndicator','http://ibus.czncorp.com/ESB/BusinessObjects','string','0','1','false'};
        transient String[]  OverrideUser_type_info = new String[]{'OverrideUser','http://ibus.czncorp.com/ESB/BusinessObjects','string','0','1','false'};
        transient String[]  OverrideReason_type_info = new String[]{'OverrideReason','http://ibus.czncorp.com/ESB/BusinessObjects','string','0','1','false'};
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};     
        transient String[] field_order_type_info = new String[]{'RefundEligibilityIndicator','OverrideUser','OverrideReason'};
    }    
    
    */
    //added by Sunil Shrestha 09/14/2015 for the changes in ManageAccount.getAccount() response
    public class ServiceLocation {
        public String StateOrProvince;
        public String Country;
        public String County;
        public String StreetNrFirst;
        public String StreetNrFirstSuffix;
        public String StreetName;
        public String StreetType;
        public String StreetSuffix;
        public String StreetNrLast;
        public String StreetNrLastSuffix;
        public String Locality;
        public String Postcode;
        public String StreetNrFirstPrefix;
        public String StreetNrLastPrefix;
        public String StreetNamePrefix;
        public String StreetNameSuffix;             
        public String StreetPreDirection;
        public String StreetPostDirection;
        public String Building;
        public String Suite;
        public String Floor;
        public String Room;
        public String Community;
        public String AddressId;
        public String LocalityId;
        public String LocationName;
        public String CommonLanguageLocationIdString;
        public String NetworkChannelInterfaceCode;
        public String ConnectingFacilityAssignmentCode;
        public String DemarcInfo;
        public String ContactName;
        public String ContactTelephoneNumber;       
        transient String[] StateOrProvince_type_info = new String[]{'StateOrProvince','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] Country_type_info = new String[]{'Country','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] County_type_info = new String[]{'County','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] StreetNrFirst_type_info = new String[]{'StreetNrFirst','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] StreetNrFirstSuffix_type_info = new String[]{'StreetNrFirstSuffix','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] StreetName_type_info = new String[]{'StreetName','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] StreetType_type_info = new String[]{'StreetType','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] StreetSuffix_type_info = new String[]{'StreetSuffix','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] StreetNrLast_type_info = new String[]{'StreetNrLast','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] StreetNrLastSuffix_type_info = new String[]{'StreetNrLastSuffix','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] Locality_type_info = new String[]{'Locality','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] Postcode_type_info = new String[]{'Postcode','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] StreetNrFirstPrefix_type_info = new String[]{'StreetNrFirstPrefix','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] StreetNrLastPrefix_type_info = new String[]{'StreetNrLastPrefix','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] StreetNamePrefix_type_info = new String[]{'StreetNamePrefix','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] StreetNameSuffix_type_info = new String[]{'StreetNameSuffix','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] StreetPreDirection_type_info = new String[]{'StreetPreDirection','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] StreetPostDirection_type_info = new String[]{'StreetPostDirection','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] Building_type_info = new String[]{'Building','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] Suite_type_info = new String[]{'Suite','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] Floor_type_info = new String[]{'Floor','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] Room_type_info = new String[]{'Room','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] Community_type_info = new String[]{'Community','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] AddressId_type_info = new String[]{'AddressId','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] LocalityId_type_info = new String[]{'LocalityId','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] LocationName_type_info = new String[]{'LocationName','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] CommonLanguageLocationIdString_type_info = new String[]{'CommonLanguageLocationIdString','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] NetworkChannelInterfaceCode_type_info = new String[]{'NetworkChannelInterfaceCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] ConnectingFacilityAssignmentCode_type_info = new String[]{'ConnectingFacilityAssignmentCode','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] DemarcInfo_type_info = new String[]{'DemarcInfo','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] ContactName_type_info = new String[]{'ContactName','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] ContactTelephoneNumber_type_info = new String[]{'ContactTelephoneNumber','http://www.w3.org/2001/XMLSchema','string','0','1','false' };      
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};     
        transient String[] field_order_type_info = new String[]{'StateOrProvince','Country','County','StreetNrFirst','StreetNrFirstSuffix','StreetName','StreetType','StreetSuffix','StreetNrLast','StreetNrLastSuffix','Locality','Postcode','StreetNrFirstPrefix','StreetNrLastPrefix','StreetNamePrefix','StreetNameSuffix','StreetPreDirection', 'StreetPostDirection','Building', 'Suite', 'Floor', 'Room','Community', 'AddressId', 'LocalityId', 'LocationName', 'CommonLanguageLocationIdString', 'NetworkChannelInterfaceCode', 'ConnectingFacilityAssignmentCode', 'DemarcInfo', 'ContactName', 'ContactTelephoneNumber'};
    }
    
    public class PSRLocation {
        public WS_ESB_BusinessObjects.ServiceLocation NetworkLocation; 
        public WS_ESB_BusinessObjects.ServiceLocation EndUserLocation;      
        transient String[]  NetworkLocation_type_info = new String[]{'NetworkLocation','http://ibus.czncorp.com/ESB/BusinessObjects','ServiceLocation','0','1','false'};
        transient String[]  EndUserLocation_type_info = new String[]{'EndUserLocation','http://ibus.czncorp.com/ESB/BusinessObjects','ServiceLocation','0','1','false'};        
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};     
        transient String[] field_order_type_info = new String[]{'NetworkLocation','EndUserLocation'};
    }
    //end of business objects changes   

    
    public class AdditionalOrderInfo {
        public TelephoneNumber ResequencedTelephoneNumber;
        public TelephoneNumber ExistingTelephoneNumber;
        public Boolean HoldForFurtherIdentificationFlag;
        public String HSIAlternateChoice;
        public String PrimaryLocalExchangeCarrierReferenceNumber;
        public Boolean BackBalanceDueFlag;
        public Decimal BackBalanceAmount;
        transient String[] ResequencedTelephoneNumber_type_info = new String[]{'ResequencedTelephoneNumber','http://ibus.czncorp.com/ESB/BusinessObjects','TelephoneNumber','0','1','false'};
        transient String[] ExistingTelephoneNumber_type_info = new String[]{'ExistingTelephoneNumber','http://ibus.czncorp.com/ESB/BusinessObjects','TelephoneNumber','0','1','false'};
        transient String[] HoldForFurtherIdentificationFlag_type_info = new String[]{'HoldForFurtherIdentificationFlag','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        transient String[] HSIAlternateChoice_type_info = new String[]{'HSIAlternateChoice','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] PrimaryLocalExchangeCarrierReferenceNumber_type_info = new String[]{'PrimaryLocalExchangeCarrierReferenceNumber','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] BackBalanceDueFlag_type_info = new String[]{'BackBalanceDueFlag','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        transient String[] BackBalanceAmount_type_info = new String[]{'BackBalanceAmount','http://www.w3.org/2001/XMLSchema','decimal','0','1','false'};
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
        transient String[] field_order_type_info = new String[]{'ResequencedTelephoneNumber','ExistingTelephoneNumber','HoldForFurtherIdentificationFlag','HSIAlternateChoice','PrimaryLocalExchangeCarrierReferenceNumber','BackBalanceDueFlag','BackBalanceAmount'};      
    }
    
    public class SatelliteOrderInfo {
        public String SatelliteAccountNumber;
        public String Satellite;
        public String[] OrderNumber;
        transient String[] SatelliteAccountNumber_type_info = new String[]{'SatelliteAccountNumber','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] Satellite_type_info = new String[]{'Satellite','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] OrderNumber_type_info = new String[]{'OrderNumber','http://ibus.czncorp.com/ESB/BusinessObjects','String','0','-1','false'};
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
        transient String[] field_order_type_info = new String[]{'SatelliteAccountNumber','Satellite','OrderNumber'};        
    }
    
    public class ProjectElementSpec {
        public String Name;
        public String Description;
        public String Type;
        transient String[] Name_type_info = new String[]{'Name','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] Description_type_info = new String[]{'Description','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] Type_type_info = new String[]{'Type','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
        transient String[] field_order_type_info = new String[]{'Name','Description','Type'};        
    }
    
    public class Appointment {
        public TimePeriod PlannedDuration;
        public TimePeriod ActualDuration;
        public TimePeriod CurrentDuration;
        public TimePeriod ScheduledDuration;
        public ProjectElementSpec ProjectElementSpecSpecifies;
        public String LifecycleStatus;
        public String Priority;
        public String Description;
        public String TimingConstraint;
        public Date TimingConstraintDate;
        public String TimeSlotType;
        public String TimeSlotTypeIndicator;
        public Datetime CreateDateTime;
        public Activity_x[] WBSContains;
        public String WbsNr;
        public String WbsLevel;
        public String Descr;
        public String HostWbsNr;
        public String Complexity;
        public String CSGExceededIndicator;
        public String MassServiceDistruptionId;
        public String MedicalPriority;
        public String AppointmentId;
        public Boolean CustomerNegotiatedFlag;
        public Integer WorkUnitsQuantity;
        public Integer TechniciansQuantity;
        public String ResourcePoolId;
        public String StatusReason;
        public AppointmentContact[] AppointmentContact;
        public RemarkText[] RemarkText;
        public String Result;
        public AppointmentOrderId AppointmentOrderId;
        public Boolean CustomerIsPleasedWithAppointmentFlag;
        public Boolean AppointmentIsOverbookableFlag;
        public String AppointmentCode;
        public String ScheduledCode;
        public Integer AvialableUnitsQuantity;
        public AppointmentMessage[] AppointmentMessage;
        transient String[] PlannedDuration_type_info = new String[]{'PlannedDuration','http://ibus.czncorp.com/ESB/BusinessObjects','TimePeriod','0','1','false'};
        transient String[] ActualDuration_type_info = new String[]{'ActualDuration','http://ibus.czncorp.com/ESB/BusinessObjects','TimePeriod','0','1','false'};
        transient String[] CurrentDuration_type_info = new String[]{'CurrentDuration','http://ibus.czncorp.com/ESB/BusinessObjects','TimePeriod','0','1','false'};
        transient String[] ScheduledDuration_type_info = new String[]{'ScheduledDuration','http://ibus.czncorp.com/ESB/BusinessObjects','TimePeriod','0','1','false'};
        transient String[] ProjectElementSpecSpecifies_type_info = new String[]{'ProjectElementSpecSpecifies','http://ibus.czncorp.com/ESB/BusinessObjects','ProjectElementSpec','0','1','false'};
        transient String[] LifecycleStatus_type_info = new String[]{'LifecycleStatus','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] Priority_type_info = new String[]{'Priority','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] Description_type_info = new String[]{'Description','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] TimingConstraint_type_info = new String[]{'TimingConstraint','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] TimingConstraintDate_type_info = new String[]{'TimingConstraintDate','http://www.w3.org/2001/XMLSchema','date','0','1','false'};
        transient String[] TimeSlotType_type_info = new String[]{'TimeSlotType','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] TimeSlotTypeIndicator_type_info = new String[]{'TimeSlotTypeIndicator','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] CreateDateTime_type_info = new String[]{'CreateDateTime','http://www.w3.org/2001/XMLSchema','datetime','0','1','false'};
        transient String[] WBSContains_type_info = new String[]{'WBSContains','http://ibus.czncorp.com/ESB/BusinessObjects','Activity_x','0','-1','false'};
        transient String[] WbsNr_type_info = new String[]{'WbsNr','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] WbsLevel_type_info = new String[]{'WbsLevel','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] Descr_type_info = new String[]{'Descr','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] HostWbsNr_type_info = new String[]{'HostWbsNr','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] Complexity_type_info = new String[]{'Complexity','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] CSGExceededIndicator_type_info = new String[]{'CSGExceededIndicator','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] MassServiceDistruptionId_type_info = new String[]{'MassServiceDistruptionId','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] MedicalPriority_type_info = new String[]{'MedicalPriority','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] AppointmentId_type_info = new String[]{'AppointmentId','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] CustomerNegotiatedFlag_type_info = new String[]{'CustomerNegotiatedFlag','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        transient String[] WorkUnitsQuantity_type_info = new String[]{'WorkUnitsQuantity','http://www.w3.org/2001/XMLSchema','int','0','1','false'};
        transient String[] TechniciansQuantity_type_info = new String[]{'TechniciansQuantity','http://www.w3.org/2001/XMLSchema','int','0','1','false'};
        transient String[] ResourcePoolId_type_info = new String[]{'ResourcePoolId','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] StatusReason_type_info = new String[]{'StatusReason','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] AppointmentContact_type_info = new String[]{'AppointmentContact','http://ibus.czncorp.com/ESB/BusinessObjects','AppointmentContact','0','-1','false'};
        transient String[] RemarkText_type_info = new String[]{'RemarkText','http://ibus.czncorp.com/ESB/BusinessObjects','RemarkText','0','-1','false'};
        transient String[] Result_type_info = new String[]{'Result','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] AppointmentOrderId_type_info = new String[]{'AppointmentOrderId','http://ibus.czncorp.com/ESB/BusinessObjects','AppointmentOrderId','0','1','false'};
        transient String[] CustomerIsPleasedWithAppointmentFlag_type_info = new String[]{'CustomerIsPleasedWithAppointmentFlag','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        transient String[] AppointmentIsOverbookableFlag_type_info = new String[]{'AppointmentIsOverbookableFlag','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        transient String[] AppointmentCode_type_info = new String[]{'AppointmentCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] ScheduledCode_type_info = new String[]{'ScheduledCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] AvialableUnitsQuantity_type_info = new String[]{'AvialableUnitsQuantity','http://www.w3.org/2001/XMLSchema','int','0','1','false'};
        transient String[] AppointmentMessage_type_info = new String[]{'AppointmentMessage','http://ibus.czncorp.com/ESB/BusinessObjects','AppointmentMessage','0','-1','false'};
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
        transient String[] field_order_type_info = new String[]{'PlannedDuration','ActualDuration','CurrentDuration','ScheduledDuration','ProjectElementSpecSpecifies','LifecycleStatus','Priority','Description','TimingConstraint','TimingConstraintDate','TimeSlotType','TimeSlotTypeIndicator','CreateDateTime','WBSContains','WbsNr','WbsLevel','Descr','HostWbsNr','Complexity','CSGExceededIndicator','MassServiceDistruptionId','MedicalPriority','AppointmentId','CustomerNegotiatedFlag','WorkUnitsQuantity','TechniciansQuantity','ResourcePoolId','StatusReason','AppointmentContact','RemarkText','Result','AppointmentOrderId','CustomerIsPleasedWithAppointmentFlag','AppointmentIsOverbookableFlag','AppointmentCode','ScheduledCode','AvialableUnitsQuantity','AppointmentMessage'};       
    }
    
    public class AppointmentOrderId {
        public String OrderId;
        public String DataRegion;
        transient String[] OrderId_type_info = new String[]{'OrderId','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] DataRegion_type_info = new String[]{'DataRegion','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
        transient String[] field_order_type_info = new String[]{'OrderId','DataRegion'};        
    }
    
    public class AppointmentMessage {
        public String Code;
        public String Description;
        transient String[] Code_type_info = new String[]{'Code','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] Description_type_info = new String[]{'Description','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
        transient String[] field_order_type_info = new String[]{'Code','Description'};      
    }
    
    public class AppointmentContact {
        public Individual Individual;
        public WS_ESB_BusinessObjects.Organization Organization;
        public TelephoneNumber[] TelephoneNumber;
        public CitizensPostalAddress[] CitizensPostalAddress;
        public TimePeriod ValidFor;
        public String ContactName;
        public TelephoneNumber PrimaryTelephoneNumber;
        public TelephoneNumber SecondaryTelephoneNumber;
        transient String[] Individual_type_info = new String[]{'Individual','http://ibus.czncorp.com/ESB/BusinessObjects','Individual','0','1','false'};
        transient String[] Organization_type_info = new String[]{'Organization','http://ibus.czncorp.com/ESB/BusinessObjects','Organization','0','1','false'};
        transient String[] TelephoneNumber_type_info = new String[]{'TelephoneNumber','http://ibus.czncorp.com/ESB/BusinessObjects','TelephoneNumber','0','-1','false'};
        transient String[] CitizensPostalAddress_type_info = new String[]{'CitizensPostalAddress','http://ibus.czncorp.com/ESB/BusinessObjects','CitizensPostalAddress','0','-1','false'};
        transient String[] ValidFor_type_info = new String[]{'ValidFor','http://ibus.czncorp.com/ESB/BusinessObjects','TimePeriod','0','1','false'};
        transient String[] ContactName_type_info = new String[]{'ContactName','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] PrimaryTelephoneNumber_type_info = new String[]{'PrimaryTelephoneNumber','http://ibus.czncorp.com/ESB/BusinessObjects','TelephoneNumber','0','1','false'};
        transient String[] SecondaryTelephoneNumber_type_info = new String[]{'SecondaryTelephoneNumber','http://ibus.czncorp.com/ESB/BusinessObjects','TelephoneNumber','0','1','false'};
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
        transient String[] field_order_type_info = new String[]{'Individual','Organization','TelephoneNumber','CitizensPostalAddress','ValidFor','ContactName','PrimaryTelephoneNumber','SecondaryTelephoneNumber'};        
    }
    
    public class Activity_x {
        public TimePeriod PlannedDuration;
        public TimePeriod ActualDuration;
        public TimePeriod CurrentDuration;
        public TimePeriod ScheduledDuration;
        public ProjectElementSpec ProjectElementSpecSpecifies;
        public String LifecycleStatus;
        public String Priority;
        public String Description;
        public String TimingConstraint;
        public Date TimingConstraintDate;
        public String TimeSlotType;
        public String TimeSlotTypeIndicator;
        public Datetime CreateDateTime;
        public ActivitySpec ActivitySpecSpecifies;
        public ActivitySpec ActivitySpec;
        public String ActivityNr;
        public String Name;
        public String DateDriver;
        transient String[] PlannedDuration_type_info = new String[]{'PlannedDuration','http://ibus.czncorp.com/ESB/BusinessObjects','TimePeriod','0','1','false'};
        transient String[] ActualDuration_type_info = new String[]{'ActualDuration','http://ibus.czncorp.com/ESB/BusinessObjects','TimePeriod','0','1','false'};
        transient String[] CurrentDuration_type_info = new String[]{'CurrentDuration','http://ibus.czncorp.com/ESB/BusinessObjects','TimePeriod','0','1','false'};
        transient String[] ScheduledDuration_type_info = new String[]{'ScheduledDuration','http://ibus.czncorp.com/ESB/BusinessObjects','TimePeriod','0','1','false'};
        transient String[] ProjectElementSpecSpecifies_type_info = new String[]{'ProjectElementSpecSpecifies','http://ibus.czncorp.com/ESB/BusinessObjects','ProjectElementSpec','0','1','false'};
        transient String[] LifecycleStatus_type_info = new String[]{'LifecycleStatus','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] Priority_type_info = new String[]{'Priority','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] Description_type_info = new String[]{'Description','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] TimingConstraint_type_info = new String[]{'TimingConstraint','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] TimingConstraintDate_type_info = new String[]{'TimingConstraintDate','http://www.w3.org/2001/XMLSchema','date','0','1','false'};
        transient String[] TimeSlotType_type_info = new String[]{'TimeSlotType','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] TimeSlotTypeIndicator_type_info = new String[]{'TimeSlotTypeIndicator','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] CreateDateTime_type_info = new String[]{'CreateDateTime','http://www.w3.org/2001/XMLSchema','datetime','0','1','false'};
        transient String[] ActivitySpecSpecifies_type_info = new String[]{'ActivitySpecSpecifies','http://ibus.czncorp.com/ESB/BusinessObjects','ActivitySpec','0','1','false'};
        transient String[] ActivitySpec_type_info = new String[]{'ActivitySpec','http://ibus.czncorp.com/ESB/BusinessObjects','ActivitySpec','0','1','false'};
        transient String[] ActivityNr_type_info = new String[]{'ActivityNr','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] Name_type_info = new String[]{'Name','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] DateDriver_type_info = new String[]{'DateDriver','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
        transient String[] field_order_type_info = new String[]{'PlannedDuration','ActualDuration','CurrentDuration','ScheduledDuration','ProjectElementSpecSpecifies','LifecycleStatus','Priority','Description','TimingConstraint','TimingConstraintDate','TimeSlotType','TimeSlotTypeIndicator','CreateDateTime','ActivitySpecSpecifies','ActivitySpec','ActivityNr','Name','DateDriver'};       
    }
    
    public class ActivitySpec {
        public TimePeriod PlannedDuration;
        public TimePeriod ActualDuration;
        public TimePeriod CurrentDuration;
        public TimePeriod ScheduledDuration;
        public ProjectElementSpec ProjectElementSpecSpecifies;
        public String LifecycleStatus;
        public String Priority;
        public String Description;
        public String TimingConstraint;
        public Date TimingConstraintDate;
        public String TimeSlotType;
        public String TimeSlotTypeIndicator;
        public Datetime CreateDateTime;
        public String SpecVersionNr;
        public String Id;
        public String Descr;
        public String Unit;
        transient String[] PlannedDuration_type_info = new String[]{'PlannedDuration','http://ibus.czncorp.com/ESB/BusinessObjects','TimePeriod','0','1','false'};
        transient String[] ActualDuration_type_info = new String[]{'ActualDuration','http://ibus.czncorp.com/ESB/BusinessObjects','TimePeriod','0','1','false'};
        transient String[] CurrentDuration_type_info = new String[]{'CurrentDuration','http://ibus.czncorp.com/ESB/BusinessObjects','TimePeriod','0','1','false'};
        transient String[] ScheduledDuration_type_info = new String[]{'ScheduledDuration','http://ibus.czncorp.com/ESB/BusinessObjects','TimePeriod','0','1','false'};
        transient String[] ProjectElementSpecSpecifies_type_info = new String[]{'ProjectElementSpecSpecifies','http://ibus.czncorp.com/ESB/BusinessObjects','ProjectElementSpec','0','1','false'};
        transient String[] LifecycleStatus_type_info = new String[]{'LifecycleStatus','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] Priority_type_info = new String[]{'Priority','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] Description_type_info = new String[]{'Description','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] TimingConstraint_type_info = new String[]{'TimingConstraint','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] TimingConstraintDate_type_info = new String[]{'TimingConstraintDate','http://www.w3.org/2001/XMLSchema','date','0','1','false'};
        transient String[] TimeSlotType_type_info = new String[]{'TimeSlotType','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] TimeSlotTypeIndicator_type_info = new String[]{'TimeSlotTypeIndicator','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] CreateDateTime_type_info = new String[]{'CreateDateTime','http://www.w3.org/2001/XMLSchema','datetime','0','1','false'};
        transient String[] SpecVersionNr_type_info = new String[]{'SpecVersionNr','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] Id_type_info = new String[]{'Id','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] Descr_type_info = new String[]{'Descr','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] Unit_type_info = new String[]{'Unit','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
        transient String[] field_order_type_info = new String[]{'PlannedDuration','ActualDuration','CurrentDuration','ScheduledDuration','ProjectElementSpecSpecifies','LifecycleStatus','Priority','Description','TimingConstraint','TimingConstraintDate','TimeSlotType','TimeSlotTypeIndicator','CreateDateTime','SpecVersionNr','Id','Descr','Unit'};       
    }
    
    public class SpecialDirectoryRequest {
        public Integer DirectoryQuantity;
        public Integer MidiDirectoryQuantity;
        transient String[] DirectoryQuantity_type_info = new String[]{'DirectoryQuantity','http://www.w3.org/2001/XMLSchema','int','0','1','false'};
        transient String[] MidiDirectoryQuantity_type_info = new String[]{'MidiDirectoryQuantity','http://www.w3.org/2001/XMLSchema','int','0','1','false'};
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
        transient String[] field_order_type_info = new String[]{'DirectoryQuantity','MidiDirectoryQuantity'};       
    }
    
    public class SalesChannel {
        public CodeDescriptionPair Type;
        public String PartnerID;
        public String ReferredByID;
        public String TrackingID;
        public String MarketingProgram;
        transient String[] Type_type_info = new String[]{'Type','http://ibus.czncorp.com/ESB/BusinessObjects','CodeDescriptionPair','0','1','false'};
        transient String[] PartnerID_type_info = new String[]{'PartnerID','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] ReferredByID_type_info = new String[]{'ReferredByID','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] TrackingID_type_info = new String[]{'TrackingID','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] MarketingProgram_type_info = new String[]{'MarketingProgram  ','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
        transient String[] field_order_type_info = new String[]{'Type','PartnerID','ReferredByID','TrackingID','MarketingProgram'};             
    }
    
    public class OrderInfluencer {
        public String EmployeeID;
        public String EmployeeName;
        transient String[] EmployeeID_type_info = new String[]{'EmployeeID','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] EmployeeName_type_info = new String[]{'EmployeeName','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
        transient String[] field_order_type_info = new String[]{'EmployeeID','EmployeeName'};               
    }
    
    public class CustomerAccount {
        public String AccountID {get;set;}
        public AccountId CustomerAccountId {get; set;}
        public String AccountType;
        public String CustomerType;
        public ServiceType ServiceType;
        public String Status;
        public Boolean AllowCustomerContactCollectionFlag;
        public Boolean UpsellEligibilityFlag;
        public WS_ESB_BusinessObjects.UpsellDisqualificationReason[] UpsellDisqualificationReason;
        public Boolean HighValueCustomerFlag;
        public Boolean ActiveBankDraftFlag;
        public Boolean ExchangeCarrierLockFlag;
        public String InterExchangeCarrierLockInfo;
        public Boolean ADSLCapableFlag;
        public String ADSLCapableReason;
        public Boolean SDSLCapableFlag;
        public String SDSLCapableReason;
        public String HSIAvailabilityDescription;
        public WS_ESB_BusinessObjects.AvailableSpeed AvailableSpeed;
        public Boolean FiberFlag;
        public WS_ESB_BusinessObjects.InternetInfoType InternetInfo;
        public Boolean FictitiousFlag;
        public Boolean PrimaryServiceFlag;
        public Boolean OrderCreationEligibilityFlag;
        public Date ConnectDate;
        public Date DisconnectDate;
        public String PrivateLineType;
        public String PersonalIdentificationNumber;
        public String TollLimitCode;
        public WS_ESB_BusinessObjects.AccountId BillingAccountId;
        public WS_ESB_BusinessObjects.CustomerBill CustomerBill;
        public WS_ESB_BusinessObjects.Promotion[] CustomerAccountPromotion;
        public WS_ESB_BusinessObjects.AuthorizedCustomerProxy AuthorizedCustomerProxy;
        public WS_ESB_BusinessObjects.Customer Customer {get;set;}
        public String ServiceAddressString;
        public WS_ESB_BusinessObjects.CitizensServiceAddress ServiceAddress;
        public String DirectoryListingType;
        public WS_ESB_BusinessObjects.DirectoryDeliveryInfo[] DirectoryDeliveryInfo;
        public WS_ESB_BusinessObjects.DirectoryListing[] DirectoryListing;
        public WS_ESB_BusinessObjects.DirectoryListingError[] DirectoryListingError;
        public WS_ESB_BusinessObjects.Item[] Item;
        public WS_ESB_BusinessObjects.Product[] Product;
        public WS_ESB_BusinessObjects.Product[] AvailableHighValueProduct;
        public WS_ESB_BusinessObjects.ProductGroup[] ProductGroup;
        public WS_ESB_BusinessObjects.Package_x[] Package_x;
        public WS_ESB_BusinessObjects.CustomerAccountDeposit[] CustomerAccountDeposit;
        public WS_ESB_BusinessObjects.CustomerBankAccount[] CustomerBankAccount;
        public WS_ESB_BusinessObjects.LATA[] InterLATA;
        public WS_ESB_BusinessObjects.LATA[] IntraLATA;
        public WS_ESB_BusinessObjects.OpenServiceOrder[] OpenServiceOrder;
        public WS_ESB_BusinessObjects.CharacteristicValue[] ProvisioningData {get; set;}
        public Boolean FederalTaxExemptFlag;
        public String StateTaxCode;
        public String TaxingDistrict;
        public String TaxingDistrictDescription;
        public WS_ESB_BusinessObjects.Tariff Tariff;
        public WS_ESB_BusinessObjects.TaxCertificate[] TaxCertificate;
        public String SchoolCode;
        public String CountyCode;
        public String CountyName;
        public WS_ESB_BusinessObjects.OtherTaxCode[] OtherTaxCode;
        public WS_ESB_BusinessObjects.CustomerAccountRelationship[] CustomerAccountRelationship;
        public WS_ESB_BusinessObjects.CustomerCallingCard[] CustomerCallingCard;
        public WS_ESB_BusinessObjects.LoyaltyPointsProgram[] FrontierRewardsProgram;
        public WS_ESB_BusinessObjects.OnlineBillPayProfile OnlineBillPayProfile;
        public WS_ESB_BusinessObjects.OnlineBillPayProfileHistory[] OnlineBillPayProfileHistory;
        public WS_ESB_BusinessObjects.VideoServiceAccount[] VideoServiceAccount;
        public WS_ESB_BusinessObjects.CustomerVideoServiceTransaction[] CustomerVideoServiceTransaction;
        public WS_ESB_BusinessObjects.FrontierVideoServiceTransaction[] FrontierVideoServiceTransaction;
        public Datetime LastUpdatedDateTime;
        public String BillPrintVendorSourceCode;
        public WS_ESB_BusinessObjects.AccountReceivableAging AccountReceivableAging;
        public Integer LockboxNumber;
        public String CurrentTreatmentStatus;
        public Date WrittenOffDate;
        public WS_ESB_BusinessObjects.PaymentProfile PaymentProfile;
        public String PaymentTypeBlocked;
        public WS_ESB_BusinessObjects.TemporaryAccountStatus[] TemporaryAccountStatus;
        public String PricingSegmentIndicator;
        public String CustomerPricingSegmentIndicator;
        public WS_ESB_BusinessObjects.AccountId GlobalAccountId;
        public WS_ESB_BusinessObjects.WirelessServiceAccount[] WirelessServiceAccount;
        public String CircuitID;
        public WS_ESB_BusinessObjects.SatelliteAccountInfo SatelliteInfo;
        public WS_ESB_BusinessObjects.TaxInfo BillingAddressTaxInfo;
        public WS_ESB_BusinessObjects.SpecialAccessInformation SpecialAccessInfo; //added
        public WS_ESB_BusinessObjects.AccessRestriction AccessRestriction;
        public String RefundEligibilityIndicator;
        transient String[] AccountID_type_info = new String[]{'AccountID','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] CustomerAccountId_type_info = new String[]{'CustomerAccountId','http://ibus.czncorp.com/ESB/BusinessObjects','AccountId','0','1','false'};
        transient String[] AccountType_type_info = new String[]{'AccountType','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] CustomerType_type_info = new String[]{'CustomerType','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] ServiceType_type_info = new String[]{'ServiceType','http://ibus.czncorp.com/ESB/BusinessObjects','ServiceType','0','1','false'};
        transient String[] Status_type_info = new String[]{'Status','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] AllowCustomerContactCollectionFlag_type_info = new String[]{'AllowCustomerContactCollectionFlag','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        transient String[] UpsellEligibilityFlag_type_info = new String[]{'UpsellEligibilityFlag','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        transient String[] UpsellDisqualificationReason_type_info = new String[]{'UpsellDisqualificationReason','http://ibus.czncorp.com/ESB/BusinessObjects','UpsellDisqualificationReason','0','-1','false'};
        transient String[] HighValueCustomerFlag_type_info = new String[]{'HighValueCustomerFlag','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        transient String[] ActiveBankDraftFlag_type_info = new String[]{'ActiveBankDraftFlag','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        transient String[] ExchangeCarrierLockFlag_type_info = new String[]{'ExchangeCarrierLockFlag','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        transient String[] InterExchangeCarrierLockInfo_type_info = new String[]{'InterExchangeCarrierLockInfo','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] ADSLCapableFlag_type_info = new String[]{'ADSLCapableFlag','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        transient String[] ADSLCapableReason_type_info = new String[]{'ADSLCapableReason','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] SDSLCapableFlag_type_info = new String[]{'SDSLCapableFlag','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        transient String[] SDSLCapableReason_type_info = new String[]{'SDSLCapableReason','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] HSIAvailabilityDescription_type_info = new String[]{'HSIAvailabilityDescription','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] AvailableSpeed_type_info = new String[]{'AvailableSpeed','http://ibus.czncorp.com/ESB/BusinessObjects','AvailableSpeed','0','1','false'};
        transient String[] FiberFlag_type_info = new String[]{'FiberFlag','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        transient String[] InternetInfo_type_info = new String[]{'InternetInfo','http://ibus.czncorp.com/ESB/BusinessObjects','InternetInfoType','0','1','false'};
        transient String[] FictitiousFlag_type_info = new String[]{'FictitiousFlag','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        transient String[] PrimaryServiceFlag_type_info = new String[]{'PrimaryServiceFlag','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        transient String[] OrderCreationEligibilityFlag_type_info = new String[]{'OrderCreationEligibilityFlag','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        transient String[] ConnectDate_type_info = new String[]{'ConnectDate','http://www.w3.org/2001/XMLSchema','date','0','1','false'};
        transient String[] DisconnectDate_type_info = new String[]{'DisconnectDate','http://www.w3.org/2001/XMLSchema','date','0','1','false'};
        transient String[] PrivateLineType_type_info = new String[]{'PrivateLineType','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] PersonalIdentificationNumber_type_info = new String[]{'PersonalIdentificationNumber','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] TollLimitCode_type_info = new String[]{'TollLimitCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] BillingAccountId_type_info = new String[]{'BillingAccountId','http://ibus.czncorp.com/ESB/BusinessObjects','AccountId','0','1','false'};
        transient String[] CustomerBill_type_info = new String[]{'CustomerBill','http://ibus.czncorp.com/ESB/BusinessObjects','CustomerBill','0','1','false'};
        transient String[] CustomerAccountPromotion_type_info = new String[]{'CustomerAccountPromotion','http://ibus.czncorp.com/ESB/BusinessObjects','Promotion','0','-1','false'};
        transient String[] AuthorizedCustomerProxy_type_info = new String[]{'AuthorizedCustomerProxy','http://ibus.czncorp.com/ESB/BusinessObjects','AuthorizedCustomerProxy','0','1','false'};
        transient String[] Customer_type_info = new String[]{'Customer','http://ibus.czncorp.com/ESB/BusinessObjects','Customer','0','1','false'};
        transient String[] ServiceAddressString_type_info = new String[]{'ServiceAddressString','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] ServiceAddress_type_info = new String[]{'ServiceAddress','http://ibus.czncorp.com/ESB/BusinessObjects','CitizensServiceAddress','0','1','false'};
        transient String[] DirectoryListingType_type_info = new String[]{'DirectoryListingType','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] DirectoryDeliveryInfo_type_info = new String[]{'DirectoryDeliveryInfo','http://ibus.czncorp.com/ESB/BusinessObjects','DirectoryDeliveryInfo','0','-1','false'};
        transient String[] DirectoryListing_type_info = new String[]{'DirectoryListing','http://ibus.czncorp.com/ESB/BusinessObjects','DirectoryListing','0','-1','false'};
        transient String[] DirectoryListingError_type_info = new String[]{'DirectoryListingError','http://ibus.czncorp.com/ESB/BusinessObjects','DirectoryListingError','0','-1','false'};
        transient String[] Item_type_info = new String[]{'Item','http://ibus.czncorp.com/ESB/BusinessObjects','Item','0','-1','false'};
        transient String[] Product_type_info = new String[]{'Product','http://ibus.czncorp.com/ESB/BusinessObjects','Product','0','-1','false'};        
        transient String[] AvailableHighValueProduct_type_info = new String[]{'AvailableHighValueProduct','http://ibus.czncorp.com/ESB/BusinessObjects','Product','0','-1','false'};
        transient String[] ProductGroup_type_info = new String[]{'ProductGroup','http://ibus.czncorp.com/ESB/BusinessObjects','ProductGroup','0','-1','false'};
        transient String[] Package_x_type_info = new String[]{'Package','http://ibus.czncorp.com/ESB/BusinessObjects','Package_x','0','-1','false'};
        transient String[] CustomerAccountDeposit_type_info = new String[]{'CustomerAccountDeposit','http://ibus.czncorp.com/ESB/BusinessObjects','CustomerAccountDeposit','0','-1','false'};
        transient String[] CustomerBankAccount_type_info = new String[]{'CustomerBankAccount','http://ibus.czncorp.com/ESB/BusinessObjects','CustomerBankAccount','0','-1','false'};
        transient String[] InterLATA_type_info = new String[]{'InterLATA','http://ibus.czncorp.com/ESB/BusinessObjects','LATA','0','-1','false'};
        transient String[] IntraLATA_type_info = new String[]{'IntraLATA','http://ibus.czncorp.com/ESB/BusinessObjects','LATA','0','-1','false'};
        transient String[] OpenServiceOrder_type_info = new String[]{'OpenServiceOrder','http://ibus.czncorp.com/ESB/BusinessObjects','OpenServiceOrder','0','-1','false'};
        transient String[] ProvisioningData_type_info = new String[]{'ProvisioningData','http://ibus.czncorp.com/ESB/BusinessObjects','CharacteristicValue','0','-1','false'};
        transient String[] FederalTaxExemptFlag_type_info = new String[]{'FederalTaxExemptFlag','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        transient String[] StateTaxCode_type_info = new String[]{'StateTaxCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] TaxingDistrict_type_info = new String[]{'TaxingDistrict','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] TaxingDistrictDescription_type_info = new String[]{'TaxingDistrictDescription','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] Tariff_type_info = new String[]{'Tariff','http://ibus.czncorp.com/ESB/BusinessObjects','Tariff','0','1','false'};
        transient String[] TaxCertificate_type_info = new String[]{'TaxCertificate','http://ibus.czncorp.com/ESB/BusinessObjects','TaxCertificate','0','-1','false'};       
        transient String[] SchoolCode_type_info = new String[]{'SchoolCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] CountyCode_type_info = new String[]{'CountyCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] CountyName_type_info = new String[]{'CountyName','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] OtherTaxCode_type_info = new String[]{'OtherTaxCode','http://ibus.czncorp.com/ESB/BusinessObjects','OtherTaxCode','0','-1','false'};
        transient String[] CustomerAccountRelationship_type_info = new String[]{'CustomerAccountRelationship','http://ibus.czncorp.com/ESB/BusinessObjects','CustomerAccountRelationship','0','-1','false'};
        transient String[] CustomerCallingCard_type_info = new String[]{'CustomerCallingCard','http://ibus.czncorp.com/ESB/BusinessObjects','CustomerCallingCard','0','-1','false'};
        transient String[] FrontierRewardsProgram_type_info = new String[]{'FrontierRewardsProgram','http://ibus.czncorp.com/ESB/BusinessObjects','LoyaltyPointsProgram','0','-1','false'};
        transient String[] OnlineBillPayProfile_type_info = new String[]{'OnlineBillPayProfile','http://ibus.czncorp.com/ESB/BusinessObjects','OnlineBillPayProfile','0','-1','false'};
        transient String[] OnlineBillPayProfileHistory_type_info = new String[]{'OnlineBillPayProfileHistory','http://ibus.czncorp.com/ESB/BusinessObjects','OnlineBillPayProfileHistory','0','-1','false'};
        transient String[] VideoServiceAccount_type_info = new String[]{'VideoServiceAccount','http://ibus.czncorp.com/ESB/BusinessObjects','VideoServiceAccount','0','-1','false'};
        transient String[] CustomerVideoServiceTransaction_type_info = new String[]{'CustomerVideoServiceTransaction','http://ibus.czncorp.com/ESB/BusinessObjects','CustomerVideoServiceTransaction','0','-1','false'};
        transient String[] FrontierVideoServiceTransaction_type_info = new String[]{'FrontierVideoServiceTransaction','http://ibus.czncorp.com/ESB/BusinessObjects','FrontierVideoServiceTransaction','0','-1','false'};
        transient String[] LastUpdatedDateTime_type_info = new String[]{'LastUpdatedDateTime','http://www.w3.org/2001/XMLSchema','datetime','0','1','false'};
        transient String[] BillPrintVendorSourceCode_type_info = new String[]{'BillPrintVendorSourceCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] AccountReceivableAging_type_info = new String[]{'AccountReceivableAging','http://ibus.czncorp.com/ESB/BusinessObjects','AccountReceivableAging','0','1','false'};        
        transient String[] LockboxNumber_type_info = new String[]{'LockboxNumber','http://www.w3.org/2001/XMLSchema','int','0','1','false'};
        transient String[] CurrentTreatmentStatus_type_info = new String[]{'CurrentTreatmentStatus','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] WrittenOffDate_type_info = new String[]{'WrittenOffDate','http://www.w3.org/2001/XMLSchema','date','0','1','false'};
        transient String[] PaymentProfile_type_info = new String[]{'PaymentProfile','http://ibus.czncorp.com/ESB/BusinessObjects','PaymentProfile','0','1','false'};
        transient String[] PaymentTypeBlocked_type_info = new String[]{'PaymentTypeBlocked','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] TemporaryAccountStatus_type_info = new String[]{'TemporaryAccountStatus','http://ibus.czncorp.com/ESB/BusinessObjects','TemporaryAccountStatus','0','-1','false'};
        transient String[] PricingSegmentIndicator_type_info = new String[]{'PricingSegmentIndicator','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] CustomerPricingSegmentIndicator_type_info = new String[]{'CustomerPricingSegmentIndicator','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] GlobalAccountId_type_info = new String[]{'GlobalAccountId','http://ibus.czncorp.com/ESB/BusinessObjects','AccountId','0','1','false'};
        transient String[] WirelessServiceAccount_type_info = new String[]{'WirelessServiceAccount','http://ibus.czncorp.com/ESB/BusinessObjects','WirelessServiceAccount','0','-1','false'};
        transient String[] CircuitID_type_info = new String[]{'CircuitID','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] SatelliteInfo_type_info = new String[]{'SatelliteInfo','http://ibus.czncorp.com/ESB/BusinessObjects','SatelliteAccountInfo','0','1','false'};
        transient String[] BillingAddressTaxInfo_type_info = new String[]{'BillingAddressTaxInfo','http://ibus.czncorp.com/ESB/BusinessObjects','TaxInfo','0','1','false'}; 
        transient String[] SpecialAccessInfo_type_info = new String[]{'SpecialAccessInfo','http://ibus.czncorp.com/ESB/BusinessObjects','SpecialAccessInformation','0','1','false'};    
        transient String[] AccessRestriction_type_info = new String[]{'AccessRestriction','http://ibus.czncorp.com/ESB/BusinessObjects','AccessRestriction','0','1','false'};    
        transient String[] RefundEligibilityIndicator_type_info = new String[]{'RefundEligibilityIndicator','http://www.w3.org/2001/XMLSchema','string','0','1','false'};        
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
        transient String[] field_order_type_info = new String[]{'AccountID','CustomerAccountId','AccountType','CustomerType','ServiceType','Status','AllowCustomerContactCollectionFlag','UpsellEligibilityFlag','UpsellDisqualificationReason','HighValueCustomerFlag','ActiveBankDraftFlag','ExchangeCarrierLockFlag','InterExchangeCarrierLockInfo','ADSLCapableFlag','ADSLCapableReason','SDSLCapableFlag','SDSLCapableReason','HSIAvailabilityDescription','AvailableSpeed','FiberFlag','InternetInfo','FictitiousFlag','PrimaryServiceFlag','OrderCreationEligibilityFlag','ConnectDate','DisconnectDate','PrivateLineType','PersonalIdentificationNumber','TollLimitCode','BillingAccountId','CustomerBill','CustomerAccountPromotion','AuthorizedCustomerProxy','Customer','ServiceAddressString','ServiceAddress','DirectoryListingType','DirectoryDeliveryInfo','DirectoryListing','DirectoryListingError','Item','Product','AvailableHighValueProduct','ProductGroup','Package_x','CustomerAccountDeposit','CustomerBankAccount','InterLATA','IntraLATA','OpenServiceOrder','ProvisioningData','FederalTaxExemptFlag','StateTaxCode','TaxingDistrict','TaxingDistrictDescription','Tariff','TaxCertificate','SchoolCode','CountyCode','CountyName','OtherTaxCode','CustomerAccountRelationship','CustomerCallingCard','FrontierRewardsProgram','OnlineBillPayProfile','OnlineBillPayProfileHistory','VideoServiceAccount','CustomerVideoServiceTransaction','FrontierVideoServiceTransaction','LastUpdatedDateTime','BillPrintVendorSourceCode','AccountReceivableAging','LockboxNumber','CurrentTreatmentStatus','WrittenOffDate','PaymentProfile','PaymentTypeBlocked','TemporaryAccountStatus','PricingSegmentIndicator','CustomerPricingSegmentIndicator','GlobalAccountId','WirelessServiceAccount','CircuitID','SatelliteInfo','BillingAddressTaxInfo','SpecialAccessInfo','AccessRestriction','RefundEligibilityIndicator'};
    }
    
    public class AccessRestriction {
        public String restrictedToGroupId;
        transient String[] restrictedToGroupId_type_info = new String[]{'restrictedToGroupId','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
      transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
      transient String[] field_order_type_info = new String[]{'restrictedToGroupId'};    
    }
    
    public class RewardsProgram {
        public String RewardsProgramType;
        public Date SentDate;
        public Date BillDate;
        transient String[] RewardsProgramType_type_info = new String[]{'RewardsProgramType','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] SentDate_type_info = new String[]{'SentDate','http://www.w3.org/2001/XMLSchema','date','0','1','false'};
        transient String[] BillDate_type_info = new String[]{'BillDate','http://www.w3.org/2001/XMLSchema','date','0','1','false'};
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
        transient String[] field_order_type_info = new String[]{'RewardsProgramType','SentDate','BillDate'};        
    }
    
    public class LoyaltyPointsProgram {
        public String RewardsProgramType;
        public Date SentDate;
        public Date BillDate;
        public Integer ThisMonthPoints;
        public Integer LastMonthPoints;
        transient String[] RewardsProgramType_type_info = new String[]{'RewardsProgramType','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] SentDate_type_info = new String[]{'SentDate','http://www.w3.org/2001/XMLSchema','date','0','1','false'};
        transient String[] BillDate_type_info = new String[]{'BillDate','http://www.w3.org/2001/XMLSchema','date','0','1','false'};
        transient String[] ThisMonthPoints_type_info = new String[]{'ThisMonthPoints','http://www.w3.org/2001/XMLSchema','int','0','1','false'};
        transient String[] LastMonthPoints_type_info = new String[]{'LastMonthPoints','http://www.w3.org/2001/XMLSchema','int','0','1','false'};
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
        transient String[] field_order_type_info = new String[]{'RewardsProgramType','SentDate','BillDate','ThisMonthPoints','LastMonthPoints'};        
    }
    public class OnlineBillPayProfile {
        public Boolean OnlineBillPayCustomerFlag;
        public Boolean BlockOnlineBillPayFlag;
        public String OnlineBillPayEnrollmentStatus;
        public UserInfo UserInfo;
        public SecurityInfo[] SecurityInfo;
        transient String[] OnlineBillPayCustomerFlag_type_info = new String[]{'OnlineBillPayCustomerFlag','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        transient String[] BlockOnlineBillPayFlag_type_info = new String[]{'BlockOnlineBillPayFlag','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        transient String[] OnlineBillPayEnrollmentStatus_type_info = new String[]{'OnlineBillPayEnrollmentStatus','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] UserInfo_type_info = new String[]{'UserInfo','http://ibus.czncorp.com/ESB/BusinessObjects','UserInfo','0','1','false'};
        transient String[] SecurityInfo_type_info = new String[]{'SecurityInfo','http://ibus.czncorp.com/ESB/BusinessObjects','SecurityInfo','0','-1','false'};
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
        transient String[] field_order_type_info = new String[]{'OnlineBillPayCustomerFlag','BlockOnlineBillPayFlag','OnlineBillPayEnrollmentStatus','UserInfo','SecurityInfo'};        
    }
    public class SecurityInfo {
        public String SecurityQuestion;
        public String SecurityAnswer;
        transient String[] SecurityQuestion_type_info = new String[]{'SecurityQuestion','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] SecurityAnswer_type_info = new String[]{'SecurityAnswer','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
        transient String[] field_order_type_info = new String[]{'SecurityQuestion','SecurityAnswer'};       
    }
    public class OnlineBillPayProfileHistory {
        public Date LastUpdateDate;
        public String LastActionCode;
        public Boolean PrintFlag;
        public Boolean AutoPayFlag;
        public Boolean ErrorFlag;
        transient String[] LastUpdateDate_type_info = new String[]{'LastUpdateDate','http://www.w3.org/2001/XMLSchema','date','0','1','false'};
        transient String[] LastActionCode_type_info = new String[]{'LastActionCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] PrintFlag_type_info = new String[]{'PrintFlag','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        transient String[] AutoPayFlag_type_info = new String[]{'AutoPayFlag','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        transient String[] ErrorFlag_type_info = new String[]{'ErrorFlag','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
        transient String[] field_order_type_info = new String[]{'LastUpdateDate','LastActionCode','PrintFlag','AutoPayFlag','ErrorFlag'};       
    }
    public class VideoServiceAccount {
        public String VideoServiceType;
        public Boolean ActiveFlag;
        public String VideoServiceAccountNumber;
        public Datetime LastUpdatedDateTime;
        transient String[] VideoServiceType_type_info = new String[]{'VideoServiceType','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] ActiveFlag_type_info = new String[]{'ActiveFlag','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        transient String[] VideoServiceAccountNumber_type_info = new String[]{'VideoServiceAccountNumber','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] LastUpdatedDateTime_type_info = new String[]{'LastUpdatedDateTime','http://www.w3.org/2001/XMLSchema','datetime','0','1','false'};
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
        transient String[] field_order_type_info = new String[]{'VideoServiceType','ActiveFlag','VideoServiceAccountNumber','LastUpdatedDateTime'};     
    }
    public class VideoServiceTransaction {
        public String VideoServiceType;
        public String VideoServiceAccountNumber;
        public String ItemCode;
        public String Action;
        public String Activity;
        public Datetime TransactionDateTime;
        transient String[] VideoServiceType_type_info = new String[]{'VideoServiceType','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] VideoServiceAccountNumber_type_info = new String[]{'VideoServiceAccountNumber','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] ItemCode_type_info = new String[]{'ItemCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] Action_type_info = new String[]{'Action','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] Activity_type_info = new String[]{'Activity','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] TransactionDateTime_type_info = new String[]{'TransactionDateTime','http://www.w3.org/2001/XMLSchema','datetime','0','1','false'};
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
        transient String[] field_order_type_info = new String[]{'VideoServiceType','VideoServiceAccountNumber','ItemCode','Action','Activity','TransactionDateTime'};       
    }
    public class CustomerVideoServiceTransaction {
        public String VideoServiceType;
        public String VideoServiceAccountNumber;
        public String ItemCode;
        public String Action;
        public String Activity;
        public Datetime TransactionDateTime;
        public String OldVideoServiceAccountNumber;
        public String OrderId;
        public String UpdatedBy;
        transient String[] VideoServiceType_type_info = new String[]{'VideoServiceType','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] VideoServiceAccountNumber_type_info = new String[]{'VideoServiceAccountNumber','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] ItemCode_type_info = new String[]{'ItemCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] Action_type_info = new String[]{'Action','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] Activity_type_info = new String[]{'Activity','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] TransactionDateTime_type_info = new String[]{'TransactionDateTime','http://www.w3.org/2001/XMLSchema','datetime','0','1','false'};
        transient String[] OldVideoServiceAccountNumber_type_info = new String[]{'OldVideoServiceAccountNumber','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] OrderId_type_info = new String[]{'OrderId','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] UpdatedBy_type_info = new String[]{'UpdatedBy','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
        transient String[] field_order_type_info = new String[]{'VideoServiceType','VideoServiceAccountNumber','ItemCode','Action','Activity','TransactionDateTime','OldVideoServiceAccountNumber','OrderId','UpdatedBy'};      
    }
    public class FrontierVideoServiceTransaction {
        public String VideoServiceType;
        public String VideoServiceAccountNumber;
        public String ItemCode;
        public String Action;
        public String Activity;
        public Datetime TransactionDateTime;
        public String CustomerName;
        transient String[] VideoServiceType_type_info = new String[]{'VideoServiceType','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] VideoServiceAccountNumber_type_info = new String[]{'VideoServiceAccountNumber','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] ItemCode_type_info = new String[]{'ItemCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] Action_type_info = new String[]{'Action','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] Activity_type_info = new String[]{'Activity','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] TransactionDateTime_type_info = new String[]{'TransactionDateTime','http://www.w3.org/2001/XMLSchema','datetime','0','1','false'};
        transient String[] CustomerName_type_info = new String[]{'CustomerName','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
        transient String[] field_order_type_info = new String[]{'VideoServiceType','VideoServiceAccountNumber','ItemCode','Action','Activity','TransactionDateTime','CustomerName'};        
    }
    public class AccountReceivableAging {
        public Decimal Receivable1To30DaysPastDueAmount;
        public Decimal Receivable31To60DaysPastDueAmount;
        public Decimal Receivable61To90DaysPastDueAmount;
        public Decimal ReceivableOver90DaysPastDueAmount;
        transient String[] Receivable1To30DaysPastDueAmount_type_info = new String[]{'Receivable1To30DaysPastDueAmount','http://www.w3.org/2001/XMLSchema','decimal','0','1','false'};
        transient String[] Receivable31To60DaysPastDueAmount_type_info = new String[]{'Receivable31To60DaysPastDueAmount','http://www.w3.org/2001/XMLSchema','decimal','0','1','false'};
        transient String[] Receivable61To90DaysPastDueAmount_type_info = new String[]{'Receivable61To90DaysPastDueAmount','http://www.w3.org/2001/XMLSchema','decimal','0','1','false'};
        transient String[] ReceivableOver90DaysPastDueAmount_type_info = new String[]{'ReceivableOver90DaysPastDueAmount','http://www.w3.org/2001/XMLSchema','decimal','0','1','false'};
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
        transient String[] field_order_type_info = new String[]{'Receivable1To30DaysPastDueAmount','Receivable31To60DaysPastDueAmount','Receivable61To90DaysPastDueAmount','ReceivableOver90DaysPastDueAmount'};        
    }
    public class PaymentProfile {
        public String Id;
        public Boolean ActivatedFlag;
        public Datetime LastUpdatedDateTime;
        public String LastUpdatedByUserId;
        public CreditCardPaymentSource CreditCardPaymentSource;
        transient String[] Id_type_info = new String[]{'Id','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] ActivatedFlag_type_info = new String[]{'ActivatedFlag','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        transient String[] LastUpdatedDateTime_type_info = new String[]{'LastUpdatedDateTime','http://www.w3.org/2001/XMLSchema','datetime','0','1','false'};
        transient String[] LastUpdatedByUserId_type_info = new String[]{'LastUpdatedByUserId','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] CreditCardPaymentSource_type_info = new String[]{'CreditCardPaymentSource','http://ibus.czncorp.com/ESB/BusinessObjects','CreditCardPaymentSource','0','1','false'};
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
        transient String[] field_order_type_info = new String[]{'Id','ActivatedFlag','LastUpdatedDateTime','LastUpdatedByUserId','CreditCardPaymentSource'};        
    }
    public class PaymentSource {
        public String PaymentSourceCode;
        public String PaymentSourceDescription;
        public String AccountId;
        public String AccountHolderName;
        public CitizensPostalAddress AccountHolderAddress;
        public Email NotificationEmailAddress;
        transient String[] PaymentSourceCode_type_info = new String[]{'PaymentSourceCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] PaymentSourceDescription_type_info = new String[]{'PaymentSourceDescription','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] AccountId_type_info = new String[]{'AccountId','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] AccountHolderName_type_info = new String[]{'AccountHolderName','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] AccountHolderAddress_type_info = new String[]{'AccountHolderAddress','http://ibus.czncorp.com/ESB/BusinessObjects','CitizensPostalAddress','0','1','false'};
        transient String[] NotificationEmailAddress_type_info = new String[]{'NotificationEmailAddress','http://ibus.czncorp.com/ESB/BusinessObjects','Email','0','1','false'};
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
        transient String[] field_order_type_info = new String[]{'PaymentSourceCode','PaymentSourceDescription','AccountId','AccountHolderName','AccountHolderAddress','NotificationEmailAddress'};      
    }
    public class TemporaryAccountStatus {
        public String Reason;
        public Boolean ActiveFlag;
        public TimePeriod ActiveDuring;
        transient String[] Reason_type_info = new String[]{'Reason','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] ActiveFlag_type_info = new String[]{'ActiveFlag','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        transient String[] ActiveDuring_type_info = new String[]{'ActiveDuring','http://ibus.czncorp.com/ESB/BusinessObjects','TimePeriod','0','1','false'};
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
        transient String[] field_order_type_info = new String[]{'Reason','ActiveFlag','ActiveDuring'};      
    }
    public class WirelessServiceAccount {
        public AccountId AccountNumber;
        public String KeyName;
        public String DataValue;
        public String OrderNumber;
        transient String[] AccountNumber_type_info = new String[]{'AccountNumber','http://ibus.czncorp.com/ESB/BusinessObjects','AccountId','0','1','false'};
        transient String[] KeyName_type_info = new String[]{'KeyName','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] DataValue_type_info = new String[]{'DataValue','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] OrderNumber_type_info = new String[]{'OrderNumber','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
        transient String[] field_order_type_info = new String[]{'AccountNumber','KeyName','DataValue','OrderNumber'};       
    }
    public class PartnerInfo {
        public String PartnerId;
        public Integer ReassignmentNumber;
        transient String[] PartnerId_type_info = new String[]{'PartnerId','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] ReassignmentNumber_type_info = new String[]{'ReassignmentNumber','http://www.w3.org/2001/XMLSchema','int','0','1','false'};
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
        transient String[] field_order_type_info = new String[]{'PartnerId','ReassignmentNumber'};      
    }
    public class SatelliteAccountInfo {
        public String PartnerId;
        public Integer ReassignmentNumber;
        public String SatelliteAccountNumber;
        public String Satellite;
        transient String[] PartnerId_type_info = new String[]{'PartnerId','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] ReassignmentNumber_type_info = new String[]{'ReassignmentNumber','http://www.w3.org/2001/XMLSchema','int','0','1','false'};
        transient String[] SatelliteAccountNumber_type_info = new String[]{'SatelliteAccountNumber','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] Satellite_type_info = new String[]{'Satellite','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
        transient String[] field_order_type_info = new String[]{'PartnerId','ReassignmentNumber','SatelliteAccountNumber','Satellite'};     
    }
    public class GlobalPosition {
        public String Latitude;
        public String Longitude;
        public String GeoCode;
        transient String[] Latitude_type_info = new String[]{'Latitude','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] Longitude_type_info = new String[]{'Longitude','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] GeoCode_type_info = new String[]{'GeoCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
        transient String[] field_order_type_info = new String[]{'Latitude','Longitude','GeoCode'};      
    }
    public class TaxInfo {
        public GlobalPosition GlobalPosition;
        public String IncorporatedIndicator;
        public CitizensPostalAddress PostalAddress;
        transient String[] GlobalPosition_type_info = new String[]{'GlobalPosition','http://ibus.czncorp.com/ESB/BusinessObjects','GlobalPosition','0','1','false'};
        transient String[] IncorporatedIndicator_type_info = new String[]{'IncorporatedIndicator','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] PostalAddress_type_info = new String[]{'PostalAddress','http://ibus.czncorp.com/ESB/BusinessObjects','CitizensPostalAddress','0','1','false'};
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
        transient String[] field_order_type_info = new String[]{'GlobalPosition','IncorporatedIndicator','PostalAddress'};      
    }
    
    public class OtherTaxCode {
        public String TaxCode;
        public String Description;
        transient String[] TaxCode_type_info = new String[]{'TaxCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] Description_type_info = new String[]{'Description','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
        transient String[] field_order_type_info = new String[]{'TaxCode','Description'};       
    }
    
    public class CustomerAccountRelationship {
        public String RelationshipType;
        public WS_ESB_BusinessObjects.CustomerAccountReference CustomerAccountReference;
        transient String[] RelationshipType_type_info = new String[]{'RelationshipType','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] CustomerAccountReference_type_info = new String[]{'CustomerAccountReference','http://ibus.czncorp.com/ESB/BusinessObjects','CustomerAccountReference','0','1','false'};
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
        transient String[] field_order_type_info = new String[]{'RelationshipType','CustomerAccountReference'};     
    }
    
    public class CustomerAccountReference {
        public TelephoneNumber RelatedTelephoneNumber;
        transient String[] RelatedTelephoneNumber_type_info = new String[]{'RelatedTelephoneNumber','http://ibus.czncorp.com/ESB/BusinessObjects','TelephoneNumber','0','1','false'};
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
        transient String[] field_order_type_info = new String[]{'RelatedTelephoneNumber'};      
    }
    
    public class CustomerCallingCard {
        public Integer SequenceNumber;
        public String Status;
        public Date EffectiveDate;
        public String PersonalIdentificationNumber;
        public String PersonalIdentificationNumberAction;
        public Integer CardQuantity;
        public String CardType;
        public String OrderCode;
        public String OrderId;
        public String ServiceClass;
        transient String[] SequenceNumber_type_info = new String[]{'SequenceNumber','http://www.w3.org/2001/XMLSchema','int','0','1','false'};
        transient String[] Status_type_info = new String[]{'Status','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] EffectiveDate_type_info = new String[]{'EffectiveDate','http://www.w3.org/2001/XMLSchema','date','0','1','false'};
        transient String[] PersonalIdentificationNumber_type_info = new String[]{'PersonalIdentificationNumber','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] PersonalIdentificationNumberAction_type_info = new String[]{'PersonalIdentificationNumberAction','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] CardQuantity_type_info = new String[]{'CardQuantity','http://www.w3.org/2001/XMLSchema','int','0','1','false'};
        transient String[] CardType_type_info = new String[]{'CardType','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] OrderCode_type_info = new String[]{'OrderCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] OrderId_type_info = new String[]{'OrderId','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] ServiceClass_type_info = new String[]{'ServiceClass','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
        transient String[] field_order_type_info = new String[]{'SequenceNumber','Status','EffectiveDate','PersonalIdentificationNumber','PersonalIdentificationNumberAction','CardQuantity','CardType','OrderCode','OrderId','ServiceClass'};      
    }
    
    public class DirectoryDeliveryInfo {
        public Integer DirectoryLabelQuantity;
        public Integer MidiDirectoryLabelQuantity;
        public String MailingAddressSource;
        public WS_ESB_BusinessObjects.OverrideDirectoryRecipient OverrideDirectoryRecipient;
        transient String[] DirectoryLabelQuantity_type_info = new String[]{'DirectoryLabelQuantity','http://www.w3.org/2001/XMLSchema','int','0','1','false'};
        transient String[] MidiDirectoryLabelQuantity_type_info = new String[]{'MidiDirectoryLabelQuantity','http://www.w3.org/2001/XMLSchema','int','0','1','false'};
        transient String[] MailingAddressSource_type_info = new String[]{'MailingAddressSource','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] OverrideDirectoryRecipient_type_info = new String[]{'OverrideDirectoryRecipient','http://ibus.czncorp.com/ESB/BusinessObjects','OverrideDirectoryRecipient','0','1','false'};
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
        transient String[] field_order_type_info = new String[]{'DirectoryLabelQuantity','MidiDirectoryLabelQuantity','MailingAddressSource','OverrideDirectoryRecipient'}; 
    }
    
    public class OverrideDirectoryRecipient {
        public WS_ESB_BusinessObjects.Individual Individual;
        public WS_ESB_BusinessObjects.Organization Organization;
        public WS_ESB_BusinessObjects.TelephoneNumber[] TelephoneNumber;
        public WS_ESB_BusinessObjects.CitizensPostalAddress[] CitizensPostalAddress;
        public WS_ESB_BusinessObjects.TimePeriod ValidFor;
        public Boolean NameFormatFlag;
        transient String[] Individual_type_info = new String[]{'Individual','http://ibus.czncorp.com/ESB/BusinessObjects','Individual','0','1','false'};
        transient String[] Organization_type_info = new String[]{'Organization','http://ibus.czncorp.com/ESB/BusinessObjects','Organization','0','1','false'};
        transient String[] TelephoneNumber_type_info = new String[]{'TelephoneNumber','http://ibus.czncorp.com/ESB/BusinessObjects','TelephoneNumber','0','-1','false'};
        transient String[] CitizensPostalAddress_type_info = new String[]{'CitizensPostalAddress','http://ibus.czncorp.com/ESB/BusinessObjects','CitizensPostalAddress','0','-1','false'};
        transient String[] ValidFor_type_info = new String[]{'ValidFor','http://ibus.czncorp.com/ESB/BusinessObjects','TimePeriod','0','1','false'};
        transient String[] NameFormatFlag_type_info = new String[]{'NameFormatFlag','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
        transient String[] field_order_type_info = new String[]{'Individual','Organization','TelephoneNumber','CitizensPostalAddress','ValidFor','NameFormatFlag'};     
    }
    
    public class DirectoryListing {
        public Integer ListingSequence;
        public WS_ESB_BusinessObjects.DirectoryListingInfo[] DirectoryListingInfo;
        transient String[] ListingSequence_type_info = new String[]{'ListingSequence','http://www.w3.org/2001/XMLSchema','int','0','1','false'};
        transient String[] DirectoryListingInfo_type_info = new String[]{'DirectoryListingInfo','http://ibus.czncorp.com/ESB/BusinessObjects','DirectoryDeliveryInfo','0','-1','false'};
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
        transient String[] field_order_type_info = new String[]{'ListingSequence','DirectoryListingInfo'};      
    }
    
    public class DirectoryListingInfo {
        public DirectoryCode[] DirectoryCode;
        public Integer LineNumber;
        public String DirectoryTextLine;
        transient String[] DirectoryCode_type_info = new String[]{'DirectoryCode','http://ibus.czncorp.com/ESB/BusinessObjects','DirectoryCode','0','1','false'};
        transient String[] LineNumber_type_info = new String[]{'LineNumber','http://www.w3.org/2001/XMLSchema','int','0','1','false'};
        transient String[] DirectoryTextLine_type_info = new String[]{'DirectoryTextLine','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
        transient String[] field_order_type_info = new String[]{'DirectoryCode','LineNumber','DirectoryTextLine'};
    }
    
    public class DirectoryCode {
        public Integer CodeNumber;
        public String DirectoryCode;
        transient String[] CodeNumber_type_info = new String[]{'CodeNumber','http://www.w3.org/2001/XMLSchema','int','0','1','false'};
        transient String[] DirectoryCode_type_info = new String[]{'DirectoryCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
        transient String[] field_order_type_info = new String[]{'CodeNumber','DirectoryCode'};      
    }
    
    public class DirectoryListingError {
        public String OrderId;
        public Datetime OrderDate;
        public String[] Description;
        transient String[] OrderId_type_info = new String[]{'OrderId','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] OrderDate_type_info = new String[]{'OrderDate','http://www.w3.org/2001/XMLSchema','datetime','0','1','false'};
        transient String[] Description_type_info = new String[]{'Description','http://ibus.czncorp.com/ESB/BusinessObjects','String','0','-1','false'};
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
        transient String[] field_order_type_info = new String[]{'OrderId','OrderDate','Description'};       
    }
    
    public class TaxCertificate {
        public String CustomerName;
        public WS_ESB_BusinessObjects.Email ContactEmail;
        public String TaxCertificateNumber;
        public String TaxCertificateStatus;
        public String UpdatingOrderID;
        public WS_ESB_BusinessObjects.CitizensPostalAddress TaxCertificateAddress;
        public String TaxCertificateCustomerType;
        public WS_ESB_BusinessObjects.TaxExemption[] TaxExemption;
        transient String[] CustomerName_type_info = new String[]{'CustomerName','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] ContactEmail_type_info = new String[]{'ContactEmail','http://ibus.czncorp.com/ESB/BusinessObjects','Email','0','1','false'};
        transient String[] TaxCertificateNumber_type_info = new String[]{'TaxCertificateNumber','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] TaxCertificateStatus_type_info = new String[]{'TaxCertificateStatus','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] UpdatingOrderID_type_info = new String[]{'UpdatingOrderID','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] TaxCertificateAddress_type_info = new String[]{'TaxCertificateAddress','http://ibus.czncorp.com/ESB/BusinessObjects','CitizensPostalAddress','0','1','false'};
        transient String[] TaxCertificateCustomerType_type_info = new String[]{'TaxCertificateCustomerType','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] TaxExemption_type_info = new String[]{'TaxExemption','http://ibus.czncorp.com/ESB/BusinessObjects','TaxExemption','0','-1','false'};
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
        transient String[] field_order_type_info = new String[]{'CustomerName','ContactEmail','TaxCertificateNumber','TaxCertificateStatus','UpdatingOrderID','TaxCertificateAddress','TaxCertificateCustomerType','TaxExemption'};     
    }
    
    public class TaxExemption {
        public String TaxExemptionType;
        public String IssuingJurisdiction;
        public String TaxExemptCode;
        public TimePeriod TaxExemptValidFor;
        transient String[] TaxExemptionType_type_info = new String[]{'TaxExemptionType','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] IssuingJurisdiction_type_info = new String[]{'IssuingJurisdiction','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] TaxExemptCode_type_info = new String[]{'TaxExemptCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] TaxExemptValidFor_type_info = new String[]{'TaxExemptValidFor','http://ibus.czncorp.com/ESB/BusinessObjects','TimePeriod','0','1','false'};
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
        transient String[] field_order_type_info = new String[]{'TaxExemptionType','IssuingJurisdiction','TaxExemptCode','TaxExemptValidFor'};      
    }
    
    public class Product {
        public String ProductName;
        public String Description;
        public Integer ProductId;
        public String ProductCode;
        public String ProductGroupId;
        public Boolean HighValueFlag;
        public String[] ProductLine;
        public String AdditionalInformationText;
        public WS_ESB_BusinessObjects.TermPriceDifference[] TermPriceDifference;
        public WS_ESB_BusinessObjects.Price Price;
        public WS_ESB_BusinessObjects.CharacteristicValue[] CharacteristicValue;
        public WS_ESB_BusinessObjects.TimePeriod ValidFor;
        public WS_ESB_BusinessObjects.Item[] Item;
        public WS_ESB_BusinessObjects.Product[] Product;
        public WS_ESB_BusinessObjects.Item ProductItem;
        transient String[] ProductName_type_info = new String[]{'ProductName','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] Description_type_info = new String[]{'Description','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] ProductId_type_info = new String[]{'ProductId','http://www.w3.org/2001/XMLSchema','int','0','1','false'};
        transient String[] ProductCode_type_info = new String[]{'ProductCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] ProductGroupId_type_info = new String[]{'ProductGroupId','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] HighValueFlag_type_info = new String[]{'HighValueFlag','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        transient String[] ProductLine_type_info = new String[]{'ProductLine','http://ibus.czncorp.com/ESB/BusinessObjects','String','0','-1','false'};
        transient String[] AdditionalInformationText_type_info = new String[]{'AdditionalInformationText','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] TermPriceDifference_type_info = new String[]{'TermPriceDifference','http://ibus.czncorp.com/ESB/BusinessObjects','TermPriceDifference','0','-1','false'};
        transient String[] Price_type_info = new String[]{'Price','http://ibus.czncorp.com/ESB/BusinessObjects','Price','0','1','false'};
        transient String[] CharacteristicValue_type_info = new String[]{'CharacteristicValue','http://ibus.czncorp.com/ESB/BusinessObjects','CharacteristicValue','0','-1','false'};
        transient String[] ValidFor_type_info = new String[]{'ValidFor','http://ibus.czncorp.com/ESB/BusinessObjects','TimePeriod','0','1','false'};
        transient String[] Item_type_info = new String[]{'Item','http://ibus.czncorp.com/ESB/BusinessObjects','Item','0','-1','false'};
        transient String[] Product_type_info = new String[]{'Product','http://ibus.czncorp.com/ESB/BusinessObjects','Product','0','-1','false'};
        transient String[] ProductItem_type_info = new String[]{'ProductItem','http://ibus.czncorp.com/ESB/BusinessObjects','Item','0','1','false'};
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
        transient String[] field_order_type_info = new String[]{'ProductName','Description','ProductId','ProductCode','ProductGroupId','HighValueFlag','ProductLine','AdditionalInformationText','TermPriceDifference','Price','CharacteristicValue','ValidFor','Item','Product','ProductItem'};        
    }
    
    public class TermPriceDifference {
        public String TermLength;
        public Decimal DifferenceAmount;
        transient String[] TermLength_type_info = new String[]{'TermLength','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] DifferenceAmount_type_info = new String[]{'DifferenceAmount','http://www.w3.org/2001/XMLSchema','decimal','0','1','false'};
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
        transient String[] field_order_type_info = new String[]{'TermLength','DifferenceAmount'};       
    }
    
    public class ProductGroup {
        public String ProductGroupId;
        public Integer ProductGroupSequence;
        public Boolean ShowIfEmptyFlag;
        transient String[] ProductGroupId_type_info = new String[]{'ProductGroupId','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] ProductGroupSequence_type_info = new String[]{'ProductGroupSequence','http://www.w3.org/2001/XMLSchema','int','0','1','false'};
        transient String[] ShowIfEmptyFlag_type_info = new String[]{'ShowIfEmptyFlag','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
        transient String[] field_order_type_info = new String[]{'ProductGroupId','ProductGroupSequence','ShowIfEmptyFlag'};     
    }
    
    public class Package_x {
        public String PackageName;
        public String Description;
        public String PackageId;
        public WS_ESB_BusinessObjects.Price Price;
        public WS_ESB_BusinessObjects.CharacteristicValue[] CharacteristicValue;
        public WS_ESB_BusinessObjects.TimePeriod ValidFor;
        public WS_ESB_BusinessObjects.Item[] Item;
        public WS_ESB_BusinessObjects.Item PackageItem;
        transient String[] PackageName_type_info = new String[]{'PackageName','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] Description_type_info = new String[]{'Description','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] PackageId_type_info = new String[]{'PackageId','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] Price_type_info = new String[]{'Price','http://ibus.czncorp.com/ESB/BusinessObjects','Price','0','1','false'};
        transient String[] CharacteristicValue_type_info = new String[]{'CharacteristicValue','http://ibus.czncorp.com/ESB/BusinessObjects','CharacteristicValue','0','-1','false'};
        transient String[] ValidFor_type_info = new String[]{'ValidFor','http://ibus.czncorp.com/ESB/BusinessObjects','TimePeriod','0','1','false'};
        transient String[] Item_type_info = new String[]{'Item','http://ibus.czncorp.com/ESB/BusinessObjects','Item','0','-1','false'};
        transient String[] PackageItem_type_info = new String[]{'PackageItem','http://ibus.czncorp.com/ESB/BusinessObjects','Item','0','1','false'};
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
        transient String[] field_order_type_info = new String[]{'PackageName','Description','PackageId','Price','CharacteristicValue','ValidFor','Item','PackageItem'};     
    }
    
    public class CustomerAccountDeposit {
        public String Description;
        public Date DepositDate;
        public Decimal DepositAmount;
        public String DepositCode;
        public Decimal InterestAmount;
        public String InterestMethod;
        public Decimal InterestToDate;
        public Date InterestToDateThru;
        public String InterestAmountThru;
        public Decimal RefundsToDate;
        public Date DepositRefundedDate;
        public Date InterestRefundedDate;
        public WS_ESB_BusinessObjects.CustomerAccountDepositDetail CustomerAccountDepositDetail;
        transient String[] Description_type_info = new String[]{'Description','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] DepositDate_type_info = new String[]{'DepositDate','http://www.w3.org/2001/XMLSchema','date','0','1','false'};
        transient String[] DepositAmount_type_info = new String[]{'DepositAmount','http://www.w3.org/2001/XMLSchema','decimal','0','1','false'};
        transient String[] DepositCode_type_info = new String[]{'DepositCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] InterestAmount_type_info = new String[]{'InterestAmount','http://www.w3.org/2001/XMLSchema','decimal','0','1','false'};
        transient String[] InterestMethod_type_info = new String[]{'InterestMethod','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] InterestToDate_type_info = new String[]{'InterestToDate','http://www.w3.org/2001/XMLSchema','decimal','0','1','false'};
        transient String[] InterestToDateThru_type_info = new String[]{'InterestToDateThru','http://www.w3.org/2001/XMLSchema','date','0','1','false'};
        transient String[] InterestAmountThru_type_info = new String[]{'InterestAmountThru','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] RefundsToDate_type_info = new String[]{'RefundsToDate','http://www.w3.org/2001/XMLSchema','decimal','0','1','false'};
        transient String[] DepositRefundedDate_type_info = new String[]{'DepositRefundedDate','http://www.w3.org/2001/XMLSchema','date','0','1','false'};
        transient String[] InterestRefundedDate_type_info = new String[]{'InterestRefundedDate','http://www.w3.org/2001/XMLSchema','date','0','1','false'};
        transient String[] CustomerAccountDepositDetail_type_info = new String[]{'CustomerAccountDepositDetail','http://ibus.czncorp.com/ESB/BusinessObjects','CustomerAccountDepositDetail','0','1','false'};
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
        transient String[] field_order_type_info = new String[]{'Description','DepositDate','DepositAmount','DepositCode','InterestAmount','InterestMethod','InterestToDate','InterestToDateThru','InterestAmountThru','RefundsToDate','DepositRefundedDate','InterestRefundedDate','CustomerAccountDepositDetail'};        
    }
    
    public class CustomerAccountDepositDetail {
        public Decimal DepositRefundAmount;
        public String DepositRefundChargeCode;
        public String DepositRefundCheckDescription;
        public String DepositRefundGeneralLedgerAccountNumber;
        public Decimal InterestRefundAmount;
        public String InterestRefundChargeCode;
        public String InterestRefundCheckDescription;
        public String InterestRefundGeneralLedgerAccountNumber;
        transient String[] DepositRefundAmount_type_info = new String[]{'DepositRefundAmount','http://www.w3.org/2001/XMLSchema','decimal','0','1','false'};
        transient String[] DepositRefundChargeCode_type_info = new String[]{'DepositRefundChargeCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] DepositRefundCheckDescription_type_info = new String[]{'DepositRefundCheckDescription','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] DepositRefundGeneralLedgerAccountNumber_type_info = new String[]{'DepositRefundGeneralLedgerAccountNumber','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] InterestRefundAmount_type_info = new String[]{'InterestRefundAmount','http://www.w3.org/2001/XMLSchema','decimal','0','1','false'};
        transient String[] InterestRefundChargeCode_type_info = new String[]{'InterestRefundChargeCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] InterestRefundCheckDescription_type_info = new String[]{'InterestRefundCheckDescription','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] InterestRefundGeneralLedgerAccountNumber_type_info = new String[]{'InterestRefundGeneralLedgerAccountNumber','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
        transient String[] field_order_type_info = new String[]{'DepositRefundAmount','DepositRefundChargeCode','DepositRefundCheckDescription','DepositRefundGeneralLedgerAccountNumber','InterestRefundAmount','InterestRefundChargeCode','InterestRefundCheckDescription','InterestRefundGeneralLedgerAccountNumber'};       
    }
    
    public class CustomerBankAccount {
        public String BankName;
        public String BankNumber;
        public String BankAccountNumber;
        public String BankAccountType;
        public WS_ESB_BusinessObjects.IndividualContact BankContact;
        public Integer SequenceNumber;
        transient String[] BankName_type_info = new String[]{'BankName','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] BankNumber_type_info = new String[]{'BankNumber','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] BankAccountNumber_type_info = new String[]{'BankAccountNumber','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] BankAccountType_type_info = new String[]{'BankAccountType','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] BankContact_type_info = new String[]{'BankContact','http://ibus.czncorp.com/ESB/BusinessObjects','WS_ESB_BusinessObjects.IndividualContact','0','1','false'};
        transient String[] SequenceNumber_type_info = new String[]{'SequenceNumber','http://www.w3.org/2001/XMLSchema','int','0','1','false'};
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
        transient String[] field_order_type_info = new String[]{'BankName','BankNumber','BankAccountNumber','BankAccountType','BankContact','SequenceNumber'};      
    }
    
    public class LATA {
        public String LATAType;
        public String Type;
        public Integer SequenceNumber;
        public String RegulatoryRegistrationCode;
        public String RegulatoryRegistrationNumber;
        public String OperatingCompanyNumber;
        public Date EffectiveDate;
        public String EffectiveTime;
        public String StateCode;
        public String OrderId;
        public String SourceCode;
        public Boolean AcceptThirdPartyCallsFlag;
        public Boolean AcceptCollectCallsFlag;
        public Boolean PreviousAcceptThirdPartyCallsFlag;
        public Boolean PreviousAcceptCollectCallsFlag;
        public String ThirdPartyVerificationNumber;
        transient String[] LATAType_type_info = new String[]{'LATAType','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] Type_type_info = new String[]{'Type','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] SequenceNumber_type_info = new String[]{'SequenceNumber','http://www.w3.org/2001/XMLSchema','int','0','1','false'};
        transient String[] RegulatoryRegistrationCode_type_info = new String[]{'RegulatoryRegistrationCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] RegulatoryRegistrationNumber_type_info = new String[]{'RegulatoryRegistrationNumber','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] OperatingCompanyNumber_type_info = new String[]{'OperatingCompanyNumber','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] EffectiveDate_type_info = new String[]{'EffectiveDate','http://www.w3.org/2001/XMLSchema','date','0','1','false'};
        transient String[] EffectiveTime_type_info = new String[]{'EffectiveTime','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] StateCode_type_info = new String[]{'StateCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] OrderId_type_info = new String[]{'OrderId','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] SourceCode_type_info = new String[]{'SourceCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] AcceptThirdPartyCallsFlag_type_info = new String[]{'AcceptThirdPartyCallsFlag','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        transient String[] AcceptCollectCallsFlag_type_info = new String[]{'AcceptCollectCallsFlag','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        transient String[] PreviousAcceptThirdPartyCallsFlag_type_info = new String[]{'PreviousAcceptThirdPartyCallsFlag','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        transient String[] PreviousAcceptCollectCallsFlag_type_info = new String[]{'PreviousAcceptCollectCallsFlag','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        transient String[] ThirdPartyVerificationNumber_type_info = new String[]{'ThirdPartyVerificationNumber','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
        transient String[] field_order_type_info = new String[]{'LATAType','Type','SequenceNumber','RegulatoryRegistrationCode','RegulatoryRegistrationNumber','OperatingCompanyNumber','EffectiveDate','EffectiveTime','StateCode','OrderId','SourceCode','AcceptThirdPartyCallsFlag','AcceptCollectCallsFlag','PreviousAcceptThirdPartyCallsFlag','PreviousAcceptCollectCallsFlag','ThirdPartyVerificationNumber'};       
    }
    
    public class Tariff {
        public String Code;
        public String Description;
        transient String[] Code_type_info = new String[]{'Code','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] Description_type_info = new String[]{'Description','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
        transient String[] field_order_type_info = new String[]{'Code','Description'};      
    }
    
    public class ProductCatalogInformation {
        public String Name;
        public String GroupingName;
        public String LongDescription;
        public String Sku;
        public String GenericSku;
        public Boolean UseGenericSkuFlag;
        public Integer Priority;
        public Price Price;
        transient String[] Name_type_info = new String[]{'Name','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] GroupingName_type_info = new String[]{'GroupingName','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] LongDescription_type_info = new String[]{'LongDescription','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] Sku_type_info = new String[]{'Sku','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] GenericSku_type_info = new String[]{'GenericSku','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] UseGenericSkuFlag_type_info = new String[]{'UseGenericSkuFlag','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        transient String[] Priority_type_info = new String[]{'Priority','http://www.w3.org/2001/XMLSchema','int','0','1','false'};
        transient String[] Price_type_info = new String[]{'Price','http://ibus.czncorp.com/ESB/BusinessObjects','Price','0','1','false'};
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
        transient String[] field_order_type_info = new String[]{'Name','GroupingName','LongDescription','Sku','GenericSku','UseGenericSkuFlag','Priority','Price'};     
    }
    
    public class Item {
        public Integer OrderLineNumber;
        public WS_ESB_BusinessObjects.Price[] Price;
        public Integer Quantity;
        public WS_ESB_BusinessObjects.Price ProratedPrice;
        public WS_ESB_BusinessObjects.Price MonthlyRecurringCharge;
        public WS_ESB_BusinessObjects.Price NonRecurringCharge;
        public String ItemCode;
        public String ItemId;
        public String Name;
        public String Description;
        public String ItemType;
        public String ChargeCode;
        public String ChargeType;
        public String ProrateCode;
        public String Action;
        public String ActionReason;
        public String ProcessingDirection;
        public String TaxableCode;
        public String OverrideReason;
        public String OverrideAllowable;
        public WS_ESB_BusinessObjects.RemarkText[] RemarkText;
        public WS_ESB_BusinessObjects.CharacteristicValue[] CharacteristicValue;
        public WS_ESB_BusinessObjects.TimePeriod ValidFor;
        public WS_ESB_BusinessObjects.ProductCatalogInformation ProductCatalogInformation;
        public WS_ESB_BusinessObjects.Item[] Item;
        public String InstallOrderId;
        public String RemovalOrderId;
        public String ItemActionType;
        public String DisconnectReasonCode;
        public Boolean IsRefundable;
        public Boolean IsSelfInstall;
        public String InternetUploadSpeed;
        public Integer ExternalOrderLineNumber;
        public String InternetDownloadSpeed;
        public String PreferredPromotionGroup;
        public WS_ESB_BusinessObjects.ProductRelationship ProductRelationship;
        public Decimal VacationPercentageDiscount;
        transient String[] OrderLineNumber_type_info = new String[]{'OrderLineNumber','http://www.w3.org/2001/XMLSchema','int','0','1','false'};
        transient String[] Price_type_info = new String[]{'Price','http://ibus.czncorp.com/ESB/BusinessObjects','Price','0','-1','false'};
        transient String[] Quantity_type_info = new String[]{'Quantity','http://www.w3.org/2001/XMLSchema','int','0','1','false'};
        transient String[] ProratedPrice_type_info = new String[]{'ProratedPrice','http://ibus.czncorp.com/ESB/BusinessObjects','Price','0','1','false'};
        transient String[] MonthlyRecurringCharge_type_info = new String[]{'MonthlyRecurringCharge','http://ibus.czncorp.com/ESB/BusinessObjects','Price','0','1','false'};
        transient String[] NonRecurringCharge_type_info = new String[]{'NonRecurringCharge','http://ibus.czncorp.com/ESB/BusinessObjects','Price','0','1','false'};
        transient String[] ItemCode_type_info = new String[]{'ItemCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] ItemId_type_info = new String[]{'ItemId','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] Name_type_info = new String[]{'Name','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] Description_type_info = new String[]{'Description','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] ItemType_type_info = new String[]{'ItemType','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] ChargeCode_type_info = new String[]{'ChargeCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] ChargeType_type_info = new String[]{'ChargeType','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] ProrateCode_type_info = new String[]{'ProrateCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] Action_type_info = new String[]{'Action','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] ActionReason_type_info = new String[]{'ActionReason','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] ProcessingDirection_type_info = new String[]{'ProcessingDirection','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] TaxableCode_type_info = new String[]{'TaxableCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] OverrideReason_type_info = new String[]{'OverrideReason','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] OverrideAllowable_type_info = new String[]{'OverrideAllowable','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] RemarkText_type_info = new String[]{'RemarkText','http://ibus.czncorp.com/ESB/BusinessObjects','RemarkText','0','-1','false'};
        transient String[] CharacteristicValue_type_info = new String[]{'CharacteristicValue','http://ibus.czncorp.com/ESB/BusinessObjects','CharacteristicValue','0','-1','false'};
        transient String[] ValidFor_type_info = new String[]{'ValidFor','http://ibus.czncorp.com/ESB/BusinessObjects','TimePeriod','0','1','false'};
        transient String[] ProductCatalogInformation_type_info = new String[]{'ProductCatalogInformation','http://ibus.czncorp.com/ESB/BusinessObjects','ProductCatalogInformation','0','1','false'};
        transient String[] Item_type_info = new String[]{'Item','http://ibus.czncorp.com/ESB/BusinessObjects','Item','0','-1','false'};
        transient String[] InstallOrderId_type_info = new String[]{'InstallOrderId','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] RemovalOrderId_type_info = new String[]{'RemovalOrderId','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] ItemActionType_type_info = new String[]{'ItemActionType','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] DisconnectReasonCode_type_info = new String[]{'DisconnectReasonCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] IsRefundable_type_info = new String[]{'IsRefundable','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        transient String[] IsSelfInstall_type_info = new String[]{'IsSelfInstall','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        transient String[] InternetUploadSpeed_type_info = new String[]{'InternetUploadSpeed','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] ExternalOrderLineNumber_type_info = new String[]{'ExternalOrderLineNumber','http://www.w3.org/2001/XMLSchema','int','0','1','false'};
        transient String[] InternetDownloadSpeed_type_info = new String[]{'InternetDownloadSpeed','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] PreferredPromotionGroup_type_info = new String[]{'PreferredPromotionGroup','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] ProductRelationship_type_info = new String[]{'ProductRelationship','http://ibus.czncorp.com/ESB/BusinessObjects','ProductRelationship','0','1','false'};
        transient String[] VacationPercentageDiscount_type_info = new String[]{'VacationPercentageDiscount','http://www.w3.org/2001/XMLSchema','decimal','0','1','false'};
        
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
        transient String[] field_order_type_info = new String[]{'OrderLineNumber','Price','Quantity','ProratedPrice','MonthlyRecurringCharge','NonRecurringCharge','ItemCode','ItemId','Name','Description','ItemType','ChargeCode','ChargeType','ProrateCode','Action','ActionReason','ProcessingDirection','TaxableCode','OverrideReason','OverrideAllowable','RemarkText','CharacteristicValue','ValidFor','ProductCatalogInformation','Item','InstallOrderId','RemovalOrderId','ItemActionType','DisconnectReasonCode','IsRefundable','IsSelfInstall','InternetUploadSpeed','ExternalOrderLineNumber','InternetDownloadSpeed','PreferredPromotionGroup','ProductRelationship','VacationPercentageDiscount'};        

        public Item(){
            Price = new List<WS_ESB_BusinessObjects.Price>();
        }        
    }
    
    public class ProductRelationship{
        public Integer Id;
        public Integer RelatedId;
        public String Type;
        transient String[] Id_type_info = new String[]{'Id','http://www.w3.org/2001/XMLSchema','int','0','1','false'};
        transient String[] RelatedId_type_info = new String[]{'RelatedId','http://www.w3.org/2001/XMLSchema','int','0','1','false'};
        transient String[] Type_type_info = new String[]{'Type','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
        transient String[] field_order_type_info = new String[]{'Id','RelatedId','Type'};     
    }
    
    public class ServiceType {
        public String Name;
        public String Description;
        public String LongDescription;
        transient String[] Name_type_info = new String[]{'Name','http://www.w3.org/2001/XMLSchema','String','0','1','false'};
        transient String[] Description_type_info = new String[]{'Description','http://www.w3.org/2001/XMLSchema','String','0','1','false'};
        transient String[] LongDescription_type_info = new String[]{'LongDescription','http://www.w3.org/2001/XMLSchema','String','0','1','false'};
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
        transient String[] field_order_type_info = new String[]{'Name','Description','LongDescription'};
    }
    
    public class CustomerBill{
        public Date BillDate;
        public Integer BillingDayOfMonth;
        public String BillNo;
        public Decimal BillAmount;
        public Date LastBillThrough;
        public Decimal AdjustmentAmount;
        public Decimal LastBillAmount;
        public Date LastNoticeDate;
        public Date LastPaymentReceivedDate;
        public String CurrencyType;
        public Decimal Amount31To60;
        public Decimal Amount61To90;
        public Decimal AmountOver90;
        public Decimal Amount0To30;
        public Date PaymentDueDate;
        public Long QuantityOfBills;
        public String BillingMethod;
        public String HandlingCode;
        public String BillingDetailLevel;
        public Integer DirectoryListingAllowance;
        public String DiscountId;
        public String INPRemoteNumber;
        public WS_ESB_BusinessObjects.AccountId BillingSummaryAccountId;
        public Boolean OnDeferredPaymentArrangementFlag;
        public Integer ExistingPaymentExtension;
        public Date LastDisconnectForNonPaymentDate;
        public Integer AtRiskToChurnScore;
        public Integer PropensityToPayScore;
        public Decimal PastDueAmount;
        public Decimal Over60DaysPastDueAmount;
        public Date LastStatementIssueDate;
        public Decimal LastStatementAmount;
        public Date LastStatementDueDate;
        public Decimal LastAdjustmentAmount;
        public Date LastPaymentDate;
        public Decimal LastPaymentAmount;
        public Decimal CurrentBalance;
        public Boolean AutoPayDisabledFlag;
        public Boolean BillPrintEnabledFlag;
        public Date LastPromotionDemotionDate;
        public Integer SecondNoticesPriorToLastPromotionDemotion;
        public Integer ReturnedChecksPriorToLastPromotionDemotion;
        public Integer DisconnectsPriorToLastPromotionDemotion;
        public Decimal TollAmountSinceLastBill;
        public Integer LastBillPeriod;
        public Integer LastBillCycle;
        public Date BilledThroughDate;
        public String LastBillMethod;
        public String PriorCreditRating;
        public Boolean ServiceOrderActivitySinceLastBillFlag;
        public Boolean BilledSeperatelyLastPeriodFlag;
        public Boolean ConsolidationFlag;
        public Date ConsolidationDate;
        transient String[] BillDate_type_info = new String[]{'BillDate','http://www.w3.org/2001/XMLSchema','date','0','1','false'};
        transient String[] BillingDayOfMonth_type_info = new String[]{'BillingDayOfMonth','http://www.w3.org/2001/XMLSchema','int','0','1','false'};
        transient String[] BillNo_type_info = new String[]{'BillNo','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] BillAmount_type_info = new String[]{'BillAmount','http://www.w3.org/2001/XMLSchema','decimal','0','1','false'};
        transient String[] LastBillThrough_type_info = new String[]{'LastBillThrough','http://www.w3.org/2001/XMLSchema','date','0','1','false'};
        transient String[] AdjustmentAmount_type_info = new String[]{'AdjustmentAmount','http://www.w3.org/2001/XMLSchema','decimal','0','1','false'};
        transient String[] LastBillAmount_type_info = new String[]{'LastBillAmount','http://www.w3.org/2001/XMLSchema','decimal','0','1','false'};
        transient String[] LastNoticeDate_type_info = new String[]{'LastNoticeDate','http://www.w3.org/2001/XMLSchema','date','0','1','false'};
        transient String[] LastPaymentReceivedDate_type_info = new String[]{'LastPaymentReceivedDate','http://www.w3.org/2001/XMLSchema','date','0','1','false'};
        transient String[] CurrencyType_type_info = new String[]{'CurrencyType','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] Amount31To60_type_info = new String[]{'Amount31To60','http://www.w3.org/2001/XMLSchema','decimal','0','1','false'};
        transient String[] Amount61To90_type_info = new String[]{'Amount61To90','http://www.w3.org/2001/XMLSchema','decimal','0','1','false'};
        transient String[] AmountOver90_type_info = new String[]{'AmountOver90','http://www.w3.org/2001/XMLSchema','decimal','0','1','false'};
        transient String[] Amount0To30_type_info = new String[]{'Amount0To30','http://www.w3.org/2001/XMLSchema','decimal','0','1','false'};
        transient String[] PaymentDueDate_type_info = new String[]{'PaymentDueDate','http://www.w3.org/2001/XMLSchema','date','0','1','false'};
        transient String[] QuantityOfBills_type_info = new String[]{'QuantityOfBills','http://www.w3.org/2001/XMLSchema','long','0','1','false'};
        transient String[] BillingMethod_type_info = new String[]{'BillingMethod','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] HandlingCode_type_info = new String[]{'HandlingCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] BillingDetailLevel_type_info = new String[]{'BillingDetailLevel','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] DirectoryListingAllowance_type_info = new String[]{'DirectoryListingAllowance','http://www.w3.org/2001/XMLSchema','int','0','1','false'};
        transient String[] DiscountId_type_info = new String[]{'DiscountId','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] INPRemoteNumber_type_info = new String[]{'INPRemoteNumber','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] BillingSummaryAccountId_type_info = new String[]{'BillingSummaryAccountId','http://ibus.czncorp.com/ESB/BusinessObjects','AccountId','0','1','false'};
        transient String[] OnDeferredPaymentArrangementFlag_type_info = new String[]{'OnDeferredPaymentArrangementFlag','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        transient String[] ExistingPaymentExtension_type_info = new String[]{'ExistingPaymentExtension','http://www.w3.org/2001/XMLSchema','int','0','1','false'};
        transient String[] LastDisconnectForNonPaymentDate_type_info = new String[]{'LastDisconnectForNonPaymentDate','http://www.w3.org/2001/XMLSchema','date','0','1','false'};
        transient String[] AtRiskToChurnScore_type_info = new String[]{'AtRiskToChurnScore','http://www.w3.org/2001/XMLSchema','int','0','1','false'};
        transient String[] PropensityToPayScore_type_info = new String[]{'PropensityToPayScore','http://www.w3.org/2001/XMLSchema','int','0','1','false'};
        transient String[] PastDueAmount_type_info = new String[]{'PastDueAmount','http://www.w3.org/2001/XMLSchema','decimal','0','1','false'};
        transient String[] Over60DaysPastDueAmount_type_info = new String[]{'Over60DaysPastDueAmount','http://www.w3.org/2001/XMLSchema','decimal','0','1','false'};
        transient String[] LastStatementIssueDate_type_info = new String[]{'LastStatementIssueDate','http://www.w3.org/2001/XMLSchema','date','0','1','false'};
        transient String[] LastStatementAmount_type_info = new String[]{'LastStatementAmount','http://www.w3.org/2001/XMLSchema','decimal','0','1','false'};
        transient String[] LastStatementDueDate_type_info = new String[]{'LastStatementDueDate','http://www.w3.org/2001/XMLSchema','date','0','1','false'};
        transient String[] LastAdjustmentAmount_type_info = new String[]{'LastAdjustmentAmount','http://www.w3.org/2001/XMLSchema','decimal','0','1','false'};
        transient String[] LastPaymentDate_type_info = new String[]{'LastPaymentDate','http://www.w3.org/2001/XMLSchema','date','0','1','false'};
        transient String[] LastPaymentAmount_type_info = new String[]{'LastPaymentAmount','http://www.w3.org/2001/XMLSchema','decimal','0','1','false'};
        transient String[] CurrentBalance_type_info = new String[]{'CurrentBalance','http://www.w3.org/2001/XMLSchema','decimal','0','1','false'};
        transient String[] AutoPayDisabledFlag_type_info = new String[]{'AutoPayDisabledFlag','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        transient String[] BillPrintEnabledFlag_type_info = new String[]{'BillPrintEnabledFlag','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        transient String[] LastPromotionDemotionDate_type_info = new String[]{'LastPromotionDemotionDate','http://www.w3.org/2001/XMLSchema','date','0','1','false'};
        transient String[] SecondNoticesPriorToLastPromotionDemotion_type_info = new String[]{'SecondNoticesPriorToLastPromotionDemotion','http://www.w3.org/2001/XMLSchema','int','0','1','false'};
        transient String[] ReturnedChecksPriorToLastPromotionDemotion_type_info = new String[]{'ReturnedChecksPriorToLastPromotionDemotion','http://www.w3.org/2001/XMLSchema','int','0','1','false'};
        transient String[] DisconnectsPriorToLastPromotionDemotion_type_info = new String[]{'DisconnectsPriorToLastPromotionDemotion','http://www.w3.org/2001/XMLSchema','int','0','1','false'};
        transient String[] TollAmountSinceLastBill_type_info = new String[]{'TollAmountSinceLastBill','http://www.w3.org/2001/XMLSchema','decimal','0','1','false'};
        transient String[] LastBillPeriod_type_info = new String[]{'LastBillPeriod','http://www.w3.org/2001/XMLSchema','int','0','1','false'};
        transient String[] LastBillCycle_type_info = new String[]{'LastBillCycle','http://www.w3.org/2001/XMLSchema','int','0','1','false'};
        transient String[] BilledThroughDate_type_info = new String[]{'BilledThroughDate','http://www.w3.org/2001/XMLSchema','date','0','1','false'};
        transient String[] LastBillMethod_type_info = new String[]{'LastBillMethod','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] PriorCreditRating_type_info = new String[]{'PriorCreditRating','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] ServiceOrderActivitySinceLastBillFlag_type_info = new String[]{'ServiceOrderActivitySinceLastBillFlag','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        transient String[] BilledSeperatelyLastPeriodFlag_type_info = new String[]{'BilledSeperatelyLastPeriodFlag','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        transient String[] ConsolidationFlag_type_info = new String[]{'ConsolidationFlag','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        transient String[] ConsolidationDate_type_info = new String[]{'ConsolidationDate','http://www.w3.org/2001/XMLSchema','date','0','1','false'};
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
        transient String[] field_order_type_info = new String[]{'BillDate','BillingDayOfMonth','BillNo','BillAmount','LastBillThrough','AdjustmentAmount','LastBillAmount','LastNoticeDate','LastPaymentReceivedDate','CurrencyType','Amount31To60','Amount61To90','AmountOver90','Amount0To30','PaymentDueDate','QuantityOfBills','BillingMethod','HandlingCode','BillingDetailLevel','DirectoryListingAllowance','DiscountId','INPRemoteNumber','BillingSummaryAccountId','OnDeferredPaymentArrangementFlag','ExistingPaymentExtension','LastDisconnectForNonPaymentDate','AtRiskToChurnScore','PropensityToPayScore','PastDueAmount','Over60DaysPastDueAmount','LastStatementIssueDate','LastStatementAmount','LastStatementDueDate','LastAdjustmentAmount','LastPaymentDate','LastPaymentAmount','CurrentBalance','AutoPayDisabledFlag','BillPrintEnabledFlag','LastPromotionDemotionDate','SecondNoticesPriorToLastPromotionDemotion','ReturnedChecksPriorToLastPromotionDemotion','DisconnectsPriorToLastPromotionDemotion','TollAmountSinceLastBill','LastBillPeriod','LastBillCycle','BilledThroughDate','LastBillMethod','PriorCreditRating','ServiceOrderActivitySinceLastBillFlag','BilledSeperatelyLastPeriodFlag','ConsolidationFlag','ConsolidationDate'};
    }
    
    public class Promotion {
        public String PromotionKey;
        public String PromotionId;
        public String PromotionName;
        public String Description;
        public Integer SequenceNumber;
        public Boolean GlobalPromotionFlag;
        public Boolean DisabledFlag;
        public String PromotionStatus;
        public String ContractStatus;
        public Date ContractStartDate;
        public Date ContractEndDate;
        public Date CreditStartDate;
        public Date CreditEndDate;
        public Date CreditDisqualificationDate;
        public Decimal CreditAmount;
        public Decimal PercentageDiscountAmount;
        public Integer CreditFrequency;
        public Integer GracePeriodDaysOfDuration;
        public String AutoRenewStatus;
        public String OverrideCode;
        public String OverridingUser;
        public Date OverrideDate;
        public Decimal PenaltyAmount;
        public Decimal ConfiguredPenaltyAmount;
        public Boolean PenaltyAmountProratedFlag;
        public String DisqualifyingReason;
        public WS_ESB_BusinessObjects.TelephoneNumber PromotionTelephoneNumber;
        public WS_ESB_BusinessObjects.ProductCatalogInformation ProductCatalogInformation;
        public WS_ESB_BusinessObjects.Verification PromotionVerification;
        public WS_ESB_BusinessObjects.DiscountedItem DiscountedItem;
        public WS_ESB_BusinessObjects.OrderReference OrderReference;
        public Integer CommitmentMonths;
        transient String[] PromotionKey_type_info = new String[]{'PromotionKey','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] PromotionId_type_info = new String[]{'PromotionId','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] PromotionName_type_info = new String[]{'PromotionName','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] Description_type_info = new String[]{'Description','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] SequenceNumber_type_info = new String[]{'SequenceNumber','http://www.w3.org/2001/XMLSchema','integer','0','1','false'};
        transient String[] GlobalPromotionFlag_type_info = new String[]{'GlobalPromotionFlag','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        transient String[] DisabledFlag_type_info = new String[]{'DisabledFlag','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        transient String[] PromotionStatus_type_info = new String[]{'PromotionStatus','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] ContractStatus_type_info = new String[]{'ContractStatus','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] ContractStartDate_type_info = new String[]{'ContractStartDate','http://www.w3.org/2001/XMLSchema','date','0','1','false'};
        transient String[] ContractEndDate_type_info = new String[]{'ContractEndDate','http://www.w3.org/2001/XMLSchema','date','0','1','false'};
        transient String[] CreditStartDate_type_info = new String[]{'CreditStartDate','http://www.w3.org/2001/XMLSchema','date','0','1','false'};
        transient String[] CreditEndDate_type_info = new String[]{'CreditEndDate','http://www.w3.org/2001/XMLSchema','date','0','1','false'};
        transient String[] CreditDisqualificationDate_type_info = new String[]{'CreditDisqualificationDate','http://www.w3.org/2001/XMLSchema','date','0','1','false'};
        transient String[] CreditAmount_type_info = new String[]{'CreditAmount','http://www.w3.org/2001/XMLSchema','decimal','0','1','false'};
        transient String[] PercentageDiscountAmount_type_info = new String[]{'PercentageDiscountAmount','http://www.w3.org/2001/XMLSchema','decimal','0','1','false'};
        transient String[] CreditFrequency_type_info = new String[]{'CreditFrequency','http://www.w3.org/2001/XMLSchema','integer','0','1','false'};
        transient String[] GracePeriodDaysOfDuration_type_info = new String[]{'GracePeriodDaysOfDuration','http://www.w3.org/2001/XMLSchema','integer','0','1','false'};
        transient String[] AutoRenewStatus_type_info = new String[]{'AutoRenewStatus','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] OverrideCode_type_info = new String[]{'OverrideCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] OverridingUser_type_info = new String[]{'OverridingUser','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] OverrideDate_type_info = new String[]{'OverrideDate','http://www.w3.org/2001/XMLSchema','date','0','1','false'};
        transient String[] PenaltyAmount_type_info = new String[]{'PenaltyAmount','http://www.w3.org/2001/XMLSchema','decimal','0','1','false'};
        transient String[] ConfiguredPenaltyAmount_type_info = new String[]{'ConfiguredPenaltyAmount','http://www.w3.org/2001/XMLSchema','decimal','0','1','false'};
        transient String[] PenaltyAmountProratedFlag_type_info = new String[]{'PenaltyAmountProratedFlag','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        transient String[] DisqualifyingReason_type_info = new String[]{'DisqualifyingReason','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] PromotionTelephoneNumber_type_info = new String[]{'PromotionTelephoneNumber','http://ibus.czncorp.com/ESB/BusinessObjects','PromotionTelephoneNumber','0','1','false'};
        transient String[] ProductCatalogInformation_type_info = new String[]{'ProductCatalogInformation','http://ibus.czncorp.com/ESB/BusinessObjects','ProductCatalogInformation','0','1','false'};
        transient String[] PromotionVerification_type_info = new String[]{'PromotionVerification','http://ibus.czncorp.com/ESB/BusinessObjects','PromotionVerification','0','1','false'};
        transient String[] DiscountedItem_type_info = new String[]{'DiscountedItem','http://ibus.czncorp.com/ESB/BusinessObjects','DiscountedItem','0','1','false'};
        transient String[] OrderReference_type_info = new String[]{'OrderReference','http://ibus.czncorp.com/ESB/BusinessObjects','OrderReference','0','1','false'};
        transient String[] CommitmentMonths_type_info = new String[]{'CommitmentMonths','http://www.w3.org/2001/XMLSchema','integer','0','1','false'};
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
        transient String[] field_order_type_info = new String[]{'PromotionKey','PromotionId','PromotionName','Description','SequenceNumber','GlobalPromotionFlag','DisabledFlag','PromotionStatus','ContractStatus','ContractStartDate','ContractEndDate','CreditStartDate','CreditEndDate','CreditDisqualificationDate','CreditAmount','PercentageDiscountAmount','CreditFrequency','GracePeriodDaysOfDuration','AutoRenewStatus','OverrideCode','OverridingUser','OverrideDate','PenaltyAmount','ConfiguredPenaltyAmount','PenaltyAmountProratedFlag','DisqualifyingReason','PromotionTelephoneNumber','ProductCatalogInformation','PromotionVerification','DiscountedItem','OrderReference','CommitmentMonths'};
    }
    
    public class DiscountedItem {
        public String ItemCode;
        public String Description;
        transient String[] ItemCode_type_info = new String[]{'ItemCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] Description_type_info = new String[]{'Description','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
        transient String[] field_order_type_info = new String[]{'ItemCode','Description'};      
    }
    
    public class OrderReference {
        public String OrderId;
        public String OrderedItemCode;
        public String OrderedItemId;
        public Datetime OrderStartDate;
        public Datetime OrderCompleteDate;
        public Datetime OrderPostDate;
        public String OrderActionType;
        transient String[] OrderId_type_info = new String[]{'OrderId','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] OrderedItemCode_type_info = new String[]{'OrderedItemCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] OrderedItemId_type_info = new String[]{'OrderedItemId','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] OrderStartDate_type_info = new String[]{'OrderStartDate','http://www.w3.org/2001/XMLSchema','datetime','0','1','false'};
        transient String[] OrderCompleteDate_type_info = new String[]{'OrderCompleteDate','http://www.w3.org/2001/XMLSchema','datetime','0','1','false'};
        transient String[] OrderPostDate_type_info = new String[]{'OrderPostDate','http://www.w3.org/2001/XMLSchema','datetime','0','1','false'};
        transient String[] OrderActionType_type_info = new String[]{'OrderActionType','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
        transient String[] field_order_type_info = new String[]{'OrderId','OrderedItemCode','OrderedItemId','OrderStartDate','OrderCompleteDate','OrderPostDate','OrderActionType'};        
    }
    
    public class Verification {
        public Datetime VerificationDateTime;
        public Boolean VerificationResponseStatus;
        public String VerificationConfirmationNumber;
        public Integer VerificationPin;
        public VerificationEmailDates[] VerificationEmailDates;
        public Email VerificationEmailAddress;
        public String VerificationUserId;
        transient String[] VerificationDateTime_type_info = new String[]{'VerificationDateTime','http://www.w3.org/2001/XMLSchema','datetime','0','1','false'};
        transient String[] VerificationResponseStatus_type_info = new String[]{'VerificationResponseStatus','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        transient String[] VerificationConfirmationNumber_type_info = new String[]{'VerificationConfirmationNumber','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] VerificationPin_type_info = new String[]{'VerificationPin','http://www.w3.org/2001/XMLSchema','int','0','1','false'};
        transient String[] VerificationEmailDates_type_info = new String[]{'VerificationEmailDates','http://ibus.czncorp.com/ESB/BusinessObjects','VerificationEmailDates','0','-1','false'};
        transient String[] VerificationEmailAddress_type_info = new String[]{'VerificationEmailAddress','http://ibus.czncorp.com/ESB/BusinessObjects','Email','0','1','false'};
        transient String[] VerificationUserId_type_info = new String[]{'VerificationUserId','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
        transient String[] field_order_type_info = new String[]{'VerificationDateTime','VerificationResponseStatus','VerificationConfirmationNumber','VerificationPin','VerificationEmailDates','VerificationEmailAddress','VerificationUserId'};       
    }
    
    public class VerificationEmailDates {
        public Datetime VerificationEmailDateTime;
        public Integer SequenceNumber;
        transient String[] VerificationEmailDateTime_type_info = new String[]{'VerificationEmailDateTime','http://www.w3.org/2001/XMLSchema','datetime','0','1','false'};
        transient String[] SequenceNumber_type_info = new String[]{'SequenceNumber','http://www.w3.org/2001/XMLSchema','int','0','1','false'};
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
        transient String[] field_order_type_info = new String[]{'VerificationEmailDateTime','SequenceNumber'};      
    }
    
    public class Customer {
        public WS_ESB_BusinessObjects.Individual Individual;
        public WS_ESB_BusinessObjects.Organization Organization {get;set;}
        public WS_ESB_BusinessObjects.TelephoneNumber TelephoneNumber;
        public WS_ESB_BusinessObjects.CitizensPostalAddress CitizensPostalAddress;
        public WS_ESB_BusinessObjects.TimePeriod ValidFor;
        public String CustomerID;
        public Boolean NameFormatFlag;
        public WS_ESB_BusinessObjects.CustomerCreditProfile CustomerCreditProfile;
        public WS_ESB_BusinessObjects.CustomerCreditProfileInterpretation CustomerCreditProfileInterpretation;
        public String CustomerCategory;
        public WS_ESB_BusinessObjects.Email Email;
        transient String[] Individual_type_info = new String[]{'Individual','http://ibus.czncorp.com/ESB/BusinessObjects','Individual','0','1','false'};
        transient String[] Organization_type_info = new String[]{'Organization','http://ibus.czncorp.com/ESB/BusinessObjects','Organization','0','1','false'};
        transient String[] TelephoneNumber_type_info = new String[]{'TelephoneNumber','http://ibus.czncorp.com/ESB/BusinessObjects','TelephoneNumber','0','1','false'};
        transient String[] CitizensPostalAddress_type_info = new String[]{'CitizensPostalAddress','http://ibus.czncorp.com/ESB/BusinessObjects','CitizensPostalAddress','0','1','false'};
        transient String[] ValidFor_type_info = new String[]{'ValidFor','http://ibus.czncorp.com/ESB/BusinessObjects','TimePeriod','0','1','false'};
        transient String[] CustomerID_type_info = new String[]{'CustomerID','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] NameFormatFlag_type_info = new String[]{'NameFormatFlag','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        transient String[] CustomerCreditProfile_type_info = new String[]{'CustomerCreditProfile','http://ibus.czncorp.com/ESB/BusinessObjects','CustomerCreditProfile','0','1','false'};
        transient String[] CustomerCreditProfileInterpretation_type_info = new String[]{'CustomerCreditProfileInterpretation','http://ibus.czncorp.com/ESB/BusinessObjects','CustomerCreditProfileInterpretation','0','1','false'};
        transient String[] CustomerCategory_type_info = new String[]{'CustomerCategory','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] Email_type_info = new String[]{'Email','http://ibus.czncorp.com/ESB/BusinessObjects','Email','0','1','false'};
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
        transient String[] field_order_type_info = new String[]{'Individual','Organization','TelephoneNumber','CitizensPostalAddress','ValidFor','CustomerID','NameFormatFlag','CustomerCreditProfile','CustomerCreditProfileInterpretation','CustomerCategory','Email'};       
    }
    
    public class CustomerCreditProfile {
        public String AuthorizationId;
        public String InternalCreditRating;
        public String CreditScore;
        public RedFlagMessageType[] RedFlagMessage;
        public Date LastCreditVerificationDate;
        public Boolean BankruptcyFlag;
        public String SocialSecurityNumber;
        public DriversLicenseIdentification DriversLicenseIdentification;
        public Integer NumberOfDisconnects;
        public Date LastUpdatedDate;
        public String UpdatedBy;
        public String InternalCreditRatingExplanation;
        public String ReminderNotice;
        public String InsufficientFunds;
        public String AdvancePayment;
        public String CBRNumber;
        public String ThirdPartyNotificationCode;
        public ThirdPartyNotification ThirdPartyNotification;
        public IndividualContact Guarantor;
        public NearestRelative NearestRelative;
        public String MiscellaneousInformation1;
        public String MiscellaneousInformation2;
        public String Password;
        public String Remarks;
        public Spouse Spouse;
        public Employer Employer;
        public Date HireDate;
        public String HousingStatus;
        public LandLord LandLord;
        public String[] AdultRoomMates;
        public TelephoneNumber ContactTelephoneNumber;
        public TelephoneNumber PreviousTelephoneNumber;
        public TimePeriod ValidFor;
        public Boolean PositiveIDRequiredFlag;
        public Boolean NonPayDisconnectLast12MonthsFlag;
        public Decimal SubscriberUnpaidFinalBillAmount;
        public Decimal SpouseUnpaidFinalBillAmount;
        public Decimal PhysicalAddressUnpaidFinalBillAmount;
        public Decimal RecommendedDepositAmount;
        public Boolean CreditInfoCollectionAllowedFlag;
        public AccountInDisputeInfo AccountInDisputeInfo;
        public String BusinessType;
        public IndividualContact[] BusinessOwner;
        public IndividualContact Manager;
        public IndividualContact BillingContact;
        public IndividualContact AccountRepresentative;
        public String MiscellaneousInformation3;
        public Date LastInsufficientFundDate;
        public Decimal DepositAmount;
        public Boolean EarlyTerminationFeeFlag;
        public AdditionalBusinessCreditInformation AdditionalBusinessCreditInformation;
        transient String[] AuthorizationId_type_info = new String[]{'AuthorizationId','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] InternalCreditRating_type_info = new String[]{'InternalCreditRating','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] CreditScore_type_info = new String[]{'CreditScore','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] RedFlagMessage_type_info = new String[]{'RedFlagMessage','http://ibus.czncorp.com/ESB/BusinessObjects','RedFlagMessageType','0','-1','false'};
        transient String[] LastCreditVerificationDate_type_info = new String[]{'LastCreditVerificationDate','http://www.w3.org/2001/XMLSchema','date','0','1','false'};
        transient String[] BankruptcyFlag_type_info = new String[]{'BankruptcyFlag','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        transient String[] SocialSecurityNumber_type_info = new String[]{'SocialSecurityNumber','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] DriversLicenseIdentification_type_info = new String[]{'DriversLicenseIdentification','http://ibus.czncorp.com/ESB/BusinessObjects','DriversLicenseIdentification','0','1','false'};
        transient String[] NumberOfDisconnects_type_info = new String[]{'NumberOfDisconnects','http://www.w3.org/2001/XMLSchema','int','0','1','false'};
        transient String[] LastUpdatedDate_type_info = new String[]{'LastUpdatedDate','http://www.w3.org/2001/XMLSchema','date','0','1','false'};
        transient String[] UpdatedBy_type_info = new String[]{'UpdatedBy','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] InternalCreditRatingExplanation_type_info = new String[]{'InternalCreditRatingExplanation','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] ReminderNotice_type_info = new String[]{'ReminderNotice','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] InsufficientFunds_type_info = new String[]{'InsufficientFunds','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] AdvancePayment_type_info = new String[]{'AdvancePayment','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] CBRNumber_type_info = new String[]{'CBRNumber','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] ThirdPartyNotificationCode_type_info = new String[]{'ThirdPartyNotificationCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] ThirdPartyNotification_type_info = new String[]{'ThirdPartyNotification','http://ibus.czncorp.com/ESB/BusinessObjects','ThirdPartyNotification','0','1','false'};
        transient String[] Guarantor_type_info = new String[]{'Guarantor','http://ibus.czncorp.com/ESB/BusinessObjects','IndividualContact','0','1','false'};
        transient String[] NearestRelative_type_info = new String[]{'NearestRelative','http://ibus.czncorp.com/ESB/BusinessObjects','NearestRelative','0','1','false'};
        transient String[] MiscellaneousInformation1_type_info = new String[]{'MiscellaneousInformation1','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] MiscellaneousInformation2_type_info = new String[]{'MiscellaneousInformation2','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] Password_type_info = new String[]{'Password','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] Remarks_type_info = new String[]{'Remarks','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] Spouse_type_info = new String[]{'Spouse','http://ibus.czncorp.com/ESB/BusinessObjects','Spouse','0','1','false'};
        transient String[] Employer_type_info = new String[]{'Employer','http://ibus.czncorp.com/ESB/BusinessObjects','Employer','0','1','false'};
        transient String[] HireDate_type_info = new String[]{'HireDate','http://www.w3.org/2001/XMLSchema','date','0','1','false'};
        transient String[] HousingStatus_type_info = new String[]{'HousingStatus','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] LandLord_type_info = new String[]{'LandLord','http://ibus.czncorp.com/ESB/BusinessObjects','LandLord','0','1','false'};
        transient String[] AdultRoomMates_type_info = new String[]{'AdultRoomMates','http://ibus.czncorp.com/ESB/BusinessObjects','String','0','-1','false'};
        transient String[] ContactTelephoneNumber_type_info = new String[]{'ContactTelephoneNumber','http://ibus.czncorp.com/ESB/BusinessObjects','TelephoneNumber','0','1','false'};
        transient String[] PreviousTelephoneNumber_type_info = new String[]{'PreviousTelephoneNumber','http://ibus.czncorp.com/ESB/BusinessObjects','TelephoneNumber','0','1','false'};
        transient String[] ValidFor_type_info = new String[]{'ValidFor','http://ibus.czncorp.com/ESB/BusinessObjects','TimePeriod','0','1','false'};
        transient String[] PositiveIDRequiredFlag_type_info = new String[]{'PositiveIDRequiredFlag','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        transient String[] NonPayDisconnectLast12MonthsFlag_type_info = new String[]{'NonPayDisconnectLast12MonthsFlag','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        transient String[] SubscriberUnpaidFinalBillAmount_type_info = new String[]{'SubscriberUnpaidFinalBillAmount','http://www.w3.org/2001/XMLSchema','decimal','0','1','false'};
        transient String[] SpouseUnpaidFinalBillAmount_type_info = new String[]{'SpouseUnpaidFinalBillAmount','http://www.w3.org/2001/XMLSchema','decimal','0','1','false'};
        transient String[] PhysicalAddressUnpaidFinalBillAmount_type_info = new String[]{'PhysicalAddressUnpaidFinalBillAmount','http://www.w3.org/2001/XMLSchema','decimal','0','1','false'};
        transient String[] RecommendedDepositAmount_type_info = new String[]{'RecommendedDepositAmount','http://www.w3.org/2001/XMLSchema','decimal','0','1','false'};
        transient String[] CreditInfoCollectionAllowedFlag_type_info = new String[]{'CreditInfoCollectionAllowedFlag','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        transient String[] AccountInDisputeInfo_type_info = new String[]{'AccountInDisputeInfo','http://ibus.czncorp.com/ESB/BusinessObjects','AccountInDisputeInfo','0','1','false'};
        transient String[] BusinessType_type_info = new String[]{'BusinessType','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] BusinessOwner_type_info = new String[]{'BusinessOwner','http://ibus.czncorp.com/ESB/BusinessObjects','IndividualContact','0','-1','false'};
        transient String[] Manager_type_info = new String[]{'Manager','http://ibus.czncorp.com/ESB/BusinessObjects','IndividualContact','0','1','false'};
        transient String[] BillingContact_type_info = new String[]{'BillingContact','http://ibus.czncorp.com/ESB/BusinessObjects','IndividualContact','0','1','false'};
        transient String[] AccountRepresentative_type_info = new String[]{'AccountRepresentative','http://ibus.czncorp.com/ESB/BusinessObjects','IndividualContact','0','1','false'};
        transient String[] MiscellaneousInformation3_type_info = new String[]{'MiscellaneousInformation3','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] LastInsufficientFundDate_type_info = new String[]{'LastInsufficientFundDate','http://www.w3.org/2001/XMLSchema','date','0','1','false'};
        transient String[] DepositAmount_type_info = new String[]{'DepositAmount','http://www.w3.org/2001/XMLSchema','decimal','0','1','false'};
        transient String[] EarlyTerminationFeeFlag_type_info = new String[]{'EarlyTerminationFeeFlag','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        transient String[] AdditionalBusinessCreditInformation_type_info = new String[]{'AdditionalBusinessCreditInformation','http://ibus.czncorp.com/ESB/BusinessObjects','AdditionalBusinessCreditInformation','0','1','false'};
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
        transient String[] field_order_type_info = new String[]{'AuthorizationId','InternalCreditRating','CreditScore','RedFlagMessage','LastCreditVerificationDate','BankruptcyFlag','SocialSecurityNumber','DriversLicenseIdentification','NumberOfDisconnects','LastUpdatedDate','UpdatedBy','InternalCreditRatingExplanation','ReminderNotice','InsufficientFunds','AdvancePayment','CBRNumber','ThirdPartyNotificationCode','ThirdPartyNotification','Guarantor','NearestRelative','MiscellaneousInformation1','MiscellaneousInformation2','Password','Remarks','Spouse','Employer','HireDate','HousingStatus','LandLord','AdultRoomMates','ContactTelephoneNumber','PreviousTelephoneNumber','ValidFor','PositiveIDRequiredFlag','NonPayDisconnectLast12MonthsFlag','SubscriberUnpaidFinalBillAmount','SpouseUnpaidFinalBillAmount','PhysicalAddressUnpaidFinalBillAmount','RecommendedDepositAmount','CreditInfoCollectionAllowedFlag','AccountInDisputeInfo','BusinessType','BusinessOwner','Manager','BillingContact','AccountRepresentative','MiscellaneousInformation3','LastInsufficientFundDate','DepositAmount','EarlyTerminationFeeFlag','AdditionalBusinessCreditInformation'}; 
    }
    
    public class AdditionalBusinessCreditInformation {
        public CustomerBankAccount[] BankInformation;
        public BusinessEntityPartner[] BusinessEntityPartner;
        public Integer CreditCheckScoreNumber;
        public Long DunsNumber;
        public Long FederalTaxId;
        public String NumberOfEmployees;
        public Boolean PersonalGuaranteeFormRequired;
        public Boolean RefusedSSN;
        public SpecialRemarks[] SpecialRemarks;
        public IndividualContact TechnicalContact;
        public String YearsInBusiness;
        transient String[] BankInformation_type_info = new String[]{'BankInformation','http://ibus.czncorp.com/ESB/BusinessObjects','CustomerBankAccount','0','-1','false'};
        transient String[] BusinessEntityPartner_type_info = new String[]{'BusinessEntityPartner','http://ibus.czncorp.com/ESB/BusinessObjects','BusinessEntityPartner','0','-1','false'};
        transient String[] CreditCheckScoreNumber_type_info = new String[]{'CreditCheckScoreNumber','http://www.w3.org/2001/XMLSchema','int','0','1','false'};
        transient String[] DunsNumber_type_info = new String[]{'DunsNumber','http://www.w3.org/2001/XMLSchema','long','0','1','false'};
        transient String[] FederalTaxId_type_info = new String[]{'FederalTaxId','http://www.w3.org/2001/XMLSchema','long','0','1','false'};
        transient String[] NumberOfEmployees_type_info = new String[]{'NumberOfEmployees','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] PersonalGuaranteeFormRequired_type_info = new String[]{'PersonalGuaranteeFormRequired','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        transient String[] RefusedSSN_type_info = new String[]{'RefusedSSN','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        transient String[] SpecialRemarks_type_info = new String[]{'SpecialRemarks','http://ibus.czncorp.com/ESB/BusinessObjects','SpecialRemarks','0','-1','false'};
        transient String[] TechnicalContact_type_info = new String[]{'TechnicalContact','http://ibus.czncorp.com/ESB/BusinessObjects','IndividualContact','0','1','false'};
        transient String[] YearsInBusiness_type_info = new String[]{'YearsInBusiness','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
        transient String[] field_order_type_info = new String[]{'BankInformation','BusinessEntityPartner','CreditCheckScoreNumber','DunsNumber','FederalTaxId','NumberOfEmployees','PersonalGuaranteeFormRequired','RefusedSSN','SpecialRemarks','TechnicalContact','YearsInBusiness'};     
    }
    
    public class SpecialRemarks {
        public Integer SequenceNumber;
        public String Text;
        transient String[] SequenceNumber_type_info = new String[]{'SequenceNumber','http://www.w3.org/2001/XMLSchema','int','0','1','false'};
        transient String[] Text_type_info = new String[]{'Text','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
        transient String[] field_order_type_info = new String[]{'SequenceNumber','Text'};       
    }
    
    public class BusinessEntityPartner {
        public Integer SequenceNumber;
        public String Name;
        public TelephoneNumber TelephoneNumber;
        public CitizensPostalAddress CitizensPostalAddress;
        public String FirstName;
        public String LastName;
        public Long SocialSecurityNumber;
        public Datetime DateOfBirth;
        transient String[] SequenceNumber_type_info = new String[]{'SequenceNumber','http://www.w3.org/2001/XMLSchema','int','0','1','false'};
        transient String[] Name_type_info = new String[]{'Name','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] TelephoneNumber_type_info = new String[]{'TelephoneNumber','http://ibus.czncorp.com/ESB/BusinessObjects','TelephoneNumber','0','1','false'};
        transient String[] CitizensPostalAddress_type_info = new String[]{'CitizensPostalAddress','http://ibus.czncorp.com/ESB/BusinessObjects','CitizensPostalAddress','0','1','false'};
        transient String[] FirstName_type_info = new String[]{'FirstName','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] LastName_type_info = new String[]{'LastName','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] SocialSecurityNumber_type_info = new String[]{'SocialSecurityNumber','http://www.w3.org/2001/XMLSchema','long','0','1','false'};
        transient String[] DateOfBirth_type_info = new String[]{'DateOfBirth','http://www.w3.org/2001/XMLSchema','datetime','0','1','false'};
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
        transient String[] field_order_type_info = new String[]{'SequenceNumber','Name','TelephoneNumber','CitizensPostalAddress','FirstName','LastName','SocialSecurityNumber','DateOfBirth'};     
    }
    
    public class AccountInDisputeInfo {
        public Boolean InDisputeFlag;
        public Date LastUpdatedDate;
        public String LastUpdatedBy;
        transient String[] InDisputeFlag_type_info = new String[]{'InDisputeFlag','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        transient String[] LastUpdatedDate_type_info = new String[]{'LastUpdatedDate','http://www.w3.org/2001/XMLSchema','date','0','1','false'};
        transient String[] LastUpdatedBy_type_info = new String[]{'LastUpdatedBy','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
        transient String[] field_order_type_info = new String[]{'InDisputeFlag','LastUpdatedDate','LastUpdatedBy'};     
    }
    
    public class LandLord {
        public String Name;
        public TelephoneNumber TelephoneNumber;
        public CitizensPostalAddress CitizensPostalAddress;
        transient String[] Name_type_info = new String[]{'Name','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] TelephoneNumber_type_info = new String[]{'TelephoneNumber','http://ibus.czncorp.com/ESB/BusinessObjects','TelephoneNumber','0','1','false'};
        transient String[] CitizensPostalAddress_type_info = new String[]{'CitizensPostalAddress','http://ibus.czncorp.com/ESB/BusinessObjects','CitizensPostalAddress','0','1','false'};
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
        transient String[] field_order_type_info = new String[]{'Name','TelephoneNumber','CitizensPostalAddress'};      
    }
    
/*  public class Spouse {
        public IndividualName IndividualName;
        public Employer Employer;
        public TelephoneNumber TelephoneNumber;
        transient String[] IndividualName_type_info = new String[]{'IndividualName','http://ibus.czncorp.com/ESB/BusinessObjects','IndividualName','0','1','false'};
        transient String[] Employer_type_info = new String[]{'Employer','http://ibus.czncorp.com/ESB/BusinessObjects','Employer','0','1','false'};
        transient String[] TelephoneNumber_type_info = new String[]{'TelephoneNumber','http://ibus.czncorp.com/ESB/BusinessObjects','TelephoneNumber','0','1','false'};
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
        transient String[] field_order_type_info = new String[]{'IndividualName','Employer','TelephoneNumber'};     
    }   */
    
    public class Spouse {
        public IndividualName IndividualName;
        public DriversLicenseIdentification DriversLicenseIdentification;
        public WS_ESB_BusinessObjects.SocialSecurityNrIdentification SocialSecurityNrIdentification;
        public WS_ESB_BusinessObjects.TimePeriod AliveDuring;
        public Employer Employer;
        
        transient String[] IndividualName_type_info = new String[]{'IndividualName','http://ibus.czncorp.com/ESB/BusinessObjects','IndividualName','0','1','false'};
        transient String[] DriversLicenseIdentification_type_info = new String[]{'DriversLicenseIdentification','http://ibus.czncorp.com/ESB/BusinessObjects','DriversLicenseIdentification','0','1','false'};
        transient String[] SocialSecurityNrIdentification_type_info = new String[]{'SocialSecurityNrIdentification','http://ibus.czncorp.com/ESB/BusinessObjects','SocialSecurityNrIdentification','0','1','false'  };
        transient String[] AliveDuring_type_info = new String[]{'AliveDuring','http://ibus.czncorp.com/ESB/BusinessObjects','TimePeriod','0','1','false'};
        transient String[] Employer_type_info = new String[]{'Employer','http://ibus.czncorp.com/ESB/BusinessObjects','Employer','0','1','false'};
        
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
        transient String[] field_order_type_info = new String[]{'IndividualName', 'DriversLicenseIdentification', 'SocialSecurityNrIdentification', 'AliveDuring', 'Employer'};
    }
    
    public class Employer {
        public String Name;
        public TelephoneNumber TelephoneNumber;
        public CitizensPostalAddress CitizensPostalAddress;
        public IndividualContact Manager;
        transient String[] Name_type_info = new String[]{'Name','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] TelephoneNumber_type_info = new String[]{'TelephoneNumber','http://ibus.czncorp.com/ESB/BusinessObjects','TelephoneNumber','0','1','false'};
        transient String[] CitizensPostalAddress_type_info = new String[]{'CitizensPostalAddress','http://ibus.czncorp.com/ESB/BusinessObjects','CitizensPostalAddress','0','1','false'};
        transient String[] Manager_type_info = new String[]{'Manager','http://ibus.czncorp.com/ESB/BusinessObjects','IndividualContact','0','1','false'};
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
        transient String[] field_order_type_info = new String[]{'Name','TelephoneNumber','CitizensPostalAddress','Manager'};
    }
    
    public class NearestRelative {
        public String Name;
        public TelephoneNumber TelephoneNumber;
        public String Address;
        public String RelationshipToSubscriber;
        transient String[] Name_type_info = new String[]{'Name','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] TelephoneNumber_type_info = new String[]{'TelephoneNumber','http://ibus.czncorp.com/ESB/BusinessObjects','TelephoneNumber','0','1','false'};
        transient String[] Address_type_info = new String[]{'Address','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] RelationshipToSubscriber_type_info = new String[]{'RelationshipToSubscriber','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
        transient String[] field_order_type_info = new String[]{'Name','TelephoneNumber','Address','RelationshipToSubscriber'};
    }
    
    public class IndividualContact {
        public Integer SequenceNumber;
        public String Name;
        public TelephoneNumber TelephoneNumber;
        public CitizensPostalAddress CitizensPostalAddress;
        transient String[] SequenceNumber_type_info = new String[]{'SequenceNumber','http://www.w3.org/2001/XMLSchema','int','0','1','false'};
        transient String[] Name_type_info = new String[]{'Name','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] TelephoneNumber_type_info = new String[]{'TelephoneNumber','http://ibus.czncorp.com/ESB/BusinessObjects','TelephoneNumber','0','1','false'};
        transient String[] CitizensPostalAddress_type_info = new String[]{'CitizensPostalAddress','http://ibus.czncorp.com/ESB/BusinessObjects','CitizensPostalAddress','0','1','false'};
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
        transient String[] field_order_type_info = new String[]{'SequenceNumber','Name','TelephoneNumber','CitizensPostalAddress'};     
    }
    
    public class ThirdPartyNotification {
        public String Name;
        public String ZipcodeExtension;
        public TelephoneNumber TelephoneNumber;
        transient String[] Name_type_info = new String[]{'Name','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] ZipcodeExtension_type_info = new String[]{'ZipcodeExtension','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] TelephoneNumber_type_info = new String[]{'TelephoneNumber','http://ibus.czncorp.com/ESB/BusinessObjects','TelephoneNumber','0','1','false'};
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
        transient String[] field_order_type_info = new String[]{'Name','ZipcodeExtension','TelephoneNumber'};       
    }
    
    public class RedFlagMessageType {
        public String OrderID;
        public WS_ESB_BusinessObjects.CodeDescriptionPair ReasonCode;
        public WS_ESB_BusinessObjects.CodeDescriptionPair DispositionCode;
        public WS_ESB_BusinessObjects.Employee CreatedBy;
        public WS_ESB_BusinessObjects.Employee ClosedBy;
        public WS_ESB_BusinessObjects.TimePeriod ValidFor;
        public WS_ESB_BusinessObjects.CodeDescriptionPair MessageCode;
        public Integer SequenceNumber;
        transient String[] OrderID_type_info = new String[]{'OrderID','http://ibus.czncorp.com/ESB/BusinessObjects','string','0','1','false'};
        transient String[] ReasonCode_type_info = new String[]{'ReasonCode','http://ibus.czncorp.com/ESB/BusinessObjects','CodeDescriptionPair','0','1','false'};
        transient String[] DispositionCode_type_info = new String[]{'DispositionCode','http://ibus.czncorp.com/ESB/BusinessObjects','CodeDescriptionPair','0','1','false'};
        transient String[] CreatedBy_type_info = new String[]{'CreatedBy','http://ibus.czncorp.com/ESB/BusinessObjects','Employee','0','1','false'};
        transient String[] ClosedBy_type_info = new String[]{'ClosedBy','http://ibus.czncorp.com/ESB/BusinessObjects','Employee','0','1','false'};
        transient String[] ValidFor_type_info = new String[]{'ValidFor','http://ibus.czncorp.com/ESB/BusinessObjects','TimePeriod','0','1','false'};
        transient String[] MessageCode_type_info = new String[]{'MessageCode','http://ibus.czncorp.com/ESB/BusinessObjects','CodeDescriptionPair','0','1','false'};
        transient String[] SequenceNumber_type_info = new String[]{'SequenceNumber','http://www.w3.org/2001/XMLSchema','int','0','1','false'    };
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
        transient String[] field_order_type_info = new String[]{'OrderID','ReasonCode','DispositionCode','CreatedBy','ClosedBy','ValidFor','MessageCode','SequenceNumber'};
    }
    /*
    public class Employee {
        public String EmploymentStatus;
        public String EmployeeID;
        public String SSOLoginId;
        public WS_ESB_BusinessObjects.Email Email;
        transient String[] EmploymentStatus_type_info = new String[]{'EmploymentStatus','http://ibus.czncorp.com/ESB/BusinessObjects','string','0','1','false'};
        transient String[] EmployeeID_type_info = new String[]{'EmployeeID','http://ibus.czncorp.com/ESB/BusinessObjects','string','0','1','false'};
        transient String[] SSOLoginId_type_info = new String[]{'SSOLoginId','http://ibus.czncorp.com/ESB/BusinessObjects','string','0','1','false'};
        transient String[] Email_type_info = new String[]{'Email','http://ibus.czncorp.com/ESB/BusinessObjects','Email','0','1','false'};
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
        transient String[] field_order_type_info = new String[]{'EmploymentStatus','EmployeeID','SSOLoginId','Email'};
    }
    */
    public class CustomerCreditProfileInterpretation {
        public String Reason;
        public WS_ESB_BusinessObjects.SalesWorthyEnum SalesWorthyCode;
        transient String[] Reason_type_info = new String[]{'Reason','http://ibus.czncorp.com/ESB/BusinessObjects','string','0','1','false'};
        transient String[] SalesWorthyCode_type_info = new String[]{'SalesWorthyCode','http://ibus.czncorp.com/ESB/BusinessObjects','SalesWorthyEnum','0','1','false'};
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
        transient String[] field_order_type_info = new String[]{'Reason','SalesWorthyCode'};
    }
    
    public class SalesWorthyEnum {
        public String SalesWorthy;
        public String AmountOver60;
        public String DPATreatment;
        public String ReturnedCheck;
        public String TemporaryDisconnectNonPay;
        public String CreditClass_5_E_L_G;
        public String TollRestrictedNonPay;
        public String NoPayments;
        public String NSALE;
        transient String[] SalesWorthy_type_info = new String[]{'SalesWorthy','http://ibus.czncorp.com/ESB/BusinessObjects','string','0','1','false'};
        transient String[] AmountOver60_type_info = new String[]{'AmountOver60','http://ibus.czncorp.com/ESB/BusinessObjects','string','0','1','false'};
        transient String[] DPATreatment_type_info = new String[]{'DPATreatment','http://ibus.czncorp.com/ESB/BusinessObjects','string','0','1','false'};
        transient String[] ReturnedCheck_type_info = new String[]{'ReturnedCheck','http://ibus.czncorp.com/ESB/BusinessObjects','string','0','1','false'};
        transient String[] TemporaryDisconnectNonPay_type_info = new String[]{'TemporaryDisconnectNonPay','http://ibus.czncorp.com/ESB/BusinessObjects','string','0','1','false'};
        transient String[] CreditClass_5_E_L_G_type_info = new String[]{'CreditClass_5_E_L_G','http://ibus.czncorp.com/ESB/BusinessObjects','string','0','1','false'};
        transient String[] TollRestrictedNonPay_type_info = new String[]{'TollRestrictedNonPay','http://ibus.czncorp.com/ESB/BusinessObjects','string','0','1','false'};
        transient String[] NoPayments_type_info = new String[]{'NoPayments','http://ibus.czncorp.com/ESB/BusinessObjects','string','0','1','false'};
        transient String[] NSALE_type_info = new String[]{'NSALE','http://ibus.czncorp.com/ESB/BusinessObjects','string','0','1','false'};
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
        transient String[] field_order_type_info = new String[]{'SalesWorthy','AmountOver60','DPATreatment','ReturnedCheck','TemporaryDisconnectNonPay','CreditClass_5_E_L_G','TollRestrictedNonPay','NoPayments','NSALE'};
        
    }
    
    public class AvailableSpeed {
        public String Value;
        public Boolean VerifiedFlag;
        transient String[] Value_type_info = new String[]{'Value','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] VerifiedFlag_type_info = new String[]{'VerifiedFlag','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'    };
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'   };
        transient String[] field_order_type_info = new String[]{'Value','VerifiedFlag'  };
    }
    public class PartyName {
        public WS_ESB_BusinessObjects.TimePeriod ValidFor;
        transient String[] ValidFor_type_info = new String[]{'ValidFor','http://ibus.czncorp.com/ESB/BusinessObjects','TimePeriod','0','1','false'  };
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'   };
        transient String[] field_order_type_info = new String[]{'ValidFor'  };
    }
    public class ConnectionListType {
        public WS_ESB_BusinessObjects.ConnectionType[] Connection {get;set;}
        transient String[] Connection_type_info = new String[]{'Connection','http://ibus.czncorp.com/ESB/BusinessObjects','ConnectionType','0','-1','false' };
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'   };
        transient String[] field_order_type_info = new String[]{'Connection'    };
    }
    public class SimplifiedServiceAddress {
        public String AddressName;
        public WS_ESB_BusinessObjects.CommonLanguageLocationId CLLI;
        public String AddressLine;
        public String AddressLine2;
        public String Building;
        public String Floor;
        public String Room;
        public String City;
        public String State;
        public Integer SequenceNumber;
        public String Zip;
        public String AdditionalAddressInfo;
        transient String[] AddressName_type_info = new String[]{'AddressName','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] CLLI_type_info = new String[]{'CLLI','http://ibus.czncorp.com/ESB/BusinessObjects','CommonLanguageLocationId','0','1','false'    };
        transient String[] AddressLine_type_info = new String[]{'AddressLine','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] AddressLine2_type_info = new String[]{'AddressLine2','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] Building_type_info = new String[]{'Building','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] Floor_type_info = new String[]{'Floor','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] Room_type_info = new String[]{'Room','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] City_type_info = new String[]{'City','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] State_type_info = new String[]{'State','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] SequenceNumber_type_info = new String[]{'SequenceNumber','http://www.w3.org/2001/XMLSchema','int','0','1','false'    };
        transient String[] Zip_type_info = new String[]{'Zip','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] AdditionalAddressInfo_type_info = new String[]{'AdditionalAddressInfo','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'   };
        transient String[] field_order_type_info = new String[]{'AddressName','CLLI','AddressLine','AddressLine2','Building','Floor','Room','City','State','SequenceNumber','Zip','AdditionalAddressInfo'   };
    }
    public class Organization {
        public String PartyType;
        public WS_ESB_BusinessObjects.TimePeriod ValidFor;
        public WS_ESB_BusinessObjects.OrganizationName OrganizationName {get;set;}
        public Boolean IsLegalEntityFlag;
        public WS_ESB_BusinessObjects.TimePeriod ExistsDuring;
        public String Region;
        public String PreferredLanguageCode;
        transient String[] PartyType_type_info = new String[]{'PartyType','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] ValidFor_type_info = new String[]{'ValidFor','http://ibus.czncorp.com/ESB/BusinessObjects','TimePeriod','0','1','false'  };
        transient String[] OrganizationName_type_info = new String[]{'OrganizationName','http://ibus.czncorp.com/ESB/BusinessObjects','OrganizationName','0','1','false'    };
        transient String[] IsLegalEntityFlag_type_info = new String[]{'IsLegalEntityFlag','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'  };
        transient String[] ExistsDuring_type_info = new String[]{'ExistsDuring','http://ibus.czncorp.com/ESB/BusinessObjects','TimePeriod','0','1','false'  };
        transient String[] Region_type_info = new String[]{'Region','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] PreferredLanguageCode_type_info = new String[]{'PreferredLanguageCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'   };
        transient String[] field_order_type_info = new String[]{'PartyType','ValidFor','OrganizationName','IsLegalEntityFlag','ExistsDuring','Region','PreferredLanguageCode'};
    }
    public class IndividualIdentification {
        public Date IssueDate;
        public String Picture;
        public WS_ESB_BusinessObjects.TimePeriod ValidFor;
        transient String[] IssueDate_type_info = new String[]{'IssueDate','http://www.w3.org/2001/XMLSchema','date','0','1','false' };
        transient String[] Picture_type_info = new String[]{'Picture','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] ValidFor_type_info = new String[]{'ValidFor','http://ibus.czncorp.com/ESB/BusinessObjects','TimePeriod','0','1','false'  };
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'   };
        transient String[] field_order_type_info = new String[]{'IssueDate','Picture','ValidFor'    };
    }
    public class PhoneNumberAsId {
        public WS_ESB_BusinessObjects.TelephoneNumber TelephoneNumber;
        public integer SequenceNumber;
        transient String[] TelephoneNumber_type_info = new String[]{'TelephoneNumber','http://ibus.czncorp.com/ESB/BusinessObjects','TelephoneNumber','0','1','false'   };
        transient String[] SequenceNumber_type_info = new String[]{'SequenceNumber','http://www.w3.org/2001/XMLSchema','int','0','1','false'    };
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'   };
        transient String[] field_order_type_info = new String[]{'TelephoneNumber','SequenceNumber'  };
        public PhoneNumberAsId(){
            TelephoneNumber = new WS_ESB_BusinessObjects.TelephoneNumber();      
        }
    }
    public class AuthorizedCustomerProxy {
        public WS_ESB_BusinessObjects.Individual Individual;
        public WS_ESB_BusinessObjects.Organization Organization;
        public WS_ESB_BusinessObjects.TelephoneNumber[] TelephoneNumber;
        public WS_ESB_BusinessObjects.CitizensPostalAddress[] CitizensPostalAddress;
        public WS_ESB_BusinessObjects.TimePeriod ValidFor;
        public String NameOfContact;
        transient String[] Individual_type_info = new String[]{'Individual','http://ibus.czncorp.com/ESB/BusinessObjects','Individual','0','1','false'  };
        transient String[] Organization_type_info = new String[]{'Organization','http://ibus.czncorp.com/ESB/BusinessObjects','Organization','0','1','false'    };
        transient String[] TelephoneNumber_type_info = new String[]{'TelephoneNumber','http://ibus.czncorp.com/ESB/BusinessObjects','TelephoneNumber','0','-1','false'  };
        transient String[] CitizensPostalAddress_type_info = new String[]{'CitizensPostalAddress','http://ibus.czncorp.com/ESB/BusinessObjects','CitizensPostalAddress','0','-1','false'    };
        transient String[] ValidFor_type_info = new String[]{'ValidFor','http://ibus.czncorp.com/ESB/BusinessObjects','TimePeriod','0','1','false'  };
        transient String[] NameOfContact_type_info = new String[]{'NameOfContact','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'   };
        transient String[] field_order_type_info = new String[]{'Individual','Organization','TelephoneNumber','CitizensPostalAddress','ValidFor','NameOfContact'    };
    }
    public class ProcessStatus {
        public String Code;
        public String Message;
        transient String[] Code_type_info = new String[]{'Code','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] Message_type_info = new String[]{'Message','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'   };
        transient String[] field_order_type_info = new String[]{'Code','Message'    };
    }
    public class OpticalNetworkTerminal {
        public String TerminalId;
        public WS_ESB_BusinessObjects.TerminalKey Key;
        public String OfficeId;
        public String Location;
        public Integer SequenceNumber;
        public WS_ESB_BusinessObjects.CommonLanguageLocationId CommonLanguageLocationId;
        public String ManagementIpAddress;
        public String MaximumOfferingSpeed;
        public String AvailableSpeed;
        public String FiberOpticalNetworkCabinetCode;
        public WS_ESB_BusinessObjects.Cable[] Cable;
        transient String[] TerminalId_type_info = new String[]{'TerminalId','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] Key_type_info = new String[]{'Key','http://ibus.czncorp.com/ESB/BusinessObjects','TerminalKey','0','1','false'   };
        transient String[] OfficeId_type_info = new String[]{'OfficeId','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] Location_type_info = new String[]{'Location','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] SequenceNumber_type_info = new String[]{'SequenceNumber','http://www.w3.org/2001/XMLSchema','int','0','1','false'    };
        transient String[] CommonLanguageLocationId_type_info = new String[]{'CommonLanguageLocationId','http://ibus.czncorp.com/ESB/BusinessObjects','CommonLanguageLocationId','0','1','false'    };
        transient String[] ManagementIpAddress_type_info = new String[]{'ManagementIpAddress','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] MaximumOfferingSpeed_type_info = new String[]{'MaximumOfferingSpeed','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] AvailableSpeed_type_info = new String[]{'AvailableSpeed','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] FiberOpticalNetworkCabinetCode_type_info = new String[]{'FiberOpticalNetworkCabinetCode','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] Cable_type_info = new String[]{'Cable','http://ibus.czncorp.com/ESB/BusinessObjects','Cable','0','-1','false'    };
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'   };
        transient String[] field_order_type_info = new String[]{'TerminalId','Key','OfficeId','Location','SequenceNumber','CommonLanguageLocationId','ManagementIpAddress','MaximumOfferingSpeed','AvailableSpeed','FiberOpticalNetworkCabinetCode','Cable' };
    }
    public class TechnologyListType {
        public WS_ESB_BusinessObjects.TechnologyType[] Technology {get;set;}
        transient String[] Technology_type_info = new String[]{'Technology','http://ibus.czncorp.com/ESB/BusinessObjects','TechnologyType','0','-1','false' };
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'   };
        transient String[] field_order_type_info = new String[]{'Technology'    };
    }
    public class InternetInfoType {
        public Boolean ADSLCapableFlag {get;set;}
        public String ADSLCapableReason {get;set;}
        public Boolean SDSLCapableFlag {get;set;}
        public String SDSLCapableReason {get;set;}
        public Boolean HSIAvailableFlag {get;set;}
        public String HSIAvailabilityDescription {get;set;}
        public Boolean FiberProductCapableFlag {get;set;}
        public String ModemOwnership {get;set;}
        public WS_ESB_BusinessObjects.ConnectionListType Connections {get;set;}
        public String AccountSpeed {get;set;}
        public String FictitiousId {get;set;}
        public String LineCardType {get;set;}
        public String OrderedSpeed {get;set;}
        public String PlantType {get;set;}
        public String HSIPort {get;set;}
        public String PortStatus {get;set;}
        public String TerminalInformation {get;set;}
        public String AvailableMaxProductSpeed {get;set;}
        public String HighestAvailableSpeed {get;set;}
        public String InServiceHSIConnectionId {get;set;}
        public String PrimaryCircuit {get;set;}
        public WS_ESB_BusinessObjects.DigitalSubscriberLineAccessMultiplexer DslamInfo {get;set;}
        public Boolean IsModemTechDeliverable {get;set;}
        transient String[] ADSLCapableFlag_type_info = new String[]{'ADSLCapableFlag','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'  };
        transient String[] ADSLCapableReason_type_info = new String[]{'ADSLCapableReason','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] SDSLCapableFlag_type_info = new String[]{'SDSLCapableFlag','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'  };
        transient String[] SDSLCapableReason_type_info = new String[]{'SDSLCapableReason','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] HSIAvailableFlag_type_info = new String[]{'HSIAvailableFlag','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'    };
        transient String[] HSIAvailabilityDescription_type_info = new String[]{'HSIAvailabilityDescription','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] FiberProductCapableFlag_type_info = new String[]{'FiberProductCapableFlag','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'  };
        transient String[] ModemOwnership_type_info = new String[]{'ModemOwnership','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] Connections_type_info = new String[]{'Connections','http://ibus.czncorp.com/ESB/BusinessObjects','ConnectionListType','0','1','false'    };
        transient String[] AccountSpeed_type_info = new String[]{'AccountSpeed','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] FictitiousId_type_info = new String[]{'FictitiousId','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] LineCardType_type_info = new String[]{'LineCardType','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] OrderedSpeed_type_info = new String[]{'OrderedSpeed','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] PlantType_type_info = new String[]{'PlantType','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] HSIPort_type_info = new String[]{'HSIPort','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] PortStatus_type_info = new String[]{'PortStatus','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] TerminalInformation_type_info = new String[]{'TerminalInformation','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] AvailableMaxProductSpeed_type_info = new String[]{'AvailableMaxProductSpeed','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] HighestAvailableSpeed_type_info = new String[]{'HighestAvailableSpeed','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] InServiceHSIConnectionId_type_info = new String[]{'InServiceHSIConnectionId','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] PrimaryCircuit_type_info = new String[]{'PrimaryCircuit','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] DslamInfo_type_info = new String[]{'DslamInfo','http://ibus.czncorp.com/ESB/BusinessObjects','DigitalSubscriberLineAccessMultiplexer','0','1','false'    };
        transient String[] IsModemTechDeliverable_type_info = new String[]{'IsModemTechDeliverable','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'    };
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'   };
        transient String[] field_order_type_info = new String[]{'ADSLCapableFlag','ADSLCapableReason','SDSLCapableFlag','SDSLCapableReason','HSIAvailableFlag','HSIAvailabilityDescription','FiberProductCapableFlag','ModemOwnership','Connections','AccountSpeed','FictitiousId','LineCardType','OrderedSpeed','PlantType','HSIPort','PortStatus','TerminalInformation','AvailableMaxProductSpeed','HighestAvailableSpeed','InServiceHSIConnectionId','PrimaryCircuit','DslamInfo','IsModemTechDeliverable'};
    }
    public class SocialSecurityNrIdentification {
        public Date IssueDate;
        public String Picture;
        public WS_ESB_BusinessObjects.TimePeriod ValidFor;
        public String SocialSecurityNr;
        transient String[] IssueDate_type_info = new String[]{'IssueDate','http://www.w3.org/2001/XMLSchema','date','0','1','false' };
        transient String[] Picture_type_info = new String[]{'Picture','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] ValidFor_type_info = new String[]{'ValidFor','http://ibus.czncorp.com/ESB/BusinessObjects','TimePeriod','0','1','false'  };
        transient String[] SocialSecurityNr_type_info = new String[]{'SocialSecurityNr','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'   };
        transient String[] field_order_type_info = new String[]{'IssueDate','Picture','ValidFor','SocialSecurityNr' };
    }
    public class CommonLanguageLocationId {
        public String GeographicalCode;
        public String GeopoliticalCode;
        public String NetworkSiteCode;
        public String NetworkEntityCode;
        transient String[] GeographicalCode_type_info = new String[]{'GeographicalCode','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] GeopoliticalCode_type_info = new String[]{'GeopoliticalCode','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] NetworkSiteCode_type_info = new String[]{'NetworkSiteCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] NetworkEntityCode_type_info = new String[]{'NetworkEntityCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'   };
        transient String[] field_order_type_info = new String[]{'GeographicalCode','GeopoliticalCode','NetworkSiteCode','NetworkEntityCode' };
    }
    public class DigitalSubscriberLineAccessMultiplexer {
        public String OfficeId;
        public WS_ESB_BusinessObjects.CommonLanguageLocationId CommonLanguageLocationId;
        public String ManagementIp;
        public String CentralOfficeEquipmentLineEquipmentNumber;
        public String DataLinkConnectionID;
        public String EquipmentCardType;
        public String EquipmentDescription;
        public String NetworkVirtualCircuitIdentifier;
        public String NetworkVirtualPathIdentifier;
        public WS_ESB_BusinessObjects.Port Port;
        public String ProvisioningSpeed;
        public String ServiceIndicator;
        public String SubscriberVirtualCircuitIdentifier;
        public String SubscriberVirtualPathIdentifier;
        public String NetworkToNetworkCircuit;
        public String InfoSpeedVirtualCircuitIdentifier;
        public String InfoSpeedVirtualPathIdentifier;
        public String Device;
        public String ManagementIpV6;
        transient String[] OfficeId_type_info = new String[]{'OfficeId','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] CommonLanguageLocationId_type_info = new String[]{'CommonLanguageLocationId','http://ibus.czncorp.com/ESB/BusinessObjects','CommonLanguageLocationId','0','1','false'    };
        transient String[] ManagementIp_type_info = new String[]{'ManagementIp','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] CentralOfficeEquipmentLineEquipmentNumber_type_info = new String[]{'CentralOfficeEquipmentLineEquipmentNumber','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] DataLinkConnectionID_type_info = new String[]{'DataLinkConnectionID','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] EquipmentCardType_type_info = new String[]{'EquipmentCardType','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] EquipmentDescription_type_info = new String[]{'EquipmentDescription','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] NetworkVirtualCircuitIdentifier_type_info = new String[]{'NetworkVirtualCircuitIdentifier','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] NetworkVirtualPathIdentifier_type_info = new String[]{'NetworkVirtualPathIdentifier','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] Port_type_info = new String[]{'Port','http://ibus.czncorp.com/ESB/BusinessObjects','Port','0','1','false'    };
        transient String[] ProvisioningSpeed_type_info = new String[]{'ProvisioningSpeed','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] ServiceIndicator_type_info = new String[]{'ServiceIndicator','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] SubscriberVirtualCircuitIdentifier_type_info = new String[]{'SubscriberVirtualCircuitIdentifier','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] SubscriberVirtualPathIdentifier_type_info = new String[]{'SubscriberVirtualPathIdentifier','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] NetworkToNetworkCircuit_type_info = new String[]{'NetworkToNetworkCircuit','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] InfoSpeedVirtualCircuitIdentifier_type_info = new String[]{'InfoSpeedVirtualCircuitIdentifier','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] InfoSpeedVirtualPathIdentifier_type_info = new String[]{'InfoSpeedVirtualPathIdentifier','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] Device_type_info = new String[]{'Device','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] ManagementIpV6_type_info = new String[]{'ManagementIpV6','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'   };
        transient String[] field_order_type_info = new String[]{'OfficeId','CommonLanguageLocationId','ManagementIp','CentralOfficeEquipmentLineEquipmentNumber','DataLinkConnectionID','EquipmentCardType','EquipmentDescription','NetworkVirtualCircuitIdentifier','NetworkVirtualPathIdentifier','Port','ProvisioningSpeed','ServiceIndicator','SubscriberVirtualCircuitIdentifier','SubscriberVirtualPathIdentifier','NetworkToNetworkCircuit','InfoSpeedVirtualCircuitIdentifier','InfoSpeedVirtualPathIdentifier','Device','ManagementIpV6'   };
    }
    public class GeographicAddress {
        public String StateOrProvince;
        public String Country;
        public String County;
        transient String[] StateOrProvince_type_info = new String[]{'StateOrProvince','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] Country_type_info = new String[]{'Country','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] County_type_info = new String[]{'County','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'   };
        transient String[] field_order_type_info = new String[]{'StateOrProvince','Country','County'    };
    }
    public class CharacteristicValue {
        public String Characteristic {get;set;}
        public String Value {get;set;}
        public WS_ESB_BusinessObjects.TimePeriod TimePeriod {get;set;}
        public WS_ESB_BusinessObjects.CharacteristicValue[] CharacteristicValue {get;set;}
        transient String[] Characteristic_type_info = new String[]{'Characteristic','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] Value_type_info = new String[]{'Value','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] TimePeriod_type_info = new String[]{'TimePeriod','http://ibus.czncorp.com/ESB/BusinessObjects','TimePeriod','0','1','false'  };
        transient String[] CharacteristicValue_type_info = new String[]{'CharacteristicValue','http://ibus.czncorp.com/ESB/BusinessObjects','CharacteristicValue','0','-1','false'  };
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'   };
        transient String[] field_order_type_info = new String[]{'Characteristic','Value','TimePeriod','CharacteristicValue' };
    }
    public class Terminal {
        public String TerminalId;
        public WS_ESB_BusinessObjects.TerminalKey Key;
        public String OfficeId;
        public String Location;
        transient String[] TerminalId_type_info = new String[]{'TerminalId','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] Key_type_info = new String[]{'Key','http://ibus.czncorp.com/ESB/BusinessObjects','TerminalKey','0','1','false'   };
        transient String[] OfficeId_type_info = new String[]{'OfficeId','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] Location_type_info = new String[]{'Location','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'   };
        transient String[] field_order_type_info = new String[]{'TerminalId','Key','OfficeId','Location'    };
    }
    public class AdditionalAddressInfo {
        public WS_ESB_BusinessObjects.CharacteristicValue CharacteristicValue {get;set;}
        transient String[] CharacteristicValue_type_info = new String[]{'CharacteristicValue','http://ibus.czncorp.com/ESB/BusinessObjects','CharacteristicValue','0','1','false'   };
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'   };
        transient String[] field_order_type_info = new String[]{'CharacteristicValue'   };
    }
    public class Party {
        public String PartyType;
        public WS_ESB_BusinessObjects.TimePeriod ValidFor;
        transient String[] PartyType_type_info = new String[]{'PartyType','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] ValidFor_type_info = new String[]{'ValidFor','http://ibus.czncorp.com/ESB/BusinessObjects','TimePeriod','0','1','false'  };
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'   };
        transient String[] field_order_type_info = new String[]{'PartyType','ValidFor'  };
    }
    public class OpenServiceOrder {
        public String OrderId;
        public Date DueDate;
        public WS_ESB_BusinessObjects.OrderType OrderType;
        public WS_ESB_BusinessObjects.OrderInfo LeadOrder;
        public WS_ESB_BusinessObjects.OrderInfo MemberOrder;
        public String MemberOrderType;
        public String MemberOrderServiceType;
        public String GroupOrderDescription;
        public String GroupOrderDescriptionType;
        public Integer GroupOrderSequenceNumber;
        public WS_ESB_BusinessObjects.Stage OrderStage;
        public String UniversalServiceId;
        public String MaintenanceStatusInCRM;
        transient String[] OrderId_type_info = new String[]{'OrderId','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] DueDate_type_info = new String[]{'DueDate','http://www.w3.org/2001/XMLSchema','date','0','1','false' };
        transient String[] OrderType_type_info = new String[]{'OrderType','http://ibus.czncorp.com/ESB/BusinessObjects','OrderType','0','1','false' };
        transient String[] LeadOrder_type_info = new String[]{'LeadOrder','http://ibus.czncorp.com/ESB/BusinessObjects','OrderInfo','0','1','false' };
        transient String[] MemberOrder_type_info = new String[]{'MemberOrder','http://ibus.czncorp.com/ESB/BusinessObjects','OrderInfo','0','1','false' };
        transient String[] MemberOrderType_type_info = new String[]{'MemberOrderType','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] MemberOrderServiceType_type_info = new String[]{'MemberOrderServiceType','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] GroupOrderDescription_type_info = new String[]{'GroupOrderDescription','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] GroupOrderDescriptionType_type_info = new String[]{'GroupOrderDescriptionType','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] GroupOrderSequenceNumber_type_info = new String[]{'GroupOrderSequenceNumber','http://www.w3.org/2001/XMLSchema','int','0','1','false'    };
        transient String[] OrderStage_type_info = new String[]{'OrderStage','http://ibus.czncorp.com/ESB/BusinessObjects','Stage','0','1','false'   };
        transient String[] UniversalServiceId_type_info = new String[]{'UniversalServiceId','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] MaintenanceStatusInCRM_type_info = new String[]{'MaintenanceStatusInCRM','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'   };
        transient String[] field_order_type_info = new String[]{'OrderId','DueDate','OrderType','LeadOrder','MemberOrder','MemberOrderType','MemberOrderServiceType','GroupOrderDescription','GroupOrderDescriptionType','GroupOrderSequenceNumber','OrderStage','UniversalServiceId','MaintenanceStatusInCRM'  };
    }
    public class DriversLicenseIdentification {
        public Date IssueDate;
        public String Picture;
        public WS_ESB_BusinessObjects.TimePeriod ValidFor;
        public String StateOrProvince;
        public String ID;
        transient String[] IssueDate_type_info = new String[]{'IssueDate','http://www.w3.org/2001/XMLSchema','date','0','1','false' };
        transient String[] Picture_type_info = new String[]{'Picture','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] ValidFor_type_info = new String[]{'ValidFor','http://ibus.czncorp.com/ESB/BusinessObjects','TimePeriod','0','1','false'  };
        transient String[] StateOrProvince_type_info = new String[]{'StateOrProvince','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] ID_type_info = new String[]{'ID','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'   };
        transient String[] field_order_type_info = new String[]{'IssueDate','Picture','ValidFor','StateOrProvince','ID' };
    }
    public class LineCard {
        public Boolean AdvisedCustomerOfChargesFlag {get;set;}
        public WS_ESB_BusinessObjects.Cable[] Cable {get;set;}
        public String CardStationRemarks {get;set;}
        public String CarrierCableOfficeCode {get;set;}
        public String CarrierPair {get;set;}
        public String CentralOfficeCardOption {get;set;}
        public String CentralOfficeEquipmentType {get;set;}
        public String ClassOfService {get;set;}
        public Date ConnectDate {get;set;}
        public String CustomerName {get;set;}
        public WS_ESB_BusinessObjects.Port DigitalSwitchPort {get;set;}
        public Date DisconnectDate {get;set;}
        public String DisconnectReason {get;set;}
        public String FacilityRemarks {get;set;}
        public String InstallationRemarks {get;set;}
        public String LineCardId {get;set;}
        public String LineEquipmentNumber {get;set;}
        public String OfficeId {get;set;}
        public String OtherCarrierNumber {get;set;}
        public WS_ESB_BusinessObjects.Port Port {get;set;}
        public String PremiseRemarks {get;set;}
        public String RingCode {get;set;}
        public String SecondCircuit {get;set;}
        public String SheathPair {get;set;}
        public String SpecialCircuit {get;set;}
        public WS_ESB_BusinessObjects.Port Splitter {get;set;}
        public WS_ESB_BusinessObjects.TelephoneNumber TelephoneNumber {get;set;}
        public String TelephoneNumberPortingStatus {get;set;}
        public String FromTerminalCount {get;set;}
        public String ToTerminalCount {get;set;}
        public String ThirdCircuit {get;set;}
        public WS_ESB_BusinessObjects.LineTreatment[] LineTreatment {get;set;}
        public WS_ESB_BusinessObjects.DigitalSubscriberLineAccessMultiplexer[] DigitalSubscriberLineAccessMultiplexer {get;set;}
        public WS_ESB_BusinessObjects.Port[] FiberPort {get;set;}
        public String PairCountFrom {get;set;}
        public String PairCountTo {get;set;}
        transient String[] AdvisedCustomerOfChargesFlag_type_info = new String[]{'AdvisedCustomerOfChargesFlag','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'    };
        transient String[] Cable_type_info = new String[]{'Cable','http://ibus.czncorp.com/ESB/BusinessObjects','Cable','0','-1','false'    };
        transient String[] CardStationRemarks_type_info = new String[]{'CardStationRemarks','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] CarrierCableOfficeCode_type_info = new String[]{'CarrierCableOfficeCode','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] CarrierPair_type_info = new String[]{'CarrierPair','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] CentralOfficeCardOption_type_info = new String[]{'CentralOfficeCardOption','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] CentralOfficeEquipmentType_type_info = new String[]{'CentralOfficeEquipmentType','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] ClassOfService_type_info = new String[]{'ClassOfService','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] ConnectDate_type_info = new String[]{'ConnectDate','http://www.w3.org/2001/XMLSchema','date','0','1','false' };
        transient String[] CustomerName_type_info = new String[]{'CustomerName','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] DigitalSwitchPort_type_info = new String[]{'DigitalSwitchPort','http://ibus.czncorp.com/ESB/BusinessObjects','Port','0','1','false'  };
        transient String[] DisconnectDate_type_info = new String[]{'DisconnectDate','http://www.w3.org/2001/XMLSchema','date','0','1','false'   };
        transient String[] DisconnectReason_type_info = new String[]{'DisconnectReason','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] FacilityRemarks_type_info = new String[]{'FacilityRemarks','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] InstallationRemarks_type_info = new String[]{'InstallationRemarks','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] LineCardId_type_info = new String[]{'LineCardId','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] LineEquipmentNumber_type_info = new String[]{'LineEquipmentNumber','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] OfficeId_type_info = new String[]{'OfficeId','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] OtherCarrierNumber_type_info = new String[]{'OtherCarrierNumber','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] Port_type_info = new String[]{'Port','http://ibus.czncorp.com/ESB/BusinessObjects','Port','0','1','false'    };
        transient String[] PremiseRemarks_type_info = new String[]{'PremiseRemarks','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] RingCode_type_info = new String[]{'RingCode','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] SecondCircuit_type_info = new String[]{'SecondCircuit','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] SheathPair_type_info = new String[]{'SheathPair','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] SpecialCircuit_type_info = new String[]{'SpecialCircuit','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] Splitter_type_info = new String[]{'Splitter','http://ibus.czncorp.com/ESB/BusinessObjects','Port','0','1','false'    };
        transient String[] TelephoneNumber_type_info = new String[]{'TelephoneNumber','http://ibus.czncorp.com/ESB/BusinessObjects','TelephoneNumber','0','1','false'   };
        transient String[] TelephoneNumberPortingStatus_type_info = new String[]{'TelephoneNumberPortingStatus','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] FromTerminalCount_type_info = new String[]{'FromTerminalCount','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] ToTerminalCount_type_info = new String[]{'ToTerminalCount','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] ThirdCircuit_type_info = new String[]{'ThirdCircuit','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] LineTreatment_type_info = new String[]{'LineTreatment','http://ibus.czncorp.com/ESB/BusinessObjects','LineTreatment','0','3','false' };
        transient String[] DigitalSubscriberLineAccessMultiplexer_type_info = new String[]{'DigitalSubscriberLineAccessMultiplexer','http://ibus.czncorp.com/ESB/BusinessObjects','DigitalSubscriberLineAccessMultiplexer','0','8','false'  };
        transient String[] FiberPort_type_info = new String[]{'FiberPort','http://ibus.czncorp.com/ESB/BusinessObjects','Port','0','-1','false' };
        transient String[] PairCountFrom_type_info = new String[]{'PairCountFrom','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] PairCountTo_type_info = new String[]{'PairCountTo','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'   };
        transient String[] field_order_type_info = new String[]{'AdvisedCustomerOfChargesFlag','Cable','CardStationRemarks','CarrierCableOfficeCode','CarrierPair','CentralOfficeCardOption','CentralOfficeEquipmentType','ClassOfService','ConnectDate','CustomerName','DigitalSwitchPort','DisconnectDate','DisconnectReason','FacilityRemarks','InstallationRemarks','LineCardId','LineEquipmentNumber','OfficeId','OtherCarrierNumber','Port','PremiseRemarks','RingCode','SecondCircuit','SheathPair','SpecialCircuit','Splitter','TelephoneNumber','TelephoneNumberPortingStatus','FromTerminalCount','ToTerminalCount','ThirdCircuit','LineTreatment','DigitalSubscriberLineAccessMultiplexer','FiberPort','PairCountFrom','PairCountTo' };
    }
    public class TimePeriod {
        public DateTime StartDateTime;
        public DateTime EndDateTime;
        public String StartDateTimeString;
        public String EndDateTimeString;
        transient String[] StartDateTime_type_info = new String[]{'StartDateTime','http://www.w3.org/2001/XMLSchema','dateTime','0','1','false' };
        transient String[] EndDateTime_type_info = new String[]{'EndDateTime','http://www.w3.org/2001/XMLSchema','dateTime','0','1','false' };
        transient String[] StartDateTimeString_type_info = new String[]{'StartDateTimeString','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] EndDateTimeString_type_info = new String[]{'EndDateTimeString','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'   };
        transient String[] field_order_type_info = new String[]{'StartDateTime','EndDateTime','StartDateTimeString','EndDateTimeString' };
    }
    public class RemarkText {
        public String RemarkText;
        transient String[] RemarkText_type_info = new String[]{'RemarkText','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'   };
        transient String[] field_order_type_info = new String[]{'RemarkText'    };
    }
    
    public class MemoNote {
        public String MemoTextNote;
        public WS_ESB_BusinessObjects.MemoTextLineProperties[] MemoTextLineProperties;
        transient String[] MemoTextNote_type_info = new String[]{'MemoTextNote','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] MemoTextLineProperties_type_info = new String[]{'MemoTextLineProperties','http://ibus.czncorp.com/ESB/BusinessObjects','MemoTextLineProperties','0','-1','false' };
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
        transient String[] field_order_type_info = new String[]{'MemoTextNote','MemoTextLineProperties'};
    }
    
    public class MemoTextLineProperties {
        public Boolean EditableFlag;
        public Integer SequenceNumber;
        transient String[] EditableFlag_type_info = new String[]{'EditableFlag','http://www.w3.org/2001/XMLSchema','Boolean','0','1','false'};
        transient String[] SequenceNumber_type_info = new String[]{'SequenceNumber','http://www.w3.org/2001/XMLSchema','int','0','1','false'    };
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'   };
        transient String[] field_order_type_info = new String[]{'EditableFlag','SequenceNumber'};
    }
    public class MemoSection {
        public String MemoSectionName;
        public String MemoText;
        transient String[] MemoSectionName_type_info = new String[]{'MemoSectionName','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] MemoText_type_info = new String[]{'MemoText','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'   };
        transient String[] field_order_type_info = new String[]{'MemoSectionName','MemoText'    };
    }
    public class MemoAmount{
        public Boolean EditableFlag;
        public Double Amount;
        transient String[] EditableFlag_type_info = new String[]{'EditableFlag','http://www.w3.org/2001/XMLSchema','Boolean','0','1','false'};
        transient String[] Amount_type_info = new String[]{'Amount','http://www.w3.org/2001/XMLSchema','double','0','1','false' };
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'   };
        transient String[] field_order_type_info = new String[]{'EditableFlag','Amount'};
    }
    public class MemoDate{
        public Boolean EditableFlag;
        public Date Date_x;
        transient String[] EditableFlag_type_info = new String[]{'EditableFlag','http://www.w3.org/2001/XMLSchema','Boolean','0','1','false'};
        transient String[] Date_x_type_info = new String[]{'Date','http://www.w3.org/2001/XMLSchema','date','0','1','false' };
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'   };
        transient String[] field_order_type_info = new String[]{'EditableFlag','Date_x'};
    }
    public class OrganizationName {
        public Date IssueDate;
        public String Picture;
        public WS_ESB_BusinessObjects.TimePeriod ValidFor;
        public String TradingName {get;set;}
        public String NameType;
        public String Description;
        transient String[] IssueDate_type_info = new String[]{'IssueDate','http://www.w3.org/2001/XMLSchema','date','0','1','false' };
        transient String[] Picture_type_info = new String[]{'Picture','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] ValidFor_type_info = new String[]{'ValidFor','http://ibus.czncorp.com/ESB/BusinessObjects','TimePeriod','0','1','false'  };
        transient String[] TradingName_type_info = new String[]{'TradingName','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] NameType_type_info = new String[]{'NameType','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] Description_type_info = new String[]{'Description','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'   };
        transient String[] field_order_type_info = new String[]{'IssueDate','Picture','ValidFor','TradingName','NameType','Description' };
    }
    public class TechnologyType {
        public String Technology {get;set;}
        public String TechnologyGroup {get;set;}
        public String TechnologyItem {get;set;}
        public String AvailableSpeed {get;set;}
        public String AdditionalSpeedInfo {get;set;}
        public String MaxDslamSpeed {get;set;}
        public String DefaultModem {get;set;}
        public String MarketOffering {get;set;}
        public String CustomerType {get;set;}
        public Boolean PrePaidBroadBandCapableFlag {get;set;}
        public String TechFeature {get;set;}
        transient String[] Technology_type_info = new String[]{'Technology','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] TechnologyGroup_type_info = new String[]{'TechnologyGroup','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] TechnologyItem_type_info = new String[]{'TechnologyItem','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] AvailableSpeed_type_info = new String[]{'AvailableSpeed','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] AdditionalSpeedInfo_type_info = new String[]{'AdditionalSpeedInfo','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] MaxDslamSpeed_type_info = new String[]{'MaxDslamSpeed','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] DefaultModem_type_info = new String[]{'DefaultModem','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] MarketOffering_type_info = new String[]{'MarketOffering','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] CustomerType_type_info = new String[]{'CustomerType','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] PrePaidBroadBandCapableFlag_type_info = new String[]{'PrePaidBroadBandCapableFlag','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] TechFeature_type_info = new String[]{'TechFeature','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'   };
        transient String[] field_order_type_info = new String[]{'Technology','TechnologyGroup','TechnologyItem','AvailableSpeed','AdditionalSpeedInfo','MaxDslamSpeed','DefaultModem','MarketOffering','CustomerType','PrePaidBroadBandCapableFlag','TechFeature'};
    }
    public class LineTreatment {
        public String LineTreatmentId;
        public String LocationNumber;
        public Integer SequenceNumber;
        transient String[] LineTreatmentId_type_info = new String[]{'LineTreatmentId','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] LocationNumber_type_info = new String[]{'LocationNumber','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] SequenceNumber_type_info = new String[]{'SequenceNumber','http://www.w3.org/2001/XMLSchema','int','0','1','false'    };
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'   };
        transient String[] field_order_type_info = new String[]{'LineTreatmentId','LocationNumber','SequenceNumber' };
    }
    public class Port {
        public String CustomersCarrierNameAbbreviation;
        public WS_ESB_BusinessObjects.CommonLanguageLocationId CommonLanguageLocationId;
        public String Data;
        public Integer PortId;
        public Integer SequenceNumber;
        public String Type_x;
        public WS_ESB_BusinessObjects.TerminalKey OpticalNetworkTerminalKey;
        public String VoiceSourceId;
        public String VoiceDestinationId;
        public String DataSourceId;
        public String DataDestinationId;
        public String DataVirtualPathVirtualCircuit;
        public String ProvisioningSpeed;
        public String PacketDestinationId;
        transient String[] CustomersCarrierNameAbbreviation_type_info = new String[]{'CustomersCarrierNameAbbreviation','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] CommonLanguageLocationId_type_info = new String[]{'CommonLanguageLocationId','http://ibus.czncorp.com/ESB/BusinessObjects','CommonLanguageLocationId','0','1','false'    };
        transient String[] Data_type_info = new String[]{'Data','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] PortId_type_info = new String[]{'PortId','http://www.w3.org/2001/XMLSchema','int','0','1','false'    };
        transient String[] SequenceNumber_type_info = new String[]{'SequenceNumber','http://www.w3.org/2001/XMLSchema','int','0','1','false'    };
        transient String[] Type_x_type_info = new String[]{'Type','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] OpticalNetworkTerminalKey_type_info = new String[]{'OpticalNetworkTerminalKey','http://ibus.czncorp.com/ESB/BusinessObjects','TerminalKey','0','1','false'   };
        transient String[] VoiceSourceId_type_info = new String[]{'VoiceSourceId','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] VoiceDestinationId_type_info = new String[]{'VoiceDestinationId','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] DataSourceId_type_info = new String[]{'DataSourceId','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] DataDestinationId_type_info = new String[]{'DataDestinationId','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] DataVirtualPathVirtualCircuit_type_info = new String[]{'DataVirtualPathVirtualCircuit','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] ProvisioningSpeed_type_info = new String[]{'ProvisioningSpeed','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] PacketDestinationId_type_info = new String[]{'PacketDestinationId','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'   };
        transient String[] field_order_type_info = new String[]{'CustomersCarrierNameAbbreviation','CommonLanguageLocationId','Data','PortId','SequenceNumber','Type_x','OpticalNetworkTerminalKey','VoiceSourceId','VoiceDestinationId','DataSourceId','DataDestinationId','DataVirtualPathVirtualCircuit','ProvisioningSpeed','PacketDestinationId'   };
    }
    public class Email {
        public String EmailAddress;
        public WS_ESB_BusinessObjects.IndividualName EmailDisplayName;
        transient String[] EmailAddress_type_info = new String[]{'EmailAddress','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] EmailDisplayName_type_info = new String[]{'EmailDisplayName','http://ibus.czncorp.com/ESB/BusinessObjects','IndividualName','0','1','false'  };
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'   };
        transient String[] field_order_type_info = new String[]{'EmailAddress','EmailDisplayName'   };
    }
    public class AddressText {
        public String AddressText {get;set;}
        public Integer SequenceNumber {get;set;}
        transient String[] AddressText_type_info = new String[]{'AddressText','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] SequenceNumber_type_info = new String[]{'SequenceNumber','http://www.w3.org/2001/XMLSchema','int','0','1','false'    };
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'   };
        transient String[] field_order_type_info = new String[]{'AddressText','SequenceNumber'  };
    }
    public class Memo {
        public String MemoTemplateName;
        public Integer MemoTemplateVersionId;
        public Integer SequenceNumber;
        public Boolean MemoLockedFlag;
        public String UserID;
        public DateTime CreateDateTime;
        public WS_ESB_BusinessObjects.PhoneNumberAsId Key;
        public String HashKey;
        public WS_ESB_BusinessObjects.MemoSection[] MemoSection;
        transient String[] MemoTemplateName_type_info = new String[]{'MemoTemplateName','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] MemoTemplateVersionId_type_info = new String[]{'MemoTemplateVersionId','http://www.w3.org/2001/XMLSchema','int','0','1','false'  };
        transient String[] SequenceNumber_type_info = new String[]{'SequenceNumber','http://www.w3.org/2001/XMLSchema','int','0','1','false'    };
        transient String[] MemoLockedFlag_type_info = new String[]{'MemoLockedFlag','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'    };
        transient String[] UserID_type_info = new String[]{'UserID','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] CreateDateTime_type_info = new String[]{'CreateDateTime','http://www.w3.org/2001/XMLSchema','dateTime','0','1','false'   };
        transient String[] Key_type_info = new String[]{'Key','http://ibus.czncorp.com/ESB/BusinessObjects','PhoneNumberAsId','0','1','false'   };
        transient String[] HashKey_type_info = new String[]{'HashKey','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] MemoSection_type_info = new String[]{'MemoSection','http://ibus.czncorp.com/ESB/BusinessObjects','MemoSection','0','-1','false'  };
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'   };
        transient String[] field_order_type_info = new String[]{'MemoTemplateName','MemoTemplateVersionId','SequenceNumber','MemoLockedFlag','UserID','CreateDateTime','Key','HashKey','MemoSection'    };
    }
    
    public class Price {
        public String Name;
        public String Description;
        public WS_ESB_BusinessObjects.Quantity Quantity;
        public String CurrencyType;
        public String PriceType;
        public WS_ESB_BusinessObjects.TimePeriod ValidFor;
        public String PricingScheduleType;
        
        transient String[] Name_type_info = new String[]{'Name','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] Description_type_info = new String[]{'Description','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] Quantity_type_info = new String[]{'Quantity','http://ibus.czncorp.com/ESB/BusinessObjects','Quantity','0','1','false'    };
        transient String[] CurrencyType_type_info = new String[]{'CurrencyType','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] PriceType_type_info = new String[]{'PriceType','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] ValidFor_type_info = new String[]{'ValidFor','http://ibus.czncorp.com/ESB/BusinessObjects','TimePeriod','0','1','false'  };
        transient String[] PricingScheduleType_type_info = new String[]{'PricingScheduleType','http://ibus.czncorp.com/ESB/BusinessObjects','string','0','1','false'    };
                
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'   };
        transient String[] field_order_type_info = new String[]{'Name','Description','Quantity','CurrencyType','PriceType','ValidFor','PricingScheduleType'   };
    }
    
    public class AddressUnit {
        public Integer SequenceNumber {get;set;}
        public String Designator {get;set;}
        public String Number_x {get;set;}
        transient String[] SequenceNumber_type_info = new String[]{'SequenceNumber','http://www.w3.org/2001/XMLSchema','int','0','1','false'    };
        transient String[] Designator_type_info = new String[]{'Designator','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] Number_x_type_info = new String[]{'Number','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'   };
        transient String[] field_order_type_info = new String[]{'SequenceNumber','Designator','Number_x'    };
    }
    public class SalesRep {
        public WS_ESB_BusinessObjects.Individual Individual;
        public WS_ESB_BusinessObjects.Organization Organization;
        public WS_ESB_BusinessObjects.TelephoneNumber[] TelephoneNumber;
        public WS_ESB_BusinessObjects.CitizensPostalAddress[] CitizensPostalAddress;
        public WS_ESB_BusinessObjects.TimePeriod ValidFor;
        transient String[] Individual_type_info = new String[]{'Individual','http://ibus.czncorp.com/ESB/BusinessObjects','Individual','0','1','false'  };
        transient String[] Organization_type_info = new String[]{'Organization','http://ibus.czncorp.com/ESB/BusinessObjects','Organization','0','1','false'    };
        transient String[] TelephoneNumber_type_info = new String[]{'TelephoneNumber','http://ibus.czncorp.com/ESB/BusinessObjects','TelephoneNumber','0','-1','false'  };
        transient String[] CitizensPostalAddress_type_info = new String[]{'CitizensPostalAddress','http://ibus.czncorp.com/ESB/BusinessObjects','CitizensPostalAddress','0','-1','false'    };
        transient String[] ValidFor_type_info = new String[]{'ValidFor','http://ibus.czncorp.com/ESB/BusinessObjects','TimePeriod','0','1','false'  };
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'   };
        transient String[] field_order_type_info = new String[]{'Individual','Organization','TelephoneNumber','CitizensPostalAddress','ValidFor'    };
    }
    public class OrderInfo {
        public String OrderNumber;
        public String Environment;
        transient String[] OrderNumber_type_info = new String[]{'OrderNumber','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] Environment_type_info = new String[]{'Environment','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'   };
        transient String[] field_order_type_info = new String[]{'OrderNumber','Environment' };
    }
    public class NorthAmericanTelephoneNumber {
        public String NPA;
        public String NXX;
        public String Station;
        transient String[] NPA_type_info = new String[]{'NPA','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] NXX_type_info = new String[]{'NXX','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] Station_type_info = new String[]{'Station','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'   };
        transient String[] field_order_type_info = new String[]{'NPA','NXX','Station'   };
    }
    public class Stage {
        public String Code;
        public String Description;
        transient String[] Code_type_info = new String[]{'Code','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] Description_type_info = new String[]{'Description','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'   };
        transient String[] field_order_type_info = new String[]{'Code','Description'    };
    }
    public class TerminalKey {
        public String ModelNumber;
        public String SerialNumber;
        public String VendorId;
        transient String[] ModelNumber_type_info = new String[]{'ModelNumber','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] SerialNumber_type_info = new String[]{'SerialNumber','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] VendorId_type_info = new String[]{'VendorId','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'   };
        transient String[] field_order_type_info = new String[]{'ModelNumber','SerialNumber','VendorId' };
    }
    public class ServiceProvider {
        public WS_ESB_BusinessObjects.Individual Individual;
        public WS_ESB_BusinessObjects.Organization Organization;
        public WS_ESB_BusinessObjects.TelephoneNumber[] TelephoneNumber;
        public WS_ESB_BusinessObjects.CitizensPostalAddress[] CitizensPostalAddress;
        public WS_ESB_BusinessObjects.TimePeriod ValidFor;
        transient String[] Individual_type_info = new String[]{'Individual','http://ibus.czncorp.com/ESB/BusinessObjects','Individual','0','1','false'  };
        transient String[] Organization_type_info = new String[]{'Organization','http://ibus.czncorp.com/ESB/BusinessObjects','Organization','0','1','false'    };
        transient String[] TelephoneNumber_type_info = new String[]{'TelephoneNumber','http://ibus.czncorp.com/ESB/BusinessObjects','TelephoneNumber','0','-1','false'  };
        transient String[] CitizensPostalAddress_type_info = new String[]{'CitizensPostalAddress','http://ibus.czncorp.com/ESB/BusinessObjects','CitizensPostalAddress','0','-1','false'    };
        transient String[] ValidFor_type_info = new String[]{'ValidFor','http://ibus.czncorp.com/ESB/BusinessObjects','TimePeriod','0','1','false'  };
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'   };
        transient String[] field_order_type_info = new String[]{'Individual','Organization','TelephoneNumber','CitizensPostalAddress','ValidFor'    };
    }
    public class ApplicableTax {
        public String TaxCode;
        public String TaxAmount;
        public String ProratedTaxAmount;
        transient String[] TaxCode_type_info = new String[]{'TaxCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] TaxAmount_type_info = new String[]{'TaxAmount','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] ProratedTaxAmount_type_info = new String[]{'ProratedTaxAmount','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'   };
        transient String[] field_order_type_info = new String[]{'TaxCode','TaxAmount','ProratedTaxAmount'   };
    }
    public class CitizensServiceAddress {
        public String StateOrProvince {get;set;}
        public String Country {get;set;}
        public String County {get;set;}
        public String StreetNrFirst {get;set;}
        public String StreetNrFirstSuffix {get;set;}
        public String StreetName {get;set;}
        public String StreetType {get;set;}
        public String StreetSuffix {get;set;}
        public String StreetNrLast {get;set;}
        public String StreetNrLastSuffix {get;set;}
        public String Locality {get;set;}
        public String Postcode {get;set;}
        public String StreetNrFirstPrefix {get;set;}
        public String StreetNrLastPrefix {get;set;}
        public String StreetNamePrefix {get;set;}
        public String StreetNameSuffix {get;set;}
        public String Subdivision {get;set;}
        public String StreetSubDescription {get;set;}
        public String StreetDirection {get;set;}
        public String StreetPostDirection {get;set;}
        public String BuildingName {get;set;}
        public String BuildingNumber {get;set;}
        public String BuildingSubNumber {get;set;}
        public WS_ESB_BusinessObjects.AddressUnit[] Unit {get;set;}
        public String SubLocation {get;set;}
        public String Community {get;set;}
        public String AddressID {get;set;}
        public String LocalityID {get;set;}
        public String WireCenter {get;set;}
        public WS_ESB_BusinessObjects.Exchange Exchange {get;set;}
        public WS_ESB_BusinessObjects.CommonLanguageLocationId CommonLanguageLocationId {get;set;}
        public WS_ESB_BusinessObjects.CodeDescriptionPair TaxingDistrict {get;set;}
        public String PhysicalMapPageNumber {get;set;}
        public String PhysicalMapSector {get;set;}
        public String MileageZone {get;set;}
        public Boolean ServiceOverrideFlag {get;set;}
        public GlobalPosition GlobalPosition {get;set;}
        public Boolean HSICapableFlag {get;set;}
        public String PricingSegmentIndicator {get;set;}
        public Boolean ReadyForServiceFlag {get;set;}
        public Integer ServiceSequenceNumber {get;set;}
        public Integer ServiceControlNumber {get;set;}
        public WS_ESB_BusinessObjects.AdditionalAddressInfo[] AdditionalAddressInfo {get;set;}
        public WS_ESB_BusinessObjects.LineCardHistory[] LineCardHistory {get;set;}
        public WS_ESB_BusinessObjects.DataSourceEnvironment DataSourceEnvironment {get;set;}
        public Boolean HomeOwnerAssociationFlag {get;set;}
        public Boolean LocalFranchiseAgreementFlag {get;set;}
        public Boolean FiberProductCapableFlag {get;set;}
        public WS_ESB_BusinessObjects.Line[] Line {get;set;}
        public WS_ESB_BusinessObjects.CommonLanguageLocationId CentralOfficeCLLI {get;set;}
        public WS_ESB_BusinessObjects.InternetInfoType InternetInfo {get;set;}
        public Boolean ConnectedLineCardsFoundFlag {get;set;}
        public WS_ESB_BusinessObjects.LineCard LineCardInfo {get;set;}
        public Boolean FiberVideoAvailableFlag {get;set;}
        public String Ethernet {get;set;}
        public String IncorporatedIndicator {get;set;}
        public String PoolType {get;set;}
        transient String[] StateOrProvince_type_info = new String[]{'StateOrProvince','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] Country_type_info = new String[]{'Country','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] County_type_info = new String[]{'County','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] StreetNrFirst_type_info = new String[]{'StreetNrFirst','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] StreetNrFirstSuffix_type_info = new String[]{'StreetNrFirstSuffix','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] StreetName_type_info = new String[]{'StreetName','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] StreetType_type_info = new String[]{'StreetType','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] StreetSuffix_type_info = new String[]{'StreetSuffix','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] StreetNrLast_type_info = new String[]{'StreetNrLast','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] StreetNrLastSuffix_type_info = new String[]{'StreetNrLastSuffix','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] Locality_type_info = new String[]{'Locality','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] Postcode_type_info = new String[]{'Postcode','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] StreetNrFirstPrefix_type_info = new String[]{'StreetNrFirstPrefix','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] StreetNrLastPrefix_type_info = new String[]{'StreetNrLastPrefix','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] StreetNamePrefix_type_info = new String[]{'StreetNamePrefix','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] StreetNameSuffix_type_info = new String[]{'StreetNameSuffix','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] Subdivision_type_info = new String[]{'Subdivision','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] StreetSubDescription_type_info = new String[]{'StreetSubDescription','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] StreetDirection_type_info = new String[]{'StreetDirection','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] StreetPostDirection_type_info = new String[]{'StreetPostDirection','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] BuildingName_type_info = new String[]{'BuildingName','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] BuildingNumber_type_info = new String[]{'BuildingNumber','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] BuildingSubNumber_type_info = new String[]{'BuildingSubNumber','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] Unit_type_info = new String[]{'Unit','http://ibus.czncorp.com/ESB/BusinessObjects','AddressUnit','0','-1','false'    };
        transient String[] SubLocation_type_info = new String[]{'SubLocation','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] Community_type_info = new String[]{'Community','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] AddressID_type_info = new String[]{'AddressID','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] LocalityID_type_info = new String[]{'LocalityID','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] WireCenter_type_info = new String[]{'WireCenter','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] Exchange_type_info = new String[]{'Exchange','http://ibus.czncorp.com/ESB/BusinessObjects','Exchange','0','1','false'    };
        transient String[] CommonLanguageLocationId_type_info = new String[]{'CommonLanguageLocationId','http://ibus.czncorp.com/ESB/BusinessObjects','CommonLanguageLocationId','0','1','false'    };
        transient String[] TaxingDistrict_type_info = new String[]{'TaxingDistrict','http://ibus.czncorp.com/ESB/BusinessObjects','CodeDescriptionPair','0','1','false' };
        transient String[] PhysicalMapPageNumber_type_info = new String[]{'PhysicalMapPageNumber','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] PhysicalMapSector_type_info = new String[]{'PhysicalMapSector','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] MileageZone_type_info = new String[]{'MileageZone','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] ServiceOverrideFlag_type_info = new String[]{'ServiceOverrideFlag','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'  };
        transient String[] GlobalPosition_type_info = new String[]{'GlobalPosition','http://ibus.czncorp.com/ESB/BusinessObjects','GlobalPosition','0','1','false'  };
        transient String[] HSICapableFlag_type_info = new String[]{'HSICapableFlag','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'    };
        transient String[] PricingSegmentIndicator_type_info = new String[]{'PricingSegmentIndicator','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] ReadyForServiceFlag_type_info = new String[]{'ReadyForServiceFlag','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'  };
        transient String[] ServiceSequenceNumber_type_info = new String[]{'ServiceSequenceNumber','http://www.w3.org/2001/XMLSchema','int','0','1','false'  };
        transient String[] ServiceControlNumber_type_info = new String[]{'ServiceControlNumber','http://www.w3.org/2001/XMLSchema','int','0','1','false'    };
        transient String[] AdditionalAddressInfo_type_info = new String[]{'AdditionalAddressInfo','http://ibus.czncorp.com/ESB/BusinessObjects','AdditionalAddressInfo','0','-1','false'    };
        transient String[] LineCardHistory_type_info = new String[]{'LineCardHistory','http://ibus.czncorp.com/ESB/BusinessObjects','LineCardHistory','0','-1','false'  };
        transient String[] DataSourceEnvironment_type_info = new String[]{'DataSourceEnvironment','http://ibus.czncorp.com/ESB/BusinessObjects','DataSourceEnvironment','0','1','false' };
        transient String[] HomeOwnerAssociationFlag_type_info = new String[]{'HomeOwnerAssociationFlag','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'    };
        transient String[] LocalFranchiseAgreementFlag_type_info = new String[]{'LocalFranchiseAgreementFlag','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'  };
        transient String[] FiberProductCapableFlag_type_info = new String[]{'FiberProductCapableFlag','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'  };
        transient String[] Line_type_info = new String[]{'Line','http://ibus.czncorp.com/ESB/BusinessObjects','Line','0','-1','false'   };
        transient String[] CentralOfficeCLLI_type_info = new String[]{'CentralOfficeCLLI','http://ibus.czncorp.com/ESB/BusinessObjects','CommonLanguageLocationId','0','1','false'  };
        transient String[] InternetInfo_type_info = new String[]{'InternetInfo','http://ibus.czncorp.com/ESB/BusinessObjects','InternetInfoType','0','1','false'    };
        transient String[] ConnectedLineCardsFoundFlag_type_info = new String[]{'ConnectedLineCardsFoundFlag','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'  };
        transient String[] LineCardInfo_type_info = new String[]{'LineCardInfo','http://ibus.czncorp.com/ESB/BusinessObjects','LineCard','0','1','false'    };
        transient String[] FiberVideoAvailableFlag_type_info = new String[]{'FiberVideoAvailableFlag','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'  };
        transient String[] Ethernet_type_info = new String[]{'Ethernet','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] IncorporatedIndicator_type_info = new String[]{'IncorporatedIndicator','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] PoolType_type_info = new String[]{'PoolType','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'   };
        transient String[] field_order_type_info = new String[]{'StateOrProvince','Country','County','StreetNrFirst','StreetNrFirstSuffix','StreetName','StreetType','StreetSuffix','StreetNrLast','StreetNrLastSuffix','Locality','Postcode','StreetNrFirstPrefix','StreetNrLastPrefix','StreetNamePrefix','StreetNameSuffix','Subdivision','StreetSubDescription','StreetDirection','StreetPostDirection','BuildingName','BuildingNumber','BuildingSubNumber','Unit','SubLocation','Community','AddressID','LocalityID','WireCenter','Exchange','CommonLanguageLocationId','TaxingDistrict','PhysicalMapPageNumber','PhysicalMapSector','MileageZone','ServiceOverrideFlag','GlobalPosition','HSICapableFlag','PricingSegmentIndicator','ReadyForServiceFlag','ServiceSequenceNumber','ServiceControlNumber','AdditionalAddressInfo','LineCardHistory','DataSourceEnvironment','HomeOwnerAssociationFlag','LocalFranchiseAgreementFlag','FiberProductCapableFlag','Line','CentralOfficeCLLI','InternetInfo','ConnectedLineCardsFoundFlag','LineCardInfo','FiberVideoAvailableFlag','Ethernet','IncorporatedIndicator','PoolType'};
    }
    public class ConnectionType {
        public String CentralOffice {get;set;}
        public WS_ESB_BusinessObjects.CommonLanguageLocationId CentralOfficeClliCode {get;set;}
        public String Origination {get;set;}
        public WS_ESB_BusinessObjects.CommonLanguageLocationId RemoteOfficeClliCode {get;set;}
        public String TerminalId {get;set;}
        public String TerminalSpeed {get;set;}
        public WS_ESB_BusinessObjects.TechnologyListType Technologies {get;set;}
        public string DistanceFromDslamInFeet; //added
        transient String[] CentralOffice_type_info = new String[]{'CentralOffice','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] CentralOfficeClliCode_type_info = new String[]{'CentralOfficeClliCode','http://ibus.czncorp.com/ESB/BusinessObjects','CommonLanguageLocationId','0','1','false'  };
        transient String[] Origination_type_info = new String[]{'Origination','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] RemoteOfficeClliCode_type_info = new String[]{'RemoteOfficeClliCode','http://ibus.czncorp.com/ESB/BusinessObjects','CommonLanguageLocationId','0','1','false'    };
        transient String[] TerminalId_type_info = new String[]{'TerminalId','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] TerminalSpeed_type_info = new String[]{'TerminalSpeed','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] Technologies_type_info = new String[]{'Technologies','http://ibus.czncorp.com/ESB/BusinessObjects','TechnologyListType','0','1','false'  };
        transient String[] DistanceFromDslamInFeet_type_info = new String[]{'DistanceFromDslamInFeet','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'   };
        transient String[] field_order_type_info = new String[]{'CentralOffice','CentralOfficeClliCode','Origination','RemoteOfficeClliCode','TerminalId','TerminalSpeed','Technologies','DistanceFromDslamInFeet'  };
    }
    public class PartyIdentification {
        public Date IssueDate;
        public String Picture;
        public WS_ESB_BusinessObjects.TimePeriod ValidFor;
        transient String[] IssueDate_type_info = new String[]{'IssueDate','http://www.w3.org/2001/XMLSchema','date','0','1','false' };
        transient String[] Picture_type_info = new String[]{'Picture','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] ValidFor_type_info = new String[]{'ValidFor','http://ibus.czncorp.com/ESB/BusinessObjects','TimePeriod','0','1','false'  };
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'   };
        transient String[] field_order_type_info = new String[]{'IssueDate','Picture','ValidFor'    };
    }
    public class Frog {
        public String FrogRemark;
        public String FrogType;
        public String FroggedOnCable;
        public String FroggedOnCableOfficeCode;
        public String FroggedOnPair;
        public WS_ESB_BusinessObjects.Terminal FromTerminal;
        public Integer SequenceNumber;
        public WS_ESB_BusinessObjects.Terminal ToTerminal;
        transient String[] FrogRemark_type_info = new String[]{'FrogRemark','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] FrogType_type_info = new String[]{'FrogType','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] FroggedOnCable_type_info = new String[]{'FroggedOnCable','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] FroggedOnCableOfficeCode_type_info = new String[]{'FroggedOnCableOfficeCode','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] FroggedOnPair_type_info = new String[]{'FroggedOnPair','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] FromTerminal_type_info = new String[]{'FromTerminal','http://ibus.czncorp.com/ESB/BusinessObjects','Terminal','0','1','false'    };
        transient String[] SequenceNumber_type_info = new String[]{'SequenceNumber','http://www.w3.org/2001/XMLSchema','int','0','1','false'    };
        transient String[] ToTerminal_type_info = new String[]{'ToTerminal','http://ibus.czncorp.com/ESB/BusinessObjects','Terminal','0','1','false'    };
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'   };
        transient String[] field_order_type_info = new String[]{'FrogRemark','FrogType','FroggedOnCable','FroggedOnCableOfficeCode','FroggedOnPair','FromTerminal','SequenceNumber','ToTerminal'    };
    }
    public class CodeDescriptionPair {
        public String Code {get;set;}
        public String Description {get;set;}
        transient String[] Code_type_info = new String[]{'Code','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] Description_type_info = new String[]{'Description','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'   };
        transient String[] field_order_type_info = new String[]{'Code','Description'    };
    }
    public class Exchange {
        public String NPA {get;set;}
        public String NXX {get;set;}
        transient String[] NPA_type_info = new String[]{'NPA','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] NXX_type_info = new String[]{'NXX','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'   };
        transient String[] field_order_type_info = new String[]{'NPA','NXX' };
    }
    public class OrderType {
        public String Name;
        public String Description {get;set;}
        transient String[] Name_type_info = new String[]{'Name','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] Description_type_info = new String[]{'Description','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'   };
        transient String[] field_order_type_info = new String[]{'Name','Description'    };
    }
    public class Duration {
        public Double Amount;
        public String Units;
        transient String[] Amount_type_info = new String[]{'Amount','http://www.w3.org/2001/XMLSchema','double','0','1','false' };
        transient String[] Units_type_info = new String[]{'Units','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'   };
        transient String[] field_order_type_info = new String[]{'Amount','Units'    };
    }
    public class ServiceProviderEmployee {
        public WS_ESB_BusinessObjects.Individual Individual;
        public WS_ESB_BusinessObjects.Organization Organization;
        public WS_ESB_BusinessObjects.TelephoneNumber[] TelephoneNumber;
        public WS_ESB_BusinessObjects.CitizensPostalAddress[] CitizensPostalAddress;
        public WS_ESB_BusinessObjects.TimePeriod ValidFor;
        public String EmploymentStatus;
        public String EmployeeNr;
        transient String[] Individual_type_info = new String[]{'Individual','http://ibus.czncorp.com/ESB/BusinessObjects','Individual','0','1','false'  };
        transient String[] Organization_type_info = new String[]{'Organization','http://ibus.czncorp.com/ESB/BusinessObjects','Organization','0','1','false'    };
        transient String[] TelephoneNumber_type_info = new String[]{'TelephoneNumber','http://ibus.czncorp.com/ESB/BusinessObjects','TelephoneNumber','0','-1','false'  };
        transient String[] CitizensPostalAddress_type_info = new String[]{'CitizensPostalAddress','http://ibus.czncorp.com/ESB/BusinessObjects','CitizensPostalAddress','0','-1','false'    };
        transient String[] ValidFor_type_info = new String[]{'ValidFor','http://ibus.czncorp.com/ESB/BusinessObjects','TimePeriod','0','1','false'  };
        transient String[] EmploymentStatus_type_info = new String[]{'EmploymentStatus','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] EmployeeNr_type_info = new String[]{'EmployeeNr','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'   };
        transient String[] field_order_type_info = new String[]{'Individual','Organization','TelephoneNumber','CitizensPostalAddress','ValidFor','EmploymentStatus','EmployeeNr'    };
    }
    public class DataSourceEnvironment {
        public String BillingSystem {get;set;}
        public String DataRegion {get;set;}
        public Integer DataRegionCode {get;set;}
        public String DataSource {get;set;}
        public String DataEnvironment {get;set;}
        transient String[] BillingSystem_type_info = new String[]{'BillingSystem','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] DataRegion_type_info = new String[]{'DataRegion','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] DataRegionCode_type_info = new String[]{'DataRegionCode','http://www.w3.org/2001/XMLSchema','int','0','1','false'    };
        transient String[] DataSource_type_info = new String[]{'DataSource','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] DataEnvironment_type_info = new String[]{'DataEnvironment','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'   };
        transient String[] field_order_type_info = new String[]{'BillingSystem','DataRegion','DataRegionCode','DataSource','DataEnvironment'    };      
    }
    public class RequestAccountId {
        public WS_ESB_BusinessObjects.PhoneNumberAsId PhoneNumberAsId;
        public String UniversalServiceId;
        public String AccountNumber;
        public WS_ESB_BusinessObjects.DataSourceEnvironment DataSourceEnvironment {get;set;}
        transient String[] PhoneNumberAsId_type_info = new String[]{'PhoneNumberAsId','http://ibus.czncorp.com/ESB/BusinessObjects','PhoneNumberAsId','0','1','false'   };
        transient String[] UniversalServiceId_type_info = new String[]{'UniversalServiceId','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] AccountNumber_type_info = new String[]{'AccountNumber','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] DataSourceEnvironment_type_info = new String[]{'DataSourceEnvironment','http://ibus.czncorp.com/ESB/BusinessObjects','DataSourceEnvironment','0','1','false' };
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
        transient String[] field_order_type_info = new String[]{'PhoneNumberAsId','UniversalServiceId','AccountNumber','DataSourceEnvironment'};
        public RequestAccountId(){
            DataSourceEnvironment = new WS_ESB_BusinessObjects.DataSourceEnvironment();
        }
    }
    public class Quantity {
        public String Amount {get;set;}
        public String Units {get;set;}
        transient String[] Amount_type_info = new String[]{'Amount','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] Units_type_info = new String[]{'Units','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'   };
        transient String[] field_order_type_info = new String[]{'Amount','Units'};
    }
    public class LineCardHistory {
        public Date ConnectDate;
        public Date DisconnectDate;
        public String PairStatus;
        public String DisconnectReason;
        public String CustomerName;
        public WS_ESB_BusinessObjects.TelephoneNumber TelephoneNumber {get;set;}
        transient String[] ConnectDate_type_info = new String[]{'ConnectDate','http://www.w3.org/2001/XMLSchema','date','0','1','false' };
        transient String[] DisconnectDate_type_info = new String[]{'DisconnectDate','http://www.w3.org/2001/XMLSchema','date','0','1','false'   };
        transient String[] PairStatus_type_info = new String[]{'PairStatus','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] DisconnectReason_type_info = new String[]{'DisconnectReason','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] CustomerName_type_info = new String[]{'CustomerName','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] TelephoneNumber_type_info = new String[]{'TelephoneNumber','http://ibus.czncorp.com/ESB/BusinessObjects','TelephoneNumber','0','1','false'   };
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'   };
        transient String[] field_order_type_info = new String[]{'ConnectDate','DisconnectDate','PairStatus','DisconnectReason','CustomerName','TelephoneNumber' };
    }
    public class Cable {
        public String CableId;
        public String OfficeCode;
        public WS_ESB_BusinessObjects.Frog[] Frog;
        public String FrogCountPerCablePair;
        public String FromBindingPost;
        public String Pair;
        public String RouteLeadForCableTerminal;
        public Integer SequenceNumber;
        public WS_ESB_BusinessObjects.Terminal FromTerminal;
        public String ToBindingPost;
        public String Exchange;
        transient String[] CableId_type_info = new String[]{'CableId','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] OfficeCode_type_info = new String[]{'OfficeCode','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] Frog_type_info = new String[]{'Frog','http://ibus.czncorp.com/ESB/BusinessObjects','Frog','0','-1','false'   };
        transient String[] FrogCountPerCablePair_type_info = new String[]{'FrogCountPerCablePair','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] FromBindingPost_type_info = new String[]{'FromBindingPost','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] Pair_type_info = new String[]{'Pair','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] RouteLeadForCableTerminal_type_info = new String[]{'RouteLeadForCableTerminal','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] SequenceNumber_type_info = new String[]{'SequenceNumber','http://www.w3.org/2001/XMLSchema','int','0','1','false'    };
        transient String[] FromTerminal_type_info = new String[]{'FromTerminal','http://ibus.czncorp.com/ESB/BusinessObjects','Terminal','0','1','false'    };
        transient String[] ToBindingPost_type_info = new String[]{'ToBindingPost','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] Exchange_type_info = new String[]{'Exchange','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'   };
        transient String[] field_order_type_info = new String[]{'CableId','OfficeCode','Frog','FrogCountPerCablePair','FromBindingPost','Pair','RouteLeadForCableTerminal','SequenceNumber','FromTerminal','ToBindingPost','Exchange'   };
    }
    public class RelatedOrder {
        public WS_ESB_BusinessObjects.OrderInfo LeadOrder;
        public WS_ESB_BusinessObjects.OrderInfo MemberOrder;
        public WS_ESB_BusinessObjects.OrderType OrderType;
        public String MemberOrderType;
        public String MemberOrderServiceType;
        public String GroupOrderDescription;
        public String GroupOrderDescriptionType;
        public Integer GroupOrderSequenceNumber;
        public WS_ESB_BusinessObjects.Stage OrderStage;
        public String UniversalServiceId;
        transient String[] LeadOrder_type_info = new String[]{'LeadOrder','http://ibus.czncorp.com/ESB/BusinessObjects','OrderInfo','0','1','false' };
        transient String[] MemberOrder_type_info = new String[]{'MemberOrder','http://ibus.czncorp.com/ESB/BusinessObjects','OrderInfo','0','1','false' };
        transient String[] OrderType_type_info = new String[]{'OrderType','http://ibus.czncorp.com/ESB/BusinessObjects','OrderType','0','1','false' };
        transient String[] MemberOrderType_type_info = new String[]{'MemberOrderType','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] MemberOrderServiceType_type_info = new String[]{'MemberOrderServiceType','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] GroupOrderDescription_type_info = new String[]{'GroupOrderDescription','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] GroupOrderDescriptionType_type_info = new String[]{'GroupOrderDescriptionType','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] GroupOrderSequenceNumber_type_info = new String[]{'GroupOrderSequenceNumber','http://www.w3.org/2001/XMLSchema','int','0','1','false'    };
        transient String[] OrderStage_type_info = new String[]{'OrderStage','http://ibus.czncorp.com/ESB/BusinessObjects','Stage','0','1','false'   };
        transient String[] UniversalServiceId_type_info = new String[]{'UniversalServiceId','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'   };
        transient String[] field_order_type_info = new String[]{'LeadOrder','MemberOrder','OrderType','MemberOrderType','MemberOrderServiceType','GroupOrderDescription','GroupOrderDescriptionType','GroupOrderSequenceNumber','OrderStage','UniversalServiceId'   };
    }
    public class GroupOrderInfo {
        public Boolean GroupOrderMemberFlag;
        public WS_ESB_BusinessObjects.RelatedOrder[] RelatedOrder;
        transient String[] GroupOrderMemberFlag_type_info = new String[]{'GroupOrderMemberFlag','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'    };
        transient String[] RelatedOrder_type_info = new String[]{'RelatedOrder','http://ibus.czncorp.com/ESB/BusinessObjects','RelatedOrder','0','-1','false'   };
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'   };
        transient String[] field_order_type_info = new String[]{'GroupOrderMemberFlag','RelatedOrder'   };
    }
    public class ValueNetworkRole {
        public WS_ESB_BusinessObjects.Individual Individual;
        public WS_ESB_BusinessObjects.Organization Organization;
        public WS_ESB_BusinessObjects.TelephoneNumber[] TelephoneNumber;
        public WS_ESB_BusinessObjects.CitizensPostalAddress[] CitizensPostalAddress;
        public WS_ESB_BusinessObjects.TimePeriod ValidFor;
        transient String[] Individual_type_info = new String[]{'Individual','http://ibus.czncorp.com/ESB/BusinessObjects','Individual','0','1','false'  };
        transient String[] Organization_type_info = new String[]{'Organization','http://ibus.czncorp.com/ESB/BusinessObjects','Organization','0','1','false'    };
        transient String[] TelephoneNumber_type_info = new String[]{'TelephoneNumber','http://ibus.czncorp.com/ESB/BusinessObjects','TelephoneNumber','0','-1','false'  };
        transient String[] CitizensPostalAddress_type_info = new String[]{'CitizensPostalAddress','http://ibus.czncorp.com/ESB/BusinessObjects','CitizensPostalAddress','0','-1','false'    };
        transient String[] ValidFor_type_info = new String[]{'ValidFor','http://ibus.czncorp.com/ESB/BusinessObjects','TimePeriod','0','1','false'  };
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'   };
        transient String[] field_order_type_info = new String[]{'Individual','Organization','TelephoneNumber','CitizensPostalAddress','ValidFor'    };
    }
    public class Individual {
        public String PartyType;
        public WS_ESB_BusinessObjects.TimePeriod ValidFor;
        public WS_ESB_BusinessObjects.IndividualName IndividualName;
        public String Gender;
        public String PlaceOfBirth;
        public String Nationality;
        public String MaritalStatus;
        public String Skills;
        public String Disabilities;
        public WS_ESB_BusinessObjects.DriversLicenseIdentification DriversLicenseIdentification;
        public WS_ESB_BusinessObjects.SocialSecurityNrIdentification SocialSecurityNrIdentification;
        public WS_ESB_BusinessObjects.TimePeriod AliveDuring;
        public Integer Age;
        transient String[] PartyType_type_info = new String[]{'PartyType','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] ValidFor_type_info = new String[]{'ValidFor','http://ibus.czncorp.com/ESB/BusinessObjects','TimePeriod','0','1','false'  };
        transient String[] IndividualName_type_info = new String[]{'IndividualName','http://ibus.czncorp.com/ESB/BusinessObjects','WS_ESB_BusinessObjects.IndividualName','0','1','false'   };
        transient String[] Gender_type_info = new String[]{'Gender','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] PlaceOfBirth_type_info = new String[]{'PlaceOfBirth','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] Nationality_type_info = new String[]{'Nationality','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] MaritalStatus_type_info = new String[]{'MaritalStatus','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] Skills_type_info = new String[]{'Skills','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] Disabilities_type_info = new String[]{'Disabilities','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] DriversLicenseIdentification_type_info = new String[]{'DriversLicenseIdentification','http://ibus.czncorp.com/ESB/BusinessObjects','DriversLicenseIdentification','0','1','false'    };
        transient String[] SocialSecurityNrIdentification_type_info = new String[]{'SocialSecurityNrIdentification','http://ibus.czncorp.com/ESB/BusinessObjects','SocialSecurityNrIdentification','0','1','false'  };
        transient String[] AliveDuring_type_info = new String[]{'AliveDuring','http://ibus.czncorp.com/ESB/BusinessObjects','TimePeriod','0','1','false'    };
        transient String[] Age_type_info = new String[]{'Age','http://www.w3.org/2001/XMLSchema','int','0','1','false'  };
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'   };
        transient String[] field_order_type_info = new String[]{'PartyType','ValidFor','IndividualName','Gender','PlaceOfBirth','Nationality','MaritalStatus','Skills','Disabilities','DriversLicenseIdentification','SocialSecurityNrIdentification','AliveDuring','Age'   };
    }
    public class Error {
        public String ErrorCode;
        public String ErrorSeverity;
        public String ErrorText;
        transient String[] ErrorCode_type_info = new String[]{'ErrorCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] ErrorSeverity_type_info = new String[]{'ErrorSeverity','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] ErrorText_type_info = new String[]{'ErrorText','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'   };
        transient String[] field_order_type_info = new String[]{'ErrorCode','ErrorSeverity','ErrorText' };
    }
    public class BusinessInteraction {
        public String Id;
        public Date InteractionDate;
        public String Description;
        public Date InteractionDateComplete;
        public String InteractionStatus;
        transient String[] Id_type_info = new String[]{'Id','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] InteractionDate_type_info = new String[]{'InteractionDate','http://www.w3.org/2001/XMLSchema','date','0','1','false' };
        transient String[] Description_type_info = new String[]{'Description','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] InteractionDateComplete_type_info = new String[]{'InteractionDateComplete','http://www.w3.org/2001/XMLSchema','date','0','1','false' };
        transient String[] InteractionStatus_type_info = new String[]{'InteractionStatus','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'   };
        transient String[] field_order_type_info = new String[]{'Id','InteractionDate','Description','InteractionDateComplete','InteractionStatus'  };
    }
    public class AmericanPropertyAddress {
        public String StateOrProvince;
        public String Country;
        public String County;
        public String StreetNrFirst;
        public String StreetNrFirstSuffix;
        public String StreetName;
        public String StreetType;
        public String StreetSuffix;
        public String StreetNrLast;
        public String StreetNrLastSuffix;
        public String Locality;
        public String Postcode;
        public String StreetNrFirstPrefix;
        public String StreetNrLastPrefix;
        public String StreetNamePrefix;
        public String StreetNameSuffix;
        transient String[] StateOrProvince_type_info = new String[]{'StateOrProvince','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] Country_type_info = new String[]{'Country','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] County_type_info = new String[]{'County','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] StreetNrFirst_type_info = new String[]{'StreetNrFirst','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] StreetNrFirstSuffix_type_info = new String[]{'StreetNrFirstSuffix','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] StreetName_type_info = new String[]{'StreetName','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] StreetType_type_info = new String[]{'StreetType','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] StreetSuffix_type_info = new String[]{'StreetSuffix','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] StreetNrLast_type_info = new String[]{'StreetNrLast','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] StreetNrLastSuffix_type_info = new String[]{'StreetNrLastSuffix','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] Locality_type_info = new String[]{'Locality','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] Postcode_type_info = new String[]{'Postcode','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] StreetNrFirstPrefix_type_info = new String[]{'StreetNrFirstPrefix','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] StreetNrLastPrefix_type_info = new String[]{'StreetNrLastPrefix','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] StreetNamePrefix_type_info = new String[]{'StreetNamePrefix','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] StreetNameSuffix_type_info = new String[]{'StreetNameSuffix','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'   };
        transient String[] field_order_type_info = new String[]{'StateOrProvince','Country','County','StreetNrFirst','StreetNrFirstSuffix','StreetName','StreetType','StreetSuffix','StreetNrLast','StreetNrLastSuffix','Locality','Postcode','StreetNrFirstPrefix','StreetNrLastPrefix','StreetNamePrefix','StreetNameSuffix'  };
    }
    public class FunctionOrProcessProvider {
        public WS_ESB_BusinessObjects.Individual Individual;
        public WS_ESB_BusinessObjects.Organization Organization;
        public WS_ESB_BusinessObjects.TelephoneNumber[] TelephoneNumber;
        public WS_ESB_BusinessObjects.CitizensPostalAddress[] CitizensPostalAddress;
        public WS_ESB_BusinessObjects.TimePeriod ValidFor;
        transient String[] Individual_type_info = new String[]{'Individual','http://ibus.czncorp.com/ESB/BusinessObjects','Individual','0','1','false'  };
        transient String[] Organization_type_info = new String[]{'Organization','http://ibus.czncorp.com/ESB/BusinessObjects','Organization','0','1','false'    };
        transient String[] TelephoneNumber_type_info = new String[]{'TelephoneNumber','http://ibus.czncorp.com/ESB/BusinessObjects','TelephoneNumber','0','-1','false'  };
        transient String[] CitizensPostalAddress_type_info = new String[]{'CitizensPostalAddress','http://ibus.czncorp.com/ESB/BusinessObjects','CitizensPostalAddress','0','-1','false'    };
        transient String[] ValidFor_type_info = new String[]{'ValidFor','http://ibus.czncorp.com/ESB/BusinessObjects','TimePeriod','0','1','false'  };
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'   };
        transient String[] field_order_type_info = new String[]{'Individual','Organization','TelephoneNumber','CitizensPostalAddress','ValidFor'    };
    }
    public class PartyRole {
        public WS_ESB_BusinessObjects.Individual Individual;
        public WS_ESB_BusinessObjects.Organization Organization;
        public WS_ESB_BusinessObjects.TelephoneNumber[] TelephoneNumber;
        public WS_ESB_BusinessObjects.CitizensPostalAddress[] CitizensPostalAddress;
        public WS_ESB_BusinessObjects.TimePeriod ValidFor;
        transient String[] Individual_type_info = new String[]{'Individual','http://ibus.czncorp.com/ESB/BusinessObjects','Individual','0','1','false'  };
        transient String[] Organization_type_info = new String[]{'Organization','http://ibus.czncorp.com/ESB/BusinessObjects','Organization','0','1','false'    };
        transient String[] TelephoneNumber_type_info = new String[]{'TelephoneNumber','http://ibus.czncorp.com/ESB/BusinessObjects','TelephoneNumber','0','-1','false'  };
        transient String[] CitizensPostalAddress_type_info = new String[]{'CitizensPostalAddress','http://ibus.czncorp.com/ESB/BusinessObjects','CitizensPostalAddress','0','-1','false'    };
        transient String[] ValidFor_type_info = new String[]{'ValidFor','http://ibus.czncorp.com/ESB/BusinessObjects','TimePeriod','0','1','false'  };
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'   };
        transient String[] field_order_type_info = new String[]{'Individual','Organization','TelephoneNumber','CitizensPostalAddress','ValidFor'    };
    }
    public class PartyRoleType {
        public WS_ESB_BusinessObjects.TimePeriod ValidFor;
        public String Name;
        public String Description;
        transient String[] ValidFor_type_info = new String[]{'ValidFor','http://ibus.czncorp.com/ESB/BusinessObjects','TimePeriod','0','1','false'  };
        transient String[] Name_type_info = new String[]{'Name','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] Description_type_info = new String[]{'Description','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'   };
        transient String[] field_order_type_info = new String[]{'ValidFor','Name','Description' };
    }
    public class IndividualName {
        public WS_ESB_BusinessObjects.TimePeriod ValidFor;
        public String FormattedName;
        public String LegalName;
        public String AristocraticTitle;
        public String FormOfAddress;
        public String Generation;
        public String GivenNames;
        public String PreferredGivenName;
        public String MiddleNames;
        public String FamilyNamePrefix;
        public String FamilyNames;
        public String FamilyGeneration;
        public String Qualifications;
        transient String[] ValidFor_type_info = new String[]{'ValidFor','http://ibus.czncorp.com/ESB/BusinessObjects','TimePeriod','0','1','false'  };
        transient String[] FormattedName_type_info = new String[]{'FormattedName','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] LegalName_type_info = new String[]{'LegalName','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] AristocraticTitle_type_info = new String[]{'AristocraticTitle','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] FormOfAddress_type_info = new String[]{'FormOfAddress','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] Generation_type_info = new String[]{'Generation','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] GivenNames_type_info = new String[]{'GivenNames','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] PreferredGivenName_type_info = new String[]{'PreferredGivenName','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] MiddleNames_type_info = new String[]{'MiddleNames','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] FamilyNamePrefix_type_info = new String[]{'FamilyNamePrefix','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] FamilyNames_type_info = new String[]{'FamilyNames','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] FamilyGeneration_type_info = new String[]{'FamilyGeneration','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] Qualifications_type_info = new String[]{'Qualifications','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'   };
        transient String[] field_order_type_info = new String[]{'ValidFor','FormattedName','LegalName','AristocraticTitle','FormOfAddress','Generation','GivenNames','PreferredGivenName','MiddleNames','FamilyNamePrefix','FamilyNames','FamilyGeneration','Qualifications'    };
    }
    public class CitizensPostalAddress {
        public String StateOrProvince;
        public String Country;
        public String County;
        public AddressText[] AddressText;
        public String Locality;
        public String Postcode;
        transient String[] StateOrProvince_type_info = new String[]{'StateOrProvince','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] Country_type_info = new String[]{'Country','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] County_type_info = new String[]{'County','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] AddressText_type_info = new String[]{'AddressText','http://ibus.czncorp.com/ESB/BusinessObjects','AddressText','0','-1','false'  };
        transient String[] Locality_type_info = new String[]{'Locality','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] Postcode_type_info = new String[]{'Postcode','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'   };
        transient String[] field_order_type_info = new String[]{'StateOrProvince','Country','County','AddressText','Locality','Postcode' };
        
        public CitizensPostalAddress(){
            AddressText = new List<WS_ESB_BusinessObjects.AddressText>();
        }
    }
    public class AddressType {
        public WS_ESB_BusinessObjects.CitizensServiceAddress ServiceAddress {get;set;}
        public WS_ESB_BusinessObjects.CitizensPostalAddress PostalAddress {get;set;}
        public Boolean CurrentAddressFlag;
        transient String[] ServiceAddress_type_info = new String[]{'ServiceAddress','http://ibus.czncorp.com/ESB/BusinessObjects','CitizensServiceAddress','0','1','false'  };
        transient String[] PostalAddress_type_info = new String[]{'PostalAddress','http://ibus.czncorp.com/ESB/BusinessObjects','CitizensPostalAddress','0','1','false' };
        transient String[] CurrentAddressFlag_type_info = new String[]{'CurrentAddressFlag','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'    };
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'   };
        transient String[] field_order_type_info = new String[]{'ServiceAddress','PostalAddress','CurrentAddressFlag'   };
        
        public AddressType(){
            //ServiceAddress = new WS_ESB_BusinessObjects.CitizensServiceAddress();
            PostalAddress = new WS_ESB_BusinessObjects.CitizensPostalAddress();
        }
    }
    public class Line {
        public String TransportMedium {get;set;}
        public String DropType {get;set;}
        public Boolean DroppedFlag {get;set;}
        transient String[] TransportMedium_type_info = new String[]{'TransportMedium','http://www.w3.org/2001/XMLSchema','string','1','1','false'   };
        transient String[] DropType_type_info = new String[]{'DropType','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] DroppedFlag_type_info = new String[]{'DroppedFlag','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'  };
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'   };
        transient String[] field_order_type_info = new String[]{'TransportMedium','DropType','DroppedFlag'  };
    }
    public class UpsellDisqualificationReason {
        public String Id;
        public String Description;
        transient String[] Id_type_info = new String[]{'Id','http://www.w3.org/2001/XMLSchema','string','0','1','false' };
        transient String[] Description_type_info = new String[]{'Description','http://www.w3.org/2001/XMLSchema','string','0','1','false'   };
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'   };
        transient String[] field_order_type_info = new String[]{'Id','Description'  };
    }
    
    public class AccountsReceivableDetail {
    public String TransactionDate {get;set;}
    public String PostDateTime {get;set;}
    public String Amount {get;set;}
    public String RemainingAmount {get;set;}
    public WS_ESB_BusinessObjects.Tax Tax {get;set;}
    public WS_ESB_BusinessObjects.GLAccount GLAccount {get;set;}
    public WS_ESB_BusinessObjects.Payment[] Payment {get;set;}
    public WS_ESB_BusinessObjects.Adjustment[] Adjustment {get;set;}
    transient String[] TransactionDate_type_info = new String[]{'TransactionDate','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
    transient String[] PostDateTime_type_info = new String[]{'PostDateTime','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
    transient String[] Amount_type_info = new String[]{'Amount','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
    transient String[] RemainingAmount_type_info = new String[]{'RemainingAmount','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
    transient String[] Tax_type_info = new String[]{'Tax','http://ibus.czncorp.com/ESB/BusinessObjects','Tax','0','1','false'};
    transient String[] GLAccount_type_info = new String[]{'GLAccount','http://ibus.czncorp.com/ESB/BusinessObjects','GLAccount','0','1','false'};
    transient String[] Payment_type_info = new String[]{'Payment','http://ibus.czncorp.com/ESB/BusinessObjects','Payment','0','-1','false'};
    transient String[] Adjustment_type_info = new String[]{'Adjustment','http://ibus.czncorp.com/ESB/BusinessObjects','Adjustment','0','-1','false'};
    transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
    transient String[] field_order_type_info = new String[]{'TransactionDate','PostDateTime','Amount','RemainingAmount','Tax','GLAccount','Payment','Adjustment'};
    }
    public class CreditCardPaymentSource {
    public String PaymentSourceCode;
    public String PaymentSourceDescription;
    public String AccountId;
    public String AccountHolderName;
    public WS_ESB_BusinessObjects.CitizensPostalAddress AccountHolderAddress;
    public WS_ESB_BusinessObjects.Email NotificationEmailAddress;
    public String CreditVerificationValue;
    public String ExpirationMonth;
    public String ExpirationYear;
    public String CreditCardType;
    transient String[] PaymentSourceCode_type_info = new String[]{'PaymentSourceCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
    transient String[] PaymentSourceDescription_type_info = new String[]{'PaymentSourceDescription','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
    transient String[] AccountId_type_info = new String[]{'AccountId','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
    transient String[] AccountHolderName_type_info = new String[]{'AccountHolderName','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
    transient String[] AccountHolderAddress_type_info = new String[]{'AccountHolderAddress','http://ibus.czncorp.com/ESB/BusinessObjects','CitizensPostalAddress','0','1','false'};
    transient String[] NotificationEmailAddress_type_info = new String[]{'NotificationEmailAddress','http://ibus.czncorp.com/ESB/BusinessObjects','Email','0','1','false'};
    transient String[] CreditVerificationValue_type_info = new String[]{'CreditVerificationValue','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
    transient String[] ExpirationMonth_type_info = new String[]{'ExpirationMonth','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
    transient String[] ExpirationYear_type_info = new String[]{'ExpirationYear','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
    transient String[] CreditCardType_type_info = new String[]{'CreditCardType','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
    transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
    transient String[] field_order_type_info = new String[]{'PaymentSourceCode','PaymentSourceDescription','AccountId','AccountHolderName','AccountHolderAddress','NotificationEmailAddress','CreditVerificationValue','ExpirationMonth','ExpirationYear','CreditCardType'};
    }
    public class Payment {
    public Date TransactionDate {get;set;}
    public WS_ESB_BusinessObjects.Quantity TransactionAmount {get;set;}
    public String ReferenceNumber {get;set;}
    public String BatchId {get;set;}
    public String BatchSequenceNumber {get;set;}
    public DateTime PostDateTime {get;set;}
    public String PostedBy {get;set;}
    public Boolean NeverOnBillFlag {get;set;}
    public String PaymentReason {get;set;}
    public String PaymentMethod {get;set;}
    public WS_ESB_BusinessObjects.BankPaymentSource BankPaymentSource {get;set;}
    public WS_ESB_BusinessObjects.CreditCardPaymentSource CreditCardPaymentSource {get;set;}
    public WS_ESB_BusinessObjects.DebitCardPaymentSource DebitCardPaymentSource {get;set;}
    public WS_ESB_BusinessObjects.AccountId BillingAccountId {get;set;}
    public String BillingAccountName {get;set;}
    public WS_ESB_BusinessObjects.CitizensPostalAddress BillingAddress {get;set;}
    transient String[] TransactionDate_type_info = new String[]{'TransactionDate','http://www.w3.org/2001/XMLSchema','date','0','1','false'};
    transient String[] TransactionAmount_type_info = new String[]{'TransactionAmount','http://ibus.czncorp.com/ESB/BusinessObjects','Quantity','0','1','false'};
    transient String[] ReferenceNumber_type_info = new String[]{'ReferenceNumber','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
    transient String[] BatchId_type_info = new String[]{'BatchId','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
    transient String[] BatchSequenceNumber_type_info = new String[]{'BatchSequenceNumber','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
    transient String[] PostDateTime_type_info = new String[]{'PostDateTime','http://www.w3.org/2001/XMLSchema','dateTime','0','1','false'};
    transient String[] PostedBy_type_info = new String[]{'PostedBy','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
    transient String[] NeverOnBillFlag_type_info = new String[]{'NeverOnBillFlag','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
    transient String[] PaymentReason_type_info = new String[]{'PaymentReason','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
    transient String[] PaymentMethod_type_info = new String[]{'PaymentMethod','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
    transient String[] BankPaymentSource_type_info = new String[]{'BankPaymentSource','http://ibus.czncorp.com/ESB/BusinessObjects','BankPaymentSource','0','1','false'};
    transient String[] CreditCardPaymentSource_type_info = new String[]{'CreditCardPaymentSource','http://ibus.czncorp.com/ESB/BusinessObjects','CreditCardPaymentSource','0','1','false'};
    transient String[] DebitCardPaymentSource_type_info = new String[]{'DebitCardPaymentSource','http://ibus.czncorp.com/ESB/BusinessObjects','DebitCardPaymentSource','0','1','false'};
    transient String[] BillingAccountId_type_info = new String[]{'BillingAccountId','http://ibus.czncorp.com/ESB/BusinessObjects','AccountId','0','1','false'};
    transient String[] BillingAccountName_type_info = new String[]{'BillingAccountName','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
    transient String[] BillingAddress_type_info = new String[]{'BillingAddress','http://ibus.czncorp.com/ESB/BusinessObjects','CitizensPostalAddress','0','1','false'};
    transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
    transient String[] field_order_type_info = new String[]{'TransactionDate','TransactionAmount','ReferenceNumber','BatchId','BatchSequenceNumber','PostDateTime','PostedBy','NeverOnBillFlag','PaymentReason','PaymentMethod','BankPaymentSource','CreditCardPaymentSource','DebitCardPaymentSource','BillingAccountId','BillingAccountName','BillingAddress'};
    }
    public class DebitCardPaymentSource {
    public String PaymentSourceCode;
    public String PaymentSourceDescription;
    public String AccountId;
    public String AccountHolderName;
    public WS_ESB_BusinessObjects.CitizensPostalAddress AccountHolderAddress;
    public WS_ESB_BusinessObjects.Email NotificationEmailAddress;
    transient String[] PaymentSourceCode_type_info = new String[]{'PaymentSourceCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
    transient String[] PaymentSourceDescription_type_info = new String[]{'PaymentSourceDescription','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
    transient String[] AccountId_type_info = new String[]{'AccountId','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
    transient String[] AccountHolderName_type_info = new String[]{'AccountHolderName','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
    transient String[] AccountHolderAddress_type_info = new String[]{'AccountHolderAddress','http://ibus.czncorp.com/ESB/BusinessObjects','CitizensPostalAddress','0','1','false'};
    transient String[] NotificationEmailAddress_type_info = new String[]{'NotificationEmailAddress','http://ibus.czncorp.com/ESB/BusinessObjects','Email','0','1','false'};
    transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
    transient String[] field_order_type_info = new String[]{'PaymentSourceCode','PaymentSourceDescription','AccountId','AccountHolderName','AccountHolderAddress','NotificationEmailAddress'};
    }
    public class CurrentBillAmounts {
    public WS_ESB_BusinessObjects.Quantity NonProRatedChargesAmount {get;set;}
    public WS_ESB_BusinessObjects.Quantity ProRatedChargesAndCurrentAdjustmentsAmount {get;set;}
    public WS_ESB_BusinessObjects.Quantity TollAmount {get;set;}
    public WS_ESB_BusinessObjects.Quantity TaxAmount {get;set;}
    transient String[] NonProRatedChargesAmount_type_info = new String[]{'NonProRatedChargesAmount','http://ibus.czncorp.com/ESB/BusinessObjects','Quantity','0','1','false'};
    transient String[] ProRatedChargesAndCurrentAdjustmentsAmount_type_info = new String[]{'ProRatedChargesAndCurrentAdjustmentsAmount','http://ibus.czncorp.com/ESB/BusinessObjects','Quantity','0','1','false'};
    transient String[] TollAmount_type_info = new String[]{'TollAmount','http://ibus.czncorp.com/ESB/BusinessObjects','Quantity','0','1','false'};
    transient String[] TaxAmount_type_info = new String[]{'TaxAmount','http://ibus.czncorp.com/ESB/BusinessObjects','Quantity','0','1','false'};
    transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
    transient String[] field_order_type_info = new String[]{'NonProRatedChargesAmount','ProRatedChargesAndCurrentAdjustmentsAmount','TollAmount','TaxAmount'};
    }
    public class PendingAccountsReceivable {
    public WS_ESB_BusinessObjects.Quantity UnPostedPaymentAmount {get;set;}
    public WS_ESB_BusinessObjects.Quantity PostedCurrentAdjustment {get;set;}
    public WS_ESB_BusinessObjects.Quantity UnPostedPriorAdjustment {get;set;}
    public WS_ESB_BusinessObjects.Quantity UnPostedCurrentAdjustment {get;set;}
    transient String[] UnPostedPaymentAmount_type_info = new String[]{'UnPostedPaymentAmount','http://ibus.czncorp.com/ESB/BusinessObjects','Quantity','0','1','false'};
    transient String[] PostedCurrentAdjustment_type_info = new String[]{'PostedCurrentAdjustment','http://ibus.czncorp.com/ESB/BusinessObjects','Quantity','0','1','false'};
    transient String[] UnPostedPriorAdjustment_type_info = new String[]{'UnPostedPriorAdjustment','http://ibus.czncorp.com/ESB/BusinessObjects','Quantity','0','1','false'};
    transient String[] UnPostedCurrentAdjustment_type_info = new String[]{'UnPostedCurrentAdjustment','http://ibus.czncorp.com/ESB/BusinessObjects','Quantity','0','1','false'};
    transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
    transient String[] field_order_type_info = new String[]{'UnPostedPaymentAmount','PostedCurrentAdjustment','UnPostedPriorAdjustment','UnPostedCurrentAdjustment'};
    }
    public class Adjustment {
    public Date TransactionDate {get;set;}
    public WS_ESB_BusinessObjects.Quantity TransactionAmount {get;set;}
    public String ReferenceNumber {get;set;}
    public String BatchId {get;set;}
    public String BatchSequenceNumber {get;set;}
    public DateTime PostDateTime {get;set;}
    public String PostedBy {get;set;}
    public Boolean NeverOnBillFlag {get;set;}
    public String AdjustmentType {get;set;}
    public WS_ESB_BusinessObjects.CodeDescriptionPair Reason {get;set;}
    public String Description {get;set;}
    public String BankName {get;set;}
    public WS_ESB_BusinessObjects.GLAccount GLAccount {get;set;}
    public String ChargeCode {get;set;}
    public String ChargeCodeDescription {get;set;}
    public WS_ESB_BusinessObjects.Quantity TaxAmount {get;set;}
    public WS_ESB_BusinessObjects.ApplicableTax[] ApplicableTax {get;set;}
    public WS_ESB_BusinessObjects.AccountId BillingAccountId {get;set;}
    public String ParentCaseId {get;set;}
    public String ChildCaseId {get;set;}
    public String PostingStatus {get;set;}
    public String ChangeBalanceUponPosting {get;set;}
    transient String[] TransactionDate_type_info = new String[]{'TransactionDate','http://www.w3.org/2001/XMLSchema','date','0','1','false'};
    transient String[] TransactionAmount_type_info = new String[]{'TransactionAmount','http://ibus.czncorp.com/ESB/BusinessObjects','Quantity','0','1','false'};
    transient String[] ReferenceNumber_type_info = new String[]{'ReferenceNumber','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
    transient String[] BatchId_type_info = new String[]{'BatchId','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
    transient String[] BatchSequenceNumber_type_info = new String[]{'BatchSequenceNumber','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
    transient String[] PostDateTime_type_info = new String[]{'PostDateTime','http://www.w3.org/2001/XMLSchema','dateTime','0','1','false'};
    transient String[] PostedBy_type_info = new String[]{'PostedBy','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
    transient String[] NeverOnBillFlag_type_info = new String[]{'NeverOnBillFlag','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
    transient String[] AdjustmentType_type_info = new String[]{'AdjustmentType','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
    transient String[] Reason_type_info = new String[]{'Reason','http://ibus.czncorp.com/ESB/BusinessObjects','CodeDescriptionPair','0','1','false'};
    transient String[] Description_type_info = new String[]{'Description','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
    transient String[] BankName_type_info = new String[]{'BankName','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
    transient String[] GLAccount_type_info = new String[]{'GLAccount','http://ibus.czncorp.com/ESB/BusinessObjects','GLAccount','0','1','false'};
    transient String[] ChargeCode_type_info = new String[]{'ChargeCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
    transient String[] ChargeCodeDescription_type_info = new String[]{'ChargeCodeDescription','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
    transient String[] TaxAmount_type_info = new String[]{'TaxAmount','http://ibus.czncorp.com/ESB/BusinessObjects','Quantity','0','1','false'};
    transient String[] ApplicableTax_type_info = new String[]{'ApplicableTax','http://ibus.czncorp.com/ESB/BusinessObjects','ApplicableTax','0','-1','false'};
    transient String[] BillingAccountId_type_info = new String[]{'BillingAccountId','http://ibus.czncorp.com/ESB/BusinessObjects','AccountId','0','1','false'};
    transient String[] ParentCaseId_type_info = new String[]{'ParentCaseId','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
    transient String[] ChildCaseId_type_info = new String[]{'ChildCaseId','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
    transient String[] PostingStatus_type_info = new String[]{'PostingStatus','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
    transient String[] ChangeBalanceUponPosting_type_info = new String[]{'ChangeBalanceUponPosting','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
    transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
    transient String[] field_order_type_info = new String[]{'TransactionDate','TransactionAmount','ReferenceNumber','BatchId','BatchSequenceNumber','PostDateTime','PostedBy','NeverOnBillFlag','AdjustmentType','Reason','Description','BankName','GLAccount','ChargeCode','ChargeCodeDescription','TaxAmount','ApplicableTax','BillingAccountId','ParentCaseId','ChildCaseId','PostingStatus','ChangeBalanceUponPosting'};
    }
    public class AccountsReceivable {
    public String BillDate {get;set;}
    public String BillCycle {get;set;}
    public WS_ESB_BusinessObjects.AccountId BillingAccountId {get;set;}
    public WS_ESB_BusinessObjects.Quantity PriorBillAmount {get;set;}
    public WS_ESB_BusinessObjects.Quantity PriorBillAdjustmentAmount {get;set;}
    public WS_ESB_BusinessObjects.Quantity TotalPaymentAmount {get;set;}
    public String LastPaymentDate {get;set;}
    public WS_ESB_BusinessObjects.CurrentBillAmounts CurrentBillAmounts {get;set;}
    public WS_ESB_BusinessObjects.Quantity OriginalAmount {get;set;}
    public WS_ESB_BusinessObjects.AccountsReceivableDetail[] AccountsReceivableDetail {get;set;}
    transient String[] BillDate_type_info = new String[]{'BillDate','http://www.w3.org/2001/XMLSchema','Date','0','1','false'};
    transient String[] BillCycle_type_info = new String[]{'BillCycle','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
    transient String[] BillingAccountId_type_info = new String[]{'BillingAccountId','http://ibus.czncorp.com/ESB/BusinessObjects','AccountId','0','1','false'};
    transient String[] PriorBillAmount_type_info = new String[]{'PriorBillAmount','http://ibus.czncorp.com/ESB/BusinessObjects','Quantity','0','1','false'};
    transient String[] PriorBillAdjustmentAmount_type_info = new String[]{'PriorBillAdjustmentAmount','http://ibus.czncorp.com/ESB/BusinessObjects','Quantity','0','1','false'};
    transient String[] TotalPaymentAmount_type_info = new String[]{'TotalPaymentAmount','http://ibus.czncorp.com/ESB/BusinessObjects','Quantity','0','1','false'};
    transient String[] LastPaymentDate_type_info = new String[]{'LastPaymentDate','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
    transient String[] CurrentBillAmounts_type_info = new String[]{'CurrentBillAmounts','http://ibus.czncorp.com/ESB/BusinessObjects','CurrentBillAmounts','0','1','false'};
    transient String[] OriginalAmount_type_info = new String[]{'OriginalAmount','http://ibus.czncorp.com/ESB/BusinessObjects','Quantity','0','1','false'};
    transient String[] AccountsReceivableDetail_type_info = new String[]{'AccountsReceivableDetail','http://ibus.czncorp.com/ESB/BusinessObjects','AccountsReceivableDetail','0','-1','false'};
    transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
    transient String[] field_order_type_info = new String[]{'BillDate','BillCycle','BillingAccountId','PriorBillAmount','PriorBillAdjustmentAmount','TotalPaymentAmount','LastPaymentDate','CurrentBillAmounts','OriginalAmount','AccountsReceivableDetail'};
    }
    public class BankPaymentSource {
    public String PaymentSourceCode;
    public String PaymentSourceDescription;
    public String AccountId;
    public String AccountHolderName;
    public WS_ESB_BusinessObjects.CitizensPostalAddress AccountHolderAddress;
    public WS_ESB_BusinessObjects.Email NotificationEmailAddress;
    public WS_ESB_BusinessObjects.Bank Bank;
    public String BankAccountType;
    transient String[] PaymentSourceCode_type_info = new String[]{'PaymentSourceCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
    transient String[] PaymentSourceDescription_type_info = new String[]{'PaymentSourceDescription','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
    transient String[] AccountId_type_info = new String[]{'AccountId','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
    transient String[] AccountHolderName_type_info = new String[]{'AccountHolderName','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
    transient String[] AccountHolderAddress_type_info = new String[]{'AccountHolderAddress','http://ibus.czncorp.com/ESB/BusinessObjects','CitizensPostalAddress','0','1','false'};
    transient String[] NotificationEmailAddress_type_info = new String[]{'NotificationEmailAddress','http://ibus.czncorp.com/ESB/BusinessObjects','Email','0','1','false'};
    transient String[] Bank_type_info = new String[]{'Bank','http://ibus.czncorp.com/ESB/BusinessObjects','Bank','0','1','false'};
    transient String[] BankAccountType_type_info = new String[]{'BankAccountType','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
    transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
    transient String[] field_order_type_info = new String[]{'PaymentSourceCode','PaymentSourceDescription','AccountId','AccountHolderName','AccountHolderAddress','NotificationEmailAddress','Bank','BankAccountType'};
    }
    public class Bank {
    public String Name;
    public String DepositId;
    public String RoutingNumber;
    transient String[] Name_type_info = new String[]{'Name','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
    transient String[] DepositId_type_info = new String[]{'DepositId','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
    transient String[] RoutingNumber_type_info = new String[]{'RoutingNumber','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
    transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
    transient String[] field_order_type_info = new String[]{'Name','DepositId','RoutingNumber'};
    }
    public class GLAccountingEntity {
    public String GLAccountingEntityId;
    public String Description;
    transient String[] GLAccountingEntityId_type_info = new String[]{'GLAccountingEntityId','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
    transient String[] Description_type_info = new String[]{'Description','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
    transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
    transient String[] field_order_type_info = new String[]{'GLAccountingEntityId','Description'};
    }
    public class Tax {
    public String TaxCode;
    public String TaxDescription;
    public String TaxCategory;
    public String TaxPercentage;
    public String TaxingSequence;
    transient String[] TaxCode_type_info = new String[]{'TaxCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
    transient String[] TaxDescription_type_info = new String[]{'TaxDescription','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
    transient String[] TaxCategory_type_info = new String[]{'TaxCategory','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
    transient String[] TaxPercentage_type_info = new String[]{'TaxPercentage','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
    transient String[] TaxingSequence_type_info = new String[]{'TaxingSequence','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
    transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
    transient String[] field_order_type_info = new String[]{'TaxCode','TaxDescription','TaxCategory','TaxPercentage','TaxingSequence'};
    }
    public class GLAccount {
    public String GLAccountId;
    public String GLAccountName;
    public WS_ESB_BusinessObjects.GLAccountingEntity GLAccountingEntity;
    public WS_ESB_BusinessObjects.GLAccountingCategory GLAccountingCategory;
    public WS_ESB_BusinessObjects.GLAccountingEntity GLAccountingPresentationEntity;
    transient String[] GLAccountId_type_info = new String[]{'GLAccountId','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
    transient String[] GLAccountName_type_info = new String[]{'GLAccountName','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
    transient String[] GLAccountingEntity_type_info = new String[]{'GLAccountingEntity','http://ibus.czncorp.com/ESB/BusinessObjects','GLAccountingEntity','0','1','false'};
    transient String[] GLAccountingCategory_type_info = new String[]{'GLAccountingCategory','http://ibus.czncorp.com/ESB/BusinessObjects','GLAccountingCategory','0','1','false'};
    transient String[] GLAccountingPresentationEntity_type_info = new String[]{'GLAccountingPresentationEntity','http://ibus.czncorp.com/ESB/BusinessObjects','GLAccountingEntity','0','1','false'};
    transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
    transient String[] field_order_type_info = new String[]{'GLAccountId','GLAccountName','GLAccountingEntity','GLAccountingCategory','GLAccountingPresentationEntity'};
    }
    public class Notes {
    public String NotesText;
    public Integer SequenceNumber;
    transient String[] NotesText_type_info = new String[]{'NotesText','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
    transient String[] SequenceNumber_type_info = new String[]{'SequenceNumber','http://www.w3.org/2001/XMLSchema','int','0','1','false'};
    transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
    transient String[] field_order_type_info = new String[]{'NotesText','SequenceNumber'};
    }
    public class GLAccountingCategory {
    public String GLAccountingCategoryId;
    public String Description;
    transient String[] GLAccountingCategoryId_type_info = new String[]{'GLAccountingCategoryId','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
    transient String[] Description_type_info = new String[]{'Description','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
    transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
    transient String[] field_order_type_info = new String[]{'GLAccountingCategoryId','Description'};
    }
    public class PaymentArrangment {
    public String Id;
    public Date InteractionDate;
    public String Description;
    public Date InteractionDateComplete;
    public String InteractionStatus;
    public String agreementDocumentNumber;
    public String agreementStatementOfIntent;
    transient String[] Id_type_info = new String[]{'Id','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
    transient String[] InteractionDate_type_info = new String[]{'InteractionDate','http://www.w3.org/2001/XMLSchema','date','0','1','false'};
    transient String[] Description_type_info = new String[]{'Description','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
    transient String[] InteractionDateComplete_type_info = new String[]{'InteractionDateComplete','http://www.w3.org/2001/XMLSchema','date','0','1','false'};
    transient String[] InteractionStatus_type_info = new String[]{'InteractionStatus','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
    transient String[] agreementDocumentNumber_type_info = new String[]{'agreementDocumentNumber','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
    transient String[] agreementStatementOfIntent_type_info = new String[]{'agreementStatementOfIntent','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
    transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
    transient String[] field_order_type_info = new String[]{'Id','InteractionDate','Description','InteractionDateComplete','InteractionStatus','agreementDocumentNumber','agreementStatementOfIntent'};
    }
    public class AccountId {
    public WS_ESB_BusinessObjects.PhoneNumberAsId PhoneNumberAsId {get;set;}
    public String UniversalServiceId {get;set;}
    public String AccountNumber {get;set;}
    public WS_ESB_BusinessObjects.DataSourceEnvironment DataSourceEnvironment {get;set;}
    transient String[] PhoneNumberAsId_type_info = new String[]{'PhoneNumberAsId','http://ibus.czncorp.com/ESB/BusinessObjects','PhoneNumberAsId','0','1','false'};
    transient String[] UniversalServiceId_type_info = new String[]{'UniversalServiceId','http://ibus.czncorp.com/ESB/BusinessObjects','UniversalServiceId','0','1','false'};
    transient String[] AccountNumber_type_info = new String[]{'AccountNumber','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
    transient String[] DataSourceEnvironment_type_info = new String[]{'DataSourceEnvironment','http://ibus.czncorp.com/ESB/BusinessObjects','DataSourceEnvironment','0','1','false'};
    transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
    transient String[] field_order_type_info = new String[]{'PhoneNumberAsId','UniversalServiceId','AccountNumber','DataSourceEnvironment'};
    public AccountId(){
        PhoneNumberAsId = new WS_ESB_BusinessObjects.PhoneNumberAsId();
        DataSourceEnvironment = new WS_ESB_BusinessObjects.DataSourceEnvironment();
    }
    }
    //--------------------------------------added------------------------------------------------------------------------------------------------------------------------
public class HuntGroups {
    public WS_ESB_BusinessObjects.HuntGroup[] HuntGroup;
    transient public String[] HuntGroup_type_info = new String[]{'HuntGroup', 'http://ibus.czncorp.com/ESB/BusinessObjects', 'HuntGroup', '0', '-1','false'};
    transient public String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
    transient public string[] field_order_type_info = new String[]{'HuntGroup'};
}   

public class HuntGroup {
    public integer Id;
    public String Type;
    public integer Count;
    public WS_ESB_BusinessObjects.TelephoneNumber PilotPhoneNumber;
    public WS_ESB_BusinessObjects.HuntGroupMembers HuntGroupMembers;
    transient public String[] Id_type_info = new String[]{'Id', 'http://www.w3.org/2001/XMLSchema', 'int', '0', '1', 'false'};
    transient public String[] Type_type_info = new String[]{'Type','http://www.w3.org/2001/XMLSchema', 'String', '1', '1', 'false'};
    transient public String[] Count_type_info = new String[]{'Count', 'http://www.w3.org/2001/XMLSchema', 'int', '1', '1', 'false'};
    transient public String[] PilotPhoneNumber_type_info = new String[]{'PilotPhoneNumber', 'http://ibus.czncorp.com/ESB/BusinessObjects', 'TelephoneNumber', '0', '1', 'false'};
    transient public String[] HuntGroupMembers_type_info = new String[]{'HuntGroupMembers', 'http://ibus.czncorp.com/ESB/BusinessObjects', 'HuntGroupMembers', '0', '1', 'false'};
    transient public String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects', 'false', 'false'};
    transient public String[] field_order_type_info = new String[]{'Id', 'Type', 'Count', 'PilotPhoneNumber', 'HuntGroupMembers'};
}

public class HuntGroupMembers {
    public WS_ESB_BusinessObjects.HuntGroupMember[] HuntGroupMember;
    transient public String[] HuntGroupMember_type_info = new String[]{'HuntGroupMember', 'http://ibus.czncorp.com/ESB/BusinessObjects', 'HuntGroupMember', '0', '-1', 'false'};
    transient public String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false', 'false'};
    transient public String[] field_order_type_info = new String[]{'HuntGroupMember'};
}
public class HuntGroupMember {
    public WS_ESB_BusinessObjects.TelephoneNumber PhoneNumber;
    public String SequenceNumber;
    transient public String[] PhoneNumber_type_info = new String[]{'PhoneNumber', 'http://ibus.czncorp.com/ESB/BusinessObjects', 'TelephoneNumber', '0', '1', 'false'};
    transient public String[] SequenceNumber_type_info = new String[]{'SequenceNumber', 'http://www.w3.org/2001/XMLSchema', 'String', '0', '1', 'false'};
    transient public String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects', 'false', 'false'};
    transient public String[] field_order_type_info = new String[]{'PhoneNumber', 'SequenceNumber'};
}
//--------------------------------------added------------------------------------------------------------------------------------------------------------------------
//------------------added Sunil Shrestha 11/20/2015----------------------------------------------------------------------------------------------------------------------------
    
    public class Employee {
        public WS_ESB_BusinessObjects.Individual  Individual;
        public WS_ESB_BusinessObjects.Organization  Organization;       
        public WS_ESB_BusinessObjects.TelephoneNumber[]  TelephoneNumber;       
        public WS_ESB_BusinessObjects.CitizensPostalAddress[]  CitizensPostalAddress;       
        public WS_ESB_BusinessObjects.TimePeriod ValidFor;
        public String  EmploymentStatus;
        public String  EmployeeID;
        public String  SSOLoginId;
        public WS_ESB_BusinessObjects.Email Email;
        transient String[] Individual_type_info = new String[]{'Individual','http://ibus.czncorp.com/ESB/BusinessObjects','Individual','0','1','true'};
        transient String[] Organization_type_info = new String[]{'Organization','http://ibus.czncorp.com/ESB/BusinessObjects','Organization','0','1','true'};
        transient String[] TelephoneNumber_type_info = new String[]{'TelephoneNumber','http://ibus.czncorp.com/ESB/BusinessObjects','TelephoneNumber','0','-1','true'};
        transient String[] CitizensPostalAddress_type_info = new String[]{'CitizensPostalAddress','http://ibus.czncorp.com/ESB/BusinessObjects','CitizensPostalAddress','0','-1','true'};
        transient String[] ValidFor_type_info = new String[]{'ValidFor','http://ibus.czncorp.com/ESB/BusinessObjects','TimePeriod','0','1','true'};
                
        transient String[] EmploymentStatus_type_info = new String[]{'EmploymentStatus','http://www.w3.org/2001/XMLSchema','string','0','1','true'};
        transient String[] EmployeeID_type_info = new String[]{'EmployeeID','http://www.w3.org/2001/XMLSchema','string','0','1','true'};
        transient String[] SSOLoginId_type_info = new String[]{'SSOLoginId','http://www.w3.org/2001/XMLSchema','string','0','1','true'};
        transient String[] Email_type_info = new String[]{'Email','http://ibus.czncorp.com/ESB/BusinessObjects','Email','0','1','true'};
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
        transient String[] field_order_type_info = new String[]{'Individual', 'Organization', 'TelephoneNumber', 'CitizensPostalAddress', 'ValidFor', 'EmploymentStatus','EmployeeID','SSOLoginId','Email'};
        
        public Employee() {
            TelephoneNumber = new WS_ESB_BusinessObjects.TelephoneNumber[]{};
            TelephoneNumber.add(new WS_ESB_BusinessObjects.TelephoneNumber());          
        }
    }
    
    public class TelephoneNumber {
        public String Number_x {get; set;}
        public WS_ESB_BusinessObjects.NorthAmericanNumber NorthAmericanNumber;
        public String Extension;
        
        transient String[] Number_x_type_info = new String[]{'Number','http://www.w3.org/2001/XMLSchema','string','0','1','true'};
        transient String[] NorthAmericanNumber_type_info = new String[]{'NorthAmericanNumber','http://www.w3.org/2001/XMLSchema','NorthAmericanNumber','0','1','true'};
        transient String[] Extension_type_info = new String[]{'Extension','http://www.w3.org/2001/XMLSchema','string','0','1','true'};
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
        transient String[] field_order_type_info = new String[]{'Number_x', 'NorthAmericanNumber', 'Extension'};
         
        public TelephoneNumber(){
            Extension = ''; 
        }        
    }
    
    public class NorthAmericanNumber {
        public String NPA;
        public String NXX;
        public String Station;
        
        transient String[] NPA_type_info = new String[]{'NPA','http://www.w3.org/2001/XMLSchema','string','0','1','true'};
        transient String[] NXX_type_info = new String[]{'NXX','http://www.w3.org/2001/XMLSchema','string','0','1','true'};
        transient String[] Station_type_info = new String[]{'Station','http://www.w3.org/2001/XMLSchema','string','0','1','true'};
        transient String[] apex_schema_type_info = new String[]{'http://ibus.czncorp.com/ESB/BusinessObjects','false','false'};
        transient String[] field_order_type_info = new String[]{'NPA', 'NXX', 'Station'};
        
    }
    //-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    
    
    
}