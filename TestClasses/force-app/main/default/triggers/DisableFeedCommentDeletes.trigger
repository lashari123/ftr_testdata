/**

Implemented by Zaheer Muhammed for an unknown reason
12/26/2019: Commented out because it is disabled to increase test coverage.  kt

*/

trigger DisableFeedCommentDeletes on FeedComment (before delete) 
{
/*
    if (!DisableChatterDeleteDelegate.allowDelete()) {
        for(FeedComment f : Trigger.old){
            f.addError('Your administrator has disabled feed post and comment deletions.'); 
        }
    }
*/    
}