local v0 = require(script:FindFirstAncestor("RoduxPresence").getDeepValue);
return function(v1)
    local l_keyPath_0 = v1.keyPath;
    return function(v3, v4)
        return v0(v3, l_keyPath_0 .. ".byUserId")[v4];
    end;
end;
