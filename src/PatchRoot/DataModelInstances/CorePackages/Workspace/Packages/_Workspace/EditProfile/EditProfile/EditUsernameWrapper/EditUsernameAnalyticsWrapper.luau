local l_script_FirstAncestor_0 = script:FindFirstAncestor("EditProfile");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local v4 = require(l_script_FirstAncestor_0.Flags.EditProfileIXP);
local v5 = require(l_script_FirstAncestor_0.Analytics);
local v6 = require(script.Parent.EditUsernameWrapper);
return function(v7)
    local v8 = l_useLocalUserId_0();
    if not v4.useIsExperimentEnabled() then
        return v2.createElement(v6, v7);
    else
        return v2.createElement(v5.Context.Provider, {
            value = {
                fireAnalyticsEvent = v5.setupFireAnalyticsEvents({
                    analytics = v5.AnalyticsService, 
                    infoForAllEvents = {
                        uid = v8
                    }
                })
            }
        }, {
            v2.createElement(v6, v7)
        });
    end;
end;
