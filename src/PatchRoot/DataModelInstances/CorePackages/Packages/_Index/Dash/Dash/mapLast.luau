local l_Parent_0 = script.Parent;
local _ = require(l_Parent_0.Types);
local v2 = require(l_Parent_0.assertEqual);
return function(v3, v4)
    v2(typeof(v3), "table", "Attempted to call Dash.mapLast with argument #1 of type {left:?} not {right:?}");
    v2(typeof(v4), "function", "Attempted to call Dash.mapLast with argument #2 of type {left:?} not {right:?}");
    for v5 = #v3, 1, -1 do
        local v6 = v4(v3[v5], v5);
        if v6 ~= nil then
            return v6;
        end;
    end;
end;
