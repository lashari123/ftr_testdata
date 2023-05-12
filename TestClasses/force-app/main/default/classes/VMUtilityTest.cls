@isTest(seeAllData = true)
private class VMUtilityTest {
    static testmethod void unitTest(){
         boolean isVmDsble = VMUtility.isVMDisabled();
         boolean hasSku = VMUtility.checkSkuKey('G1101');
         string message = VMUtility.resetVoiceMailPasscode('343554455');
         System.debug(message);
         //System.assertEquals(hasSku, true);
         System.assertEquals(message.contains('123456'), true);
    }
}