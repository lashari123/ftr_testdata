@isTest(seeAllData = true)
public class Test_SyncWithChannelForm {
 public static testMethod void unit1(){
 
User user1 = new User(alias = 'ceo', email='admin@ftr.testorg.com',
        emailencodingkey='UTF-8', lastname='Testing', languagelocalekey='en_US',        
        localesidkey='en_US',
        timezonesidkey='America/Los_Angeles', username='adminTas@ftr.testorg.com', profileid = '00e40000000nTsD');
        insert user1;
User user2 = new User(alias = 'ceo2', email='admin2@ftr.testorg.com',
        emailencodingkey='UTF-8', lastname='Testing', languagelocalekey='en_US',
        localesidkey='en_US',
        timezonesidkey='America/Los_Angeles', username='admin2@ftr.testorg.com', profileid = '00e40000000nTsD');
        insert user2;

     Account acc = new Account(name = 'sprncm', OwnerId = User1.id);
     insert acc;
 
}}