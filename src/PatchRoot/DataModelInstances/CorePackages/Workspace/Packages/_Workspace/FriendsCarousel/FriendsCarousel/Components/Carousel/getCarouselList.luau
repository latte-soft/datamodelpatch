local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_llama_0 = v1.llama;
local l_memoize_0 = v1.memoize;
local _ = require(l_Parent_0.Common.LocalTypes);
local v5 = require(script.Parent.splitSortedFriendsByPresence);
local v6 = game:DefineFastFlag("FriendCarouselGetCarouseListSorting", false);
local v12 = l_memoize_0(function(v7, v8, v9)
    v9 = v9 or "allFriendsThenRecommendations";
    if #v8 == 0 then
        return v7;
    elseif v9 == "onlineFriendsThenRecommendationsThenOfflineFriends" then
        local v10, v11 = v5(v7);
        return l_llama_0.List.join(v10, v8, v11);
    else
        return l_llama_0.List.join(v7, v8);
    end;
end);
local v15 = l_memoize_0(function(v13, v14)
    if #v14 == 0 then
        return v13;
    else
        return l_llama_0.List.join(v13, v14);
    end;
end);
if not v6 then
    return v15;
else
    return v12;
end;
