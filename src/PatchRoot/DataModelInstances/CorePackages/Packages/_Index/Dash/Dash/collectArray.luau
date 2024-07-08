local l_Parent_0 = script.Parent;
local _ = require(l_Parent_0.Types);
local v2 = require(l_Parent_0.assertEqual);
local v3 = require(l_Parent_0.iterator);
local l_insert_0 = table.insert;
return function(v5, v6)
    v2(typeof(v5), "table", "Attempted to call Dash.collectArray with argument #1 of type {left:?} not {right:?}");
    v2(typeof(v6), "function", "Attempted to call Dash.collectArray with argument #2 of type {left:?} not {right:?}");
    local v7 = {};
    for v8, v9 in v3(v5) do
        local v10 = v6(v8, v9);
        if v10 ~= nil then
            l_insert_0(v7, v10);
        end;
    end;
    return v7;
end;
