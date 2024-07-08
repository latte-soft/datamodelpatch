local l_Parent_0 = script.Parent.Parent;
local l_mockAnalytics_0 = require(l_Parent_0.Parent.SocialLuaAnalytics).TestingAnalytics.mockAnalytics;
local v2 = require(l_Parent_0.Analytics.setupFireEvent);
return function(v3, v4)
    local v5 = l_mockAnalytics_0(v4);
    local v6 = if not not v3 and v3.pid then v3.pid else "1818";
    local v7 = if not not v3 and v3.source then v3.source else "mock";
    local v8 = if not not v3 and v3.uid then v3.uid else "101";
    return {
        analyticsMock = v5, 
        fireAnalyticsEvent = v2({
            analytics = v5, 
            infoForAllEvents = {
                isUnder13 = false, 
                pid = v6, 
                source = v7, 
                uid = v8
            }
        }), 
        uid = v8
    };
end;
