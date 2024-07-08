local l_Parent_0 = script.Parent;
local _ = require(l_Parent_0.Types);
local v2 = require(l_Parent_0.assertEqual);
local l_insert_0 = table.insert;
return function(v4)
    v2(typeof(v4), "table", "Attempted to call Dash.reverse with argument #1 of type {left:?} not {right:?}");
    local v5 = {};
    for v6 = #v4, 1, -1 do
        l_insert_0(v5, v4[v6]);
    end;
    return v5;
end;
