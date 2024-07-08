local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_Roact_0 = v1.Roact;
local l_UIBlox_0 = v1.UIBlox;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local l_withStyle_0 = l_UIBlox_0.Style.withStyle;
local l_t_0 = v1.t;
local l_PlayerContext_0 = l_UIBlox_0.App.Indicator.PlayerContext;
local l_withLocalization_0 = v1.withLocalization;
local v9 = require(l_Parent_0.Common.TextKeys);
local v10 = require(l_Parent_0.Common.ProfileTypes);
local l_RecommendationContextType_0 = v1.RoduxFriends.Enums.RecommendationContextType;
local l_FriendshipOriginSourceType_0 = v1.NetworkingFriendsEnums.FriendshipOriginSourceType;
local l_getMutualFriendsText_0 = v1.SocialCommon.Utils.getMutualFriendsText;
local _ = require(game:GetService("CorePackages").Packages.React);
local v15 = UDim2.fromOffset(12, 12);
local v16 = l_Roact_0.PureComponent:extend("ProfileNonFriendContextualInfo");
v16.validateProps = l_t_0.strictInterface({
    layoutOrder = l_t_0.optional(l_t_0.number), 
    isUserDeleted = l_t_0.optional(l_t_0.boolean), 
    amIFollowingUser = l_t_0.optional(l_t_0.boolean), 
    isUserFollowingMe = l_t_0.optional(l_t_0.boolean), 
    experienceName = l_t_0.optional(l_t_0.string), 
    sourceUniverseId = l_t_0.optional(l_t_0.number), 
    getExperiencesDetails = l_t_0.callback, 
    profileType = v10.validateProfileType, 
    isRecommendation = l_t_0.optional(l_t_0.boolean), 
    recommendationContextType = l_t_0.optional(l_t_0.string), 
    mutualFriendsCount = l_t_0.optional(l_t_0.number), 
    friendshipOriginSourceType = l_t_0.optional(l_t_0.string), 
    contextualInfoDisplay = l_t_0.optional(l_t_0.table)
});
v16.init = function(v17)
    v17.getRecommendationText = function(v18)
        if v17.props.recommendationContextType == l_RecommendationContextType_0.MutualFriends.rawValue() and v17.props.mutualFriendsCount > 0 then
            return l_getMutualFriendsText_0({
                mutualFriendsCount = v17.props.mutualFriendsCount, 
                localized = {
                    mutualFriends = v18.mutualFriends, 
                    singularMutualFriend = v18.singularMutualFriend
                }
            });
        elseif v17.props.recommendationContextType == l_RecommendationContextType_0.Frequents.rawValue() then
            return v18.playedTogether;
        else
            return nil;
        end;
    end;
    v17.getTextAndIcon = function(v19)
        local l_props_0 = v17.props;
        local l_experienceName_0 = l_props_0.experienceName;
        if not l_props_0.contextualInfoDisplay then
            if not l_props_0.isUserDeleted then
                if l_props_0.profileType == v10.OffNetworkFriendRequest then
                    return v19.invitedMeToRoblox, nil;
                elseif l_props_0.friendshipOriginSourceType == l_FriendshipOriginSourceType_0.QrCode.rawValue() then
                    return v19.fromQRCode, nil;
                elseif l_experienceName_0 and l_experienceName_0 ~= "" then
                    return v19.friendRequestSentFrom, nil;
                elseif not l_props_0.amIFollowingUser then
                    if not l_props_0.isUserFollowingMe then
                        if not l_props_0.isRecommendation then
                            return nil, nil;
                        elseif not (not (l_props_0.recommendationContextType == l_RecommendationContextType_0.MutualFriends.rawValue()) or not l_props_0.mutualFriendsCount) and l_props_0.mutualFriendsCount > 0 then
                            return v17.getRecommendationText(v19), l_Images_0["icons/status/player/friend"];
                        else
                            return v17.getRecommendationText(v19), nil;
                        end;
                    else
                        return v19.userFollowingMe, l_Images_0["icons/status/player/following"];
                    end;
                else
                    return v19.iAmFollowingUser, l_Images_0["icons/status/player/following"];
                end;
            else
                return v19.accountDeletedText, nil;
            end;
        else
            return l_props_0.contextualInfoDisplay.text, l_props_0.contextualInfoDisplay.icon;
        end;
    end;
end;
v16.didMount = function(v22)
    local l_props_1 = v22.props;
    l_props_1.getExperiencesDetails(l_props_1.sourceUniverseId);
end;
v16.render = function(v24)
    local l_props_2 = v24.props;
    return l_withStyle_0(function(v26)
        return l_withLocalization_0({
            accountDeletedText = v9.AccountDeleted, 
            youAreFollowing = v9.YouAreFollowing, 
            followsYou = v9.FollowsYou, 
            friendRequestSentFrom = {
                v9.SentFromWithContext; 
                gameName = l_props_2.experienceName
            }, 
            mutualFriends = v9.MutualFriends, 
            singularMutualFriend = v9.SingularMutualFriend, 
            playedTogether = v9.PlayedTogether, 
            invitedYouToRoblox = v9.FriendInvite, 
            fromQRCode = v9.FromQRCode
        })(function(v27)
            local v28 = nil;
            local v29 = nil;
            local v30, v31 = v24.getTextAndIcon({
                iAmFollowingUser = v27.youAreFollowing, 
                userFollowingMe = v27.followsYou, 
                friendRequestSentFrom = v27.friendRequestSentFrom, 
                accountDeletedText = v27.accountDeletedText, 
                invitedMeToRoblox = v27.invitedYouToRoblox, 
                mutualFriends = v27.mutualFriends, 
                singularMutualFriend = v27.singularMutualFriend, 
                playedTogether = v27.playedTogether, 
                fromQRCode = v27.fromQRCode
            });
            v28 = v30;
            v29 = v31;
            if v28 then
                return l_Roact_0.createElement("Frame", {
                    Position = UDim2.new(0, 0, 0, 0), 
                    Size = UDim2.new(1, 0, 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    LayoutOrder = l_props_2.layoutOrder
                }, {
                    PlayerContext = l_Roact_0.createElement(l_PlayerContext_0, {
                        icon = v29, 
                        iconSize = not not v29 and v15 or nil, 
                        text = v28, 
                        fontStyle = v26.Font.CaptionBody
                    })
                });
            else
                return nil;
            end;
        end);
    end);
end;
return v16;
