local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Parent.SocialLuaAnalytics);
local l_fireDiagCounter_0 = v1.Analytics.FireEvent.fireDiagCounter;
local l_fireDiag_0 = v1.Analytics.FireEvent.fireDiag;
local v4 = require(l_Parent_0.Flags.FFlagUserProfilesLogErrorCodes);
local v5 = require(script.Parent.DiagCountersList);
local _ = require(script.Parent.EventNames);
return function(v7)
    if not v4 then
        local v8 = l_fireDiagCounter_0({
            diagImpl = v7.analytics.Diag, 
            eventList = v5
        });
        return function(v9)
            if not v5[v9] then
                return v9;
            else
                return v8(v9);
            end;
        end;
    else
        local v10 = l_fireDiag_0({
            diagImpl = v7.analytics.Diag, 
            eventList = v5
        });
        return function(v11, v12)
            if not v5[v11] then
                return v11;
            else
                return v10(v11, v12);
            end;
        end;
    end;
end;
