@istest
public class FeedbackControllerTest {
	@istest
    static void insertFeedback() {
        Feedback__c fb = new Feedback__c(Rating__c = 'Sad',
                                         Feedback_Category__c = 'Suggestion',
                                         Comments__c = 'Test',
                                         Easy_To_Use__c = 'Yes',
                                         Found_looking_item__c = 'Yes',
                                         Page_Name__c = 'Tickets');
        
        FeedbackController.submitFeedback(fb);
    }
}