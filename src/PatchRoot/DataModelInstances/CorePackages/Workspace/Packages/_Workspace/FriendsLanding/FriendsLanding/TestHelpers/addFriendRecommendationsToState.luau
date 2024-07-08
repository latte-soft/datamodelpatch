local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_getDeepValue_0 = v1.SocialLibraries.Dictionary.getDeepValue;
local l_RecommendationSourceEnum_0 = v1.SocialCommon.Enums.RecommendationSourceEnum;
local l_RODUX_KEY_0 = require(l_script_FirstAncestor_0.Common.Constants).RODUX_KEY;
return function(v5)
    local v6 = l_getDeepValue_0(v5, string.format("%s.Friends.recommendations.byUserId.%s", l_RODUX_KEY_0, "test")) or {};
    local v7 = {};
    for v8, _ in pairs(v6) do
        v7[v8] = true;
    end;
    v5[l_RODUX_KEY_0].Friends.recommendations.bySource = {
        [l_RecommendationSourceEnum_0.AddFriendsPage] = v7
    };
end;
