local v0 = require(script:FindFirstAncestor("FriendsLanding").dependencies);
local l_llama_0 = v0.llama;
local l_t_0 = v0.t;
local l_RoduxPresence_0 = v0.RoduxPresence;
local l_SocialLibraries_0 = v0.SocialLibraries;
local l_getFFlagVerifiedBadgeInFriendsLanding_0 = v0.getFFlagVerifiedBadgeInFriendsLanding;
local l_getDeepValue_0 = l_SocialLibraries_0.Dictionary.getDeepValue;
local l_getRbxthumbWithTypeSizeAndOptions_0 = v0.getRbxthumbWithTypeSizeAndOptions;
local l_UserLibConstants_0 = v0.UserLibConstants;
return function(v9)
    return function(v10)
        assert(l_t_0.string(v10));
        local v11 = l_getDeepValue_0(v9, string.format("FriendsLanding.Friends.byUserId.%s", v10)) or {};
        local v12 = v9.FriendsLanding.DeletedUsers or nil;
        local v13 = if not l_getFFlagVerifiedBadgeInFriendsLanding_0() then nil else v9.FriendsLanding.VerifiedUsers;
        return l_llama_0.Dictionary.map(v11, function(v14)
            local _ = nil;
            return l_llama_0.Dictionary.join(l_getDeepValue_0(v9, string.format("FriendsLanding.Users.byUserId.%s", v14)), l_RoduxPresence_0.Selectors.getUserPresenceByUserId(v9, v14), {
                thumbnail = if not v9.isTest then l_getRbxthumbWithTypeSizeAndOptions_0(v14, l_UserLibConstants_0.RbxthumbTypes.Avatar, 352) else ""
            }, {
                isDeleted = v12 and v12[v14]
            }, {
                hasVerifiedBadge = if not l_getFFlagVerifiedBadgeInFriendsLanding_0() then nil else v13 and v13[v14]
            }, {
                isInactiveFriend = l_getDeepValue_0(v9, (("FriendsLanding.InactiveFriends.%*"):format(v14)))
            }, {
                friendRank = l_getDeepValue_0(v9, (("FriendsLanding.Friends.friendsRankByUserId.%*.%*"):format(v9.LocalUserId, v14)))
            });
        end);
    end;
end;
