local l_Parent_0 = script.Parent;
local _ = require(l_Parent_0.Types);
local v2 = require(l_Parent_0.assertEqual);
local v3 = require(l_Parent_0.collectSet);
local v4 = require(l_Parent_0.forEach);
return function(v5, v6)
    v2(typeof(v5), "table", "Attempted to call Dash.omit with argument #1 of type {left:?} not {right:?}");
    v2(typeof(v6), "table", "Attempted to call Dash.omit with argument #2 of type {left:?} not {right:?}");
    local v7 = {};
    local v8 = v3(v6);
    v4(v5, function(_, v10)
        if not v8[v10] then
            v7[v10] = v5[v10];
        end;
    end);
    return v7;
end;
