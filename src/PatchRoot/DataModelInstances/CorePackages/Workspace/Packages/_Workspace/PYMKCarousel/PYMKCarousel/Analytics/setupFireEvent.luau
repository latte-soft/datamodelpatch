local l_SocialLuaAnalytics_0 = require(script.Parent.Parent.dependencies).SocialLuaAnalytics;
local v1 = require(script.Parent.DiagActionList);
local l_fireEventStream_0 = l_SocialLuaAnalytics_0.Analytics.FireEvent.fireEventStream;
local l_fireDiagCounter_0 = l_SocialLuaAnalytics_0.Analytics.FireEvent.fireDiagCounter;
local v4 = require(script.Parent.EventStreamActionList);
return function(v5)
    local v6 = l_fireEventStream_0({
        eventStreamImpl = v5.analytics.EventStream, 
        eventList = v4, 
        infoForAllEvents = v5.infoForAllEvents
    });
    local v7 = l_fireDiagCounter_0({
        diagImpl = v5.analytics.Diag, 
        eventList = v1
    });
    return function(v8, v9)
        if not (not v7 or not v1[v8]) then
            v7(v8);
        end;
        return v6(v8, v9);
    end;
end;
