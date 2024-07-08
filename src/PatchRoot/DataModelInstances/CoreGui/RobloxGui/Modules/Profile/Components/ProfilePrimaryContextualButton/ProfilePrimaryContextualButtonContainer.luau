local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_React_0 = v1.React;
local v3 = require(l_Parent_0.ProfileContext);
local _ = require(l_Parent_0.Common.ContextPropsTypes);
local l_RoactRodux_0 = v1.RoactRodux;
local l_compose_0 = v1.SocialLibraries.RoduxTools.compose;
local v7 = require(l_Parent_0.Analytics);
local v8 = require(script.Parent.profilePrimaryContextualButtonMapDispatchToProps);
local v9 = require(script.Parent.profilePrimaryContextualButtonMapStateToProps);
local v10 = require(l_Parent_0.Utils.isLocalUser);
local v11 = require(script.Parent.ProfilePrimaryContextualButton);
return l_compose_0(v3.connect(function(v12)
    return {
        isLocalUser = v10(v12), 
        profileUserId = v12.profileUserId, 
        localUserId = v12.localUserId, 
        navigateToLuaAppPages = v12.navigateToLuaAppPages, 
        navigationParams = v12.navigationParams, 
        profileType = v12.profileType, 
        contactProps = v12.contactProps, 
        resetProfileType = v12.resetProfileType
    };
end), l_RoactRodux_0.connect(v9, v8), v7.connect(function(v13)
    return {
        analytics = v13
    };
end))(function(v14)
    return l_React_0.createElement(v11, v14);
end);
