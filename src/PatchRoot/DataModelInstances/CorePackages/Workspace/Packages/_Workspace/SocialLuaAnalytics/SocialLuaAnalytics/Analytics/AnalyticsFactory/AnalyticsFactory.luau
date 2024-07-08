local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialLuaAnalytics");
local v1 = require(l_script_FirstAncestor_0.Parent.Cryo);
local v2 = require(l_script_FirstAncestor_0.Analytics.FireEvent.createFireEvent);
local _ = require(script.Parent.Parent.Types);
return function(v4)
    local v5 = v4.infoForAllEvents or {};
    return {
        fireAnalyticsEvent = v2({
            EventStream = v4.eventLists.EventStream, 
            Diag = v4.eventLists.Diag
        })({
            analytics = {
                EventStream = v4.analyticsImpl.EventStream, 
                Diag = v4.analyticsImpl.Diag
            }, 
            infoForAllEvents = v4.infoForAllEvents, 
            loggerImpl = v4.loggerImpl
        }), 
        updateInfoForAllEvents = function(v6)
            v5 = v1.Dictionary.join(v5, v6);
            return v5;
        end, 
        getInfoForAllEvents = function()
            return v5;
        end
    };
end;
