local v0 = require(script.Parent.Parent.dependencies);
local l_SocialLuaAnalytics_0 = v0.SocialLuaAnalytics;
local v2 = require(script.Parent.DiagActionList);
local l_fireEventStream_0 = l_SocialLuaAnalytics_0.Analytics.FireEvent.fireEventStream;
local l_fireDiagCounter_0 = l_SocialLuaAnalytics_0.Analytics.FireEvent.fireDiagCounter;
local v5 = require(script.Parent.EventStreamActionList);
local l_AnalyticsService_0 = v0.AnalyticsService;
return function(v7)
    local v8 = l_fireEventStream_0({
        eventStreamImpl = v7.analytics.EventStream, 
        eventList = v5, 
        infoForAllEvents = v7.infoForAllEvents
    });
    local v9 = l_fireDiagCounter_0({
        diagImpl = if v7.analytics.Diag then v7.analytics.Diag else l_AnalyticsService_0.Diag, 
        eventList = v2
    });
    return function(v10, v11)
        if not (not v9 or not v2[v10]) then
            v9(v10);
        end;
        return v8(v10, v11);
    end;
end;
