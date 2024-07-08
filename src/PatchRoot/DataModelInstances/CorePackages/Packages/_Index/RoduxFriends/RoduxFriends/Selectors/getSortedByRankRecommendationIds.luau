local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local _ = require(l_Parent_0.roduxFriendsTypes);
local v3 = require(script.Parent.selectRecommendationsForUserId);
local v4 = require(l_Parent_1.LuauPolyfill);
local l_Object_0 = v4.Object;
local l_Array_0 = v4.Array;
local function v9(v7, v8)
    return (v7.rank or 0) - (v8.rank or 0);
end;
return function(v10)
    return function(v11)
        return function(v12, v13)
            return l_Array_0.map(l_Array_0.sort(l_Object_0.values((v3(v10)(v11)(v12, v13))), v9), function(v14)
                return v14.id;
            end);
        end;
    end;
end;
