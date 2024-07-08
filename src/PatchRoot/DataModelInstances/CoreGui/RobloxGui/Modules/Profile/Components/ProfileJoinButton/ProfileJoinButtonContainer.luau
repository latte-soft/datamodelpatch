local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_Roact_0 = v1.Roact;
local l_SocialLibraries_0 = v1.SocialLibraries;
local l_RoactRodux_0 = v1.RoactRodux;
local _ = require(l_Parent_0.Common.ContextPropsTypes);
local v6 = require(l_Parent_0.ProfileContext);
local l_compose_0 = l_SocialLibraries_0.RoduxTools.compose;
local v8 = require(script.Parent.profileJoinButtonMapDispatchToProps);
local v9 = require(script.Parent.profileJoinButtonMapStateToProps);
local v10 = require(script.Parent.ProfileJoinButton);
return l_compose_0(v6.connect(function(v11)
    return {
        profileUserId = v11 and v11.profileUserId, 
        navigateToLuaAppPages = v11 and v11.navigateToLuaAppPages, 
        navigationParams = v11.navigationParams
    };
end), l_RoactRodux_0.connect(v9, v8), require(l_Parent_0.Analytics).connect(function(v12)
    return {
        analytics = v12
    };
end))(function(v13)
    return l_Roact_0.createElement(v10, v13);
end);
