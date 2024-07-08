local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.getDeepValue);
local _ = require(l_Parent_0.RoduxAliasesTypes);
return function(v3)
    local l_keyPath_0 = v3.keyPath;
    return function(v5, v6)
        return v1(v5, l_keyPath_0 .. ".byUserId")[v6];
    end;
end;
