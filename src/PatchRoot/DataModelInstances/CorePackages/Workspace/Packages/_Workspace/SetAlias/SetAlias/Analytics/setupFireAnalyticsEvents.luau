local l_SocialLuaAnalytics_0 = require(script.Parent.Parent.dependencies).SocialLuaAnalytics;
local l_fireDiagCounter_0 = l_SocialLuaAnalytics_0.Analytics.FireEvent.fireDiagCounter;
local l_fireEventStream_0 = l_SocialLuaAnalytics_0.Analytics.FireEvent.fireEventStream;
local v3 = require(script.Parent.DiagActionList);
local v4 = require(script.Parent.EventStreamActionList);
local _ = require(script.Parent.Enums.EventNames);
return function(v6)
    local v7 = l_fireEventStream_0({
        eventStreamImpl = v6.analytics.EventStream, 
        eventList = v4, 
        infoForAllEvents = v6.infoForAllEvents
    });
    local v8 = l_fireDiagCounter_0({
        diagImpl = v6.analytics.Diag, 
        eventList = v3
    });
    return function(v9, v10)
        if v3[v9] then
            v8(v9);
        end;
        return v7(v9, v10);
    end;
end;
