local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_Roact_0 = v1.Roact;
local l_t_0 = v1.t;
local l_RoactRodux_0 = v1.RoactRodux;
local l_SocialLibraries_0 = v1.SocialLibraries;
local l_compose_0 = l_SocialLibraries_0.RoduxTools.compose;
local l_NetworkingGames_0 = v1.NetworkingGames;
local l_getDeepValue_0 = l_SocialLibraries_0.Dictionary.getDeepValue;
local v9 = require(l_Parent_0.ProfileContext);
local _ = require(l_Parent_0.Common.ContextPropsTypes);
local v11 = require(l_Parent_0.Common.ProfileTypes);
local v12 = require(script.Parent.ProfileNonFriendContextualInfo);
local v13 = l_Roact_0.PureComponent:extend("ProfileNonFriendContextualInfoContainer");
v13.validateProps = l_t_0.strictInterface({
    layoutOrder = l_t_0.optional(l_t_0.number), 
    profileUserId = l_t_0.string, 
    isUserDeleted = l_t_0.optional(l_t_0.boolean), 
    amIFollowingUser = l_t_0.optional(l_t_0.boolean), 
    isUserFollowingMe = l_t_0.optional(l_t_0.boolean), 
    experienceName = l_t_0.optional(l_t_0.string), 
    sourceUniverseId = l_t_0.optional(l_t_0.number), 
    getExperiencesDetails = l_t_0.callback, 
    profileType = v11.validateProfileType, 
    isRecommendation = l_t_0.optional(l_t_0.boolean), 
    recommendationContextType = l_t_0.optional(l_t_0.string), 
    mutualFriendsCount = l_t_0.optional(l_t_0.number), 
    friendshipOriginSourceType = l_t_0.optional(l_t_0.string), 
    contextualInfoDisplay = l_t_0.optional(l_t_0.table)
});
v13.render = function(v14)
    local l_props_0 = v14.props;
    return l_Roact_0.createElement(v12, {
        layoutOrder = l_props_0.layoutOrder, 
        isUserDeleted = l_props_0.isUserDeleted, 
        amIFollowingUser = l_props_0.amIFollowingUser, 
        isUserFollowingMe = l_props_0.isUserFollowingMe, 
        experienceName = l_props_0.experienceName, 
        sourceUniverseId = l_props_0.sourceUniverseId, 
        getExperiencesDetails = l_props_0.getExperiencesDetails, 
        profileType = l_props_0.profileType, 
        isRecommendation = l_props_0.isRecommendation, 
        recommendationContextType = l_props_0.recommendationContextType, 
        mutualFriendsCount = l_props_0.mutualFriendsCount, 
        friendshipOriginSourceType = l_props_0.friendshipOriginSourceType, 
        contextualInfoDisplay = l_props_0.contextualInfoDisplay
    });
end;
local function v24(v16, v17)
    local v18 = v17.profileUserId or "";
    local v19 = l_getDeepValue_0(v16, "Profile.FollowingStatus") or {};
    local v20 = (l_getDeepValue_0(v16, "Profile.Friends.requests.sourceUniverseIds") or {})[v18];
    local v21 = l_getDeepValue_0(v16, string.format("Profile.Games.byGameId.%s.name", (tostring(v20))));
    local v22 = nil;
    local v23 = nil;
    if not v19[v18] then
        v22 = nil;
        v23 = nil;
    else
        v22 = v19[v18].isFollowing;
        v23 = v19[v18].isFollowed;
    end;
    return {
        sourceUniverseId = v20, 
        experienceName = v21, 
        isUserFollowingMe = v23, 
        isUserDeleted = l_getDeepValue_0(v16, string.format("Profile.AdditionalUserFields.%s.isDeleted", v18)), 
        amIFollowingUser = v22, 
        friendshipOriginSourceType = l_getDeepValue_0(v16, string.format("Profile.Friends.requests.originSourceType.%s", v18))
    };
end;
local function v27(v25)
    return {
        getExperiencesDetails = function(v26)
            if v26 ~= nil and v26 ~= 0 then
                return v25(l_NetworkingGames_0.GetExperiencesDetails.API({
                    (tostring(v26))
                }));
            else
                return ;
            end;
        end
    };
end;
return {
    Container = l_compose_0(l_RoactRodux_0.connect(v24, v27), v9.connect(function(v28)
        return {
            profileType = v28.profileType, 
            isRecommendation = v28.navigationParams and v28.navigationParams.isRecommendation, 
            recommendationContextType = v28.navigationParams and v28.navigationParams.recommendationContextType, 
            mutualFriendsCount = v28.navigationParams and v28.navigationParams.mutualFriendsCount, 
            contextualInfoDisplay = v28.navigationParams and v28.navigationParams.contextualInfoDisplay
        };
    end))(v13), 
    mapStateToProps = v24, 
    mapDispatchToProps = v27
};
