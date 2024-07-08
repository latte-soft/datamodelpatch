local v0 = require(script:FindFirstAncestor("FriendsCarousel").dependencies);
local l_NetworkingFriends_0 = v0.NetworkingFriends;
local l_RoduxFriends_0 = v0.RoduxFriends;
local l_llama_0 = v0.llama;
local l_RecommendationSourceEnum_0 = v0.SocialCommon.Enums.RecommendationSourceEnum;
return function()
    return {
        [l_NetworkingFriends_0.GetFriendRecommendationsFromUserId.Succeeded.name] = function(v5)
            return {
                v5, 
                (l_RoduxFriends_0.Actions.RecommendationSourceCreated({
                    source = l_RecommendationSourceEnum_0.HomepageFriendsCarousel, 
                    recommendationIds = l_llama_0.List.map(v5.responseBody.data or {}, function(v6)
                        return v6.id;
                    end)
                }))
            };
        end
    };
end;
