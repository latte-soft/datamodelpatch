local v0 = require(script.Parent.Parent.Parent.SocialLuaAnalytics);
local l_fireDiagCounter_0 = v0.Analytics.FireEvent.fireDiagCounter;
local l_fireEventStream_0 = v0.Analytics.FireEvent.fireEventStream;
local v3 = require(script.Parent.EventStreamActionList);
local v4 = require(script.Parent.DiagActionList);
return function(v5)
    local v6 = l_fireEventStream_0({
        eventStreamImpl = v5.analytics.EventStream, 
        eventList = v3, 
        infoForAllEvents = v5.infoForAllEvents
    });
    local v7 = l_fireDiagCounter_0({
        diagImpl = v5.analytics.Diag, 
        eventList = v4
    });
    return function(v8, v9)
        if not (not v7 or not v4[v8]) then
            v7(v8);
        end;
        return v6(v8, v9);
    end;
end;
