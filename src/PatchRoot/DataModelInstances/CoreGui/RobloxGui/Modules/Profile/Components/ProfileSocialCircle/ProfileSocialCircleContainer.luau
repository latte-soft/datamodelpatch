local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_Roact_0 = v1.Roact;
local l_t_0 = v1.t;
local v4 = require(script.Parent.ProfileSocialCircle);
local v5 = require(l_Parent_0.ProfileContext);
local v6 = require(l_Parent_0.Common.ContextPropsTypes);
local l_RoactRodux_0 = v1.RoactRodux;
local l_SocialLibraries_0 = v1.SocialLibraries;
local l_compose_0 = l_SocialLibraries_0.RoduxTools.compose;
local l_getDeepValue_0 = l_SocialLibraries_0.Dictionary.getDeepValue;
local v11 = require(l_Parent_0.Analytics);
local v12 = l_Roact_0.PureComponent:extend("ProfileSocialCircleContainer");
local function v16(v13, v14)
    local v15 = v14.profileUserId or "";
    return {
        friendsCount = l_getDeepValue_0(v13, string.format("Profile.FriendsCount.%s", v15)) or 0, 
        followersCount = l_getDeepValue_0(v13, string.format("Profile.FollowersCount.%s", v15)) or 0, 
        followingsCount = l_getDeepValue_0(v13, string.format("Profile.FollowingsCount.%s", v15)) or 0
    };
end;
v12.validateProps = l_t_0.strictInterface({
    profileUserId = l_t_0.string, 
    localUserId = l_t_0.string, 
    friendsCount = l_t_0.number, 
    followersCount = l_t_0.number, 
    followingsCount = l_t_0.number, 
    analytics = l_t_0.table, 
    layoutOrder = l_t_0.optional(l_t_0.number), 
    navigateToLuaAppPages = v6.validateNavigateToLuaAppPages
});
v12.render = function(v17)
    local l_props_0 = v17.props;
    return l_Roact_0.createElement(v4, {
        friendsCount = l_props_0.friendsCount, 
        followersCount = l_props_0.followersCount, 
        followingsCount = l_props_0.followingsCount, 
        navigateToLuaAppPages = l_props_0.navigateToLuaAppPages, 
        localUserId = l_props_0.localUserId, 
        profileUserId = l_props_0.profileUserId, 
        layoutOrder = l_props_0.layoutOrder, 
        analytics = l_props_0.analytics
    });
end;
return {
    Container = l_compose_0(l_RoactRodux_0.connect(v16, nil), v5.connect(function(v19)
        return {
            navigateToLuaAppPages = v19.navigateToLuaAppPages, 
            localUserId = v19.localUserId
        };
    end), v11.connect(function(v20)
        return {
            analytics = v20
        };
    end))(v12), 
    mapStateToProps = v16
};
