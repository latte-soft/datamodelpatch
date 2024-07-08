local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_getDeepValue_0 = v1.SocialLibraries.Dictionary.getDeepValue;
local l_RecommendationSourceEnum_0 = v1.SocialCommon.Enums.RecommendationSourceEnum;
local l_RODUX_KEY_0 = require(l_Parent_0.Common.Constants).RODUX_KEY;
local l_HomepageFriendsCarousel_0 = l_RecommendationSourceEnum_0.HomepageFriendsCarousel;
return function(v6)
    local v7 = l_getDeepValue_0(v6, string.format("%s.Friends.recommendations.byUserId.%s", l_RODUX_KEY_0, "test")) or {};
    local v8 = {};
    for v9, _ in pairs(v7) do
        v8[v9] = true;
    end;
    v6[l_RODUX_KEY_0].Friends.recommendations.bySource = {
        [l_HomepageFriendsCarousel_0] = v8
    };
end;
