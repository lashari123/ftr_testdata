/**
 *  QuoteLineItemHandler - Handles Quote Line Item triggers
 * 
 *  @author: Sean Fife
 *  @date: Dec 4 2019
 */
public class QuoteLineItemHandler {
    @testVisible
    private static boolean blockRecursion = false;
    
    private List<QuoteLineItem> newItems;
    private List<QuoteLineItem> oldItems;
    private Map<Id, QuoteLineItem> newMap;
    private Map<Id, QuoteLineItem> oldMap;
    
    public QuoteLineItemHandler(List<QuoteLineItem> newItems, List<QuoteLineItem> oldItems, Map<Id, QuoteLineItem> newMap, Map<Id, QuoteLineItem> oldMap)
    {
        this.newItems = newItems;
        this.oldItems = oldItems;
        this.newMap = newMap;
        this.oldMap = oldMap;
    }
    
    public static void blockRecursion()
    {
        blockRecursion = true;
    }
    
    public void triggerHandler(boolean isBefore, boolean isInsert, boolean isUpdate, boolean isDelete, boolean isUndelete)
    {  
        if(blockRecursion == true) return;

        if(isBefore)
        {
            if(isUpdate) beforeUpdate();            
        }
        else
        {
        }
    }
    
    private void beforeUpdate()
    {
        system.debug('QuoteLineItem Before Update');

        QuoteLineItemService.UpdateQuote(newItems);
    }
}