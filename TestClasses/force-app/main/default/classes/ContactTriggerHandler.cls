public class ContactTriggerHandler extends ftr_TriggerHandler{
	public override void beforeInsert() {
        for(Sobject con : Trigger.new){
            ContactUtility.parsePhoneNumberAndExt((Contact) con);
        }

    }
}