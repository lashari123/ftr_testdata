public class WS_ESB_tML_TA_Base {
	public class ManagedObjectInstanceType {
		public DistinguishedNameType DistinguishedName;
		public RDNSequenceType LocalDistinguishedName;
	}
	public class DistinguishedNameType {
		public AttributeValueAssertionType[] RDNSequenceItem;
	}
	public class RDNSequenceType {
		public AttributeValueAssertionType[] RDNSequenceItem;
	}
	public class AttributeValueAssertionType {
		public String Type;
		public String Assertion;
	}
}