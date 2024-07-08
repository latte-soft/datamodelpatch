return {
    setupFireEvent = require(script:FindFirstAncestor("FriendsLanding").Parent.SocialLuaAnalytics).Analytics.FireEvent.createFireEvent({
        EventStream = require(script.EventStreamActionList), 
        Diag = require(script.DiagActionList)
    }), 
    EventNames = require(script.EventNames)
};
