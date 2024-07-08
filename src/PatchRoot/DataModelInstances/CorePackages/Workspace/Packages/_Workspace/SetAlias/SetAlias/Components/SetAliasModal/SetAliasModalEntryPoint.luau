local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_React_0 = v1.React;
local l_useLocalUserId_0 = v1.Hooks.useLocalUserId;
local l_UplevelAliasIXP_0 = v1.UserProfiles.Flags.UplevelAliasIXP;
local v5 = require(l_Parent_0.Analytics);
local v6 = require(l_Parent_0.Common.Constants);
local v7 = require(script.Parent.SetAliasModalContainer);
return function(v8)
    local v9 = l_useLocalUserId_0();
    if not (not not l_UplevelAliasIXP_0.isSetupEnabled() and l_UplevelAliasIXP_0.useIsExperimentEnabled()) then
        return l_React_0.createElement(v7, v8);
    else
        return l_React_0.createElement(v5.Context.Provider, {
            value = {
                fireAnalyticsEvent = v5.setupFireAnalyticsEvents({
                    analytics = v5.AnalyticsService, 
                    infoForAllEvents = {
                        uid = v9, 
                        origin = v8.navigation.getParam(v6.ORIGIN)
                    }
                })
            }
        }, {
            l_React_0.createElement(v7, v8)
        });
    end;
end;
