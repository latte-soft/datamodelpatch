local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.getDeepValue);
local _ = require(l_Parent_0.roduxFriendsTypes);
local v3 = require(script.Parent.filterByKeys);
return function(v4)
    local l_keyPath_0 = v4.keyPath;
    return function(v6)
        return function(v7)
            local v8 = v1(v6, string.format("%s.friendshipStatus", l_keyPath_0)) or {};
            if v7 then
                return v3(v7, v8);
            else
                return v8;
            end;
        end;
    end;
end;
