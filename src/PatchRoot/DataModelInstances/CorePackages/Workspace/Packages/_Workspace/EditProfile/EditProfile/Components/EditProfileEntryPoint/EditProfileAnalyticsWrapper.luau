local l_script_FirstAncestor_0 = script:FindFirstAncestor("EditProfile");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local v4 = require(l_script_FirstAncestor_0.Flags.EditProfileIXP);
local v5 = require(l_script_FirstAncestor_0.Analytics);
local v6 = require(l_script_FirstAncestor_0.Flags.FFlagEditProfileFixLogging);
local v7 = require(script.Parent.EditProfileEntryPointContainer);
return function(v8)
    local v9 = l_useLocalUserId_0();
    local v10 = nil;
    v10 = if not v6 then v4.useIsExperimentEnabled() else nil;
    if not v6 and not v10 then
        return v2.createElement(v7, v8);
    else
        return v2.createElement(v5.Context.Provider, {
            value = {
                fireAnalyticsEvent = v5.setupFireAnalyticsEvents({
                    analytics = v5.AnalyticsService, 
                    infoForAllEvents = {
                        uid = v9
                    }
                })
            }
        }, {
            v2.createElement(v7, v8)
        });
    end;
end;
