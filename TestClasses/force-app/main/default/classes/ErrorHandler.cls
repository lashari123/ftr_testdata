Public class ErrorHandler{
      String[] destEmail;
    public ErrorHandler(){
        destEmail = new String[]{'sunil.shrestha@ftr.com','sahitya.chitibomma@ftr.com'};
    }
    
    public void sendErrMail(String error){
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        mail.setToAddresses(destEmail);           
        mail.setReplyTo('sunil.shrestha@ftr.com');
        mail.setSenderDisplayName('Exception');
        mail.setSubject('ServiceConsole callout failed');
        mail.setPlainTextBody('The following error occured: '+ '\n'+error);
        Messaging.sendEmail(new Messaging.SingleEmailMessage[]{mail});  
    }
}