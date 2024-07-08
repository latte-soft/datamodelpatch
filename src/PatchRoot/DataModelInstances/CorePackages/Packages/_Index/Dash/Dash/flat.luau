local l_Parent_0 = script.Parent;
local _ = require(l_Parent_0.Types);
local v2 = require(l_Parent_0.append);
local v3 = require(l_Parent_0.assertEqual);
local v4 = require(l_Parent_0.forEach);
return function(v5)
    v3(typeof(v5), "table", "Attempted to call Dash.flat with argument #1 of type {left:?} not {right:?}");
    local v6 = {};
    v4(v5, function(v7)
        v2(v6, v7);
    end);
    return v6;
end;
