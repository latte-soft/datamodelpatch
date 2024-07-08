local l_SocialLuaAnalytics_0 = require(script.Parent.Parent.dependencies).SocialLuaAnalytics;
local l_fireDiagCounter_0 = l_SocialLuaAnalytics_0.Analytics.FireEvent.fireDiagCounter;
local l_fireEventStream_0 = l_SocialLuaAnalytics_0.Analytics.FireEvent.fireEventStream;
local v3 = require(script.Parent.DiagActionList);
local _ = require(script.Parent.EventNames);
local v5 = require(script.Parent.EventStreamActionList);
return function(v6)
    local v7 = l_fireEventStream_0({
        eventStreamImpl = v6.analytics.EventStream, 
        eventList = v5, 
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
