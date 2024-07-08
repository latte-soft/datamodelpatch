local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_llama_0 = v1.llama;
local l_RoduxFriends_0 = v1.RoduxFriends;
local l_RODUX_KEY_0 = require(l_script_FirstAncestor_0.Common.Constants).RODUX_KEY;
local l_getDeepValue_0 = v1.SocialLibraries.Dictionary.getDeepValue;
local l_RecommendationSourceEnum_0 = v1.SocialCommon.Enums.RecommendationSourceEnum;
return function(v7)
    local l_LocalUserId_0 = v7.LocalUserId;
    return (l_llama_0.List.map(l_RoduxFriends_0.Selectors.getSortedByRankRecommendationIds(v7)(l_LocalUserId_0, (l_RoduxFriends_0.Selectors.getRecommendationIdsBySource(v7)(l_RecommendationSourceEnum_0.AddFriendsPage))), function(v9)
        return (l_llama_0.Dictionary.join(l_getDeepValue_0(v7, string.format("%s.Users.byUserId.%s", l_RODUX_KEY_0, v9)), l_getDeepValue_0(v7, string.format("%s.Friends.recommendations.byUserId.%s.%s", l_RODUX_KEY_0, l_LocalUserId_0, v9)), {
            isRecommendation = true
        }));
    end));
end;
