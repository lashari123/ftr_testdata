@IsTest
public with sharing class Notification_Utility_Test {
    @IsTest
    private static Void sendNotificationToGroupOrQueue_Test() {
        // * GIVEN there is an existing group or queue
        Group testGroup = new Group (
            Name = 'TestGroup',
            DeveloperName = 'TestGroup',
            Type = 'Regular',
            // Email = UserInfo.getUserEmail(),
            DoesSendEmailToMembers = true,
            DoesIncludeBosses = true
        );
        insert testGroup;
        
        // * AND the group has members
        List<GroupMember> groupMembers = new List<GroupMember> {
            new GroupMember(
                GroupId = testGroup.Id,
                UserOrGroupId = UserInfo.getUserId()
            )
        };
        insert groupMembers;
        
        // * WHEN sendNotificationToGroupOrQueue is called with the group/queue name
        List<Messaging.SendEmailResult> results = Notification_Utility.sendNotificationToGroupOrQueue(testGroup.Name,  'Test', 'Test');

        // * THEN the system will send an email to said group
//       System.assert(results[0].isSuccess());

    }
}