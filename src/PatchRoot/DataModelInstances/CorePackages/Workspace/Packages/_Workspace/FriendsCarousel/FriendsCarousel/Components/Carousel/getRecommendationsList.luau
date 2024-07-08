local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_llama_0 = v1.llama;
local l_getDeepValue_0 = v1.SocialLibraries.Dictionary.getDeepValue;
local v4 = require(script.Parent.mapIdToUser);
local v5 = require(l_Parent_0.Utils.showRecommendations);
local _ = require(l_Parent_0.Common.LocalTypes);
local l_RecommendationSourceEnum_0 = v1.SocialCommon.Enums.RecommendationSourceEnum;
local function v10(v8, v9)
    return v8.rank < v9.rank;
end;
return function(v11, v12, v13)
    local v14 = tostring(v11.LocalUserId);
    local v15 = l_getDeepValue_0(v11, string.format("%s.Friends.countsByUserId.%s", v12, v14)) or 0;
    local v16 = l_getDeepValue_0(v11, string.format("%s.Friends.recommendations.byUserId.%s", v12, v14)) or {};
    local v17 = l_getDeepValue_0(v11, string.format("%s.Friends.friendshipStatus", v12)) or {};
    local v18 = l_llama_0.Dictionary.keys(v16);
    local v19 = l_getDeepValue_0(v11, string.format("%s.Friends.recommendations.bySource.%s", v12, l_RecommendationSourceEnum_0.HomepageFriendsCarousel)) or {};
    v18 = l_llama_0.List.filter(v18, function(v20)
        return v19[v20];
    end);
    local function v24(v21)
        local v22 = v16[v21];
        local v23 = v17[v21];
        return l_llama_0.Dictionary.join(v4(v11, v12, v13)(v21), v22, {
            isFriendWithUser = not not v23 and v23 == Enum.FriendStatus.Friend, 
            hasPendingFriendRequest = not not v23 and v23 == Enum.FriendStatus.FriendRequestSent, 
            canSendFriendRequest = not v23 and true or v23 == Enum.FriendStatus.NotFriend, 
            hasIncomingFriendRequest = l_getDeepValue_0(v11, string.format("%s.Friends.recommendations.hasIncomingFriendRequest.%s", v12, v21))
        });
    end;
    if v5(v15) then
        return l_llama_0.List.sort(l_llama_0.List.map(v18, v24), v10);
    else
        return {};
    end;
end;
