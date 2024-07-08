local v0 = require(script:FindFirstAncestor("ProfileQRCode").Parent.SocialLuaAnalytics);
local v1 = require(script.Parent.DiagActionList);
local l_fireEventStream_0 = v0.Analytics.FireEvent.fireEventStream;
local l_fireDiagCounter_0 = v0.Analytics.FireEvent.fireDiagCounter;
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
        if v1[v8] then
            v7(v8);
        end;
        return v6(v8, v9);
    end;
end;
