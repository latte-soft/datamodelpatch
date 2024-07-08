local l_script_FirstAncestor_0 = script:FindFirstAncestor("Modules");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(script.Parent.SocialTabUniversalAppWrapper);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_AppGuiService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppGuiService;
local l_AppNotificationService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppNotificationService;
local l_AppUserInputService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppUserInputService;
local v7 = require(l_script_FirstAncestor_0.LuaApp.Services.RoactAnalyticsAppStageLoaded);
local _ = require(l_script_FirstAncestor_0.LuaApp.Experiment.RoactAppExperiment);
local _ = require(l_script_FirstAncestor_0.LuaApp.Experiment.AppUserLayers);
local v10 = require(l_script_FirstAncestor_0.LuaApp.Services.RoactAnalytics);
local v11 = require(l_script_FirstAncestor_0.LuaApp.Services.AppEventIngestService);
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.useNavigation;
local l_useEarlyIsFocused_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.useEarlyIsFocused;
local l_useNavigationProps_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppNavigation).useNavigationProps;
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local l_useUiModeInfo_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useUiModeInfo;
local l_UiMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).UiMode;
local l_EnumScreens_0 = require(l_CorePackages_0.Workspace.Packages.SocialTab).EnumScreens;
local v19 = require(l_CorePackages_0.Roact);
local v20 = require(l_CorePackages_0.Cryo);
local v21 = require(l_CorePackages_0.RoactRodux);
local l_compose_0 = require(l_CorePackages_0.LuaSocialLibrariesDeps).SocialLibraries.config({}).RoduxTools.compose;
local v23 = require(script.Parent.mapStateToProps);
local v24 = require(script.Parent.mapDispatchToProps);
local v25 = game:DefineFastFlag("SocialTabInitialRouteNameFix", false);
return (l_compose_0(v21.connect(v23, v24), l_RoactServices_0.connect({
    analytics = v7, 
    guiService = l_AppGuiService_0, 
    notificationService = l_AppNotificationService_0, 
    userInputService = l_AppUserInputService_0, 
    roactAnalytics = v10, 
    eventIngestService = v11
}))(function(v26)
    local v28 = {
        isVisible = l_useEarlyIsFocused_0(), 
        parameters = l_useNavigationProps_0(function(v27)
            if not v27 then
                return nil;
            else
                return {
                    conversationId = v27
                };
            end;
        end), 
        pageType = l_useNavigation_0().state.routeName
    };
    local v29 = l_useDesignTokens_0();
    local v30 = l_useUiModeInfo_0().uiMode == l_UiMode_0.TenFoot;
    v28.BackgroundColor = v29.LuaApps.App.Page.BackgroundColor;
    v28.BackgroundTransparency = v29.LuaApps.App.Page.BackgroundTransparency;
    v28.useFullScalePage = v30;
    v28.initialRouteName = if not v30 then if v25 then nil else l_EnumScreens_0.SocialTab else l_EnumScreens_0.FriendsLanding;
    return v19.createElement(v2, v20.Dictionary.join(v26, v28));
end));
