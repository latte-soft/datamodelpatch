local l_script_FirstAncestor_0 = script:FindFirstAncestor("Modules");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.RoactRodux);
local v4 = require(l_CorePackages_0.Cryo);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_AppNotificationService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppNotificationService;
local l_AppGame_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppGame;
local v8 = require(l_script_FirstAncestor_0.AvatarExperience.Catalog.Services.Analytics);
local v9 = require(l_script_FirstAncestor_0.LuaApp.Services.AppEventIngestService);
local l_AppSessionService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppSessionService;
local v11 = require(script.Parent.ProfileUniversalAppWrapper);
local v12 = require(script.Parent.mapStateToProps);
local v13 = require(script.Parent.mapDispatchToProps);
local l_compose_0 = require(l_CorePackages_0.LuaSocialLibrariesDeps).SocialLibraries.config({}).RoduxTools.compose;
local v15 = require(l_script_FirstAncestor_0.LuaApp.Flags.FullProfileViewIXP);
return l_compose_0(v3.connect(v12, v13), l_RoactServices_0.connect({
    catalogAnalytics = v8, 
    notificationService = l_AppNotificationService_0, 
    game = l_AppGame_0, 
    eventIngestService = v9, 
    sessionService = l_AppSessionService_0
}))(function(v16)
    if v15.GetFFlagFullProfileViewIXPSetupEnabled() then
        v16 = v4.Dictionary.join(v16, {
            showFullProfileView = v15.useIsFeatureActive()
        });
    end;
    return v2.createElement(v11, v16);
end);
