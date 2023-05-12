public class ContactUtility {
    public static void parsePhoneNumberAndExt(Contact con){
        if(con.Phone_Number_with_Extension__c != null && con.Phone_Number_with_Extension__c.contains('ext')){
            List<String> lstStr = con.Phone_Number_with_Extension__c.split(' ext. ');
            
            if(lstStr.size() == 2){
                con.Phone = lstStr[0];
            	con.Extension__c = lstStr[1];
            }
        }else if(con.Phone_Number_with_Extension__c != null && !con.Phone_Number_with_Extension__c.contains('ext')){
            String phnNumber = con.Phone_Number_with_Extension__c;
            if(phnNumber.contains('*')){
                phnNumber = phnNumber.replace('*', '$');
            }
            if(phnNumber.contains('+')){
                phnNumber = phnNumber.replace('+', '');
            }
            if(phnNumber.contains('-')){
                phnNumber = phnNumber.replace('-', '');
            }
            if(phnNumber.contains('(')){
                phnNumber = phnNumber.replace('(', '');
            }
            if(phnNumber.contains(')')){
                phnNumber = phnNumber.replace(')', '');
            }
            
            System.debug('phnNumber :::::'+phnNumber);
            String SPECIAL_CHAR_PATTERN = '[^\\w\\*]';
            Pattern p = Pattern.compile(SPECIAL_CHAR_PATTERN);
            Matcher pm = p.matcher(phnNumber.replaceAll('\\s+',''));
            System.debug('pm :::'+pm);
            System.debug('Befor Replace Phone_Number_with_Extension__c'+con.Phone_Number_with_Extension__c);
           
            if(pm.find()) { 
                
                con.Phone_Number_with_Extension__c = con.Phone_Number_with_Extension__c.replace(pm.group(0),'Ext');
                System.debug('Phone_Number_with_Extension__c'+con.Phone_Number_with_Extension__c);
                
                List<String> lstStr = con.Phone_Number_with_Extension__c.split('Ext');
                con.Phone = lstStr[0];
                system.debug('Phoone'+con.Phone);
                if(lstStr.size() == 2 && lstStr[1] != null && lstStr[1].trim() != ''){
                    con.Extension__c = lstStr[1].trim();
                }
            }else{
                con.Phone = con.Phone_Number_with_Extension__c;
            }
        }
    }
}