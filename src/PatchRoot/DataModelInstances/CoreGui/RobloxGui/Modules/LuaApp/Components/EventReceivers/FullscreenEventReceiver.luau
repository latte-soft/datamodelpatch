local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Roact);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v4 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local l_AppUserGameSettings_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppUserGameSettings;
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local v7 = require(l_Modules_0.Common.RoactUtilities.ExternalEventConnection);
local v8 = require(l_Modules_0.LuaApp.Components.ExitFullscreenToast);
local v9 = v2.PureComponent:extend("FullscreenEventReceiver");
v9.init = function(v10)
    v10:setState({
        fullscreenEnabled = v10.props.appUserGameSettings:InFullScreen()
    });
    v10.onFullscreenChanged = function(v11)
        v10:setState({
            fullscreenEnabled = v11
        });
    end;
end;
v9.sendAnalytics = function(v12)
    v12.props.analytics.EventStream:setRBXEventStream("LuaApp", "FullscreenMode", {
        enabled = v12.state.fullscreenEnabled
    });
end;
v9.render = function(v13)
    if not v13.props.policyExitFullscreenToast then
        return v2.createElement(v7, {
            event = v13.props.appUserGameSettings.FullscreenChanged, 
            callback = v13.onFullscreenChanged
        });
    else
        return v2.createFragment({
            EventConnector = v2.createElement(v7, {
                event = v13.props.appUserGameSettings.FullscreenChanged, 
                callback = v13.onFullscreenChanged
            }), 
            ExitFullscreenToast = v13.state.fullscreenEnabled and v2.createElement(v8)
        });
    end;
end;
v9.didMount = function(v14)
    v14:sendAnalytics();
end;
v9.didUpdate = function(v15, _, v17)
    if v17.fullscreenEnabled ~= v15.state.fullscreenEnabled then
        v15:sendAnalytics();
    end;
end;
return (l_RoactAppPolicy_0.connect(function(v18, _)
    return {
        policyExitFullscreenToast = v18.getShowExitFullscreenToast()
    };
end)((l_RoactServices_0.connect({
    analytics = v4, 
    appUserGameSettings = l_AppUserGameSettings_0
})(v9))));
