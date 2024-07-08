local l_Parent_0 = script.Parent;
local _ = require(l_Parent_0.Types);
local v2 = require(l_Parent_0.assertEqual);
local v3 = require(l_Parent_0.iterator);
return function(v4, v5)
    v2(typeof(v4), "table", "Attempted to call Dash.forEach with argument #1 of type {left:?} not {right:?}");
    v2(typeof(v5), "function", "Attempted to call Dash.forEach with argument #2 of type {left:?} not {right:?}");
    for v6, v7 in v3(v4) do
        v5(v7, v6);
    end;
end;
