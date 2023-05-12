public class PreventAccountTriggerRecursive {
    public static boolean preventRecursive = true;
    public static Set<Id> StaticIdSet = new Set<Id>();
    
    public static boolean CheckForMembership(Set<Id> IDS) {
        boolean return_value = false;
        for(ID IID : IDS) {
            if(StaticIdSet.Contains(IID)) {
                return_value = true;
            }
        }
        
        return return_value;
    }
}