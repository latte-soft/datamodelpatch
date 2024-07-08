local l_Parent_0 = script.Parent.Parent;
local l_Players_0 = game:GetService("Players");
return (require(l_Parent_0.Analytics.setupFireEvent)({
    analytics = require(l_Parent_0.Analytics.AnalyticsService), 
    infoForAllEvents = {
        isUnder13 = if not l_Players_0.LocalPlayer then nil else l_Players_0.LocalPlayer:GetUnder13(), 
        pid = tostring(game.PlaceId), 
        source = require(l_Parent_0.Constants).AnalyticsSource, 
        uid = require(l_Parent_0.Utils.getLocalUserId)(l_Players_0)
    }
}));
