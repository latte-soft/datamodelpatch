local l_Parent_0 = script.Parent.Parent;
local v1 = require(script:FindFirstAncestor("RoduxFriends").Parent.llama);
local v2 = require(l_Parent_0.getDeepValue);
return function(v3)
    local l_keyPath_0 = v3.keyPath;
    return function(v5, v6, v7)
        local v8 = v2(v5, l_keyPath_0 .. ".byUserId");
        if not (v8[v6] ~= nil) or not v1.List.find(v8[v6], v7) then
            return false;
        else
            return true;
        end;
    end;
end;
