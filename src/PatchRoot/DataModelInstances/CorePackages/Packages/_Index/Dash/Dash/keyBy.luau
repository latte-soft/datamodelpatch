local l_Parent_0 = script.Parent;
local _ = require(l_Parent_0.Types);
local v2 = require(l_Parent_0.assertEqual);
local v3 = require(l_Parent_0.collect);
local _ = table.insert;
return function(v5, v6)
    v2(typeof(v5), "table", "Attempted to call Dash.keyBy with argument #1 of type {left:?} not {right:?}");
    v2(v6 == nil, false, "Attempted to call Dash.keyBy with a nil getKey argument");
    return v3(v5, function(v7, v8)
        local _ = nil;
        return if typeof(v6) == "function" then v6(v8, v7) else v8[v6], v8;
    end);
end;
