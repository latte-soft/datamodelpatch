local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialTab");
local v1 = require(l_script_FirstAncestor_0.ContextUtils.compose);
local v2 = require(l_script_FirstAncestor_0.Analytics);
local v3 = require(l_script_FirstAncestor_0.dependencies);
local l_Roact_0 = v3.Roact;
local l_t_0 = v3.t;
local l_RoactRodux_0 = v3.RoactRodux;
local l_UniversalAppPolicy_0 = v3.UniversalAppPolicy;
local v8 = require(script.mapStateToProps);
local v9 = require(script.mapDispatchToProps);
local v10 = require(l_script_FirstAncestor_0.SocialTabContext);
local v11 = require(script.Parent.FreezableUserCarousel);
local v12 = l_Roact_0.PureComponent:extend("UserCarouselContainer");
v12.defaultProps = {
    LayoutOrder = 0, 
    wideMode = false, 
    navigateToLuaAppPages = nil, 
    goToFriendsLanding = nil
};
v12.validateProps = l_t_0.interface({
    LayoutOrder = l_t_0.optional(l_t_0.number), 
    wideMode = l_t_0.boolean, 
    navigateToLuaAppPages = l_t_0.optional(l_t_0.table), 
    goToFriendsLanding = l_t_0.optional(l_t_0.callback)
});
v12.render = function(v13)
    return l_Roact_0.createElement(v11, v13.props);
end;
return v1(v10.connect(function(v14)
    return {
        isLuaProfilePageEnabled = v14.isLuaProfilePageEnabled
    };
end) or nil, l_RoactRodux_0.connect(v8, v9), v2.connect(function(v15)
    return {
        analytics = v15
    };
end), l_UniversalAppPolicy_0.connect(function(v16)
    return {
        enableDisplayNamePolicy = v16.getShowDisplayName(), 
        enableFriendFinder = v16.getFriendFinder(), 
        accountProviderName = v16.getAccountProviderName(), 
        inviteFromAccountProvider = v16.shouldInviteFromAccountProvider()
    };
end))(v12);
