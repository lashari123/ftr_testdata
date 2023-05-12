public class FrontierUtil {
   
   public final static String PRODCC = '00D3000000078aoEAA';
   public final static String PRODSFA = '00D400000007AI5EAM';

/**
 * Method accepts serviceNumber and SequenceNumber String a formatted phone Number (XXX-XXX-XXXX.X)
 *
 * @param  serviceNumber an String that contains the phoneNumber with out sequence number
 * @param  sequenceNumber an String that contains the sequenceNumber
 * @return String - complete formatted phone number
 */
    public static String getFormattedServiceTN(String serviceNumber, String sequenceNumber){
        String formattedServiceNumber = serviceNumber.subString(0,3)+'-'+serviceNumber.subString(3,6)+'-'+serviceNumber.subString(6,10);
        Double d = double.valueOf(sequenceNumber);
        Integer i = integer.valueOf(d);
        return formattedServiceNumber+'.'+ i;
    }

    public static String getFormattedServiceTN(String serviceNumber){
        String formattedServiceNumber = serviceNumber.subString(0,3)+'-'+serviceNumber.subString(3,6)+'-'+serviceNumber.subString(6,10);
        return formattedServiceNumber;
    }


    public static String getFormattedPhone(String serviceNumber){
        String formattedServiceNumber ='('+ serviceNumber.subString(0,3)+') '+serviceNumber.subString(3,6)+'-'+serviceNumber.subString(6,10);
        return formattedServiceNumber;
    }

    public static String getFormattedStr(String typeStr,String descStr){
        if(typeStr != null && descStr != null){
            return typeStr + ' '+ descStr;
        }else if(typeStr != null){
            return typeStr;
        }else{
            return '';
        }
    
    }

    // sva zero pad numbers, like SO and TT
    // note is requested sz is less than length, it tries to cut off leading zeroes
    // if null or empty in, null or empty goes out
public static String ZeroPad(String instr, Integer sz)
    {
        String out = instr;
        String zr = '000000000';
        if (instr == null || instr == '') return instr;
        
        while (sz > 0 && out.length() > sz && out.substring(0,1) == '0')
        {
            system.debug('&*&*&**Too long: started with ' + out);
            out = out.substring(1, out.length());
            system.debug('&*&*&**now: ' + out);
        }
            
        Integer i = sz - out.length();
        if (i > 0)
            out = zr.substring(0, i) + out;
        return out;
    }

public static String ConvertDateTimeToSoql(DateTime dt)
{
    String disp = '';
    if (dt == null) return disp;
    disp = dt.year() + '-';
    if (dt.month() < 10)
            disp += '0';
    disp += dt.month() + '-';
    if (dt.day() < 10)
        disp += '0';
    disp += dt.day() + 'T';
    if (dt.hour() < 10) disp += '0';
    disp += dt.hour() + ':';
    if (dt.minute() < 10) disp += '0';
    disp += dt.minute() + ':00Z';
    return disp;

}
    
public static String getUnformattedTN(String formattedNumber){
        if (formattedNumber != null)
        {
            // GCosmiano Aug 2010
            // Heat ticket 2103790 - correcting the TN cleanup crap
            String tn = formattedNumber.replaceAll('[^0-9]','');
            if (tn.length() >= 11) {
                tn = tn.substring(0, 10);
            }
            return tn;
        }
        else
            return '';
}    
    
    public static DateTime getValidDateTime(DateTime esbDateTime){
        
        DateTime compDateTime = Datetime.valueof('1700-01-01 00:00:00');
        
        if(esbDateTime != null){
            if(compDateTime.getTime() > esbDateTime.getTime() ){
                esbDateTime = null;
            }
        }
        return esbDateTime;
        
    }

    public static Date getValidDate(Date esbDate){
        
        Date compDate = Date.newInstance(1700,01,01);
        
        if(esbDate != null){
            if(compDate.daysBetween(esbDate) < 0){
                esbDate = null;
            }
        }
        return esbDate;
        
    }

public static Date getValidDOBDate(Date esbDate){
        
        Date compDate = Date.newInstance(1900,01,01);
        Date latestDate = Date.today();
        
        if(esbDate != null){
            if(compDate.daysBetween(esbDate) < 0 || latestDate.daysBetween(esbDate) > 0){
                esbDate = null;
            }
        }
        return esbDate;
        
    }

public static Integer getMillis(String sDate)
{
    if (sDate.length() < 22) return -1;
    String m1 = sDate.substring(20);
    if (m1.contains('T')) return -1;
    Integer i = 0;
    try {
        i = Integer.valueOf(m1);
    } catch (Exception e)
    {
        i = -1;
    }
    return i;
}
    
public static String formatCurrency(Decimal amt)
{
    if (amt == null) return '$0.00';
    return formatCurrency(amt.format());
}
public static String formatCurrency(Double amt)
{
    if (amt == null) return '$0.00';
    return formatCurrency(amt.format());
}

public static String formatCurrency(String amt)
{
    String x;
    if (amt == null || amt == '') return '$0.00';
    
    amt = amt.replace('$', ''); 
    amt = amt.replace(',','');
    String neg = amt.substring(0,1);
    if (neg == '(') amt = amt.substring(1, amt.length() - 1);
    else if (neg == '-') amt = amt.substring(1);

    Integer pos = amt.indexOf('.');
    if (pos < 0)
    {
        x = amt + '.00';
        pos = amt.length();
    }
    else {
        if (pos == 0) { x = '0' + amt; pos++; }
        else x = amt;
        while (x.length() < pos + 3)
            x += '0';
    }
    if (pos > 3) // insert commas, more then 3 digits to left of period
        x = x.substring(0,pos-3) + ',' + x.substring(pos-3);
    if (neg == '-') x = neg + x;
    else if (neg == '(') x = neg + x + ')';
    return '$' + x;
}

 
 /* 
 * Sva:  Added 12/29/2008 to handle all errors wherein a retry can work
 *  includes duplicate values for poorly-timed upserts, lost connections, inability to temporarily lock a row
 */
 
 public static Boolean retryError(String emsg) {
 if (emsg.contains('DUPLICATE_VALUE') 
    || emsg.contains('Connection to the remote host ')
    || emsg.contains('UNABLE_TO_LOCK_ROW') )
    return true;
 else
    return false;
 }
 
     //format the zip code with dash (if necessary)
    public static String formatZip(String strZip)
    {
        if (strZip != null)
        {
            if (strZip.length()==9)
            {
                return strZip.substring(0,5) + '-' + strZip.substring(5,9);
            }
            else
            { 
                return strZip;
            }       
        }
        else 
            return null;
    }

    public static void sendMsg(String subj, String emsg, String to) 
    {
        String[] toAddresses = new String[] {to};
        sendMsg(subj, emsg, toAddresses);
    }
    
    //send "@" as first characetr of message to avoid the org being displayed
    public static void sendMsg(String subj, String emsg, List<String> to) {
        Messaging.SingleEmailMessage mail = BuildMsg(subj, emsg, to);
        try {
            Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
        } catch (Exception e) { }
    }              
    public static Messaging.SingleEmailMessage buildMsg(String subj, String emsg, String to) {
        String[] toAddresses = new String[] {to};
        return buildMsg(subj, emsg, toAddresses);
    }
        

    public static Messaging.SingleEmailMessage buildMsg(String subj, String emsg, List<String> to) {
        Boolean bNoOrg = false;
        if (emsg.length() > 1 && emsg.substring(0,1) == '@')
        {
            bNoOrg = true;
            emsg = emsg.substring(1);
        }
        Messaging.SingleEmailMessage mail=new Messaging.SingleEmailMessage();
        mail.setToAddresses(to); 
        mail.setSenderDisplayName(UserInfo.getName());
        mail.setSubject(subj + (bNoOrg == true ? '' : ' from Org: ' + getOrgName()));
        
        String s;
        if (!bNoOrg)
            s = '\nOrg:' + getOrgName() + ' ' + UserInfo.getOrganizationId() +
                    '\nUser:'+ UserInfo.getName()+ ' (' + UserInfo.getUserName() + ')\n\n' + emsg;
        else s = emsg;
        mail.setPlainTextBody( s);
        return mail;
    }              
 
    
 // send multiple emails to same recipients
     public static void sendMsgs(Messaging.SingleEmailMessage[] emails) {
        try {
            Messaging.sendEmail(emails);
        } catch (Exception e) { } // fails if exceeds governor limit of 10
    }  
    

    public static String getOrgName()
    {
        if (UserInfo.getOrganizationId() == PRODCC) return 'PROD CC';
        if (UserInfo.getOrganizationId() == PRODSFA) return 'PROD SFA';
        return getSandboxOrg();
    }
    
    public static String getSandBoxOrg()
    {
        if (UserInfo.getOrganizationId() == PRODCC ||
            UserInfo.getOrganizationId() == PRODSFA) 
                return '';

        String s = UserInfo.getUserName();
        try {
            return s.substring(s.lastIndexOf('.')+1).toUpperCase();
        } catch (Exception e) { return '#'; }
        
    }
    // url can be https://na2.salesforce.com or https://c.na2.salesforce.com
    public static String getServer(String BaseURL)
    {
        if (BaseURL == null || BaseURL.length() < 10)
            return null;
        Integer i = BaseURL.indexOf('//') + 2; 
        Integer j = BaseURL.indexOf('.', i);  
        if (j - i < 3) // for the new dumb c.cs1.visual.force url
            i = j + 1;
        return BaseURL.substring(i,BaseURL.indexOf('.',i));         
    
    }

 static testMethod void testFrontierUtil() {
    FrontierUtil.getFormattedServiceTN('1234567890', '0');
    FrontierUtil.getFormattedPhone('1234567890');
    FrontierUtil.getFormattedStr('1', '2');
    FrontierUtil.getFormattedStr(null, '2');
    FrontierUtil.getFormattedStr(null, null);
    FrontierUtil.getUnformattedTN('(123) 456-7890.0');
    Date compDate = Date.newInstance(1600,01,01);
    FrontierUtil.getValidDate(compdate);
    FrontierUtil.getValidDOBDate(compdate);
    FrontierUtil.getValidDateTime(DateTime.now());
    FrontierUtil.ConvertDateTimeToSoql(DateTime.now());
    FrontierUtil.retryError('zork');
    FrontierUtil.getFormattedServiceTN('1234567890');
    FrontierUtil.formatZip('123456789');
    FrontierUtil.sendMsg('subject','msg','scott.vanatta@ftr.com');
    String[] toAddresses = new String[] {'scott.vanatta@ftr.com'};
    FrontierUtil.sendMsg('subject','msg',toAddresses);
    List<Messaging.SingleEmailMessage> ms = new List<Messaging.SingleEmailMessage>();
    Messaging.SingleEmailMessage sm = FrontierUtil.buildMsg('subject', 'msg', 'scott.vanatta@ftr.com');
    Messaging.SingleEmailMessage sm2 = FrontierUtil.buildMsg('subject', 'msg', 'scott.vanatta@ftr.com');
    ms.add(sm);
    ms.add(sm2);
    FrontierUtil.sendMsgs(ms);
    FrontierUtil.getMillis('01-10-2012 17:34:20:650');

    Double d;
    system.assertEquals(formatCurrency(d), '$0.00');
    d = .1;
    formatCurrency(d);
    
    Decimal d2;
    system.assertEquals(formatCurrency(d2), '$0.00');
    d2 = -1;
    system.assertEquals(formatCurrency(d2), '$-1.00');
    
    system.assertEquals(formatCurrency(''), '$0.00');
    system.assertEquals(formatCurrency('(1.2)'), '$(1.20)');
    system.assertEquals(formatCurrency('10000.12'), '$10,000.12');
    system.assertEquals(formatCurrency('-1.35'), '$-1.35');
    system.assertEquals(formatCurrency('1$,00'), '$100.00');
    system.assertEquals(formatCurrency('1000'), '$1,000.00');
    
 }
 static testMethod void testZeropad()
 {
    String xx = '0123456789';
    String yy = ZeroPad(xx, 9);
    system.debug('&*&*&**yy=' + yy);    
    yy=ZeroPad(xx,11);
    system.debug('&*&*&**yy=' + yy);    
    
 }
}