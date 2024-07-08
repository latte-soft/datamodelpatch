local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_0.getDeepValue);
local _ = require(l_Parent_0.roduxFriendsTypes);
local l_Object_0 = require(l_Parent_1.LuauPolyfill).Object;
return function(v5)
    local l_keyPath_0 = v5.keyPath;
    return function(v7)
        return function(v8)
            return l_Object_0.keys(v2(v7, string.format("%s.recommendations.bySource.%s", l_keyPath_0, v8 or "")) or {});
        end;
    end;
end;
