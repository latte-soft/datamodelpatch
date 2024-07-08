local _ = script:FindFirstAncestor("Modules");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_AppNotificationService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppNotificationService;
local v6 = require(script.Parent.FriendsLandingUniversalAppWrapper);
return require(l_CorePackages_0.LuaSocialLibrariesDeps).SocialLibraries.config({}).RoduxTools.compose(v3.connect(require(script.Parent.mapStateToProps), (require(script.Parent.mapDispatchToProps))), l_RoactServices_0.connect({
    notificationService = l_AppNotificationService_0
}))(function(v7)
    return v2.createElement(v6, v7);
end);
