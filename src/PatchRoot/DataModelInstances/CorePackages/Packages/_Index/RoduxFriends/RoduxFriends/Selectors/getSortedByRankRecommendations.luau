local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Parent.llama);
local _ = require(l_Parent_0.roduxFriendsTypes);
local v3 = require(l_Parent_0.getDeepValue);
local function v6(v4, v5)
    return v4.rank < v5.rank;
end;
return function(v7)
    local l_keyPath_0 = v7.keyPath;
    return function(v9, v10)
        return v1.List.sort(v1.Dictionary.values(v3(v9, string.format("%s.recommendations.byUserId.%s", l_keyPath_0, v10)) or {}), v6);
    end;
end;
