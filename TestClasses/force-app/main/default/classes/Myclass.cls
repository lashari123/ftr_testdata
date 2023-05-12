public class Myclass {    
    private account accRec;    
    
    public Myclass(ApexPages.StandardController controller) {       
      account acc=(account)controller.getRecord();      
      accRec=[select id, name from account where id=:acc.id];    
      
    }
    
    public account getAcc(){        
        return accRec;   
    }    
}