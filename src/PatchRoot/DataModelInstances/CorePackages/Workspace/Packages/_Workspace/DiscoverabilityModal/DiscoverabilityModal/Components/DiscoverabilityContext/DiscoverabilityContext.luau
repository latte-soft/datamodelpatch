local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local v2 = require(l_Parent_0.Common.Constants);
local l_React_0 = v1.React;
local l_useMemo_0 = l_React_0.useMemo;
local v5 = require(l_Parent_0.Flags.SelfViewProfileDiscoverabilityUpsellIXP);
local v6 = require(l_Parent_0.Analytics.DiscoverabilityModalAnalyticsContext);
local v7 = require(l_Parent_0.Analytics.setupFireAnalyticsEvents);
local v8 = require(l_Parent_0.Analytics.AnalyticsService);
local v9 = require(l_Parent_0.Analytics.Enums.EntryPoints);
local l_useSelector_0 = v1.Hooks.useSelector;
local l_useNavigation_0 = v1.Hooks.useNavigation;
return function(v12)
    return function(v13)
        local v14 = if v5.SetupEnabled() then nil else l_useNavigation_0();
        local v15 = if v5.SetupEnabled() then nil else v14.getParam(v2.EVENT_INGEST_SERVICE);
        local v16 = if v5.SetupEnabled() then nil else v14.getParam(v2.DIAG_SERVICE);
        if not (not v13.context or v5.SetupEnabled()) then
            v15 = v13.context.eventIngestService;
            v16 = v13.context.diagService;
        end;
        local v18 = l_useSelector_0(function(v17)
            return v17.LocalUserId;
        end);
        if not v5.SetupEnabled() then
            return l_React_0.createElement(v6.Provider, {
                value = l_useMemo_0(function()
                    return {
                        fireAnalyticsEvent = v7({
                            diag = v16, 
                            eventStreamImpl = v15, 
                            defaultAnalyticsInfo = {
                                uid = v18, 
                                entry = if not v13.context then v9.HomePage else v9.AddFriends
                            }
                        })
                    };
                end, {
                    v16, 
                    v15, 
                    v18
                })
            }, {
                l_React_0.createElement(v12, v13)
            });
        else
            return l_React_0.createElement(v6.Provider, {
                value = {
                    fireAnalyticsEvent = v7({
                        analytics = v8, 
                        defaultAnalyticsInfo = {
                            uid = v18, 
                            entry = if not v13.navigation then v13.entryPoint else v13.navigation.getParam(v2.ENTRY_POINT)
                        }
                    })
                }
            }, {
                l_React_0.createElement(v12, v13)
            });
        end;
    end;
end;
