local v0 = require(script.Parent.Parent.Parent.dependencies);
local l_RoduxFriends_0 = v0.RoduxFriends;
local l_llama_0 = v0.llama;
local v3 = require(script.Parent.filterOutPYMKRecommendations);
return function(v4)
    return function(v5)
        return l_llama_0.List.map(v3(l_RoduxFriends_0.Selectors.getSortedByRankRecommendations(v5, v4))(v5), function(v6, v7)
            return {
                id = v6.id, 
                absolutePosition = v7, 
                recommendationRank = v6.rank, 
                recommendationContextType = v6.contextType
            };
        end);
    end;
end;
