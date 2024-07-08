local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.RoactRodux);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v5 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v6 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local l_AppPrefetch_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppPrefetch;
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local v9 = require(l_Modules_0.LuaApp.Components.LoadingBar);
local v10 = require(l_Modules_0.LuaApp.Constants);
local v11 = require(l_Modules_0.LuaApp.Thunks.Authentication.LaunchApp);
local v12 = require(l_Modules_0.Luobu.Thunks.LaunchLuobuApp);
local l_AppLogging_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppLogging;
local l_AppStartupSequenceTag_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppStartupSequenceTag;
local l_AppOmniRecommendationsRequest_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppOmniRecommendationsRequest;
local v16 = require(l_Modules_0.LuaApp.Enum.LoginStatus);
local v17 = require(l_Modules_0.LuaApp.FlagSettings);
local v18 = require(l_Modules_0.LuaApp.Enum.LaunchContext);
local l_IsPrefetchOneCopyEnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).IsPrefetchOneCopyEnabled;
local v20 = v2.PureComponent:extend("StartupPage");
v20.didMount = function(v21)
    local l_networking_0 = v21.props.networking;
    local l_analytics_0 = v21.props.analytics;
    local l_appPolicy_0 = v21.props.appPolicy;
    local l_loggingProtocol_0 = v21.props.loggingProtocol;
    local l_prefetchProtocol_0 = v21.props.prefetchProtocol;
    if v21.props.authStatus == v16.UNKNOWN then
        v21.props.launchApp(l_networking_0, v21.props.omniRecommendationsRequest, l_analytics_0, l_appPolicy_0, l_loggingProtocol_0, v21.props.appStartupSequence, l_prefetchProtocol_0);
    end;
    v21.props.loggingProtocol:logEventOnce("startup_page_did_mount");
end;
v20.render = function(_)
    return v2.createElement("Frame", {
        [v2.Tag] = "app-screen.startup", 
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundColor3 = v10.Color.GRAY4, 
        ZIndex = 1
    }, {
        LoadingBar = v2.createElement(v9)
    });
end;
return (l_RoactAppPolicy_0.connect(function(v28, _)
    return {
        appPolicy = v28
    };
end)((l_RoactServices_0.connect({
    networking = v5, 
    analytics = v6, 
    loggingProtocol = l_AppLogging_0, 
    appStartupSequence = l_AppStartupSequenceTag_0, 
    prefetchProtocol = l_AppPrefetch_0, 
    omniRecommendationsRequest = if not l_IsPrefetchOneCopyEnabled_0() then nil else l_AppOmniRecommendationsRequest_0
})((v3.connect(function(v30, _)
    local v32 = v30.Navigation.history[#v30.Navigation.history];
    return {
        authStatus = v30.AuthenticationStatus.status, 
        currentPageName = v32[#v32].name
    };
end, function(v33)
    return {
        launchApp = function(v34, v35, v36, v37, v38, v39, v40)
            if not v17.LuaAuthEnabledForLuobu() or not v37.useLuobuAuthentication() then
                v33(v11(v34, v35, v36, v37, v18.Startup, v38, v39, v40));
                return ;
            else
                v33(v12(v34, v36, v37, v18.Startup));
                return ;
            end;
        end
    };
end)(v20))))));
