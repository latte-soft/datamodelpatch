local l_Parent_0 = script.Parent;
local _ = require(l_Parent_0.Types);
local v2 = require(l_Parent_0.assertEqual);
return function(v3, v4)
    v2(typeof(v3), "table", "Attempted to call Dash.findIndex with argument #1 of type {left:?} not {right:?}");
    v2(typeof(v4), "function", "Attempted to call Dash.findIndex with argument #2 of type {left:?} not {right:?}");
    for v5, v6 in ipairs(v3) do
        if v4(v6, v5) then
            return v5;
        end;
    end;
end;
