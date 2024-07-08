local _ = script:FindFirstAncestor("Modules");
local v1 = require(script.Parent.SocialTabLoader);
local l_CorePackages_0 = game:GetService("CorePackages");
local v3 = require(l_CorePackages_0.Roact);
return require(l_CorePackages_0.LuaSocialLibrariesDeps).SocialLibraries.config({}).RoduxTools.compose(require(l_CorePackages_0.RoactRodux).connect(require(script.Parent.mapStateToProps), (require(script.Parent.mapDispatchToProps))), require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy.connect(function(v4, _)
    return {
        showUserAlias = v4.getShowAlias()
    };
end))(function(v6)
    return v3.createElement(v1, v6);
end);
