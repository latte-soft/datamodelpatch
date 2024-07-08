local l_Parent_0 = script:FindFirstAncestor("UserSearch").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Dash);
local function v5(v3, v4)
    return v2.slice(v3, v4 + 1);
end;
return function(v6)
    local v7 = v6.users or {};
    local v8, v9 = v1.useState(0);
    local v10, v11 = v1.useState(v7);
    v1.useEffect(function()
        v11(v5(v7, v8));
        v9(#v7);
    end, {
        #v7
    });
    return v10;
end;
