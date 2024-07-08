local v0 = require(script.Parent.UIBlox);
return {
    config = function(v1)
        if v1.UIBloxConfig then
            v0.init(v1.UIBloxConfig);
        end;
        return {
            Analytics = require(script.Analytics), 
            Components = require(script.Components), 
            Conversation = require(script.Conversation), 
            Dictionary = require(script.Dictionary), 
            User = require(script.User), 
            Utils = require(script.Utils), 
            RoactLayout = require(script.RoactLayout), 
            RoactPaginator = require(script.RoactPaginator), 
            RoduxTools = require(script.RoduxTools), 
            populate = require(script.populate), 
            TestingAnalytics = require(script.TestingAnalytics), 
            ReleaseHelpers = require(script.ReleaseHelpers), 
            Flags = require(script.Flags), 
            StoryMiddleware = require(script.StoryMiddleware), 
            Context = require(script.Context)
        };
    end
};
