public class VisualForceUtilities {
    public static List<SelectOption> getPicklistValueSelectOptions(Schema.DescribeFieldResult fieldResult) {
        List<SelectOption> picklistValueSelectOptions = new List<SelectOption>();
        List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
        for (Schema.PicklistEntry p : ple) {
            picklistValueSelectOptions.add(new SelectOption(p.getValue(),p.getLabel()));
        }
        return picklistValueSelectOptions;
    }
}