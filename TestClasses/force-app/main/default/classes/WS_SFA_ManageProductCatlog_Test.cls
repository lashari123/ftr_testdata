@isTest(seealldata=true)
private class WS_SFA_ManageProductCatlog_Test {

    static testmethod void manageProductCatlogtest(){
        WS_SFA_ManageProductCatalog demo = new WS_SFA_ManageProductCatalog();
        String str = '<Item ItemID="1000004"><PrimaryInformation ShortDescription="Business Broadband Disconnect Charge" UnitCost="0.00"/></Item>';
        WS_SFA_ManageProductCatalog.Item Item = new WS_SFA_ManageProductCatalog.Item();
        WS_SFA_ManageProductCatalog.PrimaryInformation primaryinfo = new WS_SFA_ManageProductCatalog.PrimaryInformation();
        WS_SFA_ManageProductCatalog.ResponseClass responseresult = new WS_SFA_ManageProductCatalog.ResponseClass();
        XmlStreamReader reader = new XmlStreamReader(str);
        WS_SFA_ManageProductCatalog.parseXML(str);
        WS_SFA_ManageProductCatalog.Testing('Test');
		//WS_SFA_ManageProductCatalog.Item[] items = demo.       
        
    
     
    }
    
}