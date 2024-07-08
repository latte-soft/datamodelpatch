local l_Parent_0 = script.Parent;
local _ = require(l_Parent_0.Types);
local v2 = require(l_Parent_0.assertEqual);
return function(v3, v4, v5)
    v2(typeof(v3), "table", "Attempted to call Dash.reduce with argument #1 of type {left:?} not {right:?}");
    v2(typeof(v4), "function", "Attempted to call Dash.reduce with argument #2 of type {left:?} not {right:?}");
    local l_v5_0 = v5;
    for v7 = 1, #v3 do
        l_v5_0 = v4(l_v5_0, v3[v7], v7);
    end;
    return l_v5_0;
end;
