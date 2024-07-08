local l_Parent_0 = script.Parent;
local _ = require(l_Parent_0.Types);
local v2 = require(l_Parent_0.assertEqual);
local v3 = require(l_Parent_0.iterator);
local l_insert_0 = table.insert;
return function(v5)
    v2(typeof(v5), "table", "Attempted to call Dash.values with argument #1 of type {left:?} not {right:?}");
    local v6 = {};
    for _, v8 in v3(v5) do
        l_insert_0(v6, v8);
    end;
    return v6;
end;
