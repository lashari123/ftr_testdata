({
   openModel: function(component, event, helper) {
      component.set("v.isModalOpen", true);
   },
  
   closeModel: function(component, event, helper) {
      component.set("v.isModalOpen", false);
       component.set("v.messageClass", "");
       component.set("v.messageText", "");
       component.set("v.rating", "");
       component.set("v.feedbackType", "");
       component.set("v.comments", "");
       component.set("v.easyToUse", "");
       component.set("v.lookingFor", "");
   },
    
   selectEmoji: function(component, event, helper) {
      component.set("v.rating", event.currentTarget.dataset.name);
      helper.checkSubmitStatus(component, event, helper);
   },
    
   selectCategory: function(component, event, helper) {
      component.set("v.feedbackType", event.currentTarget.dataset.name);
      helper.checkSubmitStatus(component, event, helper);
   },
    
   handleComments: function(component, event, helper) {
      let comments = component.get("v.comments");
      component.set("v.remainingChars", (150 - comments.length));
      helper.checkSubmitStatus(component, event, helper);
   },
  
   submitDetails: function(component, event, helper) {
   		//component.set("v.isModalOpen", false);
       	component.set("v.serverCallDone", false);
       	helper.submitFeedback(component, event, helper);
   },
})