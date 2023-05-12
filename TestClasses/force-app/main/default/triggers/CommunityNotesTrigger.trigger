trigger CommunityNotesTrigger on Community_Note__c (after insert) {
	RemedySubmitTroubleTicket.sendRemedyNotes(Trigger.new[0].Id);
}