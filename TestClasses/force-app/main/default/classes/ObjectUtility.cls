/********************************************************************************************
Name : ObjectUtility
Created By : Mohan Talluri (mohan.talluri@ftr.com)
Created Date : Mar 6, 2016
Description :  Utility to support generic methods for all utility files.
********************************************************************************************/

public with sharing class ObjectUtility {

  public static String appendZeroOnTN(String TN)
  {
      if ( (!String.isEmpty(TN)) && (TN.length() == 10) )    
          TN += '.0';
      
      return TN;        
  }
  
  public static String checkForZero(String TN)
  {
      if (!String.isEmpty(TN))
      {
         if ( (TN.trim()).equals('0') )
           return '';
      }
      return TN;
  }
  
  public static String setAccountName(String WTN)
  {
     if ( (!String.isEmpty(WTN)) && (WTN.length() == 10) )
        return '('+WTN.mid(0,3)+')'+WTN.mid(3,3)+' - '+WTN.mid(6,4)+'.0';
     else if ( (!String.isEmpty(WTN)) && (WTN.length() == 12) )
        return '('+WTN.mid(0,3)+')'+WTN.mid(3,3)+' - '+WTN.mid(6,6);
     else
        return 'WTN';
  }
  
}