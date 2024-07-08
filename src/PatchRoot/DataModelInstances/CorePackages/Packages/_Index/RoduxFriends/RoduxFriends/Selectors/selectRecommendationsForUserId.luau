local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.getDeepValue);
local _ = require(l_Parent_0.roduxFriendsTypes);
local v3 = require(script.Parent.filterByKeys);
return function(v4)
    local l_keyPath_0 = v4.keyPath;
    return function(v6)
        return function(v7, v8)
            local v9 = v1(v6, string.format("%s.recommendations.byUserId.%s", l_keyPath_0, v7 or "")) or {};
            if not v8 then
                return v9;
            else
                return (v3(v8, v9));
            end;
        end;
    end;
end;
