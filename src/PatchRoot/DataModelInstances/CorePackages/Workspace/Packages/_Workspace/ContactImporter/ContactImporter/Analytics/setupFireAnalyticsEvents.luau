local l_SocialLuaAnalytics_0 = require(script.Parent.Parent.dependencies).SocialLuaAnalytics;
local v1 = require(script.Parent.Enums.EventNames);
local v2 = require(script.Parent.fireReportStats);
local l_fireEventStream_0 = l_SocialLuaAnalytics_0.Analytics.FireEvent.fireEventStream;
local l_fireDiagCounter_0 = l_SocialLuaAnalytics_0.Analytics.FireEvent.fireDiagCounter;
local v5 = require(script.Parent.AnalyticsEvents);
local v6 = require(script.Parent.DiagEvents);
return function(v7)
    local v8 = l_fireEventStream_0({
        eventStreamImpl = if not v7.analytics then v7.eventStreamImpl else v7.analytics.EventStream, 
        eventList = v5, 
        infoForAllEvents = v7.defaultAnalyticsInfo
    });
    local v9 = l_fireDiagCounter_0({
        diagImpl = if not v7.analytics then v7.diag else v7.analytics.Diag, 
        eventList = v6
    });
    local v10 = v2({
        diagImpl = if not v7.analytics then v7.diag else v7.analytics.Diag, 
        eventList = v6
    });
    return function(v11, v12)
        if v6[v11] then
            if v11 == v1.ContactImportingTime then
                v10(v1.ContactImportingTime, v12);
            else
                v9(v11);
            end;
        end;
        if v5[v11] then
            v8(v11, v12);
        end;
    end;
end;
