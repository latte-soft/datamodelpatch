local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_CorePackages_0.Roact);
local v5 = require(l_CorePackages_0.RoactRodux);
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local l_ShareGame_0 = l_Modules_0.Settings.Pages.ShareGame;
local v8 = require(l_ShareGame_0.Constants);
local l_AppFeaturePolicies_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).AppFeaturePolicies;
local l_EventStream_0 = require(l_CorePackages_0.Workspace.Packages.Analytics).AnalyticsReporters.EventStream;
local v11 = require(l_ShareGame_0.Components.LayoutProvider);
local v12 = require(l_ShareGame_0.Components.ShareGameContainer);
local v13 = require(l_Modules_0.Settings.Flags.FFlagShareExperienceInviteLinkPolicy);
local v14 = v4.PureComponent:extend("App");
local function v16(v15)
    if not v13 then
        return v4.createElement(v11, nil, v15);
    else
        return v4.createElement(v11, nil, {
            PolicyProvider = v4.createElement(l_RoactAppPolicy_0.Provider, {
                policy = {
                    l_AppFeaturePolicies_0
                }
            }, v15)
        });
    end;
end;
v14.render = function(v17)
    local l_analytics_0 = v17.props.analytics;
    local l_pageTarget_0 = v17.props.pageTarget;
    local v20 = nil;
    if v17.props.isPageOpen then
        v20 = v4.createElement(v12, {
            analytics = l_analytics_0, 
            zIndex = v8.SHARE_GAME_Z_INDEX
        });
    end;
    return v16({
        v4.createElement(v4.Portal, {
            target = l_pageTarget_0
        }, {
            ShareGamePageFrame = v20
        })
    });
end;
v14.didMount = function(v21)
    v21.eventStream = l_EventStream_0.new(l_RbxAnalyticsService_0);
end;
v14.willUnmount = function(v22)
    v22.eventStream:releaseRBXEventStream();
end;
return v5.UNSTABLE_connect2(function(v23, _)
    return {
        isPageOpen = v23.Page.IsOpen
    };
end)(v14);
