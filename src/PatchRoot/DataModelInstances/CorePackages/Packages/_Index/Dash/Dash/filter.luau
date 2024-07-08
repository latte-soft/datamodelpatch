local l_Parent_0 = script.Parent;
local _ = require(l_Parent_0.Types);
local v2 = require(l_Parent_0.assertEqual);
local v3 = require(l_Parent_0.iterator);
return function(v4, v5)
    v2(typeof(v4), "table", "Attempted to call Dash.filter with argument #1 of type {left:?} not {right:?}");
    v2(typeof(v5), "function", "Attempted to call Dash.filter with argument #2 of type {left:?} not {right:?}");
    local v6 = {};
    for v7, v8 in v3(v4) do
        if v5(v8, v7) then
            table.insert(v6, v8);
        end;
    end;
    return v6;
end;
