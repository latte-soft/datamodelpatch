local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_getDeepValue_0 = v1.SocialLibraries.Dictionary.getDeepValue;
local l_llama_0 = v1.llama;
local v4 = require(l_Parent_0.Common.Constants);
local _ = require(l_Parent_0.Common.ModelTypes);
local l_RecommendationSourceEnum_0 = v1.SocialCommon.Enums.RecommendationSourceEnum;
return function(v7)
    return function(v8)
        local v9 = l_getDeepValue_0(v8, string.format("%s.Friends.recommendations.bySource.%s", v4.RODUX_KEY, l_RecommendationSourceEnum_0.HomepagePYMKCarousel)) or {};
        return l_llama_0.List.filter(v7, function(v10)
            return v9[v10.id];
        end);
    end;
end;
