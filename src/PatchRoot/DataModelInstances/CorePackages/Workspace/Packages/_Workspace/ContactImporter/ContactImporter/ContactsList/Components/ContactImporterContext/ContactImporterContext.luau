local l_script_FirstAncestor_0 = script:FindFirstAncestor("ContactImporter");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_React_0 = v1.React;
local l_Dash_0 = v1.Dash;
local l_useMemo_0 = l_React_0.useMemo;
local v5 = require(l_script_FirstAncestor_0.Analytics);
local v6 = require(l_script_FirstAncestor_0.Common.Constants);
local v7 = require(l_script_FirstAncestor_0.Flags.getFFlagUpdateContactImporterToUseAnalyticsService);
local l_useSelector_0 = v1.useSelector;
local l_useNavigation_0 = v1.useNavigation;
return function(v10)
    return function(v11)
        local v12 = l_useNavigation_0();
        local v13 = if not v7() then v12.getParam(v6.EVENT_INGEST_SERVICE) else nil;
        local v14 = if not v7() then v12.getParam(v6.DIAG_SERVICE) else nil;
        local v15 = v12.getParam(v6.OPEN_PROFILE_PEEK_VIEW, l_Dash_0.noop);
        if v11.context then
            v13 = v11.context.eventIngestService;
            v14 = v11.context.diagService;
            v15 = v11.context.openProfilePeekView;
        end;
        local v17 = l_useSelector_0(function(v16)
            return v16.LocalUserId;
        end);
        local v18 = if not v11.context then v5.EntryPoints.HomePage else v5.EntryPoints.AddFriends;
        if not v7() then
            return l_React_0.createElement(v5.Context.Provider, {
                value = l_useMemo_0(function()
                    return {
                        fireAnalyticsEvent = v5.setupFireAnalyticsEvents({
                            diag = v14, 
                            eventStreamImpl = v13, 
                            defaultAnalyticsInfo = {
                                uid = v11.localUserId, 
                                entry = if not v11.context then v5.EntryPoints.HomePage else v5.EntryPoints.AddFriends
                            }
                        }), 
                        entryPoint = v18, 
                        diagService = v14, 
                        eventIngestService = v13, 
                        openProfilePeekView = v15
                    };
                end, {
                    v14, 
                    v13, 
                    v17, 
                    v15
                })
            }, {
                l_React_0.createElement(v10, v11)
            });
        else
            return l_React_0.createElement(v5.Context.Provider, {
                value = {
                    fireAnalyticsEvent = v5.setupFireAnalyticsEvents({
                        analytics = v5.AnalyticsService, 
                        defaultAnalyticsInfo = {
                            uid = v17, 
                            entry = if not v11.context then v5.EntryPoints.HomePage else v5.EntryPoints.AddFriends
                        }
                    }), 
                    entryPoint = v18, 
                    diagService = v14, 
                    eventIngestService = v13, 
                    openProfilePeekView = v15
                }
            }, {
                l_React_0.createElement(v10, v11)
            });
        end;
    end;
end;
