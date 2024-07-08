local l_Parent_0 = script.Parent;
local _ = require(l_Parent_0.Types);
local _ = require(l_Parent_0.Error);
local v3 = require(l_Parent_0.assertEqual);
local _ = require(l_Parent_0.format);
return function(v5, v6, v7)
    v3(typeof(v5), "table", "Attempted to call Dash.getOrSet with argument #1 of type {left:?} not {right:?}");
    v3(v6 == nil, false, "Attempted to call Dash.getOrSet with a nil key argument");
    v3(typeof(v7), "function", "Attempted to call Dash.getOrSet with argument #3 of type {left:?} not {right:?}");
    if v5[v6] == nil then
        v5[v6] = v7(v5, v6);
    end;
    return v5[v6];
end;
